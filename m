Return-Path: <linuxppc-dev+bounces-11485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBD3B3B93B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 12:51:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCw6x5hMxz2xgX;
	Fri, 29 Aug 2025 20:51:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756464681;
	cv=none; b=HxriuBgLf6MbR9nDkx3SWpdd9ZfsvFGD2cFC3hCZds+tIvfMCmC7VogEvuwmlXFbV20ZmfiQseTm41UXHJTpNmz/yhkPHLKOB4ChrnOJKBjiJsD5wocScBF/wIFpKiKUV5B7h+v80gYw/EMf5ZizD+PZ37HlXTu742+47YYykylFk4S0maE8KiCVBRz5Qc0NfPennpe/jEVHD8Q1V11+8lORbiBmBnNj96IagsLzi3bb1vgDFMmLNyluiTePzEnQfspvsdJW1zOgPhk220VN7HdZ2403wPF6TLALeDY9+DYNVXo/yk6l6lxuuzBQl8gYwBCz/xj9QFcBlWZCTpbWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756464681; c=relaxed/relaxed;
	bh=bYnBr8r6c21ca60+U3T3/s+Y9/GMQ/LaRaA3LF/la8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8YsJPvtrnnf7gLN+uDb7Jj1D8CWljfKBeoKYHuaTjUGCfhx2w4SfXixyRfZ615BrfiwzD+XD2urwN3SyT5CR5/hCHmv94stWQPnmMhDDfwHk7q8cfc8BfFJNs+eaXsJfb/FCURlxx6x9o4WcR1/oxT4Lt+ah+vQrVdQMiSRIuc9K0BcCivPjLEbkSbWrfZ9W5mRULgJWeh1ayL6Vke7KXBl74CNWJptaOiBcHejxFwpguBcdVu9k5I9p+AVpPBhjCOQlSy2T+FvpSsvw97yv6V4VedWoxLHfVEgMv38kqNG2x8PgIyKSsCs4zR1zzfAXzLBrkVg07fL7q0lfaeHFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LQwVDWIH; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LQwVDWIH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCw6w6DN4z2xWP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 20:51:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C46FF4542B;
	Fri, 29 Aug 2025 10:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806D2C4CEF0;
	Fri, 29 Aug 2025 10:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756464677;
	bh=+QsysON+6yRXfht3SSQ9NdAWxzxbXXdbaMGso6HoALs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LQwVDWIH+/Qu6JVgq6u/kmBGTQ0szc2u6O1Y980dbmif03eUdGf9Ffa+hQYghUTym
	 9Lz+S0+sroN2vzaMxk4zIiev2rCF7ZbPHbJ5fS+V2sTdX2Cvl5+yN2GByDhGPzlWqM
	 gqfnX/gpIRPHi0LFF4WE/qzaDYW5U6LBzk2pf36nhHC6QEVALjV2AeV2hVKvEDUaAY
	 p2K7Ls6F16mtaJ1lhY4+SSi4gTu6P4Llo3blGpDTR8r3zwkV0vFn6qFIpuOZmmkn1r
	 qa5LsZGWqXtDT0HdY5O54iKmYQbRWHPVt8B/k0a6HflOcsSdn/b7lyg47/Qd/LHzAI
	 F5FXz8bmRP8RA==
Message-ID: <3a2475f8-6373-4dd1-b605-b58c74a97fee@kernel.org>
Date: Fri, 29 Aug 2025 12:51:12 +0200
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
 <0f716362-07f4-4c79-bb0a-e71d2630a797@kernel.org>
 <1ba37df7-2d4a-4258-8220-58ee7d609264@csgroup.eu>
 <c314b7c6-f5b7-4f3e-8d67-e3c92ff8ff37@kernel.org>
 <bf5444e4-8f3f-4a56-be67-29857726b119@csgroup.eu>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <bf5444e4-8f3f-4a56-be67-29857726b119@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29/08/2025 11:41, Christophe Leroy wrote:
