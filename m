Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA0F4C3108
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 17:13:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Hxl2Pz3z3bZF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 03:12:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MMxNIcwA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b30;
 helo=mail-yb1-xb30.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MMxNIcwA; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Hx726fZz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 03:12:24 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id p19so458260ybc.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 08:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M6/DsYcMdCQ5Jv7h2HtppDAD63hulQRUnEll08wdM0w=;
 b=MMxNIcwAG1rEPw9GYtGcc1MbySE+4/aZhxOK9Arfa8JLcnH0cfZ64TEtJey0SODZ7C
 QBiByPS+i5aydu3vs8H0awLJPCpykYptJU2HmxOfIPQy8vs+fSr3SUJJNxd/KVNH/kNZ
 gjoFbkx/CDEUSFXXCM5T51pKHiPWXVwYVlaXGo94O4Cmtc1DR+BED9zBq+ATBB0gXAsU
 9w8HCZaC1ZZAwHI9UCrFptnAwn1x1krO6meiyDfKd7+rSVqIb0MYvV2xW4o0BAq/KmF8
 q69HHptkg51lHY1WR5Ir2y0+/4WIeubhQ74U4NMz+V9vB19oH7Z86WtRP9Ikzr/QZWt6
 IMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M6/DsYcMdCQ5Jv7h2HtppDAD63hulQRUnEll08wdM0w=;
 b=7w7yPOxMVrcs1Zg973nJnPq5bPMegfh30+ChijIQ9TpM+9dAAf9CMR9EG4cqZmUNB3
 hBWWT1wBzrJP/z28DOOLYCZIXRhwey8e5m6y3fz/TV+EF0CrkS/pI2owt7yGUo7ccFhd
 mHVPBhjUwGtgM9p0tCVWkMu8b0fMGpaaGSmjIkLc4ymydsjvKwzz+AwsjY1EYi1VCd5r
 wybcB4cg39asPCyLzM5QGcMwvhp5wd8Pkq2pLJeYdp+KO5zonmR40iyzs7JKxo6t4lat
 +8pDh/BdHJhBypSxi/SKtmFIcafQMhtQaUhdT094oCHDk927x7eMvTAt6dzSk7qYGZqX
 L0xA==
X-Gm-Message-State: AOAM530Y9NYUA76QjimAKF0yEPMjdquqtpO08ZJWW78YJuZ/JHZ04VvL
 iw9Lj2X9uJScjcHPoTEIFLNj71mffRYltVqmDNMBPA==
X-Google-Smtp-Source: ABdhPJx1PBFTzicPX+FhslEYT6ZwXv/E5aXyEeLEMZmHKuUh6nEpZizMLlaeQ3T+XDiafTBRLEZRxAV7na7hyyARMPw=
X-Received: by 2002:a25:ad9b:0:b0:624:5db2:2084 with SMTP id
 z27-20020a25ad9b000000b006245db22084mr3073965ybi.132.1645719140249; Thu, 24
 Feb 2022 08:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
 <871qzsphfv.fsf@mpe.ellerman.id.au>
In-Reply-To: <871qzsphfv.fsf@mpe.ellerman.id.au>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 24 Feb 2022 17:12:09 +0100
Message-ID: <CADYN=9L7L7+DOA6qYj4aOgg9rBhOrUCk5b4K5tr6wZ709WpsyA@mail.gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Feb 2022 at 13:39, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Hi Anders,

Hi Michael,

>
> Thanks for these, just a few comments below ...

I will resolve the comments below and resend a v2 shortly.

Cheers,
Anders

