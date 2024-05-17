Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8598A8C853C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 13:06:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lhCtg23U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgkgN0Trxz3cRr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 21:06:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lhCtg23U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vgkfd1K5yz30VS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 21:06:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8DD36CE1A9D;
	Fri, 17 May 2024 11:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CBAC2BD10;
	Fri, 17 May 2024 11:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715943970;
	bh=cyel7fIdwl4HctMWrrdTp1YOPgFDo9/NgLEnSREBmac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhCtg23UXxfH8GFvpV0bBhTuuNC/yOVcyf8r+/SBwHRDykFO8ucIH2zOi4Lsfxh4d
	 jgUm1njcrxzwkFc5ERNxH12t8OuT6FilvS5TVUDj2I26qEA62JOrg9ddHttNLHU92I
	 WwwqESVPuv7qE7Dt0G1BbgYEuXiM/bp8Kp5wUtlatKoOVFCm7wjeV73X76XhNJgovE
	 jrSu3So5EIc69ImofyM9j3891OZ3tYqgklB+lrMan8iv6hEsQ/mi44SN+vCPxdjeUx
	 FK4gKAgevr+QDU7R6Lgh1WAy9nUhkn4UvE+ABj0uOQr0qIz3E3Ic29+uUjVaNb4a7w
	 1mCgljVttOEiQ==
Date: Fri, 17 May 2024 12:06:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCHv4 8/9] ASoC: fsl-asoc-card: add DT property
 "cpu-system-clock-direction-out"
Message-ID: <aa212906-6579-4884-82b5-6d0eb8b0b7a0@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-9-elinor.montmasson@savoirfairelinux.com>
 <20d8eb96-6346-4341-95ee-74729001c01a@sirena.org.uk>
 <1607626951.349332.1715936738428.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cuAZOLW+M2wSeAZZ"
Content-Disposition: inline
In-Reply-To: <1607626951.349332.1715936738428.JavaMail.zimbra@savoirfairelinux.com>
X-Cookie: Function reject.
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
Cc: devicetree <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, alsa-devel <alsa-devel@alsa-project.org>, Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound <linux-sound@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, shengjiu wang <shengjiu.wang@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--cuAZOLW+M2wSeAZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 17, 2024 at 05:05:38AM -0400, Elinor Montmasson wrote:

> This new compatible is intended to be used when there is no codec
> device/driver. There is technically no codec device/driver for which
> the clock input can be set.

This is obviously not true, there clearly is a driver.

> Is it a bad idea to allow setting the cpu sysclk direction only ?
> Should the compatible be limited to use-cases where the cpu sysclk
> direction cannot be set by the machine driver ?

When I said "this should use the clock bindings" I meant that we should
use the clock bindings for configuration here.

--cuAZOLW+M2wSeAZZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZHOhoACgkQJNaLcl1U
h9B5+wf8DiGSZ5ltF8WMKf7h2wg97OfIIvLbAgLOdxagHZRUlW/dW/+Yb3DRoVUx
bWVR5k6wCU7A6Qwi1k/l7vnJ0gi+7ZqpHvuecyUqUZzymYsReuFY+p73Hm+4vZOq
hCopfIw0bE96SL2v3NQZKSoIiXX/yKxVU6NboIhgjeZuUWeabzwTkJczdvahes8z
Wqa5Jfd22U7vq//vQQIViaVycQujM1QOA2vIbGAP0sF2XGNUzo1UmmE5mtbDlbLE
Cn3ijtOv8bhzkca7J5XKbiWo6JmN/7ormEDq7cpF2fWvfJnxd2L/L8ciKH4ylk8z
MQjb0jAheAGAERAKoilEwWJkgcCJ/Q==
=Bx3M
-----END PGP SIGNATURE-----

--cuAZOLW+M2wSeAZZ--
