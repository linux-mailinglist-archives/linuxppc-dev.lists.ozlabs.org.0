Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A03281D2FD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 14:32:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N9s76pbGzDqqK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 22:31:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IVkOaj4o; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N9nP3r9jzDqWH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 22:28:40 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id o7so24377509oif.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 05:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h/e+yN+odptpKx2a1kZLoMD2THXlNvjmpI4d4ZP/sCg=;
 b=IVkOaj4on2NfKdcGo1HFpDsQ+HZKO5U5bA1qyvBHvEdA/b7SKM99LlrPmmhBEgEXgq
 nB8jYAg/2LsGl9SyzgZnkoLzZ/a21c0L0RjInH6r9dJcTVumhG96rA8j4l8msATmZROo
 5T9esbD6yI7RS2mbvMPSB4+t8nIJ/hu11GqnRxox6hgtkiodP8pDmiQu0pm4ca5pxOpx
 ydzmhdb9QpK64qUui6el304FH1rLAtOoBLLGFf/51q0PbXdJS0CdICsKrpEFOmNdZMzl
 dyGyJPppLjpsTRJFlwpiBlJjRm8Pqg9TWkEm05SP4aLYiLCFZ4Qxu6eMd/NwaJfjfxc8
 Zoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h/e+yN+odptpKx2a1kZLoMD2THXlNvjmpI4d4ZP/sCg=;
 b=jqjRmd06snh1s86AuxdOhHth8+nnuv0XzA2/g9x3+EEj2jAOd23ZoZHsPdWUlnTTQh
 tFkq58ndGVpNYNCSI/tqr8P+qsWOv/LMPQ/vKbTt9uLFxvpoqaJFjNLh1LRzwDn01ZAg
 zgWsxIBKOhVdW4KWSVOKn6BadjHsAQo25xyLkeyxOfsZaKXDbgu8NTmUMfjdWUGwmyVd
 SoUFOYL8xwW6ynWSuJ8HyDxHXY8SaSgkf3xBlHdrZv1qojV8kMuCgUrTGm43KQZRBOza
 CiqpAo1dCJshuTHvU9SnSvy9onpQsMaM8NxwtHW32v9Tx11AKkGvHxnR9X6/rHaA5R33
 +BKg==
X-Gm-Message-State: AOAM5305VmK7gEIE2+QglMSW9GQTL9OmSOYXwQGTEgE6swaviTs5/ZE9
 Rg44gQBc1pRsjIoNqzm60buPhJHq6CW8FCZE0oY=
X-Google-Smtp-Source: ABdhPJx6/9NYmC3XZcRt4wT77+lRLFyChyjM8O5bBsYv2pHN0AI6i07+jPYw1QviO5y6/htLb8s8LRvn/KKdXGiOP/g=
X-Received: by 2002:aca:40c2:: with SMTP id n185mr1820020oia.12.1589459318582; 
 Thu, 14 May 2020 05:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-24-jniethe5@gmail.com>
 <56ca6bcb-c719-a049-63b0-aae73023bde5@csgroup.eu>
