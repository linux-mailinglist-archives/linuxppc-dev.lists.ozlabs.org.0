Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 963FA19779B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 11:16:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rRf91wpczDqjW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 20:16:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ljvmPt3d; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rRbK730mzDqcT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 20:13:49 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id k9so15048431oia.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 02:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=edIh6G8L+GcxZ6zrtqTe/xk5j7vUM64aL3qrASG+ovk=;
 b=ljvmPt3dUL32fA0EHrSD6b+BbGl8z1lD9VMtBJTFBLdgdIxP8XOTc9NlLfFJrDn8KC
 j/2dENLz/bTpBpiKAc4tfuik6hOrX8hTb/FO4HRmPcuHGcCiFP5aJevcOCAUXI20Nn72
 y7c3TjJ392XEqoEHvITisRmyKKcUDgoYEANaivWBpOk7eIWkAeNhPWqqe9uCOVUTCXzV
 PM1+5ZsbosPL5hUNkTGK/j2rMUsK6uAz6AyhOmjkZxZAi18BRhGf0dUB60etdHNCXGzD
 TPOxgtnpER3mx6debgk2WMd3/3bGe/4n7fj4ZOrNP6iDMJ58+UBYQwRmh3X3e2gxGEUu
 WqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edIh6G8L+GcxZ6zrtqTe/xk5j7vUM64aL3qrASG+ovk=;
 b=Z2mmxybFetf0Qf01wH3p6AlbbZ6nfv18k907NEQ1stTBiSWXT/DQ0Rxa2/vcDaLYxU
 ZVUNZLo4l2JpA5+OYDX5vBzxsG5v/CfDHbANZuI+34qYDaDCRM8HXEBKqSYFq+80QXUk
 HSgUR51ukbkFVsCylugSmbdxrzRK81oWZYky/zWwKvjp4DFPSor2/SL0VGQNFuELBXjb
 kkM3nv3OxAMBqT5QH5UgJUC9dYplqGcjAvJvZO/Kp2iMzkbkyleklEQRVC7+Z0CQHbdt
 RUGV6KzSkNrjNOSskIZRLqm4RUpZMPQhn2sqqyvWIpEPJqgq9mppMVDLV3n+BrozEZFk
 WgYw==
X-Gm-Message-State: ANhLgQ0btz2klfW7y0SAtcesNq/1nY69CsCl0jncR7HvXMK5w77hJVPV
 GzU0FuCeS/2ENuvVg/4/BmWABdlk0fNNfYc3yfU=
X-Google-Smtp-Source: ADFU+vuhASwSz6u6Bz0Q8rDZsM2Hglf70gcbUHMjfqzPNzXH8aXn23oG68ig6R3GUwD0sLJd3swt/AvfrtmMOFsM4jY=
X-Received: by 2002:aca:f254:: with SMTP id q81mr6942032oih.12.1585559625869; 
 Mon, 30 Mar 2020 02:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-15-jniethe5@gmail.com>
 <4002965.g7YitYsn6A@townsend>
In-Reply-To: <4002965.g7YitYsn6A@townsend>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 30 Mar 2020 20:13:34 +1100
Message-ID: <CACzsE9pQhe=oPrvJUEi=vimSjFgAW3-f+R8_0p0etxS=rU+N8Q@mail.gmail.com>
Subject: Re: [PATCH v4 14/16] powerpc64: Add prefixed instructions to
 instruction data type
