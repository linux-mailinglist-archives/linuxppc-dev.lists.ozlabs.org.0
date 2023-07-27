Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2736764AF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 10:13:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g3X0c1vs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBNmr4S68z3cLQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 18:13:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g3X0c1vs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBNlx3wKbz3cL0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 18:12:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A690461DA0;
	Thu, 27 Jul 2023 08:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516EEC433C8;
	Thu, 27 Jul 2023 08:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690445529;
	bh=tnGIkZ0IfVSxC+Yq+6QYwbRcNs+y3LaIpY7itDA1DY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g3X0c1vs3a2ExMXkrF+1tcbDsnN2aqJCcQvv2E42gHFtthXoxHT+jaSco+ZogIg0G
	 w7tGNnMsZDib2IGYF984hf9xZSY5adT9vxpurLoOMGGSONNQFd8WdhzgsuAmXgk49K
	 dMaePLC2CGqQT2i6n9Et/bGw1iCT+XmtAMUlBT4nI1PHdiAY5WWzAFBFfDovs3hpXv
	 VjrgM0AtFh5s4anoNx0c7HbquZbJdD7PnTZfXSJhncYy2kd13o4lyvqr8/JOKnY3vL
	 zIUldsQfgz0SOIYaMa8Oar3jUOZj5tjJxq7oN5ca+/JEtWuvauejQ5M5bDpTAv+tlm
	 KMdwa+ZVqnw1A==
Date: Thu, 27 Jul 2023 09:12:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 27/28] dt-bindings: net: fsl,qmc-hdlc: Add framer
 support
Message-ID: <20230727-jailer-recede-a62ab2238581@spud>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-28-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eYAsfQrSrlZJPeWa"
Content-Disposition: inline
In-Reply-To: <20230726150225.483464-28-herve.codina@bootlin.com>
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


--eYAsfQrSrlZJPeWa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 05:02:23PM +0200, Herve Codina wrote:
> A framer can be connected to the QMC HDLC.
> If present, this framer is the interface between the TDM used by the QMC
> HDLC and the E1/T1 line.
> The QMC HDLC can use this framer to get information about the line and
> configure the line.
>=20
> Add an optional framer property to reference the framer itself.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Why not fully describe the hardware in one patch in this series, rather
than split this over two different ones?

> ---
>  Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml b/Do=
cumentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> index 8bb6f34602d9..bf29863ab419 100644
> --- a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> +++ b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> @@ -27,6 +27,11 @@ properties:
>        Should be a phandle/number pair. The phandle to QMC node and the Q=
MC
>        channel to use.
> =20
> +  framer:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the framer node
> +
>  required:
>    - compatible
>    - fsl,qmc-chan
> --=20
> 2.41.0
>=20

--eYAsfQrSrlZJPeWa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMIm0AAKCRB4tDGHoIJi
0kUJAPwNtjLVJN1zsHlbb6aaExnJrN4N1c/y81aSzDXGP/5mtwD/ZlFY9Kf3kK6f
ZSCmoVzzU0F7LpDiZu5VLWEDSKophAY=
=Scw7
-----END PGP SIGNATURE-----

--eYAsfQrSrlZJPeWa--
