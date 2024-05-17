Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1718C856E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 13:18:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hQy4PIpg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgkwJ2FDtz3bwX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 21:18:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hQy4PIpg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgkvY53SMz30PD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 21:17:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 065AF619C0;
	Fri, 17 May 2024 11:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29952C2BD10;
	Fri, 17 May 2024 11:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715944647;
	bh=tz2kY6qZxYu8TUGihVyLmMBdD0mSnRDdr1XJJV0fdqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQy4PIpgYaKxXAHLGvLX+gUDvsDu0a15TR2Y2mPX//3bbTmVe/LF42kVNmBCWnrIF
	 fXggLSUVDlRgG8/nB5tFhPY4GpcIiGYQBQRpMMPvtbclDKqH3Qnab61xQFVGHq2E2B
	 ao1JK8A6/I+vrUgOJv3Dqfry4TbETyrS/EwqZs6+lMa8i3a3TvJF66NVcnL3FOE/d7
	 EKMK8Lf7bk4KqjpHqxIZJonIMDYbfuZMldEu32/tyybWRpV/5PTq4PLsakYSgjOjj/
	 szCeeggBtdpenLeZv1HQ0li+bHqGpiJhMedlDwAJ0RCCwi8ibZnRe2zj8+qUn3xZUy
	 hTr7GqHUkMODg==
Date: Fri, 17 May 2024 12:17:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCHv4 7/9] ASoC: fsl-asoc-card: add DT clock "cpu_sysclk"
 with generic codec
Message-ID: <da74d276-b028-448b-bb28-295de49dbcda@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-8-elinor.montmasson@savoirfairelinux.com>
 <ffb3624f-2170-4642-aaa5-fb6736a75d59@sirena.org.uk>
 <822567441.349330.1715936735603.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZuqvFG62+4JL9ncV"
Content-Disposition: inline
In-Reply-To: <822567441.349330.1715936735603.JavaMail.zimbra@savoirfairelinux.com>
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


--ZuqvFG62+4JL9ncV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 17, 2024 at 05:05:35AM -0400, Elinor Montmasson wrote:
> From: "Mark Brown" <broonie@kernel.org>
> > On Wed, May 15, 2024 at 03:54:09PM +0200, Elinor Montmasson wrote:

> >> +		struct clk *cpu_sysclk = clk_get(&pdev->dev, "cpu_sysclk");
> >> +		if (!IS_ERR(cpu_sysclk)) {
> >> +			priv->cpu_priv.sysclk_freq[TX] = clk_get_rate(cpu_sysclk);
> >> +			priv->cpu_priv.sysclk_freq[RX] = priv->cpu_priv.sysclk_freq[TX];
> >> +			clk_put(cpu_sysclk);
> >> +		}

> > I don't really understand the goal here - this is just reading whatever
> > frequency happens to be set in the hardware when the driver starts up
> > which if nothing else seems rather fragile?

> The driver allow to set the sysclk frequency
> of the CPU DAI through `priv->cpu_priv.sysclk_freq` when calling
> `fsl_asoc_card_hw_params()`.
> Currently it is hard-coded per use-case in the driver.

> My reasoning was that with a generic codec/compatible, there might
> be use-cases needing to use this parameter, so I exposed it here via DT.

> Is it a bad idea to expose this parameter ? This is not a requirement for the
> driver to work, most of the current compatibles do not use this parameter.
> It is currently used only for `fsl,imx-audio-cs42888`.
> In that case I can remove this commit.

I'm having a hard time connecting your reply here with my comment.  This
isn't as far as I can see allowing the frequency to be explicitly
configured, it's just using whatever value happens to be programmed in
the clock when the driver starts.

--ZuqvFG62+4JL9ncV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZHPMAACgkQJNaLcl1U
h9A/Mwf/e8Oa99TU5bBwUqPPv4RdS3EWv4/897XflQzPXjxfkxnMFOUUf0EBVm61
5WnYoirwxy+DfhNF5ubdVm7WNINPuCs1X7mMZcN6aBE4Vo9yw1deDjFV8/s+QSCd
6JpsmssN8sIOQh+w5Axkp+Qk9JuVRbVI8nFDMhD/tPRUMkUG9mjCLjP3xQoV59+d
p9ElIEC+zSBWu9HCQW4i19eO+O53iT/9s7jkpXhFBbai02OOzw5q5LcwyL/qh0Zg
fhOWA9PFrwg7iS7Rknp3Np5Msb09gh86McZtp2htgkkbggFl7ak0nRG+qlfyN0P/
AKOYQ4agvMxC3FKsb/HmPv9Q+Brc5w==
=Zf2Q
-----END PGP SIGNATURE-----

--ZuqvFG62+4JL9ncV--
