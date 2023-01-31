Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 045666825B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 08:45:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5cYD5lxVz30Qt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 18:45:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=md/JaJoT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::229; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=md/JaJoT;
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5cXL45DTz2ypJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 18:45:03 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 19426FF80C;
	Tue, 31 Jan 2023 07:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675151095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GM8bEcb4JjSe87Dn28iagWIQIwIJb3nlOfJ2nJLXzJ8=;
	b=md/JaJoTdonD2P75rbw2xDr+mEoMnGmj4MRoGB0FbJflaiWedu5/nwG+hedU5YW90pHjaP
	/BXxUFzGb25SiHLtBT71GmaOYJjB+Au5HzurHtYvkX7U2FPaNCuxdYj1erA+Z/+s8hX+uI
	QE/sn/11atTRhGI531BOLTg/E1Ut5r6VX2f4O5jsU0lxuELfiLVWfTc+QWqTTVtiWS16NN
	5iZH/xts8eXLe+nz2xnKGiQveiGYUy8jLBjtoZQZoinrQIWysOc8ik/tG7uSI2BJaYeMzI
	JAlL+O0aHyfd99EKYGyrgJBzdDzBR55RFamTmovYRMHGbu7ExAaROUkrxpY70A==
Date: Tue, 31 Jan 2023 08:44:49 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA
 controller
Message-ID: <20230131084449.445a4d2f@bootlin.com>
In-Reply-To: <20230130182744.GA2974455-robh@kernel.org>
References: <20230126083222.374243-1-herve.codina@bootlin.com>
	<20230126083222.374243-2-herve.codina@bootlin.com>
	<20230130182744.GA2974455-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 30 Jan 2023 12:27:44 -0600
Hi Rob,

Rob Herring <robh@kernel.org> wrote:

> On Thu, Jan 26, 2023 at 09:32:13AM +0100, Herve Codina wrote:
> > Add support for the time slot assigner (TSA)
> > available in some PowerQUICC SoC such as MPC885
> > or MPC866.
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/soc/fsl/cpm_qe/fsl,tsa.yaml      | 261 ++++++++++++++++++=
 =20
>=20
> fsl,cpm1-tsa.yaml

Right, will be change in next iteration.

>=20
> >  include/dt-bindings/soc/fsl,tsa.h             |  13 +
> >  2 files changed, 274 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fs=
l,tsa.yaml
> >  create mode 100644 include/dt-bindings/soc/fsl,tsa.h
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.y=
aml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
> > new file mode 100644
> > index 000000000000..d027d4c3cf10
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
> > @@ -0,0 +1,261 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,tsa.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: PowerQUICC CPM Time-slot assigner (TSA) controller
> > +
> > +maintainers:
> > +  - Herve Codina <herve.codina@bootlin.com>
> > +
> > +description:
> > +  The TSA is the time-slot assigner that can be found on some PowerQUI=
CC SoC.
> > +  Its purpose is to route some TDM time-slots to other internal serial
> > +  controllers.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - fsl,mpc885-tsa
> > +          - fsl,mpc866-tsa
> > +      - const: fsl,cpm1-tsa
> > +
> > +  reg:
> > +    items:
> > +      - description: SI (Serial Interface) register base
> > +      - description: SI RAM base
> > +
> > +  reg-names:
> > +    items:
> > +      - const: si_regs
> > +      - const: si_ram
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  '#serial-cells': =20
>=20
> Not a standard property. What's this for? #.*-cells applies to a=20
> specific pattern of properties.

A TSA consumer, such as QMC in this series, can have a phandle with an
argument that points to this TSA node. For instance, in the QMC
node, we have:
  fsl,tsa-serial =3D <&tsa FSL_CPM_TSA_SCC4>;

The #serial-cells property in TSA specify the presence of this argument.

What do you think if I add the following description:
   '#serial-cells':
     const: 1
     description:
       TSA consumers that use a phandle to TSA need to pass the serial
       identifier with this phandle (defined in dt-bindings/soc/fsl,tsa.h).
       For instance "fsl,tsa-serial =3D <&tsa FSL_CPM_TSA_SCC4>;".

