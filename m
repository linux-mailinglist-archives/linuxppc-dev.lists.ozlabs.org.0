Return-Path: <linuxppc-dev+bounces-8206-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 598D8AA594F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 May 2025 03:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znx7n1cykz30Jc;
	Thu,  1 May 2025 11:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746062437;
	cv=none; b=mSMedEwDuotycRmEQOcGqcZ5R+8MvkWsbjrWC66ab2YjCdgLZzBPMVbvd4KxSQ+/9opKACVemPoGnhwUQxxgBKHg0mgZPvBYvffYswdPDjmWfZLMRtSVrnWnwmgYR1fsBt9D6dOzwt/u+sNrrlVJsx9rKx0y767IqDcKB7pFf2SNUZP5NSpak6rLWmZ5kOyLBN6bscXQhXii0UDsxWk0pyk9nty5YHVKyW4FORC5kRxD07t1hK71nNfrh7G3bpcZmnzec3fAbQctBnfh0AFpc9j5AW1dtpW639KAcNbHlEmeLdAHCjT4iBmz2GQSCKLQWVon8PxzlpGSZsaqLcKxfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746062437; c=relaxed/relaxed;
	bh=BAu52AYdix/V9RSufhycf1X7fvKFn3BiPPyS0EgLWQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbjbHZpw6T6oCszUL7rlkUBIaM9U8dr/+nOK++TNEdbitOy0RfMCKL4uVG/+nBZa4gMC/Fc97W8mEcRjWYx+K7UTkZVskOruj2PJBd2NZ1JJfF/xFnqM+FaQ2ApPgmjY1icE/q3B0JxWU8T2/irFH+/Nbs/b3e1imdG71riOU3EfO+KjI4yvVs3PukTqN3tL9gM6XcNbvJ4oZ9QqvMeViP5qLM2dbXVLqdiZ+qgah1fMRIpd8rlj1+xbvom5/VoKmms/OG+rKFI1473Y7ebjr7e4P68myXnr6W0MfX29q3cKa0Tknf+zA+3jd446lfMKfs6r1UCS8TjUoR8hkvOs+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znx7m3mr5z2ygL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 11:20:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZnkqN2kqkz9sjs;
	Wed, 30 Apr 2025 19:35:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Qa8SuqShg7C; Wed, 30 Apr 2025 19:35:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZnkqN1zfNz9sj6;
	Wed, 30 Apr 2025 19:35:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E48B8B765;
	Wed, 30 Apr 2025 19:35:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 11LIMd6Z3cYq; Wed, 30 Apr 2025 19:35:44 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C1928B763;
	Wed, 30 Apr 2025 19:35:43 +0200 (CEST)
Message-ID: <95e42755-13ad-4659-903f-5f087926c0a1@csgroup.eu>
Date: Wed, 30 Apr 2025 19:35:42 +0200
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
Subject: Re: [PATCH 4/5] powerpc: 52xx/gpio: use new line value setter
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
 <20250408-gpiochip-set-rv-powerpc-v1-4-73dc1ebc6ef1@linaro.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-4-73dc1ebc6ef1@linaro.org>
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
>   arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
> index 1ea591ec6083..c96af6b0eab4 100644
> --- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
> +++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
> @@ -280,7 +280,7 @@ static int mpc52xx_gpt_gpio_get(struct gpio_chip *gc, unsigned int gpio)
>   	return (in_be32(&gpt->regs->status) >> 8) & 1;
>   }
>   
> -static void
> +static int
>   mpc52xx_gpt_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v)
>   {
>   	struct mpc52xx_gpt_priv *gpt = gpiochip_get_data(gc);
> @@ -293,6 +293,8 @@ mpc52xx_gpt_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v)
>   	raw_spin_lock_irqsave(&gpt->lock, flags);
>   	clrsetbits_be32(&gpt->regs->mode, MPC52xx_GPT_MODE_GPIO_MASK, r);
>   	raw_spin_unlock_irqrestore(&gpt->lock, flags);
> +
> +	return 0;
>   }
>   
>   static int mpc52xx_gpt_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
> @@ -334,7 +336,7 @@ static void mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt)
>   	gpt->gc.direction_input  = mpc52xx_gpt_gpio_dir_in;
>   	gpt->gc.direction_output = mpc52xx_gpt_gpio_dir_out;
>   	gpt->gc.get = mpc52xx_gpt_gpio_get;
> -	gpt->gc.set = mpc52xx_gpt_gpio_set;
> +	gpt->gc.set_rv = mpc52xx_gpt_gpio_set;
>   	gpt->gc.base = -1;
>   	gpt->gc.parent = gpt->dev;
>   
> 


