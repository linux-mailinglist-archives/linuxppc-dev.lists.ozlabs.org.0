Return-Path: <linuxppc-dev+bounces-7796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2171A93BA9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 19:07:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfLm23RcRz3c4l;
	Sat, 19 Apr 2025 03:07:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:4000:64:cc:545d:19ff:fe05:8172"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744996033;
	cv=none; b=HAs0Wu/Q4qBxdgjJNe+rAmGUxvDG0zJbJ1+pahUC493t/Ul3XYy0koApEqh9ByrxDkFPReMdM5fNsSqGSSDa7/VqoG+yRaLPlMFIZAoEpgsdhjIW/LtmdvL2BQRVPMaPmxU7DJ9K7dZL8jhqfpotRqNYvEAWyU3bX6bOWB9hacxkhG2lP3KGub3y6yBuzB6KAef08MIiM4Vcnoqp/WQVCKaDwhDblSFDPrlTnCAdqeQygruvuP25T1k+tFrNssOdyviZQr+1xqPqH1j73sR8pdtIWpVwcG5ElP092s4lkvlP3fqfqd/d7LaibIV2diSYCq4porG6g/gfPEmZIrvvBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744996033; c=relaxed/relaxed;
	bh=aSYTOYrhvq3xoKuHguEK0iR48SX9BrWOGc8iTYg7DdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wh9DAXhQ0At09zgcvj/m972b6lzPkESzRq8AKDMODbX5eBbzMrnyqdLzWW5iGaSu3L+wSOSv/h0h7ZPBpCCGyxZi1q3Ce688K9Jpn46BI4/zvzg8BvJx8Hx1eROnKgl7hj0SFUZLhEp9L9zmRytNqgvT9YqU12p8brgygZmGyzriS5Huj/FfP9eQ3iMbzf0udPM7drtrRvEFV9qeadZUAseMyyaHRY18AcA0cWQNOFxrheuotZVlOVEUM6DRt9KBnFTVKkTOYRRL+tRISyxpAbjf/skdtz69xm/S2oc0u2JgW95zmo5dcnNj8FMJ2EsjDX1p2V9TfQxVMvbjsCcHuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=denx.de; dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256 header.s=mx-20241105 header.b=P1RFJC1C; dkim-atps=neutral; spf=pass (client-ip=2a03:4000:64:cc:545d:19ff:fe05:8172; helo=mx.denx.de; envelope-from=pavel@denx.de; receiver=lists.ozlabs.org) smtp.mailfrom=denx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256 header.s=mx-20241105 header.b=P1RFJC1C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=denx.de (client-ip=2a03:4000:64:cc:545d:19ff:fe05:8172; helo=mx.denx.de; envelope-from=pavel@denx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 461 seconds by postgrey-1.37 at boromir; Sat, 19 Apr 2025 03:07:11 AEST
Received: from mx.denx.de (mx.denx.de [IPv6:2a03:4000:64:cc:545d:19ff:fe05:8172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfLlz5fVYz3c4h
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 03:07:11 +1000 (AEST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF6C2102E6336;
	Fri, 18 Apr 2025 18:59:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744995560; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=aSYTOYrhvq3xoKuHguEK0iR48SX9BrWOGc8iTYg7DdE=;
	b=P1RFJC1CKiZdbWyNLxS8wmpRGBCJfNwPaHTfS+UrXLAwjv7kF1KBCtu622uQPthc7zgDls
	z5bZbf0j+s/sZVuPU42o8fULO+bCG4o+0HC6h9fFkZFL4qqgThZ8qN/jL8nOc5o/KMVKM7
	IYfaMwIzwY6Kwl0f+5Z+Qb/cn8d/0FO9N2IEUEA6fQ7DRGLq3wILIFM/OaFh29cFsgeoWx
	auwEz43jwimW9cYfZzWY/Hw7zr2CNIJ9mGc7sghjf1lks0XxUQWcrQwSCBzl0lo0KcU+e5
	kmLBIqZtB8cIv9Uy4jVwpgXglL1In3PkNBUxhSr9ZWaf10IC8OvOIR+LQrNNvQ==
Date: Fri, 18 Apr 2025 18:59:14 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Mark Brown <broonie@kernel.org>, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH AUTOSEL 6.1 6/9] ASoC: fsl_audmix: register card device
 depends on 'dais' property
Message-ID: <aAKE4kb6gImSpK5L@duo.ucw.cz>
References: <20250331145642.1706037-1-sashal@kernel.org>
 <20250331145642.1706037-6-sashal@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Tn6/BGpnTOBLo3b"
Content-Disposition: inline
In-Reply-To: <20250331145642.1706037-6-sashal@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--/Tn6/BGpnTOBLo3b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [ Upstream commit 294a60e5e9830045c161181286d44ce669f88833 ]
>=20
> In order to make the audmix device linked by audio graph card, make
> 'dais' property to be optional.
>=20
> If 'dais' property exists, then register the imx-audmix card driver.
> otherwise, it should be linked by audio graph card.

This is part of series, AFAICT; should we have it in -stable?

Best regards,
									Pavel

> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -492,11 +492,17 @@ static int fsl_audmix_probe(struct platform_device =
*pdev)
>  		goto err_disable_pm;
>  	}
> =20
> -	priv->pdev =3D platform_device_register_data(dev, "imx-audmix", 0, NULL=
, 0);
> -	if (IS_ERR(priv->pdev)) {
> -		ret =3D PTR_ERR(priv->pdev);
> -		dev_err(dev, "failed to register platform: %d\n", ret);
> -		goto err_disable_pm;
> +	/*
> +	 * If dais property exist, then register the imx-audmix card driver.
> +	 * otherwise, it should be linked by audio graph card.
> +	 */
> +	if (of_find_property(pdev->dev.of_node, "dais", NULL)) {
> +		priv->pdev =3D platform_device_register_data(dev, "imx-audmix", 0, NUL=
L, 0);
> +		if (IS_ERR(priv->pdev)) {
> +			ret =3D PTR_ERR(priv->pdev);
> +			dev_err(dev, "failed to register platform: %d\n", ret);
> +			goto err_disable_pm;
> +		}
>  	}
> =20
>  	return 0;

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--/Tn6/BGpnTOBLo3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaAKE4gAKCRAw5/Bqldv6
8hsNAJ9H7kuYWcCsw1LeV5TOvp6rZ2J1rACghLqa+XYVc6jaUuETLw1RElPql14=
=wIoA
-----END PGP SIGNATURE-----

--/Tn6/BGpnTOBLo3b--

