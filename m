Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66E4B38B5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 00:48:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jx6dJ5fMXz3c7f
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 10:48:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=scPds9Ar;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org;
 envelope-from=srs0=i+8t=s3=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=scPds9Ar; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jx6cR50vnz2x9Z
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 10:48:07 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC1A460EAD;
 Sat, 12 Feb 2022 23:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192E7C340E7;
 Sat, 12 Feb 2022 23:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644709683;
 bh=QKkXa8DXhb7je6AalneOIjKK1P4cO6wh3ACZrueLE7o=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=scPds9ArSM3wZXg3cDB85HXtOBQ0EcW6TwXr8K+V1qx8+GuvuicthppYPVOTqMMpg
 BCdCDH+gGJj1JXueGhKg6ZBUfW3DtfOqxQVwuPER4z9ML9smc6AZupin79AphuBprp
 T0/B1XWdchTF+Te0YZvitu9GDf6mBkNK6pmugRQqTN5/0wVCe4vFawymOnP5DFNrjB
 gF6VoAVCVIO5Li6UMM+7UDmmdmFataEWR4Day8pgEhwJm+ZREQWGxvEfgMUInwWgdR
 FNWVD7q2AZzAe03e2PNNMTmiKJ6jz0lCNiswaS85xRqj7+U0fn18bGfuJtkBt9G8gb
 kX1J2Fv13jHEw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id C1D365C0A2F; Sat, 12 Feb 2022 15:48:02 -0800 (PST)
Date: Sat, 12 Feb 2022 15:48:02 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: BUG: sleeping function called from invalid context at
 include/linux/sched/mm.h:256
Message-ID: <20220212234802.GR4285@paulmck-ThinkPad-P17-Gen-1>
References: <244218af-df6a-236e-0a52-268247dd8271@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <244218af-df6a-236e-0a52-268247dd8271@molgen.mpg.de>
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
Reply-To: paulmck@kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, rcu@vger.kernel.org, linux-mm@kvack.org,
 Jason Baron <jbaron@akamai.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 13, 2022 at 12:05:50AM +0100, Paul Menzel wrote:
> Dear Linux folks,
>=20
>=20
> Running rcutorture on the POWER8 system IBM S822LC with Ubuntu 20.10, it
> found the bug below. I more or less used rcu/dev (0ba8896d2fd7
> (lib/irq_poll: Declare IRQ_POLL softirq vector as ksoftirqd-parking safe))
> [1]. The bug manifested for the four configurations below.
>=20
> 1.  results-rcutorture-kasan/SRCU-T
> 2.  results-rcutorture-kasan/TINY02
> 3.  results-rcutorture/SRCU-T
> 4.  results-rcutorture/TINY02

Adding Frederic on CC...

I am dropping these three for the moment:

0ba8896d2fd75 lib/irq_poll: Declare IRQ_POLL softirq vector as ksoftirqd-pa=
rking safe
efa8027149a1f tick/rcu: Stop allowing RCU_SOFTIRQ in idle
d338d22b9d338 tick/rcu: Remove obsolete rcu_needs_cpu() parameters

Though it might be that these are victims of circumstance, in other
words, that the original bug that Paul Menzel reported was caused by
something else.

							Thanx, Paul

> For example, the attached
>=20
>=20
> /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.11-22.00.51=
-torture/results-rcutorture-kasan/SRCU-T/console.log
>=20
> contains:
>=20
> ```
> [    0.012154][    T1] BUG: sleeping function called from invalid context=
 at
> include/linux/sched/mm.h:256
> [    0.013128][    T1] in_atomic(): 0, irqs_disabled(): 1, non_block: 0,
> pid: 1, name: swapper/0
> [    0.014015][    T1] preempt_count: 0, expected: 0
> [    0.014505][    T1] 2 locks held by swapper/0/1:
> [    0.014987][    T1]  #0: c0000000026108a0 (cpu_hotplug_lock){.+.+}-{0:=
0},
> at: static_key_enable+0x24/0x50
> [    0.015995][    T1]  #1: c0000000027416c8 (jump_label_mutex){+.+.}-{3:=
3},
> at: static_key_enable_cpuslocked+0x88/0x120
> [    0.017107][    T1] irq event stamp: 46
> [    0.017507][    T1] hardirqs last  enabled at (45): [<c0000000010c1054=
>]
> _raw_spin_unlock_irqrestore+0x94/0xd0
> [    0.018549][    T1] hardirqs last disabled at (46): [<c0000000000a9bc4=
>]
> do_patch_instruction+0x3b4/0x4a0
> [    0.019549][    T1] softirqs last  enabled at (0): [<c000000000149540>]
> copy_process+0x8d0/0x1df0
> [    0.020474][    T1] softirqs last disabled at (0): [<0000000000000000>]
> 0x0
> [    0.021200][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 5.17.0-rc3-00349-gd3a9fd9fed88 #34
> [    0.022115][    T1] Call Trace:
> [    0.022443][    T1] [c0000000084837d0] [c000000000961aac]
> dump_stack_lvl+0xa0/0xec (unreliable)
> [    0.023356][    T1] [c000000008483820] [c00000000019b314]
> __might_resched+0x2f4/0x310
> [    0.024174][    T1] [c0000000084838b0] [c0000000004c0c70]
> kmem_cache_alloc+0x220/0x4b0
> [    0.025000][    T1] [c000000008483920] [c000000000448af4]
> __pud_alloc+0x74/0x1d0
> [    0.025772][    T1] [c000000008483970] [c00000000008fe3c]
> hash__map_kernel_page+0x2cc/0x390
> [    0.026643][    T1] [c000000008483a20] [c0000000000a9944]
> do_patch_instruction+0x134/0x4a0
> [    0.027511][    T1] [c000000008483a70] [c0000000000559d4]
> arch_jump_label_transform+0x64/0x78
> [    0.028401][    T1] [c000000008483a90] [c0000000003d6288]
> __jump_label_update+0x148/0x180
> [    0.029254][    T1] [c000000008483b30] [c0000000003d6800]
> static_key_enable_cpuslocked+0xd0/0x120
> [    0.030179][    T1] [c000000008483ba0] [c0000000003d6880]
> static_key_enable+0x30/0x50
> [    0.030996][    T1] [c000000008483bd0] [c00000000200a8f4]
> check_kvm_guest+0x60/0x88
> [    0.031799][    T1] [c000000008483c00] [c000000002027744]
> pSeries_smp_probe+0x54/0xb0
> [    0.032617][    T1] [c000000008483c30] [c000000002011db8]
> smp_prepare_cpus+0x3e0/0x430
> [    0.033444][    T1] [c000000008483cd0] [c000000002004908]
> kernel_init_freeable+0x20c/0x43c
> [    0.034307][    T1] [c000000008483db0] [c000000000012c00]
> kernel_init+0x30/0x1a0
> [    0.035078][    T1] [c000000008483e10] [c00000000000cd64]
> ret_from_kernel_thread+0x5c/0x64
> ```
>=20
>=20
> Kind regards,
>=20
> Paul
>=20
>=20
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git

