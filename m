Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8139A830BC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 13:34:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462swj46PGzDqVn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 21:34:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462sty74RTzDqgD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 21:32:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 462sty3LhMz9s7T;
 Tue,  6 Aug 2019 21:32:42 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "linuxppc-dev\@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "christophe.leroy\@c-s.fr" <christophe.leroy@c-s.fr>,
 "npiggin\@gmail.com" <npiggin@gmail.com>
Subject: Re: SMP lockup at boot on Freescale/NXP T2080 (powerpc 64)
In-Reply-To: <4525a16cd3e65f89741b50daf2ec259b6baaab78.camel@alliedtelesis.co.nz>
References: <1564970785.27215.29.camel@alliedtelesis.co.nz>
 <4525a16cd3e65f89741b50daf2ec259b6baaab78.camel@alliedtelesis.co.nz>
Date: Tue, 06 Aug 2019 21:32:39 +1000
Message-ID: <87wofqv8a0.fsf@concordia.ellerman.id.au>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Grant McEwan <grant.mcewan@alliedtelesis.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Chris Packham <Chris.Packham@alliedtelesis.co.nz> writes:
> On Mon, 2019-08-05 at 14:06 +1200, Chris Packham wrote:
>> Hi All,
>> 
>> I have a custom board that uses the Freescale/NXP T2080 SoC.
>> 
>> The board boots fine using v4.19.60 but when I use v5.1.21 it locks
>> up
>> waiting for the other CPUs to come online (earlyprintk output below).
>> If I set maxcpus=0 then the system boots all the way through to
>> userland. The same thing happens with 5.3-rc2.
>> 
>> The defconfig I'm using is 
>> https://gist.github.com/cpackham/f24d0b426f3
>> de0eaaba17b82c3528a9d it was updated from the working v4.19.60
>> defconfig using make olddefconfig.
>> 
>> Does this ring any bells for anyone?
>> 
>> I haven't dug into the differences between the working an non-working
>> versions yet. I'll start looking now.
>
> I've bisected this to the following commit

Thanks that's super helpful.

> commit ed1cd6deb013a11959d17a94e35ce159197632da
> Author: Christophe Leroy <christophe.leroy@c-s.fr>
> Date:   Thu Jan 31 10:08:58 2019 +0000
>
>     powerpc: Activate CONFIG_THREAD_INFO_IN_TASK
>     
>     This patch activates CONFIG_THREAD_INFO_IN_TASK which
>     moves the thread_info into task_struct.
>
> I'll be the first to admit this is well beyond my area of knowledge so
> I'm unsure what about this patch is problematic but I can be fairly
> sure that a build immediately before this patch works while a build
> with this patch hangs.

It makes a pretty fundamental change to the way the kernel stores some
information about each task, moving it off the stack and into the task
struct.

It definitely has the potential to break things, but I thought we had
reasonable test coverage of the Book3E platforms, I have a p5020ds
(e5500) that I boot as part of my CI.

Aha. If I take your config and try to boot it on my p5020ds I get the
same behaviour, stuck at SMP bringup. So it seems it's something in your
config vs corenet64_smp_defconfig that is triggering the bug.

Can you try bisecting what in the config triggers it?

To do that you checkout ed1cd6deb013a11959d17a94e35ce159197632da, then
you build/boot with corenet64_smp_defconfig to confirm it works. Then
you use tools/testing/ktest/config-bisect.pl to bisect the changes in
the .config.

cheers


