Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 416EA79D776
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 19:22:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Iii5UWu1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlVlj0QpMz3cND
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 03:22:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Iii5UWu1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlVkq00MBz3c1M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 03:22:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3109AB81BBB;
	Tue, 12 Sep 2023 17:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5492C433C8;
	Tue, 12 Sep 2023 17:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694539326;
	bh=rRrJDnsPwd8jMYw4Teztqav9PlNugqhsqBqwAuwaVlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iii5UWu1mdHxD2eSbuXqs6kx4AHgW0/LoRft/f7lyOXJm52Rgi8Ss5jvrOQ7BrJTL
	 HGjHS80pVjavTF4tfpykYr5T/7fkgKiE9YpmlWEPyBR3aNc+/hYiE191mnmhexl3o1
	 CRosDNzzFYjKhuhcjmbbUjN7j01k4T3tOUv4i5jUygNoHPfOGH8XZQUtk5OaNdJ9eW
	 pYLBfVy1Flo6/FS3VYYYvSj35AGFS9ADHfByzFRZStVVmWm0ObNv49tZznX+1faQlU
	 TpLaRb6QGs2E99A0+EPgis0PHVuXqBCvx2SRZ1SqYeDb/y2Uldr0StaNvnp99RkhVo
	 nBx3TcaF+l1Gw==
Date: Tue, 12 Sep 2023 18:21:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 08/31] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Add support for QMC HDLC
Message-ID: <20230912-capable-stash-c7a3e33078ac@spud>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101018.225246-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bf5FPf5K5KaccQV9"
Content-Disposition: inline
In-Reply-To: <20230912101018.225246-1-herve.codina@bootlin.com>
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


--bf5FPf5K5KaccQV9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 12:10:18PM +0200, Herve Codina wrote:
> The QMC (QUICC mutichannel controller) is a controller present in some
> PowerQUICC SoC such as MPC885.
> The QMC HDLC uses the QMC controller to transfer HDLC data.
>=20
> Additionally, a framer can be connected to the QMC HDLC.
> If present, this framer is the interface between the TDM bus used by the
> QMC HDLC and the E1/T1 line.
> The QMC HDLC can use this framer to get information about the E1/T1 line
> and configure the E1/T1 line.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml   | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-sc=
c-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-=
qmc.yaml
> index 82d9beb48e00..b5073531f3f1 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.y=
aml
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.y=
aml
> @@ -101,6 +101,16 @@ patternProperties:
>            Channel assigned Rx time-slots within the Rx time-slots routed=
 by the
>            TSA to this cell.
> =20
> +      compatible:
> +        const: fsl,qmc-hdlc
> +
> +      fsl,framer:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description:
> +          phandle to the framer node. The framer is in charge of an E1/T=
1 line
> +          interface connected to the TDM bus. It can be used to get the =
E1/T1 line
> +          status such as link up/down.

Sounds like this fsl,framer property should depend on the compatible
being present, no?

Thanks,
Conor.

> +
>      required:
>        - reg
>        - fsl,tx-ts-mask
> @@ -159,5 +169,8 @@ examples:
>              fsl,operational-mode =3D "hdlc";
>              fsl,tx-ts-mask =3D <0x00000000 0x0000ff00>;
>              fsl,rx-ts-mask =3D <0x00000000 0x0000ff00>;
> +
> +            compatible =3D "fsl,qmc-hdlc";
> +            fsl,framer =3D <&framer>;
>          };
>      };
> --=20
> 2.41.0
>=20

--bf5FPf5K5KaccQV9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQCeNgAKCRB4tDGHoIJi
0iOYAQDpq19XBQVxAut3ryCZTWFRliPi5kerZHMkKGzgUwIbKwEA+gnc9IR2Iao6
Qt/bYjPuz9mjrBe0gcXcC3CDZicWwAE=
=QoY/
-----END PGP SIGNATURE-----

--bf5FPf5K5KaccQV9--
