Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AB912A8C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Dec 2019 19:11:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47jh453F9xzDqKW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2019 05:11:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=byj.tea@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="B1UuMupM"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hf1P21DqzDqDm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 12:35:31 +1100 (AEDT)
Received: by mail-io1-xd42.google.com with SMTP id c16so16411932ioh.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2019 17:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9lmC0cEb7NijnFrwroELGHeSVAX59tyGYC7C4mWEi2k=;
 b=B1UuMupMzU6CvsK1M8U19051nfyVhd1G/xTieA9RShOJcjMhmLMUZIfe6A42Cdauwe
 twErhsT6BCAnhKC5dqqhfxBw3UA+c0i9F7mMX9w2odxxx7vC/onGDursDbiXi23r+zgz
 hzTBTPHIZTvO1/7BR9JjbMLag7xt/kR4L3q4+Om+9WarzYjTejq8Z4YgrBjzd6KRxYst
 gFqaeZIaIEyY/gblrioTxzia0VRRLVg5PBX7pHVwiOgE3tj+Owk24iMDyj2hjHXoUueW
 h7ayQf3MSpnF5O8VTmXeypm/GGN68OwpnMic09yKrVzwGbCSGy3h4V6NZaviJbRsh9Zz
 gebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9lmC0cEb7NijnFrwroELGHeSVAX59tyGYC7C4mWEi2k=;
 b=FvNRLeP/hnHun8oJ3Z6zeh2lCwU7bnXRXVXMx7BPnRG7rSXwBSxmDY8xOsXOmmXoeC
 olAXVkwfzgGGGH818r8ajcwGX9Xfs9c0kswc3KDKpQA3+MZlcOxMawM6HwIl1l0CuwdR
 VOfVqCav/XTS9HOSvOxMFDi+kviFsehibybQTnRqunKSaUBgpkM4SWB75WuPAtmxjVeR
 vD6+ZuwPi9RkNFw4uAYoLqjSlsP2zrhV8RNmJ/iRDJGWP5wUFU7QlxTAVBUmcBcdE1Y+
 5j/dUEteWKIbvKrJGZtCzNQh+fVnjt+D5/9EGYcRtImpjUdKK7DsjCR2UWPV5EcjDOUr
 sJDQ==
X-Gm-Message-State: APjAAAVF5myg+peqRLS/5ZA0jo43bmLsuRbAYkQWaUXrRgcK12hGe9B7
 EhYNRBfE5vORbx3nD0uefzRRkhBUkKUXHeXi8Xg=
X-Google-Smtp-Source: APXvYqyANcx7D97M/9YZtBXmDKHROxQ6MY2zr+nlO+rOorkbsUyKV+d0LGUBSaX2CbaKZFMWuBmHum1Pqwx/EVjcefQ=
X-Received: by 2002:a5d:9f4f:: with SMTP id u15mr6520488iot.129.1577151327920; 
 Mon, 23 Dec 2019 17:35:27 -0800 (PST)
MIME-Version: 1.0
References: <1574694943-7883-1-git-send-email-yingjie_bai@126.com>
 <87pngglmxg.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pngglmxg.fsf@mpe.ellerman.id.au>
From: Yingjie Bai <byj.tea@gmail.com>
Date: Tue, 24 Dec 2019 09:35:16 +0800
Message-ID: <CAFAt38F-YQUVNXEnLut0tMivYUy_OTK7G4wAHfddcmncsEpREQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/mpc85xx: also write addr_h to spin table for
 64bit boot entry
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 26 Dec 2019 05:07:16 +1100
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
Cc: yingjie_bai@126.com, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,
Thanks for pointing out the issue. My mistake...
This patch should indeed make sense only when
CONFIG_PHYS_64BIT=y

I could not find corenet32_smp_defconfig, but I guess in your config,
CONFIG_PHYS_64BIT=n ?
I will update the patch later today

On Sun, Dec 22, 2019 at 5:38 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> yingjie_bai@126.com writes:
> > From: Bai Yingjie <byj.tea@gmail.com>
> >
> > CPU like P4080 has 36bit physical address, its DDR physical
> > start address can be configured above 4G by LAW registers.
> >
> > For such systems in which their physical memory start address was
> > configured higher than 4G, we need also to write addr_h into the spin
> > table of the target secondary CPU, so that addr_h and addr_l together
> > represent a 64bit physical address.
> > Otherwise the secondary core can not get correct entry to start from.
> >
> > This should do no harm for normal case where addr_h is all 0.
> >
> > Signed-off-by: Bai Yingjie <byj.tea@gmail.com>
> > ---
> >  arch/powerpc/platforms/85xx/smp.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
> > index 8c7ea2486bc0..f12cdd1e80ff 100644
> > --- a/arch/powerpc/platforms/85xx/smp.c
> > +++ b/arch/powerpc/platforms/85xx/smp.c
> > @@ -252,6 +252,14 @@ static int smp_85xx_start_cpu(int cpu)
> >       out_be64((u64 *)(&spin_table->addr_h),
> >               __pa(ppc_function_entry(generic_secondary_smp_init)));
> >  #else
> > +     /*
> > +      * We need also to write addr_h to spin table for systems
> > +      * in which their physical memory start address was configured
> > +      * to above 4G, otherwise the secondary core can not get
> > +      * correct entry to start from.
> > +      * This does no harm for normal case where addr_h is all 0.
> > +      */
> > +     out_be32(&spin_table->addr_h, __pa(__early_start) >> 32);
> >       out_be32(&spin_table->addr_l, __pa(__early_start));
>
> This breaks the corenet32_smp_defconfig build:
>
>   /linux/arch/powerpc/platforms/85xx/smp.c: In function 'smp_85xx_start_cpu':
>   /linux/arch/powerpc/platforms/85xx/smp.c:262:52: error: right shift count >= width of type [-Werror=shift-count-overflow]
>     262 |  out_be32(&spin_table->addr_h, __pa(__early_start) >> 32);
>         |                                                    ^~
>   cc1: all warnings being treated as errors
>
> cheers
