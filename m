Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E633A5BE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 05:39:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3HJK2JqCz308S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 13:39:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JvEF9m1J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JvEF9m1J; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3HHr5c0Lz2xv9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 13:39:20 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id x10so5822295plg.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 20:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=nf5HwWFyhplJT91xsgfa1P2gXUGFqDD4GsWEOo8HQgY=;
 b=JvEF9m1J6+jbANDnJbBL76yGtuvsN/qFWcvptlCo0cTHcpTawis/9u1oemmMi62xdT
 wqJpsCCdxNMBnaBTCjzTWarXoCBiTwSBI8wJCnmhWDB0MRgW9kupLxAYSovoQI1wB5z3
 GL1gQVj23jYO7vzy9ieWvm76qV61z5K3N5Hqq9FZtTWumetKr7BVffi2AZR/zWcpMnP8
 KYFX0gOJmrHBSvPMKJ11N2a0MGwKzsayX24R19UeiJzplmUNQlvqsaGin+dsJU3MfKB/
 TR/dLXC03fT2/I7563hiCCpSATknUE/RnjxHRTWmdvSXXX2vJA6Z0ISV+OoPRXEH9GQN
 5szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=nf5HwWFyhplJT91xsgfa1P2gXUGFqDD4GsWEOo8HQgY=;
 b=G5B2bj8w4lUuEFVd4n2Dli5n5KqxyInibn/lKU1i5M4vh3RI6uLkbzcQ4s9ZkNejE7
 sL88ukKNwB/j2Y/ii8eSWLYd3jsNNFqkUFsRPcqE80x/DYZKcrMKk1Cgo/3Tj3IXJWar
 VOnDUj4mvVJCSy8rk3EEvYW7PjPA0LtkpW+Gm5NLy6kNrRQuz4FwTPVxxt2d0tZA+M5Z
 XhPCMEq+VpgRpoPvvrFGD4Be6+eox9UX0sFihIMayVkHPbCIxA3Nqy4PBKfKNRluSid0
 ttbYdN+SytI2ZFnV/rOifoXAq/hpPoMuuk0T+oUpyQ1YpvTfxc+Qi2yCXHcXoQnYtVHQ
 Axyw==
X-Gm-Message-State: AOAM531K1m6A63W0caHBpcJQpsxQU5PVYNXDOzg6SDqTXLxBO9p7jz2T
 hFFLjSa5tvgckD5f03r/fNY=
X-Google-Smtp-Source: ABdhPJzt6jNeDhee79NabstNUrGI44WWdA8hyMRnpl2pKzsdsd5NumCPAGfQ3e7cj7JErosE5dyITg==
X-Received: by 2002:a17:90b:380a:: with SMTP id
 mq10mr11524882pjb.79.1623641956938; 
 Sun, 13 Jun 2021 20:39:16 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id i2sm15342207pjj.25.2021.06.13.20.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 20:39:16 -0700 (PDT)
Date: Mon, 14 Jun 2021 13:39:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 16/17] crypto/nx: Get NX capabilities for GZIP
 coprocessor type
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <726de270eb20e0898f4391a0b0e7077697db66ab.camel@linux.ibm.com>
In-Reply-To: <726de270eb20e0898f4391a0b0e7077697db66ab.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623641787.0rdwnv3k4u.astroid@bobo.none>
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
> The hypervisor provides different capabilities that it supports
> to define the user space NX request. These capabilities are
> recommended minimum compression / decompression lengths and the
> maximum request buffer size in bytes.
>=20
> Changes to get NX overall capabilities which points to the
> specific features that the hypervisor supports. Then retrieve
> the capabilities for the specific feature (available only
> for NXGZIP).

So what does this give you which you didn't have before? Should
this go before the previous patch that enables the interface for guests,
or is there some functional-yet-degraded mode that is available without
this patch?

I would suggest even if this is the case to switch ordering of the=20
patches so as to reduce the matrix of functionality that userspace sees=20
when bisecting. Unless you specifically want this kind of bisectability,
in which case make that explicit in the changelog.

Thanks,
Nick

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
> ---
>  drivers/crypto/nx/nx-common-pseries.c | 86 +++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>=20
> diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx=
-common-pseries.c
> index 9a40fca8a9e6..60b5049ec9f7 100644
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
> @@ -20,6 +21,29 @@ MODULE_DESCRIPTION("842 H/W Compression driver for IBM=
 Power processors");
>  MODULE_ALIAS_CRYPTO("842");
>  MODULE_ALIAS_CRYPTO("842-nx");
> =20
> +/*
> + * Coprocessor type specific capabilities from the hypervisor.
> + */
> +struct hv_nx_ct_caps {
> +	__be64	descriptor;
> +	__be64	req_max_processed_len;	/* Max bytes in one GZIP request */
> +	__be64	min_compress_len;	/* Min compression size in bytes */
> +	__be64	min_decompress_len;	/* Min decompression size in bytes */
> +} __packed __aligned(0x1000);
> +
> +/*
> + * Coprocessor type specific capabilities.
> + */
> +struct nx_ct_caps {
> +	u64	descriptor;
> +	u64	req_max_processed_len;	/* Max bytes in one GZIP request */
> +	u64	min_compress_len;	/* Min compression in bytes */
> +	u64	min_decompress_len;	/* Min decompression in bytes */
> +};
> +
> +static u64 caps_feat;
> +static struct nx_ct_caps nx_ct_caps;
> +
>  static struct nx842_constraints nx842_pseries_constraints =3D {
>  	.alignment =3D	DDE_BUFFER_ALIGN,
>  	.multiple =3D	DDE_BUFFER_LAST_MULT,
> @@ -1066,6 +1090,64 @@ static void nx842_remove(struct vio_dev *viodev)
>  	kfree(old_devdata);
>  }
> =20
> +/*
> + * Get NX capabilities from the hypervisor.
> + * Only NXGZIP capabilities are provided by the hypersvisor right
> + * now and these values are available to user space with sysfs.
> + */
> +static void __init nxct_get_capabilities(void)
> +{
> +	struct hv_vas_all_caps *hv_caps;
> +	struct hv_nx_ct_caps *hv_nxc;
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
> +		nx_ct_caps.descriptor =3D be64_to_cpu(hv_nxc->descriptor);
> +		nx_ct_caps.req_max_processed_len =3D
> +				be64_to_cpu(hv_nxc->req_max_processed_len);
> +		nx_ct_caps.min_compress_len =3D
> +				be64_to_cpu(hv_nxc->min_compress_len);
> +		nx_ct_caps.min_decompress_len =3D
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
> @@ -1093,6 +1175,10 @@ static int __init nx842_pseries_init(void)
>  		return -ENOMEM;
> =20
>  	RCU_INIT_POINTER(devdata, new_devdata);
> +	/*
> +	 * Get NX capabilities from the hypervisor.
> +	 */
> +	nxct_get_capabilities();
> =20
>  	ret =3D vio_register_driver(&nx842_vio_driver);
>  	if (ret) {
> --=20
> 2.18.2
>=20
>=20
>=20
