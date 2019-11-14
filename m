Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED60FC2A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:32:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DGV917dtzF5YM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:32:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFxd28rCzF53r
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:07:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFxc5R8cz9sRK; Thu, 14 Nov 2019 20:07:48 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 16f6b67cf03cb43db7104acb2ca877bdc2606c92
In-Reply-To: <20191001084656.31277-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/book3s64/hash: Add cond_resched to avoid soft
 lockup warning
Message-Id: <47DFxc5R8cz9sRK@ozlabs.org>
Date: Thu, 14 Nov 2019 20:07:48 +1100 (AEDT)
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-10-01 at 08:46:56 UTC, "Aneesh Kumar K.V" wrote:
> With large memory (8TB and more) hotplug, we can get soft lockup warnings
> as below. These were caused by a long loop without any explicit cond_resched
> which is a problem for !PREEMPT kernels.
> 
> Avoid the using cond_resched() while inserting hash page table entries. We
> already do similar cond_resched() in __add_pages() (
> commit: f64ac5e6e306 ("mm, memory_hotplug: add scheduling point to __add_pages"))
> 
>  rcu:     3-....: (24002 ticks this GP) idle=13e/1/0x4000000000000002 softirq=722/722 fqs=12001
>   (t=24003 jiffies g=4285 q=2002)
>  NMI backtrace for cpu 3
>  CPU: 3 PID: 3870 Comm: ndctl Not tainted 5.3.0-197.18-default+ #2
>  Call Trace:
>  [c0000000692b3040] [c000000000f759fc] dump_stack+0xb0/0xf4 (unreliable)
>  [c0000000692b3080] [c000000000f80ee4] nmi_cpu_backtrace+0x124/0x130
>  [c0000000692b3100] [c000000000f8109c] nmi_trigger_cpumask_backtrace+0x1ac/0x1f0
>  [c0000000692b31a0] [c00000000006c2f8] arch_trigger_cpumask_backtrace+0x28/0x3c
>  [c0000000692b31c0] [c0000000001eb1e4] rcu_dump_cpu_stacks+0xf8/0x154
>  [c0000000692b3210] [c0000000001e9e88] rcu_sched_clock_irq+0x878/0xb40
>  [c0000000692b32f0] [c0000000001fe878] update_process_times+0x48/0x90
>  [c0000000692b3320] [c000000000217a6c] tick_sched_handle.isra.16+0x4c/0x80
>  [c0000000692b3340] [c000000000217f08] tick_sched_timer+0x68/0xe0
>  [c0000000692b3380] [c0000000001ffee0] __hrtimer_run_queues+0x180/0x430
>  [c0000000692b3400] [c000000000200bd0] hrtimer_interrupt+0x110/0x300
>  [c0000000692b34b0] [c00000000002c128] timer_interrupt+0x108/0x2f0
>  [c0000000692b3510] [c000000000009194] decrementer_common+0x114/0x120
>  --- interrupt: 901 at arch_add_memory+0xc0/0x130
>      LR = arch_add_memory+0x74/0x130
>  [c0000000692b38b0] [c0000000004646b4] memremap_pages+0x494/0x650
>  [c0000000692b3960] [c0000000004648ac] devm_memremap_pages+0x3c/0xa0
>  [c0000000692b39a0] [c000000000b3f4e8] pmem_attach_disk+0x188/0x750
>  [c0000000692b3aa0] [c000000000b2506c] nvdimm_bus_probe+0xac/0x2c0
>  [c0000000692b3b30] [c000000000aeb218] really_probe+0x148/0x570
>  [c0000000692b3bc0] [c000000000aeba1c] driver_probe_device+0x19c/0x1d0
>  [c0000000692b3c40] [c000000000aebe5c] device_driver_attach+0xcc/0x100
>  [c0000000692b3c80] [c000000000ae8a14] bind_store+0x134/0x1c0
>  [c0000000692b3cd0] [c000000000ae7824] drv_attr_store+0x44/0x60
>  [c0000000692b3cf0] [c00000000055e3f4] sysfs_kf_write+0x64/0x90
>  [c0000000692b3d10] [c00000000055d8f0] kernfs_fop_write+0x1a0/0x270
>  [c0000000692b3d60] [c0000000004698ec] __vfs_write+0x3c/0x70
>  [c0000000692b3d80] [c00000000046d260] vfs_write+0xd0/0x260
>  [c0000000692b3dd0] [c00000000046d6ac] ksys_write+0xdc/0x130
>  [c0000000692b3e20] [c00000000000b278] system_call+0x5c/0x68
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/16f6b67cf03cb43db7104acb2ca877bdc2606c92

cheers
