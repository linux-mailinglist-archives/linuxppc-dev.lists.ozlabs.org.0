Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4359279D879
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 20:14:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ejV5wsM5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlWvD0r4yz3cNY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 04:14:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ejV5wsM5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlWtM6m6dz3bxL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 04:13:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B7DD9CE1E42;
	Tue, 12 Sep 2023 18:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D79C433C8;
	Tue, 12 Sep 2023 18:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694542421;
	bh=+KjlluOR/6k98E8AKxJtqM7fsI/LWIByAOdfKotn514=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejV5wsM5w24eJR2tiv4CBwjdUJ6XQy3EY7mq5mWz+JwjGv6TkeqyHfPEZOkcI8MYM
	 wY/8KUzHWo5YqMYKQIvSYqigdTz08B2RNuCWMApTEhrYzESUOCKuiJIr6ZoKWGCwfc
	 5uVrtRpT7cRTB2ysvY6npM+t0ZJefn09piy+z9QS8u/mZnyuWEMciwPn8GRa+V08vZ
	 2Xphq7hHTTULtkCZYQ2/aTz8O9+TMQLh3FDXAVM6br5ERQijTnelFA27WDd9+/PilO
	 YEoewnZKG2jZiUQP4P5G700qVpvnVBsbn02GgPb/0k/Kb8NkEvatIjrLU2uqmHqMig
	 O+KMC2GS4TTig==
Date: Tue, 12 Sep 2023 19:13:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 25/31] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20230912-overplay-donated-080eb97803d6@spud>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101444.225809-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z36SKPc4SxdGzwAJ"
Content-Disposition: inline
In-Reply-To: <20230912101444.225809-1-herve.codina@bootlin.com>
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


--z36SKPc4SxdGzwAJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

I'm not au fait enough with this to leave particularly meaningful
comments, so just some minor ones for you.

On Tue, Sep 12, 2023 at 12:14:44PM +0200, Herve Codina wrote:
> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Missing a co-developed-by?

> ---
>  .../bindings/net/lantiq,pef2256.yaml          | 214 ++++++++++++++++++
>  1 file changed, 214 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2256.=
yaml
>=20
> diff --git a/Documentation/devicetree/bindings/net/lantiq,pef2256.yaml b/=
Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> new file mode 100644
> index 000000000000..c4f21678bf6a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> @@ -0,0 +1,214 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/lantiq,pef2256.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lantiq PEF2256
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description:
> +  The Lantiq PEF2256, also known as Infineon PEF2256 or FALC56, is a fra=
mer and
> +  line interface component designed to fulfill all required interfacing =
between
> +  an analog E1/T1/J1 line and the digital PCM system highway/H.100 bus.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: lantiq,pef2256
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Master clock

My OCD is rather upset by the inconsistent capitalisation used here :/

> +      - description: System Clock Receive
> +      - description: System Clock Transmit
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +      - const: sclkr
> +      - const: sclkx
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      GPIO used to reset the device.
> +    maxItems: 1
> +
> +  pinctrl:
> +    $ref: /schemas/pinctrl/pinctrl.yaml#
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        $ref: /schemas/pinctrl/pinmux-node.yaml#
> +        additionalProperties: false
> +
> +        properties:
> +          pins:
> +            enum: [ RPA, RPB, RPC, RPD, XPA, XPB, XPC, XPD ]
> +
> +          function:
> +            enum: [ SYPR, RFM, RFMB, RSIGM, RSIG, DLR, FREEZE, RFSP, LOS,
> +                    SYPX, XFMS, XSIG, TCLK, XMFB, XSIGM, DLX, XCLK, XLT,
> +                    GPI, GPOH, GPOL ]
> +
> +        required:
> +          - pins
> +          - function
> +
> +  lantiq,data-rate-bps:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [2048000, 4096000, 8192000, 16384000]

-kBps is a standard suffix, would it be worth using that instead here?
What you have would fit as even multiples.
Otherwise Rob, should dt-schema grow -bps as a standard suffix?

> +    default: 2048000
> +    description:
> +      Data rate (bit per seconds) on the system highway.
> +
> +  lantiq,clock-falling-edge:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Data is sent on falling edge of the clock (and received on the ris=
ing
> +      edge). If 'clock-falling-edge' is not present, data is sent on the
> +      rising edge (and received on the falling edge).
> +
> +  lantiq,channel-phase:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +    default: 0
> +    description: |
> +      The pef2256 delivers a full frame (32 8bit time-slots in E1 and 24=
 8bit

Just a wee nit, s/8bit/8-bit/ :)

Rest of this I don't really feel like I can really review.

Thanks,
Conor.

> +      time-slots 8 8bit signaling in E1/J1) every 125us. This lead to a =
data
> +      rate of 2048000 bit/s. When lantiq,data-rate-bps is more than 2048=
000
> +      bit/s, the data (all 32 8bit) present in the frame are interleave =
with
> +      unused time-slots. The lantiq,channel-phase property allows to set=
 the
