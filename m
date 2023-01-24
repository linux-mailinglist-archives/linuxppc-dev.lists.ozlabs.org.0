Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F316679469
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 10:43:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1MVN6pCxz3cMR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 20:43:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=OBnDzO21;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=OBnDzO21;
	dkim-atps=neutral
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1MTT6qDSz30hl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 20:42:51 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 07FEDC0002;
	Tue, 24 Jan 2023 09:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674553359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ke8PpnBYtq0uoMPZ4KXBhGHV0aGLKGiBTbsb/9DcACw=;
	b=OBnDzO21zBEolJhYXCoBIAM/TsM6/WMHNuUfk+l6SvClCaKodQeGNH4vJ1Wwuq5Wrj55RA
	JzemmolOIv0lxhYOdsx4l+ullMmYCXFvO65tMJLAOH11hF5vgXHqADpMiWz08MxIQlf+/N
	pWsu2/YR1/OsTa2H62xvcTqcDxHDcdrZilgLLuHdPYBUtgS63rLZevV6B7J7JCdE2hzUkL
	ttPcYFWO7n0IjBDqwUjoHH7ql0gqvNaIWHmMsGWfGClvQhbeN//Y4pG37AK3nnJN5fsIVN
	eyMitol0Xvxb7ovHzPCRBkcS+RT0koUZbMnVvlggWAy5TkDXedcYHN1E8ebEng==
Date: Tue, 24 Jan 2023 10:42:32 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC
 controller
Message-ID: <20230124104232.183cc9ff@bootlin.com>
In-Reply-To: <316ddb81-8d13-71dd-3396-412e31cfb880@linaro.org>
References: <20230113103759.327698-1-herve.codina@bootlin.com>
	<20230113103759.327698-6-herve.codina@bootlin.com>
	<316ddb81-8d13-71dd-3396-412e31cfb880@linaro.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, Nicholas Piggin <npiggin@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

On Tue, 17 Jan 2023 12:31:09 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 13/01/2023 11:37, Herve Codina wrote:
> > Add support for the QMC (QUICC Multichannel Controller)
> > available in some PowerQUICC SoC such as MPC885 or MPC866.
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/soc/fsl/cpm_qe/fsl,qmc.yaml      | 164 ++++++++++++++++++
> >  1 file changed, 164 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fs=
l,qmc.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.y=
aml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
> > new file mode 100644
> > index 000000000000..3ec52f1635c8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
> > @@ -0,0 +1,164 @@
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
> > +description: |
> > +  The QMC (QUICC Multichannel Controller) emulates up to 64 channels w=
ithin
> > +  one serial controller using the same TDM physical interface routed f=
rom
> > +  TSA.
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
> > +  fsl,tsa:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the TSA
> > +
> > +  fsl,tsa-cell-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 2, 3]
> > +    description: |
> > +      TSA cell ID (dt-bindings/soc/fsl,tsa.h defines these values)
> > +       - 1: SCC2
> > +       - 2: SCC3
> > +       - 3: SCC4 =20
>=20
> Is this used as argument to tsa? If so, this should be part of fsl,tsa
> property, just like we do for all syscon-like phandles.

Yes, indeed.
I will move 'fsl,tsa' to 'fsl,tsa-cell' with 'fsl,tsa-cell' a phandle/number
pair (the phandle to TSA node and the TSA cell id to use)

>=20
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  '#chan-cells':
> > +    const: 1
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
> > +      fsl,mode:
> > +        $ref: /schemas/types.yaml#/definitions/string
> > +        enum: [transparent, hdlc]
> > +        default: transparent
> > +        description: Operational mode =20
>=20
> You still need to explain what do transparent and hdlc mean.

Oups, my bad (already mentioned in the previous version review).

Also, I will rename the property to 'fsl,operational-mode' to be
more precise than just 'fsl,mode'

>=20
> > + =20
>=20
>=20
> Best regards,
> Krzysztof
>=20

Thanks for the review,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