>=20
>=20
> SLOF=1B[0m=1B[?25l ******************************************************=
****************
> =1B[1mQEMU Starting
> =1B[0m Build Date =3D Nov  3 2021 13:27:05
>  FW Version =3D release 20210217
>  Press "s" to enter Open Firmware.=0D
> =0D
> =1B[0m=1B[?25hC0000=0DC0100=0DC0120=0DC0140=0DC0200=0DC0240=0DC0260=0DC02=
E0=0DC0300=0DC0320=0DC0340=0DC0360=0DC0370=0DC0380=0DC0371=0DC0373=0DC0374=
=0DC03F0=0DC0400=0DC0480=0DC04C0=0DC04D0=0DC0500=0DPopulating /vdevice meth=
ods
> Populating /vdevice/vty@71000000
> Populating /vdevice/nvram@71000001
> Populating /vdevice/v-scsi@71000002
>        SCSI: Looking for devices
> C05A0=0DPopulating /pci@800000020000000
> C0600=0DC06C0=0DC0700=0DC0800=0DC0880=0DNo NVRAM common partition, re-ini=
tializing...
> C0890=0DC08A0=0DC08A8=0DC08B0=0DScanning USB=20
> C08C0=0DC08D0=0DUsing default console: /vdevice/vty@71000000
> C08E0=0DC08E8=0DDetected RAM kernel at 400000 (3573b18 bytes)=20
> C08FF=0D    =20
>   Welcome to Open Firmware
>=20
>   Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
>   This program and the accompanying materials are made available
>   under the terms of the BSD License available at
>   http://www.opensource.org/licenses/bsd-license.php
>=20
> Booting from memory...
> OF stdout device is: /vdevice/vty@71000000
> Preparing to boot Linux version 5.17.0-rc3-00349-gd3a9fd9fed88 (pmenzel@f=
lughafenberlinbrandenburgwillybrandt.molgen.mpg.de) (gcc (Ubuntu 11.2.0-7ub=
untu2) 11.2.0, GNU ld (GNU Binutils for Ubuntu) 2.37) #34 SMP Sat Feb 12 07=
:31:47 CET 2022
> Detected machine type: 0000000000000101
> command line: debug_boot_weak_hash panic=3D-1 console=3DttyS0 rcupdate.rc=
u_cpu_stall_suppress_at_boot=3D1 torture.disable_onoff_at_boot rcupdate.rcu=
_task_stall_timeout=3D30000 rcutorture.torture_type=3Dsrcu rcutorture.onoff=
_interval=3D1000 rcutorture.onoff_holdoff=3D30 rcutorture.n_barrier_cbs=3D4=
 rcutorture.stat_interval=3D15 rcutorture.shutdown_secs=3D2520 rcutorture.t=
est_no_idle_hz=3D1 rcutorture.verbose=3D1
> Max number of cores passed to firmware: 256 (NR_CPUS =3D 2048)
> Calling ibm,client-architecture-support... done
> memory layout at init:
>   memory_limit : 0000000000000000 (16 MB aligned)
>   alloc_bottom : 0000000003990000
>   alloc_top    : 0000000020000000
>   alloc_top_hi : 0000000020000000
>   rmo_top      : 0000000020000000
>   ram_top      : 0000000020000000
> instantiating rtas at 0x000000001fff0000... done
> prom_hold_cpus: skipped
> copying OF device tree...
> Building dt strings...
> Building dt structure...
> Device tree strings 0x00000000039a0000 -> 0x00000000039a0a28
> Device tree struct  0x00000000039b0000 -> 0x00000000039c0000
> Quiescing Open Firmware ...
> Booting Linux via __start() @ 0x0000000000400000 ...
> [    0.000000][    T0] debug_boot_weak_hash enabled
> [    0.000000][    T0] hash-mmu: Page sizes from device-tree:
> [    0.000000][    T0] hash-mmu: base_shift=3D12: shift=3D12, sllp=3D0x00=
00, avpnm=3D0x00000000, tlbiel=3D1, penc=3D0
> [    0.000000][    T0] hash-mmu: base_shift=3D16: shift=3D16, sllp=3D0x01=
10, avpnm=3D0x00000000, tlbiel=3D1, penc=3D1
> [    0.000000][    T0] Using 1TB segments
> [    0.000000][    T0] hash-mmu: Initializing hash mmu with SLB
> [    0.000000][    T0] Linux version 5.17.0-rc3-00349-gd3a9fd9fed88 (pmen=
zel@flughafenberlinbrandenburgwillybrandt.molgen.mpg.de) (gcc (Ubuntu 11.2.=
0-7ubuntu2) 11.2.0, GNU ld (GNU Binutils for Ubuntu) 2.37) #34 SMP Sat Feb =
12 07:31:47 CET 2022
> [    0.000000][    T0] Using pSeries machine description
> [    0.000000][    T0] printk: bootconsole [udbg0] enabled
> [    0.000000][    T0] Partition configured for 8 cpus.
> [    0.000000][    T0] CPU maps initialized for 8 threads per core
> [    0.000000][    T0] numa: Partition configured for 1 NUMA nodes.
> [    0.000000][    T0] --------------------------------------------------=
---
> [    0.000000][    T0] phys_mem_size     =3D 0x20000000
> [    0.000000][    T0] dcache_bsize      =3D 0x80
> [    0.000000][    T0] icache_bsize      =3D 0x80
> [    0.000000][    T0] cpu_features      =3D 0x000000eb8f5d9187
> [    0.000000][    T0]   possible        =3D 0x000ffbfbcf5fb187
> [    0.000000][    T0]   always          =3D 0x0000000380008181
> [    0.000000][    T0] cpu_user_features =3D 0xdc0065c2 0xae000000
> [    0.000000][    T0] mmu_features      =3D 0x78006001
> [    0.000000][    T0] firmware_features =3D 0x00000085455a445f
> [    0.000000][    T0] vmalloc start     =3D 0xc008000000000000
> [    0.000000][    T0] IO start          =3D 0xc00a000000000000
> [    0.000000][    T0] vmemmap start     =3D 0xc00c000000000000
> [    0.000000][    T0] hash-mmu: ppc64_pft_size    =3D 0x16
> [    0.000000][    T0] hash-mmu: htab_hash_mask    =3D 0x7fff
> [    0.000000][    T0] --------------------------------------------------=
---
> [    0.000000][    T0] numa:   NODE_DATA [mem 0x1ff20a00-0x1ff25d7f]
> [    0.000000][    T0] rfi-flush: fallback displacement flush available
> [    0.000000][    T0] rfi-flush: ori type flush available
> [    0.000000][    T0] rfi-flush: mttrig type flush available
> [    0.000000][    T0] count-cache-flush: hardware flush enabled.
> [    0.000000][    T0] link-stack-flush: software flush enabled.
> [    0.000000][    T0] stf-barrier: hwsync barrier available
> [    0.000000][    T0] PPC64 nvram contains 65536 bytes
> [    0.000000][    T0] PV qspinlock hash table entries: 4096 (order: 0, 6=
5536 bytes, linear)
> [    0.000000][    T0] barrier-nospec: using ORI speculation barrier
> [    0.000000][    T0] Zone ranges:
> [    0.000000][    T0]   Normal   [mem 0x0000000000000000-0x000000001ffff=
fff]
> [    0.000000][    T0] Movable zone start for each node
> [    0.000000][    T0] Early memory node ranges
> [    0.000000][    T0]   node   0: [mem 0x0000000000000000-0x000000001fff=
ffff]
> [    0.000000][    T0] Initmem setup node 0 [mem 0x0000000000000000-0x000=
000001fffffff]
> [    0.000000][    T0] percpu: Embedded 10 pages/cpu s601680 r0 d53680 u1=
048576
> [    0.000000][    T0] Fallback order for Node 0: 0=20
> [    0.000000][    T0] Built 1 zonelists, mobility grouping on.  Total pa=
ges: 8184
> [    0.000000][    T0] Policy zone: Normal
> [    0.000000][    T0] Kernel command line: debug_boot_weak_hash panic=3D=
-1 console=3DttyS0 rcupdate.rcu_cpu_stall_suppress_at_boot=3D1 torture.disa=
ble_onoff_at_boot rcupdate.rcu_task_stall_timeout=3D30000 rcutorture.tortur=
e_type=3Dsrcu rcutorture.onoff_interval=3D1000 rcutorture.onoff_holdoff=3D3=
0 rcutorture.n_barrier_cbs=3D4 rcutorture.stat_interval=3D15 rcutorture.shu=
tdown_secs=3D2520 rcutorture.test_no_idle_hz=3D1 rcutorture.verbose=3D1
> [    0.000000][    T0] Dentry cache hash table entries: 65536 (order: 3, =
524288 bytes, linear)
> [    0.000000][    T0] Inode-cache hash table entries: 32768 (order: 2, 2=
62144 bytes, linear)
> [    0.000000][    T0] mem auto-init: stack:off, heap alloc:off, heap fre=
e:off
> [    0.000000][    T0] Memory: 395008K/524288K available (17216K kernel c=
ode, 3648K rwdata, 4480K rodata, 5888K init, 12430K bss, 129280K reserved, =
0K cma-reserved)
> [    0.000000][    T0] SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, =
CPUs=3D8, Nodes=3D1
> [    0.000000][    T0] ftrace: allocating 37699 entries in 14 pages
> [    0.000000][    T0] ftrace: allocated 14 pages with 3 groups
> [    0.000000][    T0] trace event string verifier disabled
> [    0.000000][    T0] Running RCU self tests
> [    0.000000][    T0] rcu: Hierarchical RCU implementation.
> [    0.000000][    T0] rcu: 	RCU lockdep checking is enabled.
> [    0.000000][    T0] rcu: 	RCU restricting CPUs from NR_CPUS=3D2048 to =
nr_cpu_ids=3D8.
> [    0.000000][    T0] 	Tasks-RCU CPU stall warnings timeout set to 30000=
 (rcu_task_stall_timeout).
> [    0.000000][    T0] 	Trampoline variant of Tasks RCU enabled.
> [    0.000000][    T0] 	Rude variant of Tasks RCU enabled.
> [    0.000000][    T0] 	Tracing variant of Tasks RCU enabled.
> [    0.000000][    T0] rcu: RCU calculated value of scheduler-enlistment =
delay is 10 jiffies.
> [    0.000000][    T0] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, =
nr_cpu_ids=3D8
> [    0.000000][    T0] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
> [    0.000000][    T0] rcu: srcu_init: Setting srcu_struct sizes based on=
 contention.
> [    0.000000][    T0] random: get_random_u64 called from start_kernel+0x=
6b4/0x910 with crng_init=3D0
> [    0.000000][    T0] clocksource: timebase: mask: 0xffffffffffffffff ma=
x_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
> [    0.001150][    T0] clocksource: timebase mult[1f40000] shift[24] regi=
stered
> [    0.001951][    T0] Console: colour dummy device 80x25
> [    0.002491][    T0] Lock dependency validator: Copyright (c) 2006 Red =
Hat, Inc., Ingo Molnar
> [    0.003371][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
> [    0.003869][    T0] ... MAX_LOCK_DEPTH:          48
> [    0.004375][    T0] ... MAX_LOCKDEP_KEYS:        8192
> [    0.004899][    T0] ... CLASSHASH_SIZE:          4096
> [    0.005425][    T0] ... MAX_LOCKDEP_ENTRIES:     32768
> [    0.005959][    T0] ... MAX_LOCKDEP_CHAINS:      65536
> [    0.006492][    T0] ... CHAINHASH_SIZE:          32768
> [    0.007024][    T0]  memory used by lock dependency info: 6365 kB
> [    0.007662][    T0]  memory used for stack traces: 4224 kB
> [    0.008232][    T0]  per task-struct memory footprint: 1920 bytes
> [    0.008901][    T0] pid_max: default: 32768 minimum: 301
> [    0.009530][    T0] Mount-cache hash table entries: 8192 (order: 0, 65=
536 bytes, linear)
> [    0.010382][    T0] Mountpoint-cache hash table entries: 8192 (order: =
0, 65536 bytes, linear)
> [    0.012154][    T1] BUG: sleeping function called from invalid context=
 at include/linux/sched/mm.h:256
> [    0.013128][    T1] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, =
pid: 1, name: swapper/0
> [    0.014015][    T1] preempt_count: 0, expected: 0
> [    0.014505][    T1] 2 locks held by swapper/0/1:
> [    0.014987][    T1]  #0: c0000000026108a0 (cpu_hotplug_lock){.+.+}-{0:=
0}, at: static_key_enable+0x24/0x50
> [    0.015995][    T1]  #1: c0000000027416c8 (jump_label_mutex){+.+.}-{3:=
3}, at: static_key_enable_cpuslocked+0x88/0x120
> [    0.017107][    T1] irq event stamp: 46
> [    0.017507][    T1] hardirqs last  enabled at (45): [<c0000000010c1054=
>] _raw_spin_unlock_irqrestore+0x94/0xd0
> [    0.018549][    T1] hardirqs last disabled at (46): [<c0000000000a9bc4=
>] do_patch_instruction+0x3b4/0x4a0
> [    0.019549][    T1] softirqs last  enabled at (0): [<c000000000149540>=
] copy_process+0x8d0/0x1df0
> [    0.020474][    T1] softirqs last disabled at (0): [<0000000000000000>=
] 0x0
> [    0.021200][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.17.0-r=
c3-00349-gd3a9fd9fed88 #34
> [    0.022115][    T1] Call Trace:
> [    0.022443][    T1] [c0000000084837d0] [c000000000961aac] dump_stack_l=
vl+0xa0/0xec (unreliable)
> [    0.023356][    T1] [c000000008483820] [c00000000019b314] __might_resc=
hed+0x2f4/0x310
> [    0.024174][    T1] [c0000000084838b0] [c0000000004c0c70] kmem_cache_a=
lloc+0x220/0x4b0
> [    0.025000][    T1] [c000000008483920] [c000000000448af4] __pud_alloc+=
0x74/0x1d0
> [    0.025772][    T1] [c000000008483970] [c00000000008fe3c] hash__map_ke=
rnel_page+0x2cc/0x390
> [    0.026643][    T1] [c000000008483a20] [c0000000000a9944] do_patch_ins=
truction+0x134/0x4a0
> [    0.027511][    T1] [c000000008483a70] [c0000000000559d4] arch_jump_la=
bel_transform+0x64/0x78
> [    0.028401][    T1] [c000000008483a90] [c0000000003d6288] __jump_label=
_update+0x148/0x180
> [    0.029254][    T1] [c000000008483b30] [c0000000003d6800] static_key_e=
nable_cpuslocked+0xd0/0x120
> [    0.030179][    T1] [c000000008483ba0] [c0000000003d6880] static_key_e=
nable+0x30/0x50
> [    0.030996][    T1] [c000000008483bd0] [c00000000200a8f4] check_kvm_gu=
est+0x60/0x88
> [    0.031799][    T1] [c000000008483c00] [c000000002027744] pSeries_smp_=
probe+0x54/0xb0
> [    0.032617][    T1] [c000000008483c30] [c000000002011db8] smp_prepare_=
cpus+0x3e0/0x430
> [    0.033444][    T1] [c000000008483cd0] [c000000002004908] kernel_init_=
freeable+0x20c/0x43c
> [    0.034307][    T1] [c000000008483db0] [c000000000012c00] kernel_init+=
0x30/0x1a0
> [    0.035078][    T1] [c000000008483e10] [c00000000000cd64] ret_from_ker=
nel_thread+0x5c/0x64
> [    0.036446][    T1] cblist_init_generic: Setting adjustable number of =
callback queues.
> [    0.037287][    T1] cblist_init_generic: Setting shift to 3 and lim to=
 1.
> [    0.038055][    T1] cblist_init_generic: Setting shift to 3 and lim to=
 1.
> [    0.038824][    T1] cblist_init_generic: Setting shift to 3 and lim to=
 1.
> [    0.039587][    T1] Running RCU-tasks wait API self tests
> [    0.146361][    T1] POWER8 performance monitor hardware support regist=
ered
> [    0.147185][    T1] rcu: Hierarchical SRCU implementation.
> [    0.149222][    T1] smp: Bringing up secondary CPUs ...
> [    0.204601][    T1] smp: Brought up 1 node, 8 CPUs
> [    0.207243][    T1] numa: Node 0 CPUs: 0-7
> [    0.209922][   T11] Callback from call_rcu_tasks_trace() invoked.
> [    0.214367][    T1] devtmpfs: initialized
> [    0.219757][    T1] PCI host bridge /pci@800000020000000  ranges:
> [    0.222451][    T1]   IO 0x0000200000000000..0x000020000000ffff -> 0x0=
000000000000000
> [    0.225786][    T1]  MEM 0x0000200080000000..0x00002000ffffffff -> 0x0=
000000080000000=20
> [    0.229830][    T1]  MEM 0x0000210000000000..0x000021ffffffffff -> 0x0=
000210000000000=20
> [    0.234205][    T1] PCI: OF: PROBE_ONLY disabled
> [    0.236900][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.242470][    T1] futex hash table entries: 2048 (order: 2, 262144 b=
ytes, linear)
> [    0.246995][    T1] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.251296][    T1] cpuidle: using governor menu
> =0DLinux ppc64le
> #34 SMP Sat Feb [    0.255268][    T1] EEH: pSeries platform initialized
> [    0.264868][    T1] software IO TLB: tearing down default memory pool
> [    0.268326][    T1] PCI: Probing PCI hardware
> [    0.270382][    T1] PCI host bridge to bus 0000:00
> [    0.272544][    T1] pci_bus 0000:00: root bus resource [io  0x10000-0x=
1ffff] (bus address [0x0000-0xffff])
> [    0.276821][    T1] pci_bus 0000:00: root bus resource [mem 0x20008000=
0000-0x2000ffffffff] (bus address [0x80000000-0xffffffff])
> [    0.282731][    T1] pci_bus 0000:00: root bus resource [mem 0x21000000=
0000-0x21ffffffffff 64bit]
> [    0.287465][    T1] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.309631][   T10] Callback from call_rcu_tasks_rude() invoked.
> [    0.312867][    T1] IOMMU table initialized, virtual merging enabled
> [    0.344582][    T1] pci_bus 0000:00: resource 4 [io  0x10000-0x1ffff]
> [    0.348030][    T1] pci_bus 0000:00: resource 5 [mem 0x200080000000-0x=
2000ffffffff]
> [    0.352114][    T1] pci_bus 0000:00: resource 6 [mem 0x210000000000-0x=
21ffffffffff 64bit]
> [    0.356459][    T1] EEH: No capable adapters found: recovery disabled.
> [    0.371343][    T1] kprobes: kprobe jump-optimization is enabled. All =
kprobes are optimized if possible.
> [    0.378202][    T1] iommu: Default domain type: Translated=20
> [    0.381339][    T1] iommu: DMA domain TLB invalidation policy: strict =
mode=20
> [    0.385440][    T1] vgaarb: loaded
> [    0.388321][    T1] SCSI subsystem initialized
> [    0.391037][    T1] usbcore: registered new interface driver usbfs
> [    0.394601][    T1] usbcore: registered new interface driver hub
> [    0.398094][    T1] usbcore: registered new device driver usb
> [    0.400366][    T1] pps_core: LinuxPPS API ver. 1 registered
> [    0.402280][    T1] pps_core: Software ver. 5.3.6 - Copyright 2005-200=
7 Rodolfo Giometti <giometti@linux.it>
> [    0.405586][    T1] PTP clock support registered
> [    0.407262][    T1] EDAC MC: Ver: 3.0.0
> [    0.409707][    T1] clocksource: Switched to clocksource timebase
> [    0.539450][    T1] hugetlbfs: disabling because there are no supporte=
d hugepage sizes
> [    0.550994][    T1] NET: Registered PF_INET protocol family
> [    0.552997][    T1] IP idents hash table entries: 8192 (order: 0, 6553=
6 bytes, linear)
> [    0.556180][    T1] tcp_listen_portaddr_hash hash table entries: 1024 =
(order: 0, 81920 bytes, linear)
> [    0.559380][    T1] TCP established hash table entries: 8192 (order: 0=
, 65536 bytes, linear)
> [    0.562294][    T1] TCP bind hash table entries: 8192 (order: 3, 58982=
4 bytes, linear)
> [    0.565432][    T1] TCP: Hash tables configured (established 8192 bind=
 8192)
> [    0.567929][    T1] UDP hash table entries: 512 (order: 0, 81920 bytes=
, linear)
> [    0.570500][    T1] UDP-Lite hash table entries: 512 (order: 0, 81920 =
bytes, linear)
> [    0.573331][    T1] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.603302][    T1] RPC: Registered named UNIX socket transport module.
> [    0.605486][    T1] RPC: Registered udp transport module.
> [    0.607241][    T1] RPC: Registered tcp transport module.
> [    0.608977][    T1] RPC: Registered tcp NFSv4.1 backchannel transport =
module.
> [    0.611304][    T1] PCI: CLS 0 bytes, default 128
> [    0.615668][    T1] vas: API is supported only with radix page tables
> [    0.719582][    T9] Callback from call_rcu_tasks() invoked.
> [    0.721765][    T1] srcu-torture:--- Start of test: nreaders=3D7 nfake=
writers=3D4 stat_interval=3D15 verbose=3D1 test_no_idle_hz=3D1 shuffle_inte=
rval=3D3 stutter=3D5 irqreader=3D1 fqs_duration=3D0 fqs_holdoff=3D0 fqs_stu=
tter=3D3 test_boost=3D1/0 test_boost_interval=3D7 test_boost_duration=3D4 s=
hutdown_secs=3D2520 stall_cpu=3D0 stall_cpu_holdoff=3D10 stall_cpu_irqsoff=
=3D0 stall_cpu_block=3D0 n_barrier_cbs=3D4 onoff_interval=3D1000 onoff_hold=
off=3D30 read_exit_delay=3D13 read_exit_burst=3D16 nocbs_nthreads=3D0 nocbs=
_toggle=3D1000
> [    0.736410][    T1] srcu:  Start-test grace-period state: g0 f0x0
> [    0.738483][    T1] rcu_torture_write_types: Testing expedited GPs.
> [    0.740664][    T1] rcu_torture_write_types: Testing asynchronous GPs.
> [    0.742864][    T1] rcu_torture_write_types: Testing polling GPs.
> [    0.744951][    T1] rcu_torture_write_types: Testing normal GPs.
> [    0.747019][    T1] srcu-torture: Creating rcu_torture_writer task
> [    0.749192][   T79] srcu-torture: rcu_torture_writer task started
> [    0.749195][    T1] srcu-torture: Creating rcu_torture_fakewriter task
> [    0.751204][   T79] srcu-torture: GP expediting controlled from boot/s=
ysfs for srcu.
> [    0.756133][    T1] srcu-torture: Creating rcu_torture_fakewriter task
> [    0.756136][   T80] srcu-torture: rcu_torture_fakewriter task started
> [    0.760504][    T1] srcu-torture: Creating rcu_torture_fakewriter task
> [    0.760509][   T81] srcu-torture: rcu_torture_fakewriter task started
> [    0.764854][    T1] srcu-torture: Creating rcu_torture_fakewriter task
> [    0.764859][   T82] srcu-torture: rcu_torture_fakewriter task started
> [    0.769245][    T1] srcu-torture: Creating rcu_torture_reader task
> [    0.769248][   T83] srcu-torture: rcu_torture_fakewriter task started
> [    0.773524][    T1] srcu-torture: Creating rcu_torture_reader task
> [    0.773532][   T84] srcu-torture: rcu_torture_reader task started
> [    0.775667][    T1] srcu-torture: Creating rcu_torture_reader task
> [    0.775671][   T85] srcu-torture: rcu_torture_reader task started
> [    0.809421][    T1] srcu-torture: Creating rcu_torture_reader task
> [    0.809428][   T86] srcu-torture: rcu_torture_reader task started
> [    0.840215][    T1] srcu-torture: Creating rcu_torture_reader task
> [    0.840225][   T87] srcu-torture: rcu_torture_reader task started
> [    0.844850][    T1] srcu-torture: Creating rcu_torture_reader task
> [    0.844858][   T88] srcu-torture: rcu_torture_reader task started
> [    0.848925][    T1] srcu-torture: Creating rcu_torture_reader task
> [    0.848935][   T89] srcu-torture: rcu_torture_reader task started
> [    0.852994][    T1] srcu-torture: Creating rcu_torture_stats task
> [    0.853033][   T90] srcu-torture: rcu_torture_reader task started
> [    0.857023][    T1] srcu-torture: Creating torture_shuffle task
> [    0.859150][   T91] srcu-torture: rcu_torture_stats task started
> [    0.861151][    T1] srcu-torture: Creating torture_stutter task
> [    0.863098][   T92] srcu-torture: torture_shuffle task started
> [    0.869777][    T1] srcu-torture: Creating torture_shutdown task
> [    0.869784][   T93] srcu-torture: torture_stutter task started
> [    0.873619][    T1] srcu-torture: Creating torture_onoff task
> [    0.873623][   T94] srcu-torture: torture_shutdown task started
> [    0.877523][   T94] srcu-torture:torture_shutdown task: 2519992 ms rem=
aining
> [    0.879890][   T95] srcu-torture: torture_onoff task started
> [    0.879897][   T95] srcu-torture: torture_onoff begin holdoff
> [    0.881140][    T1] srcu-torture: Creating rcu_torture_fwd_prog task
> [    0.885877][   T96] srcu-torture: rcu_torture_fwd_progress task started
> [    0.885907][    T1] srcu-torture: Creating rcu_torture_barrier_cbs task
> [    0.890373][    T1] srcu-torture: Creating rcu_torture_barrier_cbs task
> [    0.890378][   T97] srcu-torture: rcu_torture_barrier_cbs task started
> [    0.894744][    T1] srcu-torture: Creating rcu_torture_barrier_cbs task
> [    0.894749][   T98] srcu-torture: rcu_torture_barrier_cbs task started
> [    0.899275][    T1] srcu-torture: Creating rcu_torture_barrier_cbs task
> [    0.899280][   T99] srcu-torture: rcu_torture_barrier_cbs task started
> [    0.901542][    T1] srcu-torture: Creating rcu_torture_barrier task
> [    0.901545][  T100] srcu-torture: rcu_torture_barrier_cbs task started
> [    0.933605][    T1] srcu-torture: Creating rcu_torture_read_exit task
> [    0.933610][  T101] srcu-torture: rcu_torture_barrier task starting
> [    0.937907][  T102] srcu-torture: rcu_torture_read_exit: Start of test
> [    0.940439][  T103] rcu_torture_rea (103) used greatest stack depth: 1=
3952 bytes left
> [    0.944090][    T1] workingset: timestamp_bits=3D38 max_order=3D13 buc=
ket_order=3D0
> [    0.957926][    T1] NFS: Registering the id_resolver key type
> [    0.960051][    T1] Key type id_resolver registered
> [    0.961764][    T1] Key type id_legacy registered
> [    0.963418][    T1] SGI XFS with ACLs, security attributes, no debug e=
nabled
> [    0.967808][    T1] Block layer SCSI generic (bsg) driver version 0.4 =
loaded (major 248)
> [    0.970601][    T1] io scheduler mq-deadline registered
> [    0.972456][    T1] io scheduler kyber registered
> [    1.015754][    T1] Serial: 8250/16550 driver, 4 ports, IRQ sharing di=
sabled
> [    1.019141][    T1] Non-volatile memory driver v1.3
> [    1.027767][    T1] brd: module loaded
> [    1.036526][    T1] loop: module loaded
> [    1.037946][    T1] ipr: IBM Power RAID SCSI Device Driver version: 2.=
6.4 (March 14, 2017)
> [    1.041257][    T1] ibmvscsi 71000002: SRP_VERSION: 16.a
> [    1.043510][    T1] ibmvscsi 71000002: Maximum ID: 64 Maximum LUN: 32 =
Maximum Channel: 3
> [    1.046369][    T1] scsi host0: IBM POWER Virtual SCSI Adapter 1.5.9
> [    1.049354][    C0] ibmvscsi 71000002: partner initialization complete
> [    1.051522][    C0] ibmvscsi 71000002: host srp version: 16.a, host pa=
rtition qemu (0), OS 2, max io 2097152
> [    1.054818][    C0] ibmvscsi 71000002: sent SRP login
> [    1.056501][    C0] ibmvscsi 71000002: SRP_LOGIN succeeded
> [    1.133676][    C0] random: fast init done
> [    1.250568][    T1] e100: Intel(R) PRO/100 Network Driver
> [    1.252420][    T1] e100: Copyright(c) 1999-2006 Intel Corporation
> [    1.254578][    T1] e1000: Intel(R) PRO/1000 Network Driver
> [    1.256485][    T1] e1000: Copyright (c) 1999-2006 Intel Corporation.
> [    1.258698][    T1] e1000e: Intel(R) PRO/1000 Network Driver
> [    1.260622][    T1] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> [    1.262890][    T1] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI=
) Driver
> [    1.265295][    T1] ehci-pci: EHCI PCI platform driver
> [    1.267022][    T1] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Dr=
iver
> [    1.269386][    T1] ohci-pci: OHCI PCI platform driver
> [    1.271237][    T1] i2c_dev: i2c /dev entries driver
> [    1.273021][    T1] device-mapper: uevent: version 1.0.3
> [    1.275098][    T1] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) in=
itialised: dm-devel@redhat.com
> [    1.279321][    T1] usbcore: registered new interface driver usbhid
> [    1.281361][    T1] usbhid: USB HID core driver
> [    1.282929][    T1] ipip: IPv4 and MPLS over IPv4 tunneling driver
> [    1.286222][    T1] NET: Registered PF_INET6 protocol family
> [    1.289308][    T1] Segment Routing with IPv6
> [    1.290833][    T1] In-situ OAM (IOAM) with IPv6
> [    1.292369][    T1] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> [    1.295352][    T1] NET: Registered PF_PACKET protocol family
> [    1.297313][    T1] Key type dns_resolver registered
> [    1.298913][    T1] drmem: No dynamic reconfiguration memory found
> [    1.300993][    T1] Running code patching self-tests ...
> [    1.308024][    T1] registered taskstats version 1
> [    1.311722][    T1] printk: console [netcon0] enabled
> [    1.313376][    T1] netconsole: network logging started
> [    1.316134][    T1] Warning: unable to open an initial console.
> [    1.324335][    T1] Freeing unused kernel image (initmem) memory: 5888K
> [    1.400868][    T1] Run /init as init process
> [    5.879835][  T127] rcu_torture_rea (127) used greatest stack depth: 1=
3760 bytes left
> [    5.979849][  T136] rcu_torture_rea (136) used greatest stack depth: 1=
3312 bytes left
> [    5.999739][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [   15.919932][   T91] srcu-torture: rtc: 000000001821b2cd ver: 116 tfle:=
 0 rta: 117 rtaf: 0 rtf: 107 rtmbe: 0 rtmbkf: 0/104 rtbe: 0 rtbke: 0 rtbre:=
 0 rtbf: 0 rtb: 0 nt: 1602 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D100) barrier:=
 89/89:0 read-exits: 16 nocb-toggles: 0:0
> [   15.929040][   T91] srcu-torture: Reader Pipe:  9509473 310 0 0 0 0 0 =
0 0 0 0
> [   15.931409][   T91] srcu-torture: Reader Batch:  9509153 628 0 0 0 0 0=
 0 0 0 0
> [   15.933783][   T91] srcu-torture: Free-Block Circulation:  116 115 114=
 113 112 111 110 109 108 107 0
> [   15.936773][   T91] rcu: srcu-torture: Tree SRCU g1541 state 0 (SRCU_S=
IZE_SMALL) per-CPU(idx=3D1): 0(0,0 C) 1(0,1 .) 2(-1,1 .) 3(1,0 .) 4(0,1 .) =
5(0,1 .) 6(1,1 .) 7(-1,1 .) T(0,6)
> [   19.769705][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [   19.782934][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [   31.279769][   T91] srcu-torture:=20
> [   31.279771][   T95] srcu-torture: torture_onoff end holdoff
> [   31.279788][   T91] rtc: 00000000b12ce405 ver: 296 tfle: 0 rta: 296 rt=
af: 0 rtf: 286 rtmbe: 0 rtmbkf: 0/279 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb=
: 0 nt: 4682 onoff: 0/0:0/1 -1,0:-1,0 0:0 (HZ=3D100) barrier: 170/170:0 rea=
d-exits: 33 nocb-toggles: 0:0
> [   31.305076][   T91] srcu-torture: Reader Pipe:  27442979 902 0 0 0 0 0=
 0 0 0 0
> [   31.307442][   T91] srcu-torture: Reader Batch:  27442120 1756 0 0 0 0=
 0 0 0 0 0
> [   31.310098][   T91] srcu-torture: Free-Block Circulation:  295 295 294=
 293 292 291 289 288 287 286 0
> [   31.313345][   T91] rcu: srcu-torture: Tree SRCU g3385 state 0 (SRCU_S=
IZE_SMALL) per-CPU(idx=3D0): 0(-2,0 C) 1(0,0 .) 2(0,-1 .) 3(-1,1 .) 4(2,0 .=
) 5(0,0 .) 6(1,1 .) 7(0,-1 .) T(0,0)
> [   33.449756][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [   35.859921][  T159] rcu_torture_rea (159) used greatest stack depth: 1=
3168 bytes left
> [   35.970380][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [   46.639710][   T91] srcu-torture: rtc: 0000000088ac351c ver: 407 tfle:=
 0 rta: 408 rtaf: 0 rtf: 391 rtmbe: 0 rtmbkf: 0/383 rtbe: 0 rtbke: 0 rtbre:=
 0 rtbf: 0 rtb: 0 nt: 6437 onoff: 0/0:2/2 -1,0:31,34 0:65 (HZ=3D100) barrie=
r: 259/259:0 read-exits: 50 nocb-toggles: 0:0
> [   46.645773][   T91] srcu-torture: Reader Pipe:  37652718 1190 0 0 0 0 =
0 0 0 0 0
> [   46.647686][   T91] srcu-torture: Reader Batch:  37651528 2376 0 0 0 0=
 0 0 0 0 0
> [   46.649607][   T91] srcu-torture: Free-Block Circulation:  407 402 401=
 400 399 398 397 394 393 391 0
> [   46.651997][   T91] rcu: srcu-torture: Tree SRCU g4966 state 0 (SRCU_S=
IZE_SMALL) per-CPU(idx=3D0): 0(-6,0 C) 1(1,1 .) 2(1,1 .) 3(-1,1 .) 4(2,0 .)=
 5(1,0 .) 6(1,2 .) 7(2,-1 .) T(1,4)
> [   49.839809][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [   49.909193][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [   61.369871][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [   61.376080][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [   61.503003][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [   61.579718][   T96] rcu_torture_fwd_prog_cr Duration 13 barrier: 8 pen=
ding 36243 n_launders: 39068 n_launders_sa: 370 n_max_gps: 100 n_max_cbs: 4=
2445 cver 0 gps 2438
> [   61.583415][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 21 jiffies): 1s/10: 27007:2229 2s/10: 54506:210
> [   62.009730][   T91] srcu-torture: rtc: 00000000a07ac335 ver: 642 tfle:=
 0 rta: 642 rtaf: 0 rtf: 633 rtmbe: 0 rtmbkf: 0/580 rtbe: 0 rtbke: 0 rtbre:=
 0 rtbf: 0 rtb: 0 nt: 9172 onoff: 0/0:3/3 -1,0:31,36 0:101 (HZ=3D100) barri=
er: 352/353:0 read-exits: 67 nocb-toggles: 0:0
> [   62.019869][   T91] srcu-torture: Reader Pipe:  53350695 1668 0 0 0 0 =
0 0 0 0 0
> [   62.021636][   T91] srcu-torture: Reader Batch:  53348918 3438 0 0 0 0=
 0 0 0 0 0
> [   62.023428][   T91] srcu-torture: Free-Block Circulation:  641 641 640=
 639 638 637 636 635 634 633 0
> [   62.025648][   T91] rcu: srcu-torture: Tree SRCU g17269 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(0,-6 .) 1(-1,2 C) 2(0,0 C) 3(1,-1 .) 4(0,2 .)=
 5(0,0 .) 6(1,1 C) 7(-1,2 .) T(0,0)
> [   63.599757][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [   66.030371][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [   77.359749][   T91] srcu-torture: rtc: 000000007a735a8b ver: 759 tfle:=
 0 rta: 760 rtaf: 0 rtf: 745 rtmbe: 0 rtmbkf: 0/675 rtbe: 0 rtbke: 0 rtbre:=
 0 rtbf: 0 rtb: 0 nt: 11072 onoff: 2/2:3/3 27,28:31,36 55:101 (HZ=3D100) ba=
rrier: 442/442:0 read-exits: 84 nocb-toggles: 0:0
> [   77.366554][   T91] srcu-torture: Reader Pipe:  64273683 1970 0 0 0 0 =
0 0 0 0 0
> [   77.368706][   T91] srcu-torture: Reader Batch:  64271612 4032 0 0 0 0=
 0 0 0 0 0
> [   77.370931][   T91] srcu-torture: Free-Block Circulation:  759 755 754=
 753 751 750 749 747 746 745 0
> [   77.373629][   T91] rcu: srcu-torture: Tree SRCU g18862 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-7,1 C) 1(2,-1 C) 2(-2,1 C) 3(-1,2 C) 4(2,0 .=
) 5(1,1 .) 6(2,1 .) 7(3,-1 C) T(0,4)
> [   79.600752][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [   79.769691][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [   92.729769][   T91] srcu-torture: rtc: 000000002a5f8b4b ver: 922 tfle:=
 0 rta: 922 rtaf: 0 rtf: 913 rtmbe: 0 rtmbkf: 0/822 rtbe: 0 rtbke: 0 rtbre:=
 0 rtbf: 0 rtb: 0 nt: 13628 onoff: 2/2:4/4 27,28:31,41 55:142 (HZ=3D100) ba=
rrier: 531/531:0 read-exits: 101 nocb-toggles: 0:0
> [   92.739524][   T91] srcu-torture: Reader Pipe:  79161826 2396 0 0 0 0 =
0 0 0 0 0
> [   92.741516][   T91] srcu-torture: Reader Batch:  79159278 4936 0 0 0 0=
 0 0 0 0 0
> [   92.743509][   T91] srcu-torture: Free-Block Circulation:  921 921 920=
 919 918 917 916 915 914 913 0
> [   92.745949][   T91] rcu: srcu-torture: Tree SRCU g20884 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(0,-4 .) 1(-1,2 .) 2(-1,-1 .) 3(2,0 .) 4(0,2 .=
) 5(0,0 .) 6(1,1 .) 7(-1,0 .) T(0,0)
> [   93.839740][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [   95.848250][  T228] rcu_torture_rea (228) used greatest stack depth: 1=
2704 bytes left
> [   96.046291][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  108.079713][   T91] srcu-torture: rtc: 0000000066a9ca60 ver: 1083 tfle=
: 0 rta: 1084 rtaf: 0 rtf: 1073 rtmbe: 0 rtmbkf: 0/963 rtbe: 0 rtbke: 0 rtb=
re: 0 rtbf: 0 rtb: 0 nt: 15864 onoff: 3/3:5/5 27,40:31,43 95:185 (HZ=3D100)=
 barrier: 622/623:0 read-exits: 118 nocb-toggles: 0:0
> [  108.085774][   T91] srcu-torture: Reader Pipe:  92603451 2834 0 0 0 0 =
0 0 0 0 0
> [  108.087646][   T91] srcu-torture: Reader Batch:  92600521 5758 0 0 0 0=
 0 0 0 0 0
> [  108.089534][   T91] srcu-torture: Free-Block Circulation:  1083 1082 1=
081 1080 1079 1078 1077 1076 1074 1073 0
> [  108.092124][   T91] rcu: srcu-torture: Tree SRCU g22738 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(0,-3 C) 1(-1,1 C) 2(-2,-2 .) 3(2,1 C) 4(0,2 .=
) 5(0,2 C) 6(1,3 C) 7(0,0 .) T(0,4)
> [  109.609710][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  109.819933][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  123.439733][   T91] srcu-torture:=20
> [  123.439748][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  123.441125][   T91] rtc: 00000000bdda06e8 ver: 1193 tfle: 0 rta: 1193 =
rtaf: 0 rtf: 1184 rtmbe: 0 rtmbkf: 0/1044 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0=
 rtb: 0 nt: 18019 onoff: 3/3:6/6 27,40:31,43 95:220 (HZ=3D100) barrier: 704=
/704:0 read-exits: 135 nocb-toggles: 0:0
> [  123.443596][   T91] srcu-torture: Reader Pipe:  104907530 3067 0 0 0 0=
 0 0 0 0 0
> [  123.444384][   T91] srcu-torture: Reader Batch:  104904317 6273 0 0 0 =
0 0 0 0 0 0
> [  123.445180][   T91] srcu-torture: Free-Block Circulation:  1192 1192 1=
191 1190 1189 1188 1187 1186 1185 1184 0
> [  123.446237][   T91] rcu: srcu-torture: Tree SRCU g24281 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-5,0 C) 1(-1,-1 .) 2(-2,-2 .) 3(2,2 .) 4(2,0 =
=2E) 5(3,0 .) 6(1,1 .) 7(0,0 .) T(0,0)
> [  125.940451][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  126.022641][   T96] rcu_torture_fwd_prog n_max_cbs: 42445
> [  126.023922][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  126.025528][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [  126.439888][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [  126.627101][   T96] rcu_torture_fwd_prog_cr Duration 37 barrier: 18 pe=
nding 47691 n_launders: 55825 n_launders_sa: 50099 n_max_gps: 100 n_max_cbs=
: 50000 cver 7 gps 38
> [  126.630751][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 56 jiffies): 1s/10: 5727:34 2s/10: 0:-1841 3s/10: 45962:18=
42 4s/10: 25716:5 5s/10: 28420:2
> [  138.799712][   T91] srcu-torture: rtc: 0000000011054584 ver: 1339 tfle=
: 0 rta: 1340 rtaf: 0 rtf: 1329 rtmbe: 0 rtmbkf: 0/1152 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 20070 onoff: 3/3:7/7 27,40:31,62 95:282 (HZ=3D100=
) barrier: 794/795:0 read-exits: 152 nocb-toggles: 0:0
> [  138.804774][   T91] srcu-torture: Reader Pipe:  116597688 3336 0 0 0 0=
 0 0 0 0 0
> [  138.806298][   T91] srcu-torture: Reader Batch:  116594132 6885 0 0 0 =
0 0 0 0 0 0
> [  138.807847][   T91] srcu-torture: Free-Block Circulation:  1339 1338 1=
337 1336 1335 1334 1333 1331 1330 1329 0
> [  138.809913][   T91] rcu: srcu-torture: Tree SRCU g26217 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-5,0 C) 1(0,1 C) 2(-2,-2 .) 3(2,3 C) 4(2,0 .)=
 5(2,1 C) 6(1,1 .) 7(0,0 .) T(0,4)
> [  139.519719][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  139.919701][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  153.519723][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  154.169771][   T91] srcu-torture: rtc: 0000000069c139bb ver: 1505 tfle=
: 0 rta: 1505 rtaf: 0 rtf: 1496 rtmbe: 0 rtmbkf: 0/1271 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 22098 onoff: 4/4:8/8 27,40:26,62 125:308 (HZ=3D10=
0) barrier: 887/887:0 read-exits: 170 nocb-toggles: 0:0
> [  154.179930][   T91] srcu-torture: Reader Pipe:  129002019 3640 0 0 0 0=
 0 0 0 0 0
> [  154.181474][   T91] srcu-torture: Reader Batch:  128998189 7462 0 0 0 =
0 0 0 0 0 0
> [  154.183033][   T91] srcu-torture: Free-Block Circulation:  1504 1504 1=
503 1502 1501 1500 1499 1498 1497 1496 0
> [  154.185109][   T91] rcu: srcu-torture: Tree SRCU g28204 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(0,-4 .) 1(-1,-1 .) 2(-2,-2 .) 3(2,3 .) 4(0,2 =
=2E) 5(0,1 .) 6(1,1 .) 7(0,0 .) T(0,0)
> [  156.199699][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  169.519802][   T91] srcu-torture: rtc: 00000000bf65be96 ver: 1653 tfle=
: 0 rta: 1654 rtaf: 0 rtf: 1643 rtmbe: 0 rtmbkf: 0/1365 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 23886 onoff: 4/4:9/9 27,40:26,62 125:341 (HZ=3D10=
0) barrier: 974/974:0 read-exits: 186 nocb-toggles: 0:0
> [  169.551060][   T91] srcu-torture: Reader Pipe:  139758350 3816 0 0 0 0=
 0 0 0 0 0
> [  169.552494][   T91] srcu-torture: Reader Batch:  139754324 7832 0 0 0 =
0 0 0 0 0 0
> [  169.553942][   T91] srcu-torture: Free-Block Circulation:  1653 1652 1=
651 1650 1649 1648 1647 1645 1644 1643 0
> [  169.555874][   T91] rcu: srcu-torture: Tree SRCU g30205 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(0,-4 .) 1(-1,-1 .) 2(-2,-2 .) 3(2,4 C) 4(0,2 =
=2E) 5(0,2 .) 6(1,1 .) 7(0,-1 C) T(0,1)
> [  169.929706][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  170.169748][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  183.769754][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  184.879756][   T91] srcu-torture: rtc: 000000003c9d63c9 ver: 1844 tfle=
: 0 rta: 1844 rtaf: 0 rtf: 1835 rtmbe: 0 rtmbkf: 0/1489 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 25418 onoff: 6/6:9/9 27,40:26,62 188:341 (HZ=3D10=
0) barrier: 1070/1071:0 read-exits: 204 nocb-toggles: 0:0
> [  184.884712][   T91] srcu-torture: Reader Pipe:  149309520 4007 0 0 0 0=
 0 0 0 0 0
> [  184.886177][   T91] srcu-torture: Reader Batch:  149305300 8215 0 0 0 =
0 0 0 0 0 0
> [  184.887658][   T91] srcu-torture: Free-Block Circulation:  1843 1843 1=
842 1841 1840 1839 1838 1837 1836 1835 0
> [  184.889602][   T91] rcu: srcu-torture: Tree SRCU g32468 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(0,-4 C) 1(-1,-1 .) 2(-2,-2 .) 3(2,4 .) 4(0,2 =
=2E) 5(0,2 .) 6(1,1 .) 7(0,-2 .) T(0,0)
> [  186.042152][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  188.079756][   T96] rcu_torture_fwd_prog n_max_cbs: 50000
> [  188.107529][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  188.109157][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [  188.397420][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [  188.613512][   T96] rcu_torture_fwd_prog_cr Duration 13 barrier: 22 pe=
nding 11452 n_launders: 17267 n_launders_sa: 5413 n_max_gps: 100 n_max_cbs:=
 16835 cver 2 gps 68
> [  188.637862][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 37 jiffies): 1s/10: 11855:66 2s/10: 10795:2 3s/10: 1:0 4s/=
10: 11451:1
> [  199.679793][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  199.969830][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  200.239694][   T91] srcu-torture: rtc: 00000000a07ac335 ver: 2028 tfle=
: 0 rta: 2029 rtaf: 0 rtf: 2015 rtmbe: 0 rtmbkf: 0/1640 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 28051 onoff: 6/6:10/10 27,40:26,62 188:373 (HZ=3D=
100) barrier: 1158/1158:0 read-exits: 237 nocb-toggles: 0:0
> [  200.271366][   T91] srcu-torture: Reader Pipe:  164843481 4320 0 0 0 0=
 0 0 0 0 0
> [  200.272957][   T91] srcu-torture: Reader Batch:  164838782 9007 0 0 0 =
0 0 0 0 0 0
> [  200.274571][   T91] srcu-torture: Free-Block Circulation:  2029 2028 2=
027 2026 2025 2024 2023 2021 2018 2017 0
> [  200.276710][   T91] rcu: srcu-torture: Tree SRCU g34933 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(0,-4 .) 1(-1,-1 .) 2(-2,-2 C) 3(2,5 C) 4(0,2 =
=2E) 5(0,2 .) 6(1,1 .) 7(0,-2 C) T(0,1)
> [  213.519804][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  215.609792][   T91] srcu-torture: rtc: 00000000c6822bdf ver: 2148 tfle=
: 0 rta: 2148 rtaf: 0 rtf: 2139 rtmbe: 0 rtmbkf: 0/1732 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 29591 onoff: 7/7:10/10 27,40:26,62 217:373 (HZ=3D=
100) barrier: 1248/1248:0 read-exits: 238 nocb-toggles: 0:0
> [  215.645871][   T91] srcu-torture: Reader Pipe:  173812048 4537 0 0 0 0=
 0 0 0 0 0
> [  215.647551][   T91] srcu-torture: Reader Batch:  173807123 9447 0 0 0 =
0 0 0 0 0 0
> [  215.649137][   T91] srcu-torture: Free-Block Circulation:  2147 2147 2=
146 2145 2144 2143 2142 2141 2140 2139 0
> [  215.651296][   T91] rcu: srcu-torture: Tree SRCU g36548 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(0,-5 .) 1(-3,-1 .) 2(-2,-2 .) 3(2,4 .) 4(0,2 =
=2E) 5(0,2 .) 6(1,1 .) 7(2,-1 .) T(0,0)
> [  216.022062][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  229.681730][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  230.009787][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  230.719716][   T91] srcu-torture: rtc: 00000000546bf1e1 ver: 2359 tfle=
: 0 rta: 2360 rtaf: 0 rtf: 2349 rtmbe: 0 rtmbkf: 0/1867 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 31955 onoff: 7/7:12/12 27,40:26,63 217:477 (HZ=3D=
100) barrier: 1338/1338:0 read-exits: 271 nocb-toggles: 0:0
> [  230.750609][   T91] srcu-torture: Reader Pipe:  188269549 4798 0 0 0 0=
 0 0 0 0 0
> [  230.752024][   T91] srcu-torture: Reader Batch:  188264271 10063 0 0 0=
 0 0 0 0 0 0
> [  230.753470][   T91] srcu-torture: Free-Block Circulation:  2359 2357 2=
356 2355 2354 2353 2352 2351 2350 2349 0
> [  230.755375][   T91] rcu: srcu-torture: Tree SRCU g39053 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(0,-5 C) 1(-3,-1 .) 2(-2,-2 .) 3(2,5 C) 4(0,2 =
=2E) 5(0,2 .) 6(1,1 .) 7(2,-1 C) T(0,1)
> [  243.599752][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  246.185213][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  246.319695][   T91] srcu-torture: rtc: 00000000bdda06e8 ver: 2494 tfle=
: 0 rta: 2495 rtaf: 0 rtf: 2482 rtmbe: 0 rtmbkf: 0/1954 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 33336 onoff: 8/8:12/12 27,40:26,63 250:477 (HZ=3D=
100) barrier: 1431/1431:0 read-exits: 288 nocb-toggles: 0:0
> [  246.342417][   T91] srcu-torture: Reader Pipe:  197019986 4982 0 0 0 0=
 0 0 0 0 0
> [  246.343949][   T91] srcu-torture: Reader Batch:  197014563 10388 0 0 0=
 0 0 0 0 0 0
> [  246.345513][   T91] srcu-torture: Free-Block Circulation:  2496 2495 2=
493 2492 2490 2489 2488 2486 2485 2483 0
> [  246.347574][   T91] rcu: srcu-torture: Tree SRCU g40877 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(0,-4 C) 1(-3,-1 .) 2(-2,-2 .) 3(2,6 C) 4(0,2 =
C) 5(0,2 .) 6(1,1 .) 7(2,-1 .) T(0,3)
> [  250.159726][   T96] rcu_torture_fwd_prog n_max_cbs: 16835
> [  250.161609][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  250.163230][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [  250.587633][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [  250.789569][   T96] rcu_torture_fwd_prog_cr Duration 15 barrier: 20 pe=
nding 19717 n_launders: 28097 n_launders_sa: 7586 n_max_gps: 100 n_max_cbs:=
 26583 cver 2 gps 34
> [  250.793192][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 36 jiffies): 1s/10: 18045:33 2s/10: 36635:3
> [  259.759702][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  259.979815][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  261.679791][   T91] srcu-torture: rtc: 0000000047becefe ver: 2677 tfle=
: 0 rta: 2677 rtaf: 0 rtf: 2668 rtmbe: 0 rtmbkf: 0/2092 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 35938 onoff: 10/10:12/12 27,42:26,63 321:477 (HZ=
=3D100) barrier: 1513/1513:0 read-exits: 305 nocb-toggles: 0:0
> [  261.687468][   T91] srcu-torture: Reader Pipe:  212463976 5320 0 0 0 0=
 0 0 0 0 0
> [  261.689775][   T91] srcu-torture: Reader Batch:  212458242 11040 0 0 0=
 0 0 0 0 0 0
> [  261.711632][   T91] srcu-torture: Free-Block Circulation:  2676 2676 2=
675 2674 2673 2672 2671 2670 2669 2668 0
> [  261.714166][   T91] rcu: srcu-torture: Tree SRCU g43012 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(0,-4 .) 1(-3,-1 .) 2(-2,-2 .) 3(2,4 .) 4(0,1 =
=2E) 5(0,2 .) 6(1,1 .) 7(2,-1 .) T(0,0)
> [  273.679747][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  276.189703][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  277.039722][   T91] srcu-torture: rtc: 00000000ec899488 ver: 2814 tfle=
: 0 rta: 2815 rtaf: 0 rtf: 2802 rtmbe: 0 rtmbkf: 0/2204 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 37743 onoff: 10/10:13/13 27,42:26,63 321:505 (HZ=
=3D100) barrier: 1608/1608:0 read-exits: 322 nocb-toggles: 0:0
> [  277.047333][   T91] srcu-torture: Reader Pipe:  222699601 5604 0 0 0 0=
 0 0 0 0 0
> [  277.049134][   T91] srcu-torture: Reader Batch:  222693532 11661 0 0 0=
 0 0 0 0 0 0
> [  277.051018][   T91] srcu-torture: Free-Block Circulation:  2814 2813 2=
812 2810 2808 2807 2806 2805 2804 2802 0
> [  277.053426][   T91] rcu: srcu-torture: Tree SRCU g44830 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-5,0 C) 1(-1,-3 .) 2(-2,-2 .) 3(5,2 C) 4(1,1 =
C) 5(3,0 C) 6(1,1 C) 7(-1,2 .) T(1,1)
> [  289.759731][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  289.959706][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  292.399748][   T91] srcu-torture: rtc: 000000002e648938 ver: 2984 tfle=
: 0 rta: 2984 rtaf: 0 rtf: 2975 rtmbe: 0 rtmbkf: 0/2342 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 40244 onoff: 11/11:13/14 27,42:26,63 350:505 (HZ=
=3D100) barrier: 1694/1695:0 read-exits: 339 nocb-toggles: 0:0
> [  292.411850][   T91] srcu-torture: Reader Pipe:  237668201 5951 0 0 0 0=
 0 0 0 0 0
> [  292.413893][   T91] srcu-torture: Reader Batch:  237661757 12384 0 0 0=
 0 0 0 0 0 0
> [  292.415907][   T91] srcu-torture: Free-Block Circulation:  2983 2983 2=
982 2981 2980 2979 2978 2977 2976 2975 0
> [  292.418418][   T91] rcu: srcu-torture: Tree SRCU g46804 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(0,-6 C) 1(-3,-1 .) 2(-2,-2 .) 3(2,2 .) 4(0,2 =
=2E) 5(1,2 .) 6(-1,2 .) 7(3,1 .) T(0,0)
> [  303.609807][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  306.212657][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  307.759702][   T91] srcu-torture: rtc: 00000000dfdc71a5 ver: 3115 tfle=
: 0 rta: 3116 rtaf: 0 rtf: 3105 rtmbe: 0 rtmbkf: 0/2446 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 41956 onoff: 11/11:15/15 27,42:26,63 350:571 (HZ=
=3D100) barrier: 1783/1783:0 read-exits: 356 nocb-toggles: 0:0
> [  307.764972][   T91] srcu-torture: Reader Pipe:  247705775 6156 0 0 0 0=
 0 0 0 0 0
> [  307.766590][   T91] srcu-torture: Reader Batch:  247699061 12862 0 0 0=
 0 0 0 0 0 0
> [  307.768217][   T91] srcu-torture: Free-Block Circulation:  3115 3114 3=
113 3112 3111 3110 3108 3107 3106 3105 0
> [  307.770393][   T91] rcu: srcu-torture: Tree SRCU g48550 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-6,0 C) 1(-1,-3 .) 2(-2,-2 .) 3(3,2 C) 4(2,2 =
C) 5(2,-1 .) 6(2,-1 C) 7(1,3 .) T(1,0)
> [  316.079701][   T96] rcu_torture_fwd_prog n_max_cbs: 26583
> [  316.114718][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  316.115472][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [  316.389235][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [  316.462879][   T96] rcu_torture_fwd_prog_cr Duration 22 barrier: 8 pen=
ding 19116 n_launders: 47322 n_launders_sa: 7905 n_max_gps: 100 n_max_cbs: =
35190 cver 3 gps 9
> [  316.465663][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 30 jiffies): 1s/10: 15772:4 2s/10: 32035:5 3s/10: 34705:2
> [  319.999743][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  320.064992][  T482] rcu_torture_rea (482) used greatest stack depth: 1=
2464 bytes left
> [  320.240552][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  323.129734][   T91] srcu-torture: rtc: 00000000e972252d ver: 3301 tfle=
: 0 rta: 3301 rtaf: 0 rtf: 3292 rtmbe: 0 rtmbkf: 0/2569 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 43808 onoff: 11/11:16/16 27,42:26,63 350:604 (HZ=
=3D100) barrier: 1876/1876:0 read-exits: 373 nocb-toggles: 0:0
> [  323.133347][   T91] srcu-torture: Reader Pipe:  259152873 6368 0 0 0 0=
 0 0 0 0 0
> [  323.134426][   T91] srcu-torture: Reader Batch:  259145918 13314 0 0 0=
 0 0 0 0 0 0
> [  323.135522][   T91] srcu-torture: Free-Block Circulation:  3300 3300 3=
299 3298 3297 3296 3295 3294 3293 3292 0
> [  323.136962][   T91] rcu: srcu-torture: Tree SRCU g50864 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-6,-2 .) 1(-1,-3 .) 2(-2,-2 .) 3(2,2 .) 4(2,4=
 .) 5(2,-1 .) 6(2,-1 .) 7(1,3 .) T(0,0)
> [  333.839756][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  336.289715][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  338.505606][   T91] srcu-torture: rtc: 00000000f08e9275 ver: 3474 tfle=
: 0 rta: 3475 rtaf: 0 rtf: 3459 rtmbe: 0 rtmbkf: 0/2686 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 45664 onoff: 13/13:16/16 27,42:26,63 410:604 (HZ=
=3D100) barrier: 1963/1963:0 read-exits: 390 nocb-toggles: 0:0
> [  338.511570][   T91] srcu-torture: Reader Pipe:  270339474 6631 0 0 0 0=
 0 0 0 0 0
> [  338.513350][   T91] srcu-torture: Reader Batch:  270332326 13771 0 0 0=
 0 0 0 0 0 0
> [  338.515167][   T91] srcu-torture: Free-Block Circulation:  3474 3472 3=
468 3467 3466 3465 3464 3462 3461 3459 0
> [  338.517576][   T91] rcu: srcu-torture: Tree SRCU g52844 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(-2,-7 C) 1(-3,-1 .) 2(0,-2 C) 3(2,2 .) 4(2,4 =
C) 5(-1,2 .) 6(-1,3 C) 7(3,2 C) T(0,3)
> [  349.929712][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  350.022977][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  353.839753][   T91] srcu-torture: rtc: 00000000f936b76b ver: 3602 tfle=
: 0 rta: 3602 rtaf: 0 rtf: 3593 rtmbe: 0 rtmbkf: 0/2795 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 47768 onoff: 14/14:16/16 27,42:26,63 448:604 (HZ=
=3D100) barrier: 2047/2047:0 read-exits: 407 nocb-toggles: 0:0
> [  353.844984][   T91] srcu-torture: Reader Pipe:  282476203 6910 0 0 0 0=
 0 0 0 0 0
> [  353.846543][   T91] srcu-torture: Reader Batch:  282468775 14325 0 0 0=
 0 0 0 0 0 0
> [  353.848133][   T91] srcu-torture: Free-Block Circulation:  3601 3601 3=
600 3599 3598 3597 3596 3595 3594 3593 0
> [  353.850290][   T91] rcu: srcu-torture: Tree SRCU g54576 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-8,-2 .) 1(-1,-3 .) 2(-3,0 .) 3(3,2 .) 4(3,2 =
=2E) 5(2,-1 .) 6(2,-1 .) 7(2,3 .) T(0,0)
> [  363.689765][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  366.021574][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  369.199730][   T91] srcu-torture: rtc: 00000000bf65be96 ver: 3741 tfle=
: 0 rta: 3742 rtaf: 0 rtf: 3732 rtmbe: 0 rtmbkf: 0/2903 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 50088 onoff: 14/14:18/18 27,42:26,63 448:687 (HZ=
=3D100) barrier: 2127/2128:0 read-exits: 424 nocb-toggles: 0:0
> [  369.204856][   T91] srcu-torture: Reader Pipe:  295955019 7228 0 0 0 0=
 0 0 0 0 0
> [  369.206412][   T91] srcu-torture: Reader Batch:  295947287 14947 0 0 0=
 0 0 0 0 0 0
> [  369.207998][   T91] srcu-torture: Free-Block Circulation:  3741 3740 3=
739 3738 3737 3736 3735 3734 3733 3732 0
> [  369.210128][   T91] rcu: srcu-torture: Tree SRCU g56294 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-9,-2 C) 1(-1,-3 .) 2(-3,0 .) 3(4,2 C) 4(4,2 =
C) 5(2,-1 .) 6(2,-1 C) 7(2,4 .) T(1,1)
> [  379.707261][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  380.000316][    C3] hrtimer: interrupt took 29595 ns
> [  380.059697][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  381.999759][   T96] rcu_torture_fwd_prog n_max_cbs: 35190
> [  382.005444][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  382.007089][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [  382.110289][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [  382.179006][   T96] rcu_torture_fwd_prog_cr Duration 11 barrier: 6 pen=
ding 43509 n_launders: 29972 n_launders_sa: 343 n_max_gps: 100 n_max_cbs: 4=
4043 cver 0 gps 1516
> [  382.182701][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 18 jiffies): 1s/10: 29630:1318 2s/10: 44385:199
> [  384.559781][   T91] srcu-torture: rtc: 0000000078e7a2de ver: 3876 tfle=
: 0 rta: 3876 rtaf: 0 rtf: 3867 rtmbe: 0 rtmbkf: 0/2990 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 51690 onoff: 15/15:18/18 27,63:26,63 511:687 (HZ=
=3D100) barrier: 2212/2212:0 read-exits: 441 nocb-toggles: 0:0
> [  384.574819][   T91] srcu-torture: Reader Pipe:  305406974 7411 0 0 0 0=
 0 0 0 0 0
> [  384.576628][   T91] srcu-torture: Reader Batch:  305399070 15300 0 0 0=
 0 0 0 0 0 0
> [  384.578474][   T91] srcu-torture: Free-Block Circulation:  3875 3875 3=
874 3873 3872 3871 3870 3869 3868 3867 0
> [  384.580907][   T91] rcu: srcu-torture: Tree SRCU g64124 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(-2,-9 .) 1(-3,-1 .) 2(0,-3 .) 3(2,4 .) 4(2,2 =
=2E) 5(-1,2 .) 6(-2,3 .) 7(4,2 .) T(0,0)
> [  393.679735][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  396.239829][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  399.919700][   T91] srcu-torture: rtc: 00000000370cae2e ver: 4053 tfle=
: 0 rta: 4054 rtaf: 0 rtf: 4043 rtmbe: 0 rtmbkf: 0/3113 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 54072 onoff: 15/15:19/19 27,63:26,63 511:726 (HZ=
=3D100) barrier: 2294/2295:0 read-exits: 458 nocb-toggles: 0:0
> [  399.925122][   T91] srcu-torture: Reader Pipe:  319853513 7708 0 0 0 0=
 0 0 0 0 0
> [  399.926687][   T91] srcu-torture: Reader Batch:  319845331 15876 0 0 0=
 0 0 0 0 0 0
> [  399.928265][   T91] srcu-torture: Free-Block Circulation:  4053 4052 4=
051 4049 4048 4047 4046 4045 4044 4043 0
> [  399.931292][   T91] rcu: srcu-torture: Tree SRCU g66150 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-9,-1 C) 1(-1,-3 .) 2(-3,1 C) 3(4,2 .) 4(3,2 =
=2E) 5(2,-1 .) 6(3,-4 C) 7(2,4 .) T(1,0)
> [  409.849697][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  410.027832][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  415.279757][   T91] srcu-torture: rtc: 000000001c26b0ba ver: 4179 tfle=
: 0 rta: 4179 rtaf: 0 rtf: 4170 rtmbe: 0 rtmbkf: 0/3192 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 55315 onoff: 15/15:21/21 27,63:22,63 511:776 (HZ=
=3D100) barrier: 2388/2388:0 read-exits: 475 nocb-toggles: 0:0
> [  415.288103][   T91] srcu-torture: Reader Pipe:  327916526 7823 0 0 0 0=
 0 0 0 0 0
> [  415.289355][   T91] srcu-torture: Reader Batch:  327908158 16173 0 0 0=
 0 0 0 0 0 0
> [  415.290656][   T91] srcu-torture: Free-Block Circulation:  4178 4178 4=
177 4176 4175 4174 4173 4172 4171 4170 0
> [  415.292331][   T91] rcu: srcu-torture: Tree SRCU g68132 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(-1,-9 .) 1(-3,-1 .) 2(1,-3 .) 3(2,4 .) 4(2,2 =
=2E) 5(-1,2 .) 6(-4,3 .) 7(4,2 .) T(0,0)
> [  419.119852][   T50] kworker/dying (50) used greatest stack depth: 1244=
8 bytes left
> [  424.089745][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  426.706584][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  430.640787][   T91] srcu-torture: rtc: 00000000ab9c2e6a ver: 4368 tfle=
: 0 rta: 4369 rtaf: 0 rtf: 4358 rtmbe: 0 rtmbkf: 0/3304 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 56969 onoff: 16/16:21/21 24,63:22,63 535:776 (HZ=
=3D100) barrier: 2475/2476:0 read-exits: 492 nocb-toggles: 0:0
> [  430.645200][   T91] srcu-torture: Reader Pipe:  339164766 7943 0 0 0 0=
 0 0 0 0 0
> [  430.646537][   T91] srcu-torture: Reader Batch:  339156251 16436 0 0 0=
 0 0 0 0 0 0
> [  430.647893][   T91] srcu-torture: Free-Block Circulation:  4369 4368 4=
367 4366 4365 4364 4363 4362 4360 4359 0
> [  430.649710][   T91] rcu: srcu-torture: Tree SRCU g70557 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(-1,-9 .) 1(-3,-1 .) 2(2,-2 C) 3(2,4 .) 4(2,2 =
=2E) 5(-1,2 .) 6(-5,5 C) 7(4,2 .) T(0,3)
> [  440.319704][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  440.369873][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  445.679697][   T91] srcu-torture: rtc: 00000000b849514e ver: 4457 tfle=
: 0 rta: 4457 rtaf: 0 rtf: 4448 rtmbe: 0 rtmbkf: 0/3369 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 58411 onoff: 17/17:22/22 24,63:22,63 564:802 (HZ=
=3D100) barrier: 2561/2561:0 read-exits: 509 nocb-toggles: 0:0
> [  445.682966][   T91] srcu-torture: Reader Pipe:  347650508 8090 0 0 0 0=
 0 0 0 0 0
> [  445.683944][   T91] srcu-torture: Reader Batch:  347641870 16707 0 0 0=
 0 0 0 0 0 0
> [  445.684945][   T91] srcu-torture: Free-Block Circulation:  4456 4456 4=
455 4454 4453 4452 4451 4450 4449 4448 0
> [  445.686296][   T91] rcu: srcu-torture: Tree SRCU g71884 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(-1,-9 .) 1(-5,-1 .) 2(2,-2 .) 3(2,4 .) 4(2,1 =
=2E) 5(-1,2 .) 6(-3,3 .) 7(4,2 .) T(0,0)
> [  448.559698][   T96] rcu_torture_fwd_prog n_max_cbs: 44043
> [  448.560714][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  448.561946][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [  448.748690][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [  448.805577][   T96] rcu_torture_fwd_prog_cr Duration 14 barrier: 6 pen=
ding 8393 n_launders: 24684 n_launders_sa: 101 n_max_gps: 100 n_max_cbs: 24=
345 cver 3 gps 65
> [  448.808168][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 20 jiffies): 1s/10: 24584:63 2s/10: 24445:5
> [  453.999736][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  456.509704][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  460.719696][   T91] srcu-torture: rtc: 00000000370cae2e ver: 4656 tfle=
: 0 rta: 4657 rtaf: 0 rtf: 4646 rtmbe: 0 rtmbkf: 0/3505 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 60638 onoff: 18/18:22/22 24,63:22,63 594:802 (HZ=
=3D100) barrier: 2649/2650:0 read-exits: 526 nocb-toggles: 0:0
> [  460.724985][   T91] srcu-torture: Reader Pipe:  361371389 8314 0 0 0 0=
 0 0 0 0 0
> [  460.726585][   T91] srcu-torture: Reader Batch:  361362441 17243 0 0 0=
 0 0 0 0 0 0
> [  460.728212][   T91] srcu-torture: Free-Block Circulation:  4656 4655 4=
654 4653 4652 4651 4650 4648 4647 4646 0
> [  460.730386][   T91] rcu: srcu-torture: Tree SRCU g74493 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(-1,-9 C) 1(-5,0 C) 2(2,-2 .) 3(2,4 .) 4(2,0 C=
) 5(-1,2 .) 6(-3,4 .) 7(4,2 .) T(0,1)
> [  470.479731][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  470.849702][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  476.089750][   T91] srcu-torture: rtc: 0000000093cda052 ver: 4755 tfle=
: 0 rta: 4755 rtaf: 0 rtf: 4746 rtmbe: 0 rtmbkf: 0/3584 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 62144 onoff: 19/19:22/22 24,63:22,63 623:802 (HZ=
=3D100) barrier: 2741/2742:0 read-exits: 543 nocb-toggles: 0:0
> [  476.100274][   T91] srcu-torture: Reader Pipe:  369667225 8493 0 0 0 0=
 0 0 0 0 0
> [  476.102131][   T91] srcu-torture: Reader Batch:  369658030 17671 0 0 0=
 0 0 0 0 0 0
> [  476.104034][   T91] srcu-torture: Free-Block Circulation:  4754 4754 4=
753 4752 4751 4750 4749 4748 4747 4746 0
> [  476.106535][   T91] rcu: srcu-torture: Tree SRCU g76064 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-8,-1 C) 1(-2,-5 C) 2(-2,2 .) 3(4,2 C) 4(0,2 =
C) 5(2,-1 .) 6(4,-3 .) 7(2,4 .) T(0,0)
> [  484.479756][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  486.479702][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  491.439725][   T91] srcu-torture: rtc: 0000000078e7a2de ver: 4979 tfle=
: 0 rta: 4979 rtaf: 0 rtf: 4969 rtmbe: 0 rtmbkf: 0/3732 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 64428 onoff: 19/19:24/24 24,63:22,63 623:887 (HZ=
=3D100) barrier: 2827/2827:0 read-exits: 560 nocb-toggles: 0:0
> [  491.444632][   T91] srcu-torture: Reader Pipe:  383886131 8742 0 0 0 0=
 0 0 0 0 0
> [  491.446106][   T91] srcu-torture: Reader Batch:  383876690 18172 0 0 0=
 0 0 0 0 0 0
> [  491.447605][   T91] srcu-torture: Free-Block Circulation:  4978 4978 4=
977 4976 4974 4973 4972 4971 4970 4969 0
> [  491.449579][   T91] rcu: srcu-torture: Tree SRCU g78580 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(-3,-10 .) 1(-5,-2 .) 2(2,-2 .) 3(2,4 .) 4(4,1=
 C) 5(-1,2 .) 6(-3,5 .) 7(4,2 .) T(0,0)
> [  500.079714][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  500.279701][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  506.799724][   T91] srcu-torture: rtc: 000000005066f3f4 ver: 5106 tfle=
: 0 rta: 5107 rtaf: 0 rtf: 5096 rtmbe: 0 rtmbkf: 0/3813 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 65599 onoff: 20/20:24/24 24,63:22,63 651:887 (HZ=
=3D100) barrier: 2918/2919:0 read-exits: 577 nocb-toggles: 0:0
> [  506.805089][   T91] srcu-torture: Reader Pipe:  391044395 8868 0 0 0 0=
 0 0 0 0 0
> [  506.806715][   T91] srcu-torture: Reader Batch:  391034839 18416 0 0 0=
 0 0 0 0 0 0
> [  506.808371][   T91] srcu-torture: Free-Block Circulation:  5106 5105 5=
104 5103 5102 5101 5100 5099 5098 5096 0
> [  506.810572][   T91] rcu: srcu-torture: Tree SRCU g80422 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-9,-3 C) 1(-2,-5 C) 2(-2,2 .) 3(4,2 .) 4(1,5 =
C) 5(2,-1 .) 6(5,-3 C) 7(2,4 .) T(1,1)
> [  509.999722][   T96] rcu_torture_fwd_prog n_max_cbs: 24345
> [  510.008618][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  510.010371][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [  510.169317][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [  510.290464][   T96] rcu_torture_fwd_prog_cr Duration 11 barrier: 13 pe=
nding 12536 n_launders: 20196 n_launders_sa: 4601 n_max_gps: 100 n_max_cbs:=
 18891 cver 2 gps 94
> [  510.294064][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 24 jiffies): 1s/10: 15596:80 2s/10: 23491:16
> [  513.839798][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  516.449700][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  520.239877][   T20] kworker/dying (20) used greatest stack depth: 1184=
0 bytes left
> [  522.159743][   T91] srcu-torture: rtc: 000000005d1416d8 ver: 5304 tfle=
: 0 rta: 5304 rtaf: 0 rtf: 5295 rtmbe: 0 rtmbkf: 0/3963 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 68116 onoff: 21/21:25/25 24,63:22,76 681:963 (HZ=
=3D100) barrier: 3007/3007:0 read-exits: 594 nocb-toggles: 0:0
> [  522.167983][   T91] srcu-torture: Reader Pipe:  405975631 9214 0 0 0 0=
 0 0 0 0 0
> [  522.169626][   T91] srcu-torture: Reader Batch:  405965659 19179 0 0 0=
 0 0 0 0 0 0
> [  522.171293][   T91] srcu-torture: Free-Block Circulation:  5303 5303 5=
302 5301 5300 5299 5298 5297 5296 5295 0
> [  522.173460][   T91] rcu: srcu-torture: Tree SRCU g82808 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-9,-5 .) 1(-4,-5 .) 2(-2,2 .) 3(6,2 .) 4(1,6 =
=2E) 5(2,-1 .) 6(4,-3 .) 7(2,4 .) T(0,0)
> [  530.112972][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  530.350348][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  537.519695][   T91] srcu-torture: rtc: 00000000bf65be96 ver: 5435 tfle=
: 0 rta: 5436 rtaf: 0 rtf: 5425 rtmbe: 0 rtmbkf: 0/4058 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 69671 onoff: 22/22:25/25 24,63:22,76 715:963 (HZ=
=3D100) barrier: 3100/3101:0 read-exits: 611 nocb-toggles: 0:0
> [  537.525814][   T91] srcu-torture: Reader Pipe:  415293302 9398 0 0 0 0=
 0 0 0 0 0
> [  537.527665][   T91] srcu-torture: Reader Batch:  415283128 19565 0 0 0=
 0 0 0 0 0 0
> [  537.529541][   T91] srcu-torture: Free-Block Circulation:  5435 5434 5=
433 5431 5430 5429 5428 5427 5426 5425 0
> [  537.532040][   T91] rcu: srcu-torture: Tree SRCU g84705 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-9,-4 C) 1(-5,-3 C) 2(-2,2 .) 3(7,3 C) 4(2,6 =
=2E) 5(2,-1 .) 6(3,-3 C) 7(2,4 .) T(0,4)
> [  543.999763][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  546.370627][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  552.889752][   T91] srcu-torture: rtc: 00000000de50b9f7 ver: 5658 tfle=
: 0 rta: 5658 rtaf: 0 rtf: 5649 rtmbe: 0 rtmbkf: 0/4222 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 72174 onoff: 22/22:27/27 24,63:22,76 715:1018 (HZ=
=3D100) barrier: 3195/3196:0 read-exits: 628 nocb-toggles: 0:0
> [  552.898495][   T91] srcu-torture: Reader Pipe:  430395446 9743 0 0 0 0=
 0 0 0 0 0
> [  552.899866][   T91] srcu-torture: Reader Batch:  430384825 20356 0 0 0=
 0 0 0 0 0 0
> [  552.901257][   T91] srcu-torture: Free-Block Circulation:  5657 5657 5=
656 5655 5654 5653 5652 5651 5650 5649 0
> [  552.903083][   T91] rcu: srcu-torture: Tree SRCU g87208 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-8,-6 .) 1(-5,-5 .) 2(-2,2 .) 3(6,2 .) 4(2,6 =
=2E) 5(2,-1 .) 6(3,-2 C) 7(2,4 .) T(0,0)
> [  560.009530][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  560.230886][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  568.239706][   T91] srcu-torture: rtc: 0000000024ced5b0 ver: 5817 tfle=
: 0 rta: 5818 rtaf: 0 rtf: 5806 rtmbe: 0 rtmbkf: 0/4315 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 73643 onoff: 22/22:28/28 24,63:22,76 715:1046 (HZ=
=3D100) barrier: 3289/3290:0 read-exits: 645 nocb-toggles: 0:0
> [  568.244146][   T91] srcu-torture: Reader Pipe:  439495256 9872 0 0 0 0=
 0 0 0 0 0
> [  568.245404][   T91] srcu-torture: Reader Batch:  439484499 20623 0 0 0=
 0 0 0 0 0 0
> [  568.246682][   T91] srcu-torture: Free-Block Circulation:  5817 5816 5=
815 5814 5812 5810 5809 5808 5807 5806 0
> [  568.248364][   T91] rcu: srcu-torture: Tree SRCU g89513 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-8,-6 .) 1(-6,-5 .) 2(-2,2 .) 3(6,2 .) 4(3,7 =
C) 5(2,-1 .) 6(3,-2 C) 7(2,4 .) T(0,1)
> [  573.919695][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  576.321959][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  576.559700][   T96] rcu_torture_fwd_prog n_max_cbs: 18891
> [  576.581707][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  576.582915][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [  577.014150][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [  577.081541][   T96] rcu_torture_fwd_prog_cr Duration 21 barrier: 7 pen=
ding 13091 n_launders: 22859 n_launders_sa: 3303 n_max_gps: 100 n_max_cbs: =
30596 cver 2 gps 11
> [  577.084149][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 28 jiffies): 1s/10: 19557:9 2s/10: 8494:2 3s/10: 25404:3
> [  583.599727][   T91] srcu-torture: rtc: 0000000088ac351c ver: 5990 tfle=
: 0 rta: 5990 rtaf: 0 rtf: 5981 rtmbe: 0 rtmbkf: 0/4407 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 75103 onoff: 23/23:28/28 24,63:22,76 743:1046 (HZ=
=3D100) barrier: 3378/3378:0 read-exits: 662 nocb-toggles: 0:0
> [  583.608410][   T91] srcu-torture: Reader Pipe:  448980614 9974 0 0 0 0=
 0 0 0 0 0
> [  583.609788][   T91] srcu-torture: Reader Batch:  448969736 20844 0 0 0=
 0 0 0 0 0 0
> [  583.611164][   T91] srcu-torture: Free-Block Circulation:  5989 5989 5=
988 5987 5986 5985 5984 5983 5982 5981 0
> [  583.612973][   T91] rcu: srcu-torture: Tree SRCU g91748 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(-6,-8 .) 1(-5,-6 .) 2(2,-2 .) 3(2,6 .) 4(6,3 =
=2E) 5(-1,2 .) 6(-2,3 .) 7(4,2 .) T(0,0)
> [  590.319711][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  590.529685][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  598.959728][   T91] srcu-torture: rtc: 00000000045822a1 ver: 6135 tfle=
: 0 rta: 6136 rtaf: 0 rtf: 6126 rtmbe: 0 rtmbkf: 0/4510 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 76996 onoff: 25/25:28/28 24,63:22,76 806:1046 (HZ=
=3D100) barrier: 3464/3465:0 read-exits: 679 nocb-toggles: 0:0
> [  598.990082][   T91] srcu-torture: Reader Pipe:  459757698 10179 0 0 0 =
0 0 0 0 0 0
> [  598.991891][   T91] srcu-torture: Reader Batch:  459746573 21296 0 0 0=
 0 0 0 0 0 0
> [  598.993714][   T91] srcu-torture: Free-Block Circulation:  6135 6134 6=
133 6132 6131 6130 6129 6128 6127 6126 0
> [  598.996106][   T91] rcu: srcu-torture: Tree SRCU g93598 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-8,-6 C) 1(-6,-5 .) 2(-2,2 .) 3(5,3 C) 4(4,7 =
C) 5(2,-1 .) 6(3,-2 .) 7(3,4 C) T(1,2)
> [  604.169738][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  606.373073][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  614.329727][   T91] srcu-torture: rtc: 0000000093cda052 ver: 6253 tfle=
: 0 rta: 6253 rtaf: 0 rtf: 6244 rtmbe: 0 rtmbkf: 0/4599 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 78878 onoff: 25/25:29/29 24,63:22,76 806:1083 (HZ=
=3D100) barrier: 3550/3550:0 read-exits: 696 nocb-toggles: 0:0
> [  614.339332][   T91] srcu-torture: Reader Pipe:  470393628 10384 0 0 0 =
0 0 0 0 0 0
> [  614.340961][   T91] srcu-torture: Reader Batch:  470382261 21743 0 0 0=
 0 0 0 0 0 0
> [  614.342572][   T91] srcu-torture: Free-Block Circulation:  6252 6252 6=
251 6250 6249 6248 6247 6246 6245 6244 0
> [  614.344698][   T91] rcu: srcu-torture: Tree SRCU g95332 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D1): 0(-6,-7 .) 1(-5,-6 .) 2(2,-2 .) 3(2,4 .) 4(7,4 =
=2E) 5(-1,2 .) 6(-2,3 .) 7(3,2 .) T(0,0)
> [  620.159706][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  620.349702][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  627.759828][   T12] kworker/dying (12) used greatest stack depth: 1139=
2 bytes left
> [  629.679699][   T91] srcu-torture: rtc: 00000000e56d2740 ver: 6442 tfle=
: 0 rta: 6443 rtaf: 0 rtf: 6433 rtmbe: 0 rtmbkf: 0/4742 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 81181 onoff: 26/26:30/30 24,63:22,76 837:1114 (HZ=
=3D100) barrier: 3646/3646:0 read-exits: 713 nocb-toggles: 0:0
> [  629.733662][   T91] srcu-torture: Reader Pipe:  484909952 10660 0 0 0 =
0 0 0 0 0 0
> [  629.735375][   T91] srcu-torture: Reader Batch:  484898212 22393 0 0 0=
 0 0 0 0 0 0
> [  629.737014][   T91] srcu-torture: Free-Block Circulation:  6443 6442 6=
441 6440 6439 6438 6437 6436 6435 6434 0
> [  629.739158][   T91] rcu: srcu-torture: Tree SRCU g97777 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-6,-5 .) 2(-2,3 C) 3(4,2 C) 4(4,6 =
C) 5(2,-1 .) 6(3,0 .) 7(2,3 .) T(0,2)
> [  633.929758][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  636.309943][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  638.639705][   T96] rcu_torture_fwd_prog n_max_cbs: 30596
> [  638.665280][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  638.666697][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [  639.046753][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [  639.138086][   T96] rcu_torture_fwd_prog_cr Duration 37 barrier: 9 pen=
ding 35487 n_launders: 90823 n_launders_sa: 90823 n_max_gps: 100 n_max_cbs:=
 45362 cver 3 gps 16
> [  639.141228][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 47 jiffies): 1s/10: 0:-1996 2s/10: 35879:1998 3s/10: 36664=
:10 4s/10: 56858:5 5s/10: 6784:3
> [  645.039725][   T91] srcu-torture: rtc: 000000005066f3f4 ver: 6599 tfle=
: 0 rta: 6599 rtaf: 0 rtf: 6590 rtmbe: 0 rtmbkf: 0/4845 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 82711 onoff: 26/26:31/31 24,63:22,76 837:1150 (HZ=
=3D100) barrier: 3739/3740:0 read-exits: 730 nocb-toggles: 0:0
> [  645.048280][   T91] srcu-torture: Reader Pipe:  494222656 10849 0 0 0 =
0 0 0 0 0 0
> [  645.049623][   T91] srcu-torture: Reader Batch:  494210697 22802 0 0 0=
 0 0 0 0 0 0
> [  645.050999][   T91] srcu-torture: Free-Block Circulation:  6598 6598 6=
597 6596 6595 6594 6593 6592 6591 6590 0
> [  645.052793][   T91] rcu: srcu-torture: Tree SRCU g99888 state 8 (SRCU_=
SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-6,-5 .) 2(-1,2 C) 3(5,2 .) 4(2,5 =
C) 5(2,-1 .) 6(3,0 .) 7(2,3 C) T(0,0)
> [  649.919701][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  650.089827][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  660.399713][   T91] srcu-torture: rtc: 000000002a5f8b4b ver: 6815 tfle=
: 0 rta: 6816 rtaf: 0 rtf: 6804 rtmbe: 0 rtmbkf: 0/4990 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 84885 onoff: 27/27:31/31 24,63:22,76 869:1150 (HZ=
=3D100) barrier: 3830/3831:0 read-exits: 747 nocb-toggles: 0:0
> [  660.403316][   T91] srcu-torture: Reader Pipe:  508111667 11085 0 0 0 =
0 0 0 0 0 0
> [  660.404339][   T91] srcu-torture: Reader Batch:  508099442 23302 0 0 0=
 0 0 0 0 0 0
> [  660.405337][   T91] srcu-torture: Free-Block Circulation:  6815 6814 6=
812 6810 6809 6808 6807 6806 6805 6804 0
> [  660.406648][   T91] rcu: srcu-torture: Tree SRCU g102298 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-6,-7 .) 1(-5,-6 C) 2(5,-1 C) 3(2,5 .) 4(5,1=
 C) 5(-1,2 .) 6(0,3 .) 7(2,5 C) T(2,2)
> [  663.679724][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  666.404316][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  675.769726][   T91] srcu-torture: rtc: 00000000a07ac335 ver: 6945 tfle=
: 0 rta: 6945 rtaf: 0 rtf: 6936 rtmbe: 0 rtmbkf: 0/5093 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 86515 onoff: 28/28:32/32 24,63:22,76 913:1181 (HZ=
=3D100) barrier: 3921/3921:0 read-exits: 764 nocb-toggles: 0:0
> [  675.773900][   T91] srcu-torture: Reader Pipe:  518071374 11292 0 0 0 =
0 0 0 0 0 0
> [  675.775177][   T91] srcu-torture: Reader Batch:  518058916 23742 0 0 0=
 0 0 0 0 0 0
> [  675.776479][   T91] srcu-torture: Free-Block Circulation:  6944 6944 6=
943 6942 6941 6940 6939 6938 6937 6936 0
> [  675.778148][   T91] rcu: srcu-torture: Tree SRCU g104140 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-6,-7 .) 1(-3,-4 .) 2(5,-1 .) 3(2,5 .) 4(1,-=
2 .) 5(-1,2 .) 6(0,3 .) 7(2,4 .) T(0,0)
> [  679.999700][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  680.032039][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  691.129752][   T91] srcu-torture: rtc: 000000007bff1239 ver: 7136 tfle=
: 0 rta: 7137 rtaf: 0 rtf: 7126 rtmbe: 0 rtmbkf: 0/5222 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 88854 onoff: 28/28:33/33 24,63:22,76 913:1208 (HZ=
=3D100) barrier: 4005/4005:0 read-exits: 781 nocb-toggles: 0:0
> [  691.160624][   T91] srcu-torture: Reader Pipe:  532632349 11533 0 0 0 =
0 0 0 0 0 0
> [  691.161970][   T91] srcu-torture: Reader Batch:  532619597 24276 0 0 0=
 0 0 0 0 0 0
> [  691.163325][   T91] srcu-torture: Free-Block Circulation:  7139 7138 7=
136 7134 7133 7132 7131 7130 7129 7128 0
> [  691.165111][   T91] rcu: srcu-torture: Tree SRCU g106325 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-6,-7 .) 1(-3,-4 .) 2(5,-1 C) 3(2,5 .) 4(0,-=
1 C) 5(-1,2 .) 6(0,3 .) 7(3,5 .) T(0,2)
> [  693.599736][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  696.419720][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  704.559708][   T96] rcu_torture_fwd_prog n_max_cbs: 45362
> [  704.565128][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  704.566598][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [  704.729880][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [  704.792519][   T96] rcu_torture_fwd_prog_cr Duration 17 barrier: 6 pen=
ding 25296 n_launders: 44734 n_launders_sa: 101 n_max_gps: 100 n_max_cbs: 3=
9431 cver 0 gps 2140
> [  704.795182][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 23 jiffies): 1s/10: 33108:1869 2s/10: 41796:273 3s/10: 926=
1:0
> [  706.239701][   T91] srcu-torture: rtc: 00000000611914c5 ver: 7254 tfle=
: 0 rta: 7255 rtaf: 0 rtf: 7245 rtmbe: 0 rtmbkf: 0/5298 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 90220 onoff: 29/29:34/34 24,63:22,76 940:1237 (HZ=
=3D100) barrier: 4097/4098:0 read-exits: 798 nocb-toggles: 0:0
> [  706.244083][   T91] srcu-torture: Reader Pipe:  541507166 11700 0 0 0 =
0 0 0 0 0 0
> [  706.245423][   T91] srcu-torture: Reader Batch:  541494232 24625 0 0 0=
 0 0 0 0 0 0
> [  706.246775][   T91] srcu-torture: Free-Block Circulation:  7254 7253 7=
252 7251 7250 7249 7248 7247 7246 7245 0
> [  706.248556][   T91] rcu: srcu-torture: Tree SRCU g116630 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-4,-4 C) 2(-1,5 .) 3(5,2 .) 4(-1,=
2 C) 5(2,-1 .) 6(3,0 .) 7(4,5 C) T(1,3)
> [  710.075466][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  710.389710][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  721.849771][   T91] srcu-torture: rtc: 000000009eef0b87 ver: 7480 tfle=
: 0 rta: 7480 rtaf: 0 rtf: 7471 rtmbe: 0 rtmbkf: 0/5449 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 92500 onoff: 30/30:34/34 24,63:22,76 969:1237 (HZ=
=3D100) barrier: 4187/4188:0 read-exits: 815 nocb-toggles: 0:0
> [  721.856556][   T91] srcu-torture: Reader Pipe:  555959410 11974 0 0 0 =
0 0 0 0 0 0
> [  721.858639][   T91] srcu-torture: Reader Batch:  555946220 25154 0 0 0=
 0 0 0 0 0 0
> [  721.876536][   T91] srcu-torture: Free-Block Circulation:  7479 7479 7=
478 7477 7476 7475 7474 7473 7472 7471 0
> [  721.878662][   T91] rcu: srcu-torture: Tree SRCU g119152 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-4,-4 C) 2(-1,5 .) 3(6,2 .) 4(-1,=
0 .) 5(2,-1 .) 6(3,0 .) 7(2,4 .) T(0,0)
> [  723.999798][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  726.329696][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  737.209692][   T91] srcu-torture: rtc: 00000000f61f4810 ver: 7602 tfle=
: 0 rta: 7603 rtaf: 0 rtf: 7592 rtmbe: 0 rtmbkf: 0/5526 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 93651 onoff: 30/30:35/35 24,63:22,84 969:1321 (HZ=
=3D100) barrier: 4278/4279:0 read-exits: 832 nocb-toggles: 0:0
> [  737.214115][   T91] srcu-torture: Reader Pipe:  563188144 12067 0 0 0 =
0 0 0 0 0 0
> [  737.215460][   T91] srcu-torture: Reader Batch:  563174831 25372 0 0 0=
 0 0 0 0 0 0
> [  737.216836][   T91] srcu-torture: Free-Block Circulation:  7602 7601 7=
600 7599 7598 7597 7595 7594 7593 7592 0
> [  737.218619][   T91] rcu: srcu-torture: Tree SRCU g120969 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-5,-4 C) 2(-1,5 .) 3(6,2 .) 4(-1,=
1 C) 5(2,-1 .) 6(3,0 .) 7(3,4 .) T(0,1)
> [  740.089694][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  740.350020][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  752.569749][   T91] srcu-torture: rtc: 000000002e648938 ver: 7810 tfle=
: 0 rta: 7810 rtaf: 0 rtf: 7801 rtmbe: 0 rtmbkf: 0/5651 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 95682 onoff: 31/31:36/36 23,63:22,84 992:1359 (HZ=
=3D100) barrier: 4362/4363:0 read-exits: 849 nocb-toggles: 0:0
> [  752.573114][   T91] srcu-torture: Reader Pipe:  575467749 12288 0 0 0 =
0 0 0 0 0 0
> [  752.574105][   T91] srcu-torture: Reader Batch:  575454188 25844 0 0 0=
 0 0 0 0 0 0
> [  752.575110][   T91] srcu-torture: Free-Block Circulation:  7809 7809 7=
808 7807 7806 7805 7804 7803 7802 7801 0
> [  752.576455][   T91] rcu: srcu-torture: Tree SRCU g123384 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-5,-4 C) 2(-1,5 .) 3(5,3 .) 4(-1,=
-1 .) 5(2,-1 .) 6(3,0 .) 7(4,4 .) T(0,0)
> [  754.239714][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  756.409762][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  767.919703][   T91] srcu-torture: rtc: 000000008cb13309 ver: 7949 tfle=
: 0 rta: 7950 rtaf: 0 rtf: 7936 rtmbe: 0 rtmbkf: 0/5729 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 96788 onoff: 31/31:37/37 23,63:22,84 992:1402 (HZ=
=3D100) barrier: 4453/4453:0 read-exits: 866 nocb-toggles: 0:0
> [  767.923866][   T91] srcu-torture: Reader Pipe:  582866266 12355 0 0 0 =
0 0 0 0 0 0
> [  767.925123][   T91] srcu-torture: Reader Batch:  582852620 25996 0 0 0=
 0 0 0 0 0 0
> [  767.926394][   T91] srcu-torture: Free-Block Circulation:  7949 7948 7=
947 7946 7944 7943 7942 7940 7937 7936 0
> [  767.928087][   T91] rcu: srcu-torture: Tree SRCU g125441 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-4,-4 .) 2(-1,5 .) 3(5,3 .) 4(-1,=
-1 C) 5(2,-1 .) 6(3,0 .) 7(3,5 C) T(0,1)
> [  769.989690][   T96] rcu_torture_fwd_prog n_max_cbs: 39431
> [  769.990255][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  769.990930][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [  770.279688][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  770.443144][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [  770.444330][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  770.532557][   T96] rcu_torture_fwd_prog_cr Duration 41 barrier: 9 pen=
ding 1633 n_launders: 80375 n_launders_sa: 50100 n_max_gps: 100 n_max_cbs: =
50000 cver 2 gps 11
> [  770.534002][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 50 jiffies): 1s/10: 30276:6 2s/10: 0:-2390 3s/10: 14530:23=
92 4s/10: 64732:3 5s/10: 20837:3
> [  783.279724][   T91] srcu-torture: rtc: 00000000c0f17644 ver: 8160 tfle=
: 0 rta: 8160 rtaf: 0 rtf: 8151 rtmbe: 0 rtmbkf: 0/5819 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 97866 onoff: 31/31:38/38 23,63:19,84 992:1421 (HZ=
=3D100) barrier: 4553/4553:0 read-exits: 883 nocb-toggles: 0:0
> [  783.282195][   T91] srcu-torture: Reader Pipe:  590194862 12374 0 0 0 =
0 0 0 0 0 0
> [  783.282947][   T91] srcu-torture: Reader Batch:  590181182 26056 0 0 0=
 0 0 0 0 0 0
> [  783.283713][   T91] srcu-torture: Free-Block Circulation:  8159 8159 8=
158 8157 8156 8155 8154 8153 8152 8151 0
> [  783.284713][   T91] rcu: srcu-torture: Tree SRCU g128456 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-4,-4 .) 2(-1,5 .) 3(5,3 .) 4(-1,=
-1 .) 5(2,-1 .) 6(3,0 .) 7(3,4 .) T(0,0)
> [  784.319709][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  786.171057][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  798.639705][   T91] srcu-torture: rtc: 00000000ad27e618 ver: 8358 tfle=
: 0 rta: 8359 rtaf: 0 rtf: 8348 rtmbe: 0 rtmbkf: 0/5910 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 98975 onoff: 32/32:38/38 18,63:19,84 1010:1421 (H=
Z=3D100) barrier: 4649/4649:0 read-exits: 900 nocb-toggles: 0:0
> [  798.643904][   T91] srcu-torture: Reader Pipe:  597528560 12424 0 0 0 =
0 0 0 0 0 0
> [  798.645162][   T91] srcu-torture: Reader Batch:  597514844 26142 0 0 0=
 0 0 0 0 0 0
> [  798.646441][   T91] srcu-torture: Free-Block Circulation:  8358 8357 8=
356 8355 8354 8353 8351 8350 8349 8348 0
> [  798.648133][   T91] rcu: srcu-torture: Tree SRCU g131129 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-4,-4 .) 2(-1,5 .) 3(5,3 .) 4(-3,=
-1 C) 5(2,-1 .) 6(3,0 .) 7(5,5 C) T(0,1)
> [  799.759689][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  799.782421][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  813.359709][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  813.999702][   T91] srcu-torture: rtc: 00000000f21a4a23 ver: 8528 tfle=
: 0 rta: 8528 rtaf: 0 rtf: 8519 rtmbe: 0 rtmbkf: 0/6013 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 100498 onoff: 33/33:39/39 18,63:19,84 1036:1445 (=
HZ=3D100) barrier: 4736/4736:0 read-exits: 918 nocb-toggles: 0:0
> [  814.008136][   T91] srcu-torture: Reader Pipe:  607311341 12585 0 0 0 =
0 0 0 0 0 0
> [  814.009410][   T91] srcu-torture: Reader Batch:  607297504 26425 0 0 0=
 0 0 0 0 0 0
> [  814.010786][   T91] srcu-torture: Free-Block Circulation:  8527 8527 8=
526 8525 8524 8523 8522 8521 8520 8519 0
> [  814.012472][   T91] rcu: srcu-torture: Tree SRCU g133096 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-4,-4 .) 2(-1,5 .) 3(5,3 .) 4(-2,=
-1 .) 5(2,-1 .) 6(3,0 .) 7(4,4 .) T(0,0)
> [  816.210543][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  829.359735][   T91] srcu-torture: rtc: 00000000e972252d ver: 8688 tfle=
: 0 rta: 8689 rtaf: 0 rtf: 8677 rtmbe: 0 rtmbkf: 0/6109 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 101949 onoff: 34/34:39/39 18,63:19,84 1063:1445 (=
HZ=3D100) barrier: 4825/4826:0 read-exits: 934 nocb-toggles: 0:0
> [  829.391576][   T91] srcu-torture: Reader Pipe:  616005844 12734 0 0 0 =
0 0 0 0 0 0
> [  829.392911][   T91] srcu-torture: Reader Batch:  615991881 26700 0 0 0=
 0 0 0 0 0 0
> [  829.394260][   T91] srcu-torture: Free-Block Circulation:  8689 8688 8=
687 8686 8685 8684 8683 8682 8681 8679 0
> [  829.396038][   T91] rcu: srcu-torture: Tree SRCU g135174 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-4,-4 .) 2(-1,5 .) 3(5,3 .) 4(-3,=
-3 C) 5(2,-1 .) 6(5,1 C) 7(3,7 C) T(0,2)
> [  829.759700][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  829.792080][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  837.679702][   T96] rcu_torture_fwd_prog n_max_cbs: 50000
> [  837.680916][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  837.683052][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [  838.128265][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [  838.190046][   T96] rcu_torture_fwd_prog_cr Duration 26 barrier: 7 pen=
ding 17193 n_launders: 55980 n_launders_sa: 101 n_max_gps: 100 n_max_cbs: 4=
6412 cver 6 gps 121
> [  838.193173][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 33 jiffies): 1s/10: 9528:112 2s/10: 46333:6 3s/10: 46531:5
> [  843.369756][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  844.399722][   T91] srcu-torture: rtc: 000000008cb13309 ver: 8841 tfle=
: 0 rta: 8841 rtaf: 0 rtf: 8832 rtmbe: 0 rtmbkf: 0/6207 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 103606 onoff: 35/35:40/40 18,63:19,84 1087:1474 (=
HZ=3D100) barrier: 4915/4915:0 read-exits: 952 nocb-toggles: 0:0
> [  844.408384][   T91] srcu-torture: Reader Pipe:  626070255 12891 0 0 0 =
0 0 0 0 0 0
> [  844.409787][   T91] srcu-torture: Reader Batch:  626056023 27128 0 0 0=
 0 0 0 0 0 0
> [  844.411122][   T91] srcu-torture: Free-Block Circulation:  8840 8840 8=
839 8838 8837 8836 8835 8834 8833 8832 0
> [  844.412894][   T91] rcu: srcu-torture: Tree SRCU g137584 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-4,-4 .) 2(-1,5 .) 3(5,3 .) 4(-3,=
-3 .) 5(2,-1 .) 6(5,0 .) 7(3,6 .) T(0,0)
> [  846.329777][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  859.439734][   T91] srcu-torture: rtc: 00000000c6822bdf ver: 9033 tfle=
: 0 rta: 9034 rtaf: 0 rtf: 9022 rtmbe: 0 rtmbkf: 0/6318 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 105523 onoff: 36/36:40/40 18,63:19,84 1112:1474 (=
HZ=3D100) barrier: 5004/5004:0 read-exits: 968 nocb-toggles: 0:0
> [  859.472553][   T91] srcu-torture: Reader Pipe:  637492478 13116 0 0 0 =
0 0 0 0 0 0
> [  859.474578][   T91] srcu-torture: Reader Batch:  637478013 27590 0 0 0=
 0 0 0 0 0 0
> [  859.476176][   T91] srcu-torture: Free-Block Circulation:  9033 9032 9=
031 9030 9028 9026 9025 9024 9023 9022 0
> [  859.478726][   T91] rcu: srcu-torture: Tree SRCU g139945 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-4,-4 .) 2(-3,4 C) 3(5,4 C) 4(-3,=
-3 .) 5(2,-1 .) 6(6,1 .) 7(4,8 C) T(0,3)
> [  859.928298][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  859.932382][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  873.529720][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  874.799796][   T91] srcu-torture: rtc: 00000000e3e16f92 ver: 9182 tfle=
: 0 rta: 9182 rtaf: 0 rtf: 9173 rtmbe: 0 rtmbkf: 0/6412 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 107072 onoff: 36/36:41/41 18,63:19,84 1112:1498 (=
HZ=3D100) barrier: 5094/5095:0 read-exits: 986 nocb-toggles: 0:0
> [  874.809988][   T91] srcu-torture: Reader Pipe:  647398815 13266 0 0 0 =
0 0 0 0 0 0
> [  874.811399][   T91] srcu-torture: Reader Batch:  647384179 27910 0 0 0=
 0 0 0 0 0 0
> [  874.812821][   T91] srcu-torture: Free-Block Circulation:  9181 9181 9=
180 9179 9178 9177 9176 9175 9174 9173 0
> [  874.814688][   T91] rcu: srcu-torture: Tree SRCU g141952 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-4,-4 .) 2(-4,4 C) 3(6,3 C) 4(-3,=
-3 .) 5(2,-1 .) 6(6,0 C) 7(4,7 .) T(0,0)
> [  876.319818][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  889.929709][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  890.111693][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  890.159739][   T91] srcu-torture: rtc: 00000000955957ff ver: 9399 tfle=
: 0 rta: 9400 rtaf: 0 rtf: 9389 rtmbe: 0 rtmbkf: 0/6553 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 109374 onoff: 38/38:41/41 18,63:19,84 1202:1498 (=
HZ=3D100) barrier: 5185/5185:0 read-exits: 1019 nocb-toggles: 0:0
> [  890.165710][   T91] srcu-torture: Reader Pipe:  661202369 13568 0 0 0 =
0 0 0 0 0 0
> [  890.167534][   T91] srcu-torture: Reader Batch:  661187411 28532 0 0 0=
 0 0 0 0 0 0
> [  890.169384][   T91] srcu-torture: Free-Block Circulation:  9399 9398 9=
397 9396 9395 9394 9393 9392 9391 9389 0
> [  890.171814][   T91] rcu: srcu-torture: Tree SRCU g144341 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-6,-7 .) 1(-4,-4 C) 2(4,-2 C) 3(3,7 C) 4(-3,=
-3 .) 5(-1,2 .) 6(0,6 C) 7(7,5 C) T(0,4)
> [  903.769769][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  904.239719][   T96] rcu_torture_fwd_prog n_max_cbs: 46412
> [  904.240668][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  904.241790][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [  904.383445][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [  904.438359][   T96] rcu_torture_fwd_prog_cr Duration 13 barrier: 5 pen=
ding 37970 n_launders: 62156 n_launders_sa: 35534 n_max_gps: 100 n_max_cbs:=
 43833 cver 0 gps 1825
> [  904.441625][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 19 jiffies): 1s/10: 43294:70 2s/10: 62695:1757
> [  905.519789][   T91] srcu-torture: rtc: 0000000087207d6e ver: 9539 tfle=
: 0 rta: 9539 rtaf: 0 rtf: 9530 rtmbe: 0 rtmbkf: 0/6664 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 111114 onoff: 38/38:42/42 18,63:19,84 1202:1533 (=
HZ=3D100) barrier: 5279/5280:0 read-exits: 1020 nocb-toggles: 0:0
> [  905.530961][   T91] srcu-torture: Reader Pipe:  671448294 13810 0 0 0 =
0 0 0 0 0 0
> [  905.532582][   T91] srcu-torture: Reader Batch:  671433022 29088 0 0 0=
 0 0 0 0 0 0
> [  905.534214][   T91] srcu-torture: Free-Block Circulation:  9538 9538 9=
537 9536 9535 9534 9533 9532 9531 9530 0
> [  905.536547][   T91] rcu: srcu-torture: Tree SRCU g153568 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 .) 1(-7,-4 C) 2(-1,4 C) 3(6,3 .) 4(-3,=
-3 .) 5(2,-1 .) 6(6,0 C) 7(4,7 C) T(0,0)
> [  906.279835][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  919.919727][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  920.119689][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  920.549692][   T91] srcu-torture: rtc: 00000000d32f4ec2 ver: 9728 tfle=
: 0 rta: 9729 rtaf: 0 rtf: 9718 rtmbe: 0 rtmbkf: 0/6783 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 113137 onoff: 38/38:44/44 18,63:19,84 1202:1581 (=
HZ=3D100) barrier: 5363/5363:0 read-exits: 1053 nocb-toggles: 0:0
> [  920.554010][   T91] srcu-torture: Reader Pipe:  683597527 13990 0 0 0 =
0 0 0 0 0 0
> [  920.555311][   T91] srcu-torture: Reader Batch:  683582031 29492 0 0 0=
 0 0 0 0 0 0
> [  920.556625][   T91] srcu-torture: Free-Block Circulation:  9728 9727 9=
726 9725 9724 9723 9722 9720 9719 9718 0
> [  920.558350][   T91] rcu: srcu-torture: Tree SRCU g155805 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-6,-7 .) 1(-4,-7 C) 2(4,-1 .) 3(3,6 .) 4(-3,=
-3 .) 5(-1,2 .) 6(0,6 .) 7(7,4 .) T(0,0)
> [  933.679720][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  935.599719][   T91] srcu-torture: rtc: 000000007bff1239 ver: 9840 tfle=
: 0 rta: 9840 rtaf: 0 rtf: 9831 rtmbe: 0 rtmbkf: 0/6844 rtbe: 0 rtbke: 0 rt=
bre: 0 rtbf: 0 rtb: 0 nt: 114116 onoff: 39/39:44/44 18,63:19,84 1227:1581 (=
HZ=3D100) barrier: 5452/5453:0 read-exits: 1054 nocb-toggles: 0:0
> [  935.608496][   T91] srcu-torture: Reader Pipe:  690396370 14057 0 0 0 =
0 0 0 0 0 0
> [  935.609868][   T91] srcu-torture: Reader Batch:  690380787 29644 0 0 0=
 0 0 0 0 0 0
> [  935.611225][   T91] srcu-torture: Free-Block Circulation:  9839 9839 9=
838 9837 9836 9835 9834 9833 9832 9831 0
> [  935.612998][   T91] rcu: srcu-torture: Tree SRCU g157588 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-6,-7 .) 1(-6,-7 C) 2(4,-1 .) 3(3,6 .) 4(-3,=
-3 .) 5(-1,2 .) 6(2,6 .) 7(7,4 C) T(0,0)
> [  936.280189][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  949.919715][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  950.121904][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  950.959804][   T91] srcu-torture: rtc: 000000008594c5c1 ver: 10076 tfl=
e: 0 rta: 10077 rtaf: 0 rtf: 10067 rtmbe: 0 rtmbkf: 0/6982 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 116427 onoff: 40/40:44/44 18,63:19,84 1253:158=
1 (HZ=3D100) barrier: 5542/5543:0 read-exits: 1087 nocb-toggles: 0:0
> [  950.965125][   T91] srcu-torture: Reader Pipe:  705139363 14336 0 0 0 =
0 0 0 0 0 0
> [  950.966734][   T91] srcu-torture: Reader Batch:  705123534 30169 0 0 0=
 0 0 0 0 0 0
> [  950.968352][   T91] srcu-torture: Free-Block Circulation:  10076 10075=
 10074 10073 10072 10071 10070 10069 10068 10067 0
> [  950.970679][   T91] rcu: srcu-torture: Tree SRCU g160213 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-6,-7 .) 1(-6,-9 C) 2(4,-1 .) 3(3,6 .) 4(-3,=
0 C) 5(-1,2 .) 6(2,9 C) 7(7,2 .) T(0,2)
> [  963.769730][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  966.319701][   T91] srcu-torture: rtc: 000000005066f3f4 ver: 10206 tfl=
e: 0 rta: 10207 rtaf: 0 rtf: 10195 rtmbe: 0 rtmbkf: 0/7064 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 117542 onoff: 41/41:45/45 18,63:19,84 1279:160=
3 (HZ=3D100) barrier: 5634/5634:0 read-exits: 1103 nocb-toggles: 0:0
> [  966.325421][   T91] srcu-torture: Reader Pipe:  711709581 14448 0 0 0 =
0 0 0 0 0 0
> [  966.327021][   T91] srcu-torture: Reader Batch:  711693637 30394 0 0 0=
 0 0 0 0 0 0
> [  966.328625][   T91] srcu-torture: Free-Block Circulation:  10206 10205=
 10204 10203 10202 10200 10198 10197 10196 10195 0
> [  966.330994][   T91] rcu: srcu-torture: Tree SRCU g161894 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-7,-6 C) 1(-9,-6 C) 2(-1,4 .) 3(6,3 .) 4(-1,=
-3 .) 5(2,-1 .) 6(9,3 C) 7(2,9 C) T(1,3)
> [  966.339694][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  970.799708][   T96] rcu_torture_fwd_prog n_max_cbs: 43833
> [  970.827700][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  970.829084][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [  970.993543][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [  971.110505][   T96] rcu_torture_fwd_prog_cr Duration 14 barrier: 12 pe=
nding 7811 n_launders: 29930 n_launders_sa: 7811 n_max_gps: 100 n_max_cbs: =
19154 cver 6 gps 35
> [  971.113464][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 26 jiffies): 1s/10: 22120:33 2s/10: 19153:2 3s/10: 7811:2
> [  979.929702][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  979.993378][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  981.679729][   T91] srcu-torture: rtc: 00000000f936b76b ver: 10392 tfl=
e: 0 rta: 10392 rtaf: 0 rtf: 10383 rtmbe: 0 rtmbkf: 0/7186 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 119761 onoff: 41/41:46/46 18,63:19,84 1279:163=
5 (HZ=3D100) barrier: 5716/5716:0 read-exits: 1121 nocb-toggles: 0:0
> [  981.685517][   T91] srcu-torture: Reader Pipe:  724960951 14698 0 0 0 =
0 0 0 0 0 0
> [  981.686976][   T91] srcu-torture: Reader Batch:  724944747 30903 0 0 0=
 0 0 0 0 0 0
> [  981.688444][   T91] srcu-torture: Free-Block Circulation:  10391 10391=
 10390 10389 10388 10387 10386 10385 10384 10383 0
> [  981.690555][   T91] rcu: srcu-torture: Tree SRCU g164064 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-6,-6 .) 1(-9,-6 .) 2(-1,4 .) 3(6,3 .) 4(-1,=
-3 .) 5(2,-1 .) 6(9,2 .) 7(0,7 .) T(0,0)
> [  993.519747][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [  996.265367][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [  997.039760][   T91] srcu-torture: rtc: 000000002a5f8b4b ver: 10536 tfl=
e: 0 rta: 10537 rtaf: 0 rtf: 10526 rtmbe: 0 rtmbkf: 0/7285 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 121237 onoff: 42/42:47/47 18,63:19,84 1306:166=
4 (HZ=3D100) barrier: 5814/5815:0 read-exits: 1138 nocb-toggles: 0:0
> [  997.044219][   T91] srcu-torture: Reader Pipe:  734112050 14866 0 0 0 =
0 0 0 0 0 0
> [  997.045556][   T91] srcu-torture: Reader Batch:  734095654 31263 0 0 0=
 0 0 0 0 0 0
> [  997.046910][   T91] srcu-torture: Free-Block Circulation:  10536 10534=
 10533 10532 10531 10530 10529 10528 10527 10526 0
> [  997.049363][   T91] rcu: srcu-torture: Tree SRCU g166185 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-5,-7 .) 1(-10,-5 C) 2(-2,5 C) 3(6,3 .) 4(-1=
,-3 .) 5(2,-1 .) 6(10,4 C) 7(0,7 .) T(0,3)
> [ 1009.839697][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1009.871978][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1012.399775][   T91] srcu-torture: rtc: 0000000062a4cc72 ver: 10728 tfl=
e: 0 rta: 10728 rtaf: 0 rtf: 10719 rtmbe: 0 rtmbkf: 0/7415 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 123472 onoff: 43/43:47/47 18,63:19,84 1359:166=
4 (HZ=3D100) barrier: 5901/5901:0 read-exits: 1155 nocb-toggles: 0:0
> [ 1012.411016][   T91] srcu-torture: Reader Pipe:  747524099 15134 0 0 0 =
0 0 0 0 0 0
> [ 1012.412631][   T91] srcu-torture: Reader Batch:  747507403 31832 0 0 0=
 0 0 0 0 0 0
> [ 1012.414264][   T91] srcu-torture: Free-Block Circulation:  10727 10727=
 10726 10725 10724 10723 10722 10721 10720 10719 0
> [ 1012.416610][   T91] rcu: srcu-torture: Tree SRCU g168572 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-7,-5 .) 1(-5,-9 .) 2(4,-2 .) 3(3,6 .) 4(-3,=
-1 .) 5(-1,2 .) 6(2,9 .) 7(7,0 .) T(0,0)
> [ 1023.439733][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1026.379806][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1027.809730][   T91] srcu-torture: rtc: 00000000ad27e618 ver: 10876 tfl=
e: 0 rta: 10877 rtaf: 0 rtf: 10866 rtmbe: 0 rtmbkf: 0/7530 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 125327 onoff: 44/44:47/48 18,63:19,84 1392:166=
4 (HZ=3D100) barrier: 5991/5992:0 read-exits: 1172 nocb-toggles: 0:0
> [ 1027.816052][   T91] srcu-torture: Reader Pipe:  758679347 15378 0 0 0 =
0 0 0 0 0 0
> [ 1027.817946][   T91] srcu-torture: Reader Batch:  758662417 32311 0 0 0=
 0 0 0 0 0 0
> [ 1027.819898][   T91] srcu-torture: Free-Block Circulation:  10876 10875=
 10874 10873 10872 10871 10870 10869 10868 10866 0
> [ 1027.822625][   T91] rcu: srcu-torture: Tree SRCU g170398 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-9,-6 C) 1(-7,-4 C) 2(0,4 C) 3(6,3 .) 4(-1,-=
3 C) 5(2,-1 .) 6(9,2 C) 7(0,7 .) T(0,2)
> [ 1037.359719][   T96] rcu_torture_fwd_prog n_max_cbs: 19154
> [ 1037.387381][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1037.388822][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1037.509471][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1037.576942][   T96] rcu_torture_fwd_prog_cr Duration 9 barrier: 7 pend=
ing 7770 n_launders: 19257 n_launders_sa: 7770 n_max_gps: 100 n_max_cbs: 15=
354 cver 1 gps 11
> [ 1037.580217][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 17 jiffies): 1s/10: 26841:10 2s/10: 7770:4
> [ 1039.999736][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1040.279710][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1043.119727][   T91] srcu-torture: rtc: 00000000fec76d06 ver: 11042 tfl=
e: 0 rta: 11042 rtaf: 0 rtf: 11033 rtmbe: 0 rtmbkf: 0/7645 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 127512 onoff: 45/45:48/48 18,63:19,84 1445:172=
2 (HZ=3D100) barrier: 6081/6081:0 read-exits: 1189 nocb-toggles: 0:0
> [ 1043.130547][   T91] srcu-torture: Reader Pipe:  772051099 15621 0 0 0 =
0 0 0 0 0 0
> [ 1043.132433][   T91] srcu-torture: Reader Batch:  772033902 32826 0 0 0=
 0 0 0 0 0 0
> [ 1043.134359][   T91] srcu-torture: Free-Block Circulation:  11041 11041=
 11040 11039 11038 11037 11036 11035 11034 11033 0
> [ 1043.137091][   T91] rcu: srcu-torture: Tree SRCU g172496 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-11,-7 .) 1(-6,-5 .) 2(0,4 .) 3(6,3 .) 4(-1,=
-3 .) 5(2,-1 .) 6(10,2 .) 7(0,7 .) T(0,0)
> [ 1053.839760][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1056.210370][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1058.479705][   T91] srcu-torture: rtc: 000000004edb3c47 ver: 11173 tfl=
e: 0 rta: 11174 rtaf: 0 rtf: 11161 rtmbe: 0 rtmbkf: 0/7740 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 129458 onoff: 45/45:49/49 18,63:19,84 1445:176=
8 (HZ=3D100) barrier: 6167/6167:0 read-exits: 1206 nocb-toggles: 0:0
> [ 1058.484949][   T91] srcu-torture: Reader Pipe:  783824668 15842 0 0 0 =
0 0 0 0 0 0
> [ 1058.486517][   T91] srcu-torture: Reader Batch:  783807243 33274 0 0 0=
 0 0 0 0 0 0
> [ 1058.488091][   T91] srcu-torture: Free-Block Circulation:  11173 11172=
 11170 11169 11168 11167 11165 11164 11163 11161 0
> [ 1058.490357][   T91] rcu: srcu-torture: Tree SRCU g174257 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-11,-7 C) 1(-7,-4 C) 2(1,5 C) 3(6,3 .) 4(-1,=
-3 .) 5(2,-1 .) 6(10,2 .) 7(0,7 .) T(0,2)
> [ 1069.999702][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1070.199852][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1073.849748][   T91] srcu-torture: rtc: 00000000d8c0045d ver: 11348 tfl=
e: 0 rta: 11348 rtaf: 0 rtf: 11339 rtmbe: 0 rtmbkf: 0/7854 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 131174 onoff: 46/46:50/50 18,63:19,84 1476:179=
5 (HZ=3D100) barrier: 6259/6259:0 read-exits: 1223 nocb-toggles: 0:0
> [ 1073.859236][   T91] srcu-torture: Reader Pipe:  794245121 16016 0 0 0 =
0 0 0 0 0 0
> [ 1073.860831][   T91] srcu-torture: Reader Batch:  794227539 33603 0 0 0=
 0 0 0 0 0 0
