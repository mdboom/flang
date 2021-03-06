/*
 * Copyright (c) 1995-2018, NVIDIA CORPORATION.  All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

/**
 * \file
 * \brief Fortran IO related structs
 */

/* TODO FOR FLANG: is this needed/used, looks like HPF stuff */

struct ent {
  char *adr; /* adr of first data item */
  long cnt;  /* number of data items */
  long str;  /* stride between items */
  int typ;   /* data item type (see pghpf.h) */
  long len;  /* total length of data items (bytes) */
  long ilen; /* length of a single data item (bytes) */
};

/* vector of data item entries */

struct ents {
  struct ent *beg; /* adr of first allocated entry */
  struct ent *end; /* adr of first unallocated entry */
  struct ent *avl; /* adr of next available entry */
  struct ent *wrk; /* adr of next working entry */
};

/* cpu entry */

struct ccpu {
  int op;          /* operation */
  int cpu;         /* cpu id for send/recv, # cpus for bcst */
  struct ents *sp; /* send pointer */
  struct ents *rp; /* recv pointer */
  char *opt;       /* address of optional structure */
  int spare[3];    /* spare words */
};

#define CPU_RECV 0x1
#define CPU_SEND 0x2
#define CPU_BCST 0x4
#define CPU_COPY 0x8

/* channel */

struct chdr {
  struct chdr *next; /* next struct in list */
  struct chdr *last; /* last struct in list (valid only in first) */
  struct ccpu *cp;   /* adr of cpu entries */
  int cn;            /* number of cpu entries */
  struct ents *sp;   /* adr of entries to send */
  int sn;            /* number of entries to send */
  struct ents *rp;   /* adr of entries to receive */
  int rn;            /* number of entries of receive */
  char *bases;       /* send base address */
  char *baser;       /* recv base address */
  int typ;           /* data type */
  long flags;        /* flags (see below) */
  long ilen;         /* data item length */
  long spare[3];     /* spare words */
};
typedef struct chdr chdr;

#define CHDR_1INT 0x01 /* all data items are 1 int */
#define CHDR_1DBL 0x02 /* all data items are 1 double */
#define CHDR_BASE 0x10 /* setbase called and valid */
