Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC6442362B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 05:07:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPKBR6fVbz304G
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 14:07:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=tNp2L/S3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPK9q4t6Gz2yHT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 14:06:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=tNp2L/S3; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HPK9q2svfz4xb7;
 Wed,  6 Oct 2021 14:06:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1633489615;
 bh=JYGQpSXYEuR5HQBdYEkXKOg0MYCz6DDBlGXvVwJ8FeI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tNp2L/S3CEXEMjYSN/t47M8H7ibfEYXaJkzYWfH7JuMj7BwThy1+144u1wAcl4WQ8
 7nD0D581wMYN7ElHkyEFREFwnNqz41uI7EpNF3ImKDxTQ7RfvAI3TRa/gaysSF156X
 Vu1aMflumG1QmSoNU5JZLItNefSynWD3N2mMcUP8C2SX66payQxIczo9pk1HJyaaxC
 xN0tlYWOakrMuFUOBpOnRCfOc+ybaKUnPEjpGVVxp+w7z3X8RLVEaYVPlbVlgg9dnj
 4Vft5xq9j6Orjf/Q07/6ZtlaIVQRMp9AqSy3t4vFL86AcS3Ie0y2mPQtl+NoRZyEAI
 FYmhXWfNBrmPw==
Date: Wed, 6 Oct 2021 14:06:54 +1100
From: Anton Blanchard <anton@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [RFC 5/5] ipmi:bt-bmc: Add Microwatt
Message-ID: <20211006140654.4fb2ea0f@kryten>
In-Reply-To: <CACPK8XetfycURqsznmA1dMZ5h5=uJb6xrzg-ihsZH9Xft=phdA@mail.gmail.com>
References: <20211006021205.2579057-1-anton@ozlabs.org>
 <20211006021205.2579057-5-anton@ozlabs.org>
 <CACPK8XetfycURqsznmA1dMZ5h5=uJb6xrzg-ihsZH9Xft=phdA@mail.gmail.com>
X-Mailer: Mutt/1.8.0 (2017-02-23)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Joel,

> The series looks good.
> 
> I've got a couple of patches on the ipmi list that this will conflict
> with:
> 
>  https://sourceforge.net/p/openipmi/mailman/message/37345391/
>  https://lore.kernel.org/all/20210903015314.177987-1-joel@jms.id.au/
> 
> If there's no feedback from others I suggest basing your series on top
> of those, and sending them to Corey on the ipmi list to merge.

Looks good, will do.

Thanks,
Anton

