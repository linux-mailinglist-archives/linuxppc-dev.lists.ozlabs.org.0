Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC68E663A7B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 09:07:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nrk2G4Ds7z3fBH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 19:07:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=O1Opaji6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=O1Opaji6;
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nrk1M03sLz3c6G
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 19:07:02 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3D5F824000B;
	Tue, 10 Jan 2023 08:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673338015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7tanCnt41dmd3a1gqbCEA0TYYO9/oTjI6yAv4OQDOAo=;
	b=O1Opaji665s44TE1LAeK3X1D4fYZJDuZSpYGeI1q8gABik0Z1kaEh03swno0937SJj0yue
	74GZCclMht4rcz4psoZvlBrAchwISnRoslZZufPnjF5IrvTUhHz2LldITerMDLfGFUgTms
	vHXaY1Ki1l23UicholMhpxt39CFMdnggwaNe0ljcsOiKVXKdvXP2KpthwiBLx9AG+xADXI
	wI6theO2IKhw2keeah0YYzKanAJEVpCPQbhCl2DFoZDmnrFIHdKhbfqupQ7yd24kqen1xf
	RUnZhIVGv4EnLnguFl4GNBxmLEakSSnAOCuv1ahzmgXZYkitFZFF9fqzE/f3GA==
Date: Tue, 10 Jan 2023 09:06:50 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC
 controller
Message-ID: <20230110090650.2138edf0@bootlin.com>
In-Reply-To: <76077f5f-fbda-800b-b8d8-6a3f6600f4d1@linaro.org>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-6-herve.codina@bootlin.com>
 <76077f5f-fbda-800b-b8d8-6a3f6600f4d1@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, Nicholas Piggin <npiggin@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

On Sun, 8 Jan 2023 16:14:47 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

[...]
> > +
> > +  interrupts:
> > +    description: SCC interrupt line in the CPM interrupt controller =20
>=20
> Missing constraints.

'maxItems: 1' will be added in v3

>=20
> > +
> > +  fsl,cpm-command:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Cf. soc/fsl/cpm_qe/cpm.txt =20
>=20
> Missing description.

'fsl,cpm-command' will be removed in v3.
The value needed is determined based on other information.
This is not needed in the DT.

>=20
> > +
> > +  tsa:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the TSA =20
>=20
> Missing vendor prefix. Does not look like a generic property.

Will be be changed to 'fsl,tsa'
and also 'tsa-cell-id' will be changed to 'fsl,tsa-cell-id'

>=20
[...]
> > +
> > +patternProperties:
> > +  "^channel@([0-9]|[1-5][0-9]|6[0-3])$":
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
> > +      fsl,mode:
> > +        $ref: /schemas/types.yaml#/definitions/string
> > +        enum: [transparent, hdlc]
> > +        default: transparent
> > +        description: Operational mode =20
>=20
> And what do they mean?

I will change with
  description: |
    The channel operational mode
     - hdlc: The channel handles HDLC frames
     - transparent: The channel handles raw data without any processing

>=20
> > +
> > +      fsl,reverse-data:
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +        description:
> > +          The bit order as seen on the channels is reversed,
> > +          transmitting/receiving the MSB of each octet first.
> > +          This flag is used only in 'transparent' mode.
> > +
> > +      tx-ts-mask: =20
>=20
> Missing vendor prefix.

Will be added, also on rx-ts-mask.

>=20
> > +        $ref: /schemas/types.yaml#/definitions/uint64
> > +        description:
> > +          Channel assigned Tx time-slots within the Tx time-slots rout=
ed
> > +          by the TSA to this cell.
> > +
> > +      rx-ts-mask:
> > +        $ref: /schemas/types.yaml#/definitions/uint64
> > +        description:
> > +          Channel assigned Rx time-slots within the Rx time-slots rout=
ed
> > +          by the TSA to this cell.
> > +
> > +    required:
> > +      - reg
> > +      - tx-ts-mask
> > +      - rx-ts-mask
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - tsa
> > +  - tsa-cell-id
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - '#chan-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/soc/fsl-tsa.h>
> > +
> > +    scc_qmc@a60 { =20
>=20
> No underscores in node names.
>=20
> Node names should be generic.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation

Will be changed to qmc@a60

>=20
> > +        compatible =3D "fsl,mpc885-scc-qmc", "fsl,cpm1-scc-qmc";
> > +        reg =3D <0xa60 0x20>,
> > +              <0x3f00 0xc0>,
> > +              <0x2000 0x1000>;
> > +        reg-names =3D "scc_regs", "scc_pram", "dpram";
> > +        interrupts =3D <27>;
> > +        interrupt-parent =3D <&CPM_PIC>;
> > +        fsl,cpm-command =3D <0xc0>;
> > +
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        #chan-cells =3D <1>;
> > +
> > +        tsa =3D <&tsa>;
> > +        tsa-cell-id =3D <FSL_CPM_TSA_SCC4>;
> > +
> > +        channel@16 {
> > +            /* Ch16 : First 4 even TS from all routed from TSA */
> > +            reg =3D <16>;
> > +            fsl,mode =3D "transparent";
> > +            fsl,reverse-data;
> > +            tx-ts-mask =3D <0x00000000 0x000000AA>;
> > +            rx-ts-mask =3D <0x00000000 0x000000AA>; =20
>=20
> Keep case consistent. lower-case hex.

Will be fixed

>=20
> Best regards,
> Krzysztof
>=20

Thanks for the review,

Best regards,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
