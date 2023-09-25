Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F9A7AD7F4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 14:26:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WOPfcOgN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvMYH3LJVz3dM4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 22:26:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WOPfcOgN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvMXM4gw6z3cmX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 22:25:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E795160ECF;
	Mon, 25 Sep 2023 12:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3CFC433C8;
	Mon, 25 Sep 2023 12:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695644718;
	bh=EpScTZPLgSj65vBFSIAyo7Cs1HB/1MAIHpQTaZ0bcLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOPfcOgNDBAeO4O+0jKxnPe1Lx4/OaazqraHxWLEniyocDCR/cxEGGp/1h9gmYzNT
	 GGWqEr7I835ssWWvijGb9t+Nh57032xRF3NVRgUAIeDfETZfdQabHr/O9kdQ/fO7Jh
	 ONTvPBjZ+1eeh44LgK4ekXn6mRYj0UNb2mnje0p2jUP+k6a75GQDGrKvqqfcyxI4UJ
	 9rmHzSSZWcer6u1FC2XHatapgkGmrJXyez5tHe/1DTAnNJHMC3mmqN+twElSSfyQZm
	 bd9UyBTC3XNLXG8NI4IbUhwcKPDyDD1U4+I1/wKYcarCOx+7g/DQco05eKdNDKxvmb
	 GRzouKT4TE8AQ==
Date: Mon, 25 Sep 2023 14:25:12 +0200
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl_rpmsg: List DAPM endpoints
 ignoring system suspend
Message-ID: <ZRF8KI11IVf6NzpL@finisterre.sirena.org.uk>
References: <20230925110946.3156100-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q/IrCVZv+ZArlVx4"
Content-Disposition: inline
In-Reply-To: <20230925110946.3156100-1-chancel.liu@nxp.com>
X-Cookie: Save energy:  Drive a smaller shell.
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--q/IrCVZv+ZArlVx4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 25, 2023 at 07:09:45PM +0800, Chancel Liu wrote:

> +  fsl,lpa-widgets:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      A list of DAPM endpoints which mark paths between these endpoints should
> +      not be disabled when system enters in suspend state. LPA means low power
> +      audio case. On asymmetric multiprocessor, there are Cortex-A core and
> +      Cortex-M core, Linux is running on Cortex-A core, RTOS or other OS is
> +      running on Cortex-M core. The audio hardware devices can be controlled by
> +      Cortex-M. LPA can be explained as a mechanism that Cortex-A allocates a
> +      large buffer and fill audio data, then Cortex-A can enter into suspend
> +      for the purpose of power saving. Cortex-M continues to play the sound
> +      during suspend phase of Cortex-A. When the data in buffer is consumed,
> +      Cortex-M will trigger the Cortex-A to wakeup to fill data. LPA requires
> +      some audio paths still enabled when Cortex-A enters into suspend.

This is a fairly standard DSP playback case as far as I can see so it
should work with DAPM without needing this obviously use case specific
stuff peering into the Linux implementation.  Generally this is done by
tagging endpoint widgets and DAIs as ignore_suspend, DAPM will then
figure out the rest of the widgets in the path.

--q/IrCVZv+ZArlVx4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmURfCcACgkQJNaLcl1U
h9AHzAf+PwWIz4bbMz7QJRzUtT+mOEdX/5lMuK4w3mvqnYoUdqA2qy3yVAdLoegF
WoPAesxiBiwTkmnQcnEsWsIdH7T3tGO6oSpYg1DfWmKbwGi2wnPerTw98/lNyLM7
f23wUYprpUdcE2+9j6/1dMuN7T5hDZoBLXxp/pcVOmL/z40sXOKkpaRhBb1oy5Jq
qeIcheuyv3RCEdBKCoMa70apc3LRU6MTkVJpqBjM6DfDZ6YTOFwUs841MV/lz/uz
fXV0yK4ETHlJ5ThXNPLezNqSEyghVeFKt7ZaIBze4VuoS7YYhgv777AZBJ6rIija
y2y2FOnTDyyU7C14ZyZdfXWkCnp0Aw==
=Zz/j
-----END PGP SIGNATURE-----

--q/IrCVZv+ZArlVx4--
