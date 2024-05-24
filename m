Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 90C3A8CDF1C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 03:11:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I4mvUywO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vlmxj3PtLz87Kr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 11:03:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I4mvUywO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vlmwy2SWVz3vby
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 11:02:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E00AD62F3C;
	Fri, 24 May 2024 01:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB98DC2BD10;
	Fri, 24 May 2024 01:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716512555;
	bh=o3V30u/+qjQ2RSAs7BEQWAwuAKdbTZDRmEOgdLaGg3M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I4mvUywOW9/qZrVS0aPLyWTk7ho3xM0Jqeqihc1bwf6xv7B1u8zs/KsHWDxBWr5Ei
	 7qmWZCZt6bXSEM4K1g+rInu9OzYxJs72g6KiB/13o3/LmglnOLZ6oYuu1ZVxkdgpz6
	 rEtjRfyNTMj49exH6jd0iq3LHSUIQJvszTY2MW9Fzifab5qX4bLV9sspdab1PmUHGI
	 VHWv1TZ97Jw3xn+Po2H+AQW6folPGvj+y/s7WxQran13ppOUaECMSniihQh3OTAHt/
	 JS8HBmCyhAwDyJvISfeUhBGvtd5OGSMLXaedWgmYmzynOiC4+WF6gqmWvE9cObqXvi
	 1lo5ys7hvK7qw==
Date: Fri, 24 May 2024 10:02:31 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Abhishek Dubey <adubey@linux.ibm.com>
Subject: Re: [PATCH] PowerPC: Replace kretprobe with rethook
Message-Id: <20240524100231.327089c25317b6188629126a@kernel.org>
In-Reply-To: <20240516134646.1059114-1-adubey@linux.ibm.com>
References: <20240516134646.1059114-1-adubey@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, mhiramat@kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 May 2024 09:46:46 -0400
Abhishek Dubey <adubey@linux.ibm.com> wrote:

> This is an adaptation of commit f3a112c0c40d ("x86,rethook,kprobes:
> Replace kretprobe with rethook on x86") to Power.
> 
> Replaces the kretprobe code with rethook on Power. With this patch,
> kretprobe on Power uses the rethook instead of kretprobe specific
> trampoline code.
> 
> Reference to other archs:
> commit b57c2f124098 ("riscv: add riscv rethook implementation")
> commit 7b0a096436c2 ("LoongArch: Replace kretprobe with rethook")
> 

Hi Abhishek,

Thanks for applying rethook, it looks good. I have comments below.

> diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
> index e6a958a5da27..6de912cf198c 100644
> --- a/arch/powerpc/kernel/stacktrace.c
> +++ b/arch/powerpc/kernel/stacktrace.c
> @@ -21,6 +21,7 @@
>  #include <asm/processor.h>
>  #include <linux/ftrace.h>
>  #include <asm/kprobes.h>
> +#include <linux/rethook.h>
>  
>  #include <asm/paca.h>
>  
> @@ -133,14 +134,13 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
>  		 * arch-dependent code, they are generic.
>  		 */
>  		ip = ftrace_graph_ret_addr(task, &graph_idx, ip, stack);
> -#ifdef CONFIG_KPROBES

This still needs to check CONFIG_RETHOOK.

> +
>  		/*
>  		 * Mark stacktraces with kretprobed functions on them
>  		 * as unreliable.
>  		 */
> -		if (ip == (unsigned long)__kretprobe_trampoline)
> +		if (ip == (unsigned long)arch_rethook_trampoline)
>  			return -EINVAL;
> -#endif
>  
>  		if (!consume_entry(cookie, ip))
>  			return -EINVAL;
> diff --git a/include/linux/rethook.h b/include/linux/rethook.h
> index ba60962805f6..9f2fb6abdc60 100644
> --- a/include/linux/rethook.h
> +++ b/include/linux/rethook.h
> @@ -65,7 +65,6 @@ void rethook_recycle(struct rethook_node *node);
>  void rethook_hook(struct rethook_node *node, struct pt_regs *regs, bool mcount);
>  unsigned long rethook_find_ret_addr(struct task_struct *tsk, unsigned long frame,
>  				    struct llist_node **cur);
> -

nit: removed unrelated line.

>  /* Arch dependent code must implement arch_* and trampoline code */
>  void arch_rethook_prepare(struct rethook_node *node, struct pt_regs *regs, bool mcount);
>  void arch_rethook_trampoline(void);
> -- 
> 2.44.0
> 

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
