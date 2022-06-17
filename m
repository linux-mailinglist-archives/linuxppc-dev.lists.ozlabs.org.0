Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA0B54F0B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 07:45:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPSgF2D1Jz3cdt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 15:45:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.128; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr [80.12.242.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPSfn2YgQz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 15:44:48 +1000 (AEST)
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 24fQokGfyP8Ap24fQoQhjx; Fri, 17 Jun 2022 07:37:15 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 17 Jun 2022 07:37:15 +0200
X-ME-IP: 90.11.190.129
Message-ID: <b42b4644-5c22-f39d-eb5b-b3a4d5404630@wanadoo.fr>
Date: Fri, 17 Jun 2022 07:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3] powerpc:85xx: Add missing of_node_put() in sgy_cst1000
Content-Language: en-US
To: Liang He <windhl@126.com>, oss@buserror.net, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20220617052214.4004188-1-windhl@126.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220617052214.4004188-1-windhl@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 17/06/2022 à 07:22, Liang He a écrit :
> In gpio_halt_probe(), of_find_matching_node() will return a node
> pointer with refcount incremented. We should use of_node_put() in
> fail path or when it is not used anymore.
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>   arch/powerpc/platforms/85xx/sgy_cts1000.c | 39 +++++++++++++++--------
>   1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/85xx/sgy_cts1000.c b/arch/powerpc/platforms/85xx/sgy_cts1000.c
> index 98ae64075193..a8690fc552cf 100644
> --- a/arch/powerpc/platforms/85xx/sgy_cts1000.c
> +++ b/arch/powerpc/platforms/85xx/sgy_cts1000.c
> @@ -71,33 +71,39 @@ static int gpio_halt_probe(struct platform_device *pdev)
>   {
>   	enum of_gpio_flags flags;
>   	struct device_node *node = pdev->dev.of_node;
> +	struct device_node *child_node;
>   	int gpio, err, irq;
>   	int trigger;
> +	int ret;
>   
>   	if (!node)
>   		return -ENODEV;
>   
>   	/* If there's no matching child, this isn't really an error */
> -	halt_node = of_find_matching_node(node, child_match);
> -	if (!halt_node)
> +	child_node = of_find_matching_node(node, child_match);
> +	if (!child_node)
>   		return 0;
>   
>   	/* Technically we could just read the first one, but punish
>   	 * DT writers for invalid form. */
> -	if (of_gpio_count(halt_node) != 1)
> -		return -EINVAL;
> +	if (of_gpio_count(child_node) != 1) {
> +		ret = -EINVAL;
> +		goto err_put;
> +	}
>   
>   	/* Get the gpio number relative to the dynamic base. */
> -	gpio = of_get_gpio_flags(halt_node, 0, &flags);
> -	if (!gpio_is_valid(gpio))
> -		return -EINVAL;
> +	gpio = of_get_gpio_flags(child_node, 0, &flags);
> +	if (!gpio_is_valid(gpio)) {
> +		ret = -EINVAL;
> +		gotot err_put;
> +	}
>   
>   	err = gpio_request(gpio, "gpio-halt");
>   	if (err) {
>   		printk(KERN_ERR "gpio-halt: error requesting GPIO %d.\n",
>   		       gpio);
> -		halt_node = NULL;
> -		return err;
> +		ret = err;

Sorry for not seeing and asking before, but why do you need 'ret'?
Can't you use the existing 'err' in place in this whole patch?

> +		goto err_put;
>   	}
>   
>   	trigger = (flags == OF_GPIO_ACTIVE_LOW);
> @@ -105,15 +111,15 @@ static int gpio_halt_probe(struct platform_device *pdev)
>   	gpio_direction_output(gpio, !trigger);
>   
>   	/* Now get the IRQ which tells us when the power button is hit */
> -	irq = irq_of_parse_and_map(halt_node, 0);
> +	irq = irq_of_parse_and_map(child_node, 0);
>   	err = request_irq(irq, gpio_halt_irq, IRQF_TRIGGER_RISING |
> -			  IRQF_TRIGGER_FALLING, "gpio-halt", halt_node);
> +			  IRQF_TRIGGER_FALLING, "gpio-halt", child_node);
>   	if (err) {
>   		printk(KERN_ERR "gpio-halt: error requesting IRQ %d for "
>   		       "GPIO %d.\n", irq, gpio);
>   		gpio_free(gpio);
> -		halt_node = NULL;
> -		return err;
> +		ret = err;
> +		goto err_put;
>   	}
>   
>   	/* Register our halt function */
> @@ -122,8 +128,12 @@ static int gpio_halt_probe(struct platform_device *pdev)
>   
>   	printk(KERN_INFO "gpio-halt: registered GPIO %d (%d trigger, %d"
>   	       " irq).\n", gpio, trigger, irq);
> +	ret = 0;
> +	halt_node = of_node_get(child_node);

LGTM, but my preferred style would be:
	halt_node = child_node;
	return 0;

I'm not a maintainer, so this is just my opinion and it is mostly a 
mater of taste.

CJ

>   
> -	return 0;
> +err_put:
> +	of_node_put(child_node);
> +	return ret;
>   }
>   
>   static int gpio_halt_remove(struct platform_device *pdev)
> @@ -139,6 +149,7 @@ static int gpio_halt_remove(struct platform_device *pdev)
>   
>   		gpio_free(gpio);
>   
> +		of_node_put(halt_node);
>   		halt_node = NULL;
>   	}
>   

