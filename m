Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D8C5F6098
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 07:27:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjg1L3Sfmz3dqs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:27:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.41; helo=mail-wr1-f41.google.com; envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjg0m4bl9z2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 16:26:47 +1100 (AEDT)
Received: by mail-wr1-f41.google.com with SMTP id f11so907051wrm.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Oct 2022 22:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dwwkExrLA8SdWGSJDWZivH0sxUpUk6pDIB+w+DtImE=;
        b=u1BWBkI8Ikz5WR7NslqmZ6yyOxv5xLjXKlugFxBwcozntgowLsEFQwjSGa9SjMpJry
         FqpNZswEAAUxsOwYBVSPrZV0fERB/J2t8sCLOu1sch7BUXGH5BAhSMRzbdIK431SAX6a
         cKIs4gdXN7BqhUNWNlzDvVBTjJCx/vKgkNWmFkMDOl5XP1GRP/MFeLBG6ZiUzHe4QUHG
         l4nMDvQeBUPWjJYDpsZAIAY0OdnS8qzbvXe6ZKB/6hcXIasGQb8pRYf0w+9foPvlYIpy
         i1xoGZ9gBP97Cqbgc/FZ4cXTfE/cyrJEt4le0vU57wRZhB0NBEDoEHDAppp4MI/cirzW
         wz6A==
X-Gm-Message-State: ACrzQf1uf401l0aX1HqS2ELtao87ONVkB7adNUuKWGd8qx/PFRAwpvOj
	UT31Qll+XqbQN4t3Ecuz+Hc=
X-Google-Smtp-Source: AMsMyM6y2/h2q5zi/YJUy2pgw0d9oKpiMybw1tdpLeOY5KkfLya9IBvNlZeBEArbrL3iq+0ZMxJA3A==
X-Received: by 2002:a5d:64c2:0:b0:22e:41b1:faf7 with SMTP id f2-20020a5d64c2000000b0022e41b1faf7mr1657355wri.428.1665034003473;
        Wed, 05 Oct 2022 22:26:43 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id m3-20020a056000008300b0022afcc11f65sm15880662wrx.47.2022.10.05.22.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 22:26:42 -0700 (PDT)
Message-ID: <ec9d6f4e-08fc-1518-3c72-6e5a24c11204@kernel.org>
Date: Thu, 6 Oct 2022 07:26:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] tty: evh_bytechan: Replace NO_IRQ by 0
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <23f608ca57e7e19bc7060d3e563de383e0b2b337.1665033575.git.christophe.leroy@csgroup.eu>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <23f608ca57e7e19bc7060d3e563de383e0b2b337.1665033575.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06. 10. 22, 7:20, Christophe Leroy wrote:
> NO_IRQ is used to check the return of irq_of_parse_and_map().
> 
> On some architecture NO_IRQ is 0, on other architectures it is -1.
> 
> irq_of_parse_and_map() returns 0 on error, independent of NO_IRQ.
> 
> So use 0 instead of using NO_IRQ.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> ---
>   drivers/tty/ehv_bytechan.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/ehv_bytechan.c b/drivers/tty/ehv_bytechan.c
> index 19d32cb6af84..8595483f4697 100644
> --- a/drivers/tty/ehv_bytechan.c
> +++ b/drivers/tty/ehv_bytechan.c
> @@ -118,7 +118,7 @@ static int find_console_handle(void)
>   		return 0;
>   
>   	stdout_irq = irq_of_parse_and_map(np, 0);
> -	if (stdout_irq == NO_IRQ) {
> +	if (!stdout_irq) {
>   		pr_err("ehv-bc: no 'interrupts' property in %pOF node\n", np);
>   		return 0;
>   	}
> @@ -696,7 +696,7 @@ static int ehv_bc_tty_probe(struct platform_device *pdev)
>   
>   	bc->rx_irq = irq_of_parse_and_map(np, 0);
>   	bc->tx_irq = irq_of_parse_and_map(np, 1);
> -	if ((bc->rx_irq == NO_IRQ) || (bc->tx_irq == NO_IRQ)) {
> +	if (!bc->rx_irq || !bc->tx_irq) {
>   		dev_err(&pdev->dev, "no 'interrupts' property in %pOFn node\n",
>   			np);
>   		ret = -ENODEV;

-- 
js
suse labs

