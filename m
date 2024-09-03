Return-Path: <linuxppc-dev+bounces-921-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A43B96A4E4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 18:56:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WysGk5RqSz2xYY;
	Wed,  4 Sep 2024 02:56:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725382606;
	cv=none; b=M0Fa1iqoYKJiQm1zAU5RNyHjKHhK08ehtBBPWZb7XwPew4DXGwzoJ0v8o3VpyEdL09ngLccOtzTNR7J7d3A2zPUDg5NEQFQzijLRNZ2Nx1MXPD9onRb8Bq8x8PpyENrVCrFDgfRm66WZg6v5OQTIduppJ1eJUq0yMOcXmkJI2fq5BrLvBcTVh3zLtqAGryyu+0ryifLW1QSEs/Dnwxg4tzz5z3Sqtkvq6eAWYqd3N6H0ZeoVQapt5WtPXR3h30gm0gg27CuqUoSndN/F4CNyl8E64aWddp/0F2448/wpO1wvuPGXWC8vUJosvKKewcYo8jfyBQNbwqA6ne789qe9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725382606; c=relaxed/relaxed;
	bh=aZNo/Og5S/OC5KYian1D1B9U4n6335cfrw3bAIxckus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iw6qKtU/5oZ2ML5PiRSUXVqcuL7blj7Qh2WWYuTIjg60nVSiTGyv8Z8JLZCA1UmyqHYF5CA4TGzg9uVY0yleYIuvlM6PJTYga3Vtvu+4lq5zo6ZDNqmfqiTwfg5IjvyqpALYPXz4jMZfSzEAXmXyrHLbpFhBdUhlz9kVxUIq7vwuI8PhnxHcyKcJFsCcGTYr54riGxo0wh2vMyRG9/EDParXKOKGPSYHdQ6ELzzetEoObVtr05/IlpAul4BcRbE+7kcLN7iWw+BDnevw0ip9NGdMn8i/LQZOaLsmOxmUibfKaxu0yI2BhFZUFZ2BDohB1g7osKB/5d9epM9LSm4J7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WysGk351Vz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 02:56:45 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WysGf22nGz9sSH;
	Tue,  3 Sep 2024 18:56:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzJmN4SzLcUB; Tue,  3 Sep 2024 18:56:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WysGf1FZ7z9sSC;
	Tue,  3 Sep 2024 18:56:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1A00F8B778;
	Tue,  3 Sep 2024 18:56:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1Eunu3JRLihx; Tue,  3 Sep 2024 18:56:42 +0200 (CEST)
Received: from [192.168.234.228] (unknown [192.168.234.228])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C6338B774;
	Tue,  3 Sep 2024 18:56:41 +0200 (CEST)
Message-ID: <90924209-888d-4ff3-8f60-f82a073bcf1c@csgroup.eu>
Date: Tue, 3 Sep 2024 18:56:41 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] of/irq: handle irq_of_parse_and_map() errors
To: Ma Ke <make24@iscas.ac.cn>, jochen@scram.de, andi.shyti@kernel.org,
 grant.likely@linaro.org, thierry.reding@gmail.com, rob.herring@calxeda.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240830142127.3446406-1-make24@iscas.ac.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240830142127.3446406-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 30/08/2024 à 16:21, Ma Ke a écrit :
> Zero and negative number is not a valid IRQ for in-kernel code and the
> irq_of_parse_and_map() function returns zero on error.  So this check for
> valid IRQs should only accept values > 0.

unsigned int irq_of_parse_and_map(struct device_node *node, int index);

I can't see how an 'unsigned int' can be negative.

Christophe

> 
> Cc: stable@vger.kernel.org
> Fixes: f7578496a671 ("of/irq: Use irq_of_parse_and_map()")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>   drivers/i2c/busses/i2c-cpm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
> index 4794ec066eb0..41e3c95c0ef7 100644
> --- a/drivers/i2c/busses/i2c-cpm.c
> +++ b/drivers/i2c/busses/i2c-cpm.c
> @@ -435,7 +435,7 @@ static int cpm_i2c_setup(struct cpm_i2c *cpm)
>   	init_waitqueue_head(&cpm->i2c_wait);
>   
>   	cpm->irq = irq_of_parse_and_map(ofdev->dev.of_node, 0);
> -	if (!cpm->irq)
> +	if (cpm->irq <= 0)
>   		return -EINVAL;
>   
>   	/* Install interrupt handler. */

