Return-Path: <linuxppc-dev+bounces-11471-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B72A1B3B4A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 09:47:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCr3K1g0wz2ykc;
	Fri, 29 Aug 2025 17:47:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756453677;
	cv=none; b=CfcVO8SdI1KqB2p63wldaGhvkKNwRPRgiADdaG3lkWNB3bDOI58rO4UD2TNu0+/FW2GIjL0nQ1T4pHmuCPKjQqmeHukpwK1cbBA3zJ5LayBNRbJycOGKzYKhpTVnY3iPW45fMVLzXGuTeJuI+00FgdYsxUDN2qnjBSHQDLKt5TylCxgiaVd0lLKc3PcqnPNV9HeoEB75ZdYnFx6YGlMIaPElls/26AGV+ND1Sl2p7huhcXvDui3/PooqxllCZO6D7ZK659Zy6zi2Hevk7A40UYDPUXnbYopPFwzJS7Dw5b1x3F/C2ToiJI0Bm1s5ovNJD4c+6SVWcV52S6QrMV9F0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756453677; c=relaxed/relaxed;
	bh=GSSU/7YUmLysPQh7KSt0KtsFavc1CTYp3otbrQJhgCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCm5YTDg3xeZ4z5NW9HQYvxdIE4puI0Wea4YtmPRsU3JVmX0OpYUqlzVwC3rboyyxPdlE1UUJy75hZRHE8Ol92jlpufMrOFtzd4k7YmoJscoCfgSN2scEDbCVAnwmA86y4aG1yztFFBWlTtegO6gUx2NeAvccHdkgPyt9AibIG5xsvMRYEuWi7FacH0KtYs/K8p4ju/EU3uW6RnFuFaIip1JSY5ck31p612Dpa6BX5s2ONcLfAYnuPTJqKV6iMgoiGRHt02lpTuF4aNEjNIwxYfoBAWaGJIFBmyGkFaEXL+AY6Yen785n5vRgLE+b4unRx52xukV5sVIOtN8pmkwbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UoKFCMZl; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UoKFCMZl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCr3J2S5tz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 17:47:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E350C401C4;
	Fri, 29 Aug 2025 07:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D2DC4CEF0;
	Fri, 29 Aug 2025 07:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756453673;
	bh=gCbRk9xzyu+2hoWKBy3FsZe0DLlpKUqrn8XkcEjrLfU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UoKFCMZlFXgKPPQihwSAddcP+lF6qPigHrYFhBWK22xq9W9PaY3RubjMJCb+++QU6
	 YKu6PKhP7t2kxr2PuaUI3oWS3RnoPLUmJevRckZQWuEyW4LgNIFcjJ4RZINARPsX6R
	 liqlZgIwO+SR33v7jYpPIKFjQFSwXVhvMKheq7l+mp91pPT/shcQcbLeIUfVuvgQB7
	 RXJZdqKjcj3VGRInxQWprCSxe5vwShCXvpS/z+lWmOhpBu2LExrZo636qUVpTnUDpY
	 dXwSj79YkjaKQMQgOV6Rdc8CL/iOR9DrmhxyDh23aQ/N4CSPlAR8L2ajcBSud3pRbP
	 eoUbBM5pBQJEA==
Message-ID: <0f716362-07f4-4c79-bb0a-e71d2630a797@kernel.org>
Date: Fri, 29 Aug 2025 09:47:48 +0200
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
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rob Herring <robh@kernel.org>
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <f21e27da-de26-4835-9660-b39e99695281@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 28/08/2025 16:12, Christophe Leroy wrote:
> 
> 
> Le 28/08/2025 à 15:28, Rob Herring a écrit :
>> On Mon, Aug 25, 2025 at 2:20 AM Christophe Leroy
>> <christophe.leroy@csgroup.eu> wrote:
>>>
>>> In the QE, a few GPIOs are IRQ capable. Similarly to
>>> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
>>> GPIO"), add IRQ support to QE GPIO.
>>>
>>> Add property 'fsl,qe-gpio-irq-mask' similar to
>>> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>>
>> Why do you need to know this? The ones that have interrupts will be
>> referenced by an 'interrupts' property somewhere.
> 
> I don't follow you. The ones that have interrupts need to be reported by 
> gc->qe_gpio_to_irq[] so that gpiod_to_irq() return the IRQ number, for 
> instance to gpio_sysfs_request_irq() so that it can install an irq 
> handler. I can't see where they would be referenced by an "interrupts" 
> property.

They would be referenced by every consumer of these interrupts. IOW,
this property is completely redundant, because DT holds this information
already in other place.

> 
>>
>>> Here is an exemple for port B of mpc8323 which has IRQs for
>>
>> typo
>>
>>> GPIOs PB7, PB9, PB25 and PB27.
>>>
>>>          qe_pio_b: gpio-controller@1418 {
>>>                  compatible = "fsl,mpc8323-qe-pario-bank";
>>>                  reg = <0x1418 0x18>;
>>>                  interrupts = <4 5 6 7>;
>>>                  interrupt-parent = <&qepic>;
>>>                  gpio-controller;
>>>                  #gpio-cells = <2>;
>>>                  fsl,qe-gpio-irq-mask = <0x01400050>;
>>>          };
>>
>> You are missing #interrupt-cells and interrupt-controller properties.
> 
> The gpio controller is not an interrupt controller. The GPIO controller 
> is brought by patch 1/6 and documented in patch 6/6.

Then the IRQ mask property is not right here. If you say "this GPIOs
have IRQs" it means this is an interrupt controller.

If you say this is not an interrupt controller, then you cannot have
here interrupts per some GPIOs, obviously.


Best regards,
Krzysztof

