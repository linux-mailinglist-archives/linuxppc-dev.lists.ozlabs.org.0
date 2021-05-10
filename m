Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D796377C71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 08:38:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdrx74wg8z308f
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 16:38:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nVk4cdEF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nVk4cdEF; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdrwj4GcSz2yXH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 16:38:29 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id q2so12869656pfh.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 23:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=avMmQkqPq3ZK6KdqTCGnz6Br6PUKj5adgsHq71kJhzU=;
 b=nVk4cdEFN02eydxyUSfohHQMO6Tulawffbm1sjoFbg6eFJM58XESIJdbvolpJjxhyu
 iMLPLw9Kb+ZHtSkQi0slf0hOJL2wjpBVqJ9uAx+YWqYNT1NyNdYagsMZ3BQMQfV4NK5R
 SOJdZGi47PKEhwbW6g+pQ/GFMA3205yY41mcV2bPoGdO4YXSZNg6mBocHHyfCVjoP5zm
 8MtFJ8gvN3+QE/mmdib4H6hVuLU10imWTaALViyCPLUUikvdD0iBs6YCv1fR1HYH5K/a
 Jq+YYTFOLaaTyYhS8FHzISgCPXmFvs2nCplsuUnQB61/TvtrTz64C8rMtzkBeCRuYodo
 OcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=avMmQkqPq3ZK6KdqTCGnz6Br6PUKj5adgsHq71kJhzU=;
 b=bIEjkr2BOguaqy0HcG2XXtdLo+OYGn8aJZ4rz1H0XGIJacBtbdACGCTvUUWGzKKf8y
 dBUTdd02geMds52LDmVVJEoy0+y7kX61zft8IbU4Gkb8QIiHJuqPj+pT/eCJtiZEubiW
 79fI486/pouiwP/dfNjCgJ2V8IqaB+hl8URvBNLYo1ovQoN5iYL7EpcdqwXf+8mT2YCQ
 RjHhm4aHWC9+pZHxxF9o0fX/9inp6A/nwUCV08Hiqg7AxM9Kz6sP+vvJ4djBSfK5365z
 XoIAfsmeXPebRwG1kZoyjUyDykascB3U3Y14ANO/XZO3DpzZJzVQUbHG/DPAdOcbDeR9
 1zmQ==
X-Gm-Message-State: AOAM5311rWJ2eFgzsxEtp5xDgb670ovwoqRzoZ9/Jm+SED0e0EBC1OnY
 MNf8gzN60EyB4XTjnFxTKcw=
X-Google-Smtp-Source: ABdhPJzFZ7yfyn6/TMczNFF0hvFQIl4wu2x+s6wTrCFq0vTlrKVVcrR3rP6beVQcr+nuVYmqxaRFSw==
X-Received: by 2002:a05:6a00:d4e:b029:291:19f7:ddd4 with SMTP id
 n14-20020a056a000d4eb029029119f7ddd4mr24057721pfv.52.1620628706008; 
 Sun, 09 May 2021 23:38:26 -0700 (PDT)
Received: from localhost (60-241-47-46.tpgi.com.au. [60.241.47.46])
 by smtp.gmail.com with ESMTPSA id k7sm10289263pfc.16.2021.05.09.23.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 23:38:25 -0700 (PDT)
Date: Mon, 10 May 2021 16:38:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [V3 PATCH 15/16] crypto/nx: Get NX capabilities for GZIP
 coprocessor type
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <e5fff6adbf3ce7769b0efe4846f39dbc6c795dd1.camel@linux.ibm.com>
In-Reply-To: <e5fff6adbf3ce7769b0efe4846f39dbc6c795dd1.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1620628516.4xglqwl3t1.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of April 18, 2021 7:12 am:
>=20
> phyp provides NX capabilities which gives recommended minimum
> compression / decompression length and maximum request buffer size
> in bytes.
>=20
> Changes to get NX overall capabilities which points to the specific
> features phyp supports. Then retrieve NXGZIP specific capabilities.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  drivers/crypto/nx/nx-common-pseries.c | 83 +++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>=20
> diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx=
-common-pseries.c
> index 9a40fca8a9e6..49224870d05e 100644
> --- a/drivers/crypto/nx/nx-common-pseries.c
> +++ b/drivers/crypto/nx/nx-common-pseries.c
> @@ -9,6 +9,7 @@
>   */
> =20
>  #include <asm/vio.h>
> +#include <asm/hvcall.h>
>  #include <asm/vas.h>
> =20
>  #include "nx-842.h"
> @@ -20,6 +21,24 @@ MODULE_DESCRIPTION("842 H/W Compression driver for IBM=
 Power processors");
>  MODULE_ALIAS_CRYPTO("842");
>  MODULE_ALIAS_CRYPTO("842-nx");
> =20
> +struct nx_ct_capabs_be {

What does "ct" mean? I've seen it in a few other places too.

> +	__be64	descriptor;
> +	__be64	req_max_processed_len;	/* Max bytes in one GZIP request */
> +	__be64	min_compress_len;	/* Min compression size in bytes */
> +	__be64	min_decompress_len;	/* Min decompression size in bytes */
> +} __packed __aligned(0x1000);
> +
> +struct nx_ct_capabs {
> +	char	name[VAS_DESCR_LEN + 1];
> +	u64	descriptor;
> +	u64	req_max_processed_len;	/* Max bytes in one GZIP request */
> +	u64	min_compress_len;	/* Min compression in bytes */
> +	u64	min_decompress_len;	/* Min decompression in bytes */
> +};
> +
> +u64 capab_feat =3D 0;

Why is this here and not a local variable?

> +struct nx_ct_capabs nx_ct_capab;

It's okay and generally better to use the same name as the struct name
in this situation, i.e.,

"struct nx_ct_capabs nx_ct_capabs"

(modulo static / caps / etc)

Thanks,
Nick
