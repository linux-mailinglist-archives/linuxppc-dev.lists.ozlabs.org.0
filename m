Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D1279EB45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 16:40:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h0mv2ujn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm3604S3yz3fbd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 00:40:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h0mv2ujn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm35848r5z3cCv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 00:39:56 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2A1E8B81F26;
	Wed, 13 Sep 2023 14:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64A7C433C8;
	Wed, 13 Sep 2023 14:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694615989;
	bh=RJoIfCcg3Gqvlc6Pv3L0lR4WCeRLMrROYaRGXX3uIAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0mv2ujnNPBV1QjbllewX4FCxcYj7UIsM7RYsumCnJYKKZxxARRvsgTPkchtVUrOG
	 Rml9dusWCC3tOaFcBAlQZ+HyhFi21PQ2icCnZXU3YytqIFh6XOGdkU+3kNu8TwDyhB
	 WJRDtBek5vWld2P/ShKcBo1SVBdzlme7UdBJijsO2e7k/u1AEtQ98HIez9iAnnMUp4
	 WtYw87YW09XXT8g6GAGAFdOQxLYlJqVfeq92qL/KbAHqYFGZFctKtSpKUUK5BmqQUq
	 W6tyh/Uvo62Cr0+7zVDD/qfL/7JXV4Zt19ttI2wt2FXW7Ioi+S8Uq74Ra8HfNT3oE4
	 dbw/bY7nHM5AQ==
Date: Wed, 13 Sep 2023 15:39:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 25/31] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20230913-faceless-sloppy-9c408191630a@spud>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101444.225809-1-herve.codina@bootlin.com>
 <20230912-overplay-donated-080eb97803d6@spud>
 <20230912185405.GA1165807-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f/ltRk1gE1+sCzTa"
Content-Disposition: inline
In-Reply-To: <20230912185405.GA1165807-robh@kernel.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Herve Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.c
 om>, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--f/ltRk1gE1+sCzTa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 01:54:05PM -0500, Rob Herring wrote:
> > > +  lantiq,data-rate-bps:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [2048000, 4096000, 8192000, 16384000]
> >=20
> > -kBps is a standard suffix, would it be worth using that instead here?
> > What you have would fit as even multiples.
> > Otherwise Rob, should dt-schema grow -bps as a standard suffix?
>=20
> Yeah, I think that makes sense. I've added it now.

Cool, thanks!

--f/ltRk1gE1+sCzTa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQHJrQAKCRB4tDGHoIJi
0iNbAQCQvNI/6rj3MUcE4cZYQRwXdY48ReUFl3upkSIAwL59UwEA5YVuiJyYj+pl
y+M6tf6hogZBT32WxEtJnwijye97rQw=
=lb0d
-----END PGP SIGNATURE-----

--f/ltRk1gE1+sCzTa--