In-Reply-To: <56ca6bcb-c719-a049-63b0-aae73023bde5@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 14 May 2020 22:28:27 +1000
Message-ID: <CACzsE9qGvUsEAaK5jPaq+c+1hhN0ZSayXSmzKH4-KOs5cxxx6A@mail.gmail.com>
Subject: Re: [PATCH v8 23/30] powerpc: Add prefixed instructions to
 instruction data type
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Balamuruhan S <bala24@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 14, 2020 at 4:12 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 06/05/2020 =C3=A0 05:40, Jordan Niethe a =C3=A9crit :
> > For powerpc64, redefine the ppc_inst type so both word and prefixed
> > instructions can be represented. On powerpc32 the type will remain the
> > same.  Update places which had assumed instructions to be 4 bytes long.
> >
> > Reviewed-by: Alistair Popple <alistair@popple.id.au>
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v4: New to series
> > v5:  - Distinguish normal instructions from prefixed instructions with =
a
> >         0xff marker for the suffix.
> >       - __patch_instruction() using std for prefixed instructions
> > v6:  - Return false instead of 0 in ppc_inst_prefixed()
> >       - Fix up types for ppc32 so it compiles
> >       - remove ppc_inst_write()
> >       - __patching_instruction(): move flush out of condition
> > v8:  - style
> >       - Define and use OP_PREFIX instead of '1' (back from v3)
> >       - __patch_instruction() fix for big endian
> > ---
> >   arch/powerpc/include/asm/inst.h       | 69 ++++++++++++++++++++++++--=
-
> >   arch/powerpc/include/asm/kprobes.h    |  2 +-
> >   arch/powerpc/include/asm/ppc-opcode.h |  3 ++
> >   arch/powerpc/include/asm/uaccess.h    | 40 +++++++++++++++-
> >   arch/powerpc/include/asm/uprobes.h    |  2 +-
> >   arch/powerpc/kernel/crash_dump.c      |  2 +-
> >   arch/powerpc/kernel/optprobes.c       | 42 ++++++++--------
> >   arch/powerpc/kernel/optprobes_head.S  |  3 ++
> >   arch/powerpc/lib/code-patching.c      | 19 ++++++--
> >   arch/powerpc/lib/feature-fixups.c     |  5 +-
> >   arch/powerpc/lib/inst.c               | 41 ++++++++++++++++
> >   arch/powerpc/lib/sstep.c              |  4 +-
> >   arch/powerpc/xmon/xmon.c              |  4 +-
> >   arch/powerpc/xmon/xmon_bpts.S         |  2 +
> >   14 files changed, 200 insertions(+), 38 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm=
/inst.h
> > index 2f3c9d5bcf7c..7868b80b610e 100644
> > --- a/arch/powerpc/include/asm/inst.h
> > +++ b/arch/powerpc/include/asm/inst.h
> > @@ -2,29 +2,79 @@
> >   #ifndef _ASM_INST_H
> >   #define _ASM_INST_H
> >
> > +#include <asm/ppc-opcode.h>
> >   /*
> >    * Instruction data type for POWER
> >    */
> >
> >   struct ppc_inst {
> >       u32 val;
> > +#ifdef __powerpc64__
>
> CONFIG_PPC64 should be used instead. This is also reported by checkpatch.
Sure will use that instead.
>
> > +     u32 suffix;
> > +#endif /* __powerpc64__ */
> >   } __packed;
> >
> > -#define ppc_inst(x) ((struct ppc_inst){ .val =3D x })
> > -
> >   static inline u32 ppc_inst_val(struct ppc_inst x)
> >   {
> >       return x.val;
> >   }
> >
> > -static inline int ppc_inst_len(struct ppc_inst x)
> > +static inline int ppc_inst_primary_opcode(struct ppc_inst x)
> >   {
> > -     return sizeof(struct ppc_inst);
> > +     return ppc_inst_val(x) >> 26;
>
> What about using get_op() from asm/disassemble.h instead of hardcodiing ?
Okay will use it here and the other places you point out.
>
> >   }
> >
> > -static inline int ppc_inst_primary_opcode(struct ppc_inst x)
> > +#ifdef __powerpc64__
>
> Use CONFIG_PPC64
>
> > +#define ppc_inst(x) ((struct ppc_inst){ .val =3D (x), .suffix =3D 0xff=
 })
> > +
> > +#define ppc_inst_prefix(x, y) ((struct ppc_inst){ .val =3D (x), .suffi=
x =3D (y) })
> > +
> > +static inline u32 ppc_inst_suffix(struct ppc_inst x)
> >   {
> > -     return ppc_inst_val(x) >> 26;
> > +     return x.suffix;
> > +}
> > +
> > +static inline bool ppc_inst_prefixed(struct ppc_inst x)
> > +{
> > +     return (ppc_inst_primary_opcode(x) =3D=3D 1) && ppc_inst_suffix(x=
) !=3D 0xff;
> > +}
> > +
> > +static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
> > +{
> > +     return ppc_inst_prefix(swab32(ppc_inst_val(x)),
> > +                            swab32(ppc_inst_suffix(x)));
> > +}
> > +
> > +static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr=
)
> > +{
> > +     u32 val, suffix;
> > +
> > +     val =3D *(u32 *)ptr;
> > +     if ((val >> 26) =3D=3D 1) {
>
> Don't hardcode, use ppc_inst_primary_opcode() and compare it to OP_PREFIX
> Or use get_op() from asm/disassemble.h
>
>
> > +             suffix =3D *((u32 *)ptr + 1);
> > +             return ppc_inst_prefix(val, suffix);
> > +     } else {
> > +             return ppc_inst(val);
> > +     }
> > +}
> > +
> > +static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y=
)
> > +{
> > +     return *(u64 *)&x =3D=3D *(u64 *)&y;
> > +}
> > +
> > +#else
> > +
> > +#define ppc_inst(x) ((struct ppc_inst){ .val =3D x })
> > +
> > +static inline bool ppc_inst_prefixed(struct ppc_inst x)
> > +{
> > +     return false;
> > +}
> > +
> > +static inline u32 ppc_inst_suffix(struct ppc_inst x)
> > +{
> > +     return 0;
> >   }
> >
> >   static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
> > @@ -42,6 +92,13 @@ static inline bool ppc_inst_equal(struct ppc_inst x,=
 struct ppc_inst y)