> +      correct alignment of the interleave mechanism.
> +      For instance, suppose lantiq,data-rate-bps =3D 8192000 (ie 4*20480=
00), and
> +      lantiq,channel-phase =3D 2, the interleave schema with unused time=
-slots
> +      (nu) and used time-slots (XX) for TSi is
> +        nu nu XX nu nu nu XX nu nu nu XX nu
> +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> +      With lantiq,data-rate-bps =3D 8192000, and lantiq,channel-phase =
=3D 1, the
> +      interleave schema is
> +        nu XX nu nu nu XX nu nu nu XX nu nu
> +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> +      With lantiq,data-rate-bps =3D 4096000 (ie 2*2048000), and
> +      lantiq,channel-phase =3D 1, the interleave schema is
> +        nu    XX    nu    XX    nu    XX
> +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> +
> +patternProperties:
> +  '^codec(-([0-9]|[1-2][0-9]|3[0-1]))?$':
> +    type: object
> +    $ref: /schemas/sound/dai-common.yaml
> +    unevaluatedProperties: false
> +    description:
> +      Codec provided by the pef2256. This codec allows to use some of th=
e PCM
> +      system highway time-slots as audio channels to transport audio dat=
a over
> +      the E1/T1/J1 lines.
> +      The time-slots used by the codec must be set and so, the properties
> +      'dai-tdm-slot-num', 'dai-tdm-slot-width', 'dai-tdm-slot-tx-mask' a=
nd
> +      'dai-tdm-slot-rx-mask' must be present in the sound card node for
> +      sub-nodes that involve the codec. The codec uses 8bit time-slots.
> +      'dai-tdm-tdm-slot-with' must be set to 8.
> +      The tx and rx masks define the pef2256 time-slots assigned to the =
codec.
> +
> +    properties:
> +      compatible:
> +        const: lantiq,pef2256-codec
> +
> +      '#sound-dai-cells':
> +        const: 0
> +
> +    required:
> +      - compatible
> +      - '#sound-dai-cells'
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pef2256: framer@2000000 {
> +      compatible =3D "lantiq,pef2256";
> +      reg =3D <0x2000000 0x100>;
> +      interrupts =3D <8 IRQ_TYPE_LEVEL_LOW>;
> +      interrupt-parent =3D <&intc>;
> +      clocks =3D <&clk_mclk>, <&clk_sclkr>, <&clk_sclkx>;
> +      clock-names =3D "mclk", "sclkr", "sclkx";
> +      reset-gpios =3D <&gpio 11 GPIO_ACTIVE_LOW>;
> +      lantiq,data-rate-bps =3D <4096000>;
> +
> +      pinctrl {
> +        pef2256_rpa_sypr: rpa-pins {
> +          pins =3D "RPA";
> +          function =3D "SYPR";
> +        };
> +        pef2256_xpa_sypx: xpa-pins {
> +          pins =3D "XPA";
> +          function =3D "SYPX";
> +        };
> +      };
> +
> +      pef2256_codec0: codec-0 {
> +        compatible =3D "lantiq,pef2256-codec";
> +        #sound-dai-cells =3D <0>;
> +        sound-name-prefix =3D "PEF2256_0";
> +      };
> +
> +      pef2256_codec1: codec-1 {
> +        compatible =3D "lantiq,pef2256-codec";
> +        #sound-dai-cells =3D <0>;
> +        sound-name-prefix =3D "PEF2256_1";
> +      };
> +    };
> +
> +    sound {
> +      compatible =3D "simple-audio-card";
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +      simple-audio-card,dai-link@0 { /* CPU DAI1 - pef2256 codec 1 */
> +        reg =3D <0>;
> +        cpu {
> +          sound-dai =3D <&cpu_dai1>;
> +        };
> +        codec {
> +          sound-dai =3D <&pef2256_codec0>;
> +          dai-tdm-slot-num =3D <4>;
> +          dai-tdm-slot-width =3D <8>;
> +          /* TS 1, 2, 3, 4 */
> +          dai-tdm-slot-tx-mask =3D <0 1 1 1 1>;
> +          dai-tdm-slot-rx-mask =3D <0 1 1 1 1>;
> +        };
> +      };
> +      simple-audio-card,dai-link@1 { /* CPU DAI2 - pef2256 codec 2 */
> +        reg =3D <1>;
> +        cpu {
> +          sound-dai =3D <&cpu_dai2>;
> +        };
> +        codec {
> +          sound-dai =3D <&pef2256_codec1>;
> +          dai-tdm-slot-num =3D <4>;
> +          dai-tdm-slot-width =3D <8>;
> +          /* TS 5, 6, 7, 8 */
> +          dai-tdm-slot-tx-mask =3D <0 0 0 0 0 1 1 1 1>;
> +          dai-tdm-slot-rx-mask =3D <0 0 0 0 0 1 1 1 1>;
> +        };
> +      };
> +    };
> --=20
> 2.41.0
>=20

--z36SKPc4SxdGzwAJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQCqTAAKCRB4tDGHoIJi
0jgGAQCQtuw1hpYCdUTegOuODiE+lWtlKu64rm1K8B1fCI0iowD/TI6P7jvAMzvX
dTh+21rxne2p2anbBFZEn/MH6mQfKw0=
=eds4
-----END PGP SIGNATURE-----

--z36SKPc4SxdGzwAJ--
