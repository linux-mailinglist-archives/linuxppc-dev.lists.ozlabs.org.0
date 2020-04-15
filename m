Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 536891A9203
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 06:43:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4928ql18YvzDqSL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 14:43:15 +1000 (AEST)
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
 header.s=20161025 header.b=XoeICBmS; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4928mx3S3QzDr0p
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 14:40:48 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id 8so2245611oiy.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 21:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A5TRyvk8So/PGg0S3Gi0JWFno+7dBGIlyIPnNersGg0=;
 b=XoeICBmSaIoVDDnLmnJOprR0RYPSyEq86LCoMEtTd4tmxTuRo6xcSqPW0/9lz+1XEL
 mXjA4/XUCOHGCUzOC8T22R8w1M++MgGaz/1PS++HIWLkvtGcs6j2ZglRZ+bC7GyL+YL2
 soUCvEJsYY7/IB4SemiJx5hYAXArfpIgFDLf/182eeroSGm40yht4pfKSag44dNfeKJu
 z6SSEy23e7WJzuBrOOxYvwgMatgVghRDdst0meroBWnyTUlj2v2ZK6/n1UCr4pcGetJ+
 X03DQbkpsyxxWIQTuZwAL1/fWDOqsOPSdvrnr2gm7fS+M6Ifgo7LI1WnoExvGJxAp44R
 ejWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A5TRyvk8So/PGg0S3Gi0JWFno+7dBGIlyIPnNersGg0=;
 b=tF0W1wo+PY6IVSXKDJdFXOVLXyVflu5re/5Xzlq6k90fxK1MA6+OgWhf9d7GbHFGtE
 h0RHJBftxZ5OJj0Gd7rvnoHIn6ZWfKhz2YACqTj8YaYyDxoiC6ZCmPupj4u4Id67rYLB
 1+imiFO82/vOS2qHXo5hWGle6sYDbknuSwoi0HUNXGJKiNAeTncxXUjVvlSzvt5AY21w
 c8vz2n2SmgdU3FF99OZ7CpHtB8Rk0qnSga8WHlE5gG/RX/LAzYdZhFvh5r5M+YhQIE2v
 J1X95yF/YdAcVS83letyDvu31Ox4JuCIrIUaFQIopta8cGmw8BMgJrZXwpoN4B4CbeaT
 NAXQ==
X-Gm-Message-State: AGi0PuaPb4Lz52VaszNgkEBw0DRXDN8qDJ/PEQLXh6eJNMKF9pFxjn4q
 iVxZenj9igMpI/4p5XF6Y5CzzMFVroC1eapJgRAPBg==
X-Google-Smtp-Source: APiQypJe+carjN9y4r8tqeIr/7B0wElv9hnYDbWBeg3eic01U2khQ888UT2hcF6kDH6Fc0/QGDCq7p4wGEcmRdtXyT4=
X-Received: by 2002:aca:d6c1:: with SMTP id
 n184mr16028893oig.126.1586925645270; 
 Tue, 14 Apr 2020 21:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-19-jniethe5@gmail.com>
 <435c17d3180d560a723efcae42de351ae7152cb3.camel@linux.ibm.com>
In-Reply-To: <435c17d3180d560a723efcae42de351ae7152cb3.camel@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 15 Apr 2020 14:40:32 +1000
Message-ID: <CACzsE9rc+g5eWko0RQdhbvWpPXUwORdKVU8Za2650ROoZAjBdg@mail.gmail.com>
Subject: Re: [PATCH v5 18/21] powerpc64: Add prefixed instructions to
 instruction data type
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

