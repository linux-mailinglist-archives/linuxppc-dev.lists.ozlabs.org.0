Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 455AD4C0FD4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 11:05:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Wrc3rjrz3bcv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 21:05:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U5CR9B8f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=U5CR9B8f; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3Wr00jwcz2xXX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 21:05:19 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id om7so2137867pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 02:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Ob8dpkMGWxh+j1xSkwsfyIqfP0rbzYHrzqb1bsuDuOY=;
 b=U5CR9B8fVzyNGCUIVUf22V5TsrnF/7n5uUWf2gxsGiuA8PYnpc+MRCHTat72DE9Fy5
 cyREI1WysLdiEzZo4T556P48sy1Aubddfrh9Xb2KscgogjKaHTBHtsfM4q0b353q0W54
 LYw5IMTq0/hbDRCKQ72ScXrhMmSfO/f4HovNYCSZ9HV6NXBpOcjeCbu4rLL+m3YPjJ5m
 YYh7VNaO41Xxw14JdAoHaFAYfe6UiBVaQCeGG2y44VsiDEkQaoBskjj2EfMMWGjv7bLy
 MWVenC7+O+ehURTQQ2ZOQXN3D9vk+Yn3qyUq46DyzdwMinKxjwdmvvkf45sYeHY1pzah
 Hi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Ob8dpkMGWxh+j1xSkwsfyIqfP0rbzYHrzqb1bsuDuOY=;
 b=d4ia3X1WF6FwnrFAsA/og8lDAzuod5KSQPOmTJvAiN6+tcm82fpBbxjRg4D85a3NpW
 6ysyp2dHnZkqw8RY3LWLj6fni94k63TBXugpiL++4zJslbBLJLOvc8uj1pL2ay4ylcYU
 4FRtcHRpL+jKelmsHNmZSO75alCBsR+VS8No/xVNtp3Z7FOJ5MJ4IHmC7XcVmT/HSkwj
 mBVAF83vod8Jy1yE7x6BLcpkzpHoYoTvR/OluBtI7z+1wLgG4lXHMkl95VnK+MIESflA
 meON9rGKfTP/8gDX82sgKe7FJDn+2FE8lod3pk7bx2iFVYPvLb2cvf+vfarWrrZhtsVg
 mxfg==
X-Gm-Message-State: AOAM532L8DTttjAqFTC4tJAlpTDZQW6QFJXxqca5AlPbT72Bf0jfswAQ
 M7lnbz6O9Y9swcHJra+LiyE=
X-Google-Smtp-Source: ABdhPJzYDpzZ8Di4zJ1ZPJlz6WE1/Zx4KFqSZ9+G6T+2MSlk/omK2cFFYNiLBL9pjDo8CuiALQM9NA==
X-Received: by 2002:a17:90a:4fa1:b0:1bb:8ad8:581c with SMTP id
 q30-20020a17090a4fa100b001bb8ad8581cmr8520883pjh.105.1645610718550; 
 Wed, 23 Feb 2022 02:05:18 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id l20sm21950217pfc.53.2022.02.23.02.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 02:05:18 -0800 (PST)
Date: Wed, 23 Feb 2022 20:05:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 4/4] powerpc/pseries/vas: Disable window open during
 migration
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
References: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
 <e89d39b0860eab0b528e454aff5fc465066025a4.camel@linux.ibm.com>
In-Reply-To: <e89d39b0860eab0b528e454aff5fc465066025a4.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645610684.3sbe7da1hv.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of February 20, 2022 6:08 am:
>=20
> The current partition migration implementation does not freeze the
> user space and the user space can continue open VAS windows. So
> when migration_in_progress flag is enabled, VAS open window
> API returns -EBUSY.

Seems like it could be merged with the previous patch. Unless
you're trying to specifically call out the -EBUSY chane to the
API?

Thanks,
Nick

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/vas.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index df22827969db..4be80112b05e 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -30,6 +30,7 @@ static struct hv_vas_cop_feat_caps hv_cop_caps;
> =20
>  static struct vas_caps vascaps[VAS_MAX_FEAT_TYPE];
>  static DEFINE_MUTEX(vas_pseries_mutex);
> +static bool migration_in_progress;
> =20
>  static long hcall_return_busy_check(long rc)
>  {
> @@ -356,8 +357,11 @@ static struct vas_window *vas_allocate_window(int va=
s_id, u64 flags,
>  	 * same fault IRQ is not freed by the OS before.
>  	 */
>  	mutex_lock(&vas_pseries_mutex);
> -	rc =3D allocate_setup_window(txwin, (u64 *)&domain[0],
> -				   cop_feat_caps->win_type);
> +	if (migration_in_progress)
> +		rc =3D -EBUSY;
> +	else
> +		rc =3D allocate_setup_window(txwin, (u64 *)&domain[0],
> +					   cop_feat_caps->win_type);
>  	mutex_unlock(&vas_pseries_mutex);
>  	if (rc)
>  		goto out;
> @@ -890,6 +894,11 @@ int vas_migration_handler(int action)
> =20
>  	mutex_lock(&vas_pseries_mutex);
> =20
> +	if (action =3D=3D VAS_SUSPEND)
> +		migration_in_progress =3D true;
> +	else
> +		migration_in_progress =3D false;
> +
>  	for (i =3D 0; i < VAS_MAX_FEAT_TYPE; i++) {
>  		vcaps =3D &vascaps[i];
>  		caps =3D &vcaps->caps;
> --=20
> 2.27.0
>=20
>=20
>=20
