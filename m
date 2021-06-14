Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE393A5B99
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 04:36:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3FvD38nyz3099
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 12:36:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sJ4Etggt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sJ4Etggt; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3Ftm3pS9z2xtk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 12:36:00 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id y15so9457444pfl.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 19:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=euF9zaB73uybsGPJ8Kq4xpe3HbtpAmWaCYFWKcOSa9o=;
 b=sJ4EtggtP7DtksnF7NspWEJ9QHITZoyhMssr4nlctkIFTt75DYhUwLYfh2np60fSNZ
 1W9qEF+QufghdNWkNi7K0BHI0TWWT6AQOkWUclpS3EMOv6ZDWasLzyrPxRdV7UNcHoSy
 jFTofbim45yU1ZgC86XIUs1ozs/nFU6HRUrumDJsrPiVTyso2b2KtpeF3sjbknRZM8W6
 RdP9gpAAJDQGGEi7K6etYJme6TC6VL5fGiLOc4scLXb1s6gZWB9t9PdMGsQAD5OYVYli
 mC6yfam+7RVlTo27J8wGWgMiT7TPrFf4eUv6cVFIEoRiVKRNC5qU3UaMDcTgeFkUr4sM
 nwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=euF9zaB73uybsGPJ8Kq4xpe3HbtpAmWaCYFWKcOSa9o=;
 b=tgFonOFVUXy9LVscQMY/EuRSJ66e+kt2mdJ85yLnz7+tT/j7joFF/NiFSH0MKly1gs
 AR/RbbmvORJyAdsRM7hMbAnaeXbcbz/X0Kwfiw1HBK8rO3NGXFwT+Zc/F0WufL8zb9Zn
 8V4Ad1+F+KeJDe4xhKx1BLxaViNwaL3N75Nw1mDXaD5PWmerxoFzA7QbVBp6ggIzXyDl
 EsnFHcOH7XW0PwOLXxq+NygZge52+rC8JAJY1jPgPcKr315y+rdaLdQsfnfii8f3EVwK
 iYfhFN0NXWAF5p6VWmJFifPrwssLbstlBdUDrRl6BZ+9JfPid/AQ9Zbz+lgh8GkcDAZh
 PhJw==
X-Gm-Message-State: AOAM5315OmeuGPiNjkdOmEL5IHym5//L6qnsxi7NfByYZFplzdU6BmRm
 kfScjB0yIm4bSQBeLF8Nff4=
X-Google-Smtp-Source: ABdhPJx/0AibclAv3inkDJIWBJ0bx2HIaxcPhIjirPYe75J/5uVWAgyBrgmU+PIcB+YORwJSWVUdvg==
X-Received: by 2002:a62:be03:0:b029:2e9:fe8c:effe with SMTP id
 l3-20020a62be030000b02902e9fe8ceffemr19415702pff.34.1623638156515; 
 Sun, 13 Jun 2021 19:35:56 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id k6sm10657905pfa.215.2021.06.13.19.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 19:35:56 -0700 (PDT)
Date: Mon, 14 Jun 2021 12:35:50 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 11/17] powerpc/pseries/vas: Implement getting
 capabilities from hypervisor
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <4ca037732838675bd8e12de702687971e0ab2b3d.camel@linux.ibm.com>
In-Reply-To: <4ca037732838675bd8e12de702687971e0ab2b3d.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623637992.3jr2j7txx9.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 13, 2021 9:01 pm:
>=20
> The hypervisor provides VAS capabilities for GZIP default and QoS
> features. These capabilities gives information for the specific
> features such as total number of credits available in LPAR,
> maximum credits allowed per window, maximum credits allowed in
> LPAR, whether usermode copy/paste is supported, and etc.
>=20
> This patch adds the following:
> - Retrieve all features that are provided by hypervisor using
>   H_QUERY_VAS_CAPABILITIES hcall with 0 as feature type.
> - Retrieve capabilities for the specific feature using the same
>   hcall and the feature type (1 for QoS and 2 for default type).
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/vas.c | 124 +++++++++++++++++++++++++++
>  1 file changed, 124 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index fec280979d50..98109a13f1c2 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -10,6 +10,7 @@
>  #include <linux/export.h>
>  #include <linux/types.h>
>  #include <linux/delay.h>
> +#include <asm/machdep.h>
>  #include <asm/hvcall.h>
>  #include <asm/plpar_wrappers.h>
>  #include <asm/vas.h>
> @@ -20,6 +21,13 @@
>  /* phyp allows one credit per window right now */
>  #define DEF_WIN_CREDS		1
> =20
> +static struct vas_all_caps caps_all;
> +static bool copypaste_feat;
> +
> +static struct vas_caps vascaps[VAS_MAX_FEAT_TYPE];

If these will all be read by later patches I think that's okay,=20
however:

> +
> +static DEFINE_MUTEX(vas_pseries_mutex);

This is not used at all. It should be added in the patch that uses it.

Thanks,
Nick

