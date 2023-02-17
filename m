Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF4769AD2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 14:51:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJCsD2rSfz3fBV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 00:51:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=RoBsXKNP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=RoBsXKNP;
	dkim-atps=neutral
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJCrF5GHCz3cfl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 00:50:34 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 47F6B60003;
	Fri, 17 Feb 2023 13:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676641825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXtty5j4EPkHzMourS16qE5SNRSNmBZzzykreudpYyw=;
	b=RoBsXKNPDSFIw+waIM9X3bayblvPaLqhufkZQmycFa7Xnrs3aTpCAWzjhfnGtitb8+V2N1
	7lvs3fA9mB2xffWdKYEEfQNqEKifHKxSneXjI8wUgFitrhpYd/n+2eAtt+u9wdBpmfiF99
	3+IsOBT6U1N4DOFMFnmQspVrm+xBGluGmi55YzwE/u8kJufXbbl+0bmekuU9Xl8KhAW5EU
	AVXU7Vb/pZ14cC+S+t5i+AZPWyZoqSPusgF7ggwvHd6IDqZnmrk8/AarNmkNGQDl6tIZJP
	kmwG5k2P/GWE4TNLz5ynqio6byKJqgjXOVaFfHowgpEcNTsKLnSWj+XNN8tEKQ==
Date: Fri, 17 Feb 2023 14:50:19 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA
 controller
Message-ID: <20230217145019.0def6f9a@bootlin.com>
In-Reply-To: <6ae9af19-1d52-c31f-79be-a36f06caaf80@linaro.org>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
	<20230216134226.1692107-2-herve.codina@bootlin.com>
	<6ae9af19-1d52-c31f-79be-a36f06caaf80@linaro.org>
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

On Fri, 17 Feb 2023 10:14:48 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 16/02/2023 14:42, Herve Codina wrote:
> > Add support for the time slot assigner (TSA)
> > available in some PowerQUICC SoC such as MPC885
> > or MPC866.
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml | 234 ++++++++++++++++++
> >  include/dt-bindings/soc/fsl,tsa.h             |  13 +
> >  2 files changed, 247 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fs=
l,cpm1-tsa.yaml
> >  create mode 100644 include/dt-bindings/soc/fsl,tsa.h

[...]
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
[...]
> > +
> > +      fsl,rx-frame-sync-delay-bits:
> > +        enum: [0, 1, 2, 3] =20
>=20
> maxItems: 1

The property is an enum
Why this maxItems value ?

If I add the maxItems value, I've got some dt_binding_check errors:
  /xxxx/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml:
  patternProperties:^tdm@[0-1]$:properties:fsl,rx-frame-sync-delay-bits:
  'enum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMax=
imum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

>=20
> > +        default: 0
> > +        description: |
> > +          Receive frame sync delay in number of bits.
> > +          Indicates the delay between the Rx sync and the first bit of=
 the Rx
> > +          frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits dela=
y.
> > +
> > +      fsl,tx-frame-sync-delay-bits:
> > +        enum: [0, 1, 2, 3] =20
>=20
> maxItems: 1

Same question here.


Thanks for the review,

Herv=C3=A9
--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
