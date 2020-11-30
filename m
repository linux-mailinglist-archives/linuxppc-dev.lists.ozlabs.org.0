Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6EA2C7C32
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 02:03:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ckn5v360kzDqfW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 12:02:59 +1100 (AEDT)
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
 header.s=20161025 header.b=gcHIjq8Z; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckn263gLfzDr0k
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 11:59:42 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id 79so9803298otc.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 16:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T0oIwZH9EvqWNIRm1O71BQolDUaGdANtiWx90IFD9kA=;
 b=gcHIjq8ZHiDcQ2quxPcijd+SNdoIUU7l82250h0p32OPbu60Rst0GKxM4AKuaQ0+Pb
 2tPK8zkNXjYVQhsgBLKo6WjrTmc3tHKFWPDBARAglDYqOjmT5BrQW4Wk8OfqXJPyLv90
 RyYKG0+X/zuzqAtgArgghxhSpima29/xks2j9P0VqeW15ST11iFE/cKAY3u6/kwyCoIM
 PRW5MHGiqGeNNsC7mqtLddnYu9x/nd+0n3chgY9pvpl2DG1suXFRyMU+MUlB98Jh+0Bo
 7CD/3Q5nRdjFk6LC9e/NdSJ+xHKyyUiv2x/uuzyKWiXTRawW8iXKyQCLBsb9yJQbjGZZ
 /pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T0oIwZH9EvqWNIRm1O71BQolDUaGdANtiWx90IFD9kA=;
 b=cCF0w82Zcc5YvCGJu3rGZHI0Jf8KV8Zree50SxCvn+P9Hn/Rf9Px0fGDMHsPJgMlce
 5osPcd8YsUtMdWEbqTtF/BgE1kTjsPjjWXKU0dlG6f8TB/gWBcei5wtCduALNcho7eRO
 rSM5c/Q3azUwS7D8FaEDxhjT/mZ5tLhd+/8DpqCHAyXtN523riwoyON3Kt2Vh/8BTmSi
 tRfVLasGU+TU+gkhnxAQShIfoAUNGnvOxNSigymapAuoj0aogizPws2qnszJgwM/0WwO
 ptOjmMB7caRIWh0Nw63gvMdsWWReP6AOSuIvuah/RXrDgjbqB5fHg0iBlV1+4R/OyiN7
 DfWA==
X-Gm-Message-State: AOAM531CwN0WcE02FYhulzhjg2+MRA388JIxn07yCKXHIqzjJHM3NoX2
 jpj/hZtgZqMZNAf8oHc5i2BppPMPs/0fedccGaIzAzCjgUKS5g==
X-Google-Smtp-Source: ABdhPJyIUUlA+t+JZA3NGlHn3HMfCs0Gpn3IHwKQPbHr2qKeJTqXPtl77GomtpC8OpIn4DRa2Gm/tL6cRVvGc+cLi9w=
X-Received: by 2002:a9d:23e3:: with SMTP id t90mr14654704otb.51.1606697978584; 
 Sun, 29 Nov 2020 16:59:38 -0800 (PST)
MIME-Version: 1.0
References: <20201127030238.763-1-jniethe5@gmail.com>
 <5c997bc4-c859-0db6-f167-37ca37819059@csgroup.eu>
In-Reply-To: <5c997bc4-c859-0db6-f167-37ca37819059@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 30 Nov 2020 11:59:27 +1100
Message-ID: <CACzsE9oLn55hfpWoxamUQmHks5uL8Euc2k6XhUavbVkhsRBhSQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Allow relative pointers in bug table entries
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 29, 2020 at 6:00 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 27/11/2020 =C3=A0 04:02, Jordan Niethe a =C3=A9crit :
> > This enables GENERIC_BUG_RELATIVE_POINTERS on Power so that 32-bit
> > offsets are stored in the bug entries rather than 64-bit pointers.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> >   arch/powerpc/Kconfig           |  4 ++++
> >   arch/powerpc/include/asm/bug.h | 37 ++++++++++++++++++++++++++++++++-=
-
> >   arch/powerpc/xmon/xmon.c       | 17 ++++++++++++++--
> >   3 files changed, 54 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index e9f13fe08492..294108e0e5c6 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -311,6 +311,10 @@ config GENERIC_BUG
> >       default y
> >       depends on BUG
> >
> > +config GENERIC_BUG_RELATIVE_POINTERS
> > +     def_bool y
> > +     depends on GENERIC_BUG
> > +
> >   config SYS_SUPPORTS_APM_EMULATION
> >       default y if PMAC_APM_EMU
> >       bool
> > diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/=
bug.h
> > index 338f36cd9934..d03d834042a1 100644
> > --- a/arch/powerpc/include/asm/bug.h
> > +++ b/arch/powerpc/include/asm/bug.h
> > @@ -12,7 +12,11 @@
> >   #ifdef CONFIG_DEBUG_BUGVERBOSE
> >   .macro EMIT_BUG_ENTRY addr,file,line,flags
> >        .section __bug_table,"aw"
> > +#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
>
> As far as I understand, as soon as CONFIG_BUG is selected, GENERIC_BUG is=
 automatically selected so
