Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D128159F49
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 03:57:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HPSv5nfWzDqMX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 13:57:35 +1100 (AEDT)
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
 header.s=20161025 header.b=EXp1NH3B; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HPQZ4fsjzDqHm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 13:55:34 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id 77so459172oty.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 18:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TlBdcRg9ey5gV3UfMZy/icm7NjJF7a843yQKhudt7j8=;
 b=EXp1NH3BSnRDP2xMi1sGP2/2TuG2kKPJ1h+D3Hv5cPyTNbmLfSHSrZrcEg/7VU4oMu
 HfUtmf+XZZmmvl8DjkIV2J8ukUSERIJOoHxuR2QA3LXVBUSUFqWFwmOgYAn+UmsHhQ96
 kql6j3dlVB1OGWUIyBlzMUtnZ1N7QoBXAup515h/v1mBRcy+zwn+vVtJuEHQS51sSsvM
 ChktJGjFWKTwX21ykgOEMjWw74IaemsCJWZPYXEyi/GsfXxnaQT66xbAnHTWtl3vC+pd
 iFJNixTSrb9TfA5Qt2IgTDjMsJ9WIC00y0cKnQ8KjK+fYPJclys2Ayzzclm5tqK7/cb9
 2x2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TlBdcRg9ey5gV3UfMZy/icm7NjJF7a843yQKhudt7j8=;
 b=qnOLCzuHx16hOLWRhuUK/yI5gI8IfRiUFgIY4DNSRSoanQkAj/kiSrXHJCWH1/TlrG
 QEb+4bnvscSduy6PMspQpKwatfZNvT+vxPNyFUxah+9laz0FNWrwRneWvBrZDmhK0KUw
 EwamZAQlcga5hXysjG9Hx6DM0h1z+rQ3/FzIKO+YhYlVJEDvpSyHQnaptJm0ibP2Hq4j
 t40k2l3eH/9JmSEeN0vucW3Ulri5/uLjKpS0MdDBHDY52RQAYKPdbb9yTO8H/Mf+Wu9c
 w16ndVo1ZU4j+ScRCEsD3ZTc5N78L3JN/3lCaTBpmRJIhEoEI5NEM1hz4MA44ILBBEkj
 cxZg==
X-Gm-Message-State: APjAAAUvfCxDPFW+vhLIBOqTryJxG8Cuo4spGcsMaLjJ6OvUHMiDwCXy
 fXAh+IBekl4mGvm8xzNPIKTgJTp3SCIll57oKPs=
X-Google-Smtp-Source: APXvYqztGbeBlwDc2KJr4rURR2GWVv7fIIWlb7ej+Li7dnyR4pVxXTpWtVTgodmKFJE5VWoGu+6jTf7r9cqXDp1F5o8=
X-Received: by 2002:a05:6830:1304:: with SMTP id
 p4mr7726742otq.327.1581476132038; 
 Tue, 11 Feb 2020 18:55:32 -0800 (PST)
MIME-Version: 1.0
References: <20200211053355.21574-1-jniethe5@gmail.com>
 <20200211053355.21574-7-jniethe5@gmail.com>
 <c5381bc3-82c1-541e-6c8c-95997d61e0a5@c-s.fr>
