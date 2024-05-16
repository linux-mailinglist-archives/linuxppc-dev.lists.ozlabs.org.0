Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7E98C75B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 14:12:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MFGv9a8x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vg8980fYxz3dSd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 22:12:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MFGv9a8x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vg88P0C4Tz3cXQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 22:11:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1FCE4CE18AB;
	Thu, 16 May 2024 12:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE16C113CC;
	Thu, 16 May 2024 12:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715861477;
	bh=vzWty9Z112mKSwQmpKl9H1kFTMkTlX2pGHRLOpUzc/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MFGv9a8xqo8bIibuLTC9Sb22GP+YNQKltzSiK5BkAxKn0wNtLMgfSglvsKWq8NCFn
	 2p66bCe8JEZjQtBko0q30KPK5AEzNRLzP8+9Ybw2o/zP2GFmWoqGXdtMT+7ullrGHM
	 KsFRznanFdd7euh+hybdzmSQGcdITWEBsycbxu8GmiVmHbk/jrJXQUsgtR4MGWKPYi
	 aeKu03Xzz8FiBxjPfCL5MqFn9JRzfSdeGQ3b3a2r9C+qwOjRBWfTQRJFP/nHf9LdVA
	 Ujd3ycfgTKc6iR/hkJDzhkWpL6UkTirq8EiK1I5/EnNlQcy9QyxtdmikyTkTapXMno
	 cU/ARVbKxuyEQ==
Date: Thu, 16 May 2024 13:11:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
Message-ID: <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XZeYRrKEjeLfbFL9"
Content-Disposition: inline
In-Reply-To: <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
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


--XZeYRrKEjeLfbFL9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 15, 2024 at 03:54:11PM +0200, Elinor Montmasson wrote:

> Add documentation about new dts bindings following new support
> for compatible "fsl,imx-audio-generic".

>    audio-codec:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description: The phandle of an audio codec
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      The phandle of an audio codec.
> +      If using the "fsl,imx-audio-generic" compatible, give instead a pair of
> +      phandles with the spdif_transmitter first (driver SPDIF DIT) and the
> +      spdif_receiver second (driver SPDIF DIR).
> +    items:
> +      maxItems: 1

This description (and the code) don't feel like they're actually generic
- they're clearly specific to the bidrectional S/PDIF case.  I'd expect
something called -generic to cope with single CODECs as well as double,
and not to have any constraints on what those are.

--XZeYRrKEjeLfbFL9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZF994ACgkQJNaLcl1U
h9B7owf/abYbh4drI6QTSdLIrmNMdhFX4cLfs8jwRLolmoqXOy0BxV3+SchLf/aR
T+1Cls7jAUyeAqoS8Z4NyDeCa/5Y17c7+QVmcgr53BmGgWjkKhxiyOjrl6q6gEXy
VMZBcrNghdW1k5rzO3OCOiO38eFODTZ6RzBL0sh3iThDf+qQLKwgKWeZgL7tsuNz
zJWwE0UVPkuiX9iR2pNWfWb0Q4VuEY9LieR9Onw5+rusb0xLF1PxGD6FaZIHLBBT
CeeFfhBmLKorYQzK0o8oROWKEIx2o+HFCt/VO4aVmT+xFS5qK2wAOm4u/GtwnQLD
6C87130dv/yD0+qYIIG6L3mTkpJ29A==
=nO6y
-----END PGP SIGNATURE-----

--XZeYRrKEjeLfbFL9--
