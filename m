Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A0D757482
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 08:42:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=lVsAfqer;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4qBd37T2z30N2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 16:42:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=lVsAfqer;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 578 seconds by postgrey-1.37 at boromir; Tue, 18 Jul 2023 16:41:46 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4q9k1yfkz300C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:41:45 +1000 (AEST)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 980E4D0972
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 06:32:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E080220008;
	Tue, 18 Jul 2023 06:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689661919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RpKAtUiUinq9Lhw+v54h3QcTHPMMcdg2W9j58F9msCI=;
	b=lVsAfqer8xWiySiEq4z7Whp9otUwyCQXKtPI1tRr5f7imi5WmvidsvbXpCUGXwxk1c+lvE
	oUHmSljh698Kg7YXWz38yD7YKynczdgakNvh9W31vXeG3ASFtYmUbHMMJvu2jAXs6WXMFe
	qDOvnq5fNCwuhkU5Pv9JkSJ8uAbs1yjvZIjT+WnxMiQeDJLtUHfZO7aM8YIAG7auX7E6KB
	neoUdUzoHRJnTzkhM6WLVgYwYyzcHYvDk8cc5I9mppjSrEmHREOSYJaDUdNw61xuiMD/34
	m7I4N+6JbCgr4Op1Mxo+kriyEeSldJsgWRrKtcIj3mGk+C0lffE+F3dHz9dysw==
Date: Tue, 18 Jul 2023 08:31:49 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] usb: Explicitly include correct DT includes
Message-ID: <20230718083149.77fa57ef@bootlin.com>
In-Reply-To: <20230714175027.4065135-1-robh@kernel.org>
References: <20230714175027.4065135-1-robh@kernel.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Richard Leitner <richard.leitner@linux.dev>, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, NXP Linux Team <linux-imx@nxp.com>, linux-renesas-soc@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>, Matthias Brugger <matthias
 .bgg@gmail.com>, devicetree@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>, linux-tegra@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@gmail.com>, Roger Quadros <rogerq@kernel.org>, linux-mediatek@lists.infradead.org, Minas Harutyunyan <hminas@synopsys.com>, Michal Simek <michal.simek@amd.com>, Bin Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daire McNamara <daire.mcnamara@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Li Yang <leoyang.li@nxp.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <clau
 diu.beznea@microchip.com>, Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob,

On Fri, 14 Jul 2023 11:50:23 -0600
Rob Herring <robh@kernel.org> wrote:

> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

[...]

> diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
> index 6cd0af83e91e..3482b41d0646 100644
> --- a/drivers/usb/gadget/udc/renesas_usbf.c
> +++ b/drivers/usb/gadget/udc/renesas_usbf.c
> @@ -12,10 +12,9 @@
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/kfifo.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of_address.h>
> -#include <linux/of_irq.h>
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/types.h>
>  #include <linux/usb/composite.h>

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