> [ 1073.862445][   T91] srcu-torture: Free-Block Circulation:  11347 11347=
 11346 11345 11344 11343 11342 11341 11340 11339 0
> [ 1073.864682][   T91] rcu: srcu-torture: Tree SRCU g176385 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-11,-7 C) 1(-7,-5 .) 2(0,4 C) 3(6,3 .) 4(-1,=
-3 .) 5(2,-1 .) 6(11,2 C) 7(0,7 C) T(0,0)
> [ 1083.759769][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1086.280326][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1089.209758][   T91] srcu-torture: rtc: 000000001821b2cd ver: 11523 tfl=
e: 0 rta: 11524 rtaf: 0 rtf: 11513 rtmbe: 0 rtmbkf: 0/7967 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 133097 onoff: 46/46:51/51 18,63:19,84 1476:182=
3 (HZ=3D100) barrier: 6347/6347:0 read-exits: 1240 nocb-toggles: 0:0
> [ 1089.214672][   T91] srcu-torture: Reader Pipe:  806349509 16227 0 0 0 =
0 0 0 0 0 0
> [ 1089.216121][   T91] srcu-torture: Reader Batch:  806331665 34077 0 0 0=
 0 0 0 0 0 0
> [ 1089.217649][   T91] srcu-torture: Free-Block Circulation:  11523 11522=
 11520 11519 11518 11517 11516 11515 11514 11513 0
