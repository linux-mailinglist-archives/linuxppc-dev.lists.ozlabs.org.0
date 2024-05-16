Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3CD8C75DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 14:18:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ja4iCsqE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vg8Jm2MDJz3fph
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 22:18:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ja4iCsqE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vg8J30wtSz3cf8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 22:18:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 48BCDCE1896;
	Thu, 16 May 2024 12:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65724C113CC;
	Thu, 16 May 2024 12:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715861887;
	bh=xIBvgUA3GxPMhfgmzaW4zOWO/kjFOkYCDtn0FkIzZSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ja4iCsqEuuzYg8BupkdjBsN2Ry+ctT+W0pZt0icJqpavJRjyEC6s3v3vlQCfyK0s7
	 ovL4vjFh28xGivUCIRHW7v71UTmnB8/VMhCRHqy/zbPf+IavRmmupIfw/iDfIjyDbT
	 tVerabbA1NrsSPHh9hUvUoVLrdw0l6NscBct74hoGACqZ9RlRSY6Ev1cS/DTwXCXWK
	 UZ9SfFemywcbXYcp+Oz60r3FmlZMW4QjeSivnTqEWV69XZeTPkFtCT71vmwnWxJODR
	 dOHSH6To38jOcHOTrHNiWnN8LRAm0axg/+ZEQuQ/NxbNC1m6pIeJgL0VQ5aRt6MfQT
	 nI4tl4RXT24YQ==
Date: Thu, 16 May 2024 13:18:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCHv4 8/9] ASoC: fsl-asoc-card: add DT property
 "cpu-system-clock-direction-out"
Message-ID: <20d8eb96-6346-4341-95ee-74729001c01a@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-9-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qyP2+HTgE4Ups3SO"
Content-Disposition: inline
In-Reply-To: <20240515135411.343333-9-elinor.montmasson@savoirfairelinux.com>
X-Cookie: I'm having a MID-WEEK CRISIS!
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--qyP2+HTgE4Ups3SO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 15, 2024 at 03:54:10PM +0200, Elinor Montmasson wrote:
> Add new optional DT property "cpu-system-clock-direction-out" to set
> sysclk direction as "out" for the CPU DAI when using the generic codec.
> It is set for both Tx and Rx.
> If not set, the direction is "in".
> The way the direction value is used is up to the CPU DAI driver
> implementation.

This feels like we should be using the clock bindings to specify the
clock input of whatever is using the output from the SoC, though that's
a lot more work.

--qyP2+HTgE4Ups3SO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZF+XcACgkQJNaLcl1U
h9BOcAgAgLtirZZNkJCJym3Zg2exAkuMznCbG3vzhug2rdyPFeYCt7+q3uMqs9QL
ehCjibTUMcmLCA4pJA5G6l+OS+Fy9fAuaZc3tIADu0AcarzVHsy96kWjlUnkJTTo
IIcoydNZKalL0k4wMPB48k5pxCeo4eOjHql//4G+IauEcMgEOHbzwf+17CJPXsq1
x3NqwVfmrKBUy8ze66Rxjis67wEhMd7360LCdRtiOZQIf/JEzKCV0v/s0UwhmHVP
VR8c5o/YUpMNGefA317nPw8Tw9hVgqtLYV1hLwYn/C7QzIrIhGPn7m16h57m6IPz
N8JFnC+MvXIZjtMWx00is/tRmxqM6g==
=T9W3
-----END PGP SIGNATURE-----

--qyP2+HTgE4Ups3SO--
