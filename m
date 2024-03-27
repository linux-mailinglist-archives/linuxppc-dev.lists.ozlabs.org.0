Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A2B88E660
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 15:37:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ZQqzxGfZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4TlH1dj3z3vdw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 01:36:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ZQqzxGfZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4TkZ678Bz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 01:36:21 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e0ae065d24so31855785ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1711550178; x=1712154978; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpFxvHTXaRgOadbX9mzZ5uaOaEjiGzDAUYCRyVAS/i4=;
        b=ZQqzxGfZkTEn5LFNFk7UKP7nF0nWL2nHOMTPlrY9MCdLrsmPo0fHDPAyseUIKgHbsB
         tmt0MtWG6B1p6FnGSMBZm4n3RzdJmgek5X+ejKCVT1P4Be5dxYFmqCFIEJiGvCKRpFXK
         ME441fbkRYrG2cMnUgficXh4LEd/jGRF0hpSV2KqdmnHkQlN9+KPeWzh4WHnoeSItETL
         Z1U7tySH40RJ/my3Wi+JF0+3kZMevDSp/QFOpB17WuKmWMDb0GHUpUZKeT7pXnRHm+vU
         E1maq7/T8t0a/UiXvoCuFAkymaCBPSHUmeDSWShPNODAz9nl6vfI267+iPKnT1ausiMx
         7mjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711550178; x=1712154978;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpFxvHTXaRgOadbX9mzZ5uaOaEjiGzDAUYCRyVAS/i4=;
        b=YFYZRd/bp2KHd+Q8lsiHNEQbbYKmikJW4eyXzTUwzessTvK0tGm1hkfZNxR9B/Bg5P
         peHTKDjFo8PuHLQ4X0hFxmD0rVbog9rI2jvgDEP358+hLlchTP/0lvi+T7EkYn8aqzeA
         amCyj4tKDEb7JWNkSV88s4eRMwb9tHMFkWIsdEJ4VXdmaWVN7YiUAOFR7yIpPOL/2vMr
         Bo0NrVqBcGehzEp/PWzHcAHO4UCu4ikCvf+0ThimUYRlOwoVGvu/EpnPil7vZfQ55zjB
         RJBlxlEHKp0Cc3E+txM8cQMiBYbI0GVALmEtUCYNrK3Wuc87YlHdrVFp1sMzqpvJ/H2r
         Z7YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN9f28SXwJ5dJlyrzwK4PPrYwB8pneDlRzvudSmMqsNPPwoTZD6BmwD1bLIyPLLi643UR21GJK22dBqSSLLxYrdNc8VyL1y43dUS1iFg==
X-Gm-Message-State: AOJu0Yw1LlfOgMBzW0CBRQpB5BpmaG8TObQFdKfGf1cfJIkF3FV688kU
	i5euGsirBSWjAAQ2/yvapcmTRUyA/d7BWpIzPSpBlkNBhhTuHt1FT93OJe3k3fY=
X-Google-Smtp-Source: AGHT+IGLuMfOxHoUUSwMhDNHhwql3lBke6oQWy3bRJJ6cohj97NT5b6r2v+pJbgeqG89zEtueJAL5Q==
X-Received: by 2002:a17:90a:178c:b0:29d:dfae:4fac with SMTP id q12-20020a17090a178c00b0029ddfae4facmr1468543pja.23.1711550178089;
        Wed, 27 Mar 2024 07:36:18 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id m3-20020a17090b068300b002a0981a7af5sm1742902pjz.32.2024.03.27.07.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:36:17 -0700 (PDT)
Date: Wed, 27 Mar 2024 07:36:17 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Mar 2024 07:36:15 PDT (-0700)
Subject: Re: [PATCH v3] NUMA: Early use of cpu_to_node() returns 0 instead of the correct node id
In-Reply-To: <20240126064451.5465-1-shijie@os.amperecomputing.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: shijie@os.amperecomputing.com, akpm@linux-foundation.org
Message-ID: <mhng-13c5ed78-333f-4cfd-b1d5-828dabbe510c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, rafael@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, mingo@kernel.org, vschneid@redhat.com, Arnd Bergmann <arnd@arndb.de>, chenhuacai@kernel.org, cl@os.amperecomputing.com, vbabka@suse.cz, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, yury.norov@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, shijie@os.amperecomputing.com, Greg KH <gregkh@linuxfoundation.org>, ndesaulniers@google.com, linux-kernel@vger.kernel.org, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 Jan 2024 22:44:51 PST (-0800), shijie@os.amperecomputing.com wrote:
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
> In order to fix the bug, the patch introduces early_numa_node_init()
> which is called after smp_prepare_boot_cpu() in start_kernel.
> early_numa_node_init will initialize the "numa_node" as soon as
> the early_cpu_to_node() is ready, before the cpu_to_node() is called
> at the first time.
>
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
> v2 --> v3:
> 	Do not change the cpu_to_node to function pointer.
> 	Introduce early_numa_node_init() which initialize
> 	the numa_node at an early stage.
>
> 	v2: https://lore.kernel.org/all/20240123045843.75969-1-shijie@os.amperecomputing.com/
>
> v1 --> v2:
> 	In order to fix the x86 compiling error, move the cpu_to_node()
>        	from driver/base/arch_numa.c to driver/base/node.c.
>
> 	v1: http://lists.infradead.org/pipermail/linux-arm-kernel/2024-January/896160.html
>
> 	An old different title patch:
> 	http://lists.infradead.org/pipermail/linux-arm-kernel/2024-January/895963.html
>
> ---
>  init/main.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/init/main.c b/init/main.c
> index e24b0780fdff..39efe5ed58a0 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -870,6 +870,19 @@ static void __init print_unknown_bootoptions(void)
>  	memblock_free(unknown_options, len);
>  }
>
> +static void __init early_numa_node_init(void)
> +{
> +#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
> +#ifndef cpu_to_node
> +	int cpu;
> +
> +	/* The early_cpu_to_node() should be ready here. */
> +	for_each_possible_cpu(cpu)
> +		set_cpu_numa_node(cpu, early_cpu_to_node(cpu));
> +#endif
> +#endif
> +}
> +
>  asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
>  void start_kernel(void)
>  {
> @@ -900,6 +913,7 @@ void start_kernel(void)
>  	setup_nr_cpu_ids();
>  	setup_per_cpu_areas();
>  	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
> +	early_numa_node_init();
>  	boot_cpu_hotplug_init();
>
>  	pr_notice("Kernel command line: %s\n", saved_command_line);

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

I don't really understand the init/main.c stuff all that well, I'm 
adding Andrew as it looks like he's been merging stuff here.
