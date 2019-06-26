Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CEA561E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 07:51:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YXGV4rjzzDqZS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 15:51:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="S6cIcyKO"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YXDX3CpdzDqLZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 15:50:01 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45YXDL0qmrz9v1Z1;
 Wed, 26 Jun 2019 07:49:54 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=S6cIcyKO; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YysEYu2vuatt; Wed, 26 Jun 2019 07:49:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45YXDK6kl5z9v1Z0;
 Wed, 26 Jun 2019 07:49:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561528193; bh=AjIDVr01Uv4odtrFjXP+Uhwyjk88WtHDl1wDiavUs4U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=S6cIcyKO8VTgXeYbaHeJxsabxIp5TnGyDiqV8eUBaIn3sSv4rcgtUcfn+e97fLAVC
 WxasrxndmJGwOEl4XjmCkT0dyQWa4mxPqEdaX6X917HUkpDNMzPvfMRCqkXOLqIVKD
 XEqmNAPVySc6Cq1ZsmKboS7ZJegP6eHGbvoSwSEI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CBAB18B7CE;
 Wed, 26 Jun 2019 07:49:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hdyPzvK2hh1d; Wed, 26 Jun 2019 07:49:54 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A99D88B75E;
 Wed, 26 Jun 2019 07:49:54 +0200 (CEST)
Subject: Re: Bisected regression in v5.1 on PowerBook G3 (Wallstreet)
To: Finn Thain <fthain@telegraphics.com.au>
References: <alpine.LNX.2.21.1906261134540.121@nippy.intranet>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <03df9f3c-003a-b4ae-6f76-ba8a20742b25@c-s.fr>
Date: Wed, 26 Jun 2019 05:49:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.21.1906261134540.121@nippy.intranet>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org, Stan <userm57@yahoo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Finn,

On 06/26/2019 02:06 AM, Finn Thain wrote:
> Hi Christophe,
> 
> I received a report of a regression between v5.0 and v5.1 which causes the
> current release to crash during boot with a machine check exception.
> Please see console log below.
> 
> Stan (whom I've Cc'd) tells me that this happens on every attempt to boot.
> I asked him to try 'git bisect'. The results are given below. Can you see
> anything in commit 93c4a162b014 that might explain this?

