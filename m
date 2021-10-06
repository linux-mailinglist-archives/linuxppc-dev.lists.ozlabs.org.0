Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0540A4235E2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 04:36:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPJVy5nPfz303x
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 13:36:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HgLQEBb9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82a;
 helo=mail-qt1-x82a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=HgLQEBb9; dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPJVC451Mz2yHT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 13:36:01 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id t2so1094425qtx.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Oct 2021 19:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AxOZFHzkwYiQXWwD8CC7vaes1+dVB216X3IjfOUx7yM=;
 b=HgLQEBb9PmeaRNnNYJAHrcv225x5i2jaVZCuUNu2pBm3iajmUVUwY83ozUKIvMvcKU
 ZW/cMFaZYqN4MBfT/ohttUvzP+OUWIRFeBBBGQcRHDa8c3u2h1qn6Wc/srThpYUKVbHf
 Qd0yoqnaYSltMxTDYZhx7pBFcu6TSyBIgEqDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AxOZFHzkwYiQXWwD8CC7vaes1+dVB216X3IjfOUx7yM=;
 b=EMutHzM5DZ4EM2cuuU/5ALhILH8gqvbSzV0KajnDrXlvBifohqpXfzNjazjJ3f5lpX
 /N1PC4lp6ezhtzmUABGnUXc1kW7OoqYwnkJGM76BVM1zV56lyuC3lKpM1OHgqhDgPEr6
 XhueWt6kWyiWmbNQNvw2XWzD+A5sQAj6iXQuMuLAtCRMoahpu+6aFlhADzTZkPwHYqDK
 qW9uoph/abw+UT1iAGRJ4jfM4t0Y1Ng80W/cf5/uBtZPccJuQsmPC0q85DKrNaLOEaf/
 0kcBUOtdxYgPfu54/5fmRBMrerQ71oUyQOo8BSXwJh76tjpyqy0mTU8ijL9XCoyIKFfa
 WHdA==
X-Gm-Message-State: AOAM533uqLf3Mefeu6fpFMCNmxzBcDK3DUAvJBV0cW9hhJbNyHvRoMKw
 jHKXwrPiAprJ/GRJDBSGlXcGdZD1hPYwWioimlc=
X-Google-Smtp-Source: ABdhPJxv74ADj76NkPispuGMRQbAe2sgvtRwrO6ueQ9Y8RmAR+k2Nag27zJ0YZK7pGnE+BcgRFf8T+zrzhInBAQTvUo=
X-Received: by 2002:aed:2791:: with SMTP id a17mr23135515qtd.295.1633487757673; 
 Tue, 05 Oct 2021 19:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211006021205.2579057-1-anton@ozlabs.org>
 <20211006021205.2579057-5-anton@ozlabs.org>
In-Reply-To: <20211006021205.2579057-5-anton@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Oct 2021 02:35:46 +0000
Message-ID: <CACPK8XetfycURqsznmA1dMZ5h5=uJb6xrzg-ihsZH9Xft=phdA@mail.gmail.com>
Subject: Re: [RFC 5/5] ipmi:bt-bmc: Add Microwatt
To: Anton Blanchard <anton@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Michael Neuling <mikey@neuling.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Popple <alistair@popple.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Anton,

On Wed, 6 Oct 2021 at 02:12, Anton Blanchard <anton@ozlabs.org> wrote:
>
> This adds the Microwatt specific bits, including interrupt support.

The series looks good.

I've got a couple of patches on the ipmi list that this will conflict with:

 https://sourceforge.net/p/openipmi/mailman/message/37345391/
 https://lore.kernel.org/all/20210903015314.177987-1-joel@jms.id.au/

If there's no feedback from others I suggest basing your series on top
of those, and sending them to Corey on the ipmi list to merge.

Cheers,

Joel