>>>
>>> That's more or less the same here with my series, patch 1 implements an
>>> interrupt controller (documented in patch 6) and then the GPIO
>>> controllers consume the interrupts, for instance in gpiolib functions
>>> gpio_sysfs_request_irq() [drivers/gpio/gpiolib-sysfs.c] or
>>> edge_detector_setup() or debounce_setup() [drivers/gpio/gpiolib-cdev.c]
>>>
>>> External drivers also use interrupts indirectly. For example driver
>>> sound/soc/soc-jack.c, it doesn't have any direct reference to an
>>> interrupt. The driver is given an array of GPIOs and then installs an
>>> IRQ in function snd_soc_jack_add_gpios() by doing
>>>
>>> 	request_any_context_irq(gpiod_to_irq(gpios[i].desc),
>>> 					      gpio_handler,
>>> 					      IRQF_SHARED |
>>> 					      IRQF_TRIGGER_RISING |
>>> 					      IRQF_TRIGGER_FALLING,
>>> 					      gpios[i].name,
>>> 					      &gpios[i]);
>>
>>
>> External drivers do not matter then. Your GPIO controller receives
>> specific interrupts (that's the interrupt property) and knows exactly
>> how each GPIO maps to it.
>>
> 
> Do you mean then that the GPIO driver should already know which line has 

The SoC knows, that's fixed information, so shall GPIO driver know as well.

> an interrupt and which one doesn't ?
> 
> The interrupts are fixed per soc, but today the GPIO driver is generic 
> and used on different SOCs that don't have interrupts on the same lines. 

How you write drivers is one thing, but that's never a reason alone to
add properties to the DT.

> And even on the given SOCs, not all ports have interrupts on the same 

That's pretty standard between all GPIO/pinctrl drivers. I would
generalize that's pretty standard for all SoCs - they have differences
within devices, some pins do that, some do different things.

> lines. Should all possibilities be hard-coded inside the driver for each 
> possible compatible ? The property 'fsl,qe-gpio-irq-mask' is there to 

There are many ways how to do it in the driver, that feels like one of
them, so yes, it should.

> avoid that and keep the GPIO driver as generic as possible with a single 

Sorry, that approach, which leads to moving such stuff to DT, was many
times on mailing list rejected. You use the same argument as that "one
clock, one device node" TI approach. It got it way to kernel long time
ago but since then was pretty discouraged (rejected for new SoCs). It
re-appeared again few months ago in a form of "I have two registers, so
I have two device nodes in DT", so it seems poor code keeps re-appearing.

> compatible 'fsl,mpc8323-qe-pario-bank' that is found in the DTS of 8323 
> but also in DTS of 8360, in DTS of 8569, etc... :
> 
> arch/powerpc/boot/dts/fsl/mpc8569mds.dts: 
>              "fsl,mpc8323-qe-pario-bank";
> arch/powerpc/boot/dts/fsl/mpc8569mds.dts: 
>              "fsl,mpc8323-qe-pario-bank";
> arch/powerpc/boot/dts/kmeter1.dts: 
>      "fsl,mpc8323-qe-pario-bank";
> arch/powerpc/boot/dts/mpc832x_rdb.dts: 
> compatible = "fsl,mpc8323-qe-pario-bank";
> arch/powerpc/boot/dts/mpc836x_rdk.dts: 
> "fsl,mpc8323-qe-pario-bank";
> arch/powerpc/boot/dts/mpc836x_rdk.dts: 
> "fsl,mpc8323-qe-pario-bank";
> 
> Do you mean we should define one compatible for each of the ports of 
> each soc, and encode the mask of interrupts that define which line of 
> the port has interrupts in the data field ?

I don't know that good your hardware to tell.

> 
> Something like:
> 
> static const struct of_device_id qe_gpio_match[] = {
> 	{
> 		.compatible = "fsl,mpc8323-qe-pario-bank-a",
> 		.data = (void *)0x00a00028,

There is no DTS in your patchset, so I cannot help really. I just don't
have time to imagine such DTS and try to figure out how it can be
written. Posting complete picture usually helps.

I don't follow what is the bank.

You have a device, yes?
It has some grouped GPIOs (banks?) and some within group/bank can handle
interrupts?
Are these fixed per SoC? Yes. Well, that's standard and every other
vendor has the same. They solve it in the drivers differently, though.

> 	},
> 	{
> 		.compatible = "fsl,mpc8323-qe-pario-bank-b",
> 		.data = (void *)0x01400050,
> 	},
> 	{
> 		.compatible = "fsl,mpc8323-qe-pario-bank-c",
> 		.data = (void *)0x00000084,
> 	},
> 	{
> 		.compatible = "fsl,mpc8323-qe-pario-bank-d",
> 		.data = (void *)0,
> 	},
> 	{
> 		.compatible = "fsl,mpc8360-qe-pario-bank-a",
> 		.data = (void *)0xXXXXXXXX,
> 	},
> 	{
> 		.compatible = "fsl,mpc8360-qe-pario-bank-b",
> 		.data = (void *)0xXXXXXXXX,
> 	},
> ....
> 	{},
> };
> MODULE_DEVICE_TABLE(of, qe_gpio_match);
> 
> That would be feasible but would mean updating the driver each time a 
> new SOC is added.

BTW, like every other platform.

> 
> Do you mean it should be done that way ?
> 
> Isn't the purpose of the device tree to keep drivers as generic as 
> possible ?

Not at all, sorry. The purpose of DT is not to keep drivers generic.


Best regards,
Krzysztof

