Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C656B4237FB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 08:28:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPPfb4hB1z30J5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 17:28:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.48.137; helo=9.mo548.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1642 seconds by postgrey-1.36 at boromir;
 Wed, 06 Oct 2021 17:28:11 AEDT
Received: from 9.mo548.mail-out.ovh.net (9.mo548.mail-out.ovh.net
 [46.105.48.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPPf31q0Yz2yPh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 17:28:09 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.235])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6048320A88;
 Wed,  6 Oct 2021 06:02:54 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 6 Oct
 2021 08:02:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001fa6f42e6-782a-4766-933d-98acbaf81629,
 5A4A34E2598F7A0FA378A7207C32B8AA1DF96388) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ca9ad223-81e1-00af-b433-8ab57021e6da@kaod.org>
Date: Wed, 6 Oct 2021 08:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC 1/5] ipmi:bt-bmc: Separate out ASPEED specific bits
Content-Language: en-US
To: Anton Blanchard <anton@ozlabs.org>, <alistair@popple.id.au>,
 <joel@jms.id.au>, <andrew@aj.id.au>, <mikey@neuling.org>,
 <jk@codeconstruct.com.au>
References: <20211006021205.2579057-1-anton@ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211006021205.2579057-1-anton@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0a516c31-0cfd-4c73-98f8-b3be28ee1393
X-Ovh-Tracer-Id: 4327396295824083817
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelhedgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
> Most of the IPMI BT BMC driver is architecture agnostic - it deals with
> architected registers and behaviour in the IPMI specification.
> 
> Separate out the few ASPEED specific bits into their own functions
> so we can use this driver on other architectures.
> 
> Signed-off-by: Anton Blanchard <anton@ozlabs.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   drivers/char/ipmi/bt-bmc.c | 26 ++++++++++++++++----------
>   1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> index 6e3d247b55d1..f85fafc96ef6 100644
> --- a/drivers/char/ipmi/bt-bmc.c
> +++ b/drivers/char/ipmi/bt-bmc.c
> @@ -39,6 +39,7 @@
>   #define   BT_CR2_IRQ_H2B	0x01
>   #define   BT_CR2_IRQ_HBUSY	0x40
>   #define BT_CR3		0xc
> +
>   #define BT_CTRL		0x10
>   #define   BT_CTRL_B_BUSY		0x80
>   #define   BT_CTRL_H_BUSY		0x40
> @@ -372,7 +373,7 @@ static void poll_timer(struct timer_list *t)
>   	add_timer(&bt_bmc->poll_timer);
>   }
>   
> -static irqreturn_t bt_bmc_irq(int irq, void *arg)
> +static irqreturn_t aspeed_bt_bmc_irq(int irq, void *arg)
>   {
>   	struct bt_bmc *bt_bmc = arg;
>   	u32 reg;
> @@ -393,7 +394,7 @@ static irqreturn_t bt_bmc_irq(int irq, void *arg)
>   	return IRQ_HANDLED;
>   }
>   
> -static int bt_bmc_config_irq(struct bt_bmc *bt_bmc,
> +static int aspeed_bt_bmc_config_irq(struct bt_bmc *bt_bmc,
>   			     struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -403,7 +404,7 @@ static int bt_bmc_config_irq(struct bt_bmc *bt_bmc,
>   	if (bt_bmc->irq < 0)
>   		return bt_bmc->irq;
>   
> -	rc = devm_request_irq(dev, bt_bmc->irq, bt_bmc_irq, IRQF_SHARED,
> +	rc = devm_request_irq(dev, bt_bmc->irq, aspeed_bt_bmc_irq, IRQF_SHARED,
>   			      DEVICE_NAME, bt_bmc);
>   	if (rc < 0) {
>   		dev_warn(dev, "Unable to request IRQ %d\n", bt_bmc->irq);
> @@ -424,6 +425,16 @@ static int bt_bmc_config_irq(struct bt_bmc *bt_bmc,
>   	return rc;
>   }
>   
> +static void aspeed_enable_bt(struct bt_bmc *bt_bmc)
> +{
> +	regmap_write(bt_bmc->map, bt_bmc->offset + BT_CR0,
> +		     (BT_IO_BASE << BT_CR0_IO_BASE) |
> +		     (BT_IRQ << BT_CR0_IRQ) |
> +		     BT_CR0_EN_CLR_SLV_RDP |
> +		     BT_CR0_EN_CLR_SLV_WRP |
> +		     BT_CR0_ENABLE_IBT);
> +}
> +
>   static int bt_bmc_probe(struct platform_device *pdev)
>   {
>   	struct bt_bmc *bt_bmc;
> @@ -472,7 +483,7 @@ static int bt_bmc_probe(struct platform_device *pdev)
>   		return rc;
>   	}
>   
> -	bt_bmc_config_irq(bt_bmc, pdev);
> +	aspeed_bt_bmc_config_irq(bt_bmc, pdev);
>   
>   	if (bt_bmc->irq >= 0) {
>   		dev_info(dev, "Using IRQ %d\n", bt_bmc->irq);
> @@ -483,12 +494,7 @@ static int bt_bmc_probe(struct platform_device *pdev)
>   		add_timer(&bt_bmc->poll_timer);
>   	}
>   
> -	regmap_write(bt_bmc->map, bt_bmc->offset + BT_CR0,
> -		     (BT_IO_BASE << BT_CR0_IO_BASE) |
> -		     (BT_IRQ << BT_CR0_IRQ) |
> -		     BT_CR0_EN_CLR_SLV_RDP |
> -		     BT_CR0_EN_CLR_SLV_WRP |
> -		     BT_CR0_ENABLE_IBT);
> +	aspeed_enable_bt(bt_bmc);
>   
>   	clr_b_busy(bt_bmc);
>   
> 