> >       return ppc_inst_val(x) =3D=3D ppc_inst_val(y);
> >   }
> >
> > +#endif /* __powerpc64__ */
> > +
> > +static inline int ppc_inst_len(struct ppc_inst x)
> > +{
> > +     return (ppc_inst_prefixed(x)) ? 8  : 4;
> > +}
> > +
> >   int probe_user_read_inst(struct ppc_inst *inst,
> >                        struct ppc_inst *nip);
> >   int probe_kernel_read_inst(struct ppc_inst *inst,
> > diff --git a/arch/powerpc/include/asm/kprobes.h b/arch/powerpc/include/=
asm/kprobes.h
> > index 66b3f2983b22..4fc0e15e23a5 100644
> > --- a/arch/powerpc/include/asm/kprobes.h
> > +++ b/arch/powerpc/include/asm/kprobes.h
> > @@ -43,7 +43,7 @@ extern kprobe_opcode_t optprobe_template_ret[];
> >   extern kprobe_opcode_t optprobe_template_end[];
> >
> >   /* Fixed instruction size for powerpc */
> > -#define MAX_INSN_SIZE                1
> > +#define MAX_INSN_SIZE                2
> >   #define MAX_OPTIMIZED_LENGTH        sizeof(kprobe_opcode_t) /* 4 byte=
s */
> >   #define MAX_OPTINSN_SIZE    (optprobe_template_end - optprobe_templat=
e_entry)
> >   #define RELATIVEJUMP_SIZE   sizeof(kprobe_opcode_t) /* 4 bytes */
> > diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/inclu=
de/asm/ppc-opcode.h
> > index c1df75edde44..2a39c716c343 100644
> > --- a/arch/powerpc/include/asm/ppc-opcode.h
> > +++ b/arch/powerpc/include/asm/ppc-opcode.h
> > @@ -158,6 +158,9 @@
> >   /* VMX Vector Store Instructions */
> >   #define OP_31_XOP_STVX          231
> >
> > +/* Prefixed Instructions */
> > +#define OP_PREFIX            1
> > +
> >   #define OP_31   31
> >   #define OP_LWZ  32
> >   #define OP_STFS 52
> > diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/=
asm/uaccess.h
> > index c0a35e4586a5..217897927926 100644
> > --- a/arch/powerpc/include/asm/uaccess.h
> > +++ b/arch/powerpc/include/asm/uaccess.h
> > @@ -105,11 +105,49 @@ static inline int __access_ok(unsigned long addr,=
 unsigned long size,
> >   #define __put_user_inatomic(x, ptr) \
> >       __put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr))=
)
> >
> > +#ifdef __powerpc64__
>
> Replace by CONFIG_PPC64
>
> > +#define __get_user_instr(x, ptr)                     \
> > +({                                                   \
> > +     long __gui_ret =3D 0;                             \
> > +     unsigned long __gui_ptr =3D (unsigned long)ptr;   \
> > +     struct ppc_inst __gui_inst;                     \
> > +     unsigned int prefix, suffix;                    \
> > +     __gui_ret =3D __get_user(prefix, (unsigned int __user *)__gui_ptr=
);       \
>
> __get_user() can be costly especially with KUAP. I think you should
> perform a 64 bits read and fallback on a 32 bits read only if the 64
> bits read failed.
Thanks, I will try doing it that way.
>
> > +     if (!__gui_ret && (prefix >> 26) =3D=3D OP_PREFIX) {        \
>
> What about using get_op() from asm/disassemble.h instead of hardcodiing ?
>
> > +             __gui_ret =3D __get_user(suffix,          \
> > +                                    (unsigned int __user *)__gui_ptr +=
 1);   \
> > +             __gui_inst =3D ppc_inst_prefix(prefix, suffix);   \
> > +     } else {                                        \
> > +             __gui_inst =3D ppc_inst(prefix);          \
> > +     }                                               \
> > +     (x) =3D __gui_inst;                               \
> > +     __gui_ret;                                      \
> > +})
> > +
> > +#define __get_user_instr_inatomic(x, ptr)            \
> > +({                                                   \
> > +     long __gui_ret =3D 0;                             \
> > +     unsigned long __gui_ptr =3D (unsigned long)ptr;   \
> > +     struct ppc_inst __gui_inst;                     \
> > +     unsigned int prefix, suffix;                    \
> > +     __gui_ret =3D __get_user_inatomic(prefix, (unsigned int __user *)=
__gui_ptr);      \
>
> Same
>
> > +     if (!__gui_ret && (prefix >> 26) =3D=3D OP_PREFIX) {        \
> > +             __gui_ret =3D __get_user_inatomic(suffix, \
> > +                                             (unsigned int __user *)__=
gui_ptr + 1);  \
> > +             __gui_inst =3D ppc_inst_prefix(prefix, suffix);   \
> > +     } else {                                        \
> > +             __gui_inst =3D ppc_inst(prefix);          \
> > +     }                                               \
> > +     (x) =3D __gui_inst;                               \
> > +     __gui_ret;                                      \
> > +})
> > +#else
> >   #define __get_user_instr(x, ptr) \
> >       __get_user_nocheck((x).val, (u32 *)(ptr), sizeof(u32), true)
> > -
> >   #define __get_user_instr_inatomic(x, ptr) \
> >       __get_user_nosleep((x).val, (u32 *)(ptr), sizeof(u32))
> > +#endif
> > +
> >   extern long __put_user_bad(void);
> >
> >   /*
> > diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include/=
asm/uprobes.h
> > index 7e3b329ba2d3..5bf65f5d44a9 100644
> > --- a/arch/powerpc/include/asm/uprobes.h
> > +++ b/arch/powerpc/include/asm/uprobes.h
> > @@ -15,7 +15,7 @@
> >
> >   typedef ppc_opcode_t uprobe_opcode_t;
> >
> > -#define MAX_UINSN_BYTES              4
> > +#define MAX_UINSN_BYTES              8
> >   #define UPROBE_XOL_SLOT_BYTES       (MAX_UINSN_BYTES)
> >
> >   /* The following alias is needed for reference from arch-agnostic cod=
e */
> > diff --git a/arch/powerpc/kernel/crash_dump.c b/arch/powerpc/kernel/cra=
sh_dump.c
> > index 72bafb47e757..735e89337398 100644
> > --- a/arch/powerpc/kernel/crash_dump.c
> > +++ b/arch/powerpc/kernel/crash_dump.c
> > @@ -46,7 +46,7 @@ static void __init create_trampoline(unsigned long ad=
dr)
> >        * two instructions it doesn't require any registers.
> >        */
> >       patch_instruction(p, ppc_inst(PPC_INST_NOP));
> > -     patch_branch(++p, addr + PHYSICAL_START, 0);
> > +     patch_branch((void *)p + 4, addr + PHYSICAL_START, 0);
> >   }
> >
> >   void __init setup_kdump_trampoline(void)
> > diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optp=
robes.c
> > index 52c1ab3f85aa..a8e66603d12b 100644
> > --- a/arch/powerpc/kernel/optprobes.c
> > +++ b/arch/powerpc/kernel/optprobes.c
> > @@ -162,43 +162,43 @@ void patch_imm32_load_insns(unsigned int val, kpr=
obe_opcode_t *addr)
> >
> >   /*
> >    * Generate instructions to load provided immediate 64-bit value
> > - * to register 'r3' and patch these instructions at 'addr'.
> > + * to register 'reg' and patch these instructions at 'addr'.
> >    */
> > -void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
> > +void patch_imm64_load_insns(unsigned long val, int reg, kprobe_opcode_=
t *addr)
>
> I think this change should go in a separate patch.
Okay.
>
> >   {
> > -     /* lis r3,(op)@highest */
> > +     /* lis reg,(op)@highest */
> >       patch_instruction((struct ppc_inst *)addr,
> > -                       ppc_inst(PPC_INST_ADDIS | ___PPC_RT(3) |
> > +                       ppc_inst(PPC_INST_ADDIS | ___PPC_RT(reg) |
> >                                  ((val >> 48) & 0xffff)));
> >       addr++;
> >
> > -     /* ori r3,r3,(op)@higher */
> > +     /* ori reg,reg,(op)@higher */
> >       patch_instruction((struct ppc_inst *)addr,
> > -                       ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
> > -                                ___PPC_RS(3) | ((val >> 32) & 0xffff))=
);
> > +                       ppc_inst(PPC_INST_ORI | ___PPC_RA(reg) |
> > +                                ___PPC_RS(reg) | ((val >> 32) & 0xffff=
)));
> >       addr++;
> >
> > -     /* rldicr r3,r3,32,31 */
> > +     /* rldicr reg,reg,32,31 */
> >       patch_instruction((struct ppc_inst *)addr,
> > -                       ppc_inst(PPC_INST_RLDICR | ___PPC_RA(3) |
> > -                                ___PPC_RS(3) | __PPC_SH64(32) | __PPC_=
ME64(31)));
> > +                       ppc_inst(PPC_INST_RLDICR | ___PPC_RA(reg) |
> > +                                ___PPC_RS(reg) | __PPC_SH64(32) | __PP=
C_ME64(31)));
> >       addr++;
> >
> > -     /* oris r3,r3,(op)@h */
> > +     /* oris reg,reg,(op)@h */
> >       patch_instruction((struct ppc_inst *)addr,
> > -                       ppc_inst(PPC_INST_ORIS | ___PPC_RA(3) |
> > -                                ___PPC_RS(3) | ((val >> 16) & 0xffff))=
);
> > +                       ppc_inst(PPC_INST_ORIS | ___PPC_RA(reg) |
> > +                                ___PPC_RS(reg) | ((val >> 16) & 0xffff=
)));
> >       addr++;
> >
> > -     /* ori r3,r3,(op)@l */
> > +     /* ori reg,reg,(op)@l */
> >       patch_instruction((struct ppc_inst *)addr,
> > -                       ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
> > -                                ___PPC_RS(3) | (val & 0xffff)));
> > +                       ppc_inst(PPC_INST_ORI | ___PPC_RA(reg) |
> > +                                ___PPC_RS(reg) | (val & 0xffff)));
> >   }
> >
> >   int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct=
 kprobe *p)
