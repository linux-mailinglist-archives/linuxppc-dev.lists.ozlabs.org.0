Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CC476B1FE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 12:36:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HuQzMwky;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFWk60GDFz2ykT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 20:36:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HuQzMwky;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFWjB5FP6z2yVL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 20:35:41 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B8CDE0003;
	Tue,  1 Aug 2023 10:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690886135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+SvrVZjf5OnwSU9GuipBXCgEg/NuLuQSUax9kncJoss=;
	b=HuQzMwkymqd89YQoEOX2hMmEco1BS/rW1obWm9cNvo095SSLNpGDkjCz4UJ3BLDfoE9k4R
	zp6KVAzYGP/2qHBCb4o10LhoepouFfTms8w662mMV28RDhnCwvJmkHWYJ9BenFcSakmPvx
	FIb1TDkkeh6zFUNFCbsBC0CtVvmjR4CV9TWZG0vX63qv7Ohi+d/V747j0aBktlrPD1SEOh
	UNofMfWXUwklIq9B+lA9UP0VitUrBr6kYB1ARn1gptVhxnGSAoqPaz+5E2ELot8RfdcQ5/
	wnDuKt6RwwmpUwi1m19cZlmAcWrcpgYWun/8LKtFIdE4GE6cXVlVpF3MRMr2wg==
Date: Tue, 1 Aug 2023 12:35:30 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 21/28] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20230801123530.3f92f5da@bootlin.com>
In-Reply-To: <1f5fbf0a-90fe-491a-91c6-31fefd4b786f@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-22-herve.codina@bootlin.com>
	<1f5fbf0a-90fe-491a-91c6-31fefd4b786f@lunn.ch>
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
Cc: alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 1 Aug 2023 12:05:07 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

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
> 
> Nit pick, but "Receive System Clock", but "sclkr'. Maybe "System Clock
> Receive" so you have the same word order?
> 

Will also change the 'Transmit System Clock' to 'System Clock Transmit'

Regards,
Hervé



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
