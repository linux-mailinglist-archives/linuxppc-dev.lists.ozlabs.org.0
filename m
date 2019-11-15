Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0EBFD8E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 10:28:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DtLz5mdgzF5rK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 20:28:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DsNT3CmqzF5y8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 19:44:40 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6DDB3AC6F;
 Fri, 15 Nov 2019 08:44:35 +0000 (UTC)
Date: Fri, 15 Nov 2019 09:44:34 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: WARN_ONCE does not warn once
Message-ID: <20191115084434.GJ11661@kitsune.suse.cz>
References: <20191114164655.GH11661@kitsune.suse.cz>
 <20191114194417.GI11661@kitsune.suse.cz>
 <875zjleolv.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875zjleolv.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 15 Nov 2019 20:20:55 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 15, 2019 at 03:43:24PM +1100, Michael Ellerman wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> > On Thu, Nov 14, 2019 at 05:46:55PM +0100, Michal Suchánek wrote:
> >> Hello,
> >> 
> >> on powernv with 5.3.8 kernel I get flood of messages on boot.
> >> 
> >> The messages match WARN_ONCE(1, "opal: OPAL_CONSOLE_FLUSH missing.\n");
> >
> > Asking around it was pointed out that WARN_ONCE warns up to as many
> > times as you have CPUs.
> 
> Does it?
> 
> > Did not bother counting the messages but it may very well be the case it
> > is printed once for each CPU.
> 
> The way it's implemented is slightly racy, but I'd be surprised if every
> CPU hit that race all at once.

Printing a warn_once this early probably forces some peculiar timing.
grep  WARN.*__opal_flush_console dmesg.txt | wc -l gives exactly the
number of CPUs as shown by lscpu.

> 
> Can you give us the full dmesg?

Attaching.

Thanks

Michal

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg.txt"

