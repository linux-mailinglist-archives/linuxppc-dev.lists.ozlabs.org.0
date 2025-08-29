Return-Path: <linuxppc-dev+bounces-11481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB484B3B65C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 10:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCsRd3sVwz2ykc;
	Fri, 29 Aug 2025 18:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756457437;
	cv=none; b=KFAwvg16sOh9aPXYt70eDo8357qfo8ATAk4PxTuAA+hPg4fMhycuBEgiZrwtkdO9/TVs/CRcijmK2nIjPepCMIO7WUTDbYKtnyEUFzMNCk61cpwJEppAyBbxCMxKswRFeXF/jrCn7GZXF1AS3Fho8nKT3Uj/rMa1larptVQ70pToOiboM9yj+2Rv25IbD9Bc3BC7fCInW0xaTdA0JKgW3bPgF5Vm/XHAZh0z8Vvixbyza8Z/9oYJ9sB4vuYn2vb/k6g8ZJIqZBSUdMhPJoBnZuV/PX9jkwzcxPjUG7kP4E+Z7O0PbrPEq67s7gD7XhMg9FgHVWLBzR8cw4v4KY8Uyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756457437; c=relaxed/relaxed;
	bh=ZYp0LTc7f1Lq9YJK21JExDfotHPdleR/WErCcr4Lw84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iO24WC6944JbMOLTIME2aXUi5adsF1U/g0priQJtJI5t4YCi0dfg7zM2HU4RWp03vkSznncYTpfbtzKGeBm+HBov2aRJzoF8sMGdZjGNISj2kv5anBvZ0M0tknnIESN1hlfVETwIqcywO6WKpk2hEvCKbBVEmGN8dxbqVJ9ZUksg7sBmMJTk5R9RFq1wKJXaoDnkTRC+ExoowjQ1f6awpeLzlrFG5B/K8ibLt9MATDvkfq0mnsBSC5IG8KMmq3D555lwflbY/SFvyUMbQFLpkYl81+6GvWkZQtPafuBDmunUJtdwmnQEd5LZZMTxo/VCamlhekYh9Bbk57jNAlSDIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCsRc57JFz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 18:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cCs6D1Vmbz9sT1;
	Fri, 29 Aug 2025 10:35:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9NDmBDpyOOx; Fri, 29 Aug 2025 10:35:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cCs6D0Xh0z9sSr;
	Fri, 29 Aug 2025 10:35:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F40178B778;
	Fri, 29 Aug 2025 10:35:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uQqX3YFuqtHI; Fri, 29 Aug 2025 10:35:31 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 53B0A8B776;
	Fri, 29 Aug 2025 10:35:31 +0200 (CEST)
Message-ID: <1ba37df7-2d4a-4258-8220-58ee7d609264@csgroup.eu>
Date: Fri, 29 Aug 2025 10:35:31 +0200
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
Subject: Re: [PATCH v3 5/6] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1756104334.git.christophe.leroy@csgroup.eu>
 <17636607f2beac3b64c87b3bec035fa27ce8d195.1756104334.git.christophe.leroy@csgroup.eu>
 <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
 <f21e27da-de26-4835-9660-b39e99695281@csgroup.eu>
 <0f716362-07f4-4c79-bb0a-e71d2630a797@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <0f716362-07f4-4c79-bb0a-e71d2630a797@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 29/08/2025 à 09:47, Krzysztof Kozlowski a écrit :
> On 28/08/2025 16:12, Christophe Leroy wrote:
>>
>>
>> Le 28/08/2025 à 15:28, Rob Herring a écrit :
>>> On Mon, Aug 25, 2025 at 2:20 AM Christophe Leroy
>>> <christophe.leroy@csgroup.eu> wrote:
>>>>
>>>> In the QE, a few GPIOs are IRQ capable. Similarly to
>>>> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
>>>> GPIO"), add IRQ support to QE GPIO.
>>>>
>>>> Add property 'fsl,qe-gpio-irq-mask' similar to
>>>> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>>>
>>> Why do you need to know this? The ones that have interrupts will be
>>> referenced by an 'interrupts' property somewhere.
>>
>> I don't follow you. The ones that have interrupts need to be reported by
>> gc->qe_gpio_to_irq[] so that gpiod_to_irq() return the IRQ number, for
>> instance to gpio_sysfs_request_irq() so that it can install an irq
>> handler. I can't see where they would be referenced by an "interrupts"
>> property.
> 
> They would be referenced by every consumer of these interrupts. IOW,
> this property is completely redundant, because DT holds this information
> already in other place.

