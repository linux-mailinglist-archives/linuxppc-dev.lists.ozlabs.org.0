Return-Path: <linuxppc-dev+bounces-11427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45110B3A126
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 16:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCNpt13zgz2yqP;
	Fri, 29 Aug 2025 00:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756390838;
	cv=none; b=X3c4Zk8+0zmHGnCGepH7YuEFUu+S5SQog806Mw+veOmDHtafJWeCO9Stw72Fc4/AfIj83C4ntTRKvWRKGzx6K35WEI4Fvj1fi9ZFBjdnRNnvdEd7WUVxyFV7Xpl9ovQ3KXo6GFtdpIMgaeir9U6v7Nt9zCnTws9N+UEYYHU+5goozy27xkRpudgdaI7XjAwGNkiBwk4uuSeTEIGbGnv0KqJI/7gFkEsDVVsJaMsSQYAmNFmiLB0dPHiFjKdsIBOsLeOEfVCzjfimpxLChY1rPlO646xYTf7yLYlxp8mYX80U8sO72nCYF5fDEIQnVOniXSeVFzqmhWD5Hm3hh0qMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756390838; c=relaxed/relaxed;
	bh=kGjCeCCH2n29lw5ZPF5uqFUiwezgPm3FyUCTA9ovXwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7GW94e446gxl5akrnzOTxxQ7KKemls4ug8MQK2x4qeBRjYvwLH6t4wU4RWZowxnbTb7X/qZVvad5Y0x8BEtHTej/xms7VMxcb7zmIUNIbgjmHHohJMcatjoDl0RMaFnbrcBpCuDa6SPtt3QQruJxhNN1XBbmev8096ieLICjLWnEAoz02EczI5RmxbyTUHZj77RXCyYeYd2p666Kou05RDarTf+a9CGjJLHLcOPsGzaArpHyD4k/cNl8t9qDNujH5CmSHJY8C/ifaqvj4jYOgiiIz2nflozklULtV9/l79jwqbNX3igkUKQZaq6ZgCfD10UIVo64MfGrV7Sh4zZ0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCNps340Yz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 00:20:37 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cCNdk5SrLz9sSN;
	Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ctYw9B2ysKGN; Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cCNdk4lLRz9sSK;
	Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D9F48B764;
	Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id rt_hf7oHqOmD; Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0BB338B763;
	Thu, 28 Aug 2025 16:12:42 +0200 (CEST)
Message-ID: <f21e27da-de26-4835-9660-b39e99695281@csgroup.eu>
Date: Thu, 28 Aug 2025 16:12:41 +0200
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
To: Rob Herring <robh@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1756104334.git.christophe.leroy@csgroup.eu>
 <17636607f2beac3b64c87b3bec035fa27ce8d195.1756104334.git.christophe.leroy@csgroup.eu>
 <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 28/08/2025 à 15:28, Rob Herring a écrit :
> On Mon, Aug 25, 2025 at 2:20 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> In the QE, a few GPIOs are IRQ capable. Similarly to
>> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
>> GPIO"), add IRQ support to QE GPIO.
>>
>> Add property 'fsl,qe-gpio-irq-mask' similar to
>> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
> 
> Why do you need to know this? The ones that have interrupts will be
> referenced by an 'interrupts' property somewhere.

I don't follow you. The ones that have interrupts need to be reported by 
gc->qe_gpio_to_irq[] so that gpiod_to_irq() return the IRQ number, for 
instance to gpio_sysfs_request_irq() so that it can install an irq 
handler. I can't see where they would be referenced by an "interrupts" 
property.

> 
>> Here is an exemple for port B of mpc8323 which has IRQs for
> 
> typo
> 
>> GPIOs PB7, PB9, PB25 and PB27.
>>
>>          qe_pio_b: gpio-controller@1418 {
>>                  compatible = "fsl,mpc8323-qe-pario-bank";
>>                  reg = <0x1418 0x18>;
>>                  interrupts = <4 5 6 7>;
>>                  interrupt-parent = <&qepic>;
>>                  gpio-controller;
>>                  #gpio-cells = <2>;
>>                  fsl,qe-gpio-irq-mask = <0x01400050>;
>>          };
> 
> You are missing #interrupt-cells and interrupt-controller properties.

The gpio controller is not an interrupt controller. The GPIO controller 
is brought by patch 1/6 and documented in patch 6/6.

> 
> With multiple new properties, this should be converted to schema first.

Ah. I didn't know, and checkpatch.pl doesn't know either it seems.

Christophe


