Return-Path: <linuxppc-dev+bounces-8204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C2CAA5695
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 23:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znqpv2pqLz30GV;
	Thu,  1 May 2025 07:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746048039;
	cv=none; b=ViCWV3T7BpINalb1FYlqWZUmibvw+nzVO2sQhTdwgdGrxtsOSB07vB9lki7xxS8jo/kxgI7BxNoOukeb8Qj96jCfsdix4eLqHTwyhhePXVcK0C6iGHP39r9E7Ph3JTJdpIUgtYLH1JVrmjLj00ybXIYPOQ9PZRMpJciRpabBzWMXLEd5m5Sct9qkZodthHoJoehyc6VroubK6vCKjubjgLhbx8fsqK1toYu+LRaLD6WyquMOWxamjPsoE+23MYu+Ps7Vj0OQwCfyhI9fqwoCOTAFGIFqztPzEJTSLSu0Iz6MQLPpP4ZBLV03yZ0tjToZRfU8qpnl9F3G5rkhwtRTug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746048039; c=relaxed/relaxed;
	bh=bkk6DaO4HSKsfRYipXrrmATAVoEB68gW7b6brBJhoGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TD9KNCk1PglrI8pAo8RZB61Isg3Z88RUaFNxB3WpNsFQVncZxkYUbg2fP/mUa4nnOMITeb51ZKhnZ2eVxnR6FrpSaDfBTqarwf3anoXrzDZSNwWVPktcBkrSmImuu/74VytiKTFq7vO3grpY2zM+VfQ/zzYaLxn5CI+5/oMHZDVNZMJ2wLi+jJTq5WsuGm6d4ZJC/yQVheyxbRwRl43sueARad09roKqn28tt4mnzJ3eOR+Q72180hRqGXRFveXdF07HcBrVnlI9qNC0kSad3S6myEosH2qemInaWlg2/hLbc7rVdiQVf47Ge7bzVd6eC2/co6xTnDTyFgf47ItmQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znqpt56B1z304Z
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 07:20:38 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Znkpn2cG4z9sgJ;
	Wed, 30 Apr 2025 19:35:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dAsYUwx7dfLd; Wed, 30 Apr 2025 19:35:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Znkpn1gckz9sfW;
	Wed, 30 Apr 2025 19:35:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 31F988B765;
	Wed, 30 Apr 2025 19:35:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7luFV74bg8tK; Wed, 30 Apr 2025 19:35:13 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 508E88B763;
	Wed, 30 Apr 2025 19:35:12 +0200 (CEST)
Message-ID: <0b2ca5c5-cad2-46f1-bc3a-f69d926443e9@csgroup.eu>
Date: Wed, 30 Apr 2025 19:35:11 +0200
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
Subject: Re: [PATCH 1/5] powerpc: sysdev/gpio: use new line value setter
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
 <20250408-gpiochip-set-rv-powerpc-v1-1-73dc1ebc6ef1@linaro.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-1-73dc1ebc6ef1@linaro.org>
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
>   arch/powerpc/sysdev/cpm_common.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/cpm_common.c b/arch/powerpc/sysdev/cpm_common.c
> index 47db732981a8..e22fc638dbc7 100644
> --- a/arch/powerpc/sysdev/cpm_common.c
> +++ b/arch/powerpc/sysdev/cpm_common.c
> @@ -138,7 +138,7 @@ static void __cpm2_gpio32_set(struct of_mm_gpio_chip *mm_gc, u32 pin_mask,
>   	out_be32(&iop->dat, cpm2_gc->cpdata);
>   }
>   
> -static void cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
> +static int cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
>   {
>   	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
>   	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(gc);
> @@ -150,6 +150,8 @@ static void cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
>   	__cpm2_gpio32_set(mm_gc, pin_mask, value);
>   
>   	spin_unlock_irqrestore(&cpm2_gc->lock, flags);
> +
> +	return 0;
>   }
>   
>   static int cpm2_gpio32_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
> @@ -208,7 +210,7 @@ int cpm2_gpiochip_add32(struct device *dev)
>   	gc->direction_input = cpm2_gpio32_dir_in;
>   	gc->direction_output = cpm2_gpio32_dir_out;
>   	gc->get = cpm2_gpio32_get;
> -	gc->set = cpm2_gpio32_set;
> +	gc->set_rv = cpm2_gpio32_set;
>   	gc->parent = dev;
>   	gc->owner = THIS_MODULE;
>   
> 


