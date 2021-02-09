Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A27314572
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 02:16:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZQ2j281tzDvWF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 12:16:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dbzmCbvK; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZQ0V1539zDrRv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 12:14:33 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id my11so688331pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 17:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Izt0VcAW3kwu4buskbodCOPYDlobWed7XGKjt8BxndM=;
 b=dbzmCbvKfqg+uS2oFA7Gj81/lPp5NdVL8cjvs7CSpEjHdoAsYS6MbNi87g1m9jWEMg
 MYE6jB2MjTUE8ufI7only2RYqjq+Td1asi5LQA1ge/YkaATGcE/it2n7mmEN/Vo++3Aa
 gLSmi8XlJBMAm1yHFQq/sTiRe/7h8yr6iePCFsQ6LOslenYhKcVMXpUjht3L9CaN1O+o
 cq+RqxPn6T+m/JtSVKGIjZZ3e/O71PY4YPoR7nMzM4h9pz9lxk6iU3EHZCDNsqTRWtyM
 987ioB6UfEBaKJQH98YtieJ3gTEgC85ehRvvdQbpegj725g0+YLzO/IFHpyEfT8eCXcE
 Rovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Izt0VcAW3kwu4buskbodCOPYDlobWed7XGKjt8BxndM=;
 b=FvBf+ZYCbnBo2cicAJvYp0zIFaM0HffJyaRurn6JL+RabCeU8MKuekUAAZfoITdP2J
 7vuQyREq+tKoYBc8LYd/b5SASAudeYVE8J17DxQrx0loa29aTZPC6vdhsz3ZBqkYMbme
 nmyRx+CqAivRHdGMDC6Sl8ogW/RC1C6O20uXY3iQmgY1njUEegPcFOWmsktVx7MhdzfK
 iLBKZpQz6JDkZhHjfzdwjj3yTZEDi2wdk5yI20tq1/oxsnqMb0fGH6Ef0r74w3RR6Moq
 cu84KIJti1eIHJIHKs5ppBA9wMv9pDGpWgY8ThLsuWwGBfmsyu//nRmGxLSmy7xE8dw6
 r/HQ==
X-Gm-Message-State: AOAM531DbKOyKdQkHuxBU/DIjfC4yIwcUbakuWO/g+Y0hEsw/D1rINF/
 /d4Ky4hrQR9rT7fZBefiPuY=
X-Google-Smtp-Source: ABdhPJxJlrI6uXzUN+sPMpbnOSoRjfNPR7JUyH7/BjY8blpX2NGo5SPI9lNeBJL/y114+kPagZo1Xg==
X-Received: by 2002:a17:902:4a:b029:e2:f3dc:811b with SMTP id
 68-20020a170902004ab02900e2f3dc811bmr882293pla.36.1612833269942; 
 Mon, 08 Feb 2021 17:14:29 -0800 (PST)
Received: from localhost ([220.240.226.199])
 by smtp.gmail.com with ESMTPSA id y9sm6455496pfr.192.2021.02.08.17.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 17:14:29 -0800 (PST)