But the gpio controller _is_ the consumer of these interrupts, it it 
_not_ the provider.

The interrupts are provided by a separate interrupt controller. Let's 
take the exemple of powerpc 8xx. Here is the list of interrupts handled 
by the CPM interrupt controller on the 8xx:

1 - GPIO Port C Line 4 interrupt
2 - GPIO Port C Line 5 interrupt
3 - SMC2 Serial controller interrupt
4 - SMC1 Serial controller interrupt
5 - SPI controller interrupt
6 - GPIO Port C Line 6 interrupt
7 - Timer 4 interrupt
8 - SCCd Serial controller interrupt
9 - GPIO Port C Line 7 interrupt
10 - GPIO Port C Line 8 interrupt
11 - GPIO Port C Line 9 interrupt
12 - Timer 3 interrupt
13 - SCCc Serial controller interrupt
14 - GPIO Port C Line 10 interrupt
15 - GPIO Port C Line 11 interrupt
16 - I2C Controller interrupt
17 - RISC timer table interrupt
18 - Timer 2 interrupt
19 - SCCb Serial controller interrupt
20 - IDMA2 interrupt
21 - IDMA1 interrupt
22 - SDMA channel bus error interrupt
23 - GPIO Port C Line 12 interrupt
24 - GPIO Port C Line 13 interrupt
25 - Timer 1 interrupt
26 - GPIO Port C Line 14 interrupt
27 - SCCd Serial controller interrupt
28 - SCCc Serial controller interrupt
29 - SCCb Serial controller interrupt
30 - SCCa Serial controller interrupt
31 - GPIO Port C Line 15 interrupt

As you can see in the list, the GPIO line interrupts are nested with 
other types of interrupts so GPIO controller and Interrupt controller 
are to be keept independant.

That's more or less the same here with my series, patch 1 implements an 
interrupt controller (documented in patch 6) and then the GPIO 
controllers consume the interrupts, for instance in gpiolib functions 
gpio_sysfs_request_irq() [drivers/gpio/gpiolib-sysfs.c] or 
edge_detector_setup() or debounce_setup() [drivers/gpio/gpiolib-cdev.c]

External drivers also use interrupts indirectly. For example driver 
sound/soc/soc-jack.c, it doesn't have any direct reference to an 
interrupt. The driver is given an array of GPIOs and then installs an 
IRQ in function snd_soc_jack_add_gpios() by doing

	request_any_context_irq(gpiod_to_irq(gpios[i].desc),
					      gpio_handler,
					      IRQF_SHARED |
					      IRQF_TRIGGER_RISING |
					      IRQF_TRIGGER_FALLING,
					      gpios[i].name,
					      &gpios[i]);

> 
>>
>>>
>>>> Here is an exemple for port B of mpc8323 which has IRQs for
>>>
>>> typo
>>>
>>>> GPIOs PB7, PB9, PB25 and PB27.
>>>>
>>>>           qe_pio_b: gpio-controller@1418 {
>>>>                   compatible = "fsl,mpc8323-qe-pario-bank";
>>>>                   reg = <0x1418 0x18>;
>>>>                   interrupts = <4 5 6 7>;
>>>>                   interrupt-parent = <&qepic>;
>>>>                   gpio-controller;
>>>>                   #gpio-cells = <2>;
>>>>                   fsl,qe-gpio-irq-mask = <0x01400050>;
>>>>           };
>>>
>>> You are missing #interrupt-cells and interrupt-controller properties.
>>
>> The gpio controller is not an interrupt controller. The GPIO controller
>> is brought by patch 1/6 and documented in patch 6/6.
> 
> Then the IRQ mask property is not right here. If you say "this GPIOs
> have IRQs" it means this is an interrupt controller.

The mask tells to the GPIO controller which GPIO line has an interrupt 
(so it can install the edge detector) and which doesn't have an 
interrupt. The "interrupts" property gives a flat list of interrupts, 
the mask in the above example tells: interrupt 4 is for line 7, 
interrupt 5 is for line 9, interrupt 6 is for line 25, interrupt 7 is 
for line 27. Other lines don't have interrupts.

> 
> If you say this is not an interrupt controller, then you cannot have
> here interrupts per some GPIOs, obviously.

It has been working that way on powerpc 8xx for 8 years, since commit 
726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx GPIO")

I don't understand why you say you cannot have
here interrupts per some GPIOs. What am I missing ?

Thanks
Christophe

