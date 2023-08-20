Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B7C781EF5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Aug 2023 19:16:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qcYbvMBs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTMhV1kxzz3Wts
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 03:16:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qcYbvMBs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTMgb10Mbz2ytK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 03:15:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66D866196F;
	Sun, 20 Aug 2023 17:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD4FC433C8;
	Sun, 20 Aug 2023 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692551718;
	bh=Zkfqr6SI88EBqD7f2xXuMdFWLsYnT+jNapbN+UhZwXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcYbvMBsLDLwA0p1ML9ed9neCvmJ7zBgkux6racwXUMZZVDiaH6DY9dKrCsPxqXmm
	 jDmoSSrcwPzwxcuWvZw8JCmaPiP4+CkWMr63Gbzs6NFLNMjuT3uykobNYXv/bk+lqc
	 PvRARadbFhoxXh7t6NUX5W+JSv3/q9DN7V9zNkrWs4p2FyyMFFyaNRPelyeRE0svQF
	 CjdUagjVJdChTfi0yau4sv+w7+4JN7aqsDX/VBmzisOeEGKLhcOnDs2bPj09ocok7N
	 m+/l7EwNYsxKIpPD/Aj+fi236KH5xRkpGKO95YhLHsvvTIxsLtU7ugi4QHPX0OrFaU
	 pKtT9hUh4Mn2Q==
Date: Sun, 20 Aug 2023 19:15:11 +0200
From: Simon Horman <horms@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 21/28] net: wan: Add framer framework support
Message-ID: <ZOJKH0xHpQc4HdUP@vergenet.net>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
 <5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Herve Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@
 lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 18, 2023 at 06:39:15PM +0200, Christophe Leroy wrote:
> From: Herve Codina <herve.codina@bootlin.com>
> 
> A framer is a component in charge of an E1/T1 line interface.
> Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> frames. It also provides information related to the E1/T1 line.
> 
> The framer framework provides a set of APIs for the framer drivers
> (framer provider) to create/destroy a framer and APIs for the framer
> users (framer consumer) to obtain a reference to the framer, and
> use the framer.
> 
> This basic implementation provides a framer abstraction for:
>  - power on/off the framer
>  - get the framer status (line state)
>  - be notified on framer status changes
>  - get/set the framer configuration
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Hi Christophe and Herve,

some minor feedback from my side.

...

> diff --git a/drivers/net/wan/framer/framer-core.c b/drivers/net/wan/framer/framer-core.c

...

> +/**
> + * framer_create() - create a new framer
> + * @dev: device that is creating the new framer
> + * @node: device node of the framer. default to dev->of_node.
> + * @ops: function pointers for performing framer operations
> + *
> + * Called to create a framer using framer framework.
> + */
> +struct framer *framer_create(struct device *dev, struct device_node *node,
> +			     const struct framer_ops *ops)
> +{
> +	int ret;
> +	int id;
> +	struct framer *framer;

Please arrange local variable declarations for Networking code
using reverse xmas tree order - longest line to shortest.

https://github.com/ecree-solarflare/xmastree is helpful here.

...

> diff --git a/include/linux/framer/framer-provider.h b/include/linux/framer/framer-provider.h

...

> +/**
> + * struct framer_ops - set of function pointers for performing framer operations
> + * @init: operation to be performed for initializing the framer
> + * @exit: operation to be performed while exiting
> + * @power_on: powering on the framer
> + * @power_off: powering off the framer
> + * @flags: OR-ed flags (FRAMER_FLAG_*) to ask for core functionality
> + *          - @FRAMER_FLAG_POLL_STATUS:
> + *            Ask the core to perfom a polling to get the framer status and

nit: perfom -> perform

     checkpatch.pl --codespell is your friend here

> + *            notify consumers on change.
> + *            The framer should call @framer_notify_status_change() when it
> + *            detects a status change. This is usally done using interrutps.

nit: usally -> usually
     interrutps -> interrupts

...

> diff --git a/include/linux/framer/framer.h b/include/linux/framer/framer.h
> new file mode 100644
> index 000000000000..0bee7135142f
> --- /dev/null
> +++ b/include/linux/framer/framer.h
> @@ -0,0 +1,199 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Generic framer header file
> + *
> + * Copyright 2023 CS GROUP France
> + *
> + * Author: Herve Codina <herve.codina@bootlin.com>
> + */
> +
> +#ifndef __DRIVERS_FRAMER_H
> +#define __DRIVERS_FRAMER_H
> +
> +#include <linux/err.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/of.h>
> +#include <linux/device.h>
> +#include <linux/workqueue.h>
> +
> +/**
> + * enum framer_iface - Framer interface

As this is a kernel-doc, please include documentation for
the defined constants: FRAMER_IFACE_E1 and FRAMER_IFACE_T1.

As flagged by: ./scripts/kernel-doc -none

> + */
> +enum framer_iface {
> +	FRAMER_IFACE_E1,      /* E1 interface */
> +	FRAMER_IFACE_T1,      /* T1 interface */
> +};
> +
> +/**
> + * enum framer_clock_mode - Framer clock mode

Likewise here too.

Also, nit: framer_clock_mode -> framer_clock_type

> + */
> +enum framer_clock_type {
> +	FRAMER_CLOCK_EXT, /* External clock */
> +	FRAMER_CLOCK_INT, /* Internal clock */
> +};
> +
> +/**
> + * struct framer_configuration - Framer configuration

nit: framer_configuration -> framer_config

> + * @line_iface: Framer line interface
> + * @clock_mode: Framer clock type
> + * @clock_rate: Framer clock rate
> + */
> +struct framer_config {
> +	enum framer_iface iface;
> +	enum framer_clock_type clock_type;
> +	unsigned long line_clock_rate;
> +};
> +
> +/**
> + * struct framer_status - Framer status
> + * @link_is_on: Framer link state. true, the link is on, false, the link is off.
> + */
> +struct framer_status {
> +	bool link_is_on;
> +};
> +
> +/**
> + * framer_event - event available for notification

nit: framer_event -> enum framer_event

A~d please document FRAMER_EVENT_STATUS in the kernel doc too.

> + */
> +enum framer_event {
> +	FRAMER_EVENT_STATUS,	/* Event notified on framer_status changes */
> +};

...
