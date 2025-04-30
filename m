Return-Path: <linuxppc-dev+bounces-8207-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A0FAA5950
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 May 2025 03:20:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znx7s5Mfcz3blg;
	Thu,  1 May 2025 11:20:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746062441;
	cv=none; b=ghJwyjfOXQx8dvf1vM6Zh4Cl6Z5RkiPZKNnj5EYolBXITcyJHhQwjK8iPeJ208Uqxzk0NlGYSRmJQ+ikkD2w2kFSF30QZYX96cquoCFVEX5TV9TRocnwyX6QNoajyGdmOkD7Afdwr0pxPhvh9dfACWTVGydWOyndPv5gFzLW+3qwKDiI74cmJngcZ6vnke2X/Xmuvj6T4iMGGM7PxH+EiGttEzO0/e+OLXeuVblnkjRa/Opwn26GFXGqTTx1DJN3EYY6Rj7ZtiVF1bO8+6GhNLpvurvQVT1WUnX2C791Vz8fgAaOV5r/5WhgTY+oRf/kCYoY4UQzLsKgTfO3qPdScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746062441; c=relaxed/relaxed;
	bh=bjTn7kRhjlVHa2rnLBNQ8D0thkEYJVGM1E5YblYCgx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KmhpznnjsuKUi13k0bl2HLWxwRmxXdiWNoiSQ65pJKm9J3pGe9LUjG6K29Jb2peCHlleIhRi8DiFYQGvnmkysU2tgo+SXaOyxhkeeclYhsNNOWLWk0Z3CAggzK3qe6LtOrDmiSYaFT1XWyYpu1efXpC5axqN3a7QdEprcxY5iKeum8PPN0LebJBuW/JT1ac1aVijLafFiVQvI0Mdv4yOgNvJ9mjdfS2JiIrSKMqwds0DILBNvm6kiUZ6gptcoWqHFMsUWCyiyzgi46C8lb/NmHlQftackTmi3BJd7rmnhORQ62XfacXqF6qYipKex6koqfbswmbzFT7EytQ1Ebwkwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znx7s1gZ2z2ygL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 11:20:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Znkq45ny8z9sgs;
	Wed, 30 Apr 2025 19:35:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqe3FYWY-FyS; Wed, 30 Apr 2025 19:35:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Znkq40BnRz9sgR;
	Wed, 30 Apr 2025 19:35:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 009548B765;
	Wed, 30 Apr 2025 19:35:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id g5LcEjKmwqYi; Wed, 30 Apr 2025 19:35:27 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D3A228B763;
	Wed, 30 Apr 2025 19:35:26 +0200 (CEST)
Message-ID: <fab558c6-0403-45f4-97c3-9c71db678a20@csgroup.eu>
Date: Wed, 30 Apr 2025 19:35:26 +0200
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
Subject: Re: [PATCH 3/5] powerpc: 44x/gpio: use new line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
 <20250408-gpiochip-set-rv-powerpc-v1-3-73dc1ebc6ef1@linaro.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-3-73dc1ebc6ef1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 08/04/2025 à 09:21, Bartosz Golaszewski a écrit :
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/platforms/44x/gpio.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/44x/gpio.c b/arch/powerpc/platforms/44x/gpio.c
> index e5f2319e5cbe..d540e261d85a 100644
> --- a/arch/powerpc/platforms/44x/gpio.c
> +++ b/arch/powerpc/platforms/44x/gpio.c
> @@ -75,8 +75,7 @@ __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   		clrbits32(&regs->or, GPIO_MASK(gpio));
>   }
>   
> -static void
> -ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   {
>   	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
>   	unsigned long flags;
> @@ -88,6 +87,8 @@ ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   	spin_unlock_irqrestore(&chip->lock, flags);
>   
>   	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
> +
> +	return 0;
>   }
>   
>   static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
> @@ -179,7 +180,7 @@ static int __init ppc4xx_add_gpiochips(void)
>   		gc->direction_input = ppc4xx_gpio_dir_in;
>   		gc->direction_output = ppc4xx_gpio_dir_out;
>   		gc->get = ppc4xx_gpio_get;
> -		gc->set = ppc4xx_gpio_set;
> +		gc->set_rv = ppc4xx_gpio_set;
>   
>   		ret = of_mm_gpiochip_add_data(np, mm_gc, ppc4xx_gc);
>   		if (ret)
> 


