Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D7A343CF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 10:39:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3qFn6QBdz3000
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 20:39:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=C2nhdFwg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=C2nhdFwg; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3qFK54zWz2xb5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 20:38:43 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id h25so8238887pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 02:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LYfx+Q1yLmXU/wuqtBDKnJDVZV1V/UemyPv+2Y1FQas=;
 b=C2nhdFwgKhHX5XsZVviN37clt1DPl/7+Xe1SQzJSawGUerDGCrU2z5vm9hbbsx6h5P
 znk9i3ps09bjwExPNLXFvhIKSwtjtk8E1VHh8fkTbSwzyi8g/0MnQoSJ32bQqiBR6Weh
 4Q/8sV+de+2tDZ/76dIcQNN7GdmVcD8gxTBkZ/X4A5V/6eQCLLgeyi5RFUIIvHFw8nb0
 qVGIdTFd0NxQY1FbdsTQlMlXYTLhyGxWTCHxVgT1+YVbipKhVFh/MdU39UXntzOm4qPj
 8R/MDrrEX9t9E9GE01lM9L+qDQ2bhZh55nfcFT/7sHDriVnwgRebPBliEqsdekOzX6fN
 6VqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LYfx+Q1yLmXU/wuqtBDKnJDVZV1V/UemyPv+2Y1FQas=;
 b=qtboCeNnDFNVkQ7E+iHAW04f3g2eX2naM7MT7b+BqikeAU9BOKdtb/melmRR6zRJcl
 hA3lpVS4pDUt0gh6VnxErUoJQTrlEP+JjGkd4gGWujcc4J0J0UUDns742D7Dpgxxn5Wr
 g1TiOpvchI3vcadulmjyicrQwekFQKpkg2EBgngVluM6sYr1aWEnXZaCFHapj1Eg871c
 ajQGm2FTNiRFJPHP8bSx1I4BnN489GtPBLpAZ2/t1FJHEX7UTHyC90rO+a4yxDr8MM4Q
 Q4eE+enZh9tyidFuf5lk93ITGPNCvkYz3fAk0jwjwhWu/hPydacIQwetlAeLszVx24mx
 Goig==
X-Gm-Message-State: AOAM530EeFx5ToMSUmfKFrLQHnTMgWZP8r+/Uc01la1M6dYRDnKK4y8u
 f86wDMhFgNDL7VGqgViUDqbJC4mSSMw+zdrw
X-Google-Smtp-Source: ABdhPJyuJLh+46KJWLP+dgBfoOdbtxWBGPm8/6c+zh7I5jUfPNudFTgRYumfA8si+D40Ty5rnxG3lw==
X-Received: by 2002:a63:4502:: with SMTP id s2mr22963225pga.94.1616405920731; 
 Mon, 22 Mar 2021 02:38:40 -0700 (PDT)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id v27sm13051901pfi.89.2021.03.22.02.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 02:38:40 -0700 (PDT)
Message-ID: <65ca9c57-c988-dc59-5c93-a2a33adb4b6a@ozlabs.ru>
Date: Mon, 22 Mar 2021 20:38:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH v3 24/41] powerpc: add set_dec_or_work API for safely
 updating decrementer
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-25-npiggin@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210305150638.2675513-25-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/03/2021 02:06, Nicholas Piggin wrote:
> Decrementer updates must always check for new irq work to avoid an
> irq work decrementer interrupt being lost.
> 
> Add an API for this in the timer code so callers don't have to care
> about details.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
>   arch/powerpc/include/asm/time.h |  9 +++++++++
>   arch/powerpc/kernel/time.c      | 20 +++++++++++---------
>   2 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> index 0128cd9769bc..d62bde57bf02 100644
> --- a/arch/powerpc/include/asm/time.h
> +++ b/arch/powerpc/include/asm/time.h
> @@ -78,6 +78,15 @@ static inline void set_dec(u64 val)
>   		mtspr(SPRN_DEC, val - 1);
>   }
>   
> +#ifdef CONFIG_IRQ_WORK
> +void set_dec_or_work(u64 val);
> +#else
> +static inline void set_dec_or_work(u64 val)
> +{
> +	set_dec(val);
> +}
> +#endif
> +
>   static inline unsigned long tb_ticks_since(unsigned long tstamp)
>   {
>   	return mftb() - tstamp;
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index c5d524622c17..341cc8442e5e 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -562,6 +562,15 @@ void arch_irq_work_raise(void)
>   	preempt_enable();
>   }
>   
> +void set_dec_or_work(u64 val)
> +{
> +	set_dec(val);
> +	/* We may have raced with new irq work */
> +	if (unlikely(test_irq_work_pending()))
> +		set_dec(1);
> +}
> +EXPORT_SYMBOL_GPL(set_dec_or_work);
> +
>   #else  /* CONFIG_IRQ_WORK */
>   
>   #define test_irq_work_pending()	0
> @@ -629,10 +638,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
>   	} else {
>   		now = *next_tb - now;
>   		if (now <= decrementer_max)
> -			set_dec(now);
> -		/* We may have raced with new irq work */
> -		if (test_irq_work_pending())
> -			set_dec(1);
> +			set_dec_or_work(now);
>   		__this_cpu_inc(irq_stat.timer_irqs_others);
>   	}
>   
> @@ -874,11 +880,7 @@ static int decrementer_set_next_event(unsigned long evt,
>   				      struct clock_event_device *dev)
>   {
>   	__this_cpu_write(decrementers_next_tb, get_tb() + evt);
> -	set_dec(evt);
> -
> -	/* We may have raced with new irq work */
> -	if (test_irq_work_pending())
> -		set_dec(1);
> +	set_dec_or_work(evt);
>   
>   	return 0;
>   }
> 

-- 
Alexey
