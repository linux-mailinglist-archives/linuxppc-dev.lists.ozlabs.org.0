Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8415D2CBEFC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 15:06:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmLNX0vPnzDr4L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 01:06:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmLKh47FjzDr3D
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 01:03:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XKRyNgcu; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmLKh17dYz9sSf;
 Thu,  3 Dec 2020 01:03:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606917816;
 bh=w8hDRNeIQhDyueh7sgFCRS1TIJItyYBlycXwW+bt3sY=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=XKRyNgcu1qkzul20ryMIReBWVThcLPnAKOn4ozT1pkd+Mg6A6gJzv+1eXCQBR3T3k
 1cPX85M0BYHCJXA6Y8DiDHN3FaI0bep+7XVbGbAj6lLuiKjlSOjN6qeXXtusvlCmJg
 F2dHOc8u5jAZB7VY6VYTSSSNbPpfh8u7E8i1uMxlv6yNvEY7c9PLMbqg2w1Yo2jG16
 DNDUP3+xYoWm5w3PZbuAEWC/m8ddQAt3eZ52YxWAOWA8kP7hz28INM6TK2h5AcqfFq
 87/XM+evL3rosVZTws//nymNCjKnHba3xk8OHUj5HUkb/8GFYkzE+1IVbCmRMoudRd
 uQZroxZ3V4Zzg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, rcu@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: powerpc 5.10-rcN boot failures with RCU_SCALE_TEST=m
In-Reply-To: <87eekfh80a.fsf@dja-thinkpad.axtens.net>
References: <87eekfh80a.fsf@dja-thinkpad.axtens.net>
Date: Thu, 03 Dec 2020 01:03:32 +1100
Message-ID: <87v9dkuwy3.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Hi all,
>
> I'm having some difficulty tracking down a bug.
>
> Some configurations of the powerpc kernel since somewhere in the 5.10
> merge window fail to boot on some ppc64 systems. They hang while trying
> to bring up SMP. It seems to depend on the RCU_SCALE/PERF_TEST option.
> (It was renamed in the 5.10 merge window.)
>
> I can reproduce it as follows with qemu tcg:
>
> make -j64 pseries_le_defconfig
> scripts/config -m RCU_SCALE_TEST
> scripts/config -m RCU_PERF_TEST
> make -j 64 vmlinux CC="ccache gcc"
>
> qemu-system-ppc64 -cpu power9 -M pseries -m 1G -nographic -vga none -smp 4 -kernel vmlinux
>
> ...
> [    0.036284][    T0] Mount-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
> [    0.036481][    T0] Mountpoint-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
> [    0.148168][    T1] POWER9 performance monitor hardware support registered
> [    0.151118][    T1] rcu: Hierarchical SRCU implementation.
> [    0.186660][    T1] smp: Bringing up secondary CPUs ...
> <hangs>

One does not simply hang :)

> I have no idea why RCU_SCALE/PERF_TEST would be causing this, but that
> seems to be what does it: if I don't set that, the kernel boots fine.

It seems to be TASKS_RCU that is the key.

I don't need RCU_SCALE_TEST enabled, I can trigger it just with the
following applied:

diff --git a/kernel/rcu/Kconfig b/kernel/rcu/Kconfig
index 0ebe15a84985..f3500c95d6a1 100644
--- a/kernel/rcu/Kconfig
+++ b/kernel/rcu/Kconfig
@@ -78,7 +78,7 @@ config TASKS_RCU_GENERIC
 	  task-based RCU implementations.  Not for manual selection.
 
 config TASKS_RCU
-	def_bool PREEMPTION
+	def_bool y
 	help
 	  This option enables a task-based RCU implementation that uses
 	  only voluntary context switch (not preemption!), idle, and


And bisect points to:
  36dadef23fcc ("kprobes: Init kprobes in early_initcall")

Which moved init_kprobes() prior to SMP bringup.


For some reason when it gets stuck sysrq doesn't work, but I was able to
get it into gdb and manually call handle_sysrq('t') to get the output
below.

The SMP bringup stalls because _cpu_up() is blocked trying to take
cpu_hotplug_lock for writing:

