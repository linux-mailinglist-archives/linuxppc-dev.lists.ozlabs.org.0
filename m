Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A480776505A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 11:54:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CkkEAksC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBR1f40Ylz3cR8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 19:54:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CkkEAksC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBR0l3M7yz3c7f
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 19:53:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D6DD61DE0;
	Thu, 27 Jul 2023 09:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3684EC433C7;
	Thu, 27 Jul 2023 09:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690451603;
	bh=EdAZ9yCp4NjWVpXzH6AhTQQee2XgoMhciT9wDsXDj3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CkkEAksCAqLlikCk9JjEcjPhux5P1puAANDl8+6/+YFdpP9MyxEJZmjYWgS9TNlVR
	 D/PuEZi9uV2jU/E9C4t4GZeWLZTMBKdLz3XRpkg24gGeTKUymJLOlyRVjPhhAUhd1J
	 R7XfjrbP+K1pz3BowFAxrPEyZSH7yb3kNfhihY0wUPK43CKgVjQtKxfdhC+BKb4kSZ
	 vauM0v1qddB3XFsxJ84JTIG98VtZ4Sezo0oPi8G0dyOHMT7P7uRtPK7SJwMFGT0iRT
	 wsSpKH6SkCMDV4cWplBERK47w7DXi27cZLxp9y98ByFJ5lFKGEO9cER2P8IuDSrw2p
	 /+AUJuabvTyIw==
Date: Thu, 27 Jul 2023 10:53:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 05/28] dt-bindings: net: Add support for QMC HDLC
Message-ID: <20230727-decidable-sterile-06ef617c144b@spud>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-6-herve.codina@bootlin.com>
 <20230727-talcum-backside-5bdbe2171fb6@spud>
 <20230727110948.7926a532@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O7XSXK7XxHjViR5H"
Content-Disposition: inline
In-Reply-To: <20230727110948.7926a532@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <dave
 m@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--O7XSXK7XxHjViR5H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 11:09:48AM +0200, Herve Codina wrote:
> On Thu, 27 Jul 2023 09:19:59 +0100
> Conor Dooley <conor@kernel.org> wrote:
> > On Wed, Jul 26, 2023 at 05:02:01PM +0200, Herve Codina wrote:

> If needed, I can change to:
>   title: QMC (QUICC Multichannel Controller) HDLC
> Let me known if it is better to you.

If it were me writing the binding, I'd probably use something like
"Freescale/NXP QUICC Multichannel Controller (QMC) HDLC", but it is not
a big deal, I just had a "wtf is this" moment :)



> > > +  fsl,qmc-chan:
> >=20
> > Perhaps I am just showing my lack of knowledge in this area, but what is
> > fsl specific about wanting a reference to the channel of a "QMC"?
> > Is this something that hardware from other manufacturers would not also
> > want to do?
>=20
> The QMC and the QMC channel are something specific to the SoC. This IP is=
 only
> available on some Freescale/NXP SoCs.
>=20
> When I upstreamed the 'fsl,qmc-audio.yaml', I first used a generic name f=
or this
> property and Kristoff asked to change to a vendor prefixed name.
>   https://lore.kernel.org/linux-kernel/1dfade07-f8c4-2e16-00dc-c7d1837082=
59@linaro.org/
>=20
> Based on this, as the property 'fsl,qmc-chan' has the exact same meaning =
in
> fsl,qmc-audio.yaml and fsl,qmc-hdlc.yaml, I use the same name.

Okay, thanks for explaining!

--O7XSXK7XxHjViR5H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMI+iwAKCRB4tDGHoIJi
0qi3APwL74Mb2llAu7YBw/3bmeFa7gR7fA/ofP+aXSE3vKilNwEAr7q9DVx5VZdT
1kkQaOjZ61gQb0aNwEfyWDLEqkpWAgw=
=qYki
-----END PGP SIGNATURE-----

--O7XSXK7XxHjViR5H--