>=20
>=20
> > +    const: 1
> > +
> > +patternProperties:
> > +  '^tdm@[0-1]$':
> > +    description:
> > +      The TDM managed by this controller
> > +    type: object
> > +
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        minimum: 0
> > +        maximum: 1
> > +        description:
> > +          The TDM number for this TDM, 0 for TDMa and 1 for TDMb
> > +
> > +      fsl,common-rxtx-pins:
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +        description:
> > +          The hardware can use four dedicated pins for Tx clock, Tx sy=
nc, Rx
> > +          clock and Rx sync or use only two pins, Tx/Rx clock and Tx/R=
x sync.
> > +          Without the 'fsl,common-rxtx-pins' property, the four pins a=
re used.
> > +          With the 'fsl,common-rxtx-pins' property, two pins are used.
> > +
> > +      clocks:
> > +        minItems: 2
> > +        items:
> > +          - description: External clock connected to L1RSYNC pin
> > +          - description: External clock connected to L1RCLK pin
> > +          - description: External clock connected to L1TSYNC pin
> > +          - description: External clock connected to L1TCLK pin
> > +      clock-names:
> > +        minItems: 2
> > +        items:
> > +          - const: l1rsync
> > +          - const: l1rclk
> > +          - const: l1tsync
> > +          - const: l1tclk
> > +
> > +      fsl,diagnostic-mode:
> > +        $ref: /schemas/types.yaml#/definitions/string
> > +        enum: [disabled, echo, internal-loopback, control-loopback] =20
>=20
> Seems like you would want userspace control of this, not have to make=20
> firmware changes and reboot to change.

I don't plan to give userspace control of this diagnostic mode.
When I need to use this diagnostic mode, I plan to set this property
in DT and reboot the system.

>=20
> > +        default: disabled
> > +        description: |
> > +          The diagnostic mode can be used to diagnose some communicati=
on issues.
> > +          It should not be set (or set to 'disabled') when diagnostic =
is not
> > +          needed.
> > +          Diagnostic mode:
> > +            - disabled:
> > +                Diagnostic disabled (ie. normal operation)
> > +            - echo:
> > +                Automatic echo. Rx data is resent on Tx.
> > +            - internal-loopback:
> > +                The TDM transmitter is connected to the receiver. Data=
 appears
> > +                on Tx pin.
> > +            - control-loopback:
> > +                The TDM transmitter is connected to the receiver. The =
Tx pin is
> > +                disconnected.
> > +
> > +      fsl,rx-frame-sync-delay-bits:
> > +        enum: [0, 1, 2, 3]
> > +        default: 0
> > +        description: |
> > +          Receive frame sync delay in number of bits.
> > +          Indicates the delay between the Rx sync and the first bit of=
 the Rx
> > +          frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits dela=
y.
> > +
> > +      fsl,tx-frame-sync-delay-bits:
> > +        enum: [0, 1, 2, 3]
> > +        default: 0
> > +        description: |
> > +          Transmit frame sync delay in number of bits.
> > +          Indicates the delay between the Tx sync and the first bit of=
 the Tx
> > +          frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits dela=
y.
> > +
> > +      fsl,clock-falling-edge:
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +        description:
> > +          Data is sent on falling edge of the clock (and received on t=
he rising
> > +          edge). If 'clock-falling-edge' is not present, data is sent =
on the
> > +          rising edge (and received on the falling edge).
> > +
> > +      fsl,fsync-rising-edge:
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +        description:
> > +          Frame sync pulses are sampled with the rising edge of the ch=
annel
> > +          clock. If 'fsync-rising-edge' is not present, pulses are sam=
pled with
> > +          the falling edge.
> > +
> > +      fsl,double-speed-clock:
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +        description:
> > +          The channel clock is twice the data rate.
> > +
> > +      fsl,tx-ts-routes:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +        description: |
> > +          A list of tupple that indicates the Tx time-slots routes. =20
>=20
> tuple

Will be fixed in next iteration.

>=20
> > +            tx_ts_routes =3D =20
>=20
> Not the property name. Put an example in the example(s).

Oups, should be fsl,tx-ts-routes.
An example is already present in the example section.
I will remove this example from the description in the next iteration.

>=20
> > +               < 2 0 >, /* The first 2 time slots are not used */
> > +               < 3 1 >, /* The next 3 ones are route to SCC2 */
> > +               < 4 0 >, /* The next 4 ones are not used */
> > +               < 2 2 >; /* The nest 2 ones are route to SCC3 */
> > +        items:
> > +          items:
> > +            - description:
> > +                The number of time-slots
> > +              minimum: 1
> > +              maximum: 64
> > +            - description: |
> > +                The source serial interface (dt-bindings/soc/fsl,tsa.h=
 defines
> > +                these values)
> > +                 - 0: No destination
> > +                 - 1: SCC2
> > +                 - 2: SCC3
> > +                 - 3: SCC4
> > +                 - 4: SMC1
> > +                 - 5: SMC2
> > +              enum: [0, 1, 2, 3, 4, 5]
> > +        minItems: 1
> > +        maxItems: 64
> > +
> > +      fsl,rx-ts-routes: =20
>=20
> You could make these a pattern instead of duplicating the constraints:=20
>=20
> '^fsl,[rt]x-ts-routes$'

