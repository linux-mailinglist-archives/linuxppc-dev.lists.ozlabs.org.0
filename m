Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B99739999F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 07:00:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwYby3ngYz309C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 14:59:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QpYPrtZi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QpYPrtZi; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwYbS4vlkz2xv7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 14:59:32 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id u18so3960039pfk.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 21:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=wP8kwWHvWPOSW3Kxg0y5i10MeeFhZ5W8gU40UHd6LVk=;
 b=QpYPrtZi34g2iPYCmRMlWxtW9XBnrY+oeGgWWi9RDUIirPnvEWtjlNh3l0UtluNu1t
 IxsfJ03eN2U9wMAMGuc15m9s/NJxsXrIdHijIEjLpO4NtT45PNM/dfgoBq65WzW6oBHg
 EApYdyV+Qw5G6qLvrB4QIevFNzTqWSdQZ0v8bGC3bG3U4Yiqdk05izROlnLlC11EFova
 yy40mAGUb2JUyeG5YXDY9iDaH8EnaPNfu2W4H/Dpwzug1wLjwQH+0UT5NH3Y3Os/LnYM
 D3VP6diqnkr6Fn9kQRV+POUTwOYgU+72PR2dmYzzkl+Ph10QE3FkLiIoR+q+8MV1rXaD
 DuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=wP8kwWHvWPOSW3Kxg0y5i10MeeFhZ5W8gU40UHd6LVk=;
 b=cJ61VNtOQYhsFyD+IU95MpaGYBKhS35tuVKR8Atnc6esQ4h605UHNnl+eZv2pdhx66
 NU+ZgTemRY/QgEMiVn1V5gwGnPIBCMfu71xLUy4/K3n55bz1x9OqBvmDknRp6A4WHruR
 eRUApqgjauqFg8xM0Weoj/5eWVCIrxlk80vO4/7haT0zrSEBNQtMXMW+6iHg+NGaWd+a
 DEmCKA+ksxjRWnIuvMnQAJXgx0QmIk1nB3EcCedETYnwCK+VL5T3pM61PAUGqR7ymhTp
 eCtCydgfy0BIoGvJUXGftqd1MFIZ/bL1VL1+LnkqmnyHcZK8b6u4QtpSfrWaDTfsRpGA
 7tIw==
X-Gm-Message-State: AOAM533boCQOHG/QR0ToCsUZHDZIht5ErQMLvvPA6h37cd9Cl1cB1ISe
 iwbMzXyJv3pD/IfUGupdDS4=
X-Google-Smtp-Source: ABdhPJy+ldXCfckWAtAmrnYX3/p5DGgrvukhHO4fWZvH8wTPxP3vHI6u1y15Zp0e1S2Aua1EGX9qOA==
X-Received: by 2002:a62:51c2:0:b029:2e9:e4c5:2a74 with SMTP id
 f185-20020a6251c20000b02902e9e4c52a74mr15858037pfb.51.1622696369006; 
 Wed, 02 Jun 2021 21:59:29 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id q91sm910669pja.50.2021.06.02.21.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 21:59:28 -0700 (PDT)
Date: Thu, 03 Jun 2021 14:59:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 14/16] crypto/nx: Register and unregister VAS interface
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <af17f1cd30b9bbece7e160d78fb83fe5e0e823f5.camel@linux.ibm.com>
In-Reply-To: <af17f1cd30b9bbece7e160d78fb83fe5e0e823f5.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1622696256.om3tqko8hq.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of May 21, 2021 7:41 pm:
>=20
> Changes to create /dev/crypto/nx-gzip interface with VAS register
> and to remove this interface with VAS unregister.
>=20

Could you include why the change is done, or what goes wrong without it?

Thanks,
Nick

> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
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