> +
>  static long hcall_return_busy_check(long rc)
>  {
>  	/* Check if we are stalled for some time */
> @@ -179,3 +187,119 @@ int h_query_vas_capabilities(const u64 hcall, u8 qu=
ery_type, u64 result)
>  		return -EIO;
>  	}
>  }
> +
> +/*
> + * Get the specific capabilities based on the feature type.
> + * Right now supports GZIP default and GZIP QoS capabilities.
> + */
> +static int get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
> +				struct hv_vas_ct_caps *hv_caps)
> +{
> +	struct vas_ct_caps *caps;
> +	struct vas_caps *vcaps;
> +	int rc =3D 0;
> +
> +	vcaps =3D &vascaps[type];
> +	memset(vcaps, 0, sizeof(*vcaps));
> +	INIT_LIST_HEAD(&vcaps->list);
> +
> +	caps =3D &vcaps->caps;
> +
> +	rc =3D h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, feat,
> +					  (u64)virt_to_phys(hv_caps));
> +	if (rc)
> +		return rc;
> +
> +	caps->user_mode =3D hv_caps->user_mode;
> +	if (!(caps->user_mode & VAS_COPY_PASTE_USER_MODE)) {
> +		pr_err("User space COPY/PASTE is not supported\n");
> +		return -ENOTSUPP;
> +	}
> +
> +	caps->descriptor =3D be64_to_cpu(hv_caps->descriptor);
> +	caps->win_type =3D hv_caps->win_type;
> +	if (caps->win_type >=3D VAS_MAX_FEAT_TYPE) {
> +		pr_err("Unsupported window type %u\n", caps->win_type);
> +		return -EINVAL;
> +	}
> +	caps->max_lpar_creds =3D be16_to_cpu(hv_caps->max_lpar_creds);
> +	caps->max_win_creds =3D be16_to_cpu(hv_caps->max_win_creds);
> +	atomic_set(&caps->target_lpar_creds,
> +		   be16_to_cpu(hv_caps->target_lpar_creds));
> +	if (feat =3D=3D VAS_GZIP_DEF_FEAT) {
> +		caps->def_lpar_creds =3D be16_to_cpu(hv_caps->def_lpar_creds);
> +
> +		if (caps->max_win_creds < DEF_WIN_CREDS) {
> +			pr_err("Window creds(%u) > max allowed window creds(%u)\n",
> +			       DEF_WIN_CREDS, caps->max_win_creds);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	copypaste_feat =3D true;
> +
> +	return 0;
> +}
> +
> +static int __init pseries_vas_init(void)
> +{
> +	struct hv_vas_ct_caps *hv_ct_caps;
> +	struct hv_vas_all_caps *hv_caps;
> +	int rc;
> +
> +	/*
> +	 * Linux supports user space COPY/PASTE only with Radix
> +	 */
> +	if (!radix_enabled()) {
> +		pr_err("API is supported only with radix page tables\n");
> +		return -ENOTSUPP;
> +	}
> +
> +	hv_caps =3D kmalloc(sizeof(*hv_caps), GFP_KERNEL);
> +	if (!hv_caps)
> +		return -ENOMEM;
> +	/*
> +	 * Get VAS overall capabilities by passing 0 to feature type.
> +	 */
> +	rc =3D h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, 0,
> +					  (u64)virt_to_phys(hv_caps));
> +	if (rc)
> +		goto out;
> +
> +	caps_all.descriptor =3D be64_to_cpu(hv_caps->descriptor);
> +	caps_all.feat_type =3D be64_to_cpu(hv_caps->feat_type);
> +
> +	hv_ct_caps =3D kmalloc(sizeof(*hv_ct_caps), GFP_KERNEL);
> +	if (!hv_ct_caps) {
> +		rc =3D -ENOMEM;
> +		goto out;
> +	}
> +	/*
> +	 * QOS capabilities available
> +	 */
> +	if (caps_all.feat_type & VAS_GZIP_QOS_FEAT_BIT) {
> +		rc =3D get_vas_capabilities(VAS_GZIP_QOS_FEAT,
> +					  VAS_GZIP_QOS_FEAT_TYPE, hv_ct_caps);
> +
> +		if (rc)
> +			goto out_ct;
> +	}
> +	/*
> +	 * Default capabilities available
> +	 */
> +	if (caps_all.feat_type & VAS_GZIP_DEF_FEAT_BIT) {
> +		rc =3D get_vas_capabilities(VAS_GZIP_DEF_FEAT,
> +					  VAS_GZIP_DEF_FEAT_TYPE, hv_ct_caps);
> +		if (rc)
> +			goto out_ct;
> +	}
> +
> +	pr_info("GZIP feature is available\n");
> +
> +out_ct:
> +	kfree(hv_ct_caps);
> +out:
> +	kfree(hv_caps);
> +	return rc;
> +}
> +machine_device_initcall(pseries, pseries_vas_init);
> --=20
> 2.18.2
>=20
>=20
>=20
