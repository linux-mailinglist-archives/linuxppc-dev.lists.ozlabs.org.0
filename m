Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B4E6825BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 08:46:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5cZC45bJz3cM6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 18:46:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kut/azU7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::225; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kut/azU7;
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5cXf2gfQz3cGm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 18:45:21 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 40C181C0004;
	Tue, 31 Jan 2023 07:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675151114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMe+6sH9kAIkOp6zpYrCxiYnhxYIO5nkKGD3Z8ma8r0=;
	b=kut/azU7sBFwJKKha2Hf0Qt0ZLGEVip7CNkI2Hx1xDS2aW9gbjDBCVPYMFN0t5YhIGVEyF
	hYiBnzl0ipwhmV/lrsSteBmr1Zu+OLvnxoeCywGzWHVdv+8ySOKo/qyOkpd+FvrP3eMIZz
	RvoOqoh6E4nBbOeNQ83gcZFm+nAGAfMQge79AxgkzGmMoN/WrwksO3Eez8J3qvGlDzMLzW
	xWdg9eAnBa88KKiAlbj5gtNSjFMHT3BmNaA9/qbSJaEtKj/VSQQYauN/ZZbeVGd1djLBPL
	7Z4vDPDnYaRDN4adENmDTXiZuLnMoFxbnKXGaKqp8h1ErfazEJDupN/PRANAEg==
Date: Tue, 31 Jan 2023 08:45:08 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC
 controller
Message-ID: <20230131084508.32b80a1b@bootlin.com>
In-Reply-To: <20230130183037.GA3076426-robh@kernel.org>
References: <20230126083222.374243-1-herve.codina@bootlin.com>
	<20230126083222.374243-6-herve.codina@bootlin.com>
	<20230130183037.GA3076426-robh@kernel.org>
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

Hi Rob,

On Mon, 30 Jan 2023 12:30:37 -0600
Rob Herring <robh@kernel.org> wrote:

> On Thu, Jan 26, 2023 at 09:32:17AM +0100, Herve Codina wrote:
> > Add support for the QMC (QUICC Multichannel Controller)
> > available in some PowerQUICC SoC such as MPC885 or MPC866.
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/soc/fsl/cpm_qe/fsl,qmc.yaml      | 167 ++++++++++++++++++=
 =20
>=20
> fsl,cpm1-scc-qmc.yaml

Ok, will be changed in the next iteration.

>=20
> >  1 file changed, 167 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fs=
l,qmc.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.y=
aml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
> > new file mode 100644
> > index 000000000000..9141a8ca183b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
> > @@ -0,0 +1,167 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qmc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: PowerQUICC CPM QUICC Multichannel Controller (QMC)
> > +
> > +maintainers:
> > +  - Herve Codina <herve.codina@bootlin.com>
> > +
> > +description:
> > +  The QMC (QUICC Multichannel Controller) emulates up to 64 channels w=
ithin one
> > +  serial controller using the same TDM physical interface routed from =
TSA.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - fsl,mpc885-scc-qmc
> > +          - fsl,mpc866-scc-qmc
> > +      - const: fsl,cpm1-scc-qmc
> > +
> > +  reg:
> > +    items:
> > +      - description: SCC (Serial communication controller) register ba=
se
> > +      - description: SCC parameter ram base
> > +      - description: Dual port ram base
> > +
> > +  reg-names:
> > +    items:
> > +      - const: scc_regs
> > +      - const: scc_pram
> > +      - const: dpram
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: SCC interrupt line in the CPM interrupt controller
> > +
> > +  fsl,tsa-serial:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle to TSA node
> > +          - enum: [1, 2, 3]
> > +            description: |
> > +              TSA serial interface (dt-bindings/soc/fsl,tsa.h defines =
these
> > +              values)
> > +               - 1: SCC2
> > +               - 2: SCC3
> > +               - 3: SCC4
> > +    description:
> > +      Should be a phandle/number pair. The phandle to TSA node and the=
 TSA
> > +      serial interface to use.
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  '#chan-cells':
> > +    const: 1 =20
>=20
> What's this?

