Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C8179D67C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 18:38:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ps2S5DYS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlTmC1PHqz3cPF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 02:38:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ps2S5DYS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlTl02JmPz3cD7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 02:37:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D2844CE1DCE;
	Tue, 12 Sep 2023 16:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35ED1C433C7;
	Tue, 12 Sep 2023 16:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694536632;
	bh=OJuoXIE82hjK2NBMYhWXwpJGkmlI7rC+5Tx9u3yV2tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ps2S5DYSbulUYf7oy7lT6QUeIC8SEE8uDrovxyzlP1aFanperwJfPxgxOSDoMicdj
	 QPhK/QjxkpPvjv2poRuKEjUgTqjp60TdQnRQmmahJid4JusPVASg0K1uVbLr45UAB9
	 O+q5IVvxkSBtPB4uIoSzebjqIZKeWLsg1NRa9ESumUogVOWqga9FHZ4uTwbMwFliV4
	 inf0fEeH4WTZISjvzOruneKr+bXI0QcpZaEpr0gdpaoAWUmP+DefmPc84zsLhd9NP2
	 YObhh1gBw/Dws7ynhREpR3QXWW0o3PhgfgfBYRLDlXE9yJVBmWttawahid5gfYz9Cd
	 Kjln+OFCXKa7w==
Date: Tue, 12 Sep 2023 17:37:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 07/31] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Add 'additionalProperties: false' in child nodes
Message-ID: <20230912-pancreas-hacked-ddcaa726fa8e@spud>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912081527.208499-8-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H5/71ZKZWMUncSI5"
Content-Disposition: inline
In-Reply-To: <20230912081527.208499-8-herve.codina@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Si
 mon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--H5/71ZKZWMUncSI5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 10:14:58AM +0200, Herve Codina wrote:
> Additional properties in child node should not be allowed.
>=20
> Prevent them adding 'additionalProperties: false'
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml     | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-sc=
c-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-=
qmc.yaml
> index 450a0354cb1d..82d9beb48e00 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.y=
aml
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.y=
aml
> @@ -64,6 +64,7 @@ patternProperties:
>      description:
>        A channel managed by this controller
>      type: object
> +    additionalProperties: false
> =20
>      properties:
>        reg:
> --=20
> 2.41.0
>=20

--H5/71ZKZWMUncSI5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQCTrwAKCRB4tDGHoIJi
0n+XAQCw6AgUOq0NyPZHrHWu5ogYxBjVGRRZ4L314GuJF/TwRAEA3G14ilDkYP5o
3fMneddHCQlNQIVPUgNd/ldquYguZwQ=
=eFLQ
-----END PGP SIGNATURE-----

--H5/71ZKZWMUncSI5--