>> Booting...
>> MMU: Supported page sizes
>>          4 KB as direct
>>       2048 KB as direct & indirect
>>       4096 KB as direct
>>      16384 KB as direct
>>      65536 KB as direct
>>     262144 KB as direct
>>    1048576 KB as direct
>> MMU: Book3E HW tablewalk enabled
>> Linux version 5.1.21-at1+ (@chrisp-dl) (gcc version 4.9.3 (crosstool-
>> NG 
>> crosstool-ng-1.22.0)) #24 SMP PREEMPT Mon Aug 5 01:42:00 UTC 2019
>> Found initrd at 0xc00000002f045000:0xc000000030000000
>> Using CoreNet Generic machine description
>> Found legacy serial port 0 for /soc@ffe000000/serial@11c500
>>   mem=ffe11c500, taddr=ffe11c500, irq=0, clk=300000000, speed=0
>> Found legacy serial port 1 for /soc@ffe000000/serial@11c600
>>   mem=ffe11c600, taddr=ffe11c600, irq=0, clk=300000000, speed=0
>> Found legacy serial port 2 for /soc@ffe000000/serial@11d500
>>   mem=ffe11d500, taddr=ffe11d500, irq=0, clk=300000000, speed=0
>> Found legacy serial port 3 for /soc@ffe000000/serial@11d600
>>   mem=ffe11d600, taddr=ffe11d600, irq=0, clk=300000000, speed=0
>> printk: bootconsole [udbg0] enabled
>> CPU maps initialized for 2 threads per core
>>  (thread shift is 1)
>> Allocated 1856 bytes for 8 pacas
>> -----------------------------------------------------
>> phys_mem_size     = 0x100000000
>> dcache_bsize      = 0x40
>> icache_bsize      = 0x40
>> cpu_features      = 0x00000003009003b6
>>   possible        = 0x00000003009003b6
>>   always          = 0x00000003008003b4
>> cpu_user_features = 0xdc008000 0x08000000
>> mmu_features      = 0x000a0010
>> firmware_features = 0x0000000000000000
>> -----------------------------------------------------
>> CoreNet Generic board
>> barrier-nospec: using isync; sync as speculation barrier
>> barrier-nospec: patched 412 locations
>> Top of RAM: 0x100000000, Total RAM: 0x100000000
>> Memory hole size: 0MB
>> Zone ranges:
>>   DMA      [mem 0x0000000000000000-0x000000007fffefff]
>>   Normal   [mem 0x000000007ffff000-0x00000000ffffffff]
>> Movable zone start for each node
>> Early memory node ranges
>>   node   0: [mem 0x0000000000000000-0x00000000ffffffff]
>> Initmem setup node 0 [mem 0x0000000000000000-0x00000000ffffffff]
>> On node 0 totalpages: 1048576
>>   DMA zone: 7168 pages used for memmap
>>   DMA zone: 0 pages reserved
>>   DMA zone: 524287 pages, LIFO batch:63
>>   Normal zone: 7169 pages used for memmap
>>   Normal zone: 524289 pages, LIFO batch:63
>> MMU: Allocated 2112 bytes of context maps for 255 contexts
>> percpu: Embedded 22 pages/cpu s49304 r0 d40808 u131072
>> pcpu-alloc: s49304 r0 d40808 u131072 alloc=1*1048576
>> pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
>> Built 1 zonelists, mobility grouping on.  Total pages: 1034239
>> Kernel command line: console=ttyS0,115200 root=/dev/ram0
>> releasefile=linuxbox_ppc64_e6500mc-tb233.rel bootversion=6.2.7
>> loglevel=8 mtdoops.mtddev=errlog
>> mtdparts=fff800000.flash:4088M(user),8M(errlog)
>> earlyprintk=ttyS0,115200 real_init=
>> /bin/sh securitylevel=1 reladdr=0x1000000,1522523
>> printk: log_buf_len individual max cpu contribution: 4096 bytes
>> printk: log_buf_len total cpu_extra contributions: 28672 bytes
>> printk: log_buf_len min size: 16384 bytes
>> printk: log_buf_len: 65536 bytes
>> printk: early log buf free: 12412(75%)
>> Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
>> Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
>> Memory: 3979284K/4194304K available (8704K kernel code, 1584K rwdata,
>> 2496K rodata, 472K init, 299K bss, 215020K reserved, 0K cma-reserved)
>> SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
>> rcu: Preemptible hierarchical RCU implementation.
>> rcu:    RCU event tracing is enabled.
>>         Tasks RCU enabled.
>> rcu: RCU calculated value of scheduler-enlistment delay is 25
>> jiffies.
>> NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
>> mpic: Setting up MPIC " OpenPIC  " version 1.2 at ffe040000, max 8
>> CPUs
>> mpic: ISU size: 512, shift: 9, mask: 1ff
>> mpic: Initializing for 512 sources
>> time_init: decrementer frequency = 37.500000 MHz
>> time_init: processor frequency   = 1500.000000 MHz
>> clocksource: timebase: mask: 0xffffffffffffffff max_cycles:
>> 0x8a60dd6a9, max_idle_ns: 440795204056 ns
>> clocksource: timebase mult[1aaaaaab] shift[24] registered
>> clockevent: decrementer mult[999999a] shift[32] cpu[0]
>> pid_max: default: 32768 minimum: 301
>> Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
>> Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes)
>> e6500 family performance monitor hardware support registered
>> rcu: Hierarchical SRCU implementation.
>> smp: Bringing up secondary CPUs ...