>
> Signed-off-by: Anton Blanchard <anton@ozlabs.org>
> ---
>  .../devicetree/bindings/ipmi/ibt-bmc.txt      |  1 +
>  drivers/char/ipmi/Kconfig                     |  8 ++-
>  drivers/char/ipmi/bt-bmc.c                    | 69 +++++++++++++++++++
>  3 files changed, 75 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/ipmi/ibt-bmc.txt b/Documentation/devicetree/bindings/ipmi/ibt-bmc.txt
> index 78ee716a950e..1b661daf0193 100644
> --- a/Documentation/devicetree/bindings/ipmi/ibt-bmc.txt
> +++ b/Documentation/devicetree/bindings/ipmi/ibt-bmc.txt
> @@ -9,6 +9,7 @@ Required properties:
>  - compatible : should be one of
>         "aspeed,ast2400-ibt-bmc"
>         "aspeed,ast2500-ibt-bmc"
> +       "ibm,microwatt-ibt-bmc"
>  - reg: physical address and size of the registers
>
>  Optional properties:
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 8b2f0f675e5f..079302f4eef2 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -152,13 +152,15 @@ config IPMI_KCS_BMC_SERIO
>           called kcs_bmc_serio.
>
>  config BT_IPMI_BMC
> -       depends on ARCH_ASPEED || COMPILE_TEST
> +       depends on ARCH_ASPEED || PPC_MICROWATT || COMPILE_TEST
>         depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
>         tristate "BT IPMI bmc driver"
>         help
>           Provides a driver for the BT (Block Transfer) IPMI interface
> -         found on Aspeed SOCs (AST2400 and AST2500). The driver
> -         implements the BMC side of the BT interface.
> +         found on Aspeed SOCs (AST2400 and AST2500) as well as the OpenPOWER
> +         LPC peripheral macro at
> +         <https://github.com/OpenPOWERFoundation/lpcperipheral>
> +         The driver implements the BMC side of the BT interface.
>
>  config IPMB_DEVICE_INTERFACE
>         tristate 'IPMB Interface handler'
> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> index b48e04405ac4..24327b57c60b 100644
> --- a/drivers/char/ipmi/bt-bmc.c
> +++ b/drivers/char/ipmi/bt-bmc.c
> @@ -41,6 +41,11 @@
>  #define   BT_CR2_IRQ_HBUSY     0x40
>  #define ASPEED_BT_CR3  0xc
>
> +#define MICROWATT_IRQ_MASK     0x0
> +#define MICROWATT_IRQ_STATUS   0x4
> +#define   IRQ_HOST_TO_BMC_ATTN 0x1
> +#define   IRQ_HOST_NOT_BUSY    0x2
> +
>  #define BT_CTRL                0x10
>  #define   BT_CTRL_B_BUSY               0x80
>  #define   BT_CTRL_H_BUSY               0x40
> @@ -395,6 +400,27 @@ static irqreturn_t aspeed_bt_bmc_irq(int irq, void *arg)
>         return IRQ_HANDLED;
>  }
>
> +static irqreturn_t microwatt_bt_bmc_irq(int irq, void *arg)
> +{
> +       struct bt_bmc *bt_bmc = arg;
> +       u32 reg;
> +       int rc;
> +
> +       rc = regmap_read(bt_bmc->map, bt_bmc->offset + MICROWATT_IRQ_STATUS, &reg);
> +       if (rc)
> +               return IRQ_NONE;
> +
> +       /* Interrupt wasn't something we knew about */
> +       if (!(reg & (IRQ_HOST_TO_BMC_ATTN | IRQ_HOST_NOT_BUSY)))
> +               return IRQ_NONE;
> +
> +       /* ack all pending IRQs */
> +       regmap_write(bt_bmc->map, bt_bmc->offset + MICROWATT_IRQ_STATUS, 0);
> +
> +       wake_up(&bt_bmc->queue);
> +       return IRQ_HANDLED;
> +}
> +
>  static int aspeed_bt_bmc_config_irq(struct bt_bmc *bt_bmc,
>                              struct platform_device *pdev)
>  {
> @@ -446,6 +472,48 @@ static const struct bt_bmc_ops aspeed_bt_bmc_ops = {
>         .enable_bt = aspeed_enable_bt,
>  };
>
> +static int microwatt_bt_bmc_config_irq(struct bt_bmc *bt_bmc,
> +                            struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       int rc;
> +
> +       bt_bmc->irq = platform_get_irq_optional(pdev, 0);
> +       if (bt_bmc->irq < 0)
> +               return bt_bmc->irq;
> +
> +       rc = devm_request_irq(dev, bt_bmc->irq, microwatt_bt_bmc_irq, IRQF_SHARED,
> +                             DEVICE_NAME, bt_bmc);
> +       if (rc < 0) {
> +               dev_warn(dev, "Unable to request IRQ %d\n", bt_bmc->irq);
> +               bt_bmc->irq = rc;
> +               return rc;
> +       }
> +
> +       /*
> +        * Configure the hardware to give us an interrupt whenever the H2B
> +        * bit is set or the HBUSY bit is cleared.
> +        *
> +        * H2B will be asserted when the bmc has data for us; HBUSY
> +        * will be cleared (along with B2H) when we can write the next
> +        * message to the BT buffer
> +        */
> +       rc = regmap_update_bits(bt_bmc->map, bt_bmc->offset + MICROWATT_IRQ_MASK,
> +                               (IRQ_HOST_TO_BMC_ATTN | IRQ_HOST_NOT_BUSY),
> +                               (IRQ_HOST_TO_BMC_ATTN | IRQ_HOST_NOT_BUSY));
> +
> +       return rc;
> +}
> +
> +static void microwatt_enable_bt(struct bt_bmc *bt_bmc)
> +{
> +}
> +
> +static const struct bt_bmc_ops microwatt_bt_bmc_ops = {
> +       .config_irq = microwatt_bt_bmc_config_irq,
> +       .enable_bt = microwatt_enable_bt,
> +};
> +
>  static int bt_bmc_probe(struct platform_device *pdev)
>  {
>         struct bt_bmc *bt_bmc;
> @@ -530,6 +598,7 @@ static int bt_bmc_remove(struct platform_device *pdev)
>  static const struct of_device_id bt_bmc_match[] = {
>         { .compatible = "aspeed,ast2400-ibt-bmc", .data = &aspeed_bt_bmc_ops },
>         { .compatible = "aspeed,ast2500-ibt-bmc", .data = &aspeed_bt_bmc_ops },
> +       { .compatible = "ibm,microwatt-ibt-bmc", .data = &microwatt_bt_bmc_ops },
>         { },
>  };
>
> --
> 2.31.1
>