> [ 1089.219760][   T91] rcu: srcu-torture: Tree SRCU g178669 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-7,-12 .) 1(-5,-7 .) 2(4,0 C) 3(3,6 .) 4(-3,=
-1 .) 5(-1,2 .) 6(2,11 .) 7(7,2 .) T(0,1)
> [ 1098.799780][   T96] rcu_torture_fwd_prog n_max_cbs: 15354
> [ 1098.827390][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1098.828733][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1099.082265][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1099.169209][   T96] rcu_torture_fwd_prog_cr Duration 17 barrier: 8 pen=
ding 2729 n_launders: 51807 n_launders_sa: 44292 n_max_gps: 100 n_max_cbs: =
29066 cver 7 gps 14
> [ 1099.171815][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 26 jiffies): 1s/10: 22103:6 2s/10: 56041:7 3s/10: 2729:4
> [ 1100.079748][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1100.419706][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1104.239724][   T91] srcu-torture: rtc: 0000000055f7a98f ver: 11698 tfl=
e: 0 rta: 11698 rtaf: 0 rtf: 11689 rtmbe: 0 rtmbkf: 0/8057 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 134190 onoff: 46/46:53/53 18,63:11,84 1476:185=
6 (HZ=3D100) barrier: 6440/6440:0 read-exits: 1257 nocb-toggles: 0:0
> [ 1104.244217][   T91] srcu-torture: Reader Pipe:  813535558 16290 0 0 0 =
0 0 0 0 0 0
> [ 1104.245560][   T91] srcu-torture: Reader Batch:  813517622 34232 0 0 0=
 0 0 0 0 0 0
> [ 1104.246925][   T91] srcu-torture: Free-Block Circulation:  11697 11697=
 11696 11695 11694 11693 11692 11691 11690 11689 0
> [ 1104.248860][   T91] rcu: srcu-torture: Tree SRCU g180972 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-7,-14 .) 1(-5,-7 .) 2(4,1 .) 3(3,6 .) 4(-3,=
-1 .) 5(-1,2 .) 6(2,11 .) 7(7,2 .) T(0,0)
> [ 1114.079750][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1116.299693][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1119.279689][   T91] srcu-torture: rtc: 00000000ec899488 ver: 11886 tfl=
e: 0 rta: 11887 rtaf: 0 rtf: 11877 rtmbe: 0 rtmbkf: 0/8151 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 135176 onoff: 47/47:53/53 15,63:11,84 1491:185=
6 (HZ=3D100) barrier: 6531/6531:0 read-exits: 1274 nocb-toggles: 0:0
> [ 1119.286485][   T91] srcu-torture: Reader Pipe:  819698751 16305 0 0 0 =
0 0 0 0 0 0
> [ 1119.288488][   T91] srcu-torture: Reader Batch:  819680805 34257 0 0 0=
 0 0 0 0 0 0
> [ 1119.290538][   T91] srcu-torture: Free-Block Circulation:  11886 11885=
 11884 11883 11882 11881 11880 11879 11878 11877 0
> [ 1119.293446][   T91] rcu: srcu-torture: Tree SRCU g183481 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-15,-7 C) 1(-7,-5 .) 2(1,4 .) 3(6,3 .) 4(-1,=
-3 .) 5(3,-1 .) 6(11,2 .) 7(2,7 .) T(0,0)
> [ 1129.919747][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1130.239681][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1134.639712][   T91] srcu-torture: rtc: 000000008cb13309 ver: 12016 tfl=
e: 0 rta: 12016 rtaf: 0 rtf: 12007 rtmbe: 0 rtmbkf: 0/8228 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 136432 onoff: 48/49:53/53 15,63:11,84 1515:185=
6 (HZ=3D100) barrier: 6622/6622:0 read-exits: 1291 nocb-toggles: 0:0
> [ 1134.648888][   T91] srcu-torture: Reader Pipe:  827194317 16407 0 0 0 =
0 0 0 0 0 0
> [ 1134.650631][   T91] srcu-torture: Reader Batch:  827176230 34500 0 0 0=
 0 0 0 0 0 0
