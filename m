Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BE02F71B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 05:49:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH7yJ2QgTzDsVd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 15:49:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=NbIIti0L; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH7kF1WzPzDsZy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 15:39:16 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id i5so5248821pgo.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 20:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Kj7rU+M2oFjtexZ1WbXvXfRHdFlkkddozHQCUMf0eU=;
 b=NbIIti0LbNV4l9UIL4pZFADLFf/Gh7jBmZOtFUX9mc8Z+lsxgFXHWVxq6rKE4+CdNC
 qnyqRTidNbqprOZKBPaYKFWch3cPKmn25PT1j7d5sa1e09gcrEFacz1bzc+huFIDbGCC
 G2ZHLMiM/E+OXzfg3zHxZcgFCfFVzhNbikuzx2eODl1i03MvsanmKVVfWMouZnVvhme2
 yRtKPtX/WihVR2JwAccZ/sgnx11IukO+KLP3xwDD4iURqe7GBXk1DlHxBlya0WqYwRVK
 QLzU7qwGupZ60HT8nmRgMmtGbm4i4O/MkY9r5sS9F/51FWQsKbLSfCIFOfJW42/WwJSO
 u0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Kj7rU+M2oFjtexZ1WbXvXfRHdFlkkddozHQCUMf0eU=;
 b=Bqio4PyU1/hSkH9B30PluyfvNwWW2tOaqGgVfVAxzO6mBtcCku/CbwzbdGeUC1N1x1
 Xpg3LWSfRkVVuQaks9ZKLVzkvNXEpFIibjsdCwjR8AIv/J8TpXvRTZXpvmiysiEyOVgg
 mVvGpAb7t7JcelbR5yW1bWDscvoezZPD9E+w3zvjnEawb92d+F2qfaZEs2skNIIzBMLK
 A51RILYbU1zNZQEbPP9U051tiyySbGc4bFRmfLNjyGhzgK01mTJqlnrpwNdvc0ZHAH24
 ZTZx8aKyiamjGUFvGyrrFJ+Fx5rnylxnb6ZF4HdF2Qb0AmnHkzSf/EMPmVa66DY2fPHq
 c0pA==
X-Gm-Message-State: AOAM5300HNAwJdVM7kAvgkwMpxxxkHvcI2NCfWqmvnjJ9PKrfH0rgmBs
 5EUOqWm2DeLR4EgRhVmuZ+kV8A==
X-Google-Smtp-Source: ABdhPJyWzKjYHaqwhi4/mWMUuYsFvleZECf67dAr50fMQTMAQwY4IjN+yecJxFjMFpwhLV9llbTAPg==
X-Received: by 2002:a65:654e:: with SMTP id a14mr10834940pgw.265.1610685554647; 
 Thu, 14 Jan 2021 20:39:14 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id p22sm7082007pgk.21.2021.01.14.20.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 20:39:14 -0800 (PST)
Subject: Re: [PATCH 4/6] powerpc/rtas: move syscall filter setup into separate
 function
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-5-nathanl@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <20e340a9-0c61-cb21-659f-cf60d75f3cd3@ozlabs.ru>
Date: Fri, 15 Jan 2021 15:39:08 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210114220004.1138993-5-nathanl@linux.ibm.com>
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
> Reduce conditionally compiled sections within rtas_initialize() by
> moving the filter table initialization into its own function already
> guarded by CONFIG_PPC_RTAS_FILTER. No behavior change intended.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>   arch/powerpc/kernel/rtas.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 60fcf7f7b0b8..55f6aa170e57 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1051,6 +1051,16 @@ static bool block_rtas_call(int token, int nargs,
>   	return true;
>   }
>   
> +static void __init rtas_syscall_filter_init(void)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(rtas_filters); i++) {
> +		rtas_filters[i].token = rtas_token(rtas_filters[i].name);
> +	}
> +

Unnecessary curly braces (I understand it is cut-n-paste but still) and 
an empty line. Otherwise:

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



> +}
> +
>   #else
>   
>   static bool block_rtas_call(int token, int nargs,
> @@ -1059,6 +1069,10 @@ static bool block_rtas_call(int token, int nargs,
>   	return false;
>   }
>   
> +static void __init rtas_syscall_filter_init(void)
> +{
> +}
> +
>   #endif /* CONFIG_PPC_RTAS_FILTER */
>   
>   /* We assume to be passed big endian arguments */
> @@ -1162,9 +1176,6 @@ void __init rtas_initialize(void)
>   	unsigned long rtas_region = RTAS_INSTANTIATE_MAX;
>   	u32 base, size, entry;
>   	int no_base, no_size, no_entry;
> -#ifdef CONFIG_PPC_RTAS_FILTER
> -	int i;
> -#endif
>   
>   	/* Get RTAS dev node and fill up our "rtas" structure with infos
>   	 * about it.
> @@ -1203,11 +1214,7 @@ void __init rtas_initialize(void)
>   	rtas_last_error_token = rtas_token("rtas-last-error");
>   #endif
>   
> -#ifdef CONFIG_PPC_RTAS_FILTER
> -	for (i = 0; i < ARRAY_SIZE(rtas_filters); i++) {
> -		rtas_filters[i].token = rtas_token(rtas_filters[i].name);
> -	}
> -#endif
> +	rtas_syscall_filter_init();
>   }
>   
>   int __init early_init_dt_scan_rtas(unsigned long node,
> 

-- 
Alexey
