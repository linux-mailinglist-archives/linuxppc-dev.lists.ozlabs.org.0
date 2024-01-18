Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1E58315CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 10:28:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ntNZPhFf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TFy9R02Wvz3btJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 20:28:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ntNZPhFf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFy8Z0yGwz30fh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jan 2024 20:27:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 65880CE1EF7;
	Thu, 18 Jan 2024 09:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA1BC43390;
	Thu, 18 Jan 2024 09:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705570071;
	bh=OdevsDZe2JFSnufBy9YDpl2ctaeieZIOsJdm8U6jml0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ntNZPhFfiYF48VAF0GU9/xT6e6ghwtvNk9U40W2fEiJaySGZ1fHbDr8o+4XheyjuV
	 PAwlta+HRFlWfkYL9xPrIvNT5hz4rw8Sh8Y50lpDXUzd7nNwOzomtm3HVH2sRe4Zdn
	 JhCJH+SNZPf2/MF2N454jgdSX4ZamjFSCCkZJUQ4=
Date: Thu, 18 Jan 2024 10:27:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Huang Shijie <shijie@os.amperecomputing.com>
Subject: Re: [PATCH] init: refactor the generic cpu_to_node for NUMA
Message-ID: <2024011820-path-throat-b7c8@gregkh>
References: <20240118031412.3300-1-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118031412.3300-1-shijie@os.amperecomputing.com>
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
Cc: mark.rutland@arm.com, rafael@kernel.org, catalin.marinas@arm.com, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org, vschneid@redhat.com, arnd@arndb.de, chenhuacai@kernel.org, cl@os.amperecomputing.com, vbabka@suse.cz, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, yury.norov@gmail.com, paul.walmsley@sifive.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 18, 2024 at 11:14:12AM +0800, Huang Shijie wrote:
> (0) We list the ARCHs which support the NUMA:
>        arm64, loongarch, powerpc, riscv,
>        sparc, mips, s390, x86,

I do not understand this format, what are you saying here?

Have you read the kernel documentation for how to write changelog texts?
It doesn't say "list a bunch of things", it's a bit more descriptive.

> 
> (1) Some ARCHs in (0) override the generic cpu_to_node(), such as:
>        sparc, mips, s390, x86.
> 
>     Since these ARCHs have their own cpu_to_node(), we do not care
>     about them.
> 
> (2) The ARCHs enable NUMA and use the generic cpu_to_node.
>     From (0) and (1), we can know that four ARCHs support NUMA and
>     use the generic cpu_to_node:
>         arm64, loongarch, powerpc, riscv,
> 
>     The generic cpu_to_node depends on percpu "numa_node".
> 
>     (2.1) The loongarch sets "numa_node" in:
>           start_kernel --> smp_prepare_boot_cpu()
> 
>     (2.2) The arm64, powerpc, riscv set "numa_node" in:
>        	  start_kernel --> arch_call_rest_init() --> rest_init()
>        	               --> kernel_init() --> kernel_init_freeable()
>                        --> smp_prepare_cpus()
> 
>     (2.3) The first place calling the cpu_to_node() is early_trace_init():
>           start_kernel --> early_trace_init()--> __ring_buffer_alloc()
> 	               --> rb_allocate_cpu_buffer()
> 
>     (2.4) So it safe for loongarch. But for arm64, powerpc and riscv,
>           there are at least four places in the common code where
> 	  the cpu_to_node() is called before it is initialized:
> 	   a.) early_trace_init()         in kernel/trace/trace.c
> 	   b.) sched_init()               in kernel/sched/core.c
> 	   c.) init_sched_fair_class()    in kernel/sched/fair.c
> 	   d.) workqueue_init_early()     in kernel/workqueue.c
> 
> (3) In order to fix the issue, the patch refactors the generic cpu_to_node:
>     (3.1) change cpu_to_node to function pointer,
>           and export it for kernel modules.
> 
>     (3.2) introduce _cpu_to_node() which is the original cpu_to_node().
> 
>     (3.3) introduce smp_prepare_boot_cpu_start() to wrap the original
>           smp_prepare_boot_cpu(), and set cpu_to_node with
> 	  early_cpu_to_node which works fine for arm64, powerpc,
> 	  riscv and loongarch.
> 
>     (3.4) introduce smp_prepare_cpus_done() to wrap the original
>           smp_prepare_cpus().
> 	  The "numa_node" is ready after smp_prepare_cpus(),
> 	  then set cpu_to_node with _cpu_to_node().

When you start listing different things in a changelog, that's a hint to
the reviewer to say "please break this up" as patches need to do only
one thing at a time.  As I can't follow the above text at all, that's
all the review comments I'm able to give here, sorry.

But as-is, this isn't acceptable :(

thanks,

greg k-h
