Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B56A8D6716
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 18:45:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IjkbaIIo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrTVy1Zgnz30ft
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 02:44:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IjkbaIIo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrTVB3vttz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 02:44:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44F3F62C85;
	Fri, 31 May 2024 16:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35664C32786;
	Fri, 31 May 2024 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717173850;
	bh=gjNaygJxEmGVOCosMiMdTQrI3y7aaBzzVSVlr1yu1jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjkbaIIooYDH8y6nOdbyewI+UXwTb5Nfq4KqnfU2FPVRJA02NNCv0JdHkgXnq7tqK
	 X1lN4otqKMIhbjpgKtq5ftcAirF7PWO0e/isWzEN/+JC8R7EbgrVLmtdOiTsQhqzvJ
	 Yftmtcf4zFkQI8vkim1i+nYIIcGu+VlsP/XFBFRoSWfSb3dlDLshKKSbs80SRrm3fu
	 xmw3w0Vm43wBcT1pz9POYb1EYVAoH2Y/seEOrbFdJWJYdmMpc1jhygDB1YfdHaMlft
	 KOkHfQhuRRZ0NqBm1LqATpCTbjSGYhyhwmInq31JB81lASlrNH4uqTa1nEy1ee9C6t
	 ZCKqHyGtMwIoA==
Date: Fri, 31 May 2024 17:44:05 +0100
From: Lee Jones <lee@kernel.org>
To: MarileneGarcia <marilene.agarcia@gmail.com>
Subject: Re: [PATCH v2 linux-next] leds: powernv: replace of_node_put to
 __free
Message-ID: <20240531164405.GV1005600@google.com>
References: <20240529200233.1188228-1-marilene.agarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240529200233.1188228-1-marilene.agarcia@gmail.com>
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
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>, Nicholas Piggin <npiggin@gmail.com>, Pavel Machek <pavel@ucw.cz>, Shuah Khan <skhan@linuxfoundation.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 May 2024, MarileneGarcia wrote:

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
> Changes v2:
> It was missing a blank line.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
> ---
>  drivers/leds/leds-powernv.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
> index 4f01acb75727..8f94d2efed9f 100644
> --- a/drivers/leds/leds-powernv.c
> +++ b/drivers/leds/leds-powernv.c
> @@ -246,29 +246,25 @@ static int powernv_led_classdev(struct platform_device *pdev,
>  	const char *cur = NULL;
>  	int rc = -1;
>  	struct property *p;
> -	struct device_node *np;
>  	struct powernv_led_data *powernv_led;
>  	struct device *dev = &pdev->dev;
>  
> -	for_each_available_child_of_node(led_node, np) {
> +	for_each_available_child_of_node_scoped(led_node, np) {
>  		p = of_find_property(np, "led-types", NULL);
>  
>  		while ((cur = of_prop_next_string(p, cur)) != NULL) {
>  			powernv_led = devm_kzalloc(dev, sizeof(*powernv_led),
>  						   GFP_KERNEL);
> -			if (!powernv_led) {
> -				of_node_put(np);
> +			if (!powernv_led)
>  				return -ENOMEM;
> -			}
>  
>  			powernv_led->common = powernv_led_common;
>  			powernv_led->loc_code = (char *)np->name;
>  
>  			rc = powernv_led_create(dev, powernv_led, cur);
> -			if (rc) {
> -				of_node_put(np);
> +			if (rc)
>  				return rc;
> -			}
> +
>  		} /* while end */
>  	}
>  
> @@ -278,12 +274,11 @@ static int powernv_led_classdev(struct platform_device *pdev,
>  /* Platform driver probe */
>  static int powernv_led_probe(struct platform_device *pdev)
>  {
> -	struct device_node *led_node;
>  	struct powernv_led_common *powernv_led_common;
>  	struct device *dev = &pdev->dev;
> -	int rc;
> +	struct device_node *led_node __free(device_node) =
> +							of_find_node_by_path("/ibm,opal/leds");

This is not a good line-break strategy.

	struct device_node *led_node
		__free(device_node) = of_find_node_by_path("/ibm,opal/leds");

	struct device_node *led_node __free(device_node) =
		of_find_node_by_path("/ibm,opal/leds");

Please choose one of these instead.

I suggest the top one might read a little easier.

> -	led_node = of_find_node_by_path("/ibm,opal/leds");

Does the __free() have to be combined with an allocation?

>  	if (!led_node) {
>  		dev_err(dev, "%s: LED parent device node not found\n",
>  			__func__);
> @@ -292,20 +287,15 @@ static int powernv_led_probe(struct platform_device *pdev)
>  
>  	powernv_led_common = devm_kzalloc(dev, sizeof(*powernv_led_common),
>  					  GFP_KERNEL);
> -	if (!powernv_led_common) {
> -		rc = -ENOMEM;
> -		goto out;
> -	}
> +	if (!powernv_led_common)
> +		return -ENOMEM;
>  
>  	mutex_init(&powernv_led_common->lock);
>  	powernv_led_common->max_led_type = cpu_to_be64(OPAL_SLOT_LED_TYPE_MAX);
>  
>  	platform_set_drvdata(pdev, powernv_led_common);
>  
> -	rc = powernv_led_classdev(pdev, led_node, powernv_led_common);
> -out:
> -	of_node_put(led_node);
> -	return rc;
> +	return powernv_led_classdev(pdev, led_node, powernv_led_common);
>  }
>  
>  /* Platform driver remove */
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]
