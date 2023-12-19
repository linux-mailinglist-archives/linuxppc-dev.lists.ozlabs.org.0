Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C6C818797
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 13:37:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Sx8XwVUI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Svbmj020Hz3cVq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 23:37:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Sx8XwVUI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Svbls0BjPz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 23:36:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4392612B9;
	Tue, 19 Dec 2023 12:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC17AC433C7;
	Tue, 19 Dec 2023 12:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702989381;
	bh=tiHOc2vd0PeMZmcefRov95UDysQbT1EeRCm2fFpUgQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sx8XwVUIxasLh6HVN/W8pU7bRX4zjoBWn7d5JDeV7dh47LKadr6MdqW+EQ16jKN5j
	 gjF4Qm87OOKGmtS8sW67sncJwB5u0vZjqEfR+HgeyyGLN7lrRBDFAO8BH+f8XT7xCt
	 1gHNNoVmCPDr1Rj7ZXuMC/FruTuA6gar97X7r3ePywDLF5WjK9Kq8mChVySDNz2R4+
	 OCX5/OC0l0tcA3Wd11ovN4U7r6etYa1f96orjVP2scOlQa+DU5Gvuy+7VYHIkUsZ3i
	 pCOJKNHbhF4Od8ex75bifvlf6IGLgf4KbYCg/TWvUtkVhhTnzCsfUyTD/T3QMBFNEl
	 beMhs4PaBjiCQ==
Date: Tue, 19 Dec 2023 13:36:17 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 00/10] Don't let i2c adapters declare I2C_CLASS_SPD
 support if they support I2C_CLASS_HWMON
Message-ID: <ZYGOQYDaXmTK2nke@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20231124101619.6470-1-hkallweit1@gmail.com>
 <b2dd7159-844e-4d5a-832d-a2e8c0f26f50@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+O02xqf8AKUyujd4"
Content-Disposition: inline
In-Reply-To: <b2dd7159-844e-4d5a-832d-a2e8c0f26f50@gmail.com>
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
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--+O02xqf8AKUyujd4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This series and my other series are sitting idle in patchwork
> for 3 weeks now. AFAICS they have the needed ack's.
> Anything missing before they can be applied?

Applied to for-next, thanks!


--+O02xqf8AKUyujd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBjkEACgkQFA3kzBSg
KbaO1hAAooFUEwBmrRIwLhiUmuleNDxpkm2+TJogB4CxDIfA95CV7cwuMB57JD0O
zpyBvqiaj8yHo9h6QW5u8oeYcyJJAkpO5bAa4JDCAqtvJjoEs1lx1FNvD5JdbwMD
Nzps601cYoNHO7wGT3Yzv3ZDYFlpUhY1HdcJDRrNxLcIzwDgLHDaIKP/qXF82Fvl
CFj00WJZ7nKay2vxMF/kHcEsqUTrIxsEgJGio6am7qPeSoCP3/vkl/jiiCrtVlIE
wPpzNJ1xGCO8UplCczBENJjmaBqLOlToUm4ZuIJE9TPUqj7CL53JvhRUIkeJARuA
nBwqS4qrGhxSqHugucwkggcKLB/g5iLfFtZrvEXooNX+i0So8+zTWDv6Py+/wtiY
Kw4dyT0n9obNczQm+VywnGvPQ+DR3cqkYnvAuFd0pPztitYm0MRWdNqpomstpTFU
f1NaLgQwaib8IP8xwmZ/8WRpB8yrMN0o4CE5ckYtGAV51wC/LBNL8LJNbqq2x2tf
B7gimHvJ5Otr9t8UY6DJY8K6I5pPKT9yaYTxjgj1rSOj5ANtILP1qzU9ZCWh+qvC
uqgv0pYoV91nhMtKb5XGzKuvhOrsFjNl0+Ujome0s2EIX0i4qpfbSky1UEux53xM
mrLf9eN+EyCpqdje8jO4E6DSOrGq4PD7ob4C03v0IJ61jyZou2s=
=3pKs
-----END PGP SIGNATURE-----

--+O02xqf8AKUyujd4--