In-Reply-To: <c5381bc3-82c1-541e-6c8c-95997d61e0a5@c-s.fr>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 12 Feb 2020 13:55:20 +1100
Message-ID: <CACzsE9p95K_+_v4m_kH2TA413zq_N6Kw4OnG9FxG1xCeYsX_EQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] powerpc: Support prefixed instructions in
 alignment handler
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: Balamuruhan S <bala24@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 11, 2020 at 5:14 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
>
> Le 11/02/2020 =C3=A0 06:33, Jordan Niethe a =C3=A9crit :
> > Alignment interrupts can be caused by prefixed instructions accessing
> > memory. In the alignment handler the instruction that caused the
> > exception is loaded and attempted emulate. If the instruction is a
> > prefixed instruction load the prefix and suffix to emulate. After
> > emulating increment the NIP by 8.
> >
> > Prefixed instructions are not permitted to cross 64-byte boundaries. If
> > they do the alignment interrupt is invoked with SRR1 BOUNDARY bit set.
> > If this occurs send a SIGBUS to the offending process if in user mode.
> > If in kernel mode call bad_page_fault().
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v2: - Move __get_user_instr() and __get_user_instr_inatomic() to this
> > commit (previously in "powerpc sstep: Prepare to support prefixed
> > instructions").
> >      - Rename sufx to suffix
> >      - Use a macro for calculating instruction length
> > ---
> >   arch/powerpc/include/asm/uaccess.h | 30 +++++++++++++++++++++++++++++=
+
> >   arch/powerpc/kernel/align.c        |  8 +++++---
> >   arch/powerpc/kernel/traps.c        | 21 ++++++++++++++++++++-
> >   3 files changed, 55 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/=
asm/uaccess.h
> > index 2f500debae21..30f63a81c8d8 100644
> > --- a/arch/powerpc/include/asm/uaccess.h
> > +++ b/arch/powerpc/include/asm/uaccess.h
> > @@ -474,4 +474,34 @@ static __must_check inline bool user_access_begin(=
const void __user *ptr, size_t
> >   #define unsafe_copy_to_user(d, s, l, e) \
> >       unsafe_op_wrap(raw_copy_to_user_allowed(d, s, l), e)
> >
>
> Could it go close to other __get_user() and friends instead of being at
> the end of the file ?
Will do.
>
> > +/*
> > + * When reading an instruction iff it is a prefix, the suffix needs to=
 be also
> > + * loaded.
> > + */
> > +#define __get_user_instr(x, y, ptr)                  \
> > +({                                                   \
> > +     long __gui_ret =3D 0;                             \
> > +     y =3D 0;                                          \
> > +     __gui_ret =3D __get_user(x, ptr);                 \
> > +     if (!__gui_ret) {                               \
> > +             if (IS_PREFIX(x))                       \
>
> Does this apply to PPC32 ?
No, for now (and the foreseeable future) it will just affect 64s.
> If not, can we make sure IS_PREFIX is constant 0 on PPC32 so that the
> second read gets dropped at compile time ?
>
> Can we instead do :
>
>         if (!__gui_ret && IS_PREFIX(x))
Will do.
>
> > +                     __gui_ret =3D __get_user(y, ptr + 1);     \
> > +     }                                               \
> > +                                                     \
> > +     __gui_ret;                                      \
> > +})
> > +
> > +#define __get_user_instr_inatomic(x, y, ptr)         \
> > +({                                                   \
> > +     long __gui_ret =3D 0;                             \
> > +     y =3D 0;                                          \
> > +     __gui_ret =3D __get_user_inatomic(x, ptr);        \
> > +     if (!__gui_ret) {                               \
> > +             if (IS_PREFIX(x))                       \
>
> Same commments as above
>
> > +                     __gui_ret =3D __get_user_inatomic(y, ptr + 1);   =
 \
> > +     }                                               \
> > +                                                     \
> > +     __gui_ret;                                      \
> > +})
> > +
> >   #endif      /* _ARCH_POWERPC_UACCESS_H */
> > diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> > index ba3bf5c3ab62..e42cfaa616d3 100644
> > --- a/arch/powerpc/kernel/align.c
> > +++ b/arch/powerpc/kernel/align.c
> > @@ -293,7 +293,7 @@ static int emulate_spe(struct pt_regs *regs, unsign=
ed int reg,
> >
> >   int fix_alignment(struct pt_regs *regs)
> >   {
> > -     unsigned int instr;
> > +     unsigned int instr, suffix;
> >       struct instruction_op op;
> >       int r, type;
> >
> > @@ -303,13 +303,15 @@ int fix_alignment(struct pt_regs *regs)
> >        */
> >       CHECK_FULL_REGS(regs);
> >
> > -     if (unlikely(__get_user(instr, (unsigned int __user *)regs->nip))=
)
> > +     if (unlikely(__get_user_instr(instr, suffix,
> > +                              (unsigned int __user *)regs->nip)))
> >               return -EFAULT;
> >       if ((regs->msr & MSR_LE) !=3D (MSR_KERNEL & MSR_LE)) {
> >               /* We don't handle PPC little-endian any more... */
> >               if (cpu_has_feature(CPU_FTR_PPC_LE))
> >                       return -EIO;
> >               instr =3D swab32(instr);
> > +             suffix =3D swab32(suffix);
> >       }
> >
> >   #ifdef CONFIG_SPE
> > @@ -334,7 +336,7 @@ int fix_alignment(struct pt_regs *regs)
> >       if ((instr & 0xfc0006fe) =3D=3D (PPC_INST_COPY & 0xfc0006fe))
> >               return -EIO;
> >
> > -     r =3D analyse_instr(&op, regs, instr, PPC_NO_SUFFIX);
> > +     r =3D analyse_instr(&op, regs, instr, suffix);
> >       if (r < 0)
> >               return -EINVAL;
> >
> > diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> > index 82a3438300fd..d80b82fc1ae3 100644
> > --- a/arch/powerpc/kernel/traps.c
> > +++ b/arch/powerpc/kernel/traps.c
> > @@ -583,6 +583,10 @@ static inline int check_io_access(struct pt_regs *=
regs)
> >   #define REASON_ILLEGAL              (ESR_PIL | ESR_PUO)
> >   #define REASON_PRIVILEGED   ESR_PPR
> >   #define REASON_TRAP         ESR_PTR
> > +#define REASON_PREFIXED              0
> > +#define REASON_BOUNDARY              0
> > +
> > +#define inst_length(reason)  4
> >
> >   /* single-step stuff */
> >   #define single_stepping(regs)       (current->thread.debug.dbcr0 & DB=
CR0_IC)
> > @@ -597,6 +601,10 @@ static inline int check_io_access(struct pt_regs *=
regs)
> >   #define REASON_ILLEGAL              SRR1_PROGILL
> >   #define REASON_PRIVILEGED   SRR1_PROGPRIV
> >   #define REASON_TRAP         SRR1_PROGTRAP
> > +#define REASON_PREFIXED              SRR1_PREFIXED
> > +#define REASON_BOUNDARY              SRR1_BOUNDARY
> > +
> > +#define inst_length(reason)  (((reason) & REASON_PREFIXED) ? 8 : 4)
> >
> >   #define single_stepping(regs)       ((regs)->msr & MSR_SE)
> >   #define clear_single_step(regs)     ((regs)->msr &=3D ~MSR_SE)
> > @@ -1593,11 +1601,20 @@ void alignment_exception(struct pt_regs *regs)
> >   {
> >       enum ctx_state prev_state =3D exception_enter();
> >       int sig, code, fixed =3D 0;
> > +     unsigned long  reason;
> >
> >       /* We restore the interrupt state now */
> >       if (!arch_irq_disabled_regs(regs))
> >               local_irq_enable();
> >
> > +     reason =3D get_reason(regs);
> > +
> > +     if (reason & REASON_BOUNDARY) {
> > +             sig =3D SIGBUS;
> > +             code =3D BUS_ADRALN;
> > +             goto bad;
> > +     }
> > +
> >       if (tm_abort_check(regs, TM_CAUSE_ALIGNMENT | TM_CAUSE_PERSISTENT=
))
> >               goto bail;
> >
> > @@ -1606,7 +1623,8 @@ void alignment_exception(struct pt_regs *regs)
> >               fixed =3D fix_alignment(regs);
> >
> >       if (fixed =3D=3D 1) {
> > -             regs->nip +=3D 4; /* skip over emulated instruction */
> > +             /* skip over emulated instruction */
> > +             regs->nip +=3D inst_length(reason);
> >               emulate_single_step(regs);
> >               goto bail;
> >       }
> > @@ -1619,6 +1637,7 @@ void alignment_exception(struct pt_regs *regs)
> >               sig =3D SIGBUS;
> >               code =3D BUS_ADRALN;
> >       }
> > +bad:
> >       if (user_mode(regs))
> >               _exception(sig, regs, code, regs->dar);
> >       else
> >
>
> Christophe