>
> Anders Roxell <anders.roxell@linaro.org> writes:
> > Building tinyconfig with gcc (Debian 11.2.0-16) and assembler (Debian
> > 2.37.90.20220207) the following build error shows up:
> >
> >  {standard input}: Assembler messages:
> >  {standard input}:1190: Error: unrecognized opcode: `stbcix'
> >  {standard input}:1433: Error: unrecognized opcode: `lwzcix'
> >  {standard input}:1453: Error: unrecognized opcode: `stbcix'
> >  {standard input}:1460: Error: unrecognized opcode: `stwcix'
> >  {standard input}:1596: Error: unrecognized opcode: `stbcix'
> >  ...
> >
> > Rework to add assembler directives [1] around the instruction. Going
> > through the them one by one shows that the changes should be safe.  Like
> > __get_user_atomic_128_aligned() is only called in p9_hmi_special_emu(),
> > which according to the name is specific to power9.  And __raw_rm_read*()
> > are only called in things that are powernv or book3s_hv specific.
> >
> > [1] https://sourceware.org/binutils/docs/as/PowerPC_002dPseudo.html#PowerPC_002dPseudo
> >
> > Cc: <stable@vger.kernel.org>
> > Co-developed-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >  arch/powerpc/include/asm/io.h        | 46 +++++++++++++++++++++++-----
> >  arch/powerpc/include/asm/uaccess.h   |  3 ++
> >  arch/powerpc/platforms/powernv/rng.c |  6 +++-
> >  3 files changed, 46 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
> > index beba4979bff9..5ff6dec489f8 100644
> > --- a/arch/powerpc/include/asm/io.h
> > +++ b/arch/powerpc/include/asm/io.h
> > @@ -359,25 +359,37 @@ static inline void __raw_writeq_be(unsigned long v, volatile void __iomem *addr)
> >   */
> >  static inline void __raw_rm_writeb(u8 val, volatile void __iomem *paddr)
> >  {
> > -     __asm__ __volatile__("stbcix %0,0,%1"
> > +     __asm__ __volatile__(".machine \"push\"\n"
> > +                          ".machine \"power6\"\n"
> > +                          "stbcix %0,0,%1\n"
> > +                          ".machine \"pop\"\n"
> >               : : "r" (val), "r" (paddr) : "memory");
>
> As Segher said it'd be cleaner without the embedded quotes.
>
> > @@ -441,7 +465,10 @@ static inline unsigned int name(unsigned int port)       \
> >       unsigned int x;                                 \
> >       __asm__ __volatile__(                           \
> >               "sync\n"                                \
> > +             ".machine \"push\"\n"                   \
> > +             ".machine \"power6\"\n"                 \
> >               "0:"    op "    %0,0,%1\n"              \
> > +             ".machine \"pop\"\n"                    \
> >               "1:     twi     0,%0,0\n"               \
> >               "2:     isync\n"                        \
> >               "3:     nop\n"                          \
> > @@ -465,7 +492,10 @@ static inline void name(unsigned int val, unsigned int port) \
> >  {                                                    \
> >       __asm__ __volatile__(                           \
> >               "sync\n"                                \
> > +             ".machine \"push\"\n"                   \
> > +             ".machine \"power6\"\n"                 \
> >               "0:" op " %0,0,%1\n"                    \
> > +             ".machine \"pop\"\n"                    \
> >               "1:     sync\n"                         \
> >               "2:\n"                                  \
> >               EX_TABLE(0b, 2b)                        \
>
> It's not visible from the diff, but the above two are __do_in_asm and
> __do_out_asm and are inside an ifdef CONFIG_PPC32.
>
> AFAICS they're only used for:
>
> __do_in_asm(_rec_inb, "lbzx")
> __do_in_asm(_rec_inw, "lhbrx")
> __do_in_asm(_rec_inl, "lwbrx")
> __do_out_asm(_rec_outb, "stbx")
> __do_out_asm(_rec_outw, "sthbrx")
> __do_out_asm(_rec_outl, "stwbrx")
>
> Which are all old instructions, so I don't think we need the machine
> power6 for those two macros?
>
> > diff --git a/arch/powerpc/platforms/powernv/rng.c b/arch/powerpc/platforms/powernv/rng.c
> > index b4386714494a..5bf30ef6d928 100644
> > --- a/arch/powerpc/platforms/powernv/rng.c
> > +++ b/arch/powerpc/platforms/powernv/rng.c
> > @@ -43,7 +43,11 @@ static unsigned long rng_whiten(struct powernv_rng *rng, unsigned long val)
> >       unsigned long parity;
> >
> >       /* Calculate the parity of the value */
> > -     asm ("popcntd %0,%1" : "=r" (parity) : "r" (val));
> > +     asm (".machine \"push\"\n"
> > +          ".machine \"power7\"\n"
> > +          "popcntd %0,%1\n"
> > +          ".machine \"pop\"\n"
> > +          : "=r" (parity) : "r" (val));
>
> This was actually present in an older CPU, but it doesn't really matter,
> this is fine.
>
> cheers
