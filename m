Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDA6887137
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 17:49:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=C5Ewx1W/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1Swd1fLrz3vrD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 03:49:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=C5Ewx1W/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1Svt5mK7z3vlq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 03:48:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ezxi
	fZ/NdoltWKmyiuN6imx75HAhf4NgVqu/1YvSeb0=; b=C5Ewx1W/xQ3t7Ny7X3wq
	1OaJ45FEPAkLMBSzdSgEzZ37WKuAp+iNFi7wdpgvolxjlFs5YI8R50J7U4LU1Onb
	c/bgsMRNiT47Vq/CQ/fvSzj7W+LjUfCJRY41x3yt+gopV7zbErpMsh7MwXZ40V3Q
	FZn1nDgS02CrbdF5ZPqlgid9ZOYuUVHnYqB542i4G/yIpEjsTQLPJ8kgTyfk+ShR
	HrcGrKOBhl/LLBnNpMcPLod1ozLcpM7Knt9Ho9sDxUGzbhXKvunqy+2j/lQFJ/2O
	8w/wX7B/pQJTkQe/IEYkvdWAyKj2EUlGd6rjmjcpN3jpm3GqlbnKFTPRztTh9pxu
	HQ==
Received: (qmail 3924065 invoked from network); 22 Mar 2024 17:48:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 17:48:55 +0100
X-UD-Smtp-Session: l3s3148p1@YwRumUIUZNtehhtF
Date: Fri, 22 Mar 2024 17:48:54 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Message-ID: <Zf22dmwBpN7Ctk3v@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
 <Zf2tSLJzujUHbJjp@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gk90DgmVWePBMrYC"
Content-Disposition: inline
In-Reply-To: <Zf2tSLJzujUHbJjp@smile.fi.intel.com>
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
Cc: chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org, virtualization@lists.linux.dev, linux-renesas-soc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--gk90DgmVWePBMrYC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  static const struct i2c_algorithm at91_twi_algorithm =3D {
> > -	.master_xfer	=3D at91_twi_xfer,
> > +	.xfer	=3D at91_twi_xfer,
>=20
> Seems you made this by a script, can you check the indentations afterward=
s?

Yes, I noticed as well. But other (not converted) drivers have issues
there as well, so this will be a seperate patch.

Thanks!


--gk90DgmVWePBMrYC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX9tnUACgkQFA3kzBSg
Kbbr8A//XEXud+6wIKsFTjfvJagkwqlNQp4For0+4AnAo3VuIMv44faNDOSxB63k
K+vOfRi2HAVzhVrYUBQLf4thG+KXeX+7OXTO+HUwm81u+mdor/KfhPshTZfelzR4
Sn9yxlg5kv2BQ3uCiNdv/7iznbabfUZPtQb9BnqBCj5O3nq5k1+WJYnm/1FamL9y
M4h0p+yg14kIIMPV8fvDzWKHwQGsrEUcVMGLo7Nhj2tFai5yPJZCMzHpakzhVZQE
wWsnWISmOwkFScr8cI8K8I5IQ1u4+2gDSUK0egM/spTBPqLfGamRt0SeVJnYEQQ7
Owy4DrIPRiOITKuNc/DG6/+TeujZjLkyRuVwHbmP2woTVZcpc9pijAxzZDi8uQZg
2zDdXj5mwtQMwkc+YwfTjnyAA8P8tbiAFdXgBcxn5w/4/by3uM4EtZBCEGhjXyDu
8yTFnBzKNuNJJ3tiixvkB/GrTApip1rQ1vMxqZ706IMyPKXLQkJpbkBgVQ7vZtSt
3AHRdwSBxBYBupcBKOxK5hMQLceYqyLnTVwppS7Om/ey7MkrnEFuCYWhmFuDb5MF
5Tk6iReI6pt7T2lU/JNW9vWpkeMHDomHJ7T23RSMUmzQfsi4YvWFFJ87Yd4JRtrD
wpacw1VztKHA12REQNWJHMwslzINn556NtcsRtarShBM5Xboofo=
=euQt
-----END PGP SIGNATURE-----

--gk90DgmVWePBMrYC--