> [ 1134.652118][   T91] srcu-torture: Free-Block Circulation:  12015 12015=
 12014 12013 12012 12011 12010 12009 12008 12007 0
> [ 1134.654229][   T91] rcu: srcu-torture: Tree SRCU g185404 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-7,-15 .) 1(-5,-8 .) 2(4,1 .) 3(3,6 .) 4(-3,=
-1 .) 5(-1,4 .) 6(2,11 .) 7(7,2 .) T(0,0)
> [ 1144.009739][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1146.189813][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1149.999712][   T91] srcu-torture: rtc: 00000000422e1963 ver: 12164 tfl=
e: 0 rta: 12165 rtaf: 0 rtf: 12150 rtmbe: 0 rtmbkf: 0/8332 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 138690 onoff: 50/50:53/53 15,63:11,84 1569:185=
6 (HZ=3D100) barrier: 6702/6703:0 read-exits: 1308 nocb-toggles: 0:0
> [ 1150.005942][   T91] srcu-torture: Reader Pipe:  840316880 16678 0 0 0 =
0 0 0 0 0 0
> [ 1150.007797][   T91] srcu-torture: Reader Batch:  840298588 34974 0 0 0=
 0 0 0 0 0 0
> [ 1150.009663][   T91] srcu-torture: Free-Block Circulation:  12164 12162=
 12161 12160 12159 12158 12154 12153 12152 12150 0
> [ 1150.012367][   T91] rcu: srcu-torture: Tree SRCU g187078 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-14,-6 C) 1(-8,-4 C) 2(1,4 .) 3(6,4 C) 4(-1,=
-3 .) 5(4,-1 C) 6(11,2 .) 7(2,7 .) T(1,3)
> [ 1159.771406][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1160.179694][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1160.319700][   T96] rcu_torture_fwd_prog n_max_cbs: 29066
> [ 1160.343143][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1160.344592][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1160.527857][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1160.576673][   T96] rcu_torture_fwd_prog_cr Duration 18 barrier: 5 pen=
ding 2431 n_launders: 39873 n_launders_sa: 1443 n_max_gps: 100 n_max_cbs: 2=
3186 cver 6 gps 1309
> [ 1160.579790][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 24 jiffies): 1s/10: 12580:3 2s/10: 49036:1308 3s/10: 1443:0
> [ 1165.359772][   T91] srcu-torture: rtc: 00000000c4f67431 ver: 12266 tfl=
e: 0 rta: 12266 rtaf: 0 rtf: 12257 rtmbe: 0 rtmbkf: 0/8412 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 140268 onoff: 50/50:54/54 15,63:11,84 1569:189=
9 (HZ=3D100) barrier: 6789/6789:0 read-exits: 1325 nocb-toggles: 0:0
> [ 1165.371021][   T91] srcu-torture: Reader Pipe:  849612202 16833 0 0 0 =
0 0 0 0 0 0
> [ 1165.372611][   T91] srcu-torture: Reader Batch:  849593445 35594 0 0 0=
 0 0 0 0 0 0
> [ 1165.374219][   T91] srcu-torture: Free-Block Circulation:  12265 12265=
 12264 12263 12262 12261 12260 12259 12258 12257 0
> [ 1165.376510][   T91] rcu: srcu-torture: Tree SRCU g193776 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-15,-7 .) 1(-10,-5 .) 2(1,4 .) 3(5,3 .) 4(-1=
,-3 .) 5(4,-1 .) 6(14,2 .) 7(2,7 .) T(0,0)
> [ 1173.759748][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1176.189787][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1180.719698][   T91] srcu-torture: rtc: 000000008e3ceab7 ver: 12457 tfl=
e: 0 rta: 12458 rtaf: 0 rtf: 12448 rtmbe: 0 rtmbkf: 0/8523 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 142244 onoff: 50/50:56/56 15,63:11,84 1569:194=
9 (HZ=3D100) barrier: 6880/6880:0 read-exits: 1342 nocb-toggles: 0:0
> [ 1180.749849][   T91] srcu-torture: Reader Pipe:  862487256 17002 0 0 0 =
0 0 0 0 0 0
> [ 1180.751129][   T91] srcu-torture: Reader Batch:  862468277 35985 0 0 0=
 0 0 0 0 0 0
> [ 1180.752420][   T91] srcu-torture: Free-Block Circulation:  12457 12456=
 12455 12454 12453 12452 12451 12450 12449 12448 0
> [ 1180.754267][   T91] rcu: srcu-torture: Tree SRCU g196374 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-15,-7 .) 1(-12,-4 C) 2(1,4 .) 3(4,3 .) 4(-1=
,-3 .) 5(7,-1 C) 6(14,2 .) 7(2,7 .) T(0,1)
> [ 1189.769742][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1190.019690][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1196.079698][   T91] srcu-torture: rtc: 000000001db26867 ver: 12570 tfl=
e: 0 rta: 12571 rtaf: 0 rtf: 12560 rtmbe: 0 rtmbkf: 0/8582 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 143076 onoff: 51/51:56/56 15,63:11,84 1593:194=
9 (HZ=3D100) barrier: 6972/6972:0 read-exits: 1359 nocb-toggles: 0:0
> [ 1196.087601][   T91] srcu-torture: Reader Pipe:  867864555 17058 0 0 0 =
0 0 0 0 0 0
> [ 1196.089365][   T91] srcu-torture: Reader Batch:  867845521 36094 0 0 0=
 0 0 0 0 0 0
> [ 1196.096580][   T91] srcu-torture: Free-Block Circulation:  12570 12568=
 12567 12566 12565 12564 12563 12562 12561 12560 0
> [ 1196.098718][   T91] rcu: srcu-torture: Tree SRCU g198257 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-15,-6 C) 1(-14,-6 C) 2(1,4 .) 3(4,3 .) 4(-1=
,-3 .) 5(9,0 C) 6(14,2 .) 7(2,7 .) T(0,1)
> [ 1203.599700][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1206.023582][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1211.439741][   T91] srcu-torture: rtc: 00000000a60b78d0 ver: 12775 tfl=
e: 0 rta: 12775 rtaf: 0 rtf: 12766 rtmbe: 0 rtmbkf: 0/8705 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 144925 onoff: 51/51:58/58 15,63:11,84 1593:198=
5 (HZ=3D100) barrier: 7063/7063:0 read-exits: 1376 nocb-toggles: 0:0
> [ 1211.442453][   T91] srcu-torture: Reader Pipe:  879631627 17227 0 0 0 =
0 0 0 0 0 0
> [ 1211.443254][   T91] srcu-torture: Reader Batch:  879612447 36409 0 0 0=
 0 0 0 0 0 0
> [ 1211.444063][   T91] srcu-torture: Free-Block Circulation:  12774 12774=
 12773 12772 12771 12770 12769 12768 12767 12766 0
> [ 1211.445217][   T91] rcu: srcu-torture: Tree SRCU g200832 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-15,-7 .) 1(-15,-6 .) 2(1,4 .) 3(4,3 .) 4(-1=
,-3 .) 5(10,0 .) 6(14,2 .) 7(2,7 .) T(0,0)
> [ 1219.609693][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1219.709752][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1226.159779][   T96] rcu_torture_fwd_prog n_max_cbs: 23186
> [ 1226.184431][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1226.185731][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1226.514988][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1226.560224][   T96] rcu_torture_fwd_prog_cr Duration 18 barrier: 5 pen=
ding 1336 n_launders: 44665 n_launders_sa: 1336 n_max_gps: 100 n_max_cbs: 3=
0989 cver 4 gps 12
> [ 1226.562718][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 23 jiffies): 1s/10: 33359:7 2s/10: 40959:5 3s/10: 1336:2
> [ 1226.799695][   T91] srcu-torture: rtc: 00000000f936b76b ver: 12891 tfl=
e: 0 rta: 12892 rtaf: 0 rtf: 12880 rtmbe: 0 rtmbkf: 0/8742 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 145468 onoff: 52/52:58/58 15,63:11,84 1609:198=
5 (HZ=3D100) barrier: 7152/7152:0 read-exits: 1393 nocb-toggles: 0:0
> [ 1226.804020][   T91] srcu-torture: Reader Pipe:  882850929 17243 0 0 0 =
0 0 0 0 0 0
> [ 1226.805312][   T91] srcu-torture: Reader Batch:  882831746 36428 0 0 0=
 0 0 0 0 0 0
> [ 1226.806618][   T91] srcu-torture: Free-Block Circulation:  12891 12889=
 12888 12887 12885 12884 12883 12882 12881 12880 0
> [ 1226.808477][   T91] rcu: srcu-torture: Tree SRCU g202641 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-15,-7 C) 1(-15,-6 .) 2(1,4 .) 3(4,3 .) 4(-1=
,-2 C) 5(10,0 .) 6(14,2 .) 7(2,7 .) T(0,1)
> [ 1233.519762][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1236.193986][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1242.159765][   T91] srcu-torture: rtc: 0000000069c139bb ver: 13085 tfl=
e: 0 rta: 13085 rtaf: 0 rtf: 13076 rtmbe: 0 rtmbkf: 0/8844 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 147111 onoff: 53/54:58/58 15,63:11,84 1634:198=
5 (HZ=3D100) barrier: 7240/7240:0 read-exits: 1410 nocb-toggles: 0:0
> [ 1242.168893][   T91] srcu-torture: Reader Pipe:  893045729 17384 0 0 0 =
0 0 0 0 0 0
> [ 1242.170400][   T91] srcu-torture: Reader Batch:  893026396 36718 0 0 0=
 0 0 0 0 0 0
> [ 1242.171875][   T91] srcu-torture: Free-Block Circulation:  13084 13084=
 13083 13082 13081 13080 13079 13078 13077 13076 0
> [ 1242.173994][   T91] rcu: srcu-torture: Tree SRCU g205012 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-7,-17 .) 1(-6,-15 .) 2(4,1 .) 3(3,4 .) 4(-3=
,0 .) 5(0,10 .) 6(2,15 .) 7(7,2 .) T(0,0)
> [ 1249.839696][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1250.079700][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1257.529682][   T91] srcu-torture: rtc: 00000000eafddcdb ver: 13247 tfl=
e: 0 rta: 13248 rtaf: 0 rtf: 13235 rtmbe: 0 rtmbkf: 0/8937 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 148711 onoff: 54/54:59/59 15,63:11,84 1659:200=
9 (HZ=3D100) barrier: 7333/7334:0 read-exits: 1427 nocb-toggles: 0:0
> [ 1257.534555][   T91] srcu-torture: Reader Pipe:  902999337 17596 0 0 0 =
0 0 0 0 0 0
> [ 1257.536010][   T91] srcu-torture: Reader Batch:  902979773 37160 0 0 0=
 0 0 0 0 0 0
> [ 1257.537482][   T91] srcu-torture: Free-Block Circulation:  13247 13244=
 13243 13242 13240 13239 13238 13237 13236 13235 0
> [ 1257.539573][   T91] rcu: srcu-torture: Tree SRCU g207054 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-14,-7 C) 1(-15,-6 .) 2(1,4 .) 3(4,3 .) 4(0,=
-3 C) 5(10,0 .) 6(15,2 C) 7(1,7 .) T(2,0)
> [ 1263.609741][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1266.015686][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1272.879795][   T91] srcu-torture: rtc: 00000000150a4371 ver: 13427 tfl=
e: 0 rta: 13427 rtaf: 0 rtf: 13418 rtmbe: 0 rtmbkf: 0/9035 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 150091 onoff: 54/54:60/60 15,63:11,84 1659:203=
4 (HZ=3D100) barrier: 7422/7422:0 read-exits: 1444 nocb-toggles: 0:0
> [ 1272.882946][   T91] srcu-torture: Reader Pipe:  912047190 17717 0 0 0 =
0 0 0 0 0 0
> [ 1272.883873][   T91] srcu-torture: Reader Batch:  912027521 37392 0 0 0=
 0 0 0 0 0 0
> [ 1272.884818][   T91] srcu-torture: Free-Block Circulation:  13426 13426=
 13425 13424 13423 13422 13421 13420 13419 13418 0
> [ 1272.886165][   T91] rcu: srcu-torture: Tree SRCU g209516 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-7,-14 .) 1(-6,-15 .) 2(4,1 .) 3(3,4 .) 4(-3=
,0 .) 5(0,10 .) 6(2,13 .) 7(7,1 .) T(0,0)
> [ 1279.849692][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1279.851861][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1288.239769][   T96] rcu_torture_fwd_prog n_max_cbs: 30989
> [ 1288.240716][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1288.242040][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1288.243250][   T91] srcu-torture: rtc: 00000000955957ff ver: 13580 tfl=
e: 0 rta: 13581 rtaf: 0 rtf: 13569 rtmbe: 0 rtmbkf: 0/9103 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 150961 onoff: 55/55:61/61 15,63:11,84 1674:204=
5 (HZ=3D100) barrier: 7513/7513:0 read-exits: 1461 nocb-toggles: 0:0
> [ 1288.247427][   T91] srcu-torture: Reader Pipe:  917228929 17755 0 0 0 =
0 0 0 0 0 0
> [ 1288.248677][   T91] srcu-torture: Reader Batch:  917209255 37437 0 0 0=
 0 0 0 0 0 0
> [ 1288.249973][   T91] srcu-torture: Free-Block Circulation:  13580 13579=
 13578 13577 13576 13575 13574 13572 13570 13569 0
> [ 1288.251778][   T91] rcu: srcu-torture: Tree SRCU g211649 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-14,-7 .) 1(-15,-6 .) 2(3,4 C) 3(4,3 .) 4(0,=
-3 .) 5(10,0 .) 6(11,2 C) 7(1,7 .) T(0,0)
> [ 1288.390671][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1288.431793][   T96] rcu_torture_fwd_prog_cr Duration 13 barrier: 4 pen=
ding 7732 n_launders: 27906 n_launders_sa: 101 n_max_gps: 100 n_max_cbs: 20=
332 cver 3 gps 904
> [ 1288.434210][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 17 jiffies): 1s/10: 27806:160 2s/10: 20432:746
> [ 1293.439740][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1296.001176][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1303.599734][   T91] srcu-torture: rtc: 00000000ab9c2e6a ver: 13746 tfl=
e: 0 rta: 13746 rtaf: 0 rtf: 13737 rtmbe: 0 rtmbkf: 0/9182 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 151879 onoff: 55/55:62/62 15,63:11,84 1674:205=
6 (HZ=3D100) barrier: 7602/7602:0 read-exits: 1478 nocb-toggles: 0:0
> [ 1303.602262][   T91] srcu-torture: Reader Pipe:  923446922 17804 0 0 0 =
0 0 0 0 0 0
> [ 1303.603012][   T91] srcu-torture: Reader Batch:  923427209 37525 0 0 0=
 0 0 0 0 0 0
> [ 1303.603768][   T91] srcu-torture: Free-Block Circulation:  13745 13745=
 13744 13743 13742 13741 13740 13739 13738 13737 0
> [ 1303.604845][   T91] rcu: srcu-torture: Tree SRCU g217432 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-14,-7 .) 1(-15,-6 .) 2(3,4 .) 3(4,3 .) 4(0,=
-3 .) 5(10,0 .) 6(11,2 .) 7(1,7 .) T(0,0)
> [ 1309.759728][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1309.969809][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1318.959713][   T91] srcu-torture: rtc: 00000000bdda06e8 ver: 13925 tfl=
e: 0 rta: 13926 rtaf: 0 rtf: 13915 rtmbe: 0 rtmbkf: 0/9291 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 153406 onoff: 57/57:62/62 15,63:11,84 1712:205=
6 (HZ=3D100) barrier: 7695/7695:0 read-exits: 1495 nocb-toggles: 0:0
> [ 1318.964902][   T91] srcu-torture: Reader Pipe:  934322699 17929 0 0 0 =
0 0 0 0 0 0
> [ 1318.966351][   T91] srcu-torture: Reader Batch:  934302789 37852 0 0 0=
 0 0 0 0 0 0
> [ 1318.967807][   T91] srcu-torture: Free-Block Circulation:  13925 13924=
 13923 13922 13921 13920 13919 13918 13916 13915 0
> [ 1318.971485][   T91] rcu: srcu-torture: Tree SRCU g219888 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-15,-3 C) 1(-15,-6 .) 2(3,4 .) 3(5,3 C) 4(0,=
-3 .) 5(10,0 .) 6(11,2 C) 7(1,7 .) T(0,4)
> [ 1323.599736][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1326.096878][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1334.329721][   T91] srcu-torture: rtc: 0000000011054584 ver: 14099 tfl=
e: 0 rta: 14099 rtaf: 0 rtf: 14090 rtmbe: 0 rtmbkf: 0/9374 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 154656 onoff: 57/57:63/63 15,63:11,84 1712:208=
0 (HZ=3D100) barrier: 7786/7786:0 read-exits: 1512 nocb-toggles: 0:0
> [ 1334.337504][   T91] srcu-torture: Reader Pipe:  942292131 18053 0 0 0 =
0 0 0 0 0 0
> [ 1334.338795][   T91] srcu-torture: Reader Batch:  942272131 38066 0 0 0=
 0 0 0 0 0 0
> [ 1334.340116][   T91] srcu-torture: Free-Block Circulation:  14098 14098=
 14097 14096 14095 14094 14093 14092 14091 14090 0
> [ 1334.341969][   T91] rcu: srcu-torture: Tree SRCU g221972 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-6,-15 .) 1(-6,-15 .) 2(4,3 .) 3(3,5 .) 4(-3=
,0 .) 5(0,10 .) 6(1,11 .) 7(7,1 .) T(0,0)
> [ 1339.689718][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1339.700464][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1349.679689][   T96] rcu_torture_fwd_prog n_max_cbs: 20332
> [ 1349.680638][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1349.681783][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1349.682972][   T91] srcu-torture: rtc: 00000000150a4371 ver: 14319 tfl=
e: 0 rta: 14320 rtaf: 0 rtf: 14307 rtmbe: 0 rtmbkf: 0/9483 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 155940 onoff: 58/58:64/64 15,63:2,84 1729:2082=
 (HZ=3D100) barrier: 7883/7884:0 read-exits: 1529 nocb-toggles: 0:0
> [ 1349.687143][   T91] srcu-torture: Reader Pipe:  950885442 18102 0 0 0 =
0 0 0 0 0 0
> [ 1349.688401][   T91] srcu-torture: Reader Batch:  950865375 38186 0 0 0=
 0 0 0 0 0 0
> [ 1349.689705][   T91] srcu-torture: Free-Block Circulation:  14319 14318=
 14317 14315 14312 14311 14310 14309 14308 14307 0
> [ 1349.691384][   T91] rcu: srcu-torture: Tree SRCU g224841 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-14,-6 .) 1(-15,-6 .) 2(3,4 .) 3(4,3 C) 4(0,=
-3 .) 5(10,0 .) 6(11,1 C) 7(1,7 .) T(0,0)
> [ 1349.831048][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1349.922669][   T96] rcu_torture_fwd_prog_cr Duration 13 barrier: 9 pen=
ding 15185 n_launders: 27229 n_launders_sa: 101 n_max_gps: 100 n_max_cbs: 2=
8391 cver 7 gps 759
> [ 1349.925679][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 22 jiffies): 1s/10: 27129:751 2s/10: 28491:10
> [ 1353.279725][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1356.151108][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1365.039782][   T91] srcu-torture: rtc: 000000007bff1239 ver: 14448 tfl=
e: 0 rta: 14448 rtaf: 0 rtf: 14439 rtmbe: 0 rtmbkf: 0/9558 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 157236 onoff: 59/59:64/64 15,63:2,84 1760:2082=
 (HZ=3D100) barrier: 7978/7978:0 read-exits: 1546 nocb-toggles: 0:0
> [ 1365.047508][   T91] srcu-torture: Reader Pipe:  958846308 18215 0 0 0 =
0 0 0 0 0 0
> [ 1365.048894][   T91] srcu-torture: Reader Batch:  958826132 38408 0 0 0=
 0 0 0 0 0 0
> [ 1365.050310][   T91] srcu-torture: Free-Block Circulation:  14447 14447=
 14446 14445 14444 14443 14442 14441 14440 14439 0
> [ 1365.052261][   T91] rcu: srcu-torture: Tree SRCU g229656 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-14,-6 .) 1(-15,-6 .) 2(3,4 .) 3(5,3 .) 4(0,=
-3 .) 5(10,0 .) 6(10,1 .) 7(1,7 .) T(0,0)
> [ 1369.839724][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1370.169735][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1380.399778][   T91] srcu-torture: rtc: 000000004d4f8499 ver: 14632 tfl=
e: 0 rta: 14633 rtaf: 0 rtf: 14623 rtmbe: 0 rtmbkf: 0/9683 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 159314 onoff: 60/60:65/65 15,63:2,84 1815:2110=
 (HZ=3D100) barrier: 8067/8067:0 read-exits: 1563 nocb-toggles: 0:0
> [ 1380.445810][   T91] srcu-torture: Reader Pipe:  971668249 18432 0 0 0 =
0 0 0 0 0 0
> [ 1380.448497][   T91] srcu-torture: Reader Batch:  971647853 38845 0 0 0=
 0 0 0 0 0 0
> [ 1380.449958][   T91] srcu-torture: Free-Block Circulation:  14635 14634=
 14632 14631 14630 14629 14628 14627 14626 14625 0
> [ 1380.452296][   T91] rcu: srcu-torture: Tree SRCU g231964 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-6,-14 .) 1(-6,-15 .) 2(4,5 C) 3(3,5 C) 4(-3=
,0 .) 5(0,10 .) 6(1,9 .) 7(7,1 .) T(0,1)
> [ 1383.769796][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1386.359701][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1395.759771][   T91] srcu-torture: rtc: 000000001c26b0ba ver: 14770 tfl=
e: 0 rta: 14770 rtaf: 0 rtf: 14761 rtmbe: 0 rtmbkf: 0/9771 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 160623 onoff: 61/61:65/65 15,63:2,84 1845:2110=
 (HZ=3D100) barrier: 8160/8160:0 read-exits: 1580 nocb-toggles: 0:0
> [ 1395.766208][   T91] srcu-torture: Reader Pipe:  979292961 18574 0 0 0 =
0 0 0 0 0 0
> [ 1395.768090][   T91] srcu-torture: Reader Batch:  979272376 39175 0 0 0=
 0 0 0 0 0 0
> [ 1395.770817][   T91] srcu-torture: Free-Block Circulation:  14769 14769=
 14768 14767 14766 14765 14764 14763 14762 14761 0
> [ 1395.794752][   T91] rcu: srcu-torture: Tree SRCU g233992 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-14,-6 .) 1(-15,-6 .) 2(4,4 .) 3(5,3 .) 4(0,=
-3 .) 5(10,0 .) 6(9,1 .) 7(1,7 .) T(0,0)
> [ 1399.999741][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1400.209693][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1411.119778][   T96] rcu_torture_fwd_prog n_max_cbs: 28391
> [ 1411.119866][   T91] srcu-torture:=20
> [ 1411.133526][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1411.133509][   T91] rtc: 000000009241e8a4 ver: 15001 tfle: 0 rta: 1500=
1 rtaf: 0 rtf: 14988=20
> [ 1411.134127][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1411.135350][   T91] rtmbe: 0 rtmbkf: 0/9911 rtbe: 0 rtbke: 0 rtbre: 0 =
rtbf: 0 rtb: 0 nt: 162785 onoff: 61/61:66/66 15,63:2,84 1845:2137 (HZ=3D100=
) barrier: 8249/8250:0 read-exits: 1597 nocb-toggles: 0:0
> [ 1411.141442][   T91] srcu-torture: Reader Pipe:  992585612 18803 0 0 0 =
0 0 0 0 0 0
> [ 1411.142801][   T91] srcu-torture: Reader Batch:  992564823 39607 0 0 0=
 0 0 0 0 0 0
> [ 1411.144177][   T91] srcu-torture: Free-Block Circulation:  15000 15000=
 14999 14998 14997 14992 14991 14990 14989 14988 0
> [ 1411.146137][   T91] rcu: srcu-torture: Tree SRCU g236669 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-6,-14 .) 1(-6,-16 .) 2(4,4 .) 3(3,5 C) 4(-3=
,0 .) 5(0,10 .) 6(1,10 C) 7(7,1 .) T(0,0)
> [ 1411.311656][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1411.376965][   T96] rcu_torture_fwd_prog_cr Duration 17 barrier: 6 pen=
ding 36435 n_launders: 72036 n_launders_sa: 49655 n_max_gps: 100 n_max_cbs:=
 50000 cver 0 gps 98
> [ 1411.381403][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 24 jiffies): 1s/10: 22382:41 2s/10: 90539:59 3s/10: 9115:0
> [ 1413.759729][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1416.210551][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1426.479696][   T91] srcu-torture: rtc: 000000009241e8a4 ver: 15096 tfl=
e: 0 rta: 15097 rtaf: 0 rtf: 15085 rtmbe: 0 rtmbkf: 0/9981 rtbe: 0 rtbke: 0=
 rtbre: 0 rtbf: 0 rtb: 0 nt: 164249 onoff: 62/62:67/67 15,63:2,84 1875:2161=
 (HZ=3D100) barrier: 8340/8340:0 read-exits: 1614 nocb-toggles: 0:0
> [ 1426.484278][   T91] srcu-torture: Reader Pipe:  1001600885 18959 0 0 0=
 0 0 0 0 0 0
> [ 1426.485677][   T91] srcu-torture: Reader Batch:  1001579906 39953 0 0 =
0 0 0 0 0 0 0
> [ 1426.487073][   T91] srcu-torture: Free-Block Circulation:  15096 15095=
 15093 15092 15091 15090 15089 15088 15086 15085 0
> [ 1426.489055][   T91] rcu: srcu-torture: Tree SRCU g238590 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-14,-6 .) 1(-16,-6 .) 2(6,5 C) 3(4,3 .) 4(2,=
-3 C) 5(10,0 .) 6(8,1 C) 7(1,7 .) T(1,1)
> [ 1429.839693][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1430.029934][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1441.839705][   T91] srcu-torture: rtc: 000000003c9d63c9 ver: 15343 tfl=
e: 0 rta: 15343 rtaf: 0 rtf: 15334 rtmbe: 0 rtmbkf: 0/10118 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 166065 onoff: 62/62:68/68 15,63:2,84 1875:218=
7 (HZ=3D100) barrier: 8432/8433:0 read-exits: 1631 nocb-toggles: 0:0
> [ 1441.842753][   T91] srcu-torture: Reader Pipe:  1013850958 19121 0 0 0=
 0 0 0 0 0 0
> [ 1441.843668][   T91] srcu-torture: Reader Batch:  1013829822 40271 0 0 =
0 0 0 0 0 0 0
> [ 1441.844608][   T91] srcu-torture: Free-Block Circulation:  15342 15342=
 15341 15340 15339 15338 15337 15336 15335 15334 0
> [ 1441.845911][   T91] rcu: srcu-torture: Tree SRCU g241473 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-14,-6 .) 1(-16,-6 .) 2(3,4 C) 3(4,3 .) 4(2,=
-3 .) 5(10,0 .) 6(10,1 .) 7(1,7 .) T(0,0)
> [ 1443.599791][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1446.110586][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1457.199696][   T91] srcu-torture: rtc: 000000002ff040e5 ver: 15498 tfl=
e: 0 rta: 15499 rtaf: 0 rtf: 15488 rtmbe: 0 rtmbkf: 0/10189 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 166791 onoff: 63/63:69/69 15,63:2,84 1890:219=
8 (HZ=3D100) barrier: 8524/8525:0 read-exits: 1648 nocb-toggles: 0:0
> [ 1457.228488][   T91] srcu-torture: Reader Pipe:  1018822641 19143 0 0 0=
 0 0 0 0 0 0
> [ 1457.229774][   T91] srcu-torture: Reader Batch:  1018801482 40316 0 0 =
0 0 0 0 0 0 0
> [ 1457.231060][   T91] srcu-torture: Free-Block Circulation:  15498 15497=
 15496 15495 15494 15493 15491 15490 15489 15488 0
> [ 1457.232880][   T91] rcu: srcu-torture: Tree SRCU g243714 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-6,-14 .) 1(-6,-16 .) 2(4,3 C) 3(3,4 .) 4(-3=
,2 .) 5(0,11 C) 6(1,10 .) 7(7,1 .) T(0,1)
> [ 1459.682356][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1459.889720][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1472.559703][   T91] srcu-torture: rtc: 00000000ca8729cc ver: 15716 tfl=
e: 0 rta: 15716 rtaf: 0 rtf: 15707 rtmbe: 0 rtmbkf: 0/10299 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 168342 onoff: 64/64:69/69 15,63:2,84 1915:219=
8 (HZ=3D100) barrier: 8618/8618:0 read-exits: 1665 nocb-toggles: 0:0
> [ 1472.568799][   T91] srcu-torture: Reader Pipe:  1028898991 19256 0 0 0=
 0 0 0 0 0 0
> [ 1472.570321][   T91] srcu-torture: Reader Batch:  1028877721 40539 0 0 =
0 0 0 0 0 0 0
> [ 1472.571814][   T91] srcu-torture: Free-Block Circulation:  15715 15715=
 15714 15713 15712 15711 15710 15709 15708 15707 0
> [ 1472.573936][   T91] rcu: srcu-torture: Tree SRCU g246228 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-7,-15 .) 1(-6,-16 .) 2(5,3 .) 3(3,4 .) 4(-3=
,2 .) 5(0,11 .) 6(1,10 .) 7(7,1 .) T(0,0)
> [ 1473.439705][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1476.279739][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1477.679708][   T96] rcu_torture_fwd_prog n_max_cbs: 50000
> [ 1477.705356][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1477.706751][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1477.831223][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1477.889009][   T96] rcu_torture_fwd_prog_cr Duration 11 barrier: 5 pen=
ding 217 n_launders: 17308 n_launders_sa: 217 n_max_gps: 100 n_max_cbs: 172=
90 cver 2 gps 234
> [ 1477.892070][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 17 jiffies): 1s/10: 25148:230 2s/10: 9450:7
> [ 1478.959836][  T965] kworker/dying (965) used greatest stack depth: 976=
0 bytes left
> [ 1487.919699][   T91] srcu-torture: rtc: 0000000062a4cc72 ver: 15852 tfl=
e: 0 rta: 15853 rtaf: 0 rtf: 15842 rtmbe: 0 rtmbkf: 0/10394 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 170041 onoff: 65/65:70/70 15,63:2,84 1943:222=
3 (HZ=3D100) barrier: 8711/8712:0 read-exits: 1682 nocb-toggles: 0:0
> [ 1487.924587][   T91] srcu-torture: Reader Pipe:  1039313589 19431 0 0 0=
 0 0 0 0 0 0
> [ 1487.926283][   T91] srcu-torture: Reader Batch:  1039291977 41054 0 0 =
0 0 0 0 0 0 0
> [ 1487.927765][   T91] srcu-torture: Free-Block Circulation:  15852 15851=
 15850 15849 15848 15847 15846 15845 15844 15842 0
> [ 1487.929908][   T91] rcu: srcu-torture: Tree SRCU g249209 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-17,-7 C) 1(-16,-6 .) 2(2,5 .) 3(4,3 .) 4(2,=
-3 .) 5(14,1 C) 6(10,1 .) 7(1,7 .) T(0,1)
> [ 1489.839709][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1490.100536][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1503.279771][   T91] srcu-torture: rtc: 0000000080041026 ver: 16011 tfl=
e: 0 rta: 16011 rtaf: 0 rtf: 16002 rtmbe: 0 rtmbkf: 0/10481 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 171421 onoff: 65/65:71/71 15,63:2,84 1943:226=
0 (HZ=3D100) barrier: 8799/8799:0 read-exits: 1699 nocb-toggles: 0:0
> [ 1503.289246][   T91] srcu-torture: Reader Pipe:  1047681364 19538 0 0 0=
 0 0 0 0 0 0
> [ 1503.291126][   T91] srcu-torture: Reader Batch:  1047659653 41262 0 0 =
0 0 0 0 0 0 0
> [ 1503.292451][   T91] srcu-torture: Free-Block Circulation:  16010 16010=
 16009 16008 16007 16006 16005 16004 16003 16002 0
> [ 1503.294331][   T91] rcu: srcu-torture: Tree SRCU g251448 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-19,-4 .) 1(-16,-6 .) 2(4,5 .) 3(4,3 .) 4(2,=
-3 .) 5(14,-3 .) 6(10,1 .) 7(1,7 .) T(0,0)
> [ 1503.999702][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1506.115409][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1518.664098][   T91] srcu-torture: rtc: 00000000f7aaffbe ver: 16171 tfl=
e: 0 rta: 16172 rtaf: 0 rtf: 16159 rtmbe: 0 rtmbkf: 0/10560 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 172400 onoff: 65/66:72/72 15,63:2,84 1943:227=
3 (HZ=3D100) barrier: 8893/8893:0 read-exits: 1716 nocb-toggles: 0:0
> [ 1518.666620][   T91] srcu-torture: Reader Pipe:  1053992202 19566 0 0 0=
 0 0 0 0 0 0