A QMC consumer, such as "QMC audio" in this series, can have a phandle with
an argument that points to this QMC node. For instance, in the "QMC audio"
node, we have:
  fsl,qmc-chan =3D <&qmc 16>;

The #chan-cells property in TSA specify the presence of this argument.

What do you think if I add the following description:
   '#chan-cells':
     const: 1
     description:
       QMC consumers that use a phandle to QMC need to pass the channel
       number with this phandle.
       For instance "fsl,qmc-chan =3D <&qmc 16>;".

>=20
> > +
> > +patternProperties:
> > +  '^channel@([0-9]|[1-5][0-9]|6[0-3])$':
> > +    description:
> > +      A channel managed by this controller
> > +    type: object
> > +
> > +    properties:
> > +      reg:
> > +        minimum: 0
> > +        maximum: 63
> > +        description:
> > +          The channel number
> > +
> > +      fsl,operational-mode:
> > +        $ref: /schemas/types.yaml#/definitions/string
> > +        enum: [transparent, hdlc]
> > +        default: transparent
> > +        description: |
> > +          The channel operational mode
> > +            - hdlc: The channel handles HDLC frames
> > +            - transparent: The channel handles raw data without any pr=
ocessing
> > +
> > +      fsl,reverse-data:
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +        description:
> > +          The bit order as seen on the channels is reversed,
> > +          transmitting/receiving the MSB of each octet first.
> > +          This flag is used only in 'transparent' mode.
> > +
> > +      fsl,tx-ts-mask:
> > +        $ref: /schemas/types.yaml#/definitions/uint64
> > +        description:
> > +          Channel assigned Tx time-slots within the Tx time-slots rout=
ed by the
> > +          TSA to this cell.
> > +
> > +      fsl,rx-ts-mask:
> > +        $ref: /schemas/types.yaml#/definitions/uint64
> > +        description:
> > +          Channel assigned Rx time-slots within the Rx time-slots rout=
ed by the
> > +          TSA to this cell.
> > +
> > +    required:
> > +      - reg
> > +      - fsl,tx-ts-mask
> > +      - fsl,rx-ts-mask
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - fsl,tsa-serial
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - '#chan-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/soc/fsl,tsa.h>
> > +
> > +    qmc@a60 {
> > +        compatible =3D "fsl,mpc885-scc-qmc", "fsl,cpm1-scc-qmc";
> > +        reg =3D <0xa60 0x20>,
> > +              <0x3f00 0xc0>,
> > +              <0x2000 0x1000>;
> > +        reg-names =3D "scc_regs", "scc_pram", "dpram";
> > +        interrupts =3D <27>;
> > +        interrupt-parent =3D <&CPM_PIC>;
> > +
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        #chan-cells =3D <1>;
> > +
> > +        fsl,tsa-serial =3D <&tsa FSL_CPM_TSA_SCC4>;
> > +
> > +        channel@16 {
> > +            /* Ch16 : First 4 even TS from all routed from TSA */
> > +            reg =3D <16>;
> > +            fsl,mode =3D "transparent";
> > +            fsl,reverse-data;
> > +            fsl,tx-ts-mask =3D <0x00000000 0x000000aa>;
> > +            fsl,rx-ts-mask =3D <0x00000000 0x000000aa>;
> > +        };
> > +
> > +        channel@17 {
> > +            /* Ch17 : First 4 odd TS from all routed from TSA */
> > +            reg =3D <17>;
> > +            fsl,mode =3D "transparent";
> > +            fsl,reverse-data;
> > +            fsl,tx-ts-mask =3D <0x00000000 0x00000055>;
> > +            fsl,rx-ts-mask =3D <0x00000000 0x00000055>;
> > +        };
> > +
> > +        channel@19 {
> > +            /* Ch19 : 8 TS (TS 8..15) from all routed from TSA */
> > +            reg =3D <19>;
> > +            fsl,mode =3D "hdlc";
> > +            fsl,tx-ts-mask =3D <0x00000000 0x0000ff00>;
> > +            fsl,rx-ts-mask =3D <0x00000000 0x0000ff00>;
> > +        };
> > +    };
> > --=20
> > 2.39.0
> >  =20

Thanks for the review,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
