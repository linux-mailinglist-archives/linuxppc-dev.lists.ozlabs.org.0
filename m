Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3074764C13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 10:20:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EHBQpkdo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBNxy5hj1z3cLP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 18:20:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EHBQpkdo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBNx60Nycz2yGK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 18:20:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 38AFD61D59;
	Thu, 27 Jul 2023 08:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5238C433C8;
	Thu, 27 Jul 2023 08:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690446007;
	bh=ZOrVyIMfU4XpSn7UdLHa8hRU7oEBnQJsIPlHeRvuFcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHBQpkdojMRAPtSSVOI2WRnZN/AvXm08ZGy/3AMvUkfeEDcPsrHPGTekUyW5fXJxJ
	 zdCTcLMIRhvFYCbBMh4fLTN/Splo6c8g7EpZUzV+kc3CWBEA9+e87aztnL7Pnando+
	 pwIu0dDAaTMZGUJpqT7v9ut6SYL3i3U0Lok2Ul2QmbFjy/c+qomP7DFNMWOB3UHcT+
	 W/OUOtWHyqFJfluyEgawYuM9loJtKVM7uM3V+VQ0I9nzojooaE7vyShQC2nj6AT86L
	 oYjCYV5xUeE+UK2ny6qdJMEbyR0c7Mfu2nsJKb4l9IqecATQzsXax4HK0eXNkTiSJ0
	 dqlMmnFwcjcow==
Date: Thu, 27 Jul 2023 09:19:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 05/28] dt-bindings: net: Add support for QMC HDLC
Message-ID: <20230727-talcum-backside-5bdbe2171fb6@spud>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-6-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DM6e+RDa3XBbMs9a"
Content-Disposition: inline
In-Reply-To: <20230726150225.483464-6-herve.codina@bootlin.com>
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


--DM6e+RDa3XBbMs9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 05:02:01PM +0200, Herve Codina wrote:
> The QMC (QUICC mutichannel controller) is a controller present in some
> PowerQUICC SoC such as MPC885.
> The QMC HDLC uses the QMC controller to transfer HDLC data.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../devicetree/bindings/net/fsl,qmc-hdlc.yaml | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/fsl,qmc-hdlc.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml b/Do=
cumentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> new file mode 100644
> index 000000000000..8bb6f34602d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/fsl,qmc-hdlc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: QMC HDLC

"QMC HDLC" seems excessively terse.

> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  The QMC HDLC uses a QMC (QUICC Multichannel Controller) channel to tra=
nsfer
> +  HDLC data.
> +
> +properties:
> +  compatible:
> +    const: fsl,qmc-hdlc
> +
> +  fsl,qmc-chan:

Perhaps I am just showing my lack of knowledge in this area, but what is
fsl specific about wanting a reference to the channel of a "QMC"?
Is this something that hardware from other manufacturers would not also
want to do?

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to QMC node
> +          - description: Channel number
> +    description:
> +      Should be a phandle/number pair. The phandle to QMC node and the Q=
MC
> +      channel to use.
> +
> +required:
> +  - compatible
> +  - fsl,qmc-chan
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hdlc {
> +        compatible =3D "fsl,qmc-hdlc";
> +        fsl,qmc-chan =3D <&qmc 16>;
> +    };
> --=20
> 2.41.0
>=20

--DM6e+RDa3XBbMs9a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMIorwAKCRB4tDGHoIJi
0qkLAQC6sDWnGDv+x5El1pIJ5VwJJnPS/IZlV0Qs715IhJHxvwEAzt3hBjT6R02J
luBI20Rzy9YB7KndWqGrmYR7rVtFKgk=
=8ut0
-----END PGP SIGNATURE-----

--DM6e+RDa3XBbMs9a--
