Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 129C91A19D6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 04:13:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xnr66Wq6zDr5n
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 12:13:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Uf/dgohI; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xnpW6h0NzDqf3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 12:12:03 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id t28so5334042ott.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 19:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d7e2xaXz395HGRW10SGQRzP0VL8QDu6sELMUae5kEoI=;
 b=Uf/dgohIX3TsSo7crRn/do2xbDt0glAcrZH09FnypRGx3jT6P7JgPEbDY8/t3zmJvP
 V8ZW5KRjT/irqJMzB7ktQbHoji2eY4cdVDBJfELZ+vKz9vu9r9jmn3qViZ0Q+w0V0n/t
 4IHNmNIPskPRy0d+8ldfG9PYFw/7UA86OTBlxrpijcHNHb//peWbelgUv5AODIdBZgq5
 FsHaaoMHKnEwUPp8XSajEiFluWaC80DYMa4rgJHSHRWeJmcKdvC8Z+lxFCSArUFUhiJ+
 FtR9Wryc9GLdVivsxPQDi3ZGkTXKDHlMyrJpTIzW2Js3Xep9Q1ThH8HuHpsSY5/h8BhU
 7GaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d7e2xaXz395HGRW10SGQRzP0VL8QDu6sELMUae5kEoI=;
 b=QwRTK8ob3fTUseNNhzoGdLE3TOygUp6tDhgSlq5AOlaYNgBS7sS3HSJmkk5BOs+E/j
 mpByTRSRVEYc/g3NiQ1739Ulnma1n0tHb5/B3/FNx6xxZYLYWJP7+XxfV8iTCf1mb/wG
 /lniiIBRlYJ+AAtJzqshz7ppIJEZzg2uBZJ3/shn0OKxVpjGt6+xDOKKeTAp9SQpj3IB
 xX/WaypO8A+sc91srhBdQiVyGIcp/QS3Dou0kQbyMFIzmibIeOfDeg4Fgpn5DUIswXFI
 ChAyqusoelhwWUgzSzvgYR2c2NZB0dQXl4qeH0qiFFch81SPlxD1Xs9Y7AVRnHwAPSPI
 xt6w==
X-Gm-Message-State: AGi0PubfAezlJ9nW+QfyW3oFAFClzFF1EEixZ+utNULtVS8dWD49b6PI
 lmwU/rXJmhpUoa6q1PYlIv1EP3+GZptqrod4l6U=
X-Google-Smtp-Source: APiQypLnYoYN/eKMTUwM4DNWum/T1VfgSNTSvdC82eYHWmpT3bgEX+qsU/x9SYI+Axgxbn4DUbs/3cSnfeYBhUH3QG0=
X-Received: by 2002:a9d:6452:: with SMTP id m18mr4009426otl.51.1586311918495; 
 Tue, 07 Apr 2020 19:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-10-jniethe5@gmail.com>
 <5755f9dcbd875f8f2da79f7c08d3ed3c5e9ed37c.camel@linux.ibm.com>
