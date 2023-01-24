Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54860679689
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 12:24:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1Pl71cx0z3cDT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 22:24:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=NFHmt5S1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=NFHmt5S1;
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1PkB6tmPz3bZl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 22:24:00 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EE1DD40003;
	Tue, 24 Jan 2023 11:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674559433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbYmdWFivLJBG8Pv5/K9k19ry1rzbKQLylHycCbuWNc=;
	b=NFHmt5S1U+BUZUExL6OMxo6ILWp1xOjzqVQBYDfj00xs/vj7VrSA8WyLsXUrWWzJO2vFgu
	Cr4mewN/SKd25Vlr4LPbG1RmnyBuql6OvuSKtX7LqGUjOADGdWXtZdqbCqf70llzXc2MgM
	gh7eqki/cly8NSZheKh/cOaif3gaUwL36fTc/c7tf4VoPbtXcjIlhqFna9u4NYhgiD0nyM
	LKuhuQx6iBHekcH7quPoCnFbpsrz+VRm0gvzpATBvB8UcNvf1iZ+MMTzHi66V2FDXR1GzD
	ztM2qnsi+eVF9dkpyWhxPae2i9kmMcC+2PjSxhskT8Ew9B5OqlBkOiUlJlpz/w==
Date: Tue, 24 Jan 2023 12:23:47 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC
 controller
Message-ID: <20230124122347.1a531d0f@bootlin.com>
In-Reply-To: <37a95380-ee68-5c3a-3b96-48cc8b525f19@linaro.org>
References: <20230113103759.327698-1-herve.codina@bootlin.com>
	<20230113103759.327698-6-herve.codina@bootlin.com>
	<316ddb81-8d13-71dd-3396-412e31cfb880@linaro.org>
	<20230124104232.183cc9ff@bootlin.com>
	<37a95380-ee68-5c3a-3b96-48cc8b525f19@linaro.org>
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

On Tue, 24 Jan 2023 11:02:52 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 24/01/2023 10:42, Herve Codina wrote:
> > Hi Krzysztof,
> >=20
> > On Tue, 17 Jan 2023 12:31:09 +0100
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >  =20
> >> On 13/01/2023 11:37, Herve Codina wrote: =20
> >>> Add support for the QMC (QUICC Multichannel Controller)
> >>> available in some PowerQUICC SoC such as MPC885 or MPC866.
> >>>
> >>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> >>> ---
> >>>  .../bindings/soc/fsl/cpm_qe/fsl,qmc.yaml      | 164 ++++++++++++++++=
++
> >>>  1 file changed, 164 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/=
fsl,qmc.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc=
.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
> >>> new file mode 100644
> >>> index 000000000000..3ec52f1635c8
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
> >>> @@ -0,0 +1,164 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qmc.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: PowerQUICC CPM QUICC Multichannel Controller (QMC)
> >>> +
> >>> +maintainers:
> >>> +  - Herve Codina <herve.codina@bootlin.com>
> >>> +
> >>> +description: |
> >>> +  The QMC (QUICC Multichannel Controller) emulates up to 64 channels=
 within
> >>> +  one serial controller using the same TDM physical interface routed=
 from
> >>> +  TSA.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +          - fsl,mpc885-scc-qmc
> >>> +          - fsl,mpc866-scc-qmc
> >>> +      - const: fsl,cpm1-scc-qmc
> >>> +
> >>> +  reg:
> >>> +    items:
> >>> +      - description: SCC (Serial communication controller) register =
base
> >>> +      - description: SCC parameter ram base
> >>> +      - description: Dual port ram base
> >>> +
> >>> +  reg-names:
> >>> +    items:
> >>> +      - const: scc_regs
> >>> +      - const: scc_pram
> >>> +      - const: dpram
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +    description: SCC interrupt line in the CPM interrupt controller
> >>> +
> >>> +  fsl,tsa:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +    description: phandle to the TSA
> >>> +
> >>> +  fsl,tsa-cell-id:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    enum: [1, 2, 3]
> >>> +    description: |
> >>> +      TSA cell ID (dt-bindings/soc/fsl,tsa.h defines these values)
> >>> +       - 1: SCC2
> >>> +       - 2: SCC3
> >>> +       - 3: SCC4   =20
> >>
> >> Is this used as argument to tsa? If so, this should be part of fsl,tsa
> >> property, just like we do for all syscon-like phandles. =20
> >=20
> > Yes, indeed.
> > I will move 'fsl,tsa' to 'fsl,tsa-cell' with 'fsl,tsa-cell' a phandle/n=
umber
> > pair (the phandle to TSA node and the TSA cell id to use) =20
>=20
> Move to fsl,tsa, not from.

Well, I plan to remove both fsl,tsa and fsl,tsa-cell-id and use this:
  fsl,tsa-cell:
    $ref: /schemas/types.yaml#/definitions/phandle-array
    items:
      - items:
          - description: phandle to TSA node
          - enum: [1, 2, 3]
            description: |
              TSA cell ID (dt-bindings/soc/fsl,tsa.h defines these values)
               - 1: SCC2
               - 2: SCC3
               - 3: SCC4
    description:
      Should be a phandle/number pair. The phandle to TSA node and the TSA
      cell ID to use.

Is that what you were thinking about ?

Best regards,
Herv=C3=A9


--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
