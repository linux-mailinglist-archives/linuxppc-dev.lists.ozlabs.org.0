Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA967F1474
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 14:31:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Adn5+nCR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYpLd4kp5z3dHC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 00:31:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Adn5+nCR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYpKk2y79z3c5H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 00:30:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 470B3B81117;
	Mon, 20 Nov 2023 13:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD7EC433C8;
	Mon, 20 Nov 2023 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700487020;
	bh=PHdu57Wzp+xZqOVNY9Pteh5+H3/OUfTVYEQwZtnjgaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Adn5+nCRh7+2esCt06PpWOJ6Q7Sf9wGWzyL8OZ3xQ4KTuGsVYCl41uUSDvoZM1Qgh
	 xYH9OzH46SDNykHqua+lZM2VDAFNJNwAhIazL4+HhuPw4y+ePFT4d4rp8a2u9mWmRp
	 PnCbz5w1ll14XS8VhdWdJuOuFS0/ORhBUxPN9LZrU5nM5XwUgSrSc4kXfWDjHIHbGB
	 JT3utmOA0eqk2DInnearZCiHRLiXuzkgmY4JBzfMGPTQF/bM9Mo53CgDyCMs/E4vK7
	 vEYpztDFwP8Cf9bC1VZuImptYoTJCr3dqt3i1A+skz+dJKGH7DjDkXQ+BECL8kWBh6
	 +vMaV+mcY9SLg==
Date: Mon, 20 Nov 2023 13:30:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v9 00/27] Add support for QMC HDLC, framer infrastructure
 and PEF2256 framer
Message-ID: <573c9ca1-a560-4f7a-ba21-80673a2e162e@sirena.org.uk>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
 <20231117164746.0589e955@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HuVabfiR1A06kEJd"
Content-Disposition: inline
In-Reply-To: <20231117164746.0589e955@kernel.org>
X-Cookie: <Manoj> I *like* the chicken
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Herve Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Simon Horman <horms@kernel.o
 rg>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--HuVabfiR1A06kEJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 04:47:46PM -0800, Jakub Kicinski wrote:
> On Wed, 15 Nov 2023 15:39:36 +0100 Herve Codina wrote:
> >    - Removed Patches 6, 7 and 8 (patches applied)
> >=20
> >    - Patches 7, 20, 21, 23 (patches 10, 23, 24, 26 in v8)
> >      Add 'Acked-by: Jakub Kicinski <kuba@kernel.org>'

> I thought someone (Mark?) asked for the networking stuff to be put=20
> on a branch. If that's still the preference - is it possible to factor
> these out as a standalone series, too?  Will they build on their own?

Yes, can we *please* at least get the generic non-driver bits of this
series moving - they seem uncontroversial as far as I can see and are a
tiny portion of the overall 20 patches.  Patches 21-23 look like they
can go on a branch in the net tree?

--HuVabfiR1A06kEJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVbX18ACgkQJNaLcl1U
h9BhUQf/Y8e+dECLekhRMQLy8O0p4YRvMtVtYbyazFL0PEJyvuI93CnL/nqRzW/7
x6zzsmJn2uab1/SmDbu8m5yE2PQDQs448v2ZAIcvu9SOQoH9ph+y/Li1dsCx0MQS
b+VU0vl6YJcBmn8ycRkgBldpLgOoc6HU2tss4FQBAlR2R0Aw6KG97Smd+Py70Yyg
ewedo+nXh+OkOHdJiG3Fbcbw6GwLEoQB+jj2MFy4QA3VilnEu+NBvRxIoegctggc
mPB4GWRQNg9fb57iy6IqsME7oUq1hUb4SJ55O7s88qko3hFJ4ediuncLVP25kbl/
HNP87K6I1Mebqh5LHTcVOvfo8zM/BQ==
=n/vU
-----END PGP SIGNATURE-----

--HuVabfiR1A06kEJd--
