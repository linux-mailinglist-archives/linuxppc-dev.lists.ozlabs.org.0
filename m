Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70601832419
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 05:43:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mANcmeaK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGRnZ2nk7z30Pp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 15:43:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mANcmeaK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGRml4Chbz30Yb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 15:42:30 +1100 (AEDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5ff84214fc7so3941157b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jan 2024 20:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705639347; x=1706244147; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QUbzb1YsPTuj5pO3yS3gRXNyLqhUcfVQnRjTyZebgdY=;
        b=mANcmeaKkay7FfJdnhOVt5Zx0L16sewrfP508KGVB85fSo1/c5oV9f8vPC8Q7mm/z5
         ZBfNSDX9UzRibiW+p4/TPBPcWKXhD4tM0qjD/9P/HTr3iOBhhYOPe2I1M4SX/UQTO/1T
         gmV0P/YFDsLe3ohEuKvePLm8agJqpDKnJQYX5XJZnXOWTO/G/Y08MRSxRNFphC+0aiqe
         oFfpG8hqZMfvBON7Lkt89o2J2cpzdpF0zIIvSzMpeittPsNGAqW8pU4HKa1+I1mRGB1B
         a22+06Tj0DvytmjVKdyuBjDm8JwbuMFPEpHA/BNdF7TubfmcU0CCcztdezV+G5rUAQbA
         8TMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705639347; x=1706244147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUbzb1YsPTuj5pO3yS3gRXNyLqhUcfVQnRjTyZebgdY=;
        b=sVmwJaX8MdHV6+3iGotFQ8kmELgHA1mljf7RQGoLXIbN32oH+Kr5ckV6uzaAeixBRm
         rxONrTxqUeEzQvAtDahvZ6FZ/r6q29s/V46BhIAlde7bWQcK1/XF8T8B5Vh0xIruIWs4
         8o2x4qFEflEyQqoVEPnnZwFlatC41Tc7bm6/awuDpYQEOybJdU/2BVMe1gY6ayZ805sx
         pe64/bKuptHcX3/TKHVVWJrJs5us1u4PSndRISESCYxMffa5E2+q0rl8szWDe3sJehFB
         AeIPk3lFtxhsE56iHdx9pbDOECz1ntovrhE5BovAXbmlfi86WevSEdsXHMWcaJbnLGDL
         9s3Q==
X-Gm-Message-State: AOJu0YwyF2TWZtl46P3WQtT59sH62QyO/WoNg0elMQ/SvXJ1xJXXR/FG
	LcyXlIBoWsgMcehG2MFEZ7yIqgsT/8H1pcCtt4FDlrdeJT8avtaf
X-Google-Smtp-Source: AGHT+IHLrd8uaTT0OOHdcytJ8iHjmKPtxYqdGqH2+DZik5pfzx5cxI60sO/qbir/GslTPLU+qYhC/Q==
X-Received: by 2002:a81:4e85:0:b0:5ff:3087:a378 with SMTP id c127-20020a814e85000000b005ff3087a378mr1746436ywb.13.1705639347074;
        Thu, 18 Jan 2024 20:42:27 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:b45f:9648:c2e:2e36])
        by smtp.gmail.com with ESMTPSA id b6-20020a0dd906000000b005f941afab71sm21362ywe.30.2024.01.18.20.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 20:42:26 -0800 (PST)
Date: Thu, 18 Jan 2024 20:42:25 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Huang Shijie <shijie@os.amperecomputing.com>
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
Message-ID: <Zan9sb0vtSvVvQeA@yury-ThinkPad>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119033227.14113-1-shijie@os.amperecomputing.com>
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
Cc: mark.rutland@arm.com, rafael@kernel.org, catalin.marinas@arm.com, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org, vschneid@redhat.com, chenhuacai@kernel.org, cl@os.amperecomputing.com, vbabka@suse.cz, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, arnd@arndb.de, paul.walmsley@sifive.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 19, 2024 at 11:32:27AM +0800, Huang Shijie wrote:
> hZ7bkEvc+Z19RHkS/HVG3KMg
> X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB7144
> Status: O
> Content-Length: 3779
> Lines: 126
> 
> During the kernel booting, the generic cpu_to_node() is called too early in
> arm64, powerpc and riscv when CONFIG_NUMA is enabled.
> 
> There are at least four places in the common code where
> the generic cpu_to_node() is called before it is initialized:
> 	   1.) early_trace_init()         in kernel/trace/trace.c
> 	   2.) sched_init()               in kernel/sched/core.c
> 	   3.) init_sched_fair_class()    in kernel/sched/fair.c
> 	   4.) workqueue_init_early()     in kernel/workqueue.c
> 
> In order to fix the bug, the patch changes generic cpu_to_node to
> function pointer, and export it for kernel modules.
> Introduce smp_prepare_boot_cpu_start() to wrap the original
> smp_prepare_boot_cpu(), and set cpu_to_node with early_cpu_to_node.
> Introduce smp_prepare_cpus_done() to wrap the original smp_prepare_cpus(),
> and set the cpu_to_node to formal _cpu_to_node().

