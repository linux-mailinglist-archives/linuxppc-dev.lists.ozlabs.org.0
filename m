Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9294190239
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 00:47:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mWJx09VVzDqyh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 10:47:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lrL/kIS4; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mWH13xb5zDqn5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 10:46:05 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id 22so9893938otf.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 16:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g4b2UUm/4l4ue6e40pUCaxB8QhJBKSUqn+Okuedd8JM=;
 b=lrL/kIS4JMgEKyyfmS6iUAJ1noCH6WOGhDWzeNOKu53LDAS3PA8oyalJ67X9rgdczX
 mownHR2AzUV0eplouzugQx2xad3zqjLwr98jAdgmQIECcpWmygLaAikkD4xKQJ/Ude+D
 PRH8QGm9WWve8u8nu2cO3YH6RQeGSeckao05V9O0t6yvFcaVT38xax+Fu+3Qf16UIOVj
 h731gGKXe5h4jLfe3/DwsaYNqNSPNX6HzS1CxDATVCoSOI5C9E9gkbPkllsefQ/t0Zmn
 HRQr8AIKTAqCxvfR/+UvEmt7bs7vzGOFfKDnzd1AWaf/DCntVCyDuhqlDXEyTBtcw1lz
 D1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4b2UUm/4l4ue6e40pUCaxB8QhJBKSUqn+Okuedd8JM=;
 b=C3oX7kEKrAw7kYF22R4VusFxGGxkfaA1/+UOMIV0yP3Bn13ya9nP47cizk1UJSSyhG
 oq1QN/3wDQ5ctDR1ahxXAS/0/udFTSIcmJU3Z9JEl8WEjBR3MHco/8Zo4DxLw2c+yV9r
 FKSIm15bDByCQU3XpI3oxiX5kBf/ayOoIyHf2AeCXEQyRoiiu3NZ0dhromjyR/KTaMNL
 NnLciLR6050KI4uwUvlmgWGAqPVlY+Ky/17Tvr8RVBh3KO9Pewm8MX9Y1RB3MUW1FGxb
 r+VrvR+NrL7vOW9CFEbTLppPtDVuhM8J5nUJFPnur7H/I62OQoN+R9lJIRXHHz3PRDew
 MQRQ==
X-Gm-Message-State: ANhLgQ2tEKnKT9CHkxCF4mG3DYAdMCvrZa5XDGhIuP6d8kv5LRCP9w75
 Yr4qfNqAu213AOpKF5IHSxM5RM4qpd7e4TRr5j8=
X-Google-Smtp-Source: ADFU+vubc9LXXdQzL1CQ4DyR7BCZWhDjnS1F3BBAOHJgtYzs2fP+lXqyEL1ZiH8APoqy8MVz7HxHE7am3XAb+kE0Sjk=
X-Received: by 2002:a05:6830:1683:: with SMTP id
 k3mr9909482otr.28.1585007161958; 
 Mon, 23 Mar 2020 16:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-15-jniethe5@gmail.com>
 <1584947189.oay6araq0n.astroid@bobo.none>
