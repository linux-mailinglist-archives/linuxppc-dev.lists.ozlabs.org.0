Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B86EE867CE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 17:56:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Gc3Kwnu8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk6FX3tv4z3vlZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 03:56:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Gc3Kwnu8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk6Dn32wrz3vcr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 03:55:21 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7c7894b39edso112946139f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 08:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708966516; x=1709571316; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YapG2Iuz3DeMuojGrZ4IACVCP3buEgPcxL/agJvMeoI=;
        b=Gc3Kwnu89rZ0SX/t4k8aBhEkI1szor2zxiE4hjdBaVvDWXosRlz2IR+SJR9ZxuLuZj
         3qp5NRUTitxDpNljEylONteYXuHibtA/RxwVv+9JIv/Pg95zjl0Q6L0dhmi79+VxHUAX
         LaOuW7sVEO0/+tD2iXhbL+xJyd8eck4O87NbQ0vWyomKnUubCr3DY7oZWUGSJqxHrjZv
         Xzla0/qiEY0E62XuGYj44KWXaLJQKDw5ehLPFF3NriO5YkBHOh8/6Nex6cAC4mUbiVMp
         Ab8dG+aMF6SkF1YvJs5CYgjIin8YW5pnrFMfZYhWWyTtovThSUMDmnkQTsVQpdN5oeYH
         GRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708966516; x=1709571316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YapG2Iuz3DeMuojGrZ4IACVCP3buEgPcxL/agJvMeoI=;
        b=eNhsmRyLiE/chgUUcqn2sabOuz2sFGcNnxfq/gQ+1y6L0JvCj+E0Zi+tUuoaKcVUCD
         n8cypnhg1pSStpSPaBH23M5YTHxdTPbdxbiICAx6H3zAbGAoZX4md5edf5ufxUgivuPf
         f+h/RPUlj/BrA9ukt4MvQ2wll4u6CTcmyuWEOGup2KhxaJIgDvYEPp4/vMEnoeXN5s0+
         VDNDu3fy2BOk9FwO/C0MTV/PrfItjb02hxIdLKuFOG/xhd+dGsK8V6ojX6/UoHHRqRtT
         p9M8uOlHh6TM/FFDpRRgXkfQCCXLWWzXLIj6F3EgE/Rhy+bl8I9LiyAKKgVGwpREJqsN
         vslw==
X-Forwarded-Encrypted: i=1; AJvYcCX1YLOO/XgIsON69PsuKQr5CCPrM8vhoremAgfrpb3jbvBV2eFFS/wM8tUmgd3qJ2HMgN1KjyDvvYWl0FHZm8zpuF/I8Z6QPYypyNUQ6g==
X-Gm-Message-State: AOJu0YxqfB8n5IrJdQPKDqP7ad4Ue+vlhjM0LjWQbEkpYww7Y8E0XUnO
	ihMFNHslGEMxWJVsTs+hr28aaduQPTg0QYhT4oZ3+NHbLRKLVYXIZmb405Qlwgw=
X-Google-Smtp-Source: AGHT+IHuaCs5d/f2oApxcwZJ00c0VtAfeY0TQXQD6OLSfI1tJf749yVYK76BLp2wH1JUJFxCC31KGw==
X-Received: by 2002:a5e:c819:0:b0:7c7:247e:34c7 with SMTP id y25-20020a5ec819000000b007c7247e34c7mr9575536iol.9.1708966515786;
        Mon, 26 Feb 2024 08:55:15 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.200])
        by smtp.gmail.com with ESMTPSA id f23-20020a6be817000000b007c7938867adsm1309067ioh.33.2024.02.26.08.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 08:55:15 -0800 (PST)
Message-ID: <764fafb0-2206-4ab1-84ea-ebb7848c8ff2@sifive.com>
Date: Mon, 26 Feb 2024 10:55:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB
 definitions
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Kees Cook <keescook@chromium.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-2-arnd@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240226161414.2316610-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kieran Bingham <kbingham@kernel.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.
 infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024-02-26 10:14 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> These four architectures define the same Kconfig symbols for configuring
> the page size. Move the logic into a common place where it can be shared
> with all other architectures.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/Kconfig                      | 58 +++++++++++++++++++++++++++++--
>  arch/hexagon/Kconfig              | 25 +++----------
>  arch/hexagon/include/asm/page.h   |  6 +---
>  arch/loongarch/Kconfig            | 21 ++++-------
>  arch/loongarch/include/asm/page.h | 10 +-----
>  arch/mips/Kconfig                 | 58 +++----------------------------
>  arch/mips/include/asm/page.h      | 16 +--------
>  arch/sh/include/asm/page.h        | 13 +------
>  arch/sh/mm/Kconfig                | 42 +++++++---------------
>  9 files changed, 88 insertions(+), 161 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index a5af0edd3eb8..237cea01ed9b 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1078,17 +1078,71 @@ config HAVE_ARCH_COMPAT_MMAP_BASES
>  	  and vice-versa 32-bit applications to call 64-bit mmap().
>  	  Required for applications doing different bitness syscalls.
>  
> +config HAVE_PAGE_SIZE_4KB
> +	bool
> +
> +config HAVE_PAGE_SIZE_8KB
> +	bool
> +
> +config HAVE_PAGE_SIZE_16KB
> +	bool
> +
> +config HAVE_PAGE_SIZE_32KB
> +	bool
> +
> +config HAVE_PAGE_SIZE_64KB
> +	bool
> +
> +config HAVE_PAGE_SIZE_256KB
> +	bool
> +
> +choice
> +	prompt "MMU page size"