This adds another level of indirection, I think. Currently cpu_to_node
is a simple inliner. After the patch it would be a real function with
all the associate overhead. Can you share a bloat-o-meter output here?

Regardless, I don't think that the approach is correct. As per your
description, some initialization functions erroneously call
cpu_to_node() instead of early_cpu_to_node() which exists specifically
for that case.

If the above correct, it's clearly a caller problem, and the fix is to
simply switch all those callers to use early version.

I would also initialize the numa_node with NUMA_NO_NODE at declaration,
so that if someone calls cpu_to_node() before the variable is properly
initialized at runtime, he'll get NO_NODE, which is obviously an error.

Thanks,
Yury
 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  drivers/base/arch_numa.c | 11 +++++++++++
>  include/linux/topology.h |  6 ++----
>  init/main.c              | 29 +++++++++++++++++++++++++++--
>  3 files changed, 40 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> index 5b59d133b6af..867a477fa975 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -61,6 +61,17 @@ EXPORT_SYMBOL(cpumask_of_node);
>  
>  #endif
>  
> +#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
> +#ifndef cpu_to_node
> +int _cpu_to_node(int cpu)
> +{
> +	return per_cpu(numa_node, cpu);
> +}
> +int (*cpu_to_node)(int cpu);
> +EXPORT_SYMBOL(cpu_to_node);
> +#endif
> +#endif
> +
>  static void numa_update_cpu(unsigned int cpu, bool remove)
>  {
>  	int nid = cpu_to_node(cpu);
> diff --git a/include/linux/topology.h b/include/linux/topology.h
> index 52f5850730b3..e7ce2bae11dd 100644
> --- a/include/linux/topology.h
> +++ b/include/linux/topology.h
> @@ -91,10 +91,8 @@ static inline int numa_node_id(void)
>  #endif
>  
>  #ifndef cpu_to_node
> -static inline int cpu_to_node(int cpu)
> -{
> -	return per_cpu(numa_node, cpu);
> -}
> +extern int (*cpu_to_node)(int cpu);
> +extern int _cpu_to_node(int cpu);
>  #endif
>  
>  #ifndef set_numa_node
> diff --git a/init/main.c b/init/main.c
> index e24b0780fdff..b142e9c51161 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -870,6 +870,18 @@ static void __init print_unknown_bootoptions(void)
>  	memblock_free(unknown_options, len);
>  }
>  
> +static void __init smp_prepare_boot_cpu_start(void)
> +{
> +	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
> +
> +#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
> +#ifndef cpu_to_node
> +	/* The early_cpu_to_node should be ready now. */
> +	cpu_to_node = early_cpu_to_node;
> +#endif
> +#endif
> +}
> +
>  asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
>  void start_kernel(void)
>  {
> @@ -899,7 +911,7 @@ void start_kernel(void)
>  	setup_command_line(command_line);
>  	setup_nr_cpu_ids();
>  	setup_per_cpu_areas();
> -	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
> +	smp_prepare_boot_cpu_start();
>  	boot_cpu_hotplug_init();
>  
>  	pr_notice("Kernel command line: %s\n", saved_command_line);
> @@ -1519,6 +1531,19 @@ void __init console_on_rootfs(void)
>  	fput(file);
>  }
>  
> +static void __init smp_prepare_cpus_done(unsigned int setup_max_cpus)
> +{
> +	/* Different ARCHs may override smp_prepare_cpus() */
> +	smp_prepare_cpus(setup_max_cpus);
> +
> +#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
> +#ifndef cpu_to_node
> +	/* Change to the formal function. */
> +	cpu_to_node = _cpu_to_node;
> +#endif
> +#endif
> +}
> +
>  static noinline void __init kernel_init_freeable(void)
>  {
>  	/* Now the scheduler is fully set up and can do blocking allocations */
> @@ -1531,7 +1556,7 @@ static noinline void __init kernel_init_freeable(void)
>  
>  	cad_pid = get_pid(t
