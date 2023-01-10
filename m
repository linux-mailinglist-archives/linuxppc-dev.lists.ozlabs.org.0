Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDE6663A93
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 09:09:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nrk4H6kpxz3fF2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 19:09:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Ys6OT1+2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::231; helo=relay11.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Ys6OT1+2;
	dkim-atps=neutral
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nrk292Hdqz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 19:07:44 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E6D8C100002;
	Tue, 10 Jan 2023 08:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673338056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgsA3blZRkDhqGMnNA0R6u5EyqOGZtYvAT+Wv5NomZg=;
	b=Ys6OT1+2bp2JYHo9mPYmhymzvJZTYOD3fMVHRIhU3ImPlylTaTP7MZa3uFgOrz/CvgzjQ/
	1770lhQoUVCHCn6xm1iLySNLgGab8ZMbMBPrT0Tf7XEAWvlCyjIs7qirDks6ATZh0a9YW+
	SnMEN1s7lQrmNRTdKOhgPXLHBVDJRmy/u5Ckqs0h+snkD02n7c/E/4kW86C7QvebMmpVRJ
	flMpdVvpFa9DDU074ocMpMNQ8oL1KzCJCLr9FgSCoSe0oflZ0zwZ7U+NvwaPZnxhccaYnd
	my4L007gwd/5XXRVFJlvE483mkgyDZofuuUDwZGPggBYVPuPUXQ7PzpEhXpK8w==
Date: Tue, 10 Jan 2023 09:07:28 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 08/10] dt-bindings: sound: Add support for QMC audio
Message-ID: <20230110090728.2024b5eb@bootlin.com>
In-Reply-To: <c393e532-d466-366b-a390-65de47c58b6a@linaro.org>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-9-herve.codina@bootlin.com>
 <c393e532-d466-366b-a390-65de47c58b6a@linaro.org>
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

On Sun, 8 Jan 2023 16:16:24 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 06/01/2023 17:37, Herve Codina wrote:
> > The QMC (QUICC mutichannel controller) is a controller
> > present in some PowerQUICC SoC such as MPC885.
> > The QMC audio is an ASoC component that uses the QMC
> > controller to transfer the audio data.
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/sound/fsl,qmc-audio.yaml         | 110 ++++++++++++++++++
> >  1 file changed, 110 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,qmc-aud=
io.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml=
 b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> > new file mode 100644
> > index 000000000000..b3774be36c19
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> > @@ -0,0 +1,110 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,qmc-audio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: QMC audio
> > +
> > +maintainers:
> > +  - Herve Codina <herve.codina@bootlin.com>
> > +
> > +description: |
> > +  The QMC audio is an ASoC component which uses QMC (QUICC Multichannel
> > +  Controller) channels to transfer the audio data.
> > +  It provides as many DAI as the number of QMC channel used.
> > +
> > +properties:
> > +  compatible:
> > +    items: =20
>=20
> Drop items.

Will be dropped.

>=20
> > +      - const: fsl,qmc-audio
> > +
> > +  '#address-cells':
> > +    const: 1
> > +  '#size-cells':
> > +    const: 0
> > +  '#sound-dai-cells':
> > +    const: 1
> > +
> > +patternProperties:
> > +  "^dai@([0-9]|[1-5][0-9]|6[0-3])$":
> > +    description:
> > +      A DAI managed by this controller
> > +    type: object
> > +
> > +    properties:
> > +      reg:
> > +        minimum: 0
> > +        maximum: 63
> > +        description:
> > +          The DAI number
> > +
> > +      qmc-chan: =20
>=20
> Missing vendor prefix.

Will be changed to 'fsl,qmc-chan'

>=20
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array =20
>=20
> Why this is not a phandle?

I have try '$ref: /schemas/types.yaml#/definitions/phandle'

I have an error from make dt_binding_check:=20
  dai@16:fsl,qmc-chan:0: [4294967295, 16] is too long

I need a phandle with an argument ie <&qmc 16>.
Is there an alternative to phandle-array to handle this case ?

>=20
> > +        description: phandle to the QMC channel> +        maxItems: 1
> > +
> > +    required:
> > +      - reg
> > +      - qmc-chan
> > +
> > +required:
> > +  - compatible
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - '#sound-dai-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    qmc_audio: qmc_audio { =20
>=20
> Same problem as in previous patch.

Changed to 'audio-controller'.

>=20
> > +        compatible =3D "fsl,qmc-audio";
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        #sound-dai-cells =3D <1>;
> > +        dai@16 {
> > +            reg =3D <16>;
> > +            qmc-chan =3D <&scc_qmc 16>;
> > +        };
> > +        dai@17 {
> > +            reg =3D <17>;
> > +            qmc-chan =3D <&scc_qmc 17>;
> > +        };
> > +    }; =20
>=20
> Best regards,
> Krzysztof
>=20

Thanks for the review.

Best regards,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
