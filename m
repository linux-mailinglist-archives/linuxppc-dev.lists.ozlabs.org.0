Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9379D4C0F55
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 10:40:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3WGw6V6sz3cVW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 20:40:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m7s4uOOR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=m7s4uOOR; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3WFx0fyKz3cGb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 20:39:16 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id z15so9034444pfe.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 01:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ezoZaW8LbVpWwKTVq3DItEIPEejYqAiaztYKDVZjTZg=;
 b=m7s4uOOR5ivXHOnS/pug7e6Vuvk3xvM3/gpeC/d6yPt+W7gDVB68919icCqLgs+lpt
 RO82+MgNSZ8+3X6fO8zV86LFbBPY/+I8Le1KJygYKEca48YyjmCv1YKscUtCFPqmDAi3
 jQMFgmastKMpbRCf7CZ1E+II96/NBKWKey1jaiOnyTJZekbd0SgFU4NAoYaRRqz1nYn7
 SUSKr2ITweWrRh+Wd0h2lYPFMqin9GTi6RgK3Ghj5Ad3DFkITBGW6zMBuS8MmYJcbqpr
 08GfF7NTK021AXZjMzADIj2G+lOwB7QkTrY0D3ob/AC4+3OvtzhWigPg6Fz4n3TKl+we
 tbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ezoZaW8LbVpWwKTVq3DItEIPEejYqAiaztYKDVZjTZg=;
 b=eD6aCVTlrYZhNUeOetWaWUKmbj9vTK1BpjTMSZKSe3byTBqza5PsAu92mLHBZVqKfp
 mh6Fw7WVzbPw8RQJvqiSkq2b1XysFvOxkB8I/50VUiBudre1J2sDZo9oHcsYlKP3/Erv
 I1lr1jSD0JXZdno7R+2IAQ2xllyBI+tVCqqfzPbU8ffpE0zJJaos7hwz967V7cAhUUZk
 dYG/WmDIB9orf8RBKuN5e5S4QuwbRnfemtIvVfyrHgC7DPIRM6950oO4D9madCkNkkEh
 mr8+40I8Prma2JBw9h3SX+ztWCFrDofeyWdKKJB5PiJpF7NaBu90S3OdMHyGPySbF5eP
 fLOw==
X-Gm-Message-State: AOAM532Zj4VtLdNUD7q3RoovgwZkIuHfEM/9nSFTCIiG4fzYTbYhwmZZ
 lBOFi0IXBpIrtdPMII3u+JU=
X-Google-Smtp-Source: ABdhPJxF/aPTh1hLbV/NpiClQk3ZWFKyyY+NFtYBSx+uBKfkUdcAOKHJrSq63HgorQJj/dJG0b5Z7w==
X-Received: by 2002:a05:6a00:21c6:b0:49f:dcb7:2bf2 with SMTP id
 t6-20020a056a0021c600b0049fdcb72bf2mr28758380pfj.19.1645609154588; 
 Wed, 23 Feb 2022 01:39:14 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id w4sm22964506pgs.28.2022.02.23.01.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 01:39:14 -0800 (PST)
Date: Wed, 23 Feb 2022 19:39:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 1/4] powerpc/pseries/vas: Define global hv_cop_caps
 struct
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
References: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
 <d93b6cd28887e8ecf08b550d3483c0b50db64a4d.camel@linux.ibm.com>
