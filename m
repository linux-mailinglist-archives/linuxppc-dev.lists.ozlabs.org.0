Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3177BF5E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 10:30:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=d2/GYvHB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Tcr4ygkz3c56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 19:30:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=d2/GYvHB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4Tby4F7cz2xdT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 19:30:05 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 182D9E0008;
	Tue, 10 Oct 2023 08:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696926600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NaOw8PSc0VULjmhxAa6nnKNT5QXhrjoUDdxFuVyTpCM=;
	b=d2/GYvHBSkcMRXi9pmcOlLcCOzYlqnrIh22gZ99/gFbL/M7ys56o4fhkMnDPId8GrsjWCC
	5ouyZmnYSGtztbw5b3KORr9N47KIDYuaBQUiGc3Xf/ZDdUH8+/jT/SFGq05ljDkT54hN13
	hx19s0wFiBqyB6uDlurPSlGYgMd3j25Og2nZrBv+EZ8JoEtmpYOsJTJFZCGD6qgRxTFCDK
	FZ/Gn35OaUtNi/MGYMXczmwjExd6qASdYRlrPa0Xtf0BY5UrQHKeqALrbgvp/3zYz4JUyV
	QEMOADOF32CCiQH10GW8t3f+hFHXxsyHOaUNrGK7QRLSZ6PLjrkZyGoU9RNvDQ==
Date: Tue, 10 Oct 2023 10:29:45 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v7 26/30] net: wan: framer: Add support for the Lantiq
 PEF2256 framer
Message-ID: <20231010102945.39c27b1d@bootlin.com>
In-Reply-To: <20231006150252.6d45be95@kernel.org>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
	<20230928070652.330429-27-herve.codina@bootlin.com>
	<20231006150252.6d45be95@kernel.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jakub,

On Fri, 6 Oct 2023 15:02:52 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 28 Sep 2023 09:06:44 +0200 Herve Codina wrote:
> > +	for (i = 0; i < count; i++) {
> > +		(audio_devs + i)->name = "framer-codec";
> > +		(audio_devs + i)->of_compatible = compatible;
> > +		(audio_devs + i)->id = i;  
> 
> Why not array notation?

Will be change in the next iteration.

> 
> > +	}
> > +
> > +	ret = mfd_add_devices(pef2256->dev, 0, audio_devs, count, NULL, 0, NULL);  
> 
> Should Lee be CCed for the MFD part?

Will be added to the CC list.

Best regards,
Hervé
