Return-Path: <linuxppc-dev+bounces-13625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2ACC234A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 06:31:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyV2L3j83z2xlK;
	Fri, 31 Oct 2025 16:31:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761888666;
	cv=none; b=Q1yKbK/9b1NDa64uZ2waarcwq/mhL8QsgTsVHCyoix2Vb5lC14j47atFEEMX69wxGyiIcj+b5iJRUHen9/71Jaf8UjjZTFtrVRyofy3iWjwt4+GWzmLv9Ke1mID9WyfqhRxq14V2PbjDVTDcdryzrCJkwjDCO3jDkdaLDzT8qzs+ktE2LcWQi/aHggYn2u4tDc06vy1F7BqLZUZRL8n3Kz4Mim2NM+HZ1t3KoM+hLdZM/2iThWP5ct3ZhKDtrWqVcUCwYf4xMAqUQHEtZyW0wAxLX57KIE/kp8ExA+G2czBxWu96qvQwUsAiXZ+wA6GLcRT44jJGiN/+kdcA1hkIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761888666; c=relaxed/relaxed;
	bh=7IYtZG8a19O5D//0saInx3itjVsy1qiu6Em4PuYAEQU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=VfBDW42s+scTVqeFdWRv5HEvaIW6M5U91qLzXEjMOLmLJPSFdSmeRhSDqg0nD8Ns1jz4o4Uk9s/h1a2JWYg8OONy6nGJDP4ES1vw2qcLYJ9Ffm45IqBboLJP9oE1CsByDaf+xPmkqTiQkmXacNVyYYDAFhXo8LV5qG9LE1i3EkUFZ851ODbGvHsQVGd2r82TIo5lWwXS/0MNuQRtjzpA6YkbZnQTuAQOB/nTPAwTw0TweAKpRIqLjLOXyfkuby5xxlMKQm4Nv5qAsPWBxL+OYxz2tWFTm3khRrRxePiV5PSpPMGeZ68s3v+j/rGGAZE45s/JPA1MB+M8cHfwtaIoUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PwyMs2rm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PwyMs2rm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyV2K1DTyz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 16:31:04 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7a23208a0c2so1566547b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 22:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761888661; x=1762493461; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7IYtZG8a19O5D//0saInx3itjVsy1qiu6Em4PuYAEQU=;
        b=PwyMs2rmCdYBcQWvxbgk5TLZf099yh8pev3D9kYzRcDRPNiKVxjzFOLxu3GUYW0DMO
         TlgFW/MUFIDZcfBvi/AdJDtEgkryDnyvgzYx2VLx8erkwF01Ycgnt7ey7fWGlDg6GVWo
         2qn2UYU0Zd76mxTeN7L7CcOWp7GoA8a/gMKAexSD8ffn4oZSS/mLPJYPKR0vU6fl1a3M
         0/7ANrwh1tXeZg14o+2hDr6NCnJtUHqSoZIe+gvVwt3CbcC7sNJbq5r/FME0zuROTfFm
         vOA0JLlAy9SBPhD3c5IfrP4zDCyT7BgwO1Jf04RpeomVGmhQ6i9BNdwP1lVvK/EsAIYy
         V0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761888661; x=1762493461;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IYtZG8a19O5D//0saInx3itjVsy1qiu6Em4PuYAEQU=;
        b=ZjSJ6atmiRstbcDl6R8Tj1VaS9TcuDpe7qkJObZrn2MdEdfDMX6YlXwBuDjADsrlev
         FlHrbBZn9vmkDoE73ntmxR2BqpUJ41UIytdjtC7JnbnF3amojM6hB18S+xS5mwBj47qD
         KPG5P9X0hyLWjgwZCaENV65f5+/7sBp9sB4jRmpUHubjfk1D6fYkeXa+fhlzZL2GzUMs
         r2WcsiHyuv/jJ+8LgiZZiZxtPYmqwlnNjk/xXJ4nldg1usOUX1a4sp7ukNsYmylXqxt/
         0EU3ayP0HUtlpt9E68lHtgaYdrlp/ukl5qxrGxw/YcUq4MfD6FQTblBfoWgAZK0jf2ie
         q5sw==
