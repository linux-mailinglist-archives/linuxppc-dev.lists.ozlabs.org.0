Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A814237C3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 08:02:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPP4N0VYhz3bXP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 17:02:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.187.244;
 helo=10.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from 10.mo552.mail-out.ovh.net (10.mo552.mail-out.ovh.net
 [87.98.187.244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPP3v5dwgz2yHP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 17:02:03 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.68])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 14E45209D7;
 Wed,  6 Oct 2021 06:01:57 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 6 Oct
 2021 08:01:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002699eac54-7c48-48bd-88e1-bd1a466ed729,
 5A4A34E2598F7A0FA378A7207C32B8AA1DF96388) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <15d051c0-cf77-1a02-fa27-d99757aa4d1e@kaod.org>
Date: Wed, 6 Oct 2021 08:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC 3/5] ipmi:bt-bmc: Put arch specific function into bt_bmc_ops
Content-Language: en-US
To: Anton Blanchard <anton@ozlabs.org>, <alistair@popple.id.au>,
 <joel@jms.id.au>, <andrew@aj.id.au>, <mikey@neuling.org>,
 <jk@codeconstruct.com.au>
References: <20211006021205.2579057-1-anton@ozlabs.org>
 <20211006021205.2579057-3-anton@ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211006021205.2579057-3-anton@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e90aa22c-00af-4f5e-b5c7-7a99b6413df4
X-Ovh-Tracer-Id: 4311352219073547113
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelhedgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/6/21 04:12, Anton Blanchard wrote:
> While most of the driver is arch agnostic, setting up and handling
> interrupts, and enabling the hardware is not. Create bt_bmc_ops to
> handle these functions.
> 
> Signed-off-by: Anton Blanchard <anton@ozlabs.org>

See comment on patch 5. Any how,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks

C.

> ---
>   drivers/char/ipmi/bt-bmc.c | 24 ++++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> index 2b0fe1255026..b48e04405ac4 100644
> --- a/drivers/char/ipmi/bt-bmc.c
> +++ b/drivers/char/ipmi/bt-bmc.c
> @@ -17,6 +17,7 @@
>   #include <linux/regmap.h>
>   #include <linux/sched.h>
>   #include <linux/timer.h>
> +#include <linux/of_device.h>
>   
>   /*
>    * This is a BMC device used to communicate to the host
> @@ -435,15 +436,30 @@ static void aspeed_enable_bt(struct bt_bmc *bt_bmc)
>   		     BT_CR0_ENABLE_IBT);
>   }
>   
> +struct bt_bmc_ops {
> +	int (*config_irq)(struct bt_bmc *bt_bmc, struct platform_device *pdev);
> +	void (*enable_bt)(struct bt_bmc *bt_bmc);
> +};
> +
> +static const struct bt_bmc_ops aspeed_bt_bmc_ops = {
> +	.config_irq = aspeed_bt_bmc_config_irq,
> +	.enable_bt = aspeed_enable_bt,
> +};
> +
>   static int bt_bmc_probe(struct platform_device *pdev)
>   {
>   	struct bt_bmc *bt_bmc;
>   	struct device *dev;
>   	int rc;
> +	const struct bt_bmc_ops *ops;
>   
>   	dev = &pdev->dev;
>   	dev_info(dev, "Found bt bmc device\n");
>   
> +	ops = of_device_get_match_data(&pdev->dev);
> +	if (!ops)
> +		return -ENODEV;
> +
>   	bt_bmc = devm_kzalloc(dev, sizeof(*bt_bmc), GFP_KERNEL);
>   	if (!bt_bmc)
>   		return -ENOMEM;
> @@ -483,7 +499,7 @@ static int bt_bmc_probe(struct platform_device *pdev)
>   		return rc;
>   	}
>   
> -	aspeed_bt_bmc_config_irq(bt_bmc, pdev);
> +	ops->config_irq(bt_bmc, pdev);
>   
>   	if (bt_bmc->irq >= 0) {
>   		dev_info(dev, "Using IRQ %d\n", bt_bmc->irq);
> @@ -494,7 +510,7 @@ static int bt_bmc_probe(struct platform_device *pdev)
>   		add_timer(&bt_bmc->poll_timer);
>   	}
>   
> -	aspeed_enable_bt(bt_bmc);
> +	ops->enable_bt(bt_bmc);
>   
>   	clr_b_busy(bt_bmc);
>   
> @@ -512,8 +528,8 @@ static int bt_bmc_remove(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id bt_bmc_match[] = {
> -	{ .compatible = "aspeed,ast2400-ibt-bmc" },
> -	{ .compatible = "aspeed,ast2500-ibt-bmc" },
> +	{ .compatible = "aspeed,ast2400-ibt-bmc", .data = &aspeed_bt_bmc_ops },
> +	{ .compatible = "aspeed,ast2500-ibt-bmc", .data = &aspeed_bt_bmc_ops },
>   	{ },
>   };
>   
> 

