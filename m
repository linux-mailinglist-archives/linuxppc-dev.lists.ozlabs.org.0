Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E35E3ABF9B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:36:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5djr5jllz3cNZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 09:36:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Xx2gSZ/N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xx2gSZ/N; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5djN61lvz2xfd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 09:36:08 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id q25so6242323pfh.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 16:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=b6HgWIOu0cJcB49Rw6z7AqZc8TPM4Uq78OfjrLVGDzw=;
 b=Xx2gSZ/N+hg4dNtAuX4EwgpTdMG72Yuy2gT1JRkipMgZGFrA3aNw69Du70BswrSHLJ
 rw9NrA7nCMUCNCoxU5ys4kYw/1yZODIcC9w+P3iCsYbbPPwMrnqtXJOCjBygz6LXvBNq
 WsHMs5ZvMR/KdjwkRnqFhBDAr47SwC+w5TqV+r1Z9nmg22XR4/jMcY62p+zgwzsXVbhT
 V16n3GHibtGAPMumFZ6yI49/al0R54YCtrd9+ybEn03aXyAjQNwXiU+4aKuB6rIalTCR
 XiI8BJDH9MLZ0iqn3M3TU5qunx9x1FyGSyNSHNSrjcz5voV5TfEijPdYxSitQCkrP9Xf
 5Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=b6HgWIOu0cJcB49Rw6z7AqZc8TPM4Uq78OfjrLVGDzw=;
 b=PlHpgOzlJXso6AMx/QlkCyx5qJXL1QCMXO1maL7kTF+JhQ5GS4A8NbY1dLy/SU8P1p
 ACmhLi02X37NvzJzxnHNBqB/5dChMYpd3ahjxD45U2SQlC2mas1qkHKf9OTefJ/Y0WNu
 O2vg07DyMZJv71hCfwy4gJ7/5aw94PX2x/H8ZAqM83WqS9FJM3XjQovqYW0F+m6cVFdI
 RR7f8BJzuKP3uNcSX8LQz1f2up9H1B1BKgowe5Q8hxMzsbqKzseVkIeVBEIVn3bmVcVH
 +7+OzakWkt0WaA+SUFG5coJMzVMT3cZXIQ/SSgwFKeOyIlObWUD5JX7JA5+JkZvhWUkB
 XaxA==
X-Gm-Message-State: AOAM5324wt01zBN1gAqKsJIFWCkBbe28//P9EsSZTYEK6nyU5QWMOxAo
 amGSgotmVF3s3SsCxudDnxs=
X-Google-Smtp-Source: ABdhPJy/n7+hCCYpQXpXnGgUO7AN4o6NZYVY3u6DdOqbW3rZjpi+XyDsfOSbqvsk3UzpqThZo6udYw==
X-Received: by 2002:a63:e309:: with SMTP id f9mr7113554pgh.443.1623972964845; 
 Thu, 17 Jun 2021 16:36:04 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id t5sm5882620pfe.116.2021.06.17.16.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 16:36:04 -0700 (PDT)
Date: Fri, 18 Jun 2021 09:35:59 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 15/17] crypto/nx: Get NX capabilities for GZIP
 coprocessor type
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
 <f2b6a1fb8b6112595a73d81c67a35af4e7f5d0a3.camel@linux.ibm.com>