Date: Tue, 09 Feb 2021 11:14:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 06/22] powerpc/irq: Rework helpers that manipulate
 MSR[EE/RI]
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <0e290372a0e7dc2ae657b4a01aec85f8de7fdf77.1612796617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <0e290372a0e7dc2ae657b4a01aec85f8de7fdf77.1612796617.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612833191.rod6qskvzc.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
> In preparation of porting PPC32 to C syscall entry/exit,
> rewrite the following helpers as static inline functions and
> add support for PPC32 in them:
> 	__hard_irq_enable()
> 	__hard_irq_disable()
> 	__hard_EE_RI_disable()
> 	__hard_RI_enable()
>=20
> Then use them in PPC32 version of arch_local_irq_disable()
> and arch_local_irq_enable() to avoid code duplication.
>=20

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/hw_irq.h | 75 +++++++++++++++++++++----------
>  arch/powerpc/include/asm/reg.h    |  1 +
>  2 files changed, 52 insertions(+), 24 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm=
/hw_irq.h
> index ed0c3b049dfd..4739f61e632c 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -50,6 +50,55 @@
> =20
>  #ifndef __ASSEMBLY__
> =20
> +static inline void __hard_irq_enable(void)
> +{
> +	if (IS_ENABLED(CONFIG_BOOKE) || IS_ENABLED(CONFIG_40x))
> +		wrtee(MSR_EE);
> +	else if (IS_ENABLED(CONFIG_PPC_8xx))
> +		wrtspr(SPRN_EIE);
> +	else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
> +		__mtmsrd(MSR_EE | MSR_RI, 1);
> +	else
> +		mtmsr(mfmsr() | MSR_EE);
> +}
> +
> +static inline void __hard_irq_disable(void)
> +{
> +	if (IS_ENABLED(CONFIG_BOOKE) || IS_ENABLED(CONFIG_40x))
> +		wrtee(0);
> +	else if (IS_ENABLED(CONFIG_PPC_8xx))
> +		wrtspr(SPRN_EID);
> +	else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
> +		__mtmsrd(MSR_RI, 1);
> +	else
> +		mtmsr(mfmsr() & ~MSR_EE);
> +}
> +
> +static inline void __hard_EE_RI_disable(void)
> +{
> +	if (IS_ENABLED(CONFIG_BOOKE) || IS_ENABLED(CONFIG_40x))
> +		wrtee(0);
> +	else if (IS_ENABLED(CONFIG_PPC_8xx))
> +		wrtspr(SPRN_NRI);
> +	else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
> +		__mtmsrd(0, 1);
> +	else
> +		mtmsr(mfmsr() & ~(MSR_EE | MSR_RI));
> +}
> +
> +static inline void __hard_RI_enable(void)
> +{
> +	if (IS_ENABLED(CONFIG_BOOKE) || IS_ENABLED(CONFIG_40x))
> +		return;
> +
> +	if (IS_ENABLED(CONFIG_PPC_8xx))
> +		wrtspr(SPRN_EID);
> +	else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
> +		__mtmsrd(MSR_RI, 1);
> +	else
> +		mtmsr(mfmsr() | MSR_RI);
> +}
> +
>  #ifdef CONFIG_PPC64
>  #include <asm/paca.h>
> =20
> @@ -212,18 +261,6 @@ static inline bool arch_irqs_disabled(void)
> =20
>  #endif /* CONFIG_PPC_BOOK3S */
> =20
> -#ifdef CONFIG_PPC_BOOK3E
> -#define __hard_irq_enable()	wrtee(MSR_EE)
> -#define __hard_irq_disable()	wrtee(0)
> -#define __hard_EE_RI_disable()	wrtee(0)
> -#define __hard_RI_enable()	do { } while (0)
> -#else
> -#define __hard_irq_enable()	__mtmsrd(MSR_EE|MSR_RI, 1)
> -#define __hard_irq_disable()	__mtmsrd(MSR_RI, 1)
> -#define __hard_EE_RI_disable()	__mtmsrd(0, 1)
> -#define __hard_RI_enable()	__mtmsrd(MSR_RI, 1)
> -#endif
> -
>  #define hard_irq_disable()	do {					\
>  	unsigned long flags;						\
>  	__hard_irq_disable();						\
> @@ -322,22 +359,12 @@ static inline unsigned long arch_local_irq_save(voi=
d)
> =20
>  static inline void arch_local_irq_disable(void)
>  {
> -	if (IS_ENABLED(CONFIG_BOOKE))
> -		wrtee(0);
> -	else if (IS_ENABLED(CONFIG_PPC_8xx))
> -		wrtspr(SPRN_EID);
> -	else
> -		mtmsr(mfmsr() & ~MSR_EE);
> +	__hard_irq_disable();
>  }
> =20
>  static inline void arch_local_irq_enable(void)
>  {
> -	if (IS_ENABLED(CONFIG_BOOKE))
> -		wrtee(MSR_EE);
> -	else if (IS_ENABLED(CONFIG_PPC_8xx))
> -		wrtspr(SPRN_EIE);
> -	else
> -		mtmsr(mfmsr() | MSR_EE);
> +	__hard_irq_enable();
>  }
> =20
>  static inline bool arch_irqs_disabled_flags(unsigned long flags)
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/re=
g.h
> index c5a3e856191c..bc4305ba00d0 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -1375,6 +1375,7 @@
>  #define mtmsr(v)	asm volatile("mtmsr %0" : \
>  				     : "r" ((unsigned long)(v)) \
>  				     : "memory")
> +#define __mtmsrd(v, l)	BUILD_BUG()
>  #define __MTMSR		"mtmsr"
>  #endif
> =20
> --=20
> 2.25.0
>=20
>=20
