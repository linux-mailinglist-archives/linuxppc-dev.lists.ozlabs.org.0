Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C541E3AE1D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 05:14:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7ZPm3tGWz308h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 13:14:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=Ly8+LdS+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Ly8+LdS+; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7ZPF57nQz2yx2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 13:13:51 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id g192so4861489pfb.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 20:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Wze939aefA5PRCWTTx2ECjNbC/4jKslYlazXWOmibac=;
 b=Ly8+LdS+crvfc9rYevIpqHS7L6S3lp2Onsjz7GI/PWw+JW709QxZQR4VKy4qkiOfdG
 DFXh7DZhR3z0DFb/VgTQZnILlEgD/Dg5mO0VAPmBxoRU88VSlTqcoBvKh0r22P1K6IcT
 gaga6B1V6Dx5pi5IHaQBheF4NxX1K7JGkfluU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Wze939aefA5PRCWTTx2ECjNbC/4jKslYlazXWOmibac=;
 b=ubBTs8I1icgrcZ/Wb/2FxQu24cmDzidZZIVFGtyF6nLu3ZtRIs6650UxYM9sG3qEOE
 aY6FCjvqI6Ao82pmhChOm1wo/Z7swD6J/MVcEvjcLSP0cGP79Y7pqCjQP54t3/jjQa6T
 YzAaxL7d4ngNJQ8JtXR2Pgk1Bt+79V+sPEDBZe4N8tAkjK/bfFIZbUxnWalfL6yeMcBC
 8PElfmbpgQ2aGS4Jq5hZJ+3zXU8LnB+u3GD5TT/zhota4zS/KDApAtjtUrc0qcFIgf9m
 7yruOm33p00CGWjYTKC52qC+lT1kplL4bedC9x3JNGgxOdQt0i6RmfIJMNVSj6JjQWCi
 VWvg==
X-Gm-Message-State: AOAM531RK4uE+W1EGvvSqyH7fQ5lcWIHI+8gSNab55ubvNsIyKPsyGAZ
 wUtzKvOhojE7OXlCY/gk1rdJOw==
X-Google-Smtp-Source: ABdhPJyBafYE/Wt6CLuVq2VJ2d4ASgZF4B3KRbYeIRoyXptAUPSOukQDYWkbWRN2jHyauLWMdL2+Hw==
X-Received: by 2002:a62:53c1:0:b029:2ef:25e8:d9e5 with SMTP id
 h184-20020a6253c10000b02902ef25e8d9e5mr17338587pfb.74.1624245226719; 
 Sun, 20 Jun 2021 20:13:46 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id g8sm14651950pja.14.2021.06.20.20.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 20:13:46 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: "Christopher M. Riedl" <cmr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RESEND PATCH v4 05/11] powerpc/64s: Add ability to skip SLB
 preload
In-Reply-To: <20210506043452.9674-6-cmr@linux.ibm.com>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
 <20210506043452.9674-6-cmr@linux.ibm.com>
Date: Mon, 21 Jun 2021 13:13:42 +1000
Message-ID: <87sg1bj4ex.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Christopher M. Riedl" <cmr@linux.ibm.com> writes:

