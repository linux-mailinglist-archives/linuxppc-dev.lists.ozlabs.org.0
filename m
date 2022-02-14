Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B14B64B3F6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 03:28:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxp6k24D7z3bcZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 13:28:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LshJzQgY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LshJzQgY; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxp615v6bz30Qt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 13:27:36 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id e17so7250473pfv.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 18:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=AaSZ8bOGwql7Qx9wRu1tITsPjnFVoUrvxEqnlZJxyhM=;
 b=LshJzQgYkxrugP1ejfqhUtcP8sdrPch7NjbTop/ZKCpIJClDPQXqXe0LtzemWPvN9N
 VKMME89lg4hvckj652TQoPCQGVixYwKrKQT+tk2+kvtJrrITNTnN0KYaEPHDNxaawVvb
 BizwG5mJvUQpem5WewHmy4SmZgYC4NWKn1iqBoOdqB4HJZ91btWymeY+aYOc365/DB8b
 kAgLlBsgmWwnXhM70fqGxtx1iNMDMxEgrhD6gbw+4IxuYvfFLdaXg/X2qrxOHl+13UDB
 0NAn8AcW+xoD4tVFaZOhKzUOHc3lqj8ZNlPx7PDbvlm8sQ63OtMLDecI8R/ToqJvOv4U
 rDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=AaSZ8bOGwql7Qx9wRu1tITsPjnFVoUrvxEqnlZJxyhM=;
 b=SBRb9mTkO7i7yAOg61+7e7vwscfy77SJdGTiQ6umw+ROZj45zwRdV0RwdvnHcZ58nJ
 oDjEURQ0qJmNqNmLn/x7wxqI4z9eZabdS4In533b9xtUw60A92gXL1tifo8MGJY4zdvr
 kUlj0gSNwQBNe4kbe7wV5HZlXIvSzVsCOm583uI3BKM6DbcHywXoANDoZ1bWw6jGOuhH
 E7D2ud+wkxhodNNkdzFxNSlJyTZhMBfj0kpaH3lD3FRD9q/M4Zxfz6W/tZ60PrrirFlZ
 KpmGZAWaDnx/YfXrVubcHDz2m6wReqppXz7+Ay8yBgi7gIxUbDrqM7NTZ7RHZxcVNioy
 Ltww==
X-Gm-Message-State: AOAM532OC6ng06/nnMtIqp/0+jLRnErGfIBI+xS1xIxAEumIeMk1W+aA
 qxgBccJv1DR0IVGkUpSO1u8=
X-Google-Smtp-Source: ABdhPJymYxFvwHCslcC9RqOzDT9Aucx7AmIxmp1aspbhR5EzNKT7TWPPVlI61T3rD8uUxspledw7Ww==
X-Received: by 2002:a65:6056:: with SMTP id a22mr9259695pgp.21.1644805654168; 
 Sun, 13 Feb 2022 18:27:34 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id b14sm34694755pfm.17.2022.02.13.18.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 18:27:33 -0800 (PST)
Date: Mon, 14 Feb 2022 12:27:28 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 02/10] powerpc/pseries/vas: Add notifier for DLPAR core
 removal/add
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <68ec2a354a932670fabd600a18eccbfcacd84464.camel@linux.ibm.com>
In-Reply-To: <68ec2a354a932670fabd600a18eccbfcacd84464.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1644804881.mp6yrf6sdz.astroid@bobo.none>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Haren Myneni's message of January 22, 2022 5:54 am:
>=20
> The hypervisor assigns credits for each LPAR based on number of
> cores configured in that system. So expects to release credits
> (means windows) when the core is removed. This patch adds notifier
> for core removal/add so that the OS closes windows if the system
> looses credits due to core removal and reopen windows when the
> credits available later.

This could be improved. As far as I can tell,

 The hypervisor assigns vas credits (windows) for each LPAR based on the=20
 number of cores configured in that system. The OS is expected to=20
 release credits when cores are removed, and may allocate more when=20
 cores are added.

Or can you only re-use credits that you previously lost?

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/vas.c | 37 ++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index c0737379cc7b..d2c8292bfb33 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -538,6 +538,39 @@ static int __init get_vas_capabilities(u8 feat, enum=
 vas_cop_feat_type type,
>  	return 0;
>  }
> =20
> +/*
> + * Total number of default credits available (target_credits)
> + * in LPAR depends on number of cores configured. It varies based on
> + * whether processors are in shared mode or dedicated mode.
> + * Get the notifier when CPU configuration is changed with DLPAR
> + * operation so that get the new target_credits (vas default capabilitie=
s)
> + * and then update the existing windows usage if needed.
> + */
> +static int pseries_vas_notifier(struct notifier_block *nb,
> +				unsigned long action, void *data)
> +{
> +	struct of_reconfig_data *rd =3D data;
> +	struct device_node *dn =3D rd->dn;
> +	const __be32 *intserv =3D NULL;
> +	int len, rc =3D 0;
> +
> +	if ((action =3D=3D OF_RECONFIG_ATTACH_NODE) ||
> +		(action =3D=3D OF_RECONFIG_DETACH_NODE))

I suppose the OF notifier is the way to do it (cc Nathan).

Could this patch be folded in with where it acually does something? It=20
makes it easier to review and understand how the notifier is used.


> +		intserv =3D of_get_property(dn, "ibm,ppc-interrupt-server#s",
> +					  &len);
> +	/*
> +	 * Processor config is not changed
> +	 */
> +	if (!intserv)
> +		return NOTIFY_OK;
> +
> +	return rc;
> +}
> +
> +static struct notifier_block pseries_vas_nb =3D {
> +	.notifier_call =3D pseries_vas_notifier,
> +};
> +
>  static int __init pseries_vas_init(void)
>  {
>  	struct hv_vas_cop_feat_caps *hv_cop_caps;
> @@ -591,6 +624,10 @@ static int __init pseries_vas_init(void)
>  			goto out_cop;
>  	}
> =20
> +	/* Processors can be added/removed only on LPAR */

What does this comment mean? DLPAR?

Thanks,
Nick

> +	if (copypaste_feat && firmware_has_feature(FW_FEATURE_LPAR))
> +		of_reconfig_notifier_register(&pseries_vas_nb);
> +
>  	pr_info("GZIP feature is available\n");
> =20
>  out_cop:
> --=20
> 2.27.0
>=20
>=20
>=20
