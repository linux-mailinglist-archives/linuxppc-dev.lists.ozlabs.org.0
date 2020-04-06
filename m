Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC4619F418
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 13:06:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wnmF16XjzDqp7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 21:06:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lOzH7V1s; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wnFD57mczDqHr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 20:43:11 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id f52so14751779otf.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 03:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DwOp0rAbpm5nnVCQ4NA5KVTGdZje909F7IPiG+lvlRo=;
 b=lOzH7V1spCqBqqRHmjJeHWGsiowoP3Ly9EwIAEqO3X01iAO2HYKubxvDdUviINtRRK
 wWdWNlJ9S4n1r3+w6vfb+uq+sVBatWkaWEO0V6BJ+XAei6vfQ3Xl3YtXpF8AWq9SDWQF
 Fv27GWWe6R4L/raRrlbit1cetlxu/DmKxQdY8cT4n7EzXfiLjtV4ReFyV8GIkK1Pzwgp
 Z6l54KoiC10CDyz292PPpx/ZQg/RHEMZRax3E4xl43NNx1lgWIx9i41uFozTrZfe5ho1
 SjzdiUE89DqIf9ebMacSaT4qoX1puednWB4WKhW3USZs5kyojdCUHZ3I2MkR0D0Qyc8E
 Y5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DwOp0rAbpm5nnVCQ4NA5KVTGdZje909F7IPiG+lvlRo=;
 b=L5a5szfKGxKBkIsq6zdKW/nMpSE0QbBDBzKKc5mP+KIjuAyUfP41oypYtUVFb9b9bd
 dm9rz6eJP9XAHjmvncDB4E3cUuKKbQc7J8hYgbFirwl+XJoLTKmJv6UNjXBPszaZtHzm
 ov//OyBQ7Ilgm4XZaysyf/dLYlCUy8gVF/Ru64DruNAyiEnfUBXFQlU/1KoQ6V/xiOru
 w8cazxLRtlVhFsVEQ78vfPcQYWbQwa8osMM5EaSnx0+Vf8ikxrDi7+It+kjhAxIBy9T2
 JnJuR8oWKLXGRpEFn3ZUFfai7UKHOFEhyQf/sVV2C0wBnps7gk/K1m2dEYUEWFIsKRkb
 imrw==
X-Gm-Message-State: AGi0PuYARC+6aH/3OqB6N5opj44lhsBznVnzoz1868X3fA5sRr942Ttl
 dMxIbV7JP05WLG8Fm73ca88+iiTxPK+hPrC2STY=
X-Google-Smtp-Source: APiQypJP8Is6h24Tmc6uEgBAI92jJaSXnNOI7micap7hL/LRfYKqD8hWn3x5Zefk2B9Z6+aCgWgis0akyPRGMwgKze4=
X-Received: by 2002:a9d:6ad2:: with SMTP id m18mr17743990otq.28.1586169789596; 
 Mon, 06 Apr 2020 03:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-19-jniethe5@gmail.com>
 <7182352.hY56U9iWWN@townsend>
In-Reply-To: <7182352.hY56U9iWWN@townsend>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 6 Apr 2020 20:42:57 +1000
Message-ID: <CACzsE9qhUXC3YkLALLrqJvk0vJLru1j4YbTrQvQOaF3rGom=kw@mail.gmail.com>
Subject: Re: [PATCH v5 18/21] powerpc64: Add prefixed instructions to
 instruction data type
To: Alistair Popple <alistair@popple.id.au>
Content-Type: multipart/alternative; boundary="000000000000dcc8e705a29cee0c"
X-Mailman-Approved-At: Mon, 06 Apr 2020 21:04:45 +1000
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
Cc: npiggin@gmail.com, bala24@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000dcc8e705a29cee0c
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Apr 2020, 7:52 pm Alistair Popple, <alistair@popple.id.au> wrote:

