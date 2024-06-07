Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 809FB900217
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 13:26:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OMTMs5NL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vwf694Yqrz3cZm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 21:26:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OMTMs5NL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=marilene.agarcia@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vwf5S1t0Wz30WP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 21:25:48 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f6ab88dfaeso17507845ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jun 2024 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717759545; x=1718364345; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AL2peTkLtP/iuUU0Wor02p7UZI/DaudYxquldAAWqLY=;
        b=OMTMs5NLNWZVAyK3qVFkjw9Ai1Dv+rijjXT9yN+VDeDx3/xqu2c0AtQGHHfa5eNtuE
         pKyYaBJkJZJAvXHcL/wK99ntYnEzaMOSrJWvOrxRuhYgjaZiJLtaVW0aANM5X+YpAvME
         2eYLm/u9g6wN9zq+eMkDBGq0+lXWFlhGfqg+dV91fYTdeKwItzc7MAuqWWBVpyZ9/v6n
         Irim+I9NwAIoSB0K2SKY2kjEuHT2c9Lw5RI2TA9OwrJ7VWiwGlxEmkk19HWm+SU8u4SK
         sUQpkv3BR5y4sGFJQUuzeyhZtbAKhKLGCeNt/CvT/l/Rnl8Cx0ePpcEk4kXHqoU+fO+E
         yb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717759545; x=1718364345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AL2peTkLtP/iuUU0Wor02p7UZI/DaudYxquldAAWqLY=;
        b=IdHiVGV0K6htoFGVyEofhUmQxYCuRVTuzLgGH+LG2oJJbfDOXKja+8Vx3Lrxy523Ox
         Eq421PyJiwWJGBncWl5f0TWQVSrFoC8vYlCu8hjL0xDej622U/90+bhSOZiOdnM3gN9u
         PDfo+hs+K+scfNM2ATOv35vvN0HSb6bSz3XerqKKOLioUsErrgkw29HM9+OIj62oYphq
         VEkga8ofB9e1PrXUrztxwSf7WnmZqIqFKiuH0CgLQRLX4US3/qvtI04LcDtl2Xo/fS+g
         Duiy+1EqCLUL22UEC1bXoZl9v1KttNyyj7WRYueg36Uj3qARgpBhE6+dvBy6WLieROzz
         AV9w==
X-Forwarded-Encrypted: i=1; AJvYcCUUm/ZS/qhp7MjpoeR0OJA3eJd3IZn50kZu6rMFOUSbpfskKJNw2j2uGNLpfq+GRpaIWeEcLDhWtbjWPLDQDIMzJ3MFFV6rRKyIQmE59A==
X-Gm-Message-State: AOJu0YyHRU+aWwCwpqApfXoXQn2DdAF3D/6Am8b2ATThPTSZa9v29QYD
	vzlzde6asu4o+punuXDM5uF9r4P/seqvam4ouRI7DDYhm49v9VEv
X-Google-Smtp-Source: AGHT+IFOT8iHEEUZhPIDkDJbUx2BKhUqXB05g0I/13p7fXXmVD1Oc6aBBY7OKTHpeTkGO3Q1/ojkCA==
X-Received: by 2002:a17:902:d4c4:b0:1f6:857b:b5c with SMTP id d9443c01a7336-1f6d02fdd2emr27360715ad.32.1717759544944;
        Fri, 07 Jun 2024 04:25:44 -0700 (PDT)
