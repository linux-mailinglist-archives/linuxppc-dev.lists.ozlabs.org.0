Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C84B6754
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 17:44:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YPRT5sDkzF2ZP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 01:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="nSSdgw+6"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YPNy0HvXzF38w
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 01:42:09 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id u184so8533069qkd.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MxoYLfyiBUzPhqlCM4w4PwBwFKu/jtqQR2cCGb9YBT4=;
 b=nSSdgw+6FYaaStUyX2sA8rUkMZXoeQQ1Bhj98GeF7Gz7fo9nVGjBG+6KdBsfdcv5RB
 A34NyTjV5lYd/E//bk1eHCio4Y9+zd6V8vjqmhVzMVJgvx+ByAf2yrCUZtwkU8cOZgXO
 aMU83MmPolqXpB6/osYDW0cz5mf0aYSufpWrYJmFXoPR9+ZRrRozpVBP94KeBGHhpu20
 WN0SVFkgwuSDTkpCTSVtl3ieYTtGqEDj+JZHhWqnMrlilD7DCh1zsb5vtBGzIL/Vjr8H
 C17TB7sqDGFLObwXy71/6DeZR9PMN1q3y/MX/0MsB919oVmtLH6WRPbyq2ZWD9zCDc2D
 Spaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MxoYLfyiBUzPhqlCM4w4PwBwFKu/jtqQR2cCGb9YBT4=;
 b=gCjszEFGXFg8skny6M+v7Iu/wck3fBCoEq3r7LLvcoMkbkTigNMPf7J6j6m4d0WZdY
 cJCB2YXCz9H6wYu3upt3gejCUVhONscKM2JfBqoSs+SBLGSmvKbQkj4SitRIgd6FyIrL
 XCt5dLTgmfgxw8F0YkjdnFhOU9eYlbSLqAjxurT8mrNdLu/exZTcvmpERc4YVeStnXO4
 GU+1+Uqli+me9cu1/P7izWnZCBXLLKedrCzmimJlSfVvN0zQdWccbRk283Tvj5QJq5J0
 cHROQHmHS9frRYLFyXXz7UftNrhdovdnRKDyuVdkDYR7C9UAYywnICIFDTW7HRw6s2WH
 8H3w==
X-Gm-Message-State: APjAAAXvUA1nqGBrJ1Rbn5BwrstJWj4I/JUD5QNLblj+DmYaWTBA6FlA
 wce1eurA7qAXJ5Frjb2NLpRWaw==
X-Google-Smtp-Source: APXvYqwRPQBIvBID8wxxk+kHKEOudHk1TuWjSNq51em4yTV73znC4lOPaseqqlTF0JNOe7fXWkP9Tw==
X-Received: by 2002:a37:67c6:: with SMTP id b189mr4597177qkc.472.1568821326580; 
 Wed, 18 Sep 2019 08:42:06 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id n65sm2937218qkb.19.2019.09.18.08.42.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Sep 2019 08:42:05 -0700 (PDT)
Message-ID: <1568821324.5576.174.camel@lca.pw>
Subject: Re: [PATCH v4] powerpc/setup_64: fix -Wempty-body warnings
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Date: Wed, 18 Sep 2019 11:42:04 -0400
In-Reply-To: <1563215552-8166-1-git-send-email-cai@lca.pw>
References: <1563215552-8166-1-git-send-email-cai@lca.pw>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, paulus@samba.org, tyreld@linux.vnet.ibm.com,
 joe@perches.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael, ping in case that you might forget this one forever as well.