> [ 1518.667379][   T91] srcu-torture: Reader Batch:  1053970466 41314 0 0 =
0 0 0 0 0 0 0
> [ 1518.668149][   T91] srcu-torture: Free-Block Circulation:  16171 16169=
 16168 16167 16165 16163 16162 16161 16160 16159 0
> [ 1518.669236][   T91] rcu: srcu-torture: Tree SRCU g253862 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-18,-4 .) 1(-16,-6 .) 2(4,5 .) 3(4,3 .) 4(2,=
-3 .) 5(14,-3 C) 6(10,1 .) 7(1,7 .) T(1,0)
> [ 1519.679695][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1520.079781][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1533.679709][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1533.999708][   T91] srcu-torture: rtc: 00000000cc12e179 ver: 16327 tfl=
e: 0 rta: 16327 rtaf: 0 rtf: 16318 rtmbe: 0 rtmbkf: 0/10645 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 173568 onoff: 66/66:73/73 15,63:2,84 1993:228=
6 (HZ=3D100) barrier: 8986/8986:0 read-exits: 1734 nocb-toggles: 0:0
> [ 1534.002233][   T91] srcu-torture: Reader Pipe:  1061713266 19656 0 0 0=
 0 0 0 0 0 0
> [ 1534.002992][   T91] srcu-torture: Reader Batch:  1061691475 41457 0 0 =
0 0 0 0 0 0 0
> [ 1534.003759][   T91] srcu-torture: Free-Block Circulation:  16326 16326=
 16325 16324 16323 16322 16321 16320 16319 16318 0
> [ 1534.004845][   T91] rcu: srcu-torture: Tree SRCU g255996 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-18 .) 1(-6,-16 .) 2(5,4 .) 3(3,4 .) 4(-3=
,2 .) 5(-3,14 .) 6(1,10 .) 7(7,0 .) T(0,0)
> [ 1536.110497][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1539.119710][   T96] rcu_torture_fwd_prog n_max_cbs: 17290
> [ 1539.120278][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1539.120951][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1539.372140][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1539.484922][   T96] rcu_torture_fwd_prog_cr Duration 13 barrier: 11 pe=
nding 18574 n_launders: 52850 n_launders_sa: 45270 n_max_gps: 100 n_max_cbs=
: 29905 cver 1 gps 10
> [ 1539.486406][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 24 jiffies): 1s/10: 37485:6 2s/10: 45270:6
> [ 1549.359804][   T91] srcu-torture: rtc: 00000000c6822bdf ver: 16538 tfl=
e: 0 rta: 16539 rtaf: 0 rtf: 16527 rtmbe: 0 rtmbkf: 0/10755 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 174740 onoff: 67/67:73/73 15,63:2,84 2009:228=
6 (HZ=3D100) barrier: 9079/9079:0 read-exits: 1750 nocb-toggles: 0:0
> [ 1549.392156][   T91] srcu-torture: Reader Pipe:  1069824575 19741 0 0 0=
 0 0 0 0 0 0
> [ 1549.393443][   T91] srcu-torture: Reader Batch:  1069802724 41601 0 0 =
0 0 0 0 0 0 0
> [ 1549.394920][   T91] srcu-torture: Free-Block Circulation:  16538 16537=
 16536 16535 16534 16533 16532 16530 16528 16527 0
> [ 1549.396753][   T91] rcu: srcu-torture: Tree SRCU g258601 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-18,-4 .) 1(-16,-6 .) 2(3,7 C) 3(4,3 .) 4(2,=
-3 .) 5(15,-3 C) 6(10,1 .) 7(0,7 .) T(0,2)
> [ 1549.979723][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1550.090138][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1563.679720][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1564.719741][   T91] srcu-torture: rtc: 00000000995e55ec ver: 16685 tfl=
e: 0 rta: 16685 rtaf: 0 rtf: 16676 rtmbe: 0 rtmbkf: 0/10806 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 175496 onoff: 67/67:74/74 15,63:2,84 2009:230=
0 (HZ=3D100) barrier: 9173/9173:0 read-exits: 1768 nocb-toggles: 0:0
> [ 1564.722355][   T91] srcu-torture: Reader Pipe:  1074740553 19753 0 0 0=
 0 0 0 0 0 0
> [ 1564.723122][   T91] srcu-torture: Reader Batch:  1074718693 41622 0 0 =
0 0 0 0 0 0 0
> [ 1564.723894][   T91] srcu-torture: Free-Block Circulation:  16684 16684=
 16683 16682 16681 16680 16679 16678 16677 16676 0
> [ 1564.724974][   T91] rcu: srcu-torture: Tree SRCU g260852 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-18 .) 1(-6,-16 .) 2(5,3 .) 3(3,4 .) 4(-3=
,2 .) 5(-3,15 .) 6(1,10 .) 7(7,0 .) T(0,0)
> [ 1566.060563][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1579.818466][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1579.821439][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1580.079697][   T91] srcu-torture: rtc: 00000000ad27e618 ver: 16870 tfl=
e: 0 rta: 16871 rtaf: 0 rtf: 16859 rtmbe: 0 rtmbkf: 0/10879 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 176657 onoff: 68/68:74/74 15,63:2,84 2027:230=
0 (HZ=3D100) barrier: 9261/9261:0 read-exits: 1801 nocb-toggles: 0:0
> [ 1580.083913][   T91] srcu-torture: Reader Pipe:  1082610083 19796 0 0 0=
 0 0 0 0 0 0
> [ 1580.085186][   T91] srcu-torture: Reader Batch:  1082588175 41712 0 0 =
0 0 0 0 0 0 0
> [ 1580.086469][   T91] srcu-torture: Free-Block Circulation:  16870 16868=
 16867 16866 16864 16863 16862 16861 16860 16859 0
> [ 1580.088287][   T91] rcu: srcu-torture: Tree SRCU g263525 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-18 .) 1(-6,-16 .) 2(5,3 C) 3(3,4 .) 4(-3=
,2 .) 5(-3,15 .) 6(1,10 .) 7(7,1 C) T(0,1)
> [ 1593.359773][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1595.439779][   T91] srcu-torture: rtc: 0000000005e3da4f ver: 17010 tfl=
e: 0 rta: 17010 rtaf: 0 rtf: 17001 rtmbe: 0 rtmbkf: 0/10972 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 178037 onoff: 70/70:74/74 15,63:2,84 2079:230=
0 (HZ=3D100) barrier: 9355/9356:0 read-exits: 1802 nocb-toggles: 0:0
> [ 1595.448962][   T91] srcu-torture: Reader Pipe:  1091215111 19926 0 0 0=
 0 0 0 0 0 0
> [ 1595.450620][   T91] srcu-torture: Reader Batch:  1091193033 42012 0 0 =
0 0 0 0 0 0 0
> [ 1595.452244][   T91] srcu-torture: Free-Block Circulation:  17009 17009=
 17008 17007 17006 17005 17004 17003 17002 17001 0
> [ 1595.454535][   T91] rcu: srcu-torture: Tree SRCU g265524 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-18 .) 1(-6,-16 .) 2(5,3 C) 3(3,4 .) 4(-3=
,2 .) 5(-3,15 .) 6(1,10 .) 7(7,0 .) T(0,0)
> [ 1596.229737][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1605.689815][   T96] rcu_torture_fwd_prog n_max_cbs: 29905
> [ 1605.691150][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1605.692180][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1605.839886][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1605.922189][   T96] rcu_torture_fwd_prog_cr Duration 15 barrier: 8 pen=
ding 46216 n_launders: 70119 n_launders_sa: 103 n_max_gps: 100 n_max_cbs: 4=
6275 cver 0 gps 2075
> [ 1605.951224][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 26 jiffies): 1s/10: 29409:909 2s/10: 81636:1166 3s/10: 534=
9:2
> [ 1609.999790][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1610.339139][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1610.799718][   T91] srcu-torture: rtc: 00000000e3e16f92 ver: 17203 tfl=
e: 0 rta: 17204 rtaf: 0 rtf: 17193 rtmbe: 0 rtmbkf: 0/11115 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 180550 onoff: 71/71:74/74 15,63:2,84 2109:230=
0 (HZ=3D100) barrier: 9441/9441:0 read-exits: 1835 nocb-toggles: 0:0
> [ 1610.829887][   T91] srcu-torture: Reader Pipe:  1106088159 20233 0 0 0=
 0 0 0 0 0 0
> [ 1610.831740][   T91] srcu-torture: Reader Batch:  1106065797 42604 0 0 =
0 0 0 0 0 0 0
> [ 1610.833600][   T91] srcu-torture: Free-Block Circulation:  17207 17205=
 17204 17203 17202 17201 17200 17199 17198 17196 0
> [ 1610.836214][   T91] rcu: srcu-torture: Tree SRCU g276073 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-18,-4 .) 1(-16,-6 .) 2(3,5 .) 3(4,3 .) 4(2,=
-3 C) 5(14,-2 C) 6(11,2 C) 7(0,7 C) T(0,2)
> [ 1623.919703][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1626.149745][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1626.159700][   T91] srcu-torture: rtc: 00000000dcc5024a ver: 17322 tfl=
e: 0 rta: 17323 rtaf: 0 rtf: 17312 rtmbe: 0 rtmbkf: 0/11192 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 181889 onoff: 72/72:75/75 15,63:2,84 2137:233=
0 (HZ=3D100) barrier: 9534/9534:0 read-exits: 1852 nocb-toggles: 0:0
> [ 1626.165760][   T91] srcu-torture: Reader Pipe:  1114031706 20391 0 0 0=
 0 0 0 0 0 0
> [ 1626.167602][   T91] srcu-torture: Reader Batch:  1114009170 42938 0 0 =
0 0 0 0 0 0 0
> [ 1626.169463][   T91] srcu-torture: Free-Block Circulation:  17322 17321=
 17320 17319 17318 17317 17316 17314 17313 17312 0
> [ 1626.172123][   T91] rcu: srcu-torture: Tree SRCU g277846 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-18,-4 .) 1(-16,-6 .) 2(3,7 C) 3(4,3 .) 4(2,=
-3 C) 5(14,-3 C) 6(12,2 C) 7(0,7 .) T(1,3)
> [ 1639.849740][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1640.149700][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1641.529793][   T91] srcu-torture: rtc: 0000000005e3da4f ver: 17507 tfl=
e: 0 rta: 17507 rtaf: 0 rtf: 17498 rtmbe: 0 rtmbkf: 0/11349 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 184631 onoff: 73/73:75/75 15,63:2,84 2167:233=
0 (HZ=3D100) barrier: 9620/9620:0 read-exits: 1869 nocb-toggles: 0:0
> [ 1641.538681][   T91] srcu-torture: Reader Pipe:  1130057408 20771 0 0 0=
 0 0 0 0 0 0
> [ 1641.568856][   T91] srcu-torture: Reader Batch:  1130034448 43743 0 0 =
0 0 0 0 0 0 0
> [ 1641.570868][   T91] srcu-torture: Free-Block Circulation:  17506 17506=
 17505 17504 17503 17502 17501 17500 17499 17498 0
> [ 1641.573666][   T91] rcu: srcu-torture: Tree SRCU g279896 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-18,-4 .) 1(-16,-6 .) 2(3,5 .) 3(5,3 .) 4(2,=
-3 .) 5(12,-3 .) 6(12,1 .) 7(0,7 .) T(0,0)
> [ 1653.759824][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1656.189892][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1656.879781][   T91] srcu-torture: rtc: 0000000088ac351c ver: 17594 tfl=
e: 0 rta: 17595 rtaf: 0 rtf: 17583 rtmbe: 0 rtmbkf: 0/11420 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 186169 onoff: 73/74:76/76 15,63:2,84 2167:236=
3 (HZ=3D100) barrier: 9708/9708:0 read-exits: 1886 nocb-toggles: 0:0
> [ 1656.885867][   T91] srcu-torture: Reader Pipe:  1139128114 20940 0 0 0=
 0 0 0 0 0 0
> [ 1656.887718][   T91] srcu-torture: Reader Batch:  1139104979 44088 0 0 =
0 0 0 0 0 0 0
> [ 1656.889566][   T91] srcu-torture: Free-Block Circulation:  17594 17593=
 17592 17591 17590 17588 17586 17585 17584 17583 0
> [ 1656.892250][   T91] rcu: srcu-torture: Tree SRCU g281324 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-18 .) 1(-6,-16 .) 2(5,3 .) 3(3,5 C) 4(-3=
,2 C) 5(-3,11 C) 6(1,14 C) 7(7,2 C) T(0,3)
> [ 1667.119706][   T96] rcu_torture_fwd_prog n_max_cbs: 46275
> [ 1667.121146][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1667.122888][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1667.334974][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1667.364020][   T96] rcu_torture_fwd_prog_cr Duration 8 barrier: 3 pend=
ing 7804 n_launders: 13569 n_launders_sa: 10730 n_max_gps: 100 n_max_cbs: 8=
142 cver 5 gps 27
> [ 1667.367751][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 11 jiffies): 1s/10: 21711:28
> [ 1670.089858][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1670.299716][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1672.239711][   T91] srcu-torture: rtc: 00000000a2067ae2 ver: 17775 tfl=
e: 0 rta: 17775 rtaf: 0 rtf: 17766 rtmbe: 0 rtmbkf: 0/11572 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 188768 onoff: 74/74:77/77 15,65:2,84 2232:239=
3 (HZ=3D100) barrier: 9798/9799:0 read-exits: 1903 nocb-toggles: 0:0
> [ 1672.250049][   T91] srcu-torture: Reader Pipe:  1154556627 21300 0 0 0=
 0 0 0 0 0 0
> [ 1672.251885][   T91] srcu-torture: Reader Batch:  1154532988 44953 0 0 =
0 0 0 0 0 0 0
> [ 1672.253703][   T91] srcu-torture: Free-Block Circulation:  17774 17774=
 17773 17772 17771 17770 17769 17768 17767 17766 0
> [ 1672.256300][   T91] rcu: srcu-torture: Tree SRCU g283712 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-18,-4 .) 1(-15,-6 C) 2(3,5 .) 3(5,3 C) 4(2,=
-3 .) 5(10,-3 .) 6(13,1 .) 7(0,7 C) T(0,0)
> [ 1683.839765][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1686.080008][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1687.599788][   T91] srcu-torture: rtc: 00000000e3e16f92 ver: 17902 tfl=
e: 0 rta: 17903 rtaf: 0 rtf: 17893 rtmbe: 0 rtmbkf: 0/11671 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 190524 onoff: 74/74:78/78 15,65:2,84 2232:245=
9 (HZ=3D100) barrier: 9888/9889:0 read-exits: 1920 nocb-toggles: 0:0
> [ 1687.605713][   T91] srcu-torture: Reader Pipe:  1165143543 21504 0 0 0=
 0 0 0 0 0 0
> [ 1687.607345][   T91] srcu-torture: Reader Batch:  1165119658 45401 0 0 =
0 0 0 0 0 0 0
> [ 1687.608982][   T91] srcu-torture: Free-Block Circulation:  17902 17901=
 17900 17899 17898 17897 17896 17895 17894 17893 0
> [ 1687.611308][   T91] rcu: srcu-torture: Tree SRCU g285458 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-18 .) 1(-7,-19 C) 2(5,3 .) 3(3,5 .) 4(0,=
2 C) 5(-3,14 C) 6(1,13 .) 7(7,2 C) T(2,2)
> [ 1699.679705][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1699.929743][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1702.959757][   T91] srcu-torture: rtc: 00000000c0f17644 ver: 18118 tfl=
e: 0 rta: 18118 rtaf: 0 rtf: 18109 rtmbe: 0 rtmbkf: 0/11789 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 192267 onoff: 75/75:79/79 15,65:2,84 2259:248=
3 (HZ=3D100) barrier: 9981/9981:0 read-exits: 1937 nocb-toggles: 0:0
> [ 1702.966141][   T91] srcu-torture: Reader Pipe:  1175926638 21667 0 0 0=
 0 0 0 0 0 0
> [ 1702.968079][   T91] srcu-torture: Reader Batch:  1175902598 45719 0 0 =
0 0 0 0 0 0 0
> [ 1702.970039][   T91] srcu-torture: Free-Block Circulation:  18117 18117=
 18116 18115 18114 18113 18112 18111 18110 18109 0
> [ 1702.988505][   T91] rcu: srcu-torture: Tree SRCU g288020 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-18 .) 1(-7,-20 .) 2(5,3 .) 3(3,5 .) 4(-2=
,3 .) 5(-3,11 .) 6(1,13 .) 7(7,3 .) T(0,0)
> [ 1713.519796][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1716.069820][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1718.319704][   T91] srcu-torture: rtc: 000000008e3ceab7 ver: 18258 tfl=
e: 0 rta: 18259 rtaf: 0 rtf: 18248 rtmbe: 0 rtmbkf: 0/11898 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 194303 onoff: 76/76:79/79 15,65:2,84 2292:248=
3 (HZ=3D100) barrier: 10073/10073:0 read-exits: 1954 nocb-toggles: 0:0
> [ 1718.325825][   T91] srcu-torture: Reader Pipe:  1188498243 21919 0 0 0=
 0 0 0 0 0 0
> [ 1718.327680][   T91] srcu-torture: Reader Batch:  1188473942 46232 0 0 =
0 0 0 0 0 0 0
> [ 1718.329541][   T91] srcu-torture: Free-Block Circulation:  18258 18257=
 18256 18255 18254 18253 18252 18251 18250 18248 0
> [ 1718.332181][   T91] rcu: srcu-torture: Tree SRCU g289926 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-18,-4 .) 1(-19,-7 C) 2(2,5 .) 3(6,3 C) 4(4,=
-2 C) 5(11,-2 C) 6(13,1 .) 7(3,7 .) T(2,1)
> [ 1728.559697][   T96] rcu_torture_fwd_prog n_max_cbs: 8142
> [ 1728.561014][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1728.562453][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1728.699986][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1728.738851][   T96] rcu_torture_fwd_prog_cr Duration 13 barrier: 3 pen=
ding 12431 n_launders: 24295 n_launders_sa: 4394 n_max_gps: 100 n_max_cbs: =
20357 cver 6 gps 7
> [ 1728.741931][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 17 jiffies): 1s/10: 19902:4 2s/10: 24750:5
> [ 1729.679709][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1729.979050][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1733.679731][   T91] srcu-torture: rtc: 000000008594c5c1 ver: 18381 tfl=
e: 0 rta: 18381 rtaf: 0 rtf: 18372 rtmbe: 0 rtmbkf: 0/11989 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 196007 onoff: 77/77:80/80 15,65:2,84 2324:252=
4 (HZ=3D100) barrier: 10155/10156:0 read-exits: 1971 nocb-toggles: 0:0
> [ 1733.704802][   T91] srcu-torture: Reader Pipe:  1198410850 22088 0 0 0=
 0 0 0 0 0 0
> [ 1733.706603][   T91] srcu-torture: Reader Batch:  1198386382 46569 0 0 =
0 0 0 0 0 0 0
> [ 1733.708414][   T91] srcu-torture: Free-Block Circulation:  18380 18380=
 18379 18378 18377 18376 18375 18374 18373 18372 0
> [ 1733.710994][   T91] rcu: srcu-torture: Tree SRCU g291600 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-18,-4 .) 1(-20,-7 C) 2(2,5 .) 3(6,3 .) 4(3,=
-2 .) 5(11,-3 .) 6(13,1 .) 7(3,7 .) T(0,0)
> [ 1743.849731][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1746.230061][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1749.039696][   T91] srcu-torture: rtc: 000000006dc637a8 ver: 18540 tfl=
e: 0 rta: 18541 rtaf: 0 rtf: 18529 rtmbe: 0 rtmbkf: 0/12112 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 198194 onoff: 77/77:81/81 15,65:2,84 2324:255=
5 (HZ=3D100) barrier: 10243/10243:0 read-exits: 1988 nocb-toggles: 0:0
> [ 1749.072316][   T91] srcu-torture: Reader Pipe:  1211555139 22395 0 0 0=
 0 0 0 0 0 0
> [ 1749.073928][   T91] srcu-torture: Reader Batch:  1211530347 47200 0 0 =
0 0 0 0 0 0 0
> [ 1749.075562][   T91] srcu-torture: Free-Block Circulation:  18541 18540=
 18538 18537 18536 18535 18534 18532 18531 18530 0
> [ 1749.077885][   T91] rcu: srcu-torture: Tree SRCU g293497 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-18,-4 .) 1(-20,-7 C) 2(2,5 .) 3(6,3 .) 4(1,=
-1 C) 5(11,-2 C) 6(13,1 .) 7(5,8 C) T(0,3)
> [ 1760.079702][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1760.531274][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1764.399761][   T91] srcu-torture: rtc: 00000000f61f4810 ver: 18704 tfl=
e: 0 rta: 18704 rtaf: 0 rtf: 18695 rtmbe: 0 rtmbkf: 0/12224 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 199797 onoff: 77/77:82/82 15,65:2,84 2324:258=
0 (HZ=3D100) barrier: 10335/10335:0 read-exits: 2005 nocb-toggles: 0:0
> [ 1764.423192][   T91] srcu-torture: Reader Pipe:  1221507720 22554 0 0 0=
 0 0 0 0 0 0
> [ 1764.424536][   T91] srcu-torture: Reader Batch:  1221482756 47534 0 0 =
0 0 0 0 0 0 0
> [ 1764.425884][   T91] srcu-torture: Free-Block Circulation:  18703 18703=
 18702 18701 18700 18699 18698 18697 18696 18695 0
> [ 1764.427791][   T91] rcu: srcu-torture: Tree SRCU g295732 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-18 .) 1(-7,-21 .) 2(5,2 .) 3(3,6 .) 4(-2=
,2 .) 5(-3,12 .) 6(1,13 .) 7(7,4 .) T(0,0)
> [ 1774.249738][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1776.135370][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1779.759708][   T91] srcu-torture: rtc: 00000000370cae2e ver: 18876 tfl=
e: 0 rta: 18877 rtaf: 0 rtf: 18866 rtmbe: 0 rtmbkf: 0/12336 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 201822 onoff: 78/78:83/83 15,65:2,84 2349:260=
4 (HZ=3D100) barrier: 10424/10425:0 read-exits: 2022 nocb-toggles: 0:0
> [ 1779.791279][   T91] srcu-torture: Reader Pipe:  1233858177 22783 0 0 0=
 0 0 0 0 0 0
> [ 1779.792634][   T91] srcu-torture: Reader Batch:  1233833056 47922 0 0 =
0 0 0 0 0 0 0
> [ 1779.794000][   T91] srcu-torture: Free-Block Circulation:  18876 18875=
 18874 18873 18871 18870 18869 18868 18867 18866 0
> [ 1779.795928][   T91] rcu: srcu-torture: Tree SRCU g297733 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-18 .) 1(-7,-20 C) 2(5,2 .) 3(3,6 C) 4(-2=
,2 .) 5(-3,13 .) 6(1,13 .) 7(7,4 .) T(0,2)
> [ 1789.839701][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1790.006409][   T96] rcu_torture_fwd_prog n_max_cbs: 20357
> [ 1790.007583][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1790.009041][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1790.267496][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1790.269911][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1790.306491][   T96] rcu_torture_fwd_prog_cr Duration 11 barrier: 4 pen=
ding 10184 n_launders: 24626 n_launders_sa: 13195 n_max_gps: 100 n_max_cbs:=
 13095 cver 4 gps 21
> [ 1790.309614][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 15 jiffies): 1s/10: 24526:15 2s/10: 13195:9
> [ 1795.119747][   T91] srcu-torture: rtc: 000000006835820d ver: 19025 tfl=
e: 0 rta: 19025 rtaf: 0 rtf: 19016 rtmbe: 0 rtmbkf: 0/12438 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 203421 onoff: 79/79:83/83 15,65:2,84 2378:260=
4 (HZ=3D100) barrier: 10519/10519:0 read-exits: 2039 nocb-toggles: 0:0
> [ 1795.130507][   T91] srcu-torture: Reader Pipe:  1243865540 22984 0 0 0=
 0 0 0 0 0 0
> [ 1795.132419][   T91] srcu-torture: Reader Batch:  1243840185 48358 0 0 =
0 0 0 0 0 0 0
> [ 1795.134086][   T91] srcu-torture: Free-Block Circulation:  19024 19024=
 19023 19022 19021 19020 19019 19018 19017 19016 0
> [ 1795.136396][   T91] rcu: srcu-torture: Tree SRCU g299825 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-18,-4 C) 1(-21,-7 C) 2(2,5 .) 3(5,3 C) 4(2,=
-2 .) 5(13,-3 .) 6(13,1 .) 7(4,7 .) T(0,0)
> [ 1803.839722][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1806.077931][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1810.479744][   T91] srcu-torture: rtc: 00000000bdda06e8 ver: 19238 tfl=
e: 0 rta: 19239 rtaf: 0 rtf: 19226 rtmbe: 0 rtmbkf: 0/12597 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 205973 onoff: 81/81:83/83 15,65:2,84 2461:260=
4 (HZ=3D100) barrier: 10606/10606:0 read-exits: 2056 nocb-toggles: 0:0
> [ 1810.486207][   T91] srcu-torture: Reader Pipe:  1259143699 23369 0 0 0=
 0 0 0 0 0 0
> [ 1810.488154][   T91] srcu-torture: Reader Batch:  1259117976 49108 0 0 =
0 0 0 0 0 0 0
> [ 1810.490137][   T91] srcu-torture: Free-Block Circulation:  19239 19239=
 19238 19237 19236 19235 19234 19233 19231 19228 0
> [ 1810.492957][   T91] rcu: srcu-torture: Tree SRCU g302109 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-5,-16 C) 1(-7,-24 C) 2(5,4 C) 3(3,4 C) 4(-2=
,2 .) 5(-2,15 .) 6(1,13 .) 7(7,6 C) T(0,4)
> [ 1819.680051][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1819.722630][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1825.839703][   T91] srcu-torture: rtc: 00000000eafddcdb ver: 19357 tfl=
e: 0 rta: 19357 rtaf: 0 rtf: 19348 rtmbe: 0 rtmbkf: 0/12695 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 207535 onoff: 81/81:84/84 15,65:2,84 2461:262=
0 (HZ=3D100) barrier: 10694/10695:0 read-exits: 2073 nocb-toggles: 0:0
> [ 1825.846065][   T91] srcu-torture: Reader Pipe:  1268590119 23628 0 0 0=
 0 0 0 0 0 0
> [ 1825.847952][   T91] srcu-torture: Reader Batch:  1268564161 49599 0 0 =
0 0 0 0 0 0 0
> [ 1825.849937][   T91] srcu-torture: Free-Block Circulation:  19356 19356=
 19355 19354 19353 19352 19351 19350 19349 19348 0
> [ 1825.852635][   T91] rcu: srcu-torture: Tree SRCU g303628 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-5,-16 C) 1(-7,-23 C) 2(5,3 .) 3(3,4 C) 4(-2=
,2 .) 5(-2,12 .) 6(1,13 .) 7(7,5 C) T(0,0)
> [ 1833.449769][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1836.122868][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1841.209747][   T91] srcu-torture: rtc: 000000003c9d63c9 ver: 19548 tfl=
e: 0 rta: 19548 rtaf: 0 rtf: 19539 rtmbe: 0 rtmbkf: 0/12844 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 210418 onoff: 82/82:84/85 15,65:2,84 2496:262=
0 (HZ=3D100) barrier: 10779/10779:0 read-exits: 2090 nocb-toggles: 0:0
> [ 1841.225871][   T91] srcu-torture: Reader Pipe:  1284844051 24023 0 0 0=
 0 0 0 0 0 0
> [ 1841.227832][   T91] srcu-torture: Reader Batch:  1284817628 50463 0 0 =
0 0 0 0 0 0 0
> [ 1841.229826][   T91] srcu-torture: Free-Block Circulation:  19547 19547=
 19546 19545 19544 19543 19542 19541 19540 19539 0
> [ 1841.232615][   T91] rcu: srcu-torture: Tree SRCU g305937 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-16,-4 C) 1(-23,-7 C) 2(3,5 .) 3(3,3 C) 4(2,=
-2 .) 5(13,-2 .) 6(13,1 .) 7(5,6 .) T(0,0)
> [ 1849.769694][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1850.059441][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1856.559710][   T96] rcu_torture_fwd_prog n_max_cbs: 13095
> [ 1856.559785][   T91] srcu-torture: rtc: 000000006dc637a8 ver: 19651 tfl=
e: 0 rta: 19652 rtaf: 0 rtf: 19640 rtmbe: 0 rtmbkf: 0/12920 rtbe: 0 rtbke: =
0 rtbre: 0=20
> [ 1856.587877][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1856.587879][   T91] rtbf: 0 rtb: 0 nt: 212055 onoff: 83/83:85/85 15,65=
:2,84 2527:2651 (HZ=3D100)=20
> [ 1856.591401][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1856.593123][   T91] barrier: 10872/10872:0 read-exits: 2107 nocb-toggl=
es: 0:0
> [ 1856.598898][   T91] srcu-torture: Reader Pipe:  1294567464 24237 0 0 0=
 0 0 0 0 0 0
> [ 1856.600890][   T91] srcu-torture: Reader Batch:  1294540812 50905 0 0 =
0 0 0 0 0 0 0
> [ 1856.602898][   T91] srcu-torture: Free-Block Circulation:  19651 19650=
 19649 19648 19646 19645 19643 19642 19641 19640 0
> [ 1856.605692][   T91] rcu: srcu-torture: Tree SRCU g307524 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-15 .) 1(-7,-23 .) 2(5,3 .) 3(3,4 C) 4(-2=
,3 .) 5(-2,14 .) 6(1,14 .) 7(6,5 .) T(0,5)
> [ 1856.760043][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1856.829456][   T96] rcu_torture_fwd_prog_cr Duration 15 barrier: 6 pen=
ding 6413 n_launders: 15700 n_launders_sa: 101 n_max_gps: 100 n_max_cbs: 17=
661 cver 5 gps 55
> [ 1856.833182][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 22 jiffies): 1s/10: 15600:16 2s/10: 17761:41
> [ 1863.689740][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1866.069688][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1871.919827][   T91] srcu-torture: rtc: 000000009aea0d9a ver: 19825 tfl=
e: 0 rta: 19825 rtaf: 0 rtf: 19816 rtmbe: 0 rtmbkf: 0/13063 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 214678 onoff: 83/83:86/86 15,65:2,84 2527:268=
4 (HZ=3D100) barrier: 10957/10958:0 read-exits: 2124 nocb-toggles: 0:0
> [ 1871.931978][   T91] srcu-torture: Reader Pipe:  1309142895 24583 0 0 0=
 0 0 0 0 0 0
> [ 1871.933864][   T91] srcu-torture: Reader Batch:  1309115745 51749 0 0 =
0 0 0 0 0 0 0
> [ 1871.935812][   T91] srcu-torture: Free-Block Circulation:  19824 19824=
 19823 19822 19821 19820 19819 19818 19817 19816 0
> [ 1871.938507][   T91] rcu: srcu-torture: Tree SRCU g309728 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-18,-4 .) 1(-23,-7 .) 2(3,5 .) 3(5,3 C) 4(2,=
-2 .) 5(14,-2 .) 6(12,1 .) 7(5,6 .) T(0,0)
> [ 1879.759702][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1880.019693][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1887.279713][   T91] srcu-torture: rtc: 000000008e3ceab7 ver: 19953 tfl=
e: 0 rta: 19954 rtaf: 0 rtf: 19941 rtmbe: 0 rtmbkf: 0/13158 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 216318 onoff: 84/84:87/87 15,65:2,84 2559:271=
4 (HZ=3D100) barrier: 11044/11045:0 read-exits: 2141 nocb-toggles: 0:0
> [ 1887.285818][   T91] srcu-torture: Reader Pipe:  1318781407 24764 0 0 0=
 0 0 0 0 0 0
> [ 1887.287634][   T91] srcu-torture: Reader Batch:  1318754058 52128 0 0 =
0 0 0 0 0 0 0
> [ 1887.289486][   T91] srcu-torture: Free-Block Circulation:  19953 19952=
 19950 19949 19947 19946 19945 19944 19942 19941 0
> [ 1887.292107][   T91] rcu: srcu-torture: Tree SRCU g311406 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-18,-4 C) 1(-23,-6 C) 2(3,5 .) 3(4,3 C) 4(2,=
-2 .) 5(16,-2 C) 6(12,2 C) 7(5,6 .) T(1,2)
> [ 1893.599705][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1896.109703][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1902.639732][   T91] srcu-torture: rtc: 0000000005e3da4f ver: 20120 tfl=
e: 0 rta: 20120 rtaf: 0 rtf: 20111 rtmbe: 0 rtmbkf: 0/13285 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 218538 onoff: 84/84:88/88 15,65:2,84 2559:274=
9 (HZ=3D100) barrier: 11131/11131:0 read-exits: 2158 nocb-toggles: 0:0
> [ 1902.645875][   T91] srcu-torture: Reader Pipe:  1332191639 25046 0 0 0=
 0 0 0 0 0 0