> Switching to a different mm with Hash translation causes SLB entries to
> be preloaded from the current thread_info. This reduces SLB faults, for
> example when threads share a common mm but operate on different address
> ranges.
>
> Preloading entries from the thread_info struct may not always be
> appropriate - such as when switching to a temporary mm. Introduce a new
> boolean in mm_context_t to skip the SLB preload entirely. Also move the
> SLB preload code into a separate function since switch_slb() is already
> quite long. The default behavior (preloading SLB entries from the
> current thread_info struct) remains unchanged.
>
> Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
>
> ---
>
> v4:  * New to series.
> ---
>  arch/powerpc/include/asm/book3s/64/mmu.h |  3 ++
>  arch/powerpc/include/asm/mmu_context.h   | 13 ++++++
>  arch/powerpc/mm/book3s64/mmu_context.c   |  2 +
>  arch/powerpc/mm/book3s64/slb.c           | 56 ++++++++++++++----------
>  4 files changed, 50 insertions(+), 24 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index eace8c3f7b0a1..b23a9dcdee5af 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -130,6 +130,9 @@ typedef struct {
>  	u32 pkey_allocation_map;
>  	s16 execute_only_pkey; /* key holding execute-only protection */
>  #endif
> +
> +	/* Do not preload SLB entries from thread_info during switch_slb() */
> +	bool skip_slb_preload;
>  } mm_context_t;
>  
>  static inline u16 mm_ctx_user_psize(mm_context_t *ctx)
> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
> index 4bc45d3ed8b0e..264787e90b1a1 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -298,6 +298,19 @@ static inline int arch_dup_mmap(struct mm_struct *oldmm,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PPC_BOOK3S_64
> +
> +static inline void skip_slb_preload_mm(struct mm_struct *mm)
> +{
> +	mm->context.skip_slb_preload = true;
> +}
> +
> +#else
> +
> +static inline void skip_slb_preload_mm(struct mm_struct *mm) {}
> +
> +#endif /* CONFIG_PPC_BOOK3S_64 */
> +
>  #include <asm-generic/mmu_context.h>
>  
>  #endif /* __KERNEL__ */
> diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
> index c10fc8a72fb37..3479910264c59 100644
> --- a/arch/powerpc/mm/book3s64/mmu_context.c
> +++ b/arch/powerpc/mm/book3s64/mmu_context.c
> @@ -202,6 +202,8 @@ int init_new_context(struct task_struct *tsk, struct mm_struct *mm)
>  	atomic_set(&mm->context.active_cpus, 0);
>  	atomic_set(&mm->context.copros, 0);
>  
> +	mm->context.skip_slb_preload = false;
> +
>  	return 0;
>  }
>  
> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
> index c91bd85eb90e3..da0836cb855af 100644
> --- a/arch/powerpc/mm/book3s64/slb.c
> +++ b/arch/powerpc/mm/book3s64/slb.c
> @@ -441,10 +441,39 @@ static void slb_cache_slbie_user(unsigned int index)
>  	asm volatile("slbie %0" : : "r" (slbie_data));
>  }
>  
> +static void preload_slb_entries(struct task_struct *tsk, struct mm_struct *mm)
Should this be explicitly inline or even __always_inline? I'm thinking
switch_slb is probably a fairly hot path on hash?

> +{
> +	struct thread_info *ti = task_thread_info(tsk);
> +	unsigned char i;
> +
> +	/*
> +	 * We gradually age out SLBs after a number of context switches to
> +	 * reduce reload overhead of unused entries (like we do with FP/VEC
> +	 * reload). Each time we wrap 256 switches, take an entry out of the
> +	 * SLB preload cache.
> +	 */
> +	tsk->thread.load_slb++;
> +	if (!tsk->thread.load_slb) {
> +		unsigned long pc = KSTK_EIP(tsk);
> +
> +		preload_age(ti);
> +		preload_add(ti, pc);
> +	}
> +
> +	for (i = 0; i < ti->slb_preload_nr; i++) {
> +		unsigned char idx;
> +		unsigned long ea;
> +
> +		idx = (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
> +		ea = (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT;
> +
> +		slb_allocate_user(mm, ea);
> +	}
> +}
> +
>  /* Flush all user entries from the segment table of the current processor. */
>  void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
>  {
> -	struct thread_info *ti = task_thread_info(tsk);
>  	unsigned char i;
>  
>  	/*
> @@ -502,29 +531,8 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
>  
>  	copy_mm_to_paca(mm);
>  
> -	/*
> -	 * We gradually age out SLBs after a number of context switches to
> -	 * reduce reload overhead of unused entries (like we do with FP/VEC
> -	 * reload). Each time we wrap 256 switches, take an entry out of the
> -	 * SLB preload cache.
> -	 */
> -	tsk->thread.load_slb++;
> -	if (!tsk->thread.load_slb) {
> -		unsigned long pc = KSTK_EIP(tsk);
> -
> -		preload_age(ti);
> -		preload_add(ti, pc);
> -	}
> -
> -	for (i = 0; i < ti->slb_preload_nr; i++) {
> -		unsigned char idx;
> -		unsigned long ea;
> -
> -		idx = (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
> -		ea = (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT;
> -
> -		slb_allocate_user(mm, ea);
> -	}
> +	if (!mm->context.skip_slb_preload)
> +		preload_slb_entries(tsk, mm);

Should this be wrapped in likely()?

>  
>  	/*
>  	 * Synchronize slbmte preloads with possible subsequent user memory

Right below this comment is the isync. It seems to be specifically
concerned with synchronising preloaded slbs. Do you need it if you are
skipping SLB preloads?

It's probably not a big deal to have an extra isync in the fairly rare
path when we're skipping preloads, but I thought I'd check.

Kind regards,
Daniel

> -- 
> 2.26.1
