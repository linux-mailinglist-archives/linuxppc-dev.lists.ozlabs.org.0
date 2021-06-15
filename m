Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B79C3A7369
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 03:40:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3rck5dJmz3c5V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 11:40:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=p77anhTF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=3lgx=lj=gmail.com=npiggin@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p77anhTF; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3rcG1pyCz2xYg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 11:40:29 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4G3rc9090Wz9sf9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 11:40:25 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G3rc86mrsz9sXG; Tue, 15 Jun 2021 11:40:24 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p77anhTF; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4G3rc84ypKz9sWF;
 Tue, 15 Jun 2021 11:40:22 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id h12so12036237pfe.2;
 Mon, 14 Jun 2021 18:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=aQ6Gt7Zxlm19ra+VwyqtbP1AU/08f0d2oUSEXVLnMNo=;
 b=p77anhTFdeu+cYP2ivVJ/+cAmsbpW+QX08mv2qn29/FQyQUSRXAizzwnxDF3ZQa0DK
 ChMMrxpVu9aDbUsxat7mdhX7JKo2Qg8AdZfMUhmaywVCcAhXb0ATRpOcN/tbiEEslhf0
 u10LJ+e/HR+xVE3TMLFbqwujmtc1j6b0MOWWCM1WyG8uIN//fHv9ROXobaDIVf6nf4eN
 ZzrnTC1WFqNron00cj/gsLb19X7Lmk8o0NB91YjTQ0WpJZNEgLbyS/qL5J2aVpHyoRw5
 wLPN9YOcyjz7xTsUMOm4CmZqvSf1vqaZ3BLLGOdluz9u8reU1hMDwB8EOHhg718m/0jx
 LR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=aQ6Gt7Zxlm19ra+VwyqtbP1AU/08f0d2oUSEXVLnMNo=;
 b=gXGKYzRPa13L8Lgjo2upjmmH0UyoE9AccD5loN5D4YT3aJHN5ZRtPVDwIVcjmkLhZl
 z/FRCNIW8WCKQ75CsTeMIEKIo1xqIljzer7gAHW6rHAbUzN8serFLjwNfclqxmH0qzen
 7PlBrj1yEeWoz+CVfrUoKys/kMTzi3Jh1T0sjC6wifQUACV9t9IhfGOaFdpkBqvo2heu
 htVC+JMFhch51Mn6FpFb1cTVzTlHaDmG1X0Uqya5tUxI+lHlcDdWki3WZXIGDonOb9A1
 xJfinfA+wZ1zyvC+d4Wg0CkcmON9OvT+EkCb5hqY21PpmJ+aev3+sYnM0cJv9V5o55SX
 Ns2g==
X-Gm-Message-State: AOAM533Eia3/TKZPZFfDVT7qUnG8RGdVv65YkwWAHlcxHBJTExg0JCxL
 PZxNVJsN5WXSjO4FZ+8+8LAzrmkt3L8=
X-Google-Smtp-Source: ABdhPJwP6j2tVEzpAY4HD/bCPWT534jcDUWsV65U3cO7ixIZRlr6iooG7gWI78PETy94e1XqYokSqQ==
X-Received: by 2002:a63:1b0c:: with SMTP id b12mr10233297pgb.334.1623721219262; 
 Mon, 14 Jun 2021 18:40:19 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id r16sm14288804pfq.140.2021.06.14.18.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 18:40:19 -0700 (PDT)
Date: Tue, 15 Jun 2021 11:40:13 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 07/11] powerpc: Add support for microwatt's hardware
 random number generator
To: linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@ozlabs.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
 <YMff6iLDiCbFQmrW@thinks.paulus.ozlabs.org>