> GENERIC_BUG_RELATIVE_POINTERS is selected as well. Therefore this #ifndef=
 is never possible.
Thanks, you are right. I'll fix that up.
>
> >   5001:        PPC_LONG \addr, 5002f
> > +#else
> > +5001:         .4byte \addr - 5001b, 5002f - 5001b
> > +#endif /* CONFIG_GENERIC_BUG_RELATIVE_POINTERS */
> >        .short \line, \flags
> >        .org 5001b+BUG_ENTRY_SIZE
> >        .previous
> > @@ -23,7 +27,11 @@
> >   #else
> >   .macro EMIT_BUG_ENTRY addr,file,line,flags
> >        .section __bug_table,"aw"
> > +#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
>
> Same
>
> >   5001:        PPC_LONG \addr
> > +#else
> > +5001:         .4byte \addr - 5001b
> > +#endif /* CONFIG_GENERIC_BUG_RELATIVE_POINTERS */
> >        .short \flags
> >        .org 5001b+BUG_ENTRY_SIZE
> >        .previous
> > @@ -34,20 +42,45 @@
> >   /* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags a=
nd
> >      sizeof(struct bug_entry), respectively */
> >   #ifdef CONFIG_DEBUG_BUGVERBOSE
> > +#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
>
> Same
>
> >   #define _EMIT_BUG_ENTRY                             \
> >       ".section __bug_table,\"aw\"\n"         \
> >       "2:\t" PPC_LONG "1b, %0\n"              \
> >       "\t.short %1, %2\n"                     \
> >       ".org 2b+%3\n"                          \
> >       ".previous\n"
> > -#else
> > +
> > +#else /* relative pointers */
> > +
> > +#define _EMIT_BUG_ENTRY                              \
> > +     ".section __bug_table,\"aw\"\n"         \
> > +     "2:\t.4byte 1b - 2b, %0 - 2b\n"         \
> > +     "\t.short %1, %2\n"                     \
> > +     ".org 2b+%3\n"                          \
> > +     ".previous\n"
> > +#endif /* relative pointers */
> > +
> > +#else /* verbose */
> > +
> > +#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
>
> Same
>
> >   #define _EMIT_BUG_ENTRY                             \
> >       ".section __bug_table,\"aw\"\n"         \
> >       "2:\t" PPC_LONG "1b\n"                  \
> >       "\t.short %2\n"                         \
> >       ".org 2b+%3\n"                          \
> >       ".previous\n"
> > -#endif
> > +
> > +#else /* relative pointers */
> > +
> > +#define _EMIT_BUG_ENTRY                              \
> > +     ".section __bug_table,\"aw\"\n"         \
> > +     "2:\t.4byte 1b - 2b\n"          \
> > +     "\t.short %2\n"                         \
> > +     ".org 2b+%3\n"                          \
> > +     ".previous\n"
> > +
> > +#endif /* relative pointers */
> > +#endif /* verbose */
> >
> >   #define BUG_ENTRY(insn, flags, ...)                 \
> >       __asm__ __volatile__(                           \
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index 55c43a6c9111..5f7cf7e95767 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -1731,6 +1731,9 @@ static void print_bug_trap(struct pt_regs *regs)
> >   #ifdef CONFIG_BUG
> >       const struct bug_entry *bug;
> >       unsigned long addr;
> > +#ifdef CONFIG_DEBUG_BUGVERBOSE
> > +     char *file;
> > +#endif
> >
> >       if (regs->msr & MSR_PR)
> >               return;         /* not in kernel */
> > @@ -1744,10 +1747,20 @@ static void print_bug_trap(struct pt_regs *regs=
)
> >               return;
> >
> >   #ifdef CONFIG_DEBUG_BUGVERBOSE
> > +#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
>
> Same
>
> > +     file =3D bug->file;
> > +#else /* relative pointers */
> > +     file =3D (char *)bug + bug->file_disp;
> > +#endif /* relative pointers */
> >       printf("kernel BUG at %s:%u!\n",
> > -            bug->file, bug->line);
> > +            file, bug->line);
> >   #else
> > -     printf("kernel BUG at %px!\n", (void *)bug->bug_addr);
> > +#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
>
> Same
>
> > +     addr =3D bug->addr;
> > +#else /* relative pointers */
> > +     addr =3D (unsigned long)bug + bug->bug_addr_disp;
> > +#endif /* relative pointers */
> > +     printf("kernel BUG at %px!\n", (void *)addr);
> >   #endif
> >   #endif /* CONFIG_BUG */
> >   }
> >
>
> Christophe
