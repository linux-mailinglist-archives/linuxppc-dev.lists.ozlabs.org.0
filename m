Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5467764ECF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 11:10:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Zwk9FRWm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBQ3V43rvz3cNF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 19:10:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Zwk9FRWm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.200; helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBQ2c63Phz30F5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 19:09:58 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5973D20002;
	Thu, 27 Jul 2023 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690448995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rK0kgw5LzcKtfaISYOOP5YAwk737ZNSt9k6WE/IR5iU=;
	b=Zwk9FRWmX7HtxhycqPP+GSgdJ/lE0Jsf02fG5eRjCnrnNZdzdBeO3YgnQihx1VtKrAmoHu
	R+0fUpDKNNSvxBL0sOdsfTkUTdxLJcK2e+JZfYc0cSUDB5fpsHtZqGaxUsNmy6IFaMmuiz
	dzpVaJAU0Qm7BptVX7fr77ZTMdjJ+WBVFl1VyLwsAx0VzlYMw72vhsGb6BbtbtId7re+rG
	wdUrJrAqrkpatIxufuuSXEgZH0QIUrPoKcVDJ/w/T9BgSHStT8mQmL1ENohCMeFat8FBGp
	lN6gQStuXkUsJpILuQdCU3oeVTw6XMMCMt/6OO6NPj+uuYPoHKtcIf2ONnIQIg==
Date: Thu, 27 Jul 2023 11:09:48 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 05/28] dt-bindings: net: Add support for QMC HDLC
Message-ID: <20230727110948.7926a532@bootlin.com>
In-Reply-To: <20230727-talcum-backside-5bdbe2171fb6@spud>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-6-herve.codina@bootlin.com>
	<20230727-talcum-backside-5bdbe2171fb6@spud>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <dave
 m@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Conor,

On Thu, 27 Jul 2023 09:19:59 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Wed, Jul 26, 2023 at 05:02:01PM +0200, Herve Codina wrote:
> > The QMC (QUICC mutichannel controller) is a controller present in some
> > PowerQUICC SoC such as MPC885.
> > The QMC HDLC uses the QMC controller to transfer HDLC data.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../devicetree/bindings/net/fsl,qmc-hdlc.yaml | 41 +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> > new file mode 100644
> > index 000000000000..8bb6f34602d9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> > @@ -0,0 +1,41 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/fsl,qmc-hdlc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: QMC HDLC  
> 
> "QMC HDLC" seems excessively terse.

The name was based on the fsl,qmc-audio.yaml already present upstream.
  https://elixir.bootlin.com/linux/v6.4/source/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml

If needed, I can change to:
  title: QMC (QUICC Multichannel Controller) HDLC
Let me known if it is better to you.

> 
> > +
> > +maintainers:
> > +  - Herve Codina <herve.codina@bootlin.com>
> > +
> > +description: |
> > +  The QMC HDLC uses a QMC (QUICC Multichannel Controller) channel to transfer
> > +  HDLC data.
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,qmc-hdlc
> > +
> > +  fsl,qmc-chan:  
> 
> Perhaps I am just showing my lack of knowledge in this area, but what is
> fsl specific about wanting a reference to the channel of a "QMC"?
> Is this something that hardware from other manufacturers would not also
> want to do?

The QMC and the QMC channel are something specific to the SoC. This IP is only
available on some Freescale/NXP SoCs.

When I upstreamed the 'fsl,qmc-audio.yaml', I first used a generic name for this
property and Kristoff asked to change to a vendor prefixed name.
  https://lore.kernel.org/linux-kernel/1dfade07-f8c4-2e16-00dc-c7d183708259@linaro.org/

Based on this, as the property 'fsl,qmc-chan' has the exact same meaning in
fsl,qmc-audio.yaml and fsl,qmc-hdlc.yaml, I use the same name.

Best regards,
Hervé

> 
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle to QMC node
> > +          - description: Channel number
> > +    description:
> > +      Should be a phandle/number pair. The phandle to QMC node and the QMC
> > +      channel to use.
> > +
> > +required:
> > +  - compatible
> > +  - fsl,qmc-chan
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    hdlc {
> > +        compatible = "fsl,qmc-hdlc";
> > +        fsl,qmc-chan = <&qmc 16>;
> > +    };
> > -- 
> > 2.41.0
> >   