To: Alistair Popple <alistair@popple.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Balamuruhan S <bala24@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 30, 2020 at 8:05 PM Alistair Popple <alistair@popple.id.au> wrote:
>
> <snip>
>
> > @@ -487,12 +487,13 @@ int kprobe_post_handler(struct pt_regs *regs)
> >  {
> >       struct kprobe *cur = kprobe_running();
> >       struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
> > +     int len = ppc_inst_len(ppc_inst_read(cur->ainsn.insn));
>
> I am no kprobes expert but it seems based on the code here that in some
> circumstances it's ok/expected that cur == NULL, therefore the assignment
> needs to happen after the check below to avoid dereferencing NULL. At least
> this was the problem I was hitting when running some of the kernel selftests.
>
> - Alistair
>
> >       if (!cur || user_mode(regs))
> >               return 0;
Thank you for pointing that out. I'll move the assignment down here.
> >
> >       /* make sure we got here for instruction we have a kprobe on */
> > -     if (((unsigned long)cur->ainsn.insn + 4) != regs->nip)
> > +     if ((unsigned long)cur->ainsn.insn + len != regs->nip)
> >               return 0;
> >
> >       if ((kcb->kprobe_status != KPROBE_REENTER) && cur->post_handler) {
> > @@ -501,7 +502,7 @@ int kprobe_post_handler(struct pt_regs *regs)
> >       }
> >
> >       /* Adjust nip to after the single-stepped instruction */
> > -     regs->nip = (unsigned long)cur->addr + 4;
> > +     regs->nip = (unsigned long)cur->addr + len;
> >       regs->msr |= kcb->kprobe_saved_msr;
> >
> >       /*Restore back the original saved kprobes variables and continue. */
> > diff --git a/arch/powerpc/kernel/optprobes.c
> > b/arch/powerpc/kernel/optprobes.c index 5b53c373373b..af6761859fba 100644
> > --- a/arch/powerpc/kernel/optprobes.c
> > +++ b/arch/powerpc/kernel/optprobes.c
> > @@ -158,38 +158,38 @@ void patch_imm32_load_insns(unsigned int val,
> > kprobe_opcode_t *addr)
> >
> >  /*
> >   * Generate instructions to load provided immediate 64-bit value
> > - * to register 'r3' and patch these instructions at 'addr'.
> > + * to register 'reg' and patch these instructions at 'addr'.
> >   */
> > -void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
> > +void patch_imm64_load_insns(unsigned long val, int reg, kprobe_opcode_t
> > *addr) {
> > -     /* lis r3,(op)@highest */
> > -     patch_instruction(addr, PPC_INST(PPC_INST_ADDIS | ___PPC_RT(3) |
> > +     /* lis reg,(op)@highest */
> > +     patch_instruction(addr, PPC_INST(PPC_INST_ADDIS | ___PPC_RT(reg) |
> >                         ((val >> 48) & 0xffff)));
> >       addr++;
> >
> > -     /* ori r3,r3,(op)@higher */
> > -     patch_instruction(addr, PPC_INST(PPC_INST_ORI | ___PPC_RA(3) |
> > -                       ___PPC_RS(3) | ((val >> 32) & 0xffff)));
> > +     /* ori reg,reg,(op)@higher */
> > +     patch_instruction(addr, PPC_INST(PPC_INST_ORI | ___PPC_RA(reg) |
> > +                       ___PPC_RS(reg) | ((val >> 32) & 0xffff)));
> >       addr++;
> >
> > -     /* rldicr r3,r3,32,31 */
> > -     patch_instruction(addr, PPC_INST(PPC_INST_RLDICR | ___PPC_RA(3) |
> > -                       ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31)));
> > +     /* rldicr reg,reg,32,31 */
> > +     patch_instruction(addr, PPC_INST(PPC_INST_RLDICR | ___PPC_RA(reg) |
> > +                       ___PPC_RS(reg) | __PPC_SH64(32) | __PPC_ME64(31)));
> >       addr++;
> >
> > -     /* oris r3,r3,(op)@h */
> > -     patch_instruction(addr, PPC_INST(PPC_INST_ORIS | ___PPC_RA(3) |
> > -                       ___PPC_RS(3) | ((val >> 16) & 0xffff)));
> > +     /* oris reg,reg,(op)@h */
> > +     patch_instruction(addr, PPC_INST(PPC_INST_ORIS | ___PPC_RA(reg) |
> > +                       ___PPC_RS(reg) | ((val >> 16) & 0xffff)));
> >       addr++;
> >
> > -     /* ori r3,r3,(op)@l */
> > -     patch_instruction(addr, PPC_INST(PPC_INST_ORI | ___PPC_RA(3) |
> > -                       ___PPC_RS(3) | (val & 0xffff)));
> > +     /* ori reg,reg,(op)@l */
> > +     patch_instruction(addr, PPC_INST(PPC_INST_ORI | ___PPC_RA(reg) |
> > +                       ___PPC_RS(reg) | (val & 0xffff)));
> >  }
> >
> >  int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct
> > kprobe *p) {
> > -     ppc_inst branch_op_callback, branch_emulate_step;
> > +     ppc_inst branch_op_callback, branch_emulate_step, temp;
> >       kprobe_opcode_t *op_callback_addr, *emulate_step_addr, *buff;
> >       long b_offset;
> >       unsigned long nip, size;
> > @@ -239,7 +239,7 @@ int arch_prepare_optimized_kprobe(struct
> > optimized_kprobe *op, struct kprobe *p) * Fixup the template with
> > instructions to:
> >        * 1. load the address of the actual probepoint
> >        */
> > -     patch_imm64_load_insns((unsigned long)op, buff + TMPL_OP_IDX);
> > +     patch_imm64_load_insns((unsigned long)op, 3, buff + TMPL_OP_IDX);
> >
> >       /*
> >        * 2. branch to optimized_callback() and emulate_step()
> > @@ -268,7 +268,11 @@ int arch_prepare_optimized_kprobe(struct
> > optimized_kprobe *op, struct kprobe *p) /*
> >        * 3. load instruction to be emulated into relevant register, and
> >        */
> > -     patch_imm32_load_insns(*(unsigned int *)p->ainsn.insn, buff +
> > TMPL_INSN_IDX); +     temp = ppc_inst_read(p->ainsn.insn);
> > +     patch_imm64_load_insns(ppc_inst_word(temp) |
> > +                            ((u64)ppc_inst_suffix(temp) << 32),
> > +                            4,
> > +                            buff + TMPL_INSN_IDX);
> >
> >       /*
> >        * 4. branch back from trampoline
> > diff --git a/arch/powerpc/kernel/optprobes_head.S
> > b/arch/powerpc/kernel/optprobes_head.S index cf383520843f..ff8ba4d3824d
> > 100644
> > --- a/arch/powerpc/kernel/optprobes_head.S
> > +++ b/arch/powerpc/kernel/optprobes_head.S
> > @@ -94,6 +94,9 @@ optprobe_template_insn:
> >       /* 2, Pass instruction to be emulated in r4 */
> >       nop
> >       nop
> > +     nop
> > +     nop
> > +     nop
> >
> >       .global optprobe_template_call_emulate
> >  optprobe_template_call_emulate:
> > diff --git a/arch/powerpc/kernel/trace/ftrace.c
> > b/arch/powerpc/kernel/trace/ftrace.c index ad451205f268..3b8655f57b4a
> > 100644
> > --- a/arch/powerpc/kernel/trace/ftrace.c
> > +++ b/arch/powerpc/kernel/trace/ftrace.c
> > @@ -42,9 +42,24 @@
> >  static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
> >
> >  static long
> > -read_inst(ppc_inst *inst, const void *src)
> > +read_inst(ppc_inst *p, const void *src)
> >  {
> > -     return probe_kernel_read((void *)inst, src, MCOUNT_INSN_SIZE);
> > +     ppc_inst inst;
> > +     long err;
> > +
> > +     err = probe_kernel_read((void *)&inst.prefix,
> > +                             src, MCOUNT_INSN_SIZE);
> > +     if (err)
> > +             return err;
> > +
> > +     if (ppc_inst_prefixed(inst))
> > +             err = probe_kernel_read((void *)&inst.suffix,
> > +                                     src + 4, MCOUNT_INSN_SIZE);
> > +     if (err)
> > +             return err;
> > +
> > +     ppc_inst_write(p, inst);
> > +     return 0;
> >  }
> >
> >  static ppc_inst
> > diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> > index d1dff1dc3a11..3e4fbb5c1b1e 100644
> > --- a/arch/powerpc/kernel/uprobes.c
> > +++ b/arch/powerpc/kernel/uprobes.c
> > @@ -111,7 +111,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe,
> > struct pt_regs *regs) * support doesn't exist and have to fix-up the next
> > instruction * to be executed.
> >        */
> > -     regs->nip = utask->vaddr + MAX_UINSN_BYTES;
> > +     regs->nip = utask->vaddr + ppc_inst_len(ppc_inst_read(auprobe->insn));
> >
> >       user_disable_single_step(current);
> >       return 0;
> > diff --git a/arch/powerpc/lib/code-patching.c
> > b/arch/powerpc/lib/code-patching.c index fa7f32adf029..3b8277a64b8f 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -24,17 +24,27 @@ static int __patch_instruction(ppc_inst *exec_addr,
> > ppc_inst instr, {
> >       int err = 0;
> >
> > -     __put_user_asm(instr, patch_addr, err, "stw");
> > +     __put_user_asm(ppc_inst_word(instr), patch_addr, err, "stw");
> >       if (err)
> >               return err;
> >
> >       asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
> >                                                           "r" (exec_addr));
> >
> > +     if (!ppc_inst_prefixed(instr))
> > +             return 0;
> > +
> > +     __put_user_asm(ppc_inst_suffix(instr), patch_addr + 4, err, "stw");
> > +     if (err)
> > +             return err;
> > +
> > +     asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr + 4),
> > +                                                         "r" (exec_addr + 4));
> > +
> >       return 0;
> >  }
> >
> > -int raw_patch_instruction(ppc_inst *addr, ppc_inst instr)
> > +int raw_patch_instruction(void *addr, ppc_inst instr)
> >  {
> >       return __patch_instruction(addr, instr, addr);
> >  }
> > @@ -184,7 +194,7 @@ static int do_patch_instruction(ppc_inst *addr, ppc_inst
> > instr)
> >
> >  #endif /* CONFIG_STRICT_KERNEL_RWX */
> >
> > -int patch_instruction(unsigned int *addr, unsigned int instr)
> > +int patch_instruction(void *addr, ppc_inst instr)
> >  {
> >       /* Make sure we aren't patching a freed init section */
> >       if (init_mem_is_free && init_section_contains(addr, 4)) {
> > @@ -195,7 +205,7 @@ int patch_instruction(unsigned int *addr, unsigned int
> > instr) }
> >  NOKPROBE_SYMBOL(patch_instruction);
> >
> > -int patch_branch(ppc_inst *addr, unsigned long target, int flags)
> > +int patch_branch(void *addr, unsigned long target, int flags)
> >  {
> >       return patch_instruction(addr, create_branch(addr, target, flags));
> >  }
> > @@ -264,7 +274,7 @@ ppc_inst create_branch(const ppc_inst *addr,
> >       return instruction;
> >  }
> >
> > -unsigned int create_cond_branch(const unsigned int *addr,
> > +ppc_inst create_cond_branch(const void *addr,
> >                               unsigned long target, int flags)
> >  {
> >       ppc_inst instruction;
> > @@ -344,7 +354,7 @@ static unsigned long branch_bform_target(const ppc_inst
> > *instr) return (unsigned long)imm;
> >  }
> >
> > -unsigned long branch_target(const ppc_inst *instr)
> > +unsigned long branch_target(const void *instr)
> >  {
> >       if (instr_is_branch_iform(ppc_inst_read(instr)))
> >               return branch_iform_target(instr);
> > diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> > index bae878a83fa5..ab4c71c43c8c 100644
> > --- a/arch/powerpc/lib/sstep.c
> > +++ b/arch/powerpc/lib/sstep.c
> > @@ -1169,10 +1169,12 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs, unsigned long int imm;
> >       unsigned long int val, val2;
> >       unsigned int mb, me, sh;
> > -     unsigned int word;
> > +     unsigned int word, suffix;
> >       long ival;
> >
> >       word = ppc_inst_word(instr);
> > +     suffix = ppc_inst_suffix(instr);
> > +
> >       op->type = COMPUTE;
> >
> >       opcode = word >> 26;
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index ee084411f2f5..c5536e1a3356 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -110,7 +110,7 @@ struct bpt {
> >  #define BP_DABR              4
> >
> >  #define NBPTS        256
> > -#define BPT_WORDS    2
> > +#define BPT_WORDS    4
> >  static struct bpt bpts[NBPTS];
> >  static struct bpt dabr;
> >  static struct bpt *iabr;
> > @@ -118,12 +118,13 @@ static unsigned bpinstr = 0x7fe00008;   /* trap */
> >
> >  #define BP_NUM(bp)   ((bp) - bpts + 1)
> >
> > -static unsigned int __section(.text.xmon_bpts) bpt_table[NBPTS *
> > BPT_WORDS]; +static unsigned int __section(.text.xmon_bpts) bpt_table[NBPTS
> > * BPT_WORDS] __aligned(64);
> >
> >  /* Prototypes */
> >  static int cmds(struct pt_regs *);
> >  static int mread(unsigned long, void *, int);
> >  static int mwrite(unsigned long, void *, int);
> > +static int mread_instr(unsigned long, ppc_inst *);
> >  static int handle_fault(struct pt_regs *);
> >  static void byterev(unsigned char *, int);
> >  static void memex(void);
> > @@ -759,8 +760,8 @@ static int xmon_bpt(struct pt_regs *regs)
> >
> >       /* Are we at the trap at bp->instr[1] for some bp? */
> >       bp = in_breakpoint_table(regs->nip, &offset);
> > -     if (bp != NULL && offset == 4) {
> > -             regs->nip = bp->address + 4;
> > +     if (bp != NULL && (offset == 4 || offset == 8)) {
> > +             regs->nip = bp->address + offset;
> >               atomic_dec(&bp->ref_count);
> >               return 1;
> >       }
> > @@ -862,7 +863,7 @@ static struct bpt *in_breakpoint_table(unsigned long
> > nip, unsigned long *offp) if (off >= sizeof(bpt_table))
> >               return NULL;
> >       bp_off = off % (sizeof(unsigned int) * BPT_WORDS);
> > -     if (bp_off != 0 && bp_off != 4)
> > +     if (bp_off != 0 && bp_off != 4 && bp_off != 8)
> >               return NULL;
> >       *offp = bp_off;
> >       return bpts + ((off - bp_off) / (sizeof(unsigned int) * BPT_WORDS));
> > @@ -881,7 +882,6 @@ static struct bpt *new_breakpoint(unsigned long a)
> >               if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
> >                       bp->address = a;
> >                       bp->instr = bpt_table + ((bp - bpts) * BPT_WORDS);
> > -                     patch_instruction(bp->instr + 1, PPC_INST(bpinstr));
> >                       return bp;
> >               }
> >       }
> > @@ -900,7 +900,7 @@ static void insert_bpts(void)
> >       for (i = 0; i < NBPTS; ++i, ++bp) {
> >               if ((bp->enabled & (BP_TRAP|BP_CIABR)) == 0)
> >                       continue;
> > -             if (mread(bp->address, &instr, 4) != 4) {
> > +             if (!mread_instr(bp->address, &instr)) {
> >                       printf("Couldn't read instruction at %lx, "
> >                              "disabling breakpoint there\n", bp->address);
> >                       bp->enabled = 0;
> > @@ -913,9 +913,10 @@ static void insert_bpts(void)
> >                       continue;
> >               }
> >               patch_instruction(bp->instr, instr);
> > +             patch_instruction(bp->instr + ppc_inst_len(instr), PPC_INST(bpinstr));
> >               if (bp->enabled & BP_CIABR)
> >                       continue;
> > -             if (patch_instruction((ppc_inst *)bp->address,
> > +             if (patch_instruction((void *)bp->address,
> >                                                       PPC_INST(bpinstr)) != 0) {
> >                       printf("Couldn't write instruction at %lx, "
> >                              "disabling breakpoint there\n", bp->address);
> > @@ -950,7 +951,7 @@ static void remove_bpts(void)
> >       for (i = 0; i < NBPTS; ++i, ++bp) {
> >               if ((bp->enabled & (BP_TRAP|BP_CIABR)) != BP_TRAP)
> >                       continue;
> > -             if (mread(bp->address, &instr, 4) == 4
> > +             if (mread_instr(bp->address, &instr)
> >                   && ppc_inst_equal(instr, PPC_INST(bpinstr))
> >                   && patch_instruction(
> >                       (ppc_inst *)bp->address, ppc_inst_read(bp->instr)) != 0)
> > @@ -1166,7 +1167,7 @@ static int do_step(struct pt_regs *regs)
> >       force_enable_xmon();
> >       /* check we are in 64-bit kernel mode, translation enabled */
> >       if ((regs->msr & (MSR_64BIT|MSR_PR|MSR_IR)) == (MSR_64BIT|MSR_IR)) {
> > -             if (mread(regs->nip, &instr, 4) == 4) {
> > +             if (mread_instr(regs->nip, &instr)) {
> >                       stepped = emulate_step(regs, instr);
> >                       if (stepped < 0) {
> >                               printf("Couldn't single-step %s instruction\n",
> > @@ -1333,7 +1334,7 @@ static long check_bp_loc(unsigned long addr)
> >               printf("Breakpoints may only be placed at kernel addresses\n");
> >               return 0;
> >       }
> > -     if (!mread(addr, &instr, sizeof(instr))) {
> > +     if (!mread_instr(addr, &instr)) {
> >               printf("Can't read instruction at address %lx\n", addr);
> >               return 0;
> >       }
> > @@ -2126,6 +2127,21 @@ mwrite(unsigned long adrs, void *buf, int size)
> >       return n;
> >  }
> >
> > +static int
> > +mread_instr(unsigned long adrs, ppc_inst *instr)
> > +{
> > +     if (setjmp(bus_error_jmp) == 0) {
> > +             catch_memory_errors = 1;
> > +             sync();
> > +             *instr = ppc_inst_read((void *)adrs);
> > +             sync();
> > +             /* wait a little while to see if we get a machine check */
> > +             __delay(200);
> > +     }
> > +     catch_memory_errors = 0;
> > +     return ppc_inst_len(*instr);
> > +}
> > +
> >  static int fault_type;
> >  static int fault_except;
> >  static char *fault_chars[] = { "--", "**", "##" };
>
>
>
