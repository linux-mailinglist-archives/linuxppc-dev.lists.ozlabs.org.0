Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5067AD324
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 10:18:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PvDIUho9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvG386njCz3cfT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 18:18:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PvDIUho9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvG2G6pKgz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 18:17:23 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3464240005;
	Mon, 25 Sep 2023 08:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695629829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qsV/ySsvuL4jl/ST/3xwKb6vrdgxhf9GcZb1mGcioag=;
	b=PvDIUho9NL9hEHa76AEtge+NrT0NJ8zlv3WYK5SX/puoarl+p4pDsPlODduEobYhbJGETW
	9M6Vu9n4UXYwieLWHdxK2Far77OTkn9/ZCmhkN7eMnvsJrB2BpNJ9ax1L5TQj0/qqKQuj3
	WVKKrUELOOrdbzUkvLS4T3W1LH3xNezBu6gMOnu6pxJNT+TfvTwYIpSbqig0d1yTMzpzVW
	Tll81bV8zxi9FbcWQXikKgPf1zuLWnihDhyGlYXo7hSOdFlc1JNoBI21ya7JIzQs/DhU/m
	La2QDXCNSznO5+LNPcscmvJfULG1M3AACyvA3Z066zgdx3Re0fBxgv+2ItpCtg==
Date: Mon, 25 Sep 2023 10:17:03 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 08/30] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Add support for QMC HDLC
Message-ID: <20230925101703.1bf083f1@bootlin.com>
In-Reply-To: <5efae150-3d92-81b8-5c25-68846d27132e@linaro.org>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
	<20230922075913.422435-9-herve.codina@bootlin.com>
	<5efae150-3d92-81b8-5c25-68846d27132e@linaro.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Si
 mon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

On Sat, 23 Sep 2023 19:39:49 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 22/09/2023 09:58, Herve Codina wrote:
> > The QMC (QUICC mutichannel controller) is a controller present in some
> > PowerQUICC SoC such as MPC885.
> > The QMC HDLC uses the QMC controller to transfer HDLC data.
> > 
> > Additionally, a framer can be connected to the QMC HDLC.
> > If present, this framer is the interface between the TDM bus used by the
> > QMC HDLC and the E1/T1 line.
> > The QMC HDLC can use this framer to get information about the E1/T1 line
> > and configure the E1/T1 line.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> > index 82d9beb48e00..61dfd5ef7407 100644
> > --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> > @@ -101,6 +101,27 @@ patternProperties:
> >            Channel assigned Rx time-slots within the Rx time-slots routed by the
> >            TSA to this cell.
> >  
> > +      compatible:
> > +        const: fsl,qmc-hdlc  
> 
> Why this is not a device/SoC specific compatible?

This compatible is present in a QMC channel.
The parent node (the QMC itself) contains a compatible with device/SoC:
--- 8< ---
  compatible:
    items:
      - enum:
          - fsl,mpc885-scc-qmc
          - fsl,mpc866-scc-qmc
      - const: fsl,cpm1-scc-qmc
--- 8< ---

At the child level (ie QMC channel), I am not sure that adding device/SoC
makes sense. This compatible indicates that the QMC channel is handled by
the QMC HDLC driver.
At this level, whatever the device/SoC, we have to be QMC compliant.

With these details, do you still think I need to change the child (channel)
compatible ?

> 
> > +
> > +      fsl,framer:
> > +        $ref: /schemas/types.yaml#/definitions/phandle
> > +        description:
> > +          phandle to the framer node. The framer is in charge of an E1/T1 line
> > +          interface connected to the TDM bus. It can be used to get the E1/T1 line
> > +          status such as link up/down.
> > +
> > +    allOf:
> > +      - if:
> > +          properties:
> > +            compatible:
> > +              not:
> > +                contains:
> > +                  const: fsl,qmc-hdlc
> > +        then:
> > +          properties:
> > +            fsl,framer: false
> > +
> >      required:
> >        - reg
> >        - fsl,tx-ts-mask
> > @@ -159,5 +180,8 @@ examples:
> >              fsl,operational-mode = "hdlc";
> >              fsl,tx-ts-mask = <0x00000000 0x0000ff00>;
> >              fsl,rx-ts-mask = <0x00000000 0x0000ff00>;
> > +
> > +            compatible = "fsl,qmc-hdlc";  
> 
> compatible is always the first property.

Will be moved to the first property in the next iteration.

Best regards,
Hervé

> 
> > +            fsl,framer = <&framer>;
> >          };
> >      };  
> 
> Best regards,
> Krzysztof
> 