In-Reply-To: <1584947189.oay6araq0n.astroid@bobo.none>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 24 Mar 2020 10:45:50 +1100
Message-ID: <CACzsE9rbxV6HErxhwseMEJu7APezvRu4pKOx5YkepEnUWtpzqw@mail.gmail.com>
Subject: Re: [PATCH v4 14/16] powerpc64: Add prefixed instructions to
 instruction data type
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Balamuruhan S <bala24@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 6:37 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Jordan Niethe's on March 20, 2020 3:18 pm:
> > For powerpc64, redefine the ppc_inst type so both word and prefixed
> > instructions can be represented. On powerpc32 the type will remain the
> > same.  Update places which had assumed instructions to be 4 bytes long.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v4: New to series
> > ---
> >  arch/powerpc/include/asm/code-patching.h | 10 +--
> >  arch/powerpc/include/asm/inst.h          | 90 ++++++++++++++++++++++++
> >  arch/powerpc/include/asm/kprobes.h       |  2 +-
> >  arch/powerpc/include/asm/sstep.h         |  4 ++
> >  arch/powerpc/include/asm/uaccess.h       | 22 ++++++
> >  arch/powerpc/include/asm/uprobes.h       |  2 +-
> >  arch/powerpc/kernel/align.c              |  5 +-
> >  arch/powerpc/kernel/hw_breakpoint.c      |  2 +-
> >  arch/powerpc/kernel/kprobes.c            |  7 +-
> >  arch/powerpc/kernel/optprobes.c          | 42 ++++++-----
> >  arch/powerpc/kernel/optprobes_head.S     |  3 +
> >  arch/powerpc/kernel/trace/ftrace.c       | 19 ++++-
> >  arch/powerpc/kernel/uprobes.c            |  2 +-
> >  arch/powerpc/lib/code-patching.c         | 22 ++++--
> >  arch/powerpc/lib/sstep.c                 |  4 +-
> >  arch/powerpc/xmon/xmon.c                 | 38 +++++++---
> >  16 files changed, 221 insertions(+), 53 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
> > index 68bd9db334bd..bd41e1558707 100644
> > --- a/arch/powerpc/include/asm/code-patching.h
> > +++ b/arch/powerpc/include/asm/code-patching.h
> > @@ -25,11 +25,11 @@
> >  bool is_offset_in_branch_range(long offset);
> >  ppc_inst create_branch(const ppc_inst *addr,
> >                          unsigned long target, int flags);
> > -unsigned int create_cond_branch(const ppc_inst *addr,
> > +ppc_inst create_cond_branch(const void *addr,
> >                               unsigned long target, int flags);
> > -int patch_branch(ppc_inst *addr, unsigned long target, int flags);
> > -int patch_instruction(ppc_inst *addr, ppc_inst instr);
> > -int raw_patch_instruction(ppc_inst *addr, ppc_inst instr);
> > +int patch_branch(void *addr, unsigned long target, int flags);
> > +int patch_instruction(void *addr, ppc_inst instr);
> > +int raw_patch_instruction(void *addr, ppc_inst instr);
> >
> >  static inline unsigned long patch_site_addr(s32 *site)
> >  {
> > @@ -60,7 +60,7 @@ static inline int modify_instruction_site(s32 *site, unsigned int clr, unsigned
> >  int instr_is_relative_branch(ppc_inst instr);
> >  int instr_is_relative_link_branch(ppc_inst instr);
> >  int instr_is_branch_to_addr(const ppc_inst *instr, unsigned long addr);
> > -unsigned long branch_target(const ppc_inst *instr);
> > +unsigned long branch_target(const void *instr);
> >  ppc_inst translate_branch(const ppc_inst *dest,
> >                             const ppc_inst *src);
> >  extern bool is_conditional_branch(ppc_inst instr);
> > diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> > index 7c8596ee411e..1a40b0a71128 100644
> > --- a/arch/powerpc/include/asm/inst.h
> > +++ b/arch/powerpc/include/asm/inst.h
> > @@ -6,6 +6,95 @@
> >   * Instruction data type for POWER
> >   */
> >
> > +#ifdef __powerpc64__
> > +
> > +typedef struct ppc_inst {
> > +     union {
> > +             struct {
> > +                     u32 word;
> > +                     u32 pad;
> > +             } __packed;
> > +             struct {
> > +                     u32 prefix;
> > +                     u32 suffix;
> > +             } __packed;
> > +     };
> > +} ppc_inst;
> > +
> > +#define PPC_INST(x) ((ppc_inst) { .word = (x), .pad = 0 })
> > +#define PPC_INST_PREFIXED(x, y) ((ppc_inst) { .prefix = (x), .suffix = (y) })
> > +
> > +static inline int ppc_inst_opcode(ppc_inst x)
> > +{
> > +     return x.word >> 26;
> > +}
> > +
> > +static inline bool ppc_inst_prefixed(ppc_inst x) {
> > +     return ppc_inst_opcode(x) == 1;
> > +}
> > +
> > +static inline int ppc_inst_len(ppc_inst x)
> > +{
> > +     if (ppc_inst_prefixed(x))
> > +             return 8;
> > +     else
> > +             return 4;
> > +}
> > +
> > +static inline u32 ppc_inst_word(ppc_inst x)
> > +{
> > +     return x.word;
> > +}
>
> I guess a concern could be that code using ppc_inst_word could now get a
> prefix unexpectedly and not handle it properly. The reason it should
> generally be okay is that prefix won't match any existing valid
> instruction words, so callers won't match or think it's an unknown
> instruction. Am I right? Possibly a small comment?
Yes all prefixes are illegal as word instructions so I thought that
should be okay.
>
> > +
> > +static inline u32 ppc_inst_prefix(ppc_inst x)
> > +{
> > +     return x.prefix;
> > +}
> > +
> > +static inline u32 ppc_inst_suffix(ppc_inst x)
> > +{
> > +     return x.suffix;
> > +}
> > +
> > +
> > +static inline ppc_inst ppc_inst_read(const void *ptr)
> > +{
> > +     ppc_inst inst;
> > +     inst.word = *(u32 *)ptr;
> > +     if (ppc_inst_prefixed(inst))
> > +             inst.suffix = *((u32 *)ptr + 1);
> > +     else
> > +             inst.pad = 0;
>
> I'm a bit against using partially constructed opaque type for things
> like this, even if it is in the code that knows about the type. We
> could modify ppc_inst_prefixed() to assert that pad is equal to zero
> (or some poisoned value) if it's not prefixed. Or do some validation
> on the suffix if it is.
Okay what about something like:
+static inline ppc_inst ppc_inst_read(const void *ptr)
+{
+     u32 prefix, suffix;
+     prefix = *(u32 *)ptr;
+     if (prefix >> 26 == 1)
+             suffix = *((u32 *)ptr + 1);
+     else
+             suffix = 0;
+     return PPC_INST_PREFIX(prefix, suffix);
+}

>
>
>
> > +static inline bool ppc_inst_equal(ppc_inst x, ppc_inst y)
> > +{
> > +     return !memcmp(&x, &y, sizeof(struct ppc_inst));
> > +}
>
> I guess a variable length memcmp will make terrible code, so you're
> requiring pad to equal 0 to match non-prefixed. Fine.
Yes this assumes pad always gets set to 0.
>
> > +
> > +static inline bool ppc_inst_null(ppc_inst x)
> > +{
> > +     return x.word == 0 && x.pad == 0;
> > +}
>
> In this case you shouldn't need x.pad == 0. If x.word == 0, then
> WARN_ON_ONCE(x.pad != 0) ?
True.
>
> >       if ((regs->msr & MSR_LE) != (MSR_KERNEL & MSR_LE)) {
> >               /* We don't handle PPC little-endian any more... */
> >               if (cpu_has_feature(CPU_FTR_PPC_LE))
> >                       return -EIO;
> > -             instr = PPC_INST(swab32(ppc_inst_word(instr)));
> > +             instr = PPC_INST_PREFIXED(swab32(ppc_inst_word(instr)),
> > +                                       swab32(ppc_inst_suffix(instr)));
>
> Ugly, don't suppose you'd bother to do a ppc_inst_bswap function for
> this one case?
I can do that.
>
> [snip probes stuff]
>
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> > index fa7f32adf029..3b8277a64b8f 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -24,17 +24,27 @@ static int __patch_instruction(ppc_inst *exec_addr, ppc_inst instr,
> >  {
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
>
> Although there's proably no real performance or atomicity issues here,
> I'd be pleased if we could do a case for prefixed and a case for non
> prefixed, and store the non-prefixed with "std". Just for the principle
> of not having half-written instructions in the image.
Do you mean store the prefixed with std?
>
> You could skip the dcbst and icbi for the second address if you happen
> to know this future CPU does not store prefix insns across a CL
> boundary. But probably not necessary to make that assumption in non
> perf critical code here, so I'd leave it as you have.
>
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
>
> (2 * sizeof(ppc_inst) / sizeof(u32)) ?

>
> >  static struct bpt bpts[NBPTS];
> >  static struct bpt dabr;
> >  static struct bpt *iabr;
> > @@ -118,12 +118,13 @@ static unsigned bpinstr = 0x7fe00008;   /* trap */
> >
> >  #define BP_NUM(bp)   ((bp) - bpts + 1)
> >
> > -static unsigned int __section(.text.xmon_bpts) bpt_table[NBPTS * BPT_WORDS];
> > +static unsigned int __section(.text.xmon_bpts) bpt_table[NBPTS * BPT_WORDS] __aligned(64);
>
> Should have a define somewhere for this magical 64.
Sure.
>
> >  /* Prototypes */
> >  static int cmds(struct pt_regs *);
> >  static int mread(unsigned long, void *, int);
> >  static int mwrite(unsigned long, void *, int);
> > +static int mread_instr(unsigned long, ppc_inst *);
>
> In some cases you've addd helpers like this as separate patches,
> others you've bundled them together. NBD but I liked the prep patches
> which then made the more important changes easier to see.
I will make some more prep patches.
>
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
> > @@ -862,7 +863,7 @@ static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long *offp)
> >       if (off >= sizeof(bpt_table))
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
>
> Why is this okay to remove?
When we only had word instructions the bpt was just patched in here
once and that was that.
With prefixed instructions bp->instr + 1 might be the suffix. So I
moved putting the breakpoint to insert_bpts():
patch_instruction(bp->instr + ppc_inst_len(instr), PPC_INST(bpinstr));
>
> Thanks,
> Nick
>
