Return-Path: <linuxppc-dev+bounces-7889-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D23EA963B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 11:12:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zhc1w0wwLz2yr4;
	Tue, 22 Apr 2025 19:12:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745313124;
	cv=none; b=SCR1Mb0g8ChLxFL53cdHT9sd4O9mt2hs2Az0Obozmcxl1KQaJ6c90eaD3jg+zjxPly7FqN5C2yLzKh5l8BmE3eBXpSdEW/mQoKSoO8KH755NoKsQ0hjU7Ajt98ZtcQl+MQPqcne840mvwNRnUgxyV5B39E9xDO/RwG0QiK8MARsmuHC2PnUFiEEtKBY/j/q3ShbtnAYOFLGzyrRW7tcPLiofksINozqv9pRhitcOGy6C0wju9OCW0DvxE+KfSLw2hUbfKx9+1bGdVq8wjnb4BSP2OIN3glaoismQvFLxrssUPThRFWYwptZ/2Xv+llEKqRaAalBMCjkF5vb2cWGSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745313124; c=relaxed/relaxed;
	bh=vNQhtMzboJsKqrUjFlhlWpbiOnbOUnEHjsqB+mLSfIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XijdMRsNs8oCGFwX+frT+o/qviMYZUl91QJfnjZxQRwf9wqbWZeu3R9IOLR2f9dKRaK9vMbJ56pmSUvfbU95z/S17hC/bMcMwYY4PZTPJ4vcOyNbtSqkGebeUyLrbUDmKmJwTb4PiayauCACix9pfDG42kYBH8ohHkZpbdd5lDCKLvg8pbL1bnLloByGFMCH++9ZA8Bsrsvgyg60ALThUi+9nViSx6l8MC33bQUGS/Lh70f1pSEQaL4i1vR+lH8biVnpU/jLd4QmLJbkdDyeRAgd9i6is6c6xyROad3fCnLVP2JWPfJAqihJ7dDB97C/SyNq7y2ImCqb6eNfIR/zPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VtGLUuAS; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=james.clark@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VtGLUuAS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=james.clark@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zhc1t2Wfdz2yqT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 19:12:01 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso47006815e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 02:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745313117; x=1745917917; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vNQhtMzboJsKqrUjFlhlWpbiOnbOUnEHjsqB+mLSfIY=;
        b=VtGLUuASviCL4tKW+HB8bZhSCsds40xg12qthZpE/8TWB1jY48CCxTtp3rFgu2Sf23
         9o5wtHfzvb92i1HTN5XsY7Paj/kQGHurQZO3jTQIbdT02D1XquDE3shCrzoK60o6XXuc
         dUF/ykBgOPCyJm+WK7zz/aUCKQ1hLqrV3Hkadzfo4CkYUXPhbJgmDNaiHLLrOj8CwtNF
         v1zV6JoaWquryIOEzVIyl3GZ2LQ1n3l559IFvRKBhIY95RbpCHDlCwhIYy25wIFK6pIT
         n2Zj0Ya/6OiR+V+RJ2OM1lA720ET+jQmcWJTiLXSCMmJjo71I7px5hNbvGQkzmbtrCrW
         je+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745313117; x=1745917917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vNQhtMzboJsKqrUjFlhlWpbiOnbOUnEHjsqB+mLSfIY=;
        b=bjstGAgrl6IfJ/LfLkUd1AHGNRCWyQa3i6SDYfs8oNnZLrQ8MR12VaAIiw6bM7KYrY
         0mlNA1hS3T8ZA1cxChVAzaACjRRubnzNAiMtXfzEUUG6atxs4CCGIacbq+FcV9rdrhQR
         QAgz0plfS6lSoegeoYxIe2XUxtj+UtyQHyIqyb0v/0m8eLSHzBiC1QyRG8G+jDJ1mZpj
         bQ3J3I9Vousv1s0UpehRXaysjWH2mE9TVtA9mgzkpbp444CpIikI51KmuY3MQV49YtQV
         95TuyyeWncJOwtyOKARsiHVrRWxUp+pdG2CXia+Xdjx1+sCDoqS321NBRroVcGg93oas
         1yPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvpjmGoCz5qpTw/QAXOzVKRvnLujhLQG3c8hdsiP4ynfoTrPHBuLNu9G0B1XwylcUMr9seSs8W7aKYA6c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQLyRNOVib/UxU+2LWdyJUVudfCwv9snXdWn/YI6o/Lx7nFk+x
	ZGfxHUgzJgvt6mqPFAEE70V8vzyIeyLh0c+PZiP6WBt0WP8QDBc31Mbt+/i5EC4=
