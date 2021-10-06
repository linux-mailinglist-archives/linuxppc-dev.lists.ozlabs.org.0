Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C614237C7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 08:08:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPPCD35fFz2yQ9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 17:08:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.255.19; helo=2.mo548.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 297 seconds by postgrey-1.36 at boromir;
 Wed, 06 Oct 2021 17:07:56 AEDT
Received: from 2.mo548.mail-out.ovh.net (2.mo548.mail-out.ovh.net
 [178.33.255.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPPBh1XTYz2yHT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 17:07:55 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.238])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5EE0220B14;
 Wed,  6 Oct 2021 06:00:40 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 6 Oct
 2021 08:00:40 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003ae6c2257-eca0-4216-9115-56ba6af917a8,
 5A4A34E2598F7A0FA378A7207C32B8AA1DF96388) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2ac16748-11a6-59d4-4462-ecdf53a3d0af@kaod.org>
Date: Wed, 6 Oct 2021 08:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC 5/5] ipmi:bt-bmc: Add Microwatt
Content-Language: en-US
To: Anton Blanchard <anton@ozlabs.org>, <alistair@popple.id.au>,
 <joel@jms.id.au>, <andrew@aj.id.au>, <mikey@neuling.org>,
 <jk@codeconstruct.com.au>
References: <20211006021205.2579057-1-anton@ozlabs.org>
 <20211006021205.2579057-5-anton@ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211006021205.2579057-5-anton@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0fc0b99d-7c16-400e-bae1-423feb95e592
