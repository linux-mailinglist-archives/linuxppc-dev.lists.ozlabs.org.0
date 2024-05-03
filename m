Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B86A8BABED
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 13:55:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CkkTYLLB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW8Ps1qC1z3ck2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 21:55:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CkkTYLLB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW8P44plrz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 21:54:47 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a599332afcbso101276766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 May 2024 04:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714737283; x=1715342083; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0oauZc70ukT9KbYDGTPtwlZBYsnxCGZgVEqDznEFYqQ=;
        b=CkkTYLLBubg4h/6PD1tFcGTJ0/aTkz5PbIGlgBcan1JM7bT0x8rEvJvjHs7pTqS6Rr
         Gszp6SLttn4lVLe6ca6s5ooWaoNSJwKyzSySDOdE8fxs9kUSd/WDNpiG0f6sm+2+0mmN
         wVqdokP3nO1qfDA1UmZBQAygPBYTP5FE7Oo/V+YQ2BL86Obx+BCMSivaWBklrTTMsaAz
         WWmaB/Nr0qXlE0vu2lq1vXbYnETyRTuZ/Td64ouzmyhOyQGa7qflV69KNoGZRPPBVKR8
         lI9r6m9SwFJG/86ycPCLJSIORdfrjBU7zJ3jruU5125xFIi86aXJuaxNMEkKYSS36V9c
         I1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714737283; x=1715342083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0oauZc70ukT9KbYDGTPtwlZBYsnxCGZgVEqDznEFYqQ=;
        b=IahIRI/yAqRwlwJAQqNTj59wG7iNUmNC8Ba/5kMWpgNVvdBP6h9rWR2Vi459LipQ2a
         dlLuOMGj9krejkplFw+Wpgv8m6KSPsonVzzFWfAG66e0w3Tvi6tOM5ARprH1AUOZ2jb5
         unO6Nq+Hf4jQNGfi7RLdxf87o0jgUvTAZC9ru+J/9YVLM8evk1hmAiuRles42BX7bNky
         bV4ShIrUO1oittRt683XM5/lGA10xh5qwq21zilis1zvAkg/kkizB+ol1Qfg8Lj23Mn2
         36DhV2zbk9nbJKA66tgyKa9qZIba2sZlXwqYK3hr/C05m8xN9Mdfa8AVdcEam4rvuEF6
         QUNA==
X-Forwarded-Encrypted: i=1; AJvYcCX8HwjJztMFbGzQ2WY0lddDj/c7O5JSyS/07uybVX7CVGDo74PByDYHR2pLRS7Z3Bz5zWU6cqz5E0UuFB5P0yc34Y4DHFJf2WObgPQCqw==
X-Gm-Message-State: AOJu0YxwR4Bpl7Eqcm+3u2eMwOfc5dN2Ly3Nj9Ltkgt0bKqyRANI8AUj
	F5bAs2dd5aieHolTuEbcLztpc22w3EM/qxJ6r3sZs5Ki3HnjEBO4
X-Google-Smtp-Source: AGHT+IHW15hSCP1X3duU6HX04FPukVySYrSsXbGUmXqmySFFVYB0m9NveeVvpZJWpndt2EmA6KT6JA==
X-Received: by 2002:a17:906:b7da:b0:a58:e4dc:ad99 with SMTP id fy26-20020a170906b7da00b00a58e4dcad99mr1573887ejb.2.1714737283388;
        Fri, 03 May 2024 04:54:43 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-47.cable.dynamic.surfer.at. [84.115.213.47])
        by smtp.gmail.com with ESMTPSA id a21-20020a170906369500b00a596ea236f4sm1631792ejc.212.2024.05.03.04.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 04:54:42 -0700 (PDT)
Message-ID: <3823976c-13b6-4662-a9fd-7615cf69475a@gmail.com>
Date: Fri, 3 May 2024 13:54:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tty: hvc: hvc_opal: eliminate uses of of_node_put()
To: Lu Dai <dai.lu@exordes.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com
References: <20240503114330.221764-1-dai.lu@exordes.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240503114330.221764-1-dai.lu@exordes.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: shuah@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/3/24 13:43, Lu Dai wrote:
> Make use of the __free() cleanup handler to automatically free nodes
> when they get out of scope.
> 
> Removes the need for a 'goto' as an effect.
> 
> Signed-off-by: Lu Dai <dai.lu@exordes.com>
> ---
>  drivers/tty/hvc/hvc_opal.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
> index 095c33ad10f8..67e90fa993a3 100644
> --- a/drivers/tty/hvc/hvc_opal.c
> +++ b/drivers/tty/hvc/hvc_opal.c
> @@ -327,14 +327,14 @@ static void udbg_init_opal_common(void)
>  
>  void __init hvc_opal_init_early(void)
>  {
> -	struct device_node *stdout_node = of_node_get(of_stdout);
> +	struct device_node *stdout_node __free(device_node) = of_node_get(of_stdout);
>  	const __be32 *termno;
>  	const struct hv_ops *ops;
>  	u32 index;
>  
>  	/* If the console wasn't in /chosen, try /ibm,opal */
>  	if (!stdout_node) {
> -		struct device_node *opal, *np;

Generally, you should always initialize the variable where it is
declared. What would happen if the variable goes out of scope before it
gets initialized? Now it is not dangerous, but if new code is added and
it returns because of some error, we might run into trouble.

In this particular case you can solve this easily by putting together
your modification and the assignment right after the comment.


> +		struct device_node *opal __free(device_node), *np;
>  
>  		/* Current OPAL takeover doesn't provide the stdout
>  		 * path, so we hard wire it
> @@ -356,7 +356,6 @@ void __init hvc_opal_init_early(void)
>  				break;
>  			}
>  		}
> -		of_node_put(opal);
>  	}
>  	if (!stdout_node)
>  		return;
> @@ -382,13 +381,11 @@ void __init hvc_opal_init_early(void)
>  		hvsilib_establish(&hvc_opal_boot_priv.hvsi);
>  		pr_devel("hvc_opal: Found HVSI console\n");
>  	} else
> -		goto out;
> +		return;
>  	hvc_opal_boot_termno = index;
>  	udbg_init_opal_common();
>  	add_preferred_console("hvc", index, NULL);
>  	hvc_instantiate(index, index, ops);
> -out:
> -	of_node_put(stdout_node);
>  }
>  
>  #ifdef CONFIG_PPC_EARLY_DEBUG_OPAL_RAW


Best regards,
Javier Carrasco
