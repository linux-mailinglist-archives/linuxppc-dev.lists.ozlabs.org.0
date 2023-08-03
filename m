Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE56776E2E8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:24:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=RVTarNgc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGhjG4CGSz30g8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 18:24:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=RVTarNgc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGhhM6qp1z2yDR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 18:24:02 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2FEE240009;
	Thu,  3 Aug 2023 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691051037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SELzQVaBhYhBIwDx2p1Pj2orowZttNN9xEZBvwg3M2A=;
	b=RVTarNgcL5Lqc7frx4gWP/ChoTOIAY8Fu3KgXKvID229jSKmin5+L8FZS/XNa16aJHi1KY
	wz9mh3d+mtrD5kLKgg+Zutnd8XZuvlkIUEwQ0cq8fgICHjtlWk90qU3ll40vm9fQ6sgBYt
	jWUNMx5+8UL1/5UQkRIHvpUOLwbvW975dS7ytocUjT10MoEBEQuXo1vdX9F/n3IbVI7f5J
	fJGShMAO+3iod4LDPehoOxic7SeHcJ0ugCGHqhtjY6hpHJRwEvpXfWlNWLPRj5EpTue6Sy
	CurrNWc3DoqhLfQa+toQI/c+59kPiyF9gaOcm6Gmn3Ns706aP03UhG8j19SsWw==
Date: Thu, 3 Aug 2023 10:23:47 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 27/28] dt-bindings: net: fsl,qmc-hdlc: Add framer
 support
Message-ID: <20230803102347.74706421@bootlin.com>
In-Reply-To: <20230803004259.GA1598510-robh@kernel.org>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-28-herve.codina@bootlin.com>
	<20230803004259.GA1598510-robh@kernel.org>
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

On Wed, 2 Aug 2023 18:42:59 -0600
Rob Herring <robh@kernel.org> wrote:

> On Wed, Jul 26, 2023 at 05:02:23PM +0200, Herve Codina wrote:
> > A framer can be connected to the QMC HDLC.
> > If present, this framer is the interface between the TDM used by the QMC
> > HDLC and the E1/T1 line.
> > The QMC HDLC can use this framer to get information about the line and
> > configure the line.
> > 
> > Add an optional framer property to reference the framer itself.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> > index 8bb6f34602d9..bf29863ab419 100644
> > --- a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> > +++ b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> > @@ -27,6 +27,11 @@ properties:
> >        Should be a phandle/number pair. The phandle to QMC node and the QMC
> >        channel to use.
> >  
> > +  framer:
> > +    $ref: /schemas/types.yaml#/definitions/phandle  
> 
> Now you've defined this property twice. Please avoid doing that.

I don't see what you mean.

I previously defined the framer property at the framer-codec node as it is
a framer consumer (it was a mistake because this framer-codec node is a child of
the framer node but that's an other story).

Here, at the qmc-hdlc node, I define this property in order to use the framer as a
consumer too.

What is wrong ?

Best regards,
Hervé

> 
> > +    description:
> > +      phandle to the framer node
> > +
> >  required:
> >    - compatible
> >    - fsl,qmc-chan
> > -- 
> > 2.41.0
> >   