X-Ovh-Tracer-Id: 4289678645680573289
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelhedgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeefiedukefhueejteffvedthffhkeehhefhtdejkeefheeifeejvdfgfffgieefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
> This adds the Microwatt specific bits, including interrupt support.
> 
> Signed-off-by: Anton Blanchard <anton@ozlabs.org>
> ---
>   .../devicetree/bindings/ipmi/ibt-bmc.txt      |  1 +
>   drivers/char/ipmi/Kconfig                     |  8 ++-
>   drivers/char/ipmi/bt-bmc.c                    | 69 +++++++++++++++++++
>   3 files changed, 75 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ipmi/ibt-bmc.txt b/Documentation/devicetree/bindings/ipmi/ibt-bmc.txt
> index 78ee716a950e..1b661daf0193 100644
> --- a/Documentation/devicetree/bindings/ipmi/ibt-bmc.txt
> +++ b/Documentation/devicetree/bindings/ipmi/ibt-bmc.txt
> @@ -9,6 +9,7 @@ Required properties:
>   - compatible : should be one of
>   	"aspeed,ast2400-ibt-bmc"
>   	"aspeed,ast2500-ibt-bmc"
> +	"ibm,microwatt-ibt-bmc"
>   - reg: physical address and size of the registers
>   
>   Optional properties:
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 8b2f0f675e5f..079302f4eef2 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -152,13 +152,15 @@ config IPMI_KCS_BMC_SERIO
>   	  called kcs_bmc_serio.
>   
>   config BT_IPMI_BMC
> -	depends on ARCH_ASPEED || COMPILE_TEST
> +	depends on ARCH_ASPEED || PPC_MICROWATT || COMPILE_TEST
>   	depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
>   	tristate "BT IPMI bmc driver"
>   	help
>   	  Provides a driver for the BT (Block Transfer) IPMI interface
> -	  found on Aspeed SOCs (AST2400 and AST2500). The driver
> -	  implements the BMC side of the BT interface.
> +	  found on Aspeed SOCs (AST2400 and AST2500) as well as the OpenPOWER
> +	  LPC peripheral macro at
> +	  <https://github.com/OpenPOWERFoundation/lpcperipheral>
> +	  The driver implements the BMC side of the BT interface.
>   
>   config IPMB_DEVICE_INTERFACE
>   	tristate 'IPMB Interface handler'
> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> index b48e04405ac4..24327b57c60b 100644
> --- a/drivers/char/ipmi/bt-bmc.c
> +++ b/drivers/char/ipmi/bt-bmc.c
> @@ -41,6 +41,11 @@
>   #define   BT_CR2_IRQ_HBUSY	0x40
>   #define ASPEED_BT_CR3	0xc
>   
> +#define MICROWATT_IRQ_MASK	0x0
> +#define MICROWATT_IRQ_STATUS	0x4
> +#define   IRQ_HOST_TO_BMC_ATTN	0x1
> +#define   IRQ_HOST_NOT_BUSY	0x2
> +
>   #define BT_CTRL		0x10
>   #define   BT_CTRL_B_BUSY		0x80
>   #define   BT_CTRL_H_BUSY		0x40
> @@ -395,6 +400,27 @@ static irqreturn_t aspeed_bt_bmc_irq(int irq, void *arg)
>   	return IRQ_HANDLED;
>   }
>   
> +static irqreturn_t microwatt_bt_bmc_irq(int irq, void *arg)
> +{
> +	struct bt_bmc *bt_bmc = arg;
> +	u32 reg;
> +	int rc;
> +
> +	rc = regmap_read(bt_bmc->map, bt_bmc->offset + MICROWATT_IRQ_STATUS, &reg);
> +	if (rc)
> +		return IRQ_NONE;
> +
> +	/* Interrupt wasn't something we knew about */
> +	if (!(reg & (IRQ_HOST_TO_BMC_ATTN | IRQ_HOST_NOT_BUSY)))
> +		return IRQ_NONE;
> +
> +	/* ack all pending IRQs */
> +	regmap_write(bt_bmc->map, bt_bmc->offset + MICROWATT_IRQ_STATUS, 0);
> +
> +	wake_up(&bt_bmc->queue);
> +	return IRQ_HANDLED;
> +}
> +
>   static int aspeed_bt_bmc_config_irq(struct bt_bmc *bt_bmc,
>   			     struct platform_device *pdev)
>   {
> @@ -446,6 +472,48 @@ static const struct bt_bmc_ops aspeed_bt_bmc_ops = {
>   	.enable_bt = aspeed_enable_bt,
>   };
>   
> +static int microwatt_bt_bmc_config_irq(struct bt_bmc *bt_bmc,
> +			     struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int rc;
> +
> +	bt_bmc->irq = platform_get_irq_optional(pdev, 0);
> +	if (bt_bmc->irq < 0)
> +		return bt_bmc->irq;
> +
> +	rc = devm_request_irq(dev, bt_bmc->irq, microwatt_bt_bmc_irq, IRQF_SHARED,
> +			      DEVICE_NAME, bt_bmc);
> +	if (rc < 0) {
> +		dev_warn(dev, "Unable to request IRQ %d\n", bt_bmc->irq);
> +		bt_bmc->irq = rc;
> +		return rc;
> +	}
> +
> +	/*
> +	 * Configure the hardware to give us an interrupt whenever the H2B
> +	 * bit is set or the HBUSY bit is cleared.
> +	 *
> +	 * H2B will be asserted when the bmc has data for us; HBUSY
> +	 * will be cleared (along with B2H) when we can write the next
> +	 * message to the BT buffer
> +	 */
> +	rc = regmap_update_bits(bt_bmc->map, bt_bmc->offset + MICROWATT_IRQ_MASK,
> +				(IRQ_HOST_TO_BMC_ATTN | IRQ_HOST_NOT_BUSY),
> +				(IRQ_HOST_TO_BMC_ATTN | IRQ_HOST_NOT_BUSY));

This is the only difference. May be we could introduce a ->config_irq_hw()
handler to keep a larger part common. No big deal.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

C.


> +	return rc;
> +}
> +
> +static void microwatt_enable_bt(struct bt_bmc *bt_bmc)
> +{
> +}
> +
> +static const struct bt_bmc_ops microwatt_bt_bmc_ops = {
> +	.config_irq = microwatt_bt_bmc_config_irq,
> +	.enable_bt = microwatt_enable_bt,
> +};
> +
>   static int bt_bmc_probe(struct platform_device *pdev)
>   {
>   	struct bt_bmc *bt_bmc;
> @@ -530,6 +598,7 @@ static int bt_bmc_remove(struct platform_device *pdev)
>   static const struct of_device_id bt_bmc_match[] = {
>   	{ .compatible = "aspeed,ast2400-ibt-bmc", .data = &aspeed_bt_bmc_ops },
>   	{ .compatible = "aspeed,ast2500-ibt-bmc", .data = &aspeed_bt_bmc_ops },
> +	{ .compatible = "ibm,microwatt-ibt-bmc", .data = &microwatt_bt_bmc_ops },
>   	{ },
>   };
>   
> 

