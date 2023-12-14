Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D73F8127C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 07:13:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=trvn.ru header.i=@trvn.ru header.a=rsa-sha256 header.s=mail header.b=oxrcgcg5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrMVN5KSYz3dSW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 17:13:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=trvn.ru header.i=@trvn.ru header.a=rsa-sha256 header.s=mail header.b=oxrcgcg5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=trvn.ru (client-ip=194.87.146.52; helo=box.trvn.ru; envelope-from=nikita@trvn.ru; receiver=lists.ozlabs.org)
X-Greylist: delayed 553 seconds by postgrey-1.37 at boromir; Thu, 14 Dec 2023 16:51:24 AEDT
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrM0r278Tz3bw2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 16:51:24 +1100 (AEDT)
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 51B15408EF;
	Thu, 14 Dec 2023 10:42:02 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1702532522; bh=cR6tyKPKN7gk3TnmXe4ERX1lFG8NrlKVwL/KAde86sM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oxrcgcg5FIrv/i0f5jrMIsUIaotfs1kKA+N3YsSNhycbKOL/vYxbPldu/fLCz6k2A
	 dSIoswfhUFPKJ6tfpBEm44rtWZNjlai1hfv0rZ+1S1uW5nylDcSrFlEG+m7q6qjqYW
	 qWjsrN9xv/7HyoI3GkZ9hJRSfUBOnoHD1/uX0NU7qNQN9/QEPo3CcGBLJU0U34vxVZ
	 PD9eEBrl2Jv8SgkQkLyygMPQR/OuVRT0fbSmAsLHGhujMp76e5pn22VSBr5f/4z80a
	 61xWQHXr316ZJbGUsimwOTRv8uBncW0oBm8WNPXQTCGaziLLlmxWJei0UxNf1JsjTU
	 6I9V8pyTcSARA==
MIME-Version: 1.0
Date: Thu, 14 Dec 2023 10:42:01 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: George Stark <gnstark@salutedevices.com>
Subject: Re: [PATCH v3 04/11] leds: aw2013: use devm API to cleanup module's
 resources
In-Reply-To: <20231213223020.2713164-5-gnstark@salutedevices.com>
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-5-gnstark@salutedevices.com>
Message-ID: <c709e0f33da06db40127f3a0adcbebbd@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Dec 2023 17:12:52 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, lee@kernel.org, kernel@salutedevices.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, mingo@redhat.com, pavel@ucw.cz, longman@redhat.com, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

George Stark писал(а) 14.12.2023 03:30:
> In this driver LEDs are registered using devm_led_classdev_register()
> so they are automatically unregistered after module's remove() is done.
> led_classdev_unregister() calls module's led_set_brightness() to turn off
> the LEDs and that callback uses resources which were destroyed already
> in module's remove() so use devm API instead of remove().
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>

Thanks for noticing and fixing this!
Perhaps this patch needs a Fixes tag too, like 1/11?

Tested-by: Nikita Travkin <nikita@trvn.ru>

Btw, seems like (5..11)/11 never arrived to the lists...

Nikita

> ---
>  drivers/leds/leds-aw2013.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> index c2bc0782c0cd..863aeb02f278 100644
> --- a/drivers/leds/leds-aw2013.c
> +++ b/drivers/leds/leds-aw2013.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  // Driver for Awinic AW2013 3-channel LED driver
>  
> +#include <linux/devm-helpers.h>
>  #include <linux/i2c.h>
>  #include <linux/leds.h>
>  #include <linux/module.h>
> @@ -318,6 +319,11 @@ static int aw2013_probe_dt(struct aw2013 *chip)
>  	return 0;
>  }
>  
> +static void aw2013_chip_disable_action(void *data)
> +{
> +	aw2013_chip_disable(data);
> +}
> +
>  static const struct regmap_config aw2013_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
> @@ -334,7 +340,10 @@ static int aw2013_probe(struct i2c_client *client)
>  	if (!chip)
>  		return -ENOMEM;
>  
> -	mutex_init(&chip->mutex);
> +	ret = devm_mutex_init(&client->dev, &chip->mutex);
> +	if (ret)
> +		return ret;
> +
>  	mutex_lock(&chip->mutex);
>  
>  	chip->client = client;
> @@ -378,6 +387,10 @@ static int aw2013_probe(struct i2c_client *client)
>  		goto error_reg;
>  	}
>  
> +	ret = devm_add_action(&client->dev, aw2013_chip_disable_action, chip);
> +	if (ret)
> +		goto error_reg;
> +
>  	ret = aw2013_probe_dt(chip);
>  	if (ret < 0)
>  		goto error_reg;
> @@ -398,19 +411,9 @@ static int aw2013_probe(struct i2c_client *client)
>  
>  error:
>  	mutex_unlock(&chip->mutex);
> -	mutex_destroy(&chip->mutex);
>  	return ret;
>  }
>  
> -static void aw2013_remove(struct i2c_client *client)
> -{
> -	struct aw2013 *chip = i2c_get_clientdata(client);
> -
> -	aw2013_chip_disable(chip);
> -
> -	mutex_destroy(&chip->mutex);
> -}
> -
>  static const struct of_device_id aw2013_match_table[] = {
>  	{ .compatible = "awinic,aw2013", },
>  	{ /* sentinel */ },
> @@ -424,7 +427,6 @@ static struct i2c_driver aw2013_driver = {
>  		.of_match_table = of_match_ptr(aw2013_match_table),
>  	},
>  	.probe = aw2013_probe,
> -	.remove = aw2013_remove,
>  };
>  
>  module_i2c_driver(aw2013_driver);
