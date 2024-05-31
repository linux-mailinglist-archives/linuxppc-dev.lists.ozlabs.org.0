Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D305F8D6273
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 15:10:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gzfFWJED;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrNlk0mCNz3cZq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 23:10:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gzfFWJED;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrNkz09Pnz3cQM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 23:10:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 850A4CE1C6B;
	Fri, 31 May 2024 13:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB9EC116B1;
	Fri, 31 May 2024 13:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717161000;
	bh=nn3ZIl3mTwy4jDOPZZMcgjHeEDzdP9fz+mt30ZhzMQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gzfFWJEDxUXGkknghVKqiGcy2480IcnsHTVRkYB0ohkhRD7cASEX3Tcv9GYdWYCiI
	 9bEsAgKevrJeIr/v8T789I9g5/XXPhV7lXMg1A39QZ60Hf4oEaOGy6aUEonrQKH9mc
	 qlGcvYt7kdlnY9JbOZrEz27B6GSoMnD30N21H6dnowFNC3mZRsrNEMWuE92OZ5qlMP
	 K9CdtW9TLbjlxtT1Kt3SGR5u/8i4ykECKJotxlymyi6qbZ+ne0rskSMTCY1KZmqlO6
	 hUSV1CGsNIAb3E5gswMGoZk6dPDVKg6vCfYR9B+5BN34K3JjsfuC3Fud4PBwhqC/KX
	 UJ/BUTYHkdJbg==
Date: Fri, 31 May 2024 14:09:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCHv4 8/9] ASoC: fsl-asoc-card: add DT property
 "cpu-system-clock-direction-out"
Message-ID: <cbf66aed-2bc7-43f7-adbd-d39774c255ab@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-9-elinor.montmasson@savoirfairelinux.com>
 <20d8eb96-6346-4341-95ee-74729001c01a@sirena.org.uk>
 <1607626951.349332.1715936738428.JavaMail.zimbra@savoirfairelinux.com>
 <aa212906-6579-4884-82b5-6d0eb8b0b7a0@sirena.org.uk>
 <477405270.701257.1717159642136.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NswN//hqd8Z1peYF"
Content-Disposition: inline
In-Reply-To: <477405270.701257.1717159642136.JavaMail.zimbra@savoirfairelinux.com>
X-Cookie: Serving suggestion.
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


--NswN//hqd8Z1peYF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 31, 2024 at 08:47:22AM -0400, Elinor Montmasson wrote:

> > When I said "this should use the clock bindings" I meant that we should
> > use the clock bindings for configuration here.

> As far I as know, it's not possible to set the direction with
> the clock bindings, but maybe there is and I missed something ?

If a given clock has an input configured then it can't function as an
output and vice versa.

--NswN//hqd8Z1peYF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZZzCEACgkQJNaLcl1U
h9CKqwf+LcvhKkLjySDBCo2AIl/+WWEqokt2mSyrKfa1HNgIC2P5ZIxpVrviALhb
AFpK4I2D1Kh+ltGruh1zwOo32CaHr2GpvJ46CLzz1NmH8Jd5pers680nusk7V2XK
j99GiZHitgxOITrP3z0+3f0DerpwZEzR3xXUjxuIDTyDQRdZKIYbvKzRKMkVOKB2
dN8PV6CpvHZdWD219ACPaLasi774vOA4/7CHonsfuaUWUel4Bqhd7nG2ofKhjFWF
f7WtxfSfqe2o8S2JcySsIR1XVRMplDYbz0PByFJYbE6U8XY0QpLZlEEDRLXhd7V+
bMtoDrc/OUMO9pGT7silCtwMMzIkYQ==
=C2Hr
-----END PGP SIGNATURE-----

--NswN//hqd8Z1peYF--
