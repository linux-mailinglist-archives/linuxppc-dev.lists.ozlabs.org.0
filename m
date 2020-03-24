Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B44E1903D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 04:20:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mc1x4QZtzDqjM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 14:20:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nb/CCdNQ; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mc060d4wzDqsX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 14:18:29 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id y71so17106975oia.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 20:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8G0E9z+R2z3ulGV8ZKKzXf9KkNIzR132YXyVD4MwUe0=;
 b=nb/CCdNQVD0tQw0XSO4BWuRX1f7/WZUjikMXpUcSMANFB1jr0/6egUUu2Xwxavvd+V
 +TeP7S1/FM+KJkeui4aRdOxlEDluJeNuji3OUNSeld+w1wx6mykZKUlJ/TUq89m1hrjC
 LoXWkuPO9Z4w7MVdFsVfXbJTRnylelgiHxHxt4iaamdsCZEUg9iuLyBwpjS06F9AGaGe
 wiDftHru/KxgsME0dfizLQlpgho/JyZbMdExsJaCUII5K/ApS131yywKZjRYfFzYb7o4
 NtTbBfIVdqrdEoIFsXKYuNzKl0RZfiK4bZd8NyLfZlJ3Bnyq3pqjHCXlT+FfZp6pKpuD
 Ul8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8G0E9z+R2z3ulGV8ZKKzXf9KkNIzR132YXyVD4MwUe0=;
 b=O6AxhNNNS4UvVTZurwFlStSVrYvE30Q8tWyM5igzhewM6pB1X7jSckYdlEOMT4yw+u
 fyhstF74cdwyDx14WP369tneSn5r9/3IMWyGXYYKvJChfL/XYfubY6qhUVYF2zZuUU0k
 y5SbrjvBu4Tf/Piwf+TQfw1fBHbFUubX1Wj3nDHrQmsxxA0GQAv1dmox3NZLA52mq8gV
 83rmNkJvPMDu14VFRz1SFhXUJ5Y70nWtDR5RczbSQmz2aRfX4q2rOoyllqkFxaFTw1OZ
 VgIRfiq2WUd2Vtlp3QBjcbXJo32fNS1heaBe2BMfPDiC8sZtr+cByO3rrwfiCW8mcY/z
 TU4g==
X-Gm-Message-State: ANhLgQ0D0WFSLT+vqHvv6HSEGYLlT+Ar6quPlM1VZrYqV0hPT/zB/aUu
 +AeweRzsn6wNk1V/h6/MQ4kJZjgOJfK562wpBdM=
X-Google-Smtp-Source: ADFU+vuKb/UF2MNZ7mQ6Ngl2ZVFnZfaLjvO6CXDnTyyO3Qp6/RhLA6SA/4YsKJDG2puHqrgdXBYgtbK7MnLXunWzHk4=
X-Received: by 2002:aca:d68a:: with SMTP id n132mr2038981oig.40.1585019906988; 
 Mon, 23 Mar 2020 20:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-9-jniethe5@gmail.com>
 <ffad7904022c281493da7e56036689e70d312c0b.camel@linux.ibm.com>
In-Reply-To: <ffad7904022c281493da7e56036689e70d312c0b.camel@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 24 Mar 2020 14:18:15 +1100
Message-ID: <CACzsE9rXmCfPV0-0m99i7YgYzBABuVo=t2GExfZpu6-9dL0Ryw@mail.gmail.com>
Subject: Re: [PATCH v4 08/16] powerpc: Use an accessor for word instructions
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

