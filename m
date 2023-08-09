Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E6B776340
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 17:02:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=iXnta/0e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLYFg3lsTz3bh5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 01:02:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=iXnta/0e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLYDh3p8nz3072
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 01:01:53 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08F12E0008;
	Wed,  9 Aug 2023 15:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691593306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g0zvfLvyRJt7hOgvNIifYjQHxyaOMWD1ltEX2pdHMbc=;
	b=iXnta/0eS8D5cHJ76Q4dwhU+XK3qsGA5Twh8/3mjUO44s+pEvR/n0UP3phDRDaRzknJJqg
	U0Po6QG77G0tYGseNfrgZzZ+oWZIReHQUy/j7wwlAqPpgNMdWXCyXkv/pWCbZTB17U0vBq
	09x+R9HSs6PA9O+bm3Z01VLxBArlIT/tenAyyV94zuJu4ABgfwHf1jlpBmT9JL/aTrx54e
	xulDWbuzkyyvyvjDTlEeKHtRrqbNHF9NWfFODttuROxRsjNMQwXq4dUnuY5B9C5WUAcO8L
	rl4cb1owoaMRbW2+7s4uQte7dbC1HrDGo95q3ov+1CrqQAidzdIy5MawOqVkLw==
Date: Wed, 9 Aug 2023 17:01:39 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 21/28] net: wan: Add framer framework support
Message-ID: <20230809170139.2402e4a2@bootlin.com>
In-Reply-To: <cc9417a3-ef86-bb46-9519-cf65b03b5f08@infradead.org>
References: <20230809132757.2470544-1-herve.codina@bootlin.com>
	<20230809132757.2470544-22-herve.codina@bootlin.com>
	<cc9417a3-ef86-bb46-9519-cf65b03b5f08@infradead.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Randy,

On Wed, 9 Aug 2023 07:24:32 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Hi,
> 
> On 8/9/23 06:27, Herve Codina wrote:
> > diff --git a/drivers/net/wan/framer/Kconfig b/drivers/net/wan/framer/Kconfig
> > new file mode 100644
> > index 000000000000..96ef1e7ba8eb
> > --- /dev/null
> > +++ b/drivers/net/wan/framer/Kconfig
> > @@ -0,0 +1,19 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# FRAMER
> > +#
> > +
> > +menu "Framer Subsystem"
> > +
> > +config GENERIC_FRAMER
> > +	bool "Framer Core"  
> 
> Just curious: any reason that this cannot be tristate (i.e., a loadable module)?
> Thanks.

For the same reasons as generic phy cannot be built as module
  b51fbf9fb0c3 phy-core: Don't allow building phy-core as a module

In the framer case, this allows to have the QMC HDLC driver built on systems
without any framers (no providers and no framer core framework).
Also the framer phandle is optional in the device tree QMC HDLC node.

Regards,
Hervé

> 
> > +	help
> > +	  Generic Framer support.
> > +
> > +	  This framework is designed to provide a generic interface for framer
> > +	  devices present in the kernel. This layer will have the generic
> > +	  API by which framer drivers can create framer using the framer
> > +	  framework and framer users can obtain reference to the framer.
> > +	  All the users of this framework should select this config.
> > +
> > +endmenu  
> 



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
