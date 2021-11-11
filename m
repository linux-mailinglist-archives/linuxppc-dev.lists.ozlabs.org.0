Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2A844D1D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 07:14:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqWds45fKz3bYD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 17:14:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iRcZnouK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqWdC1ry3z2xDw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 17:14:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iRcZnouK; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HqWdB651pz4xbP;
 Thu, 11 Nov 2021 17:14:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1636611246;
 bh=+ODjIM4WjRGzW6IhwoVL0vrTWXdfpn6YDAgGPZV0whM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iRcZnouKrYR6G04Ane3rSIhRG53vbGeF05/6klGMMPwe2o0SllEICL5EEYX6/krdw
 o/aZsn98Ah+sWAPxymRR/trw16OHOVO0i+RH6Kkv+9nH0LDfZfvb+HghE4/h7nS/MS
 hp2xiQroMWkO29YEZg+mm6KJDEHuC+biSJbbxit2PX3wA50PC0OXZuPBHjhktfqdHu
 LM4eKfg0g8gaAroxoLn9jGi1c2PgS2MXJDR+WlLn4wG2elKsKG24zV/cTjYoEKCtQS
 Ua1R4g+fYK4d6rAK2Rx5rbJxmv5Roty9MIUEts9VF2QbV9K7DxkCMn9vWgJ7j2d0zo
 +IOJYul6XJ/aA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] ppc64/fadump: fix inaccurate CPU state info in vmcore
 generated with panic
In-Reply-To: <20211110190143.186346-1-hbathini@linux.ibm.com>
References: <20211110190143.186346-1-hbathini@linux.ibm.com>
Date: Thu, 11 Nov 2021 17:14:03 +1100
Message-ID: <87lf1vmd78.fsf@mpe.ellerman.id.au>
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, sourabhjain@linux.ibm.com,
 mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> In panic path, fadump is triggered via a panic notifier function.
> Before calling panic notifier functions, smp_send_stop() gets called,
> which stops all CPUs except the panic'ing CPU. Commit 8389b37dffdc
> ("powerpc: stop_this_cpu: remove the cpu from the online map.") and
> again commit bab26238bbd4 ("powerpc: Offline CPU in stop_this_cpu()")
> started marking CPUs as offline while stopping them. So, if a kernel
> has either of the above commits, vmcore captured with fadump via panic
> path would show only the panic'ing CPU as online. Sample output of
> crash-utility with such vmcore:
>
>   # crash vmlinux vmcore
>   ...
>         KERNEL: vmlinux
>       DUMPFILE: vmcore  [PARTIAL DUMP]
>           CPUS: 1
>           DATE: Wed Nov 10 09:56:34 EST 2021
>         UPTIME: 00:00:42
>   LOAD AVERAGE: 2.27, 0.69, 0.24
>          TASKS: 183
>       NODENAME: XXXXXXXXX
>        RELEASE: 5.15.0+
>        VERSION: #974 SMP Wed Nov 10 04:18:19 CST 2021
>        MACHINE: ppc64le  (2500 Mhz)
>         MEMORY: 8 GB
>          PANIC: "Kernel panic - not syncing: sysrq triggered crash"
>            PID: 3394
>        COMMAND: "bash"
>           TASK: c0000000150a5f80  [THREAD_INFO: c0000000150a5f80]
>            CPU: 1
>          STATE: TASK_RUNNING (PANIC)
>
>   crash> p -x __cpu_online_mask
>   __cpu_online_mask = $1 = {
>     bits = {0x2, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
>   }
>   crash>
>   crash>
>   crash> p -x __cpu_active_mask
>   __cpu_active_mask = $2 = {
>     bits = {0xff, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
>   }
>   crash>
>
> While this has been the case since fadump was introduced, the issue
> was not identified for two probable reasons:
>
>   - In general, the bulk of the vmcores analyzed were from crash
>     due to exception.
>
>   - The above did change since commit 8341f2f222d7 ("sysrq: Use
>     panic() to force a crash") started using panic() instead of
>     deferencing NULL pointer to force a kernel crash. But then
>     commit de6e5d38417e ("powerpc: smp_send_stop do not offline
>     stopped CPUs") stopped marking CPUs as offline till kernel
>     commit bab26238bbd4 ("powerpc: Offline CPU in stop_this_cpu()")
>     reverted that change.
>
> To avoid vmcore from showing only one CPU as online in panic path,
> skip marking non panic'ing CPUs as offline while stopping them
> during fadump crash.

Is this really worth the added complexity/bug surface?

Why does it matter if the vmcore shows only one CPU online?


> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index c23ee842c4c3..20555d5d5966 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -61,6 +61,7 @@
>  #include <asm/cpu_has_feature.h>
>  #include <asm/ftrace.h>
>  #include <asm/kup.h>
> +#include <asm/fadump.h>
>  
>  #ifdef DEBUG
>  #include <asm/udbg.h>
> @@ -626,7 +627,8 @@ static void nmi_stop_this_cpu(struct pt_regs *regs)
>  	/*
>  	 * IRQs are already hard disabled by the smp_handle_nmi_ipi.
>  	 */
> -	set_cpu_online(smp_processor_id(), false);
> +	if (!(oops_in_progress && should_fadump_crash()))
> +		set_cpu_online(smp_processor_id(), false);
>  
>  	spin_begin();
>  	while (1)
> @@ -650,7 +652,8 @@ static void stop_this_cpu(void *dummy)
>  	 * to know other CPUs are offline before it breaks locks to flush
>  	 * printk buffers, in case we panic()ed while holding the lock.
>  	 */
> -	set_cpu_online(smp_processor_id(), false);
> +	if (!(oops_in_progress && should_fadump_crash()))
> +		set_cpu_online(smp_processor_id(), false);

The comment talks about printk_safe_flush_on_panic(), and this change
would presumably break that. Except that printk_safe_flush_on_panic() no
longer exists.

So do we need to set the CPU online here at all?

ie. could we revert bab26238bbd4 ("powerpc: Offline CPU in stop_this_cpu()")
now that printk_safe_flush_on_panic() no longer exists?

cheers