On Mon, 2019-07-15 at 14:32 -0400, Qian Cai wrote:
> At the beginning of setup_64.c, it has,
> 
>   #ifdef DEBUG
>   #define DBG(fmt...) udbg_printf(fmt)
>   #else
>   #define DBG(fmt...)
>   #endif
> 
> where DBG() could be compiled away, and generate warnings,
> 
> arch/powerpc/kernel/setup_64.c: In function 'initialize_cache_info':
> arch/powerpc/kernel/setup_64.c:579:49: warning: suggest braces around
> empty body in an 'if' statement [-Wempty-body]
>     DBG("Argh, can't find dcache properties !\n");
>                                                  ^
> arch/powerpc/kernel/setup_64.c:582:49: warning: suggest braces around
> empty body in an 'if' statement [-Wempty-body]
>     DBG("Argh, can't find icache properties !\n");
> 
> Fix it by using the suggestions from Michael:
> 
> "Neither of those sites should use DBG(), that's not really early boot
> code, they should just use pr_warn().
> 
> And the other uses of DBG() in initialize_cache_info() should just be
> removed.
> 
> In smp_release_cpus() the entry/exit DBG's should just be removed, and
> the spinning_secondaries line should just be pr_debug().
> 
> That would just leave the two calls in early_setup(). If we taught
> udbg_printf() to return early when udbg_putc is NULL, then we could just
> call udbg_printf() unconditionally and get rid of the DBG macro
> entirely."
> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
> 
> v4: Use the suggestions from Michael and __func__ per checkpatch.
> v3: Use no_printk() macro, and make sure that format and argument are always
>     verified by the compiler using a more generic form ##__VA_ARGS__ per Joe.
> v2: Fix it by using a NOP while loop per Tyrel.
> 
>  arch/powerpc/kernel/setup_64.c | 26 ++++++--------------------
>  arch/powerpc/kernel/udbg.c     | 14 ++++++++------
>  2 files changed, 14 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 44b4c432a273..d2af4c228970 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -68,12 +68,6 @@
>  
>  #include "setup.h"
>  
> -#ifdef DEBUG
> -#define DBG(fmt...) udbg_printf(fmt)
> -#else
> -#define DBG(fmt...)
> -#endif
> -
>  int spinning_secondaries;
>  u64 ppc64_pft_size;
>  
> @@ -305,7 +299,7 @@ void __init early_setup(unsigned long dt_ptr)
>  	/* Enable early debugging if any specified (see udbg.h) */
>  	udbg_early_init();
>  
> - 	DBG(" -> early_setup(), dt_ptr: 0x%lx\n", dt_ptr);
> +	udbg_printf(" -> %s(), dt_ptr: 0x%lx\n", __func__, dt_ptr);
>  
>  	/*
>  	 * Do early initialization using the flattened device
> @@ -362,11 +356,11 @@ void __init early_setup(unsigned long dt_ptr)
>  	 */
>  	this_cpu_enable_ftrace();
>  
> -	DBG(" <- early_setup()\n");
> +	udbg_printf(" <- %s()\n", __func__);
>  
>  #ifdef CONFIG_PPC_EARLY_DEBUG_BOOTX
>  	/*
> -	 * This needs to be done *last* (after the above DBG() even)
> +	 * This needs to be done *last* (after the above udbg_printf() even)
>  	 *
>  	 * Right after we return from this function, we turn on the MMU
>  	 * which means the real-mode access trick that btext does will
> @@ -436,8 +430,6 @@ void smp_release_cpus(void)
>  	if (!use_spinloop())
>  		return;
>  
> -	DBG(" -> smp_release_cpus()\n");
> -
>  	/* All secondary cpus are spinning on a common spinloop, release them
>  	 * all now so they can start to spin on their individual paca
>  	 * spinloops. For non SMP kernels, the secondary cpus never get out
> @@ -456,9 +448,7 @@ void smp_release_cpus(void)
>  			break;
>  		udelay(1);
>  	}
> -	DBG("spinning_secondaries = %d\n", spinning_secondaries);
> -
> -	DBG(" <- smp_release_cpus()\n");
> +	pr_debug("spinning_secondaries = %d\n", spinning_secondaries);
>  }
>  #endif /* CONFIG_SMP || CONFIG_KEXEC_CORE */
>  
> @@ -551,8 +541,6 @@ void __init initialize_cache_info(void)
>  	struct device_node *cpu = NULL, *l2, *l3 = NULL;
>  	u32 pvr;
>  
> -	DBG(" -> initialize_cache_info()\n");
> -
>  	/*
>  	 * All shipping POWER8 machines have a firmware bug that
>  	 * puts incorrect information in the device-tree. This will
> @@ -576,10 +564,10 @@ void __init initialize_cache_info(void)
>  	 */
>  	if (cpu) {
>  		if (!parse_cache_info(cpu, false, &ppc64_caches.l1d))
> -			DBG("Argh, can't find dcache properties !\n");
> +			pr_warn("Argh, can't find dcache properties !\n");
>  
>  		if (!parse_cache_info(cpu, true, &ppc64_caches.l1i))
> -			DBG("Argh, can't find icache properties !\n");
> +			pr_warn("Argh, can't find icache properties !\n");
>  
>  		/*
>  		 * Try to find the L2 and L3 if any. Assume they are
> @@ -604,8 +592,6 @@ void __init initialize_cache_info(void)
>  
>  	cur_cpu_spec->dcache_bsize = dcache_bsize;
>  	cur_cpu_spec->icache_bsize = icache_bsize;
> -
> -	DBG(" <- initialize_cache_info()\n");
>  }
>  
>  /*
> diff --git a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
> index a384e7c8b01c..01595e8cafe7 100644
> --- a/arch/powerpc/kernel/udbg.c
> +++ b/arch/powerpc/kernel/udbg.c
> @@ -120,13 +120,15 @@ int udbg_write(const char *s, int n)
>  #define UDBG_BUFSIZE 256
>  void udbg_printf(const char *fmt, ...)
>  {
> -	char buf[UDBG_BUFSIZE];
> -	va_list args;
> +	if (udbg_putc) {
> +		char buf[UDBG_BUFSIZE];
> +		va_list args;
>  
> -	va_start(args, fmt);
> -	vsnprintf(buf, UDBG_BUFSIZE, fmt, args);
> -	udbg_puts(buf);
> -	va_end(args);
> +		va_start(args, fmt);
> +		vsnprintf(buf, UDBG_BUFSIZE, fmt, args);
> +		udbg_puts(buf);
> +		va_end(args);
> +	}
>  }
>  
>  void __init udbg_progress(char *s, unsigned short hex)