[    0.000000] Reserving 2048MB of memory at 128MB for crashkernel (System RAM: 131072MB)
[    0.000000] hash-mmu: Page sizes from device-tree:
[    0.000000] hash-mmu: base_shift=12: shift=12, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=0
[    0.000000] hash-mmu: base_shift=12: shift=16, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=7
[    0.000000] hash-mmu: base_shift=12: shift=24, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=56
[    0.000000] hash-mmu: base_shift=16: shift=16, sllp=0x0110, avpnm=0x00000000, tlbiel=1, penc=1
[    0.000000] hash-mmu: base_shift=16: shift=24, sllp=0x0110, avpnm=0x00000000, tlbiel=1, penc=8
[    0.000000] hash-mmu: base_shift=24: shift=24, sllp=0x0100, avpnm=0x00000001, tlbiel=0, penc=0
[    0.000000] hash-mmu: base_shift=34: shift=34, sllp=0x0120, avpnm=0x000007ff, tlbiel=0, penc=3
[    0.000000] Page orders: linear mapping = 24, virtual = 16, io = 16, vmemmap = 24
[    0.000000] Using 1TB segments
[    0.000000] hash-mmu: Initializing hash mmu with SLB
[    0.000000] Linux version 5.3.8-11.gea9b07d-default (geeko@buildhost) (gcc version 7.4.1 20190905 [gcc-7-branch revision 275407] (SUSE Linux)) #1 SMP Tue Nov 12 18:12:29 UTC 2019 (ea9b07d)
[    0.000000] Found initrd at 0xc000000003470000:0xc000000003e59184
[    0.000000] Using PowerNV machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] CPU maps initialized for 8 threads per core
[    0.000000]  (thread shift is 3)
[    0.000000] Allocated 5888 bytes for 160 pacas
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x2000000000
[    0.000000] dcache_bsize      = 0x80
[    0.000000] icache_bsize      = 0x80
[    0.000000] cpu_features      = 0x000002ff8f5db1a7
[    0.000000]   possible        = 0x0001fbffcf5fb1a7
[    0.000000]   always          = 0x00000003800081a1
[    0.000000] cpu_user_features = 0xdc0065c2 0xef000000
[    0.000000] mmu_features      = 0x7c006001
[    0.000000] firmware_features = 0x0000000110000000
[    0.000000] hash-mmu: ppc64_pft_size    = 0x0
[    0.000000] hash-mmu: htab_hash_mask    = 0xfffff
[    0.000000] hash-mmu: kernel vmalloc start   = 0xc008000000000000
[    0.000000] hash-mmu: kernel IO start        = 0xc00a000000000000
[    0.000000] hash-mmu: kernel vmemmap start   = 0xc00c000000000000
[    0.000000] -----------------------------------------------------
[    0.000000] cma: Reserved 6560 MiB at 0x0000001e56000000
[    0.000000] numa:   NODE_DATA [mem 0xfffca8980-0xfffcaffff]
[    0.000000] numa:   NODE_DATA [mem 0x1fff4c0980-0x1fff4c7fff]
[    0.000000] numa:     NODE_DATA(1) on node 16
[    0.000000] numa:   NODE_DATA [mem 0x1fff4b9300-0x1fff4c097f]
[    0.000000] numa:   NODE_DATA [mem 0x1fff491c80-0x1fff4992ff]
[    0.000000] numa:     NODE_DATA(17) on node 16
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] rfi-flush: patched 8 locations (fallback displacement flush)
[    0.000000] count-cache-flush: software flush disabled.
[    0.000000] stf-barrier: hwsync barrier available
[    0.000000] stf-barrier: patched 59 entry locations (hwsync barrier)
[    0.000000] stf-barrier: patched 8 exit locations (hwsync barrier)
[    0.000000] Initializing IODA2 PHB (/pciex@3fffe40000000)
[    0.000000] PCI host bridge /pciex@3fffe40000000 (primary) ranges:
[    0.000000]  MEM 0x00003fe000000000..0x00003fe07ffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x00003b0000000000..0x00003b0fffffffff -> 0x00003b0000000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x1000000000 [segment=0x10000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0x800)
[    0.000000] Initializing IODA2 PHB (/pciex@3fffe40100000)
[    0.000000] PCI host bridge /pciex@3fffe40100000  ranges:
[    0.000000]  MEM 0x00003fe080000000..0x00003fe0fffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x00003b1000000000..0x00003b1fffffffff -> 0x00003b1000000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x1000000000 [segment=0x10000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0x1000)
[    0.000000] Initializing IODA2 PHB (/pciex@3fffe40400000)
[    0.000000] PCI host bridge /pciex@3fffe40400000  ranges:
[    0.000000]  MEM 0x00003fe200000000..0x00003fe27ffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x00003b4000000000..0x00003b4fffffffff -> 0x00003b4000000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x1000000000 [segment=0x10000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0x2800)
[    0.000000] Initializing IODA2 PHB (/pciex@3fffe40500000)
[    0.000000] PCI host bridge /pciex@3fffe40500000  ranges:
[    0.000000]  MEM 0x00003fe280000000..0x00003fe2fffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x00003b5000000000..0x00003b5fffffffff -> 0x00003b5000000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x1000000000 [segment=0x10000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0x3000)
[    0.000000] Initializing IODA2 PHB (/pciex@3fffe42000000)
[    0.000000] PCI host bridge /pciex@3fffe42000000  ranges:
[    0.000000]  MEM 0x00003ff000000000..0x00003ff07ffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x00003d0000000000..0x00003d0fffffffff -> 0x00003d0000000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x1000000000 [segment=0x10000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0x20800)
[    0.000000] Initializing IODA2 PHB (/pciex@3fffe42400000)
[    0.000000] PCI host bridge /pciex@3fffe42400000  ranges:
[    0.000000]  MEM 0x00003ff200000000..0x00003ff27ffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x00003d4000000000..0x00003d4fffffffff -> 0x00003d4000000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x1000000000 [segment=0x10000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0x22800)
[    0.000000] Initializing IODA2 PHB (/pciex@3fffe42500000)
[    0.000000] PCI host bridge /pciex@3fffe42500000  ranges:
[    0.000000]  MEM 0x00003ff280000000..0x00003ff2fffeffff -> 0x0000000080000000 
[    0.000000]  MEM 0x00003d5000000000..0x00003d5fffffffff -> 0x00003d5000000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   256 (255) PE's M32: 0x80000000 [segment=0x800000]
[    0.000000]                  M64: 0x1000000000 [segment=0x10000000]
[    0.000000]   Allocated bitmap for 2040 MSIs (base IRQ 0x23000)
[    0.000000] OPAL nvram setup, 1048576 bytes
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] barrier-nospec: patched 514 locations
[    0.000000] Top of RAM: 0x2000000000, Total RAM: 0x2000000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x0000001fffffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000fffffffff]
[    0.000000]   node  16: [mem 0x0000001000000000-0x0000001fffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000000fffffffff]
[    0.000000] On node 0 totalpages: 1048576
[    0.000000]   Normal zone: 1024 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 1048576 pages, LIFO batch:3
[    0.000000] Could not find start_pfn for node 1
[    0.000000] Initmem setup node 1 [mem 0x0000000000000000-0x0000000000000000]
[    0.000000] On node 1 totalpages: 0
[    0.000000] Initmem setup node 16 [mem 0x0000001000000000-0x0000001fffffffff]
[    0.000000] On node 16 totalpages: 1048576
[    0.000000]   Normal zone: 1024 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 1048576 pages, LIFO batch:3
[    0.000000] Could not find start_pfn for node 17
[    0.000000] Initmem setup node 17 [mem 0x0000000000000000-0x0000000000000000]
[    0.000000] On node 17 totalpages: 0
[    0.000000] percpu: Embedded 11 pages/cpu s627608 r0 d93288 u1048576
[    0.000000] pcpu-alloc: s627608 r0 d93288 u1048576 alloc=1*1048576
[    0.000000] pcpu-alloc: [0] 000 [0] 001 [0] 002 [0] 003 
[    0.000000] pcpu-alloc: [0] 004 [0] 005 [0] 006 [0] 007 
[    0.000000] pcpu-alloc: [0] 008 [0] 009 [0] 010 [0] 011 
[    0.000000] pcpu-alloc: [0] 012 [0] 013 [0] 014 [0] 015 
[    0.000000] pcpu-alloc: [0] 016 [0] 017 [0] 018 [0] 019 
[    0.000000] pcpu-alloc: [0] 020 [0] 021 [0] 022 [0] 023 
[    0.000000] pcpu-alloc: [0] 024 [0] 025 [0] 026 [0] 027 
[    0.000000] pcpu-alloc: [0] 028 [0] 029 [0] 030 [0] 031 
[    0.000000] pcpu-alloc: [0] 032 [0] 033 [0] 034 [0] 035 
[    0.000000] pcpu-alloc: [0] 036 [0] 037 [0] 038 [0] 039 
[    0.000000] pcpu-alloc: [1] 040 [1] 041 [1] 042 [1] 043 
[    0.000000] pcpu-alloc: [1] 044 [1] 045 [1] 046 [1] 047 
[    0.000000] pcpu-alloc: [1] 048 [1] 049 [1] 050 [1] 051 
[    0.000000] pcpu-alloc: [1] 052 [1] 053 [1] 054 [1] 055 
[    0.000000] pcpu-alloc: [1] 056 [1] 057 [1] 058 [1] 059 
[    0.000000] pcpu-alloc: [1] 060 [1] 061 [1] 062 [1] 063 
[    0.000000] pcpu-alloc: [1] 064 [1] 065 [1] 066 [1] 067 
[    0.000000] pcpu-alloc: [1] 068 [1] 069 [1] 070 [1] 071 
[    0.000000] pcpu-alloc: [1] 072 [1] 073 [1] 074 [1] 075 
[    0.000000] pcpu-alloc: [1] 076 [1] 077 [1] 078 [1] 079 
[    0.000000] pcpu-alloc: [2] 080 [2] 081 [2] 082 [2] 083 
[    0.000000] pcpu-alloc: [2] 084 [2] 085 [2] 086 [2] 087 
[    0.000000] pcpu-alloc: [2] 088 [2] 089 [2] 090 [2] 091 
[    0.000000] pcpu-alloc: [2] 092 [2] 093 [2] 094 [2] 095 
[    0.000000] pcpu-alloc: [2] 096 [2] 097 [2] 098 [2] 099 
[    0.000000] pcpu-alloc: [2] 100 [2] 101 [2] 102 [2] 103 
[    0.000000] pcpu-alloc: [2] 104 [2] 105 [2] 106 [2] 107 
[    0.000000] pcpu-alloc: [2] 108 [2] 109 [2] 110 [2] 111 
[    0.000000] pcpu-alloc: [2] 112 [2] 113 [2] 114 [2] 115 
[    0.000000] pcpu-alloc: [2] 116 [2] 117 [2] 118 [2] 119 
[    0.000000] pcpu-alloc: [3] 120 [3] 121 [3] 122 [3] 123 
[    0.000000] pcpu-alloc: [3] 124 [3] 125 [3] 126 [3] 127 
[    0.000000] pcpu-alloc: [3] 128 [3] 129 [3] 130 [3] 131 
[    0.000000] pcpu-alloc: [3] 132 [3] 133 [3] 134 [3] 135 
[    0.000000] pcpu-alloc: [3] 136 [3] 137 [3] 138 [3] 139 
[    0.000000] pcpu-alloc: [3] 140 [3] 141 [3] 142 [3] 143 
[    0.000000] pcpu-alloc: [3] 144 [3] 145 [3] 146 [3] 147 
[    0.000000] pcpu-alloc: [3] 148 [3] 149 [3] 150 [3] 151 
[    0.000000] pcpu-alloc: [3] 152 [3] 153 [3] 154 [3] 155 
[    0.000000] pcpu-alloc: [3] 156 [3] 157 [3] 158 [3] 159 
[    0.000000] Built 4 zonelists, mobility grouping on.  Total pages: 2095104
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: root=UUID=803b3392-d9e6-47d8-ac57-313cf2d39e0c  console=hvc0 showopts crashkernel=2048M xmon=off 
[    0.000000] printk: log_buf_len individual max cpu contribution: 4096 bytes
[    0.000000] printk: log_buf_len total cpu_extra contributions: 651264 bytes
[    0.000000] printk: log_buf_len min size: 524288 bytes
[    0.000000] printk: log_buf_len: 2097152 bytes
[    0.000000] printk: early log buf free: 512428(97%)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 0K/134217728K available (12416K kernel code, 1664K rwdata, 3584K rodata, 4736K init, 11638K bss, 2653120K reserved, 6717440K cma-reserved)
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=160, Nodes=18
[    0.000000] ftrace: allocating 30761 entries in 12 pages
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=2048 to nr_cpu_ids=160.
[    0.000000] 	Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=160
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] ICS OPAL backend registered
[    0.000000] rcu: 	Offload RCU callbacks from CPUs: (none).
[    0.000000] time_init: decrementer frequency = 512.000000 MHz
[    0.000000] time_init: processor frequency   = 3458.000000 MHz
[    0.000002] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.001299] clocksource: timebase mult[1f40000] shift[24] registered
[    0.002027] clockevent: decrementer mult[83126e98] shift[32] cpu[0]
[    0.002092] ------------[ cut here ]------------
[    0.002094] opal: OPAL_CONSOLE_FLUSH missing.
[    0.002095] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.002096] Modules linked in:
[    0.002097] Supported: No, Unreleased kernel
[    0.002099] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.002100] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.002101] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.002102] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.002107] CFAR: c000000000132df0 IRQMASK: 1 
[    0.002109] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.002112] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.002115] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.002119] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.002122] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.002125] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.002129] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.002132] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.002136] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.002137] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.002137] Call Trace:
[    0.002138] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.002140] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.002142] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.002144] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.002145] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.002147] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.002148] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.002150] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.002151] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.002153] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.002154] Instruction dump:
[    0.002155] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.002160] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.002165] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.002166] ---[ end trace 0000000000000000 ]---
[    0.002167] ------------[ cut here ]------------
[    0.002168] opal: OPAL_CONSOLE_FLUSH missing.
[    0.002169] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.002170] Modules linked in:
[    0.002171] Supported: No, Unreleased kernel
[    0.002172] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.002173] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.002175] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.002175] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.002181] CFAR: c000000000132df0 IRQMASK: 1 
[    0.002182] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.002185] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.002189] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.002192] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.002195] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.002198] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.002202] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.002205] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.002209] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.002210] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.002210] Call Trace:
[    0.002211] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.002213] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.002215] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.002216] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.002218] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.002219] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.002221] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.002223] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.002224] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.002226] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.002227] Instruction dump:
[    0.002228] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.002232] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.002238] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.002238] ---[ end trace 0000000000000000 ]---
[    0.002240] ------------[ cut here ]------------
[    0.002240] opal: OPAL_CONSOLE_FLUSH missing.
[    0.002242] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.002242] Modules linked in:
[    0.002244] Supported: No, Unreleased kernel
[    0.002245] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.002246] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.002247] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.002248] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.002253] CFAR: c000000000132df0 IRQMASK: 1 
[    0.002255] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.002258] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.002261] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.002265] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.002268] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.002271] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.002274] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.002278] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.002282] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.002282] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.002283] Call Trace:
[    0.002284] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.002286] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.002288] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.002289] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.002291] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.002293] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.002294] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.002296] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.002297] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.002299] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.002300] Instruction dump:
[    0.002301] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.002305] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.002310] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.002311] ---[ end trace 0000000000000000 ]---
[    0.002312] ------------[ cut here ]------------
[    0.002313] opal: OPAL_CONSOLE_FLUSH missing.
[    0.002315] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.002315] Modules linked in:
[    0.002316] Supported: No, Unreleased kernel
[    0.002318] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.002319] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.002320] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.002321] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.002326] CFAR: c000000000132df0 IRQMASK: 1 
[    0.002328] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.002331] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.002334] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.002337] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.002341] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.002344] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.002347] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.002350] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.002354] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.002355] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.002356] Call Trace:
[    0.002357] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.002359] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.002360] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.002362] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.002363] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.002365] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.002367] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.002368] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.002370] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.002371] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.002372] Instruction dump:
[    0.002373] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.002378] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.002383] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.002384] ---[ end trace 0000000000000000 ]---
[    0.002385] ------------[ cut here ]------------
[    0.002386] opal: OPAL_CONSOLE_FLUSH missing.
[    0.002387] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.002388] Modules linked in:
[    0.002389] Supported: No, Unreleased kernel
[    0.002390] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.002391] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.002392] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.002393] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.002399] CFAR: c000000000132df0 IRQMASK: 1 
[    0.002400] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.002403] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.002407] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.002410] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.002413] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.002416] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.002420] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.002423] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.002427] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.002428] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.002428] Call Trace:
[    0.002429] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.002431] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.002433] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.002434] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.002436] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.002438] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.002439] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.002441] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.002442] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.002444] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.002445] Instruction dump:
[    0.002446] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.002450] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.002456] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.002456] ---[ end trace 0000000000000000 ]---
[    0.002458] ------------[ cut here ]------------
[    0.002458] opal: OPAL_CONSOLE_FLUSH missing.
[    0.002460] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.002460] Modules linked in:
[    0.002462] Supported: No, Unreleased kernel
[    0.002463] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.002464] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.002465] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.002466] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.002471] CFAR: c000000000132df0 IRQMASK: 1 
[    0.002473] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.002476] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.002479] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.002483] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.002486] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.002489] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.002492] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.002495] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.002499] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.002500] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.002501] Call Trace:
[    0.002502] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.002504] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.002505] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.002507] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.002508] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.002510] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.002512] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.002513] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.002515] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.002516] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.002517] Instruction dump:
[    0.002518] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.002523] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.002528] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.002529] ---[ end trace 0000000000000000 ]---
[    0.002530] ------------[ cut here ]------------
[    0.002531] opal: OPAL_CONSOLE_FLUSH missing.
[    0.002532] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.002533] Modules linked in:
[    0.002534] Supported: No, Unreleased kernel
[    0.002535] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.002536] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.002538] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.002538] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.002544] CFAR: c000000000132df0 IRQMASK: 1 
[    0.002545] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.002548] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.002552] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.002555] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.002558] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.002562] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.002565] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.002568] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.002572] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.002573] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.002573] Call Trace:
[    0.002574] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.002576] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.002578] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.002580] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.002581] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.002583] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.002584] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.002586] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.002587] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.002589] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.002590] Instruction dump:
[    0.002591] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.002596] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.002601] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.002602] ---[ end trace 0000000000000000 ]---
[    0.002603] ------------[ cut here ]------------
[    0.002604] opal: OPAL_CONSOLE_FLUSH missing.
[    0.002605] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.002606] Modules linked in:
[    0.002607] Supported: No, Unreleased kernel
[    0.002608] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.002609] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.002610] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.002611] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.002616] CFAR: c000000000132df0 IRQMASK: 1 
[    0.002618] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.002621] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.002624] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.002627] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.002631] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.002634] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.002637] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.002640] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.002644] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.002645] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.002646] Call Trace:
[    0.002647] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.002649] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.002650] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.002652] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.002653] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.002655] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.002657] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.002658] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.002660] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.002661] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.002662] Instruction dump:
[    0.002663] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.002668] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.002673] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.002674] ---[ end trace 0000000000000000 ]---
[    0.002675] ------------[ cut here ]------------
[    0.002676] opal: OPAL_CONSOLE_FLUSH missing.
[    0.002677] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.002678] Modules linked in:
[    0.002679] Supported: No, Unreleased kernel
[    0.002680] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.002681] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.002683] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.002683] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.002689] CFAR: c000000000132df0 IRQMASK: 1 
[    0.002690] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.002693] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.002697] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.002700] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.002703] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.002707] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.002710] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.002713] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.002717] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.002718] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.002718] Call Trace:
[    0.002719] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.002722] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.002723] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.002725] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.002726] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.002728] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.002729] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.002731] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.002732] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.002734] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.002735] Instruction dump:
[    0.002736] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.002741] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.002746] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.002747] ---[ end trace 0000000000000000 ]---
[    0.002748] ------------[ cut here ]------------
[    0.002748] opal: OPAL_CONSOLE_FLUSH missing.
[    0.002750] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.002750] Modules linked in:
[    0.002752] Supported: No, Unreleased kernel
[    0.002753] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.002754] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.002755] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.002756] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.002761] CFAR: c000000000132df0 IRQMASK: 1 
[    0.002763] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.002766] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.002769] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.002772] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.002776] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.002779] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.002782] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.002785] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.002789] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.002790] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.002791] Call Trace:
[    0.002792] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.002794] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.002795] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.002797] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.002798] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.002800] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.002802] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.002803] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.002805] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.002806] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.002807] Instruction dump:
[    0.002808] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.002813] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.002818] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.002819] ---[ end trace 0000000000000000 ]---
[    0.002820] ------------[ cut here ]------------
[    0.002821] opal: OPAL_CONSOLE_FLUSH missing.
[    0.002822] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.002823] Modules linked in:
[    0.002824] Supported: No, Unreleased kernel
[    0.002825] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.002826] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.002827] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.002828] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.002833] CFAR: c000000000132df0 IRQMASK: 1 
[    0.002835] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.002838] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.002842] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.002845] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.002848] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.002851] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.002855] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.002858] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.002862] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.002862] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.002863] Call Trace:
[    0.002864] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.002866] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.002868] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.002869] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.002871] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.002872] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.002874] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.002876] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.002877] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.002879] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.002880] Instruction dump:
[    0.002881] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.002885] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.002890] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.002891] ---[ end trace 0000000000000000 ]---
[    0.002892] ------------[ cut here ]------------
[    0.002893] opal: OPAL_CONSOLE_FLUSH missing.
[    0.002895] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.002895] Modules linked in:
[    0.002896] Supported: No, Unreleased kernel
[    0.002898] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.002899] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.002900] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.002901] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.002906] CFAR: c000000000132df0 IRQMASK: 1 
[    0.002908] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.002911] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.002914] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.002917] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.002920] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.002924] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.002927] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.002930] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.002934] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.002935] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.002935] Call Trace:
[    0.002936] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.002938] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.002940] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.002941] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.002943] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.002944] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.002946] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.002948] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.002949] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.002951] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.002952] Instruction dump:
[    0.002953] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.002957] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.002962] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.002963] ---[ end trace 0000000000000000 ]---
[    0.002964] ------------[ cut here ]------------
[    0.002965] opal: OPAL_CONSOLE_FLUSH missing.
[    0.002967] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.002967] Modules linked in:
[    0.002969] Supported: No, Unreleased kernel
[    0.002970] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.002971] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.002972] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.002973] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.002978] CFAR: c000000000132df0 IRQMASK: 1 
[    0.002980] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.002983] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.002986] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.002990] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.002993] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.002996] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.002999] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.003003] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.003006] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.003007] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.003008] Call Trace:
[    0.003009] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.003011] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.003012] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.003014] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.003015] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.003017] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.003019] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.003020] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.003022] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.003023] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.003024] Instruction dump:
[    0.003025] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.003030] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.003035] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.003036] ---[ end trace 0000000000000000 ]---
[    0.003037] ------------[ cut here ]------------
[    0.003038] opal: OPAL_CONSOLE_FLUSH missing.
[    0.003039] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.003040] Modules linked in:
[    0.003041] Supported: No, Unreleased kernel
[    0.003042] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.003044] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.003045] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.003045] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.003051] CFAR: c000000000132df0 IRQMASK: 1 
[    0.003052] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.003056] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.003059] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.003062] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.003065] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.003069] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.003072] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.003075] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.003079] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.003080] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.003081] Call Trace:
[    0.003082] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.003084] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.003085] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.003087] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.003088] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.003090] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.003091] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.003093] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.003094] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.003096] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.003097] Instruction dump:
[    0.003098] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.003102] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.003108] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.003108] ---[ end trace 0000000000000000 ]---
[    0.003110] ------------[ cut here ]------------
[    0.003110] opal: OPAL_CONSOLE_FLUSH missing.
[    0.003112] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.003112] Modules linked in:
[    0.003114] Supported: No, Unreleased kernel
[    0.003115] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.003116] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.003117] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.003118] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.003123] CFAR: c000000000132df0 IRQMASK: 1 
[    0.003125] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.003128] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.003132] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.003135] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.003138] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.003141] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.003144] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.003148] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.003151] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.003152] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.003153] Call Trace:
[    0.003154] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.003156] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.003157] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.003159] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.003161] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.003162] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.003164] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.003165] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.003167] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.003168] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.003170] Instruction dump:
[    0.003171] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.003175] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.003180] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.003181] ---[ end trace 0000000000000000 ]---
[    0.003182] ------------[ cut here ]------------
[    0.003183] opal: OPAL_CONSOLE_FLUSH missing.
[    0.003185] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.003185] Modules linked in:
[    0.003186] Supported: No, Unreleased kernel
[    0.003188] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.003189] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.003190] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.003191] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.003196] CFAR: c000000000132df0 IRQMASK: 1 
[    0.003197] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.003201] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.003204] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.003207] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.003211] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.003214] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.003217] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.003221] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.003224] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.003225] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.003226] Call Trace:
[    0.003227] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.003229] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.003230] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.003232] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.003233] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.003235] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.003237] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.003238] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.003240] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.003241] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.003242] Instruction dump:
[    0.003243] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.003248] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.003253] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.003254] ---[ end trace 0000000000000000 ]---
[    0.003255] ------------[ cut here ]------------
[    0.003256] opal: OPAL_CONSOLE_FLUSH missing.
[    0.003257] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.003258] Modules linked in:
[    0.003259] Supported: No, Unreleased kernel
[    0.003260] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.003261] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.003263] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.003263] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.003269] CFAR: c000000000132df0 IRQMASK: 1 
[    0.003270] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.003273] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.003277] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.003280] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.003283] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.003287] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.003290] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.003293] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.003297] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.003298] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.003298] Call Trace:
[    0.003299] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.003301] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.003303] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.003305] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.003306] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.003308] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.003309] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.003311] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.003312] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.003314] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.003315] Instruction dump:
[    0.003316] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.003320] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.003325] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.003326] ---[ end trace 0000000000000000 ]---
[    0.003327] ------------[ cut here ]------------
[    0.003328] opal: OPAL_CONSOLE_FLUSH missing.
[    0.003330] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.003330] Modules linked in:
[    0.003331] Supported: No, Unreleased kernel
[    0.003333] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.003334] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.003335] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.003336] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.003341] CFAR: c000000000132df0 IRQMASK: 1 
[    0.003343] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.003346] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.003349] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.003352] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.003355] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.003359] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.003362] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.003365] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.003369] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.003370] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.003370] Call Trace:
[    0.003371] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.003374] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.003375] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.003377] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.003378] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.003380] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.003381] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.003383] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.003384] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.003386] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.003387] Instruction dump:
[    0.003388] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.003393] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.003398] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.003399] ---[ end trace 0000000000000000 ]---
[    0.003400] ------------[ cut here ]------------
[    0.003401] opal: OPAL_CONSOLE_FLUSH missing.
[    0.003402] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.003403] Modules linked in:
[    0.003404] Supported: No, Unreleased kernel
[    0.003405] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.003406] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.003407] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.003408] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.003414] CFAR: c000000000132df0 IRQMASK: 1 
[    0.003415] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.003418] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.003421] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.003425] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.003428] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.003431] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.003435] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.003438] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.003442] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.003442] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.003443] Call Trace:
[    0.003444] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.003446] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.003448] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.003449] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.003451] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.003452] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.003454] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.003455] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.003457] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.003458] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.003460] Instruction dump:
[    0.003461] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.003465] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.003470] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.003471] ---[ end trace 0000000000000000 ]---
[    0.003472] ------------[ cut here ]------------
[    0.003473] opal: OPAL_CONSOLE_FLUSH missing.
[    0.003475] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.003475] Modules linked in:
[    0.003477] Supported: No, Unreleased kernel
[    0.003478] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.003479] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.003480] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.003481] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.003486] CFAR: c000000000132df0 IRQMASK: 1 
[    0.003488] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.003491] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.003494] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.003497] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.003501] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.003504] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.003507] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.003510] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.003514] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.003515] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.003515] Call Trace:
[    0.003517] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.003519] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.003520] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.003522] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.003523] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.003525] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.003526] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.003528] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.003529] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.003531] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.003532] Instruction dump:
[    0.003533] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.003538] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.003543] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.003544] ---[ end trace 0000000000000000 ]---
[    0.003545] ------------[ cut here ]------------
[    0.003546] opal: OPAL_CONSOLE_FLUSH missing.
[    0.003547] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.003548] Modules linked in:
[    0.003549] Supported: No, Unreleased kernel
[    0.003550] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.003551] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.003553] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.003553] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.003559] CFAR: c000000000132df0 IRQMASK: 1 
[    0.003560] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.003563] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.003567] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.003570] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.003573] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.003577] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.003580] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.003583] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.003587] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.003588] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.003588] Call Trace:
[    0.003589] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.003591] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.003593] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.003594] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.003596] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.003598] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.003599] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.003601] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.003602] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.003604] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.003605] Instruction dump:
[    0.003606] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.003610] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.003616] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.003616] ---[ end trace 0000000000000000 ]---
[    0.003618] ------------[ cut here ]------------
[    0.003618] opal: OPAL_CONSOLE_FLUSH missing.
[    0.003620] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.003620] Modules linked in:
[    0.003622] Supported: No, Unreleased kernel
[    0.003623] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.003624] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.003625] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.003626] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.003631] CFAR: c000000000132df0 IRQMASK: 1 
[    0.003633] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.003636] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.003639] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.003642] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.003646] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.003649] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.003652] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.003656] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.003659] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.003660] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.003661] Call Trace:
[    0.003662] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.003664] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.003665] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.003667] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.003668] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.003670] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.003672] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.003673] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.003675] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.003676] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.003677] Instruction dump:
[    0.003678] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.003683] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.003688] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.003689] ---[ end trace 0000000000000000 ]---
[    0.003690] ------------[ cut here ]------------
[    0.003691] opal: OPAL_CONSOLE_FLUSH missing.
[    0.003692] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.003693] Modules linked in:
[    0.003694] Supported: No, Unreleased kernel
[    0.003695] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.003696] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.003698] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.003698] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.003704] CFAR: c000000000132df0 IRQMASK: 1 
[    0.003705] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.003708] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.003712] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.003715] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.003718] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.003721] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.003725] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.003728] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.003732] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.003733] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.003733] Call Trace:
[    0.003734] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.003736] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.003738] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.003739] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.003741] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.003743] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.003744] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.003746] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.003747] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.003749] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.003750] Instruction dump:
[    0.003751] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.003756] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.003761] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.003762] ---[ end trace 0000000000000000 ]---
[    0.003763] ------------[ cut here ]------------
[    0.003764] opal: OPAL_CONSOLE_FLUSH missing.
[    0.003765] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.003766] Modules linked in:
[    0.003767] Supported: No, Unreleased kernel
[    0.003768] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.003769] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.003771] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.003771] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.003777] CFAR: c000000000132df0 IRQMASK: 1 
[    0.003778] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.003781] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.003785] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.003788] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.003791] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.003794] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.003798] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.003801] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.003805] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.003806] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.003806] Call Trace:
[    0.003807] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.003809] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.003811] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.003812] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.003814] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.003816] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.003817] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.003819] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.003820] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.003822] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.003823] Instruction dump:
[    0.003824] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.003829] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.003834] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.003835] ---[ end trace 0000000000000000 ]---
[    0.003836] ------------[ cut here ]------------
[    0.003836] opal: OPAL_CONSOLE_FLUSH missing.
[    0.003838] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.003839] Modules linked in:
[    0.003840] Supported: No, Unreleased kernel
[    0.003841] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.003842] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.003843] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.003844] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.003849] CFAR: c000000000132df0 IRQMASK: 1 
[    0.003851] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.003854] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.003857] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.003861] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.003864] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.003867] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.003870] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.003874] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.003877] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.003878] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.003879] Call Trace:
[    0.003880] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.003882] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.003884] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.003885] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.003887] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.003888] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.003890] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.003892] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.003893] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.003895] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.003896] Instruction dump:
[    0.003897] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.003901] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.003906] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.003907] ---[ end trace 0000000000000000 ]---
[    0.003908] ------------[ cut here ]------------
[    0.003909] opal: OPAL_CONSOLE_FLUSH missing.
[    0.003910] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.003911] Modules linked in:
[    0.003912] Supported: No, Unreleased kernel
[    0.003914] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.003915] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.003916] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.003916] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.003922] CFAR: c000000000132df0 IRQMASK: 1 
[    0.003923] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.003927] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.003930] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.003933] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.003936] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.003940] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.003943] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.003946] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.003950] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.003951] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.003951] Call Trace:
[    0.003952] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.003954] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.003956] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.003958] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.003959] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.003961] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.003962] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.003964] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.003965] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.003967] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.003968] Instruction dump:
[    0.003969] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.003974] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.003979] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.003980] ---[ end trace 0000000000000000 ]---
[    0.003981] ------------[ cut here ]------------
[    0.003982] opal: OPAL_CONSOLE_FLUSH missing.
[    0.003983] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.003983] Modules linked in:
[    0.003985] Supported: No, Unreleased kernel
[    0.003986] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.003987] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.003988] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.003989] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.003994] CFAR: c000000000132df0 IRQMASK: 1 
[    0.003996] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.003999] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.004002] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.004006] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.004009] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.004012] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.004015] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.004019] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.004022] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.004023] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.004024] Call Trace:
[    0.004025] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.004027] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.004029] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.004030] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.004032] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.004033] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.004035] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.004036] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.004038] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.004039] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.004040] Instruction dump:
[    0.004042] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.004046] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.004051] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.004052] ---[ end trace 0000000000000000 ]---
[    0.004053] ------------[ cut here ]------------
[    0.004054] opal: OPAL_CONSOLE_FLUSH missing.
[    0.004055] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.004056] Modules linked in:
[    0.004057] Supported: No, Unreleased kernel
[    0.004059] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.004060] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.004061] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.004061] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.004067] CFAR: c000000000132df0 IRQMASK: 1 
[    0.004068] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.004071] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.004074] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.004078] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.004081] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.004084] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.004087] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.004091] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.004095] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.004095] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.004096] Call Trace:
[    0.004097] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.004099] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.004101] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.004102] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.004104] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.004105] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.004107] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.004108] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.004110] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.004111] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.004113] Instruction dump:
[    0.004114] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.004118] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.004123] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.004124] ---[ end trace 0000000000000000 ]---
[    0.004125] ------------[ cut here ]------------
[    0.004126] opal: OPAL_CONSOLE_FLUSH missing.
[    0.004128] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.004128] Modules linked in:
[    0.004129] Supported: No, Unreleased kernel
[    0.004131] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.004132] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.004133] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.004134] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.004139] CFAR: c000000000132df0 IRQMASK: 1 
[    0.004140] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.004144] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.004147] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.004150] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.004154] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.004157] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.004160] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.004163] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.004167] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.004168] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.004169] Call Trace:
[    0.004170] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.004172] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.004173] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.004175] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.004176] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.004178] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.004179] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.004181] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.004183] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.004184] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.004185] Instruction dump:
[    0.004186] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.004191] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.004196] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.004197] ---[ end trace 0000000000000000 ]---
[    0.004198] ------------[ cut here ]------------
[    0.004199] opal: OPAL_CONSOLE_FLUSH missing.
[    0.004200] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.004201] Modules linked in:
[    0.004202] Supported: No, Unreleased kernel
[    0.004203] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.004204] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.004206] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.004206] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.004212] CFAR: c000000000132df0 IRQMASK: 1 
[    0.004213] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.004216] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.004220] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.004223] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.004226] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.004229] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.004233] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.004236] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.004240] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.004241] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.004241] Call Trace:
[    0.004242] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.004244] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.004246] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.004247] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.004249] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.004250] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.004252] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.004254] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.004255] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.004257] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.004258] Instruction dump:
[    0.004259] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.004263] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.004268] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.004269] ---[ end trace 0000000000000000 ]---
[    0.004270] ------------[ cut here ]------------
[    0.004271] opal: OPAL_CONSOLE_FLUSH missing.
[    0.004272] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.004273] Modules linked in:
[    0.004274] Supported: No, Unreleased kernel
[    0.004276] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.004277] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.004278] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.004279] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.004284] CFAR: c000000000132df0 IRQMASK: 1 
[    0.004286] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.004289] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.004292] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.004295] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.004299] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.004302] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.004305] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.004309] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.004312] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.004313] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.004314] Call Trace:
[    0.004315] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.004317] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.004319] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.004320] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.004322] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.004323] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.004325] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.004326] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.004328] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.004329] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.004331] Instruction dump:
[    0.004332] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.004336] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.004341] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.004342] ---[ end trace 0000000000000000 ]---
[    0.004343] ------------[ cut here ]------------
[    0.004344] opal: OPAL_CONSOLE_FLUSH missing.
[    0.004345] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.004346] Modules linked in:
[    0.004347] Supported: No, Unreleased kernel
[    0.004349] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.004350] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.004351] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.004351] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.004357] CFAR: c000000000132df0 IRQMASK: 1 
[    0.004358] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.004362] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.004365] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.004368] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.004372] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.004375] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.004378] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.004382] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.004385] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.004386] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.004387] Call Trace:
[    0.004388] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.004390] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.004391] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.004393] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.004394] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.004396] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.004398] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.004399] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.004401] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.004402] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.004403] Instruction dump:
[    0.004404] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.004409] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.004414] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.004415] ---[ end trace 0000000000000000 ]---
[    0.004416] ------------[ cut here ]------------
[    0.004417] opal: OPAL_CONSOLE_FLUSH missing.
[    0.004418] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.004419] Modules linked in:
[    0.004420] Supported: No, Unreleased kernel
[    0.004421] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.004422] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.004423] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.004424] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.004429] CFAR: c000000000132df0 IRQMASK: 1 
[    0.004431] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.004434] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.004437] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.004441] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.004444] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.004447] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.004450] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.004454] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.004457] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.004458] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.004459] Call Trace:
[    0.004460] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.004462] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.004464] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.004465] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.004467] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.004468] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.004470] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.004471] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.004473] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.004474] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.004475] Instruction dump:
[    0.004477] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.004481] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.004486] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.004487] ---[ end trace 0000000000000000 ]---
[    0.004488] ------------[ cut here ]------------
[    0.004489] opal: OPAL_CONSOLE_FLUSH missing.
[    0.004491] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.004491] Modules linked in:
[    0.004492] Supported: No, Unreleased kernel
[    0.004494] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.004495] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.004496] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.004497] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.004502] CFAR: c000000000132df0 IRQMASK: 1 
[    0.004504] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.004507] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.004510] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.004513] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.004517] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.004520] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.004523] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.004526] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.004530] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.004531] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.004532] Call Trace:
[    0.004533] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.004535] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.004536] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.004538] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.004539] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.004541] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.004542] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.004544] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.004545] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.004547] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.004548] Instruction dump:
[    0.004549] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.004554] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.004559] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.004560] ---[ end trace 0000000000000000 ]---
[    0.004561] ------------[ cut here ]------------
[    0.004562] opal: OPAL_CONSOLE_FLUSH missing.
[    0.004563] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.004564] Modules linked in:
[    0.004565] Supported: No, Unreleased kernel
[    0.004566] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.004567] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.004569] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.004569] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.004575] CFAR: c000000000132df0 IRQMASK: 1 
[    0.004576] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.004579] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.004583] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.004586] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.004589] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.004592] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.004596] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.004599] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.004603] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.004604] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.004604] Call Trace:
[    0.004605] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.004607] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.004609] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.004610] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.004612] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.004613] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.004615] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.004617] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.004618] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.004620] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.004621] Instruction dump:
[    0.004622] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.004626] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.004631] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.004632] ---[ end trace 0000000000000000 ]---
[    0.004633] ------------[ cut here ]------------
[    0.004634] opal: OPAL_CONSOLE_FLUSH missing.
[    0.004635] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.004636] Modules linked in:
[    0.004637] Supported: No, Unreleased kernel
[    0.004639] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.004640] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.004641] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.004641] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.004647] CFAR: c000000000132df0 IRQMASK: 1 
[    0.004648] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.004652] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.004655] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.004658] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.004661] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.004665] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.004668] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.004671] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.004675] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.004676] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.004676] Call Trace:
[    0.004677] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.004679] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.004681] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.004682] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.004684] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.004685] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.004687] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.004689] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.004690] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.004692] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.004693] Instruction dump:
[    0.004694] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.004698] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.004703] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.004704] ---[ end trace 0000000000000000 ]---
[    0.004705] ------------[ cut here ]------------
[    0.004706] opal: OPAL_CONSOLE_FLUSH missing.
[    0.004707] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.004708] Modules linked in:
[    0.004709] Supported: No, Unreleased kernel
[    0.004711] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.004712] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.004713] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.004714] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.004719] CFAR: c000000000132df0 IRQMASK: 1 
[    0.004721] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.004724] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.004727] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.004730] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.004733] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.004737] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.004740] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.004743] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.004747] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.004748] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.004748] Call Trace:
[    0.004749] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.004751] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.004753] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.004755] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.004756] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.004758] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.004759] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.004761] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.004762] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.004764] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.004765] Instruction dump:
[    0.004766] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.004770] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.004776] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.004777] ---[ end trace 0000000000000000 ]---
[    0.004778] ------------[ cut here ]------------
[    0.004779] opal: OPAL_CONSOLE_FLUSH missing.
[    0.004780] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.004780] Modules linked in:
[    0.004782] Supported: No, Unreleased kernel
[    0.004783] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.004784] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.004785] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.004786] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.004791] CFAR: c000000000132df0 IRQMASK: 1 
[    0.004793] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.004796] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.004799] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.004803] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.004806] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.004809] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.004812] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.004816] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.004819] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.004820] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.004821] Call Trace:
[    0.004822] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.004824] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.004826] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.004827] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.004829] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.004830] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.004832] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.004833] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.004835] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.004836] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.004837] Instruction dump:
[    0.004839] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.004843] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.004848] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.004849] ---[ end trace 0000000000000000 ]---
[    0.004850] ------------[ cut here ]------------
[    0.004851] opal: OPAL_CONSOLE_FLUSH missing.
[    0.004852] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.004853] Modules linked in:
[    0.004854] Supported: No, Unreleased kernel
[    0.004855] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.004857] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.004858] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.004858] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.004864] CFAR: c000000000132df0 IRQMASK: 1 
[    0.004865] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.004868] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.004872] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.004875] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.004878] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.004881] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.004885] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.004888] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.004892] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.004893] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.004893] Call Trace:
[    0.004894] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.004896] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.004898] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.004899] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.004901] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.004902] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.004904] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.004905] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.004907] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.004908] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.004910] Instruction dump:
[    0.004911] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.004915] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.004920] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.004921] ---[ end trace 0000000000000000 ]---
[    0.004922] ------------[ cut here ]------------
[    0.004923] opal: OPAL_CONSOLE_FLUSH missing.
[    0.004924] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.004925] Modules linked in:
[    0.004926] Supported: No, Unreleased kernel
[    0.004927] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.004929] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.004930] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.004930] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.004936] CFAR: c000000000132df0 IRQMASK: 1 
[    0.004937] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.004941] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.004944] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.004947] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.004950] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.004954] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.004957] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.004960] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.004964] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.004965] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.004965] Call Trace:
[    0.004966] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.004968] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.004970] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.004971] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.004973] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.004975] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.004976] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.004978] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.004979] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.004981] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.004982] Instruction dump:
[    0.004983] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.004988] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.004993] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.004994] ---[ end trace 0000000000000000 ]---
[    0.004995] ------------[ cut here ]------------
[    0.004996] opal: OPAL_CONSOLE_FLUSH missing.
[    0.004997] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.004998] Modules linked in:
[    0.004999] Supported: No, Unreleased kernel
[    0.005000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.005001] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.005003] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.005003] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.005009] CFAR: c000000000132df0 IRQMASK: 1 
[    0.005010] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.005013] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.005017] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.005020] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.005023] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.005026] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.005030] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.005033] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.005037] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.005038] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.005038] Call Trace:
[    0.005039] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.005041] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.005043] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.005044] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.005046] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.005048] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.005049] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.005051] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.005052] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.005054] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.005055] Instruction dump:
[    0.005056] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.005060] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.005066] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.005066] ---[ end trace 0000000000000000 ]---
[    0.005068] ------------[ cut here ]------------
[    0.005068] opal: OPAL_CONSOLE_FLUSH missing.
[    0.005070] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.005070] Modules linked in:
[    0.005072] Supported: No, Unreleased kernel
[    0.005073] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.005074] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.005075] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.005076] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.005081] CFAR: c000000000132df0 IRQMASK: 1 
[    0.005083] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.005086] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.005089] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.005093] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.005096] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.005099] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.005102] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.005105] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.005109] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.005110] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.005111] Call Trace:
[    0.005112] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.005114] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.005115] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.005117] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.005118] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.005120] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.005122] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.005123] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.005125] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.005126] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.005127] Instruction dump:
[    0.005128] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.005133] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.005138] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.005139] ---[ end trace 0000000000000000 ]---
[    0.005140] ------------[ cut here ]------------
[    0.005141] opal: OPAL_CONSOLE_FLUSH missing.
[    0.005142] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.005143] Modules linked in:
[    0.005144] Supported: No, Unreleased kernel
[    0.005145] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.005146] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.005148] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.005148] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.005153] CFAR: c000000000132df0 IRQMASK: 1 
[    0.005155] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.005158] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.005161] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.005165] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.005168] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.005171] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.005174] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.005177] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.005181] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.005182] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.005183] Call Trace:
[    0.005184] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.005186] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.005187] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.005189] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.005190] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.005192] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.005194] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.005195] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.005197] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.005198] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.005199] Instruction dump:
[    0.005200] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.005205] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.005210] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.005211] ---[ end trace 0000000000000000 ]---
[    0.005212] ------------[ cut here ]------------
[    0.005213] opal: OPAL_CONSOLE_FLUSH missing.
[    0.005214] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.005215] Modules linked in:
[    0.005216] Supported: No, Unreleased kernel
[    0.005217] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.005218] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.005220] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.005220] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.005225] CFAR: c000000000132df0 IRQMASK: 1 
[    0.005227] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.005230] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.005234] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.005237] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.005240] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.005244] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.005247] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.005250] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.005254] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.005255] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.005255] Call Trace:
[    0.005256] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.005258] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.005260] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.005261] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.005263] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.005264] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.005266] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.005267] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.005269] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.005270] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.005272] Instruction dump:
[    0.005273] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.005277] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.005282] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.005283] ---[ end trace 0000000000000000 ]---
[    0.005284] ------------[ cut here ]------------
[    0.005285] opal: OPAL_CONSOLE_FLUSH missing.
[    0.005287] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.005287] Modules linked in:
[    0.005289] Supported: No, Unreleased kernel
[    0.005290] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.005291] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.005292] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.005293] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.005298] CFAR: c000000000132df0 IRQMASK: 1 
[    0.005300] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.005303] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.005306] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.005310] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.005313] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.005316] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.005319] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.005323] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.005326] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.005327] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.005328] Call Trace:
[    0.005329] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.005331] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.005333] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.005334] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.005336] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.005337] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.005339] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.005340] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.005342] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.005343] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.005344] Instruction dump:
[    0.005345] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.005350] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.005355] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.005356] ---[ end trace 0000000000000000 ]---
[    0.005357] ------------[ cut here ]------------
[    0.005358] opal: OPAL_CONSOLE_FLUSH missing.
[    0.005359] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.005360] Modules linked in:
[    0.005361] Supported: No, Unreleased kernel
[    0.005363] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.005364] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.005365] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.005366] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.005371] CFAR: c000000000132df0 IRQMASK: 1 
[    0.005372] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.005376] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.005379] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.005382] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.005385] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.005389] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.005392] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.005395] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.005399] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.005400] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.005401] Call Trace:
[    0.005402] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.005404] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.005405] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.005407] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.005408] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.005410] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.005412] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.005413] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.005415] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.005416] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.005417] Instruction dump:
[    0.005418] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.005423] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.005428] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.005429] ---[ end trace 0000000000000000 ]---
[    0.005430] ------------[ cut here ]------------
[    0.005431] opal: OPAL_CONSOLE_FLUSH missing.
[    0.005432] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.005433] Modules linked in:
[    0.005434] Supported: No, Unreleased kernel
[    0.005435] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.005436] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.005438] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.005438] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.005444] CFAR: c000000000132df0 IRQMASK: 1 
[    0.005445] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.005448] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.005452] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.005455] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.005458] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.005462] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.005465] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.005468] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.005472] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.005473] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.005473] Call Trace:
[    0.005474] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.005476] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.005478] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.005479] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.005481] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.005483] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.005484] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.005486] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.005487] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.005489] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.005490] Instruction dump:
[    0.005491] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.005495] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.005501] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.005501] ---[ end trace 0000000000000000 ]---
[    0.005502] ------------[ cut here ]------------
[    0.005503] opal: OPAL_CONSOLE_FLUSH missing.
[    0.005505] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.005505] Modules linked in:
[    0.005506] Supported: No, Unreleased kernel
[    0.005508] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.005509] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.005510] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.005511] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.005516] CFAR: c000000000132df0 IRQMASK: 1 
[    0.005517] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.005521] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.005524] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.005527] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.005530] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.005534] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.005537] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.005540] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.005544] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.005545] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.005546] Call Trace:
[    0.005547] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.005549] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.005550] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.005552] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.005553] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.005555] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.005557] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.005558] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.005560] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.005561] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.005562] Instruction dump:
[    0.005564] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.005568] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.005573] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.005574] ---[ end trace 0000000000000000 ]---
[    0.005575] ------------[ cut here ]------------
[    0.005576] opal: OPAL_CONSOLE_FLUSH missing.
[    0.005577] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.005578] Modules linked in:
[    0.005579] Supported: No, Unreleased kernel
[    0.005580] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.005581] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.005583] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.005583] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.005588] CFAR: c000000000132df0 IRQMASK: 1 
[    0.005590] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.005593] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.005596] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.005600] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.005603] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.005606] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.005609] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.005612] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.005616] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.005617] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.005618] Call Trace:
[    0.005619] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.005621] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.005622] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.005624] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.005625] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.005627] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.005629] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.005630] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.005632] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.005633] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.005634] Instruction dump:
[    0.005636] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.005640] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.005645] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.005646] ---[ end trace 0000000000000000 ]---
[    0.005647] ------------[ cut here ]------------
[    0.005648] opal: OPAL_CONSOLE_FLUSH missing.
[    0.005649] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.005650] Modules linked in:
[    0.005651] Supported: No, Unreleased kernel
[    0.005653] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.005654] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.005655] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.005655] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.005661] CFAR: c000000000132df0 IRQMASK: 1 
[    0.005662] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.005666] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.005669] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.005672] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.005675] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.005679] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.005682] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.005685] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.005689] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.005690] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.005690] Call Trace:
[    0.005691] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.005693] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.005695] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.005696] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.005698] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.005700] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.005701] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.005703] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.005704] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.005706] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.005707] Instruction dump:
[    0.005708] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.005712] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.005718] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.005718] ---[ end trace 0000000000000000 ]---
[    0.005720] ------------[ cut here ]------------
[    0.005720] opal: OPAL_CONSOLE_FLUSH missing.
[    0.005722] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.005722] Modules linked in:
[    0.005724] Supported: No, Unreleased kernel
[    0.005725] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.005726] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.005727] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.005728] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.005733] CFAR: c000000000132df0 IRQMASK: 1 
[    0.005735] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.005738] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.005741] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.005745] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.005748] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.005751] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.005754] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.005758] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.005761] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.005762] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.005763] Call Trace:
[    0.005764] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.005766] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.005767] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.005769] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.005771] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.005772] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.005774] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.005775] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.005777] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.005778] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.005780] Instruction dump:
[    0.005781] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.005785] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.005790] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.005791] ---[ end trace 0000000000000000 ]---
[    0.005792] ------------[ cut here ]------------
[    0.005793] opal: OPAL_CONSOLE_FLUSH missing.
[    0.005794] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.005795] Modules linked in:
[    0.005796] Supported: No, Unreleased kernel
[    0.005798] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.005799] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.005800] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.005801] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.005806] CFAR: c000000000132df0 IRQMASK: 1 
[    0.005808] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.005811] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.005814] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.005817] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.005820] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.005824] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.005827] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.005830] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.005834] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.005835] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.005835] Call Trace:
[    0.005836] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.005839] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.005840] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.005842] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.005843] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.005845] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.005846] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.005848] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.005849] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.005851] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.005852] Instruction dump:
[    0.005853] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.005858] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.005863] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.005864] ---[ end trace 0000000000000000 ]---
[    0.005865] ------------[ cut here ]------------
[    0.005866] opal: OPAL_CONSOLE_FLUSH missing.
[    0.005867] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.005868] Modules linked in:
[    0.005869] Supported: No, Unreleased kernel
[    0.005870] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.005871] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.005872] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.005873] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.005878] CFAR: c000000000132df0 IRQMASK: 1 
[    0.005880] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.005883] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.005886] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.005890] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.005893] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.005896] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.005899] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.005902] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.005906] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.005907] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.005908] Call Trace:
[    0.005909] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.005911] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.005912] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.005914] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.005915] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.005917] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.005918] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.005920] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.005921] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.005923] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.005924] Instruction dump:
[    0.005925] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.005930] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.005935] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.005936] ---[ end trace 0000000000000000 ]---
[    0.005937] ------------[ cut here ]------------
[    0.005938] opal: OPAL_CONSOLE_FLUSH missing.
[    0.005939] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.005940] Modules linked in:
[    0.005941] Supported: No, Unreleased kernel
[    0.005942] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.005943] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.005944] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.005945] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.005950] CFAR: c000000000132df0 IRQMASK: 1 
[    0.005952] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.005955] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.005958] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.005961] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.005965] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.005968] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.005971] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.005975] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.005979] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.005980] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.005980] Call Trace:
[    0.005981] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.005983] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.005985] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.005986] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.005988] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.005989] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.005991] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.005993] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.005994] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.005996] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.005997] Instruction dump:
[    0.005998] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.006002] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.006007] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.006008] ---[ end trace 0000000000000000 ]---
[    0.006009] ------------[ cut here ]------------
[    0.006010] opal: OPAL_CONSOLE_FLUSH missing.
[    0.006011] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.006012] Modules linked in:
[    0.006013] Supported: No, Unreleased kernel
[    0.006015] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.006016] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.006017] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.006017] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.006023] CFAR: c000000000132df0 IRQMASK: 1 
[    0.006024] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.006028] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.006031] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.006034] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.006037] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.006041] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.006044] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.006047] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.006051] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.006052] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.006052] Call Trace:
[    0.006053] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.006055] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.006057] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.006058] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.006060] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.006061] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.006063] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.006065] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.006066] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.006068] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.006069] Instruction dump:
[    0.006070] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.006074] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.006080] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.006080] ---[ end trace 0000000000000000 ]---
[    0.006082] ------------[ cut here ]------------
[    0.006082] opal: OPAL_CONSOLE_FLUSH missing.
[    0.006084] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.006084] Modules linked in:
[    0.006086] Supported: No, Unreleased kernel
[    0.006087] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.006088] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.006089] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.006090] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.006095] CFAR: c000000000132df0 IRQMASK: 1 
[    0.006097] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.006100] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.006103] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.006106] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.006110] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.006113] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.006116] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.006119] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.006123] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.006124] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.006125] Call Trace:
[    0.006126] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.006128] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.006129] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.006131] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.006132] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.006134] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.006136] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.006137] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.006139] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.006140] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.006141] Instruction dump:
[    0.006142] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.006147] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.006152] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.006153] ---[ end trace 0000000000000000 ]---
[    0.006154] ------------[ cut here ]------------
[    0.006155] opal: OPAL_CONSOLE_FLUSH missing.
[    0.006156] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.006157] Modules linked in:
[    0.006158] Supported: No, Unreleased kernel
[    0.006159] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.006160] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.006161] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.006162] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.006167] CFAR: c000000000132df0 IRQMASK: 1 
[    0.006169] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.006172] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.006175] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.006178] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.006182] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.006185] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.006188] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.006191] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.006195] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.006196] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.006197] Call Trace:
[    0.006198] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.006200] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.006201] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.006203] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.006204] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.006206] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.006208] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.006209] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.006211] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.006212] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.006213] Instruction dump:
[    0.006214] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.006219] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.006224] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.006225] ---[ end trace 0000000000000000 ]---
[    0.006226] ------------[ cut here ]------------
[    0.006227] opal: OPAL_CONSOLE_FLUSH missing.
[    0.006228] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.006229] Modules linked in:
[    0.006230] Supported: No, Unreleased kernel
[    0.006231] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.006232] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.006234] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.006234] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.006240] CFAR: c000000000132df0 IRQMASK: 1 
[    0.006241] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.006244] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.006248] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.006251] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.006254] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.006257] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.006261] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.006264] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.006268] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.006269] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.006269] Call Trace:
[    0.006270] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.006272] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.006274] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.006275] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.006277] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.006279] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.006280] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.006282] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.006283] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.006285] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.006286] Instruction dump:
[    0.006287] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.006291] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.006296] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.006297] ---[ end trace 0000000000000000 ]---
[    0.006298] ------------[ cut here ]------------
[    0.006299] opal: OPAL_CONSOLE_FLUSH missing.
[    0.006301] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.006301] Modules linked in:
[    0.006302] Supported: No, Unreleased kernel
[    0.006304] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.006305] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.006306] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.006307] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.006312] CFAR: c000000000132df0 IRQMASK: 1 
[    0.006314] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.006317] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.006320] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.006323] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.006326] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.006330] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.006333] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.006336] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.006340] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.006341] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.006342] Call Trace:
[    0.006343] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.006345] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.006346] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.006348] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.006349] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.006351] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.006353] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.006354] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.006356] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.006357] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.006358] Instruction dump:
[    0.006359] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.006364] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.006369] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.006370] ---[ end trace 0000000000000000 ]---
[    0.006371] ------------[ cut here ]------------
[    0.006372] opal: OPAL_CONSOLE_FLUSH missing.
[    0.006373] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.006374] Modules linked in:
[    0.006375] Supported: No, Unreleased kernel
[    0.006377] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.006378] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.006379] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.006379] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.006385] CFAR: c000000000132df0 IRQMASK: 1 
[    0.006386] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.006389] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.006393] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.006396] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.006399] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.006402] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.006406] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.006409] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.006413] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.006414] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.006414] Call Trace:
[    0.006415] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.006417] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.006419] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.006420] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.006422] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.006423] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.006425] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.006427] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.006428] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.006430] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.006431] Instruction dump:
[    0.006432] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.006436] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.006441] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.006442] ---[ end trace 0000000000000000 ]---
[    0.006443] ------------[ cut here ]------------
[    0.006444] opal: OPAL_CONSOLE_FLUSH missing.
[    0.006446] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.006446] Modules linked in:
[    0.006447] Supported: No, Unreleased kernel
[    0.006449] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.006450] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.006451] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.006452] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.006457] CFAR: c000000000132df0 IRQMASK: 1 
[    0.006458] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.006462] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.006465] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.006468] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.006471] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.006475] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.006478] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.006481] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.006485] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.006486] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.006486] Call Trace:
[    0.006487] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.006489] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.006491] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.006492] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.006494] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.006496] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.006497] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.006499] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.006500] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.006502] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.006503] Instruction dump:
[    0.006504] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.006508] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.006514] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.006514] ---[ end trace 0000000000000000 ]---
[    0.006515] ------------[ cut here ]------------
[    0.006516] opal: OPAL_CONSOLE_FLUSH missing.
[    0.006518] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.006518] Modules linked in:
[    0.006520] Supported: No, Unreleased kernel
[    0.006521] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.006522] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.006523] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.006524] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.006529] CFAR: c000000000132df0 IRQMASK: 1 
[    0.006531] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.006534] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.006537] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.006541] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.006544] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.006547] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.006551] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.006554] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.006558] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.006559] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.006559] Call Trace:
[    0.006560] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.006562] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.006564] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.006565] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.006567] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.006568] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.006570] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.006572] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.006573] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.006575] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.006576] Instruction dump:
[    0.006577] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.006581] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.006587] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.006587] ---[ end trace 0000000000000000 ]---
[    0.006589] ------------[ cut here ]------------
[    0.006589] opal: OPAL_CONSOLE_FLUSH missing.
[    0.006591] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.006591] Modules linked in:
[    0.006593] Supported: No, Unreleased kernel
[    0.006594] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.006595] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.006596] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.006597] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.006602] CFAR: c000000000132df0 IRQMASK: 1 
[    0.006604] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.006607] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.006610] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.006613] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.006617] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.006620] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.006623] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.006627] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.006630] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.006631] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.006632] Call Trace:
[    0.006633] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.006635] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.006636] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.006638] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.006640] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.006641] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.006643] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.006644] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.006646] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.006647] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.006649] Instruction dump:
[    0.006650] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.006654] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.006659] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.006660] ---[ end trace 0000000000000000 ]---
[    0.006661] ------------[ cut here ]------------
[    0.006662] opal: OPAL_CONSOLE_FLUSH missing.
[    0.006663] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.006664] Modules linked in:
[    0.006665] Supported: No, Unreleased kernel
[    0.006667] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.006668] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.006669] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.006670] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.006675] CFAR: c000000000132df0 IRQMASK: 1 
[    0.006677] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.006680] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.006683] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.006686] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.006690] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.006693] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.006696] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.006700] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.006703] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.006704] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.006705] Call Trace:
[    0.006706] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.006708] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.006709] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.006711] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.006713] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.006714] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.006716] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.006717] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.006719] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.006720] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.006721] Instruction dump:
[    0.006722] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.006727] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.006732] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.006733] ---[ end trace 0000000000000000 ]---
[    0.006734] ------------[ cut here ]------------
[    0.006735] opal: OPAL_CONSOLE_FLUSH missing.
[    0.006736] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.006737] Modules linked in:
[    0.006738] Supported: No, Unreleased kernel
[    0.006739] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.006741] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.006742] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.006742] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.006748] CFAR: c000000000132df0 IRQMASK: 1 
[    0.006749] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.006752] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.006756] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.006759] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.006762] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.006766] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.006769] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.006772] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.006776] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.006777] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.006777] Call Trace:
[    0.006778] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.006780] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.006782] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.006783] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.006785] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.006787] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.006788] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.006790] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.006791] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.006793] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.006794] Instruction dump:
[    0.006795] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.006799] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.006804] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.006805] ---[ end trace 0000000000000000 ]---
[    0.006806] ------------[ cut here ]------------
[    0.006807] opal: OPAL_CONSOLE_FLUSH missing.
[    0.006809] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.006809] Modules linked in:
[    0.006811] Supported: No, Unreleased kernel
[    0.006812] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.006813] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.006814] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.006815] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.006820] CFAR: c000000000132df0 IRQMASK: 1 
[    0.006821] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.006825] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.006828] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.006831] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.006834] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.006838] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.006841] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.006844] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.006848] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.006849] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.006849] Call Trace:
[    0.006850] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.006853] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.006854] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.006856] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.006857] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.006859] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.006860] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.006862] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.006863] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.006865] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.006866] Instruction dump:
[    0.006867] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.006872] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.006877] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.006877] ---[ end trace 0000000000000000 ]---
[    0.006879] ------------[ cut here ]------------
[    0.006879] opal: OPAL_CONSOLE_FLUSH missing.
[    0.006881] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.006881] Modules linked in:
[    0.006883] Supported: No, Unreleased kernel
[    0.006884] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.006885] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.006886] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.006887] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.006892] CFAR: c000000000132df0 IRQMASK: 1 
[    0.006894] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.006897] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.006900] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.006903] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.006907] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.006910] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.006913] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.006917] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.006920] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.006921] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.006922] Call Trace:
[    0.006923] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.006925] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.006926] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.006928] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.006929] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.006931] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.006932] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.006934] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.006935] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.006937] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.006938] Instruction dump:
[    0.006939] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.006944] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.006949] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.006949] ---[ end trace 0000000000000000 ]---
[    0.006951] ------------[ cut here ]------------
[    0.006951] opal: OPAL_CONSOLE_FLUSH missing.
[    0.006953] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.006953] Modules linked in:
[    0.006955] Supported: No, Unreleased kernel
[    0.006956] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.006957] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.006958] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.006959] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.006964] CFAR: c000000000132df0 IRQMASK: 1 
[    0.006966] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.006969] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.006972] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.006976] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.006979] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.006982] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.006985] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.006989] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.006992] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.006993] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.006994] Call Trace:
[    0.006995] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.006997] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.006999] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.007000] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.007002] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.007003] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.007005] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.007006] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.007008] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.007009] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.007011] Instruction dump:
[    0.007012] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.007016] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.007021] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.007022] ---[ end trace 0000000000000000 ]---
[    0.007023] ------------[ cut here ]------------
[    0.007024] opal: OPAL_CONSOLE_FLUSH missing.
[    0.007025] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.007026] Modules linked in:
[    0.007027] Supported: No, Unreleased kernel
[    0.007029] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.007030] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.007031] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.007031] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.007037] CFAR: c000000000132df0 IRQMASK: 1 
[    0.007038] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.007042] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.007045] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.007048] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.007051] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.007055] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.007058] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.007061] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.007065] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.007066] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.007066] Call Trace:
[    0.007067] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.007070] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.007071] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.007073] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.007074] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.007076] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.007077] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.007079] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.007080] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.007082] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.007083] Instruction dump:
[    0.007084] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.007089] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.007094] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.007095] ---[ end trace 0000000000000000 ]---
[    0.007096] ------------[ cut here ]------------
[    0.007097] opal: OPAL_CONSOLE_FLUSH missing.
[    0.007098] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.007099] Modules linked in:
[    0.007100] Supported: No, Unreleased kernel
[    0.007101] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.007102] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.007103] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.007104] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.007110] CFAR: c000000000132df0 IRQMASK: 1 
[    0.007111] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.007114] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.007118] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.007121] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.007124] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.007127] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.007131] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.007134] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.007138] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.007138] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.007139] Call Trace:
[    0.007140] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.007142] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.007144] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.007145] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.007147] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.007148] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.007150] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.007151] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.007153] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.007154] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.007156] Instruction dump:
[    0.007157] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.007161] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.007166] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.007167] ---[ end trace 0000000000000000 ]---
[    0.007168] ------------[ cut here ]------------
[    0.007169] opal: OPAL_CONSOLE_FLUSH missing.
[    0.007170] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.007171] Modules linked in:
[    0.007172] Supported: No, Unreleased kernel
[    0.007174] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.007175] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.007176] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.007176] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.007182] CFAR: c000000000132df0 IRQMASK: 1 
[    0.007183] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.007187] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.007190] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.007193] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.007196] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.007200] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.007203] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.007206] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.007210] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.007211] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.007211] Call Trace:
[    0.007212] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.007215] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.007216] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.007218] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.007219] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.007221] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.007222] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.007224] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.007225] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.007227] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.007228] Instruction dump:
[    0.007229] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.007234] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.007239] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.007240] ---[ end trace 0000000000000000 ]---
[    0.007241] ------------[ cut here ]------------
[    0.007241] opal: OPAL_CONSOLE_FLUSH missing.
[    0.007243] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.007243] Modules linked in:
[    0.007245] Supported: No, Unreleased kernel
[    0.007246] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.007247] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.007248] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.007249] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.007254] CFAR: c000000000132df0 IRQMASK: 1 
[    0.007256] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.007259] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.007262] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.007266] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.007269] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.007272] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.007275] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.007278] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.007282] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.007283] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.007284] Call Trace:
[    0.007285] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.007287] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.007288] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.007290] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.007291] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.007293] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.007295] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.007296] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.007298] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.007299] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.007300] Instruction dump:
[    0.007301] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.007306] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.007311] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.007312] ---[ end trace 0000000000000000 ]---
[    0.007313] ------------[ cut here ]------------
[    0.007314] opal: OPAL_CONSOLE_FLUSH missing.
[    0.007315] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.007316] Modules linked in:
[    0.007317] Supported: No, Unreleased kernel
[    0.007319] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.007320] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.007321] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.007321] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.007327] CFAR: c000000000132df0 IRQMASK: 1 
[    0.007328] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.007331] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.007335] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.007338] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.007341] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.007344] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.007348] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.007351] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.007355] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.007356] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.007356] Call Trace:
[    0.007357] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.007359] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.007361] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.007362] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.007364] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.007366] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.007367] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.007369] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.007370] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.007372] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.007373] Instruction dump:
[    0.007374] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.007378] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.007383] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.007384] ---[ end trace 0000000000000000 ]---
[    0.007385] ------------[ cut here ]------------
[    0.007386] opal: OPAL_CONSOLE_FLUSH missing.
[    0.007388] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.007388] Modules linked in:
[    0.007390] Supported: No, Unreleased kernel
[    0.007391] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.007392] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.007393] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.007394] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.007399] CFAR: c000000000132df0 IRQMASK: 1 
[    0.007400] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.007404] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.007407] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.007410] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.007413] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.007417] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.007420] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.007423] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.007427] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.007428] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.007428] Call Trace:
[    0.007429] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.007431] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.007433] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.007435] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.007436] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.007438] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.007439] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.007441] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.007442] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.007444] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.007445] Instruction dump:
[    0.007446] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.007450] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.007456] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.007456] ---[ end trace 0000000000000000 ]---
[    0.007457] ------------[ cut here ]------------
[    0.007458] opal: OPAL_CONSOLE_FLUSH missing.
[    0.007460] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.007460] Modules linked in:
[    0.007462] Supported: No, Unreleased kernel
[    0.007463] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.007464] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.007465] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.007466] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.007471] CFAR: c000000000132df0 IRQMASK: 1 
[    0.007473] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.007476] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.007479] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.007482] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.007486] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.007489] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.007492] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.007495] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.007499] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.007500] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.007501] Call Trace:
[    0.007502] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.007504] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.007505] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.007507] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.007508] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.007510] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.007512] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.007513] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.007515] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.007516] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.007517] Instruction dump:
[    0.007519] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.007523] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.007528] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.007529] ---[ end trace 0000000000000000 ]---
[    0.007530] ------------[ cut here ]------------
[    0.007531] opal: OPAL_CONSOLE_FLUSH missing.
[    0.007532] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.007533] Modules linked in:
[    0.007534] Supported: No, Unreleased kernel
[    0.007536] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.007537] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.007538] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.007538] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.007544] CFAR: c000000000132df0 IRQMASK: 1 
[    0.007545] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.007549] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.007552] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.007555] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.007559] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.007562] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.007565] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.007568] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.007572] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.007573] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.007573] Call Trace:
[    0.007574] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.007577] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.007578] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.007580] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.007581] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.007583] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.007584] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.007586] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.007587] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.007589] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.007590] Instruction dump:
[    0.007591] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.007596] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.007601] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.007602] ---[ end trace 0000000000000000 ]---
[    0.007603] ------------[ cut here ]------------
[    0.007604] opal: OPAL_CONSOLE_FLUSH missing.
[    0.007605] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.007606] Modules linked in:
[    0.007607] Supported: No, Unreleased kernel
[    0.007608] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.007609] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.007611] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.007611] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.007617] CFAR: c000000000132df0 IRQMASK: 1 
[    0.007618] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.007621] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.007625] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.007628] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.007631] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.007635] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.007638] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.007641] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.007645] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.007646] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.007646] Call Trace:
[    0.007647] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.007649] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.007651] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.007653] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.007654] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.007656] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.007657] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.007659] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.007660] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.007662] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.007663] Instruction dump:
[    0.007664] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.007668] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.007674] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.007674] ---[ end trace 0000000000000000 ]---
[    0.007676] ------------[ cut here ]------------
[    0.007676] opal: OPAL_CONSOLE_FLUSH missing.
[    0.007678] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.007678] Modules linked in:
[    0.007680] Supported: No, Unreleased kernel
[    0.007681] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.007682] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.007683] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.007684] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.007689] CFAR: c000000000132df0 IRQMASK: 1 
[    0.007691] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.007694] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.007697] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.007700] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.007704] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.007707] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.007710] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.007713] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.007717] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.007718] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.007719] Call Trace:
[    0.007720] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.007722] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.007723] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.007725] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.007726] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.007728] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.007730] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.007731] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.007733] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.007734] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.007735] Instruction dump:
[    0.007737] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.007741] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.007746] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.007747] ---[ end trace 0000000000000000 ]---
[    0.007748] ------------[ cut here ]------------
[    0.007749] opal: OPAL_CONSOLE_FLUSH missing.
[    0.007750] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.007751] Modules linked in:
[    0.007752] Supported: No, Unreleased kernel
[    0.007753] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.007755] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.007756] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.007756] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.007762] CFAR: c000000000132df0 IRQMASK: 1 
[    0.007763] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.007766] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.007770] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.007773] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.007776] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.007780] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.007783] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.007786] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.007790] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.007791] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.007791] Call Trace:
[    0.007792] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.007794] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.007796] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.007798] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.007799] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.007801] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.007802] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.007804] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.007805] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.007807] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.007808] Instruction dump:
[    0.007809] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.007814] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.007819] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.007820] ---[ end trace 0000000000000000 ]---
[    0.007821] ------------[ cut here ]------------
[    0.007821] opal: OPAL_CONSOLE_FLUSH missing.
[    0.007823] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.007823] Modules linked in:
[    0.007825] Supported: No, Unreleased kernel
[    0.007826] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.007827] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.007828] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.007829] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.007834] CFAR: c000000000132df0 IRQMASK: 1 
[    0.007836] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.007839] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.007842] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.007845] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.007849] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.007852] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.007855] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.007858] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.007862] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.007863] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.007863] Call Trace:
[    0.007864] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.007867] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.007868] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.007870] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.007871] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.007873] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.007874] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.007876] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.007877] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.007879] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.007880] Instruction dump:
[    0.007881] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.007886] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.007891] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.007891] ---[ end trace 0000000000000000 ]---
[    0.007893] ------------[ cut here ]------------
[    0.007893] opal: OPAL_CONSOLE_FLUSH missing.
[    0.007895] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.007895] Modules linked in:
[    0.007897] Supported: No, Unreleased kernel
[    0.007898] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.007899] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.007900] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.007901] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.007906] CFAR: c000000000132df0 IRQMASK: 1 
[    0.007908] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.007911] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.007914] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.007918] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.007921] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.007924] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.007927] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.007931] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.007935] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.007936] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.007936] Call Trace:
[    0.007937] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.007939] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.007941] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.007942] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.007944] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.007945] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.007947] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.007948] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.007950] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.007952] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.007953] Instruction dump:
[    0.007954] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.007958] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.007964] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.007964] ---[ end trace 0000000000000000 ]---
[    0.007965] ------------[ cut here ]------------
[    0.007966] opal: OPAL_CONSOLE_FLUSH missing.
[    0.007968] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.007968] Modules linked in:
[    0.007970] Supported: No, Unreleased kernel
[    0.007971] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.007972] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.007973] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.007974] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.007979] CFAR: c000000000132df0 IRQMASK: 1 
[    0.007981] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.007984] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.007987] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.007991] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.007994] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.007997] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.008000] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.008004] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.008008] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.008008] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.008009] Call Trace:
[    0.008010] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.008012] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.008014] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.008015] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.008017] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.008018] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.008020] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.008021] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.008023] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.008025] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.008026] Instruction dump:
[    0.008027] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.008031] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.008037] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.008038] ---[ end trace 0000000000000000 ]---
[    0.008039] ------------[ cut here ]------------
[    0.008040] opal: OPAL_CONSOLE_FLUSH missing.
[    0.008041] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.008042] Modules linked in:
[    0.008043] Supported: No, Unreleased kernel
[    0.008044] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.008045] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.008046] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.008047] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.008052] CFAR: c000000000132df0 IRQMASK: 1 
[    0.008054] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.008057] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.008061] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.008064] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.008067] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.008070] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.008073] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.008077] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.008081] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.008082] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.008082] Call Trace:
[    0.008083] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.008085] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.008087] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.008088] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.008090] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.008091] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.008093] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.008095] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.008096] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.008098] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.008099] Instruction dump:
[    0.008100] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.008104] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.008110] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.008110] ---[ end trace 0000000000000000 ]---
[    0.008111] ------------[ cut here ]------------
[    0.008112] opal: OPAL_CONSOLE_FLUSH missing.
[    0.008114] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.008114] Modules linked in:
[    0.008116] Supported: No, Unreleased kernel
[    0.008117] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.008118] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.008119] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.008120] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.008125] CFAR: c000000000132df0 IRQMASK: 1 
[    0.008126] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.008130] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.008133] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.008136] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.008139] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.008143] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.008146] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.008149] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.008153] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.008154] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.008154] Call Trace:
[    0.008155] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.008157] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.008159] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.008160] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.008162] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.008163] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.008165] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.008167] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.008168] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.008170] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.008171] Instruction dump:
[    0.008172] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.008176] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.008181] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.008182] ---[ end trace 0000000000000000 ]---
[    0.008183] ------------[ cut here ]------------
[    0.008184] opal: OPAL_CONSOLE_FLUSH missing.
[    0.008185] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.008186] Modules linked in:
[    0.008187] Supported: No, Unreleased kernel
[    0.008189] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.008190] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.008191] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.008192] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.008197] CFAR: c000000000132df0 IRQMASK: 1 
[    0.008199] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.008202] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.008205] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.008208] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.008212] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.008215] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.008218] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.008221] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.008225] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.008226] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.008227] Call Trace:
[    0.008228] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.008230] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.008231] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.008233] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.008234] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.008236] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.008238] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.008239] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.008241] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.008242] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.008243] Instruction dump:
[    0.008244] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.008249] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.008254] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.008255] ---[ end trace 0000000000000000 ]---
[    0.008256] ------------[ cut here ]------------
[    0.008257] opal: OPAL_CONSOLE_FLUSH missing.
[    0.008258] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.008259] Modules linked in:
[    0.008260] Supported: No, Unreleased kernel
[    0.008261] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.008262] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.008264] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.008264] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.008270] CFAR: c000000000132df0 IRQMASK: 1 
[    0.008271] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.008274] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.008278] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.008281] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.008284] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.008287] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.008291] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.008294] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.008298] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.008299] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.008299] Call Trace:
[    0.008300] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.008302] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.008304] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.008305] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.008307] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.008308] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.008310] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.008312] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.008313] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.008315] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.008316] Instruction dump:
[    0.008317] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.008321] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.008327] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.008327] ---[ end trace 0000000000000000 ]---
[    0.008328] ------------[ cut here ]------------
[    0.008329] opal: OPAL_CONSOLE_FLUSH missing.
[    0.008331] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.008331] Modules linked in:
[    0.008333] Supported: No, Unreleased kernel
[    0.008334] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.008335] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.008336] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.008337] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.008342] CFAR: c000000000132df0 IRQMASK: 1 
[    0.008343] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.008347] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.008350] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.008353] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.008357] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.008360] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.008363] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.008367] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.008370] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.008371] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.008372] Call Trace:
[    0.008373] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.008375] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.008377] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.008378] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.008380] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.008381] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.008383] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.008385] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.008386] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.008388] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.008389] Instruction dump:
[    0.008390] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.008394] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.008399] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.008400] ---[ end trace 0000000000000000 ]---
[    0.008401] ------------[ cut here ]------------
[    0.008402] opal: OPAL_CONSOLE_FLUSH missing.
[    0.008403] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.008404] Modules linked in:
[    0.008405] Supported: No, Unreleased kernel
[    0.008407] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.008408] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.008409] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.008409] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.008415] CFAR: c000000000132df0 IRQMASK: 1 
[    0.008416] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.008420] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.008423] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.008426] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.008429] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.008433] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.008436] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.008439] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.008443] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.008444] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.008445] Call Trace:
[    0.008446] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.008448] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.008449] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.008451] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.008452] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.008454] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.008455] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.008457] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.008458] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.008460] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.008461] Instruction dump:
[    0.008462] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.008466] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.008472] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.008473] ---[ end trace 0000000000000000 ]---
[    0.008474] ------------[ cut here ]------------
[    0.008475] opal: OPAL_CONSOLE_FLUSH missing.
[    0.008476] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.008477] Modules linked in:
[    0.008478] Supported: No, Unreleased kernel
[    0.008479] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.008480] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.008481] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.008482] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.008487] CFAR: c000000000132df0 IRQMASK: 1 
[    0.008489] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.008492] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.008495] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.008499] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.008502] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.008505] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.008508] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.008511] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.008515] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.008516] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.008517] Call Trace:
[    0.008518] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.008520] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.008521] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.008523] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.008524] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.008526] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.008528] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.008529] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.008531] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.008532] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.008533] Instruction dump:
[    0.008535] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.008539] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.008544] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.008545] ---[ end trace 0000000000000000 ]---
[    0.008546] ------------[ cut here ]------------
[    0.008547] opal: OPAL_CONSOLE_FLUSH missing.
[    0.008548] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.008549] Modules linked in:
[    0.008550] Supported: No, Unreleased kernel
[    0.008552] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.008553] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.008554] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.008555] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.008560] CFAR: c000000000132df0 IRQMASK: 1 
[    0.008561] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.008565] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.008568] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.008571] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.008574] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.008578] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.008581] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.008584] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.008588] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.008589] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.008589] Call Trace:
[    0.008590] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.008593] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.008594] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.008596] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.008597] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.008599] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.008600] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.008602] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.008603] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.008605] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.008606] Instruction dump:
[    0.008607] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.008612] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.008617] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.008618] ---[ end trace 0000000000000000 ]---
[    0.008619] ------------[ cut here ]------------
[    0.008620] opal: OPAL_CONSOLE_FLUSH missing.
[    0.008621] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.008622] Modules linked in:
[    0.008623] Supported: No, Unreleased kernel
[    0.008624] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.008625] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.008626] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.008627] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.008633] CFAR: c000000000132df0 IRQMASK: 1 
[    0.008634] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.008637] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.008641] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.008644] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.008647] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.008650] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.008653] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.008657] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.008661] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.008661] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.008662] Call Trace:
[    0.008663] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.008665] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.008667] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.008668] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.008670] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.008671] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.008673] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.008674] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.008676] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.008678] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.008679] Instruction dump:
[    0.008680] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.008684] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.008689] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.008690] ---[ end trace 0000000000000000 ]---
[    0.008691] ------------[ cut here ]------------
[    0.008692] opal: OPAL_CONSOLE_FLUSH missing.
[    0.008694] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.008694] Modules linked in:
[    0.008695] Supported: No, Unreleased kernel
[    0.008697] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.008698] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.008699] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.008700] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.008705] CFAR: c000000000132df0 IRQMASK: 1 
[    0.008707] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.008710] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.008713] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.008716] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.008720] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.008723] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.008726] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.008730] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.008733] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.008734] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.008735] Call Trace:
[    0.008736] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.008738] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.008739] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.008741] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.008742] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.008744] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.008746] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.008747] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.008749] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.008750] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.008751] Instruction dump:
[    0.008752] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.008757] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.008762] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.008763] ---[ end trace 0000000000000000 ]---
[    0.008764] ------------[ cut here ]------------
[    0.008765] opal: OPAL_CONSOLE_FLUSH missing.
[    0.008766] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.008767] Modules linked in:
[    0.008768] Supported: No, Unreleased kernel
[    0.008769] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.008770] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.008771] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.008772] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.008777] CFAR: c000000000132df0 IRQMASK: 1 
[    0.008779] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.008782] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.008785] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.008788] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.008792] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.008795] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.008798] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.008801] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.008805] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.008806] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.008807] Call Trace:
[    0.008808] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.008810] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.008811] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.008813] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.008815] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.008816] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.008818] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.008819] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.008821] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.008822] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.008823] Instruction dump:
[    0.008825] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.008829] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.008834] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.008835] ---[ end trace 0000000000000000 ]---
[    0.008836] ------------[ cut here ]------------
[    0.008837] opal: OPAL_CONSOLE_FLUSH missing.
[    0.008838] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.008839] Modules linked in:
[    0.008840] Supported: No, Unreleased kernel
[    0.008841] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.008843] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.008844] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.008844] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.008850] CFAR: c000000000132df0 IRQMASK: 1 
[    0.008851] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.008855] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.008858] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.008861] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.008864] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.008868] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.008871] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.008874] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.008878] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.008879] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.008880] Call Trace:
[    0.008881] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.008883] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.008884] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.008886] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.008887] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.008889] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.008891] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.008892] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.008894] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.008895] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.008896] Instruction dump:
[    0.008897] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.008902] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.008907] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.008908] ---[ end trace 0000000000000000 ]---
[    0.008909] ------------[ cut here ]------------
[    0.008910] opal: OPAL_CONSOLE_FLUSH missing.
[    0.008911] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.008912] Modules linked in:
[    0.008913] Supported: No, Unreleased kernel
[    0.008915] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.008916] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.008917] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.008917] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.008923] CFAR: c000000000132df0 IRQMASK: 1 
[    0.008924] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.008928] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.008931] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.008934] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.008937] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.008940] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.008944] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.008947] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.008951] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.008952] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.008952] Call Trace:
[    0.008953] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.008955] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.008957] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.008958] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.008960] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.008961] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.008963] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.008965] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.008966] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.008968] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.008969] Instruction dump:
[    0.008970] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.008974] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.008980] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.008980] ---[ end trace 0000000000000000 ]---
[    0.008981] ------------[ cut here ]------------
[    0.008982] opal: OPAL_CONSOLE_FLUSH missing.
[    0.008984] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.008984] Modules linked in:
[    0.008986] Supported: No, Unreleased kernel
[    0.008987] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.008988] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.008989] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.008990] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.008995] CFAR: c000000000132df0 IRQMASK: 1 
[    0.008997] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.009000] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.009003] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.009007] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.009010] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.009013] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.009016] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.009020] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.009023] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.009024] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.009025] Call Trace:
[    0.009026] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.009028] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.009030] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.009031] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.009033] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.009034] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.009036] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.009037] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.009039] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.009040] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.009042] Instruction dump:
[    0.009043] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.009047] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.009053] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.009053] ---[ end trace 0000000000000000 ]---
[    0.009055] ------------[ cut here ]------------
[    0.009055] opal: OPAL_CONSOLE_FLUSH missing.
[    0.009057] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.009057] Modules linked in:
[    0.009059] Supported: No, Unreleased kernel
[    0.009060] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.009061] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.009062] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.009063] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.009068] CFAR: c000000000132df0 IRQMASK: 1 
[    0.009070] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.009073] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.009076] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.009079] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.009083] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.009086] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.009089] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.009093] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.009096] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.009097] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.009098] Call Trace:
[    0.009099] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.009101] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.009102] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.009104] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.009105] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.009107] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.009109] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.009110] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.009112] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.009113] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.009115] Instruction dump:
[    0.009116] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.009120] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.009125] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.009126] ---[ end trace 0000000000000000 ]---
[    0.009127] ------------[ cut here ]------------
[    0.009128] opal: OPAL_CONSOLE_FLUSH missing.
[    0.009129] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.009130] Modules linked in:
[    0.009131] Supported: No, Unreleased kernel
[    0.009133] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.009134] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.009135] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.009135] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.009141] CFAR: c000000000132df0 IRQMASK: 1 
[    0.009142] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.009145] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.009149] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.009152] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.009155] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.009158] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.009161] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.009165] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.009168] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.009169] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.009170] Call Trace:
[    0.009171] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.009173] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.009175] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.009176] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.009178] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.009179] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.009181] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.009182] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.009184] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.009185] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.009186] Instruction dump:
[    0.009188] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.009192] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.009197] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.009198] ---[ end trace 0000000000000000 ]---
[    0.009199] ------------[ cut here ]------------
[    0.009200] opal: OPAL_CONSOLE_FLUSH missing.
[    0.009201] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.009202] Modules linked in:
[    0.009203] Supported: No, Unreleased kernel
[    0.009205] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.009206] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.009207] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.009207] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.009213] CFAR: c000000000132df0 IRQMASK: 1 
[    0.009214] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.009217] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.009221] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.009224] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.009227] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.009230] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.009234] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.009237] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.009241] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.009242] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.009242] Call Trace:
[    0.009243] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.009245] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.009247] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.009249] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.009250] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.009252] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.009253] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.009255] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.009256] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.009258] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.009259] Instruction dump:
[    0.009260] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.009265] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.009270] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.009271] ---[ end trace 0000000000000000 ]---
[    0.009272] ------------[ cut here ]------------
[    0.009273] opal: OPAL_CONSOLE_FLUSH missing.
[    0.009274] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.009274] Modules linked in:
[    0.009276] Supported: No, Unreleased kernel
[    0.009277] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.009278] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.009279] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.009280] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.009285] CFAR: c000000000132df0 IRQMASK: 1 
[    0.009287] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.009290] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.009293] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.009297] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.009300] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.009303] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.009306] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.009310] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.009313] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.009314] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.009315] Call Trace:
[    0.009316] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.009318] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.009319] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.009321] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.009322] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.009324] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.009326] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.009327] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.009329] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.009330] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.009331] Instruction dump:
[    0.009333] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.009337] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.009342] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.009343] ---[ end trace 0000000000000000 ]---
[    0.009344] ------------[ cut here ]------------
[    0.009345] opal: OPAL_CONSOLE_FLUSH missing.
[    0.009346] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.009347] Modules linked in:
[    0.009348] Supported: No, Unreleased kernel
[    0.009349] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.009350] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.009351] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.009352] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.009357] CFAR: c000000000132df0 IRQMASK: 1 
[    0.009359] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.009362] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.009365] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.009369] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.009372] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.009375] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.009378] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.009382] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.009385] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.009386] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.009387] Call Trace:
[    0.009388] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.009390] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.009392] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.009393] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.009395] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.009396] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.009398] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.009399] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.009401] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.009402] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.009403] Instruction dump:
[    0.009405] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.009409] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.009414] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.009415] ---[ end trace 0000000000000000 ]---
[    0.009416] ------------[ cut here ]------------
[    0.009417] opal: OPAL_CONSOLE_FLUSH missing.
[    0.009418] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.009419] Modules linked in:
[    0.009420] Supported: No, Unreleased kernel
[    0.009422] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.009423] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.009424] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.009424] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.009430] CFAR: c000000000132df0 IRQMASK: 1 
[    0.009431] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.009434] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.009438] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.009441] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.009444] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.009447] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.009451] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.009454] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.009458] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.009459] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.009459] Call Trace:
[    0.009460] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.009462] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.009464] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.009465] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.009467] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.009469] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.009470] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.009472] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.009473] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.009475] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.009476] Instruction dump:
[    0.009477] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.009482] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.009487] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.009487] ---[ end trace 0000000000000000 ]---
[    0.009489] ------------[ cut here ]------------
[    0.009489] opal: OPAL_CONSOLE_FLUSH missing.
[    0.009491] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.009491] Modules linked in:
[    0.009493] Supported: No, Unreleased kernel
[    0.009494] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.009495] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.009496] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.009497] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.009502] CFAR: c000000000132df0 IRQMASK: 1 
[    0.009504] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.009507] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.009510] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.009514] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.009517] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.009520] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.009523] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.009527] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.009531] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.009532] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.009532] Call Trace:
[    0.009533] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.009535] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.009537] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.009538] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.009540] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.009541] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.009543] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.009544] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.009546] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.009548] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.009549] Instruction dump:
[    0.009550] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.009554] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.009559] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.009560] ---[ end trace 0000000000000000 ]---
[    0.009561] ------------[ cut here ]------------
[    0.009562] opal: OPAL_CONSOLE_FLUSH missing.
[    0.009563] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.009564] Modules linked in:
[    0.009565] Supported: No, Unreleased kernel
[    0.009567] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.009568] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.009569] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.009569] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.009575] CFAR: c000000000132df0 IRQMASK: 1 
[    0.009576] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.009580] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.009583] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.009586] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.009590] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.009593] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.009596] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.009599] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.009603] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.009604] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.009604] Call Trace:
[    0.009605] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.009608] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.009609] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.009611] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.009612] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.009614] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.009615] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.009617] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.009618] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.009620] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.009621] Instruction dump:
[    0.009622] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.009627] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.009632] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.009633] ---[ end trace 0000000000000000 ]---
[    0.009634] ------------[ cut here ]------------
[    0.009635] opal: OPAL_CONSOLE_FLUSH missing.
[    0.009636] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.009637] Modules linked in:
[    0.009638] Supported: No, Unreleased kernel
[    0.009639] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.009640] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.009641] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.009642] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.009647] CFAR: c000000000132df0 IRQMASK: 1 
[    0.009649] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.009652] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.009655] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.009659] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.009662] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.009665] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.009668] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.009672] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.009675] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.009676] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.009677] Call Trace:
[    0.009678] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.009680] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.009682] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.009683] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.009685] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.009686] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.009688] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.009689] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.009691] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.009692] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.009693] Instruction dump:
[    0.009695] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.009699] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.009704] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.009705] ---[ end trace 0000000000000000 ]---
[    0.009706] ------------[ cut here ]------------
[    0.009707] opal: OPAL_CONSOLE_FLUSH missing.
[    0.009708] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.009709] Modules linked in:
[    0.009710] Supported: No, Unreleased kernel
[    0.009712] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.009713] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.009714] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.009714] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.009720] CFAR: c000000000132df0 IRQMASK: 1 
[    0.009721] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.009725] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.009728] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.009731] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.009734] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.009737] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.009741] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.009744] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.009748] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.009749] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.009749] Call Trace:
[    0.009750] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.009752] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.009754] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.009755] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.009757] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.009758] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.009760] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.009762] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.009763] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.009765] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.009766] Instruction dump:
[    0.009767] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.009771] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.009776] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.009777] ---[ end trace 0000000000000000 ]---
[    0.009778] ------------[ cut here ]------------
[    0.009779] opal: OPAL_CONSOLE_FLUSH missing.
[    0.009781] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.009781] Modules linked in:
[    0.009783] Supported: No, Unreleased kernel
[    0.009784] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.009785] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.009786] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.009787] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.009792] CFAR: c000000000132df0 IRQMASK: 1 
[    0.009794] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.009797] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.009800] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.009803] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.009807] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.009810] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.009813] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.009816] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.009820] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.009821] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.009822] Call Trace:
[    0.009823] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.009825] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.009826] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.009828] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.009829] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.009831] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.009833] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.009834] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.009836] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.009837] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.009838] Instruction dump:
[    0.009839] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.009844] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.009849] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.009850] ---[ end trace 0000000000000000 ]---
[    0.009851] ------------[ cut here ]------------
[    0.009852] opal: OPAL_CONSOLE_FLUSH missing.
[    0.009853] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.009854] Modules linked in:
[    0.009855] Supported: No, Unreleased kernel
[    0.009856] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.009857] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.009859] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.009859] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.009864] CFAR: c000000000132df0 IRQMASK: 1 
[    0.009866] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.009869] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.009873] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.009876] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.009879] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.009883] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.009886] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.009889] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.009893] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.009894] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.009895] Call Trace:
[    0.009896] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.009898] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.009899] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.009901] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.009902] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.009904] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.009905] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.009907] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.009908] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.009910] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.009911] Instruction dump:
[    0.009912] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.009917] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.009922] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.009923] ---[ end trace 0000000000000000 ]---
[    0.009924] ------------[ cut here ]------------
[    0.009925] opal: OPAL_CONSOLE_FLUSH missing.
[    0.009926] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.009927] Modules linked in:
[    0.009928] Supported: No, Unreleased kernel
[    0.009929] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.009930] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.009931] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.009932] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.009937] CFAR: c000000000132df0 IRQMASK: 1 
[    0.009939] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.009942] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.009945] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.009948] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.009952] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.009955] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.009958] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.009962] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.009965] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.009966] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.009967] Call Trace:
[    0.009968] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.009970] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.009971] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.009973] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.009975] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.009976] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.009978] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.009979] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.009981] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.009982] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.009983] Instruction dump:
[    0.009985] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.009989] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.009994] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.009995] ---[ end trace 0000000000000000 ]---
[    0.009996] ------------[ cut here ]------------
[    0.009997] opal: OPAL_CONSOLE_FLUSH missing.
[    0.009998] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.009999] Modules linked in:
[    0.010000] Supported: No, Unreleased kernel
[    0.010001] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.010002] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.010004] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.010004] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.010009] CFAR: c000000000132df0 IRQMASK: 1 
[    0.010011] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.010014] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.010018] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.010021] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.010024] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.010027] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.010031] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.010034] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.010038] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.010039] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.010039] Call Trace:
[    0.010040] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.010042] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.010044] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.010045] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.010047] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.010049] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.010050] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.010052] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.010053] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.010055] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.010056] Instruction dump:
[    0.010057] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.010061] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.010066] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.010067] ---[ end trace 0000000000000000 ]---
[    0.010068] ------------[ cut here ]------------
[    0.010069] opal: OPAL_CONSOLE_FLUSH missing.
[    0.010071] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.010071] Modules linked in:
[    0.010073] Supported: No, Unreleased kernel
[    0.010074] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.010075] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.010076] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.010077] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.010082] CFAR: c000000000132df0 IRQMASK: 1 
[    0.010084] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.010087] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.010090] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.010093] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.010096] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.010100] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.010103] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.010106] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.010110] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.010111] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.010111] Call Trace:
[    0.010112] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.010114] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.010116] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.010118] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.010119] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.010121] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.010122] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.010124] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.010125] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.010127] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.010128] Instruction dump:
[    0.010129] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.010133] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.010138] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.010139] ---[ end trace 0000000000000000 ]---
[    0.010140] ------------[ cut here ]------------
[    0.010141] opal: OPAL_CONSOLE_FLUSH missing.
[    0.010143] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.010143] Modules linked in:
[    0.010144] Supported: No, Unreleased kernel
[    0.010146] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.010147] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.010148] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.010149] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.010154] CFAR: c000000000132df0 IRQMASK: 1 
[    0.010155] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.010159] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.010162] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.010165] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.010168] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.010172] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.010175] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.010178] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.010182] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.010183] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.010184] Call Trace:
[    0.010185] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.010187] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.010188] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.010190] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.010191] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.010193] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.010194] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.010196] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.010197] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.010199] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.010200] Instruction dump:
[    0.010201] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.010206] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.010211] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.010212] ---[ end trace 0000000000000000 ]---
[    0.010213] ------------[ cut here ]------------
[    0.010214] opal: OPAL_CONSOLE_FLUSH missing.
[    0.010215] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.010216] Modules linked in:
[    0.010217] Supported: No, Unreleased kernel
[    0.010218] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.010219] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.010221] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.010221] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.010226] CFAR: c000000000132df0 IRQMASK: 1 
[    0.010228] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.010231] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.010234] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.010238] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.010241] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.010244] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.010247] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.010251] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.010254] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.010255] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.010256] Call Trace:
[    0.010257] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.010259] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.010261] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.010262] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.010264] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.010265] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.010267] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.010268] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.010270] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.010271] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.010272] Instruction dump:
[    0.010274] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.010278] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.010283] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.010284] ---[ end trace 0000000000000000 ]---
[    0.010285] ------------[ cut here ]------------
[    0.010286] opal: OPAL_CONSOLE_FLUSH missing.
[    0.010287] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.010288] Modules linked in:
[    0.010289] Supported: No, Unreleased kernel
[    0.010291] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.010292] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.010293] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.010293] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.010299] CFAR: c000000000132df0 IRQMASK: 1 
[    0.010300] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.010304] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.010307] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.010310] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.010313] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.010317] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.010320] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.010323] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.010327] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.010328] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.010329] Call Trace:
[    0.010330] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.010332] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.010333] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.010335] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.010336] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.010338] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.010339] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.010341] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.010342] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.010344] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.010345] Instruction dump:
[    0.010346] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.010350] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.010356] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.010357] ---[ end trace 0000000000000000 ]---
[    0.010358] ------------[ cut here ]------------
[    0.010358] opal: OPAL_CONSOLE_FLUSH missing.
[    0.010360] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.010361] Modules linked in:
[    0.010362] Supported: No, Unreleased kernel
[    0.010363] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.010364] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.010365] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.010366] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.010371] CFAR: c000000000132df0 IRQMASK: 1 
[    0.010373] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.010376] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.010379] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.010383] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.010386] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.010389] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.010393] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.010396] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.010400] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.010400] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.010401] Call Trace:
[    0.010402] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.010404] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.010406] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.010407] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.010409] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.010410] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.010412] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.010413] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.010415] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.010416] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.010418] Instruction dump:
[    0.010419] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.010423] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.010429] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.010429] ---[ end trace 0000000000000000 ]---
[    0.010430] ------------[ cut here ]------------
[    0.010431] opal: OPAL_CONSOLE_FLUSH missing.
[    0.010433] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.010433] Modules linked in:
[    0.010435] Supported: No, Unreleased kernel
[    0.010436] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.010437] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.010438] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.010439] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.010444] CFAR: c000000000132df0 IRQMASK: 1 
[    0.010446] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.010449] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.010452] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.010455] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.010459] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.010462] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.010465] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.010468] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.010472] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.010473] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.010474] Call Trace:
[    0.010475] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.010477] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.010478] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.010480] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.010481] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.010483] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.010484] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.010486] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.010487] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.010489] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.010490] Instruction dump:
[    0.010491] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.010496] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.010501] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.010502] ---[ end trace 0000000000000000 ]---
[    0.010503] ------------[ cut here ]------------
[    0.010503] opal: OPAL_CONSOLE_FLUSH missing.
[    0.010505] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.010505] Modules linked in:
[    0.010507] Supported: No, Unreleased kernel
[    0.010508] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.010509] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.010510] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.010511] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.010516] CFAR: c000000000132df0 IRQMASK: 1 
[    0.010518] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.010521] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.010524] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.010528] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.010531] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.010534] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.010538] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.010541] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.010545] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.010546] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.010546] Call Trace:
[    0.010547] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.010549] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.010551] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.010552] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.010554] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.010555] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.010557] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.010558] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.010560] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.010561] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.010562] Instruction dump:
[    0.010564] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.010568] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.010573] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.010574] ---[ end trace 0000000000000000 ]---
[    0.010575] ------------[ cut here ]------------
[    0.010576] opal: OPAL_CONSOLE_FLUSH missing.
[    0.010578] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.010578] Modules linked in:
[    0.010579] Supported: No, Unreleased kernel
[    0.010581] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.010582] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.010583] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.010584] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.010589] CFAR: c000000000132df0 IRQMASK: 1 
[    0.010590] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.010594] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.010597] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.010600] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.010603] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.010607] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.010610] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.010613] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.010617] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.010618] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.010618] Call Trace:
[    0.010619] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.010622] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.010623] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.010625] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.010626] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.010628] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.010629] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.010631] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.010632] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.010634] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.010635] Instruction dump:
[    0.010636] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.010641] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.010646] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.010647] ---[ end trace 0000000000000000 ]---
[    0.010648] ------------[ cut here ]------------
[    0.010649] opal: OPAL_CONSOLE_FLUSH missing.
[    0.010650] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.010651] Modules linked in:
[    0.010652] Supported: No, Unreleased kernel
[    0.010653] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.010654] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.010655] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.010656] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.010661] CFAR: c000000000132df0 IRQMASK: 1 
[    0.010663] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.010666] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.010669] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.010673] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.010676] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.010679] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.010682] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.010686] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.010689] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.010690] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.010691] Call Trace:
[    0.010692] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.010694] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.010695] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.010697] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.010698] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.010700] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.010702] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.010703] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.010705] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.010706] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.010707] Instruction dump:
[    0.010709] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.010713] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.010718] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.010719] ---[ end trace 0000000000000000 ]---
[    0.010720] ------------[ cut here ]------------
[    0.010721] opal: OPAL_CONSOLE_FLUSH missing.
[    0.010722] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.010723] Modules linked in:
[    0.010724] Supported: No, Unreleased kernel
[    0.010726] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.010727] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.010728] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.010728] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.010734] CFAR: c000000000132df0 IRQMASK: 1 
[    0.010735] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.010739] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.010742] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.010745] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.010748] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.010752] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.010755] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.010758] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.010762] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.010763] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.010763] Call Trace:
[    0.010765] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.010767] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.010768] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.010770] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.010771] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.010773] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.010774] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.010776] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.010777] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.010779] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.010780] Instruction dump:
[    0.010781] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.010786] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.010791] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.010792] ---[ end trace 0000000000000000 ]---
[    0.010793] ------------[ cut here ]------------
[    0.010794] opal: OPAL_CONSOLE_FLUSH missing.
[    0.010795] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.010796] Modules linked in:
[    0.010797] Supported: No, Unreleased kernel
[    0.010798] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.010799] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.010801] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.010801] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.010807] CFAR: c000000000132df0 IRQMASK: 1 
[    0.010808] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.010811] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.010814] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.010818] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.010821] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.010824] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.010828] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.010831] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.010835] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.010836] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.010836] Call Trace:
[    0.010837] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.010839] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.010841] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.010842] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.010844] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.010846] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.010847] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.010849] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.010850] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.010852] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.010853] Instruction dump:
[    0.010854] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.010858] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.010864] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.010864] ---[ end trace 0000000000000000 ]---
[    0.010866] ------------[ cut here ]------------
[    0.010866] opal: OPAL_CONSOLE_FLUSH missing.
[    0.010868] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.010868] Modules linked in:
[    0.010870] Supported: No, Unreleased kernel
[    0.010871] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.010872] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.010873] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.010874] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.010879] CFAR: c000000000132df0 IRQMASK: 1 
[    0.010881] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.010884] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.010887] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.010891] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.010894] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.010897] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.010900] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.010903] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.010907] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.010908] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.010909] Call Trace:
[    0.010910] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.010912] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.010913] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.010915] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.010916] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.010918] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.010920] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.010921] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.010923] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.010924] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.010925] Instruction dump:
[    0.010926] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.010931] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.010936] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.010937] ---[ end trace 0000000000000000 ]---
[    0.010938] ------------[ cut here ]------------
[    0.010939] opal: OPAL_CONSOLE_FLUSH missing.
[    0.010940] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.010941] Modules linked in:
[    0.010942] Supported: No, Unreleased kernel
[    0.010943] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.010945] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.010946] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.010946] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.010952] CFAR: c000000000132df0 IRQMASK: 1 
[    0.010953] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.010956] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.010960] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.010963] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.010966] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.010970] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.010973] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.010976] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.010980] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.010981] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.010981] Call Trace:
[    0.010982] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.010984] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.010986] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.010988] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.010989] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.010991] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.010992] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.010994] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.010995] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.010997] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.010998] Instruction dump:
[    0.010999] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.011004] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.011009] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.011010] ---[ end trace 0000000000000000 ]---
[    0.011011] ------------[ cut here ]------------
[    0.011011] opal: OPAL_CONSOLE_FLUSH missing.
[    0.011013] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.011013] Modules linked in:
[    0.011015] Supported: No, Unreleased kernel
[    0.011016] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.011017] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.011018] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.011019] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.011024] CFAR: c000000000132df0 IRQMASK: 1 
[    0.011026] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.011029] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.011032] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.011036] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.011039] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.011042] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.011045] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.011049] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.011053] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.011053] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.011054] Call Trace:
[    0.011055] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.011057] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.011059] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.011060] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.011062] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.011063] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.011065] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.011066] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.011068] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.011069] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.011071] Instruction dump:
[    0.011072] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.011076] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.011081] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.011082] ---[ end trace 0000000000000000 ]---
[    0.011083] ------------[ cut here ]------------
[    0.011084] opal: OPAL_CONSOLE_FLUSH missing.
[    0.011085] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.011086] Modules linked in:
[    0.011087] Supported: No, Unreleased kernel
[    0.011089] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.011090] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.011091] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.011092] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.011097] CFAR: c000000000132df0 IRQMASK: 1 
[    0.011098] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.011102] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.011105] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.011108] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.011112] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.011115] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.011118] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.011121] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.011125] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.011126] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.011127] Call Trace:
[    0.011128] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.011130] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.011131] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.011133] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.011135] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.011136] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.011138] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.011139] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.011141] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.011142] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.011144] Instruction dump:
[    0.011145] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.011149] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.011154] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.011155] ---[ end trace 0000000000000000 ]---
[    0.011156] ------------[ cut here ]------------
[    0.011157] opal: OPAL_CONSOLE_FLUSH missing.
[    0.011158] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.011159] Modules linked in:
[    0.011160] Supported: No, Unreleased kernel
[    0.011161] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.011163] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.011164] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.011164] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.011170] CFAR: c000000000132df0 IRQMASK: 1 
[    0.011171] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.011174] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.011178] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.011181] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.011184] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.011188] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.011191] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.011194] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.011198] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.011199] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.011199] Call Trace:
[    0.011200] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.011202] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.011204] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.011205] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.011207] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.011209] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.011210] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.011212] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.011213] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.011215] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.011216] Instruction dump:
[    0.011217] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.011221] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.011226] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.011227] ---[ end trace 0000000000000000 ]---
[    0.011228] ------------[ cut here ]------------
[    0.011229] opal: OPAL_CONSOLE_FLUSH missing.
[    0.011231] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.011231] Modules linked in:
[    0.011232] Supported: No, Unreleased kernel
[    0.011234] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.011235] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.011236] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.011237] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.011242] CFAR: c000000000132df0 IRQMASK: 1 
[    0.011244] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.011247] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.011250] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.011253] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.011257] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.011260] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.011263] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.011266] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.011270] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.011271] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.011272] Call Trace:
[    0.011273] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.011275] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.011276] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.011278] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.011279] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.011281] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.011283] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.011284] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.011286] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.011287] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.011288] Instruction dump:
[    0.011289] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.011294] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.011299] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.011300] ---[ end trace 0000000000000000 ]---
[    0.011301] ------------[ cut here ]------------
[    0.011302] opal: OPAL_CONSOLE_FLUSH missing.
[    0.011303] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.011304] Modules linked in:
[    0.011305] Supported: No, Unreleased kernel
[    0.011306] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.011307] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.011309] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.011309] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.011315] CFAR: c000000000132df0 IRQMASK: 1 
[    0.011316] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.011319] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.011323] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.011326] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.011329] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.011332] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.011335] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.011339] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.011343] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.011343] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.011344] Call Trace:
[    0.011345] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.011347] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.011349] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.011350] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.011352] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.011353] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.011355] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.011356] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.011358] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.011359] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.011361] Instruction dump:
[    0.011362] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.011366] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.011371] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.011372] ---[ end trace 0000000000000000 ]---
[    0.011373] ------------[ cut here ]------------
[    0.011374] opal: OPAL_CONSOLE_FLUSH missing.
[    0.011375] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.011376] Modules linked in:
[    0.011377] Supported: No, Unreleased kernel
[    0.011379] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.011380] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.011381] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.011381] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.011387] CFAR: c000000000132df0 IRQMASK: 1 
[    0.011388] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.011392] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.011395] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.011398] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.011402] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.011405] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.011408] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.011412] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.011415] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.011416] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.011417] Call Trace:
[    0.011418] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.011420] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.011421] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.011423] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.011424] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.011426] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.011428] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.011429] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.011431] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.011432] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.011433] Instruction dump:
[    0.011435] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.011439] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.011444] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.011445] ---[ end trace 0000000000000000 ]---
[    0.011446] ------------[ cut here ]------------
[    0.011447] opal: OPAL_CONSOLE_FLUSH missing.
[    0.011448] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.011449] Modules linked in:
[    0.011450] Supported: No, Unreleased kernel
[    0.011451] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.011452] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.011454] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.011454] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.011460] CFAR: c000000000132df0 IRQMASK: 1 
[    0.011461] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.011464] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.011468] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.011471] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.011474] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.011477] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.011481] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.011484] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.011488] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.011489] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.011489] Call Trace:
[    0.011490] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.011492] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.011494] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.011495] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.011497] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.011499] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.011500] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.011502] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.011503] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.011505] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.011506] Instruction dump:
[    0.011507] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.011511] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.011517] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.011517] ---[ end trace 0000000000000000 ]---
[    0.011518] ------------[ cut here ]------------
[    0.011519] opal: OPAL_CONSOLE_FLUSH missing.
[    0.011521] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.011521] Modules linked in:
[    0.011523] Supported: No, Unreleased kernel
[    0.011524] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.011525] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.011526] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.011527] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.011532] CFAR: c000000000132df0 IRQMASK: 1 
[    0.011534] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.011537] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.011540] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.011544] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.011547] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.011550] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.011553] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.011557] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.011561] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.011562] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.011562] Call Trace:
[    0.011563] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.011565] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.011567] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.011568] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.011570] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.011571] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.011573] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.011574] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.011576] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.011578] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.011579] Instruction dump:
[    0.011580] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.011584] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.011590] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.011591] ---[ end trace 0000000000000000 ]---
[    0.011592] ------------[ cut here ]------------
[    0.011592] opal: OPAL_CONSOLE_FLUSH missing.
[    0.011594] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.011594] Modules linked in:
[    0.011596] Supported: No, Unreleased kernel
[    0.011597] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.011598] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.011599] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.011600] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.011605] CFAR: c000000000132df0 IRQMASK: 1 
[    0.011607] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.011610] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.011613] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.011617] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.011620] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.011623] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.011627] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.011630] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.011634] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.011635] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.011635] Call Trace:
[    0.011636] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.011638] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.011640] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.011641] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.011643] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.011644] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.011646] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.011648] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.011649] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.011651] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.011652] Instruction dump:
[    0.011653] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.011657] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.011662] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.011663] ---[ end trace 0000000000000000 ]---
[    0.011664] ------------[ cut here ]------------
[    0.011665] opal: OPAL_CONSOLE_FLUSH missing.
[    0.011666] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.011667] Modules linked in:
[    0.011668] Supported: No, Unreleased kernel
[    0.011670] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.011671] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.011672] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.011672] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.011678] CFAR: c000000000132df0 IRQMASK: 1 
[    0.011679] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.011683] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.011686] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.011689] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.011693] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.011696] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.011699] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.011702] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.011706] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.011707] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.011708] Call Trace:
[    0.011709] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.011711] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.011712] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.011714] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.011715] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.011717] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.011719] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.011720] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.011722] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.011723] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.011724] Instruction dump:
[    0.011725] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.011730] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.011735] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.011736] ---[ end trace 0000000000000000 ]---
[    0.011737] ------------[ cut here ]------------
[    0.011738] opal: OPAL_CONSOLE_FLUSH missing.
[    0.011739] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.011740] Modules linked in:
[    0.011741] Supported: No, Unreleased kernel
[    0.011742] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.011743] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.011745] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.011745] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.011751] CFAR: c000000000132df0 IRQMASK: 1 
[    0.011752] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.011755] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.011759] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.011762] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.011765] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.011769] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.011772] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.011775] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.011779] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.011780] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.011780] Call Trace:
[    0.011781] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.011783] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.011785] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.011786] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.011788] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.011790] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.011791] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.011793] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.011794] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.011796] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.011797] Instruction dump:
[    0.011798] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.011803] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.011808] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.011809] ---[ end trace 0000000000000000 ]---
[    0.011810] ------------[ cut here ]------------
[    0.011810] opal: OPAL_CONSOLE_FLUSH missing.
[    0.011812] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.011812] Modules linked in:
[    0.011814] Supported: No, Unreleased kernel
[    0.011815] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.011816] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.011817] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.011818] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.011823] CFAR: c000000000132df0 IRQMASK: 1 
[    0.011825] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.011828] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.011831] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.011835] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.011838] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.011841] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.011844] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.011848] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.011851] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.011852] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.011853] Call Trace:
[    0.011854] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.011856] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.011858] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.011859] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.011861] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.011862] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.011864] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.011865] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.011867] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.011869] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.011870] Instruction dump:
[    0.011871] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.011875] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.011880] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.011881] ---[ end trace 0000000000000000 ]---
[    0.011882] ------------[ cut here ]------------
[    0.011883] opal: OPAL_CONSOLE_FLUSH missing.
[    0.011885] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.011885] Modules linked in:
[    0.011887] Supported: No, Unreleased kernel
[    0.011888] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.011889] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.011890] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.011891] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.011896] CFAR: c000000000132df0 IRQMASK: 1 
[    0.011898] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.011901] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.011904] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.011907] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.011911] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.011914] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.011917] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.011920] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.011924] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.011925] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.011926] Call Trace:
[    0.011927] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.011929] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.011930] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.011932] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.011934] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.011935] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.011937] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.011938] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.011940] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.011941] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.011942] Instruction dump:
[    0.011944] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.011948] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.011953] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.011954] ---[ end trace 0000000000000000 ]---
[    0.011955] ------------[ cut here ]------------
[    0.011956] opal: OPAL_CONSOLE_FLUSH missing.
[    0.011957] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.011958] Modules linked in:
[    0.011959] Supported: No, Unreleased kernel
[    0.011960] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.011962] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.011963] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.011963] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.011969] CFAR: c000000000132df0 IRQMASK: 1 
[    0.011970] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.011974] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.011977] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.011980] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.011983] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.011986] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.011990] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.011993] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.011997] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.011998] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.011998] Call Trace:
[    0.011999] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.012001] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.012003] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.012004] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.012006] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.012007] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.012009] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.012011] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.012012] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.012014] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.012015] Instruction dump:
[    0.012016] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.012020] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.012026] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.012026] ---[ end trace 0000000000000000 ]---
[    0.012028] ------------[ cut here ]------------
[    0.012028] opal: OPAL_CONSOLE_FLUSH missing.
[    0.012030] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.012030] Modules linked in:
[    0.012032] Supported: No, Unreleased kernel
[    0.012033] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.012034] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.012035] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.012036] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.012041] CFAR: c000000000132df0 IRQMASK: 1 
[    0.012043] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.012046] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.012049] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.012053] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.012056] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.012059] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.012062] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.012065] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.012069] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.012070] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.012071] Call Trace:
[    0.012072] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.012074] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.012075] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.012077] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.012078] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.012080] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.012081] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.012083] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.012084] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.012086] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.012087] Instruction dump:
[    0.012088] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.012093] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.012098] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.012099] ---[ end trace 0000000000000000 ]---
[    0.012100] ------------[ cut here ]------------
[    0.012101] opal: OPAL_CONSOLE_FLUSH missing.
[    0.012102] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.012103] Modules linked in:
[    0.012104] Supported: No, Unreleased kernel
[    0.012105] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.012106] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.012107] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.012108] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.012113] CFAR: c000000000132df0 IRQMASK: 1 
[    0.012115] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.012118] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.012121] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.012125] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.012128] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.012131] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.012135] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.012138] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.012141] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.012142] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.012143] Call Trace:
[    0.012144] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.012146] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.012148] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.012149] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.012151] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.012152] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.012154] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.012155] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.012157] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.012158] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.012160] Instruction dump:
[    0.012161] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.012165] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.012171] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.012171] ---[ end trace 0000000000000000 ]---
[    0.012173] ------------[ cut here ]------------
[    0.012173] opal: OPAL_CONSOLE_FLUSH missing.
[    0.012175] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.012175] Modules linked in:
[    0.012177] Supported: No, Unreleased kernel
[    0.012178] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.012179] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.012180] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.012181] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.012186] CFAR: c000000000132df0 IRQMASK: 1 
[    0.012188] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.012191] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.012194] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.012198] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.012201] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.012204] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.012207] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.012211] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.012214] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.012215] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.012216] Call Trace:
[    0.012217] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.012219] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.012221] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.012222] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.012224] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.012225] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.012227] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.012228] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.012230] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.012232] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.012233] Instruction dump:
[    0.012234] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.012238] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.012243] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.012244] ---[ end trace 0000000000000000 ]---
[    0.012245] ------------[ cut here ]------------
[    0.012246] opal: OPAL_CONSOLE_FLUSH missing.
[    0.012247] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.012248] Modules linked in:
[    0.012249] Supported: No, Unreleased kernel
[    0.012250] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.012251] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.012253] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.012253] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.012259] CFAR: c000000000132df0 IRQMASK: 1 
[    0.012260] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.012263] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.012267] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.012270] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.012273] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.012276] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.012280] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.012283] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.012287] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.012288] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.012288] Call Trace:
[    0.012289] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.012291] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.012293] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.012295] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.012296] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.012298] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.012299] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.012301] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.012302] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.012304] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.012305] Instruction dump:
[    0.012306] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.012310] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.012315] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.012316] ---[ end trace 0000000000000000 ]---
[    0.012317] ------------[ cut here ]------------
[    0.012318] opal: OPAL_CONSOLE_FLUSH missing.
[    0.012320] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.012320] Modules linked in:
[    0.012322] Supported: No, Unreleased kernel
[    0.012323] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.012324] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.012325] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.012326] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.012331] CFAR: c000000000132df0 IRQMASK: 1 
[    0.012333] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.012336] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.012339] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.012342] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.012345] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.012349] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.012352] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.012355] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.012359] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.012360] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.012360] Call Trace:
[    0.012361] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.012363] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.012365] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.012366] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.012368] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.012370] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.012371] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.012373] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.012374] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.012376] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.012377] Instruction dump:
[    0.012378] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.012383] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.012388] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.012389] ---[ end trace 0000000000000000 ]---
[    0.012390] ------------[ cut here ]------------
[    0.012391] opal: OPAL_CONSOLE_FLUSH missing.
[    0.012392] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.012393] Modules linked in:
[    0.012394] Supported: No, Unreleased kernel
[    0.012395] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.012396] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.012397] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.012398] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.012403] CFAR: c000000000132df0 IRQMASK: 1 
[    0.012405] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.012408] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.012411] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.012415] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.012418] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.012421] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.012424] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.012427] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.012431] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.012432] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.012433] Call Trace:
[    0.012434] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.012436] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.012438] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.012439] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.012441] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.012442] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.012444] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.012445] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.012447] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.012448] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.012450] Instruction dump:
[    0.012451] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.012455] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.012460] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.012461] ---[ end trace 0000000000000000 ]---
[    0.012462] ------------[ cut here ]------------
[    0.012463] opal: OPAL_CONSOLE_FLUSH missing.
[    0.012465] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.012465] Modules linked in:
[    0.012466] Supported: No, Unreleased kernel
[    0.012468] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.012469] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.012470] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.012471] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.012476] CFAR: c000000000132df0 IRQMASK: 1 
[    0.012478] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.012481] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.012484] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.012488] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.012491] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.012494] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.012497] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.012501] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.012504] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.012505] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.012506] Call Trace:
[    0.012507] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.012509] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.012511] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.012512] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.012514] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.012515] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.012517] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.012519] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.012520] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.012522] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.012523] Instruction dump:
[    0.012524] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.012528] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.012533] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.012534] ---[ end trace 0000000000000000 ]---
[    0.012535] ------------[ cut here ]------------
[    0.012536] opal: OPAL_CONSOLE_FLUSH missing.
[    0.012537] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.012538] Modules linked in:
[    0.012539] Supported: No, Unreleased kernel
[    0.012541] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.012542] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.012543] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.012544] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.012549] CFAR: c000000000132df0 IRQMASK: 1 
[    0.012550] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.012554] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.012557] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.012560] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.012564] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.012567] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.012570] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.012573] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.012577] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.012578] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.012579] Call Trace:
[    0.012580] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.012582] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.012583] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.012585] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.012586] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.012588] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.012590] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.012591] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.012593] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.012594] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.012595] Instruction dump:
[    0.012596] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.012601] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.012606] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.012607] ---[ end trace 0000000000000000 ]---
[    0.012608] ------------[ cut here ]------------
[    0.012609] opal: OPAL_CONSOLE_FLUSH missing.
[    0.012610] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.012611] Modules linked in:
[    0.012612] Supported: No, Unreleased kernel
[    0.012613] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.012615] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.012616] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.012616] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.012622] CFAR: c000000000132df0 IRQMASK: 1 
[    0.012623] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.012627] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.012630] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.012633] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.012636] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.012640] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.012643] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.012646] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.012650] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.012651] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.012651] Call Trace:
[    0.012652] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.012655] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.012656] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.012658] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.012659] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.012661] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.012662] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.012664] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.012665] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.012667] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.012668] Instruction dump:
[    0.012669] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.012674] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.012679] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.012679] ---[ end trace 0000000000000000 ]---
[    0.012681] ------------[ cut here ]------------
[    0.012681] opal: OPAL_CONSOLE_FLUSH missing.
[    0.012683] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.012683] Modules linked in:
[    0.012685] Supported: No, Unreleased kernel
[    0.012686] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.012687] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.012688] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.012689] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.012694] CFAR: c000000000132df0 IRQMASK: 1 
[    0.012696] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.012699] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.012702] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.012706] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.012709] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.012712] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.012715] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.012718] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.012722] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.012723] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.012724] Call Trace:
[    0.012725] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.012727] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.012728] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.012730] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.012731] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.012733] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.012735] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.012736] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.012738] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.012739] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.012740] Instruction dump:
[    0.012741] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.012746] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.012751] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.012752] ---[ end trace 0000000000000000 ]---
[    0.012753] ------------[ cut here ]------------
[    0.012754] opal: OPAL_CONSOLE_FLUSH missing.
[    0.012755] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.012756] Modules linked in:
[    0.012757] Supported: No, Unreleased kernel
[    0.012759] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.012760] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.012761] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.012761] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.012767] CFAR: c000000000132df0 IRQMASK: 1 
[    0.012768] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.012771] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.012775] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.012778] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.012781] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.012785] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.012788] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.012791] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.012795] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.012796] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.012796] Call Trace:
[    0.012797] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.012799] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.012801] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.012802] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.012804] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.012805] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.012807] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.012809] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.012810] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.012812] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.012813] Instruction dump:
[    0.012814] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.012818] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.012824] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.012824] ---[ end trace 0000000000000000 ]---
[    0.012825] ------------[ cut here ]------------
[    0.012826] opal: OPAL_CONSOLE_FLUSH missing.
[    0.012828] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.012828] Modules linked in:
[    0.012830] Supported: No, Unreleased kernel
[    0.012831] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.012832] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.012833] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.012834] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.012839] CFAR: c000000000132df0 IRQMASK: 1 
[    0.012841] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.012844] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.012847] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.012850] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.012854] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.012857] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.012860] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.012864] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.012867] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.012868] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.012869] Call Trace:
[    0.012870] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.012872] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.012873] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.012875] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.012877] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.012878] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.012880] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.012881] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.012883] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.012884] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.012885] Instruction dump:
[    0.012886] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.012891] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.012896] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.012897] ---[ end trace 0000000000000000 ]---
[    0.012898] ------------[ cut here ]------------
[    0.012899] opal: OPAL_CONSOLE_FLUSH missing.
[    0.012900] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.012901] Modules linked in:
[    0.012902] Supported: No, Unreleased kernel
[    0.012903] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.012905] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.012906] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.012906] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.012912] CFAR: c000000000132df0 IRQMASK: 1 
[    0.012913] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.012916] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.012920] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.012923] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.012926] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.012930] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.012933] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.012936] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.012940] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.012941] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.012942] Call Trace:
[    0.012943] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.012945] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.012946] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.012948] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.012949] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.012951] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.012952] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.012954] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.012955] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.012957] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.012958] Instruction dump:
[    0.012959] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.012964] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.012969] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.012970] ---[ end trace 0000000000000000 ]---
[    0.012971] ------------[ cut here ]------------
[    0.012972] opal: OPAL_CONSOLE_FLUSH missing.
[    0.012973] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.012974] Modules linked in:
[    0.012975] Supported: No, Unreleased kernel
[    0.012976] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.012977] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.012978] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.012979] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.012984] CFAR: c000000000132df0 IRQMASK: 1 
[    0.012986] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.012989] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.012993] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.012996] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.012999] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.013002] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.013006] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.013009] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.013013] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.013014] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.013014] Call Trace:
[    0.013015] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.013017] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.013019] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.013020] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.013022] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.013023] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.013025] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.013026] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.013028] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.013030] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.013031] Instruction dump:
[    0.013032] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.013036] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.013041] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.013042] ---[ end trace 0000000000000000 ]---
[    0.013043] ------------[ cut here ]------------
[    0.013044] opal: OPAL_CONSOLE_FLUSH missing.
[    0.013046] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.013046] Modules linked in:
[    0.013047] Supported: No, Unreleased kernel
[    0.013049] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.013050] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.013051] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.013052] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.013057] CFAR: c000000000132df0 IRQMASK: 1 
[    0.013058] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.013062] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.013065] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.013068] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.013071] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.013075] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.013078] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.013081] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.013085] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.013086] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.013086] Call Trace:
[    0.013088] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.013090] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.013091] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.013093] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.013094] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.013096] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.013097] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.013099] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.013100] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.013102] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.013103] Instruction dump:
[    0.013104] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.013109] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.013114] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.013115] ---[ end trace 0000000000000000 ]---
[    0.013116] ------------[ cut here ]------------
[    0.013117] opal: OPAL_CONSOLE_FLUSH missing.
[    0.013118] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.013119] Modules linked in:
[    0.013120] Supported: No, Unreleased kernel
[    0.013121] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.013122] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.013124] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.013124] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.013130] CFAR: c000000000132df0 IRQMASK: 1 
[    0.013131] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.013134] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.013138] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.013141] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.013144] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.013147] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.013151] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.013154] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.013158] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.013159] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.013159] Call Trace:
[    0.013160] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.013162] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.013164] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.013165] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.013167] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.013168] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.013170] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.013172] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.013173] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.013175] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.013176] Instruction dump:
[    0.013177] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.013181] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.013187] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.013187] ---[ end trace 0000000000000000 ]---
[    0.013188] ------------[ cut here ]------------
[    0.013189] opal: OPAL_CONSOLE_FLUSH missing.
[    0.013191] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.013191] Modules linked in:
[    0.013193] Supported: No, Unreleased kernel
[    0.013194] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.013195] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.013196] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.013197] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.013202] CFAR: c000000000132df0 IRQMASK: 1 
[    0.013204] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.013207] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.013210] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.013213] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.013217] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.013220] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.013223] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.013226] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.013230] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.013231] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.013232] Call Trace:
[    0.013233] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.013235] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.013236] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.013238] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.013239] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.013241] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.013242] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.013244] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.013245] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.013247] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.013248] Instruction dump:
[    0.013249] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.013254] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.013259] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.013260] ---[ end trace 0000000000000000 ]---
[    0.013261] ------------[ cut here ]------------
[    0.013262] opal: OPAL_CONSOLE_FLUSH missing.
[    0.013263] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.013264] Modules linked in:
[    0.013265] Supported: No, Unreleased kernel
[    0.013266] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.013267] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.013268] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.013269] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.013274] CFAR: c000000000132df0 IRQMASK: 1 
[    0.013276] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.013279] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.013283] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.013286] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.013289] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.013292] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.013296] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.013299] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.013302] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.013303] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.013304] Call Trace:
[    0.013305] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.013307] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.013308] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.013310] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.013312] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.013313] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.013315] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.013316] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.013318] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.013319] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.013320] Instruction dump:
[    0.013321] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.013326] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.013331] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.013332] ---[ end trace 0000000000000000 ]---
[    0.013333] ------------[ cut here ]------------
[    0.013334] opal: OPAL_CONSOLE_FLUSH missing.
[    0.013335] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.013336] Modules linked in:
[    0.013337] Supported: No, Unreleased kernel
[    0.013338] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.013339] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.013341] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.013341] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.013346] CFAR: c000000000132df0 IRQMASK: 1 
[    0.013348] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.013351] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.013354] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.013358] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.013361] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.013364] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.013367] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.013371] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.013374] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.013375] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.013376] Call Trace:
[    0.013377] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.013379] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.013381] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.013382] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.013384] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.013385] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.013387] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.013388] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.013390] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.013391] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.013392] Instruction dump:
[    0.013394] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.013398] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.013403] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.013404] ---[ end trace 0000000000000000 ]---
[    0.013405] ------------[ cut here ]------------
[    0.013406] opal: OPAL_CONSOLE_FLUSH missing.
[    0.013408] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.013408] Modules linked in:
[    0.013410] Supported: No, Unreleased kernel
[    0.013411] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.013412] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.013413] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.013414] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.013419] CFAR: c000000000132df0 IRQMASK: 1 
[    0.013421] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.013424] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.013427] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.013430] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.013434] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.013437] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.013440] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.013443] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.013447] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.013448] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.013448] Call Trace:
[    0.013449] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.013452] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.013453] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.013455] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.013456] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.013458] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.013459] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.013461] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.013462] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.013464] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.013465] Instruction dump:
[    0.013466] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.013471] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.013476] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.013477] ---[ end trace 0000000000000000 ]---
[    0.013478] ------------[ cut here ]------------
[    0.013478] opal: OPAL_CONSOLE_FLUSH missing.
[    0.013480] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.013480] Modules linked in:
[    0.013482] Supported: No, Unreleased kernel
[    0.013483] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.013484] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.013485] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.013486] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.013491] CFAR: c000000000132df0 IRQMASK: 1 
[    0.013493] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.013496] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.013499] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.013503] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.013506] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.013509] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.013513] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.013516] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.013519] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.013520] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.013521] Call Trace:
[    0.013522] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.013524] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.013526] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.013527] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.013529] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.013530] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.013532] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.013534] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.013535] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.013537] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.013538] Instruction dump:
[    0.013539] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.013543] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.013548] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.013549] ---[ end trace 0000000000000000 ]---
[    0.013550] ------------[ cut here ]------------
[    0.013551] opal: OPAL_CONSOLE_FLUSH missing.
[    0.013553] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.013553] Modules linked in:
[    0.013554] Supported: No, Unreleased kernel
[    0.013556] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.013557] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.013558] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.013559] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.013564] CFAR: c000000000132df0 IRQMASK: 1 
[    0.013565] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.013569] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.013572] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.013575] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.013578] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.013582] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.013585] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.013588] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.013592] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.013593] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.013593] Call Trace:
[    0.013594] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.013596] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.013598] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.013599] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.013601] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.013603] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.013604] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.013606] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.013607] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.013609] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.013610] Instruction dump:
[    0.013611] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.013616] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.013621] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.013622] ---[ end trace 0000000000000000 ]---
[    0.013623] ------------[ cut here ]------------
[    0.013624] opal: OPAL_CONSOLE_FLUSH missing.
[    0.013625] WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
[    0.013626] Modules linked in:
[    0.013627] Supported: No, Unreleased kernel
[    0.013628] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
[    0.013629] NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
[    0.013630] REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
[    0.013631] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28024222  XER: 20000000
[    0.013636] CFAR: c000000000132df0 IRQMASK: 1 
[    0.013638] GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
[    0.013641] GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
[    0.013644] GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
[    0.013648] GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000003460600 
[    0.013651] GPR16: 000000002ffa0000 0000000000000000 c0000000014641e0 0000000000000000 
[    0.013654] GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
[    0.013657] GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
[    0.013661] GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
[    0.013664] NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
[    0.013665] LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
[    0.013666] Call Trace:
[    0.013667] [c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[    0.013669] [c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[    0.013670] [c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[    0.013672] [c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[    0.013673] [c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[    0.013675] [c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[    0.013676] [c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[    0.013678] [c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[    0.013679] [c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[    0.013681] [c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
[    0.013682] Instruction dump:
[    0.013683] 60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
[    0.013687] 38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
[    0.013693] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[    0.013693] ---[ end trace 0000000000000000 ]---
[   30.071649] Console: colour dummy device 80x25
[   30.072101] printk: console [hvc0] enabled
[   30.072515] printk: bootconsole [udbg0] disabled
[   30.073275] mempolicy: Disabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
[   30.073298] pid_max: default: 163840 minimum: 1280
[   30.074997] LSM: Security Framework initializing
[   30.075377] AppArmor: AppArmor initialized
[   30.081896] Dentry cache hash table entries: 8388608 (order: 10, 67108864 bytes, vmalloc)
[   30.085219] Inode-cache hash table entries: 4194304 (order: 9, 33554432 bytes, vmalloc)
[   30.085554] Mount-cache hash table entries: 131072 (order: 4, 1048576 bytes, vmalloc)
[   30.165095] Mountpoint-cache hash table entries: 131072 (order: 4, 1048576 bytes, vmalloc)
[   30.167863] EEH: PowerNV platform initialized
[   30.167886] POWER8 performance monitor hardware support registered
[   30.167962] power8-pmu: PMAO restore workaround active.
[   30.168005] rcu: Hierarchical SRCU implementation.
[   30.170302] smp: Bringing up secondary CPUs ...
[   30.777463] smp: Brought up 4 nodes, 160 CPUs
[   30.777511] numa: Node 0 CPUs: 0-39
[   30.777539] numa: Node 1 CPUs: 40-79
[   30.777566] numa: Node 16 CPUs: 80-119
[   30.777594] numa: Node 17 CPUs: 120-159
[   30.777621] Using standard scheduler topology
[   30.964176] node 0 initialised, 1010446 pages in 150ms
[   30.968138] node 16 initialised, 936293 pages in 160ms
[   30.972631] devtmpfs: initialized
[   31.046361] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[   31.046524] futex hash table entries: 65536 (order: 7, 8388608 bytes, vmalloc)
[   31.061336] pinctrl core: initialized pinctrl subsystem
[   31.062847] NET: Registered protocol family 16
[   31.063569] audit: initializing netlink subsys (disabled)
[   31.063924] audit: type=2000 audit(1573749590.920:1): state=initialized audit_enabled=0 res=1
[   31.064493] cpuidle: using governor ladder
[   31.065000] cpuidle: using governor menu
[   31.065205] pstore: Registered nvram as persistent store backend
[   31.318932] PCI: Probing PCI hardware
[   31.319177] PCI host bridge to bus 0000:00
[   31.319208] pci_bus 0000:00: root bus resource [mem 0x3fe000000000-0x3fe07ffeffff] (bus address [0x80000000-0xfffeffff])
[   31.319242] pci_bus 0000:00: root bus resource [mem 0x3b0000000000-0x3b0fdfffffff 64bit pref]
[   31.319274] pci_bus 0000:00: root bus resource [bus 00-ff]
[   31.319302] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[   31.319389] pci 0000:00:00.0: [1014:03dc] type 01 class 0x060400
[   31.319734] pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
[   31.328080] pci 0000:00:00.0: PCI bridge to [bus 01]
[   31.328176] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 01
[   31.328277] PCI host bridge to bus 0001:00
[   31.328303] pci_bus 0001:00: root bus resource [mem 0x3fe080000000-0x3fe0fffeffff] (bus address [0x80000000-0xfffeffff])
[   31.328336] pci_bus 0001:00: root bus resource [mem 0x3b1000000000-0x3b1fdfffffff 64bit pref]
[   31.328366] pci_bus 0001:00: root bus resource [bus 00-ff]
[   31.328393] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to ff
[   31.328461] pci 0001:00:00.0: [1014:03dc] type 01 class 0x060400
[   31.328787] pci 0001:00:00.0: PME# supported from D0 D3hot D3cold
[   31.333168] pci 0001:01:00.0: [10b5:8732] type 01 class 0x060400
[   31.333305] pci 0001:01:00.0: reg 0x10: [mem 0x3fe081800000-0x3fe08183ffff]
[   31.333763] pci 0001:01:00.0: PME# supported from D0 D3hot D3cold
[   31.338154] pci 0001:00:00.0: PCI bridge to [bus 01-09]
[   31.338613] pci 0001:02:01.0: [10b5:8732] type 01 class 0x060400
[   31.339158] pci 0001:02:01.0: PME# supported from D0 D3hot D3cold
[   31.340388] pci 0001:02:08.0: [10b5:8732] type 01 class 0x060400
[   31.340932] pci 0001:02:08.0: PME# supported from D0 D3hot D3cold
[   31.341425] pci 0001:02:09.0: [10b5:8732] type 01 class 0x060400
[   31.341980] pci 0001:02:09.0: PME# supported from D0 D3hot D3cold
[   31.345161] pci 0001:01:00.0: PCI bridge to [bus 02-09]
[   31.349565] pci 0001:02:01.0: PCI bridge to [bus 03-07]
[   31.349821] pci 0001:08:00.0: [1014:034a] type 00 class 0x010400
[   31.349938] pci 0001:08:00.0: reg 0x10: [mem 0x3fe080c20000-0x3fe080c2ffff 64bit]
[   31.350009] pci 0001:08:00.0: reg 0x18: [mem 0x3fe080c30000-0x3fe080c3ffff 64bit]
[   31.350116] pci 0001:08:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[   31.350395] pci 0001:08:00.0: PME# supported from D0 D3hot D3cold
[   31.350544] pci 0001:08:00.0: reg 0x16c: [mem 0x3fe080800000-0x3fe08080ffff 64bit]
[   31.350575] pci 0001:08:00.0: VF(n) BAR0 space: [mem 0x3fe080800000-0x3fe0809fffff 64bit] (contains BAR0 for 32 VFs)
[   31.350642] pci 0001:08:00.0: reg 0x174: [mem 0x3fe080a00000-0x3fe080a0ffff 64bit]
[   31.350672] pci 0001:08:00.0: VF(n) BAR2 space: [mem 0x3fe080a00000-0x3fe080bfffff 64bit] (contains BAR2 for 32 VFs)
[   31.351204] pci 0001:08:00.0: 63.008 Gb/s available PCIe bandwidth, limited by 8 GT/s x8 link at 0001:00:00.0 (capable of 126.016 Gb/s with 8 GT/s x16 link)
[   31.351247] pci 0001:08:00.0: Don't support SR-IOV with non M64 VF BAR0: [mem 0x3fe080800000-0x3fe0809fffff 64bit]. 
[   31.355433] pci 0001:02:08.0: PCI bridge to [bus 08]
[   31.355700] pci 0001:09:00.0: [1002:68f2] type 00 class 0x030000
[   31.355824] pci 0001:09:00.0: reg 0x10: [mem 0x3b1020000000-0x3b102fffffff 64bit pref]
[   31.355894] pci 0001:09:00.0: reg 0x18: [mem 0x3fe081000000-0x3fe08101ffff 64bit]
[   31.355950] pci 0001:09:00.0: reg 0x20: [io  0x0000-0x00ff]
[   31.356030] pci 0001:09:00.0: reg 0x30: [mem 0x3fe081020000-0x3fe08103ffff pref]
[   31.356084] pci 0001:09:00.0: enabling Extended Tags
[   31.356302] pci 0001:09:00.0: supports D1 D2
[   31.356454] pci 0001:09:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5 GT/s x1 link at 0001:02:09.0 (capable of 64.000 Gb/s with 5 GT/s x16 link)
[   31.356650] pci 0001:09:00.1: [1002:aa68] type 00 class 0x040300
[   31.356766] pci 0001:09:00.1: reg 0x10: [mem 0x3fe081040000-0x3fe081043fff 64bit]
[   31.356916] pci 0001:09:00.1: enabling Extended Tags
[   31.356976] pci 0001:09:00.1: BAR0 [mem size 0x00004000 64bit]: requesting alignment to 0x10000
[   31.357164] pci 0001:09:00.1: supports D1 D2
[   31.361505] pci 0001:02:09.0: PCI bridge to [bus 09]
[   31.361742] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to 09
[   31.361850] PCI host bridge to bus 0002:00
[   31.361877] pci_bus 0002:00: root bus resource [mem 0x3fe200000000-0x3fe27ffeffff] (bus address [0x80000000-0xfffeffff])
[   31.361909] pci_bus 0002:00: root bus resource [mem 0x3b4000000000-0x3b4fdfffffff 64bit pref]
[   31.361939] pci_bus 0002:00: root bus resource [bus 00-ff]
[   31.361966] pci_bus 0002:00: busn_res: [bus 00-ff] end is updated to ff
[   31.362035] pci 0002:00:00.0: [1014:03dc] type 01 class 0x060400
[   31.362375] pci 0002:00:00.0: PME# supported from D0 D3hot D3cold
[   31.370657] pci 0002:00:00.0: PCI bridge to [bus 01]
[   31.370753] pci_bus 0002:00: busn_res: [bus 00-ff] end is updated to 01
[   31.370850] PCI host bridge to bus 0003:00
[   31.370877] pci_bus 0003:00: root bus resource [mem 0x3fe280000000-0x3fe2fffeffff] (bus address [0x80000000-0xfffeffff])
[   31.370910] pci_bus 0003:00: root bus resource [mem 0x3b5000000000-0x3b5fdfffffff 64bit pref]
[   31.370940] pci_bus 0003:00: root bus resource [bus 00-ff]
[   31.370966] pci_bus 0003:00: busn_res: [bus 00-ff] end is updated to ff
[   31.371034] pci 0003:00:00.0: [1014:03dc] type 01 class 0x060400
[   31.371369] pci 0003:00:00.0: PME# supported from D0 D3hot D3cold
[   31.375750] pci 0003:01:00.0: [10b5:8748] type 01 class 0x060400
[   31.375878] pci 0003:01:00.0: reg 0x10: [mem 0x3fe282800000-0x3fe28283ffff]
[   31.376333] pci 0003:01:00.0: PME# supported from D0 D3hot D3cold
[   31.380714] pci 0003:00:00.0: PCI bridge to [bus 01-0f]
[   31.381149] pci 0003:02:01.0: [10b5:8748] type 01 class 0x060400
[   31.381706] pci 0003:02:01.0: PME# supported from D0 D3hot D3cold
[   31.383001] pci 0003:02:08.0: [10b5:8748] type 01 class 0x060400
[   31.383564] pci 0003:02:08.0: PME# supported from D0 D3hot D3cold
[   31.384064] pci 0003:02:09.0: [10b5:8748] type 01 class 0x060400
[   31.384629] pci 0003:02:09.0: PME# supported from D0 D3hot D3cold
[   31.385879] pci 0003:02:10.0: [10b5:8748] type 01 class 0x060400
[   31.386448] pci 0003:02:10.0: PME# supported from D0 D3hot D3cold
[   31.386958] pci 0003:02:11.0: [10b5:8748] type 01 class 0x060400
[   31.387525] pci 0003:02:11.0: PME# supported from D0 D3hot D3cold
[   31.389723] pci 0003:01:00.0: PCI bridge to [bus 02-0f]
[   31.390388] pci 0003:03:00.0: [104c:8241] type 00 class 0x0c0330
[   31.390505] pci 0003:03:00.0: reg 0x10: [mem 0x3fe280000000-0x3fe28000ffff 64bit]
[   31.390578] pci 0003:03:00.0: reg 0x18: [mem 0x3fe280010000-0x3fe280011fff 64bit]
[   31.390735] pci 0003:03:00.0: BAR2 [mem size 0x00002000 64bit]: requesting alignment to 0x10000
[   31.390952] pci 0003:03:00.0: supports D1 D2
[   31.390977] pci 0003:03:00.0: PME# supported from D0 D1 D2 D3hot
[   31.395399] pci 0003:02:01.0: PCI bridge to [bus 03]
[   31.395672] pci 0003:04:00.0: [1014:034a] type 00 class 0x010400
[   31.395792] pci 0003:04:00.0: reg 0x10: [mem 0x3fe280c20000-0x3fe280c2ffff 64bit]
[   31.395864] pci 0003:04:00.0: reg 0x18: [mem 0x3fe280c30000-0x3fe280c3ffff 64bit]
[   31.395973] pci 0003:04:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[   31.396261] pci 0003:04:00.0: PME# supported from D0 D3hot D3cold
[   31.396412] pci 0003:04:00.0: reg 0x16c: [mem 0x3fe280800000-0x3fe28080ffff 64bit]
[   31.396443] pci 0003:04:00.0: VF(n) BAR0 space: [mem 0x3fe280800000-0x3fe2809fffff 64bit] (contains BAR0 for 32 VFs)
[   31.396510] pci 0003:04:00.0: reg 0x174: [mem 0x3fe280a00000-0x3fe280a0ffff 64bit]
[   31.396541] pci 0003:04:00.0: VF(n) BAR2 space: [mem 0x3fe280a00000-0x3fe280bfffff 64bit] (contains BAR2 for 32 VFs)
[   31.397092] pci 0003:04:00.0: 63.008 Gb/s available PCIe bandwidth, limited by 8 GT/s x8 link at 0003:00:00.0 (capable of 126.016 Gb/s with 8 GT/s x16 link)
[   31.397135] pci 0003:04:00.0: Don't support SR-IOV with non M64 VF BAR0: [mem 0x3fe280800000-0x3fe2809fffff 64bit]. 
[   31.401317] pci 0003:02:08.0: PCI bridge to [bus 04]
[   31.401603] pci 0003:05:00.0: [14e4:1657] type 00 class 0x020000
[   31.401731] pci 0003:05:00.0: reg 0x10: [mem 0x3b5010000000-0x3b501000ffff 64bit pref]
[   31.401804] pci 0003:05:00.0: reg 0x18: [mem 0x3b5010010000-0x3b501001ffff 64bit pref]
[   31.401881] pci 0003:05:00.0: reg 0x20: [mem 0x3b5010020000-0x3b501002ffff 64bit pref]
[   31.401938] pci 0003:05:00.0: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[   31.402283] pci 0003:05:00.0: PME# supported from D0 D3hot D3cold
[   31.402642] pci 0003:05:00.1: [14e4:1657] type 00 class 0x020000
[   31.402769] pci 0003:05:00.1: reg 0x10: [mem 0x3b5010030000-0x3b501003ffff 64bit pref]
[   31.402842] pci 0003:05:00.1: reg 0x18: [mem 0x3b5010040000-0x3b501004ffff 64bit pref]
[   31.402915] pci 0003:05:00.1: reg 0x20: [mem 0x3b5010050000-0x3b501005ffff 64bit pref]
[   31.402972] pci 0003:05:00.1: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[   31.403318] pci 0003:05:00.1: PME# supported from D0 D3hot D3cold
[   31.403670] pci 0003:05:00.2: [14e4:1657] type 00 class 0x020000
[   31.403797] pci 0003:05:00.2: reg 0x10: [mem 0x3b5010060000-0x3b501006ffff 64bit pref]
[   31.403870] pci 0003:05:00.2: reg 0x18: [mem 0x3b5010070000-0x3b501007ffff 64bit pref]
[   31.403942] pci 0003:05:00.2: reg 0x20: [mem 0x3b5010080000-0x3b501008ffff 64bit pref]
[   31.403999] pci 0003:05:00.2: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[   31.404345] pci 0003:05:00.2: PME# supported from D0 D3hot D3cold
[   31.404647] pci 0003:05:00.3: [14e4:1657] type 00 class 0x020000
[   31.404773] pci 0003:05:00.3: reg 0x10: [mem 0x3b5010090000-0x3b501009ffff 64bit pref]
[   31.404846] pci 0003:05:00.3: reg 0x18: [mem 0x3b50100a0000-0x3b50100affff 64bit pref]
[   31.404918] pci 0003:05:00.3: reg 0x20: [mem 0x3b50100b0000-0x3b50100bffff 64bit pref]
[   31.404975] pci 0003:05:00.3: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[   31.405320] pci 0003:05:00.3: PME# supported from D0 D3hot D3cold
[   31.409768] pci 0003:02:09.0: PCI bridge to [bus 05]
[   31.414025] pci 0003:02:10.0: PCI bridge to [bus 06-0a]
[   31.418192] pci 0003:02:11.0: PCI bridge to [bus 0b-0f]
[   31.418390] pci_bus 0003:00: busn_res: [bus 00-ff] end is updated to 0f
[   31.418504] PCI host bridge to bus 0004:00
[   31.418531] pci_bus 0004:00: root bus resource [mem 0x3ff000000000-0x3ff07ffeffff] (bus address [0x80000000-0xfffeffff])
[   31.418564] pci_bus 0004:00: root bus resource [mem 0x3d0000000000-0x3d0fdfffffff 64bit pref]
[   31.418594] pci_bus 0004:00: root bus resource [bus 00-ff]
[   31.418620] pci_bus 0004:00: busn_res: [bus 00-ff] end is updated to ff
[   31.418689] pci 0004:00:00.0: [1014:03dc] type 01 class 0x060400
[   31.419030] pci 0004:00:00.0: PME# supported from D0 D3hot D3cold
[   31.427323] pci 0004:00:00.0: PCI bridge to [bus 01]
[   31.427432] pci_bus 0004:00: busn_res: [bus 00-ff] end is updated to 01
[   31.427543] PCI host bridge to bus 0005:00
[   31.427582] pci_bus 0005:00: root bus resource [mem 0x3ff200000000-0x3ff27ffeffff] (bus address [0x80000000-0xfffeffff])
[   31.427628] pci_bus 0005:00: root bus resource [mem 0x3d4000000000-0x3d4fdfffffff 64bit pref]
[   31.427671] pci_bus 0005:00: root bus resource [bus 00-ff]
[   31.427710] pci_bus 0005:00: busn_res: [bus 00-ff] end is updated to ff
[   31.427792] pci 0005:00:00.0: [1014:03dc] type 01 class 0x060400
[   31.428152] pci 0005:00:00.0: PME# supported from D0 D3hot D3cold
[   31.436454] pci 0005:00:00.0: PCI bridge to [bus 01]
[   31.436551] pci_bus 0005:00: busn_res: [bus 00-ff] end is updated to 01
[   31.436650] PCI host bridge to bus 0006:00
[   31.436677] pci_bus 0006:00: root bus resource [mem 0x3ff280000000-0x3ff2fffeffff] (bus address [0x80000000-0xfffeffff])
[   31.436710] pci_bus 0006:00: root bus resource [mem 0x3d5000000000-0x3d5fdfffffff 64bit pref]
[   31.436740] pci_bus 0006:00: root bus resource [bus 00-ff]
[   31.436766] pci_bus 0006:00: busn_res: [bus 00-ff] end is updated to ff
[   31.436837] pci 0006:00:00.0: [1014:03dc] type 01 class 0x060400
[   31.437186] pci 0006:00:00.0: PME# supported from D0 D3hot D3cold
[   31.441578] pci 0006:01:00.0: [104c:8241] type 00 class 0x0c0330
[   31.441696] pci 0006:01:00.0: reg 0x10: [mem 0x3ff280000000-0x3ff28000ffff 64bit]
[   31.441768] pci 0006:01:00.0: reg 0x18: [mem 0x3ff280010000-0x3ff280011fff 64bit]
[   31.441926] pci 0006:01:00.0: BAR2 [mem size 0x00002000 64bit]: requesting alignment to 0x10000
[   31.442146] pci 0006:01:00.0: supports D1 D2
[   31.442172] pci 0006:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   31.446562] pci 0006:00:00.0: PCI bridge to [bus 01]
[   31.446718] pci_bus 0006:00: busn_res: [bus 00-ff] end is updated to 01
[   31.446770] pci 0000:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[   31.447209] pci 0000:00:00.0: PCI bridge to [bus 01]
[   31.447267] pci_bus 0000:00: resource 4 [mem 0x3fe000000000-0x3fe07ffeffff]
[   31.447296] pci_bus 0000:00: resource 5 [mem 0x3b0000000000-0x3b0fdfffffff 64bit pref]
[   31.447328] pci 0001:02:01.0: bridge window [io  0x1000-0x0fff] to [bus 03-07] add_size 1000
[   31.447362] pci 0001:02:01.0: bridge window [mem 0x10000000-0x0fffffff 64bit pref] to [bus 03-07] add_size 10000000 add_align 10000000
[   31.447398] pci 0001:02:01.0: bridge window [mem 0x00800000-0x007fffff] to [bus 03-07] add_size 800000 add_align 800000
[   31.447432] pci 0001:02:08.0: bridge window [io  0x1000-0x0fff] to [bus 08] add_size 1000
[   31.447464] pci 0001:02:08.0: bridge window [mem 0x10000000-0x0fffffff 64bit pref] to [bus 08] add_size 10000000 add_align 10000000
[   31.447506] pci 0001:01:00.0: bridge window [io  0x1000-0x1fff] to [bus 02-09] add_size 2000
[   31.447540] pci 0001:01:00.0: bridge window [mem 0x10000000-0x3fffffff 64bit pref] to [bus 02-09] add_size 20000000 add_align 10000000
[   31.447577] pci 0001:01:00.0: bridge window [mem 0x00800000-0x01ffffff] to [bus 02-09] add_size 800000 add_align 800000
[   31.447611] pci 0001:00:00.0: bridge window [io  0x1000-0x1fff] to [bus 01-09] add_size 2000
[   31.447644] pci 0001:00:00.0: bridge window [mem 0x10000000-0x3fffffff 64bit pref] to [bus 01-09] add_size 20000000 add_align 10000000
[   31.447682] pci 0001:00:00.0: bridge window [mem 0x00800000-0x027fffff] to [bus 01-09] add_size 800000 add_align 800000
[   31.447721] pci 0001:00:00.0: BAR 15: assigned [mem 0x3b1000000000-0x3b104fffffff 64bit pref]
[   31.447752] pci 0001:00:00.0: BAR 14: assigned [mem 0x3fe080000000-0x3fe0827fffff]
[   31.447782] pci 0001:00:00.0: BAR 13: no space for [io  size 0x3000]
[   31.447808] pci 0001:00:00.0: BAR 13: failed to assign [io  size 0x3000]
[   31.447838] pci 0001:00:00.0: BAR 13: no space for [io  size 0x1000]
[   31.447866] pci 0001:00:00.0: BAR 13: failed to assign [io  size 0x1000]
[   31.447898] pci 0001:01:00.0: BAR 15: assigned [mem 0x3b1000000000-0x3b104fffffff 64bit pref]
[   31.447930] pci 0001:01:00.0: BAR 14: assigned [mem 0x3fe080000000-0x3fe081ffffff]
[   31.447960] pci 0001:01:00.0: BAR 0: assigned [mem 0x3fe082000000-0x3fe08203ffff]
[   31.447998] pci 0001:01:00.0: BAR 13: no space for [io  size 0x3000]
[   31.448026] pci 0001:01:00.0: BAR 13: failed to assign [io  size 0x3000]
[   31.448055] pci 0001:01:00.0: BAR 13: no space for [io  size 0x1000]
[   31.529818] pci 0001:01:00.0: BAR 13: failed to assign [io  size 0x1000]
[   31.529854] pci 0001:02:01.0: BAR 15: assigned [mem 0x3b1000000000-0x3b100fffffff 64bit pref]
[   31.529886] pci 0001:02:08.0: BAR 15: assigned [mem 0x3b1010000000-0x3b101fffffff 64bit pref]
[   31.529917] pci 0001:02:09.0: BAR 15: assigned [mem 0x3b1020000000-0x3b102fffffff 64bit pref]
[   31.529948] pci 0001:02:01.0: BAR 14: assigned [mem 0x3fe080000000-0x3fe0807fffff]
[   31.529978] pci 0001:02:08.0: BAR 14: assigned [mem 0x3fe080800000-0x3fe080ffffff]
[   31.530008] pci 0001:02:09.0: BAR 14: assigned [mem 0x3fe081000000-0x3fe0817fffff]
[   31.530036] pci 0001:02:01.0: BAR 13: no space for [io  size 0x1000]
[   31.530064] pci 0001:02:01.0: BAR 13: failed to assign [io  size 0x1000]
[   31.530091] pci 0001:02:08.0: BAR 13: no space for [io  size 0x1000]
[   31.530118] pci 0001:02:08.0: BAR 13: failed to assign [io  size 0x1000]
[   31.530145] pci 0001:02:09.0: BAR 13: no space for [io  size 0x1000]
[   31.530172] pci 0001:02:09.0: BAR 13: failed to assign [io  size 0x1000]
[   31.530202] pci 0001:02:09.0: BAR 13: no space for [io  size 0x1000]
[   31.530229] pci 0001:02:09.0: BAR 13: failed to assign [io  size 0x1000]
[   31.627329] pci 0001:02:08.0: BAR 13: no space for [io  size 0x1000]
[   31.627356] pci 0001:02:08.0: BAR 13: failed to assign [io  size 0x1000]
[   31.627384] pci 0001:02:01.0: BAR 13: no space for [io  size 0x1000]
[   31.627410] pci 0001:02:01.0: BAR 13: failed to assign [io  size 0x1000]
[   31.627440] pci 0001:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[   31.627874] pci 0001:02:01.0: PCI bridge to [bus 03-07]
[   31.627910] pci 0001:02:01.0:   bridge window [mem 0x3fe080000000-0x3fe0807fffff]
[   31.627947] pci 0001:02:01.0:   bridge window [mem 0x3b1000000000-0x3b100fffffff 64bit pref]
[   31.627994] pci 0001:08:00.0: BAR 6: assigned [mem 0x3fe080800000-0x3fe08081ffff pref]
[   31.628025] pci 0001:08:00.0: BAR 0: assigned [mem 0x3fe080820000-0x3fe08082ffff 64bit]
[   31.628082] pci 0001:08:00.0: BAR 2: assigned [mem 0x3fe080830000-0x3fe08083ffff 64bit]
[   31.628144] pci 0001:08     : [PE# fd] Secondary bus 0x0000000000000008 associated with PE#fd
[   31.628585] pci 0001:08     : [PE# fd] Setting up 32-bit TCE table at 0..80000000
[   31.628732] IOMMU table initialized, virtual merging enabled
[   31.725961] pci 0001:08     : [PE# fd] Setting up window#0 0..7fffffff pg=1000
[   31.725993] pci 0001:08     : [PE# fd] Enabling 64-bit DMA bypass
[   31.726022] pci 0001:02:08.0: PCI bridge to [bus 08]
[   31.726060] pci 0001:02:08.0:   bridge window [mem 0x3fe080800000-0x3fe080ffffff]
[   31.726096] pci 0001:02:08.0:   bridge window [mem 0x3b1010000000-0x3b101fffffff 64bit pref]
[   31.726145] pci 0001:09:00.0: BAR 0: assigned [mem 0x3b1020000000-0x3b102fffffff 64bit pref]
[   31.726204] pci 0001:09:00.0: BAR 2: assigned [mem 0x3fe081000000-0x3fe08101ffff 64bit]
[   31.726260] pci 0001:09:00.0: BAR 6: assigned [mem 0x3fe081020000-0x3fe08103ffff pref]
[   31.726292] pci 0001:09:00.1: BAR 0: assigned [mem 0x3fe081040000-0x3fe081043fff 64bit]
[   31.726347] pci 0001:09:00.0: BAR 4: no space for [io  size 0x0100]
[   31.726375] pci 0001:09:00.0: BAR 4: failed to assign [io  size 0x0100]
[   31.726410] pci 0001:09     : [PE# 02] Secondary bus 0x0000000000000009 associated with PE#2
[   31.726850] pci 0001:09     : [PE# 02] Setting up 32-bit TCE table at 0..80000000
[   31.726992] pci 0001:09     : [PE# 02] Setting up window#0 0..7fffffff pg=1000
[   31.805430] pci 0001:09     : [PE# 02] Enabling 64-bit DMA bypass
[   31.805459] pci 0001:02:09.0: PCI bridge to [bus 09]
[   31.805496] pci 0001:02:09.0:   bridge window [mem 0x3fe081000000-0x3fe0817fffff]
[   31.805532] pci 0001:02:09.0:   bridge window [mem 0x3b1020000000-0x3b102fffffff 64bit pref]
[   31.805581] pci 0001:02     : [PE# fc] Secondary bus 0x0000000000000002 associated with PE#fc
[   31.806018] pci 0001:01:00.0: PCI bridge to [bus 02-09]
[   31.806054] pci 0001:01:00.0:   bridge window [mem 0x3fe080000000-0x3fe0ffefffff]
[   31.806090] pci 0001:01:00.0:   bridge window [mem 0x3b1000000000-0x3b1fdff0ffff 64bit pref]
[   31.806138] pci 0001:01     : [PE# fb] Secondary bus 0x0000000000000001 associated with PE#fb
[   31.806576] pci 0001:00:00.0: PCI bridge to [bus 01-09]
[   31.806612] pci 0001:00:00.0:   bridge window [mem 0x3fe080000000-0x3fe0ffefffff]
[   31.806648] pci 0001:00:00.0:   bridge window [mem 0x3b1000000000-0x3b1fdff0ffff 64bit pref]
[   31.806691] pci_bus 0001:00: Some PCI device resources are unassigned, try booting with pci=realloc
[   31.806723] pci_bus 0001:00: resource 4 [mem 0x3fe080000000-0x3fe0fffeffff]
[   31.806752] pci_bus 0001:00: resource 5 [mem 0x3b1000000000-0x3b1fdfffffff 64bit pref]
[   31.903423] pci_bus 0001:01: resource 1 [mem 0x3fe080000000-0x3fe0ffefffff]
[   31.903452] pci_bus 0001:01: resource 2 [mem 0x3b1000000000-0x3b1fdff0ffff 64bit pref]
[   31.903481] pci_bus 0001:02: resource 1 [mem 0x3fe080000000-0x3fe0ffefffff]
[   31.903510] pci_bus 0001:02: resource 2 [mem 0x3b1000000000-0x3b1fdff0ffff 64bit pref]
[   31.903538] pci_bus 0001:03: resource 1 [mem 0x3fe080000000-0x3fe0807fffff]
[   31.903567] pci_bus 0001:03: resource 2 [mem 0x3b1000000000-0x3b100fffffff 64bit pref]
[   31.903596] pci_bus 0001:08: resource 1 [mem 0x3fe080800000-0x3fe080ffffff]
[   31.903625] pci_bus 0001:08: resource 2 [mem 0x3b1010000000-0x3b101fffffff 64bit pref]
[   31.903654] pci_bus 0001:09: resource 1 [mem 0x3fe081000000-0x3fe0817fffff]
[   31.903683] pci_bus 0001:09: resource 2 [mem 0x3b1020000000-0x3b102fffffff 64bit pref]
[   31.903714] pci 0002:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[   31.904150] pci 0002:00:00.0: PCI bridge to [bus 01]
[   31.904207] pci_bus 0002:00: resource 4 [mem 0x3fe200000000-0x3fe27ffeffff]
[   31.904235] pci_bus 0002:00: resource 5 [mem 0x3b4000000000-0x3b4fdfffffff 64bit pref]
[   32.001523] pci 0003:02:08.0: bridge window [io  0x1000-0x0fff] to [bus 04] add_size 1000
[   32.001555] pci 0003:02:08.0: bridge window [mem 0x10000000-0x0fffffff 64bit pref] to [bus 04] add_size 10000000 add_align 10000000
[   32.001591] pci 0003:02:09.0: bridge window [io  0x1000-0x0fff] to [bus 05] add_size 1000
[   32.001627] pci 0003:02:10.0: bridge window [io  0x1000-0x0fff] to [bus 06-0a] add_size 1000
[   32.001660] pci 0003:02:10.0: bridge window [mem 0x10000000-0x0fffffff 64bit pref] to [bus 06-0a] add_size 10000000 add_align 10000000
[   32.001696] pci 0003:02:10.0: bridge window [mem 0x00800000-0x007fffff] to [bus 06-0a] add_size 800000 add_align 800000
[   32.001729] pci 0003:02:11.0: bridge window [io  0x1000-0x0fff] to [bus 0b-0f] add_size 1000
[   32.001763] pci 0003:02:11.0: bridge window [mem 0x10000000-0x0fffffff 64bit pref] to [bus 0b-0f] add_size 10000000 add_align 10000000
[   32.001799] pci 0003:02:11.0: bridge window [mem 0x00800000-0x007fffff] to [bus 0b-0f] add_size 800000 add_align 800000
[   32.001833] pci 0003:01:00.0: bridge window [io  0x1000-0x0fff] to [bus 02-0f] add_size 4000
[   32.099404] pci 0003:01:00.0: bridge window [mem 0x10000000-0x4fffffff 64bit pref] to [bus 02-0f] add_size 30000000 add_align 10000000
[   32.099443] pci 0003:01:00.0: bridge window [mem 0x00800000-0x02ffffff] to [bus 02-0f] add_size 1000000 add_align 800000
[   32.099476] pci 0003:00:00.0: bridge window [io  0x1000-0x0fff] to [bus 01-0f] add_size 4000
[   32.099509] pci 0003:00:00.0: bridge window [mem 0x10000000-0x4fffffff 64bit pref] to [bus 01-0f] add_size 30000000 add_align 10000000
[   32.099546] pci 0003:00:00.0: bridge window [mem 0x00800000-0x037fffff] to [bus 01-0f] add_size 1000000 add_align 800000
[   32.099582] pci 0003:00:00.0: BAR 15: assigned [mem 0x3b5000000000-0x3b506fffffff 64bit pref]
[   32.099613] pci 0003:00:00.0: BAR 14: assigned [mem 0x3fe280000000-0x3fe283ffffff]
[   32.099642] pci 0003:00:00.0: BAR 13: no space for [io  size 0x4000]
[   32.099669] pci 0003:00:00.0: BAR 13: failed to assign [io  size 0x4000]
[   32.099698] pci 0003:00:00.0: BAR 13: no space for [io  size 0x4000]
[   32.099725] pci 0003:00:00.0: BAR 13: failed to assign [io  size 0x4000]
[   32.197804] pci 0003:01:00.0: BAR 15: assigned [mem 0x3b5000000000-0x3b506fffffff 64bit pref]
[   32.197836] pci 0003:01:00.0: BAR 14: assigned [mem 0x3fe280000000-0x3fe2837fffff]
[   32.197866] pci 0003:01:00.0: BAR 0: assigned [mem 0x3fe283800000-0x3fe28383ffff]
[   32.197904] pci 0003:01:00.0: BAR 13: no space for [io  size 0x4000]
[   32.197931] pci 0003:01:00.0: BAR 13: failed to assign [io  size 0x4000]
[   32.197961] pci 0003:01:00.0: BAR 13: no space for [io  size 0x4000]
[   32.197987] pci 0003:01:00.0: BAR 13: failed to assign [io  size 0x4000]
[   32.198027] pci 0003:02:08.0: BAR 15: assigned [mem 0x3b5000000000-0x3b500fffffff 64bit pref]
[   32.198058] pci 0003:02:09.0: BAR 15: assigned [mem 0x3b5010000000-0x3b501fffffff 64bit pref]
[   32.198090] pci 0003:02:10.0: BAR 15: assigned [mem 0x3b5020000000-0x3b502fffffff 64bit pref]
[   32.198121] pci 0003:02:11.0: BAR 15: assigned [mem 0x3b5030000000-0x3b503fffffff 64bit pref]
[   32.198152] pci 0003:02:01.0: BAR 14: assigned [mem 0x3fe280000000-0x3fe2807fffff]
[   32.198182] pci 0003:02:08.0: BAR 14: assigned [mem 0x3fe280800000-0x3fe280ffffff]
[   32.198212] pci 0003:02:09.0: BAR 14: assigned [mem 0x3fe281000000-0x3fe2817fffff]
[   32.295794] pci 0003:02:10.0: BAR 14: assigned [mem 0x3fe281800000-0x3fe281ffffff]
[   32.295824] pci 0003:02:11.0: BAR 14: assigned [mem 0x3fe282000000-0x3fe2827fffff]
[   32.295853] pci 0003:02:08.0: BAR 13: no space for [io  size 0x1000]
[   32.295880] pci 0003:02:08.0: BAR 13: failed to assign [io  size 0x1000]
[   32.295908] pci 0003:02:09.0: BAR 13: no space for [io  size 0x1000]
[   32.295935] pci 0003:02:09.0: BAR 13: failed to assign [io  size 0x1000]
[   32.295962] pci 0003:02:10.0: BAR 13: no space for [io  size 0x1000]
[   32.295989] pci 0003:02:10.0: BAR 13: failed to assign [io  size 0x1000]
[   32.296016] pci 0003:02:11.0: BAR 13: no space for [io  size 0x1000]
[   32.296043] pci 0003:02:11.0: BAR 13: failed to assign [io  size 0x1000]
[   32.296075] pci 0003:02:11.0: BAR 13: no space for [io  size 0x1000]
[   32.296102] pci 0003:02:11.0: BAR 13: failed to assign [io  size 0x1000]
[   32.296129] pci 0003:02:10.0: BAR 13: no space for [io  size 0x1000]
[   32.296155] pci 0003:02:10.0: BAR 13: failed to assign [io  size 0x1000]
[   32.296183] pci 0003:02:09.0: BAR 13: no space for [io  size 0x1000]
[   32.296210] pci 0003:02:09.0: BAR 13: failed to assign [io  size 0x1000]
[   32.393767] pci 0003:02:08.0: BAR 13: no space for [io  size 0x1000]
[   32.393794] pci 0003:02:08.0: BAR 13: failed to assign [io  size 0x1000]
[   32.393825] pci 0003:03:00.0: BAR 0: assigned [mem 0x3fe280000000-0x3fe28000ffff 64bit]
[   32.393884] pci 0003:03:00.0: BAR 2: assigned [mem 0x3fe280010000-0x3fe280011fff 64bit]
[   32.393942] pci 0003:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[   32.394383] pci 0003:03     : [PE# fd] Secondary bus 0x0000000000000003 associated with PE#fd
[   32.394822] pci 0003:03     : [PE# fd] Setting up 32-bit TCE table at 0..80000000
[   32.394964] pci 0003:03     : [PE# fd] Setting up window#0 0..7fffffff pg=1000
[   32.394994] pci 0003:03     : [PE# fd] Enabling 64-bit DMA bypass
[   32.395022] pci 0003:02:01.0: PCI bridge to [bus 03]
[   32.395059] pci 0003:02:01.0:   bridge window [mem 0x3fe280000000-0x3fe2807fffff]
[   32.395112] pci 0003:04:00.0: BAR 6: assigned [mem 0x3fe280800000-0x3fe28081ffff pref]
[   32.395144] pci 0003:04:00.0: BAR 0: assigned [mem 0x3fe280820000-0x3fe28082ffff 64bit]
[   32.395201] pci 0003:04:00.0: BAR 2: assigned [mem 0x3fe280830000-0x3fe28083ffff 64bit]
[   32.494270] pci 0003:04     : [PE# fc] Secondary bus 0x0000000000000004 associated with PE#fc
[   32.494711] pci 0003:04     : [PE# fc] Setting up 32-bit TCE table at 0..80000000
[   32.494852] pci 0003:04     : [PE# fc] Setting up window#0 0..7fffffff pg=1000
[   32.494882] pci 0003:04     : [PE# fc] Enabling 64-bit DMA bypass
[   32.494910] pci 0003:02:08.0: PCI bridge to [bus 04]
[   32.494947] pci 0003:02:08.0:   bridge window [mem 0x3fe280800000-0x3fe280ffffff]
[   32.494983] pci 0003:02:08.0:   bridge window [mem 0x3b5000000000-0x3b500fffffff 64bit pref]
[   32.495037] pci 0003:05:00.0: BAR 6: assigned [mem 0x3fe281000000-0x3fe28107ffff pref]
[   32.495067] pci 0003:05:00.1: BAR 6: assigned [mem 0x3fe281080000-0x3fe2810fffff pref]
[   32.495098] pci 0003:05:00.2: BAR 6: assigned [mem 0x3fe281100000-0x3fe28117ffff pref]
[   32.495128] pci 0003:05:00.3: BAR 6: assigned [mem 0x3fe281180000-0x3fe2811fffff pref]
[   32.495159] pci 0003:05:00.0: BAR 0: assigned [mem 0x3b5010000000-0x3b501000ffff 64bit pref]
[   32.495217] pci 0003:05:00.0: BAR 2: assigned [mem 0x3b5010010000-0x3b501001ffff 64bit pref]
[   32.495277] pci 0003:05:00.0: BAR 4: assigned [mem 0x3b5010020000-0x3b501002ffff 64bit pref]
[   32.592453] pci 0003:05:00.1: BAR 0: assigned [mem 0x3b5010030000-0x3b501003ffff 64bit pref]
[   32.592512] pci 0003:05:00.1: BAR 2: assigned [mem 0x3b5010040000-0x3b501004ffff 64bit pref]
[   32.592571] pci 0003:05:00.1: BAR 4: assigned [mem 0x3b5010050000-0x3b501005ffff 64bit pref]
[   32.592630] pci 0003:05:00.2: BAR 0: assigned [mem 0x3b5010060000-0x3b501006ffff 64bit pref]
[   32.592689] pci 0003:05:00.2: BAR 2: assigned [mem 0x3b5010070000-0x3b501007ffff 64bit pref]
[   32.592748] pci 0003:05:00.2: BAR 4: assigned [mem 0x3b5010080000-0x3b501008ffff 64bit pref]
[   32.592808] pci 0003:05:00.3: BAR 0: assigned [mem 0x3b5010090000-0x3b501009ffff 64bit pref]
[   32.592867] pci 0003:05:00.3: BAR 2: assigned [mem 0x3b50100a0000-0x3b50100affff 64bit pref]
[   32.592926] pci 0003:05:00.3: BAR 4: assigned [mem 0x3b50100b0000-0x3b50100bffff 64bit pref]
[   32.593025] pci 0003:05     : [PE# 01] Secondary bus 0x0000000000000005 associated with PE#1
[   32.593468] pci 0003:05     : [PE# 01] Setting up 32-bit TCE table at 0..80000000
[   32.593627] pci 0003:05     : [PE# 01] Setting up window#0 0..7fffffff pg=1000
[   32.693638] pci 0003:05     : [PE# 01] Enabling 64-bit DMA bypass
[   32.693666] pci 0003:02:09.0: PCI bridge to [bus 05]
[   32.693703] pci 0003:02:09.0:   bridge window [mem 0x3fe281000000-0x3fe2817fffff]
[   32.693740] pci 0003:02:09.0:   bridge window [mem 0x3b5010000000-0x3b501fffffff 64bit pref]
[   32.693784] pci 0003:02:10.0: PCI bridge to [bus 06-0a]
[   32.693821] pci 0003:02:10.0:   bridge window [mem 0x3fe281800000-0x3fe281ffffff]
[   32.693858] pci 0003:02:10.0:   bridge window [mem 0x3b5020000000-0x3b502fffffff 64bit pref]
[   32.693902] pci 0003:02:11.0: PCI bridge to [bus 0b-0f]
[   32.693938] pci 0003:02:11.0:   bridge window [mem 0x3fe282000000-0x3fe2827fffff]
[   32.693975] pci 0003:02:11.0:   bridge window [mem 0x3b5030000000-0x3b503fffffff 64bit pref]
[   32.694025] pci 0003:02     : [PE# fb] Secondary bus 0x0000000000000002 associated with PE#fb
[   32.694463] pci 0003:01:00.0: PCI bridge to [bus 02-0f]
[   32.694499] pci 0003:01:00.0:   bridge window [mem 0x3fe280000000-0x3fe2ffefffff]
[   32.694536] pci 0003:01:00.0:   bridge window [mem 0x3b5000000000-0x3b5fdff0ffff 64bit pref]
[   32.694585] pci 0003:01     : [PE# fa] Secondary bus 0x0000000000000001 associated with PE#fa
[   32.792242] pci 0003:00:00.0: PCI bridge to [bus 01-0f]
[   32.792279] pci 0003:00:00.0:   bridge window [mem 0x3fe280000000-0x3fe2ffefffff]
[   32.792315] pci 0003:00:00.0:   bridge window [mem 0x3b5000000000-0x3b5fdff0ffff 64bit pref]
[   32.792360] pci_bus 0003:00: resource 4 [mem 0x3fe280000000-0x3fe2fffeffff]
[   32.792389] pci_bus 0003:00: resource 5 [mem 0x3b5000000000-0x3b5fdfffffff 64bit pref]
[   32.792418] pci_bus 0003:01: resource 1 [mem 0x3fe280000000-0x3fe2ffefffff]
[   32.792447] pci_bus 0003:01: resource 2 [mem 0x3b5000000000-0x3b5fdff0ffff 64bit pref]
[   32.792476] pci_bus 0003:02: resource 1 [mem 0x3fe280000000-0x3fe2ffefffff]
[   32.792504] pci_bus 0003:02: resource 2 [mem 0x3b5000000000-0x3b5fdff0ffff 64bit pref]
[   32.792533] pci_bus 0003:03: resource 1 [mem 0x3fe280000000-0x3fe2807fffff]
[   32.792562] pci_bus 0003:04: resource 1 [mem 0x3fe280800000-0x3fe280ffffff]
[   32.792590] pci_bus 0003:04: resource 2 [mem 0x3b5000000000-0x3b500fffffff 64bit pref]
[   32.792619] pci_bus 0003:05: resource 1 [mem 0x3fe281000000-0x3fe2817fffff]
[   32.792648] pci_bus 0003:05: resource 2 [mem 0x3b5010000000-0x3b501fffffff 64bit pref]
[   32.889534] pci_bus 0003:06: resource 1 [mem 0x3fe281800000-0x3fe281ffffff]
[   32.889563] pci_bus 0003:06: resource 2 [mem 0x3b5020000000-0x3b502fffffff 64bit pref]
[   32.889593] pci_bus 0003:0b: resource 1 [mem 0x3fe282000000-0x3fe2827fffff]
[   32.889622] pci_bus 0003:0b: resource 2 [mem 0x3b5030000000-0x3b503fffffff 64bit pref]
[   32.889653] pci 0004:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[   32.890087] pci 0004:00:00.0: PCI bridge to [bus 01]
[   32.890145] pci_bus 0004:00: resource 4 [mem 0x3ff000000000-0x3ff07ffeffff]
[   32.890174] pci_bus 0004:00: resource 5 [mem 0x3d0000000000-0x3d0fdfffffff 64bit pref]
[   32.890205] pci 0005:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[   32.890639] pci 0005:00:00.0: PCI bridge to [bus 01]
[   32.890697] pci_bus 0005:00: resource 4 [mem 0x3ff200000000-0x3ff27ffeffff]
[   32.890726] pci_bus 0005:00: resource 5 [mem 0x3d4000000000-0x3d4fdfffffff 64bit pref]
[   32.890760] pci 0006:00:00.0: BAR 14: assigned [mem 0x3ff280000000-0x3ff2807fffff]
[   32.890792] pci 0006:01:00.0: BAR 0: assigned [mem 0x3ff280000000-0x3ff28000ffff 64bit]
[   32.987580] pci 0006:01:00.0: BAR 2: assigned [mem 0x3ff280010000-0x3ff280011fff 64bit]
[   32.987638] pci 0006:00     : [PE# fe] Secondary bus 0x0000000000000000 associated with PE#fe
[   32.988078] pci 0006:01     : [PE# fd] Secondary bus 0x0000000000000001 associated with PE#fd
[   32.988515] pci 0006:01     : [PE# fd] Setting up 32-bit TCE table at 0..80000000
[   32.988723] pci 0006:01     : [PE# fd] Setting up window#0 0..7fffffff pg=1000
[   32.988944] pci 0006:01     : [PE# fd] Enabling 64-bit DMA bypass
[   32.988972] pci 0006:00:00.0: PCI bridge to [bus 01]
[   32.989009] pci 0006:00:00.0:   bridge window [mem 0x3ff280000000-0x3ff2ffefffff]
[   32.989061] pci_bus 0006:00: resource 4 [mem 0x3ff280000000-0x3ff2fffeffff]
[   32.989091] pci_bus 0006:00: resource 5 [mem 0x3d5000000000-0x3d5fdfffffff 64bit pref]
[   32.989120] pci_bus 0006:01: resource 1 [mem 0x3ff280000000-0x3ff2ffefffff]
[   32.989205] pci 0001:08:00.0: Adding to iommu group 0
[   32.989250] pci 0001:09:00.0: Adding to iommu group 1
[   32.989280] pci 0001:09:00.1: Adding to iommu group 1
[   32.989330] pci 0003:03:00.0: Adding to iommu group 2
[   32.989373] pci 0003:04:00.0: Adding to iommu group 3
[   33.085954] pci 0003:05:00.0: Adding to iommu group 4
[   33.085985] pci 0003:05:00.1: Adding to iommu group 4
[   33.086014] pci 0003:05:00.2: Adding to iommu group 4
[   33.086044] pci 0003:05:00.3: Adding to iommu group 4
[   33.086097] pci 0006:01:00.0: Adding to iommu group 5
[   33.086338] pci 0001:00:00.0: enabling device (0141 -> 0143)
[   33.086389] pci 0001:01:00.0: enabling device (0141 -> 0143)
[   33.086444] pci 0001:02:08.0: enabling device (0141 -> 0143)
[   33.086497] pci 0001:02:09.0: enabling device (0141 -> 0143)
[   33.086550] pci 0003:00:00.0: enabling device (0141 -> 0143)
[   33.086600] pci 0003:01:00.0: enabling device (0141 -> 0143)
[   33.086655] pci 0003:02:01.0: enabling device (0141 -> 0143)
[   33.086709] pci 0003:02:08.0: enabling device (0141 -> 0143)
[   33.086762] pci 0003:02:09.0: enabling device (0141 -> 0143)
[   33.086817] pci 0006:00:00.0: enabling device (0141 -> 0143)
[   33.089098] EEH: PCI Enhanced I/O Error Handling Enabled
[   33.089572] PCI: Probing PCI hardware done
[   33.092576] opal-power: OPAL EPOW, DPO support detected.
[   33.092989] powernv-rng: Registering arch random hook.
[   33.099056] HugeTLB registered 16.0 MiB page size, pre-allocated 0 pages
[   33.099074] HugeTLB registered 16.0 GiB page size, pre-allocated 0 pages
[   33.259852] alg: No test for lzo-rle (lzo-rle-generic)
[   33.259930] alg: No test for lzo-rle (lzo-rle-scomp)
[   33.266443] pci 0001:09:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[   33.266476] pci 0001:09:00.0: vgaarb: bridge control possible
[   33.266492] pci 0001:09:00.0: vgaarb: setting as boot device (VGA legacy resources not available)
[   33.266507] vgaarb: loaded
[   33.266734] pps_core: LinuxPPS API ver. 1 registered
[   33.266749] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[   33.266765] PTP clock support registered
[   33.266782] EDAC MC: Ver: 3.0.0
[   33.267103] NetLabel: Initializing
[   33.267117] NetLabel:  domain hash size = 128
[   33.267131] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[   33.267160] NetLabel:  unlabeled traffic allowed by default
[   33.267904] clocksource: Switched to clocksource timebase
[   33.282480] VFS: Disk quotas dquot_6.6.0
[   33.282641] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 bytes)
[   33.282912] AppArmor: AppArmor Filesystem Enabled
[   33.283957] random: fast init done
[   33.284421] thermal_sys: Registered thermal governor 'fair_share'
[   33.284422] thermal_sys: Registered thermal governor 'bang_bang'
[   33.284438] thermal_sys: Registered thermal governor 'step_wise'
[   33.284452] thermal_sys: Registered thermal governor 'user_space'
[   33.285021] NET: Registered protocol family 2
[   33.285635] tcp_listen_portaddr_hash hash table entries: 65536 (order: 4, 1048576 bytes, vmalloc)
[   33.285788] TCP established hash table entries: 524288 (order: 6, 4194304 bytes, vmalloc)
[   33.286679] TCP bind hash table entries: 65536 (order: 4, 1048576 bytes, vmalloc)
[   33.286815] TCP: Hash tables configured (established 524288 bind 65536)
[   33.287040] UDP hash table entries: 65536 (order: 5, 2097152 bytes, vmalloc)
[   33.287312] UDP-Lite hash table entries: 65536 (order: 5, 2097152 bytes, vmalloc)
[   33.288174] NET: Registered protocol family 1
[   33.288201] NET: Registered protocol family 44
[   33.288259] pci 0001:09:00.1: D0 power state depends on 0001:09:00.0
[   33.288317] pci 0003:03:00.0: enabling device (0140 -> 0142)
[   33.288388] pci 0006:01:00.0: enabling device (0140 -> 0142)
[   33.288420] PCI: CLS 128 bytes, default 128
[   33.288530] Trying to unpack rootfs image as initramfs...
[   34.695853] Freeing initrd memory: 10112K
[   34.696617] random: crng init done
[   34.699183] Initialise system trusted keyrings
[   34.699256] workingset: timestamp_bits=38 max_order=21 bucket_order=0
[   34.700533] zbud: loaded
[   34.715395] Key type asymmetric registered
[   34.715421] Asymmetric key parser 'x509' registered
[   34.715453] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
[   34.715885] io scheduler mq-deadline registered
[   34.715912] io scheduler kyber registered
[   34.716056] io scheduler bfq registered
[   34.718097] pcieport 0001:02:01.0: enabling device (0141 -> 0143)
[   34.718257] pcieport 0001:02:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   34.718547] pcieport 0001:02:08.0: pciehp: Slot #8 AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   34.718806] pcieport 0001:02:09.0: pciehp: Slot #9 AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   34.719590] pcieport 0003:02:08.0: pciehp: Slot #8 AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   34.719898] pcieport 0003:02:09.0: pciehp: Slot #9 AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   34.720109] pcieport 0003:02:10.0: enabling device (0141 -> 0143)
[   34.720197] pcieport 0003:02:10.0: pciehp: Slot #16 AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   34.720407] pcieport 0003:02:11.0: enabling device (0141 -> 0143)
[   34.720495] pcieport 0003:02:11.0: pciehp: Slot #17 AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl- LLActRep+
[   34.721032] hvc0: raw protocol on /ibm,opal/consoles/serial@0 (boot console)
[   34.721051] hvc0: No interrupts property, using OPAL event
[   34.721257] hvc1: hvsi protocol on /ibm,opal/consoles/serial@1
[   34.721273] hvc1: No interrupts property, using OPAL event
[   34.721299] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[   34.721506] pseries_rng: Registering IBM pSeries RNG driver
[   34.721535] powernv_rng: Registered powernv hwrng.
[   34.722842] mousedev: PS/2 mouse device common for all mice
[   34.722887] powernv-cpufreq: cpufreq pstate min 0xffffffcf nominal 0xfffffff9 max 0x0
[   34.722902] powernv-cpufreq: Workload Optimized Frequency is disabled in the platform
[   34.726923] powernv_idle_driver registered
[   34.729071] ledtrig-cpu: registered to indicate activity on CPUs
[   34.729351] nx_compress_powernv: coprocessor found on chip 0, CT 3 CI 1
[   34.729374] nx_compress_powernv: coprocessor found on chip 1, CT 3 CI 2
[   34.729396] nx_compress_powernv: coprocessor found on chip 16, CT 3 CI 17
[   34.729421] nx_compress_powernv: coprocessor found on chip 17, CT 3 CI 18
[   34.729517] alg: No test for 842 (842-nx)
[   34.732445] hidraw: raw HID events driver (C) Jiri Kosina
[   34.732811] drop_monitor: Initializing network drop monitor service
[   34.733761] NET: Registered protocol family 10
[   34.738487] Segment Routing with IPv6
[   34.738516] NET: Registered protocol family 15
[   34.738601] drmem: No dynamic reconfiguration memory found
[   34.738711] registered taskstats version 1
[   34.738726] Loading compiled-in X.509 certificates
[   34.774182] Loaded X.509 cert 'Unsupported: 20a8b0cf2d570fb2c20316bf6f6d9681f4981f2c'
[   34.774376] zswap: loaded using pool lzo/zbud
[   34.774407] page_owner is disabled
[   34.777734] pstore: Unknown compression: deflate
[   34.781108] Key type encrypted registered
[   34.781128] AppArmor: AppArmor sha1 policy hashing enabled
[   34.781148] ima: No TPM chip found, activating TPM-bypass!
[   34.781164] ima: Allocated hash algorithm: sha256
[   34.781185] ima: No architecture policies found
[   34.781208] evm: Initialising EVM extended attributes:
[   34.781222] evm: security.selinux
[   34.781234] evm: security.apparmor
[   34.781247] evm: security.ima
[   34.781259] evm: security.capability
[   34.781272] evm: HMAC attrs: 0x1
[   34.782975] Freeing unused kernel memory: 4736K
[   34.782990] This architecture does not have kernel memory protection.
[   34.783005] Run /init as init process
[   34.787290] pstore: no decompression method initialized!
[   34.790838] systemd[1]: systemd 228 running in system mode. (+PAM -AUDIT +SELINUX -IMA +APPARMOR -SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT -GNUTLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN)
[   34.794374] systemd[1]: Detected architecture ppc64-le.
[   34.794390] systemd[1]: Running in initial RAM disk.
[   34.794511] systemd[1]: Set hostname to <linux>.
[   34.842701] systemd[1]: Created slice System Slice.
[   34.842868] systemd[1]: Reached target Timers.
[   34.842963] systemd[1]: Listening on Journal Socket (/dev/log).
[   34.843029] systemd[1]: Reached target Swap.
[   34.843113] systemd[1]: Listening on udev Control Socket.
[   34.843203] systemd[1]: Listening on Journal Socket.
[   34.856242] SCSI subsystem initialized
[   34.857541] alua: device handler registered
[   34.858356] emc: device handler registered
[   34.859052] rdac: device handler registered
[   34.864350] device-mapper: uevent: version 1.0.3
[   34.864530] device-mapper: ioctl: 4.40.0-ioctl (2019-01-18) initialised: dm-devel@redhat.com
[   34.868764] softdog: initialized. soft_noboot=0 soft_margin=60 sec soft_panic=0 (nowayout=0)
[   35.118824] libata version 3.00 loaded.
[   35.123422] ipr: externally supported module, setting X kernel taint flag.
[   35.123476] ipr: IBM Power RAID SCSI Device Driver version: 2.6.4 (March 14, 2017)
[   35.123554] ipr 0001:08:00.0: Found IOA with IRQ: 0
[   35.123753] ipr 0001:08:00.0: enabling device (0140 -> 0142)
[   35.124100] synth uevent: /devices/vio: failed to send uevent
[   35.124159] vio vio: uevent: failed to send synthetic uevent
[   35.124342] ipr 0001:08:00.0: Received IRQ : 509
[   35.124371] ipr 0001:08:00.0: Request for 16 MSI-Xs succeeded.
[   35.125272] ipr 0001:08:00.0: Starting IOA initialization sequence.
[   35.125298] scsi host0: IBM 0 Storage Adapter
[   35.125866] ipr 0001:08:00.0: Adapter firmware version: 1151001C
[   35.125993] ipr 0003:04:00.0: Found IOA with IRQ: 0
[   35.126216] ipr 0003:04:00.0: enabling device (0140 -> 0142)
[   35.126636] ipr 0003:04:00.0: Received IRQ : 357
[   35.126667] ipr 0003:04:00.0: Request for 16 MSI-Xs succeeded.
[   35.126749] usbcore: registered new interface driver usbfs
[   35.126782] usbcore: registered new interface driver hub
[   35.127295] ipr 0003:04:00.0: Starting IOA initialization sequence.
[   35.127314] scsi host1: IBM 0 Storage Adapter
[   35.127529] usbcore: registered new device driver usb
[   35.127794] ipr 0003:04:00.0: Adapter firmware version: 1151001C
[   35.129048] ipr 0003:04:00.0: IOA initialized.
[   35.139148] xhci_hcd 0003:03:00.0: xHCI Host Controller
[   35.139172] xhci_hcd 0003:03:00.0: new USB bus registered, assigned bus number 1
[   35.139307] xhci_hcd 0003:03:00.0: hcc params 0x0270f06d hci version 0x96 quirks 0x0000000004000000
[   35.139726] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.03
[   35.139742] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   35.139757] usb usb1: Product: xHCI Host Controller
[   35.139771] usb usb1: Manufacturer: Linux 5.3.8-11.gea9b07d-default xhci-hcd
[   35.139785] usb usb1: SerialNumber: 0003:03:00.0
[   35.139949] hub 1-0:1.0: USB hub found
[   35.139973] hub 1-0:1.0: 4 ports detected
[   35.140136] xhci_hcd 0003:03:00.0: xHCI Host Controller
[   35.140152] xhci_hcd 0003:03:00.0: new USB bus registered, assigned bus number 2
[   35.140169] xhci_hcd 0003:03:00.0: Host supports USB 3.0 SuperSpeed
[   35.140208] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[   35.140247] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.03
[   35.140262] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   35.140277] usb usb2: Product: xHCI Host Controller
[   35.140291] usb usb2: Manufacturer: Linux 5.3.8-11.gea9b07d-default xhci-hcd
[   35.140305] usb usb2: SerialNumber: 0003:03:00.0
[   35.140404] hub 2-0:1.0: USB hub found
[   35.140427] hub 2-0:1.0: 4 ports detected
[   35.140727] xhci_hcd 0006:01:00.0: xHCI Host Controller
[   35.140755] xhci_hcd 0006:01:00.0: new USB bus registered, assigned bus number 3
[   35.140895] xhci_hcd 0006:01:00.0: hcc params 0x0270f06d hci version 0x96 quirks 0x0000000004000000
[   35.141275] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.03
[   35.141291] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   35.141306] usb usb3: Product: xHCI Host Controller
[   35.141320] usb usb3: Manufacturer: Linux 5.3.8-11.gea9b07d-default xhci-hcd
[   35.141335] usb usb3: SerialNumber: 0006:01:00.0
[   35.141482] ipr 0001:08:00.0: IOA initialized.
[   35.141516] hub 3-0:1.0: USB hub found
[   35.141544] hub 3-0:1.0: 4 ports detected
[   35.141703] xhci_hcd 0006:01:00.0: xHCI Host Controller
[   35.141720] xhci_hcd 0006:01:00.0: new USB bus registered, assigned bus number 4
[   35.141736] xhci_hcd 0006:01:00.0: Host supports USB 3.0 SuperSpeed
[   35.141777] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
[   35.141816] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.03
[   35.141831] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   35.141846] usb usb4: Product: xHCI Host Controller
[   35.141860] usb usb4: Manufacturer: Linux 5.3.8-11.gea9b07d-default xhci-hcd
[   35.141875] usb usb4: SerialNumber: 0006:01:00.0
[   35.141986] hub 4-0:1.0: USB hub found
[   35.142008] hub 4-0:1.0: 4 ports detected
[   35.154206] scsi 0:3:0:0: No Device         IBM      57D8001SISIOA    0150 PQ: 0 ANSI: 0
[   35.154232] scsi 0:3:0:0: Resource path: 0/FE
[   35.161380] scsi 0:0:0:0: Direct-Access     IBM      ST9300653SS      7411 PQ: 0 ANSI: 6
[   35.161402] scsi 0:0:0:0: Resource path: 0/00-0C-00
[   35.167929] scsi 0:0:1:0: Direct-Access     IBM      ST9300653SS      7411 PQ: 0 ANSI: 6
[   35.167951] scsi 0:0:1:0: Resource path: 0/00-0C-01
[   35.178405] scsi 1:3:0:0: No Device         IBM      57D8001SISIOA    0150 PQ: 0 ANSI: 0
[   35.178426] scsi 1:3:0:0: Resource path: 1/FE
[   35.179740] scsi 1:0:1:0: Enclosure         IBM      PSBPD14M1 6GSAS  1407 PQ: 0 ANSI: 4
[   35.179761] scsi 1:0:1:0: Resource path: 1/00-08-18
[   35.180728] scsi 0:0:2:0: Direct-Access     IBM      ST9300653SS      7411 PQ: 0 ANSI: 6
[   35.180749] scsi 0:0:2:0: Resource path: 0/00-0C-02
[   35.181150] scsi 1:0:2:0: Enclosure         IBM      PSBPD14M1 6GSAS  1407 PQ: 0 ANSI: 4
[   35.181172] scsi 1:0:2:0: Resource path: 1/00-0C-18
[   35.181839] scsi 1:1:0:0: No Device         IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.181858] scsi 1:1:0:0: Resource path: 1/FD-00
[   35.182187] scsi 1:1:1:0: No Device         IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.182208] scsi 1:1:1:0: Resource path: 1/FD-01
[   35.182530] scsi 1:1:2:0: No Device         IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.182548] scsi 1:1:2:0: Resource path: 1/FD-02
[   35.182853] scsi 1:1:3:0: No Device         IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.182871] scsi 1:1:3:0: Resource path: 1/FD-03
[   35.183182] scsi 1:1:4:0: No Device         IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.183200] scsi 1:1:4:0: Resource path: 1/FD-04
[   35.183506] scsi 1:1:5:0: No Device         IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.183524] scsi 1:1:5:0: Resource path: 1/FD-05
[   35.183941] scsi 1:2:0:0: Direct-Access     IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.183961] scsi 1:2:0:0: Resource path: 1/FC-03-00
[   35.184452] scsi 1:2:1:0: Direct-Access     IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.184471] scsi 1:2:1:0: Resource path: 1/FC-02-00
[   35.184960] scsi 1:2:2:0: Direct-Access     IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.184979] scsi 1:2:2:0: Resource path: 1/FC-01-00
[   35.185479] scsi 1:2:3:0: Direct-Access     IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.185497] scsi 1:2:3:0: Resource path: 1/FC-05-00
[   35.185984] scsi 1:2:4:0: Direct-Access     IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.186002] scsi 1:2:4:0: Resource path: 1/FC-00-00
[   35.186509] scsi 1:2:5:0: Direct-Access     IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.186528] scsi 1:2:5:0: Resource path: 1/FC-04-00
[   35.187428] scsi 1:0:3:0: Direct-Access     IBM      ST9300653SS      7411 PQ: 0 ANSI: 6
[   35.187447] scsi 1:0:3:0: Resource path: 1/00-0C-00
[   35.188245] scsi 1:0:4:0: Direct-Access     IBM      ST9300653SS      7411 PQ: 0 ANSI: 6
[   35.188267] scsi 1:0:4:0: Resource path: 1/00-0C-01
[   35.189051] scsi 1:0:5:0: Direct-Access     IBM      ST9300653SS      7411 PQ: 0 ANSI: 6
[   35.189070] scsi 1:0:5:0: Resource path: 1/00-0C-02
[   35.191529] scsi 0:0:3:0: Direct-Access     IBM      ST9300653SS      7411 PQ: 0 ANSI: 6
[   35.191548] scsi 0:0:3:0: Resource path: 0/00-0C-03
[   35.192047] scsi 1:0:6:0: Direct-Access     IBM      ST9300653SS      7411 PQ: 0 ANSI: 6
[   35.192065] scsi 1:0:6:0: Resource path: 1/00-0C-03
[   35.197234] scsi 0:0:4:0: Direct-Access     IBM      ST9300653SS      7411 PQ: 0 ANSI: 6
[   35.197255] scsi 0:0:4:0: Resource path: 0/00-0C-04
[   35.197523] scsi 1:0:7:0: Direct-Access     IBM      ST9300653SS      7411 PQ: 0 ANSI: 6
[   35.197539] scsi 1:0:7:0: Resource path: 1/00-0C-04
[   35.207739] scsi 1:0:8:0: Direct-Access     IBM      ST9300653SS      7411 PQ: 0 ANSI: 6
[   35.207774] scsi 1:0:8:0: Resource path: 1/00-0C-05
[   35.207890] scsi 0:0:5:0: Direct-Access     IBM      ST9300653SS      7411 PQ: 0 ANSI: 6
[   35.207914] scsi 0:0:5:0: Resource path: 0/00-0C-05
[   35.209161] scsi 0:1:0:0: No Device         IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.209178] scsi 0:1:0:0: Resource path: 0/FD-00
[   35.210280] scsi 0:1:1:0: No Device         IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.210297] scsi 0:1:1:0: Resource path: 0/FD-01
[   35.211400] scsi 0:1:2:0: No Device         IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.211416] scsi 0:1:2:0: Resource path: 0/FD-02
[   35.212519] scsi 0:1:3:0: No Device         IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.212535] scsi 0:1:3:0: Resource path: 0/FD-03
[   35.213639] scsi 0:1:4:0: No Device         IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.213655] scsi 0:1:4:0: Resource path: 0/FD-04
[   35.214758] scsi 0:1:5:0: No Device         IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.214774] scsi 0:1:5:0: Resource path: 0/FD-05
[   35.215731] scsi 0:2:0:0: Direct-Access     IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.215747] scsi 0:2:0:0: Resource path: 0/FC-03-00
[   35.221591] scsi 0:2:1:0: Direct-Access     IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.221607] scsi 0:2:1:0: Resource path: 0/FC-02-00
[   35.223671] scsi 0:2:2:0: Direct-Access     IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.223687] scsi 0:2:2:0: Resource path: 0/FC-01-00
[   35.225752] scsi 0:2:3:0: Direct-Access     IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.225768] scsi 0:2:3:0: Resource path: 0/FC-00-00
[   35.227836] scsi 0:2:4:0: Direct-Access     IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.227855] scsi 0:2:4:0: Resource path: 0/FC-05-00
[   35.228585] scsi 0:2:5:0: Direct-Access     IBM      IPR-0   5EC28A00      PQ: 0 ANSI: 3
[   35.228602] scsi 0:2:5:0: Resource path: 0/FC-04-00
[   35.229130] scsi 0:0:6:0: Enclosure         IBM      VSBPD14M1 6GSAS    03 PQ: 0 ANSI: 2
[   35.229146] scsi 0:0:6:0: Resource path: 0/00-14
[   35.345097] ata1.00: ATAPI: IBM.    RMBO0140592, U51J, max UDMA/133
[   35.352036] ata1.00: configured for UDMA/133
[   35.353406] scsi 0:0:7:0: CD-ROM            IBM.     RMBO0140592      U51J PQ: 0 ANSI: 2
[   35.353422] scsi 0:0:7:0: Resource path: 0/00-0F
[   35.358508] scsi 0:0:9:0: Enclosure         IBM      PSBPD14M1 6GSAS  1407 PQ: 0 ANSI: 4
[   35.358524] scsi 0:0:9:0: Resource path: 0/00-08-18
[   35.364803] scsi 0:0:10:0: Enclosure         IBM      PSBPD14M1 6GSAS  1407 PQ: 0 ANSI: 4
[   35.364820] scsi 0:0:10:0: Resource path: 0/00-0C-18
[   35.367981] scsi 0:3:0:0: Attached scsi generic sg0 type 31
[   35.368117] scsi 0:0:0:0: Attached scsi generic sg1 type 12
[   35.368236] scsi 0:0:1:0: Attached scsi generic sg2 type 12
[   35.368355] scsi 0:0:2:0: Attached scsi generic sg3 type 12
[   35.368495] scsi 0:0:3:0: Attached scsi generic sg4 type 12
[   35.368622] scsi 0:0:4:0: Attached scsi generic sg5 type 12
[   35.368779] scsi 0:0:5:0: Attached scsi generic sg6 type 12
[   35.368947] scsi 0:1:0:0: Attached scsi generic sg7 type 31
[   35.369132] scsi 0:1:1:0: Attached scsi generic sg8 type 31
[   35.369387] scsi 0:1:2:0: Attached scsi generic sg9 type 31
[   35.369702] scsi 0:1:3:0: Attached scsi generic sg10 type 31
[   35.369939] scsi 0:1:4:0: Attached scsi generic sg11 type 31
[   35.370351] scsi 0:1:5:0: Attached scsi generic sg12 type 31
[   35.370500] scsi 0:2:0:0: alua: supports implicit TPGS
[   35.370524] scsi 0:2:0:0: alua: device t10.IBM     IPR-0   5EC28A0000000080 port group c28f rel port c28f
[   35.370812] scsi 0:2:0:0: Attached scsi generic sg13 type 0
[   35.370916] scsi 0:2:1:0: alua: supports implicit TPGS
[   35.370934] scsi 0:2:1:0: alua: device t10.IBM     IPR-0   5EC28A0000000060 port group c28f rel port c28f
[   35.371234] scsi 0:2:1:0: Attached scsi generic sg14 type 0
[   35.371348] scsi 0:2:2:0: alua: supports implicit TPGS
[   35.371368] scsi 0:2:2:0: alua: device t10.IBM     IPR-0   5EC28A0000000040 port group c28f rel port c28f
[   35.371607] scsi 0:2:2:0: Attached scsi generic sg15 type 0
[   35.371713] scsi 0:2:3:0: alua: supports implicit TPGS
[   35.371732] scsi 0:2:3:0: alua: device t10.IBM     IPR-0   5EC28A0000000020 port group c28f rel port c28f
[   35.372013] scsi 0:2:3:0: Attached scsi generic sg16 type 0
[   35.372206] scsi 0:2:4:0: alua: supports implicit TPGS
[   35.372225] scsi 0:2:4:0: alua: device t10.IBM     IPR-0   5EC28A00000000C0 port group c28f rel port c28f
[   35.372684] scsi 0:2:4:0: Attached scsi generic sg17 type 0
[   35.372879] scsi 0:2:5:0: alua: supports implicit TPGS
[   35.372896] scsi 0:2:5:0: alua: device t10.IBM     IPR-0   5EC28A00000000A0 port group c28f rel port c28f
[   35.373294] scsi 0:2:5:0: Attached scsi generic sg18 type 0
[   35.373889] scsi 0:0:6:0: Attached scsi generic sg19 type 13
[   35.374674] scsi 0:0:7:0: Attached scsi generic sg20 type 5
[   35.375329] scsi 0:0:9:0: Attached scsi generic sg21 type 13
[   35.375940] scsi 0:0:10:0: Attached scsi generic sg22 type 13
[   35.376666] scsi 1:3:0:0: Attached scsi generic sg23 type 31
[   35.377333] scsi 1:0:1:0: Attached scsi generic sg24 type 13
[   35.377906] scsi 1:0:2:0: Attached scsi generic sg25 type 13
[   35.378362] scsi 1:1:0:0: Attached scsi generic sg26 type 31
[   35.378755] scsi 1:1:1:0: Attached scsi generic sg27 type 31
[   35.379157] scsi 1:1:2:0: Attached scsi generic sg28 type 31
[   35.379601] scsi 1:1:3:0: Attached scsi generic sg29 type 31
[   35.380428] scsi 1:1:4:0: Attached scsi generic sg30 type 31
[   35.381010] scsi 1:1:5:0: Attached scsi generic sg31 type 31
[   35.381014] sd 0:2:2:0: [sdd] 554287104 512-byte logical blocks: (284 GB/264 GiB)
[   35.381027] sd 0:2:0:0: [sda] 554287104 512-byte logical blocks: (284 GB/264 GiB)
[   35.381072] sd 0:2:1:0: [sdb] 554287104 512-byte logical blocks: (284 GB/264 GiB)
[   35.381074] sd 0:2:3:0: [sdc] 554287104 512-byte logical blocks: (284 GB/264 GiB)
[   35.381097] sd 0:2:4:0: [sde] 554287104 512-byte logical blocks: (284 GB/264 GiB)
[   35.381115] sd 0:2:5:0: [sdf] 554287104 512-byte logical blocks: (284 GB/264 GiB)
[   35.381138] sd 0:2:2:0: [sdd] Write Protect is off
[   35.381141] sd 0:2:3:0: [sdc] Write Protect is off
[   35.381144] sd 0:2:3:0: [sdc] Mode Sense: 0b 00 00 08
[   35.381151] sd 0:2:0:0: [sda] Write Protect is off
[   35.381156] sd 0:2:0:0: [sda] Mode Sense: 0b 00 00 08
[   35.381168] sd 0:2:1:0: [sdb] Write Protect is off
[   35.381179] scsi 1:2:0:0: alua: supports implicit TPGS
[   35.381185] sd 0:2:2:0: [sdd] Mode Sense: 0b 00 00 08
[   35.381189] scsi 1:2:0:0: alua: device t10.IBM     IPR-0   5EC28A0000000080 port group c28a rel port c28a
[   35.381193] sd 0:2:4:0: [sde] Write Protect is off
[   35.381196] sd 0:2:4:0: [sde] Mode Sense: 0b 00 00 08
[   35.381205] sd 0:2:1:0: [sdb] Mode Sense: 0b 00 00 08
[   35.381220] sd 0:2:5:0: [sdf] Write Protect is off
[   35.381320] sd 0:2:5:0: [sdf] Mode Sense: 0b 00 00 08
[   35.381671] sd 1:2:0:0: Attached scsi generic sg32 type 0
[   35.381922] scsi 1:2:1:0: alua: supports implicit TPGS
[   35.381940] scsi 1:2:1:0: alua: device t10.IBM     IPR-0   5EC28A0000000060 port group c28a rel port c28a
[   35.382067] sd 1:2:0:0: [sdg] 554287104 512-byte logical blocks: (284 GB/264 GiB)
[   35.382140] sd 1:2:0:0: [sdg] Write Protect is off
[   35.382157] sd 1:2:0:0: [sdg] Mode Sense: 0b 00 00 08
[   35.382517] sd 1:2:1:0: Attached scsi generic sg33 type 0
[   35.382793] scsi 1:2:2:0: alua: supports implicit TPGS
[   35.382815] scsi 1:2:2:0: alua: device t10.IBM     IPR-0   5EC28A0000000040 port group c28a rel port c28a
[   35.382961] sd 1:2:1:0: [sdh] 554287104 512-byte logical blocks: (284 GB/264 GiB)
[   35.383036] sd 1:2:1:0: [sdh] Write Protect is off
[   35.383054] sd 1:2:1:0: [sdh] Mode Sense: 0b 00 00 08
[   35.383482] sd 1:2:2:0: Attached scsi generic sg34 type 0
[   35.383729] scsi 1:2:3:0: alua: supports implicit TPGS
[   35.383751] scsi 1:2:3:0: alua: device t10.IBM     IPR-0   5EC28A00000000C0 port group c28a rel port c28a
[   35.383812] sd 1:2:2:0: [sdi] 554287104 512-byte logical blocks: (284 GB/264 GiB)
[   35.383885] sd 1:2:2:0: [sdi] Write Protect is off
[   35.383903] sd 1:2:2:0: [sdi] Mode Sense: 0b 00 00 08
[   35.384740] sd 1:2:3:0: Attached scsi generic sg35 type 0
[   35.385082] sd 1:2:3:0: [sdj] 554287104 512-byte logical blocks: (284 GB/264 GiB)
[   35.385137] scsi 1:2:4:0: alua: supports implicit TPGS
[   35.385152] sd 1:2:3:0: [sdj] Write Protect is off
[   35.385154] scsi 1:2:4:0: alua: device t10.IBM     IPR-0   5EC28A0000000020 port group c28a rel port c28a
[   35.385168] sd 1:2:3:0: [sdj] Mode Sense: 0b 00 00 08
[   35.386305] sd 1:2:4:0: Attached scsi generic sg36 type 0
[   35.386666] sd 1:2:4:0: [sdk] 554287104 512-byte logical blocks: (284 GB/264 GiB)
[   35.386739] sd 1:2:4:0: [sdk] Write Protect is off
[   35.386759] sd 1:2:4:0: [sdk] Mode Sense: 0b 00 00 08
[   35.386774] scsi 1:2:5:0: alua: supports implicit TPGS
[   35.386794] scsi 1:2:5:0: alua: device t10.IBM     IPR-0   5EC28A00000000A0 port group c28a rel port c28a
[   35.388067] sd 1:2:5:0: Attached scsi generic sg37 type 0
[   35.388454] sd 1:2:5:0: [sdl] 554287104 512-byte logical blocks: (284 GB/264 GiB)
[   35.388523] sd 1:2:5:0: [sdl] Write Protect is off
[   35.388541] sd 1:2:5:0: [sdl] Mode Sense: 0b 00 00 08
[   35.389470] scsi 1:0:3:0: Attached scsi generic sg38 type 12
[   35.390952] scsi 1:0:4:0: Attached scsi generic sg39 type 12
[   35.392471] scsi 1:0:5:0: Attached scsi generic sg40 type 12
[   35.393803] scsi 1:0:6:0: Attached scsi generic sg41 type 12
[   35.395197] scsi 1:0:7:0: Attached scsi generic sg42 type 12
[   35.396476] scsi 1:0:8:0: Attached scsi generic sg43 type 12
[   35.398115] sd 1:2:4:0: alua: transition timeout set to 60 seconds
[   35.398137] sd 1:2:2:0: alua: transition timeout set to 60 seconds
[   35.398149] sd 1:2:2:0: alua: port group c28a state N non-preferred supports TOlUSNA
[   35.398339] sd 1:2:0:0: alua: transition timeout set to 60 seconds
[   35.398349] sd 1:2:0:0: alua: port group c28a state N non-preferred supports TOlUSNA
[   35.404337] sd 1:2:4:0: alua: port group c28a state N non-preferred supports TOlUSNA
[   35.404448] sd 1:2:3:0: alua: transition timeout set to 60 seconds
[   35.404465] sd 1:2:3:0: alua: port group c28a state N non-preferred supports TOlUSNA
[   35.408155] sd 0:2:2:0: alua: transition timeout set to 60 seconds
[   35.408208] sd 0:2:2:0: alua: port group c28f state A preferred supports TOlUSNA
[   35.408235] sd 0:2:4:0: alua: transition timeout set to 60 seconds
[   35.408257] sd 0:2:4:0: alua: port group c28f state A preferred supports TOlUSNA
[   35.408285] sd 0:2:5:0: alua: transition timeout set to 60 seconds
[   35.408303] sd 0:2:5:0: alua: port group c28f state A preferred supports TOlUSNA
[   35.408331] sd 0:2:3:0: alua: transition timeout set to 60 seconds
[   35.408349] sd 0:2:3:0: alua: port group c28f state A preferred supports TOlUSNA
[   35.418008] sd 1:2:1:0: alua: transition timeout set to 60 seconds
[   35.418094] sd 1:2:5:0: alua: transition timeout set to 60 seconds
[   35.418099] sd 1:2:5:0: alua: port group c28a state N non-preferred supports TOlUSNA
[   35.497838] sd 0:2:1:0: [sdb] Cache data unavailable
[   35.497840] sd 0:2:1:0: [sdb] Assuming drive cache: write through
[   35.497842] sd 0:2:5:0: [sdf] Cache data unavailable
[   35.497845] sd 0:2:5:0: [sdf] Assuming drive cache: write through
[   35.497848] sd 0:2:3:0: [sdc] Cache data unavailable
[   35.497850] sd 0:2:3:0: [sdc] Assuming drive cache: write through
[   35.497859] sd 0:2:2:0: [sdd] Cache data unavailable
[   35.497861] sd 0:2:2:0: [sdd] Assuming drive cache: write through
[   35.503546] sd 0:2:1:0: alua: transition timeout set to 60 seconds
[   35.503551] sd 1:2:1:0: alua: port group c28a state N non-preferred supports TOlUSNA
[   35.503567] sd 0:2:1:0: alua: port group c28f state A preferred supports TOlUSNA
[   35.503724] sd 0:2:0:0: alua: transition timeout set to 60 seconds
[   35.503741] sd 0:2:0:0: alua: port group c28f state A preferred supports TOlUSNA
[   35.507817] sd 0:2:4:0: [sde] Cache data unavailable
[   35.507838] sd 0:2:4:0: [sde] Assuming drive cache: write through
[   35.528118] sd 1:2:3:0: [sdj] Cache data unavailable
[   35.567827] sd 0:2:0:0: [sda] Cache data unavailable
[   35.567829] sd 0:2:0:0: [sda] Assuming drive cache: write through
[   35.578023] sd 1:2:2:0: [sdi] Cache data unavailable
[   35.578026] sd 1:2:2:0: [sdi] Assuming drive cache: write through
[   35.578049] sd 1:2:4:0: [sdk] Cache data unavailable
[   35.578051] sd 1:2:4:0: [sdk] Assuming drive cache: write through
[   35.578103] sd 1:2:0:0: [sdg] Cache data unavailable
[   35.578105] sd 1:2:0:0: [sdg] Assuming drive cache: write through
[   35.601811] sd 1:2:3:0: [sdj] Assuming drive cache: write through
[   35.607913] sd 1:2:5:0: [sdl] Cache data unavailable
[   35.607928] sd 1:2:5:0: [sdl] Assuming drive cache: write through
[   35.697941] sd 1:2:1:0: [sdh] Cache data unavailable
[   35.697973] sd 1:2:1:0: [sdh] Assuming drive cache: write through
[   35.874462]  sdf: sdf1 sdf2 sdf3
[   35.878974]  sdc: sdc1 sdc2 < sdc5 sdc6 sdc7 >
[   35.888309]  sda:
[   35.888658]  sde: sde1 sde2 sde3
[   35.898595]  sdg:
[   35.899226]  sdl: sdl1 sdl2 sdl3
[   35.908275] sd 0:2:1:0: [sdb] Attached SCSI disk
[   35.909019]  sdj: sdj1 sdj2 sdj3
[   35.919604]  sdk: sdk1 sdk2 < sdk5 sdk6 sdk7 >
[   35.920098] device-mapper: multipath service-time: version 0.3.0 loaded
[   35.928210] sd 0:2:3:0: [sdc] Attached SCSI disk
[   35.939783] sd 0:2:2:0: [sdd] Attached SCSI disk
[   35.948214] sd 0:2:4:0: [sde] Attached SCSI disk
[   35.951147] sd 1:2:0:0: [sdg] Attached SCSI disk
[   35.951604] sd 1:2:3:0: [sdj] Attached SCSI disk
[   35.961455] sd 1:2:5:0: [sdl] Attached SCSI disk
[   35.962373] sd 1:2:2:0: [sdi] Attached SCSI disk
[   35.977909] sd 0:2:5:0: [sdf] Attached SCSI disk
[   35.984934] sd 1:2:4:0: [sdk] Attached SCSI disk
[   36.050514] sd 1:2:1:0: [sdh] Attached SCSI disk
[   36.117867] sd 0:2:0:0: [sda] Attached SCSI disk
[   36.120555] sr 0:0:7:0: [sr0] scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 cdda tray
[   36.120576] cdrom: Uniform CD-ROM driver Revision: 3.20
[   36.227864] sd 0:2:1:0: alua: port group c28f state A preferred supports TOlUSNA
[   36.227937] sd 0:2:1:0: alua: port group c28f state A preferred supports TOlUSNA
[   36.239269] sr 0:0:7:0: Attached scsi CD-ROM sr0
[   36.241828] sr0: systemd-udevd: sr_block_open: 134217821 READ LSEEK PREAD PWRITE NDELAY NOWAIT -> 0
[   36.245991] sr0: scsi_id: sr_block_open: 134217821 READ LSEEK PREAD PWRITE NDELAY NOWAIT -> 0
[   36.248576] sr0: scsi_id: sr_block_open: 134217821 READ LSEEK PREAD PWRITE NDELAY NOWAIT -> 0
[   36.253748] sr0: systemd-udevd: sr_block_open: 134217821 READ LSEEK PREAD PWRITE NDELAY NOWAIT -> 0
[   36.257606] sr0: scsi_id: sr_block_open: 134217821 READ LSEEK PREAD PWRITE NDELAY NOWAIT -> 0
[   36.260172] sr0: scsi_id: sr_block_open: 134217821 READ LSEEK PREAD PWRITE NDELAY NOWAIT -> 0
[   37.537836] sd 0:2:3:0: alua: port group c28f state A preferred supports TOlUSNA
[   37.537933] sd 0:2:3:0: alua: port group c28f state A preferred supports TOlUSNA
[   37.757778] raid6: vpermxor8 gen() 25013 MB/s
[   37.927774] raid6: vpermxor4 gen() 22939 MB/s
[   38.097773] raid6: vpermxor2 gen() 17219 MB/s
[   38.267769] raid6: vpermxor1 gen()  9258 MB/s
[   38.437769] raid6: altivecx8 gen()  7034 MB/s
[   38.607774] raid6: altivecx4 gen() 22952 MB/s
[   38.777765] raid6: altivecx2 gen() 17241 MB/s
[   38.947777] raid6: altivecx1 gen()  9325 MB/s
[   39.117772] raid6: int64x8  gen()  5279 MB/s
[   39.287786] raid6: int64x8  xor()  2189 MB/s
[   39.457765] raid6: int64x4  gen() 10957 MB/s
[   39.627776] raid6: int64x4  xor()  3677 MB/s
[   39.797775] raid6: int64x2  gen()  7956 MB/s
[   39.967773] raid6: int64x2  xor()  2552 MB/s
[   40.137782] raid6: int64x1  gen()  4676 MB/s
[   40.307778] raid6: int64x1  xor()  1404 MB/s
[   40.307793] raid6: using algorithm vpermxor8 gen() 25013 MB/s
[   40.307806] raid6: using intx1 recovery algorithm
[   40.308362] xor: measuring software checksum speed
[   40.407772]    8regs     : 17139.200 MB/sec
[   40.507775]    8regs_prefetch: 15225.600 MB/sec
[   40.607768]    32regs    : 17875.200 MB/sec
[   40.707771]    32regs_prefetch: 15910.400 MB/sec
[   40.807773]    altivec   : 24800.000 MB/sec
[   40.807788] xor: using function: altivec (24800.000 MB/sec)
[   40.847414] Btrfs loaded, crc32c=crc32c-vpmsum, assert=on
[   40.848044] BTRFS: device fsid 803b3392-d9e6-47d8-ac57-313cf2d39e0c devid 1 transid 1499343 /dev/dm-6
[   40.881939] BTRFS info (device dm-6): disk space caching is enabled
[   40.881985] BTRFS info (device dm-6): has skinny extents
[   40.947832] sd 0:2:4:0: alua: port group c28f state A preferred supports TOlUSNA
[   40.947893] sd 0:2:4:0: alua: port group c28f state A preferred supports TOlUSNA
[   41.237878] sd 1:2:0:0: alua: port group c28a state N non-preferred supports TOlUSNA
[   41.237943] sd 1:2:0:0: alua: port group c28a state N non-preferred supports TOlUSNA
[   41.448868] systemd-journald[1182]: Received SIGTERM from PID 1 (systemd).
[   41.504518] printk: systemd: 23 output lines suppressed due to ratelimiting
[   41.997856] systemd-sysv-generator[1763]: Overwriting existing symlink /run/systemd/generator.late/sapinit.service with real service.
[   42.303659] BTRFS info (device dm-6): disk space caching is enabled
[   42.477753] synth uevent: /devices/vio: failed to send uevent
[   42.477826] vio vio: uevent: failed to send synthetic uevent
[   42.606995] ibmpowernv: externally supported module, setting X kernel taint flag.
[   42.608864] i2c_opal: externally supported module, setting X kernel taint flag.
[   42.611147] rtc_opal: externally supported module, setting X kernel taint flag.
[   42.612389] leds_powernv: externally supported module, setting X kernel taint flag.
[   42.621099] IPMI message handler: version 39.2
[   42.627950] ipmi device interface
[   42.630690] ipmi_powernv: externally supported module, setting X kernel taint flag.
[   42.630853] ipmi-powernv ibm,opal:ipmi: Unable to map irq from device tree
[   42.655031] rtc-opal opal-rtc: registered as rtc0
[   42.664779] sr0: systemd-udevd: sr_block_open: 134217821 READ LSEEK PREAD PWRITE NDELAY NOWAIT -> 0
[   42.665992] Linux agpgart interface v0.103
[   42.677229] tg3.c:v3.137 (May 11, 2014)
[   42.677262] tg3 0003:05:00.0: enabling device (0140 -> 0142)
[   42.729823] tg3 0003:05:00.0 eth0: Tigon3 [partno(00E2872) rev 5719001] (PCI Express) MAC address 6c:ae:8b:6a:7c:b0
[   42.729845] tg3 0003:05:00.0 eth0: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[   42.729861] tg3 0003:05:00.0 eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[   42.729876] tg3 0003:05:00.0 eth0: dma_rwctrl[00000000] dma_mask[64-bit]
[   42.730381] tg3 0003:05:00.1: enabling device (0140 -> 0142)
[   42.733610] sr0: cdrom_id: sr_block_open: 134217949 READ LSEEK PREAD PWRITE NDELAY EXCL NOWAIT -> 0
[   42.741411] ipmi-powernv ibm,opal:ipmi: IPMI message handler: Found new BMC (man_id: 0x00a741, prod_id: 0x0132, dev_id: 0x20)
[   42.750885] sr0: scsi_id: sr_block_open: 134217821 READ LSEEK PREAD PWRITE NDELAY NOWAIT -> 0
[   42.753448] sr0: scsi_id: sr_block_open: 134217821 READ LSEEK PREAD PWRITE NDELAY NOWAIT -> 0
[   42.777020] tg3 0003:05:00.1 eth1: Tigon3 [partno(00E2872) rev 5719001] (PCI Express) MAC address 6c:ae:8b:6a:7c:b1
[   42.777053] tg3 0003:05:00.1 eth1: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[   42.777069] tg3 0003:05:00.1 eth1: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[   42.777084] tg3 0003:05:00.1 eth1: dma_rwctrl[00000000] dma_mask[64-bit]
[   42.777272] tg3 0003:05:00.2: enabling device (0140 -> 0142)
[   42.828397] tg3 0003:05:00.2 eth2: Tigon3 [partno(00E2872) rev 5719001] (PCI Express) MAC address 6c:ae:8b:6a:7c:b2
[   42.828434] tg3 0003:05:00.2 eth2: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[   42.828450] tg3 0003:05:00.2 eth2: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[   42.828465] tg3 0003:05:00.2 eth2: dma_rwctrl[00000000] dma_mask[64-bit]
[   42.828694] tg3 0003:05:00.3: enabling device (0140 -> 0142)
[   42.878279] tg3 0003:05:00.3 eth3: Tigon3 [partno(00E2872) rev 5719001] (PCI Express) MAC address 6c:ae:8b:6a:7c:b3
[   42.878303] tg3 0003:05:00.3 eth3: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[   42.878319] tg3 0003:05:00.3 eth3: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[   42.878334] tg3 0003:05:00.3 eth3: dma_rwctrl[00000000] dma_mask[64-bit]
[   42.993650] [drm] radeon kernel modesetting enabled.
[   42.993822] radeon 0001:09:00.0: remove_conflicting_pci_framebuffers: bar 0: 0x3b1020000000 -> 0x3b102fffffff
[   42.993847] radeon 0001:09:00.0: remove_conflicting_pci_framebuffers: bar 2: 0x3fe081000000 -> 0x3fe08101ffff
[   42.993966] radeon 0001:09:00.0: enabling device (0140 -> 0142)
[   42.994104] [drm] initializing kernel modesetting (CEDAR 0x1002:0x68F2 0x1002:0x0126 0x00).
[   42.994188] [drm:radeon_device_init [radeon]] *ERROR* Unable to find PCI I/O BAR
[   43.156658] [drm:radeon_atombios_init [radeon]] *ERROR* Unable to find PCI I/O BAR; using MMIO for ATOM IIO
[   43.156689] ATOM BIOS: CEDAR
[   43.156801] radeon 0001:09:00.0: VRAM: 512M 0x0000000000000000 - 0x000000001FFFFFFF (512M used)
[   43.156828] radeon 0001:09:00.0: GTT: 1024M 0x0000000020000000 - 0x000000005FFFFFFF
[   43.156854] [drm] Detected VRAM RAM=512M, BAR=256M
[   43.156880] [drm] RAM width 64bits DDR
[   43.157099] [TTM] Zone  kernel: Available graphics memory: 65823168 KiB
[   43.157125] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[   43.157151] [TTM] Initializing pool allocator
[   43.157182] [TTM] Initializing DMA pool allocator
[   43.157249] [drm] radeon: 512M of VRAM memory ready
[   43.157277] [drm] radeon: 1024M of GTT memory ready.
[   43.157309] [drm] Loading CEDAR Microcode
[   43.187942] BTRFS info (device dm-6): device fsid 803b3392-d9e6-47d8-ac57-313cf2d39e0c devid 1 moved old:/dev/mapper/1IBM_IPR-0_5EC28A0000000020-part6 new:/dev/dm-6
[   43.197155] BTRFS info (device dm-6): device fsid 803b3392-d9e6-47d8-ac57-313cf2d39e0c devid 1 moved old:/dev/dm-6 new:/dev/mapper/1IBM_IPR-0_5EC28A0000000020-part6
[   43.219578] [drm] Internal thermal controller with fan control
[   43.220042] [drm:radeon_pm_init [radeon]] *ERROR* radeon: dpm initialization failed
[   43.222368] [drm] GART: num cpu pages 16384, num gpu pages 262144
[   43.222809] [drm] PCIE gen 2 link speeds already enabled
[   43.258255] [drm] PCIE GART of 1024M enabled (table at 0x0000000000150000).
[   43.258421] radeon 0001:09:00.0: WB enabled
[   43.258438] radeon 0001:09:00.0: fence driver on ring 0 use gpu addr 0x0000000020000c00 and cpu addr 0x000000008179ffbe
[   43.258454] radeon 0001:09:00.0: fence driver on ring 3 use gpu addr 0x0000000020000c0c and cpu addr 0x00000000a9bb1def
[   43.263536] radeon 0001:09:00.0: fence driver on ring 5 use gpu addr 0x000000000005c418 and cpu addr 0x0000000059383b7b
[   43.263553] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   43.263567] [drm] Driver supports precise vblank timestamp query.
[   43.263581] radeon 0001:09:00.0: radeon: MSI limited to 32-bit
[   43.263665] radeon 0001:09:00.0: radeon: using MSI.
[   43.263703] [drm] radeon: irq initialized.
[   43.280433] [drm] ring test on 0 succeeded in 1 usecs
[   43.280455] [drm] ring test on 3 succeeded in 3 usecs
[   43.457540] [drm] ring test on 5 succeeded in 1 usecs
[   43.457560] [drm] UVD initialized successfully.
[   43.457726] [drm] ib test on ring 0 succeeded in 0 usecs
[   43.457807] [drm] ib test on ring 3 succeeded in 0 usecs
[   43.662063] BTRFS info (device dm-6): device fsid 803b3392-d9e6-47d8-ac57-313cf2d39e0c devid 1 moved old:/dev/mapper/1IBM_IPR-0_5EC28A0000000020-part6 new:/dev/dm-6
[   43.669136] BTRFS info (device dm-6): device fsid 803b3392-d9e6-47d8-ac57-313cf2d39e0c devid 1 moved old:/dev/dm-6 new:/dev/mapper/1IBM_IPR-0_5EC28A0000000020-part6
[   43.737782] Adding 2097088k swap on /dev/mapper/1IBM_IPR-0_5EC28A0000000020-part5.  Priority:-2 extents:1 across:2097088k FS
[   44.117794] [drm] ib test on ring 5 succeeded
[   44.119464] [drm] Radeon Display Connectors
[   44.119480] [drm] Connector 0:
[   44.119493] [drm]   DP-1
[   44.119505] [drm]   HPD3
[   44.119518] [drm]   DDC: 0x6460 0x6460 0x6464 0x6464 0x6468 0x6468 0x646c 0x646c
[   44.119532] [drm]   Encoders:
[   44.119545] [drm]     DFP1: INTERNAL_UNIPHY1
[   44.119558] [drm] Connector 1:
[   44.119570] [drm]   DP-2
[   44.119582] [drm]   HPD1
[   44.119595] [drm]   DDC: 0x6450 0x6450 0x6454 0x6454 0x6458 0x6458 0x645c 0x645c
[   44.119608] [drm]   Encoders:
[   44.119621] [drm]     DFP2: INTERNAL_UNIPHY
[   44.119633] [drm] Connector 2:
[   44.119646] [drm]   DVI-I-1
[   44.119658] [drm]   HPD2
[   44.119670] [drm]   DDC: 0x6440 0x6440 0x6444 0x6444 0x6448 0x6448 0x644c 0x644c
[   44.119684] [drm]   Encoders:
[   44.119696] [drm]     DFP3: INTERNAL_UNIPHY1
[   44.119709] [drm]     CRT2: INTERNAL_KLDSCP_DAC2
[   44.119722] [drm] Connector 3:
[   44.119734] [drm]   DVI-I-2
[   44.119747] [drm]   HPD4
[   44.119760] [drm]   DDC: 0x6430 0x6430 0x6434 0x6434 0x6438 0x6438 0x643c 0x643c
[   44.119773] [drm]   Encoders:
[   44.119786] [drm]     DFP4: INTERNAL_UNIPHY
[   44.119799] [drm]     CRT1: INTERNAL_KLDSCP_DAC1
[   44.268090] [drm] Cannot find any crtc or sizes
[   44.268370] [drm] Initialized radeon 2.50.0 20080528 for 0001:09:00.0 on minor 0
[   45.478088] [drm] Cannot find any crtc or sizes
[   45.828433] ses 0:0:6:0: Attached Enclosure device
[   45.828490] ses 0:0:9:0: Attached Enclosure device
[   45.828535] ses 0:0:10:0: Attached Enclosure device
[   45.828558] ses 1:0:1:0: Attached Enclosure device
[   45.828582] ses 1:0:2:0: Attached Enclosure device
[   46.097832] sd 0:2:0:0: alua: port group c28f state A preferred supports TOlUSNA
[   46.097928] sd 0:2:0:0: alua: port group c28f state A preferred supports TOlUSNA
[   46.287822] sd 0:2:1:0: alua: port group c28f state A preferred supports TOlUSNA
[   46.287930] sd 0:2:1:0: alua: port group c28f state A preferred supports TOlUSNA
[   46.497827] sd 0:2:2:0: alua: port group c28f state A preferred supports TOlUSNA
[   46.497927] sd 0:2:2:0: alua: port group c28f state A preferred supports TOlUSNA
[   46.512528] BTRFS: device fsid 29eb1e8a-9836-45ca-b074-9c6eca79d3a0 devid 1 transid 703556 /dev/dm-12
[   46.647871] sd 0:2:3:0: alua: port group c28f state A preferred supports TOlUSNA
[   46.647968] sd 0:2:3:0: alua: port group c28f state A preferred supports TOlUSNA
[   46.821442] BTRFS info (device dm-6): device fsid 803b3392-d9e6-47d8-ac57-313cf2d39e0c devid 1 moved old:/dev/mapper/1IBM_IPR-0_5EC28A0000000020-part6 new:/dev/dm-6
[   46.827224] BTRFS info (device dm-6): device fsid 803b3392-d9e6-47d8-ac57-313cf2d39e0c devid 1 moved old:/dev/dm-6 new:/dev/mapper/1IBM_IPR-0_5EC28A0000000020-part6
[   46.837845] sd 0:2:4:0: alua: port group c28f state A preferred supports TOlUSNA
[   46.837941] sd 0:2:4:0: alua: port group c28f state A preferred supports TOlUSNA
[   47.037848] sd 0:2:5:0: alua: port group c28f state A preferred supports TOlUSNA
[   47.037921] sd 0:2:5:0: alua: port group c28f state A preferred supports TOlUSNA
[   47.118648] systemd-journald[1776]: Received request to flush runtime journal from PID 1
[   47.130332] BTRFS info (device dm-12): disk space caching is enabled
[   47.130371] BTRFS info (device dm-12): has skinny extents
[   47.195999] SGI XFS with ACLs, security attributes, no debug enabled
[   47.202938] XFS (dm-7): Mounting V5 Filesystem
[   47.261275] XFS (dm-7): Ending clean mount
[   48.479481] bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
[   48.799978] Bridge firewalling registered
[   49.255613] br0: port 1(eth0) entered blocking state
[   49.255621] br0: port 1(eth0) entered disabled state
[   49.255836] device eth0 entered promiscuous mode
[   49.376643] br0: port 2(eth1) entered blocking state
[   49.376651] br0: port 2(eth1) entered disabled state
[   49.376948] device eth1 entered promiscuous mode
[   49.501670] br0: port 3(eth2) entered blocking state
[   49.501678] br0: port 3(eth2) entered disabled state
[   49.501896] device eth2 entered promiscuous mode
[   49.617939] br0: port 4(eth3) entered blocking state
[   49.617948] br0: port 4(eth3) entered disabled state
[   49.618175] device eth3 entered promiscuous mode
[   52.123287] tg3 0003:05:00.0 eth0: Link is up at 1000 Mbps, full duplex
[   52.123291] tg3 0003:05:00.0 eth0: Flow control is off for TX and off for RX
[   52.123292] tg3 0003:05:00.0 eth0: EEE is enabled
[   52.123312] br0: port 1(eth0) entered blocking state
[   52.123314] br0: port 1(eth0) entered forwarding state
[   52.123426] IPv6: ADDRCONF(NETDEV_CHANGE): br0: link becomes ready
[   52.440725] NET: Registered protocol family 17
[   67.654306] FS-Cache: Loaded
[   67.692689] RPC: Registered named UNIX socket transport module.
[   67.692692] RPC: Registered udp transport module.
[   67.692692] RPC: Registered tcp transport module.
[   67.692693] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   67.827019] FS-Cache: Netfs 'nfs' registered for caching
[   67.837605] Key type dns_resolver registered
[   68.032095] NFS: Registering the id_resolver key type
[   68.032105] Key type id_resolver registered
[   68.032106] Key type id_legacy registered

--0OAP2g/MAC+5xKAE--