In-Reply-To: <5755f9dcbd875f8f2da79f7c08d3ed3c5e9ed37c.camel@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 8 Apr 2020 12:11:46 +1000
Message-ID: <CACzsE9pQAf+dd-KRkDaMoq7Ue0Ja0cmBomkBN7m2y4pLA1zzyA@mail.gmail.com>
Subject: Re: [PATCH v5 09/21] powerpc: Use a datatype for instructions
To: Balamuruhan S <bala24@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 7, 2020 at 8:30 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
>
> On Mon, 2020-04-06 at 18:09 +1000, Jordan Niethe wrote:
> > Currently unsigned ints are used to represent instructions on powerpc.
> > This has worked well as instructions have always been 4 byte words.
> > However, a future ISA version will introduce some changes to
> > instructions that mean this scheme will no longer work as well. This
> > change is Prefixed Instructions. A prefixed instruction is made up of a
> > word prefix followed by a word suffix to make an 8 byte double word
> > instruction. No matter the endianess of the system the prefix always
> > comes first. Prefixed instructions are only planned for powerpc64.
> >
> > Introduce a ppc_inst type to represent both prefixed and word
> > instructions on powerpc64 while keeping it possible to exclusively have
> > word instructions on powerpc32, A latter patch will expand the type to
> > include prefixed instructions but for now just typedef it to a u32.
> >
> > Later patches will introduce helper functions and macros for
> > manipulating the instructions so that powerpc64 and powerpc32 might
> > maintain separate type definitions.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v4: New to series
> > v5: Add to epapr_paravirt.c, kgdb.c
> > ---
> >  arch/powerpc/include/asm/code-patching.h | 32 ++++-----
> >  arch/powerpc/include/asm/inst.h          | 20 +++---
> >  arch/powerpc/include/asm/sstep.h         |  5 +-
> >  arch/powerpc/include/asm/uprobes.h       |  5 +-
> >  arch/powerpc/kernel/align.c              |  4 +-
> >  arch/powerpc/kernel/epapr_paravirt.c     |  4 +-
> >  arch/powerpc/kernel/hw_breakpoint.c      |  4 +-
> >  arch/powerpc/kernel/jump_label.c         |  2 +-
> >  arch/powerpc/kernel/kgdb.c               |  4 +-
> >  arch/powerpc/kernel/kprobes.c            |  8 +--
> >  arch/powerpc/kernel/mce_power.c          |  5 +-
> >  arch/powerpc/kernel/optprobes.c          | 40 ++++++------
> >  arch/powerpc/kernel/setup_32.c           |  2 +-
> >  arch/powerpc/kernel/trace/ftrace.c       | 83 ++++++++++++------------
> >  arch/powerpc/kernel/vecemu.c             |  5 +-
> >  arch/powerpc/lib/code-patching.c         | 69 ++++++++++----------
> >  arch/powerpc/lib/feature-fixups.c        | 48 +++++++-------
> >  arch/powerpc/lib/sstep.c                 |  4 +-
> >  arch/powerpc/lib/test_emulate_step.c     |  9 +--
> >  arch/powerpc/perf/core-book3s.c          |  4 +-
> >  arch/powerpc/xmon/xmon.c                 | 24 +++----
> >  21 files changed, 196 insertions(+), 185 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/code-patching.h
> > b/arch/powerpc/include/asm/code-patching.h
> > index 48e021957ee5..eacc9102c251 100644
> > --- a/arch/powerpc/include/asm/code-patching.h
> > +++ b/arch/powerpc/include/asm/code-patching.h
> > @@ -23,33 +23,33 @@
> >  #define BRANCH_ABSOLUTE      0x2
> >
> >  bool is_offset_in_branch_range(long offset);
> > -int create_branch(unsigned int *instr, const unsigned int *addr,
> > +int create_branch(struct ppc_inst *instr, const struct ppc_inst *addr,
> >                 unsigned long target, int flags);
> > -int create_cond_branch(unsigned int *instr, const unsigned int *addr,
> > +int create_cond_branch(struct ppc_inst *instr, const struct ppc_inst *addr,
> >                      unsigned long target, int flags);
> > -int patch_branch(unsigned int *addr, unsigned long target, int flags);
> > -int patch_instruction(unsigned int *addr, unsigned int instr);
> > -int raw_patch_instruction(unsigned int *addr, unsigned int instr);
> > +int patch_branch(struct ppc_inst *addr, unsigned long target, int flags);
> > +int patch_instruction(struct ppc_inst *addr, struct ppc_inst instr);
> > +int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr);
> >
> >  static inline unsigned long patch_site_addr(s32 *site)
> >  {
> >       return (unsigned long)site + *site;
> >  }
> >
> > -static inline int patch_instruction_site(s32 *site, unsigned int instr)
> > +static inline int patch_instruction_site(s32 *site, struct ppc_inst instr)
> >  {
> > -     return patch_instruction((unsigned int *)patch_site_addr(site), instr);
> > +     return patch_instruction((struct ppc_inst *)patch_site_addr(site),
> > instr);
> >  }
> >
> >  static inline int patch_branch_site(s32 *site, unsigned long target, int
> > flags)
> >  {
> > -     return patch_branch((unsigned int *)patch_site_addr(site), target,
> > flags);
> > +     return patch_branch((struct ppc_inst *)patch_site_addr(site), target,
> > flags);
> >  }
> >
> >  static inline int modify_instruction(unsigned int *addr, unsigned int clr,
> >                                    unsigned int set)
> >  {
> > -     return patch_instruction(addr, ppc_inst((*addr & ~clr) | set));
> > +     return patch_instruction((struct ppc_inst *)addr, ppc_inst((*addr &
> > ~clr) | set));
> >  }
> >
> >  static inline int modify_instruction_site(s32 *site, unsigned int clr,
> > unsigned int set)
> > @@ -57,13 +57,13 @@ static inline int modify_instruction_site(s32 *site,
> > unsigned int clr, unsigned
> >       return modify_instruction((unsigned int *)patch_site_addr(site), clr,
> > set);
> >  }
> >
> > -int instr_is_relative_branch(unsigned int instr);
> > -int instr_is_relative_link_branch(unsigned int instr);
> > -int instr_is_branch_to_addr(const unsigned int *instr, unsigned long addr);
> > -unsigned long branch_target(const unsigned int *instr);
> > -int translate_branch(unsigned int *instr, const unsigned int *dest,
> > -                  const unsigned int *src);
> > -extern bool is_conditional_branch(unsigned int instr);
> > +int instr_is_relative_branch(struct ppc_inst instr);
> > +int instr_is_relative_link_branch(struct ppc_inst instr);
> > +int instr_is_branch_to_addr(const struct ppc_inst *instr, unsigned long
> > addr);
> > +unsigned long branch_target(const struct ppc_inst *instr);
> > +int translate_branch(struct ppc_inst *instr, const struct ppc_inst *dest,
> > +                  const struct ppc_inst *src);
> > +extern bool is_conditional_branch(struct ppc_inst instr);
> >  #ifdef CONFIG_PPC_BOOK3E_64
> >  void __patch_exception(int exc, unsigned long addr);
> >  #define patch_exception(exc, name) do { \
> > diff --git a/arch/powerpc/include/asm/inst.h
> > b/arch/powerpc/include/asm/inst.h
> > index 54ee46b0a7c9..a71decf5f871 100644
> > --- a/arch/powerpc/include/asm/inst.h
> > +++ b/arch/powerpc/include/asm/inst.h
> > @@ -6,26 +6,30 @@
> >   * Instruction data type for POWER
> >   */
> >
> > -#define ppc_inst(x) (x)
> > +struct ppc_inst {
> > +        u32 val;
> > +} __packed;
> >
> > -static inline u32 ppc_inst_val(u32 x)
> > +#define ppc_inst(x) ((struct ppc_inst){ .val = x })
> > +
> > +static inline u32 ppc_inst_val(struct ppc_inst x)
> >  {
> > -     return x;
> > +     return x.val;
> >  }
> >
> > -static inline int ppc_inst_opcode(u32 x)
> > +static inline int ppc_inst_opcode(struct ppc_inst x)
> >  {
> > -     return x >> 26;
> > +     return x.val >> 26;
> >  }
> >
> > -static inline u32 ppc_inst_swab(u32 x)
> > +static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
> >  {
> >       return ppc_inst(swab32(ppc_inst_val(x)));
> >  }
> >
> > -static inline bool ppc_inst_equal(u32 x, u32 y)
> > +static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
> >  {
> > -     return x == y;
> > +     return !memcmp(&x, &y, sizeof(struct ppc_inst));
> >  }
> >
> >  #endif /* _ASM_INST_H */
> > diff --git a/arch/powerpc/include/asm/sstep.h
> > b/arch/powerpc/include/asm/sstep.h
> > index 26d729562fe2..c3ce903ac488 100644
> > --- a/arch/powerpc/include/asm/sstep.h
> > +++ b/arch/powerpc/include/asm/sstep.h
> > @@ -2,6 +2,7 @@
> >  /*
> >   * Copyright (C) 2004 Paul Mackerras <paulus@au.ibm.com>, IBM
> >   */
> > +#include <asm/inst.h>
> >
> >  struct pt_regs;
> >
> > @@ -132,7 +133,7 @@ union vsx_reg {
> >   * otherwise.
> >   */
> >  extern int analyse_instr(struct instruction_op *op, const struct pt_regs
> > *regs,
> > -                      unsigned int instr);
> > +                      struct ppc_inst instr);
> >
> >  /*
> >   * Emulate an instruction that can be executed just by updating
> > @@ -149,7 +150,7 @@ void emulate_update_regs(struct pt_regs *reg, struct
> > instruction_op *op);
> >   * 0 if it could not be emulated, or -1 for an instruction that
> >   * should not be emulated (rfid, mtmsrd clearing MSR_RI, etc.).
> >   */
> > -extern int emulate_step(struct pt_regs *regs, unsigned int instr);
> > +extern int emulate_step(struct pt_regs *regs, struct ppc_inst instr);
> >
> >  /*
> >   * Emulate a load or store instruction by reading/writing the
> > diff --git a/arch/powerpc/include/asm/uprobes.h
> > b/arch/powerpc/include/asm/uprobes.h
> > index 2bbdf27d09b5..7e3b329ba2d3 100644
> > --- a/arch/powerpc/include/asm/uprobes.h
> > +++ b/arch/powerpc/include/asm/uprobes.h
> > @@ -11,6 +11,7 @@
> >
> >  #include <linux/notifier.h>
> >  #include <asm/probes.h>
> > +#include <asm/inst.h>
> >
> >  typedef ppc_opcode_t uprobe_opcode_t;
> >
> > @@ -23,8 +24,8 @@ typedef ppc_opcode_t uprobe_opcode_t;
> >
> >  struct arch_uprobe {
> >       union {
> > -             u32     insn;
> > -             u32     ixol;
> > +             struct ppc_inst insn;
> > +             struct ppc_inst ixol;
> >       };
> >  };
> >
> > diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> > index 46870cf6a6dc..66a6d1de7799 100644
> > --- a/arch/powerpc/kernel/align.c
> > +++ b/arch/powerpc/kernel/align.c
> > @@ -294,7 +294,7 @@ static int emulate_spe(struct pt_regs *regs, unsigned int
> > reg,
> >
> >  int fix_alignment(struct pt_regs *regs)
> >  {
> > -     unsigned int instr;
> > +     struct ppc_inst instr;
> >       struct instruction_op op;
> >       int r, type;
> >
> > @@ -304,7 +304,7 @@ int fix_alignment(struct pt_regs *regs)
> >        */
> >       CHECK_FULL_REGS(regs);
> >
> > -     if (unlikely(__get_user(instr, (unsigned int __user *)regs->nip)))
> > +     if (unlikely(__get_user(instr.val, (unsigned int __user *)regs->nip)))
>
>
> don't we have to use the helper `ppc_inst_val()` here to retrieve instr.val ?
__get_user() is loading into instr.val, so using ppc_inst_val() would not work.
>
> I see couple of other places we directly retrieve as instr.val.
> if we need to change it, then all of them should go to patch 6,
Those other places also are for the __get_user() macros I think.
> [PATCH v5 06/21] powerpc: Use an accessor for instructions
>
>
> >               return -EFAULT;
> >       if ((regs->msr & MSR_LE) != (MSR_KERNEL & MSR_LE)) {
> >               /* We don't handle PPC little-endian any more... */
> > diff --git a/arch/powerpc/kernel/epapr_paravirt.c
> > b/arch/powerpc/kernel/epapr_paravirt.c
> > index c53e863fb484..c42aa3926632 100644
> > --- a/arch/powerpc/kernel/epapr_paravirt.c
> > +++ b/arch/powerpc/kernel/epapr_paravirt.c
> > @@ -38,9 +38,9 @@ static int __init early_init_dt_scan_epapr(unsigned long
> > node,
> >
> >       for (i = 0; i < (len / 4); i++) {
> >               u32 inst = be32_to_cpu(insts[i]);
> > -             patch_instruction(epapr_hypercall_start + i, ppc_inst(inst));
> > +             patch_instruction((struct ppc_inst *)(epapr_hypercall_start +
> > i), ppc_inst(inst));
> >  #if !defined(CONFIG_64BIT) || defined(CONFIG_PPC_BOOK3E_64)
> > -             patch_instruction(epapr_ev_idle_start + i, ppc_inst(inst));
> > +             patch_instruction((struct ppc_inst *)(epapr_ev_idle_start + i),
> > ppc_inst(inst));
> >  #endif
> >       }
> >
> > diff --git a/arch/powerpc/kernel/hw_breakpoint.c
> > b/arch/powerpc/kernel/hw_breakpoint.c
> > index 79f51f182a83..542f65ccf68b 100644
> > --- a/arch/powerpc/kernel/hw_breakpoint.c
> > +++ b/arch/powerpc/kernel/hw_breakpoint.c
> > @@ -244,12 +244,12 @@ dar_range_overlaps(unsigned long dar, int size, struct
> > arch_hw_breakpoint *info)
> >  static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
> >                            struct arch_hw_breakpoint *info)
> >  {
> > -     unsigned int instr = ppc_inst(0);
> > +     struct ppc_inst instr = ppc_inst(0);
> >       int ret, type, size;
> >       struct instruction_op op;
> >       unsigned long addr = info->address;
> >
> > -     if (__get_user_inatomic(instr, (unsigned int *)regs->nip))
> > +     if (__get_user_inatomic(instr.val, (unsigned int *)regs->nip))
>
>
> [...] reference to above
>
>
> >               goto fail;
> >
> >       ret = analyse_instr(&op, regs, instr);
> > diff --git a/arch/powerpc/kernel/jump_label.c
> > b/arch/powerpc/kernel/jump_label.c
> > index daa4afce7ec8..144858027fa3 100644
> > --- a/arch/powerpc/kernel/jump_label.c
> > +++ b/arch/powerpc/kernel/jump_label.c
> > @@ -11,7 +11,7 @@
> >  void arch_jump_label_transform(struct jump_entry *entry,
> >                              enum jump_label_type type)
> >  {
> > -     u32 *addr = (u32 *)(unsigned long)entry->code;
> > +     struct ppc_inst *addr = (struct ppc_inst *)(unsigned long)entry->code;
> >
> >       if (type == JUMP_LABEL_JMP)
> >               patch_branch(addr, entry->target, 0);
> > diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
> > index a6b38a19133f..652b2852bea3 100644
> > --- a/arch/powerpc/kernel/kgdb.c
> > +++ b/arch/powerpc/kernel/kgdb.c
> > @@ -419,7 +419,7 @@ int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
> >  {
> >       int err;
> >       unsigned int instr;
> > -     unsigned int *addr = (unsigned int *)bpt->bpt_addr;
> > +     struct ppc_inst *addr = (struct ppc_inst *)bpt->bpt_addr;
> >
> >       err = probe_kernel_address(addr, instr);
> >       if (err)
> > @@ -438,7 +438,7 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
> >  {
> >       int err;
> >       unsigned int instr = *(unsigned int *)bpt->saved_instr;
> > -     unsigned int *addr = (unsigned int *)bpt->bpt_addr;
> > +     struct ppc_inst *addr = (struct ppc_inst *)bpt->bpt_addr;
> >
> >       err = patch_instruction(addr, ppc_inst(instr));
> >       if (err)
> > diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> > index 8420b1944164..9ed996cb0589 100644
> > --- a/arch/powerpc/kernel/kprobes.c
> > +++ b/arch/powerpc/kernel/kprobes.c
> > @@ -106,7 +106,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name,
> > unsigned int offset)
> >  int arch_prepare_kprobe(struct kprobe *p)
> >  {
> >       int ret = 0;
> > -     kprobe_opcode_t insn = *p->addr;
> > +     struct ppc_inst insn = *(struct ppc_inst *)p->addr;
> >
> >       if ((unsigned long)p->addr & 0x03) {
> >               printk("Attempt to register kprobe at an unaligned address\n");
> > @@ -139,13 +139,13 @@ NOKPROBE_SYMBOL(arch_prepare_kprobe);
> >
> >  void arch_arm_kprobe(struct kprobe *p)
> >  {
> > -     patch_instruction(p->addr, ppc_inst(BREAKPOINT_INSTRUCTION));
> > +     patch_instruction((struct ppc_inst *)p->addr,
> > ppc_inst(BREAKPOINT_INSTRUCTION));
> >  }
> >  NOKPROBE_SYMBOL(arch_arm_kprobe);
> >
> >  void arch_disarm_kprobe(struct kprobe *p)
> >  {
> > -     patch_instruction(p->addr, ppc_inst(p->opcode));
> > +     patch_instruction((struct ppc_inst *)p->addr, ppc_inst(p->opcode));
> >  }
> >  NOKPROBE_SYMBOL(arch_disarm_kprobe);
> >
> > @@ -217,7 +217,7 @@ NOKPROBE_SYMBOL(arch_prepare_kretprobe);
> >  static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
> >  {
> >       int ret;
> > -     unsigned int insn = *p->ainsn.insn;
> > +     struct ppc_inst insn = *(struct ppc_inst *)p->ainsn.insn;
> >
> >       /* regs->nip is also adjusted if emulate_step returns 1 */
> >       ret = emulate_step(regs, insn);
> > diff --git a/arch/powerpc/kernel/mce_power.c
> > b/arch/powerpc/kernel/mce_power.c
> > index 1cbf7f1a4e3d..7118b46a6543 100644
> > --- a/arch/powerpc/kernel/mce_power.c
> > +++ b/arch/powerpc/kernel/mce_power.c
> > @@ -20,6 +20,7 @@
> >  #include <asm/sstep.h>
> >  #include <asm/exception-64s.h>
> >  #include <asm/extable.h>
> > +#include <asm/inst.h>
> >
> >  /*
> >   * Convert an address related to an mm to a PFN. NOTE: we are in real
> > @@ -365,7 +366,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs
> > *regs, uint64_t *addr,
> >        * in real-mode is tricky and can lead to recursive
> >        * faults
> >        */
> > -     int instr;
> > +     struct ppc_inst instr;
> >       unsigned long pfn, instr_addr;
> >       struct instruction_op op;
> >       struct pt_regs tmp = *regs;
> > @@ -373,7 +374,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs
> > *regs, uint64_t *addr,
> >       pfn = addr_to_pfn(regs, regs->nip);
> >       if (pfn != ULONG_MAX) {
> >               instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
> > -             instr = *(unsigned int *)(instr_addr);
> > +             instr = *(struct ppc_inst *)(instr_addr);
> >               if (!analyse_instr(&op, &tmp, instr)) {
> >                       pfn = addr_to_pfn(regs, op.ea);
> >                       *addr = op.ea;
> > diff --git a/arch/powerpc/kernel/optprobes.c
> > b/arch/powerpc/kernel/optprobes.c
> > index 3b33ebf18859..b61bbcee84f4 100644
> > --- a/arch/powerpc/kernel/optprobes.c
> > +++ b/arch/powerpc/kernel/optprobes.c
> > @@ -100,8 +100,8 @@ static unsigned long can_optimize(struct kprobe *p)
> >        * Ensure that the instruction is not a conditional branch,
> >        * and that can be emulated.
> >        */
> > -     if (!is_conditional_branch(*p->ainsn.insn) &&
> > -                     analyse_instr(&op, &regs, *p->ainsn.insn) == 1) {
> > +     if (!is_conditional_branch(*(struct ppc_inst *)p->ainsn.insn) &&
> > +                     analyse_instr(&op, &regs, *(struct ppc_inst *)p-
> > >ainsn.insn) == 1) {
> >               emulate_update_regs(&regs, &op);
> >               nip = regs.nip;
> >       }
> > @@ -148,12 +148,12 @@ void arch_remove_optimized_kprobe(struct
> > optimized_kprobe *op)
> >  void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
> >  {
> >       /* addis r4,0,(insn)@h */
> > -     patch_instruction(addr, ppc_inst(PPC_INST_ADDIS | ___PPC_RT(4) |
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ADDIS |
> > ___PPC_RT(4) |
> >                         ((val >> 16) & 0xffff)));
> >       addr++;
> >
> >       /* ori r4,r4,(insn)@l */
> > -     patch_instruction(addr, ppc_inst(PPC_INST_ORI | ___PPC_RA(4) |
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > ___PPC_RA(4) |
> >                         ___PPC_RS(4) | (val & 0xffff)));
> >  }
> >
> > @@ -164,34 +164,34 @@ void patch_imm32_load_insns(unsigned int val,
> > kprobe_opcode_t *addr)
> >  void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
> >  {
> >       /* lis r3,(op)@highest */
> > -     patch_instruction(addr, ppc_inst(PPC_INST_ADDIS | ___PPC_RT(3) |
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ADDIS |
> > ___PPC_RT(3) |
> >                         ((val >> 48) & 0xffff)));
> >       addr++;
> >
> >       /* ori r3,r3,(op)@higher */
> > -     patch_instruction(addr, ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > ___PPC_RA(3) |
> >                         ___PPC_RS(3) | ((val >> 32) & 0xffff)));
> >       addr++;
> >
> >       /* rldicr r3,r3,32,31 */
> > -     patch_instruction(addr, ppc_inst(PPC_INST_RLDICR | ___PPC_RA(3) |
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_RLDICR |
> > ___PPC_RA(3) |
> >                         ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31)));
> >       addr++;
> >
> >       /* oris r3,r3,(op)@h */
> > -     patch_instruction(addr, ppc_inst(PPC_INST_ORIS | ___PPC_RA(3) |
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORIS |
> > ___PPC_RA(3) |
> >                         ___PPC_RS(3) | ((val >> 16) & 0xffff)));
> >       addr++;
> >
> >       /* ori r3,r3,(op)@l */
> > -     patch_instruction(addr, ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > ___PPC_RA(3) |
> >                         ___PPC_RS(3) | (val & 0xffff)));
> >  }
> >
> >  int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe
> > *p)
> >  {
> > -     kprobe_opcode_t *buff, branch_op_callback, branch_emulate_step;
> > -     kprobe_opcode_t *op_callback_addr, *emulate_step_addr;
> > +     struct ppc_inst branch_op_callback, branch_emulate_step;
> > +     kprobe_opcode_t *op_callback_addr, *emulate_step_addr, *buff;
> >       long b_offset;
> >       unsigned long nip, size;
> >       int rc, i;
> > @@ -231,7 +231,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe
> > *op, struct kprobe *p)
> >       size = (TMPL_END_IDX * sizeof(kprobe_opcode_t)) / sizeof(int);
> >       pr_devel("Copying template to %p, size %lu\n", buff, size);
> >       for (i = 0; i < size; i++) {
> > -             rc = patch_instruction(buff + i,
> > ppc_inst(*(optprobe_template_entry + i)));
> > +             rc = patch_instruction((struct ppc_inst *)(buff + i),
> > ppc_inst(*(optprobe_template_entry + i)));
> >               if (rc < 0)
> >                       goto error;
> >       }
> > @@ -253,20 +253,20 @@ int arch_prepare_optimized_kprobe(struct
> > optimized_kprobe *op, struct kprobe *p)
> >       }
> >
> >       rc = create_branch(&branch_op_callback,
> > -                        (unsigned int *)buff + TMPL_CALL_HDLR_IDX,
> > +                        (struct ppc_inst *)(buff + TMPL_CALL_HDLR_IDX),
> >                          (unsigned long)op_callback_addr,
> >                          BRANCH_SET_LINK);
> >
> >       rc |= create_branch(&branch_emulate_step,
> > -                         (unsigned int *)buff + TMPL_EMULATE_IDX,
> > +                         (struct ppc_inst *)(buff + TMPL_EMULATE_IDX),
> >                           (unsigned long)emulate_step_addr,
> >                           BRANCH_SET_LINK);
> >
> >       if (rc)
> >               goto error;
> >
> > -     patch_instruction(buff + TMPL_CALL_HDLR_IDX, branch_op_callback);
> > -     patch_instruction(buff + TMPL_EMULATE_IDX, branch_emulate_step);
> > +     patch_instruction((struct ppc_inst *)(buff + TMPL_CALL_HDLR_IDX),
> > branch_op_callback);
> > +     patch_instruction((struct ppc_inst *)(buff + TMPL_EMULATE_IDX),
> > branch_emulate_step);
> >
> >       /*
> >        * 3. load instruction to be emulated into relevant register, and
> > @@ -276,7 +276,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe
> > *op, struct kprobe *p)
> >       /*
> >        * 4. branch back from trampoline
> >        */
> > -     patch_branch(buff + TMPL_RET_IDX, (unsigned long)nip, 0);
> > +     patch_branch((void *)(buff + TMPL_RET_IDX), (unsigned long)nip, 0);
>
>
> why do we cast it differently here ?
That is a mistake.
>
>
> >
> >       flush_icache_range((unsigned long)buff,
> >                          (unsigned long)(&buff[TMPL_END_IDX]));
> > @@ -308,7 +308,7 @@ int arch_check_optimized_kprobe(struct optimized_kprobe
> > *op)
> >
> >  void arch_optimize_kprobes(struct list_head *oplist)
> >  {
> > -     unsigned int instr;
> > +     struct ppc_inst instr;
> >       struct optimized_kprobe *op;
> >       struct optimized_kprobe *tmp;
> >
> > @@ -320,9 +320,9 @@ void arch_optimize_kprobes(struct list_head *oplist)
> >               memcpy(op->optinsn.copied_insn, op->kp.addr,
> >                                              RELATIVEJUMP_SIZE);
> >               create_branch(&instr,
> > -                           (unsigned int *)op->kp.addr,
> > +                           (struct ppc_inst *)op->kp.addr,
> >                             (unsigned long)op->optinsn.insn, 0);
> > -             patch_instruction(op->kp.addr, instr);
> > +             patch_instruction((struct ppc_inst *)op->kp.addr, instr);
> >               list_del_init(&op->list);
> >       }
> >  }
> > diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
> > index c1bdd462c5c0..989809e58234 100644
> > --- a/arch/powerpc/kernel/setup_32.c
> > +++ b/arch/powerpc/kernel/setup_32.c
> > @@ -76,7 +76,7 @@ EXPORT_SYMBOL(DMA_MODE_WRITE);
> >  notrace void __init machine_init(u64 dt_ptr)
> >  {
> >       unsigned int *addr = (unsigned int
> > *)patch_site_addr(&patch__memset_nocache);
> > -     unsigned long insn;
> > +     struct ppc_inst insn;
> >
> >       /* Configure static keys first, now that we're relocated. */
> >       setup_feature_keys();
> > diff --git a/arch/powerpc/kernel/trace/ftrace.c
> > b/arch/powerpc/kernel/trace/ftrace.c
> > index 784b5746cc55..442c62fb68ff 100644
> > --- a/arch/powerpc/kernel/trace/ftrace.c
> > +++ b/arch/powerpc/kernel/trace/ftrace.c
> > @@ -41,23 +41,23 @@
> >  #define      NUM_FTRACE_TRAMPS       8
> >  static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
> >
> > -static unsigned int
> > +static struct ppc_inst
> >  ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
> >  {
> > -     unsigned int op;
> > +     struct ppc_inst op;
> >
> >       addr = ppc_function_entry((void *)addr);
> >
> >       /* if (link) set op to 'bl' else 'b' */
> > -     create_branch(&op, (unsigned int *)ip, addr, link ? 1 : 0);
> > +     create_branch(&op, (struct ppc_inst *)ip, addr, link ? 1 : 0);
> >
> >       return op;
> >  }
> >
> >  static int
> > -ftrace_modify_code(unsigned long ip, unsigned int old, unsigned int new)
> > +ftrace_modify_code(unsigned long ip, struct ppc_inst old, struct ppc_inst
> > new)
> >  {
> > -     unsigned int replaced;
> > +     struct ppc_inst replaced;
> >
> >       /*
> >        * Note:
> > @@ -79,7 +79,7 @@ ftrace_modify_code(unsigned long ip, unsigned int old,
> > unsigned int new)
> >       }
> >
> >       /* replace the text with the new text */
> > -     if (patch_instruction((unsigned int *)ip, new))
> > +     if (patch_instruction((struct ppc_inst *)ip, new))
> >               return -EPERM;
> >
> >       return 0;
> > @@ -90,24 +90,24 @@ ftrace_modify_code(unsigned long ip, unsigned int old,
> > unsigned int new)
> >   */
> >  static int test_24bit_addr(unsigned long ip, unsigned long addr)
> >  {
> > -     unsigned int op;
> > +     struct ppc_inst op;
> >       addr = ppc_function_entry((void *)addr);
> >
> >       /* use the create_branch to verify that this offset can be branched */
> > -     return create_branch(&op, (unsigned int *)ip, addr, 0) == 0;
> > +     return create_branch(&op, (struct ppc_inst *)ip, addr, 0) == 0;
> >  }
> >
> > -static int is_bl_op(unsigned int op)
> > +static int is_bl_op(struct ppc_inst op)
> >  {
> >       return (ppc_inst_val(op) & 0xfc000003) == 0x48000001;
> >  }
> >
> > -static int is_b_op(unsigned int op)
> > +static int is_b_op(struct ppc_inst op)
> >  {
> >       return (ppc_inst_val(op) & 0xfc000003) == 0x48000000;
> >  }
> >
> > -static unsigned long find_bl_target(unsigned long ip, unsigned int op)
> > +static unsigned long find_bl_target(unsigned long ip, struct ppc_inst op)
> >  {
> >       int offset;
> >
> > @@ -127,7 +127,7 @@ __ftrace_make_nop(struct module *mod,
> >  {
> >       unsigned long entry, ptr, tramp;
> >       unsigned long ip = rec->ip;
> > -     unsigned int op, pop;
> > +     struct ppc_inst op, pop;
> >
> >       /* read where this goes */
> >       if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
> > @@ -207,7 +207,7 @@ __ftrace_make_nop(struct module *mod,
> >       }
> >  #endif /* CONFIG_MPROFILE_KERNEL */
> >
> > -     if (patch_instruction((unsigned int *)ip, pop)) {
> > +     if (patch_instruction((struct ppc_inst *)ip, pop)) {
> >               pr_err("Patching NOP failed.\n");
> >               return -EPERM;
> >       }
> > @@ -220,7 +220,7 @@ static int
> >  __ftrace_make_nop(struct module *mod,
> >                 struct dyn_ftrace *rec, unsigned long addr)
> >  {
> > -     unsigned int op;
> > +     struct ppc_inst op;
> >       unsigned int jmp[4];
> >       unsigned long ip = rec->ip;
> >       unsigned long tramp;
> > @@ -279,7 +279,7 @@ __ftrace_make_nop(struct module *mod,
> >
> >       op = ppc_inst(PPC_INST_NOP);
> >
> > -     if (patch_instruction((unsigned int *)ip, op))
> > +     if (patch_instruction((struct ppc_inst *)ip, op))
> >               return -EPERM;
> >
> >       return 0;
> > @@ -290,7 +290,7 @@ __ftrace_make_nop(struct module *mod,
> >  static unsigned long find_ftrace_tramp(unsigned long ip)
> >  {
> >       int i;
> > -     unsigned int instr;
> > +     struct ppc_inst instr;
> >
> >       /*
> >        * We have the compiler generated long_branch tramps at the end
> > @@ -327,9 +327,10 @@ static int add_ftrace_tramp(unsigned long tramp)
> >   */
> >  static int setup_mcount_compiler_tramp(unsigned long tramp)
> >  {
> > -     int i, op;
> > +     int i;
> > +     struct ppc_inst op;
> >       unsigned long ptr;
> > -     unsigned int instr;
> > +     struct ppc_inst instr;
> >       static unsigned long ftrace_plt_tramps[NUM_FTRACE_TRAMPS];
> >
> >       /* Is this a known long jump tramp? */
> > @@ -378,7 +379,7 @@ static int setup_mcount_compiler_tramp(unsigned long
> > tramp)
> >               return -1;
> >       }
> >
> > -     if (patch_branch((unsigned int *)tramp, ptr, 0)) {
> > +     if (patch_branch((struct ppc_inst *)tramp, ptr, 0)) {
> >               pr_debug("REL24 out of range!\n");
> >               return -1;
> >       }
> > @@ -394,7 +395,7 @@ static int setup_mcount_compiler_tramp(unsigned long
> > tramp)
> >  static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long
> > addr)
> >  {
> >       unsigned long tramp, ip = rec->ip;
> > -     unsigned int op;
> > +     struct ppc_inst op;
> >
> >       /* Read where this goes */
> >       if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
> > @@ -422,7 +423,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace
> > *rec, unsigned long addr)
> >               }
> >       }
> >
> > -     if (patch_instruction((unsigned int *)ip, ppc_inst(PPC_INST_NOP))) {
> > +     if (patch_instruction((struct ppc_inst *)ip, ppc_inst(PPC_INST_NOP))) {
> >               pr_err("Patching NOP failed.\n");
> >               return -EPERM;
> >       }
> > @@ -434,7 +435,7 @@ int ftrace_make_nop(struct module *mod,
> >                   struct dyn_ftrace *rec, unsigned long addr)
> >  {
> >       unsigned long ip = rec->ip;
> > -     unsigned int old, new;
> > +     struct ppc_inst old, new;
> >
> >       /*
> >        * If the calling address is more that 24 bits away,
> > @@ -487,7 +488,7 @@ int ftrace_make_nop(struct module *mod,
> >   */
> >  #ifndef CONFIG_MPROFILE_KERNEL
> >  static int
> > -expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
> > +expected_nop_sequence(void *ip, struct ppc_inst op0, struct ppc_inst op1)
> >  {
> >       /*
> >        * We expect to see:
> > @@ -504,7 +505,7 @@ expected_nop_sequence(void *ip, unsigned int op0,
> > unsigned int op1)
> >  }
> >  #else
> >  static int
> > -expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
> > +expected_nop_sequence(void *ip, struct ppc_inst op0, struct ppc_inst op1)
> >  {
> >       /* look for patched "NOP" on ppc64 with -mprofile-kernel */
> >       if (!ppc_inst_equal(op0, ppc_inst(PPC_INST_NOP)))
> > @@ -516,8 +517,8 @@ expected_nop_sequence(void *ip, unsigned int op0,
> > unsigned int op1)
> >  static int
> >  __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
> >  {
> > -     unsigned int op[2];
> > -     unsigned int instr;
> > +     struct ppc_inst op[2];
> > +     struct ppc_inst instr;
> >       void *ip = (void *)rec->ip;
> >       unsigned long entry, ptr, tramp;
> >       struct module *mod = rec->arch.mod;
> > @@ -528,7 +529,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long
> > addr)
> >
> >       if (!expected_nop_sequence(ip, op[0], op[1])) {
> >               pr_err("Unexpected call sequence at %p: %x %x\n",
> > -             ip, op[0], op[1]);
> > +             ip, ppc_inst_val(op[0]), ppc_inst_val(op[1]));
>
>
> shouldn't this change be part of patch 6,
>
> [PATCH v5 06/21] powerpc: Use an accessor for instructions
Yes it should be.
>
>
> >               return -EINVAL;
> >       }
> >
> > @@ -582,7 +583,7 @@ static int
> >  __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
> >  {
> >       int err;
> > -     unsigned int op;
> > +     struct ppc_inst op;
> >       unsigned long ip = rec->ip;
> >
> >       /* read where this goes */
> > @@ -602,7 +603,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long
> > addr)
> >       }
> >
> >       /* create the branch to the trampoline */
> > -     err = create_branch(&op, (unsigned int *)ip,
> > +     err = create_branch(&op, (struct ppc_inst *)ip,
> >                           rec->arch.mod->arch.tramp, BRANCH_SET_LINK);
> >       if (!err) {
> >               pr_err("REL24 out of range!\n");
> > @@ -621,7 +622,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long
> > addr)
> >
> >  static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long
> > addr)
> >  {
> > -     unsigned int op;
> > +     struct ppc_inst op;
> >       void *ip = (void *)rec->ip;
> >       unsigned long tramp, entry, ptr;
> >
> > @@ -669,7 +670,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace
> > *rec, unsigned long addr)
> >  int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
> >  {
> >       unsigned long ip = rec->ip;
> > -     unsigned int old, new;
> > +     struct ppc_inst old, new;
> >
> >       /*
> >        * If the calling address is more that 24 bits away,
> > @@ -708,7 +709,7 @@ static int
> >  __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
> >                                       unsigned long addr)
> >  {
> > -     unsigned int op;
> > +     struct ppc_inst op;
> >       unsigned long ip = rec->ip;
> >       unsigned long entry, ptr, tramp;
> >       struct module *mod = rec->arch.mod;
> > @@ -756,7 +757,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned
> > long old_addr,
> >       /* The new target may be within range */
> >       if (test_24bit_addr(ip, addr)) {
> >               /* within range */
> > -             if (patch_branch((unsigned int *)ip, addr, BRANCH_SET_LINK)) {
> > +             if (patch_branch((struct ppc_inst *)ip, addr, BRANCH_SET_LINK))
> > {
> >                       pr_err("REL24 out of range!\n");
> >                       return -EINVAL;
> >               }
> > @@ -784,12 +785,12 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned
> > long old_addr,
> >       }
> >
> >       /* Ensure branch is within 24 bits */
> > -     if (create_branch(&op, (unsigned int *)ip, tramp, BRANCH_SET_LINK)) {
> > +     if (create_branch(&op, (struct ppc_inst *)ip, tramp, BRANCH_SET_LINK))
> > {
> >               pr_err("Branch out of range\n");
> >               return -EINVAL;
> >       }
> >
> > -     if (patch_branch((unsigned int *)ip, tramp, BRANCH_SET_LINK)) {
> > +     if (patch_branch((struct ppc_inst *)ip, tramp, BRANCH_SET_LINK)) {
> >               pr_err("REL24 out of range!\n");
> >               return -EINVAL;
> >       }
> > @@ -802,7 +803,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned
> > long old_addr,
> >                       unsigned long addr)
> >  {
> >       unsigned long ip = rec->ip;
> > -     unsigned int old, new;
> > +     struct ppc_inst old, new;
> >
> >       /*
> >        * If the calling address is more that 24 bits away,
> > @@ -842,10 +843,10 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned
> > long old_addr,
> >  int ftrace_update_ftrace_func(ftrace_func_t func)
> >  {
> >       unsigned long ip = (unsigned long)(&ftrace_call);
> > -     unsigned int old, new;
> > +     struct ppc_inst old, new;
> >       int ret;
> >
> > -     old = *(unsigned int *)&ftrace_call;
> > +     old = *(struct ppc_inst *)&ftrace_call;
> >       new = ftrace_call_replace(ip, (unsigned long)func, 1);
> >       ret = ftrace_modify_code(ip, old, new);
> >
> > @@ -853,7 +854,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
> >       /* Also update the regs callback function */
> >       if (!ret) {
> >               ip = (unsigned long)(&ftrace_regs_call);
> > -             old = *(unsigned int *)&ftrace_regs_call;
> > +             old = *(struct ppc_inst *)&ftrace_regs_call;
> >               new = ftrace_call_replace(ip, (unsigned long)func, 1);
> >               ret = ftrace_modify_code(ip, old, new);
> >       }
> > @@ -927,7 +928,7 @@ int ftrace_enable_ftrace_graph_caller(void)
> >       unsigned long ip = (unsigned long)(&ftrace_graph_call);
> >       unsigned long addr = (unsigned long)(&ftrace_graph_caller);
> >       unsigned long stub = (unsigned long)(&ftrace_graph_stub);
> > -     unsigned int old, new;
> > +     struct ppc_inst old, new;
> >
> >       old = ftrace_call_replace(ip, stub, 0);
> >       new = ftrace_call_replace(ip, addr, 0);
> > @@ -940,7 +941,7 @@ int ftrace_disable_ftrace_graph_caller(void)
> >       unsigned long ip = (unsigned long)(&ftrace_graph_call);
> >       unsigned long addr = (unsigned long)(&ftrace_graph_caller);
> >       unsigned long stub = (unsigned long)(&ftrace_graph_stub);
> > -     unsigned int old, new;
> > +     struct ppc_inst old, new;
> >
> >       old = ftrace_call_replace(ip, addr, 0);
> >       new = ftrace_call_replace(ip, stub, 0);
> > diff --git a/arch/powerpc/kernel/vecemu.c b/arch/powerpc/kernel/vecemu.c
> > index c8d21e812d8c..bbf536e10902 100644
> > --- a/arch/powerpc/kernel/vecemu.c
> > +++ b/arch/powerpc/kernel/vecemu.c
> > @@ -261,11 +261,12 @@ static unsigned int rfin(unsigned int x)
> >
> >  int emulate_altivec(struct pt_regs *regs)
> >  {
> > -     unsigned int instr, i, word;
> > +     struct ppc_inst instr;
> > +     unsigned int i, word;
> >       unsigned int va, vb, vc, vd;
> >       vector128 *vrs;
> >
> > -     if (get_user(instr, (unsigned int __user *) regs->nip))
> > +     if (get_user(instr.val, (unsigned int __user *) regs->nip))
>
>
> [...] reference to above for using helper.
>
>
> >               return -EFAULT;
> >
> >       word = ppc_inst_val(instr);
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-
> > patching.c
> > index 33654c6334a9..91be4a0b51cb 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -19,12 +19,12 @@
> >  #include <asm/setup.h>
> >  #include <asm/inst.h>
> >
> > -static int __patch_instruction(unsigned int *exec_addr, unsigned int instr,
> > -                            unsigned int *patch_addr)
> > +static int __patch_instruction(struct ppc_inst *exec_addr, struct ppc_inst
> > instr,
> > +                            struct ppc_inst *patch_addr)
> >  {
> >       int err = 0;
> >
> > -     __put_user_asm(instr, patch_addr, err, "stw");
> > +     __put_user_asm(ppc_inst_val(instr), patch_addr, err, "stw");
> >       if (err)
> >               return err;
> >
> > @@ -34,7 +34,7 @@ static int __patch_instruction(unsigned int *exec_addr,
> > unsigned int instr,
> >       return 0;
> >  }
> >
> > -int raw_patch_instruction(unsigned int *addr, unsigned int instr)
> > +int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
> >  {
> >       return __patch_instruction(addr, instr, addr);
> >  }
> > @@ -137,10 +137,10 @@ static inline int unmap_patch_area(unsigned long addr)
> >       return 0;
> >  }
> >
> > -static int do_patch_instruction(unsigned int *addr, unsigned int instr)
> > +static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst
> > instr)
> >  {
> >       int err;
> > -     unsigned int *patch_addr = NULL;
> > +     struct ppc_inst *patch_addr = NULL;
> >       unsigned long flags;
> >       unsigned long text_poke_addr;
> >       unsigned long kaddr = (unsigned long)addr;
> > @@ -177,14 +177,14 @@ static int do_patch_instruction(unsigned int *addr,
> > unsigned int instr)
> >  }
> >  #else /* !CONFIG_STRICT_KERNEL_RWX */
> >
> > -static int do_patch_instruction(unsigned int *addr, unsigned int instr)
> > +static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst
> > instr)
> >  {
> >       return raw_patch_instruction(addr, instr);
> >  }
> >
> >  #endif /* CONFIG_STRICT_KERNEL_RWX */
> >
> > -int patch_instruction(unsigned int *addr, unsigned int instr)
> > +int patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
> >  {
> >       /* Make sure we aren't patching a freed init section */
> >       if (init_mem_is_free && init_section_contains(addr, 4)) {
> > @@ -195,9 +195,9 @@ int patch_instruction(unsigned int *addr, unsigned int
> > instr)
> >  }
> >  NOKPROBE_SYMBOL(patch_instruction);
> >
> > -int patch_branch(unsigned int *addr, unsigned long target, int flags)
> > +int patch_branch(struct ppc_inst *addr, unsigned long target, int flags)
> >  {
> > -     unsigned int instr;
> > +     struct ppc_inst instr;
> >
> >       create_branch(&instr, addr, target, flags);
> >       return patch_instruction(addr, instr);
> > @@ -229,7 +229,7 @@ bool is_offset_in_branch_range(long offset)
> >   * Helper to check if a given instruction is a conditional branch
> >   * Derived from the conditional checks in analyse_instr()
> >   */
> > -bool is_conditional_branch(unsigned int instr)
> > +bool is_conditional_branch(struct ppc_inst instr)
> >  {
> >       unsigned int opcode = ppc_inst_opcode(instr);
> >
> > @@ -247,13 +247,13 @@ bool is_conditional_branch(unsigned int instr)
> >  }
> >  NOKPROBE_SYMBOL(is_conditional_branch);
> >
> > -int create_branch(unsigned int *instr,
> > -               const unsigned int *addr,
> > +int create_branch(struct ppc_inst *instr,
> > +               const struct ppc_inst *addr,
> >                 unsigned long target, int flags)
> >  {
> >       long offset;
> >
> > -     *instr = 0;
> > +     *instr = ppc_inst(0);
> >       offset = target;
> >       if (! (flags & BRANCH_ABSOLUTE))
> >               offset = offset - (unsigned long)addr;
> > @@ -263,12 +263,12 @@ int create_branch(unsigned int *instr,
> >               return 1;
> >
> >       /* Mask out the flags and target, so they don't step on each other. */
> > -     *instr = 0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC);
> > +     *instr = ppc_inst(0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC));
> >
> >       return 0;
> >  }
> >
> > -int create_cond_branch(unsigned int *instr, const unsigned int *addr,
> > +int create_cond_branch(struct ppc_inst *instr, const struct ppc_inst *addr,
> >                      unsigned long target, int flags)
> >  {
> >       long offset;
> > @@ -282,27 +282,27 @@ int create_cond_branch(unsigned int *instr, const
> > unsigned int *addr,
> >               return 1;
> >
> >       /* Mask out the flags and target, so they don't step on each other. */
> > -     *instr = 0x40000000 | (flags & 0x3FF0003) | (offset & 0xFFFC);
> > +     *instr = ppc_inst(0x40000000 | (flags & 0x3FF0003) | (offset &
> > 0xFFFC));
> >
> >       return 0;
> >  }
> >
> > -static unsigned int branch_opcode(unsigned int instr)
> > +static unsigned int branch_opcode(struct ppc_inst instr)
> >  {
> >       return ppc_inst_opcode(instr) & 0x3F;
> >  }
> >
> > -static int instr_is_branch_iform(unsigned int instr)
> > +static int instr_is_branch_iform(struct ppc_inst instr)
> >  {
> >       return branch_opcode(instr) == 18;
> >  }
> >
> > -static int instr_is_branch_bform(unsigned int instr)
> > +static int instr_is_branch_bform(struct ppc_inst instr)
> >  {
> >       return branch_opcode(instr) == 16;
> >  }
> >
> > -int instr_is_relative_branch(unsigned int instr)
> > +int instr_is_relative_branch(struct ppc_inst instr)
> >  {
> >       if (ppc_inst_val(instr) & BRANCH_ABSOLUTE)
> >               return 0;
> > @@ -310,12 +310,12 @@ int instr_is_relative_branch(unsigned int instr)
> >       return instr_is_branch_iform(instr) || instr_is_branch_bform(instr);
> >  }
> >
> > -int instr_is_relative_link_branch(unsigned int instr)
> > +int instr_is_relative_link_branch(struct ppc_inst instr)
> >  {
> >       return instr_is_relative_branch(instr) && (ppc_inst_val(instr) &
> > BRANCH_SET_LINK);
> >  }
> >
> > -static unsigned long branch_iform_target(const unsigned int *instr)
> > +static unsigned long branch_iform_target(const struct ppc_inst *instr)
> >  {
> >       signed long imm;
> >
> > @@ -331,7 +331,7 @@ static unsigned long branch_iform_target(const unsigned
> > int *instr)
> >       return (unsigned long)imm;
> >  }
> >
> > -static unsigned long branch_bform_target(const unsigned int *instr)
> > +static unsigned long branch_bform_target(const struct ppc_inst *instr)
> >  {
> >       signed long imm;
> >
> > @@ -347,7 +347,7 @@ static unsigned long branch_bform_target(const unsigned
> > int *instr)
> >       return (unsigned long)imm;
> >  }
> >
> > -unsigned long branch_target(const unsigned int *instr)
> > +unsigned long branch_target(const struct ppc_inst *instr)
> >  {
> >       if (instr_is_branch_iform(*instr))
> >               return branch_iform_target(instr);
> > @@ -357,7 +357,7 @@ unsigned long branch_target(const unsigned int *instr)
> >       return 0;
> >  }
> >
> > -int instr_is_branch_to_addr(const unsigned int *instr, unsigned long addr)
> > +int instr_is_branch_to_addr(const struct ppc_inst *instr, unsigned long
> > addr)
> >  {
> >       if (instr_is_branch_iform(*instr) || instr_is_branch_bform(*instr))
> >               return branch_target(instr) == addr;
> > @@ -365,7 +365,7 @@ int instr_is_branch_to_addr(const unsigned int *instr,
> > unsigned long addr)
> >       return 0;
> >  }
> >
> > -int translate_branch(unsigned int *instr, const unsigned int *dest, const
> > unsigned int *src)
> > +int translate_branch(struct ppc_inst *instr, const struct ppc_inst *dest,
> > const struct ppc_inst *src)
> >  {
> >       unsigned long target;
> >
> > @@ -408,7 +408,7 @@ static void __init test_trampoline(void)
> >  static void __init test_branch_iform(void)
> >  {
> >       int err;
> > -     unsigned int instr;
> > +     struct ppc_inst instr;
> >       unsigned long addr;
> >
> >       addr = (unsigned long)&instr;
> > @@ -483,12 +483,12 @@ static void __init test_branch_iform(void)
> >
> >  static void __init test_create_function_call(void)
> >  {
> > -     unsigned int *iptr;
> > +     struct ppc_inst *iptr;
> >       unsigned long dest;
> > -     unsigned int instr;
> > +     struct ppc_inst instr;
> >
> >       /* Check we can create a function call */
> > -     iptr = (unsigned int *)ppc_function_entry(test_trampoline);
> > +     iptr = (struct ppc_inst *)ppc_function_entry(test_trampoline);
> >       dest = ppc_function_entry(test_create_function_call);
> >       create_branch(&instr, iptr, dest, BRANCH_SET_LINK);
> >       patch_instruction(iptr, instr);
> > @@ -499,7 +499,8 @@ static void __init test_branch_bform(void)
> >  {
> >       int err;
> >       unsigned long addr;
> > -     unsigned int *iptr, instr, flags;
> > +     struct ppc_inst *iptr, instr;
> > +     unsigned int flags;
> >
> >       iptr = &instr;
> >       addr = (unsigned long)iptr;
> > @@ -569,8 +570,8 @@ static void __init test_branch_bform(void)
> >  static void __init test_translate_branch(void)
> >  {
> >       unsigned long addr;
> > -     unsigned int *p, *q;
> > -     unsigned int instr;
> > +     struct ppc_inst *p, *q;
> > +     struct ppc_inst instr;
> >       void *buf;
> >
> >       buf = vmalloc(PAGE_ALIGN(0x2000000 + 1));
> > diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-
> > fixups.c
> > index 6e7479b8887a..8c5d0db77013 100644
> > --- a/arch/powerpc/lib/feature-fixups.c
> > +++ b/arch/powerpc/lib/feature-fixups.c
> > @@ -32,26 +32,26 @@ struct fixup_entry {
> >       long            alt_end_off;
> >  };
> >
> > -static unsigned int *calc_addr(struct fixup_entry *fcur, long offset)
> > +static struct ppc_inst *calc_addr(struct fixup_entry *fcur, long offset)
> >  {
> >       /*
> >        * We store the offset to the code as a negative offset from
> >        * the start of the alt_entry, to support the VDSO. This
> >        * routine converts that back into an actual address.
> >        */
> > -     return (unsigned int *)((unsigned long)fcur + offset);
> > +     return (struct ppc_inst *)((unsigned long)fcur + offset);
> >  }
> >
> > -static int patch_alt_instruction(unsigned int *src, unsigned int *dest,
> > -                              unsigned int *alt_start, unsigned int
> > *alt_end)
> > +static int patch_alt_instruction(struct ppc_inst *src, struct ppc_inst
> > *dest,
> > +                              struct ppc_inst *alt_start, struct ppc_inst
> > *alt_end)
> >  {
> >       int err;
> > -     unsigned int instr;
> > +     struct ppc_inst instr;
> >
> >       instr = *src;
> >
> >       if (instr_is_relative_branch(*src)) {
> > -             unsigned int *target = (unsigned int *)branch_target(src);
> > +             struct ppc_inst *target = (struct ppc_inst
> > *)branch_target(src);
> >
> >               /* Branch within the section doesn't need translating */
> >               if (target < alt_start || target > alt_end) {
> > @@ -68,7 +68,7 @@ static int patch_alt_instruction(unsigned int *src,
> > unsigned int *dest,
> >
> >  static int patch_feature_section(unsigned long value, struct fixup_entry
> > *fcur)
> >  {
> > -     unsigned int *start, *end, *alt_start, *alt_end, *src, *dest;
> > +     struct ppc_inst *start, *end, *alt_start, *alt_end, *src, *dest;
> >
> >       start = calc_addr(fcur, fcur->start_off);
> >       end = calc_addr(fcur, fcur->end_off);
> > @@ -147,15 +147,15 @@ static void do_stf_entry_barrier_fixups(enum
> > stf_barrier_type types)
> >
> >               pr_devel("patching dest %lx\n", (unsigned long)dest);
> >
> > -             patch_instruction(dest, ppc_inst(instrs[0]));
> > +             patch_instruction((struct ppc_inst *)dest,
> > ppc_inst(instrs[0]));
>
>
> we had already declared them as struct ppc_inst *
True.
>
>
> >
> >               if (types & STF_BARRIER_FALLBACK)
> > -                     patch_branch(dest + 1, (unsigned
> > long)&stf_barrier_fallback,
> > +                     patch_branch((struct ppc_inst *)(dest + 1), (unsigned
> > long)&stf_barrier_fallback,
> >                                    BRANCH_SET_LINK);
> >               else
> > -                     patch_instruction(dest + 1, ppc_inst(instrs[1]));
> > +                     patch_instruction((struct ppc_inst *)(dest + 1),
> > ppc_inst(instrs[1]));
> >
> > -             patch_instruction(dest + 2, ppc_inst(instrs[2]));
> > +             patch_instruction((struct ppc_inst *)(dest + 2),
> > ppc_inst(instrs[2]));
> >       }
> >
> >       printk(KERN_DEBUG "stf-barrier: patched %d entry locations (%s
> > barrier)\n", i,
> > @@ -208,12 +208,12 @@ static void do_stf_exit_barrier_fixups(enum
> > stf_barrier_type types)
> >
> >               pr_devel("patching dest %lx\n", (unsigned long)dest);
> >
> > -             patch_instruction(dest, ppc_inst(instrs[0]));
> > -             patch_instruction(dest + 1, ppc_inst(instrs[1]));
> > -             patch_instruction(dest + 2, ppc_inst(instrs[2]));
> > -             patch_instruction(dest + 3, ppc_inst(instrs[3]));
> > -             patch_instruction(dest + 4, ppc_inst(instrs[4]));
> > -             patch_instruction(dest + 5, ppc_inst(instrs[5]));
> > +             patch_instruction((struct ppc_inst *)dest,
> > ppc_inst(instrs[0]));
> > +             patch_instruction((struct ppc_inst *)(dest + 1),
> > ppc_inst(instrs[1]));
> > +             patch_instruction((struct ppc_inst *)(dest + 2),
> > ppc_inst(instrs[2]));
> > +             patch_instruction((struct ppc_inst *)(dest + 3),
> > ppc_inst(instrs[3]));
> > +             patch_instruction((struct ppc_inst *)(dest + 4),
> > ppc_inst(instrs[4]));
> > +             patch_instruction((struct ppc_inst *)(dest + 5),
> > ppc_inst(instrs[5]));
> >       }
> >       printk(KERN_DEBUG "stf-barrier: patched %d exit locations (%s
> > barrier)\n", i,
> >               (types == STF_BARRIER_NONE)                  ? "no" :
> > @@ -261,9 +261,9 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
> >
> >               pr_devel("patching dest %lx\n", (unsigned long)dest);
> >
> > -             patch_instruction(dest, ppc_inst(instrs[0]));
> > -             patch_instruction(dest + 1, ppc_inst(instrs[1]));
> > -             patch_instruction(dest + 2, ppc_inst(instrs[2]));
> > +             patch_instruction((struct ppc_inst *)dest,
> > ppc_inst(instrs[0]));
> > +             patch_instruction((struct ppc_inst *)(dest + 1),
> > ppc_inst(instrs[1]));
> > +             patch_instruction((struct ppc_inst *)(dest + 2),
> > ppc_inst(instrs[2]));
> >       }
> >
> >       printk(KERN_DEBUG "rfi-flush: patched %d locations (%s flush)\n", i,
> > @@ -296,7 +296,7 @@ void do_barrier_nospec_fixups_range(bool enable, void
> > *fixup_start, void *fixup_
> >               dest = (void *)start + *start;
> >
> >               pr_devel("patching dest %lx\n", (unsigned long)dest);
> > -             patch_instruction(dest, ppc_inst(instr));
> > +             patch_instruction((struct ppc_inst *)dest, ppc_inst(instr));
> >       }
> >
> >       printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
> > @@ -339,8 +339,8 @@ void do_barrier_nospec_fixups_range(bool enable, void
> > *fixup_start, void *fixup_
> >               dest = (void *)start + *start;
> >
> >               pr_devel("patching dest %lx\n", (unsigned long)dest);
> > -             patch_instruction(dest, ppc_inst(instr[0]));
> > -             patch_instruction(dest + 1, ppc_inst(instr[1]));
> > +             patch_instruction((struct ppc_inst *)dest, ppc_inst(instr[0]));
> > +             patch_instruction((struct ppc_inst *)(dest + 1),
> > ppc_inst(instr[1]));
> >       }
> >
> >       printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
> > @@ -373,7 +373,7 @@ void do_btb_flush_fixups(void)
> >  void do_lwsync_fixups(unsigned long value, void *fixup_start, void
> > *fixup_end)
> >  {
> >       long *start, *end;
> > -     unsigned int *dest;
> > +     struct ppc_inst *dest;
> >
> >       if (!(value & CPU_FTR_LWSYNC))
> >               return ;
> > diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> > index 26e37176692e..52ddd3122dc8 100644
> > --- a/arch/powerpc/lib/sstep.c
> > +++ b/arch/powerpc/lib/sstep.c
> > @@ -1163,7 +1163,7 @@ static nokprobe_inline int trap_compare(long v1, long
> > v2)
> >   * otherwise.
> >   */
> >  int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
> > -               unsigned int instr)
> > +               struct ppc_inst instr)
>
>
> we need to take care of `instr` inside this function as well to adopt
> the helpers to work with it.
>
> -- Bala
>
>
> >  {
> >       unsigned int opcode, ra, rb, rc, rd, spr, u;
> >       unsigned long int imm;
> > @@ -3103,7 +3103,7 @@ NOKPROBE_SYMBOL(emulate_loadstore);
> >   * or -1 if the instruction is one that should not be stepped,
> >   * such as an rfid, or a mtmsrd that would clear MSR_RI.
> >   */
> > -int emulate_step(struct pt_regs *regs, unsigned int instr)
> > +int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
> >  {
> >       struct instruction_op op;
> >       int r, err, type;
> > diff --git a/arch/powerpc/lib/test_emulate_step.c
> > b/arch/powerpc/lib/test_emulate_step.c
> > index 16387a9bfda0..60b159b60545 100644
> > --- a/arch/powerpc/lib/test_emulate_step.c
> > +++ b/arch/powerpc/lib/test_emulate_step.c
> > @@ -461,7 +461,7 @@ struct compute_test {
> >       struct {
> >               char *descr;
> >               unsigned long flags;
> > -             unsigned int instr;
> > +             struct ppc_inst instr;
> >               struct pt_regs regs;
> >       } subtests[MAX_SUBTESTS + 1];
> >  };
> > @@ -842,7 +842,7 @@ static struct compute_test compute_tests[] = {
> >  };
> >
> >  static int __init emulate_compute_instr(struct pt_regs *regs,
> > -                                     unsigned int instr)
> > +                                     struct ppc_inst instr)
> >  {
> >       struct instruction_op op;
> >
> > @@ -860,7 +860,7 @@ static int __init emulate_compute_instr(struct pt_regs
> > *regs,
> >  }
> >
> >  static int __init execute_compute_instr(struct pt_regs *regs,
> > -                                     unsigned int instr)
> > +                                     struct ppc_inst instr)
> >  {
> >       extern int exec_instr(struct pt_regs *regs);
> >       extern s32 patch__exec_instr;
> > @@ -891,7 +891,8 @@ static void __init run_tests_compute(void)
> >       unsigned long flags;
> >       struct compute_test *test;
> >       struct pt_regs *regs, exp, got;
> > -     unsigned int i, j, k, instr;
> > +     unsigned int i, j, k;
> > +     struct ppc_inst instr;
> >       bool ignore_gpr, ignore_xer, ignore_ccr, passed;
> >
> >       for (i = 0; i < ARRAY_SIZE(compute_tests); i++) {
> > diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-
> > book3s.c
> > index 3086055bf681..2d2580a4bfb5 100644
> > --- a/arch/powerpc/perf/core-book3s.c
> > +++ b/arch/powerpc/perf/core-book3s.c
> > @@ -421,14 +421,14 @@ static __u64 power_pmu_bhrb_to(u64 addr)
> >               if (probe_kernel_read(&instr, (void *)addr, sizeof(instr)))
> >                       return 0;
> >
> > -             return branch_target(&instr);
> > +             return branch_target((struct ppc_inst *)&instr);
> >       }
> >
> >       /* Userspace: need copy instruction here then translate it */
> >       if (probe_user_read(&instr, (unsigned int __user *)addr,
> > sizeof(instr)))
> >               return 0;
> >
> > -     target = branch_target(&instr);
> > +     target = branch_target((struct ppc_inst *)&instr);
> >       if ((!target) || (instr & BRANCH_ABSOLUTE))
> >               return target;
> >
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index f6c87d3d53ea..e3d8e1b8ce01 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -99,7 +99,7 @@ static long *xmon_fault_jmp[NR_CPUS];
> >  /* Breakpoint stuff */
> >  struct bpt {
> >       unsigned long   address;
> > -     unsigned int    *instr;
> > +     struct ppc_inst *instr;
> >       atomic_t        ref_count;
> >       int             enabled;
> >       unsigned long   pad;
> > @@ -117,7 +117,7 @@ static unsigned bpinstr = 0x7fe00008;     /* trap */
> >
> >  #define BP_NUM(bp)   ((bp) - bpts + 1)
> >
> > -#define BPT_SIZE     (sizeof(unsigned int) * 2)
> > +#define BPT_SIZE     (sizeof(struct ppc_inst) * 2)
> >  #define BPT_WORDS    (BPT_SIZE / sizeof(unsigned int))
> >  extern unsigned int bpt_table[NBPTS * BPT_WORDS];
> >
> > @@ -879,8 +879,8 @@ static struct bpt *new_breakpoint(unsigned long a)
> >       for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
> >               if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
> >                       bp->address = a;
> > -                     bp->instr = bpt_table + ((bp - bpts) * BPT_WORDS);
> > -                     patch_instruction(bp->instr + 1, bpinstr);
> > +                     bp->instr = (void *)(bpt_table + ((bp - bpts) *
> > BPT_WORDS));
> > +                     patch_instruction(bp->instr + 1, ppc_inst(bpinstr));
> >                       return bp;
> >               }
> >       }
> > @@ -892,7 +892,7 @@ static struct bpt *new_breakpoint(unsigned long a)
> >  static void insert_bpts(void)
> >  {
> >       int i;
> > -     unsigned int instr;
> > +     struct ppc_inst instr;
> >       struct bpt *bp;
> >
> >       bp = bpts;
> > @@ -914,8 +914,8 @@ static void insert_bpts(void)
> >               patch_instruction(bp->instr, instr);
> >               if (bp->enabled & BP_CIABR)
> >                       continue;
> > -             if (patch_instruction((unsigned int *)bp->address,
> > -                                                     bpinstr) != 0) {
> > +             if (patch_instruction((struct ppc_inst *)bp->address,
> > +                                                     ppc_inst(bpinstr)) !=
> > 0) {
> >                       printf("Couldn't write instruction at %lx, "
> >                              "disabling breakpoint there\n", bp->address);
> >                       bp->enabled &= ~BP_TRAP;
> > @@ -943,7 +943,7 @@ static void remove_bpts(void)
> >  {
> >       int i;
> >       struct bpt *bp;
> > -     unsigned instr;
> > +     struct ppc_inst instr;
> >
> >       bp = bpts;
> >       for (i = 0; i < NBPTS; ++i, ++bp) {
> > @@ -952,7 +952,7 @@ static void remove_bpts(void)
> >               if (mread(bp->address, &instr, 4) == 4
> >                   && ppc_inst_equal(instr, ppc_inst(bpinstr))
> >                   && patch_instruction(
> > -                     (unsigned int *)bp->address, bp->instr[0]) != 0)
> > +                     (struct ppc_inst *)bp->address, bp->instr[0]) != 0)
> >                       printf("Couldn't remove breakpoint at %lx\n",
> >                              bp->address);
> >       }
> > @@ -1159,7 +1159,7 @@ static int do_step(struct pt_regs *regs)
> >   */
> >  static int do_step(struct pt_regs *regs)
> >  {
> > -     unsigned int instr;
> > +     struct ppc_inst instr;
> >       int stepped;
> >
> >       force_enable_xmon();
> > @@ -1325,7 +1325,7 @@ csum(void)
> >   */
> >  static long check_bp_loc(unsigned long addr)
> >  {
> > -     unsigned int instr;
> > +     struct ppc_inst instr;
> >
> >       addr &= ~3;
> >       if (!is_kernel_addr(addr)) {
> > @@ -2846,7 +2846,7 @@ generic_inst_dump(unsigned long adr, long count, int
> > praddr,
> >  {
> >       int nr, dotted;
> >       unsigned long first_adr;
> > -     unsigned int inst, last_inst = ppc_inst(0);
> > +     struct ppc_inst inst, last_inst = ppc_inst(0);
> >       unsigned char val[4];
> >
> >       dotted = 0;
>