On Mon, Apr 13, 2020 at 10:04 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
>
> On Mon, 2020-04-06 at 18:09 +1000, Jordan Niethe wrote:
> > For powerpc64, redefine the ppc_inst type so both word and prefixed
> > instructions can be represented. On powerpc32 the type will remain the
> > same.  Update places which had assumed instructions to be 4 bytes long.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v4: New to series
> > v5:  - Distinguish normal instructions from prefixed instructions with a
> >        0xff marker for the suffix.
> >      - __patch_instruction() using std for prefixed instructions
> > ---
> >  arch/powerpc/include/asm/inst.h      | 71 ++++++++++++++++++++++++++--
> >  arch/powerpc/include/asm/kprobes.h   |  2 +-
> >  arch/powerpc/include/asm/uaccess.h   | 31 ++++++++++--
> >  arch/powerpc/include/asm/uprobes.h   |  2 +-
> >  arch/powerpc/kernel/optprobes.c      | 42 ++++++++--------
> >  arch/powerpc/kernel/optprobes_head.S |  3 ++
> >  arch/powerpc/kernel/trace/ftrace.c   | 26 +++++++++-
> >  arch/powerpc/lib/code-patching.c     | 19 +++++---
> >  arch/powerpc/lib/feature-fixups.c    |  5 +-
> >  arch/powerpc/lib/sstep.c             |  4 +-
> >  arch/powerpc/xmon/xmon.c             |  6 +--
> >  arch/powerpc/xmon/xmon_bpts.S        |  4 +-
> >  12 files changed, 171 insertions(+), 44 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/inst.h
> > b/arch/powerpc/include/asm/inst.h
> > index 70b37a35a91a..7e23e7146c66 100644
> > --- a/arch/powerpc/include/asm/inst.h
> > +++ b/arch/powerpc/include/asm/inst.h
> > @@ -8,23 +8,67 @@
> >
> >  struct ppc_inst {
> >          u32 val;
> > +#ifdef __powerpc64__
> > +        u32 suffix;
> > +#endif /* __powerpc64__ */
> >  } __packed;
> >
> > -#define ppc_inst(x) ((struct ppc_inst){ .val = x })
> > +static inline int ppc_inst_opcode(struct ppc_inst x)
> > +{
> > +     return x.val >> 26;
>
>
> why don't we wrap here and in `ppc_inst_opcode()` in patch 9 using
> `ppc_inst_val()` ?
Will do.
>
>
> > +}
> >
> >  static inline u32 ppc_inst_val(struct ppc_inst x)
>
>
> There is another same definition below for the same function in
> #else part of __powerpc64__ ifdef.
Thanks
>
>
> >  {
> >       return x.val;
> >  }
> >
> > -static inline bool ppc_inst_len(struct ppc_inst x)
> > +#ifdef __powerpc64__
> > +#define ppc_inst(x) ((struct ppc_inst){ .val = (x), .suffix = 0xff })
> > +
> > +#define ppc_inst_prefix(x, y) ((struct ppc_inst){ .val = (x), .suffix = (y)
> > })
> > +
> > +static inline u32 ppc_inst_suffix(struct ppc_inst x)
> >  {
> > -     return sizeof(struct ppc_inst);
> > +     return x.suffix;
> >  }
> >
> > -static inline int ppc_inst_opcode(struct ppc_inst x)
> > +static inline bool ppc_inst_prefixed(struct ppc_inst x) {
> > +     return ((ppc_inst_val(x) >> 26) == 1) && ppc_inst_suffix(x) != 0xff;
> > +}
> > +
> > +static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
> >  {
> > -     return x.val >> 26;
> > +     return ppc_inst_prefix(swab32(ppc_inst_val(x)),
> > +                            swab32(ppc_inst_suffix(x)));
> > +}
> > +
> > +static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
> > +{
> > +     u32 val, suffix = 0xff;
> > +     val = *(u32 *)ptr;
> > +     if ((val >> 26) == 1)
> > +             suffix = *((u32 *)ptr + 1);
> > +     return ppc_inst_prefix(val, suffix);
> > +}
> > +
> > +static inline void ppc_inst_write(struct ppc_inst *ptr, struct ppc_inst x)
> > +{
> > +     if (ppc_inst_prefixed(x)) {
> > +             *(u32 *)ptr = x.val;
> > +             *((u32 *)ptr + 1) = x.suffix;
> > +     } else {
> > +             *(u32 *)ptr = x.val;
>
>
> can we wrap here as well with `ppc_inst_val()` and `ppc_inst_suffix()` ?
Yeah no reason not too.
>
>
> > +     }
> > +}
> > +
> > +#else
> > +
> > +#define ppc_inst(x) ((struct ppc_inst){ .val = x })
> > +
> > +static inline bool ppc_inst_prefixed(ppc_inst x)
> > +{
> > +     return 0;
>
>
> Is it return !!0 or return false ?
False probably will make more sense.
>
>
> >  }
> >
> >  static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
> > @@ -32,14 +76,31 @@ static inline struct ppc_inst ppc_inst_swab(struct
> > ppc_inst x)
> >       return ppc_inst(swab32(ppc_inst_val(x)));
> >  }
> >
> > +static inline u32 ppc_inst_val(struct ppc_inst x)
>
>
> [...] duplicate definition that is defined outside __powerpc64__ above.
>
>
> > +{
> > +     return x.val;
> > +}
> > +
> >  static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
> >  {
> >       return *ptr;
> >  }
> >
> > +static inline void ppc_inst_write(struct ppc_inst *ptr, struct ppc_inst x)
> > +{
> > +     *ptr = x;
> > +}
> > +
> > +#endif /* __powerpc64__ */
> > +
> >  static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
> >  {
> >       return !memcmp(&x, &y, sizeof(struct ppc_inst));
> >  }
> >
> > +static inline int ppc_inst_len(struct ppc_inst x)
> > +{
> > +     return (ppc_inst_prefixed(x)) ? 8  : 4;
> > +}
> > +
> >  #endif /* _ASM_INST_H */
> > diff --git a/arch/powerpc/include/asm/kprobes.h
> > b/arch/powerpc/include/asm/kprobes.h
> > index 66b3f2983b22..4fc0e15e23a5 100644
> > --- a/arch/powerpc/include/asm/kprobes.h
> > +++ b/arch/powerpc/include/asm/kprobes.h
> > @@ -43,7 +43,7 @@ extern kprobe_opcode_t optprobe_template_ret[];
> >  extern kprobe_opcode_t optprobe_template_end[];
> >
> >  /* Fixed instruction size for powerpc */
> > -#define MAX_INSN_SIZE                1
> > +#define MAX_INSN_SIZE                2
> >  #define MAX_OPTIMIZED_LENGTH sizeof(kprobe_opcode_t) /* 4 bytes */
> >  #define MAX_OPTINSN_SIZE     (optprobe_template_end -
> > optprobe_template_entry)
> >  #define RELATIVEJUMP_SIZE    sizeof(kprobe_opcode_t) /* 4 bytes */
> > diff --git a/arch/powerpc/include/asm/uaccess.h
> > b/arch/powerpc/include/asm/uaccess.h
> > index c0a35e4586a5..5a3f486ddf02 100644
> > --- a/arch/powerpc/include/asm/uaccess.h
> > +++ b/arch/powerpc/include/asm/uaccess.h
> > @@ -105,11 +105,34 @@ static inline int __access_ok(unsigned long addr,
> > unsigned long size,
> >  #define __put_user_inatomic(x, ptr) \
> >       __put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
> >
> > -#define __get_user_instr(x, ptr) \
> > -     __get_user_nocheck((x).val, (u32 *)(ptr), sizeof(u32), true)
> > +#define __get_user_instr(x, ptr)                     \
> > +({                                                   \
> > +     long __gui_ret = 0;                             \
> > +     unsigned int prefix, suffix;                    \
> > +     __gui_ret = __get_user(prefix, (unsigned int __user *)ptr);
> > \
> > +     if (!__gui_ret && (prefix >> 26) == 1) {        \
> > +             __gui_ret = __get_user(suffix, (unsigned int __user *)ptr + 1);
> >       \
> > +             (x) = ppc_inst_prefix(prefix, suffix);  \
> > +     } else {                                        \
> > +             (x) = ppc_inst(prefix);                 \
> > +     }                                               \
> > +     __gui_ret;                                      \
> > +})
> > +
> > +#define __get_user_instr_inatomic(x, ptr)            \
> > +({                                                   \
> > +     long __gui_ret = 0;                             \
> > +     unsigned int prefix, suffix;                    \
> > +     __gui_ret = __get_user_inatomic(prefix, (unsigned int __user *)ptr);
> >       \
> > +     if (!__gui_ret && (prefix >> 26) == 1) {        \
> > +             __gui_ret = __get_user_inatomic(suffix, (unsigned int __user
> > *)ptr + 1);   \
> > +             (x) = ppc_inst_prefix(prefix, suffix);  \
> > +     } else {                                        \
> > +             (x) = ppc_inst(prefix);                 \
> > +     }                                               \
> > +     __gui_ret;                                      \
> > +})
> >
> > -#define __get_user_instr_inatomic(x, ptr) \
> > -     __get_user_nosleep((x).val, (u32 *)(ptr), sizeof(u32))
> >  extern long __put_user_bad(void);
> >
> >  /*
> > diff --git a/arch/powerpc/include/asm/uprobes.h
> > b/arch/powerpc/include/asm/uprobes.h
> > index 7e3b329ba2d3..5bf65f5d44a9 100644
> > --- a/arch/powerpc/include/asm/uprobes.h
> > +++ b/arch/powerpc/include/asm/uprobes.h
> > @@ -15,7 +15,7 @@
> >
> >  typedef ppc_opcode_t uprobe_opcode_t;
> >
> > -#define MAX_UINSN_BYTES              4
> > +#define MAX_UINSN_BYTES              8
> >  #define UPROBE_XOL_SLOT_BYTES        (MAX_UINSN_BYTES)
> >
> >  /* The following alias is needed for reference from arch-agnostic code */
> > diff --git a/arch/powerpc/kernel/optprobes.c
> > b/arch/powerpc/kernel/optprobes.c
> > index 684640b8fa2e..689daf430161 100644
> > --- a/arch/powerpc/kernel/optprobes.c
> > +++ b/arch/powerpc/kernel/optprobes.c
> > @@ -159,38 +159,38 @@ void patch_imm32_load_insns(unsigned int val,
> > kprobe_opcode_t *addr)
> >
> >  /*
> >   * Generate instructions to load provided immediate 64-bit value
> > - * to register 'r3' and patch these instructions at 'addr'.
> > + * to register 'reg' and patch these instructions at 'addr'.
> >   */
> > -void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
> > +void patch_imm64_load_insns(unsigned long val, int reg, kprobe_opcode_t
> > *addr)
> >  {
> > -     /* lis r3,(op)@highest */
> > -     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ADDIS |
> > ___PPC_RT(3) |
> > +     /* lis reg,(op)@highest */
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ADDIS |
> > ___PPC_RT(reg) |
> >                         ((val >> 48) & 0xffff)));
> >       addr++;
> >
> > -     /* ori r3,r3,(op)@higher */
> > -     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > ___PPC_RA(3) |
> > -                       ___PPC_RS(3) | ((val >> 32) & 0xffff)));
> > +     /* ori reg,reg,(op)@higher */
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > ___PPC_RA(reg) |
> > +                       ___PPC_RS(reg) | ((val >> 32) & 0xffff)));
> >       addr++;
> >
> > -     /* rldicr r3,r3,32,31 */
> > -     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_RLDICR |
> > ___PPC_RA(3) |
> > -                       ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31)));
> > +     /* rldicr reg,reg,32,31 */
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_RLDICR |
> > ___PPC_RA(reg) |
> > +                       ___PPC_RS(reg) | __PPC_SH64(32) | __PPC_ME64(31)));
> >       addr++;
> >
> > -     /* oris r3,r3,(op)@h */
> > -     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORIS |
> > ___PPC_RA(3) |
> > -                       ___PPC_RS(3) | ((val >> 16) & 0xffff)));
> > +     /* oris reg,reg,(op)@h */
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORIS |
> > ___PPC_RA(reg) |
> > +                       ___PPC_RS(reg) | ((val >> 16) & 0xffff)));
> >       addr++;
> >
> > -     /* ori r3,r3,(op)@l */
> > -     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > ___PPC_RA(3) |
> > -                       ___PPC_RS(3) | (val & 0xffff)));
> > +     /* ori reg,reg,(op)@l */
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > ___PPC_RA(reg) |
> > +                       ___PPC_RS(reg) | (val & 0xffff)));
> >  }
> >
> >  int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe
> > *p)
> >  {
> > -     struct ppc_inst branch_op_callback, branch_emulate_step;
> > +     struct ppc_inst branch_op_callback, branch_emulate_step, temp;
> >       kprobe_opcode_t *op_callback_addr, *emulate_step_addr, *buff;
> >       long b_offset;
> >       unsigned long nip, size;
> > @@ -240,7 +240,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe
> > *op, struct kprobe *p)
> >        * Fixup the template with instructions to:
> >        * 1. load the address of the actual probepoint
> >        */
> > -     patch_imm64_load_insns((unsigned long)op, buff + TMPL_OP_IDX);
> > +     patch_imm64_load_insns((unsigned long)op, 3, buff + TMPL_OP_IDX);
> >
> >       /*
> >        * 2. branch to optimized_callback() and emulate_step()
> > @@ -271,7 +271,11 @@ int arch_prepare_optimized_kprobe(struct
> > optimized_kprobe *op, struct kprobe *p)
> >       /*
> >        * 3. load instruction to be emulated into relevant register, and
> >        */
> > -     patch_imm32_load_insns(*p->ainsn.insn, buff + TMPL_INSN_IDX);
> > +     temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
> > +     patch_imm64_load_insns(ppc_inst_val(temp) |
> > +                            ((u64)ppc_inst_suffix(temp) << 32),
>
>
> did we check building for ppc32 ?
Yeah I need to do so.
>
> I doubt we might hit build failure as `ppc_inst_suffix()` macro is not defined.
>
>
> > +                            4,
> > +                            buff + TMPL_INSN_IDX);
> >
> >       /*
> >        * 4. branch back from trampoline
> > diff --git a/arch/powerpc/kernel/optprobes_head.S
> > b/arch/powerpc/kernel/optprobes_head.S
> > index cf383520843f..ff8ba4d3824d 100644
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
> > b/arch/powerpc/kernel/trace/ftrace.c
> > index e78742613b36..16041a5c86d5 100644
> > --- a/arch/powerpc/kernel/trace/ftrace.c
> > +++ b/arch/powerpc/kernel/trace/ftrace.c
> > @@ -41,11 +41,35 @@
> >  #define      NUM_FTRACE_TRAMPS       8
> >  static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
> >
> > +#ifdef __powerpc64__
> >  static long
> >  probe_kernel_read_inst(struct ppc_inst *inst, const void *src)
> >  {
> > -     return probe_kernel_read((void *)inst, src, MCOUNT_INSN_SIZE);
> > +     u32 val, suffix = 0;
>
>
> don't we need to initialize suffix with 0xff ?
Good catch, that was causing problems.
>
>
> > +     long err;
> > +
> > +     err = probe_kernel_read((void *)&val,
> > +                             src, sizeof(val));
> > +     if (err)
> > +             return err;
> > +
> > +     if ((val >> 26) == 1)
> > +             err = probe_kernel_read((void *)&suffix,
> > +                                     src + 4, MCOUNT_INSN_SIZE);
> > +     if (err)
> > +             return err;
> > +
> > +     *inst = ppc_inst_prefix(val, suffix);
> > +
> > +     return 0;
> >  }
> > +#else
> > +static long
> > +probe_kernel_read_inst(struct ppc_inst *inst, const void *src)
> > +{
> > +     return probe_kernel_read((void *)inst, src, MCOUNT_INSN_SIZE)
> > +}
> > +#endif
> >
> >  static struct ppc_inst
> >  ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-
> > patching.c
> > index c329ad657302..b4007e03d8fa 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -24,12 +24,19 @@ static int __patch_instruction(struct ppc_inst
> > *exec_addr, struct ppc_inst instr
> >  {
> >       int err = 0;
> >
> > -     __put_user_asm(ppc_inst_val(instr), patch_addr, err, "stw");
> > -     if (err)
> > -             return err;
> > -
> > -     asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
> > -                                                         "r" (exec_addr));
> > +     if (!ppc_inst_prefixed(instr)) {
> > +             __put_user_asm(ppc_inst_val(instr), patch_addr, err, "stw");
> > +             if (err)
> > +                     return err;
> > +             asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r"
> > (patch_addr),
> > +                                                                 "r"
> > (exec_addr));
> > +     } else {
> > +             __put_user_asm((u64)ppc_inst_suffix(instr) << 32 |
> > ppc_inst_val(instr), patch_addr, err, "std");
> > +             if (err)
> > +                     return err;
> > +             asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r"
> > (patch_addr),
> > +                                                                 "r"
> > (exec_addr));
> > +     }
>
>
> can we keep these 2 lines out of conditions as it remains to be the same ?
True.
>
> if (err)
>         return err;
> asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr), "r"
> (exec_addr));
>
>
> >
> >       return 0;
> >  }
> > diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-
> > fixups.c
> > index f00dd13b1c3c..5519cec83cc8 100644
> > --- a/arch/powerpc/lib/feature-fixups.c
> > +++ b/arch/powerpc/lib/feature-fixups.c
> > @@ -84,12 +84,13 @@ static int patch_feature_section(unsigned long value,
> > struct fixup_entry *fcur)
> >       src = alt_start;
> >       dest = start;
> >
> > -     for (; src < alt_end; src++, dest++) {
> > +     for (; src < alt_end; src = (void *)src +
> > ppc_inst_len(ppc_inst_read(src)),
> > +          (dest = (void *)dest + ppc_inst_len(ppc_inst_read(dest)))) {
> >               if (patch_alt_instruction(src, dest, alt_start, alt_end))
> >                       return 1;
> >       }
> >
> > -     for (; dest < end; dest++)
> > +     for (; dest < end; dest = (void *)dest +
> > ppc_inst_len(ppc_inst(PPC_INST_NOP)))
> >               raw_patch_instruction(dest, ppc_inst(PPC_INST_NOP));
> >
> >       return 0;
> > diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> > index 52ddd3122dc8..8b285bf11218 100644
> > --- a/arch/powerpc/lib/sstep.c
> > +++ b/arch/powerpc/lib/sstep.c
> > @@ -1169,10 +1169,12 @@ int analyse_instr(struct instruction_op *op, const
> > struct pt_regs *regs,
> >       unsigned long int imm;
> >       unsigned long int val, val2;
> >       unsigned int mb, me, sh;
> > -     unsigned int word;
> > +     unsigned int word, suffix;
> >       long ival;
> >
> >       word = ppc_inst_val(instr);
> > +     suffix = ppc_inst_suffix(instr);
>
>
> same here, I doubt it might break for ppc32.
Yeah I need to work on ppc32.
>
>
> -- Bala
> > +
> >       op->type = COMPUTE;
> >
> >       opcode = word >> 26;
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index 6f3bcdcfc9c7..b704aebb099a 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -761,8 +761,8 @@ static int xmon_bpt(struct pt_regs *regs)
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
> > @@ -863,7 +863,7 @@ static struct bpt *in_breakpoint_table(unsigned long nip,
> > unsigned long *offp)
> >       if (off >= sizeof(bpt_table))
> >               return NULL;
> >       *offp = off % BPT_SIZE;
> > -     if (*offp != 0 && *offp != 4)
> > +     if (*offp != 0 && *offp != 4 && *offp != 8)
> >               return NULL;
> >       return bpts + (off / BPT_SIZE);
> >  }
> > diff --git a/arch/powerpc/xmon/xmon_bpts.S b/arch/powerpc/xmon/xmon_bpts.S
> > index ebb2dbc70ca8..09058eb6abbd 100644
> > --- a/arch/powerpc/xmon/xmon_bpts.S
> > +++ b/arch/powerpc/xmon/xmon_bpts.S
> > @@ -3,6 +3,8 @@
> >  #include <asm/asm-compat.h>
> >  #include "xmon_bpts.h"
> >
> > +/* Prefixed instructions can not cross 64 byte boundaries */
> > +.align 6
> >  .global bpt_table
> >  bpt_table:
> > -     .space NBPTS * 8
> > +     .space NBPTS * 16
>
