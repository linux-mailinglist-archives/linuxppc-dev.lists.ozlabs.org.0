Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B59D8765153
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 12:35:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=D7sErss6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBRxf4cB4z3cT5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 20:35:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=D7sErss6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBRwj3yG9z3cCr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 20:35:00 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBAA01BF207;
	Thu, 27 Jul 2023 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690454095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=49SapdFsUUzXkb0zmYsMHZkg7CHiz7VOLc7j0san1b4=;
	b=D7sErss6g6hwoemn0ONI4uqJb+K/IsweOTLB1naVOQSB0jnxItj4HIIYOc01Bt1PCbQWls
	x2lcEAR9Bd9VjcK6MIkZw2GgBXiwTdL0BWCBkLp6FGIk8zL9HeoByCjQcU71EgLZvHIX9c
	ENATbxHfRlfF0SU97Zp8/habefY7ZArdGsISAkXbKwdQKnHTa46Poh7Izti1MQgJHfgtY+
	+trXOG76m0g/9BUX139rvy1EaJBvWlTKa0L2vTIHxz+5+JsANW+49ziW/vf766xYPBj86D
	/xe6CDk60hgIFLNs0LFEukyLTaCTJBZRtsZB+11cVUQUOpWASao2sGMwjhfrJQ==
Date: Thu, 27 Jul 2023 12:34:49 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 05/28] dt-bindings: net: Add support for QMC HDLC
Message-ID: <20230727123449.0ab1c58e@bootlin.com>
In-Reply-To: <20230727-decidable-sterile-06ef617c144b@spud>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-6-herve.codina@bootlin.com>
	<20230727-talcum-backside-5bdbe2171fb6@spud>
	<20230727110948.7926a532@bootlin.com>
	<20230727-decidable-sterile-06ef617c144b@spud>
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

On Thu, 27 Jul 2023 10:53:15 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Thu, Jul 27, 2023 at 11:09:48AM +0200, Herve Codina wrote:
> > On Thu, 27 Jul 2023 09:19:59 +0100
> > Conor Dooley <conor@kernel.org> wrote:  
> > > On Wed, Jul 26, 2023 at 05:02:01PM +0200, Herve Codina wrote:  
> 
> > If needed, I can change to:
> >   title: QMC (QUICC Multichannel Controller) HDLC
> > Let me known if it is better to you.  
> 
> If it were me writing the binding, I'd probably use something like
> "Freescale/NXP QUICC Multichannel Controller (QMC) HDLC", but it is not
> a big deal, I just had a "wtf is this" moment :)

I will change to "Freescale/NXP QUICC Multichannel Controller (QMC) HDLC" in
the next iteration.

> 
> 
> 
> > > > +  fsl,qmc-chan:  
> > > 
> > > Perhaps I am just showing my lack of knowledge in this area, but what is
> > > fsl specific about wanting a reference to the channel of a "QMC"?
> > > Is this something that hardware from other manufacturers would not also
> > > want to do?  
> > 
> > The QMC and the QMC channel are something specific to the SoC. This IP is only
> > available on some Freescale/NXP SoCs.
> > 
> > When I upstreamed the 'fsl,qmc-audio.yaml', I first used a generic name for this
> > property and Kristoff asked to change to a vendor prefixed name.
> >   https://lore.kernel.org/linux-kernel/1dfade07-f8c4-2e16-00dc-c7d183708259@linaro.org/
> > 
> > Based on this, as the property 'fsl,qmc-chan' has the exact same meaning in
> > fsl,qmc-audio.yaml and fsl,qmc-hdlc.yaml, I use the same name.  
> 
> Okay, thanks for explaining!

You're welcome.

Regards,
Hervé

