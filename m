Return-Path: <linuxppc-dev+bounces-3101-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393E59C4F64
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 08:25:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XndHg691fz2yF7;
	Tue, 12 Nov 2024 18:25:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731396351;
	cv=none; b=oFd65f82f11i/rqAVzdx5GTSuWvgU5fDuoY5VjNvRF7u5/DoP7I3mzo9rrd8iKQvZXUglfYUuIt3qIqriL+FmteQLFWhZVDeOHz7Lwuxon9APpvWl1HIihamnsEI/d/eUt3ZZaP8j9+8NugZZr3eHI6xj6LMq8b5E8Lmw673v0VVNjSNgo2eC04iUMhkiJjaM2LNWQu62vKOV989joWlADa/3O0KtNogHsyt5ecuo7Lurhy7MQUK0wWklXv+f8eoHzqeGhS0T22/MnqpHJ5BvrFCnYeb0EBAlQf0K05m+WMdVotr4yhgojRTd1yeZtp2jIGKc3sxJxsMh85wU8X90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731396351; c=relaxed/relaxed;
	bh=un+IzsWXUIQ4YEvVAR5/8jl+eO4zaFaxLMNh/WulKmc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=GSdDAcYydDgAmXWYZeJ+7U9YUZmQq3+s4pQuJQ0r+2pNLa1LsGLzxmvOfMa6NtonqwdAXbv75/59XP3aWOc6764l4VGegtH8q8JN3SR2EwNsDrCY5NOFn45wRIaLvpYYQDy4g6um2DMa1hmzv7OfJODp5HFuWXMwIyz17ultlEhSSYrlUtcBQTUwJQ8I6w9DN1baOhm+4BUz2RQdenTjd7Id5Ie+w+GGSnftG9Glx73SgrOKT+aSc6umbP2NHXCYeGZrqf1FhswwV/PlUoiPKLUpJHKCeG2s4fP9TttQOpP/iXPOwQSa+FeHGce3Nm/eWE9ucYD7X6KD0qUUCMO1hA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b0M+K8QJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b0M+K8QJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XndHf55B2z2y8q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 18:25:48 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20c70abba48so51207005ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 23:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731396345; x=1732001145; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=un+IzsWXUIQ4YEvVAR5/8jl+eO4zaFaxLMNh/WulKmc=;
        b=b0M+K8QJjzCCPw5GqjWjjervDdb/LVtAsnMwgDbz6bWBFCdTbZQOiVWwKH04szqrEO
         11mtXSmDxmZDzWbIvC5YZNmvhpszbbfS4K43uQ8TqLqtOi28lLuiAo2sQb/Xn5pl/mPg
         Iwg96AOBNdjWduEGBbcgPcWf+7dPcxpsC02uW/DKImDeWNxSRBENgGbL+S+Z8Plyjcxw
         FK+3mebKWMtY+TpGXNvhBJSj4jhMd7meMUNJxU9bUaQ4gSW0J/xR+PCJZ7nDj4BFENWN
         8XjbwRS9UC63bnP27/eLl7abNorIwvo0HBgzfWgC5RsnzurXRdeTFi+/UtJUEdiVeGnr
         BRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731396345; x=1732001145;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=un+IzsWXUIQ4YEvVAR5/8jl+eO4zaFaxLMNh/WulKmc=;
        b=nkCuDwMYAuS25U0Y9OK/l4J1ugJQjXDdN7r9UpNfHWlY9lW1ZKIEVvaXMccuz1Q51o
         tDYxFbmmzDni/8RobJDNiIDzfeMxMoCS2uLsQKQwL2sGZh684YVKNaoH/XNtFTTYEQFI
         P9Cpcc6fU81dXAYrO61RkzyWaKYf5R5hIo7g1R1+uwpJz4M4SvzrbMRSVoc19D//VRmd
         Sy1r44NWJjr2kkeT8apxlT3vtjaAIWrONyliFeER4gKD4/Lds260Trhw62SajHeA/2wD
         yNuA4v/UEq1Hr6DBlXWwlI4aLpGBGD2siE8J83Cc/I2MIbxefeHzkZbq1tEibWz86Txo
         FlLw==
X-Forwarded-Encrypted: i=1; AJvYcCVWAI3J2dbz6qvdplMNo6smQyOJmuGQHv13wHSwmUb8I1f8zX49Y3rUj9GhCp/UtqB6pCTvDZwfBcDIZUM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwrVcqB7pgSBrSoGwdy6tGsWYLDMbVHh8KcTdhaPLnzmqN06dBd
	3/tFir///3rEiP23omMmn3NH1a6e7V27xEj7zdL1u3KvlnKukVdF
X-Google-Smtp-Source: AGHT+IGe5XrvFAoGampFWuhi/1aDwogoDdc7nKI232jh/XFNGsDMY4V8oPgHxDll106z08ZcF2ASUA==
X-Received: by 2002:a17:90b:1c92:b0:2e2:d3f6:6efc with SMTP id 98e67ed59e1d1-2e9b177bdbemr21616056a91.28.1731396345108;
        Mon, 11 Nov 2024 23:25:45 -0800 (PST)
