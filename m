Return-Path: <linuxppc-dev+bounces-11099-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 737B9B2AF46
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 19:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5KHC6z0bz3cdn;
	Tue, 19 Aug 2025 03:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755537639;
	cv=none; b=IsqEnU4nACIT1iUyRIDr9KEUbeZEi44996tYd39rjr9o10yZWASAMDbIefTUuoEUNsVCDd5m6e7l9QCz8AtQJ8LNUnJeohG08GajoirsOjt4wqttZfyZTVZVMkfRYk/CerXCutKhygCluaOv08VqGDjoDj12DK6Vt3xQ7Hhvktg6K44lc0RspVl8hGEPf/YaN33NkxvURYh4XYbxzzIS6UmxnvYGHPE3fevETdksF6zH3tskXEVWqr7YeD2cnb1mndbUmTuIeDROUXovOAjCnGIENQhjQSLNhb6fffxzBrM5LAzECuBS9srWpW0RdFttoOMlXJDhkI1O6gK1B7Kgug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755537639; c=relaxed/relaxed;
	bh=JxaORI2tt4nM+VV8pHB99Q3gl2ljqCHzG6OK2bMQjwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvG5/XsWsIAJ0OKRYiCP0E05+7IFHRbEtLw+bfGA5G1ffzPI2OhBCqc4/57VABMR0Q/rl1eMCM9WUWFbnUGSNJVK/4fNM3Fpn8Lhw+48tLcaAGtvFMx1jJ17HskZobJaw5tYMdUXEnhG0XTzRbUug/Kbld2GWvMSwaTKs9amSr4aEo0SYs0y5iPNrLa87xcDeh+4TjRosV2F4e0VAau0llWH00xhwezpvMaTsLOzPa/3ZAvqGUpe/MKqiDaiHf+r5oHFz1EfJFYIWruQO35zN3QvuxduG8G9dM1ITpoz85lThXIoG9mIVP0naVsB8h97hGi9jcImIVEYze3rhyAmUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5KHC12cyz3cdm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 03:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c5K1X3wsYz9sSW;
	Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrZScAyopd0z; Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c5K1X2hLYz9sSV;
	Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 44EC58B764;
	Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aw5_3grXJjSH; Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9EC3B8B763;
	Mon, 18 Aug 2025 19:08:47 +0200 (CEST)
Message-ID: <732b5fb6-ec38-43d9-b544-b27802a844ab@csgroup.eu>
Date: Mon, 18 Aug 2025 19:08:47 +0200
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
Subject: Re: [PATCH v2 4/5] soc: fsl: qe: Add support of IRQ in QE GPIO
To: Conor Dooley <conor@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
 <cddc5e900b84826614a63b8b29a048c09dd20853.1755506608.git.christophe.leroy@csgroup.eu>
 <20250818-tyke-pungent-20d9ffd47ecc@spud>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250818-tyke-pungent-20d9ffd47ecc@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 18/08/2025 à 19:03, Conor Dooley a écrit :
> On Mon, Aug 18, 2025 at 10:45:57AM +0200, Christophe Leroy wrote:
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
>> v2: Document fsl,qe-gpio-irq-mask
>> ---
>>   .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 ++++++++++++++++++
>>   drivers/soc/fsl/qe/gpio.c                     | 20 +++++++++++++++++++
>>   2 files changed, 39 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
>> index 09b1b05fa677..9cd6e5ac2a7b 100644
>> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
>> @@ -32,6 +32,15 @@ Required properties:
>>     "fsl,mpc8323-qe-pario-bank".
>>   - reg : offset to the register set and its length.
>>   - gpio-controller : node to identify gpio controllers.
>> +Optional properties:
>> +- fsl,qe-gpio-irq-mask : For banks having interrupt capability this item tells
>> +  which ports have an associated interrupt (ports are listed in the same order
>> +  QE ports registers)
>> +- interrupts : This property provides the list of interrupt for each GPIO having
>> +  one as described by the fsl,cpm1-gpio-irq-mask property. There should be as
>> +  many interrupts as number of ones in the mask property. The first interrupt in
>> +  the list corresponds to the most significant bit of the mask.
>> +- interrupt-parent : Parent for the above interrupt property.
>>   
>>   Example:
>>   	qe_pio_a: gpio-controller@1400 {
>> @@ -42,6 +51,16 @@ Example:
>>   		gpio-controller;
>>   	  };
>>   
>> +	qe_pio_b: gpio-controller@1418 {
>> +		#gpio-cells = <2>;
>> +		compatible = "fsl,mpc8323-qe-pario-bank";
>> +		reg = <0x1418 0x18>;
>> +		interrupts = <4 5 6 7>;
>> +		fsl,qe-gpio-irq-mask = <0x01400050>;
>> +		interrupt-parent = <&qepic>;
>> +		gpio-controller;
>> +	  };
>> +
>>   	qe_pio_e: gpio-controller@1460 {
>>   		#gpio-cells = <2>;
>>   		compatible = "fsl,mpc8360-qe-pario-bank",
> 
> Why is there a binding change hiding in here alongside a driver one?

I did the same way as commit 726bd223105c ("powerpc/8xx: Adding support 
of IRQ in MPC8xx GPIO")

Should it be done differently ?

Thanks
Christophe

