Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E36394C0E2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:21:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K8VOwfBK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfrNP0RVqz2yMJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 01:21:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K8VOwfBK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfrMj1VqKz2xZr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 01:20:32 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fd78c165eeso9197505ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 08:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723130430; x=1723735230; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SiZq70LSf/bCrrIvFZliDXUYPXu4ym37OR0vAgA3uYk=;
        b=K8VOwfBKYT46uEnOkFM6lOD+K0K4a9Jn01i9lugqA42/Pm7LM9xj0ni0OaA24KSmm6
         7MEcaInBYHSelsMHa1IAUPD0tKVCnVnECENOjWoosS3hetTOSNtBM2/ghqH2lBfPhbEk
         AsNbRCVJrXl2rxGckK6+tlfzT6vqUqcDWwFGIHGt3aKi/5XGKeL8p3tCxCed+LOZKpiN
         xjLLBOeRA1wxKCq80sa6GC0tmwlIdsYYeS4xJOlknl6Cj4AShA48rd7XV4cHyGpEaB8F
         4Mj4BZA3/edgm7CjIr9efqrCMkQES3SF9pYgxphrvFtZ4TA73Wt+8Cf5wJ2ceJCf+3sH
         mjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723130430; x=1723735230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiZq70LSf/bCrrIvFZliDXUYPXu4ym37OR0vAgA3uYk=;
        b=Qq0+32xXra3i/kl0rhP60UDk6na0yz/xF16EL5n/CDCLDf1vOqLRFg7O+rEnui0qyk
         FXnpc/IsNns3Rtp1lEc1YeugF8L+R7Mqj9ho2R26Gktk9EXsBFn2zdS2yRpeA2UFjv4s
         BrNrlFzyIMUIfFUqPrHoHjQOdLI3KDvwJ8seg8djuHqq0blXimSGI0gu29pJDg3D3daw
         8ovbRUbnsMRf3odLCfkr/36wAO/9RIn5ibOUj3PWhqV2RdRCodQOAQCjFOGSiRPHtgOD
         FBbftLj0aJQd25VLRUOyPs+ofsr+bMmpgF0GMyIH2PA5/m/teyXwO21kFV6nfw/uS9th
         9X1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWC8qJ4epZE+JuTwMzexuPajjIWlwGAYGfF8XVjnkZc5Mi3ZivCd30okILkEaJJvd5PraXofMLYqO81QoUNd/yjP1BKqFjv/2WPlWVtoQ==
X-Gm-Message-State: AOJu0YwI0IXa/5oQmOeueLCdCOuXXCG5OWtpQO5uA/QLYs0qtiryXMzT
	qSenSz72baCn8kGO7SuQhbeAc8PZ5wbRyghcxvFaFkn7xhtjpFzc
X-Google-Smtp-Source: AGHT+IE8816vdK61O2xaKdqeewiL3CLyGiq118QlvJdPwT9G6srmiOZdavzDEeaCFuHZvoihZEnIrA==
X-Received: by 2002:a17:903:41ce:b0:1fc:6901:9c2b with SMTP id d9443c01a7336-2009524a701mr30855585ad.23.1723130430254;
        Thu, 08 Aug 2024 08:20:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5928ee8dsm125869725ad.230.2024.08.08.08.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 08:20:29 -0700 (PDT)
Message-ID: <5e7c59c6-ec88-4ee3-8a5c-93a16e5f444e@roeck-us.net>
Date: Thu, 8 Aug 2024 08:20:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/mm: Fix size of allocated PGDIR
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andrew Morton <akpm@linux-foundation.org>
References: <1cdaacb391cbd3e0240f0e0faf691202874e9422.1723109462.git.christophe.leroy@csgroup.eu>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1cdaacb391cbd3e0240f0e0faf691202874e9422.1723109462.git.christophe.leroy@csgroup.eu>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/8/24 02:32, Christophe Leroy wrote:
> Commit 6b0e82791bd0 ("powerpc/e500: switch to 64 bits PGD on 85xx
> (32 bits)") increased the size of PGD entries but failed to increase
> the PGD directory.
> 
> Use the size of pgd_t instead of the size of pointers to calculate
> the allocated size.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 6b0e82791bd0 ("powerpc/e500: switch to 64 bits PGD on 85xx (32 bits)")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   arch/powerpc/mm/init-common.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
> index 9b4a675eb8f8..2978fcbe307e 100644
> --- a/arch/powerpc/mm/init-common.c
> +++ b/arch/powerpc/mm/init-common.c
> @@ -73,7 +73,7 @@ void setup_kup(void)
>   
>   #define CTOR(shift) static void ctor_##shift(void *addr) \
>   {							\
> -	memset(addr, 0, sizeof(void *) << (shift));	\
> +	memset(addr, 0, sizeof(pgd_t) << (shift));	\
>   }
>   
>   CTOR(0); CTOR(1); CTOR(2); CTOR(3); CTOR(4); CTOR(5); CTOR(6); CTOR(7);
> @@ -117,7 +117,7 @@ EXPORT_SYMBOL_GPL(pgtable_cache);	/* used by kvm_hv module */
>   void pgtable_cache_add(unsigned int shift)
>   {
>   	char *name;
> -	unsigned long table_size = sizeof(void *) << shift;
> +	unsigned long table_size = sizeof(pgd_t) << shift;
>   	unsigned long align = table_size;
>   
>   	/* When batching pgtable pointers for RCU freeing, we store

