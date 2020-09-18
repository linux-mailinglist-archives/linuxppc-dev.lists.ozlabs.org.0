Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E6526FC18
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 14:09:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtCLM3CHhzDqnk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 22:09:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtCHS4M5lzDqlc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 22:06:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DXtFxE/G; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BtCHR24Zdz9sT5;
 Fri, 18 Sep 2020 22:06:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1600430803;
 bh=CckFhTiAY9p2fL9SHrEPSEQYcrMlYVwd3Fpe4jdFLOY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DXtFxE/GA3Ys+kjV0l3jkOVh16ObDMSB/Mwmut664uaGt8gzy1WVquYOTejB2wHho
 iECcZk8++eRwSwv6a+7UlSvVFBkQPI2YVW3jWtV1Z8fxCFbvbIldCYAUHMOdCFOnDg
 rvBbo+zswGMqENQLXTXy/gfX/BM931t0alBTfojFFAjPuN7+0U0sWjfzuGUZfs7zdi
 zMAOOzVm82BfEGMnWW9Zml3MLSHvWae0+2NyEGUC6xv5XUumW7B4/ghcn+VjT3Qth2
 ijaZeXRviyqDlXz+3xubLfYhYD3tKpXcFRMUPbr11gBJ+xC7Tt6Z9P+lSlxL13qcdg
 7a6vB84NTB8Dw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] powerpc/64: irq replay remove decrementer overflow
 check
In-Reply-To: <20200915114650.3980244-6-npiggin@gmail.com>
References: <20200915114650.3980244-1-npiggin@gmail.com>
 <20200915114650.3980244-6-npiggin@gmail.com>