> > diff --git a/arch/powerpc/include/asm/inst.h
> > b/arch/powerpc/include/asm/inst.h index 70b37a35a91a..7e23e7146c66 100644
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
> > +}
> >
> >  static inline u32 ppc_inst_val(struct ppc_inst x)
> >  {
> >       return x.val;
> >  }
> >
> > -static inline bool ppc_inst_len(struct ppc_inst x)
> > +#ifdef __powerpc64__
> > +#define ppc_inst(x) ((struct ppc_inst){ .val = (x), .suffix = 0xff })
> > +
> > +#define ppc_inst_prefix(x, y) ((struct ppc_inst){ .val = (x), .suffix =
> (y)
> > }) +
> > +static inline u32 ppc_inst_suffix(struct ppc_inst x)
> >  {
> > -     return sizeof(struct ppc_inst);
> > +     return x.suffix;
> >  }
> >
> > -static inline int ppc_inst_opcode(struct ppc_inst x)
> > +static inline bool ppc_inst_prefixed(struct ppc_inst x) {
> > +     return ((ppc_inst_val(x) >> 26) == 1) && ppc_inst_suffix(x) !=
> 0xff;
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
> > +static inline void ppc_inst_write(struct ppc_inst *ptr, struct ppc_inst
> x)
> > +{
> > +     if (ppc_inst_prefixed(x)) {
> > +             *(u32 *)ptr = x.val;
> > +             *((u32 *)ptr + 1) = x.suffix;
> > +     } else {
> > +             *(u32 *)ptr = x.val;
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
> >  }
> >
> >  static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
> > @@ -32,14 +76,31 @@ static inline struct ppc_inst ppc_inst_swab(struct
> > ppc_inst x) return ppc_inst(swab32(ppc_inst_val(x)));
> >  }
> >
> > +static inline u32 ppc_inst_val(struct ppc_inst x)
> > +{
> > +     return x.val;
> > +}
> > +
> >  static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
> >  {
> >       return *ptr;
> >  }
> >
> > +static inline void ppc_inst_write(struct ppc_inst *ptr, struct ppc_inst
> x)
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
>
> Apologies for not picking this up earlier, I was hoping to get to the
> bottom
> of the issue I was seeing before you sent out v5. However the above
> definition
> of instruction equality does not seem correct because it does not consider
> the
> case when an instruction is not prefixed - a non-prefixed instruction
> should be
> considered equal if the first 32-bit opcode/value is the same. Something
> like:
>
>         if (ppc_inst_prefixed(x) != ppc_inst_prefixed(y))
>                 return false;
>         else if (ppc_inst_prefixed(x))
>                 return !memcmp(&x, &y, sizeof(struct ppc_inst));
>         else
>                 return x.val == y.val;
>
> This was causing failures in ftrace_modify_code() as it would falsely
> detect
> two non-prefixed instructions as being not equal due to differences in the
> suffix.
>
Hm I was intending that non prefixed instructions would always have the
suffix set to the same value. If that's not happening, something must be
wrong with where the instructions are created.

>
> - Alistair
>
> > +static inline int ppc_inst_len(struct ppc_inst x)
> > +{
> > +     return (ppc_inst_prefixed(x)) ? 8  : 4;
> > +}
> > +
> >  #endif /* _ASM_INST_H */
> > diff --git a/arch/powerpc/include/asm/kprobes.h
> > b/arch/powerpc/include/asm/kprobes.h index 66b3f2983b22..4fc0e15e23a5
> > 100644
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
> optprobe_template_entry)
> >  #define RELATIVEJUMP_SIZE    sizeof(kprobe_opcode_t) /* 4 bytes */
> > diff --git a/arch/powerpc/include/asm/uaccess.h
> > b/arch/powerpc/include/asm/uaccess.h index c0a35e4586a5..5a3f486ddf02
> > 100644
> > --- a/arch/powerpc/include/asm/uaccess.h
> > +++ b/arch/powerpc/include/asm/uaccess.h
> > @@ -105,11 +105,34 @@ static inline int __access_ok(unsigned long addr,
> > unsigned long size, #define __put_user_inatomic(x, ptr) \
> >       __put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
> >
> > -#define __get_user_instr(x, ptr) \
> > -     __get_user_nocheck((x).val, (u32 *)(ptr), sizeof(u32), true)
> > +#define __get_user_instr(x, ptr)                     \
> > +({                                                   \
> > +     long __gui_ret = 0;                             \
> > +     unsigned int prefix, suffix;                    \
> > +     __gui_ret = __get_user(prefix, (unsigned int __user *)ptr);
>      \
> > +     if (!__gui_ret && (prefix >> 26) == 1) {        \
> > +             __gui_ret = __get_user(suffix, (unsigned int __user *)ptr
> + 1); \
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
> > +     __gui_ret = __get_user_inatomic(prefix, (unsigned int __user
> *)ptr);            \
> > +     if (!__gui_ret && (prefix >> 26) == 1) {        \
> > +             __gui_ret = __get_user_inatomic(suffix, (unsigned int
> __user *)ptr +
> > 1);   \ +             (x) = ppc_inst_prefix(prefix, suffix);  \
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
> > b/arch/powerpc/include/asm/uprobes.h index 7e3b329ba2d3..5bf65f5d44a9
> > 100644
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
> >  /* The following alias is needed for reference from arch-agnostic code
> */
> > diff --git a/arch/powerpc/kernel/optprobes.c
> > b/arch/powerpc/kernel/optprobes.c index 684640b8fa2e..689daf430161 100644
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
> > *addr) {
> > -     /* lis r3,(op)@highest */
> > -     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ADDIS
> |
> > ___PPC_RT(3) | +      /* lis reg,(op)@highest */
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ADDIS
> |
> > ___PPC_RT(reg) | ((val >> 48) & 0xffff)));
> >       addr++;
> >
> > -     /* ori r3,r3,(op)@higher */
> > -     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > ___PPC_RA(3) | -                        ___PPC_RS(3) | ((val >> 32) &
> 0xffff)));
> > +     /* ori reg,reg,(op)@higher */
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > ___PPC_RA(reg) | +                      ___PPC_RS(reg) | ((val >> 32) &
> 0xffff)));
> >       addr++;
> >
> > -     /* rldicr r3,r3,32,31 */
> > -     patch_instruction((struct ppc_inst *)addr,
> ppc_inst(PPC_INST_RLDICR |
> > ___PPC_RA(3) | -                        ___PPC_RS(3) | __PPC_SH64(32) |
> __PPC_ME64(31)));
> > +     /* rldicr reg,reg,32,31 */
> > +     patch_instruction((struct ppc_inst *)addr,
> ppc_inst(PPC_INST_RLDICR |
> > ___PPC_RA(reg) | +                      ___PPC_RS(reg) | __PPC_SH64(32)
> |
> __PPC_ME64(31)));
> >       addr++;
> >
> > -     /* oris r3,r3,(op)@h */
> > -     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORIS |
> > ___PPC_RA(3) | -                        ___PPC_RS(3) | ((val >> 16) &
> 0xffff)));
> > +     /* oris reg,reg,(op)@h */
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORIS |
> > ___PPC_RA(reg) | +                      ___PPC_RS(reg) | ((val >> 16) &
> 0xffff)));
> >       addr++;
> >
> > -     /* ori r3,r3,(op)@l */
> > -     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > ___PPC_RA(3) | -                        ___PPC_RS(3) | (val & 0xffff)));
> > +     /* ori reg,reg,(op)@l */
> > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > ___PPC_RA(reg) | +                      ___PPC_RS(reg) | (val &
> 0xffff)));
> >  }
> >
> >  int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct
> > kprobe *p) {
> > -     struct ppc_inst branch_op_callback, branch_emulate_step;
> > +     struct ppc_inst branch_op_callback, branch_emulate_step, temp;
> >       kprobe_opcode_t *op_callback_addr, *emulate_step_addr, *buff;
> >       long b_offset;
> >       unsigned long nip, size;
> > @@ -240,7 +240,7 @@ int arch_prepare_optimized_kprobe(struct
> > optimized_kprobe *op, struct kprobe *p) * Fixup the template with
> > instructions to:
> >        * 1. load the address of the actual probepoint
> >        */
> > -     patch_imm64_load_insns((unsigned long)op, buff + TMPL_OP_IDX);
> > +     patch_imm64_load_insns((unsigned long)op, 3, buff + TMPL_OP_IDX);
> >
> >       /*
> >        * 2. branch to optimized_callback() and emulate_step()
> > @@ -271,7 +271,11 @@ int arch_prepare_optimized_kprobe(struct
> > optimized_kprobe *op, struct kprobe *p) /*
> >        * 3. load instruction to be emulated into relevant register, and
> >        */
> > -     patch_imm32_load_insns(*p->ainsn.insn, buff + TMPL_INSN_IDX);
> > +     temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
> > +     patch_imm64_load_insns(ppc_inst_val(temp) |
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
> > b/arch/powerpc/kernel/trace/ftrace.c index e78742613b36..16041a5c86d5
> > 100644
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
> > diff --git a/arch/powerpc/lib/code-patching.c
> > b/arch/powerpc/lib/code-patching.c index c329ad657302..b4007e03d8fa
> 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -24,12 +24,19 @@ static int __patch_instruction(struct ppc_inst
> > *exec_addr, struct ppc_inst instr {
> >       int err = 0;
> >
> > -     __put_user_asm(ppc_inst_val(instr), patch_addr, err, "stw");
> > -     if (err)
> > -             return err;
> > -
> > -     asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r"
> (patch_addr),
> > -                                                         "r"
> (exec_addr));
> > +     if (!ppc_inst_prefixed(instr)) {
> > +             __put_user_asm(ppc_inst_val(instr), patch_addr, err,
> "stw");
> > +             if (err)
> > +                     return err;
> > +             asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r"
> (patch_addr),
> > +                                                                 "r"
> (exec_addr));
> > +     } else {
> > +             __put_user_asm((u64)ppc_inst_suffix(instr) << 32 |
> ppc_inst_val(instr),
> > patch_addr, err, "std"); +            if (err)
> > +                     return err;
> > +             asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r"
> (patch_addr),
> > +                                                                 "r"
> (exec_addr));
> > +     }
> >
> >       return 0;
> >  }
> > diff --git a/arch/powerpc/lib/feature-fixups.c
> > b/arch/powerpc/lib/feature-fixups.c index f00dd13b1c3c..5519cec83cc8
> 100644
> > --- a/arch/powerpc/lib/feature-fixups.c
> > +++ b/arch/powerpc/lib/feature-fixups.c
> > @@ -84,12 +84,13 @@ static int patch_feature_section(unsigned long value,
> > struct fixup_entry *fcur) src = alt_start;
> >       dest = start;
> >
> > -     for (; src < alt_end; src++, dest++) {
> > +     for (; src < alt_end; src = (void *)src +
> > ppc_inst_len(ppc_inst_read(src)), +        (dest = (void *)dest +
> > ppc_inst_len(ppc_inst_read(dest)))) { if (patch_alt_instruction(src,
> dest,
> > alt_start, alt_end))
> >                       return 1;
> >       }
> >
> > -     for (; dest < end; dest++)
> > +     for (; dest < end; dest = (void *)dest +
> > ppc_inst_len(ppc_inst(PPC_INST_NOP))) raw_patch_instruction(dest,
> > ppc_inst(PPC_INST_NOP));
> >
> >       return 0;
> > diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> > index 52ddd3122dc8..8b285bf11218 100644
> > --- a/arch/powerpc/lib/sstep.c
> > +++ b/arch/powerpc/lib/sstep.c
> > @@ -1169,10 +1169,12 @@ int analyse_instr(struct instruction_op *op,
> const
> > struct pt_regs *regs, unsigned long int imm;
> >       unsigned long int val, val2;
> >       unsigned int mb, me, sh;
> > -     unsigned int word;
> > +     unsigned int word, suffix;
> >       long ival;
> >
> >       word = ppc_inst_val(instr);
> > +     suffix = ppc_inst_suffix(instr);
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
> > @@ -863,7 +863,7 @@ static struct bpt *in_breakpoint_table(unsigned long
> > nip, unsigned long *offp) if (off >= sizeof(bpt_table))
> >               return NULL;
> >       *offp = off % BPT_SIZE;
> > -     if (*offp != 0 && *offp != 4)
> > +     if (*offp != 0 && *offp != 4 && *offp != 8)
> >               return NULL;
> >       return bpts + (off / BPT_SIZE);
> >  }
> > diff --git a/arch/powerpc/xmon/xmon_bpts.S
> b/arch/powerpc/xmon/xmon_bpts.S
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
>
>
>
>

--000000000000dcc8e705a29cee0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, 6 Apr 2020, 7:52 pm Alistair Popple, &lt;<a hr=
ef=3D"mailto:alistair@popple.id.au">alistair@popple.id.au</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">&gt; diff --git a/arch/powerpc/includ=
e/asm/inst.h<br>
&gt; b/arch/powerpc/include/asm/inst.h index 70b37a35a91a..7e23e7146c66 100=
644<br>
&gt; --- a/arch/powerpc/include/asm/inst.h<br>
&gt; +++ b/arch/powerpc/include/asm/inst.h<br>
&gt; @@ -8,23 +8,67 @@<br>
&gt; <br>
&gt;=C2=A0 struct ppc_inst {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 val;<br>
&gt; +#ifdef __powerpc64__<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 suffix;<br>
&gt; +#endif /* __powerpc64__ */<br>
&gt;=C2=A0 } __packed;<br>
&gt; <br>
&gt; -#define ppc_inst(x) ((struct ppc_inst){ .val =3D x })<br>
&gt; +static inline int ppc_inst_opcode(struct ppc_inst x)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return x.val &gt;&gt; 26;<br>
&gt; +}<br>
&gt; <br>
&gt;=C2=A0 static inline u32 ppc_inst_val(struct ppc_inst x)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return x.val;<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; -static inline bool ppc_inst_len(struct ppc_inst x)<br>
&gt; +#ifdef __powerpc64__<br>
&gt; +#define ppc_inst(x) ((struct ppc_inst){ .val =3D (x), .suffix =3D 0xf=
f })<br>
&gt; +<br>
&gt; +#define ppc_inst_prefix(x, y) ((struct ppc_inst){ .val =3D (x), .suff=
ix =3D (y)<br>
&gt; }) +<br>
&gt; +static inline u32 ppc_inst_suffix(struct ppc_inst x)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return sizeof(struct ppc_inst);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return x.suffix;<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; -static inline int ppc_inst_opcode(struct ppc_inst x)<br>
&gt; +static inline bool ppc_inst_prefixed(struct ppc_inst x) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ((ppc_inst_val(x) &gt;&gt; 26) =3D=3D 1) &=
amp;&amp; ppc_inst_suffix(x) !=3D 0xff;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return x.val &gt;&gt; 26;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ppc_inst_prefix(swab32(ppc_inst_val(x)),<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 swab32(ppc_inst_suffix(x)));<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *pt=
r)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 val, suffix =3D 0xff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D *(u32 *)ptr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((val &gt;&gt; 26) =3D=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0suffix =3D *((u32 *)p=
tr + 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ppc_inst_prefix(val, suffix);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void ppc_inst_write(struct ppc_inst *ptr, struct ppc_in=
st x)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ppc_inst_prefixed(x)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(u32 *)ptr =3D x.val=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*((u32 *)ptr + 1) =3D=
 x.suffix;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(u32 *)ptr =3D x.val=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +#else<br>
&gt; +<br>
&gt; +#define ppc_inst(x) ((struct ppc_inst){ .val =3D x })<br>
&gt; +<br>
&gt; +static inline bool ppc_inst_prefixed(ppc_inst x)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)<b=
r>
&gt; @@ -32,14 +76,31 @@ static inline struct ppc_inst ppc_inst_swab(struct=
<br>
&gt; ppc_inst x) return ppc_inst(swab32(ppc_inst_val(x)));<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; +static inline u32 ppc_inst_val(struct ppc_inst x)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return x.val;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static inline struct ppc_inst ppc_inst_read(const struct ppc_ins=
t *ptr)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return *ptr;<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; +static inline void ppc_inst_write(struct ppc_inst *ptr, struct ppc_in=
st x)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*ptr =3D x;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#endif /* __powerpc64__ */<br>
&gt; +<br>
&gt;=C2=A0 static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_=
inst y)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return !memcmp(&amp;x, &amp;y, sizeof(struct=
 ppc_inst));<br>