> [ 1902.648551][   T91] srcu-torture: Reader Batch:  1332164031 52670 0 0 =
0 0 0 0 0 0 0
> [ 1902.651317][   T91] srcu-torture: Free-Block Circulation:  20119 20119=
 20118 20117 20116 20115 20114 20113 20112 20111 0
> [ 1902.656048][   T91] rcu: srcu-torture: Tree SRCU g313292 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-17 .) 1(-7,-23 .) 2(5,3 .) 3(3,4 .) 4(-2=
,2 .) 5(-2,16 .) 6(1,10 .) 7(6,5 .) T(0,0)
> [ 1909.679715][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1910.049703][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1917.999726][   T91] srcu-torture:=20
> [ 1917.999729][   T96] rcu_torture_fwd_prog n_max_cbs: 17661
> [ 1917.999739][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1918.000628][   T91] rtc: 0000000069c139bb ver: 20260 tfle: 0 rta: 2026=
1 rtaf: 0 rtf: 20250=20
> [ 1918.001997][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1918.009244][   T91] rtmbe: 0 rtmbkf: 0/13393 rtbe: 0 rtbke: 0 rtbre: 0=
 rtbf: 0 rtb: 0 nt: 220429 onoff: 86/86:88/88 15,65:2,84 2619:2749 (HZ=3D10=
0) barrier: 11219/11220:0 read-exits: 2175 nocb-toggles: 0:0
> [ 1918.018066][   T91] srcu-torture: Reader Pipe:  1343377825 25280 0 0 0=
 0 0 0 0 0 0
> [ 1918.020021][   T91] srcu-torture: Reader Batch:  1343349961 53161 0 0 =
0 0 0 0 0 0 0
> [ 1918.021957][   T91] srcu-torture: Free-Block Circulation:  20260 20259=
 20258 20257 20256 20255 20254 20252 20251 20250 0
> [ 1918.024688][   T91] rcu: srcu-torture: Tree SRCU g315126 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-15,-4 C) 1(-23,-7 C) 2(1,6 C) 3(4,4 C) 4(2,=
-2 .) 5(16,-1 C) 6(11,1 C) 7(5,6 .) T(1,3)
> [ 1918.300218][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1918.362369][   T96] rcu_torture_fwd_prog_cr Duration 16 barrier: 6 pen=
ding 11966 n_launders: 19982 n_launders_sa: 83 n_max_gps: 100 n_max_cbs: 11=
990 cver 7 gps 25
> [ 1918.366021][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 22 jiffies): 1s/10: 9429:18 2s/10: 20986:10 3s/10: 1557:0
> [ 1923.679740][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1925.902717][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1933.359783][   T91] srcu-torture: rtc: 0000000059fca77c ver: 20392 tfl=
e: 0 rta: 20392 rtaf: 0 rtf: 20383 rtmbe: 0 rtmbkf: 0/13509 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 222794 onoff: 87/87:88/88 15,65:2,84 2661:274=
9 (HZ=3D100) barrier: 11306/11307:0 read-exits: 2192 nocb-toggles: 0:0
> [ 1933.380586][   T91] srcu-torture: Reader Pipe:  1356980469 25624 0 0 0=
 0 0 0 0 0 0
> [ 1933.382814][   T91] srcu-torture: Reader Batch:  1356952193 53914 0 0 =
0 0 0 0 0 0 0
> [ 1933.385025][   T91] srcu-torture: Free-Block Circulation:  20391 20391=
 20390 20389 20388 20387 20386 20385 20384 20383 0
> [ 1933.388139][   T91] rcu: srcu-torture: Tree SRCU g316868 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-17 .) 1(-7,-22 C) 2(5,1 .) 3(3,0 .) 4(-2=
,2 .) 5(-2,17 .) 6(1,12 .) 7(6,7 .) T(0,0)
> [ 1938.479854][   T57] kworker/dying (57) used greatest stack depth: 9168=
 bytes left
> [ 1939.519746][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1939.739791][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1948.719743][   T91] srcu-torture: rtc: 00000000f7aaffbe ver: 20580 tfl=
e: 0 rta: 20581 rtaf: 0 rtf: 20567 rtmbe: 0 rtmbkf: 0/13665 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 225165 onoff: 87/87:89/89 15,65:2,84 2661:279=
5 (HZ=3D100) barrier: 11398/11398:0 read-exits: 2209 nocb-toggles: 0:0
> [ 1948.752480][   T91] srcu-torture: Reader Pipe:  1370401085 26126 0 0 0=
 0 0 0 0 0 0
> [ 1948.754428][   T91] srcu-torture: Reader Batch:  1370372417 54806 0 0 =
0 0 0 0 0 0 0
> [ 1948.756395][   T91] srcu-torture: Free-Block Circulation:  20580 20577=
 20575 20574 20573 20572 20571 20570 20569 20567 0
> [ 1948.759175][   T91] rcu: srcu-torture: Tree SRCU g318902 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-13,-4 C) 1(-22,-7 C) 2(1,6 C) 3(-1,6 C) 4(2=
,-2 .) 5(17,-1 .) 6(11,-1 C) 7(6,8 C) T(1,5)
> [ 1953.529732][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1955.951490][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1964.079761][   T91] srcu-torture: rtc: 00000000b849514e ver: 20714 tfl=
e: 0 rta: 20714 rtaf: 0 rtf: 20705 rtmbe: 0 rtmbkf: 0/13768 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 227166 onoff: 87/87:91/91 15,65:2,84 2661:288=
6 (HZ=3D100) barrier: 11482/11482:0 read-exits: 2226 nocb-toggles: 0:0
> [ 1964.089861][   T91] srcu-torture: Reader Pipe:  1381638139 26420 0 0 0=
 0 0 0 0 0 0
> [ 1964.091463][   T91] srcu-torture: Reader Batch:  1381609189 55382 0 0 =
0 0 0 0 0 0 0
> [ 1964.093048][   T91] srcu-torture: Free-Block Circulation:  20713 20713=
 20712 20711 20710 20709 20708 20707 20706 20705 0
> [ 1964.095304][   T91] rcu: srcu-torture: Tree SRCU g320617 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-14,-4 C) 1(-21,-7 C) 2(2,5 .) 3(-2,4 C) 4(2=
,-2 .) 5(17,-1 .) 6(11,-1 .) 7(5,6 .) T(0,0)
> [ 1969.519699][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1969.909696][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1979.439712][   T91] srcu-torture: rtc: 00000000a07ac335 ver: 20912 tfl=
e: 0 rta: 20913 rtaf: 0 rtf: 20899 rtmbe: 0 rtmbkf: 0/13914 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 229250 onoff: 87/87:92/92 15,65:2,84 2661:291=
3 (HZ=3D100) barrier: 11573/11574:0 read-exits: 2243 nocb-toggles: 0:0
> [ 1979.444566][   T91] srcu-torture: Reader Pipe:  1395159656 26658 0 0 0=
 0 0 0 0 0 0
> [ 1979.446033][   T91] srcu-torture: Reader Batch:  1395130423 55904 0 0 =
0 0 0 0 0 0 0
> [ 1979.447507][   T91] srcu-torture: Free-Block Circulation:  20912 20911=
 20910 20908 20905 20903 20902 20901 20900 20899 0
> [ 1979.449592][   T91] rcu: srcu-torture: Tree SRCU g323070 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-15,-2 C) 1(-21,-9 C) 2(2,5 .) 3(-1,6 C) 4(2=
,-2 .) 5(17,-1 .) 6(11,-1 .) 7(6,6 .) T(1,2)
> [ 1980.079702][   T96] rcu_torture_fwd_prog n_max_cbs: 11990
> [ 1980.080773][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 1980.082068][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 1980.344268][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 1980.423295][   T96] rcu_torture_fwd_prog_cr Duration 24 barrier: 8 pen=
ding 24084 n_launders: 52017 n_launders_sa: 44103 n_max_gps: 100 n_max_cbs:=
 36059 cver 5 gps 7
> [ 1980.452718][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 35 jiffies): 1s/10: 7914:3 2s/10: 36057:2 3s/10: 44105:4
> [ 1983.529727][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1986.009946][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 1994.799747][   T91] srcu-torture: rtc: 000000007a735a8b ver: 21058 tfl=
e: 0 rta: 21058 rtaf: 0 rtf: 21049 rtmbe: 0 rtmbkf: 0/14010 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 230693 onoff: 88/88:93/93 15,65:2,84 2689:294=
6 (HZ=3D100) barrier: 11661/11662:0 read-exits: 2260 nocb-toggles: 0:0
> [ 1994.808809][   T91] srcu-torture: Reader Pipe:  1403517617 26807 0 0 0=
 0 0 0 0 0 0
> [ 1994.810298][   T91] srcu-torture: Reader Batch:  1403488207 56230 0 0 =
0 0 0 0 0 0 0
> [ 1994.811765][   T91] srcu-torture: Free-Block Circulation:  21057 21057=
 21056 21055 21054 21053 21052 21051 21050 21049 0
> [ 1994.813827][   T91] rcu: srcu-torture: Tree SRCU g324932 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-2,-15 C) 1(-9,-21 .) 2(5,2 .) 3(4,-2 .) 4(-=
2,2 .) 5(-1,17 .) 6(-1,11 .) 7(6,6 .) T(0,0)
> [ 1999.609703][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 1999.649855][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2010.159730][   T91] srcu-torture: rtc: 00000000fec76d06 ver: 21264 tfl=
e: 0 rta: 21265 rtaf: 0 rtf: 21255 rtmbe: 0 rtmbkf: 0/14141 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 232349 onoff: 88/88:94/94 15,65:2,84 2689:296=
6 (HZ=3D100) barrier: 11748/11748:0 read-exits: 2277 nocb-toggles: 0:0
> [ 2010.190220][   T91] srcu-torture: Reader Pipe:  1414354347 26959 0 0 0=
 0 0 0 0 0 0
> [ 2010.191567][   T91] srcu-torture: Reader Batch:  1414324745 56573 0 0 =
0 0 0 0 0 0 0
> [ 2010.192921][   T91] srcu-torture: Free-Block Circulation:  21264 21263=
 21262 21261 21260 21259 21258 21257 21256 21255 0
> [ 2010.194842][   T91] rcu: srcu-torture: Tree SRCU g327449 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-16,0 C) 1(-21,-9 .) 2(2,5 .) 3(-1,4 C) 4(2,=
-2 .) 5(17,-1 .) 6(11,-1 .) 7(6,6 .) T(0,2)
> [ 2013.519702][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2016.089696][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2025.519713][   T91] srcu-torture: rtc: 00000000f936b76b ver: 21377 tfl=
e: 0 rta: 21377 rtaf: 0 rtf: 21368 rtmbe: 0 rtmbkf: 0/14219 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 233609 onoff: 89/89:95/95 15,65:2,84 2712:298=
9 (HZ=3D100) barrier: 11843/11844:0 read-exits: 2294 nocb-toggles: 0:0
> [ 2025.523035][   T91] srcu-torture: Reader Pipe:  1422492884 27073 0 0 0=
 0 0 0 0 0 0
> [ 2025.523858][   T91] srcu-torture: Reader Batch:  1422463132 56837 0 0 =
0 0 0 0 0 0 0
> [ 2025.524622][   T91] srcu-torture: Free-Block Circulation:  21376 21376=
 21375 21374 21373 21372 21371 21370 21369 21368 0
> [ 2025.525713][   T91] rcu: srcu-torture: Tree SRCU g329252 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-2,-16 .) 1(-9,-21 .) 2(5,2 .) 3(4,-1 C) 4(-=
2,2 .) 5(-1,17 .) 6(-1,11 .) 7(6,6 .) T(0,0)
> [ 2029.679724][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2029.765638][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2040.879745][   T91] srcu-torture: rtc: 00000000150a4371 ver: 21610 tfl=
e: 0 rta: 21611 rtaf: 0 rtf: 21599 rtmbe: 0 rtmbkf: 0/14358 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 235432 onoff: 90/90:95/95 15,65:2,84 2736:298=
9 (HZ=3D100) barrier: 11929/11929:0 read-exits: 2311 nocb-toggles: 0:0
> [ 2040.916173][   T91] srcu-torture: Reader Pipe:  1433920907 27234 0 0 0=
 0 0 0 0 0 0
> [ 2040.917522][   T91] srcu-torture: Reader Batch:  1433891006 57152 0 0 =
0 0 0 0 0 0 0
> [ 2040.918893][   T91] srcu-torture: Free-Block Circulation:  21610 21609=
 21607 21606 21605 21604 21603 21602 21601 21599 0
> [ 2040.920837][   T91] rcu: srcu-torture: Tree SRCU g331901 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-2,-16 .) 1(-9,-21 .) 2(5,2 .) 3(4,0 C) 4(-2=
,3 C) 5(-1,17 .) 6(-1,10 C) 7(6,6 .) T(0,1)
> [ 2043.359725][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2045.999709][   T96] rcu_torture_fwd_prog n_max_cbs: 36059
> [ 2046.026589][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 2046.027785][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 2046.120005][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2046.306735][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 2046.347040][   T96] rcu_torture_fwd_prog_cr Duration 16 barrier: 4 pen=
ding 7542 n_launders: 36935 n_launders_sa: 22978 n_max_gps: 100 n_max_cbs: =
22878 cver 1 gps 8
> [ 2046.349456][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 20 jiffies): 1s/10: 13958:3 2s/10: 45855:7
> [ 2056.239710][   T91] srcu-torture: rtc: 0000000002cc6af3 ver: 21743 tfl=
e: 0 rta: 21744 rtaf: 0 rtf: 21732 rtmbe: 0 rtmbkf: 0/14425 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 236349 onoff: 90/90:96/96 15,65:2,84 2736:302=
4 (HZ=3D100) barrier: 12023/12024:0 read-exits: 2328 nocb-toggles: 0:0
> [ 2056.243967][   T91] srcu-torture: Reader Pipe:  1440040377 27288 0 0 0=
 0 0 0 0 0 0
> [ 2056.245236][   T91] srcu-torture: Reader Batch:  1440010429 57253 0 0 =
0 0 0 0 0 0 0
> [ 2056.246794][   T91] srcu-torture: Free-Block Circulation:  21743 21742=
 21741 21740 21739 21738 21736 21735 21733 21732 0
> [ 2056.248623][   T91] rcu: srcu-torture: Tree SRCU g333837 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-2,-16 .) 1(-9,-21 .) 2(5,2 .) 3(4,0 C) 4(-2=
,3 .) 5(-1,17 .) 6(-1,10 C) 7(6,6 .) T(0,1)
> [ 2059.759699][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2060.039694][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2071.609746][   T91] srcu-torture: rtc: 00000000d1a39714 ver: 21931 tfl=
e: 0 rta: 21931 rtaf: 0 rtf: 21922 rtmbe: 0 rtmbkf: 0/14558 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 238408 onoff: 92/92:96/96 15,65:2,84 2791:302=
4 (HZ=3D100) barrier: 12108/12108:0 read-exits: 2345 nocb-toggles: 0:0
> [ 2071.616630][   T91] srcu-torture: Reader Pipe:  1452691988 27485 0 0 0=
 0 0 0 0 0 0
> [ 2071.618696][   T91] srcu-torture: Reader Batch:  1452661795 57696 0 0 =
0 0 0 0 0 0 0
> [ 2071.620800][   T91] srcu-torture: Free-Block Circulation:  21930 21930=
 21929 21928 21927 21926 21925 21924 21923 21922 0
> [ 2071.651260][   T91] rcu: srcu-torture: Tree SRCU g336128 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-16,-2 .) 1(-21,-9 .) 2(4,4 .) 3(0,5 .) 4(3,=
-2 .) 5(17,-1 .) 6(7,-1 .) 7(6,6 .) T(0,0)
> [ 2073.599763][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2076.029962][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2086.959727][   T91] srcu-torture: rtc: 00000000546bf1e1 ver: 22043 tfl=
e: 0 rta: 22044 rtaf: 0 rtf: 22032 rtmbe: 0 rtmbkf: 0/14637 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 239938 onoff: 93/93:96/96 15,65:2,84 2820:302=
4 (HZ=3D100) barrier: 12197/12198:0 read-exits: 2362 nocb-toggles: 0:0
> [ 2086.967609][   T91] srcu-torture: Reader Pipe:  1461889834 27636 0 0 0=
 0 0 0 0 0 0
> [ 2086.969490][   T91] srcu-torture: Reader Batch:  1461859443 58044 0 0 =
0 0 0 0 0 0 0
> [ 2086.971406][   T91] srcu-torture: Free-Block Circulation:  22043 22041=
 22040 22039 22038 22037 22036 22035 22033 22032 0
> [ 2086.974623][   T91] rcu: srcu-torture: Tree SRCU g337782 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-14,-4 C) 1(-21,-6 C) 2(3,4 C) 3(0,5 C) 4(3,=
-2 .) 5(17,-1 .) 6(7,-1 .) 7(6,6 .) T(1,1)
> [ 2089.599885][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2089.799873][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2102.329771][   T91] srcu-torture: rtc: 00000000045822a1 ver: 22202 tfl=
e: 0 rta: 22202 rtaf: 0 rtf: 22193 rtmbe: 0 rtmbkf: 0/14771 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 242419 onoff: 94/94:97/97 15,65:2,84 2859:309=
5 (HZ=3D100) barrier: 12279/12279:0 read-exits: 2379 nocb-toggles: 0:0
> [ 2102.343146][   T91] srcu-torture: Reader Pipe:  1476099480 27969 0 0 0=
 0 0 0 0 0 0
> [ 2102.345019][   T91] srcu-torture: Reader Batch:  1476068808 58658 0 0 =
0 0 0 0 0 0 0
> [ 2102.346930][   T91] srcu-torture: Free-Block Circulation:  22201 22201=
 22200 22199 22198 22197 22196 22195 22194 22193 0
> [ 2102.349605][   T91] rcu: srcu-torture: Tree SRCU g339572 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-16 .) 1(-6,-20 .) 2(2,3 .) 3(4,-1 .) 4(-=
2,3 .) 5(-1,17 .) 6(-1,7 .) 7(8,7 .) T(0,0)
> [ 2103.689762][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2106.009696][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2107.439721][   T96] rcu_torture_fwd_prog n_max_cbs: 22878
> [ 2107.466654][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 2107.468279][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 2108.195994][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 2108.302487][   T96] rcu_torture_fwd_prog_cr Duration 51 barrier: 11 pe=
nding 20449 n_launders: 87176 n_launders_sa: 87176 n_max_gps: 100 n_max_cbs=
: 50000 cver 11 gps 260
> [ 2108.331106][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 65 jiffies): 1s/10: 0:-1984 2s/10: 0:7 3s/10: 24670:1981 4=
s/10: 53704:206 5s/10: 34864:49 6s/10: 23938:4
> [ 2117.679728][   T91] srcu-torture: rtc: 0000000005e3da4f ver: 22341 tfl=
e: 0 rta: 22342 rtaf: 0 rtf: 22329 rtmbe: 0 rtmbkf: 0/14887 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 244362 onoff: 95/95:97/97 15,65:2,84 2890:309=
5 (HZ=3D100) barrier: 12367/12368:0 read-exits: 2396 nocb-toggles: 0:0
> [ 2117.686245][   T91] srcu-torture: Reader Pipe:  1487354887 28237 0 0 0=
 0 0 0 0 0 0
> [ 2117.688200][   T91] srcu-torture: Reader Batch:  1487323676 59464 0 0 =
0 0 0 0 0 0 0
> [ 2117.690231][   T91] srcu-torture: Free-Block Circulation:  22341 22340=
 22339 22338 22337 22336 22335 22334 22330 22329 0
> [ 2117.693014][   T91] rcu: srcu-torture: Tree SRCU g342241 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-17,-3 C) 1(-21,-4 C) 2(3,2 C) 3(0,4 C) 4(3,=
-2 .) 5(17,-1 C) 6(7,-1 .) 7(8,8 .) T(0,3)
> [ 2119.599890][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2119.801243][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2133.039787][   T91] srcu-torture: rtc: 0000000028d3d39d ver: 22494 tfl=
e: 0 rta: 22494 rtaf: 0 rtf: 22485 rtmbe: 0 rtmbkf: 0/15013 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 246657 onoff: 95/95:98/99 15,65:2,84 2890:312=
6 (HZ=3D100) barrier: 12455/12456:0 read-exits: 2413 nocb-toggles: 0:0
> [ 2133.050801][   T91] srcu-torture: Reader Pipe:  1500647162 28528 0 0 0=
 0 0 0 0 0 0
> [ 2133.052744][   T91] srcu-torture: Reader Batch:  1500615556 60149 0 0 =
0 0 0 0 0 0 0
> [ 2133.054733][   T91] srcu-torture: Free-Block Circulation:  22493 22493=
 22492 22491 22490 22489 22488 22487 22486 22485 0
> [ 2133.057363][   T91] rcu: srcu-torture: Tree SRCU g344252 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-17 C) 1(-6,-21 .) 2(2,2 .) 3(4,0 .) 4(-2=
,3 .) 5(-1,17 .) 6(-1,7 .) 7(8,9 .) T(0,0)
> [ 2133.519709][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2135.973664][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2148.399811][   T91] srcu-torture: rtc: 00000000b12ce405 ver: 22660 tfl=
e: 0 rta: 22660 rtaf: 0 rtf: 22646 rtmbe: 0 rtmbkf: 0/15133 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 248485 onoff: 95/95:100/100 15,65:2,84 2890:3=
184 (HZ=3D100) barrier: 12547/12547:0 read-exits: 2430 nocb-toggles: 0:0
> [ 2148.430004][   T91] srcu-torture: Reader Pipe:  1511552456 28736 0 0 0=
 0 0 0 0 0 0
> [ 2148.431460][   T91] srcu-torture: Reader Batch:  1511520639 60569 0 0 =
0 0 0 0 0 0 0
> [ 2148.432926][   T91] srcu-torture: Free-Block Circulation:  22660 22659=
 22658 22656 22655 22652 22650 22648 22647 22646 0
> [ 2148.434998][   T91] rcu: srcu-torture: Tree SRCU g346237 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-18 C) 1(-6,-21 C) 2(2,2 .) 3(4,0 .) 4(-2=
,3 .) 5(-1,20 C) 6(-1,7 .) 7(8,9 .) T(0,2)
> [ 2149.609788][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2149.960909][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2163.529793][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2163.759746][   T91] srcu-torture: rtc: 000000006835820d ver: 22813 tfl=
e: 0 rta: 22813 rtaf: 0 rtf: 22804 rtmbe: 0 rtmbkf: 0/15241 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 250228 onoff: 96/96:100/100 15,65:2,84 2922:3=
184 (HZ=3D100) barrier: 12636/12636:0 read-exits: 2448 nocb-toggles: 0:0
> [ 2163.763847][   T91] srcu-torture: Reader Pipe:  1522519415 28944 0 0 0=
 0 0 0 0 0 0
> [ 2163.765062][   T91] srcu-torture: Reader Batch:  1522487397 60980 0 0 =
0 0 0 0 0 0 0
> [ 2163.766302][   T91] srcu-torture: Free-Block Circulation:  22812 22812=
 22811 22810 22809 22808 22807 22806 22805 22804 0
> [ 2163.768015][   T91] rcu: srcu-torture: Tree SRCU g348108 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-19 .) 1(-6,-21 .) 2(2,2 .) 3(4,0 .) 4(-2=
,3 .) 5(-1,18 .) 6(-1,8 .) 7(8,9 .) T(0,0)
> [ 2165.949934][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2169.439827][   T96] rcu_torture_fwd_prog n_max_cbs: 50000
> [ 2169.440836][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 2169.442051][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 2169.558558][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 2169.622027][   T96] rcu_torture_fwd_prog_cr Duration 9 barrier: 7 pend=
ing 7110 n_launders: 23047 n_launders_sa: 16182 n_max_gps: 100 n_max_cbs: 1=
6082 cver 4 gps 555
> [ 2169.624619][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 16 jiffies): 1s/10: 32019:555 2s/10: 7110:2
> [ 2179.119754][   T91] srcu-torture: rtc: 000000006835820d ver: 23009 tfl=
e: 0 rta: 23010 rtaf: 0 rtf: 22995 rtmbe: 0 rtmbkf: 0/15345 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 251967 onoff: 97/97:101/101 15,65:2,84 2949:3=
211 (HZ=3D100) barrier: 12727/12727:0 read-exits: 2464 nocb-toggles: 0:0
> [ 2179.162943][   T91] srcu-torture: Reader Pipe:  1533614919 29117 0 0 0=
 0 0 0 0 0 0
> [ 2179.164552][   T91] srcu-torture: Reader Batch:  1533582768 61286 0 0 =
0 0 0 0 0 0 0
> [ 2179.166168][   T91] srcu-torture: Free-Block Circulation:  23010 23009=
 23008 23007 23005 23000 22999 22998 22997 22996 0
> [ 2179.168453][   T91] rcu: srcu-torture: Tree SRCU g352621 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-19 .) 1(-6,-22 C) 2(2,2 .) 3(4,0 .) 4(-2=
,3 .) 5(-1,20 C) 6(-1,9 C) 7(8,10 C) T(0,3)
> [ 2179.599737][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2179.940424][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2193.519717][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2194.479840][   T91] srcu-torture: rtc: 00000000317bf893 ver: 23179 tfl=
e: 0 rta: 23179 rtaf: 0 rtf: 23170 rtmbe: 0 rtmbkf: 0/15456 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 253695 onoff: 97/97:102/102 15,65:2,84 2949:3=
251 (HZ=3D100) barrier: 12820/12820:0 read-exits: 2482 nocb-toggles: 0:0
> [ 2194.487476][   T91] srcu-torture: Reader Pipe:  1544006626 29366 0 0 0=
 0 0 0 0 0 0
> [ 2194.489141][   T91] srcu-torture: Reader Batch:  1543974285 61725 0 0 =
0 0 0 0 0 0 0
> [ 2194.490532][   T91] srcu-torture: Free-Block Circulation:  23178 23178=
 23177 23176 23175 23174 23173 23172 23171 23170 0
> [ 2194.492458][   T91] rcu: srcu-torture: Tree SRCU g354677 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-19 .) 1(-6,-22 C) 2(2,2 .) 3(4,0 .) 4(-2=
,3 .) 5(-1,19 .) 6(-1,9 .) 7(8,8 C) T(0,0)
> [ 2195.840738][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2209.439849][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2209.481313][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2209.839725][   T91] srcu-torture: rtc: 000000003580f680 ver: 23391 tfl=
e: 0 rta: 23392 rtaf: 0 rtf: 23381 rtmbe: 0 rtmbkf: 0/15606 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 255922 onoff: 99/99:102/102 15,65:2,84 3016:3=
251 (HZ=3D100) barrier: 12913/12914:0 read-exits: 2515 nocb-toggles: 0:0
> [ 2209.871033][   T91] srcu-torture: Reader Pipe:  1557622365 29635 0 0 0=
 0 0 0 0 0 0
> [ 2209.872884][   T91] srcu-torture: Reader Batch:  1557589733 62281 0 0 =
0 0 0 0 0 0 0
> [ 2209.874730][   T91] srcu-torture: Free-Block Circulation:  23391 23390=
 23389 23388 23387 23385 23384 23383 23382 23381 0
> [ 2209.877357][   T91] rcu: srcu-torture: Tree SRCU g357169 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-19,-4 .) 1(-22,-6 .) 2(1,2 C) 3(0,4 .) 4(2,=
-1 C) 5(20,1 C) 6(9,-1 .) 7(9,10 C) T(0,5)
> [ 2223.039755][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2225.209749][   T91] srcu-torture: rtc: 0000000043b9d111 ver: 23497 tfl=
e: 0 rta: 23497 rtaf: 0 rtf: 23488 rtmbe: 0 rtmbkf: 0/15684 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 257587 onoff: 99/99:103/103 15,65:2,84 3016:3=
280 (HZ=3D100) barrier: 13001/13001:0 read-exits: 2516 nocb-toggles: 0:0
> [ 2225.226385][   T91] srcu-torture: Reader Pipe:  1567107695 29821 0 0 0=
 0 0 0 0 0 0
> [ 2225.228007][   T91] srcu-torture: Reader Batch:  1567074832 62697 0 0 =
0 0 0 0 0 0 0
> [ 2225.229648][   T91] srcu-torture: Free-Block Circulation:  23496 23496=
 23495 23494 23493 23492 23491 23490 23489 23488 0
> [ 2225.231977][   T91] rcu: srcu-torture: Tree SRCU g358709 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-19 .) 1(-6,-23 C) 2(2,1 C) 3(4,0 .) 4(-2=
,2 .) 5(-1,21 C) 6(-1,9 .) 7(8,9 .) T(0,0)
> [ 2226.139724][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2231.069702][   T96] rcu_torture_fwd_prog n_max_cbs: 16082
> [ 2231.071466][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 2231.073679][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 2231.197381][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 2231.253827][   T96] rcu_torture_fwd_prog_cr Duration 12 barrier: 5 pen=
ding 23059 n_launders: 56846 n_launders_sa: 22009 n_max_gps: 100 n_max_cbs:=
 35180 cver 0 gps 2623
> [ 2231.279280][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 20 jiffies): 1s/10: 34838:171 2s/10: 57188:2453
> [ 2239.759696][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2240.589841][   T91] srcu-torture: rtc: 00000000370cae2e ver: 23683 tfl=
e: 0 rta: 23684 rtaf: 0 rtf: 23674 rtmbe: 0 rtmbkf: 0/15816 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 259596 onoff: 99/99:104/104 15,65:2,84 3016:3=
308 (HZ=3D100) barrier: 13082/13083:0 read-exits: 2542 nocb-toggles: 0:0
> [ 2240.594548][   T91] srcu-torture: Reader Pipe:  1578783267 30031 0 0 0=
 0 0 0 0 0 0
> [ 2240.596057][   T91] srcu-torture: Reader Batch:  1578750202 63110 0 0 =
0 0 0 0 0 0 0
> [ 2240.597472][   T91] srcu-torture: Free-Block Circulation:  23683 23682=
 23681 23680 23679 23678 23677 23676 23675 23674 0
> [ 2240.599460][   T91] rcu: srcu-torture: Tree SRCU g371326 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-19,-4 .) 1(-23,-6 .) 2(3,2 .) 3(0,4 .) 4(2,=
-2 .) 5(21,-1 C) 6(9,-1 .) 7(8,8 C) T(1,0)
> [ 2240.699693][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2254.399711][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2255.919715][   T91] srcu-torture: rtc: 00000000d8c0045d ver: 23766 tfl=
e: 0 rta: 23767 rtaf: 0 rtf: 23752 rtmbe: 0 rtmbkf: 0/15870 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 260712 onoff: 100/100:105/105 15,65:2,84 3046=
:3338 (HZ=3D100) barrier: 13172/13172:0 read-exits: 2554 nocb-toggles: 0:0
> [ 2255.949211][   T91] srcu-torture: Reader Pipe:  1585319872 30131 0 0 0=
 0 0 0 0 0 0
> [ 2255.950582][   T91] srcu-torture: Reader Batch:  1585286702 63315 0 0 =
0 0 0 0 0 0 0
> [ 2255.951940][   T91] srcu-torture: Free-Block Circulation:  23766 23765=
 23764 23762 23757 23756 23755 23754 23753 23752 0
> [ 2255.953891][   T91] rcu: srcu-torture: Tree SRCU g372749 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-19 .) 1(-6,-23 .) 2(2,1 C) 3(4,0 .) 4(-2=
,3 .) 5(-1,21 C) 6(-1,9 .) 7(8,9 .) T(0,1)
> [ 2256.079734][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2269.679695][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2269.870161][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2271.279713][   T91] srcu-torture: rtc: 00000000a797307d ver: 23995 tfl=
e: 0 rta: 23995 rtaf: 0 rtf: 23986 rtmbe: 0 rtmbkf: 0/16026 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 263127 onoff: 101/101:105/105 15,65:2,84 3072=
:3338 (HZ=3D100) barrier: 13263/13263:0 read-exits: 2583 nocb-toggles: 0:0
> [ 2271.288902][   T91] srcu-torture: Reader Pipe:  1600171302 30397 0 0 0=
 0 0 0 0 0 0
> [ 2271.290553][   T91] srcu-torture: Reader Batch:  1600137826 63884 0 0 =
0 0 0 0 0 0 0
> [ 2271.292180][   T91] srcu-torture: Free-Block Circulation:  23994 23994=
 23993 23992 23991 23990 23989 23988 23987 23986 0
> [ 2271.294466][   T91] rcu: srcu-torture: Tree SRCU g375496 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-19,-4 .) 1(-23,-6 .) 2(2,2 .) 3(0,4 .) 4(3,=
-2 .) 5(19,-1 .) 6(9,-1 .) 7(9,8 .) T(0,0)
> [ 2283.439731][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2285.930290][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2286.639704][   T91] srcu-torture: rtc: 000000000b748fe9 ver: 24133 tfl=
e: 0 rta: 24134 rtaf: 0 rtf: 24120 rtmbe: 0 rtmbkf: 0/16111 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 264372 onoff: 102/102:106/106 15,65:2,84 3103=
:3363 (HZ=3D100) barrier: 13357/13357:0 read-exits: 2600 nocb-toggles: 0:0
> [ 2286.646789][   T91] srcu-torture: Reader Pipe:  1608363148 30536 0 0 0=
 0 0 0 0 0 0