X-Forwarded-Encrypted: i=1; AJvYcCWexQCGc8Y4SuMwZlR2HoaRgZtt8/eNIci0mUY7jn1mbRRt8GHsCsIAqEqKl/L0SpQcvMUaIQymTxhB7iM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyorwlrPAu1zlZ7L8JvfHna1jItgnxbUJf2MeMNWN/NhELSCKQZ
	IBJSh/4MUuwlW7FUVQCC4FCbk/x9HQihDCp2hMxs/+sgVlAa7aHleiw6
X-Gm-Gg: ASbGncunlEVk00uzT/PflXkB5DxeTP0EHQL0veHQU6WXxkPG2tdtw3sBTNWxF0nyV2h
	ZYZSKp56pKDQSpgpzGU/jmOzlfDaIvwI+nCi3Ic/M5v7N0/dO134fmHQ79YJpDT/zrLWRXnpDqm
	JmgY3IjXZNPXYAxOtzXUEx4Onv2Hby0wGhZKyD3S4wqA3j7BoT+LWEGe4wuCx7FJXA0PjrNA/LI
	DuN2nbaIST2m6rDTYuewZn4GuDgvk8j1bmMGoJ/yzLsXjqfuhc5z7pzLhYLLColHv2ARjWu3Dic
	LMOn5VOm8ZSX/DTUA5MYU1LM5AQGlJ2jC1KfgKOdNnmPXh3W4yd53fXTEiUMzOWsqZ389SDD7BK
	GMqbEBtejVccqbUYPEyMczgzHyvWjtalP/uFAGNZWSQ6RUSZDZM2jW+Tbl6v7o5kN0ffQbMNpwI
	NnYN87
X-Google-Smtp-Source: AGHT+IFYq2g7MG5duEw8fbi2oZuSHEwIu61T4jkU/2Jiw7IZEbzDPPxn0J3byCBffEqUoLaF4eqQwA==
X-Received: by 2002:a05:6a00:4f8b:b0:7a2:73a9:97e with SMTP id d2e1a72fcca58-7a7796c8965mr2441190b3a.26.1761888660935;
        Thu, 30 Oct 2025 22:31:00 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7dba69fb1sm737154b3a.65.2025.10.30.22.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 22:30:59 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan he <bhe@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: Re: [PATCH 1/4] powerpc/mmu: do MMU type discovery before crashkernel reservation
In-Reply-To: <20251027151338.819957-2-sourabhjain@linux.ibm.com>
Date: Fri, 31 Oct 2025 10:23:55 +0530
Message-ID: <87ms577jto.ritesh.list@gmail.com>
References: <20251027151338.819957-1-sourabhjain@linux.ibm.com> <20251027151338.819957-2-sourabhjain@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Precedence: list

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> Crashkernel reservation on high memory depends on the MMU type, so
> finalize the MMU type before calling arch_reserve_crashkernel().
>
> With the changes introduced here, early_radix_enabled() becomes usable
> and will be used in arch_reserve_crashkernel() in the upcoming patch.
>
> early_radix_enabled() depends on cur_cpu_spec->mmu_features to find
> out if the radix MMU is enabled. The radix MMU bit in mmu_features is
> discovered from the FDT and kernel configs. To make sure the MMU type is
> finalized before arch_reserve_crashkernel() is called, the function that
> scans the FDT and sets mmu_features, along with some bits from
> mmu_early_type_finalize(), has been moved above
> arch_reserve_crashkernel().
>

That is correct. mmu_features may as well get set from this path too...

