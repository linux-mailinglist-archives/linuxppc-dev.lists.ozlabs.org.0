Return-Path: <linuxppc-dev+bounces-11106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F32B2B248
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 22:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5PGs1D5Yz3chK;
	Tue, 19 Aug 2025 06:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755548437;
	cv=none; b=G1XlJKlIH8PbH6+Pqld2XdY+vhj1KkLvYW6XOUvWlVtSAui6E0yKd0zmon4UOERKYAp/cfvEz0s6CSzzNxBA8SdbTgoc+Yvh1uFCLDxTfvzUZIeNn+x35TpLoUQWYzvknKQWOUf3Tc4WlPsMMmegtyCF31ddCztv3xAyeqs/HbUaDDFiuoNgADuFCDlaOU/iAmnmwF0sV6jVGrNw88mjCFpvmi0GlhiFXpqwbc/C8KCh2wyPrVn3I/ycLbabM4XXR+UDdSAIASVflwK3MqnKcitR0vCu8g5QZJcSlaa4/2B8zMgcj6z0sRYJoi5qcSovIOvi2V45gbXrbmei0DzxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755548437; c=relaxed/relaxed;
	bh=CxQvwWaMlHtmDIk/5Uaxuyq2WHRIQZy/jLZ2tazpre4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lp4eoqOX61DDRDglqGvm9korQTkTrWySp6Bc/OMFika5P2IaOdnYd/1vTm4xFOyfalSupAZLSnWcIr0q+eKuKicec287Wgt9V0k5+3kKB9HOc0cEmvIeWnPafkZ+/eTsebUpqFlJCL3VFluVlnH6LzZMACdYhXvVqDbMbRgBkjCbxg1pGFQ5UXYhWM4k3WgCTIvk8KKttIz+pKA9UCiw5xccraVMb99ZS2/mG6unCjPaI7moHmONKcA8weYvhzw9P+RQHU5G3feuIauZSisOhmeqKPMnstlyAif7l8bKVwtI0VJlYIqCxDLC20KbJBfwxWFCGYwjMoYlEMhSBq3rew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5PGr2TjHz3cgl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 06:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55ZV6vqDz9sVP;
	Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5hybM51rxMvV; Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55ZV5jRkz9sVL;
	Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A2A4C8B764;
	Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id bcNwoLJxTpMP; Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 715818B763;
	Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
Message-ID: <d085efdd-fe8b-4efa-92e1-34573c55ade5@csgroup.eu>
Date: Mon, 18 Aug 2025 10:33:06 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: fsl: qe: Add support of IRQ in QE GPIO
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <22b3847fd0011024c10aff48f1e5223894ce718a.1754996033.git.christophe.leroy@csgroup.eu>
 <CAMRc=Mce3LHtCUd-oO3uZjVAS-fywn86Zn+qmehZPJTKLzk6Sg@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <CAMRc=Mce3LHtCUd-oO3uZjVAS-fywn86Zn+qmehZPJTKLzk6Sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 12/08/2025 à 16:21, Bartosz Golaszewski a écrit :
> On Tue, 12 Aug 2025 13:02:53 +0200, Christophe Leroy
> <christophe.leroy@csgroup.eu> said:
>> In the QE, a few GPIOs are IRQ capable. Similarly to
>> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
>> GPIO"), add IRQ support to QE GPIO.
>>
>> Add property 'fsl,qe-gpio-irq-mask' similar to
>> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>>
>> Here is an exemple for port B of mpc8323 which has IRQs for
>> GPIOs PB7, PB9, PB25 and PB27.
>>
>> 	qe_pio_b: gpio-controller@1418 {
>> 		#gpio-cells = <2>;
>> 		compatible = "fsl,mpc8323-qe-pario-bank";
>> 		reg = <0x1418 0x18>;
>> 		interrupts = <4 5 6 7>;
>> 		fsl,qe-gpio-irq-mask = <0x01400050>;
>> 		interrupt-parent = <&qepic>;
>> 		gpio-controller;
>> 	};
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   drivers/soc/fsl/qe/gpio.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
>> index b502377193192..59145652ad850 100644
>> --- a/drivers/soc/fsl/qe/gpio.c
>> +++ b/drivers/soc/fsl/qe/gpio.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/err.h>
>>   #include <linux/io.h>
>>   #include <linux/of.h>
>> +#include <linux/of_irq.h>
>>   #include <linux/gpio/legacy-of-mm-gpiochip.h>
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/gpio/driver.h>
>> @@ -32,6 +33,8 @@ struct qe_gpio_chip {
>>
>>   	/* saved_regs used to restore dedicated functions */
>>   	struct qe_pio_regs saved_regs;
>> +
>> +	int irq[32];
>>   };
>>
>>   static void qe_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
>> @@ -141,6 +144,13 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>>   	return 0;
>>   }
>>
>> +static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
>> +{
>> +	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
>> +
>> +	return qe_gc->irq[gpio] ? : -ENXIO;
>> +}
>> +
>>   struct qe_pin {
>>   	/*
>>   	 * The qe_gpio_chip name is unfortunate, we should change that to
>> @@ -304,6 +314,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>>   	struct qe_gpio_chip *qe_gc;
>>   	struct of_mm_gpio_chip *mm_gc;
>>   	struct gpio_chip *gc;
>> +	u32 mask;
>>
>>   	qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
>>   	if (!qe_gc) {
>> @@ -313,6 +324,14 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>>
>>   	spin_lock_init(&qe_gc->lock);
>>
>> +	if (!of_property_read_u32(np, "fsl,qe-gpio-irq-mask", &mask)) {
> 
> AFAICT: you can drop the of.h include and just use
> device_property_present() here.

This line reads the value of the mask, I can't see how it can be 
replaced by device_property_present().

> 
>> +		int i, j;
>> +
>> +		for (i = 0, j = 0; i < 32; i++)
>> +			if (mask & (1 << (31 - i)))
>> +				qe_gc->irq[i] = irq_of_parse_and_map(np, j++);
>> +	}
>> +
>>   	mm_gc = &qe_gc->mm_gc;
>>   	gc = &mm_gc->gc;
>>
>> @@ -323,6 +342,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>>   	gc->get = qe_gpio_get;
>>   	gc->set = qe_gpio_set;
>>   	gc->set_multiple = qe_gpio_set_multiple;
>> +	gc->to_irq = qe_gpio_to_irq;
>>
>>   	ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
>>   	if (!ret)
>> --
>> 2.49.0
>>
>>
> 
> Bart


