Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 764FB6D649A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 16:04:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrTzF1w82z3ch5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 00:04:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TrIW2UM8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fv0fNI06;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TrIW2UM8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fv0fNI06;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrTyN4gnCz3cJq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 00:03:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680617032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+eiQuy0297qofRfcSxKqcQyipv7GSPC3sFo1rtx/hWs=;
	b=TrIW2UM84QTciJZaQbRY4R6uJhA3yyagw6fR7txvIh9ql9oFyDKUJ4Pk536SMSerkmpvBo
	5iDcqxSEpGENmVhj+SNYD8XDHjf0wCs9jyIz/efjt/KEzDza3dK7G0l5o5GxsYQCG3Vn9z
	RS9rZivhd8jeTWPu8pXSQZuxMIzGpJc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680617033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+eiQuy0297qofRfcSxKqcQyipv7GSPC3sFo1rtx/hWs=;
	b=Fv0fNI06y/UdDNiDyi1e7ikp4q0OiNcf2HfmNnCr3v3s5qkn44gvovb9A6RNys+HeW0KnP
	zd8gywl2UGkEQ8wrUJNRUbRbkX34Nj//NihP/gR96/Z/8QCa59pJw0EgJ48BUYdslXV0LD
	rgfyU/0yXeH7f0s2jSIIQ28+VknFoAU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-s711xQ2LNRy-us6jvpLV0Q-1; Tue, 04 Apr 2023 10:03:46 -0400
X-MC-Unique: s711xQ2LNRy-us6jvpLV0Q-1
Received: by mail-wm1-f71.google.com with SMTP id ay37-20020a05600c1e2500b003ee69edec16so17851272wmb.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Apr 2023 07:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680617022;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+eiQuy0297qofRfcSxKqcQyipv7GSPC3sFo1rtx/hWs=;
        b=FDvOtisqjb6KO3MLMy+E6qqm4mjto80n3lU2qnXsmjeBlZXKLTHatY1A9Qzg6sPUV+
         OBPXJawS7jARureMdUy1GzYDBKZCZdHjgKVjIspogEP1UBsVA/7SZa8Wxxwmol+mGb2W
         K9zoloB16nkXag7Sg+16P99N3l2jmOjtHBYq6zg2RdaXEHUo12lVkK8HGFXd0yXjHytV
         TQSqp86o/0hFdSfW7wkrRmTgCA2iIxM86lxZ1htEViuoGSSArX6r7Un1I5A+buBGuzAq
         mx0YGz6vsj5FNX/75VMw6OzcXzp7TLgnmeHu+RpBXs7QgxwDuA69TQthTtgv2llwlVqx
         3UTg==
X-Gm-Message-State: AAQBX9cKqRokvyALV2PNjRHqzm15iwE0RScwurNKq/jCsezeX1T+59si
	uZlw9vh3zXkvNb0+Vi0u3iQhj5QYuCmA7QQViaVhD8WX8NQ+WVootFLJXyOXnM78y744m0br3ab
	N5AbJbgDDjaKzSbySrc5Nx4gt6Q==
X-Received: by 2002:a5d:6291:0:b0:2d6:5afe:7b99 with SMTP id k17-20020a5d6291000000b002d65afe7b99mr1501599wru.10.1680617021964;
        Tue, 04 Apr 2023 07:03:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZgF89ZubYczhCwXf0n6e5MiZ9Gbs+vNGbCQed6l+DJFU8EvLia/3dXAX7rxTgsIMUPc3yreQ==
X-Received: by 2002:a5d:6291:0:b0:2d6:5afe:7b99 with SMTP id k17-20020a5d6291000000b002d65afe7b99mr1501576wru.10.1680617021501;
        Tue, 04 Apr 2023 07:03:41 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:b600:e63:6c3b:7b5d:f439? (p200300cbc709b6000e636c3b7b5df439.dip0.t-ipconnect.de. [2003:cb:c709:b600:e63:6c3b:7b5d:f439])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d5591000000b002eaac3a9beesm2694936wrv.8.2023.04.04.07.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 07:03:40 -0700 (PDT)
