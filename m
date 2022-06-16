Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A075A54E9BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 21:02:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPBPh4cZzz3cFr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 05:02:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.131; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp09.smtpout.orange.fr [80.12.242.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPBPF0zm3z2yLg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 05:02:06 +1000 (AEST)
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 1udRoksXxV0xU1udRoKAnN; Thu, 16 Jun 2022 20:54:32 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 16 Jun 2022 20:54:32 +0200
X-ME-IP: 90.11.190.129
Message-ID: <bc6eaf7e-ff88-9b82-eae7-7e6902c33a10@wanadoo.fr>
Date: Thu, 16 Jun 2022 20:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] arch: powerpc: platforms: 85xx: Add missing
 of_node_put in sgy_cts1000.c
Content-Language: fr
To: Liang He <windhl@126.com>, oss@buserror.net, mpe@ellerman.id.au,
 paulus@samba.org, christophe.leroy@csgroup.eu, nixiaoming@huawei.com
References: <20220616151901.3989078-1-windhl@126.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220616151901.3989078-1-windhl@126.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 16/06/2022 à 17:19, Liang He a écrit :
> In gpio_halt_probe(), of_find_matching_node() will return a node pointer with
> refcount incremented. We should use of_node_put() in each fail path or when it
> is not used anymore.
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>   changelog:
> 
>   v2: use goto-label patch style advised by Christophe.
>   v1: add of_node_put() before each exit.
> 
>   arch/powerpc/platforms/85xx/sgy_cts1000.c | 27 +++++++++++++++--------
>   1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/85xx/sgy_cts1000.c b/arch/powerpc/platforms/85xx/sgy_cts1000.c
> index 98ae64075193..e280f963d88c 100644
> --- a/arch/powerpc/platforms/85xx/sgy_cts1000.c
> +++ b/arch/powerpc/platforms/85xx/sgy_cts1000.c
> @@ -73,6 +73,7 @@ static int gpio_halt_probe(struct platform_device *pdev)
>   	struct device_node *node = pdev->dev.of_node;
>   	int gpio, err, irq;
>   	int trigger;
> +	int ret;
>   
>   	if (!node)
>   		return -ENODEV;
> @@ -84,20 +85,24 @@ static int gpio_halt_probe(struct platform_device *pdev)
>   
>   	/* Technically we could just read the first one, but punish
>   	 * DT writers for invalid form. */
> -	if (of_gpio_count(halt_node) != 1)
> -		return -EINVAL;
> +	if (of_gpio_count(halt_node) != 1) {
> +		ret = -EINVAL;
> +		goto err_put;
> +	}
>   
>   	/* Get the gpio number relative to the dynamic base. */
>   	gpio = of_get_gpio_flags(halt_node, 0, &flags);
> -	if (!gpio_is_valid(gpio))
> -		return -EINVAL;
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
> +		goto err_put;
>   	}
>   
>   	trigger = (flags == OF_GPIO_ACTIVE_LOW);
> @@ -112,8 +117,8 @@ static int gpio_halt_probe(struct platform_device *pdev)
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
> @@ -122,8 +127,12 @@ static int gpio_halt_probe(struct platform_device *pdev)
>   
>   	printk(KERN_INFO "gpio-halt: registered GPIO %d (%d trigger, %d"
>   	       " irq).\n", gpio, trigger, irq);
> +	ret = 0;
>   
> -	return 0;
> +err_put:
> +	of_node_put(halt_node);
> +	halt_node = NULL;

Hi,
so now we set 'halt_node' to NULL even in the normal case.
This is really spurious.

Look at gpio_halt_cb(), but I think that this is just wrong and badly 
breaks this driver.

CJ


> +	return ret;
>   }
>   
>   static int gpio_halt_remove(struct platform_device *pdev)