> [ 2286.648795][   T91] srcu-torture: Reader Batch:  1608329554 64141 0 0 =
0 0 0 0 0 0 0
> [ 2286.650468][   T91] srcu-torture: Free-Block Circulation:  24133 24131=
 24130 24128 24127 24125 24124 24123 24122 24120 0
> [ 2286.652788][   T91] rcu: srcu-torture: Tree SRCU g377398 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-19,-3 C) 1(-22,-5 C) 2(2,2 .) 3(0,4 .) 4(3,=
-2 .) 5(19,1 C) 6(9,-1 .) 7(9,8 C) T(1,4)
> [ 2296.239701][   T96] rcu_torture_fwd_prog n_max_cbs: 35180
> [ 2296.240910][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 2296.242304][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 2296.729503][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 2296.858103][   T96] rcu_torture_fwd_prog_cr Duration 43 barrier: 13 pe=
nding 43333 n_launders: 100099 n_launders_sa: 100099 n_max_gps: 100 n_max_c=
bs: 50000 cver 8 gps 179
> [ 2296.861755][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 57 jiffies): 1s/10: 0:-4552 2s/10: 40793:4640 3s/10: 42808=
:85 4s/10: 23165:6 5s/10: 32706:4 6s/10: 10627:2
> [ 2299.519762][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2299.680718][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2301.999750][   T91] srcu-torture: rtc: 00000000c0f17644 ver: 24336 tfl=
e: 0 rta: 24336 rtaf: 0 rtf: 24327 rtmbe: 0 rtmbkf: 0/16262 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 266660 onoff: 103/103:106/106 15,65:2,84 3139=
:3363 (HZ=3D100) barrier: 13443/13444:0 read-exits: 2617 nocb-toggles: 0:0
> [ 2302.010389][   T91] srcu-torture: Reader Pipe:  1622271126 30850 0 0 0=
 0 0 0 0 0 0
> [ 2302.012259][   T91] srcu-torture: Reader Batch:  1622237059 64928 0 0 =
0 0 0 0 0 0 0
> [ 2302.014186][   T91] srcu-torture: Free-Block Circulation:  24335 24335=
 24334 24333 24332 24331 24330 24329 24328 24327 0
> [ 2302.016860][   T91] rcu: srcu-torture: Tree SRCU g380352 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-22,-4 .) 1(-22,-5 C) 2(2,2 .) 3(0,4 .) 4(3,=
-2 .) 5(19,-1 .) 6(9,-1 .) 7(11,7 .) T(0,0)
> [ 2313.279721][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2316.019812][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2317.359710][   T91] srcu-torture: rtc: 00000000dfdc71a5 ver: 24437 tfl=
e: 0 rta: 24438 rtaf: 0 rtf: 24428 rtmbe: 0 rtmbkf: 0/16350 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 268498 onoff: 104/104:106/106 15,65:2,84 3179=
:3363 (HZ=3D100) barrier: 13529/13529:0 read-exits: 2634 nocb-toggles: 0:0
> [ 2317.366310][   T91] srcu-torture: Reader Pipe:  1632647275 31091 0 0 0=
 0 0 0 0 0 0
> [ 2317.368264][   T91] srcu-torture: Reader Batch:  1632612992 65389 0 0 =
0 0 0 0 0 0 0
> [ 2317.370278][   T91] srcu-torture: Free-Block Circulation:  24437 24437=
 24436 24435 24434 24433 24432 24431 24430 24429 0
> [ 2317.373045][   T91] rcu: srcu-torture: Tree SRCU g381749 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-4,-22 .) 1(-5,-22 C) 2(2,4 C) 3(4,-1 C) 4(-=
2,3 .) 5(-1,20 C) 6(-1,9 .) 7(7,12 C) T(0,3)
> [ 2329.919713][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2330.010895][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2332.729808][   T91] srcu-torture: rtc: 00000000f936b76b ver: 24579 tfl=
e: 0 rta: 24579 rtaf: 0 rtf: 24570 rtmbe: 0 rtmbkf: 0/16478 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 270958 onoff: 105/105:107/107 15,65:2,84 3237=
:3404 (HZ=3D100) barrier: 13615/13616:0 read-exits: 2651 nocb-toggles: 0:0
> [ 2332.745033][   T91] srcu-torture: Reader Pipe:  1646842245 31424 0 0 0=
 0 0 0 0 0 0
> [ 2332.747014][   T91] srcu-torture: Reader Batch:  1646807512 66172 0 0 =
0 0 0 0 0 0 0
> [ 2332.749019][   T91] srcu-torture: Free-Block Circulation:  24578 24578=
 24577 24576 24575 24574 24573 24572 24571 24570 0
> [ 2332.751824][   T91] rcu: srcu-torture: Tree SRCU g383564 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-5,-23 .) 1(-5,-21 C) 2(2,2 .) 3(4,1 .) 4(-2=
,3 .) 5(-1,19 .) 6(-1,9 .) 7(8,10 .) T(0,0)
> [ 2343.679735][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2345.866922][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2348.079740][   T91] srcu-torture: rtc: 00000000ad27e618 ver: 24750 tfl=
e: 0 rta: 24751 rtaf: 0 rtf: 24739 rtmbe: 0 rtmbkf: 0/16607 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 273038 onoff: 105/105:108/108 15,65:2,84 3237=
:3456 (HZ=3D100) barrier: 13705/13705:0 read-exits: 2668 nocb-toggles: 0:0
> [ 2348.091187][   T91] srcu-torture: Reader Pipe:  1659352907 31786 0 0 0=
 0 0 0 0 0 0
> [ 2348.093101][   T91] srcu-torture: Reader Batch:  1659317860 66847 0 0 =
0 0 0 0 0 0 0
> [ 2348.095012][   T91] srcu-torture: Free-Block Circulation:  24750 24749=
 24748 24746 24745 24744 24743 24742 24740 24739 0
> [ 2348.098030][   T91] rcu: srcu-torture: Tree SRCU g385558 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-24,-5 C) 1(-21,-4 C) 2(2,2 C) 3(1,4 .) 4(4,=
-2 C) 5(19,-1 .) 6(9,-1 .) 7(10,9 C) T(0,2)
> [ 2358.319707][   T96] rcu_torture_fwd_prog n_max_cbs: 50000
> [ 2358.321180][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 2358.322883][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 2358.509721][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 2358.737818][   T96] rcu_torture_fwd_prog_cr Duration 17 barrier: 22 pe=
nding 11241 n_launders: 11051 n_launders_sa: 199 n_max_gps: 100 n_max_cbs: =
21628 cver 2 gps 6
> [ 2358.743385][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 40 jiffies): 1s/10: 10853:4 2s/10: 21621:3 3s/10: 0:-1918 =
4s/10: 205:1919
> [ 2359.439713][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2359.522630][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2363.439702][   T91] srcu-torture: rtc: 00000000e3e16f92 ver: 24919 tfl=
e: 0 rta: 24919 rtaf: 0 rtf: 24910 rtmbe: 0 rtmbkf: 0/16752 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 275304 onoff: 106/106:109/109 15,65:2,84 3272=
:3485 (HZ=3D100) barrier: 13794/13795:0 read-exits: 2685 nocb-toggles: 0:0
> [ 2363.444829][   T91] srcu-torture: Reader Pipe:  1672994725 32157 0 0 0=
 0 0 0 0 0 0
> [ 2363.446321][   T91] srcu-torture: Reader Batch:  1672959276 67622 0 0 =
0 0 0 0 0 0 0
> [ 2363.447845][   T91] srcu-torture: Free-Block Circulation:  24918 24918=
 24917 24916 24915 24914 24913 24912 24911 24910 0
> [ 2363.450062][   T91] rcu: srcu-torture: Tree SRCU g387701 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-7,-23 C) 1(-4,-21 C) 2(2,5 C) 3(4,-1 C) 4(-=
2,1 .) 5(-1,19 .) 6(-1,9 .) 7(9,11 .) T(0,0)
> [ 2373.199719][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2376.049700][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2378.799720][   T91] srcu-torture: rtc: 00000000b12ce405 ver: 25061 tfl=
e: 0 rta: 25062 rtaf: 0 rtf: 25051 rtmbe: 0 rtmbkf: 0/16861 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 277342 onoff: 106/106:110/110 15,65:2,84 3272=
:3514 (HZ=3D100) barrier: 13881/13881:0 read-exits: 2702 nocb-toggles: 0:0
> [ 2378.826210][   T91] srcu-torture: Reader Pipe:  1685092154 32400 0 0 0=
 0 0 0 0 0 0
> [ 2378.827811][   T91] srcu-torture: Reader Batch:  1685056392 68179 0 0 =
0 0 0 0 0 0 0
> [ 2378.829440][   T91] srcu-torture: Free-Block Circulation:  25061 25060=
 25059 25058 25057 25056 25054 25053 25052 25051 0
> [ 2378.831737][   T91] rcu: srcu-torture: Tree SRCU g389665 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-24,-7 .) 1(-22,-4 C) 2(5,1 C) 3(0,5 .) 4(1,=
-2 .) 5(19,-1 .) 6(9,-1 .) 7(12,10 C) T(0,1)
> [ 2389.919712][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2390.149761][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2394.169757][   T91] srcu-torture: rtc: 00000000422e1963 ver: 25204 tfl=
e: 0 rta: 25204 rtaf: 0 rtf: 25195 rtmbe: 0 rtmbkf: 0/16954 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 278936 onoff: 106/107:111/111 15,65:2,84 3272=
:3547 (HZ=3D100) barrier: 13971/13972:0 read-exits: 2719 nocb-toggles: 0:0
> [ 2394.178572][   T91] srcu-torture: Reader Pipe:  1694349146 32560 0 0 0=
 0 0 0 0 0 0
> [ 2394.179994][   T91] srcu-torture: Reader Batch:  1694313198 68522 0 0 =
0 0 0 0 0 0 0
> [ 2394.181366][   T91] srcu-torture: Free-Block Circulation:  25203 25203=
 25202 25201 25200 25199 25198 25197 25196 25195 0
> [ 2394.183295][   T91] rcu: srcu-torture: Tree SRCU g391620 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-7,-24 .) 1(-4,-22 C) 2(1,5 C) 3(5,0 C) 4(-2=
,1 .) 5(-1,19 .) 6(-1,9 .) 7(9,12 .) T(0,0)
> [ 2403.759751][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2405.899702][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2409.519712][   T91] srcu-torture: rtc: 00000000ec899488 ver: 25410 tfl=
e: 0 rta: 25411 rtaf: 0 rtf: 25399 rtmbe: 0 rtmbkf: 0/17108 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 281196 onoff: 108/108:111/111 15,65:2,84 3327=
:3547 (HZ=3D100) barrier: 14059/14060:0 read-exits: 2736 nocb-toggles: 0:0
> [ 2409.526089][   T91] srcu-torture: Reader Pipe:  1707472816 32854 0 0 0=
 0 0 0 0 0 0
> [ 2409.527999][   T91] srcu-torture: Reader Batch:  1707436596 69086 0 0 =
0 0 0 0 0 0 0
> [ 2409.529934][   T91] srcu-torture: Free-Block Circulation:  25410 25409=
 25407 25406 25404 25403 25402 25401 25400 25399 0
> [ 2409.532640][   T91] rcu: srcu-torture: Tree SRCU g393842 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-7,-22 C) 1(-4,-22 C) 2(3,6 C) 3(5,1 C) 4(-2=
,1 .) 5(-1,20 C) 6(-1,9 .) 7(9,12 .) T(2,5)
> [ 2419.439750][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2419.452229][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2424.879740][   T91] srcu-torture: rtc: 0000000047becefe ver: 25518 tfl=
e: 0 rta: 25518 rtaf: 0 rtf: 25509 rtmbe: 0 rtmbkf: 0/17193 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 282930 onoff: 108/108:112/112 15,65:2,84 3327=
:3572 (HZ=3D100) barrier: 14152/14152:0=20
> [ 2424.879777][   T96] rcu_torture_fwd_prog n_max_cbs: 21628
> [ 2424.879778][   T91] read-exits: 2753 nocb-toggles: 0:0
> [ 2424.879784][   T91] srcu-torture:=20
> [ 2424.900929][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 2424.902043][   T91] Reader Pipe:  1718165294
> [ 2424.903107][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 2424.903827][   T91]  33071 0 0 0 0 0 0 0 0 0
> [ 2424.908639][   T91] srcu-torture: Reader Batch:  1718128855 69521 0 0 =
0 0 0 0 0 0 0
> [ 2424.910305][   T91] srcu-torture: Free-Block Circulation:  25517 25517=
 25516 25515 25514 25513 25512 25511 25510 25509 0
> [ 2424.912636][   T91] rcu: srcu-torture: Tree SRCU g395477 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-7,-24 .) 1(-4,-20 C) 2(1,4 .) 3(5,0 .) 4(-2=
,1 .) 5(-1,19 .) 6(-1,9 .) 7(9,12 .) T(0,1)
> [ 2425.018910][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 2425.070478][   T96] rcu_torture_fwd_prog_cr Duration 11 barrier: 6 pen=
ding 16373 n_launders: 36706 n_launders_sa: 345 n_max_gps: 100 n_max_cbs: 3=
5807 cver 0 gps 1454
> [ 2425.073625][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 17 jiffies): 1s/10: 36362:1363 2s/10: 36151:92
> [ 2433.049733][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2435.969735][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2440.239755][   T91] srcu-torture: rtc: 00000000b4445360 ver: 25689 tfl=
e: 0 rta: 25690 rtaf: 0 rtf: 25678 rtmbe: 0 rtmbkf: 0/17323 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 285329 onoff: 110/110:112/112 15,65:2,84 3429=
:3572 (HZ=3D100) barrier: 14234/14235:0 read-exits: 2770 nocb-toggles: 0:0
> [ 2440.246445][   T91] srcu-torture: Reader Pipe:  1732433511 33351 0 0 0=
 0 0 0 0 0 0
> [ 2440.248414][   T91] srcu-torture: Reader Batch:  1732396726 70146 0 0 =
0 0 0 0 0 0 0
> [ 2440.250420][   T91] srcu-torture: Free-Block Circulation:  25690 25689=
 25687 25686 25684 25683 25682 25681 25680 25679 0
> [ 2440.253218][   T91] rcu: srcu-torture: Tree SRCU g403269 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-7,-23 C) 1(-4,-20 C) 2(1,4 C) 3(5,0 .) 4(-2=
,3 C) 5(-1,19 .) 6(-1,9 C) 7(9,12 .) T(0,4)
> [ 2449.679736][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2449.899748][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2455.599858][   T91] srcu-torture: rtc: 0000000011054584 ver: 25813 tfl=
e: 0 rta: 25813 rtaf: 0 rtf: 25804 rtmbe: 0 rtmbkf: 0/17437 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 287064 onoff: 111/111:112/112 15,65:2,84 3494=
:3572 (HZ=3D100) barrier: 14327/14327:0 read-exits: 2787 nocb-toggles: 0:0
> [ 2455.611565][   T91] srcu-torture: Reader Pipe:  1742480801 33685 0 0 0=
 0 0 0 0 0 0
> [ 2455.613799][   T91] srcu-torture: Reader Batch:  1742443600 70897 0 0 =
0 0 0 0 0 0 0
> [ 2455.616051][   T91] srcu-torture: Free-Block Circulation:  25812 25812=
 25811 25810 25809 25808 25807 25806 25805 25804 0
> [ 2455.619263][   T91] rcu: srcu-torture: Tree SRCU g405036 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-8,-24 .) 1(-3,-20 .) 2(1,6 .) 3(5,-1 .) 4(-=
2,-1 .) 5(-1,20 .) 6(-1,8 .) 7(9,12 .) T(0,0)
> [ 2463.529736][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2466.009705][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2470.959782][   T91] srcu-torture: rtc: 00000000d32f4ec2 ver: 26032 tfl=
e: 0 rta: 26032 rtaf: 0 rtf: 26022 rtmbe: 0 rtmbkf: 0/17628 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 290019 onoff: 111/111:114/114 15,65:2,84 3494=
:3654 (HZ=3D100) barrier: 14415/14415:0 read-exits: 2804 nocb-toggles: 0:0
> [ 2470.969325][   T91] srcu-torture: Reader Pipe:  1760008437 34160 0 0 0=
 0 0 0 0 0 0
> [ 2470.971135][   T91] srcu-torture: Reader Batch:  1759970727 71881 0 0 =
0 0 0 0 0 0 0
> [ 2470.972971][   T91] srcu-torture: Free-Block Circulation:  26031 26031=
 26030 26029 26028 26027 26026 26025 26023 26022 0
> [ 2470.975537][   T91] rcu: srcu-torture: Tree SRCU g407353 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-25,-8 .) 1(-20,-3 .) 2(6,1 C) 3(-1,5 .) 4(1=
,-3 .) 5(19,-1 .) 6(8,0 .) 7(12,9 .) T(0,0)
> [ 2479.599716][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2479.811443][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2486.319724][   T96] rcu_torture_fwd_prog n_max_cbs: 35807
> [ 2486.321148][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 2486.322864][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 2486.324807][   T91] srcu-torture: rtc: 00000000f7aaffbe ver: 26160 tfl=
e: 0 rta: 26160 rtaf: 0 rtf: 26149 rtmbe: 0 rtmbkf: 0/17736 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 291613 onoff: 112/112:114/114 15,65:2,84 3528=
:3654 (HZ=3D100) barrier: 14502/14502:0 read-exits: 2821 nocb-toggles: 0:0
> [ 2486.331256][   T91] srcu-torture: Reader Pipe:  1769216724 34438 0 0 0=
 0 0 0 0 0 0
> [ 2486.333188][   T91] srcu-torture: Reader Batch:  1769178806 72368 0 0 =
0 0 0 0 0 0 0
> [ 2486.335135][   T91] srcu-torture: Free-Block Circulation:  26160 26159=
 26158 26157 26156 26155 26153 26152 26151 26149 0
> [ 2486.337895][   T91] rcu: srcu-torture: Tree SRCU g408905 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-25,-8 .) 1(-20,-3 .) 2(6,1 .) 3(-1,7 C) 4(2=
,-2 C) 5(19,0 C) 6(7,1 C) 7(12,9 .) T(0,5)
> [ 2486.479955][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 2486.549492][   T96] rcu_torture_fwd_prog_cr Duration 14 barrier: 6 pen=
ding 5071 n_launders: 21995 n_launders_sa: 5071 n_max_gps: 100 n_max_cbs: 1=
4826 cver 4 gps 112
> [ 2486.553270][   T96] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 21 jiffies): 1s/10: 16925:51 2s/10: 19896:62
> [ 2493.449731][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2495.810037][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2501.679742][   T91] srcu-torture: rtc: 000000007a735a8b ver: 26374 tfl=
e: 0 rta: 26374 rtaf: 0 rtf: 26365 rtmbe: 0 rtmbkf: 0/17902 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 294335 onoff: 112/112:115/115 15,65:2,84 3528=
:3684 (HZ=3D100) barrier: 14594/14594:0 read-exits: 2838 nocb-toggles: 0:0
> [ 2501.690361][   T91] srcu-torture: Reader Pipe:  1785937711 34837 0 0 0=
 0 0 0 0 0 0
> [ 2501.692209][   T91] srcu-torture: Reader Batch:  1785899173 73386 0 0 =
0 0 0 0 0 0 0
> [ 2501.694083][   T91] srcu-torture: Free-Block Circulation:  26373 26373=
 26372 26371 26370 26369 26368 26367 26366 26365 0
> [ 2501.696761][   T91] rcu: srcu-torture: Tree SRCU g411760 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-28,-8 .) 1(-20,-3 .) 2(5,1 .) 3(1,5 .) 4(2,=
-3 .) 5(21,-1 .) 6(7,0 .) 7(12,9 .) T(0,0)
> [ 2509.439702][  T102] srcu-torture: rcu_torture_read_exit: Start of epis=
ode
> [ 2509.729706][  T102] srcu-torture: rcu_torture_read_exit: End of episode
> [ 2517.049712][   T91] srcu-torture: rtc: 0000000074e2a4f0 ver: 26492 tfl=
e: 0 rta: 26493 rtaf: 0 rtf: 26481 rtmbe: 0 rtmbkf: 0/17979 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 295856 onoff: 113/113:116/116 15,65:2,84 3565=
:3717 (HZ=3D100) barrier: 14683/14684:0 read-exits: 2855 nocb-toggles: 0:0
> [ 2517.056268][   T91] srcu-torture: Reader Pipe:  1794989759 35000 0 0 0=
 0 0 0 0 0 0
> [ 2517.058174][   T91] srcu-torture: Reader Batch:  1794951012 73758 0 0 =
0 0 0 0 0 0 0
> [ 2517.060136][   T91] srcu-torture: Free-Block Circulation:  26492 26491=
 26490 26488 26487 26485 26484 26483 26482 26481 0
> [ 2517.062865][   T91] rcu: srcu-torture: Tree SRCU g413478 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D0): 0(-27,-8 C) 1(-20,-3 .) 2(5,1 .) 3(0,5 .) 4(2,=
-3 .) 5(22,-1 C) 6(7,1 C) 7(12,9 C) T(1,1)
> [ 2520.869789][   T94] srcu-torture: torture_shutdown task shutting down =
system
> [ 2520.896876][   T94] srcu-torture: Stopping torture_shuffle task
> [ 2520.898344][   T92] srcu-torture: torture_shuffle is stopping
> [ 2520.899905][   T94] srcu-torture: Stopping torture_stutter task
> [ 2520.921449][   T93] srcu-torture: torture_stutter is stopping
> [ 2520.921451][   T87] srcu-torture: rcu_torture_reader is stopping
> [ 2520.921451][   T90] srcu-torture: rcu_torture_reader is stopping
> [ 2520.921451][   T89] srcu-torture: rcu_torture_reader is stopping
> [ 2520.921475][   T79] srcu-torture: rcu_torture_writer is stopping
> [ 2520.921481][   T81] srcu-torture: rcu_torture_fakewriter is stopping
> [ 2520.921481][   T84] srcu-torture: rcu_torture_reader is stopping
> [ 2520.921481][   T82] srcu-torture: rcu_torture_fakewriter is stopping
> [ 2520.921506][   T80] srcu-torture: rcu_torture_fakewriter is stopping
> [ 2520.921522][   T86] srcu-torture: rcu_torture_reader is stopping
> [ 2520.929696][   T88] srcu-torture: rcu_torture_reader is stopping
> [ 2520.929812][   T83] srcu-torture: rcu_torture_fakewriter is stopping
> [ 2520.929821][   T85] srcu-torture: rcu_torture_reader is stopping
> [ 2520.944865][   T94] srcu-torture: Stopping torture_onoff task
> [ 2520.978756][   T95] srcu-torture: torture_onoff is stopping
> [ 2520.980201][  T101] srcu-torture: rcu_torture_barrier is stopping
> [ 2522.320114][  T102] srcu-torture: rcu_torture_read_exit is stopping
> [ 2522.320123][   T94] srcu-torture: Stopping rcutorture_read_exit task
> [ 2522.327150][   T94] srcu-torture: Stopping rcu_torture_barrier task
> [ 2522.329930][   T94] srcu-torture: Stopping rcu_torture_barrier_cbs task
> [ 2522.332152][   T97] srcu-torture: rcu_torture_barrier_cbs is stopping
> [ 2522.361323][   T94] srcu-torture: Stopping rcu_torture_barrier_cbs task
> [ 2522.363533][   T98] srcu-torture: rcu_torture_barrier_cbs is stopping
> [ 2522.365607][   T94] srcu-torture: Stopping rcu_torture_barrier_cbs task
> [ 2522.367770][   T99] srcu-torture: rcu_torture_barrier_cbs is stopping
> [ 2522.369921][   T94] srcu-torture: Stopping rcu_torture_barrier_cbs task
> [ 2522.372110][  T100] srcu-torture: rcu_torture_barrier_cbs is stopping
> [ 2522.374230][   T94] srcu-torture: Stopping rcu_torture_fwd_prog task
> [ 2522.376308][   T96] rcu_torture_fwd_prog n_max_cbs: 14826
> [ 2522.378036][   T96] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [ 2522.380268][   T96] rcu_torture_fwd_prog_cr: Starting forward-progress=
 test 0
> [ 2522.382672][   T96] rcu_torture_fwd_prog_cr: Waiting for CBs: srcu_tor=
ture_barrier+0x0/0x40() 0
> [ 2523.439797][   T96] rcu_torture_fwd_prog: tested 0 tested_tries 0
> [ 2523.446310][   T96] srcu-torture: rcu_torture_fwd_prog is stopping
> [ 2523.448760][   T94] srcu-torture: Stopping rcu_torture_writer task
> [ 2523.459873][   T94] srcu-torture: Stopping rcu_torture_reader task
> [ 2523.461918][   T94] srcu-torture: Stopping rcu_torture_reader task
> [ 2523.463971][   T94] srcu-torture: Stopping rcu_torture_reader task
> [ 2523.466014][   T94] srcu-torture: Stopping rcu_torture_reader task
> [ 2523.468047][   T94] srcu-torture: Stopping rcu_torture_reader task
> [ 2523.468510][   T87] rcu_torture_rea (87) used greatest stack depth: 89=
76 bytes left
> [ 2523.470263][   T94] srcu-torture: Stopping rcu_torture_reader task
> [ 2523.481271][   T94] srcu-torture: Stopping rcu_torture_reader task
> [ 2523.483092][   T94] srcu-torture: Stopping rcu_torture_fakewriter task
> [ 2523.485108][   T94] srcu-torture: Stopping rcu_torture_fakewriter task
> [ 2523.487237][   T94] srcu-torture: Stopping rcu_torture_fakewriter task
> [ 2523.489387][   T94] srcu-torture: Stopping rcu_torture_fakewriter task
> [ 2523.491557][   T94] srcu:  End-test grace-period state: g414492 f0x0 t=
otal-gps=3D414492
> [ 2523.494082][   T94] srcu-torture: Stopping rcu_torture_stats task
> [ 2523.496064][   T91] srcu-torture: rtc: 0000000000000000 VER: 26601 tfl=
e: 0 rta: 26601 rtaf: 0 rtf: 26592 rtmbe: 0 rtmbkf: 0/18061 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 296904 onoff: 113/113:116/116 15,65:2,84 3565=
:3717 (HZ=3D100) barrier: 14706/14706:0 read-exits: 2855 nocb-toggles: 0:0
> [ 2523.504481][   T91] srcu-torture: Reader Pipe:  1801582711 35204 0 0 0=
 0 0 0 0 0 0
> [ 2523.506979][   T91] srcu-torture: Reader Batch:  1801543789 74138 0 0 =
0 0 0 0 0 0 0
> [ 2523.509515][   T91] srcu-torture: Free-Block Circulation:  26600 26600=
 26599 26598 26597 26596 26595 26594 26593 26592 0
> [ 2523.513158][   T91] rcu: srcu-torture: Tree SRCU g414492 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-8,-28 .) 1(-3,-20 .) 2(1,5 .) 3(5,0 .) 4(-3=
,2 .) 5(-1,22 .) 6(0,7 .) 7(9,12 .) T(0,0)
> [ 2523.518521][   T91] srcu-torture: rcu_torture_stats is stopping
> [ 2523.520482][   T94] rcu_torture_cleanup: Invoking srcu_torture_barrier=
+0x0/0x40().
> [ 2523.524062][   T94] mem_dump_obj() slab test: rcu_torture_stats =3D 00=
00000000000000, &rhp =3D c00000000a627c90, rhp =3D c00000000f2f0000, &z =3D=
 c00000000347e834
> [ 2523.528499][   T94] mem_dump_obj(ZERO_SIZE_PTR): non-slab/vmalloc memo=
ry
> [ 2523.530684][   T94] mem_dump_obj(NULL): non-slab/vmalloc memory
> [ 2523.532593][   T94] mem_dump_obj(c00000000a627c90): slab thread_stack =
start c00000000a624000 pointer offset 15504 size 16384
> [ 2523.536233][   T94] mem_dump_obj(c00000000f2f0000): slab rcuscale star=
t c00000000f2f0000 pointer offset 0 allocated at rcu_torture_cleanup+0x62c/=
0xb20
> [ 2523.540624][   T94]     __slab_alloc.constprop.0+0x40/0x60
> [ 2523.542439][   T94]     kmem_cache_alloc+0x1b4/0x4b0
> [ 2523.544061][   T94]     rcu_torture_cleanup+0x62c/0xb20
> [ 2523.545735][   T94]     torture_shutdown+0x160/0x334
> [ 2523.547320][   T94]     kthread+0x148/0x150
> [ 2523.548677][   T94]     ret_from_kernel_thread+0x5c/0x64
> [ 2523.550400][   T94] mem_dump_obj(c00000000f2f0008): slab rcuscale star=
t c00000000f2f0000 pointer offset 8 allocated at rcu_torture_cleanup+0x62c/=
0xb20
> [ 2523.554786][   T94]     __slab_alloc.constprop.0+0x40/0x60
> [ 2523.556562][   T94]     kmem_cache_alloc+0x1b4/0x4b0
> [ 2523.558160][   T94]     rcu_torture_cleanup+0x62c/0xb20
> [ 2523.559873][   T94]     torture_shutdown+0x160/0x334
> [ 2523.561483][   T94]     kthread+0x148/0x150
> [ 2523.562837][   T94]     ret_from_kernel_thread+0x5c/0x64
> [ 2523.564552][   T94] mem_dump_obj(c00000000347e834): non-slab/vmalloc m=
emory
> [ 2523.567739][   T94] mem_dump_obj() kmalloc test: rcu_torture_stats =3D=
 0000000000000000, &rhp =3D c00000000a627c90, rhp =3D c00000000a366960
> [ 2523.571658][   T94] mem_dump_obj(kmalloc c00000000a366960): slab kmall=
oc-16 start c00000000a366960 pointer offset 0 size 16
> [ 2523.575216][   T94] mem_dump_obj(kmalloc c00000000a366968): slab kmall=
oc-16 start c00000000a366960 pointer offset 8 size 16
> [ 2523.578932][   T94] mem_dump_obj() vmalloc test: rcu_torture_stats =3D=
 0000000000000000, &rhp =3D c00000000a627c90, rhp =3D c008000003470000
> [ 2523.582836][   T94] mem_dump_obj(vmalloc c008000003470000): 1-page vma=
lloc region starting at 0xc008000003470000 allocated at rcu_torture_cleanup=
+0x7b0/0xb20
> [ 2523.587368][   T94] mem_dump_obj(vmalloc c008000003470008): 1-page vma=
lloc region starting at 0xc008000003470000 allocated at rcu_torture_cleanup=
+0x7b0/0xb20
> [ 2523.591966][   T94] srcu-torture: rtc: 0000000000000000 VER: 26601 tfl=
e: 0 rta: 26601 rtaf: 0 rtf: 26592 rtmbe: 0 rtmbkf: 0/18061 rtbe: 0 rtbke: =
0 rtbre: 0 rtbf: 0 rtb: 0 nt: 296904 onoff: 113/113:116/116 15,65:2,84 3565=
:3717 (HZ=3D100) barrier: 14706/14706:0 read-exits: 2855 nocb-toggles: 0:0
> [ 2523.600310][   T94] srcu-torture: Reader Pipe:  1801582711 35204 0 0 0=
 0 0 0 0 0 0
> [ 2523.602780][   T94] srcu-torture: Reader Batch:  1801543789 74138 0 0 =
0 0 0 0 0 0 0
> [ 2523.605271][   T94] srcu-torture: Free-Block Circulation:  26600 26600=
 26599 26598 26597 26596 26595 26594 26593 26592 0
> [ 2523.608809][   T94] rcu: srcu-torture: Tree SRCU g414492 state 8 (SRCU=
_SIZE_BIG) per-CPU(idx=3D1): 0(-8,-28 .) 1(-3,-20 .) 2(1,5 .) 3(5,0 .) 4(-3=
,2 .) 5(-1,22 .) 6(0,7 .) 7(9,12 .) T(0,0)
> [ 2523.614202][   T94] srcu-torture:--- End of test: SUCCESS: nreaders=3D=
7 nfakewriters=3D4 stat_interval=3D15 verbose=3D1 test_no_idle_hz=3D1 shuff=
le_interval=3D3 stutter=3D5 irqreader=3D1 fqs_duration=3D0 fqs_holdoff=3D0 =
fqs_stutter=3D3 test_boost=3D1/0 test_boost_interval=3D7 test_boost_duratio=
n=3D4 shutdown_secs=3D2520 stall_cpu=3D0 stall_cpu_holdoff=3D10 stall_cpu_i=
rqsoff=3D0 stall_cpu_block=3D0 n_barrier_cbs=3D4 onoff_interval=3D1000 onof=
f_holdoff=3D30 read_exit_delay=3D13 read_exit_burst=3D16 nocbs_nthreads=3D0=
 nocbs_toggle=3D1000
> [ 2523.631247][   T94] reboot: Power down