Yes, I will use the pattern to handle tx and rx.
As mentionned in fsl,tx-ts-routes, I will remove the example from the
description as examples are already present in the example section.

>=20
> > +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +        description: |
> > +          A list of tupple that indicates the Rx time-slots routes.
> > +            tx_ts_routes =3D
> > +               < 2 0 >, /* The first 2 time slots are not used */
> > +               < 3 1 >, /* The next 3 ones are route from SCC2 */
> > +               < 4 0 >, /* The next 4 ones are not used */
> > +               < 2 2 >; /* The nest 2 ones are route from SCC3 */
> > +        items:
> > +          items:
> > +            - description:
> > +                The number of time-slots
> > +              minimum: 1
> > +              maximum: 64
> > +            - description: |
> > +                The destination serial interface (dt-bindings/soc/fsl,=
tsa.h
> > +                defines these values)
> > +                 - 0: No destination
> > +                 - 1: SCC2
> > +                 - 2: SCC3
> > +                 - 3: SCC4
> > +                 - 4: SMC1
> > +                 - 5: SMC2
> > +              enum: [0, 1, 2, 3, 4, 5]
> > +        minItems: 1
> > +        maxItems: 64
> > +
> > +    allOf:
> > +      # If fsl,common-rxtx-pins is present, only 2 clocks are needed.
> > +      # Else, the 4 clocks must be present.
> > +      - if:
> > +          required:
> > +            - fsl,common-rxtx-pins
> > +        then:
> > +          properties:
> > +            clocks:
> > +              maxItems: 2
> > +            clock-names:
> > +              maxItems: 2
> > +        else:
> > +          properties:
> > +            clocks:
> > +              minItems: 4
> > +            clock-names:
> > +              minItems: 4
> > +
> > +    required:
> > +      - reg
> > +      - clocks
> > +      - clock-names
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - '#serial-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/soc/fsl,tsa.h>
> > +
> > +    tsa@ae0 {
> > +        compatible =3D "fsl,mpc885-tsa", "fsl,cpm1-tsa";
> > +        reg =3D <0xae0 0x10>,
> > +              <0xc00 0x200>;
> > +        reg-names =3D "si_regs", "si_ram";
> > +
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        #serial-cells =3D <1>;
> > +
> > +        tdm@0 {
> > +            /* TDMa */
> > +            reg =3D <0>;
> > +
> > +            clocks =3D <&clk_l1rsynca>, <&clk_l1rclka>;
> > +            clock-names =3D "l1rsync", "l1rclk";
> > +
> > +            fsl,common-rxtx-pins;
> > +            fsl,fsync-rising-edge;
> > +
> > +            fsl,tx-ts-routes =3D < 2 0 >,             /* TS 0..1 */
> > +                           < 24 FSL_CPM_TSA_SCC4 >, /* TS 2..25 */
> > +                           < 1 0 >,                 /* TS 26 */
> > +                           < 5 FSL_CPM_TSA_SCC3 >;  /* TS 27..31 */
> > +
> > +            fsl,rx-ts-routes =3D < 2 0 >,             /* TS 0..1 */
> > +                           < 24 FSL_CPM_TSA_SCC4 >, /* 2..25 */
> > +                           < 1 0 >,                 /* TS 26 */
> > +                           < 5 FSL_CPM_TSA_SCC3 >;  /* TS 27..31 */
> > +        };
> > +    };
> > diff --git a/include/dt-bindings/soc/fsl,tsa.h b/include/dt-bindings/so=
c/fsl,tsa.h
> > new file mode 100644
> > index 000000000000..2cc44e867dbe
> > --- /dev/null
> > +++ b/include/dt-bindings/soc/fsl,tsa.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +
> > +#ifndef __DT_BINDINGS_SOC_FSL_TSA_H
> > +#define __DT_BINDINGS_SOC_FSL_TSA_H
> > +
> > +#define FSL_CPM_TSA_NU		0	/* Pseuso Cell Id for not used item */
> > +#define FSL_CPM_TSA_SCC2	1
> > +#define FSL_CPM_TSA_SCC3	2
> > +#define FSL_CPM_TSA_SCC4	3
> > +#define FSL_CPM_TSA_SMC1	4
> > +#define FSL_CPM_TSA_SMC2	5
> > +
> > +#endif
> > --=20
> > 2.39.0
> >  =20

Thanks for the review,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
