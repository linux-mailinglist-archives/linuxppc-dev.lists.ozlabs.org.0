Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D068D629C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 15:15:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S/p5/BYH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrNrd58gbz3cTq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 23:14:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S/p5/BYH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrNqy0SKfz2xqq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 23:14:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1F175CE1C43;
	Fri, 31 May 2024 13:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C100C4AF0B;
	Fri, 31 May 2024 13:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717161259;
	bh=gbORHtwfINA/7XdxHmGEDfKRg0KInm4NPfWu2fzeZAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S/p5/BYH+7SLVMMU5PV73oOe1faDyRKMjLR5ONU3OakdDGYY9jCufxQxC+5+R2R0l
	 u+UIe1VqdRF55y5E2DzojmYPOQLv97xTZ6akCM+kKof8vK4+q0zblr4F3moIc4M8Z1
	 hpyhVpLawfs1r9rtV3LP6cmzqBGTgciX7nTub2eopXQg8ZxMMH6T/mVWMTj1rAHWD9
	 WgpXwL/IX+7/8lUz20VvcKfGUKc8ZuiH0iYYKxxobrOGkIe6EkrbueKlazOR/Pp2Rt
	 hvN1d/fyOeFobUEZbOXT8gGTw09MrI1tdEAXc6ptHsERFuniGPiqhKvdWX89DfT7lA
	 P6jzA6VExq+4w==
Date: Fri, 31 May 2024 14:14:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
Message-ID: <291daed8-a2e1-44d4-9a71-5bca2c585720@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
 <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
 <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com>
 <500db9de-6113-4e73-ba92-6e52ea292b32@sirena.org.uk>
 <1598202415.701258.1717159684103.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KygPM2XsMX13VSvX"
Content-Disposition: inline
In-Reply-To: <1598202415.701258.1717159684103.JavaMail.zimbra@savoirfairelinux.com>
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


--KygPM2XsMX13VSvX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 31, 2024 at 08:48:04AM -0400, Elinor Montmasson wrote:

> Then maybe it's not be a good idea to make this compatible generic
> for this contribution.
> The original intention is to bring support for the S/PDIF,
> so maybe the contribution should focus on this use case?
> In that case, would changing the compatible for "fsl,imx-audio-spdif-card"
> be acceptable?
> "fsl,imx-audio-spdif" is already used for the `imx-spdif.c`
> which does not use the ASRC.

Why not just use the existing compatible - why would someone not want to
be able to use the ASRC if it's available in their system?

--KygPM2XsMX13VSvX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZZzSUACgkQJNaLcl1U
h9CI/gf/Xn2/xlVXYFjqqRcmEeA+Mmby4XlBih17KdiGdDQeHIPD9tnY3ub27oEm
Uz2RM669ae1CKI/GTYYiZ1bB97E80YvV7vH92KowbeYrNnMK/un2WfCc4nofGAMj
ETU4lvrazJEj8xLQMM5XT+9zGSrd24cyJIwATqPD3NwNFOgZ0TncrCx7f7j2Hswd
WojlP7VZdmX0Ru2XpvjmnVCmDbaxZ543qbRFSp4+rIrWKGTUHowxahzaDbhziSla
BmX1BjJK0AW0+WnOS/ZaCApM8hQHxq6s/aFreHlth67DHmUtfsQtdIBUnEJJbRn7
UvwuEy+mXzr6YIXOjhrobfvp1XF/HQ==
=dJiZ
-----END PGP SIGNATURE-----

--KygPM2XsMX13VSvX--