[  401.403132][    T0] task:swapper/0       state:D stack:12512 pid:    1 ppid:     0 flags:0x00000800
[  401.403502][    T0] Call Trace:
[  401.403907][    T0] [c0000000062c37d0] [c0000000062c3830] 0xc0000000062c3830 (unreliable)
[  401.404068][    T0] [c0000000062c39b0] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.404189][    T0] [c0000000062c3a10] [c000000000b87228] __schedule+0x288/0x9b0
[  401.404257][    T0] [c0000000062c3ad0] [c000000000b879b8] schedule+0x68/0x120
[  401.404324][    T0] [c0000000062c3b00] [c000000000184ad4] percpu_down_write+0x164/0x170
[  401.404390][    T0] [c0000000062c3b50] [c000000000116b68] _cpu_up+0x68/0x280
[  401.404475][    T0] [c0000000062c3bb0] [c000000000116e70] cpu_up+0xf0/0x140
[  401.404546][    T0] [c0000000062c3c30] [c00000000011776c] bringup_nonboot_cpus+0xac/0xf0
[  401.404643][    T0] [c0000000062c3c80] [c000000000eea1b8] smp_init+0x40/0xcc
[  401.404727][    T0] [c0000000062c3ce0] [c000000000ec43dc] kernel_init_freeable+0x1e0/0x3a0
[  401.404799][    T0] [c0000000062c3db0] [c000000000011ec4] kernel_init+0x24/0x150
[  401.404958][    T0] [c0000000062c3e20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c

It can't get it because kprobe_optimizer() has taken it for read and is now
blocked waiting for synchronize_rcu_tasks():

[  401.418808][    T0] task:kworker/0:1     state:D stack:13392 pid:   12 ppid:     2 flags:0x00000800
[  401.418951][    T0] Workqueue: events kprobe_optimizer
[  401.419078][    T0] Call Trace:
[  401.419121][    T0] [c0000000062ef650] [c0000000062ef710] 0xc0000000062ef710 (unreliable)
[  401.419213][    T0] [c0000000062ef830] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.419281][    T0] [c0000000062ef890] [c000000000b87228] __schedule+0x288/0x9b0
[  401.419347][    T0] [c0000000062ef950] [c000000000b879b8] schedule+0x68/0x120
[  401.419415][    T0] [c0000000062ef980] [c000000000b8e664] schedule_timeout+0x2a4/0x340
[  401.419484][    T0] [c0000000062efa80] [c000000000b894ec] wait_for_completion+0x9c/0x170
[  401.419552][    T0] [c0000000062efae0] [c0000000001ac85c] __wait_rcu_gp+0x19c/0x210
[  401.419619][    T0] [c0000000062efb40] [c0000000001ac90c] synchronize_rcu_tasks_generic+0x3c/0x70
[  401.419690][    T0] [c0000000062efbe0] [c00000000022a3dc] kprobe_optimizer+0x1dc/0x470
[  401.419757][    T0] [c0000000062efc60] [c000000000136684] process_one_work+0x2f4/0x530
[  401.419823][    T0] [c0000000062efd20] [c000000000138d28] worker_thread+0x78/0x570
[  401.419891][    T0] [c0000000062efdb0] [c000000000142424] kthread+0x194/0x1a0
[  401.419976][    T0] [c0000000062efe20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c

But why is the synchronize_rcu_tasks() not completing?

Hopefully Paul can help there, otherwise I'll try and work out how to
dump some RCU state when it gets stuck.

Full sysrq-t output below.

cheers


[  401.402512][    T0] sysrq: Show State
[  401.403132][    T0] task:swapper/0       state:D stack:12512 pid:    1 ppid:     0 flags:0x00000800
[  401.403502][    T0] Call Trace:
[  401.403907][    T0] [c0000000062c37d0] [c0000000062c3830] 0xc0000000062c3830 (unreliable)
[  401.404068][    T0] [c0000000062c39b0] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.404189][    T0] [c0000000062c3a10] [c000000000b87228] __schedule+0x288/0x9b0
[  401.404257][    T0] [c0000000062c3ad0] [c000000000b879b8] schedule+0x68/0x120
[  401.404324][    T0] [c0000000062c3b00] [c000000000184ad4] percpu_down_write+0x164/0x170
[  401.404390][    T0] [c0000000062c3b50] [c000000000116b68] _cpu_up+0x68/0x280
[  401.404475][    T0] [c0000000062c3bb0] [c000000000116e70] cpu_up+0xf0/0x140
[  401.404546][    T0] [c0000000062c3c30] [c00000000011776c] bringup_nonboot_cpus+0xac/0xf0
[  401.404643][    T0] [c0000000062c3c80] [c000000000eea1b8] smp_init+0x40/0xcc
[  401.404727][    T0] [c0000000062c3ce0] [c000000000ec43dc] kernel_init_freeable+0x1e0/0x3a0
[  401.404799][    T0] [c0000000062c3db0] [c000000000011ec4] kernel_init+0x24/0x150
[  401.404958][    T0] [c0000000062c3e20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.405221][    T0] task:kthreadd        state:S stack:13712 pid:    2 ppid:     0 flags:0x00000800
[  401.405326][    T0] Call Trace:
[  401.405380][    T0] [c0000000062c7a60] [c0000000062c7ac0] 0xc0000000062c7ac0 (unreliable)
[  401.405473][    T0] [c0000000062c7c40] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.405565][    T0] [c0000000062c7ca0] [c000000000b87228] __schedule+0x288/0x9b0
[  401.405639][    T0] [c0000000062c7d60] [c000000000b879b8] schedule+0x68/0x120
[  401.405720][    T0] [c0000000062c7d90] [c000000000143508] kthreadd+0x278/0x2f0
[  401.405798][    T0] [c0000000062c7e20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.405908][    T0] task:rcu_gp          state:I stack:14576 pid:    3 ppid:     2 flags:0x00000800
[  401.407471][    T0] Call Trace:
[  401.407690][    T0] [c0000000062cba00] [c0000000062cba60] 0xc0000000062cba60 (unreliable)
[  401.407851][    T0] [c0000000062cbbe0] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.407952][    T0] [c0000000062cbc40] [c000000000b87228] __schedule+0x288/0x9b0
[  401.408037][    T0] [c0000000062cbd00] [c000000000b879b8] schedule+0x68/0x120
[  401.408123][    T0] [c0000000062cbd30] [c000000000136ed4] rescuer_thread+0x2c4/0x3f0
[  401.408268][    T0] [c0000000062cbdb0] [c000000000142424] kthread+0x194/0x1a0
[  401.408351][    T0] [c0000000062cbe20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.408463][    T0] task:rcu_par_gp      state:I stack:14624 pid:    4 ppid:     2 flags:0x00000800
[  401.408629][    T0] Call Trace:
[  401.408725][    T0] [c0000000062cfa00] [c0000000062cfa60] 0xc0000000062cfa60 (unreliable)
[  401.408830][    T0] [c0000000062cfbe0] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.408927][    T0] [c0000000062cfc40] [c000000000b87228] __schedule+0x288/0x9b0
[  401.409030][    T0] [c0000000062cfd00] [c000000000b879b8] schedule+0x68/0x120
[  401.409143][    T0] [c0000000062cfd30] [c000000000136ed4] rescuer_thread+0x2c4/0x3f0
[  401.409256][    T0] [c0000000062cfdb0] [c000000000142424] kthread+0x194/0x1a0
[  401.409349][    T0] [c0000000062cfe20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.409458][    T0] task:kworker/0:0     state:I stack:13888 pid:    5 ppid:     2 flags:0x00000800
[  401.409749][    T0] Workqueue:  0x0 (events)
[  401.409923][    T0] Call Trace:
[  401.409986][    T0] [c0000000062d39f0] [c0000000062d3a50] 0xc0000000062d3a50 (unreliable)
[  401.410125][    T0] [c0000000062d3bd0] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.410263][    T0] [c0000000062d3c30] [c000000000b87228] __schedule+0x288/0x9b0
[  401.410371][    T0] [c0000000062d3cf0] [c000000000b879b8] schedule+0x68/0x120
[  401.410450][    T0] [c0000000062d3d20] [c000000000138dac] worker_thread+0xfc/0x570
[  401.410567][    T0] [c0000000062d3db0] [c000000000142424] kthread+0x194/0x1a0
[  401.410671][    T0] [c0000000062d3e20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.410795][    T0] task:kworker/0:0H    state:I stack:14624 pid:    6 ppid:     2 flags:0x00000800
[  401.411024][    T0] Call Trace:
[  401.411117][    T0] [c0000000062d79f0] [c0000000062d7a50] 0xc0000000062d7a50 (unreliable)
[  401.411267][    T0] [c0000000062d7bd0] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.411401][    T0] [c0000000062d7c30] [c000000000b87228] __schedule+0x288/0x9b0
[  401.411484][    T0] [c0000000062d7cf0] [c000000000b879b8] schedule+0x68/0x120
[  401.411575][    T0] [c0000000062d7d20] [c000000000138dac] worker_thread+0xfc/0x570
[  401.411666][    T0] [c0000000062d7db0] [c000000000142424] kthread+0x194/0x1a0
[  401.411722][    T0] [c0000000062d7e20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.411809][    T0] task:kworker/u8:0    state:I stack:14624 pid:    7 ppid:     2 flags:0x00000800
[  401.411923][    T0] Call Trace:
[  401.411969][    T0] [c0000000062db9f0] [c0000000062dba50] 0xc0000000062dba50 (unreliable)
[  401.412045][    T0] [c0000000062dbbd0] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.412143][    T0] [c0000000062dbc30] [c000000000b87228] __schedule+0x288/0x9b0
[  401.413324][    T0] [c0000000062dbcf0] [c000000000b879b8] schedule+0x68/0x120
[  401.413402][    T0] [c0000000062dbd20] [c000000000138dac] worker_thread+0xfc/0x570
[  401.413468][    T0] [c0000000062dbdb0] [c000000000142424] kthread+0x194/0x1a0
[  401.413522][    T0] [c0000000062dbe20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.413595][    T0] task:mm_percpu_wq    state:I stack:14624 pid:    8 ppid:     2 flags:0x00000800
[  401.413699][    T0] Call Trace:
[  401.413745][    T0] [c0000000062dfa00] [c0000000062dfa60] 0xc0000000062dfa60 (unreliable)
[  401.413826][    T0] [c0000000062dfbe0] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.413894][    T0] [c0000000062dfc40] [c000000000b87228] __schedule+0x288/0x9b0
[  401.413960][    T0] [c0000000062dfd00] [c000000000b879b8] schedule+0x68/0x120
[  401.414025][    T0] [c0000000062dfd30] [c000000000136ed4] rescuer_thread+0x2c4/0x3f0
[  401.414105][    T0] [c0000000062dfdb0] [c000000000142424] kthread+0x194/0x1a0
[  401.414185][    T0] [c0000000062dfe20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.414275][    T0] task:ksoftirqd/0     state:S stack:14544 pid:    9 ppid:     2 flags:0x00000800
[  401.414506][    T0] Call Trace:
[  401.414729][    T0] [c0000000062e3a20] [c0000000062e3a80] 0xc0000000062e3a80 (unreliable)
[  401.415109][    T0] [c0000000062e3c00] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.415651][    T0] [c0000000062e3c60] [c000000000b87228] __schedule+0x288/0x9b0
[  401.415944][    T0] [c0000000062e3d20] [c000000000b879b8] schedule+0x68/0x120
[  401.416044][    T0] [c0000000062e3d50] [c000000000148774] smpboot_thread_fn+0x254/0x260
[  401.416104][    T0] [c0000000062e3db0] [c000000000142424] kthread+0x194/0x1a0
[  401.416177][    T0] [c0000000062e3e20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.416261][    T0] task:rcu_sched       state:I stack:12928 pid:   10 ppid:     2 flags:0x00000800
[  401.416378][    T0] Call Trace:
[  401.416423][    T0] [c0000000062e7990] [c0000000062e7a50] 0xc0000000062e7a50 (unreliable)
[  401.416501][    T0] [c0000000062e7b70] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.416569][    T0] [c0000000062e7bd0] [c000000000b87228] __schedule+0x288/0x9b0
[  401.416633][    T0] [c0000000062e7c90] [c000000000b879b8] schedule+0x68/0x120
[  401.416705][    T0] [c0000000062e7cc0] [c0000000001b7b54] rcu_gp_kthread+0xa94/0xc00
[  401.416798][    T0] [c0000000062e7db0] [c000000000142424] kthread+0x194/0x1a0
[  401.416871][    T0] [c0000000062e7e20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.416965][    T0] task:migration/0     state:S stack:14496 pid:   11 ppid:     2 flags:0x00000800
[  401.417050][    T0] Call Trace:
[  401.417092][    T0] [c0000000062eba20] [c0000000062ebaa0] 0xc0000000062ebaa0 (unreliable)
[  401.417206][    T0] [c0000000062ebc00] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.417397][    T0] [c0000000062ebc60] [c000000000b87228] __schedule+0x288/0x9b0
[  401.417631][    T0] [c0000000062ebd20] [c000000000b879b8] schedule+0x68/0x120
[  401.417930][    T0] [c0000000062ebd50] [c000000000148774] smpboot_thread_fn+0x254/0x260
[  401.418251][    T0] [c0000000062ebdb0] [c000000000142424] kthread+0x194/0x1a0
[  401.418520][    T0] [c0000000062ebe20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.418808][    T0] task:kworker/0:1     state:D stack:13392 pid:   12 ppid:     2 flags:0x00000800
[  401.418951][    T0] Workqueue: events kprobe_optimizer
[  401.419078][    T0] Call Trace:
[  401.419121][    T0] [c0000000062ef650] [c0000000062ef710] 0xc0000000062ef710 (unreliable)
[  401.419213][    T0] [c0000000062ef830] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.419281][    T0] [c0000000062ef890] [c000000000b87228] __schedule+0x288/0x9b0
[  401.419347][    T0] [c0000000062ef950] [c000000000b879b8] schedule+0x68/0x120
[  401.419415][    T0] [c0000000062ef980] [c000000000b8e664] schedule_timeout+0x2a4/0x340
[  401.419484][    T0] [c0000000062efa80] [c000000000b894ec] wait_for_completion+0x9c/0x170
[  401.419552][    T0] [c0000000062efae0] [c0000000001ac85c] __wait_rcu_gp+0x19c/0x210
[  401.419619][    T0] [c0000000062efb40] [c0000000001ac90c] synchronize_rcu_tasks_generic+0x3c/0x70
[  401.419690][    T0] [c0000000062efbe0] [c00000000022a3dc] kprobe_optimizer+0x1dc/0x470
[  401.419757][    T0] [c0000000062efc60] [c000000000136684] process_one_work+0x2f4/0x530
[  401.419823][    T0] [c0000000062efd20] [c000000000138d28] worker_thread+0x78/0x570
[  401.419891][    T0] [c0000000062efdb0] [c000000000142424] kthread+0x194/0x1a0
[  401.419976][    T0] [c0000000062efe20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.420051][    T0] task:cpuhp/0         state:S stack:14544 pid:   13 ppid:     2 flags:0x00000800
[  401.420136][    T0] Call Trace:
[  401.420197][    T0] [c0000000062ffa20] [c0000000062ffa80] 0xc0000000062ffa80 (unreliable)
[  401.420342][    T0] [c0000000062ffc00] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.420519][    T0] [c0000000062ffc60] [c000000000b87228] __schedule+0x288/0x9b0
[  401.420704][    T0] [c0000000062ffd20] [c000000000b879b8] schedule+0x68/0x120
[  401.420904][    T0] [c0000000062ffd50] [c000000000148774] smpboot_thread_fn+0x254/0x260
[  401.421134][    T0] [c0000000062ffdb0] [c000000000142424] kthread+0x194/0x1a0
[  401.421487][    T0] [c0000000062ffe20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.421834][    T0] task:cpuhp/1         state:S stack:13584 pid:   14 ppid:     2 flags:0x00000800
[  401.422146][    T0] Call Trace:
[  401.422233][    T0] [c0000000063c3a20] [c0000000063c3a80] 0xc0000000063c3a80 (unreliable)
[  401.422314][    T0] [c0000000063c3c00] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.422378][    T0] [c0000000063c3c60] [c000000000b87228] __schedule+0x288/0x9b0
[  401.422444][    T0] [c0000000063c3d20] [c000000000b879b8] schedule+0x68/0x120
[  401.422511][    T0] [c0000000063c3d50] [c000000000148774] smpboot_thread_fn+0x254/0x260
[  401.422575][    T0] [c0000000063c3db0] [c000000000142424] kthread+0x194/0x1a0
[  401.422658][    T0] [c0000000063c3e20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.422742][    T0] task:migration/1     state:S stack:13472 pid:   15 ppid:     2 flags:0x00000800
[  401.422826][    T0] Call Trace:
[  401.422873][    T0] [c0000000063c7a20] [c0000000063c7aa0] 0xc0000000063c7aa0 (unreliable)
[  401.423195][    T0] [c0000000063c7c00] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.423285][    T0] [c0000000063c7c60] [c000000000b87228] __schedule+0x288/0x9b0
[  401.423354][    T0] [c0000000063c7d20] [c000000000b879b8] schedule+0x68/0x120
[  401.423421][    T0] [c0000000063c7d50] [c000000000148774] smpboot_thread_fn+0x254/0x260
[  401.423486][    T0] [c0000000063c7db0] [c000000000142424] kthread+0x194/0x1a0
[  401.423576][    T0] [c0000000063c7e20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.423783][    T0] task:ksoftirqd/1     state:S stack:14544 pid:   16 ppid:     2 flags:0x00000800
[  401.424112][    T0] Call Trace:
[  401.424410][    T0] [c0000000063cba20] [c0000000063cba80] 0xc0000000063cba80 (unreliable)
[  401.424775][    T0] [c0000000063cbc00] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.425005][    T0] [c0000000063cbc60] [c000000000b87228] __schedule+0x288/0x9b0
[  401.425124][    T0] [c0000000063cbd20] [c000000000b879b8] schedule+0x68/0x120
[  401.425197][    T0] [c0000000063cbd50] [c000000000148774] smpboot_thread_fn+0x254/0x260
[  401.425299][    T0] [c0000000063cbdb0] [c000000000142424] kthread+0x194/0x1a0
[  401.425398][    T0] [c0000000063cbe20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.425504][    T0] task:kworker/1:0     state:I stack:14624 pid:   17 ppid:     2 flags:0x00000800
[  401.425684][    T0] Call Trace:
[  401.425748][    T0] [c0000000063cf9f0] [c0000000063cfa50] 0xc0000000063cfa50 (unreliable)
[  401.425845][    T0] [c0000000063cfbd0] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.425916][    T0] [c0000000063cfc30] [c000000000b87228] __schedule+0x288/0x9b0
[  401.425983][    T0] [c0000000063cfcf0] [c000000000b879b8] schedule+0x68/0x120
[  401.426050][    T0] [c0000000063cfd20] [c000000000138dac] worker_thread+0xfc/0x570
[  401.426123][    T0] [c0000000063cfdb0] [c000000000142424] kthread+0x194/0x1a0
[  401.426229][    T0] [c0000000063cfe20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.426327][    T0] task:kworker/1:0H    state:I stack:14320 pid:   18 ppid:     2 flags:0x00000800
[  401.426494][    T0] Call Trace:
[  401.426577][    T0] [c0000000063d39f0] [c0000000063d3ab0] 0xc0000000063d3ab0 (unreliable)
[  401.426685][    T0] [c0000000063d3bd0] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.426772][    T0] [c0000000063d3c30] [c000000000b87228] __schedule+0x288/0x9b0
[  401.426868][    T0] [c0000000063d3cf0] [c000000000b879b8] schedule+0x68/0x120
[  401.426969][    T0] [c0000000063d3d20] [c000000000138dac] worker_thread+0xfc/0x570
[  401.427082][    T0] [c0000000063d3db0] [c000000000142424] kthread+0x194/0x1a0
[  401.427244][    T0] [c0000000063d3e20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.427403][    T0] task:kworker/0:2     state:I stack:14320 pid:   19 ppid:     2 flags:0x00000800
[  401.427624][    T0] Workqueue:  0x0 (events)
[  401.427768][    T0] Call Trace:
[  401.427840][    T0] [c0000000063d79f0] [c0000000063d7ab0] 0xc0000000063d7ab0 (unreliable)
[  401.427981][    T0] [c0000000063d7bd0] [c000000000019d70] __switch_to+0x2e0/0x4a0
[  401.428096][    T0] [c0000000063d7c30] [c000000000b87228] __schedule+0x288/0x9b0
[  401.428303][    T0] [c0000000063d7cf0] [c000000000b879b8] schedule+0x68/0x120
[  401.428394][    T0] [c0000000063d7d20] [c000000000138dac] worker_thread+0xfc/0x570
[  401.428470][    T0] [c0000000063d7db0] [c000000000142424] kthread+0x194/0x1a0
[  401.428575][    T0] [c0000000063d7e20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
[  401.429454][    T0] Sched Debug Version: v0.11, 5.10.0-rc6-gcc-8.2.0-01356-ga1aeabd25a36-dirty #563
[  401.429604][    T0] ktime                                   : 383770.000000
[  401.429683][    T0] sched_clk                               : 401429.227980
[  401.429744][    T0] cpu_clk                                 : 401429.232778
[  401.429799][    T0] jiffies                                 : 4294975673
[  401.429926][    T0]
[  401.430003][    T0] sysctl_sched
[  401.430066][    T0]   .sysctl_sched_latency                    : 12.000000
[  401.430152][    T0]   .sysctl_sched_min_granularity            : 1.500000
[  401.430339][    T0]   .sysctl_sched_wakeup_granularity         : 2.000000
[  401.430524][    T0]   .sysctl_sched_child_runs_first           : 0
[  401.430688][    T0]   .sysctl_sched_features                   : 4139835
[  401.430900][    T0]   .sysctl_sched_tunable_scaling            : 1 (logarithmic)
[  401.431124][    T0]
[  401.431697][    T0] cpu#0
[  401.431766][    T0]   .nr_running                    : 0
[  401.431813][    T0]   .nr_switches                   : 1055
[  401.431865][    T0]   .nr_uninterruptible            : 2
[  401.432042][    T0]   .next_balance                  : 4294.937296
[  401.432103][    T0]   .curr->pid                     : 0
[  401.432195][    T0]   .clock                         : 401423.022270
[  401.432313][    T0]   .clock_task                    : 401423.022270
[  401.432415][    T0]   .avg_idle                      : 1000000
[  401.432488][    T0]   .max_idle_balance_cost         : 500000
[  401.432817][    T0]
[  401.433054][    T0] cfs_rq[0]:/
[  401.433196][    T0]   .exec_clock                    : 0.000000
[  401.433386][    T0]   .MIN_vruntime                  : 0.000001
[  401.433503][    T0]   .min_vruntime                  : 278.095255
[  401.433596][    T0]   .max_vruntime                  : 0.000001
[  401.433691][    T0]   .spread                        : 0.000000
[  401.433784][    T0]   .spread0                       : 0.000000
[  401.433886][    T0]   .nr_spread_over                : 0
[  401.433954][    T0]   .nr_running                    : 0
[  401.434039][    T0]   .load                          : 0
[  401.434127][    T0]   .load_avg                      : 0
[  401.434235][    T0]   .runnable_avg                  : 0
[  401.434341][    T0]   .util_avg                      : 0
[  401.434451][    T0]   .util_est_enqueued             : 0
[  401.434540][    T0]   .removed.load_avg              : 0
[  401.434611][    T0]   .removed.util_avg              : 0
[  401.434697][    T0]   .removed.runnable_avg          : 0
[  401.434811][    T0]   .tg_load_avg_contrib           : 0
[  401.434902][    T0]   .tg_load_avg                   : 0
[  401.435203][    T0]
[  401.435308][    T0] rt_rq[0]:
[  401.435394][    T0]   .rt_nr_running                 : 0
[  401.435481][    T0]   .rt_nr_migratory               : 0
[  401.435569][    T0]   .rt_throttled                  : 0
[  401.435678][    T0]   .rt_time                       : 0.000000
[  401.435772][    T0]   .rt_runtime                    : 950.000000
[  401.435942][    T0]
[  401.436017][    T0] dl_rq[0]:
[  401.436116][    T0]   .dl_nr_running                 : 0
[  401.436212][    T0]   .dl_nr_migratory               : 0
[  401.436301][    T0]   .dl_bw->bw                     : 996147
[  401.436386][    T0]   .dl_bw->total_bw               : 0
[  401.436476][    T0]
[  401.436560][    T0] runnable tasks:
[  401.436614][    T0]  S            task   PID         tree-key  switches  prio     wait-time             sum-exec        sum-sleep
[  401.436687][    T0] -------------------------------------------------------------------------------------------------------------
[  401.436875][    T0]  D       swapper/0     1        84.404220        26   120         0.000000        69.398526         0.000000 0 0 /
[  401.437357][    T0]  S        kthreadd     2        80.816484        18   120         0.000000        24.915098         0.000000 0 0 /
[  401.437554][    T0]  I          rcu_gp     3        26.218815         2   100         0.000000         1.771584         0.000000 0 0 /
[  401.437698][    T0]  I      rcu_par_gp     4        28.434004         2   100         0.000000         0.138216         0.000000 0 0 /
[  401.437853][    T0]  I     kworker/0:0     5        86.357041         8   120         0.000000         7.010072         0.000000 0 0 /
[  401.438002][    T0]  I    kworker/0:0H     6        32.481348         2   100         0.000000         0.097112         0.000000 0 0 /
[  401.438144][    T0]  I    kworker/u8:0     7        32.635000         2   120         0.000000         0.086604         0.000000 0 0 /
[  401.438368][    T0]  I    mm_percpu_wq     8        34.185643         2   100         0.000000         0.118036         0.000000 0 0 /
[  401.438544][    T0]  S     ksoftirqd/0     9        36.753489         3   120         0.000000         0.617720         0.000000 0 0 /
[  401.438686][    T0]  I       rcu_sched    10        79.402224         7   120         0.000000         9.592868         0.000000 0 0 /
[  401.438890][    T0]  S     migration/0    11         0.100901        98     0         0.000000        40.445210         0.000000 0 0 /
[  401.439041][    T0]  D     kworker/0:1    12        83.770462         4   120         0.000000         4.564404         0.000000 0 0 /
[  401.439230][    T0]  S         cpuhp/0    13        54.369911         3   120         0.000000         1.278230         0.000000 0 0 /
[  401.439412][    T0]  I     kworker/0:2    19       278.095255       384   120         0.000000       187.691038         0.000000 0 0 /
[  401.439939][    T0]
[  401.440140][    T0] cpu#1
[  401.440250][    T0]   .nr_running                    : 0
[  401.440331][    T0]   .nr_switches                   : 196
[  401.440434][    T0]   .nr_uninterruptible            : 0
[  401.440500][    T0]   .next_balance                  : 4294.937296
[  401.440552][    T0]   .curr->pid                     : 0
[  401.440631][    T0]   .clock                         : 401422.799786
[  401.440689][    T0]   .clock_task                    : 401422.799786
[  401.440777][    T0]   .avg_idle                      : 1000000
[  401.440865][    T0]   .max_idle_balance_cost         : 500000
[  401.440945][    T0]
[  401.441027][    T0] rt_rq[1]:
[  401.441076][    T0]   .rt_nr_running                 : 0
[  401.441127][    T0]   .rt_nr_migratory               : 0
[  401.441197][    T0]   .rt_throttled                  : 0
[  401.441255][    T0]   .rt_time                       : 0.000000
[  401.441315][    T0]   .rt_runtime                    : 950.000000
[  401.441395][    T0]
[  401.441445][    T0] dl_rq[1]:
[  401.441497][    T0]   .dl_nr_running                 : 0
[  401.441555][    T0]   .dl_nr_migratory               : 0
[  401.441609][    T0]   .dl_bw->bw                     : 996147
[  401.441665][    T0]   .dl_bw->total_bw               : 0
[  401.441717][    T0]
[  401.441755][    T0] runnable tasks:
[  401.441817][    T0]  S            task   PID         tree-key  switches  prio     wait-time             sum-exec        sum-sleep
[  401.441888][    T0] -------------------------------------------------------------------------------------------------------------
[  401.441995][    T0]  S         cpuhp/1    14         7.177520         3   120         0.000000        11.790932         0.000000 0 0 /
[  401.442211][    T0]  S     migration/1    15         0.000000        98     0         0.000000        39.188082         0.000000 0 0 /
[  401.442383][    T0]  S     ksoftirqd/1    16         0.312838         3   120         0.000000         3.826106         0.000000 0 0 /
[  401.442615][    T0]  I     kworker/1:0    17        -3.720346         3   120         0.000000         0.592222         0.000000 0 0 /
[  401.442879][    T0]  I    kworker/1:0H    18        -4.047847         3   100         0.000000         0.211754         0.000000 0 0 /
[  401.443037][    T0]
[  401.443407][    T0]
[  401.443407][    T0] Showing all locks held in the system:
[  401.443722][    T0] 2 locks held by swapper/0/1:
[  401.443859][    T0]  #0: c000000000f6be60 (cpu_add_remove_lock){....}-{3:3}, at: cpu_up+0xcc/0x140
[  401.444836][    T0]  #1: c000000000f6bdd0 (cpu_hotplug_lock){....}-{0:0}, at: _cpu_up+0x68/0x280
[  401.445096][    T0] 5 locks held by kworker/0:1/12:
[  401.445223][    T0]  #0: c000000006070138 ((wq_completion)events){....}-{0:0}, at: process_one_work+0x278/0x530
[  401.445408][    T0]  #1: c0000000062efcc0 ((optimizing_work).work){....}-{0:0}, at: process_one_work+0x278/0x530
[  401.445528][    T0]  #2: c00000000107de60 (kprobe_mutex){....}-{3:3}, at: kprobe_optimizer+0x50/0x470
[  401.445610][    T0]  #3: c000000000f6bdd0 (cpu_hotplug_lock){....}-{0:0}, at: kprobe_optimizer+0x58/0x470
[  401.445746][    T0]  #4: c000000000f6d018 (text_mutex){....}-{3:3}, at: kprobe_optimizer+0x70/0x470
[  401.445895][    T0]
[  401.445934][    T0] =============================================
[  401.445934][    T0]
[  401.446043][    T0] Showing busy workqueues and worker pools:
[  401.446139][    T0] workqueue events: flags=0x0
[  401.446275][    T0]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[  401.446602][    T0]     in-flight: 12:kprobe_optimizer
[  401.447083][    T0] pool 0: cpus=0 node=0 flags=0x0 nice=0 hung=0s workers=3 idle: 19 5

