Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B985F627C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 10:23:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjkwT4P8Lz3cBS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 19:23:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nZNDQt8F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nZNDQt8F;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjkvY74NMz30MT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 19:22:33 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id y136so1419995pfb.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 01:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=psS2jEDaZwmPQ2PvVHmqLj5KAvqnRM6VGDvy2GUYEB8=;
        b=nZNDQt8FFOaQZBJAhl4+Y9EvUgt0VTHY5b0wwvpA8576/ZfC5AAhni3GG6aJWk6dS1
         vfqqaoHJee64KwuZNv6lOP0mEMQ1U03FoVX+4do7oTLGgpNJXP3kRcBb8bF7LUAvbkA2
         uyCmk8XqTAbo09gkHUEnNy07ASJSagC99gyq7xzk9SwUtUuoBYS07B6TfneoeJSqmOb2
         7WYUApRxCbBlDB1d01wLBUvjHPOUJ/gmxBV2eOJnPEDJZ8NpgVDked/QZQSCfdt4Ikkd
         ZRN50QnLPS++MUU+dRQX3j7o9aLxv4sp3bbDITYjxeVOwgCc/DN/pVv4J/K05y2H6DqL
         Db5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=psS2jEDaZwmPQ2PvVHmqLj5KAvqnRM6VGDvy2GUYEB8=;
        b=S/yIa0c4C41pXxbRxb9p93WFoA/C+nk6YRt2GihyhoM5I4L/pBRIbPLlYvJemlbRg7
         jU7Jpi9Hz/vbpJll4Rtcwhbbg4lS91L4qcP6GyAOVkZ20cDwxXvlQBW5Xu17+qcfXsqu
         02+B4bWChBeyUWxgdCK/61eX4zjeoz4DfXA4jOvLgnJn+kO1w0rx1xqiwNRZJRjzP/7E
         GPT08Vku941ExTmcsOwDNntdUNbOUyovRr+UhRloo0pQfCeyYBKybNTTGicKKbWLpMu7
         z6qxIh5hAKqfhleIoo34qBb5VjBBqE7sscA7LkIKA5nlnUIQI0moLWmzxJmE38Hi214Q
         YBrg==
X-Gm-Message-State: ACrzQf2suvqAU8VfTGmnwhNES6HRtcdufciekU4vPGiE4RoPpk+x3cWL
	HmVIB6eWzefqbXFNpNsuKcj36CQwd9BhOg==
X-Google-Smtp-Source: AMsMyM4Xy+eaOXlbiVHvAAIaQmWraVSI6obSxvh5d3C3I6GQW+dAshiD61q0JbCwBmyUZB4J54bOvA==
X-Received: by 2002:a65:4689:0:b0:458:764a:221b with SMTP id h9-20020a654689000000b00458764a221bmr3579652pgr.296.1665044550862;
        Thu, 06 Oct 2022 01:22:30 -0700 (PDT)
Received: from localhost ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id bx4-20020a17090af48400b00203c0a1d56bsm2338930pjb.35.2022.10.06.01.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 01:22:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Oct 2022 18:22:26 +1000
Message-Id: <CNEP14SSR4QI.I26M3DYXJE5N@bobo>
Subject: Re: [RFC PATCH 1/3] powerpc/32: Implement
 HAVE_CONTEXT_TRACKING_USER support
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20221004063306.511154-1-npiggin@gmail.com>
 <20221004063306.511154-2-npiggin@gmail.com>
 <c3f87f7b-c4f9-eca0-a8dd-acc6e7e9f02b@csgroup.eu>
In-Reply-To: <c3f87f7b-c4f9-eca0-a8dd-acc6e7e9f02b@csgroup.eu>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Oct 4, 2022 at 9:32 PM AEST, Christophe Leroy wrote:
>
>
> Le 04/10/2022 =C3=A0 08:33, Nicholas Piggin a =C3=A9crit=C2=A0:
> > Context tracking involves tracking user, kernel, guest switches. This
> > enables existing context tracking code for interrupt entry on 32-bit.
> > KVM and interrupt exit already has context tracking calls.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   arch/powerpc/Kconfig                 |  2 +-
> >   arch/powerpc/include/asm/interrupt.h | 21 ++++++---------------
> >   2 files changed, 7 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 81c9f895d690..f667279ec74c 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -204,7 +204,7 @@ config PPC
> >   	select HAVE_ARCH_SECCOMP_FILTER
> >   	select HAVE_ARCH_TRACEHOOK
> >   	select HAVE_ASM_MODVERSIONS
> > -	select HAVE_CONTEXT_TRACKING_USER		if PPC64
> > +	select HAVE_CONTEXT_TRACKING_USER
> >   	select HAVE_C_RECORDMCOUNT
> >   	select HAVE_DEBUG_KMEMLEAK
> >   	select HAVE_DEBUG_STACKOVERFLOW
> > diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/includ=
e/asm/interrupt.h
> > index 4745bb9998bd..8860a246d51a 100644
> > --- a/arch/powerpc/include/asm/interrupt.h
> > +++ b/arch/powerpc/include/asm/interrupt.h
> > @@ -85,6 +85,8 @@ do {									\
> >   	    (user_mode(regs) || (TRAP(regs) !=3D INTERRUPT_PROGRAM)))	\
> >   		BUG_ON(cond);						\
> >   } while (0)
> > +#else
> > +#define INT_SOFT_MASK_BUG_ON(regs, cond)
>
> Here you can just drop the ifdef CONFIG_PPC64 I guess instead of adding=
=20
> an additional empty macro.

I couldn't because some of the statements use some PPC64-only variables.
It ends up looking a bit better this way.

> >   #endif
> >  =20
> >   #ifdef CONFIG_PPC_BOOK3S_64
> > @@ -152,19 +154,8 @@ static inline void booke_restore_dbcr0(void)
> >   static inline void interrupt_enter_prepare(struct pt_regs *regs)
> >   {
> >   #ifdef CONFIG_PPC32
> > -	if (!arch_irq_disabled_regs(regs))
> > -		trace_hardirqs_off();
> > -
> > -	if (user_mode(regs))
> > -		kuap_lock();
> > -	else
> > -		kuap_save_and_lock(regs);
> > -
> > -	if (user_mode(regs))
> > -		account_cpu_user_entry();
> > -#endif
> > -
> > -#ifdef CONFIG_PPC64
> > +	bool trace_enable =3D !arch_irq_disabled_regs(regs);
>
> nit: You could be put this as an #else to the existing #ifdef CONFIG_PPC6=
4

Yep, I was able to clean it up even a bit better actually.

Thanks,
Nick
