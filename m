Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED72F9090AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 18:43:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q0OdEN4a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W14pc5zGNz3cbD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 02:43:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q0OdEN4a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W14nw60DMz3cLj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 02:42:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4ABB61F13;
	Fri, 14 Jun 2024 16:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE23C2BD10;
	Fri, 14 Jun 2024 16:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718383361;
	bh=Tlh8m401RdiRzFymaSJiodIhjjgTmA5lrOXYAZ9uQPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q0OdEN4aixWpF1EjydlUMQuTgCaVB7opzXf5XtfbWhOWL/5rJkC9DbQy/IKk36npJ
	 VO2xUxaj17Zam0K3yAqd2B4ugztVtF03BnddXJE598GhRC07J8bVsJhbr02YNtIiVP
	 KMuSF9Y1tZqg6uJAAP0R+GkuOZ9BbSCGEMDkA/c7JAilgfuGQEOW96H2GsERoesEA6
	 BNKrYWBlVWNCPUxYjfxJ0Or1bptyOrzsub6cW3goW7BR36i5B0+yNuRlskCPKlaIuh
	 a9qOBXrltofA9kw6ZGdNZIz3c0wsf6nPUk57dFi0WcWFeYZ7O8X3wEAu6Knm8OM4Ja
	 K/hpG7ZnE/b2Q==
Date: Fri, 14 Jun 2024 17:42:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
Message-ID: <Zmxy-xA3YDU06Eht@finisterre.sirena.org.uk>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
 <CAG+cZ06B+AexqvwZtNP5FX50AmghAFLa=1ebxmKLvMoyVJ529w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0Dizksk5Fs8IGsJP"
Content-Disposition: inline
In-Reply-To: <CAG+cZ06B+AexqvwZtNP5FX50AmghAFLa=1ebxmKLvMoyVJ529w@mail.gmail.com>
X-Cookie: Your love life will be... interesting.
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
Cc: alsa-devel@alsa-project.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Chancel Liu <chancel.liu@nxp.com>, linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--0Dizksk5Fs8IGsJP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 06:24:50PM +0200, Piotr Wojtaszczyk wrote:
> On Tue, Jun 11, 2024 at 12:36=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:

> > On a quick scan I can't see any architecture dependency for build,
> > please add an || COMPILE_TEST for improved coverage.  As for all the
> > other things enabled in this Kconfig file there is no need to explicitly
> > depend on SND_SOC.

> Ok. Later I will add a sound card driver to phytec3250 board which uses
> arch/arm/configs/lpc32xx_defconfig config file so that the COMPILE_TEST
> won't be needed.

Why would a defconfig affect the Kconfig?

--0Dizksk5Fs8IGsJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZscvoACgkQJNaLcl1U
h9An6Qf/b4JZLW1fJTJNxCgdIhftN7IpeiRX+esOHEeKQtZw3ozptV88AJharZjX
XXZEj/+g1xJK4XcZaoGge+ChSerkFOGA8R47dj26SyDq2YdCKR63s4FxELs8g0Io
uxg/3sS8sltF8LnpH4rEZS8V1yNNAA5WMh8Cxvwf4EX5fJmHPCdpLNtkVOAmvKgU
arRBgU8EHs2YBeDhQZu+HLGFQXKbd4YmIl4ExA+S6xjJoF6nQQA5fuwZKh7H3MgY
/OcHiJ1/7M0NLdLk7tf5uFSwbKUcqnAlVx1OZwg04NmfDdWxxf6u0qO7kg4uO9Td
DHj4z63CGck+G+/Pl0cnpjduUMnsWA==
=kXhB
-----END PGP SIGNATURE-----

--0Dizksk5Fs8IGsJP--