&gt;=C2=A0 }<br>
<br>
Apologies for not picking this up earlier, I was hoping to get to the botto=
m <br>
of the issue I was seeing before you sent out v5. However the above definit=
ion <br>
of instruction equality does not seem correct because it does not consider =
the <br>
case when an instruction is not prefixed - a non-prefixed instruction shoul=
d be <br>
considered equal if the first 32-bit opcode/value is the same. Something li=
ke:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ppc_inst_prefixed(x) !=3D ppc_inst_prefixed=
(y))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (ppc_inst_prefixed(x))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return !memcmp(&amp=
;x, &amp;y, sizeof(struct ppc_inst));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return x.val =3D=3D=
 y.val;<br>
<br>
This was causing failures in ftrace_modify_code() as it would falsely detec=
t <br>
two non-prefixed instructions as being not equal due to differences in the =
suffix.<br></blockquote></div></div><div dir=3D"auto">Hm I was intending th=
at non prefixed instructions would always have the suffix set to the same v=
alue. If that&#39;s not happening, something must be wrong with where the i=
nstructions are created.=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<br>
- Alistair<br>
<br>
&gt; +static inline int ppc_inst_len(struct ppc_inst x)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return (ppc_inst_prefixed(x)) ? 8=C2=A0 : 4;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 #endif /* _ASM_INST_H */<br>
&gt; diff --git a/arch/powerpc/include/asm/kprobes.h<br>
&gt; b/arch/powerpc/include/asm/kprobes.h index 66b3f2983b22..4fc0e15e23a5<=
br>
&gt; 100644<br>
&gt; --- a/arch/powerpc/include/asm/kprobes.h<br>
&gt; +++ b/arch/powerpc/include/asm/kprobes.h<br>
&gt; @@ -43,7 +43,7 @@ extern kprobe_opcode_t optprobe_template_ret[];<br>
&gt;=C2=A0 extern kprobe_opcode_t optprobe_template_end[];<br>
&gt; <br>
&gt;=C2=A0 /* Fixed instruction size for powerpc */<br>
&gt; -#define MAX_INSN_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 1<br>
&gt; +#define MAX_INSN_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 2<br>
&gt;=C2=A0 #define MAX_OPTIMIZED_LENGTH sizeof(kprobe_opcode_t) /* 4 bytes =
*/<br>
&gt;=C2=A0 #define MAX_OPTINSN_SIZE=C2=A0 =C2=A0 =C2=A0(optprobe_template_e=
nd - optprobe_template_entry)<br>
&gt;=C2=A0 #define RELATIVEJUMP_SIZE=C2=A0 =C2=A0 sizeof(kprobe_opcode_t) /=
* 4 bytes */<br>
&gt; diff --git a/arch/powerpc/include/asm/uaccess.h<br>
&gt; b/arch/powerpc/include/asm/uaccess.h index c0a35e4586a5..5a3f486ddf02<=
br>
&gt; 100644<br>
&gt; --- a/arch/powerpc/include/asm/uaccess.h<br>
&gt; +++ b/arch/powerpc/include/asm/uaccess.h<br>
&gt; @@ -105,11 +105,34 @@ static inline int __access_ok(unsigned long addr=
,<br>
&gt; unsigned long size, #define __put_user_inatomic(x, ptr) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__put_user_nosleep((__typeof__(*(ptr)))(x), =
(ptr), sizeof(*(ptr)))<br>
&gt; <br>
&gt; -#define __get_user_instr(x, ptr) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0__get_user_nocheck((x).val, (u32 *)(ptr), sizeof(=
u32), true)<br>
&gt; +#define __get_user_instr(x, ptr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +({=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0long __gui_ret =3D 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int prefix, suffix;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__gui_ret =3D __get_user(prefix, (unsigned int __=
user *)ptr);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!__gui_ret &amp;&amp; (prefix &gt;&gt; 26) =
=3D=3D 1) {=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__gui_ret =3D __get_u=
ser(suffix, (unsigned int __user *)ptr + 1); \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(x) =3D ppc_inst_pref=
ix(prefix, suffix);=C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(x) =3D ppc_inst(pref=
ix);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__gui_ret;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +})<br>
&gt; +<br>
&gt; +#define __get_user_instr_inatomic(x, ptr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
&gt; +({=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0long __gui_ret =3D 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int prefix, suffix;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__gui_ret =3D __get_user_inatomic(prefix, (unsign=
ed int __user *)ptr);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!__gui_ret &amp;&amp; (prefix &gt;&gt; 26) =
=3D=3D 1) {=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__gui_ret =3D __get_u=
ser_inatomic(suffix, (unsigned int __user *)ptr +<br>
&gt; 1);=C2=A0 =C2=A0\ +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(x)=
 =3D ppc_inst_prefix(prefix, suffix);=C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(x) =3D ppc_inst(pref=
ix);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__gui_ret;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +})<br>
&gt; <br>
&gt; -#define __get_user_instr_inatomic(x, ptr) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0__get_user_nosleep((x).val, (u32 *)(ptr), sizeof(=
u32))<br>
&gt;=C2=A0 extern long __put_user_bad(void);<br>
&gt; <br>
&gt;=C2=A0 /*<br>
&gt; diff --git a/arch/powerpc/include/asm/uprobes.h<br>
&gt; b/arch/powerpc/include/asm/uprobes.h index 7e3b329ba2d3..5bf65f5d44a9<=
br>
&gt; 100644<br>
&gt; --- a/arch/powerpc/include/asm/uprobes.h<br>
&gt; +++ b/arch/powerpc/include/asm/uprobes.h<br>
&gt; @@ -15,7 +15,7 @@<br>
&gt; <br>
&gt;=C2=A0 typedef ppc_opcode_t uprobe_opcode_t;<br>
&gt; <br>
&gt; -#define MAX_UINSN_BYTES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 4<br>
&gt; +#define MAX_UINSN_BYTES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 8<br>
&gt;=C2=A0 #define UPROBE_XOL_SLOT_BYTES=C2=A0 =C2=A0 =C2=A0 =C2=A0 (MAX_UI=
NSN_BYTES)<br>
&gt; <br>
&gt;=C2=A0 /* The following alias is needed for reference from arch-agnosti=
c code */<br>
&gt; diff --git a/arch/powerpc/kernel/optprobes.c<br>
&gt; b/arch/powerpc/kernel/optprobes.c index 684640b8fa2e..689daf430161 100=
644<br>
&gt; --- a/arch/powerpc/kernel/optprobes.c<br>
&gt; +++ b/arch/powerpc/kernel/optprobes.c<br>
&gt; @@ -159,38 +159,38 @@ void patch_imm32_load_insns(unsigned int val,<br=
>
&gt; kprobe_opcode_t *addr)<br>
&gt; <br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Generate instructions to load provided immediate 64-bit =
value<br>
&gt; - * to register &#39;r3&#39; and patch these instructions at &#39;addr=
&#39;.<br>
&gt; + * to register &#39;reg&#39; and patch these instructions at &#39;add=
r&#39;.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)=
<br>
&gt; +void patch_imm64_load_insns(unsigned long val, int reg, kprobe_opcode=
_t<br>
&gt; *addr) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* lis r3,(op)@highest */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0patch_instruction((struct ppc_inst *)addr, ppc_in=
st(PPC_INST_ADDIS |<br>
&gt; ___PPC_RT(3) | +=C2=A0 =C2=A0 =C2=A0 /* lis reg,(op)@highest */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0patch_instruction((struct ppc_inst *)addr, ppc_in=
st(PPC_INST_ADDIS |<br>
&gt; ___PPC_RT(reg) | ((val &gt;&gt; 48) &amp; 0xffff)));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0addr++;<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* ori r3,r3,(op)@higher */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0patch_instruction((struct ppc_inst *)addr, ppc_in=
st(PPC_INST_ORI |<br>
&gt; ___PPC_RA(3) | -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ___PPC_RS(3) | ((val &gt;&gt; 32) &amp; 0xf=
fff)));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* ori reg,reg,(op)@higher */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0patch_instruction((struct ppc_inst *)addr, ppc_in=
st(PPC_INST_ORI |<br>
&gt; ___PPC_RA(reg) | +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ___PPC_RS(reg) | ((val &gt;&gt; 32) &amp; 0xffff))=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0addr++;<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* rldicr r3,r3,32,31 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0patch_instruction((struct ppc_inst *)addr, ppc_in=
st(PPC_INST_RLDICR |<br>
&gt; ___PPC_RA(3) | -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(=
31)));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* rldicr reg,reg,32,31 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0patch_instruction((struct ppc_inst *)addr, ppc_in=
st(PPC_INST_RLDICR |<br>
&gt; ___PPC_RA(reg) | +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ___PPC_RS(reg) | __PPC_SH64(32) | <br>
__PPC_ME64(31)));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0addr++;<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* oris r3,r3,(op)@h */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0patch_instruction((struct ppc_inst *)addr, ppc_in=
st(PPC_INST_ORIS |<br>
&gt; ___PPC_RA(3) | -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ___PPC_RS(3) | ((val &gt;&gt; 16) &amp; 0xf=
fff)));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* oris reg,reg,(op)@h */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0patch_instruction((struct ppc_inst *)addr, ppc_in=
st(PPC_INST_ORIS |<br>
&gt; ___PPC_RA(reg) | +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ___PPC_RS(reg) | ((val &gt;&gt; 16) &amp; 0xffff))=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0addr++;<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* ori r3,r3,(op)@l */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0patch_instruction((struct ppc_inst *)addr, ppc_in=
st(PPC_INST_ORI |<br>
&gt; ___PPC_RA(3) | -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ___PPC_RS(3) | (val &amp; 0xffff)));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* ori reg,reg,(op)@l */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0patch_instruction((struct ppc_inst *)addr, ppc_in=
st(PPC_INST_ORI |<br>
&gt; ___PPC_RA(reg) | +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ___PPC_RS(reg) | (val &amp; 0xffff)));<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, s=
truct<br>
&gt; kprobe *p) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct ppc_inst branch_op_callback, branch_emulat=
e_step;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ppc_inst branch_op_callback, branch_emulat=
e_step, temp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kprobe_opcode_t *op_callback_addr, *emulate_=
step_addr, *buff;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0long b_offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long nip, size;<br>
&gt; @@ -240,7 +240,7 @@ int arch_prepare_optimized_kprobe(struct<br>
&gt; optimized_kprobe *op, struct kprobe *p) * Fixup the template with<br>
&gt; instructions to:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1. load the address of the actual probepo=
int<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0patch_imm64_load_insns((unsigned long)op, buff + =
TMPL_OP_IDX);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0patch_imm64_load_insns((unsigned long)op, 3, buff=
 + TMPL_OP_IDX);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 2. branch to optimized_callback() and emu=
late_step()<br>
&gt; @@ -271,7 +271,11 @@ int arch_prepare_optimized_kprobe(struct<br>
&gt; optimized_kprobe *op, struct kprobe *p) /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 3. load instruction to be emulated into r=
elevant register, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0patch_imm32_load_insns(*p-&gt;ainsn.insn, buff + =
TMPL_INSN_IDX);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0temp =3D ppc_inst_read((struct ppc_inst *)p-&gt;a=
insn.insn);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0patch_imm64_load_insns(ppc_inst_val(temp) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((u64)ppc_inst_suffix(temp) &lt;&lt; 32),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buff + TMPL_INSN_IDX);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 4. branch back from trampoline<br>
&gt; diff --git a/arch/powerpc/kernel/optprobes_head.S<br>
&gt; b/arch/powerpc/kernel/optprobes_head.S index cf383520843f..ff8ba4d3824=
d<br>
&gt; 100644<br>
&gt; --- a/arch/powerpc/kernel/optprobes_head.S<br>
&gt; +++ b/arch/powerpc/kernel/optprobes_head.S<br>
&gt; @@ -94,6 +94,9 @@ optprobe_template_insn:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2, Pass instruction to be emulated in r4 =
*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0nop<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0nop<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nop<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nop<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nop<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.global optprobe_template_call_emulate<br>
&gt;=C2=A0 optprobe_template_call_emulate:<br>
&gt; diff --git a/arch/powerpc/kernel/trace/ftrace.c<br>
&gt; b/arch/powerpc/kernel/trace/ftrace.c index e78742613b36..16041a5c86d5<=
br>
&gt; 100644<br>
&gt; --- a/arch/powerpc/kernel/trace/ftrace.c<br>
&gt; +++ b/arch/powerpc/kernel/trace/ftrace.c<br>
&gt; @@ -41,11 +41,35 @@<br>
&gt;=C2=A0 #define=C2=A0 =C2=A0 =C2=A0 NUM_FTRACE_TRAMPS=C2=A0 =C2=A0 =C2=
=A0 =C2=A08<br>
&gt;=C2=A0 static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];<br>
&gt; <br>
&gt; +#ifdef __powerpc64__<br>
&gt;=C2=A0 static long<br>
&gt;=C2=A0 probe_kernel_read_inst(struct ppc_inst *inst, const void *src)<b=
r>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return probe_kernel_read((void *)inst, src, MCOUN=
T_INSN_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 val, suffix =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0long err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D probe_kernel_read((void *)&amp;val,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src, sizeof(val));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((val &gt;&gt; 26) =3D=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D probe_kernel_=
read((void *)&amp;suffix,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src + 4, MCO=
UNT_INSN_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*inst =3D ppc_inst_prefix(val, suffix);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt; +#else<br>
&gt; +static long<br>
&gt; +probe_kernel_read_inst(struct ppc_inst *inst, const void *src)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return probe_kernel_read((void *)inst, src, MCOUN=
T_INSN_SIZE)<br>
&gt; +}<br>
&gt; +#endif<br>
&gt; <br>
&gt;=C2=A0 static struct ppc_inst<br>
&gt;=C2=A0 ftrace_call_replace(unsigned long ip, unsigned long addr, int li=
nk)<br>
&gt; diff --git a/arch/powerpc/lib/code-patching.c<br>
&gt; b/arch/powerpc/lib/code-patching.c index c329ad657302..b4007e03d8fa 10=
0644<br>
&gt; --- a/arch/powerpc/lib/code-patching.c<br>
&gt; +++ b/arch/powerpc/lib/code-patching.c<br>
&gt; @@ -24,12 +24,19 @@ static int __patch_instruction(struct ppc_inst<br>
&gt; *exec_addr, struct ppc_inst instr {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int err =3D 0;<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0__put_user_asm(ppc_inst_val(instr), patch_addr, e=
rr, &quot;stw&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0asm (&quot;dcbst 0, %0; sync; icbi 0,%1; sync; is=
ync&quot; :: &quot;r&quot; (patch_addr),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;r&quot; (e=
xec_addr));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ppc_inst_prefixed(instr)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__put_user_asm(ppc_in=
st_val(instr), patch_addr, err, &quot;stw&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asm (&quot;dcbst 0, %=
0; sync; icbi 0,%1; sync; isync&quot; :: &quot;r&quot; (patch_addr),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;r&quot; (exec_addr));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__put_user_asm((u64)p=
pc_inst_suffix(instr) &lt;&lt; 32 | ppc_inst_val(instr),<br>
&gt; patch_addr, err, &quot;std&quot;); +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asm (&quot;dcbst 0, %=
0; sync; icbi 0,%1; sync; isync&quot; :: &quot;r&quot; (patch_addr),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;r&quot; (exec_addr));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/arch/powerpc/lib/feature-fixups.c<br>
&gt; b/arch/powerpc/lib/feature-fixups.c index f00dd13b1c3c..5519cec83cc8 1=
00644<br>
&gt; --- a/arch/powerpc/lib/feature-fixups.c<br>
&gt; +++ b/arch/powerpc/lib/feature-fixups.c<br>
&gt; @@ -84,12 +84,13 @@ static int patch_feature_section(unsigned long val=
ue,<br>
&gt; struct fixup_entry *fcur) src =3D alt_start;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dest =3D start;<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (; src &lt; alt_end; src++, dest++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (; src &lt; alt_end; src =3D (void *)src +<br=
>
&gt; ppc_inst_len(ppc_inst_read(src)), +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (dest =
=3D (void *)dest +<br>
&gt; ppc_inst_len(ppc_inst_read(dest)))) { if (patch_alt_instruction(src, d=
est,<br>
&gt; alt_start, alt_end))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (; dest &lt; end; dest++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (; dest &lt; end; dest =3D (void *)dest +<br>
&gt; ppc_inst_len(ppc_inst(PPC_INST_NOP))) raw_patch_instruction(dest,<br>
&gt; ppc_inst(PPC_INST_NOP));<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c<br>
&gt; index 52ddd3122dc8..8b285bf11218 100644<br>
&gt; --- a/arch/powerpc/lib/sstep.c<br>
&gt; +++ b/arch/powerpc/lib/sstep.c<br>
&gt; @@ -1169,10 +1169,12 @@ int analyse_instr(struct instruction_op *op, c=
onst<br>
&gt; struct pt_regs *regs, unsigned long int imm;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long int val, val2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int mb, me, sh;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unsigned int word;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int word, suffix;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0long ival;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0word =3D ppc_inst_val(instr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0suffix =3D ppc_inst_suffix(instr);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0op-&gt;type =3D COMPUTE;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0opcode =3D word &gt;&gt; 26;<br>
&gt; diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c<br>
&gt; index 6f3bcdcfc9c7..b704aebb099a 100644<br>
&gt; --- a/arch/powerpc/xmon/xmon.c<br>
&gt; +++ b/arch/powerpc/xmon/xmon.c<br>
&gt; @@ -761,8 +761,8 @@ static int xmon_bpt(struct pt_regs *regs)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Are we at the trap at bp-&gt;instr[1] for=
 some bp? */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bp =3D in_breakpoint_table(regs-&gt;nip, &am=
p;offset);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (bp !=3D NULL &amp;&amp; offset =3D=3D 4) {<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regs-&gt;nip =3D bp-&=
gt;address + 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (bp !=3D NULL &amp;&amp; (offset =3D=3D 4 || o=
ffset =3D=3D 8)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regs-&gt;nip =3D bp-&=
gt;address + offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_dec(&amp;=
bp-&gt;ref_count);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -863,7 +863,7 @@ static struct bpt *in_breakpoint_table(unsigned lo=
ng<br>
&gt; nip, unsigned long *offp) if (off &gt;=3D sizeof(bpt_table))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*offp =3D off % BPT_SIZE;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (*offp !=3D 0 &amp;&amp; *offp !=3D 4)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (*offp !=3D 0 &amp;&amp; *offp !=3D 4 &amp;&am=
p; *offp !=3D 8)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return bpts + (off / BPT_SIZE);<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/arch/powerpc/xmon/xmon_bpts.S b/arch/powerpc/xmon/xmon_bp=
ts.S<br>
&gt; index ebb2dbc70ca8..09058eb6abbd 100644<br>
&gt; --- a/arch/powerpc/xmon/xmon_bpts.S<br>
&gt; +++ b/arch/powerpc/xmon/xmon_bpts.S<br>
&gt; @@ -3,6 +3,8 @@<br>
&gt;=C2=A0 #include &lt;asm/asm-compat.h&gt;<br>
&gt;=C2=A0 #include &quot;xmon_bpts.h&quot;<br>
&gt; <br>
&gt; +/* Prefixed instructions can not cross 64 byte boundaries */<br>
&gt; +.align 6<br>
&gt;=C2=A0 .global bpt_table<br>
&gt;=C2=A0 bpt_table:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0.space NBPTS * 8<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.space NBPTS * 16<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000dcc8e705a29cee0c--