Message-ID: <d21bfe1d-46e6-5547-cdcb-0d851bf0834a@redhat.com>
Date: Tue, 4 Apr 2023 16:03:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
To: Yair Podemsky <ypodemsk@redhat.com>, linux@armlinux.org.uk,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, will@kernel.org,
 aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, peterz@infradead.org,
 arnd@arndb.de, keescook@chromium.org, paulmck@kernel.org,
 jpoimboe@kernel.org, samitolvanen@google.com, frederic@kernel.org,
 ardb@kernel.org, juerg.haefliger@canonical.com, rmk+kernel@armlinux.org.uk,
 geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org,
 sebastian.reichel@collabora.com, nick.hawkins@hpe.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org,
 mtosatti@redhat.com, vschneid@redhat.com, dhildenb@redhat.com
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230404134224.137038-4-ypodemsk@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: alougovs@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04.04.23 15:42, Yair Podemsky wrote:
> The tlb_remove_table_smp_sync IPI is used to ensure the outdated tlb page
> is not currently being accessed and can be cleared.
> This occurs once all CPUs have left the lockless gup code section.
> If they reenter the page table walk, the pointers will be to the new
> pages.
> Therefore the IPI is only needed for CPUs in kernel mode.
> By preventing the IPI from being sent to CPUs not in kernel mode,
> Latencies are reduced.
> 
> Race conditions considerations:
> The context state check is vulnerable to race conditions between the
> moment the context state is read to when the IPI is sent (or not).
> 
> Here are these scenarios.
> case 1:
> CPU-A                                             CPU-B
> 
>                                                    state == CONTEXT_KERNEL
> int state = atomic_read(&ct->state);
>                                                    Kernel-exit:
>                                                    state == CONTEXT_USER
> if (state & CT_STATE_MASK == CONTEXT_KERNEL)
> 
> In this case, the IPI will be sent to CPU-B despite it is no longer in
> the kernel. The consequence of which would be an unnecessary IPI being
> handled by CPU-B, causing a reduction in latency.
> This would have been the case every time without this patch.
> 
> case 2:
> CPU-A                                             CPU-B
> 
> modify pagetables
> tlb_flush (memory barrier)
>                                                    state == CONTEXT_USER
> int state = atomic_read(&ct->state);
>                                                    Kernel-enter:
>                                                    state == CONTEXT_KERNEL
>                                                    READ(pagetable values)
> if (state & CT_STATE_MASK == CONTEXT_USER)
> 
> In this case, the IPI will not be sent to CPU-B despite it returning to
> the kernel and even reading the pagetable.
> However since this CPU-B has entered the pagetable after the
> modification it is reading the new, safe values.
> 
> The only case when this IPI is truly necessary is when CPU-B has entered
> the lockless gup code section before the pagetable modifications and
> has yet to exit them, in which case it is still in the kernel.
> 
> Signed-off-by: Yair Podemsky <ypodemsk@redhat.com>
> ---
>   mm/mmu_gather.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
> index 5ea9be6fb87c..731d955e152d 100644
> --- a/mm/mmu_gather.c
> +++ b/mm/mmu_gather.c
> @@ -9,6 +9,7 @@
>   #include <linux/smp.h>
>   #include <linux/swap.h>
>   #include <linux/rmap.h>
> +#include <linux/context_tracking_state.h>
>   
>   #include <asm/pgalloc.h>
>   #include <asm/tlb.h>
> @@ -191,6 +192,20 @@ static void tlb_remove_table_smp_sync(void *arg)
>   	/* Simply deliver the interrupt */
>   }
>   
> +
> +#ifdef CONFIG_CONTEXT_TRACKING
> +static bool cpu_in_kernel(int cpu, void *info)
> +{
> +	struct context_tracking *ct = per_cpu_ptr(&context_tracking, cpu);
> +	int state = atomic_read(&ct->state);
> +	/* will return true only for cpus in kernel space */
> +	return state & CT_STATE_MASK == CONTEXT_KERNEL;
> +}
> +#define CONTEXT_PREDICATE cpu_in_kernel
> +#else
> +#define CONTEXT_PREDICATE NULL
> +#endif /* CONFIG_CONTEXT_TRACKING */
> +
>   #ifdef CONFIG_ARCH_HAS_CPUMASK_BITS
>   #define REMOVE_TABLE_IPI_MASK mm_cpumask(mm)
>   #else
> @@ -206,8 +221,8 @@ void tlb_remove_table_sync_one(struct mm_struct *mm)
>   	 * It is however sufficient for software page-table walkers that rely on
>   	 * IRQ disabling.
>   	 */
> -	on_each_cpu_mask(REMOVE_TABLE_IPI_MASK, tlb_remove_table_smp_sync,
> -			NULL, true);
> +	on_each_cpu_cond_mask(CONTEXT_PREDICATE, tlb_remove_table_smp_sync,
> +			NULL, true, REMOVE_TABLE_IPI_MASK);
>   }
>   
>   static void tlb_remove_table_rcu(struct rcu_head *head)


Maybe a bit cleaner by avoiding CONTEXT_PREDICATE, still not completely nice
(an empty dummy function "cpu_maybe_in_kernel" might be cleanest but would
be slightly slower for !CONFIG_CONTEXT_TRACKING):

#ifdef CONFIG_CONTEXT_TRACKING
static bool cpu_in_kernel(int cpu, void *info)
{
	struct context_tracking *ct = per_cpu_ptr(&context_tracking, cpu);
	int state = atomic_read(&ct->state);
	/* will return true only for cpus in kernel space */
	return state & CT_STATE_MASK == CONTEXT_KERNEL;
}
#endif /* CONFIG_CONTEXT_TRACKING */


...
#ifdef CONFIG_CONTEXT_TRACKING
	on_each_cpu_mask(REMOVE_TABLE_IPI_MASK, tlb_remove_table_smp_sync,
			 NULL, true);
#else /* CONFIG_CONTEXT_TRACKING */
	on_each_cpu_cond_mask(cpu_in_kernel, tlb_remove_table_smp_sync,
			      NULL, true, REMOVE_TABLE_IPI_MASK);
#endif /* CONFIG_CONTEXT_TRACKING */


-- 
Thanks,

David / dhildenb