Date: Fri, 18 Sep 2020 22:06:37 +1000
Message-ID: <87eemz70he.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> This is an ad-hoc way to catch some cases of decrementer overflow. It
> won't catch cases where interrupts were hard disabled before any soft
> masked interrupts fired, for example. And it doesn't catch cases that
> have overflowed an even number of times.
>
> It's not clear what exactly what problem s being solved here. A lost
> timer when we have an IRQ off latency of more than ~4.3 seconds could
> be avoided (so long as it's also less than ~8.6s) but this is already
> a hard lockup order of magnitude event, and the decrementer will wrap
> again and provide a timer interrupt within the same latency magnitdue.
>
> So the test catches some cases of lost decrementers in very exceptional
> (buggy) latency event cases, reducing timer interrupt latency in that
> case by up to 4.3 seconds. And for large decrementer, it's useless. It
> is performed in potentially quite a hot path, reading the TB can be
> a noticable overhead.
>
> Perhaps more importantly it allows the clunky MSR[EE] vs
> PACA_IRQ_HARD_DIS incoherency to be removed.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/irq.c | 50 +--------------------------------------
>  1 file changed, 1 insertion(+), 49 deletions(-)

Seems to be unhappy on qemu ppc64e:

  kernel BUG at arch/powerpc/kernel/irq.c:153!

Which is:

notrace unsigned int __check_irq_replay(void)
{
...

	/* There should be nothing left ! */
	BUG_ON(local_paca->irq_happened != 0);

	return 0;
}

Full log below.

cheers


spawn qemu-system-ppc64 -nographic -M ppce500 -cpu e5500 -m 2G -kernel /home/michael/build/adhoc/ci_output/build/corenet64_smp_defconfig@ppc64@korg@10.1.0/uImage -initrd ppc64-novsx-rootfs.cpio.gz -append noreboot
MMU: Supported page sizes
         4 KB as direct
      4096 KB as direct
     16384 KB as direct
     65536 KB as direct
    262144 KB as direct
   1048576 KB as direct
MMU: Book3E HW tablewalk not supported
Linux version 5.9.0-rc2-00187-gf523995cc1ee (linuxppc@e054daee57c9) (powerpc64-linux-gnu-gcc (GCC) 10.1.0, GNU ld (GNU Binutils) 2.34) #1 SMP Fri Sep 18 11:52:25 Australia 2020
Found initrd at 0xc000000005000000:0xc0000000051e9a47
Using QEMU e500 machine description
ioremap() called early from .find_legacy_serial_ports+0x6cc/0x7bc. Use early_ioremap() instead
printk: bootconsole [udbg0] enabled
CPU maps initialized for 1 thread per core
-----------------------------------------------------
phys_mem_size     = 0x80000000
dcache_bsize      = 0x40
icache_bsize      = 0x40
cpu_features      = 0x00000003008001b4
  possible        = 0x00000003009003b6
  always          = 0x00000003008003b4
cpu_user_features = 0xcc008000 0x08000000
mmu_features      = 0x000a0010
firmware_features = 0x0000000000000000
-----------------------------------------------------
qemu_e500_setup_arch()
barrier-nospec: using isync; sync as speculation barrier
Zone ranges:
  DMA      [mem 0x0000000000000000-0x000000007fffffff]
  Normal   empty
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x000000007fffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x000000007fffffff]
MMU: Allocated 2112 bytes of context maps for 255 contexts
percpu: Embedded 28 pages/cpu s77400 r0 d37288 u1048576
Built 1 zonelists, mobility grouping on.  Total pages: 517120
Kernel command line: noreboot
Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 1977432K/2097152K available (12048K kernel code, 2204K rwdata, 3788K rodata, 460K init, 321K bss, 119720K reserved, 0K cma-reserved)
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
rcu: Hierarchical RCU implementation.
rcu:    RCU event tracing is enabled.
rcu:    RCU restricting CPUs from NR_CPUS=24 to nr_cpu_ids=1.
rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
mpic: Setting up MPIC " OpenPIC  " version 1.2 at fe0040000, max 1 CPUs
mpic: ISU size: 256, shift: 8, mask: ff
mpic: Initializing for 256 sources
random: get_random_u64 called from .start_kernel+0x498/0x70c with crng_init=0
clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x5c4093a7d1, max_idle_ns: 440795210635 ns
clocksource: timebase mult[2800000] shift[24] registered
Console: colour dummy device 80x25
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
e500 family performance monitor hardware support registered
rcu: Hierarchical SRCU implementation.
smp: Bringing up secondary CPUs ...
smp: Brought up 1 node, 1 CPU
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
futex hash table entries: 256 (order: 2, 16384 bytes, linear)
------------[ cut here ]------------
kernel BUG at arch/powerpc/kernel/irq.c:153!
Oops: Exception in kernel mode, sig: 5 [#1]
BE PAGE_SIZE=4K SMP NR_CPUS=24 QEMU e500
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc2-00187-gf523995cc1ee #1
NIP:  c0000000000039d4 LR: c00000000001a634 CTR: c000000000594d00
REGS: c00000007d0df5e0 TRAP: 0700   Not tainted  (5.9.0-rc2-00187-gf523995cc1ee)
MSR:  0000000080021000 <CE,ME>  CR: 28000242  XER: 20000000
IRQMASK: 1
GPR00: 0000000000000001 c00000007d0df870 c0000000011e2200 0000000000000000
GPR04: 0000000000000800 0000000000000000 0000000000000001 c00000000116eec0
GPR08: 0000000000000000 0000000000000001 0000000000000000 0000000000000300
GPR12: 0000000028000242 c000000001263000 c000000000002434 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR24: c00000000110b248 c000000000fd3728 c000000000fc1ef8 c000000000f715f8
GPR28: c0000000010c8700 0000000000000000 0000000000000002 0000000000000001
NIP [c0000000000039d4] .__check_irq_replay+0x24/0x60
LR [c00000000001a634] fast_exception_return+0xe0/0x140
Call Trace:
[c00000007d0df870] [c00000000001a37c] storage_fault_common+0x40/0x44 (unreliable)
--- interrupt: 300 at .__se_sys_futex_time32+0x1fc/0x2c8
    LR = .futex_init+0xbc/0x144
[c00000007d0dfb70] [c000000000f8af88] .futex_init+0x88/0x144 (unreliable)
[c00000007d0dfc10] [c000000000001ed8] .do_one_initcall+0x6c/0x28c
[c00000007d0dfcf0] [c000000000f79258] .kernel_init_freeable+0x298/0x314
[c00000007d0dfda0] [c000000000002450] .kernel_init+0x1c/0x138
[c00000007d0dfe20] [c00000000000082c] .ret_from_kernel_thread+0x58/0x60
Instruction dump:
4bffff64 48bb8a49 60000000 892d067b 71280008 40820028 71280004 40820040
71280002 40820028 3149ffff 7d2a4910 <0b090000> 38600000 4e800020 55290776
---[ end trace 276324e35afb2c5e ]---

Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000005
Rebooting in 180 seconds..
System Halted, OK to tu