X-Gm-Gg: ASbGncvHB5Fj53hs8RpG3wB8XvsdFYzelLYCioTQardBlCojqTvm4BCd8G+5NJpYbrS
	c9b4DVduCKjV7b4yyC3HX6uZk98/lq8Wo6wAowlsU8y9A5qS2Rn7DCoBGOBfGgHQzWBrPEGgN31
	7RYhQOlkBlpRqcBI0J4UpU8BgD248IItF+iLqazAKEcfqOml8Ntg2Cv3llpz9OD8L8+T71dyopD
	kg24y9/+/Nw7tctsMupItPp8fQO+RMhNxcAEEL35ZIIZ0jPneEZO5k2lFeEI3DCN4xAqjvYjNGp
	Fd4AhRRlyJa2I+IyZv5RWfkSaLKX0LFdPTuMZpSEegw=
X-Google-Smtp-Source: AGHT+IGPpbum0KsQcE9z8vl2RfdveoyjLjKiZigrimsFoHNByQt297/k0WCP9oipkvXobXbABwmLAA==
X-Received: by 2002:a5d:5f93:0:b0:39c:140b:feec with SMTP id ffacd0b85a97d-39efba384cemr9947675f8f.7.1745313117068;
        Tue, 22 Apr 2025 02:11:57 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4933e7sm14681335f8f.65.2025.04.22.02.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 02:11:56 -0700 (PDT)
Message-ID: <0f2b7c10-a30a-4d2e-ac3f-baec1b45d945@linaro.org>
Date: Tue, 22 Apr 2025 10:11:55 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools headers: Update the include/vdso/unaligned.h to
 sync headers
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
 disgoel@linux.vnet.ibm.com, hbathini@linux.vnet.ibm.com,
 Aditya.Bodkhe1@ibm.com, jiang.peng9@zte.com.cn, venkat88@linux.ibm.com,
 Tejas.Manhas1@ibm.com, acme@kernel.org, jolsa@kernel.org,
 adrian.hunter@intel.com, irogers@google.com, namhyung@kernel.org
References: <20250421034143.67607-1-atrajeev@linux.ibm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250421034143.67607-1-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 21/04/2025 4:41 am, Athira Rajeev wrote:
> To pick up the changes in:
> 	commit acea9943271b ("vdso: Address variable shadowing in macros")
> 
> Addressing this perf tools build warning:
> 
> 	diff -u tools/include/vdso/unaligned.h include/vdso/unaligned.h
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> ---
>   tools/include/vdso/unaligned.h | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/include/vdso/unaligned.h b/tools/include/vdso/unaligned.h
> index eee3d2a4dbe4..ff0c06b6513e 100644
> --- a/tools/include/vdso/unaligned.h
> +++ b/tools/include/vdso/unaligned.h
> @@ -2,14 +2,14 @@
>   #ifndef __VDSO_UNALIGNED_H
>   #define __VDSO_UNALIGNED_H
>   
> -#define __get_unaligned_t(type, ptr) ({						\
> -	const struct { type x; } __packed *__pptr = (typeof(__pptr))(ptr);	\
> -	__pptr->x;								\
> +#define __get_unaligned_t(type, ptr) ({							\
> +	const struct { type x; } __packed * __get_pptr = (typeof(__get_pptr))(ptr);	\
> +	__get_pptr->x;									\
>   })
>   
> -#define __put_unaligned_t(type, val, ptr) do {					\
> -	struct { type x; } __packed *__pptr = (typeof(__pptr))(ptr);		\
> -	__pptr->x = (val);							\
> +#define __put_unaligned_t(type, val, ptr) do {						\
> +	struct { type x; } __packed * __put_pptr = (typeof(__put_pptr))(ptr);		\
> +	__put_pptr->x = (val);								\
>   } while (0)
>   
>   #endif /* __VDSO_UNALIGNED_H */

Reviewed-by: James Clark <james.clark@linaro.org>