In-Reply-To: <YMff6iLDiCbFQmrW@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1623720368.eqmkro3mgw.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of June 15, 2021 9:02 am:
> This is accessed using the DARN instruction and should probably be
> done more generically.
>=20
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> ---
>  arch/powerpc/include/asm/archrandom.h     | 12 +++++-
>  arch/powerpc/platforms/microwatt/Kconfig  |  1 +
>  arch/powerpc/platforms/microwatt/Makefile |  2 +-
>  arch/powerpc/platforms/microwatt/rng.c    | 48 +++++++++++++++++++++++
>  4 files changed, 61 insertions(+), 2 deletions(-)
>  create mode 100644 arch/powerpc/platforms/microwatt/rng.c
>=20
> diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include=
/asm/archrandom.h
> index 9a53e29680f4..e8ae0f7740f9 100644
> --- a/arch/powerpc/include/asm/archrandom.h
> +++ b/arch/powerpc/include/asm/archrandom.h
> @@ -8,12 +8,22 @@
> =20
>  static inline bool __must_check arch_get_random_long(unsigned long *v)
>  {
> +	if (ppc_md.get_random_seed)
> +		return ppc_md.get_random_seed(v);
> +
>  	return false;
>  }
> =20
>  static inline bool __must_check arch_get_random_int(unsigned int *v)
>  {
> -	return false;
> +	unsigned long val;
> +	bool rc;
> +
> +	rc =3D arch_get_random_long(&val);
> +	if (rc)
> +		*v =3D val;
> +
> +	return rc;
>  }
> =20

I would be happier if you didn't change this (or at least put it in its=20
own patch explaining why it's not going to slow down other platforms).

I'm assuming the main problem you have is seeding the rngs at boot? It
should be enough to have ppc_md.get_random_seed for that.

(BTW I wonder should lib/random32.c be changed to call=20
arch_get_random_seed_long() for seeding)


>  static inline bool __must_check arch_get_random_seed_long(unsigned long =
*v)
> diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/plat=
forms/microwatt/Kconfig
> index 50ed0cedb5f1..8f6a81978461 100644
> --- a/arch/powerpc/platforms/microwatt/Kconfig
> +++ b/arch/powerpc/platforms/microwatt/Kconfig
> @@ -7,6 +7,7 @@ config PPC_MICROWATT
>  	select PPC_ICP_NATIVE
>  	select PPC_NATIVE
>  	select PPC_UDBG_16550
> +	select ARCH_RANDOM
>  	help
>            This option enables support for FPGA-based Microwatt implement=
ations.
> =20
> diff --git a/arch/powerpc/platforms/microwatt/Makefile b/arch/powerpc/pla=
tforms/microwatt/Makefile
> index e6885b3b2ee7..116d6d3ad3f0 100644
> --- a/arch/powerpc/platforms/microwatt/Makefile
> +++ b/arch/powerpc/platforms/microwatt/Makefile
> @@ -1 +1 @@
> -obj-y	+=3D setup.o
> +obj-y	+=3D setup.o rng.o
> diff --git a/arch/powerpc/platforms/microwatt/rng.c b/arch/powerpc/platfo=
rms/microwatt/rng.c
> new file mode 100644
> index 000000000000..3d8ee6eb7dad
> --- /dev/null
> +++ b/arch/powerpc/platforms/microwatt/rng.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Derived from arch/powerpc/platforms/powernv/rng.c, which is:
> + * Copyright 2013, Michael Ellerman, IBM Corporation.
> + */
> +
> +#define pr_fmt(fmt)	"microwatt-rng: " fmt
> +
> +#include <linux/kernel.h>
> +#include <linux/smp.h>
> +#include <asm/archrandom.h>
> +#include <asm/cputable.h>
> +#include <asm/machdep.h>
> +
> +#define DARN_ERR 0xFFFFFFFFFFFFFFFFul
> +
> +int microwatt_get_random_darn(unsigned long *v)
> +{
> +	unsigned long val;
> +
> +	/* Using DARN with L=3D1 - 64-bit conditioned random number */
> +	asm volatile(PPC_DARN(%0, 1) : "=3Dr"(val));
> +
> +	if (val =3D=3D DARN_ERR)
> +		return 0;
> +
> +	*v =3D val;
> +
> +	return 1;
> +}
> +
> +static __init int rng_init(void)
> +{
> +	unsigned long val;
> +	int i;
> +
> +	for (i =3D 0; i < 10; i++) {
> +		if (microwatt_get_random_darn(&val)) {
> +			ppc_md.get_random_seed =3D microwatt_get_random_darn;
> +			return 0;
> +		}
> +	}
> +
> +	pr_warn("Unable to use DARN for get_random_seed()\n");
> +
> +	return -EIO;
> +}
> +machine_subsys_initcall(, rng_init);
> --=20
> 2.31.1
>=20
>=20