On Mon, Mar 23, 2020 at 10:13 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
>
> On Fri, 2020-03-20 at 16:18 +1100, Jordan Niethe wrote:
> > In preparation for prefixed instructions where all instructions are no
> > longer words, use an accessor for getting a word instruction as a u32
> > from the instruction data type.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v4: New to series
> > ---
> >  arch/powerpc/kernel/align.c          |   2 +-
> >  arch/powerpc/kernel/kprobes.c        |   2 +-
> >  arch/powerpc/kernel/trace/ftrace.c   |  16 +-
> >  arch/powerpc/lib/code-patching.c     |   2 +-
> >  arch/powerpc/lib/feature-fixups.c    |   4 +-
> >  arch/powerpc/lib/sstep.c             | 270 ++++++++++++++-------------
> >  arch/powerpc/lib/test_emulate_step.c |   4 +-
> >  arch/powerpc/xmon/xmon.c             |   4 +-
> >  8 files changed, 153 insertions(+), 151 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> > index 77c49dfdc1b4..b246ca124931 100644
> > --- a/arch/powerpc/kernel/align.c
> > +++ b/arch/powerpc/kernel/align.c
> > @@ -309,7 +309,7 @@ int fix_alignment(struct pt_regs *regs)
> >               /* We don't handle PPC little-endian any more... */
> >               if (cpu_has_feature(CPU_FTR_PPC_LE))
> >                       return -EIO;
> > -             instr = PPC_INST(swab32(instr));
> > +             instr = PPC_INST(swab32(ppc_inst_word(instr)));
> >       }
> >
> >  #ifdef CONFIG_SPE
> > diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> > index 4c2b656615a6..0c600b6e4ead 100644
> > --- a/arch/powerpc/kernel/kprobes.c
> > +++ b/arch/powerpc/kernel/kprobes.c
> > @@ -242,7 +242,7 @@ static int try_to_emulate(struct kprobe *p, struct
> > pt_regs *regs)
> >                * So, we should never get here... but, its still
> >                * good to catch them, just in case...
> >                */
> > -             printk("Can't step on instruction %x\n", insn);
> > +             printk("Can't step on instruction %x\n", ppc_inst_word(insn));
> >               BUG();
> >       } else {
> >               /*
> > diff --git a/arch/powerpc/kernel/trace/ftrace.c
> > b/arch/powerpc/kernel/trace/ftrace.c
> > index b3645b664819..7614a9f537fd 100644
> > --- a/arch/powerpc/kernel/trace/ftrace.c
> > +++ b/arch/powerpc/kernel/trace/ftrace.c
> > @@ -74,7 +74,7 @@ ftrace_modify_code(unsigned long ip, ppc_inst old, ppc_inst
> > new)
> >       /* Make sure it is what we expect it to be */
> >       if (!ppc_inst_equal(replaced, old)) {
> >               pr_err("%p: replaced (%#x) != old (%#x)",
> > -             (void *)ip, replaced, old);
> > +             (void *)ip, ppc_inst_word(replaced), ppc_inst_word(old));
> >               return -EINVAL;
> >       }
> >
> > @@ -136,7 +136,7 @@ __ftrace_make_nop(struct module *mod,
> >
> >       /* Make sure that that this is still a 24bit jump */
> >       if (!is_bl_op(op)) {
> > -             pr_err("Not expected bl: opcode is %x\n", op);
> > +             pr_err("Not expected bl: opcode is %x\n", ppc_inst_word(op));
> >               return -EINVAL;
> >       }
> >
> > @@ -171,7 +171,7 @@ __ftrace_make_nop(struct module *mod,
> >       /* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
> >       if (!ppc_inst_equal(op, PPC_INST(PPC_INST_MFLR)) &&
> >           !ppc_inst_equal(op, PPC_INST(PPC_INST_STD_LR))) {
> > -             pr_err("Unexpected instruction %08x around bl _mcount\n", op);
> > +             pr_err("Unexpected instruction %08x around bl _mcount\n",
> > ppc_inst_word(op));
> >               return -EINVAL;
> >       }
> >  #else
> > @@ -201,7 +201,7 @@ __ftrace_make_nop(struct module *mod,
> >       }
> >
> >       if (!ppc_inst_equal(op,  PPC_INST(PPC_INST_LD_TOC))) {
> > -             pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC, op);
> > +             pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC,
> > ppc_inst_word(op));
> >               return -EINVAL;
> >       }
> >  #endif /* CONFIG_MPROFILE_KERNEL */
> > @@ -401,7 +401,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace
> > *rec, unsigned long addr)
> >
> >       /* Make sure that that this is still a 24bit jump */
> >       if (!is_bl_op(op)) {
> > -             pr_err("Not expected bl: opcode is %x\n", op);
> > +             pr_err("Not expected bl: opcode is %x\n", ppc_inst_word(op));
> >               return -EINVAL;
> >       }
> >
> > @@ -525,7 +525,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long
> > addr)
> >
> >       if (!expected_nop_sequence(ip, op[0], op[1])) {
> >               pr_err("Unexpected call sequence at %p: %x %x\n",
> > -             ip, op[0], op[1]);
> > +             ip, ppc_inst_word(op[0]), ppc_inst_word(op[1]));
> >               return -EINVAL;
> >       }
> >
> > @@ -644,7 +644,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace
> > *rec, unsigned long addr)
> >       }
> >
> >       if (!ppc_inst_equal(op, PPC_INST(PPC_INST_NOP))) {
> > -             pr_err("Unexpected call sequence at %p: %x\n", ip, op);
> > +             pr_err("Unexpected call sequence at %p: %x\n", ip,
> > ppc_inst_word(op));
> >               return -EINVAL;
> >       }
> >
> > @@ -723,7 +723,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned
> > long old_addr,
> >
> >       /* Make sure that that this is still a 24bit jump */
> >       if (!is_bl_op(op)) {
> > -             pr_err("Not expected bl: opcode is %x\n", op);
> > +             pr_err("Not expected bl: opcode is %x\n", ppc_inst_word(op));
> >               return -EINVAL;
> >       }
> >
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-
> > patching.c
> > index ec3abe1a6927..849eee63df3d 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -233,7 +233,7 @@ bool is_conditional_branch(ppc_inst instr)
> >       if (opcode == 16)       /* bc, bca, bcl, bcla */
> >               return true;
> >       if (opcode == 19) {
> > -             switch ((instr >> 1) & 0x3ff) {
> > +             switch ((ppc_inst_word(instr) >> 1) & 0x3ff) {
> >               case 16:        /* bclr, bclrl */
> >               case 528:       /* bcctr, bcctrl */
> >               case 560:       /* bctar, bctarl */
> > diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-
> > fixups.c
> > index 552106d1f64a..fe8ec099aa96 100644
> > --- a/arch/powerpc/lib/feature-fixups.c
> > +++ b/arch/powerpc/lib/feature-fixups.c
> > @@ -54,8 +54,8 @@ static int patch_alt_instruction(unsigned int *src,
> > unsigned int *dest,
> >
> >               /* Branch within the section doesn't need translating */
> >               if (target < alt_start || target > alt_end) {
> > -                     instr = translate_branch(dest, src);
> > -                     if (ppc_inst_null(instr))
> > +                     instr = ppc_inst_word(translate_branch((ppc_inst
> > *)dest, (ppc_inst *)src));
> > +                     if (!instr)
> >                               return 1;
> >               }
> >       }
> > diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> > index 1d9c766a89fe..bae878a83fa5 100644
> > --- a/arch/powerpc/lib/sstep.c
> > +++ b/arch/powerpc/lib/sstep.c
> > @@ -1169,26 +1169,28 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >       unsigned long int imm;
> >       unsigned long int val, val2;
> >       unsigned int mb, me, sh;
> > +     unsigned int word;
> >       long ival;
> >
> > +     word = ppc_inst_word(instr);
> >       op->type = COMPUTE;
> >
> > -     opcode = instr >> 26;
> > +     opcode = word >> 26;
> >       switch (opcode) {
> >       case 16:        /* bc */
> >               op->type = BRANCH;
> > -             imm = (signed short)(instr & 0xfffc);
> > -             if ((instr & 2) == 0)
> > +             imm = (signed short)(word & 0xfffc);
> > +             if ((word & 2) == 0)
> >                       imm += regs->nip;
> >               op->val = truncate_if_32bit(regs->msr, imm);
> > -             if (instr & 1)
> > +             if (word & 1)
> >                       op->type |= SETLK;
> > -             if (branch_taken(instr, regs, op))
> > +             if (branch_taken(word, regs, op))
> >                       op->type |= BRTAKEN;
> >               return 1;
> >  #ifdef CONFIG_PPC64
> >       case 17:        /* sc */
> > -             if ((instr & 0xfe2) == 2)
> > +             if ((word & 0xfe2) == 2)
> >                       op->type = SYSCALL;
> >               else
> >                       op->type = UNKNOWN;
> > @@ -1196,21 +1198,21 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >  #endif
> >       case 18:        /* b */
> >               op->type = BRANCH | BRTAKEN;
> > -             imm = instr & 0x03fffffc;
> > +             imm = word & 0x03fffffc;
> >               if (imm & 0x02000000)
> >                       imm -= 0x04000000;
> > -             if ((instr & 2) == 0)
> > +             if ((word & 2) == 0)
> >                       imm += regs->nip;
> >               op->val = truncate_if_32bit(regs->msr, imm);
> > -             if (instr & 1)
> > +             if (word & 1)
> >                       op->type |= SETLK;
> >               return 1;
> >       case 19:
> > -             switch ((instr >> 1) & 0x3ff) {
> > +             switch ((word >> 1) & 0x3ff) {
> >               case 0:         /* mcrf */
> >                       op->type = COMPUTE + SETCC;
> > -                     rd = 7 - ((instr >> 23) & 0x7);
> > -                     ra = 7 - ((instr >> 18) & 0x7);
> > +                     rd = 7 - ((word >> 23) & 0x7);
> > +                     ra = 7 - ((word >> 18) & 0x7);
> >                       rd *= 4;
> >                       ra *= 4;
> >                       val = (regs->ccr >> ra) & 0xf;
> > @@ -1220,11 +1222,11 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >               case 16:        /* bclr */
> >               case 528:       /* bcctr */
> >                       op->type = BRANCH;
> > -                     imm = (instr & 0x400)? regs->ctr: regs->link;
> > +                     imm = (word & 0x400)? regs->ctr: regs->link;
> >                       op->val = truncate_if_32bit(regs->msr, imm);
> > -                     if (instr & 1)
> > +                     if (word & 1)
> >                               op->type |= SETLK;
> > -                     if (branch_taken(instr, regs, op))
> > +                     if (branch_taken(word, regs, op))
> >                               op->type |= BRTAKEN;
> >                       return 1;
> >
> > @@ -1247,23 +1249,23 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >               case 417:       /* crorc */
> >               case 449:       /* cror */
> >                       op->type = COMPUTE + SETCC;
> > -                     ra = (instr >> 16) & 0x1f;
> > -                     rb = (instr >> 11) & 0x1f;
> > -                     rd = (instr >> 21) & 0x1f;
> > +                     ra = (word >> 16) & 0x1f;
> > +                     rb = (word >> 11) & 0x1f;
> > +                     rd = (word >> 21) & 0x1f;
>
> can't we use your accessors for all these operations ?
I felt that since we are doing so many bit operations here it was
simpliest to just leave these as uints.
>
> >                       ra = (regs->ccr >> (31 - ra)) & 1;
> >                       rb = (regs->ccr >> (31 - rb)) & 1;
> > -                     val = (instr >> (6 + ra * 2 + rb)) & 1;
> > +                     val = (word >> (6 + ra * 2 + rb)) & 1;
> >                       op->ccval = (regs->ccr & ~(1UL << (31 - rd))) |
> >                               (val << (31 - rd));
> >                       return 1;
> >               }
> >               break;
> >       case 31:
> > -             switch ((instr >> 1) & 0x3ff) {
> > +             switch ((word >> 1) & 0x3ff) {
> >               case 598:       /* sync */
> >                       op->type = BARRIER + BARRIER_SYNC;
> >  #ifdef __powerpc64__
> > -                     switch ((instr >> 21) & 3) {
> > +                     switch ((word >> 21) & 3) {
> >                       case 1:         /* lwsync */
> >                               op->type = BARRIER + BARRIER_LWSYNC;
> >                               break;
> > @@ -1285,20 +1287,20 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >       if (!FULL_REGS(regs))
> >               return -1;
> >
> > -     rd = (instr >> 21) & 0x1f;
> > -     ra = (instr >> 16) & 0x1f;
> > -     rb = (instr >> 11) & 0x1f;
> > -     rc = (instr >> 6) & 0x1f;
> > +     rd = (word >> 21) & 0x1f;
> > +     ra = (word >> 16) & 0x1f;
> > +     rb = (word >> 11) & 0x1f;
> > +     rc = (word >> 6) & 0x1f;
>
> same here and in similar such places.
>
> -- Bala
> >
> >       switch (opcode) {
> >  #ifdef __powerpc64__
> >       case 2:         /* tdi */
> > -             if (rd & trap_compare(regs->gpr[ra], (short) instr))
> > +             if (rd & trap_compare(regs->gpr[ra], (short) word))
> >                       goto trap;
> >               return 1;
> >  #endif
> >       case 3:         /* twi */
> > -             if (rd & trap_compare((int)regs->gpr[ra], (short) instr))
> > +             if (rd & trap_compare((int)regs->gpr[ra], (short) word))
> >                       goto trap;
> >               return 1;
> >
> > @@ -1307,7 +1309,7 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >               if (!cpu_has_feature(CPU_FTR_ARCH_300))
> >                       return -1;
> >
> > -             switch (instr & 0x3f) {
> > +             switch (word & 0x3f) {
> >               case 48:        /* maddhd */
> >                       asm volatile(PPC_MADDHD(%0, %1, %2, %3) :
> >                                    "=r" (op->val) : "r" (regs->gpr[ra]),
> > @@ -1335,16 +1337,16 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >  #endif
> >
> >       case 7:         /* mulli */
> > -             op->val = regs->gpr[ra] * (short) instr;
> > +             op->val = regs->gpr[ra] * (short) word;
> >               goto compute_done;
> >
> >       case 8:         /* subfic */
> > -             imm = (short) instr;
> > +             imm = (short) word;
> >               add_with_carry(regs, op, rd, ~regs->gpr[ra], imm, 1);
> >               return 1;
> >
> >       case 10:        /* cmpli */
> > -             imm = (unsigned short) instr;
> > +             imm = (unsigned short) word;
> >               val = regs->gpr[ra];
> >  #ifdef __powerpc64__
> >               if ((rd & 1) == 0)
> > @@ -1354,7 +1356,7 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >               return 1;
> >
> >       case 11:        /* cmpi */
> > -             imm = (short) instr;
> > +             imm = (short) word;
> >               val = regs->gpr[ra];
> >  #ifdef __powerpc64__
> >               if ((rd & 1) == 0)
> > @@ -1364,35 +1366,35 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >               return 1;
> >
> >       case 12:        /* addic */
> > -             imm = (short) instr;
> > +             imm = (short) word;
> >               add_with_carry(regs, op, rd, regs->gpr[ra], imm, 0);
> >               return 1;
> >
> >       case 13:        /* addic. */
> > -             imm = (short) instr;
> > +             imm = (short) word;
> >               add_with_carry(regs, op, rd, regs->gpr[ra], imm, 0);
> >               set_cr0(regs, op);
> >               return 1;
> >
> >       case 14:        /* addi */
> > -             imm = (short) instr;
> > +             imm = (short) word;
> >               if (ra)
> >                       imm += regs->gpr[ra];
> >               op->val = imm;
> >               goto compute_done;
> >
> >       case 15:        /* addis */
> > -             imm = ((short) instr) << 16;
> > +             imm = ((short) word) << 16;
> >               if (ra)
> >                       imm += regs->gpr[ra];
> >               op->val = imm;
> >               goto compute_done;
> >
> >       case 19:
> > -             if (((instr >> 1) & 0x1f) == 2) {
> > +             if (((word >> 1) & 0x1f) == 2) {
> >                       /* addpcis */
> > -                     imm = (short) (instr & 0xffc1); /* d0 + d2 fields */
> > -                     imm |= (instr >> 15) & 0x3e;    /* d1 field */
> > +                     imm = (short) (word & 0xffc1);  /* d0 + d2 fields */
> > +                     imm |= (word >> 15) & 0x3e;     /* d1 field */
> >                       op->val = regs->nip + (imm << 16) + 4;
> >                       goto compute_done;
> >               }
> > @@ -1400,65 +1402,65 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >               return 0;
> >
> >       case 20:        /* rlwimi */
> > -             mb = (instr >> 6) & 0x1f;
> > -             me = (instr >> 1) & 0x1f;
> > +             mb = (word >> 6) & 0x1f;
> > +             me = (word >> 1) & 0x1f;
> >               val = DATA32(regs->gpr[rd]);
> >               imm = MASK32(mb, me);
> >               op->val = (regs->gpr[ra] & ~imm) | (ROTATE(val, rb) & imm);
> >               goto logical_done;
> >
> >       case 21:        /* rlwinm */
> > -             mb = (instr >> 6) & 0x1f;
> > -             me = (instr >> 1) & 0x1f;
> > +             mb = (word >> 6) & 0x1f;
> > +             me = (word >> 1) & 0x1f;
> >               val = DATA32(regs->gpr[rd]);
> >               op->val = ROTATE(val, rb) & MASK32(mb, me);
> >               goto logical_done;
> >
> >       case 23:        /* rlwnm */
> > -             mb = (instr >> 6) & 0x1f;
> > -             me = (instr >> 1) & 0x1f;
> > +             mb = (word >> 6) & 0x1f;
> > +             me = (word >> 1) & 0x1f;
> >               rb = regs->gpr[rb] & 0x1f;
> >               val = DATA32(regs->gpr[rd]);
> >               op->val = ROTATE(val, rb) & MASK32(mb, me);
> >               goto logical_done;
> >
> >       case 24:        /* ori */
> > -             op->val = regs->gpr[rd] | (unsigned short) instr;
> > +             op->val = regs->gpr[rd] | (unsigned short) word;
> >               goto logical_done_nocc;
> >
> >       case 25:        /* oris */
> > -             imm = (unsigned short) instr;
> > +             imm = (unsigned short) word;
> >               op->val = regs->gpr[rd] | (imm << 16);
> >               goto logical_done_nocc;
> >
> >       case 26:        /* xori */
> > -             op->val = regs->gpr[rd] ^ (unsigned short) instr;
> > +             op->val = regs->gpr[rd] ^ (unsigned short) word;
> >               goto logical_done_nocc;
> >
> >       case 27:        /* xoris */
> > -             imm = (unsigned short) instr;
> > +             imm = (unsigned short) word;
> >               op->val = regs->gpr[rd] ^ (imm << 16);
> >               goto logical_done_nocc;
> >
> >       case 28:        /* andi. */
> > -             op->val = regs->gpr[rd] & (unsigned short) instr;
> > +             op->val = regs->gpr[rd] & (unsigned short) word;
> >               set_cr0(regs, op);
> >               goto logical_done_nocc;
> >
> >       case 29:        /* andis. */
> > -             imm = (unsigned short) instr;
> > +             imm = (unsigned short) word;
> >               op->val = regs->gpr[rd] & (imm << 16);
> >               set_cr0(regs, op);
> >               goto logical_done_nocc;
> >
> >  #ifdef __powerpc64__
> >       case 30:        /* rld* */
> > -             mb = ((instr >> 6) & 0x1f) | (instr & 0x20);
> > +             mb = ((word >> 6) & 0x1f) | (word & 0x20);
> >               val = regs->gpr[rd];
> > -             if ((instr & 0x10) == 0) {
> > -                     sh = rb | ((instr & 2) << 4);
> > +             if ((word & 0x10) == 0) {
> > +                     sh = rb | ((word & 2) << 4);
> >                       val = ROTATE(val, sh);
> > -                     switch ((instr >> 2) & 3) {
> > +                     switch ((word >> 2) & 3) {
> >                       case 0:         /* rldicl */
> >                               val &= MASK64_L(mb);
> >                               break;
> > @@ -1478,7 +1480,7 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >               } else {
> >                       sh = regs->gpr[rb] & 0x3f;
> >                       val = ROTATE(val, sh);
> > -                     switch ((instr >> 1) & 7) {
> > +                     switch ((word >> 1) & 7) {
> >                       case 0:         /* rldcl */
> >                               op->val = val & MASK64_L(mb);
> >                               goto logical_done;
> > @@ -1493,8 +1495,8 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >
> >       case 31:
> >               /* isel occupies 32 minor opcodes */
> > -             if (((instr >> 1) & 0x1f) == 15) {
> > -                     mb = (instr >> 6) & 0x1f; /* bc field */
> > +             if (((word >> 1) & 0x1f) == 15) {
> > +                     mb = (word >> 6) & 0x1f; /* bc field */
> >                       val = (regs->ccr >> (31 - mb)) & 1;
> >                       val2 = (ra) ? regs->gpr[ra] : 0;
> >
> > @@ -1502,7 +1504,7 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >                       goto compute_done;
> >               }
> >
> > -             switch ((instr >> 1) & 0x3ff) {
> > +             switch ((word >> 1) & 0x3ff) {
> >               case 4:         /* tw */
> >                       if (rd == 0x1f ||
> >                           (rd & trap_compare((int)regs->gpr[ra],
> > @@ -1536,17 +1538,17 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >                       op->reg = rd;
> >                       /* only MSR_EE and MSR_RI get changed if bit 15 set */
> >                       /* mtmsrd doesn't change MSR_HV, MSR_ME or MSR_LE */
> > -                     imm = (instr & 0x10000)? 0x8002: 0xefffffffffffeffeUL;
> > +                     imm = (word & 0x10000)? 0x8002: 0xefffffffffffeffeUL;
> >                       op->val = imm;
> >                       return 0;
> >  #endif
> >
> >               case 19:        /* mfcr */
> >                       imm = 0xffffffffUL;
> > -                     if ((instr >> 20) & 1) {
> > +                     if ((word >> 20) & 1) {
> >                               imm = 0xf0000000UL;
> >                               for (sh = 0; sh < 8; ++sh) {
> > -                                     if (instr & (0x80000 >> sh))
> > +                                     if (word & (0x80000 >> sh))
> >                                               break;
> >                                       imm >>= 4;
> >                               }
> > @@ -1560,7 +1562,7 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >                       val = regs->gpr[rd];
> >                       op->ccval = regs->ccr;
> >                       for (sh = 0; sh < 8; ++sh) {
> > -                             if (instr & (0x80000 >> sh))
> > +                             if (word & (0x80000 >> sh))
> >                                       op->ccval = (op->ccval & ~imm) |
> >                                               (val & imm);
> >                               imm >>= 4;
> > @@ -1568,7 +1570,7 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >                       return 1;
> >
> >               case 339:       /* mfspr */
> > -                     spr = ((instr >> 16) & 0x1f) | ((instr >> 6) & 0x3e0);
> > +                     spr = ((word >> 16) & 0x1f) | ((word >> 6) & 0x3e0);
> >                       op->type = MFSPR;
> >                       op->reg = rd;
> >                       op->spr = spr;
> > @@ -1578,7 +1580,7 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >                       return 0;
> >
> >               case 467:       /* mtspr */
> > -                     spr = ((instr >> 16) & 0x1f) | ((instr >> 6) & 0x3e0);
> > +                     spr = ((word >> 16) & 0x1f) | ((word >> 6) & 0x3e0);
> >                       op->type = MTSPR;
> >                       op->val = regs->gpr[rd];
> >                       op->spr = spr;
> > @@ -1948,7 +1950,7 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >               case 826:       /* sradi with sh_5 = 0 */
> >               case 827:       /* sradi with sh_5 = 1 */
> >                       op->type = COMPUTE + SETREG + SETXER;
> > -                     sh = rb | ((instr & 2) << 4);
> > +                     sh = rb | ((word & 2) << 4);
> >                       ival = (signed long int) regs->gpr[rd];
> >                       op->val = ival >> sh;
> >                       op->xerval = regs->xer;
> > @@ -1964,7 +1966,7 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >                       if (!cpu_has_feature(CPU_FTR_ARCH_300))
> >                               return -1;
> >                       op->type = COMPUTE + SETREG;
> > -                     sh = rb | ((instr & 2) << 4);
> > +                     sh = rb | ((word & 2) << 4);
> >                       val = (signed int) regs->gpr[rd];
> >                       if (sh)
> >                               op->val = ROTATE(val, sh) & MASK64(0, 63 - sh);
> > @@ -1979,34 +1981,34 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >   */
> >               case 54:        /* dcbst */
> >                       op->type = MKOP(CACHEOP, DCBST, 0);
> > -                     op->ea = xform_ea(instr, regs);
> > +                     op->ea = xform_ea(word, regs);
> >                       return 0;
> >
> >               case 86:        /* dcbf */
> >                       op->type = MKOP(CACHEOP, DCBF, 0);
> > -                     op->ea = xform_ea(instr, regs);
> > +                     op->ea = xform_ea(word, regs);
> >                       return 0;
> >
> >               case 246:       /* dcbtst */
> >                       op->type = MKOP(CACHEOP, DCBTST, 0);
> > -                     op->ea = xform_ea(instr, regs);
> > +                     op->ea = xform_ea(word, regs);
> >                       op->reg = rd;
> >                       return 0;
> >
> >               case 278:       /* dcbt */
> >                       op->type = MKOP(CACHEOP, DCBTST, 0);
> > -                     op->ea = xform_ea(instr, regs);
> > +                     op->ea = xform_ea(word, regs);
> >                       op->reg = rd;
> >                       return 0;
> >
> >               case 982:       /* icbi */
> >                       op->type = MKOP(CACHEOP, ICBI, 0);
> > -                     op->ea = xform_ea(instr, regs);
> > +                     op->ea = xform_ea(word, regs);
> >                       return 0;
> >
> >               case 1014:      /* dcbz */
> >                       op->type = MKOP(CACHEOP, DCBZ, 0);
> > -                     op->ea = xform_ea(instr, regs);
> > +                     op->ea = xform_ea(word, regs);
> >                       return 0;
> >               }
> >               break;
> > @@ -2019,14 +2021,14 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >       op->update_reg = ra;
> >       op->reg = rd;
> >       op->val = regs->gpr[rd];
> > -     u = (instr >> 20) & UPDATE;
> > +     u = (word >> 20) & UPDATE;
> >       op->vsx_flags = 0;
> >
> >       switch (opcode) {
> >       case 31:
> > -             u = instr & UPDATE;
> > -             op->ea = xform_ea(instr, regs);
> > -             switch ((instr >> 1) & 0x3ff) {
> > +             u = word & UPDATE;
> > +             op->ea = xform_ea(word, regs);
> > +             switch ((word >> 1) & 0x3ff) {
> >               case 20:        /* lwarx */
> >                       op->type = MKOP(LARX, 0, 4);
> >                       break;
> > @@ -2271,25 +2273,25 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >
> >  #ifdef CONFIG_VSX
> >               case 12:        /* lxsiwzx */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(LOAD_VSX, 0, 4);
> >                       op->element_size = 8;
> >                       break;
> >
> >               case 76:        /* lxsiwax */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(LOAD_VSX, SIGNEXT, 4);
> >                       op->element_size = 8;
> >                       break;
> >
> >               case 140:       /* stxsiwx */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(STORE_VSX, 0, 4);
> >                       op->element_size = 8;
> >                       break;
> >
> >               case 268:       /* lxvx */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(LOAD_VSX, 0, 16);
> >                       op->element_size = 16;
> >                       op->vsx_flags = VSX_CHECK_VEC;
> > @@ -2298,33 +2300,33 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >               case 269:       /* lxvl */
> >               case 301: {     /* lxvll */
> >                       int nb;
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->ea = ra ? regs->gpr[ra] : 0;
> >                       nb = regs->gpr[rb] & 0xff;
> >                       if (nb > 16)
> >                               nb = 16;
> >                       op->type = MKOP(LOAD_VSX, 0, nb);
> >                       op->element_size = 16;
> > -                     op->vsx_flags = ((instr & 0x20) ? VSX_LDLEFT : 0) |
> > +                     op->vsx_flags = ((word & 0x20) ? VSX_LDLEFT : 0) |
> >                               VSX_CHECK_VEC;
> >                       break;
> >               }
> >               case 332:       /* lxvdsx */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(LOAD_VSX, 0, 8);
> >                       op->element_size = 8;
> >                       op->vsx_flags = VSX_SPLAT;
> >                       break;
> >
> >               case 364:       /* lxvwsx */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(LOAD_VSX, 0, 4);
> >                       op->element_size = 4;
> >                       op->vsx_flags = VSX_SPLAT | VSX_CHECK_VEC;
> >                       break;
> >
> >               case 396:       /* stxvx */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(STORE_VSX, 0, 16);
> >                       op->element_size = 16;
> >                       op->vsx_flags = VSX_CHECK_VEC;
> > @@ -2333,118 +2335,118 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >               case 397:       /* stxvl */
> >               case 429: {     /* stxvll */
> >                       int nb;
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->ea = ra ? regs->gpr[ra] : 0;
> >                       nb = regs->gpr[rb] & 0xff;
> >                       if (nb > 16)
> >                               nb = 16;
> >                       op->type = MKOP(STORE_VSX, 0, nb);
> >                       op->element_size = 16;
> > -                     op->vsx_flags = ((instr & 0x20) ? VSX_LDLEFT : 0) |
> > +                     op->vsx_flags = ((word & 0x20) ? VSX_LDLEFT : 0) |
> >                               VSX_CHECK_VEC;
> >                       break;
> >               }
> >               case 524:       /* lxsspx */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(LOAD_VSX, 0, 4);
> >                       op->element_size = 8;
> >                       op->vsx_flags = VSX_FPCONV;
> >                       break;
> >
> >               case 588:       /* lxsdx */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(LOAD_VSX, 0, 8);
> >                       op->element_size = 8;
> >                       break;
> >
> >               case 652:       /* stxsspx */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(STORE_VSX, 0, 4);
> >                       op->element_size = 8;
> >                       op->vsx_flags = VSX_FPCONV;
> >                       break;
> >
> >               case 716:       /* stxsdx */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(STORE_VSX, 0, 8);
> >                       op->element_size = 8;
> >                       break;
> >
> >               case 780:       /* lxvw4x */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(LOAD_VSX, 0, 16);
> >                       op->element_size = 4;
> >                       break;
> >
> >               case 781:       /* lxsibzx */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(LOAD_VSX, 0, 1);
> >                       op->element_size = 8;
> >                       op->vsx_flags = VSX_CHECK_VEC;
> >                       break;
> >
> >               case 812:       /* lxvh8x */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(LOAD_VSX, 0, 16);
> >                       op->element_size = 2;
> >                       op->vsx_flags = VSX_CHECK_VEC;
> >                       break;
> >
> >               case 813:       /* lxsihzx */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(LOAD_VSX, 0, 2);
> >                       op->element_size = 8;
> >                       op->vsx_flags = VSX_CHECK_VEC;
> >                       break;
> >
> >               case 844:       /* lxvd2x */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(LOAD_VSX, 0, 16);
> >                       op->element_size = 8;
> >                       break;
> >
> >               case 876:       /* lxvb16x */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(LOAD_VSX, 0, 16);
> >                       op->element_size = 1;
> >                       op->vsx_flags = VSX_CHECK_VEC;
> >                       break;
> >
> >               case 908:       /* stxvw4x */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(STORE_VSX, 0, 16);
> >                       op->element_size = 4;
> >                       break;
> >
> >               case 909:       /* stxsibx */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(STORE_VSX, 0, 1);
> >                       op->element_size = 8;
> >                       op->vsx_flags = VSX_CHECK_VEC;
> >                       break;
> >
> >               case 940:       /* stxvh8x */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(STORE_VSX, 0, 16);
> >                       op->element_size = 2;
> >                       op->vsx_flags = VSX_CHECK_VEC;
> >                       break;
> >
> >               case 941:       /* stxsihx */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(STORE_VSX, 0, 2);
> >                       op->element_size = 8;
> >                       op->vsx_flags = VSX_CHECK_VEC;
> >                       break;
> >
> >               case 972:       /* stxvd2x */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(STORE_VSX, 0, 16);
> >                       op->element_size = 8;
> >                       break;
> >
> >               case 1004:      /* stxvb16x */
> > -                     op->reg = rd | ((instr & 1) << 5);
> > +                     op->reg = rd | ((word & 1) << 5);
> >                       op->type = MKOP(STORE_VSX, 0, 16);
> >                       op->element_size = 1;
> >                       op->vsx_flags = VSX_CHECK_VEC;
> > @@ -2457,80 +2459,80 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >       case 32:        /* lwz */
> >       case 33:        /* lwzu */
> >               op->type = MKOP(LOAD, u, 4);
> > -             op->ea = dform_ea(instr, regs);
> > +             op->ea = dform_ea(word, regs);
> >               break;
> >
> >       case 34:        /* lbz */
> >       case 35:        /* lbzu */
> >               op->type = MKOP(LOAD, u, 1);
> > -             op->ea = dform_ea(instr, regs);
> > +             op->ea = dform_ea(word, regs);
> >               break;
> >
> >       case 36:        /* stw */
> >       case 37:        /* stwu */
> >               op->type = MKOP(STORE, u, 4);
> > -             op->ea = dform_ea(instr, regs);
> > +             op->ea = dform_ea(word, regs);
> >               break;
> >
> >       case 38:        /* stb */
> >       case 39:        /* stbu */
> >               op->type = MKOP(STORE, u, 1);
> > -             op->ea = dform_ea(instr, regs);
> > +             op->ea = dform_ea(word, regs);
> >               break;
> >
> >       case 40:        /* lhz */
> >       case 41:        /* lhzu */
> >               op->type = MKOP(LOAD, u, 2);
> > -             op->ea = dform_ea(instr, regs);
> > +             op->ea = dform_ea(word, regs);
> >               break;
> >
> >       case 42:        /* lha */
> >       case 43:        /* lhau */
> >               op->type = MKOP(LOAD, SIGNEXT | u, 2);
> > -             op->ea = dform_ea(instr, regs);
> > +             op->ea = dform_ea(word, regs);
> >               break;
> >
> >       case 44:        /* sth */
> >       case 45:        /* sthu */
> >               op->type = MKOP(STORE, u, 2);
> > -             op->ea = dform_ea(instr, regs);
> > +             op->ea = dform_ea(word, regs);
> >               break;
> >
> >       case 46:        /* lmw */
> >               if (ra >= rd)
> >                       break;          /* invalid form, ra in range to load
> > */
> >               op->type = MKOP(LOAD_MULTI, 0, 4 * (32 - rd));
> > -             op->ea = dform_ea(instr, regs);
> > +             op->ea = dform_ea(word, regs);
> >               break;
> >
> >       case 47:        /* stmw */
> >               op->type = MKOP(STORE_MULTI, 0, 4 * (32 - rd));
> > -             op->ea = dform_ea(instr, regs);
> > +             op->ea = dform_ea(word, regs);
> >               break;
> >
> >  #ifdef CONFIG_PPC_FPU
> >       case 48:        /* lfs */
> >       case 49:        /* lfsu */
> >               op->type = MKOP(LOAD_FP, u | FPCONV, 4);
> > -             op->ea = dform_ea(instr, regs);
> > +             op->ea = dform_ea(word, regs);
> >               break;
> >
> >       case 50:        /* lfd */
> >       case 51:        /* lfdu */
> >               op->type = MKOP(LOAD_FP, u, 8);
> > -             op->ea = dform_ea(instr, regs);
> > +             op->ea = dform_ea(word, regs);
> >               break;
> >
> >       case 52:        /* stfs */
> >       case 53:        /* stfsu */
> >               op->type = MKOP(STORE_FP, u | FPCONV, 4);
> > -             op->ea = dform_ea(instr, regs);
> > +             op->ea = dform_ea(word, regs);
> >               break;
> >
> >       case 54:        /* stfd */
> >       case 55:        /* stfdu */
> >               op->type = MKOP(STORE_FP, u, 8);
> > -             op->ea = dform_ea(instr, regs);
> > +             op->ea = dform_ea(word, regs);
> >               break;
> >  #endif
> >
> > @@ -2538,14 +2540,14 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >       case 56:        /* lq */
> >               if (!((rd & 1) || (rd == ra)))
> >                       op->type = MKOP(LOAD, 0, 16);
> > -             op->ea = dqform_ea(instr, regs);
> > +             op->ea = dqform_ea(word, regs);
> >               break;
> >  #endif
> >
> >  #ifdef CONFIG_VSX
> >       case 57:        /* lfdp, lxsd, lxssp */
> > -             op->ea = dsform_ea(instr, regs);
> > -             switch (instr & 3) {
> > +             op->ea = dsform_ea(word, regs);
> > +             switch (word & 3) {
> >               case 0:         /* lfdp */
> >                       if (rd & 1)
> >                               break;          /* reg must be even */
> > @@ -2569,8 +2571,8 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >
> >  #ifdef __powerpc64__
> >       case 58:        /* ld[u], lwa */
> > -             op->ea = dsform_ea(instr, regs);
> > -             switch (instr & 3) {
> > +             op->ea = dsform_ea(word, regs);
> > +             switch (word & 3) {
> >               case 0:         /* ld */
> >                       op->type = MKOP(LOAD, 0, 8);
> >                       break;
> > @@ -2586,16 +2588,16 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >
> >  #ifdef CONFIG_VSX
> >       case 61:        /* stfdp, lxv, stxsd, stxssp, stxv */
> > -             switch (instr & 7) {
> > +             switch (word & 7) {
> >               case 0:         /* stfdp with LSB of DS field = 0 */
> >               case 4:         /* stfdp with LSB of DS field = 1 */
> > -                     op->ea = dsform_ea(instr, regs);
> > +                     op->ea = dsform_ea(word, regs);
> >                       op->type = MKOP(STORE_FP, 0, 16);
> >                       break;
> >
> >               case 1:         /* lxv */
> > -                     op->ea = dqform_ea(instr, regs);
> > -                     if (instr & 8)
> > +                     op->ea = dqform_ea(word, regs);
> > +                     if (word & 8)
> >                               op->reg = rd + 32;
> >                       op->type = MKOP(LOAD_VSX, 0, 16);
> >                       op->element_size = 16;
> > @@ -2604,7 +2606,7 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >
> >               case 2:         /* stxsd with LSB of DS field = 0 */
> >               case 6:         /* stxsd with LSB of DS field = 1 */
> > -                     op->ea = dsform_ea(instr, regs);
> > +                     op->ea = dsform_ea(word, regs);
> >                       op->reg = rd + 32;
> >                       op->type = MKOP(STORE_VSX, 0, 8);
> >                       op->element_size = 8;
> > @@ -2613,7 +2615,7 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >
> >               case 3:         /* stxssp with LSB of DS field = 0 */
> >               case 7:         /* stxssp with LSB of DS field = 1 */
> > -                     op->ea = dsform_ea(instr, regs);
> > +                     op->ea = dsform_ea(word, regs);
> >                       op->reg = rd + 32;
> >                       op->type = MKOP(STORE_VSX, 0, 4);
> >                       op->element_size = 8;
> > @@ -2621,8 +2623,8 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >                       break;
> >
> >               case 5:         /* stxv */
> > -                     op->ea = dqform_ea(instr, regs);
> > -                     if (instr & 8)
> > +                     op->ea = dqform_ea(word, regs);
> > +                     if (word & 8)
> >                               op->reg = rd + 32;
> >                       op->type = MKOP(STORE_VSX, 0, 16);
> >                       op->element_size = 16;
> > @@ -2634,8 +2636,8 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >
> >  #ifdef __powerpc64__
> >       case 62:        /* std[u] */
> > -             op->ea = dsform_ea(instr, regs);
> > -             switch (instr & 3) {
> > +             op->ea = dsform_ea(word, regs);
> > +             switch (word & 3) {
> >               case 0:         /* std */
> >                       op->type = MKOP(STORE, 0, 8);
> >                       break;
> > @@ -2663,7 +2665,7 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >       return 0;
> >
> >   logical_done:
> > -     if (instr & 1)
> > +     if (word & 1)
> >               set_cr0(regs, op);
> >   logical_done_nocc:
> >       op->reg = ra;
> > @@ -2671,7 +2673,7 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >       return 1;
> >
> >   arith_done:
> > -     if (instr & 1)
> > +     if (word & 1)
> >               set_cr0(regs, op);
> >   compute_done:
> >       op->reg = rd;
> > diff --git a/arch/powerpc/lib/test_emulate_step.c
> > b/arch/powerpc/lib/test_emulate_step.c
> > index 486e057e5be1..d6275a9b8ce6 100644
> > --- a/arch/powerpc/lib/test_emulate_step.c
> > +++ b/arch/powerpc/lib/test_emulate_step.c
> > @@ -851,7 +851,7 @@ static int __init emulate_compute_instr(struct pt_regs
> > *regs,
> >
> >       if (analyse_instr(&op, regs, instr) != 1 ||
> >           GETTYPE(op.type) != COMPUTE) {
> > -             pr_info("emulation failed, instruction = 0x%08x\n", instr);
> > +             pr_info("emulation failed, instruction = 0x%08x\n",
> > ppc_inst_word(instr));
> >               return -EFAULT;
> >       }
> >
> > @@ -871,7 +871,7 @@ static int __init execute_compute_instr(struct pt_regs
> > *regs,
> >       /* Patch the NOP with the actual instruction */
> >       patch_instruction_site(&patch__exec_instr, instr);
> >       if (exec_instr(regs)) {
> > -             pr_info("execution failed, instruction = 0x%08x\n", instr);
> > +             pr_info("execution failed, instruction = 0x%08x\n",
> > ppc_inst_word(instr));
> >               return -EFAULT;
> >       }
> >
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index d045e583f1c9..dec522fa8201 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -2871,9 +2871,9 @@ generic_inst_dump(unsigned long adr, long count, int
> > praddr,
> >               dotted = 0;
> >               last_inst = inst;
> >               if (praddr)
> > -                     printf(REG"  %.8x", adr, inst);
> > +                     printf(REG"  %.8x", adr, ppc_inst_word(inst));
> >               printf("\t");
> > -             dump_func(inst, adr);
> > +             dump_func(ppc_inst_word(inst), adr);
> >               printf("\n");
> >       }
> >       return adr - first_adr;
>