Might be a false positive. That commit has a problem, but that problem 
is fixed by 4622a2d43101 ("powerpc/6xx: fix setup and use of 
SPRN_SPRG_PGDIR for hash32")

I would bet your problem is related to commit f7354ccac844 ("powerpc/32: 
Remove CURRENT_THREAD_INFO and rename TI_CPU").
That problem is fixed by commit 397d2300b08c ("powerpc/32s: fix 
flush_hash_pages() on SMP") upstream, and in linux 5.1.4 by commit 
fda49aec2515 on stable/linux-5.1.y

Can you test ?

Thanks
Christophe

> 
> I can also provide the .config if it would help.
> 
> 
> $ cat bisect.log
> 5.0.0-pmac-ide-03515-g3478588b5136 #2 worked
> 5.0.0-pmac-ide-05504-gda2577fe63f8 #3 worked
> 5.0.0-pmac-ide-06224-g67e79a6dc266 #4 worked
> 5.0.0-pmac-ide-06622-g1fc1cd8399ab #5 worked
> 5.0.0-rc2-pmac-ide-00215=g9580b71b5a78 #6 failed
> 5.0.0-rc2-pmac-ide-00113-gfe1ef6bcdb4f #7 worked
> 5.0.0-rc2-pmac-ide-00164-gd5f17ee96447 #8 failed
> 5.0.0-rc2-pmac-ide-00138-g84de6ab0e904 #9 failed
> 5.0.0-rc2-pmac-ide-00125-ge995265252fa #10 worked
> 5.0.0-rc2-pmac-ide-00131-g93c4a162b014 #11 failed
> 5.0.0-rc2-pmac-ide-00128-g36da5ff0bea2 #12 worked
> 
> 
> 93c4a162b014d238a287f8264adb25c009c79e61 is the first bad commit
> commit 93c4a162b014d238a287f8264adb25c009c79e61
> Author: Christophe Leroy <christophe.leroy@c-s.fr>
> Date:   Thu Feb 21 10:37:55 2019 +0000
> 
>      powerpc/6xx: Store PGDIR physical address in a SPRG
> 
>      Use SPRN_SPRG2 to store the current thread PGDIR and
>      avoid reading thread_struct.pgdir at every TLB miss.
> 
>      Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>      Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> :040000 040000 dcd7171dff5ba5bf895e4399d9d859c91c5a8293
> c51e7def7720499289420ace421cf755bf3bf37e M      arch
> 
> 
> [    0.000000] printk: debug: ignoring loglevel setting.
> [    0.000000] Total memory = 512MB; using 1024kB for hash table (at (ptrval))
> [    0.000000] Linux version 5.1.0-pmac-ide (fthain@nippy) (gcc version 4.6.4 (btc)) #1 SMP Sun Jun 23 14:46:26 AEST 2019
> [    0.000000] Found a Gatwick mac-io controller, rev: 0, mapped at 0x(ptrval)
> [    0.000000] Found a Heathrow mac-io controller, rev: 0, mapped at 0x(ptrval)
> [    0.000000] PowerMac motherboard: PowerBook Wallstreet
> [    0.000000] PMU driver v2 initialized for PowerBook G3 Series, firmware: 0a
> [    0.000000] Using PowerMac machine description
> [    0.000000] printk: bootconsole [udbg0] enabled
> [    0.000000] CPU maps initialized for 1 thread per core
> [    0.000000]  (thread shift is 0)
> [    0.000000] -----------------------------------------------------
> [    0.000000] Hash_size         = 0x100000
> [    0.000000] phys_mem_size     = 0x20000000
> [    0.000000] dcache_bsize      = 0x20
> [    0.000000] icache_bsize      = 0x20
> [    0.000000] cpu_features      = 0x000000000501a008
> [    0.000000]   possible        = 0x000000002f7ff14b
> [    0.000000]   always          = 0x0000000001000000
> [    0.000000] cpu_user_features = 0x8c000001 0x00000000
> [    0.000000] mmu_features      = 0x00000001
> [    0.000000] Hash              = 0x(ptrval)
> [    0.000000] Hash_mask         = 0x3fff
> [    0.000000] -----------------------------------------------------
> [    0.000000] Found Grackle (MPC106) PCI host bridge at 0x0000000080000000. Firmware bus number: 0->0
> [    0.000000] PCI host bridge /pci (primary) ranges:
> [    0.000000]   IO 0x00000000fe000000..0x00000000fe7fffff -> 0x0000000000000000
> [    0.000000]  MEM 0x00000000fd000000..0x00000000fdffffff -> 0x0000000000000000
> [    0.000000]  MEM 0x0000000080000000..0x00000000fcffffff -> 0x0000000080000000
> [    0.000000] nvram: OF partition at 0x1800
> [    0.000000] nvram: XP partition at 0x1300
> [    0.000000] nvram: NR partition at 0x1400
> [    0.000000] Top of RAM: 0x20000000, Total RAM: 0x20000000
> [    0.000000] Memory hole size: 0MB
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000000000000-0x000000001fffffff]
> [    0.000000]   HighMem  empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000000000-0x000000001fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000001fffffff]
> [    0.000000] On node 0 totalpages: 131072
> [    0.000000]   Normal zone: 1024 pages used for memmap
> [    0.000000]   Normal zone: 0 pages reserved
> [    0.000000]   Normal zone: 131072 pages, LIFO batch:31
> [    0.000000] percpu: Embedded 14 pages/cpu s24972 r8192 d24180 u57344
> [    0.000000] pcpu-alloc: s24972 r8192 d24180 u57344 alloc=14*4096
> [    0.000000] pcpu-alloc: [0] 0 [0] 1
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 130048
> [    0.000000] Kernel command line: root=/dev/hda11 video=atyfb:vmode:14,cmode:32 ignore_loglevel printk.time console=ttyS0,9600n8 console=tty
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
> [    0.000000] Memory: 503332K/524288K available (5468K kernel code, 272K rwdata, 1364K rodata, 264K init, 182K bss, 20956K reserved, 0K cma-reserved, 0K highmem)
> [    0.000000] Kernel virtual memory layout:
> [    0.000000]   * 0xfffbf000..0xfffff000  : fixmap
> [    0.000000]   * 0xff800000..0xffc00000  : highmem PTEs
> [    0.000000]   * 0xfeefb000..0xff800000  : early ioremap
> [    0.000000]   * 0xe1000000..0xfeefb000  : vmalloc & ioremap
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
> [    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
> [    0.000000] irq: Found primary Apple PIC /pci/mac-io for 64 irqs
> [    0.000000] irq: Found slave Apple PIC /pci/mac-io for 64 irqs cascade: 27
> [    0.000000] irq: System has 128 possible interrupts
> [    0.000000] GMT Delta read from XPRAM: -360 minutes, DST: on
> [    0.000000] time_init: decrementer frequency = 16.671483 MHz
> [    0.000000] time_init: processor frequency   = 264.000000 MHz
> [    0.000064] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x3d84ef27e, max_idle_ns: 440795202259 ns
> [    0.000100] clocksource: timebase mult[3bfb9003] shift[24] registered
> [    0.000195] clockevent: decrementer mult[4449512] shift[32] cpu[0]
> [    0.001150] Console: colour dummy device 80x25
> [    0.001193] printk: console [tty0] enabled
> [    0.001239] printk: bootconsole [udbg0] disabled
> [    0.001625] pmac_zilog: serial modem detected
> [    4.977278] printk: console [ttyS0] enabled
> [    5.027516] pid_max: default: 32768 minimum: 301
> [    5.083376] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    5.162419] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    5.248523] *** VALIDATE proc ***
> [    5.287109] *** VALIDATE cgroup1 ***
> [    5.329716] *** VALIDATE cgroup2 ***
> [    5.375172] rcu: Hierarchical SRCU implementation.
> [    5.431972] smp: Bringing up secondary CPUs ...
> [    5.484998] smp: Brought up 1 node, 1 CPU
> [    5.533075] Using standard scheduler topology
> [    5.586632] devtmpfs: initialized
> [    5.625731] Duplicate name in PowerPC,750, renamed to "l2-cache#1"
> [    5.702735] Duplicate name in pci, renamed to "mac-io#1"
> [    5.766262] Duplicate name in pci, renamed to "pccard#1"
> [    5.830071] random: get_random_u32 called from bucket_table_alloc+0x94/0x1c4 with crng_init=0
> [    5.932144] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    6.049531] futex hash table entries: 512 (order: 2, 16384 bytes)
> [    6.123224] NET: Registered protocol family 16
> [    6.181111] PMU i2c /pci/mac-io/via-pmu
> [    6.226470]  channel 1 bus <multibus>
> [    6.269024]  channel 2 bus <multibus>
> [    6.315157] PCI: Probing PCI hardware
> [    6.358004] PCI host bridge to bus 0000:00
> [    6.406370] pci_bus 0000:00: root bus resource [io  0x0000-0x7fffff]
> [    6.482602] pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfdffffff] (bus address [0x00000000-0x00ffffff])
> [    6.604898] pci_bus 0000:00: root bus resource [mem 0x80000000-0xfcffffff]
> [    6.687515] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    6.753382] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
> [    6.833106] pci 0000:00:00.0: [1057:0002] type 00 class 0x060000
> [    6.906583] pci 0000:00:0d.0: [106b:0017] type 00 class 0xff0000
> [    6.977163] pci 0000:00:0d.0: reg 0x10: [mem 0xf4000000-0xf407ffff]
> [    7.053429] pci 0000:00:10.0: [106b:0017] type 00 class 0xff0000
> [    7.124631] pci 0000:00:10.0: reg 0x10: [mem 0xf3000000-0xf307ffff]
> [    7.200827] pci 0000:00:11.0: [1002:4c50] type 00 class 0x038000
> [    7.272082] pci 0000:00:11.0: reg 0x10: [mem 0x82000000-0x82ffffff]
> [    7.347336] pci 0000:00:11.0: reg 0x14: [io  0x0400-0x04ff]
> [    7.414246] pci 0000:00:11.0: reg 0x18: [mem 0x82fff000-0x82ffffff]
> [    7.489567] pci 0000:00:11.0: reg 0x30: [mem 0xfd000000-0xfd01ffff pref]
> [    7.570113] pci 0000:00:11.0: supports D1 D2
> [    7.622206] pci 0000:00:13.0: [104c:ac15] type 02 class 0x060700
> [    7.693527] pci 0000:00:13.0: reg 0x10: [mem 0x81803000-0x81803fff]
> [    7.769592] pci 0000:00:13.1: [104c:ac15] type 02 class 0x060700
> [    7.841140] pci 0000:00:13.1: reg 0x10: [mem 0x81802000-0x81802fff]
> [    7.918261] pci_bus 0000:01: extended config space not accessible
> [    7.990055] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 04
> [    8.069175] pci_bus 0000:05: extended config space not accessible
> [    8.142536] pci_bus 0000:05: busn_res: [bus 05-ff] end is updated to 08
> [    8.221620] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 08
> [    8.301308] PCI: Cannot allocate resource region 2 of device 0000:00:11.0, will remap
> [    8.395264] PCI 0000:00 Cannot reserve Legacy IO [io  0x0000-0x0fff]
> [    8.471672] pci 0000:00:13.0: BAR 9: assigned [mem 0x84000000-0x87ffffff pref]
> [    8.558317] pci 0000:00:13.0: BAR 10: assigned [mem 0x88000000-0x8bffffff]
> [    8.640898] pci 0000:00:13.1: BAR 9: assigned [mem 0x8c000000-0x8fffffff pref]
> [    8.727690] pci 0000:00:13.1: BAR 10: assigned [mem 0x90000000-0x93ffffff]
> [    8.810457] pci 0000:00:11.0: BAR 6: assigned [mem 0xfd000000-0xfd01ffff pref]
> [    8.897101] pci 0000:00:11.0: BAR 2: assigned [mem 0xfd020000-0xfd020fff]
> [    8.978667] pci 0000:00:13.0: BAR 7: assigned [io  0x1000-0x10ff]
> [    9.051864] pci 0000:00:13.0: BAR 8: assigned [io  0x1100-0x11ff]
> [    9.125064] pci 0000:00:13.1: BAR 7: assigned [io  0x1200-0x12ff]
> [    9.198269] pci 0000:00:13.1: BAR 8: assigned [io  0x1300-0x13ff]
> [    9.271483] pci 0000:00:13.0: CardBus bridge to [bus 01-04]
> [    9.338395] pci 0000:00:13.0:   bridge window [io  0x1000-0x10ff]
> [    9.411598] pci 0000:00:13.0:   bridge window [io  0x1100-0x11ff]
> [    9.484802] pci 0000:00:13.0:   bridge window [mem 0x84000000-0x87ffffff pref]
> [    9.571597] pci 0000:00:13.0:   bridge window [mem 0x88000000-0x8bffffff]
> [    9.653165] pci 0000:00:13.1: CardBus bridge to [bus 05-08]
> [    9.720086] pci 0000:00:13.1:   bridge window [io  0x1200-0x12ff]
> [    9.793366] pci 0000:00:13.1:   bridge window [io  0x1300-0x13ff]
> [    9.866498] pci 0000:00:13.1:   bridge window [mem 0x8c000000-0x8fffffff pref]
> [    9.953294] pci 0000:00:13.1:   bridge window [mem 0x90000000-0x93ffffff]
> [   10.034865] pci_bus 0000:00: resource 4 [io  0x0000-0x7fffff]
> [   10.103874] pci_bus 0000:00: resource 5 [mem 0xfd000000-0xfdffffff]
> [   10.179168] pci_bus 0000:00: resource 6 [mem 0x80000000-0xfcffffff]
> [   10.254461] pci_bus 0000:01: resource 0 [io  0x1000-0x10ff]
> [   10.321391] pci_bus 0000:01: resource 1 [io  0x1100-0x11ff]
> [   10.388316] pci_bus 0000:01: resource 2 [mem 0x84000000-0x87ffffff pref]
> [   10.468841] pci_bus 0000:01: resource 3 [mem 0x88000000-0x8bffffff]
> [   10.544134] pci_bus 0000:05: resource 0 [io  0x1200-0x12ff]
> [   10.611058] pci_bus 0000:05: resource 1 [io  0x1300-0x13ff]
> [   10.677989] pci_bus 0000:05: resource 2 [mem 0x8c000000-0x8fffffff pref]
> [   10.758507] pci_bus 0000:05: resource 3 [mem 0x90000000-0x93ffffff]
> [   10.898594] vgaarb: loaded
> [   10.931312] SCSI subsystem initialized
> [   10.975369] usbcore: registered new interface driver usbfs
> [   11.040901] usbcore: registered new interface driver hub
> [   11.104378] usbcore: registered new device driver usb
> [   11.170053] clocksource: Switched to clocksource timebase
> [   11.276916] NET: Registered protocol family 2
> [   11.330625] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 6144 bytes)
> [   11.420991] TCP established hash table entries: 4096 (order: 2, 16384 bytes)
> [   11.505653] TCP bind hash table entries: 4096 (order: 3, 32768 bytes)
> [   11.583095] TCP: Hash tables configured (established 4096 bind 4096)
> [   11.659434] UDP hash table entries: 256 (order: 1, 8192 bytes)
> [   11.729313] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
> [   11.805155] NET: Registered protocol family 1
> [   11.857851] RPC: Registered named UNIX socket transport module.
> [   11.927797] RPC: Registered udp transport module.
> [   11.984240] RPC: Registered tcp transport module.
> [   12.040709] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [   12.118278] PCI: CLS 32 bytes, default 32
> [   12.167681] Thermal assist unit
> [   12.167688] using timers,
> [   12.204947] shrink_timer: 200 jiffies
> [   12.285360] Initialise system trusted keyrings
> [   12.338272] workingset: timestamp_bits=30 max_order=17 bucket_order=0
> [   12.415177] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [   24.651142] Key type asymmetric registered
> [   24.698347] Asymmetric key parser 'x509' registered
> [   24.757356] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
> [   24.845895] io scheduler mq-deadline registered
> [   24.900069] io scheduler kyber registered
> [   24.949721] atyfb 0000:00:11.0: enabling device (0086 -> 0087)
> [   25.018669] atyfb: using auxiliary register aperture
> [   25.078882] atyfb: 3D RAGE LT PRO (Mach64 LP, PCI) [0x4c50 rev 0xdc]
> [   25.154242] atyfb: 4M SGRAM (1:1), 29.498928 MHz XTAL, 230 MHz PLL, 100 Mhz MCLK, 100 MHz XCLK
> [   25.311727] Console: switching to colour frame buffer device 128x48
> [   25.393746] atyfb: fb0: ATY Mach64 frame buffer device on PCI
> [   25.465544] pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
> [   25.553288] Non-volatile memory driver v1.3
> [   25.611564] brd: module loaded
> [   25.669889] loop: module loaded
> [   25.706428] MacIO PCI driver attached to Gatwick chipset
> [   25.769945] MacIO PCI driver attached to Heathrow chipset
> [   25.842400] swim3 0.00015000:floppy: [fd0] SWIM3 floppy controller in media bay
> [   25.932618] 0.00013020:ch-a: ttyS0 at MMIO 0xf3013020 (irq = 16, base_baud = 230400) is a Z85c30 ESCC - Serial port
> [   26.058459] 0.00013000:ch-b: ttyS1 at MMIO 0xf3013000 (irq = 17, base_baud = 230400) is a Z85c30 ESCC - Infrared port
> [   26.186786] macio: fixed media-bay irq on gatwick
> [   26.242712] macio: fixed left floppy irqs
> [   26.290523] swim3 1.00015000:floppy: [fd1] Couldn't request interrupt
> [   26.367458] swim3: probe of 1.00015000:floppy failed with error -16
> [   26.442501] macio: fixed left ide irqs
> [   26.487653] macio: fixed SCC irqs on gatwick
> [   26.539043] 1.00013020:ch-a: ttyS2 at MMIO 0xf4013020 (irq = 79, base_baud = 230400) is a Z85c30 ESCC - Internal modem
> [   26.668762] mediabay0: Registered Heathrow media-bay
> [   26.939422] mediabay1: Registered Heathrow media-bay
> [   26.997073] mediabay0: Bay contains an ATA device
> [   27.210473] PMU Backlight initialized (pmubl)
> [   27.262723] Uniform Multi-Platform E-IDE driver
> [   28.368835] ide-pmac: Found Apple Heathrow ATA controller (macio), bus ID 0, irq 30
> [   28.463347] Probing IDE interface ide0...
> [   28.869051] hda: SAMSUNG HM100JC, ATA DISK drive
> [   29.453887] random: fast init done
> [   29.570254] adb device [2]: 2 0xC3
> [   29.618380] adb device [3]: 3 0x1
> [   29.663900] adb device [7]: 7 0x1F
> [   29.720910] ADB keyboard at 2 has handler 0xC3
> [   29.776681] Detected ADB keyboard, type ANSI.
> [   29.831871] input: ADB keyboard as /devices/virtual/input/input0
> [   29.906693] hda: host max PIO4 wanted PIO255(auto-tune) selected PIO4
> [   29.986514] hda: MWDMA2 mode selected
> [   30.033814] input: ADB Powerbook buttons as /devices/virtual/input/input1
> [   30.118138] ide0 at 0xe1045000-0xe1045070,0xe1045160 on irq 30
> [   30.192469] ide-pmac: Found Apple Heathrow ATA controller (macio), bus ID 1 (mediabay), irq 36
> [   30.299391] Probing IDE interface ide1...
> [   30.412609] ADB mouse (trackpad) at 3 has handler 0x4
> [   30.476206] input: ADB mouse as /devices/virtual/input/input2
> [   30.889011] hdc: MATSHITADVD-ROM SR-8182, ATAPI CD/DVD-ROM drive
> [   31.379281] hdc: host max PIO4 wanted PIO255(auto-tune) selected PIO4
> [   31.459300] hdc: MWDMA2 mode selected
> [   31.506018] ide1 at 0xe104b000-0xe104b070,0xe104b160 on irq 36
> [   31.580403] ide-pmac: Found Apple Heathrow ATA controller (macio), bus ID 4 (mediabay), irq 36
> [   31.687369] genirq: Flags mismatch irq 36. 00000000 (ide2) vs. 00000000 (ide1)
> [   31.776841] ide2: disabled, unable to get IRQ 36
> [   31.834841] ide2: failed to initialize IDE interface
> [   31.897376] ide2: disabling port
> [   31.938867] ide-pmac: probe of 1.00021000:ata4 failed with error -1
> [   32.017021] ide-gd driver 1.18
> [   32.056731] hda: max request size: 1024KiB
> [   34.309043] hda: 195371568 sectors (100030 MB) w/8192KiB Cache, CHS=16383/255/63
> [   34.400766] hda: cache flushes supported
> [   34.463701]  hda: [mac] hda1 hda2 hda3 hda4 hda5 hda6 hda7 hda8 hda9 hda10 hda11 hda12 hda13 hda14 hda15
> [   34.589982] ide-cd driver 5.00
> [   34.633445] ide-cd: hdc: ATAPI 12X DVD-ROM drive, 512kB Cache
> [   34.705160] cdrom: Uniform CD-ROM driver Revision: 3.20
> [   34.777383] mesh: configured for synchronous 5 MB/s
> [   35.058944] mesh: performing initial bus reset...
> [   39.168977] scsi host0: MESH
> [   41.986409] eth0: BMAC at 00:05:02:07:5a:a6
> [   41.986423]
> [   42.065206] aoe: cannot create debugfs directory
> [   42.124930] aoe: AoE v85 initialised.
> [   42.171200] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [   42.252472] ehci-pci: EHCI PCI platform driver
> [   42.308931] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [   42.386046] ohci-pci: OHCI PCI platform driver
> [   42.442614] usbcore: registered new interface driver uas
> [   42.509535] usbcore: registered new interface driver usb-storage
> [   42.587749] mousedev: PS/2 mouse device common for all mice
> [   42.661012] rtc-generic rtc-generic: registered as rtc0
> [   42.727259] i2c /dev entries driver
> [   42.773732] PowerMac i2c bus pmu 2 registered
> [   42.830093] PowerMac i2c bus pmu 1 registered
> [   42.891093] usbcore: registered new interface driver usbhid
> [   42.960484] usbhid: USB HID core driver
> [   43.012330] NET: Registered protocol family 17
> [   43.068724] drmem: No dynamic reconfiguration memory found
> [   43.138959] Loading compiled-in X.509 certificates
> [   43.637737] EXT4-fs (hda11): mounting ext3 file system using the ext4 subsystem
> [   43.759598] EXT4-fs (hda11): mounted filesystem with ordered data mode. Opts: (null)
> [   43.855814] VFS: Mounted root (ext3 filesystem) readonly on device 3:11.
> [   43.941974] Freeing unused kernel memory: 264K
> [   43.997598] This architecture does not have kernel memory protection.
> [   44.077215] Run /sbin/init as init process
> [   46.583096] Disabling lock debugging due to kernel taint
> [   46.649135] Machine check in kernel mode.
> [   46.699359] Caused by (from SRR1=41020): Transfer error ack signal
> [   46.776706] Oops: Machine check, sig: 7 [#1]
> [   46.830093] BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 PowerMac
> [   46.899131] Modules linked in:
> [   46.937774] CPU: 0 PID: 1 Comm: init Tainted: G   M              5.1.0-pmac-ide #1
> [   47.030839] NIP:  c0018aa8 LR: c0018fcc CTR: 00000000
> [   47.093580] REGS: df437d40 TRAP: 0200   Tainted: G   M               (5.1.0-pmac-ide)
> [   47.189853] MSR:  00041020 <ME,IR>  CR: 42428084  XER: 00000000
> [   47.263133] DAR: 00000000 DSISR: dec05da0
> [   47.263133] GPR00: 00000bbb df437df0 df435160 000043cb b7ad4000 1ec0cb50 00000001 00020768
> [   47.263133] GPR08: 00000000 00739578 00009032 8021e59e 20424084 00000000 00000000 00000000
> [   47.263133] GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 dec0c000 c0730000
> [   47.263133] GPR24: dec0cb50 1fb21595 dec05da0 df437e18 dec07440 dffe13c0 1fb1e117 df437e18
> [   47.733625] NIP [c0018aa8] flush_hash_pages+0x70/0x164
> [   47.797425] LR [c0018fcc] flush_tlb_page+0x54/0x78
> [   47.857012] Call Trace:
> [   47.888320] [df437df0] [dffe13c0] 0xdffe13c0 (unreliable)
> [   47.955245] [df437e00] [c00f9418] ptep_clear_flush+0x3c/0x58
> [   48.025313] [df437e10] [c00ecf34] wp_page_copy+0x198/0x530
> [   48.093280] [df437e50] [c00ef5e0] do_wp_page+0x188/0x604
> [   48.159151] [df437e90] [c00f0838] handle_mm_fault+0x2f8/0x99c
> [   48.230265] [df437f00] [c0016528] do_page_fault+0x2a0/0x6b8
> [   48.299289] [df437f40] [c0012314] handle_page_fault+0x14/0x40
> [   48.370397] --- interrupt: 301 at 0xb7ab6444
> [   48.370397]     LR = 0xb7ab634c
> [   48.465462] Instruction dump:
> [   48.502950] 38c6ffff 4bffffe0 1c633810 5480273e 1c000111 7c630214 546b3870 508b56be
> [   48.598090] 656b8000 3d200074 39299578 8102009c <65080009> 7c004828 2c000000 4082000c
> [   48.695375] ---[ end trace c4d36e2b09ab4631 ]---
> [   48.752918]
> 