> >   {
> > -     struct ppc_inst branch_op_callback, branch_emulate_step;
> > +     struct ppc_inst branch_op_callback, branch_emulate_step, temp;
> >       kprobe_opcode_t *op_callback_addr, *emulate_step_addr, *buff;
> >       long b_offset;
> >       unsigned long nip, size;
> > @@ -249,7 +249,7 @@ int arch_prepare_optimized_kprobe(struct optimized_=
kprobe *op, struct kprobe *p)
> >        * Fixup the template with instructions to:
> >        * 1. load the address of the actual probepoint
> >        */
> > -     patch_imm64_load_insns((unsigned long)op, buff + TMPL_OP_IDX);
> > +     patch_imm64_load_insns((unsigned long)op, 3, buff + TMPL_OP_IDX);
> >
> >       /*
> >        * 2. branch to optimized_callback() and emulate_step()
> > @@ -282,7 +282,11 @@ int arch_prepare_optimized_kprobe(struct optimized=
_kprobe *op, struct kprobe *p)
> >       /*
> >        * 3. load instruction to be emulated into relevant register, and
> >        */
> > -     patch_imm32_load_insns(*p->ainsn.insn, buff + TMPL_INSN_IDX);
> > +     temp =3D ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
> > +     patch_imm64_load_insns(ppc_inst_val(temp) |
> > +                            ((u64)ppc_inst_suffix(temp) << 32),
> > +                            4,
>
> So now we are also using r4 ? Any explanation somewhere on the way it
> works ? This change seems unrelated to this patch, nothing in the
> description about it. Can we suddenly use a new register without problem =
?
Sorry it is not very clear, r4 was always being used.
patch_imm32_load_insns() hardcoded r4. We now need to load 64 bits as
we just introduced prefixed instruction, so are using
patch_imm64_load_insns(). That is the connection to the patch. But a
separate patch and description would probably make that clearer.

>
> > +                            buff + TMPL_INSN_IDX);
>
> What's the point with splitting this line in 4 lines ? Can't it fit in 2
> lines ?
Sure.
>
> >
> >       /*
> >        * 4. branch back from trampoline
> > diff --git a/arch/powerpc/kernel/optprobes_head.S b/arch/powerpc/kernel=
/optprobes_head.S
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
> >   optprobe_template_call_emulate:
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index d946f7d6bb32..58b67b62d5d3 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -24,13 +24,24 @@ static int __patch_instruction(struct ppc_inst *exe=
c_addr, struct ppc_inst instr
> >   {
> >       int err =3D 0;
> >
> > -     __put_user_asm(ppc_inst_val(instr), patch_addr, err, "stw");
> > -     if (err)
> > -             return err;
> > +     if (!ppc_inst_prefixed(instr)) {
> > +             __put_user_asm(ppc_inst_val(instr), patch_addr, err, "stw=
");
> > +             if (err)
> > +                     return err;
>
> This test should remain outside of the if/else, it doesn't need to be
> duplicated.
Okay.
>
> > +     } else {
> > +#ifdef CONFIG_CPU_LITTLE_ENDIAN
> > +             __put_user_asm((u64)ppc_inst_suffix(instr) << 32 |
> > +                            ppc_inst_val(instr), patch_addr, err, "std=
");
> > +#else
> > +             __put_user_asm((u64)ppc_inst_val(instr) << 32 |
> > +                            ppc_inst_suffix(instr), patch_addr, err, "=
std");
> > +#endif /* CONFIG_CPU_LITTLE_ENDIAN */
> > +             if (err)
> > +                     return err;
> > +     }
> >
> >       asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_ad=
dr),
> >                                                           "r" (exec_add=
r));
> > -
>
> Why remove the blank line ?
Sorry that was by mistake.
>
> >       return 0;
> >   }
> >
> > diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/featu=
re-fixups.c
> > index 2bd2b752de4f..a8238eff3a31 100644
> > --- a/arch/powerpc/lib/feature-fixups.c
> > +++ b/arch/powerpc/lib/feature-fixups.c
> > @@ -84,12 +84,13 @@ static int patch_feature_section(unsigned long valu=
e, struct fixup_entry *fcur)
> >       src =3D alt_start;
> >       dest =3D start;
> >
> > -     for (; src < alt_end; src++, dest++) {
> > +     for (; src < alt_end; src =3D (void *)src + ppc_inst_len(ppc_inst=
_read(src)),
> > +          (dest =3D (void *)dest + ppc_inst_len(ppc_inst_read(dest))))=
 {
>
> Can we do this outside the for() for readability ?
You are right, I will make it clearer.
>
> >               if (patch_alt_instruction(src, dest, alt_start, alt_end))
> >                       return 1;
> >       }
> >
> > -     for (; dest < end; dest++)
> > +     for (; dest < end; dest =3D (void *)dest + ppc_inst_len(ppc_inst(=
PPC_INST_NOP)))
> >               raw_patch_instruction(dest, ppc_inst(PPC_INST_NOP));
> >
> >       return 0;
> > diff --git a/arch/powerpc/lib/inst.c b/arch/powerpc/lib/inst.c
> > index 08dedd927268..eb6f9ee28ac6 100644
> > --- a/arch/powerpc/lib/inst.c
> > +++ b/arch/powerpc/lib/inst.c
> > @@ -3,9 +3,49 @@
> >    *  Copyright 2020, IBM Corporation.
> >    */
> >
> > +#include <asm/ppc-opcode.h>
> >   #include <linux/uaccess.h>
> >   #include <asm/inst.h>
> >
> > +#ifdef __powerpc64__
> > +int probe_user_read_inst(struct ppc_inst *inst,
> > +                      struct ppc_inst *nip)
> > +{
> > +     unsigned int val, suffix;
> > +     int err;
> > +
> > +     err =3D probe_user_read(&val, nip, sizeof(val));
>
> A user read is costly with KUAP. Can we do a 64 bits read and perform a
> 32 bits read only when 64 bits read fails ?
>
> > +     if (err)
> > +             return err;
> > +     if ((val >> 26) =3D=3D OP_PREFIX) {
>
> What about using get_op() from asm/disassemble.h instead of hardcodiing ?
>
> > +             err =3D probe_user_read(&suffix, (void *)nip + 4,
>
> 4 or sizeof(unsigned int) ? Why use both in the same line ?
True, doesn't really make sense.
>
> > +                                   sizeof(unsigned int));
> > +             *inst =3D ppc_inst_prefix(val, suffix);
> > +     } else {
> > +             *inst =3D ppc_inst(val);
> > +     }
> > +     return err;
> > +}
> > +
> > +int probe_kernel_read_inst(struct ppc_inst *inst,
> > +                        struct ppc_inst *src)
> > +{
> > +     unsigned int val, suffix;
> > +     int err;
> > +
> > +     err =3D probe_kernel_read(&val, src, sizeof(val));
> > +     if (err)
> > +             return err;
> > +     if ((val >> 26) =3D=3D OP_PREFIX) {
> > +             err =3D probe_kernel_read(&suffix, (void *)src + 4,
> > +                                     sizeof(unsigned int));
> > +             *inst =3D ppc_inst_prefix(val, suffix);
> > +     } else {
> > +             *inst =3D ppc_inst(val);
> > +     }
> > +     return err;
> > +}
> > +#else
> >   int probe_user_read_inst(struct ppc_inst *inst,
> >                        struct ppc_inst *nip)
> >   {
> > @@ -27,3 +67,4 @@ int probe_kernel_read_inst(struct ppc_inst *inst,
> >       *inst =3D ppc_inst(val);
> >       return err;
> >   }
> > +#endif /* __powerpc64__ */
> > diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> > index 95a56bb1ba3f..ecd756c346fd 100644
> > --- a/arch/powerpc/lib/sstep.c
> > +++ b/arch/powerpc/lib/sstep.c
> > @@ -1169,10 +1169,12 @@ int analyse_instr(struct instruction_op *op, co=
nst struct pt_regs *regs,
> >       unsigned long int imm;
> >       unsigned long int val, val2;
> >       unsigned int mb, me, sh;
> > -     unsigned int word;
> > +     unsigned int word, suffix;
> >       long ival;
> >
> >       word =3D ppc_inst_val(instr);
> > +     suffix =3D ppc_inst_suffix(instr);
> > +
> >       op->type =3D COMPUTE;
> >
> >       opcode =3D ppc_inst_primary_opcode(instr);
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index 4d6980d51456..647b3829c4eb 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -758,8 +758,8 @@ static int xmon_bpt(struct pt_regs *regs)
> >
> >       /* Are we at the trap at bp->instr[1] for some bp? */
> >       bp =3D in_breakpoint_table(regs->nip, &offset);
> > -     if (bp !=3D NULL && offset =3D=3D 4) {
> > -             regs->nip =3D bp->address + 4;
> > +     if (bp !=3D NULL && (offset =3D=3D 4 || offset =3D=3D 8)) {
> > +             regs->nip =3D bp->address + offset;
> >               atomic_dec(&bp->ref_count);
> >               return 1;
> >       }
> > diff --git a/arch/powerpc/xmon/xmon_bpts.S b/arch/powerpc/xmon/xmon_bpt=
s.S
> > index f3ad0ab50854..69726814cd27 100644
> > --- a/arch/powerpc/xmon/xmon_bpts.S
> > +++ b/arch/powerpc/xmon/xmon_bpts.S
> > @@ -4,6 +4,8 @@
> >   #include <asm/asm-offsets.h>
> >   #include "xmon_bpts.h"
> >
> > +/* Prefixed instructions can not cross 64 byte boundaries */
> > +.align 6
> >   .global bpt_table
> >   bpt_table:
> >       .space NBPTS * BPT_SIZE
> >
>
> Christophe
