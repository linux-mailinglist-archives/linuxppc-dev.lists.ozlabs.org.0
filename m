Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0751B3AD6EC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 05:09:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6LPD4g8Lz3c5k
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 13:09:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OOpMl65P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=srs0=aoo4=ln=gmail.com=npiggin@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OOpMl65P; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6LNm20rxz2xYf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 13:09:12 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4G6LNl1XPWz9sWk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 13:09:11 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G6LNl1CLgz9sWM; Sat, 19 Jun 2021 13:09:11 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OOpMl65P; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4G6LNk50tzz9sRf;
 Sat, 19 Jun 2021 13:09:08 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso8057748pjz.0; 
 Fri, 18 Jun 2021 20:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=TC6UClfqB9l6yrV5kpDH6L+PguCdl3thT0jqSLe0Ubs=;
 b=OOpMl65PSsLEyBIE8Kwtikv6918A0K3lqW+Rc00c8sWrcYipU01+OFN88DnGjRD67a
 4XWl/isvf61B+0n4JCFoEsTJk5ynePrSBhMHcZsfRIYpS+pJH2NGA5jGTtkDS/iDU8Ef
 crUKOnCFv8CQt54wjTp+z+sBLr/k2wUH6fFP9QnaBTALbo5+sFIfPIkDc+7aJcjaQ8rh
 1HOaQJySxgy5afGm16N0gh4efWpIFJVkHn2dCXsZDDrU0XJjpwdRPYkC8cKOvd3ghNRb
 vLW4rbE4T173hF3bx1IMWHzy+/IShjIYIkzhm006PhByMjUoLk1NCiFUXV0X3rb6t739
 5yIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=TC6UClfqB9l6yrV5kpDH6L+PguCdl3thT0jqSLe0Ubs=;
 b=CI3uBVmPYED1XjPGINO498460O7u+ExQOW2P08JYWs+E/+Atk7bOykil38RztSHh8B
 /WE++2v2HHk5FRbmyDSKlrf9pKI6bqWArUC9zDe0u/2nismDc8D0e531Gc3t3TC/8zKj
 fccj4ZCC8FF6VMkO2mGWBhix5/MDCQ4qW2xMyC/0MSh/xMZpESg0tX3Mo1ZU83IKFavd
 /Dn7/AMX+wJ6aprxE2K9FqW0ipyrOKoAMXsFUobyvcUzPkFfJyMYHRh9jxUvl/OVEROr
 tq1dg1WBSzsvIj5gcB7UIja69SZRrZLoNVkRQGrdIJs3EOlWwfsUuQGCtahxPaXL9zaH
 /3sw==
X-Gm-Message-State: AOAM531MyAf0QbelvFWpW/k5459a4HYRpW/UhuHVUfStLOWDt8T4wnnP
 XWdJe2XGWfOtVfcm/PioQozPeL2ptEc=
X-Google-Smtp-Source: ABdhPJyB21W5JW0SnveAGvx/q9eVCNMH/u9CXKW93zbNxzDeQRBApwe0jInHSLWn2gOZ+FLWgjG5wQ==
X-Received: by 2002:a17:902:e751:b029:106:65ba:5c80 with SMTP id
 p17-20020a170902e751b029010665ba5c80mr7680053plf.36.1624072145157; 
 Fri, 18 Jun 2021 20:09:05 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id 6sm9090659pfw.56.2021.06.18.20.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:09:05 -0700 (PDT)
Date: Sat, 19 Jun 2021 13:08:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 6/9] powerpc/microwatt: Add support for hardware random
 number generator
To: linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@ozlabs.org>
References: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
 <YMwXPHlV/ZleiQUY@thinks.paulus.ozlabs.org>
In-Reply-To: <YMwXPHlV/ZleiQUY@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1624071936.oqwaldrt74.astroid@bobo.none>
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

Excerpts from Paul Mackerras's message of June 18, 2021 1:47 pm:
> Microwatt's hardware RNG is accessed using the DARN instruction.
>=20

I think we're getting a platforms/book3s soon with the VAS patches,=20
might be a place to add the get_random_darn function.

Huh, DARN is unprivileged right? And yet we haven't wired it up in
pseries it still uses an hcall.

Anyway that's all stuff to sort out later.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> ---
>  arch/powerpc/platforms/microwatt/Kconfig  |  1 +
>  arch/powerpc/platforms/microwatt/Makefile |  2 +-
>  arch/powerpc/platforms/microwatt/rng.c    | 48 +++++++++++++++++++++++
>  3 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/platforms/microwatt/rng.c
>=20
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
