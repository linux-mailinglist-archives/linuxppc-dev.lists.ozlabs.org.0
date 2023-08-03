Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BCE76E295
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:12:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=MBkGmMrk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGhRH52s4z3cPj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 18:12:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=MBkGmMrk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::229; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGhQQ1LDFz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 18:11:54 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 190CDFF808;
	Thu,  3 Aug 2023 08:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691050304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tpuTuRUPiNyH3n2jjGpwrnx1fmI9b2Ko2zyAHNgRosY=;
	b=MBkGmMrkIRzCcm9qcngyjAaowvqDCU3fgHUsOk25u2vBbYmlDH+Hj2GrGAWIbTha00anRa
	gu1s9i+xkIfhLxiohPHve2V1bBnrCFEQVmD8V97HwNhUmn/HcO80PjdKXdcYONjVjmTWKQ
	HROgiT4nP7clJyC5O1RTrccH6n2NMzG/cPXmJfIRUBQ0Kcvi+WtxdE7whdaphg45Zysur7
	GMAQ9yMloM7i6sflXwFqDhG7q4HD4c7tVbFfisp0P1ro0KFhjPLwyn/lYPonWAUaVX/TgD
	clvRno6hkGHP98PBQnSEZarnxmGQcy+Pq49wDtkmQLabUhVRZo9qe9muvxZdlQ==
Date: Thu, 3 Aug 2023 10:11:34 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 21/28] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20230803101134.6920805c@bootlin.com>
In-Reply-To: <20230803004054.GA1593620-robh@kernel.org>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-22-herve.codina@bootlin.com>
	<20230803004054.GA1593620-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob,

On Wed, 2 Aug 2023 18:40:54 -0600
Rob Herring <robh@kernel.org> wrote:

> On Wed, Jul 26, 2023 at 05:02:17PM +0200, Herve Codina wrote:
> > The Lantiq PEF2256 is a framer and line interface component designed to
> > fulfill all required interfacing between an analog E1/T1/J1 line and the
> > digital PCM system highway/H.100 bus.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/net/lantiq,pef2256.yaml          | 226 ++++++++++++++++++
> >  1 file changed, 226 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/lantiq,pef2256.yaml b/Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> > new file mode 100644
> > index 000000000000..b369a20d61b1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> > @@ -0,0 +1,226 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/lantiq,pef2256.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Lantiq PEF2256
> > +
> > +maintainers:
> > +  - Herve Codina <herve.codina@bootlin.com>
> > +
> > +description:
> > +  The Lantiq PEF2256, also known as Infineon PEF2256 or FALC56, is a framer and
> > +  line interface component designed to fulfill all required interfacing between
> > +  an analog E1/T1/J1 line and the digital PCM system highway/H.100 bus.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: lantiq,pef2256
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Master clock
> > +      - description: Receive System Clock
> > +      - description: Transmit System Clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: mclk
> > +      - const: sclkr
> > +      - const: sclkx
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    description:
> > +      GPIO used to reset the device.
> > +    maxItems: 1
> > +
> > +  '#framer-cells':  
> 
> Looks generic, but no such property is defined. You don't need something 
> like this unless there are multiple providers and you need each 
> provider to define the number of cells.

With the framer infrastructure introduced in this series, multiple providers
can be present. Some framer chips are dual or quad framers.

With this pef2256 framer provider, consumers use "framer = <&pef2256>;"
but with some others framer provider, we can have "framer = <&foo 1>;"

That's the reason why I set '#framer-cells' in this first framer provider,
even if the value is 0.

> 
> > +    const: 0
> > +
> > +  pinctrl:
> > +    $ref: /schemas/pinctrl/pinctrl.yaml#
> > +    additionalProperties: false
> > +
> > +    patternProperties:
> > +      '-pins$':
> > +        type: object
> > +        $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +        additionalProperties: false
> > +
> > +        properties:
> > +          pins:
> > +            enum: [ RPA, RPB, RPC, RPD, XPA, XPB, XPC, XPD ]
> > +
> > +          function:
> > +            enum: [ SYPR, RFM, RFMB, RSIGM, RSIG, DLR, FREEZE, RFSP, LOS,
> > +                    SYPX, XFMS, XSIG, TCLK, XMFB, XSIGM, DLX, XCLK, XLT,
> > +                    GPI, GPOH, GPOL ]
> > +
> > +        required:
> > +          - pins
> > +          - function
> > +
> > +  lantiq,data-rate-bps:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [2048000, 4096000, 8192000, 16384000]
> > +    default: 2048000
> > +    description:
> > +      Data rate (bit per seconds) on the system highway.
> > +
> > +  lantiq,clock-falling-edge:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Data is sent on falling edge of the clock (and received on the rising
> > +      edge). If 'clock-falling-edge' is not present, data is sent on the
> > +      rising edge (and received on the falling edge).
> > +
> > +  lantiq,channel-phase:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1, 2, 3, 4, 5, 6, 7]
> > +    default: 0
> > +    description:
> > +      The pef2256 delivers a full frame (32 8bit time-slots in E1 and 24 8bit
> > +      time-slots 8 8bit signaling in E1/J1) every 125us. This lead to a data
> > +      rate of 2048000 bit/s. When lantiq,data-rate-bps is more than 2048000
> > +      bit/s, the data (all 32 8bit) present in the frame are interleave with
> > +      unused time-slots. The lantiq,channel-phase property allows to set the
> > +      correct alignment of the interleave mechanism.
> > +      For instance, suppose lantiq,data-rate-bps = 8192000 (ie 4*2048000), and
> > +      lantiq,channel-phase = 2, the interleave schema with unused time-slots
> > +      (nu) and used time-slots (XX) for TSi is
> > +        nu nu XX nu nu nu XX nu nu nu XX nu
> > +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> > +      With lantiq,data-rate-bps = 8192000, and lantiq,channel-phase = 1, the
> > +      interleave schema is
> > +        nu XX nu nu nu XX nu nu nu XX nu nu
> > +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> > +      With lantiq,data-rate-bps = 4096000 (ie 2*2048000), and
> > +      lantiq,channel-phase = 1, the interleave schema is
> > +        nu    XX    nu    XX    nu    XX
> > +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> > +
> > +patternProperties:
> > +  '^codec(-([0-9]|[1-2][0-9]|3[0-1]))?$':
> > +    type: object
> > +    $ref: /schemas/sound/dai-common.yaml
> > +    unevaluatedProperties: false
> > +    description:
> > +      Codec provided by the pef2256. This codec allows to use some of the PCM
> > +      system highway time-slots as audio channels to transport audio data over
> > +      the E1/T1/J1 lines.
> > +      The time-slots used by the codec must be set and so, the properties
> > +      'dai-tdm-slot-num', 'dai-tdm-slot-width', 'dai-tdm-slot-tx-mask' and
> > +      'dai-tdm-slot-rx-mask' must be present in the sound card node for
> > +      sub-nodes that involve the codec. The codec uses 8bit time-slots.
> > +      'dai-tdm-tdm-slot-with' must be set to 8.
> > +      The tx and rx masks define the pef2256 time-slots assigned to the codec.
> > +
> > +    properties:
> > +      compatible:
> > +        const: lantiq,pef2256-codec
> > +
> > +      '#sound-dai-cells':
> > +        const: 0
> > +
> > +      framer:
> > +        $ref: /schemas/types.yaml#/definitions/phandle
> > +        description:
> > +          phandle to the framer node  
> 
> That's just the parent. Why do you need this?

It is a mistake.
You're right, as it simply refers the parent it is not needed.
This 'framer' phandle will be removed in the next iteration.

Regards,
Hervé
