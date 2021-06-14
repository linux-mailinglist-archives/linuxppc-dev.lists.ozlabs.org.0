Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807FF3A5BDD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 05:36:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3HD5097Pz3bv2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 13:36:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=EJrqYkdw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EJrqYkdw; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3HCd1nXSz2xxn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 13:35:41 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id h1so5833361plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 20:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=QMp92nPw8lMVr4SttM8MWMUzPqMupFY25Uo/dcGnhGQ=;
 b=EJrqYkdwKe8w232aXFL2CV4rtRe0zY7ViWLyXPID+vfNanLCcQG1Obw2/YiQCUD4bH
 u+J/8h1/al/+5AhS2XJL77c9q1M2E4z8JL9RBqDLK4SC42pOt14fZ08f7sxfgG2NPLsf
 p1jaCiU6cmaRDOnZWZQ2eXZ89DhJ2TA4xrRtMHcLxXfpj1E9VRJLqTkJ2355dDBUL/bQ
 HWvVIa2V13apLAhSNA6sQXROfzyFotXbzWQKrjqHW+9V6EMQ4032DgvLIrM1KpueV+Q1
 zbPk8aUOElcp9aCrAUjDGbHqcqowk8p85HWYruWENHywMmERhTxsc73M9XjalBXvxWsj
 vUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=QMp92nPw8lMVr4SttM8MWMUzPqMupFY25Uo/dcGnhGQ=;
 b=au9ZVG+z80DQ16Cs41gY9KmIBgg6YayOit5LhWNnTIEoezjznfsZAWOPqh8uPl9emN
 1O8goF+lPmhxTGCRUrrvA9ML3loc/QE8i/Epcz2s3kO2F/4jweXhCfoIJkP05GTopGFH
 DGXd0lLWEVi+UTFmNZHGC0LoP9mmF5XFdQpqFDiY6nN+eKJpaTUrLuE2LnOs9RdKhm4O
 h+KDemBBoe31DXnKbaJO8aT/cUAYtCyZE77Igft3WYnw4TgIiQWmnzfouTONRzEvMmE0
 PlpdWMWs9U6ApntnIAczrBFYX9DTdlPkRqJ8i5WtTclecMm5oTqt3J6BDcZQhHjOF9cD
 PJ1g==
X-Gm-Message-State: AOAM532qLglf2lYuCs+M2g9OskX5NkdR9+EkMVl/6pgEk4OvgdyaJg+8
 TIItJgZg8Yn0W0ogCoky959F84rjGqM=
X-Google-Smtp-Source: ABdhPJy22twUgEp75uqvLFNGSbEOyoATWgRcn52SBgta4UzC15mv5TABWQUPueYiQ3eP2oWZDsJ4Vw==
X-Received: by 2002:a17:90b:380a:: with SMTP id
 mq10mr11513569pjb.79.1623641737850; 
 Sun, 13 Jun 2021 20:35:37 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id v67sm11001826pfb.193.2021.06.13.20.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 20:35:37 -0700 (PDT)
Date: Mon, 14 Jun 2021 13:35:32 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 15/17] crypto/nx: Register and unregister VAS interface
 on PowerVM
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <0fe93c925b9e5517f55121f51074de425feb5236.camel@linux.ibm.com>
In-Reply-To: <0fe93c925b9e5517f55121f51074de425feb5236.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623641719.fj26uclcqk.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 13, 2021 9:04 pm:
>=20
> The user space uses /dev/crypto/nx-gzip interface to setup VAS
> windows, create paste mapping and close windows. This patch adds
> changes to create/remove this interface with VAS register/unregister
> functions on PowerVM platform.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  drivers/crypto/nx/Kconfig             | 1 +
>  drivers/crypto/nx/nx-common-pseries.c | 9 +++++++++
>  2 files changed, 10 insertions(+)
>=20
> diff --git a/drivers/crypto/nx/Kconfig b/drivers/crypto/nx/Kconfig
> index 23e3d0160e67..2a35e0e785bd 100644
> --- a/drivers/crypto/nx/Kconfig
> +++ b/drivers/crypto/nx/Kconfig
> @@ -29,6 +29,7 @@ if CRYPTO_DEV_NX_COMPRESS
>  config CRYPTO_DEV_NX_COMPRESS_PSERIES
>  	tristate "Compression acceleration support on pSeries platform"
>  	depends on PPC_PSERIES && IBMVIO
> +	depends on PPC_VAS
>  	default y
>  	help
>  	  Support for PowerPC Nest (NX) compression acceleration. This
> diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx=
-common-pseries.c
> index cc8dd3072b8b..9a40fca8a9e6 100644
> --- a/drivers/crypto/nx/nx-common-pseries.c
> +++ b/drivers/crypto/nx/nx-common-pseries.c
> @@ -9,6 +9,7 @@
>   */
> =20
>  #include <asm/vio.h>
> +#include <asm/vas.h>
> =20
>  #include "nx-842.h"
>  #include "nx_csbcpb.h" /* struct nx_csbcpb */
> @@ -1101,6 +1102,12 @@ static int __init nx842_pseries_init(void)
>  		return ret;
>  	}
> =20
> +	ret =3D vas_register_api_pseries(THIS_MODULE, VAS_COP_TYPE_GZIP,
> +				       "nx-gzip");
> +
> +	if (ret)
> +		pr_err("NX-GZIP is not supported. Returned=3D%d\n", ret);
> +
>  	return 0;
>  }
> =20
> @@ -1111,6 +1118,8 @@ static void __exit nx842_pseries_exit(void)
>  	struct nx842_devdata *old_devdata;
>  	unsigned long flags;
> =20
> +	vas_unregister_api_pseries();
> +
>  	crypto_unregister_alg(&nx842_pseries_alg);
> =20
>  	spin_lock_irqsave(&devdata_mutex, flags);
> --=20
> 2.18.2
>=20
>=20
>=20
