Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 122FC8CFEA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 11:44:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467l6K2LzszDqTw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 19:44:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=bsingharora@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jFuFnRB0"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467l2V5yj2zDqsr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 19:41:06 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id v12so5465441pfn.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LfFkLwjqyQIH9T75mSQkj/WAlvM62io+hnQFkWZp6Pc=;
 b=jFuFnRB0/8csf+W8FViKPIDaEmS37F+row4a3iyvUZTk3+UEYYsc/umedWVPXZUEPN
 LDdtmXgjxyfggY0JP9gzuxWNLkt9w7hpjz8XuE2kCmm80gh3Ki9JQxk9tWm1EBPlfH/K
 DP12ymtzlN9IHXiSHs19xPERgy/Qb624g0yuWHYl2dH4tQJSIcz8tQn7dX+ptc4xCSJz
 B5+5z3lM3tK0y5tdfekEiXiAa3s+bulCjpDfShlgK+v7H75t366TqhsaV7NYrIMciMC/
 qdUcENrR41a7h870LEPPVNzFj8aZQuAJJprtvNeh4/Pv5rXpcBKXNaVjOrJr6lJaZqWu
 frmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LfFkLwjqyQIH9T75mSQkj/WAlvM62io+hnQFkWZp6Pc=;
 b=Tbtzi7kHpTx3YhdhLrOVqrMhRIT91VqlY7j/CzGxrz/RUcmkcVpn0fFKnWQno582Ck
 tX/tRriviDV5LtHs4uhEeQG7qloltlSJHEu4lCU/cBT/LXA9QbJLaZseQatcKLqc5ex3
 ZJqDOKkdOAHOezLn9Kvui8Jfb7ScbBAlENu5jOCXFKohpb934e8Ux87Cx815Jyw6cUEd
 hgj7Y3XxFVlh383gjUEgqNhV6LydHZ2AwvkrpE7GxV8602BFkA/nVGCQrbgn40vmBbAG
 /KRt09rRiNEB1RNoObc3VHU4RKAqM7SWSR0W2wl19gSF2u2LOVLS4NwrFx6cXU70aXn7
 JMSg==
X-Gm-Message-State: APjAAAVTsT7spHy0YNhkhxBoz5aF0rDgy7WQE5QW0eI8r49GZDlIDpQz
 Mcf00s4XctKuGcMc89N03o8=
X-Google-Smtp-Source: APXvYqyRTX2xe/RXO2a1R4wAMFoGUHd/8F69mYx1bwHIiLNCMYtDwXDbG78SgJR7jpu9zRPE3C/+Kg==
X-Received: by 2002:a62:7a0f:: with SMTP id v15mr26284997pfc.35.1565775664294; 
 Wed, 14 Aug 2019 02:41:04 -0700 (PDT)
Received: from [192.168.68.119] (203-219-253-117.static.tpgi.com.au.
 [203.219.253.117])
 by smtp.gmail.com with ESMTPSA id i11sm17425385pfk.34.2019.08.14.02.41.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 02:41:03 -0700 (PDT)
Subject: Re: [PATCH v9 7/7] powerpc: add machine check safe copy_to_user
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
References: <20190812092236.16648-1-santosh@fossix.org>
 <20190812092236.16648-8-santosh@fossix.org>
From: Balbir Singh <bsingharora@gmail.com>
Message-ID: <74d12529-d068-0210-e229-5cea68bcf9da@gmail.com>
Date: Wed, 14 Aug 2019 19:40:58 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812092236.16648-8-santosh@fossix.org>
Content-Type: text/plain; charset=utf-8
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/8/19 7:22 pm, Santosh Sivaraj wrote:
> Use  memcpy_mcsafe() implementation to define copy_to_user_mcsafe()
> 
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---
>  arch/powerpc/Kconfig               |  1 +
>  arch/powerpc/include/asm/uaccess.h | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 77f6ebf97113..4316e36095a2 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -137,6 +137,7 @@ config PPC
>  	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
>  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UACCESS_FLUSHCACHE	if PPC64
> +	select ARCH_HAS_UACCESS_MCSAFE		if PPC64
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>  	select ARCH_KEEP_MEMBLOCK
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 8b03eb44e876..15002b51ff18 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -387,6 +387,20 @@ static inline unsigned long raw_copy_to_user(void __user *to,
>  	return ret;
>  }
>  
> +static __always_inline unsigned long __must_check
> +copy_to_user_mcsafe(void __user *to, const void *from, unsigned long n)
> +{
> +	if (likely(check_copy_size(from, n, true))) {
> +		if (access_ok(to, n)) {
> +			allow_write_to_user(to, n);
> +			n = memcpy_mcsafe((void *)to, from, n);
> +			prevent_write_to_user(to, n);
> +		}
> +	}
> +
> +	return n;

Do we always return n independent of the check_copy_size return value and access_ok return values?

Balbir Singh.

> +}
> +
>  extern unsigned long __clear_user(void __user *addr, unsigned long size);
>  
>  static inline unsigned long clear_user(void __user *addr, unsigned long size)
> 