Received: from ?IPV6:2804:431:cfd3:42f5:5119:119d:e1d9:57b4? ([2804:431:cfd3:42f5:5119:119d:e1d9:57b4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75ef93sm32034235ad.3.2024.06.07.04.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 04:25:44 -0700 (PDT)
Message-ID: <98a5e808-68b5-42d0-8572-78b724b7078d@gmail.com>
Date: Fri, 7 Jun 2024 08:25:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 linux-next] leds: powernv: replace of_node_put to
 __free
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Julia Lawall <julia.lawall@inria.fr>
References: <20240601031713.1307859-1-marilene.agarcia@gmail.com>
Content-Language: en-US
From: Marilene Andrade Garcia <marilene.agarcia@gmail.com>
In-Reply-To: <20240601031713.1307859-1-marilene.agarcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/06/2024 00:17, MarileneGarcia wrote:
> Use __free for device_node values, and thus drop calls to
> of_node_put.
> 
> The variable attribute __free adds a scope based cleanup to
> the device node. The goal is to reduce memory management issues
> in the kernel code.
> 
> The of_node_put calls were removed, and the
> for_each_available_child_of_node was replaced to the equivalent
> for_each_available_child_of_node_scoped which use the __free.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
> ---
> Hello,
> Thank you for the feedback.
> 
> The line-break strategy was fixed, and now it is according to
> the top one suggested.
> 
> The __free is a wrapper to __attribute__((__cleanup__())) so
> the variavel definition is needed. And according to Julia, it
> is preferred to combine the declaration and the allocation to
> ensure that there is no return that can occur after the declaration,
> but before the allocation (or more precisely the initialization).
> If there is no other option for the initialization of the variable,
> then it should be NULL.
> 
>   drivers/leds/leds-powernv.c | 28 +++++++++-------------------
>   1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
> index 4f01acb75727..49ab8c9a3f29 100644
> --- a/drivers/leds/leds-powernv.c
> +++ b/drivers/leds/leds-powernv.c
> @@ -246,29 +246,25 @@ static int powernv_led_classdev(struct platform_device *pdev,
>   	const char *cur = NULL;
>   	int rc = -1;
>   	struct property *p;
> -	struct device_node *np;
>   	struct powernv_led_data *powernv_led;
>   	struct device *dev = &pdev->dev;
>   
> -	for_each_available_child_of_node(led_node, np) {
> +	for_each_available_child_of_node_scoped(led_node, np) {
>   		p = of_find_property(np, "led-types", NULL);
>   
>   		while ((cur = of_prop_next_string(p, cur)) != NULL) {
>   			powernv_led = devm_kzalloc(dev, sizeof(*powernv_led),
>   						   GFP_KERNEL);
> -			if (!powernv_led) {
> -				of_node_put(np);
> +			if (!powernv_led)
>   				return -ENOMEM;
> -			}
>   
>   			powernv_led->common = powernv_led_common;
>   			powernv_led->loc_code = (char *)np->name;
>   
>   			rc = powernv_led_create(dev, powernv_led, cur);
> -			if (rc) {
> -				of_node_put(np);
> +			if (rc)
>   				return rc;
> -			}
> +
>   		} /* while end */
>   	}
>   
> @@ -278,12 +274,11 @@ static int powernv_led_classdev(struct platform_device *pdev,
>   /* Platform driver probe */
>   static int powernv_led_probe(struct platform_device *pdev)
>   {
> -	struct device_node *led_node;
>   	struct powernv_led_common *powernv_led_common;
>   	struct device *dev = &pdev->dev;
> -	int rc;
> +	struct device_node *led_node
> +		__free(device_node) = of_find_node_by_path("/ibm,opal/leds");
>   
> -	led_node = of_find_node_by_path("/ibm,opal/leds");
>   	if (!led_node) {
>   		dev_err(dev, "%s: LED parent device node not found\n",
>   			__func__);
> @@ -292,20 +287,15 @@ static int powernv_led_probe(struct platform_device *pdev)
>   
>   	powernv_led_common = devm_kzalloc(dev, sizeof(*powernv_led_common),
>   					  GFP_KERNEL);
> -	if (!powernv_led_common) {
> -		rc = -ENOMEM;
> -		goto out;
> -	}
> +	if (!powernv_led_common)
> +		return -ENOMEM;
>   
>   	mutex_init(&powernv_led_common->lock);
>   	powernv_led_common->max_led_type = cpu_to_be64(OPAL_SLOT_LED_TYPE_MAX);
>   
>   	platform_set_drvdata(pdev, powernv_led_common);
>   
> -	rc = powernv_led_classdev(pdev, led_node, powernv_led_common);
> -out:
> -	of_node_put(led_node);
> -	return rc;
> +	return powernv_led_classdev(pdev, led_node, powernv_led_common);
>   }
>   
>   /* Platform driver remove */

Hello,
Did you have a chance to look at the patch after the requested change?

Thank you,
Marilene
