Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C3A2F71AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 05:46:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH7tD560VzDsYY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 15:46:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=PzM68DKO; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH7jh1CkVzDsZ4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 15:38:46 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id i5so5248222pgo.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 20:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mRFw7h/qCyY+ie0onRf7SRoJ59WBMJNEeAqCuORIwXI=;
 b=PzM68DKO8esTofwyCUuifnqC1fm0jdTmzcpMAYL2NolrRMQYkbrrjaCStInKkS8bGI
 XUAox4xkRKmLGbu9OY2ATQ0BiyCOV3QniKk1VtSWaTrpHxJF7pzdDxBHj7J/a8ue570o
 Go0Kzz+cpLM/TW7vXJ2CWIECt36EGFbc0tNNGsjvrhr3PJyz+LyH6VYDd6FOpjELeQGn
 mXZUhU1iZJmTnBjVz3tAB/JUgyVQZtRfzO0XN2uDjJwNr0IzNnYvnYEcVoDMMv+H6hoW
 9QQwJAI0Ltw4G7JO/HQ8G58zEmsGxwAlQsiLEusT+NZtD9JuS0d5IOPlhgTlznR1Hrtp
 Gs/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mRFw7h/qCyY+ie0onRf7SRoJ59WBMJNEeAqCuORIwXI=;
 b=NErrffEmsrTjM6xIE/6+a7zZDyLQJAvGcsE4knl32JHDYoQnFhEYkeIqzfytqIJKju
 qbPZ9w3UfD2R9mvn/EtSxw/clvo8WBczU7Aib7YPcTTDh1E6FIL3xYLAwGPkXphsRQ5u
 jEyRel1yb+vwzCpjXsfYmeno1f8WzLd8Vvs3pobA+Q8i4jFjQGQ+6oUOgJOzCAjMP9En
 a/9S6bC9IFxEWjs9j08o+3flAYI5JQgZjC9bWuGcGnoGSJAFXE6J2clgRVZQSOoTWL0S
 5Duz+2sPy+6KPcj8P/x4bkruCDAWqVEnI8f1+8TglGBvTawblBuVLsmlpOSAnAcLouG/
 qazg==
X-Gm-Message-State: AOAM533jYMVPkhc7rhZjQdV5l9I3CfYq1QF6dZADt2+L5gp33Aw6br4B
 T2YK3nbwEzEU04PDzoWeTkwAKQ==
X-Google-Smtp-Source: ABdhPJxwIGycsk63vKJLB0sbAhgUklawMtfPoEs+Tpih4xbZJZMU8CIhZm2mPmMi1SSXRxhON+wDXQ==
X-Received: by 2002:a65:689a:: with SMTP id e26mr10835515pgt.413.1610685524704; 
 Thu, 14 Jan 2021 20:38:44 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id w131sm6621517pfc.46.2021.01.14.20.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 20:38:44 -0800 (PST)
Subject: Re: [PATCH 3/6] powerpc/rtas: remove ibm_suspend_me_token
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-4-nathanl@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <c1e60579-a731-9518-6834-5d441b66807d@ozlabs.ru>
Date: Fri, 15 Jan 2021 15:38:39 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210114220004.1138993-4-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, ajd@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 15/01/2021 09:00, Nathan Lynch wrote:
> There's not a compelling reason to cache the value of the token for
> the ibm,suspend-me function. Just look it up when needed in the RTAS
> syscall's special case for it.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>


Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
>   arch/powerpc/kernel/rtas.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index d126d71ea5bd..60fcf7f7b0b8 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -828,7 +828,6 @@ void rtas_activate_firmware(void)
>   		pr_err("ibm,activate-firmware failed (%i)\n", fwrc);
>   }
>   
> -static int ibm_suspend_me_token = RTAS_UNKNOWN_SERVICE;
>   #ifdef CONFIG_PPC_PSERIES
>   /**
>    * rtas_call_reentrant() - Used for reentrant rtas calls
> @@ -1103,7 +1102,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>   		return -EINVAL;
>   
>   	/* Need to handle ibm,suspend_me call specially */
> -	if (token == ibm_suspend_me_token) {
> +	if (token == rtas_token("ibm,suspend-me")) {
>   
>   		/*
>   		 * rtas_ibm_suspend_me assumes the streamid handle is in cpu
> @@ -1191,10 +1190,8 @@ void __init rtas_initialize(void)
>   	 * the stop-self token if any
>   	 */
>   #ifdef CONFIG_PPC64
> -	if (firmware_has_feature(FW_FEATURE_LPAR)) {
> +	if (firmware_has_feature(FW_FEATURE_LPAR))
>   		rtas_region = min(ppc64_rma_size, RTAS_INSTANTIATE_MAX);
> -		ibm_suspend_me_token = rtas_token("ibm,suspend-me");
> -	}
>   #endif
>   	rtas_rmo_buf = memblock_phys_alloc_range(RTAS_RMOBUF_MAX, PAGE_SIZE,
>   						 0, rtas_region);
> 

-- 
Alexey
