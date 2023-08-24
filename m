Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D087875D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 18:45:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=KTVnzD5e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWpqh4Ls8z3c7c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 02:45:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=KTVnzD5e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWppm1Z2dz3c5Y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 02:45:02 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1707E0004;
	Thu, 24 Aug 2023 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692895499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgKRd8PXna9jddAQ7rYYlYUO4KIn7jskOvosbl+/UOs=;
	b=KTVnzD5eVG2mw9j6CEqcZhnTJSoCHDBkb/MYYvlHhrk7z6MfEr8ZRX0TSl957if3mHmwzS
	6frES6KAXz+WuMYXmtFLD13OjX3VJcXVNJNMy7D6DCPoRgPj1bT8AtppiE+olPLBuMGg//
	JxxP0rArWBg88Nbj10QQwE39F6YhX3z3MDZGAnJf48nbqoGxGXN8Xia5wJbKAGfZBJ+N6Q
	HZA6C5qZftnN7pcS/5UaU+tLfQg+VnUhV0Zik7VF4qhFoxdGtvxD+UIMBMYu3kVD898JBR
	BQPsXzVrFkC3MWJPlEnpAEFtwQr2EIdoqd1el7kRXYhmwqMBOoOEs+RVJBd09g==
Date: Thu, 24 Aug 2023 18:44:54 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v4 21/28] net: wan: Add framer framework support
Message-ID: <20230824184454.2a96b6fc@bootlin.com>
In-Reply-To: <ZOJKH0xHpQc4HdUP@vergenet.net>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
	<5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
	<ZOJKH0xHpQc4HdUP@vergenet.net>
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

Hi Simon,

On Sun, 20 Aug 2023 19:15:11 +0200
Simon Horman <horms@kernel.org> wrote:

> On Fri, Aug 18, 2023 at 06:39:15PM +0200, Christophe Leroy wrote:
> > From: Herve Codina <herve.codina@bootlin.com>
> > 
> > A framer is a component in charge of an E1/T1 line interface.
> > Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> > frames. It also provides information related to the E1/T1 line.
> > 
> > The framer framework provides a set of APIs for the framer drivers
> > (framer provider) to create/destroy a framer and APIs for the framer
> > users (framer consumer) to obtain a reference to the framer, and
> > use the framer.
> > 
> > This basic implementation provides a framer abstraction for:
> >  - power on/off the framer
> >  - get the framer status (line state)
> >  - be notified on framer status changes
> >  - get/set the framer configuration
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>  
> 
> Hi Christophe and Herve,
> 
> some minor feedback from my side.
> 
> ...
> 
> > diff --git a/drivers/net/wan/framer/framer-core.c b/drivers/net/wan/framer/framer-core.c  
> 
> ...
> 
> > +/**
> > + * framer_create() - create a new framer
> > + * @dev: device that is creating the new framer
> > + * @node: device node of the framer. default to dev->of_node.
> > + * @ops: function pointers for performing framer operations
> > + *
> > + * Called to create a framer using framer framework.
> > + */
> > +struct framer *framer_create(struct device *dev, struct device_node *node,
> > +			     const struct framer_ops *ops)
> > +{
> > +	int ret;
> > +	int id;
> > +	struct framer *framer;  
> 
> Please arrange local variable declarations for Networking code
> using reverse xmas tree order - longest line to shortest.

Yes, will be done in the next iteration.

> 
> https://github.com/ecree-solarflare/xmastree is helpful here.
> 
> ...
> 
> > diff --git a/include/linux/framer/framer-provider.h b/include/linux/framer/framer-provider.h  
> 
> ...
> 
> > +/**
> > + * struct framer_ops - set of function pointers for performing framer operations
> > + * @init: operation to be performed for initializing the framer
> > + * @exit: operation to be performed while exiting
> > + * @power_on: powering on the framer
> > + * @power_off: powering off the framer
> > + * @flags: OR-ed flags (FRAMER_FLAG_*) to ask for core functionality
> > + *          - @FRAMER_FLAG_POLL_STATUS:
> > + *            Ask the core to perfom a polling to get the framer status and  
> 
> nit: perfom -> perform

Will be fixed in the next iteration.

> 
>      checkpatch.pl --codespell is your friend here
> 
> > + *            notify consumers on change.
> > + *            The framer should call @framer_notify_status_change() when it
> > + *            detects a status change. This is usally done using interrutps.  
> 
> nit: usally -> usually
>      interrutps -> interrupts

Will be fixed in the next iteration.

> 
> ...
> 
> > diff --git a/include/linux/framer/framer.h b/include/linux/framer/framer.h
> > new file mode 100644
> > index 000000000000..0bee7135142f
> > --- /dev/null
> > +++ b/include/linux/framer/framer.h
> > @@ -0,0 +1,199 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Generic framer header file
> > + *
> > + * Copyright 2023 CS GROUP France
> > + *
> > + * Author: Herve Codina <herve.codina@bootlin.com>
> > + */
> > +
> > +#ifndef __DRIVERS_FRAMER_H
> > +#define __DRIVERS_FRAMER_H
> > +
> > +#include <linux/err.h>
> > +#include <linux/mutex.h>
> > +#include <linux/notifier.h>
> > +#include <linux/of.h>
> > +#include <linux/device.h>
> > +#include <linux/workqueue.h>
> > +
> > +/**
> > + * enum framer_iface - Framer interface  
> 
> As this is a kernel-doc, please include documentation for
> the defined constants: FRAMER_IFACE_E1 and FRAMER_IFACE_T1.
> 
> As flagged by: ./scripts/kernel-doc -none

Will be done in the next iteration.

> 
> > + */
> > +enum framer_iface {
> > +	FRAMER_IFACE_E1,      /* E1 interface */
> > +	FRAMER_IFACE_T1,      /* T1 interface */
> > +};
> > +
> > +/**
> > + * enum framer_clock_mode - Framer clock mode  
> 
> Likewise here too.
> 
> Also, nit: framer_clock_mode -> framer_clock_type
> 

Will be updated (doc and change to framer_clock_type) in the next iteration.

> > + */
> > +enum framer_clock_type {
> > +	FRAMER_CLOCK_EXT, /* External clock */
> > +	FRAMER_CLOCK_INT, /* Internal clock */
> > +};
> > +
> > +/**
> > + * struct framer_configuration - Framer configuration  
> 
> nit: framer_configuration -> framer_config

Will be fixed in the next iteration.

> 
> > + * @line_iface: Framer line interface
> > + * @clock_mode: Framer clock type
> > + * @clock_rate: Framer clock rate
> > + */
> > +struct framer_config {
> > +	enum framer_iface iface;
> > +	enum framer_clock_type clock_type;
> > +	unsigned long line_clock_rate;
> > +};
> > +
> > +/**
> > + * struct framer_status - Framer status
> > + * @link_is_on: Framer link state. true, the link is on, false, the link is off.
> > + */
> > +struct framer_status {
> > +	bool link_is_on;
> > +};
> > +
> > +/**
> > + * framer_event - event available for notification  
> 
> nit: framer_event -> enum framer_event

Will be fixed in the next iteration.

> 
> A~d please document FRAMER_EVENT_STATUS in the kernel doc too.

Will be documented in the next iteration.

> 
> > + */
> > +enum framer_event {
> > +	FRAMER_EVENT_STATUS,	/* Event notified on framer_status changes */
> > +};  
> 
> ...

Thanks for the review,
Best regards,
Hervé