In-Reply-To: <d93b6cd28887e8ecf08b550d3483c0b50db64a4d.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645609131.5qjkawfw8a.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of February 20, 2022 6:05 am:
>=20
> The coprocessor capabilities struct is used to get default and
> QoS capabilities from the hypervisor during init, DLPAR event and
> migration. So instead of allocating this struct for each event,
> define global struct and reuse it which allows the migration code
> to avoid adding an error path.
>=20
> Also disable copy/paste feature flag if any capabilities HCALL
> is failed.
>=20

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/vas.c | 47 ++++++++++++----------------
>  1 file changed, 20 insertions(+), 27 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index 591c7597db5a..3bb219f54806 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -26,6 +26,7 @@
> =20
>  static struct vas_all_caps caps_all;
>  static bool copypaste_feat;
> +static struct hv_vas_cop_feat_caps hv_cop_caps;
> =20
>  static struct vas_caps vascaps[VAS_MAX_FEAT_TYPE];
>  static DEFINE_MUTEX(vas_pseries_mutex);
> @@ -724,7 +725,6 @@ static int reconfig_close_windows(struct vas_caps *vc=
ap, int excess_creds)
>   */
>  int vas_reconfig_capabilties(u8 type)
>  {
> -	struct hv_vas_cop_feat_caps *hv_caps;
>  	struct vas_cop_feat_caps *caps;
>  	int old_nr_creds, new_nr_creds;
>  	struct vas_caps *vcaps;
> @@ -738,17 +738,13 @@ int vas_reconfig_capabilties(u8 type)
>  	vcaps =3D &vascaps[type];
>  	caps =3D &vcaps->caps;
> =20
> -	hv_caps =3D kmalloc(sizeof(*hv_caps), GFP_KERNEL);
> -	if (!hv_caps)
> -		return -ENOMEM;
> -
>  	mutex_lock(&vas_pseries_mutex);
>  	rc =3D h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, vcaps->feat,
> -				      (u64)virt_to_phys(hv_caps));
> +				      (u64)virt_to_phys(&hv_cop_caps));
>  	if (rc)
>  		goto out;
> =20
> -	new_nr_creds =3D be16_to_cpu(hv_caps->target_lpar_creds);
> +	new_nr_creds =3D be16_to_cpu(hv_cop_caps.target_lpar_creds);
> =20
>  	old_nr_creds =3D atomic_read(&caps->nr_total_credits);
> =20
> @@ -780,7 +776,6 @@ int vas_reconfig_capabilties(u8 type)
> =20
>  out:
>  	mutex_unlock(&vas_pseries_mutex);
> -	kfree(hv_caps);
>  	return rc;
>  }
>  /*
> @@ -822,9 +817,8 @@ static struct notifier_block pseries_vas_nb =3D {
> =20
>  static int __init pseries_vas_init(void)
>  {
> -	struct hv_vas_cop_feat_caps *hv_cop_caps;
>  	struct hv_vas_all_caps *hv_caps;
> -	int rc;
> +	int rc =3D 0;
> =20
>  	/*
>  	 * Linux supports user space COPY/PASTE only with Radix
> @@ -850,38 +844,37 @@ static int __init pseries_vas_init(void)
> =20
>  	sysfs_pseries_vas_init(&caps_all);
> =20
> -	hv_cop_caps =3D kmalloc(sizeof(*hv_cop_caps), GFP_KERNEL);
> -	if (!hv_cop_caps) {
> -		rc =3D -ENOMEM;
> -		goto out;
> -	}
>  	/*
>  	 * QOS capabilities available
>  	 */
>  	if (caps_all.feat_type & VAS_GZIP_QOS_FEAT_BIT) {
>  		rc =3D get_vas_capabilities(VAS_GZIP_QOS_FEAT,
> -					  VAS_GZIP_QOS_FEAT_TYPE, hv_cop_caps);
> +					  VAS_GZIP_QOS_FEAT_TYPE, &hv_cop_caps);
> =20
>  		if (rc)
> -			goto out_cop;
> +			goto out;
>  	}
>  	/*
>  	 * Default capabilities available
>  	 */
> -	if (caps_all.feat_type & VAS_GZIP_DEF_FEAT_BIT) {
> +	if (caps_all.feat_type & VAS_GZIP_DEF_FEAT_BIT)
>  		rc =3D get_vas_capabilities(VAS_GZIP_DEF_FEAT,
> -					  VAS_GZIP_DEF_FEAT_TYPE, hv_cop_caps);
> -		if (rc)
> -			goto out_cop;
> -	}
> +					  VAS_GZIP_DEF_FEAT_TYPE, &hv_cop_caps);
> =20
> -	if (copypaste_feat && firmware_has_feature(FW_FEATURE_LPAR))
> -		of_reconfig_notifier_register(&pseries_vas_nb);
> +	if (!rc && copypaste_feat) {
> +		if (firmware_has_feature(FW_FEATURE_LPAR))
> +			of_reconfig_notifier_register(&pseries_vas_nb);
> =20
> -	pr_info("GZIP feature is available\n");
> +		pr_info("GZIP feature is available\n");
> +	} else {
> +		/*
> +		 * Should not happen, but only when get default
> +		 * capabilities HCALL failed. So disable copy paste
> +		 * feature.
> +		 */
> +		copypaste_feat =3D false;
> +	}
> =20
> -out_cop:
> -	kfree(hv_cop_caps);
>  out:
>  	kfree(hv_caps);
>  	return rc;
> --=20
> 2.27.0
>=20
>=20
>=20
