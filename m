Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 981D54F57C4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 10:29:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYHkL40zHz2yjc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 18:29:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.46; helo=mail-ej1-f46.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYHjt4Xjgz2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 18:29:20 +1000 (AEST)
Received: by mail-ej1-f46.google.com with SMTP id l26so2742748ejx.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Apr 2022 01:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v2z8gRO/swq08y+iM83Fo/YT89U4twO1dtpzDAI+wds=;
 b=V5mlkjNtIrsrNtT6mgmTl85ngQ4UtoQJ9ta8WRLzfIkmcT/Scj+Zy+N+f+Xvnx5sQX
 AhEDoaWzW8hkUxYokqN9j4wjqHPon+9NLB5TBs5Eo149gwccAfpYW7YK91nOARggTXa+
 d+aG1Rls74XbOtehrKTNrvI46RScEeyCS+VxJeZLNVcn/xHd0dpN1yQ9S4WHNroPIuoz
 Vr/jia6IqcKPBg/eEKRwv3NXgCD/bjZKYspPhMr9AYLLEgt+FtnWaSrKpb5+kPbFSACY
 v4sWtW0qO0n6ktaSdtKomB9IGCTQj+4EajnGL6oqbg4wVmQvvGEuqruia13TktU5P5fX
 tbqg==
X-Gm-Message-State: AOAM531fkwX/2AnpyjONNCPWxSBsXhh0njNZztfFaydKMZJE2XwxdUHJ
 8Qwgf9NuwRu8pz5a/93IS5c=
X-Google-Smtp-Source: ABdhPJzHQmSDjpC1O1mIJBNaZCFY2jUV1wWvoQC5P1RqZ8q+ceuPa2kq451RXmkcGjRd0ITGO0yuaQ==
X-Received: by 2002:a17:907:6e2a:b0:6e0:b263:37a6 with SMTP id
 sd42-20020a1709076e2a00b006e0b26337a6mr7259741ejc.622.1649233756378; 
 Wed, 06 Apr 2022 01:29:16 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a170906d20e00b006cee22553f7sm6322837ejz.213.2022.04.06.01.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 01:29:15 -0700 (PDT)
Message-ID: <afeeec95-f2c3-2e58-eac6-97bf5872a042@kernel.org>
Date: Wed, 6 Apr 2022 10:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] tty: serial: Prepare cleanup of powerpc's asm/prom.h
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <49fc0d4b6446da630b1e9f29c4bab38f8ed087bf.1648833419.git.christophe.leroy@csgroup.eu>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <49fc0d4b6446da630b1e9f29c4bab38f8ed087bf.1648833419.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02. 04. 22, 12:20, Christophe Leroy wrote:
> powerpc's asm/prom.h brings some headers that it doesn't
> need itself.
> 
> In order to clean it up, first add missing headers in
> users of asm/prom.h
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> ---
>   drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c | 1 -
>   drivers/tty/serial/mpc52xx_uart.c           | 2 ++
>   drivers/tty/serial/pmac_zilog.c             | 1 -
>   3 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> index 6a1cd03bfe39..108af254e8f3 100644
> --- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> +++ b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
> @@ -25,7 +25,6 @@
>   #include <asm/io.h>
>   #include <asm/irq.h>
>   #include <asm/fs_pd.h>
> -#include <asm/prom.h>
>   
>   #include <linux/serial_core.h>
>   #include <linux/kernel.h>
> diff --git a/drivers/tty/serial/mpc52xx_uart.c b/drivers/tty/serial/mpc52xx_uart.c
> index 8a6958377764..4ec785e4f9b1 100644
> --- a/drivers/tty/serial/mpc52xx_uart.c
> +++ b/drivers/tty/serial/mpc52xx_uart.c
> @@ -38,6 +38,8 @@
>   #include <linux/delay.h>
>   #include <linux/io.h>
>   #include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
>   #include <linux/of_platform.h>
>   #include <linux/clk.h>
>   
> diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
> index 5d97c201ad88..c903085acb8d 100644
> --- a/drivers/tty/serial/pmac_zilog.c
> +++ b/drivers/tty/serial/pmac_zilog.c
> @@ -51,7 +51,6 @@
>   #include <asm/irq.h>
>   
>   #ifdef CONFIG_PPC_PMAC
> -#include <asm/prom.h>
>   #include <asm/machdep.h>
>   #include <asm/pmac_feature.h>
>   #include <asm/dbdma.h>


-- 
js
suse labs
