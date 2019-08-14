Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7392C8CF48
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 11:24:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467kft1Db8zDqQF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 19:24:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=bsingharora@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pZV58FB9"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467kcf2H4czDqPN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 19:22:10 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 196so6059237pfz.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 02:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o5VgXZSr3CkOKGeSUVxEPdzuhdzMHUJ4B37bTJdSkiA=;
 b=pZV58FB92yTQ58cFWIY0ZrR9WepwOaEZQCnUq50sbyNa7k9L6MBWPEX92IZuybhEq3
 yI2BD/pDGWGYbOcUJUKBuRR23L845lxAbNW9j/cvj0I2bGcKq+iloz3i5e1P1EFfywR8
 xBUgJjQFOml6qUhkad76CFVHSJB3NQU4WOA1+3keR8hFivk29EexKY90XVd542j6K5HL
 vkbqW8Eeqqmr1Kz5RXNU286kuc6Sl2khJfj1YV4mqSf+QScckN4ZP+65ynr99CtRr02A
 dEjNAsbk2KmaNPBYC73azwiMUeJU7JOtUK1ihuN4r+8k7r0oiIcyoy3ddEulEZE+McMC
 3Dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o5VgXZSr3CkOKGeSUVxEPdzuhdzMHUJ4B37bTJdSkiA=;
 b=iokiMpk/Xa2oMshkf/uOztzb5S9lvh7pFI7WYed3iSFfJHeZMbFWUIoZATs7LJnR+e
 JN7l55q5hFnO+RpLKXFu97q5qiVheVoncAVtD3Cns9ialLxg3r0FTarTc0ijPy/BysRQ
 ddoOck+3+9uB7Ut8rpRsz2bwdQNzg33NKVOinRctTDTvEpI5+NxEU1XYwoj+4rc1ydSJ
 jMB195X/4a77/nL312xsI53dBCO5BeQWaifKpQLwBqVJG6ZwfEfSo/mF8E4BdorDNCc2
 onp/zN4fl42y1em5hQLR9SJgOvfeQ6f0ZLb6jgsC3hmEGobvw8fe/e1LCk6DH+uYcmdF
 GItw==
X-Gm-Message-State: APjAAAWlUmw6TEw4HuOT1MsOrCDpjv0PenhKQmLcZ6nhE8ESiKnf2m8T
 XymEt5pVI1/3W5WXd0S+U2M=
X-Google-Smtp-Source: APXvYqyiPptI/2rCkwsakVEWWwtICO6KfW5npJicVHWbTzex5WmfJr7zoLsHbjzFHyG4jJH65NIzwg==
X-Received: by 2002:a17:90a:3465:: with SMTP id
 o92mr6113026pjb.20.1565774527842; 
 Wed, 14 Aug 2019 02:22:07 -0700 (PDT)
Received: from [192.168.68.119] (203-219-253-117.static.tpgi.com.au.
 [203.219.253.117])
 by smtp.gmail.com with ESMTPSA id m6sm113712457pfb.151.2019.08.14.02.22.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 02:22:07 -0700 (PDT)
Subject: Re: [PATCH v9 4/7] extable: Add function to search only kernel
 exception table
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
References: <20190812092236.16648-1-santosh@fossix.org>
 <20190812092236.16648-5-santosh@fossix.org>
From: Balbir Singh <bsingharora@gmail.com>
Message-ID: <916d5741-a0bd-8860-4a38-7a5ef677214a@gmail.com>
Date: Wed, 14 Aug 2019 19:22:00 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812092236.16648-5-santosh@fossix.org>
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
 Thomas Gleixner <tglx@linutronix.de>, Reza Arbab <arbab@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/8/19 7:22 pm, Santosh Sivaraj wrote:
> Certain architecture specific operating modes (e.g., in powerpc machine
> check handler that is unable to access vmalloc memory), the
> search_exception_tables cannot be called because it also searches the
> module exception tables if entry is not found in the kernel exception
> table.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  include/linux/extable.h |  2 ++
>  kernel/extable.c        | 11 +++++++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/extable.h b/include/linux/extable.h
> index 41c5b3a25f67..81ecfaa83ad3 100644
> --- a/include/linux/extable.h
> +++ b/include/linux/extable.h
> @@ -19,6 +19,8 @@ void trim_init_extable(struct module *m);
>  
>  /* Given an address, look for it in the exception tables */
>  const struct exception_table_entry *search_exception_tables(unsigned long add);
> +const struct exception_table_entry *
> +search_kernel_exception_table(unsigned long addr);
> 

Can we find a better name search_kernel still sounds like all of the kernel.
Can we rename it to search_kernel_linear_map_extable?

 
>  #ifdef CONFIG_MODULES
>  /* For extable.c to search modules' exception tables. */
> diff --git a/kernel/extable.c b/kernel/extable.c
> index e23cce6e6092..f6c9406eec7d 100644
> --- a/kernel/extable.c
> +++ b/kernel/extable.c
> @@ -40,13 +40,20 @@ void __init sort_main_extable(void)
>  	}
>  }
>  
> +/* Given an address, look for it in the kernel exception table */
> +const
> +struct exception_table_entry *search_kernel_exception_table(unsigned long addr)
> +{
> +	return search_extable(__start___ex_table,
> +			      __stop___ex_table - __start___ex_table, addr);
> +}
> +
>  /* Given an address, look for it in the exception tables. */
>  const struct exception_table_entry *search_exception_tables(unsigned long addr)
>  {
>  	const struct exception_table_entry *e;
>  
> -	e = search_extable(__start___ex_table,
> -			   __stop___ex_table - __start___ex_table, addr);
> +	e = search_kernel_exception_table(addr);
>  	if (!e)
>  		e = search_module_extables(addr);
>  	return e;
> 
