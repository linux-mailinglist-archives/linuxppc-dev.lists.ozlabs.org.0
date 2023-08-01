Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AF876B1DE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 12:33:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JxxdURr/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFWf446bpz3cBZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 20:33:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JxxdURr/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFWdD3qhkz2yVL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 20:32:15 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C9FB6000B;
	Tue,  1 Aug 2023 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690885926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crWIDh8u3C6yGMtEBsqKiRUmuQ9xvfip/08OZw3qp2U=;
	b=JxxdURr/SHVVPuDRogfmx5lRXOm41IU5riBIedWEmVuiVqPdUjUgVOzQRcA4n+Mqpm/GKZ
	GxbliO3UUvoreyeNdm3JK8O2QQpHimTInkkjgmimmlJ5XUlMcKE2QY7/fL046n/EPFesxk
	Kpe+Prgr/5Xj8CWh34jTJwxFnzFBu44/qi/zNcAmbKxZu2nWFo2xPnbTvu5AwwTRU6O5kB
	0TIZ5eSZQJiWTjXJfJyuPmvtn+0vzD9VjRdGVGbjfioxvgXogblhab9rMnoKZ0f2NI5/el
	ZJX7GFdpLoLgqvN1aIyOK7N0mehJJpv5Wh4/sjbs5BeuriC3SCdryRdKPIgyXA==
Date: Tue, 1 Aug 2023 12:32:01 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 20/28] net: wan: Add framer framework support
Message-ID: <20230801123201.25dee219@bootlin.com>
In-Reply-To: <84d6431f-bb55-4224-a4a5-45d7036f1e38@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-21-herve.codina@bootlin.com>
	<84d6431f-bb55-4224-a4a5-45d7036f1e38@lunn.ch>
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

On Tue, 1 Aug 2023 11:56:12 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +int framer_pm_runtime_get(struct framer *framer)
> > +{
> > +	int ret;
> > +
> > +	if (!framer)
> > +		return 0;  
> 
> Can framer be a NULL pointer? This sort of test often covers up
> bugs. So either let it dereference the NULL pointer and opps, or
> return -EINVAL.
> 

Well, in the current usage, it cannot be a NULL pointer.
I will simply remove the check (every where it is present) and
dereference the pointer instead of returning -EINVAL.

Regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
