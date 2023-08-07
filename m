Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D73A2772521
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 15:11:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ptPcngcy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKGsg4scQz3cB1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 23:11:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ptPcngcy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKGrj526gz2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 23:10:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03F3161A5E;
	Mon,  7 Aug 2023 13:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44A0C433C8;
	Mon,  7 Aug 2023 13:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691413808;
	bh=+ylZyoYYRfcm6fV2c5Chg3oeks3UOFVe6ienNx0Fhmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ptPcngcyFrXPhfW+uAcklMgxyhnPVyuRFGiByyYxP0vv5fqTTBf1C+4ZecNjaXNCU
	 x5dexojsK7ip6GaiKDXtsaoPTYSzIcInPyoG7TA1F5LhXIZeJNLz4vhFA354hQ91bs
	 jlsfMHj4h4bMB1a/aQ3hV8/OzE/8wWOiZVToK/QLyt9vfOvmf665T9kjIbKegLgNdG
	 EZ4JdpqVL7wvyWODD+mDyu8mLQ22wCFOdQmTWgvbGeolnFdDe+TK/BROYHkQNEskI5
	 tUJXXtpYQAPIshCzIIkr5tAXQJJ/v2mXmUc9Kz2LqqQ5og6ku6/LbuVEVnS+gnoIru
	 0Ov9IDZ3B4O+w==
Date: Mon, 7 Aug 2023 14:09:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 24/28] pinctrl: Add support for the Lantic PEF2256
 pinmux
Message-ID: <8f80edf2-c93d-416f-bcab-f7be3badf64a@sirena.org.uk>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-25-herve.codina@bootlin.com>
 <CACRpkdYXCQRd3ZXNGHwMaQYiJc7tGtAJnBaSh5O-8ruDAJVdiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jTPmHke3dW8il9IP"
Content-Disposition: inline
In-Reply-To: <CACRpkdYXCQRd3ZXNGHwMaQYiJc7tGtAJnBaSh5O-8ruDAJVdiA@mail.gmail.com>
X-Cookie: idleness, n.:
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Herve Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--jTPmHke3dW8il9IP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 07, 2023 at 03:05:15PM +0200, Linus Walleij wrote:
> On Wed, Jul 26, 2023 at 5:04=E2=80=AFPM Herve Codina <herve.codina@bootli=
n.com> wrote:

> > +#include "linux/bitfield.h"

> Really? I don't think there is such a file there.

> Do you mean <linux/bitfield.h> and does this even compile?

#include "" means "try the local directory first then fall back to
system includes" so it'll work, it picks up extra stuff on top of what
<> does.  There's a stylistic issue though.

--jTPmHke3dW8il9IP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTQ7SUACgkQJNaLcl1U
h9Cgmwf/SLPNpdzBUj796oCGdE0sLv3Wx6OOJqUx6r7OcXxbdmI57ntyLtd42nrN
Bto5bvnu1D1GkKvkmyy+3qu8xEk9s7C2T9S8wddibRU4Ltzcda/eNPj7PwZuLuj1
0z8caed2ZZTmxKQJzHev6bV798Prre1UC1Wu8xTev1OLJpck8z68ITezl6gh97ma
TFmBFQx8ZozN8KVhSTI49Oc5lUUWGJC/CYjNSASRYYC5Wm/bSfAfdDHclNhQLaW9
7VQNOvJvO5CmbCu7s0dq39QvEWgoC2sm0Cx8ZWUpHxjKZVyWbnfMr0sMyPwgLtWb
vb6uLwRLtAlanfRgULyEgNLTnZ+BIw==
=+n7M
-----END PGP SIGNATURE-----

--jTPmHke3dW8il9IP--