Should this have some generic help text (at least a warning about compatibility)?

> +
> +config PAGE_SIZE_4KB
> +	bool "4KB pages"
> +	depends on HAVE_PAGE_SIZE_4KB
> +
> +config PAGE_SIZE_8KB
> +	bool "8KB pages"
> +	depends on HAVE_PAGE_SIZE_8KB
> +
> +config PAGE_SIZE_16KB
> +	bool "16KB pages"
> +	depends on HAVE_PAGE_SIZE_16KB
> +
> +config PAGE_SIZE_32KB
> +	bool "32KB pages"
> +	depends on HAVE_PAGE_SIZE_32KB
> +
> +config PAGE_SIZE_64KB
> +	bool "64KB pages"
> +	depends on HAVE_PAGE_SIZE_64KB
> +
> +config PAGE_SIZE_256KB
> +	bool "256KB pages"
> +	depends on HAVE_PAGE_SIZE_256KB
> +
> +endchoice
> +
>  config PAGE_SIZE_LESS_THAN_64KB
>  	def_bool y
> -	depends on !ARM64_64K_PAGES
>  	depends on !PAGE_SIZE_64KB
> -	depends on !PARISC_PAGE_SIZE_64KB
>  	depends on PAGE_SIZE_LESS_THAN_256KB
>  
>  config PAGE_SIZE_LESS_THAN_256KB
>  	def_bool y
>  	depends on !PAGE_SIZE_256KB
>  
> +config PAGE_SHIFT
> +	int
> +	default 12 if PAGE_SIZE_4KB
> +	default 13 if PAGE_SIZE_8KB
> +	default 14 if PAGE_SIZE_16KB
> +	default 15 if PAGE_SIZE_32KB
> +	default 16 if PAGE_SIZE_64KB
> +	default 18 if PAGE_SIZE_256KB
> +
>  # This allows to use a set of generic functions to determine mmap base
>  # address by giving priority to top-down scheme only if the process
>  # is not in legacy mode (compat task, unlimited stack size or
> diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
> index a880ee067d2e..aac46ee1a000 100644
> --- a/arch/hexagon/Kconfig
> +++ b/arch/hexagon/Kconfig
> @@ -8,6 +8,11 @@ config HEXAGON
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select ARCH_NO_PREEMPT
>  	select DMA_GLOBAL_POOL
> +	select FRAME_POINTER

Looks like a paste error.

> +	select HAVE_PAGE_SIZE_4KB
> +	select HAVE_PAGE_SIZE_16KB
> +	select HAVE_PAGE_SIZE_64KB
> +	select HAVE_PAGE_SIZE_256KB
>  	# Other pending projects/to-do items.
>  	# select HAVE_REGS_AND_STACK_ACCESS_API
>  	# select HAVE_HW_BREAKPOINT if PERF_EVENTS
> @@ -120,26 +125,6 @@ config NR_CPUS
>  	  This is purely to save memory - each supported CPU adds
>  	  approximately eight kilobytes to the kernel image.
>  
> -choice
> -	prompt "Kernel page size"
> -	default PAGE_SIZE_4KB
> -	help
> -	  Changes the default page size; use with caution.
> -
> -config PAGE_SIZE_4KB
> -	bool "4KB"
> -
> -config PAGE_SIZE_16KB
> -	bool "16KB"
> -
> -config PAGE_SIZE_64KB
> -	bool "64KB"
> -
> -config PAGE_SIZE_256KB
> -	bool "256KB"
> -
> -endchoice
> -
>  source "kernel/Kconfig.hz"
>  
>  endmenu
> diff --git a/arch/hexagon/include/asm/page.h b/arch/hexagon/include/asm/page.h
> index 10f1bc07423c..65c9bac639fa 100644
> --- a/arch/hexagon/include/asm/page.h
> +++ b/arch/hexagon/include/asm/page.h
> @@ -13,27 +13,22 @@
>  /*  This is probably not the most graceful way to handle this.  */
>  
>  #ifdef CONFIG_PAGE_SIZE_4KB
> -#define PAGE_SHIFT 12
>  #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_4KB
>  #endif
>  
>  #ifdef CONFIG_PAGE_SIZE_16KB
> -#define PAGE_SHIFT 14
>  #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_16KB
>  #endif
>  
>  #ifdef CONFIG_PAGE_SIZE_64KB
> -#define PAGE_SHIFT 16
>  #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_64KB
>  #endif
>  
>  #ifdef CONFIG_PAGE_SIZE_256KB
> -#define PAGE_SHIFT 18
>  #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_256KB
>  #endif
>  
>  #ifdef CONFIG_PAGE_SIZE_1MB
> -#define PAGE_SHIFT 20
>  #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_1MB
>  #endif

The corresponding Kconfig option does not exist (and did not exist before this
patch).

>  
> @@ -50,6 +45,7 @@
>  #define HVM_HUGEPAGE_SIZE 0x5
>  #endif
>  
> +#define PAGE_SHIFT CONFIG_PAGE_SHIFT
>  #define PAGE_SIZE  (1UL << PAGE_SHIFT)
>  #define PAGE_MASK  (~((1 << PAGE_SHIFT) - 1))
>  