In-Reply-To: <f2b6a1fb8b6112595a73d81c67a35af4e7f5d0a3.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623972924.juhnvnlfsg.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 18, 2021 6:38 am:
>=20
> The hypervisor provides different NX capabilities that it
> supports. These capabilities such as recommended minimum
> compression / decompression lengths and the maximum request
> buffer size in bytes are used to define the user space NX
> request.
>=20
> NX will reject the request if the buffer size is more than
> the maximum buffer size. Whereas compression / decompression
> lengths are recommended values for better performance.
>=20
> Changes to get NX overall capabilities which points to the
> specific features that the hypervisor supports. Then retrieve
> the capabilities for the specific feature (available only
> for NXGZIP).
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  drivers/crypto/nx/nx-common-pseries.c | 87 +++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>=20
> diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx=
-common-pseries.c
> index cc8dd3072b8b..9fc2abb56019 100644
> --- a/drivers/crypto/nx/nx-common-pseries.c
> +++ b/drivers/crypto/nx/nx-common-pseries.c
> @@ -9,6 +9,8 @@
>   */
> =20
>  #include <asm/vio.h>
> +#include <asm/hvcall.h>
> +#include <asm/vas.h>
> =20
>  #include "nx-842.h"
>  #include "nx_csbcpb.h" /* struct nx_csbcpb */
> @@ -19,6 +21,29 @@ MODULE_DESCRIPTION("842 H/W Compression driver for IBM=
 Power processors");
>  MODULE_ALIAS_CRYPTO("842");
>  MODULE_ALIAS_CRYPTO("842-nx");
> =20
> +/*
> + * Coprocessor type specific capabilities from the hypervisor.
> + */
> +struct hv_nx_cop_caps {
> +	__be64	descriptor;
> +	__be64	req_max_processed_len;	/* Max bytes in one GZIP request */
> +	__be64	min_compress_len;	/* Min compression size in bytes */
> +	__be64	min_decompress_len;	/* Min decompression size in bytes */
> +} __packed __aligned(0x1000);
> +
> +/*
> + * Coprocessor type specific capabilities.
> + */
> +struct nx_cop_caps {
> +	u64	descriptor;
> +	u64	req_max_processed_len;	/* Max bytes in one GZIP request */
> +	u64	min_compress_len;	/* Min compression in bytes */
> +	u64	min_decompress_len;	/* Min decompression in bytes */
> +};
> +
> +static u64 caps_feat;
> +static struct nx_cop_caps nx_cop_caps;
> +
>  static struct nx842_constraints nx842_pseries_constraints =3D {
>  	.alignment =3D	DDE_BUFFER_ALIGN,
>  	.multiple =3D	DDE_BUFFER_LAST_MULT,
> @@ -1065,6 +1090,64 @@ static void nx842_remove(struct vio_dev *viodev)
>  	kfree(old_devdata);
>  }
> =20
> +/*
> + * Get NX capabilities from the hypervisor.
> + * Only NXGZIP capabilities are provided by the hypersvisor right
> + * now and these values are available to user space with sysfs.
> + */
> +static void __init nxcop_get_capabilities(void)
> +{
> +	struct hv_vas_all_caps *hv_caps;
> +	struct hv_nx_cop_caps *hv_nxc;
> +	int rc;
> +
> +	hv_caps =3D kmalloc(sizeof(*hv_caps), GFP_KERNEL);
> +	if (!hv_caps)
> +		return;
> +	/*
> +	 * Get NX overall capabilities with feature type=3D0
> +	 */
> +	rc =3D h_query_vas_capabilities(H_QUERY_NX_CAPABILITIES, 0,
> +					  (u64)virt_to_phys(hv_caps));
> +	if (rc)
> +		goto out;
> +
> +	caps_feat =3D be64_to_cpu(hv_caps->feat_type);
> +	/*
> +	 * NX-GZIP feature available
> +	 */
> +	if (caps_feat & VAS_NX_GZIP_FEAT_BIT) {
> +		hv_nxc =3D kmalloc(sizeof(*hv_nxc), GFP_KERNEL);
> +		if (!hv_nxc)
> +			goto out;
> +		/*
> +		 * Get capabilities for NX-GZIP feature
> +		 */
> +		rc =3D h_query_vas_capabilities(H_QUERY_NX_CAPABILITIES,
> +						  VAS_NX_GZIP_FEAT,
> +						  (u64)virt_to_phys(hv_nxc));
> +	} else {
> +		pr_err("NX-GZIP feature is not available\n");
> +		rc =3D -EINVAL;
> +	}
> +
> +	if (!rc) {
> +		nx_cop_caps.descriptor =3D be64_to_cpu(hv_nxc->descriptor);
> +		nx_cop_caps.req_max_processed_len =3D
> +				be64_to_cpu(hv_nxc->req_max_processed_len);
> +		nx_cop_caps.min_compress_len =3D
> +				be64_to_cpu(hv_nxc->min_compress_len);
> +		nx_cop_caps.min_decompress_len =3D
> +				be64_to_cpu(hv_nxc->min_decompress_len);
> +	} else {
> +		caps_feat =3D 0;
> +	}
> +
> +	kfree(hv_nxc);
> +out:
> +	kfree(hv_caps);
> +}
> +
>  static const struct vio_device_id nx842_vio_driver_ids[] =3D {
>  	{"ibm,compression-v1", "ibm,compression"},
>  	{"", ""},
> @@ -1092,6 +1175,10 @@ static int __init nx842_pseries_init(void)
>  		return -ENOMEM;
> =20
>  	RCU_INIT_POINTER(devdata, new_devdata);
> +	/*
> +	 * Get NX capabilities from the hypervisor.
> +	 */
> +	nxcop_get_capabilities();
> =20
>  	ret =3D vio_register_driver(&nx842_vio_driver);
>  	if (ret) {
> --=20
> 2.18.2
>=20
>=20
>=20
