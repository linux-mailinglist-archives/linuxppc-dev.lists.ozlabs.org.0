Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A10E3ABF52
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:25:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5dSv1Yc4z3c3X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 09:25:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GGeN94q7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GGeN94q7; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5dSP5Yxyz30B3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 09:24:52 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id p13so6296100pfw.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 16:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=CfqAelGsB2GVkfCjgTBItidiNykTIW0YkEXIru4x3DQ=;
 b=GGeN94q7f6Uy8+5ozUkcv61KhMJF2rPz+vcnv2uiioPCzCB9HIzhseJRnzDml624q3
 P1+p3lEV91jeYa08z89vtHZVYPH+xgBhIdeuoC3UhtE38G+in4ZsqGjf8sVNzG90oVPd
 oTxPLFSl+FBDaxcN0/fWrsWR0kocAZtmKgADA8B1q/izQI+JA4SFST38JWliQ6nhRvC+
 l4noadVSgrMM6XfVi9r9P81vXDhy9qCNJ3oMTIX/UujzSbdZCOW/FktuQ7Hi/1KH3Psf
 XdoBOJmIn+lBQ6kvC8S5DH/D8tXWCzcgLsvYQLvpsLF7/VFxYd3sGwNi6uGhykKnAx/m
 6Xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=CfqAelGsB2GVkfCjgTBItidiNykTIW0YkEXIru4x3DQ=;
 b=L3lV5jjv3YIrR5kUeub+ACpYDO2ff0ChMaIQqrNA+9pVt4qfA4d02Xcuisv+dtSU0w
 2lNEicbv77K2iyJ8wubqlZAV14gGO76ADlYUbY6swQJ9BlSD9tWeYLLIWbDTZIbKkFHD
 DfsF8CXUgFSAamVwN+EzfXUDF6mHHujy+glT3dccij80H8LyJ0d969yFIUiuRrVndN2v
 JMQR2XvbfPNmfhTuYHw2FVH2pQHCq1lhSY0iZZzAPGukyy4PYJoIdlAhmywkuuCxMKiU
 atanNOmex+mC/dMJPHS9jtSCUDJm76AO2ax9pca8UV1OxnkQgVw9sIMI1EDnfVIP6mV5
 sJZg==
X-Gm-Message-State: AOAM531B0uNcHk4/C0mGmbQeOwp7xVrIo09IDPN9yi3NyJD8slvQtMD+
 nOdPHc4PUX6gM8CWePYcrng=
X-Google-Smtp-Source: ABdhPJy7PHMHqG8eTxUguJ6ytEFHS+7DB/esPUmzkA5SSPq7BCDtId/+0fOM0Nh8mhSoYhu364pMsw==
X-Received: by 2002:a63:4842:: with SMTP id x2mr7260754pgk.288.1623972288644; 
 Thu, 17 Jun 2021 16:24:48 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id j7sm11431464pjf.0.2021.06.17.16.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 16:24:48 -0700 (PDT)
Date: Fri, 18 Jun 2021 09:24:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 11/17] powerpc/pseries/vas: Implement getting
 capabilities from hypervisor
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
 <177c88608cb88f7b87d1c546103f18cec6c056b4.camel@linux.ibm.com>
In-Reply-To: <177c88608cb88f7b87d1c546103f18cec6c056b4.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623972214.66b5w89bfe.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 18, 2021 6:35 am:
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

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/platforms/pseries/vas.c | 122 +++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index a73d7d00bf55..93794e12527d 100644
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
> @@ -20,6 +21,11 @@
>  /* The hypervisor allows one credit per window right now */
>  #define DEF_WIN_CREDS		1
> =20
> +static struct vas_all_caps caps_all;
> +static bool copypaste_feat;
> +
> +static struct vas_caps vascaps[VAS_MAX_FEAT_TYPE];
> +
>  static long hcall_return_busy_check(long rc)
>  {
>  	/* Check if we are stalled for some time */
> @@ -145,3 +151,119 @@ int h_query_vas_capabilities(const u64 hcall, u8 qu=
ery_type, u64 result)
>  			hcall, rc, query_type, result);
>  	return -EIO;
>  }
> +
> +/*
> + * Get the specific capabilities based on the feature type.
> + * Right now supports GZIP default and GZIP QoS capabilities.
> + */
> +static int get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
> +				struct hv_vas_cop_feat_caps *hv_caps)
> +{
> +	struct vas_cop_feat_caps *caps;
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
> +	struct hv_vas_cop_feat_caps *hv_cop_caps;
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
> +	hv_cop_caps =3D kmalloc(sizeof(*hv_cop_caps), GFP_KERNEL);
> +	if (!hv_cop_caps) {
> +		rc =3D -ENOMEM;
> +		goto out;
> +	}
> +	/*
> +	 * QOS capabilities available
> +	 */
> +	if (caps_all.feat_type & VAS_GZIP_QOS_FEAT_BIT) {
> +		rc =3D get_vas_capabilities(VAS_GZIP_QOS_FEAT,
> +					  VAS_GZIP_QOS_FEAT_TYPE, hv_cop_caps);
> +
> +		if (rc)
> +			goto out_cop;
> +	}
> +	/*
> +	 * Default capabilities available
> +	 */
> +	if (caps_all.feat_type & VAS_GZIP_DEF_FEAT_BIT) {
> +		rc =3D get_vas_capabilities(VAS_GZIP_DEF_FEAT,
> +					  VAS_GZIP_DEF_FEAT_TYPE, hv_cop_caps);
> +		if (rc)
> +			goto out_cop;
> +	}
> +
> +	pr_info("GZIP feature is available\n");
> +
> +out_cop:
> +	kfree(hv_cop_caps);
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
