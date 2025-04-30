Return-Path: <linuxppc-dev+bounces-8201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46831AA54A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 21:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znn8Q5m2xz2xsM;
	Thu,  1 May 2025 05:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746040838;
	cv=none; b=h7CnH0DYiu9dyfgWU/uZNjfzyRJW1Vn3zrwAtE1uqDaWx72/IeGEjIUm1qW09gN/4iYPG7etEbDKpv7xmOZRwvM2RN1kZzTtH97+hn0YGCG5rKErAZMCB/hZdoL5Wf7VmdcHlcZOiDrjFxvjedP0PkXCvqiWVafEnK0IvTfP5x+niBwFvhhn6W3HjE+oFvAXz12sF+fy5Ctbr8FNmtlw4kIxS8c0JoEqJfM0vtG00mMhYRo55m+pNhWo9xycY4mpvCIVS5xsm3T0eXjC7GZ4lI5fW7EGrDQft3Za65ldomnPCSHJVV6qeuJ1kqeWf4BjQ9GNr8Ao4CtSUGxJQ031rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746040838; c=relaxed/relaxed;
	bh=popWrG3homQiW4dOh5HTPDJf1gH8DH/aYewAu+wAVPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5V4fPQJ1ndiCjShuC+YoXvMW0YceNH6205o/cPPM5ttcIICyz02jQA8sicz5FQmUrLlp/REP8myPVP6K5kM76g7zYRh4XBkjWa1bTanuerJs3cuV357ktC0EaZl9EXkGFRnAOOH1w1eZe2pFJIkvnto4lxoWO8S1UwoSy0aL+aMkPU0Vbt+0c8bGb+jcEwklB4MvXpzA0DY+x7kPY2WLNj5aOCdJPQ9nVbLIotFLwJERc+K+7SbJrxLkLTCr5C0Wqd6pKQu8nWCLoe3w+4hFX/RO8erbzCZ4qZeodQpj7rxCXoYxDIjfX5/gnBBG/XFVEyRFN4wBFvSEj5OItgciQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znn8P5M4Zz2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 05:20:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZnkrJ2Shnz9sl0;
	Wed, 30 Apr 2025 19:36:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3u-FPeOjPKNM; Wed, 30 Apr 2025 19:36:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZnkrJ1grhz9skH;
	Wed, 30 Apr 2025 19:36:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 32BE38B765;
	Wed, 30 Apr 2025 19:36:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id PhPau0Aadfr3; Wed, 30 Apr 2025 19:36:32 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1BA5B8B763;
	Wed, 30 Apr 2025 19:36:31 +0200 (CEST)
Message-ID: <6ed2d6a4-e957-44ad-b498-8b22425da5f5@csgroup.eu>
Date: Wed, 30 Apr 2025 19:36:30 +0200
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
Subject: Re: [PATCH 5/5] powerpc: 8xx/gpio: use new line value setter
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
 <20250408-gpiochip-set-rv-powerpc-v1-5-73dc1ebc6ef1@linaro.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-5-73dc1ebc6ef1@linaro.org>
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
Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu> # powerpc 8xx

> ---
>   arch/powerpc/platforms/8xx/cpm1.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
> index 1dc095ad48fc..7462c221115c 100644
> --- a/arch/powerpc/platforms/8xx/cpm1.c
> +++ b/arch/powerpc/platforms/8xx/cpm1.c
> @@ -417,7 +417,7 @@ static void __cpm1_gpio16_set(struct cpm1_gpio16_chip *cpm1_gc, u16 pin_mask, in
>   	out_be16(&iop->dat, cpm1_gc->cpdata);
>   }
>   
> -static void cpm1_gpio16_set(struct gpio_chip *gc, unsigned int gpio, int value)
> +static int cpm1_gpio16_set(struct gpio_chip *gc, unsigned int gpio, int value)
>   {
>   	struct cpm1_gpio16_chip *cpm1_gc = gpiochip_get_data(gc);
>   	unsigned long flags;
> @@ -428,6 +428,8 @@ static void cpm1_gpio16_set(struct gpio_chip *gc, unsigned int gpio, int value)
>   	__cpm1_gpio16_set(cpm1_gc, pin_mask, value);
>   
>   	spin_unlock_irqrestore(&cpm1_gc->lock, flags);
> +
> +	return 0;
>   }
>   
>   static int cpm1_gpio16_to_irq(struct gpio_chip *gc, unsigned int gpio)
> @@ -497,7 +499,7 @@ int cpm1_gpiochip_add16(struct device *dev)
>   	gc->direction_input = cpm1_gpio16_dir_in;
>   	gc->direction_output = cpm1_gpio16_dir_out;
>   	gc->get = cpm1_gpio16_get;
> -	gc->set = cpm1_gpio16_set;
> +	gc->set_rv = cpm1_gpio16_set;
>   	gc->to_irq = cpm1_gpio16_to_irq;
>   	gc->parent = dev;
>   	gc->owner = THIS_MODULE;
> @@ -554,7 +556,7 @@ static void __cpm1_gpio32_set(struct cpm1_gpio32_chip *cpm1_gc, u32 pin_mask, in
>   	out_be32(&iop->dat, cpm1_gc->cpdata);
>   }
>   
> -static void cpm1_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
> +static int cpm1_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
>   {
>   	struct cpm1_gpio32_chip *cpm1_gc = gpiochip_get_data(gc);
>   	unsigned long flags;
> @@ -565,6 +567,8 @@ static void cpm1_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
>   	__cpm1_gpio32_set(cpm1_gc, pin_mask, value);
>   
>   	spin_unlock_irqrestore(&cpm1_gc->lock, flags);
> +
> +	return 0;
>   }
>   
>   static int cpm1_gpio32_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
> @@ -618,7 +622,7 @@ int cpm1_gpiochip_add32(struct device *dev)
>   	gc->direction_input = cpm1_gpio32_dir_in;
>   	gc->direction_output = cpm1_gpio32_dir_out;
>   	gc->get = cpm1_gpio32_get;
> -	gc->set = cpm1_gpio32_set;
> +	gc->set_rv = cpm1_gpio32_set;
>   	gc->parent = dev;
>   	gc->owner = THIS_MODULE;
>   
> 