early_init_dt_scan_cpus() -> 
   if (!dt_cpu_ftrs_in_use())
       -> check_cpu_features(node, "ibm_pa_features",...
                      cur_cpu_spec->mmu_features |= fp->mmu_features

...which I guess is controlled using CONFIG_PPC_DT_CPU_FTRS.

so it make sense to move those dependent paths above.

Overall the patch looks good to me. Added few minor nits below.

> Cc: Baoquan he <bhe@redhat.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/mmu.h |  1 +
>  arch/powerpc/include/asm/mmu.h           |  1 +
>  arch/powerpc/kernel/prom.c               | 28 +++++++++++++-----------
>  arch/powerpc/mm/init_64.c                | 27 ++++++++++++++---------
>  4 files changed, 34 insertions(+), 23 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index 48631365b48c..7a3b2ff02041 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -208,6 +208,7 @@ extern int mmu_vmemmap_psize;
>  
>  /* MMU initialization */
>  void mmu_early_init_devtree(void);
> +void mmu_early_type_finalize(void);

Minor nit:
Can we please rename this function to - mmu_early_init_vec5()?
Your naming isn't wrong, but it's just known that after vec5 call, we
finalize the mmu early init type.. So keeping this function name as
"mmu_early_init_vec5()" makes slightly more sense to me. 

And then the order of function declarations can also be kept like below - 

 /* MMU initialization */
 +void mmu_early_init_vec5(void);
 void mmu_early_init_devtree(void);

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
 +static inline void mmu_early_init_vec5(void) { }
 static inline void mmu_early_init_devtree(void) { }


>  void hash__early_init_devtree(void);
>  void radix__early_init_devtree(void);
>  #ifdef CONFIG_PPC_PKEY
> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index 5f9c5d436e17..c40dc6349e55 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -384,6 +384,7 @@ extern void early_init_mmu_secondary(void);
>  extern void setup_initial_memory_limit(phys_addr_t first_memblock_base,
>  				       phys_addr_t first_memblock_size);
>  static inline void mmu_early_init_devtree(void) { }
> +static inline void mmu_early_type_finalize(void) { }
>  
>  static inline void pkey_early_init_devtree(void) {}
>  
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 9ed9dde7d231..db1615f26075 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -853,6 +853,21 @@ void __init early_init_devtree(void *params)
>  	if (PHYSICAL_START > MEMORY_START)
>  		memblock_reserve(MEMORY_START, int_vector_size);
>  	reserve_kdump_trampoline();
> +
> +	DBG("Scanning CPUs ...\n");
> +
> +	dt_cpu_ftrs_scan();
> +
> +	/* Retrieve CPU related informations from the flat tree
> +	 * (altivec support, boot CPU ID, ...)
> +	 */
> +	of_scan_flat_dt(early_init_dt_scan_cpus, NULL);
> +	if (boot_cpuid < 0) {
> +		printk("Failed to identify boot CPU !\n");
> +		BUG();
> +	}
> +
> +	mmu_early_type_finalize();
>  #if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
>  	/*
>  	 * If we fail to reserve memory for firmware-assisted dump then
> @@ -884,19 +899,6 @@ void __init early_init_devtree(void *params)
>  	 * FIXME .. and the initrd too? */
>  	move_device_tree();
>  
> -	DBG("Scanning CPUs ...\n");
> -
> -	dt_cpu_ftrs_scan();
> -
> -	/* Retrieve CPU related informations from the flat tree
> -	 * (altivec support, boot CPU ID, ...)
> -	 */
> -	of_scan_flat_dt(early_init_dt_scan_cpus, NULL);
> -	if (boot_cpuid < 0) {
> -		printk("Failed to identify boot CPU !\n");
> -		BUG();
> -	}
> -
>  	save_fscr_to_task();
>  
>  #if defined(CONFIG_SMP) && defined(CONFIG_PPC64)
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index b6f3ae03ca9e..cd52c1baa3bc 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -622,8 +622,10 @@ static void __init early_init_memory_block_size(void)
>  	of_scan_flat_dt(probe_memory_block_size, &memory_block_size);
>  }
>  
> -void __init mmu_early_init_devtree(void)


Let's also add a comment here to be more explicit perhaps. Because it has
caused confusion in past.

/*
 * mmu_early_init_vec5(): For non-hv mode (Pseries LPAR), whether we can do
 * radix or not depend upon hypervisor vec5 values. This functions checks
 * ibm,architecture-vec-5 and updates cur_cpu_spec->mmu_features bits
 * accordingly.
 * After this function returns, early_radix_enabled() can be used
 * to check if radix is supported.
 */
> +
> +void __init mmu_early_type_finalize(void)
>  {
> +
>  	bool hvmode = !!(mfmsr() & MSR_HV);
>  
>  	/* Disable radix mode based on kernel command line. */
> @@ -634,6 +636,20 @@ void __init mmu_early_init_devtree(void)
>  			pr_warn("WARNING: Ignoring cmdline option disable_radix\n");
>  	}
>  
> +	/*
> +	 * Check /chosen/ibm,architecture-vec-5 if running as a guest.
> +	 * When running bare-metal, we can use radix if we like
> +	 * even though the ibm,architecture-vec-5 property created by
> +	 * skiboot doesn't have the necessary bits set.
> +	 */
> +	if (!hvmode)
> +		early_check_vec5();
> +}

-ritesh

