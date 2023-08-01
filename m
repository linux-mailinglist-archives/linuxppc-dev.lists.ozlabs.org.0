Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D693C76B21A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 12:45:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZDFUSJCb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFWvt5Xjqz3bT8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 20:44:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZDFUSJCb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFWtz5Z2mz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 20:44:10 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC711C000B;
	Tue,  1 Aug 2023 10:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690886645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEKysH7Y2t6RfT3AfGBp54HWpVEF5LkKbUS/QMB1QqY=;
	b=ZDFUSJCbj6fA75RKgaU5KyPEubtFY3VzZOU8PdM1aCEbn6YSr+BqKTYpbhrc46wMcH0s0L
	xbOm3AV2jxN5pU9+f/y8A9D3ioPgJhEd+sVK5My40QUl79HhUIbpj8Z6FNyH6QoT4nLscV
	NdL3KC+I6mGLCCwmwgWymKieJnjUTwOHTLIXhRkwbL6P451XEVX4DF5rLwP5jH755aRr5A
	FyunbjnU1zJ4gkeAKrjHmbUWqnP/x6TUa+mZakYm+Nj1ODX7z5jLVFZXmNjXbfvfW8mk1Z
	CpC9vyGyEVAFqeoF0/BJLsYkRWxGBKUslX0/qHv6q48CI5T1qUFNPHFyVl0vlQ==
Date: Tue, 1 Aug 2023 12:44:01 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 23/28] net: wan: framer: Add support for the Lantiq
 PEF2256 framer
Message-ID: <20230801124401.3883d16c@bootlin.com>
In-Reply-To: <4adae593-c428-4910-882e-7247727cf501@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-24-herve.codina@bootlin.com>
	<4adae593-c428-4910-882e-7247727cf501@lunn.ch>
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

On Tue, 1 Aug 2023 12:22:39 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +static inline u8 pef2256_read8(struct pef2256 *pef2256, int offset)
> > +{
> > +	int val;
> > +
> > +	regmap_read(pef2256->regmap, offset, &val);
> > +	return val;
> > +}
> > +
> > +static inline void pef2256_write8(struct pef2256 *pef2256, int offset, u8 val)
> > +{
> > +	regmap_write(pef2256->regmap, offset, val);
> > +}  
> 
> More cases of inline functions in .C files. Please let the compiler
> decide.

Will be changed.

> 
> > +static void pef2256_isr_default_handler(struct pef2256 *pef2256, u8 nbr, u8 isr)
> > +{
> > +	dev_warn(pef2256->dev, "ISR%u: 0x%02x not handled\n", nbr, isr);
> > +}  
> 
> Should this be rate limited? It is going to be very noise if it gets
> called once per frame time.

This function should not be called.
It is wired on some interrupts and these interrupts should not be triggered.
It they fired, something was wrong.

I would prefer to keep this dev_warn() to keep the user informed about the
problem.

Regards,
Hervé


-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
