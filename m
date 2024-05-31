Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBA68D677E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 18:56:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TwJWdVwE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrTlw48wrz3fv5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 02:56:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TwJWdVwE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrTlD3Fvjz3frg
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 02:55:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BD1362AEF;
	Fri, 31 May 2024 16:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B972C32786;
	Fri, 31 May 2024 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717174533;
	bh=RH77djBrTwFxe/ywwViYLxao4C1lTcLNgr3/+jlMw7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TwJWdVwEKQxLLuT2zhjCTU4ofNhZhMJQVWLYsNllbzmiMq4g+3q/az/Usq4y43LMF
	 hOqKdVWc9tUeRo8JlaOG3viw8wq3006D8Rxih/RtMd6tIkX+7jcI9m3QUyEupqHLb7
	 9/fXTCFvzSKzAnFIyyoQAJl7Sc79Wz2apuktg47kb417rVbeqJUxup0/AHvwrj5R0k
	 JdicKCg+5jWkfBM+/gO/px8hBHvP4bnvaDIlNnSzVr32iJbIuPwq+Htln1qwJS55Uf
	 rQuxZg0TrapwSzjUPs22HW6dEGALSrMySthcq4Y8XGU5ySw0hTiTJdviQTZcsl5hif
	 EoZ1rzO7n4e0w==
Date: Fri, 31 May 2024 17:55:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCHv4 7/9] ASoC: fsl-asoc-card: add DT clock "cpu_sysclk"
 with generic codec
Message-ID: <5d98d8b0-dd48-48dc-9552-b2906e31ce05@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-8-elinor.montmasson@savoirfairelinux.com>
 <ffb3624f-2170-4642-aaa5-fb6736a75d59@sirena.org.uk>
 <822567441.349330.1715936735603.JavaMail.zimbra@savoirfairelinux.com>
 <da74d276-b028-448b-bb28-295de49dbcda@sirena.org.uk>
 <1660761484.701255.1717159615755.JavaMail.zimbra@savoirfairelinux.com>
 <826f6c22-d1f1-42ce-a8d1-2d5cb894a970@sirena.org.uk>
 <1200863744.706237.1717166892907.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O3x7E8WE+Xf+WtR6"
Content-Disposition: inline
In-Reply-To: <1200863744.706237.1717166892907.JavaMail.zimbra@savoirfairelinux.com>
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


--O3x7E8WE+Xf+WtR6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 31, 2024 at 10:48:12AM -0400, Elinor Montmasson wrote:
> From: "Mark Brown" <broonie@kernel.org>

> > So you're trying to use this as the audio clock?  There's no code that
> > enables the clock which seems worrying, and I'd expect that if the
> > device is using it's own clock the device would be querying it directly
> > via the clock API rather than this.  This all seems really confused.

> It's not specifically the audio clock, I am merely using this
> in the machine driver to let the user the possibility
> to configure the CPU DAI sysclock frequency.
> The CPU DAI and codec drivers already manage their
> own clocks.

I would expect that if the clocks used by the devices are configured via
the clock API then the drivers for those devices will configure
themselves via the clock API.  I still don't understand what this change
is intended to accomplish.

--O3x7E8WE+Xf+WtR6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZaAP4ACgkQJNaLcl1U
h9C7Dwf/VLPq1S4H7OOi5cno1DA8yYITCEnfB9hv+QK0u+IGgQEVBH3ZIHElkzjs
Vqj1WunQBboYBEZjSS67nJ4jCvB6G9AWz8D+yWfWP+YDOs08fCFLNG4pTtc+ooME
lkLEVgJedtSHdOscDTWWlntBQJEXcWtEKccBh4BOPdqlb2zV/fJywO/shUPPksfA
ZW7bi8SFI5chXBl+xgKcYaBXfI306bBmQK3ImFZk5o/6j2izLhL703EZXBRFi0yX
2wjSn+Kxq9sMVe7igXvkQ53pQjVLz+tKaqS0YIEKGVs+nKMs/aihz0ie3wk3yexM
dDL8RGtQmKuDLwU9/pZho2FiLBkLfg==
=xMcC
-----END PGP SIGNATURE-----

--O3x7E8WE+Xf+WtR6--