Received: from dw-tp ([171.76.87.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a5f95e4sm11912773a91.33.2024.11.11.23.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 23:25:44 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc/fadump: allocate memory for additional parameters early
In-Reply-To: <20241107055817.489795-1-sourabhjain@linux.ibm.com>
Date: Tue, 12 Nov 2024 12:33:22 +0530
Message-ID: <87y11plyrp.fsf@gmail.com>
References: <20241107055817.489795-1-sourabhjain@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> From: Hari Bathini <hbathini@linux.ibm.com>
>
> Memory for passing additional parameters to fadump capture kernel
> is allocated during subsys_initcall level, using memblock. But
> as slab is already available by this time, allocation happens via
> the buddy allocator. This may work for radix MMU but is likely to
> fail in most cases for hash MMU as hash MMU needs this memory in
> the first memory block for it to be accessible in real mode in the
> capture kernel (second boot). So, allocate memory for additional
> parameters area as soon as MMU mode is obvious.

But looks like this was only caught due to the WARN_ON_ONCE emitted from
mm/memblock.c which detected accidental use of memblock APIs when slab is
available. That begs a question on why didn't we see the issue on Hash? 
Are we not using the "param_area_supported" feature that often is it?

>
> Fixes: 683eab94da75 ("powerpc/fadump: setup additional parameters for dump capture kernel")
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
> Closes: https://lore.kernel.org/lkml/a70e4064-a040-447b-8556-1fd02f19383d@linux.vnet.ibm.com/T/#u
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>
> Changelog:
>
> Since v1: https://lore.kernel.org/all/20241104083528.99520-1-sourabhjain@linux.ibm.com/
>   - Drop extern keyword from fadump_setup_param_area function declaration
>   - Don't use __va() while resetting param memory area
>
> ---
>  arch/powerpc/include/asm/fadump.h |  2 ++
>  arch/powerpc/kernel/fadump.c      | 15 ++++++++++-----
>  arch/powerpc/kernel/prom.c        |  3 +++
>  3 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
> index ef40c9b6972a..7b3473e05273 100644
> --- a/arch/powerpc/include/asm/fadump.h
> +++ b/arch/powerpc/include/asm/fadump.h
> @@ -19,6 +19,7 @@ extern int is_fadump_active(void);
>  extern int should_fadump_crash(void);
>  extern void crash_fadump(struct pt_regs *, const char *);
>  extern void fadump_cleanup(void);
> +void fadump_setup_param_area(void);
>  extern void fadump_append_bootargs(void);
>  
>  #else	/* CONFIG_FA_DUMP */
> @@ -26,6 +27,7 @@ static inline int is_fadump_active(void) { return 0; }
>  static inline int should_fadump_crash(void) { return 0; }
>  static inline void crash_fadump(struct pt_regs *regs, const char *str) { }
>  static inline void fadump_cleanup(void) { }
> +static inline void fadump_setup_param_area(void) { }
>  static inline void fadump_append_bootargs(void) { }
>  #endif /* !CONFIG_FA_DUMP */
>  
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index a612e7513a4f..3a2863307863 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1586,6 +1586,12 @@ static void __init fadump_init_files(void)
>  		return;
>  	}
>  
> +	if (fw_dump.param_area) {
> +		rc = sysfs_create_file(fadump_kobj, &bootargs_append_attr.attr);
> +		if (rc)
> +			pr_err("unable to create bootargs_append sysfs file (%d)\n", rc);
> +	}
> +
>  	debugfs_create_file("fadump_region", 0444, arch_debugfs_dir, NULL,
>  			    &fadump_region_fops);
>  
> @@ -1740,7 +1746,7 @@ static void __init fadump_process(void)
>   * Reserve memory to store additional parameters to be passed
>   * for fadump/capture kernel.
>   */
> -static void __init fadump_setup_param_area(void)
> +void __init fadump_setup_param_area(void)
>  {
>  	phys_addr_t range_start, range_end;
>  
> @@ -1748,7 +1754,7 @@ static void __init fadump_setup_param_area(void)
>  		return;
>  
>  	/* This memory can't be used by PFW or bootloader as it is shared across kernels */
> -	if (radix_enabled()) {
> +	if (early_radix_enabled()) {
>  		/*
>  		 * Anywhere in the upper half should be good enough as all memory
>  		 * is accessible in real mode.
> @@ -1776,12 +1782,12 @@ static void __init fadump_setup_param_area(void)
>  						       COMMAND_LINE_SIZE,
>  						       range_start,
>  						       range_end);
> -	if (!fw_dump.param_area || sysfs_create_file(fadump_kobj, &bootargs_append_attr.attr)) {
> +	if (!fw_dump.param_area) {
>  		pr_warn("WARNING: Could not setup area to pass additional parameters!\n");
>  		return;
>  	}
>  
> -	memset(phys_to_virt(fw_dump.param_area), 0, COMMAND_LINE_SIZE);
> +	memset((void *)fw_dump.param_area, 0, COMMAND_LINE_SIZE);
>  }
>  
>  /*
> @@ -1807,7 +1813,6 @@ int __init setup_fadump(void)
>  	}
>  	/* Initialize the kernel dump memory structure and register with f/w */
>  	else if (fw_dump.reserve_dump_area_size) {
> -		fadump_setup_param_area();
>  		fw_dump.ops->fadump_init_mem_struct(&fw_dump);
>  		register_fadump();
>  	}
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 0be07ed407c7..47db1b1aef25 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -908,6 +908,9 @@ void __init early_init_devtree(void *params)
>  
>  	mmu_early_init_devtree();
>  
> +	/* Setup param area for passing additional parameters to fadump capture kernel. */
> +	fadump_setup_param_area();
> +

Maybe we should add a comment here saying this needs to be done after
mmu_early_init_devtree() because for pseries LPARs we need to be able to
reliably use early_radix_enabled() helper within fadump_setup_param_area().

Either ways the patch looks good to me. So please feel free to add - 
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

>  #ifdef CONFIG_PPC_POWERNV
>  	/* Scan and build the list of machine check recoverable ranges */
>  	of_scan_flat_dt(early_init_dt_scan_recoverable_ranges, NULL);
> -- 
> 2.46.2

