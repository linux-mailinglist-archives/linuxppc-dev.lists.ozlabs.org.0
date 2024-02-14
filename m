Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D87E68542C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 07:25:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZSqq61YSz3vYK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 17:25:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.43; helo=mail-ej1-f43.google.com; envelope-from=jirislaby@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZSqL6YjLz3c2C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 17:25:17 +1100 (AEDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a29c4bbb2f4so674701166b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 22:25:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707891913; x=1708496713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0++smij7fLXWfkbGHyYXuskvQ10t4OERK+LGxTM1+U=;
        b=DBQziGYgU0X9nVBcZDE/inSDcKLyZMbClqJoz58A1QLaXaVA1ANR97ZzCeyphKMxhS
         K1MRoo1k+vVuFV30HPKateo6uaFeS7QVdQiBwNcwt8m2i/LSozE/35IxTNljeBQZM+5j
         3wx898JdJaq9ALNQLQejkieiQoykok8S2FxAMFim4WGLdILkyb86Jbwd5Vi9oUVrTuWV
         anNmNQKU3uwBg+EZMGTfrr2er/zFbVQSJPPbw+PjuvYeheeJE88UtjsXOpmQl7X5rus4
         3OhsbVMbfBFRdUyoZE8CIPV1Z9UmYKeRhl3WmSuqckOuKm0BvliMGkUK0TtZbpU+4INi
         WRHg==
X-Forwarded-Encrypted: i=1; AJvYcCWXvPrRrenLZBTAVbfBo5klWXpqhBZ2j7i9bQqTM3FNPMqKavx4sqT19yjrtjW3EvjEiQf/5h7avumx3FU7rXkcAhoKY1zpHiRDctUNBQ==
X-Gm-Message-State: AOJu0YwUBNa9G1OHbQ8XCfSBRR1MWzHeIi5oMioJc7DeQHFXdbOL5C7B
	IyhAKeRLzxiwlj0UMUdPQz+M30cn4TyPe+lJJfS8c4QkhISxYDcS
X-Google-Smtp-Source: AGHT+IEcu8iPcIlJEhmy2BuFw0/RZ4f/wLAZ9lBUEihrZV7jl66i5n1IixzmKHDCAdWfQuTMtGYY2Q==
X-Received: by 2002:a17:906:1997:b0:a3c:8a78:af7b with SMTP id g23-20020a170906199700b00a3c8a78af7bmr914349ejd.74.1707891912323;
        Tue, 13 Feb 2024 22:25:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWjYv9+rzwOO0f16zW8meX4an9BbrmJjRSnvod6iD+4DhogFHKrZZuQqCcU9f08PmZvhO1+dJGaLkPmxox88u9kfgbEA3sHIbp0U/hmHGr94I5pW/sBYxAo/SG41AH6janGJAqGzSp0cfOghg1YKHwZdSdSmA+SyjF2ixGViPNnape5NayLp8lBxgzL5Bjw4Dag2Txw1qCWIxuOOpPnSGLqBs/SaH3ePyKcR7GtueNmo1uox9XOe4Z63GwfCSGUknRnqOY9ui1uklzhyq7WdUS6ALaQpN7JA6gWjwvUz1oLjUeMpgAFF7CBuA8xI9z9lTKmu0Qcp5WVfzojXXM/AOarRNEWP12qL/gXIoyec/hIjA=
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906115200b00a3d310a2684sm526639eja.158.2024.02.13.22.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 22:25:11 -0800 (PST)
Message-ID: <7b9afb8f-6642-4921-a92a-90c9074a48b7@kernel.org>
Date: Wed, 14 Feb 2024 07:25:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tty: hvc-iucv: fix function pointer casts
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240213101756.461701-1-arnd@kernel.org>
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20240213101756.461701-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, linux-serial@vger.kernel.org, Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13. 02. 24, 11:17, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang warns about explicitly casting between incompatible function
> pointers:
> 
> drivers/tty/hvc/hvc_iucv.c:1100:23: error: cast from 'void (*)(const void *)' to 'void (*)(struct device *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>   1100 |         priv->dev->release = (void (*)(struct device *)) kfree;
>        |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Add a separate function to handle this correctly.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> diff --git a/drivers/tty/hvc/hvc_iucv.c b/drivers/tty/hvc/hvc_iucv.c
> index fdecc0d63731..b1149bc62ca1 100644
> --- a/drivers/tty/hvc/hvc_iucv.c
> +++ b/drivers/tty/hvc/hvc_iucv.c
> @@ -1035,6 +1035,10 @@ static const struct attribute_group *hvc_iucv_dev_attr_groups[] = {
>   	NULL,
>   };
>   
> +static void hvc_iucv_free(struct device *data)
> +{
> +	kfree(data);
> +}
>   
>   /**
>    * hvc_iucv_alloc() - Allocates a new struct hvc_iucv_private instance
> @@ -1097,7 +1101,7 @@ static int __init hvc_iucv_alloc(int id, unsigned int is_console)
>   	priv->dev->bus = &iucv_bus;
>   	priv->dev->parent = iucv_root;
>   	priv->dev->groups = hvc_iucv_dev_attr_groups;
> -	priv->dev->release = (void (*)(struct device *)) kfree;
> +	priv->dev->release = hvc_iucv_free;
>   	rc = device_register(priv->dev);
>   	if (rc) {
>   		put_device(priv->dev);

-- 
js
suse labs