> Cheers,
> 
> Joel
> 
> >
> > Signed-off-by: Anton Blanchard <anton@ozlabs.org>
> > ---
> >  .../devicetree/bindings/ipmi/ibt-bmc.txt      |  1 +
> >  drivers/char/ipmi/Kconfig                     |  8 ++-
> >  drivers/char/ipmi/bt-bmc.c                    | 69
> > +++++++++++++++++++ 3 files changed, 75 insertions(+), 3
> > deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/ipmi/ibt-bmc.txt
> > b/Documentation/devicetree/bindings/ipmi/ibt-bmc.txt index
> > 78ee716a950e..1b661daf0193 100644 ---
> > a/Documentation/devicetree/bindings/ipmi/ibt-bmc.txt +++
> > b/Documentation/devicetree/bindings/ipmi/ibt-bmc.txt @@ -9,6 +9,7
> > @@ Required properties:
> >  - compatible : should be one of
> >         "aspeed,ast2400-ibt-bmc"
> >         "aspeed,ast2500-ibt-bmc"
> > +       "ibm,microwatt-ibt-bmc"
> >  - reg: physical address and size of the registers
> >
> >  Optional properties:
> > diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> > index 8b2f0f675e5f..079302f4eef2 100644
> > --- a/drivers/char/ipmi/Kconfig
> > +++ b/drivers/char/ipmi/Kconfig
> > @@ -152,13 +152,15 @@ config IPMI_KCS_BMC_SERIO
> >           called kcs_bmc_serio.
> >
> >  config BT_IPMI_BMC
> > -       depends on ARCH_ASPEED || COMPILE_TEST
> > +       depends on ARCH_ASPEED || PPC_MICROWATT || COMPILE_TEST
> >         depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
> >         tristate "BT IPMI bmc driver"
> >         help
> >           Provides a driver for the BT (Block Transfer) IPMI
> > interface
> > -         found on Aspeed SOCs (AST2400 and AST2500). The driver
> > -         implements the BMC side of the BT interface.
> > +         found on Aspeed SOCs (AST2400 and AST2500) as well as the
> > OpenPOWER
> > +         LPC peripheral macro at
> > +         <https://github.com/OpenPOWERFoundation/lpcperipheral>
> > +         The driver implements the BMC side of the BT interface.
> >
> >  config IPMB_DEVICE_INTERFACE
> >         tristate 'IPMB Interface handler'
> > diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> > index b48e04405ac4..24327b57c60b 100644
> > --- a/drivers/char/ipmi/bt-bmc.c
> > +++ b/drivers/char/ipmi/bt-bmc.c
> > @@ -41,6 +41,11 @@
> >  #define   BT_CR2_IRQ_HBUSY     0x40
> >  #define ASPEED_BT_CR3  0xc
> >
> > +#define MICROWATT_IRQ_MASK     0x0
> > +#define MICROWATT_IRQ_STATUS   0x4
> > +#define   IRQ_HOST_TO_BMC_ATTN 0x1
> > +#define   IRQ_HOST_NOT_BUSY    0x2
> > +
> >  #define BT_CTRL                0x10
> >  #define   BT_CTRL_B_BUSY               0x80
> >  #define   BT_CTRL_H_BUSY               0x40
> > @@ -395,6 +400,27 @@ static irqreturn_t aspeed_bt_bmc_irq(int irq,
> > void *arg) return IRQ_HANDLED;
> >  }
> >
> > +static irqreturn_t microwatt_bt_bmc_irq(int irq, void *arg)
> > +{
> > +       struct bt_bmc *bt_bmc = arg;
> > +       u32 reg;
> > +       int rc;
> > +
> > +       rc = regmap_read(bt_bmc->map, bt_bmc->offset +
> > MICROWATT_IRQ_STATUS, &reg);
> > +       if (rc)
> > +               return IRQ_NONE;
> > +
> > +       /* Interrupt wasn't something we knew about */
> > +       if (!(reg & (IRQ_HOST_TO_BMC_ATTN | IRQ_HOST_NOT_BUSY)))
> > +               return IRQ_NONE;
> > +
> > +       /* ack all pending IRQs */
> > +       regmap_write(bt_bmc->map, bt_bmc->offset +
> > MICROWATT_IRQ_STATUS, 0); +
> > +       wake_up(&bt_bmc->queue);
> > +       return IRQ_HANDLED;
> > +}
> > +
> >  static int aspeed_bt_bmc_config_irq(struct bt_bmc *bt_bmc,
> >                              struct platform_device *pdev)
> >  {
> > @@ -446,6 +472,48 @@ static const struct bt_bmc_ops
> > aspeed_bt_bmc_ops = { .enable_bt = aspeed_enable_bt,
> >  };
> >
> > +static int microwatt_bt_bmc_config_irq(struct bt_bmc *bt_bmc,
> > +                            struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       int rc;
> > +
> > +       bt_bmc->irq = platform_get_irq_optional(pdev, 0);
> > +       if (bt_bmc->irq < 0)
> > +               return bt_bmc->irq;
> > +
> > +       rc = devm_request_irq(dev, bt_bmc->irq,
> > microwatt_bt_bmc_irq, IRQF_SHARED,
> > +                             DEVICE_NAME, bt_bmc);
> > +       if (rc < 0) {
> > +               dev_warn(dev, "Unable to request IRQ %d\n",
> > bt_bmc->irq);
> > +               bt_bmc->irq = rc;
> > +               return rc;
> > +       }
> > +
> > +       /*
> > +        * Configure the hardware to give us an interrupt whenever
> > the H2B
> > +        * bit is set or the HBUSY bit is cleared.
> > +        *
> > +        * H2B will be asserted when the bmc has data for us; HBUSY
> > +        * will be cleared (along with B2H) when we can write the
> > next
> > +        * message to the BT buffer
> > +        */
> > +       rc = regmap_update_bits(bt_bmc->map, bt_bmc->offset +
> > MICROWATT_IRQ_MASK,
> > +                               (IRQ_HOST_TO_BMC_ATTN |
> > IRQ_HOST_NOT_BUSY),
> > +                               (IRQ_HOST_TO_BMC_ATTN |
> > IRQ_HOST_NOT_BUSY)); +
> > +       return rc;
> > +}
> > +
> > +static void microwatt_enable_bt(struct bt_bmc *bt_bmc)
> > +{
> > +}
> > +
> > +static const struct bt_bmc_ops microwatt_bt_bmc_ops = {
> > +       .config_irq = microwatt_bt_bmc_config_irq,
> > +       .enable_bt = microwatt_enable_bt,
> > +};
> > +
> >  static int bt_bmc_probe(struct platform_device *pdev)
> >  {
> >         struct bt_bmc *bt_bmc;
> > @@ -530,6 +598,7 @@ static int bt_bmc_remove(struct platform_device
> > *pdev) static const struct of_device_id bt_bmc_match[] = {
> >         { .compatible = "aspeed,ast2400-ibt-bmc", .data =
> > &aspeed_bt_bmc_ops }, { .compatible = "aspeed,ast2500-ibt-bmc",
> > .data = &aspeed_bt_bmc_ops },
> > +       { .compatible = "ibm,microwatt-ibt-bmc", .data =
> > &microwatt_bt_bmc_ops }, { },
> >  };
> >
> > --
> > 2.31.1
> >  
> 

