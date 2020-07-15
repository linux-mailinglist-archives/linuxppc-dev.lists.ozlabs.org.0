Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67154220A56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 12:42:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6DVl15hBzDqqY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 20:42:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.172.75; helo=4.mo2.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2106 seconds by postgrey-1.36 at bilbo;
 Wed, 15 Jul 2020 20:41:21 AEST
Received: from 4.mo2.mail-out.ovh.net (4.mo2.mail-out.ovh.net [87.98.172.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6DSx3BDNzDqcG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 20:41:19 +1000 (AEST)
Received: from player687.ha.ovh.net (unknown [10.110.103.132])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id F200B1D5772
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 12:06:06 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-1163-216.w90-76.abo.wanadoo.fr
 [90.76.222.216]) (Authenticated sender: clg@kaod.org)
 by player687.ha.ovh.net (Postfix) with ESMTPSA id F0C57145168A5;
 Wed, 15 Jul 2020 10:06:01 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0010a883b7b-8c4b-4ebc-ba73-7f051c4b0d1e,D1878713575E7557A8ED5F979EF3ECB62B482302)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH 03/15] powerpc/powernv/pci: Add explicit tracking of the
 DMA setup state
To: Oliver O'Halloran <oohall@gmail.com>
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-4-oohall@gmail.com>
 <ee5a00db-badd-12fe-1c46-eaba5afc8dea@ozlabs.ru>
 <CAOSf1CESRPypebf6+rnkZkNmi6+xL4+QP1xgAS1szGsZDBcs8A@mail.gmail.com>
 <34f7eea2-4ace-9931-7b5f-98ec159f3532@ozlabs.ru>
 <CAOSf1CGhc1i64_DS18evMhwoXvMWyafOk3r2czUz49F6gERtfw@mail.gmail.com>
 <1da1c482-a720-d5ec-a39c-a4b4869352d5@ozlabs.ru>
 <5a1c3bd9-3a35-6e63-2f51-1626b178a7c8@kaod.org>
 <CAOSf1CHWLH3Km3bj1fFVLXvQu-vE=_K4VWZQLyUFfwCVJbJBuA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <431f117c-8d23-70e8-b40a-97dd04f3da5b@kaod.org>
Date: Wed, 15 Jul 2020 12:05:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CHWLH3Km3bj1fFVLXvQu-vE=_K4VWZQLyUFfwCVJbJBuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15352208183187508157
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrfedvgddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdeltddrjeeirddvvddvrddvudeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieekjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/15/20 11:00 AM, Oliver O'Halloran wrote:
> On Wed, Jul 15, 2020 at 5:05 PM Cédric Le Goater <clg@kaod.org> wrote:
>>
>> I could but can we fix the issue below before I reboot ?  I don't have a
>> console anymore on these boxes.
>>
>> Firmware is :
>> *snip*
> 
> Do you know when that started happening? I don't think anything
> console related has changed in a very long time, but we probably
> haven't tested it on p7 in even longer.
> 

5.0.16-100.fc28.ppc64 and 5.4.0-4-powerpc64 have the issue, 
4.16.0-1-powerpc64 doesn't. 

Anyhow, I gave the patchset a try. Here are the kernel logs.

PCI looks fine. System could boot but there are some others
errors.

C.

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
[    0.000000] Linux version 5.8.0-rc5+ (legoater@amure) (gcc (Debian 9.3.0-12) 9.3.0, GNU ld (GNU Binutils for Debian) 2.34) #121 SMP Wed Jul 15 08:36:42 CEST 2020
[    0.000000] Found initrd at 0xc000000003780000:0xc0000000057444ba
[    0.000000] Using PowerNV machine description
[    0.000000] random: get_random_bytes called from .print_oops_end_marker+0x38/0x80 with crng_init=0
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] CPU maps initialized for 4 threads per core
[    0.000000]  (thread shift is 2)
[    0.000000] Allocated 4800 bytes for 24 pacas
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0xa00000000
[    0.000000] dcache_bsize      = 0x80
[    0.000000] icache_bsize      = 0x80
[    0.000000] cpu_features      = 0x0000016fcf5cb1a3
[    0.000000]   possible        = 0x0007fbefffffb1af
[    0.000000]   always          = 0x00000000000001a0
[    0.000000] cpu_user_features = 0xdc0065c2 0x20000000
[    0.000000] mmu_features      = 0x7c006001
[    0.000000] firmware_features = 0x0000000110000000
[    0.000000] vmalloc start     = 0xc008000000000000
[    0.000000] IO start          = 0xc00a000000000000
[    0.000000] vmemmap start     = 0xc00c000000000000
[    0.000000] hash-mmu: ppc64_pft_size    = 0x0
[    0.000000] hash-mmu: htab_hash_mask    = 0x7ffff
[    0.000000] -----------------------------------------------------
[    0.000000] cma: Reserved 2048 MiB at 0x0000000978000000
[    0.000000] numa:   NODE_DATA [mem 0x9ffdcaf80-0x9ffdcffff]
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] rfi-flush: patched 7 locations (fallback displacement flush)
[    0.000000] link-stack-flush: software flush disabled.
[    0.000000] count-cache-flush: software flush disabled.
[    0.000000] stf-barrier: fallback barrier available
[    0.000000] stf-barrier: patched 62 entry locations (fallback barrier)
[    0.000000] stf-barrier: patched 7 exit locations (fallback barrier)
[    0.000000] Probing IODA IO-Hub /io-hub@3efe00000000
[    0.000000] Initializing IODA1 PHB (/io-hub@3efe00000000/pciex@3efe00080000)
[    0.000000] PCI host bridge /io-hub@3efe00000000/pciex@3efe00080000 (primary) ranges:
[    0.000000]   IO 0x00003efe01000000..0x00003efe017fffff -> 0x0000000000000000
[    0.000000]  MEM 0x00003da080000000..0x00003da0fffeffff -> 0x0000000080000000 
[    0.000000] ioremap() called early from .pnv_pci_init_ioda_phb+0x380/0xc9c. Use early_ioremap() instead
[    0.000000]  MEM 0x00003da800000000..0x00003dafffffffff -> 0x00003da800000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   128 (127) PE's M32: 0x80000000 [segment=0x1000000]
[    0.000000]                  M64: 0x800000000 [segment=0x10000000]
[    0.000000]                   IO: 0x800000 [segment=0x10000]
[    0.000000]   Allocated bitmap for 256 MSIs (base IRQ 0x600)
[    0.000000] Initializing IODA1 PHB (/io-hub@3efe00000000/pciex@3efe00090000)
[    0.000000] PCI host bridge /io-hub@3efe00000000/pciex@3efe00090000  ranges:
[    0.000000]   IO 0x00003efe01800000..0x00003efe01ffffff -> 0x0000000000000000
[    0.000000]  MEM 0x00003da180000000..0x00003da1fffeffff -> 0x0000000080000000 
[    0.000000] ioremap() called early from .pnv_pci_init_ioda_phb+0x380/0xc9c. Use early_ioremap() instead
[    0.000000]  MEM 0x00003db000000000..0x00003db7ffffffff -> 0x00003db000000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   128 (127) PE's M32: 0x80000000 [segment=0x1000000]
[    0.000000]                  M64: 0x800000000 [segment=0x10000000]
[    0.000000]                   IO: 0x800000 [segment=0x10000]
[    0.000000]   Allocated bitmap for 256 MSIs (base IRQ 0xa00)
[    0.000000] Initializing IODA1 PHB (/io-hub@3efe00000000/pciex@3efe000a0000)
[    0.000000] PCI host bridge /io-hub@3efe00000000/pciex@3efe000a0000  ranges:
[    0.000000]   IO 0x00003efe02000000..0x00003efe027fffff -> 0x0000000000000000
[    0.000000]  MEM 0x00003da280000000..0x00003da2fffeffff -> 0x0000000080000000 
[    0.000000] ioremap() called early from .pnv_pci_init_ioda_phb+0x380/0xc9c. Use early_ioremap() instead
[    0.000000]  MEM 0x00003db800000000..0x00003dbfffffffff -> 0x00003db800000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   128 (127) PE's M32: 0x80000000 [segment=0x1000000]
[    0.000000]                  M64: 0x800000000 [segment=0x10000000]
[    0.000000]                   IO: 0x800000 [segment=0x10000]
[    0.000000]   Allocated bitmap for 256 MSIs (base IRQ 0xe00)
[    0.000000] Initializing IODA1 PHB (/io-hub@3efe00000000/pciex@3efe000b0000)
[    0.000000] PCI host bridge /io-hub@3efe00000000/pciex@3efe000b0000  ranges:
[    0.000000]   IO 0x00003efe02800000..0x00003efe02ffffff -> 0x0000000000000000
[    0.000000]  MEM 0x00003da380000000..0x00003da3fffeffff -> 0x0000000080000000 
[    0.000000] ioremap() called early from .pnv_pci_init_ioda_phb+0x380/0xc9c. Use early_ioremap() instead
[    0.000000]  MEM 0x00003dc000000000..0x00003dc7ffffffff -> 0x00003dc000000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   128 (127) PE's M32: 0x80000000 [segment=0x1000000]
[    0.000000]                  M64: 0x800000000 [segment=0x10000000]
[    0.000000]                   IO: 0x800000 [segment=0x10000]
[    0.000000]   Allocated bitmap for 256 MSIs (base IRQ 0x1200)
[    0.000000] Initializing IODA1 PHB (/io-hub@3efe00000000/pciex@3efe000c0000)
[    0.000000] PCI host bridge /io-hub@3efe00000000/pciex@3efe000c0000  ranges:
[    0.000000]   IO 0x00003efe03000000..0x00003efe037fffff -> 0x0000000000000000
[    0.000000]  MEM 0x00003da480000000..0x00003da4fffeffff -> 0x0000000080000000 
[    0.000000] ioremap() called early from .pnv_pci_init_ioda_phb+0x380/0xc9c. Use early_ioremap() instead
[    0.000000]  MEM 0x00003dc800000000..0x00003dcfffffffff -> 0x00003dc800000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   128 (127) PE's M32: 0x80000000 [segment=0x1000000]
[    0.000000]                  M64: 0x800000000 [segment=0x10000000]
[    0.000000]                   IO: 0x800000 [segment=0x10000]
[    0.000000]   Allocated bitmap for 256 MSIs (base IRQ 0x1600)
[    0.000000] Initializing IODA1 PHB (/io-hub@3efe00000000/pciex@3efe000d0000)
[    0.000000] PCI host bridge /io-hub@3efe00000000/pciex@3efe000d0000  ranges:
[    0.000000]   IO 0x00003efe03800000..0x00003efe03ffffff -> 0x0000000000000000
[    0.000000]  MEM 0x00003da580000000..0x00003da5fffeffff -> 0x0000000080000000 
[    0.000000] ioremap() called early from .pnv_pci_init_ioda_phb+0x380/0xc9c. Use early_ioremap() instead
[    0.000000]  MEM 0x00003dd000000000..0x00003dd7ffffffff -> 0x00003dd000000000 (M64 #0..15)
[    0.000000]  Using M64 #15 as default window
[    0.000000]   128 (127) PE's M32: 0x80000000 [segment=0x1000000]
[    0.000000]                  M64: 0x800000000 [segment=0x10000000]
[    0.000000]                   IO: 0x800000 [segment=0x10000]
[    0.000000]   Allocated bitmap for 256 MSIs (base IRQ 0x1a00)
[    0.000000] OPAL nvram setup, 1048576 bytes
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] barrier-nospec: patched 376 locations
[    0.000000] Top of RAM: 0xa00000000, Total RAM: 0xa00000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x00000009ffffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x00000009ffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000009ffffffff]
[    0.000000] On node 0 totalpages: 655360
[    0.000000]   Normal zone: 640 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 655360 pages, LIFO batch:3
[    0.000000] percpu: Embedded 11 pages/cpu s632984 r0 d87912 u1048576
[    0.000000] pcpu-alloc: s632984 r0 d87912 u1048576 alloc=1*1048576
[    0.000000] pcpu-alloc: [0] 00 [0] 01 [0] 02 [0] 03 [0] 04 [0] 05 [0] 06 [0] 07 
[    0.000000] pcpu-alloc: [0] 08 [0] 09 [0] 10 [0] 11 [0] 12 [0] 13 [0] 14 [0] 15 
[    0.000000] pcpu-alloc: [0] 16 [0] 17 [0] 18 [0] 19 [0] 20 [0] 21 [0] 22 [0] 23 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 654720
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: root=/dev/mapper/vg--amure-root ro
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] opal: OPAL_CONSOLE_FLUSH missing.
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/powerpc/platforms/powernv/opal.c:528 .__opal_flush_console+0xfc/0x110
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc5+ #121
[    0.000000] NIP:  c0000000000d204c LR: c0000000000d2048 CTR: c0000000001f43f0
[    0.000000] REGS: c000000001683770 TRAP: 0700   Not tainted  (5.8.0-rc5+)
[    0.000000] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28004242  XER: 20000000
[    0.000000] CFAR: c0000000001570b8 IRQMASK: 1 
[    0.000000] GPR00: c0000000000d2048 c000000001683a00 c000000001685e00 0000000000000022 
[    0.000000] GPR04: c000000000cc88ea 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    0.000000] GPR08: 206d697373696e67 c0000000016d5e00 0000000000000027 9000000000001032 
[    0.000000] GPR12: c0000000001f43f0 c000000001890000 0000000000000000 c000000001495c78 
[    0.000000] GPR16: c0000000017a33f0 c000000001482e08 0000000000000001 0000000000000000 
[    0.000000] GPR20: 0000000000000001 c000000001546700 0000000000000000 c0000000017a5da8 
[    0.000000] GPR24: 0000000000000001 c0000000017a3da8 c0000000017a3418 0000000000000001 
[    0.000000] GPR28: 0000000000000036 c000000001861718 0000000000000000 0000000000000000 
[    0.000000] NIP [c0000000000d204c] .__opal_flush_console+0xfc/0x110
[    0.000000] LR [c0000000000d2048] .__opal_flush_console+0xf8/0x110
[    0.000000] Call Trace:
[    0.000000] [c000000001683a00] [c0000000000d2048] .__opal_flush_console+0xf8/0x110 (unreliable)
[    0.000000] [c000000001683a90] [c0000000000d2574] .opal_flush_console+0x24/0x60
[    0.000000] [c000000001683b10] [c0000000007c3b60] .udbg_opal_putc+0xe0/0x140
[    0.000000] [c000000001683ba0] [c000000000026f10] .udbg_write+0x90/0x150
[    0.000000] [c000000001683c30] [c0000000001f35e8] .console_unlock+0x348/0x730
[    0.000000] [c000000001683d40] [c0000000001f3cb8] .register_console+0x208/0x420
[    0.000000] [c000000001683dd0] [c000000000e2a404] .register_early_udbg_console+0x8c/0xa4
[    0.000000] [c000000001683e50] [c000000000e29fd0] .setup_arch+0x78/0x3c4
[    0.000000] [c000000001683ed0] [c000000000e24270] .start_kernel+0x98/0x750
[    0.000000] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[    0.000000] Instruction dump:
[    0.000000] 3be0fffe 4bffb141 60000000 4bffff90 60000000 3c62ff64 39200001 3d42ffea 
[    0.000000] 38632ac8 992af5b1 4808500d 60000000 <0fe00000> 4bffff50 48a7d07d 60000000 
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] printk: log_buf_len individual max cpu contribution: 4096 bytes
[    0.000000] printk: log_buf_len total cpu_extra contributions: 94208 bytes
[    0.000000] printk: log_buf_len min size: 131072 bytes
[    0.000000] printk: log_buf_len: 262144 bytes
[    0.000000] printk: early log buf free: 57728(44%)
[    0.000000] Dentry cache hash table entries: 8388608 (order: 10, 67108864 bytes, linear)
[    0.000000] Inode-cache hash table entries: 4194304 (order: 9, 33554432 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 39432768K/41943040K available (11648K kernel code, 2688K rwdata, 2752K rodata, 6528K init, 1425K bss, 413120K reserved, 2097152K cma-reserved)
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=24, Nodes=1
[    0.000000] ftrace: allocating 29720 entries in 11 pages
[    0.000000] ftrace: allocated 11 pages with 3 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=2048 to nr_cpu_ids=24.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=24
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] ICS OPAL backend registered
[    0.000000] time_init: decrementer frequency = 512.000000 MHz
[    0.000000] time_init: processor frequency   = 3720.000000 MHz
[    0.000003] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.001375] clocksource: timebase mult[1f40000] shift[24] registered
[    0.002225] clockevent: decrementer mult[83126e98] shift[32] cpu[0]
[    0.002337] Console: colour dummy device 80x25
[    0.002931] printk: console [hvc0] enabled
[    0.003487] printk: bootconsole [udbg0] disabled
[    0.004257] pid_max: default: 32768 minimum: 301
[    0.004504] LSM: Security Framework initializing
[    0.310236] Yama: becoming mindful.
[    0.310301] AppArmor: AppArmor initialized
[    0.310318] TOMOYO Linux initialized
[    0.310551] Mount-cache hash table entries: 131072 (order: 4, 1048576 bytes, linear)
[    0.310723] Mountpoint-cache hash table entries: 131072 (order: 4, 1048576 bytes, linear)
[    0.312139] opal: Old firmware detected, OPAL handles HMIs.
[    0.312158] EEH: PowerNV platform initialized
[    0.312176] POWER7 performance monitor hardware support registered
[    0.312252] rcu: Hierarchical SRCU implementation.
[    0.313281] smp: Bringing up secondary CPUs ...
[    0.324899] smp: Brought up 1 node, 24 CPUs
[    0.324923] numa: Node 0 CPUs: 0-23
[    0.324943] Using standard scheduler topology
[    0.325205] Enabling Asymmetric SMT scheduling
[    0.328461] devtmpfs: initialized
[    0.342385] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.342423] futex hash table entries: 8192 (order: 4, 1048576 bytes, linear)
[    0.649087] thermal_sys: Registered thermal governor 'fair_share'
[    0.649089] thermal_sys: Registered thermal governor 'step_wise'
[    0.649803] NET: Registered protocol family 16
[    0.650723] audit: initializing netlink subsys (disabled)
[    0.650997] audit: type=2000 audit(1594807024.344:1): state=initialized audit_enabled=0 res=1
[    0.652004] cpuidle: using governor ladder
[    0.652061] cpuidle: using governor menu
[    0.671390] PCI: Probing PCI hardware
[    0.672017] PCI host bridge to bus 0000:00
[    0.672165] pci_bus 0000:00: root bus resource [io  0x10000-0x80ffff] (bus address [0x0000-0x7fffff])
[    0.672193] pci_bus 0000:00: root bus resource [mem 0x3da080000000-0x3da0fffeffff] (bus address [0x80000000-0xfffeffff])
[    0.672220] pci_bus 0000:00: root bus resource [mem 0x3da800000000-0x3dafdfffffff 64bit pref]
[    0.672246] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.672269] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    0.983212] pci 0000:00:00.0: [1014:03b9] type 01 class 0x060000
[    0.983386] pci 0000:00:00.0: enabling Extended Tags
[    0.983553] pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
[    0.985880] pci 0000:01:00.0: [10b5:8624] type 01 class 0x060400
[    0.986000] pci 0000:01:00.0: reg 0x10: [mem 0x3da084000000-0x3da08401ffff]
[    0.986404] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
[    0.988796] pci 0000:00:00.0: PCI bridge to [bus 01-bf]
[    0.988833] pci 0000:00:00.0:   bridge window [io  0x20000-0x3ffff]
[    0.989226] pci 0000:02:04.0: [10b5:8624] type 01 class 0x060400
[    0.989698] pci 0000:02:04.0: PME# supported from D0 D3hot D3cold
[    0.990405] pci 0000:02:05.0: [10b5:8624] type 01 class 0x060400
[    0.990884] pci 0000:02:05.0: PME# supported from D0 D3hot D3cold
[    0.991606] pci 0000:02:06.0: [10b5:8624] type 01 class 0x060400
[    0.992074] pci 0000:02:06.0: PME# supported from D0 D3hot D3cold
[    1.320758] pci 0000:02:08.0: [10b5:8624] type 01 class 0x060400
[    1.321229] pci 0000:02:08.0: PME# supported from D0 D3hot D3cold
[    1.322017] pci 0000:02:09.0: [10b5:8624] type 01 class 0x060400
[    1.322491] pci 0000:02:09.0: PME# supported from D0 D3hot D3cold
[    1.324138] pci 0000:01:00.0: PCI bridge to [bus 02-bf]
[    1.324176] pci 0000:01:00.0:   bridge window [io  0x20000-0x3ffff]
[    1.325754] pci 0000:02:04.0: PCI bridge to [bus 20-3f]
[    1.327290] pci 0000:02:05.0: PCI bridge to [bus 40-5f]
[    1.327329] pci 0000:02:05.0:   bridge window [io  0x20000-0x2ffff]
[    1.327563] pci 0000:60:00.0: [1014:0339] type 00 class 0x010400
[    1.327666] pci 0000:60:00.0: reg 0x10: [mem 0x3da081000000-0x3da08103ffff 64bit]
[    1.327730] pci 0000:60:00.0: reg 0x18: [mem 0x3da086000000-0x3da086ffffff 64bit pref]
[    1.327828] pci 0000:60:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[    1.328035] pci 0000:60:00.0: PME# supported from D0 D3hot D3cold
[    1.655368] pci 0000:60:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:02:06.0 (capable of 16.000 Gb/s with 2.5 GT/s PCIe x8 link)
[    1.657312] pci 0000:02:06.0: PCI bridge to [bus 60-7f]
[    1.657571] pci 0000:80:00.0: [10b5:8112] type 01 class 0x060400
[    1.657998] pci 0000:80:00.0: supports D1
[    1.658018] pci 0000:80:00.0: PME# supported from D0 D1 D3hot
[    1.658618] pci 0000:80:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it with 'pcie_aspm=force'
[    1.660008] pci 0000:02:08.0: PCI bridge to [bus 80-9f]
[    1.660199] pci_bus 0000:90: extended config space not accessible
[    1.660352] pci 0000:90:01.0: [1033:0035] type 00 class 0x0c0310
[    1.660438] pci 0000:90:01.0: reg 0x10: [mem 0x3da082000000-0x3da082000fff]
[    1.660673] pci 0000:90:01.0: BAR0 [mem size 0x00001000]: requesting alignment to 0x10000
[    1.660796] pci 0000:90:01.0: supports D1 D2
[    1.993001] pci 0000:90:01.0: PME# supported from D0 D1 D2 D3hot
[    1.993524] pci 0000:90:01.1: [1033:0035] type 00 class 0x0c0310
[    1.993609] pci 0000:90:01.1: reg 0x10: [mem 0x3da082001000-0x3da082001fff]
[    1.993842] pci 0000:90:01.1: BAR0 [mem size 0x00001000]: requesting alignment to 0x10000
[    1.993966] pci 0000:90:01.1: supports D1 D2
[    1.993987] pci 0000:90:01.1: PME# supported from D0 D1 D2 D3hot
[    1.994506] pci 0000:90:01.2: [1033:00e0] type 00 class 0x0c0320
[    1.994591] pci 0000:90:01.2: reg 0x10: [mem 0x3da082002000-0x3da0820020ff]
[    1.994823] pci 0000:90:01.2: BAR0 [mem size 0x00000100]: requesting alignment to 0x10000
[    1.994946] pci 0000:90:01.2: supports D1 D2
[    1.994968] pci 0000:90:01.2: PME# supported from D0 D1 D2 D3hot
[    1.996752] pci 0000:80:00.0: PCI bridge to [bus 90-9f]
[    1.997025] pci 0000:a0:00.0: [8086:105e] type 00 class 0x020000
[    1.997121] pci 0000:a0:00.0: reg 0x10: [mem 0x3da083000000-0x3da08301ffff]
[    2.329069] pci 0000:a0:00.0: reg 0x14: [mem 0x3da083020000-0x3da08303ffff]
[    2.329117] pci 0000:a0:00.0: reg 0x18: [io  0x30000-0x3001f]
[    2.329239] pci 0000:a0:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[    2.329461] pci 0000:a0:00.0: PME# supported from D0 D3hot D3cold
[    2.330114] pci 0000:a0:00.1: [8086:105e] type 00 class 0x020000
[    2.330211] pci 0000:a0:00.1: reg 0x10: [mem 0x3da083040000-0x3da08305ffff]
[    2.330258] pci 0000:a0:00.1: reg 0x14: [mem 0x3da083060000-0x3da08307ffff]
[    2.330307] pci 0000:a0:00.1: reg 0x18: [io  0x30020-0x3003f]
[    2.330429] pci 0000:a0:00.1: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[    2.330651] pci 0000:a0:00.1: PME# supported from D0 D3hot D3cold
[    2.331209] pci 0000:a0:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it with 'pcie_aspm=force'
[    2.332601] pci 0000:02:09.0: PCI bridge to [bus a0-bf]
[    2.332639] pci 0000:02:09.0:   bridge window [io  0x30000-0x3ffff]
[    2.665245] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to bf
[    2.665704] PCI host bridge to bus 0001:00
[    2.665726] pci_bus 0001:00: root bus resource [io  0x820000-0x101ffff] (bus address [0x0000-0x7fffff])
[    2.665752] pci_bus 0001:00: root bus resource [mem 0x3da180000000-0x3da1fffeffff] (bus address [0x80000000-0xfffeffff])
[    2.665780] pci_bus 0001:00: root bus resource [mem 0x3db000000000-0x3db7dfffffff 64bit pref]
[    2.665806] pci_bus 0001:00: root bus resource [bus 00-ff]
[    2.665828] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to ff
[    2.665888] pci 0001:00:00.0: [1014:03b9] type 01 class 0x060000
[    2.666053] pci 0001:00:00.0: enabling Extended Tags
[    2.666210] pci 0001:00:00.0: PME# supported from D0 D3hot D3cold
[    2.669662] pci 0001:00:00.0: PCI bridge to [bus 01]
[    2.669698] pci 0001:00:00.0:   bridge window [io  0x830000-0x83ffff]
[    2.669770] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to 01
[    3.001559] PCI host bridge to bus 0002:00
[    3.001581] pci_bus 0002:00: root bus resource [io  0x1030000-0x182ffff] (bus address [0x0000-0x7fffff])
[    3.001608] pci_bus 0002:00: root bus resource [mem 0x3da280000000-0x3da2fffeffff] (bus address [0x80000000-0xfffeffff])
[    3.001635] pci_bus 0002:00: root bus resource [mem 0x3db800000000-0x3dbfdfffffff 64bit pref]
[    3.001660] pci_bus 0002:00: root bus resource [bus 00-ff]
[    3.001682] pci_bus 0002:00: busn_res: [bus 00-ff] end is updated to ff
[    3.001742] pci 0002:00:00.0: [1014:03b9] type 01 class 0x060000
[    3.001907] pci 0002:00:00.0: enabling Extended Tags
[    3.002066] pci 0002:00:00.0: PME# supported from D0 D3hot D3cold
[    3.005509] pci 0002:00:00.0: PCI bridge to [bus 01]
[    3.005545] pci 0002:00:00.0:   bridge window [io  0x1040000-0x104ffff]
[    3.005617] pci_bus 0002:00: busn_res: [bus 00-ff] end is updated to 01
[    3.006174] PCI host bridge to bus 0003:00
[    3.340046] pci_bus 0003:00: root bus resource [io  0x1840000-0x203ffff] (bus address [0x0000-0x7fffff])
[    3.340073] pci_bus 0003:00: root bus resource [mem 0x3da380000000-0x3da3fffeffff] (bus address [0x80000000-0xfffeffff])
[    3.340099] pci_bus 0003:00: root bus resource [mem 0x3dc000000000-0x3dc7dfffffff 64bit pref]
[    3.340124] pci_bus 0003:00: root bus resource [bus 00-ff]
[    3.340145] pci_bus 0003:00: busn_res: [bus 00-ff] end is updated to ff
[    3.340205] pci 0003:00:00.0: [1014:03b9] type 01 class 0x060000
[    3.340370] pci 0003:00:00.0: enabling Extended Tags
[    3.340528] pci 0003:00:00.0: PME# supported from D0 D3hot D3cold
[    3.344021] pci 0003:00:00.0: PCI bridge to [bus 01]
[    3.344063] pci 0003:00:00.0:   bridge window [io  0x1850000-0x185ffff]
[    3.344136] pci_bus 0003:00: busn_res: [bus 00-ff] end is updated to 01
[    3.344743] PCI host bridge to bus 0004:00
[    3.344765] pci_bus 0004:00: root bus resource [io  0x2050000-0x284ffff] (bus address [0x0000-0x7fffff])
[    3.676788] pci_bus 0004:00: root bus resource [mem 0x3da480000000-0x3da4fffeffff] (bus address [0x80000000-0xfffeffff])
[    3.676815] pci_bus 0004:00: root bus resource [mem 0x3dc800000000-0x3dcfdfffffff 64bit pref]
[    3.676840] pci_bus 0004:00: root bus resource [bus 00-ff]
[    3.676862] pci_bus 0004:00: busn_res: [bus 00-ff] end is updated to ff
[    3.676922] pci 0004:00:00.0: [1014:03b9] type 01 class 0x060000
[    3.677087] pci 0004:00:00.0: enabling Extended Tags
[    3.677246] pci 0004:00:00.0: PME# supported from D0 D3hot D3cold
[    3.680790] pci 0004:00:00.0: PCI bridge to [bus 01]
[    3.680826] pci 0004:00:00.0:   bridge window [io  0x2060000-0x206ffff]
[    3.680897] pci_bus 0004:00: busn_res: [bus 00-ff] end is updated to 01
[    3.681582] PCI host bridge to bus 0005:00
[    3.681604] pci_bus 0005:00: root bus resource [io  0x2860000-0x305ffff] (bus address [0x0000-0x7fffff])
[    3.681630] pci_bus 0005:00: root bus resource [mem 0x3da580000000-0x3da5fffeffff] (bus address [0x80000000-0xfffeffff])
[    3.945376] pci_bus 0005:00: root bus resource [mem 0x3dd000000000-0x3dd7dfffffff 64bit pref]
[    3.945401] pci_bus 0005:00: root bus resource [bus 00-ff]
[    3.945423] pci_bus 0005:00: busn_res: [bus 00-ff] end is updated to ff
[    3.945483] pci 0005:00:00.0: [1014:03b9] type 01 class 0x060000
[    3.945648] pci 0005:00:00.0: enabling Extended Tags
[    3.945807] pci 0005:00:00.0: PME# supported from D0 D3hot D3cold
[    3.948218] pci 0005:01:00.0: [10df:f100] type 00 class 0x0c0400
[    3.948323] pci 0005:01:00.0: reg 0x10: [mem 0x3da580008000-0x3da580008fff 64bit]
[    3.948384] pci 0005:01:00.0: reg 0x18: [mem 0x3da580000000-0x3da580003fff 64bit]
[    3.948432] pci 0005:01:00.0: reg 0x20: [io  0x2870000-0x28700ff]
[    3.948502] pci 0005:01:00.0: reg 0x30: [mem 0x00000000-0x0003ffff pref]
[    3.948547] pci 0005:01:00.0: enabling Extended Tags
[    4.281583] pci 0005:01:00.0: BAR0 [mem size 0x00001000 64bit]: requesting alignment to 0x10000
[    4.281610] pci 0005:01:00.0: BAR2 [mem size 0x00004000 64bit]: requesting alignment to 0x10000
[    4.281923] pci 0005:01:00.0: 16.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x8 link at 0005:00:00.0 (capable of 32.000 Gb/s with 5.0 GT/s PCIe x8 link)
[    4.282721] pci 0005:01:00.1: [10df:f100] type 00 class 0x0c0400
[    4.282825] pci 0005:01:00.1: reg 0x10: [mem 0x3da580009000-0x3da580009fff 64bit]
[    4.282887] pci 0005:01:00.1: reg 0x18: [mem 0x3da580004000-0x3da580007fff 64bit]
[    4.282936] pci 0005:01:00.1: reg 0x20: [io  0x2870100-0x28701ff]
[    4.283006] pci 0005:01:00.1: reg 0x30: [mem 0x00000000-0x0003ffff pref]
[    4.283052] pci 0005:01:00.1: enabling Extended Tags
[    4.283099] pci 0005:01:00.1: BAR0 [mem size 0x00001000 64bit]: requesting alignment to 0x10000
[    4.283125] pci 0005:01:00.1: BAR2 [mem size 0x00004000 64bit]: requesting alignment to 0x10000
[    4.622376] pci 0005:00:00.0: PCI bridge to [bus 01]
[    4.622414] pci 0005:00:00.0:   bridge window [io  0x2870000-0x287ffff]
[    4.622485] pci_bus 0005:00: busn_res: [bus 00-ff] end is updated to 01
[    4.622529] pci 0000:02:05.0: bridge window [io  0x10000-0xffff] to [bus 40-5f] add_size 10000
[    4.622556] pci 0000:02:05.0: bridge window [mem 0x10000000-0x0fffffff 64bit pref] to [bus 40-5f] add_size 10000000 add_align 10000000
[    4.622585] pci 0000:02:05.0: bridge window [mem 0x01000000-0x00ffffff] to [bus 40-5f] add_size 1000000 add_align 1000000
[    4.622621] pci 0000:02:09.0: bridge window [mem 0x10000000-0x0fffffff 64bit pref] to [bus a0-bf] add_size 10000000 add_align 10000000
[    4.622652] pci 0000:01:00.0: bridge window [io  0x10000-0x1ffff] to [bus 02-bf] add_size 10000
[    4.622679] pci 0000:01:00.0: bridge window [mem 0x10000000-0x3fffffff 64bit pref] to [bus 02-bf] add_size 20000000 add_align 10000000
[    4.959330] pci 0000:01:00.0: bridge window [mem 0x01000000-0x04ffffff] to [bus 02-bf] add_size 1000000 add_align 1000000
[    4.959358] pci 0000:00:00.0: bridge window [io  0x10000-0x1ffff] to [bus 01-bf] add_size 10000
[    4.959385] pci 0000:00:00.0: bridge window [mem 0x10000000-0x3fffffff 64bit pref] to [bus 01-bf] add_size 20000000 add_align 10000000
[    4.959414] pci 0000:00:00.0: bridge window [mem 0x01000000-0x05ffffff] to [bus 01-bf] add_size 1000000 add_align 1000000
[    4.959447] pci 0000:00:00.0: BAR 15: assigned [mem 0x3da800000000-0x3da84fffffff 64bit pref]
[    4.959472] pci 0000:00:00.0: BAR 14: assigned [mem 0x3da080000000-0x3da085ffffff]
[    4.959497] pci 0000:00:00.0: BAR 13: assigned [io  0x20000-0x3ffff]
[    4.959524] pci 0000:01:00.0: BAR 15: assigned [mem 0x3da800000000-0x3da84fffffff 64bit pref]
[    4.959550] pci 0000:01:00.0: BAR 14: assigned [mem 0x3da080000000-0x3da084ffffff]
[    4.959574] pci 0000:01:00.0: BAR 0: assigned [mem 0x3da085000000-0x3da08501ffff]
[    5.294386] pci 0000:01:00.0: BAR 13: assigned [io  0x20000-0x3ffff]
[    5.294417] pci 0000:02:05.0: BAR 15: assigned [mem 0x3da800000000-0x3da80fffffff 64bit pref]
[    5.294442] pci 0000:02:06.0: BAR 15: assigned [mem 0x3da810000000-0x3da81fffffff 64bit pref]
[    5.294468] pci 0000:02:09.0: BAR 15: assigned [mem 0x3da820000000-0x3da82fffffff 64bit pref]
[    5.294493] pci 0000:02:05.0: BAR 14: assigned [mem 0x3da080000000-0x3da080ffffff]
[    5.294518] pci 0000:02:06.0: BAR 14: assigned [mem 0x3da081000000-0x3da081ffffff]
[    5.294542] pci 0000:02:08.0: BAR 14: assigned [mem 0x3da082000000-0x3da082ffffff]
[    5.294566] pci 0000:02:09.0: BAR 14: assigned [mem 0x3da083000000-0x3da083ffffff]
[    5.294590] pci 0000:02:05.0: BAR 13: assigned [io  0x20000-0x2ffff]
[    5.294612] pci 0000:02:09.0: BAR 13: assigned [io  0x30000-0x3ffff]
[    5.294637] pci 0000:02:04.0: PCI bridge to [bus 20-3f]
[    5.294686] pci 0000:02:05.0: PCI bridge to [bus 40-5f]
[    5.630937] pci 0000:02:05.0:   bridge window [io  0x20000-0x2ffff]
[    5.630969] pci 0000:02:05.0:   bridge window [mem 0x3da080000000-0x3da080ffffff]
[    5.631000] pci 0000:02:05.0:   bridge window [mem 0x3da800000000-0x3da80fffffff 64bit pref]
[    5.631039] pci 0000:60:00.0: BAR 2: assigned [mem 0x3da810000000-0x3da810ffffff 64bit pref]
[    5.631091] pci 0000:60:00.0: BAR 0: assigned [mem 0x3da081000000-0x3da08103ffff 64bit]
[    5.631140] pci 0000:60:00.0: BAR 6: assigned [mem 0x3da081040000-0x3da08105ffff pref]
[    5.631166] pci 0000:02:06.0: PCI bridge to [bus 60-7f]
[    5.631196] pci 0000:02:06.0:   bridge window [mem 0x3da081000000-0x3da081ffffff]
[    5.631226] pci 0000:02:06.0:   bridge window [mem 0x3da810000000-0x3da81fffffff 64bit pref]
[    5.631264] pci 0000:80:00.0: BAR 14: assigned [mem 0x3da082000000-0x3da082ffffff]
[    5.631291] pci 0000:90:01.0: BAR 0: assigned [mem 0x3da082000000-0x3da082000fff]
[    5.631325] pci 0000:90:01.1: BAR 0: assigned [mem 0x3da082010000-0x3da082010fff]
[    5.967728] pci 0000:90:01.2: BAR 0: assigned [mem 0x3da082020000-0x3da0820200ff]
[    5.967763] pci 0000:80:00.0: PCI bridge to [bus 90-9f]
[    5.967795] pci 0000:80:00.0:   bridge window [mem 0x3da082000000-0x3da082ffffff]
[    5.967840] pci 0000:02:08.0: PCI bridge to [bus 80-9f]
[    5.967871] pci 0000:02:08.0:   bridge window [mem 0x3da082000000-0x3da082ffffff]
[    5.967916] pci 0000:a0:00.0: BAR 0: assigned [mem 0x3da083000000-0x3da08301ffff]
[    5.967949] pci 0000:a0:00.0: BAR 1: assigned [mem 0x3da083020000-0x3da08303ffff]
[    5.967981] pci 0000:a0:00.0: BAR 6: assigned [mem 0x3da083040000-0x3da08305ffff pref]
[    5.968006] pci 0000:a0:00.1: BAR 0: assigned [mem 0x3da083060000-0x3da08307ffff]
[    5.968037] pci 0000:a0:00.1: BAR 1: assigned [mem 0x3da083080000-0x3da08309ffff]
[    5.968070] pci 0000:a0:00.1: BAR 6: assigned [mem 0x3da0830a0000-0x3da0830bffff pref]
[    6.305053] pci 0000:a0:00.0: BAR 2: assigned [io  0x30000-0x3001f]
[    6.305084] pci 0000:a0:00.1: BAR 2: assigned [io  0x30020-0x3003f]
[    6.305115] pci 0000:02:09.0: PCI bridge to [bus a0-bf]
[    6.305141] pci 0000:02:09.0:   bridge window [io  0x30000-0x3ffff]
[    6.305172] pci 0000:02:09.0:   bridge window [mem 0x3da083000000-0x3da083ffffff]
[    6.305202] pci 0000:02:09.0:   bridge window [mem 0x3da820000000-0x3da82fffffff 64bit pref]
[    6.305239] pci 0000:01:00.0: PCI bridge to [bus 02-bf]
[    6.305264] pci 0000:01:00.0:   bridge window [io  0x10000-0x80ffff]
[    6.305296] pci 0000:01:00.0:   bridge window [mem 0x3da080000000-0x3da0ffefffff]
[    6.305326] pci 0000:01:00.0:   bridge window [mem 0x3da800000000-0x3dafdff0ffff 64bit pref]
[    6.305363] pci 0000:00:00.0: PCI bridge to [bus 01-bf]
[    6.305387] pci 0000:00:00.0:   bridge window [io  0x10000-0x80ffff]
[    6.305419] pci 0000:00:00.0:   bridge window [mem 0x3da080000000-0x3da0ffefffff]
[    6.643340] pci 0000:00:00.0:   bridge window [mem 0x3da800000000-0x3dafdff0ffff 64bit pref]
[    6.643378] pci_bus 0000:00: resource 4 [io  0x10000-0x80ffff]
[    6.643400] pci_bus 0000:00: resource 5 [mem 0x3da080000000-0x3da0fffeffff]
[    6.643422] pci_bus 0000:00: resource 6 [mem 0x3da800000000-0x3dafdfffffff 64bit pref]
[    6.643447] pci_bus 0000:01: resource 0 [io  0x10000-0x80ffff]
[    6.643470] pci_bus 0000:01: resource 1 [mem 0x3da080000000-0x3da0ffefffff]
[    6.643494] pci_bus 0000:01: resource 2 [mem 0x3da800000000-0x3dafdff0ffff 64bit pref]
[    6.643517] pci_bus 0000:02: resource 0 [io  0x10000-0x80ffff]
[    6.643540] pci_bus 0000:02: resource 1 [mem 0x3da080000000-0x3da0ffefffff]
[    6.643562] pci_bus 0000:02: resource 2 [mem 0x3da800000000-0x3dafdff0ffff 64bit pref]
[    6.643586] pci_bus 0000:40: resource 0 [io  0x20000-0x2ffff]
[    6.643608] pci_bus 0000:40: resource 1 [mem 0x3da080000000-0x3da080ffffff]
[    6.643631] pci_bus 0000:40: resource 2 [mem 0x3da800000000-0x3da80fffffff 64bit pref]
[    6.984394] pci_bus 0000:60: resource 1 [mem 0x3da081000000-0x3da081ffffff]
[    6.984416] pci_bus 0000:60: resource 2 [mem 0x3da810000000-0x3da81fffffff 64bit pref]
[    6.984440] pci_bus 0000:80: resource 1 [mem 0x3da082000000-0x3da082ffffff]
[    6.984462] pci_bus 0000:90: resource 1 [mem 0x3da082000000-0x3da082ffffff]
[    6.984484] pci_bus 0000:a0: resource 0 [io  0x30000-0x3ffff]
[    6.984506] pci_bus 0000:a0: resource 1 [mem 0x3da083000000-0x3da083ffffff]
[    6.984528] pci_bus 0000:a0: resource 2 [mem 0x3da820000000-0x3da82fffffff 64bit pref]
[    6.984554] pci 0001:00:00.0: bridge window [io  0x10000-0xffff] to [bus 01] add_size 10000
[    6.984579] pci 0001:00:00.0: bridge window [mem 0x10000000-0x0fffffff 64bit pref] to [bus 01] add_size 10000000 add_align 10000000
[    6.984608] pci 0001:00:00.0: bridge window [mem 0x01000000-0x00ffffff] to [bus 01] add_size 1000000 add_align 1000000
[    7.352620] pci 0001:00:00.0: BAR 15: assigned [mem 0x3db000000000-0x3db00fffffff 64bit pref]
[    7.352646] pci 0001:00:00.0: BAR 14: assigned [mem 0x3da180000000-0x3da180ffffff]
[    7.352670] pci 0001:00:00.0: BAR 13: assigned [io  0x830000-0x83ffff]
[    7.352693] pci 0001:00:00.0: PCI bridge to [bus 01]
[    7.352719] pci 0001:00:00.0:   bridge window [io  0x820000-0x101ffff]
[    7.352750] pci 0001:00:00.0:   bridge window [mem 0x3da180000000-0x3da1ffefffff]
[    7.352781] pci 0001:00:00.0:   bridge window [mem 0x3db000000000-0x3db7dff0ffff 64bit pref]
[    7.352818] pci_bus 0001:00: resource 4 [io  0x820000-0x101ffff]
[    7.352840] pci_bus 0001:00: resource 5 [mem 0x3da180000000-0x3da1fffeffff]
[    7.352863] pci_bus 0001:00: resource 6 [mem 0x3db000000000-0x3db7dfffffff 64bit pref]
[    7.352887] pci_bus 0001:01: resource 0 [io  0x820000-0x101ffff]
[    7.352909] pci_bus 0001:01: resource 1 [mem 0x3da180000000-0x3da1ffefffff]
[    7.352933] pci_bus 0001:01: resource 2 [mem 0x3db000000000-0x3db7dff0ffff 64bit pref]
[    7.689979] pci 0002:00:00.0: bridge window [io  0x10000-0xffff] to [bus 01] add_size 10000
[    7.690005] pci 0002:00:00.0: bridge window [mem 0x10000000-0x0fffffff 64bit pref] to [bus 01] add_size 10000000 add_align 10000000
[    7.690033] pci 0002:00:00.0: bridge window [mem 0x01000000-0x00ffffff] to [bus 01] add_size 1000000 add_align 1000000
[    7.690062] pci 0002:00:00.0: BAR 15: assigned [mem 0x3db800000000-0x3db80fffffff 64bit pref]
[    7.690087] pci 0002:00:00.0: BAR 14: assigned [mem 0x3da280000000-0x3da280ffffff]
[    7.690112] pci 0002:00:00.0: BAR 13: assigned [io  0x1040000-0x104ffff]
[    7.690136] pci 0002:00:00.0: PCI bridge to [bus 01]
[    7.690160] pci 0002:00:00.0:   bridge window [io  0x1030000-0x182ffff]
[    7.690191] pci 0002:00:00.0:   bridge window [mem 0x3da280000000-0x3da2ffefffff]
[    7.690222] pci 0002:00:00.0:   bridge window [mem 0x3db800000000-0x3dbfdff0ffff 64bit pref]
[    8.034686] pci_bus 0002:00: resource 4 [io  0x1030000-0x182ffff]
[    8.034708] pci_bus 0002:00: resource 5 [mem 0x3da280000000-0x3da2fffeffff]
[    8.034731] pci_bus 0002:00: resource 6 [mem 0x3db800000000-0x3dbfdfffffff 64bit pref]
[    8.034755] pci_bus 0002:01: resource 0 [io  0x1030000-0x182ffff]
[    8.034777] pci_bus 0002:01: resource 1 [mem 0x3da280000000-0x3da2ffefffff]
[    8.034800] pci_bus 0002:01: resource 2 [mem 0x3db800000000-0x3dbfdff0ffff 64bit pref]
[    8.034824] pci 0003:00:00.0: bridge window [io  0x10000-0xffff] to [bus 01] add_size 10000
[    8.034849] pci 0003:00:00.0: bridge window [mem 0x10000000-0x0fffffff 64bit pref] to [bus 01] add_size 10000000 add_align 10000000
[    8.034879] pci 0003:00:00.0: bridge window [mem 0x01000000-0x00ffffff] to [bus 01] add_size 1000000 add_align 1000000
[    8.034907] pci 0003:00:00.0: BAR 15: assigned [mem 0x3dc000000000-0x3dc00fffffff 64bit pref]
[    8.034933] pci 0003:00:00.0: BAR 14: assigned [mem 0x3da380000000-0x3da380ffffff]
[    8.377305] pci 0003:00:00.0: BAR 13: assigned [io  0x1850000-0x185ffff]
[    8.377329] pci 0003:00:00.0: PCI bridge to [bus 01]
[    8.377354] pci 0003:00:00.0:   bridge window [io  0x1840000-0x203ffff]
[    8.377386] pci 0003:00:00.0:   bridge window [mem 0x3da380000000-0x3da3ffefffff]
[    8.377415] pci 0003:00:00.0:   bridge window [mem 0x3dc000000000-0x3dc7dff0ffff 64bit pref]
[    8.377454] pci_bus 0003:00: resource 4 [io  0x1840000-0x203ffff]
[    8.377476] pci_bus 0003:00: resource 5 [mem 0x3da380000000-0x3da3fffeffff]
[    8.377498] pci_bus 0003:00: resource 6 [mem 0x3dc000000000-0x3dc7dfffffff 64bit pref]
[    8.377521] pci_bus 0003:01: resource 0 [io  0x1840000-0x203ffff]
[    8.377543] pci_bus 0003:01: resource 1 [mem 0x3da380000000-0x3da3ffefffff]
[    8.377565] pci_bus 0003:01: resource 2 [mem 0x3dc000000000-0x3dc7dff0ffff 64bit pref]
[    8.377591] pci 0004:00:00.0: bridge window [io  0x10000-0xffff] to [bus 01] add_size 10000
[    8.647236] pci 0004:00:00.0: bridge window [mem 0x10000000-0x0fffffff 64bit pref] to [bus 01] add_size 10000000 add_align 10000000
[    8.647264] pci 0004:00:00.0: bridge window [mem 0x01000000-0x00ffffff] to [bus 01] add_size 1000000 add_align 1000000
[    8.647293] pci 0004:00:00.0: BAR 15: assigned [mem 0x3dc800000000-0x3dc80fffffff 64bit pref]
[    8.647318] pci 0004:00:00.0: BAR 14: assigned [mem 0x3da480000000-0x3da480ffffff]
[    8.647342] pci 0004:00:00.0: BAR 13: assigned [io  0x2060000-0x206ffff]
[    8.647366] pci 0004:00:00.0: PCI bridge to [bus 01]
[    8.647392] pci 0004:00:00.0:   bridge window [io  0x2050000-0x284ffff]
[    8.647423] pci 0004:00:00.0:   bridge window [mem 0x3da480000000-0x3da4ffefffff]
[    8.647453] pci 0004:00:00.0:   bridge window [mem 0x3dc800000000-0x3dcfdff0ffff 64bit pref]
[    8.647490] pci_bus 0004:00: resource 4 [io  0x2050000-0x284ffff]
[    8.647512] pci_bus 0004:00: resource 5 [mem 0x3da480000000-0x3da4fffeffff]
[    8.983834] pci_bus 0004:00: resource 6 [mem 0x3dc800000000-0x3dcfdfffffff 64bit pref]
[    8.983857] pci_bus 0004:01: resource 0 [io  0x2050000-0x284ffff]
[    8.983879] pci_bus 0004:01: resource 1 [mem 0x3da480000000-0x3da4ffefffff]
[    8.983903] pci_bus 0004:01: resource 2 [mem 0x3dc800000000-0x3dcfdff0ffff 64bit pref]
[    8.983929] pci 0005:00:00.0: bridge window [mem 0x10000000-0x0fffffff 64bit pref] to [bus 01] add_size 10000000 add_align 10000000
[    8.983960] pci 0005:00:00.0: BAR 15: assigned [mem 0x3dd000000000-0x3dd00fffffff 64bit pref]
[    8.983986] pci 0005:00:00.0: BAR 14: assigned [mem 0x3da580000000-0x3da580ffffff]
[    8.984010] pci 0005:00:00.0: BAR 13: assigned [io  0x2870000-0x287ffff]
[    8.984038] pci 0005:01:00.0: BAR 6: assigned [mem 0x3da580000000-0x3da58003ffff pref]
[    8.984062] pci 0005:01:00.1: BAR 6: assigned [mem 0x3da580040000-0x3da58007ffff pref]
[    8.984088] pci 0005:01:00.0: BAR 0: assigned [mem 0x3da580080000-0x3da580080fff 64bit]
[    9.319082] pci 0005:01:00.0: BAR 2: assigned [mem 0x3da580090000-0x3da580093fff 64bit]
[    9.319132] pci 0005:01:00.1: BAR 0: assigned [mem 0x3da5800a0000-0x3da5800a0fff 64bit]
[    9.319181] pci 0005:01:00.1: BAR 2: assigned [mem 0x3da5800b0000-0x3da5800b3fff 64bit]
[    9.319229] pci 0005:01:00.0: BAR 4: assigned [io  0x2870000-0x28700ff]
[    9.319259] pci 0005:01:00.1: BAR 4: assigned [io  0x2870100-0x28701ff]
[    9.319289] pci 0005:00:00.0: PCI bridge to [bus 01]
[    9.319315] pci 0005:00:00.0:   bridge window [io  0x2860000-0x305ffff]
[    9.319347] pci 0005:00:00.0:   bridge window [mem 0x3da580000000-0x3da5ffefffff]
[    9.319377] pci 0005:00:00.0:   bridge window [mem 0x3dd000000000-0x3dd7dff0ffff 64bit pref]
[    9.319414] pci_bus 0005:00: resource 4 [io  0x2860000-0x305ffff]
[    9.319436] pci_bus 0005:00: resource 5 [mem 0x3da580000000-0x3da5fffeffff]
[    9.319460] pci_bus 0005:00: resource 6 [mem 0x3dd000000000-0x3dd7dfffffff 64bit pref]
[    9.655176] pci_bus 0005:01: resource 0 [io  0x2860000-0x305ffff]
[    9.655199] pci_bus 0005:01: resource 1 [mem 0x3da580000000-0x3da5ffefffff]
[    9.655221] pci_bus 0005:01: resource 2 [mem 0x3dd000000000-0x3dd7dff0ffff 64bit pref]
[    9.655245] pci_bus 0000:00: Configuring PE for bus
[    9.655268] pci 0000:00     : [PE# 7e] Secondary bus 0x0000000000000000 associated with PE#7e
[    9.655304] pci 0000:00:00.0: Configured PE#7e
[    9.655410] pci_bus 0000:01: Configuring PE for bus
[    9.655435] pci 0000:01     : [PE# 7d] Secondary bus 0x0000000000000001 associated with PE#7d
[    9.655469] pci 0000:01:00.0: Configured PE#7d
[    9.655631] pci_bus 0000:02: Configuring PE for bus
[    9.655655] pci 0000:02     : [PE# 7c] Secondary bus 0x0000000000000002 associated with PE#7c
[    9.655689] pci 0000:02:04.0: Configured PE#7c
[    9.655833] pci 0000:02:05.0: Added to existing PE#7c
[    9.655999] pci 0000:02:06.0: Added to existing PE#7c
[    9.993364] pci 0000:02:08.0: Added to existing PE#7c
[    9.993517] pci 0000:02:09.0: Added to existing PE#7c
[    9.993674] pci_bus 0000:60: Configuring PE for bus
[    9.993700] pci 0000:60     : [PE# 01] Secondary bus 0x0000000000000060 associated with PE#1
[    9.993736] pci 0000:60:00.0: Configured PE#1
[    9.993775] pci 0000:60     : [PE# 01] DMA weight 15 (44), assigned (0) 2 DMA32 segments
[    9.993798] pci 0000:60     : [PE# 01]  Setting up 32-bit TCE table at 00000000..1fffffff
[   10.002693] IOMMU table initialized, virtual merging enabled
[   10.002790] pci 0000:60:00.0: Adding to iommu group 0
[   10.002936] pci_bus 0000:80: Configuring PE for bus
[   10.002961] pci 0000:80     : [PE# 7b] Secondary bus 0x0000000000000080 associated with PE#7b
[   10.002996] pci 0000:80:00.0: Configured PE#7b
[   10.003169] pci_bus 0000:90: Configuring PE for bus
[   10.003195] pci 0000:90     : [PE# 7a] Secondary bus 0x0000000000000090..0x000000000000009f associated with PE#7a
[   10.336537] pci 0000:90:01.0: Configured PE#7a
[   10.336573] pci 0000:90     : [PE# 7a] DMA weight 9 (44), assigned (2) 1 DMA32 segments
[   10.336597] pci 0000:90     : [PE# 7a]  Setting up 32-bit TCE table at 20000000..2fffffff
[   10.341072] pci 0000:90:01.0: Adding to iommu group 1
[   10.341211] pci 0000:90:01.1: Added to existing PE#7a
[   10.341237] pci 0000:90:01.1: Adding to iommu group 1
[   10.341368] pci 0000:90:01.2: Added to existing PE#7a
[   10.341393] pci 0000:90:01.2: Adding to iommu group 1
[   10.341550] pci_bus 0000:a0: Configuring PE for bus
[   10.341575] pci 0000:a0     : [PE# 79] Secondary bus 0x00000000000000a0 associated with PE#79
[   10.341615] pci 0000:a0:00.0: Configured PE#79
[   10.341649] pci 0000:a0     : [PE# 79] DMA weight 20 (44), assigned (3) 3 DMA32 segments
[   10.341673] pci 0000:a0     : [PE# 79]  Setting up 32-bit TCE table at 30000000..5fffffff
[   10.467396] watchdog: CPU 1 self-detected hard LOCKUP @ .do_idle+0x160/0x430
[   10.467397] watchdog: CPU 1 TB:43795760607, last heartbeat TB:38597076570 (10153ms ago)
[   10.467398] Modules linked in:
[   10.467400] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G        W         5.8.0-rc5+ #121
[   10.467401] NIP:  c0000000001a9ca0 LR: c0000000001a9ca0 CTR: c00000000022ede0
[   10.467402] REGS: c0000009ffee3d70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.467403] MSR:  9000000002009032 <SF,HV,VEC,EE,ME,IR,DR,RI>  CR: 24000228  XER: 00000000
[   10.467409] CFAR: c0000000008ec0b0 IRQMASK: 1 
[   10.467410] GPR00: c0000000001a9ca0 c00000096f73fd50 c000000001685e00 0000000000000001 
[   10.467414] GPR04: 0000000000000000 c000000976913e00 c0000009ffffee00 0000000000000002 
[   10.467417] GPR08: 0000000000000000 0000000000000000 0000000975a10000 c0000000016d25e0 
[   10.467420] GPR12: 0000000028000222 c0000009ffffee00 c0000009f33abf90 0000000000000000 
[   10.467423] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.467426] GPR20: 0000000000000000 c00000096f4e6c80 0000000000000001 0000000000080000 
[   10.467430] GPR24: c00000096f4e6c00 c00000096f4e6c80 c00000096f4e6c00 c0000000016d2640 
[   10.467433] GPR28: 0000000000000001 c00000096f4e6c00 0000000000000001 c0000000016d21e0 
[   10.467436] NIP [c0000000001a9ca0] .do_idle+0x160/0x430
[   10.467437] LR [c0000000001a9ca0] .do_idle+0x160/0x430
[   10.467437] Call Trace:
[   10.467438] [c00000096f73fd50] [c0000000001a9ca0] .do_idle+0x160/0x430 (unreliable)
[   10.467441] [c00000096f73fe40] [c0000000001aa1c4] .cpu_startup_entry+0x34/0x50
[   10.467442] [c00000096f73feb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.467444] [c00000096f73ff90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.467445] Instruction dump:
[   10.467446] 3d22ff90 39291e88 7e8a482a 7e83a378 48743541 60000000 e93d0080 71290004 
[   10.467450] 7c731b78 4082023c 7e84a378 487423b5 <60000000> 2c230000 408201e8 3d220005 
[   10.467654] watchdog: CPU 14 self-detected hard LOCKUP @ .default_idle_call+0x34/0x7c
[   10.467656] watchdog: CPU 14 TB:43795840431, last heartbeat TB:38599902767 (10148ms ago)
[   10.467657] Modules linked in:
[   10.467659] CPU: 14 PID: 0 Comm: swapper/14 Tainted: G        W         5.8.0-rc5+ #121
[   10.467661] NIP:  c000000000b57024 LR: c0000000001a9ea4 CTR: c00000000022ede0
[   10.467662] REGS: c0000009ffe47d70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.467663] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.467671] CFAR: c0000000001a9ea0 IRQMASK: 1 
[   10.467673] GPR00: c0000000001a9ea4 c00000096f75fce0 c000000001685e00 0000000000000000 
[   10.467678] GPR04: 0000000000000000 c000000977613e00 c0000009fffbe200 0000000000000808 
[   10.467682] GPR08: c00000096f4f6880 c00000096f4f6800 0000000000080000 0000000300000004 
[   10.467687] GPR12: 0000000024000222 c0000009fffbe200 c0000009f33dff90 0000000000000000 
[   10.467691] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.467695] GPR20: 0000000000000000 c00000096f4f6880 0000000000000001 0000000000080000 
[   10.467699] GPR24: c00000096f4f6800 c00000096f4f6880 c00000096f4f6800 c0000000016d2640 
[   10.467704] GPR28: 0000000000000001 c00000096f4f6800 000000000000000e c0000000016d21e0 
[   10.467709] NIP [c000000000b57024] .default_idle_call+0x34/0x7c
[   10.467710] LR [c0000000001a9ea4] .do_idle+0x364/0x430
[   10.467711] Call Trace:
[   10.467712] [c00000096f75fce0] [c000000000b57034] .default_idle_call+0x44/0x7c (unreliable)
[   10.467715] [c00000096f75fd50] [c0000000001a9ea4] .do_idle+0x364/0x430
[   10.467717] [c00000096f75fe40] [c0000000001aa1c0] .cpu_startup_entry+0x30/0x50
[   10.467719] [c00000096f75feb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.467721] [c00000096f75ff90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.467723] Instruction dump:
[   10.467724] f8010010 f821ff91 60000000 60000000 e92d0968 3d400008 39090080 7ce040a8 
[   10.467730] 7ce75078 7ce041ad 40c2fff4 7c0004ac <e9290080> 71290004 40820024 4b4c3f61 
[   10.467739] watchdog: CPU 21 self-detected hard LOCKUP @ .rcu_dynticks_eqs_enter+0x20/0x40
[   10.467741] watchdog: CPU 21 TB:43795873135, last heartbeat TB:38602037023 (10144ms ago)
[   10.467742] Modules linked in:
[   10.467744] CPU: 21 PID: 0 Comm: swapper/21 Tainted: G        W         5.8.0-rc5+ #121
[   10.467745] NIP:  c000000000b4f1b0 LR: c0000000001a9e9c CTR: c00000000022ede0
[   10.467747] REGS: c0000009ffdf3d70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.467748] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.467756] CFAR: c000000000b4f290 IRQMASK: 1 
[   10.467758] GPR00: c0000000001a9e9c c00000096f8d7d50 c000000001685e00 0000000000000000 
[   10.467762] GPR04: 0000000000000000 c000000977d13e00 c0000009fffb6300 0000000005c93f7e 
[   10.467767] GPR08: c000000977d9a0d8 c000000977d9a000 0000000000000002 0000000300000004 
[   10.467771] GPR12: 0000000024000222 c0000009fffb6300 c0000009f33fbf90 0000000000000000 
[   10.467775] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.467780] GPR20: 0000000000000000 c00000096f7f5680 0000000000000001 0000000000080000 
[   10.467784] GPR24: c00000096f7f5600 c00000096f7f5680 c00000096f7f5600 c0000000016d2640 
[   10.467788] GPR28: 0000000000000001 c00000096f7f5600 0000000000000015 c0000000016d21e0 
[   10.467793] NIP [c000000000b4f1b0] .rcu_dynticks_eqs_enter+0x20/0x40
[   10.467794] LR [c0000000001a9e9c] .do_idle+0x35c/0x430
[   10.467795] Call Trace:
[   10.467797] [c00000096f8d7d50] [c0000000001a9e9c] .do_idle+0x35c/0x430 (unreliable)
[   10.467799] [c00000096f8d7e40] [c0000000001aa1c0] .cpu_startup_entry+0x30/0x50
[   10.467802] [c00000096f8d7eb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.467804] [c00000096f8d7f90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.467805] Instruction dump:
[   10.467807] 7c0803a6 4e800020 60000000 60000000 e94d0030 3d22ff90 39294200 7d295214 
[   10.467813] 390900d8 7c0004ac 39400002 7ce04028 <7cea3a14> 7ce0412d 40c2fff4 7c0004ac 
[   10.467821] watchdog: CPU 5 self-detected hard LOCKUP @ .arch_cpu_idle+0xbc/0x180
[   10.467823] watchdog: CPU 5 TB:43795948815, last heartbeat TB:38597881014 (10152ms ago)
[   10.467824] Modules linked in:
[   10.467826] CPU: 5 PID: 0 Comm: swapper/5 Tainted: G        W         5.8.0-rc5+ #121
[   10.467828] NIP:  c00000000001b04c LR: c00000000001b034 CTR: c00000000022ede0
[   10.467829] REGS: c0000009ffeb3d70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.467830] MSR:  9000000002009032 <SF,HV,VEC,EE,ME,IR,DR,RI>  CR: 44000222  XER: 00000000
[   10.467838] CFAR: c00000000001aa10 IRQMASK: 1 
[   10.467840] GPR00: c000000000b57034 c00000096f77bc60 c000000001685e00 0000000000000000 
[   10.467845] GPR04: 0000000000000000 c000000976d13e00 c0000009fffc8400 0000000000000808 
[   10.467849] GPR08: c00000096f4e1280 0000000000008002 c00000096f4e1200 0000000000000400 
[   10.467854] GPR12: 0000000024000222 c0000009fffc8400 c0000009f33bbf90 0000000000000000 
[   10.467858] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.467862] GPR20: 0000000000000000 c00000096f4e1280 0000000000000001 0000000000080000 
[   10.467866] GPR24: c00000096f4e1200 c00000096f4e1280 c00000096f4e1200 c0000000016d2640 
[   10.467871] GPR28: 0000000000000001 c00000096f4e1200 0000000000000005 9000000002009032 
[   10.467876] NIP [c00000000001b04c] .arch_cpu_idle+0xbc/0x180
[   10.467877] LR [c00000000001b034] .arch_cpu_idle+0xa4/0x180
[   10.467878] Call Trace:
[   10.467879] [c00000096f77bc60] [c000000000015d50] .arch_local_irq_restore+0x40/0x90 (unreliable)
[   10.467882] [c00000096f77bce0] [c000000000b57034] .default_idle_call+0x44/0x7c
[   10.467884] [c00000096f77bd50] [c0000000001a9ea4] .do_idle+0x364/0x430
[   10.467886] [c00000096f77be40] [c0000000001aa1c4] .cpu_startup_entry+0x34/0x50
[   10.467888] [c00000096f77beb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.467890] [c00000096f77bf90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.467892] Instruction dump:
[   10.467893] 60000000 fbe10078 7fe000a6 39200002 7d210164 4bfff9c1 60000000 73e98000 
[   10.467899] 418200c4 39200000 61298002 7d210164 <3d22000d> ebe10078 3929a380 e9290160 
[   10.468246] watchdog: CPU 22 self-detected hard LOCKUP @ .rcu_dynticks_eqs_enter+0x18/0x40
[   10.468248] watchdog: CPU 22 TB:43796195097, last heartbeat TB:38602406031 (10144ms ago)
[   10.468249] Modules linked in:
[   10.468251] CPU: 22 PID: 0 Comm: swapper/22 Tainted: G        W         5.8.0-rc5+ #121
[   10.468252] NIP:  c000000000b4f1a8 LR: c0000000001a9e9c CTR: c00000000022ede0
[   10.468254] REGS: c0000009ffde7d70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.468255] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.468262] CFAR: c000000000b4f290 IRQMASK: 1 
[   10.468264] GPR00: c0000000001a9e9c c00000096f893d50 c000000001685e00 0000000000000000 
[   10.468268] GPR04: 0000000000000000 c000000977e13e00 c0000009fffb5080 0000000000000000 
[   10.468272] GPR08: c000000977e9a0d8 c000000977e9a000 0000000976f10000 c0000000016d25e0 
[   10.468277] GPR12: 0000000024000228 c0000009fffb5080 c0000009f33fff90 0000000000000000 
[   10.468281] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.468285] GPR20: 0000000000000000 c00000096f7f3280 0000000000000001 0000000000080000 
[   10.468290] GPR24: c00000096f7f3200 c00000096f7f3280 c00000096f7f3200 c0000000016d2640 
[   10.468294] GPR28: 0000000000000001 c00000096f7f3200 0000000000000016 c0000000016d21e0 
[   10.468299] NIP [c000000000b4f1a8] .rcu_dynticks_eqs_enter+0x18/0x40
[   10.468300] LR [c0000000001a9e9c] .do_idle+0x35c/0x430
[   10.468301] Call Trace:
[   10.468302] [c00000096f893d50] [c0000000001a9e9c] .do_idle+0x35c/0x430 (unreliable)
[   10.468304] [c00000096f893e40] [c0000000001aa1c0] .cpu_startup_entry+0x30/0x50
[   10.468306] [c00000096f893eb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.468308] [c00000096f893f90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.468310] Instruction dump:
[   10.468311] 38210070 e8010010 7c0803a6 4e800020 60000000 60000000 e94d0030 3d22ff90 
[   10.468317] 39294200 7d295214 390900d8 7c0004ac <39400002> 7ce04028 7cea3a14 7ce0412d 
[   10.468570] watchdog: CPU 7 self-detected hard LOCKUP @ .tick_nohz_idle_stop_tick+0x7c/0x380
[   10.468571] watchdog: CPU 7 TB:43796359220, last heartbeat TB:38598288559 (10152ms ago)
[   10.468572] Modules linked in:
[   10.468575] CPU: 7 PID: 0 Comm: swapper/7 Tainted: G        W         5.8.0-rc5+ #121
[   10.468576] NIP:  c00000000023ff6c LR: c0000000002400b0 CTR: c00000000022ede0
[   10.468578] REGS: c0000009ffe9bd70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.468578] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.468586] CFAR: c0000000002400b4 IRQMASK: 1 
[   10.468588] GPR00: c0000000001a9e94 c00000096f76fd50 c000000001685e00 0000000000000000 
[   10.468592] GPR04: 0000000000000000 c000000976f13e00 c0000009fffc6000 0000000000000002 
[   10.468596] GPR08: 0000000000000007 0000000000000001 0000000000000000 c0000000016d25e0 
[   10.468601] GPR12: 0000000024000228 c0000009fffc6000 c0000009f33c3f90 0000000000000000 
[   10.468605] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.468609] GPR20: 0000000000000000 c00000096f4efc80 0000000000000001 0000000000080000 
[   10.468613] GPR24: c00000096f4efc00 c00000096f4efc80 c00000096f4efc00 c0000000016d2640 
[   10.468618] GPR28: 0000000000000001 c00000096f4efc00 0000000000000007 c000000976f13da8 
[   10.468623] NIP [c00000000023ff6c] .tick_nohz_idle_stop_tick+0x7c/0x380
[   10.468624] LR [c0000000002400b0] .tick_nohz_idle_stop_tick+0x1c0/0x380
[   10.468625] Call Trace:
[   10.468626] [c00000096f76fd50] [c0000000001a9e94] .do_idle+0x354/0x430 (unreliable)
[   10.468629] [c00000096f76fe40] [c0000000001aa1c4] .cpu_startup_entry+0x34/0x50
[   10.468631] [c00000096f76feb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.468633] [c00000096f76ff90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.468635] Instruction dump:
[   10.468636] e93f0068 2c3d0000 39290001 f93f0068 41810034 39200000 f93f00b0 382100b0 
[   10.468642] e8010010 eb61ffd8 eba1ffe8 ebc1fff0 <7c0803a6> ebe1fff8 4e800020 60000000 
[   10.468713] watchdog: CPU 16 self-detected hard LOCKUP @ .arch_cpu_idle+0xbc/0x180
[   10.468715] watchdog: CPU 16 TB:43796424321, last heartbeat TB:38600458207 (10148ms ago)
[   10.468716] Modules linked in:
[   10.468718] CPU: 16 PID: 0 Comm: swapper/16 Tainted: G        W         5.8.0-rc5+ #121
[   10.468720] NIP:  c00000000001b04c LR: c00000000001b034 CTR: c00000000022ede0
[   10.468721] REGS: c0000009ffe2fd70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.468722] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 44000222  XER: 00000000
[   10.468730] CFAR: c00000000001aa10 IRQMASK: 1 
[   10.468732] GPR00: c000000000b57034 c00000096f713c60 c000000001685e00 0000000000000000 
[   10.468737] GPR04: 0000000000000000 c000000977813e00 c0000009fffbbe00 0000000000000808 
[   10.468741] GPR08: c00000096f4f4480 0000000000008002 c00000096f4f4400 0000000300000004 
[   10.468745] GPR12: 0000000024000222 c0000009fffbbe00 c0000009f33e7f90 0000000000000000 
[   10.468750] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.468754] GPR20: 0000000000000000 c00000096f4f4480 0000000000000001 0000000000080000 
[   10.468758] GPR24: c00000096f4f4400 c00000096f4f4480 c00000096f4f4400 c0000000016d2640 
[   10.468762] GPR28: 0000000000000001 c00000096f4f4400 0000000000000010 9000000000009032 
[   10.468767] NIP [c00000000001b04c] .arch_cpu_idle+0xbc/0x180
[   10.468768] LR [c00000000001b034] .arch_cpu_idle+0xa4/0x180
[   10.468769] Call Trace:
[   10.468770] [c00000096f713c60] [c00000000001b078] .arch_cpu_idle+0xe8/0x180 (unreliable)
[   10.468773] [c00000096f713ce0] [c000000000b57034] .default_idle_call+0x44/0x7c
[   10.468775] [c00000096f713d50] [c0000000001a9ea4] .do_idle+0x364/0x430
[   10.468777] [c00000096f713e40] [c0000000001aa1c4] .cpu_startup_entry+0x34/0x50
[   10.468779] [c00000096f713eb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.468781] [c00000096f713f90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.468783] Instruction dump:
[   10.468785] 60000000 fbe10078 7fe000a6 39200002 7d210164 4bfff9c1 60000000 73e98000 
[   10.468791] 418200c4 39200000 61298002 7d210164 <3d22000d> ebe10078 3929a380 e9290160 
[   10.468969] watchdog: CPU 23 self-detected hard LOCKUP @ .rcu_dynticks_eqs_enter+0x28/0x40
[   10.468971] watchdog: CPU 23 TB:43796565478, last heartbeat TB:38602834490 (10144ms ago)
[   10.468972] Modules linked in:
[   10.468974] CPU: 23 PID: 0 Comm: swapper/23 Tainted: G        W         5.8.0-rc5+ #121
[   10.468975] NIP:  c000000000b4f1b8 LR: c0000000001a9e9c CTR: c00000000022ede0
[   10.468977] REGS: c0000009ffddbd70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.468977] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.468984] CFAR: c000000000b4f290 IRQMASK: 1 
[   10.468987] GPR00: c0000000001a9e9c c00000096f8e7d50 c000000001685e00 0000000000000000 
[   10.468991] GPR04: 0000000000000000 c000000977f13e00 c0000009fffb3e00 0000000005cc52c4 
[   10.468995] GPR08: c000000977f9a0d8 c000000977f9a000 0000000000000002 c0000000016d25e0 
[   10.468999] GPR12: 0000000024000228 c0000009fffb3e00 c0000009f3403f90 0000000000000000 
[   10.469004] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.469008] GPR20: 0000000000000000 c00000096f7e4880 0000000000000001 0000000000080000 
[   10.469012] GPR24: c00000096f7e4800 c00000096f7e4880 c00000096f7e4800 c0000000016d2640 
[   10.469017] GPR28: 0000000000000001 c00000096f7e4800 0000000000000017 c0000000016d21e0 
[   10.469022] NIP [c000000000b4f1b8] .rcu_dynticks_eqs_enter+0x28/0x40
[   10.469023] LR [c0000000001a9e9c] .do_idle+0x35c/0x430
[   10.469023] Call Trace:
[   10.469025] [c00000096f8e7d50] [c0000000001a9e9c] .do_idle+0x35c/0x430 (unreliable)
[   10.469027] [c00000096f8e7e40] [c0000000001aa1c0] .cpu_startup_entry+0x30/0x50
[   10.469029] [c00000096f8e7eb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.469031] [c00000096f8e7f90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.469033] Instruction dump:
[   10.469034] 60000000 60000000 e94d0030 3d22ff90 39294200 7d295214 390900d8 7c0004ac 
[   10.469040] 39400002 7ce04028 7cea3a14 7ce0412d <40c2fff4> 7c0004ac 4e800020 60000000 
[   10.469361] watchdog: CPU 9 self-detected hard LOCKUP @ .cpuidle_get_cpu_driver+0x0/0x50
[   10.469363] watchdog: CPU 9 TB:43796759103, last heartbeat TB:38598696828 (10152ms ago)
[   10.469364] Modules linked in:
[   10.469366] CPU: 9 PID: 0 Comm: swapper/9 Tainted: G        W         5.8.0-rc5+ #121
[   10.469368] NIP:  c0000000008ed1c0 LR: c0000000001a9c84 CTR: c00000000022ede0
[   10.469369] REGS: c0000009ffe83d70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.469370] MSR:  9000000002009032 <SF,HV,VEC,EE,ME,IR,DR,RI>  CR: 24000228  XER: 00000000
[   10.469379] CFAR: c0000000001a9c80 IRQMASK: 1 
[   10.469381] GPR00: c0000000001a9c60 c00000096f707d50 c000000001685e00 0000000000000000 
[   10.469385] GPR04: 0000000000000000 c000000977113e00 c0000009fffc3c00 0000000000000002 
[   10.469390] GPR08: 0000000000000000 c000000000f87c88 0000000976210000 c0000000016d25e0 
[   10.469394] GPR12: 0000000024000222 c0000009fffc3c00 c0000009f33cbf90 0000000000000000 
[   10.469399] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.469403] GPR20: 0000000000000000 c00000096f4f8c80 0000000000000001 0000000000080000 
[   10.469407] GPR24: c00000096f4f8c00 c00000096f4f8c80 c00000096f4f8c00 c0000000016d2640 
[   10.469412] GPR28: 0000000000000001 c00000096f4f8c00 0000000000000009 c0000000016d21e0 
[   10.469416] NIP [c0000000008ed1c0] .cpuidle_get_cpu_driver+0x0/0x50
[   10.469418] LR [c0000000001a9c84] .do_idle+0x144/0x430
[   10.469418] Call Trace:
[   10.469420] [c00000096f707d50] [c0000000001a9c60] .do_idle+0x120/0x430 (unreliable)
[   10.469422] [c00000096f707e40] [c0000000001aa1c0] .cpu_startup_entry+0x30/0x50
[   10.469425] [c00000096f707eb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.469427] [c00000096f707f90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.469428] Instruction dump:
[   10.469430] 7c0802a6 f8010010 f821ff91 60000000 60000000 3d22001f e8695430 38210070 
[   10.469436] e8010010 7c0803a6 4e800020 60000000 <7c0802a6> fbe1fff8 7c7f1b78 f8010010 
[   10.469737] watchdog: CPU 18 self-detected hard LOCKUP @ .can_stop_idle_tick.isra.0+0xb0/0x180
[   10.469739] watchdog: CPU 18 TB:43796953071, last heartbeat TB:38601049744 (10148ms ago)
[   10.469740] Modules linked in:
[   10.469742] CPU: 18 PID: 0 Comm: swapper/18 Tainted: G        W         5.8.0-rc5+ #121
[   10.469743] NIP:  c00000000023f720 LR: c0000000002400b0 CTR: c00000000022ede0
[   10.469745] REGS: c0000009ffe17d70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.469746] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.469753] CFAR: c00000000023f6c4 IRQMASK: 1 
[   10.469755] GPR00: c0000000002400b0 c00000096f763c10 c000000001685e00 0000000000000012 
[   10.469759] GPR04: 0000000000000000 c000000977a13e00 c0000009fffb9a00 0000000000000002 
[   10.469764] GPR08: 0000000000000012 0000000000000001 0000000000000000 c0000000016d25e0 
[   10.469768] GPR12: 0000000024000228 c0000009fffb9a00 c0000009f33eff90 0000000000000000 
[   10.469772] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.469777] GPR20: 0000000000000000 c00000096f7fd480 0000000000000001 0000000000080000 
[   10.469781] GPR24: c00000096f7fd400 c00000096f7fd480 c00000096f7fd400 0000000000000012 
[   10.469785] GPR28: 0000000000000001 c000000977a13e00 0000000000000012 0000000000000000 
[   10.469790] NIP [c00000000023f720] .can_stop_idle_tick.isra.0+0xb0/0x180
[   10.469792] LR [c0000000002400b0] .tick_nohz_idle_stop_tick+0x1c0/0x380
[   10.469792] Call Trace:
[   10.469794] [c00000096f763c10] [c00000096f7fd400] 0xc00000096f7fd400 (unreliable)
[   10.469796] [c00000096f763ca0] [c0000000002400b0] .tick_nohz_idle_stop_tick+0x1c0/0x380
[   10.469798] [c00000096f763d50] [c0000000001a9e94] .do_idle+0x354/0x430
[   10.469800] [c00000096f763e40] [c0000000001aa1c4] .cpu_startup_entry+0x34/0x50
[   10.469802] [c00000096f763eb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.469805] [c00000096f763f90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.469806] Instruction dump:
[   10.469807] 408200b0 38210090 7fe3fb78 e8010010 eba1ffe8 ebc1fff0 ebe1fff8 7c0803a6 
[   10.469813] 4e800020 60000000 60000000 60000000 <38210090> 3be00000 e8010010 7fe3fb78 
[   10.470348] watchdog: CPU 15 self-detected hard LOCKUP @ .default_idle_call+0x34/0x7c
[   10.470350] watchdog: CPU 15 TB:43797226921, last heartbeat TB:38600195247 (10150ms ago)
[   10.470351] Modules linked in:
[   10.470353] CPU: 15 PID: 0 Comm: swapper/15 Tainted: G        W         5.8.0-rc5+ #121
[   10.470355] NIP:  c000000000b57024 LR: c0000000001a9ea4 CTR: c00000000022ede0
[   10.470356] REGS: c0000009ffe3bd70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.470357] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.470364] CFAR: c0000000001a9ea0 IRQMASK: 1 
[   10.470366] GPR00: c0000000001a9ea4 c00000096f757ce0 c000000001685e00 0000000000000000 
[   10.470371] GPR04: 0000000000000000 c000000977713e00 c0000009fffbd000 0000000000000808 
[   10.470375] GPR08: c00000096f4fe680 c00000096f4fe600 0000000000080000 c0000000016d25e0 
[   10.470379] GPR12: 0000000024000228 c0000009fffbd000 c0000009f33e3f90 0000000000000000 
[   10.470383] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.470388] GPR20: 0000000000000000 c00000096f4fe680 0000000000000001 0000000000080000 
[   10.470392] GPR24: c00000096f4fe600 c00000096f4fe680 c00000096f4fe600 c0000000016d2640 
[   10.470396] GPR28: 0000000000000001 c00000096f4fe600 000000000000000f c0000000016d21e0 
[   10.470401] NIP [c000000000b57024] .default_idle_call+0x34/0x7c
[   10.470402] LR [c0000000001a9ea4] .do_idle+0x364/0x430
[   10.470403] Call Trace:
[   10.470404] [c00000096f757ce0] [c000000000b57034] .default_idle_call+0x44/0x7c (unreliable)
[   10.470407] [c00000096f757d50] [c0000000001a9ea4] .do_idle+0x364/0x430
[   10.470409] [c00000096f757e40] [c0000000001aa1c4] .cpu_startup_entry+0x34/0x50
[   10.470411] [c00000096f757eb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.470413] [c00000096f757f90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.470415] Instruction dump:
[   10.470416] f8010010 f821ff91 60000000 60000000 e92d0968 3d400008 39090080 7ce040a8 
[   10.470422] 7ce75078 7ce041ad 40c2fff4 7c0004ac <e9290080> 71290004 40820024 4b4c3f61 
[   10.470430] watchdog: CPU 19 self-detected hard LOCKUP @ .arch_cpu_idle+0xbc/0x180
[   10.470431] watchdog: CPU 19 TB:43797259903, last heartbeat TB:38601405818 (10148ms ago)
[   10.470432] Modules linked in:
[   10.470434] CPU: 19 PID: 0 Comm: swapper/19 Tainted: G        W         5.8.0-rc5+ #121
[   10.470436] NIP:  c00000000001b04c LR: c00000000001b034 CTR: c00000000022ede0
[   10.470437] REGS: c0000009ffe0bd70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.470438] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 44000222  XER: 00000000
[   10.470445] CFAR: c00000000001aa10 IRQMASK: 1 
[   10.470447] GPR00: c000000000b57034 c00000096f727c60 c000000001685e00 0000000000000000 
[   10.470451] GPR04: 0000000000000000 c000000977b13e00 c0000009fffb8800 0000000000000808 
[   10.470456] GPR08: c00000096f7f0e80 0000000000008002 c00000096f7f0e00 c0000000016d25e0 
[   10.470460] GPR12: 0000000024000228 c0000009fffb8800 c0000009f33f3f90 0000000000000000 
[   10.470465] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.470469] GPR20: 0000000000000000 c00000096f7f0e80 0000000000000001 0000000000080000 
[   10.470473] GPR24: c00000096f7f0e00 c00000096f7f0e80 c00000096f7f0e00 c0000000016d2640 
[   10.470477] GPR28: 0000000000000001 c00000096f7f0e00 0000000000000013 9000000000009032 
[   10.470482] NIP [c00000000001b04c] .arch_cpu_idle+0xbc/0x180
[   10.470483] LR [c00000000001b034] .arch_cpu_idle+0xa4/0x180
[   10.470484] Call Trace:
[   10.470485] [c00000096f727c60] [c00000000001b078] .arch_cpu_idle+0xe8/0x180 (unreliable)
[   10.470488] [c00000096f727ce0] [c000000000b57034] .default_idle_call+0x44/0x7c
[   10.470490] [c00000096f727d50] [c0000000001a9ea4] .do_idle+0x364/0x430
[   10.470492] [c00000096f727e40] [c0000000001aa1c0] .cpu_startup_entry+0x30/0x50
[   10.470494] [c00000096f727eb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.470496] [c00000096f727f90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.470498] Instruction dump:
[   10.470499] 60000000 fbe10078 7fe000a6 39200002 7d210164 4bfff9c1 60000000 73e98000 
[   10.470505] 418200c4 39200000 61298002 7d210164 <3d22000d> ebe10078 3929a380 e9290160 
[   10.470512] watchdog: CPU 2 self-detected hard LOCKUP @ .rcu_dynticks_eqs_exit+0x30/0x60
[   10.470514] watchdog: CPU 2 TB:43797357106, last heartbeat TB:38597257076 (10156ms ago)
[   10.470514] Modules linked in:
[   10.470516] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G        W         5.8.0-rc5+ #121
[   10.470517] NIP:  c000000000b4f200 LR: c000000000b4f2fc CTR: c00000000022ede0
[   10.470519] REGS: c0000009ffed7d70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.470519] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.470525] CFAR: c000000000b4f2f8 IRQMASK: 1 
[   10.470527] GPR00: c000000000214d98 c00000096f717c50 c000000001685e00 0000000000000000 
[   10.470531] GPR04: 0000000000000000 c000000976a13e00 c0000009ffffdb80 0000000000000002 
[   10.470534] GPR08: 000000000660a136 c000000976a9a000 c000000976a9a0d8 0000000000000400 
[   10.470538] GPR12: 0000000024000228 c0000009ffffdb80 c0000009f33aff90 0000000000000000 
[   10.470542] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.470545] GPR20: 0000000000000000 c00000096f4eea80 0000000000000001 0000000000080000 
[   10.470549] GPR24: c00000096f4eea00 c00000096f4eea80 c00000096f4eea00 c0000000016d2640 
[   10.470552] GPR28: 0000000000000001 c00000096f4eea00 0000000000000002 c000000976a9a000 
[   10.470557] NIP [c000000000b4f200] .rcu_dynticks_eqs_exit+0x30/0x60
[   10.470558] LR [c000000000b4f2fc] .rcu_eqs_exit.isra.0+0x4c/0xa0
[   10.470558] Call Trace:
[   10.470559] [c00000096f717c50] [c00000096f717ce0] 0xc00000096f717ce0 (unreliable)
[   10.470561] [c00000096f717cd0] [c000000000214d98] .rcu_idle_exit+0x28/0x50
[   10.470563] [c00000096f717d50] [c0000000001a9d20] .do_idle+0x1e0/0x430
[   10.470565] [c00000096f717e40] [c0000000001aa1c4] .cpu_startup_entry+0x34/0x50
[   10.470567] [c00000096f717eb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.470569] [c00000096f717f90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.470570] Instruction dump:
[   10.470571] e94d0030 3d22ff90 39294200 7d295214 394900d8 7c0004ac 38e00002 7d005028 
[   10.470576] 7d074214 7d00512d 40c2fff4 7c0004ac <71080001> 4d820020 3900fffe 7ce05028 
[   10.470661] watchdog: CPU 12 self-detected hard LOCKUP @ .tick_check_broadcast_expired+0x24/0x50
[   10.470662] watchdog: CPU 12 TB:43797430562, last heartbeat TB:38599394684 (10152ms ago)
[   10.470663] Modules linked in:
[   10.470665] CPU: 12 PID: 0 Comm: swapper/12 Tainted: G        W         5.8.0-rc5+ #121
[   10.470667] NIP:  c00000000023e564 LR: c0000000001a9c60 CTR: c00000000022ede0
[   10.470668] REGS: c0000009ffe5fd70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.470669] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.470676] CFAR: c0000000001a9c5c IRQMASK: 1 
[   10.470678] GPR00: c0000000001a9c60 c00000096f77fd50 c000000001685e00 000000000000000c 
[   10.470682] GPR04: 0000000000000000 c000000977413e00 c0000009fffc0600 0000000000000002 
[   10.470686] GPR08: 0000000000000000 0000000000000000 c0000000017c8a80 0000000000000400 
[   10.470691] GPR12: 0000000024000222 c0000009fffc0600 c0000009f33d7f90 0000000000000000 
[   10.470695] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.470699] GPR20: 0000000000000000 c00000096f4eb480 0000000000000001 0000000000080000 
[   10.470703] GPR24: c00000096f4eb400 c00000096f4eb480 c00000096f4eb400 c0000000016d2640 
[   10.470708] GPR28: 0000000000000001 c00000096f4eb400 000000000000000c c0000000016d21e0 
[   10.470713] NIP [c00000000023e564] .tick_check_broadcast_expired+0x24/0x50
[   10.470714] LR [c0000000001a9c60] .do_idle+0x120/0x430
[   10.470715] Call Trace:
[   10.470716] [c00000096f77fd50] [c0000000001a9c60] .do_idle+0x120/0x430 (unreliable)
[   10.470719] [c00000096f77fe40] [c0000000001aa1c0] .cpu_startup_entry+0x30/0x50
[   10.470721] [c00000096f77feb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.470723] [c00000096f77ff90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.470724] Instruction dump:
[   10.470726] 7c0803a6 4e800020 60000000 7c0802a6 f8010010 f821ff91 60000000 60000000 
[   10.470731] 3d420014 394a2c80 a06d000a 38210070 <e8010010> 5469ecf8 546306be 7c0803a6 
[   10.470901] watchdog: CPU 3 self-detected hard LOCKUP @ .rcu_dynticks_eqs_exit+0x18/0x60
[   10.470902] watchdog: CPU 3 TB:43797557615, last heartbeat TB:38597462127 (10156ms ago)
[   10.470903] Modules linked in:
[   10.470905] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G        W         5.8.0-rc5+ #121
[   10.470906] NIP:  c000000000b4f1e8 LR: c000000000b4f2fc CTR: c00000000022ede0
[   10.470907] REGS: c0000009ffecbd70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.470908] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.470914] CFAR: c000000000b4f2f8 IRQMASK: 1 
[   10.470916] GPR00: c000000000214d98 c00000096f723c50 c000000001685e00 0000000000000000 
[   10.470920] GPR04: 0000000000000000 c000000976b13e00 c0000009ffffc900 0000000000000808 
[   10.470923] GPR08: c00000096f4e2480 c000000976b9a000 c000000976b9a0d8 c0000000016d25e0 
[   10.470927] GPR12: 0000000024000228 c0000009ffffc900 c0000009f33b3f90 0000000000000000 
[   10.470931] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.470934] GPR20: 0000000000000000 c00000096f4e2480 0000000000000001 0000000000080000 
[   10.470938] GPR24: c00000096f4e2400 c00000096f4e2480 c00000096f4e2400 c0000000016d2640 
[   10.470942] GPR28: 0000000000000001 c00000096f4e2400 0000000000000003 c000000976b9a000 
[   10.470946] NIP [c000000000b4f1e8] .rcu_dynticks_eqs_exit+0x18/0x60
[   10.470947] LR [c000000000b4f2fc] .rcu_eqs_exit.isra.0+0x4c/0xa0
[   10.470948] Call Trace:
[   10.470949] [c00000096f723c50] [c00000096f723ce0] 0xc00000096f723ce0 (unreliable)
[   10.470951] [c00000096f723cd0] [c000000000214d98] .rcu_idle_exit+0x28/0x50
[   10.470953] [c00000096f723d50] [c0000000001a9d20] .do_idle+0x1e0/0x430
[   10.470954] [c00000096f723e40] [c0000000001aa1c4] .cpu_startup_entry+0x34/0x50
[   10.470956] [c00000096f723eb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.470958] [c00000096f723f90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.470959] Instruction dump:
[   10.470960] 40c2fff4 7c0004ac 4e800020 60000000 60000000 60000000 e94d0030 3d22ff90 
[   10.470965] 39294200 7d295214 394900d8 7c0004ac <38e00002> 7d005028 7d074214 7d00512d 
[   10.471123] watchdog: CPU 13 self-detected hard LOCKUP @ .arch_cpu_idle+0xbc/0x180
[   10.471125] watchdog: CPU 13 TB:43797663816, last heartbeat TB:38599633583 (10152ms ago)
[   10.471125] Modules linked in:
[   10.471128] CPU: 13 PID: 0 Comm: swapper/13 Tainted: G        W         5.8.0-rc5+ #121
[   10.471129] NIP:  c00000000001b04c LR: c00000000001b034 CTR: c00000000022ede0
[   10.471130] REGS: c0000009ffe53d70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.471131] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 44000228  XER: 00000000
[   10.471138] CFAR: c00000000001aa10 IRQMASK: 1 
[   10.471141] GPR00: c000000000b57034 c00000096f72bc60 c000000001685e00 0000000000000000 
[   10.471145] GPR04: 0000000000000000 c000000977513e00 c0000009fffbf400 0000000000000808 
[   10.471149] GPR08: c00000096f4f2080 0000000000008002 c00000096f4f2000 c0000000016d25e0 
[   10.471154] GPR12: 0000000024000222 c0000009fffbf400 c0000009f33dbf90 0000000000000000 
[   10.471158] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.471162] GPR20: 0000000000000000 c00000096f4f2080 0000000000000001 0000000000080000 
[   10.471167] GPR24: c00000096f4f2000 c00000096f4f2080 c00000096f4f2000 c0000000016d2640 
[   10.471171] GPR28: 0000000000000001 c00000096f4f2000 000000000000000d 9000000000009032 
[   10.471176] NIP [c00000000001b04c] .arch_cpu_idle+0xbc/0x180
[   10.471177] LR [c00000000001b034] .arch_cpu_idle+0xa4/0x180
[   10.471178] Call Trace:
[   10.471179] [c00000096f72bc60] [c00000000001b078] .arch_cpu_idle+0xe8/0x180 (unreliable)
[   10.471182] [c00000096f72bce0] [c000000000b57034] .default_idle_call+0x44/0x7c
[   10.471184] [c00000096f72bd50] [c0000000001a9ea4] .do_idle+0x364/0x430
[   10.471186] [c00000096f72be40] [c0000000001aa1c0] .cpu_startup_entry+0x30/0x50
[   10.471188] [c00000096f72beb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.471190] [c00000096f72bf90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.471191] Instruction dump:
[   10.471193] 60000000 fbe10078 7fe000a6 39200002 7d210164 4bfff9c1 60000000 73e98000 
[   10.471199] 418200c4 39200000 61298002 7d210164 <3d22000d> ebe10078 3929a380 e9290160 
[   10.655385] watchdog: CPU 4 self-detected hard LOCKUP @ .cpuidle_get_cpu_driver+0x10/0x50
[   10.655386] watchdog: CPU 4 TB:43892009279, last heartbeat TB:38597670672 (10340ms ago)
[   10.655387] Modules linked in:
[   10.655389] CPU: 4 PID: 0 Comm: swapper/4 Tainted: G        W         5.8.0-rc5+ #121
[   10.655391] NIP:  c0000000008ed1d0 LR: c0000000001a9c84 CTR: c00000000022ede0
[   10.655392] REGS: c0000009ffebfd70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.655393] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 28000222  XER: 00000000
[   10.655400] CFAR: c0000000001a9c80 IRQMASK: 1 
[   10.655402] GPR00: c0000000001a9c84 c00000096f76bd50 c000000001685e00 0000000000000000 
[   10.655407] GPR04: 0000000000000000 c000000976c13e00 c0000009fffc9600 0000000000000002 
[   10.655411] GPR08: 0000000000000000 c000000000f87c88 0000000975d10000 0000000300000004 
[   10.655415] GPR12: 0000000024000222 c0000009fffc9600 c0000009f33b7f90 0000000000000000 
[   10.655420] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.655424] GPR20: 0000000000000000 c00000096f4ed880 0000000000000001 0000000000080000 
[   10.655428] GPR24: c00000096f4ed800 c00000096f4ed880 c00000096f4ed800 c0000000016d2640 
[   10.655432] GPR28: 0000000000000001 c00000096f4ed800 0000000000000004 0000000000000000 
[   10.655438] NIP [c0000000008ed1d0] .cpuidle_get_cpu_driver+0x10/0x50
[   10.655439] LR [c0000000001a9c84] .do_idle+0x144/0x430
[   10.655440] Call Trace:
[   10.655441] [c00000096f76bd50] [c0000000001a9c84] .do_idle+0x144/0x430 (unreliable)
[   10.655443] [c00000096f76be40] [c0000000001aa1c4] .cpu_startup_entry+0x34/0x50
[   10.655445] [c00000096f76beb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.655447] [c00000096f76bf90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.655449] Instruction dump:
[   10.655450] 60000000 3d22001f e8695430 38210070 e8010010 7c0803a6 4e800020 60000000 
[   10.655456] 7c0802a6 fbe1fff8 7c7f1b78 f8010010 <f821ff81> 60000000 60000000 2c3f0000 
[   10.656189] watchdog: CPU 6 self-detected hard LOCKUP @ .default_idle_call+0x2c/0x7c
[   10.656190] watchdog: CPU 6 TB:43892420592, last heartbeat TB:38598082863 (10340ms ago)
[   10.656191] Modules linked in:
[   10.656193] CPU: 6 PID: 0 Comm: swapper/6 Tainted: G        W         5.8.0-rc5+ #121
[   10.656195] NIP:  c000000000b5701c LR: c0000000001a9ea4 CTR: c00000000022ede0
[   10.656196] REGS: c0000009ffea7d70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.656197] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.656204] CFAR: c0000000001a9ea0 IRQMASK: 1 
[   10.656206] GPR00: c0000000001a9ea4 c00000096f777ce0 c000000001685e00 0000000000000000 
[   10.656210] GPR04: 0000000000000000 c000000976e13e00 c0000009fffc7200 0000000000000808 
[   10.656215] GPR08: c00000096f4f9e80 c00000096f4f9e00 0000000000080000 c0000000016d25e0 
[   10.656219] GPR12: 0000000024000228 c0000009fffc7200 c0000009f33bff90 0000000000000000 
[   10.656223] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.656227] GPR20: 0000000000000000 c00000096f4f9e80 0000000000000001 0000000000080000 
[   10.656232] GPR24: c00000096f4f9e00 c00000096f4f9e80 c00000096f4f9e00 c0000000016d2640 
[   10.656236] GPR28: 0000000000000001 c00000096f4f9e00 0000000000000006 c0000000016d21e0 
[   10.656241] NIP [c000000000b5701c] .default_idle_call+0x2c/0x7c
[   10.656242] LR [c0000000001a9ea4] .do_idle+0x364/0x430
[   10.656243] Call Trace:
[   10.656244] [c00000096f777ce0] [c000000000b57034] .default_idle_call+0x44/0x7c (unreliable)
[   10.656247] [c00000096f777d50] [c0000000001a9ea4] .do_idle+0x364/0x430
[   10.656249] [c00000096f777e40] [c0000000001aa1c0] .cpu_startup_entry+0x30/0x50
[   10.656251] [c00000096f777eb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.656253] [c00000096f777f90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.656255] Instruction dump:
[   10.656256] 60000000 7c0802a6 f8010010 f821ff91 60000000 60000000 e92d0968 3d400008 
[   10.656262] 39090080 7ce040a8 7ce75078 7ce041ad <40c2fff4> 7c0004ac e9290080 71290004 
[   10.657746] watchdog: CPU 10 self-detected hard LOCKUP @ .rcu_eqs_enter.isra.0+0x58/0x80
[   10.657748] watchdog: CPU 10 TB:43893218388, last heartbeat TB:38598918623 (10340ms ago)
[   10.657749] Modules linked in:
[   10.657751] CPU: 10 PID: 0 Comm: swapper/10 Tainted: G        W         5.8.0-rc5+ #121
[   10.657753] NIP:  c000000000b4f288 LR: c0000000001a9e9c CTR: c00000000022ede0
[   10.657754] REGS: c0000009ffe77d70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.657755] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.657762] CFAR: c000000000b4f26c IRQMASK: 1 
[   10.657764] GPR00: c0000000001a9e9c c00000096f72fd50 c000000001685e00 0000000000000000 
[   10.657769] GPR04: 0000000000000000 c000000977213e00 c0000009fffc2a00 0000000000000000 
[   10.657773] GPR08: 0000000000000001 0000000976310000 c000000000f8a000 0000000300000004 
[   10.657777] GPR12: 0000000024000222 c0000009fffc2a00 c0000009f33cff90 0000000000000000 
[   10.657782] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.657786] GPR20: 0000000000000000 c00000096f4ea280 0000000000000001 0000000000080000 
[   10.657790] GPR24: c00000096f4ea200 c00000096f4ea280 c00000096f4ea200 c0000000016d2640 
[   10.657795] GPR28: 0000000000000001 c00000096f4ea200 000000000000000a c0000000016d21e0 
[   10.657800] NIP [c000000000b4f288] .rcu_eqs_enter.isra.0+0x58/0x80
[   10.657801] LR [c0000000001a9e9c] .do_idle+0x35c/0x430
[   10.657802] Call Trace:
[   10.657803] [c00000096f72fd50] [c0000000001a9e9c] .do_idle+0x35c/0x430 (unreliable)
[   10.657806] [c00000096f72fe40] [c0000000001aa1c4] .cpu_startup_entry+0x34/0x50
[   10.657808] [c00000096f72feb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.657810] [c00000096f72ff90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.657811] Instruction dump:
[   10.657813] 40820048 e90900c8 38e00000 f8e900d0 2c280001 41820014 3908ffff f90900c8 
[   10.657819] 4e800020 60000000 812900d8 e9260030 <7d4a4a14> f8ea00c8 4bffff00 60000000 
[   10.658186] watchdog: CPU 11 self-detected hard LOCKUP @ .default_idle_call+0x2c/0x7c
[   10.658187] watchdog: CPU 11 TB:43893442523, last heartbeat TB:38599164832 (10340ms ago)
[   10.658188] Modules linked in:
[   10.658190] CPU: 11 PID: 0 Comm: swapper/11 Tainted: G        W         5.8.0-rc5+ #121
[   10.658192] NIP:  c000000000b5701c LR: c0000000001a9ea4 CTR: c00000000022ede0
[   10.658193] REGS: c0000009ffe6bd70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.658194] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.658201] CFAR: c0000000001a9ea0 IRQMASK: 1 
[   10.658204] GPR00: c0000000001a9ea4 c00000096f71fce0 c000000001685e00 0000000000000000 
[   10.658208] GPR04: 0000000000000000 c000000977313e00 c0000009fffc1800 0000000000000808 
[   10.658212] GPR08: c00000096f4f7a80 c00000096f4f7a00 0000000000080000 c0000000016d25e0 
[   10.658217] GPR12: 0000000024000228 c0000009fffc1800 c0000009f33d3f90 0000000000000000 
[   10.658221] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.658225] GPR20: 0000000000000000 c00000096f4f7a80 0000000000000001 0000000000080000 
[   10.658230] GPR24: c00000096f4f7a00 c00000096f4f7a80 c00000096f4f7a00 c0000000016d2640 
[   10.658234] GPR28: 0000000000000001 c00000096f4f7a00 000000000000000b c0000000016d21e0 
[   10.658239] NIP [c000000000b5701c] .default_idle_call+0x2c/0x7c
[   10.658240] LR [c0000000001a9ea4] .do_idle+0x364/0x430
[   10.658241] Call Trace:
[   10.658242] [c00000096f71fce0] [c000000000b57034] .default_idle_call+0x44/0x7c (unreliable)
[   10.658244] [c00000096f71fd50] [c0000000001a9ea4] .do_idle+0x364/0x430
[   10.658247] [c00000096f71fe40] [c0000000001aa1c4] .cpu_startup_entry+0x34/0x50
[   10.658249] [c00000096f71feb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.658251] [c00000096f71ff90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.658252] Instruction dump:
[   10.658254] 60000000 7c0802a6 f8010010 f821ff91 60000000 60000000 e92d0968 3d400008 
[   10.658260] 39090080 7ce040a8 7ce75078 7ce041ad <40c2fff4> 7c0004ac e9290080 71290004 
[   10.659070] watchdog: CPU 20 self-detected hard LOCKUP @ .can_stop_idle_tick.isra.0+0xcc/0x180
[   10.659072] watchdog: CPU 20 TB:43893894591, last heartbeat TB:38601710719 (10336ms ago)
[   10.659073] Modules linked in:
[   10.659075] CPU: 20 PID: 0 Comm: swapper/20 Tainted: G        W         5.8.0-rc5+ #121
[   10.659076] NIP:  c00000000023f73c LR: c0000000002400b0 CTR: c00000000022ede0
[   10.659078] REGS: c0000009ffdffd70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.659079] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.659086] CFAR: c00000000023f6c4 IRQMASK: 1 
[   10.659088] GPR00: c0000000002400b0 c00000096f75bca0 c000000001685e00 0000000000000000 
[   10.659092] GPR04: 0000000000000000 c000000977c13e00 c0000009fffb7580 0000000000000002 
[   10.659097] GPR08: 0000000000000014 0000000000000001 0000000000000000 0000000300000004 
[   10.659101] GPR12: 0000000024000222 c0000009fffb7580 c0000009f33f7f90 0000000000000000 
[   10.659105] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.659110] GPR20: 0000000000000000 c00000096f7e5a80 0000000000000001 0000000000080000 
[   10.659114] GPR24: c00000096f7e5a00 c00000096f7e5a80 c00000096f7e5a00 0000000000000014 
[   10.659118] GPR28: 0000000000000001 c00000096f7e5a00 0000000000000014 c000000977c13da8 
[   10.659123] NIP [c00000000023f73c] .can_stop_idle_tick.isra.0+0xcc/0x180
[   10.659124] LR [c0000000002400b0] .tick_nohz_idle_stop_tick+0x1c0/0x380
[   10.659125] Call Trace:
[   10.659126] [c00000096f75bca0] [c0000000002400b0] .tick_nohz_idle_stop_tick+0x1c0/0x380 (unreliable)
[   10.659129] [c00000096f75bd50] [c0000000001a9e94] .do_idle+0x354/0x430
[   10.659131] [c00000096f75be40] [c0000000001aa1c0] .cpu_startup_entry+0x30/0x50
[   10.659133] [c00000096f75beb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.659135] [c00000096f75bf90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.659137] Instruction dump:
[   10.659138] 7c0803a6 4e800020 60000000 60000000 60000000 38210090 3be00000 e8010010 
[   10.659144] 7fe3fb78 eba1ffe8 ebc1fff0 ebe1fff8 <7c0803a6> 4e800020 60000000 60000000 
[   10.848983] watchdog: CPU 8 self-detected hard LOCKUP @ .default_idle_call+0x2c/0x7c
[   10.848985] watchdog: CPU 8 TB:43991130719, last heartbeat TB:38598494447 (10532ms ago)
[   10.848985] Modules linked in:
[   10.848988] CPU: 8 PID: 0 Comm: swapper/8 Tainted: G        W         5.8.0-rc5+ #121
[   10.848989] NIP:  c000000000b5701c LR: c0000000001a9ea4 CTR: c00000000022ede0
[   10.848990] REGS: c0000009ffe8fd70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.848991] MSR:  9000000002009032 <SF,HV,VEC,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
[   10.848999] CFAR: c0000000001a9ea0 IRQMASK: 1 
[   10.849001] GPR00: c0000000001a9ea4 c00000096f74fce0 c000000001685e00 0000000000000000 
[   10.849005] GPR04: 0000000000000000 c000000977013e00 c0000009fffc4e00 0000000000000808 
[   10.849010] GPR08: c00000096f4ec680 c00000096f4ec600 0000000000080000 c0000000016d25e0 
[   10.849014] GPR12: 0000000024000228 c0000009fffc4e00 c0000009f33c7f90 0000000000000000 
[   10.849018] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.849023] GPR20: 0000000000000000 c00000096f4ec680 0000000000000001 0000000000080000 
[   10.849027] GPR24: c00000096f4ec600 c00000096f4ec680 c00000096f4ec600 c0000000016d2640 
[   10.849031] GPR28: 0000000000000001 c00000096f4ec600 0000000000000008 c0000000016d21e0 
[   10.849036] NIP [c000000000b5701c] .default_idle_call+0x2c/0x7c
[   10.849037] LR [c0000000001a9ea4] .do_idle+0x364/0x430
[   10.849038] Call Trace:
[   10.849039] [c00000096f74fce0] [c000000000b57034] .default_idle_call+0x44/0x7c (unreliable)
[   10.849042] [c00000096f74fd50] [c0000000001a9ea4] .do_idle+0x364/0x430
[   10.849044] [c00000096f74fe40] [c0000000001aa1c4] .cpu_startup_entry+0x34/0x50
[   10.849046] [c00000096f74feb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.849048] [c00000096f74ff90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.849049] Instruction dump:
[   10.849051] 60000000 7c0802a6 f8010010 f821ff91 60000000 60000000 e92d0968 3d400008 
[   10.849057] 39090080 7ce040a8 7ce75078 7ce041ad <40c2fff4> 7c0004ac e9290080 71290004 
[   10.849204] watchdog: CPU 17 self-detected hard LOCKUP @ .tick_nohz_idle_stop_tick+0x0/0x380
[   10.849206] watchdog: CPU 17 TB:43991245411, last heartbeat TB:38600736139 (10528ms ago)
[   10.849207] Modules linked in:
[   10.849209] CPU: 17 PID: 0 Comm: swapper/17 Tainted: G        W         5.8.0-rc5+ #121
[   10.849210] NIP:  c00000000023fef0 LR: c0000000001a9e94 CTR: c00000000022ede0
[   10.849212] REGS: c0000009ffe23d70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   10.849212] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 44000222  XER: 00000000
[   10.849220] CFAR: c0000000001a9e90 IRQMASK: 1 
[   10.849222] GPR00: c0000000001a9ca0 c00000096f767d50 c000000001685e00 0000000000000001 
[   10.849226] GPR04: 0000000000000000 c000000977913e00 c0000009fffbac00 0000000000000002 
[   10.849230] GPR08: 0000000000000000 0000000000000000 0000000976a10000 c0000000016d25e0 
[   10.849235] GPR12: 0000000024000228 c0000009fffbac00 c0000009f33ebf90 0000000000000000 
[   10.849239] GPR16: 0000000000000000 0000000000000000 c0000000015b9bd8 0000000000000000 
[   10.849243] GPR20: 0000000000000000 c00000096f7f4480 0000000000000001 0000000000080000 
[   10.849247] GPR24: c00000096f7f4400 c00000096f7f4480 c00000096f7f4400 c0000000016d2640 
[   10.849252] GPR28: 0000000000000001 c00000096f7f4400 0000000000000011 c0000000016d21e0 
[   10.849257] NIP [c00000000023fef0] .tick_nohz_idle_stop_tick+0x0/0x380
[   10.849258] LR [c0000000001a9e94] .do_idle+0x354/0x430
[   10.849259] Call Trace:
[   10.849260] [c00000096f767d50] [c0000000001a9ca0] .do_idle+0x160/0x430 (unreliable)
[   10.849263] [c00000096f767e40] [c0000000001aa1c4] .cpu_startup_entry+0x34/0x50
[   10.849265] [c00000096f767eb0] [c0000000000512a8] .start_secondary+0x628/0x650
[   10.849267] [c00000096f767f90] [c00000000000d2e4] start_secondary_prolog+0x10/0x14
[   10.849268] Instruction dump:
[   10.849270] 3929dfa8 7d4a182a e8010010 7c0803a6 7d2a4a14 ebe1fff8 e8690048 786317e2 
[   10.849275] 4e800020 60000000 60000000 60000000 <7c0802a6> fb61ffd8 fbc1fff0 fbe1fff8 
[   28.346664] pci 0000:a0:00.0: Adding to iommu group 2
[   28.346805] pci 0000:a0:00.1: Added to existing PE#79
[   28.346831] pci 0000:a0:00.1: Adding to iommu group 2
[   28.346963] pci_bus 0001:00: Configuring PE for bus
[   28.346985] pci 0001:00     : [PE# 7e] Secondary bus 0x0000000000000000 associated with PE#7e
[   28.347017] pci 0001:00:00.0: Configured PE#7e
[   28.347117] pci_bus 0002:00: Configuring PE for bus
[   28.347138] pci 0002:00     : [PE# 7e] Secondary bus 0x0000000000000000 associated with PE#7e
[   28.347170] pci 0002:00:00.0: Configured PE#7e
[   28.347270] pci_bus 0003:00: Configuring PE for bus
[   28.347291] pci 0003:00     : [PE# 7e] Secondary bus 0x0000000000000000 associated with PE#7e
[   28.347322] pci 0003:00:00.0: Configured PE#7e
[   28.819355] pci_bus 0004:00: Configuring PE for bus
[   28.819377] pci 0004:00     : [PE# 7e] Secondary bus 0x0000000000000000 associated with PE#7e
[   28.819409] pci 0004:00:00.0: Configured PE#7e
[   28.819508] pci_bus 0005:00: Configuring PE for bus
[   28.819530] pci 0005:00     : [PE# 7e] Secondary bus 0x0000000000000000 associated with PE#7e
[   28.819561] pci 0005:00:00.0: Configured PE#7e
[   28.819660] pci_bus 0005:01: Configuring PE for bus
[   28.819685] pci 0005:01     : [PE# 7d] Secondary bus 0x0000000000000001 associated with PE#7d
[   28.819723] pci 0005:01:00.0: Configured PE#7d
[   28.819757] pci 0005:01     : [PE# 7d] DMA weight 20 (20), assigned (0) 8 DMA32 segments
[   28.819780] pci 0005:01     : [PE# 7d]  Setting up 32-bit TCE table at 00000000..7fffffff
[   28.856013] pci 0005:01:00.0: Adding to iommu group 3
[   28.856227] pci 0005:01:00.1: Added to existing PE#7d
[   28.856252] pci 0005:01:00.1: Adding to iommu group 3
[   29.295219] pci 0000:00:00.0: enabling device (0141 -> 0143)
[   29.295267] pci 0000:01:00.0: enabling device (0541 -> 0543)
[   29.295319] pci 0000:02:06.0: enabling device (0541 -> 0543)
[   29.295370] pci 0000:02:08.0: enabling device (0541 -> 0543)
[   29.295424] pci 0000:80:00.0: enabling device (0141 -> 0143)
[   29.295477] pci 0000:02:09.0: enabling device (0541 -> 0543)
[   29.295527] pci 0005:00:00.0: enabling device (0141 -> 0143)
[   29.295561] EEH: Capable adapter found: recovery enabled.
[   29.295692] PCI: Probing PCI hardware done
[   29.299110] watchdog: CPU 0 self-detected hard LOCKUP @ .__do_irq+0x6c/0x1d0
[   29.299111] watchdog: CPU 0 TB:53437576815, last heartbeat TB:38596666946 (28986ms ago)
[   29.299112] Modules linked in:
[   29.299115] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.8.0-rc5+ #121
[   29.299116] NIP:  c00000000001573c LR: c000000000015718 CTR: c0000000000b7c90
[   29.299118] REGS: c0000009ffeefd70 TRAP: 0900   Tainted: G        W          (5.8.0-rc5+)
[   29.299119] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000224  XER: 20000000
[   29.299126] CFAR: c0000000000b7ddc IRQMASK: 1 
[   29.299128] GPR00: c000000000015718 c0000009fffabf10 c000000001685e00 0000000000000010 
[   29.299132] GPR04: 0000000000000002 0000000000000000 0000000000000004 0000000000000001 
[   29.299137] GPR08: 0000000000008002 0000000000000000 0000000000000001 fffffffffffffffd 
[   29.299141] GPR12: c00000096f3fcde0 c000000001890000 0000000000000000 0000000000000000 
[   29.299145] GPR16: 0000000000000000 0000000000000000 0000000000000001 0000000000000000 
[   29.299149] GPR20: 0000000000000000 c000000001546780 0000000000000001 0000000000080000 
[   29.299154] GPR24: c000000001546700 c000000001546780 c000000001546700 c0000000016d2640 
[   29.299158] GPR28: 0000000000000000 c000000000f87460 c000000001683900 c000000001683900 
[   29.299163] NIP [c00000000001573c] .__do_irq+0x6c/0x1d0
[   29.299164] LR [c000000000015718] .__do_irq+0x48/0x1d0
[   29.299165] Call Trace:
[   29.299166] [c0000009fffabf10] [c000000000015718] .__do_irq+0x48/0x1d0 (unreliable)
[   29.299168] [c0000009fffabf90] [c000000000027824] .call_do_irq+0x14/0x24
[   29.299170] [c000000001683800] [c000000000015918] .do_IRQ+0x78/0xe0
[   29.299173] [c000000001683890] [c00000000000931c] hardware_interrupt_common_virt+0x1dc/0x1e0
[   29.299175] --- interrupt: 500 at .arch_local_irq_restore+0x5c/0x90
[   29.299176]     LR = .arch_local_irq_restore+0x40/0x90
[   29.299177] [c000000001683c00] [c00000000001b078] .arch_cpu_idle+0xe8/0x180
[   29.299179] [c000000001683c80] [c000000000b57034] .default_idle_call+0x44/0x7c
[   29.299181] [c000000001683cf0] [c0000000001a9ea4] .do_idle+0x364/0x430
[   29.299183] [c000000001683de0] [c0000000001aa1c4] .cpu_startup_entry+0x34/0x50
[   29.299185] [c000000001683e50] [c000000000012698] .rest_init+0xd8/0xf0
[   29.299187] [c000000001683ed0] [c000000000e248e0] .start_kernel+0x708/0x750
[   29.299189] [c000000001683f90] [c00000000000d42c] start_here_common+0x1c/0x3f0
[   29.299191] Instruction dump:
[   29.299192] 7d4903a6 e8490008 4e800421 e8410028 892d0989 71280044 40820018 5529003c 
[   29.299199] 39000000 61088002 992d0989 7d010164 <2c230000> 41820140 481e1bed 60000000 
[   29.322560] opal-stat: OPAL: no stats root node
[   29.322589] cpuidle-powernv: missing ibm,cpu-idle-state-residency-ns in DT
[   29.326628] HugeTLB registered 16.0 MiB page size, pre-allocated 0 pages
[   29.326664] HugeTLB registered 16.0 GiB page size, pre-allocated 0 pages
[   30.672004] iommu: Default domain type: Translated 
[   30.672211] vgaarb: loaded
[   30.672662] SCSI subsystem initialized
[   30.672875] libata version 3.00 loaded.
[   30.673616] watchdog: CPU 11 became unstuck TB:54141383030
[   30.673638] CPU: 11 PID: 65 Comm: migration/11 Tainted: G        W         5.8.0-rc5+ #121
[   30.673655] Call Trace:
[   30.673671] [c00000096fc2b9b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   30.673691] [c00000096fc2ba50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   30.673710] [c00000096fc2bb20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   30.673728] [c00000096fc2bbe0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   30.673747] [c00000096fc2bcb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   30.673765] [c00000096fc2bd60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   30.673783] [c00000096fc2be20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   30.673803] watchdog: CPU 5 became unstuck TB:54141383583
[   30.673823] CPU: 5 PID: 35 Comm: migration/5 Tainted: G        W         5.8.0-rc5+ #121
[   30.673840] Call Trace:
[   30.673856] [c00000096f8cf9b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   30.673875] [c00000096f8cfa50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   30.673893] [c00000096f8cfb20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   30.673912] [c00000096f8cfbe0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   30.673930] [c00000096f8cfcb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   30.673948] [c00000096f8cfd60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   30.673966] [c00000096f8cfe20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   30.673986] watchdog: CPU 19 became unstuck TB:54141383409
[   30.674009] CPU: 19 PID: 105 Comm: migration/19 Tainted: G        W         5.8.0-rc5+ #121
[   30.674026] Call Trace:
[   30.674042] [c00000096d0bb9b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   30.674061] [c00000096d0bba50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   30.674079] [c00000096d0bbb20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   30.674098] [c00000096d0bbbe0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   30.674116] [c00000096d0bbcb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   30.674134] [c00000096d0bbd60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   30.674152] [c00000096d0bbe20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   30.674171] watchdog: CPU 8 became unstuck TB:54141383583
[   30.674191] CPU: 8 PID: 50 Comm: migration/8 Tainted: G        W         5.8.0-rc5+ #121
[   30.674208] Call Trace:
[   30.674225] [c00000096fc0f9b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   30.674245] [c00000096fc0fa50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   30.674265] [c00000096fc0fb20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   30.674284] [c00000096fc0fbe0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   30.674304] [c00000096fc0fcb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   30.674323] [c00000096fc0fd60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   30.674342] [c00000096fc0fe20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   30.674363] watchdog: CPU 15 became unstuck TB:54141382959
[   30.674382] CPU: 15 PID: 85 Comm: migration/15 Tainted: G        W         5.8.0-rc5+ #121
[   30.972228] Call Trace:
[   30.972244] [c00000096d0ef9b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   30.972263] [c00000096d0efa50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   30.972282] [c00000096d0efb20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   30.972300] [c00000096d0efbe0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   30.972318] [c00000096d0efcb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   30.972337] [c00000096d0efd60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   30.972354] [c00000096d0efe20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   30.972374] watchdog: CPU 16 became unstuck TB:54141383023
[   30.972393] CPU: 16 PID: 90 Comm: migration/16 Tainted: G        W         5.8.0-rc5+ #121
[   30.972410] Call Trace:
[   30.972427] [c00000096d0ff9b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   30.972447] [c00000096d0ffa50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   31.419577] [c00000096d0ffb20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   31.419597] [c00000096d0ffbe0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   31.419616] [c00000096d0ffcb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   31.419636] [c00000096d0ffd60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   31.419655] [c00000096d0ffe20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   31.419675] watchdog: CPU 18 became unstuck TB:54141383391
[   31.419695] CPU: 18 PID: 100 Comm: migration/18 Tainted: G        W         5.8.0-rc5+ #121
[   31.419714] Call Trace:
[   31.419731] [c00000096d0c79b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   31.419754] [c00000096d0c7a50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   31.419776] [c00000096d0c7b20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   31.419798] [c00000096d0c7be0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   32.088223] [c00000096d0c7cb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   32.088244] [c00000096d0c7d60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   32.088265] [c00000096d0c7e20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   32.088289] watchdog: CPU 6 became unstuck TB:54141383823
[   32.088310] CPU: 6 PID: 40 Comm: migration/6 Tainted: G        W         5.8.0-rc5+ #121
[   32.088328] Call Trace:
[   32.088344] [c00000096f8ab9b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   32.088364] [c00000096f8aba50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   32.088384] [c00000096f8abb20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   32.088403] [c00000096f8abbe0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   32.088423] [c00000096f8abcb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   32.088443] [c00000096f8abd60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   32.635635] [c00000096f8abe20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   32.635656] watchdog: CPU 12 became unstuck TB:54141383295
[   32.635676] CPU: 12 PID: 70 Comm: migration/12 Tainted: G        W         5.8.0-rc5+ #121
[   32.635694] Call Trace:
[   32.635710] [c00000096fc639b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   32.635730] [c00000096fc63a50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   32.635750] [c00000096fc63b20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   32.635770] [c00000096fc63be0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   32.635789] [c00000096fc63cb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   32.635809] [c00000096fc63d60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   32.635828] [c00000096fc63e20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   32.635848] watchdog: CPU 10 became unstuck TB:54141383136
[   32.635867] CPU: 10 PID: 60 Comm: migration/10 Tainted: G        W         5.8.0-rc5+ #121
[   33.173485] Call Trace:
[   33.173502] [c00000096fc4f9b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   33.173525] [c00000096fc4fa50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   33.173547] [c00000096fc4fb20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   33.173569] [c00000096fc4fbe0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   33.173591] [c00000096fc4fcb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   33.173612] [c00000096fc4fd60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   33.173633] [c00000096fc4fe20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   33.173655] watchdog: CPU 20 became unstuck TB:54141382879
[   33.173676] CPU: 20 PID: 110 Comm: migration/20 Tainted: G        W         5.8.0-rc5+ #121
[   33.173693] Call Trace:
[   33.173709] [c00000096d5239b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   33.173728] [c00000096d523a50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   33.770869] [c00000096d523b20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   33.770888] [c00000096d523be0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   33.770906] [c00000096d523cb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   33.770924] [c00000096d523d60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   33.770942] [c00000096d523e20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   33.770960] watchdog: CPU 17 became unstuck TB:54141383398
[   33.770981] CPU: 17 PID: 95 Comm: migration/17 Tainted: G        W         5.8.0-rc5+ #121
[   33.771001] Call Trace:
[   33.771020] [c00000096d0e79b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   33.771043] [c00000096d0e7a50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   33.771067] [c00000096d0e7b20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   33.771090] [c00000096d0e7be0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   34.328966] [c00000096d0e7cb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   34.328989] [c00000096d0e7d60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   34.329011] [c00000096d0e7e20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   34.329033] watchdog: CPU 14 became unstuck TB:54141383684
[   34.329053] CPU: 14 PID: 80 Comm: migration/14 Tainted: G        W         5.8.0-rc5+ #121
[   34.329072] Call Trace:
[   34.329090] [c00000096d0979b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   34.329113] [c00000096d097a50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   34.329135] [c00000096d097b20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   34.329157] [c00000096d097be0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   34.329178] [c00000096d097cb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   34.329200] [c00000096d097d60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   34.329221] [c00000096d097e20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   34.893441] watchdog: CPU 7 became unstuck TB:54141383786
[   34.893461] CPU: 7 PID: 45 Comm: migration/7 Tainted: G        W         5.8.0-rc5+ #121
[   34.893481] Call Trace:
[   34.893499] [c00000096fc039b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   34.893521] [c00000096fc03a50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   34.893543] [c00000096fc03b20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   34.893565] [c00000096fc03be0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   34.893587] [c00000096fc03cb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   34.893610] [c00000096fc03d60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   34.893631] [c00000096fc03e20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   34.893652] watchdog: CPU 21 became unstuck TB:54141382959
[   34.893671] CPU: 21 PID: 115 Comm: migration/21 Tainted: G        W         5.8.0-rc5+ #121
[   35.463290] Call Trace:
[   35.463308] [c00000096d54f9b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   35.463329] [c00000096d54fa50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   35.463349] [c00000096d54fb20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   35.463369] [c00000096d54fbe0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   35.463389] [c00000096d54fcb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   35.463409] [c00000096d54fd60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   35.463429] [c00000096d54fe20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   35.463448] watchdog: CPU 9 became unstuck TB:54141382735
[   35.463469] CPU: 9 PID: 55 Comm: migration/9 Tainted: G        W         5.8.0-rc5+ #121
[   35.463490] Call Trace:
[   35.463509] [c00000096fc239b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   35.463532] [c00000096fc23a50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   35.799148] [c00000096fc23b20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   35.799172] [c00000096fc23be0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   35.799194] [c00000096fc23cb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   35.799217] [c00000096fc23d60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   35.799239] [c00000096fc23e20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   35.799262] watchdog: CPU 0 became unstuck TB:54141383317
[   35.799280] CPU: 0 PID: 11 Comm: migration/0 Tainted: G        W         5.8.0-rc5+ #121
[   35.799297] Call Trace:
[   35.799313] [c00000096f7439b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   35.799332] [c00000096f743a50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   35.799351] [c00000096f743b20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   35.799369] [c00000096f743be0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   35.799388] [c00000096f743cb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   36.136459] [c00000096f743d60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   36.136476] [c00000096f743e20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   36.136495] watchdog: CPU 13 became unstuck TB:54141383839
[   36.136516] CPU: 13 PID: 75 Comm: migration/13 Tainted: G        W         5.8.0-rc5+ #121
[   36.136536] Call Trace:
[   36.136554] [c00000096d0cb9b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   36.136578] [c00000096d0cba50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   36.136601] [c00000096d0cbb20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   36.136624] [c00000096d0cbbe0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   36.136647] [c00000096d0cbcb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   36.136670] [c00000096d0cbd60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   36.136692] [c00000096d0cbe20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   36.471512] watchdog: CPU 23 became unstuck TB:54141382978
[   36.471531] CPU: 23 PID: 125 Comm: migration/23 Tainted: G        W         5.8.0-rc5+ #121
[   36.471550] Call Trace:
[   36.471568] [c00000096d5639b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   36.471590] [c00000096d563a50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   36.471612] [c00000096d563b20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   36.471633] [c00000096d563be0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   36.471654] [c00000096d563cb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   36.471675] [c00000096d563d60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   36.471696] [c00000096d563e20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   36.471717] watchdog: CPU 2 became unstuck TB:54141383439
[   36.471735] CPU: 2 PID: 20 Comm: migration/2 Tainted: G        W         5.8.0-rc5+ #121
[   36.471753] Call Trace:
[   36.838982] [c00000096f8839b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   36.839003] [c00000096f883a50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   36.839023] [c00000096f883b20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   36.839042] [c00000096f883be0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   36.839062] [c00000096f883cb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   36.839082] [c00000096f883d60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   36.839100] [c00000096f883e20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   36.839120] watchdog: CPU 22 became unstuck TB:54141382963
[   36.839141] CPU: 22 PID: 120 Comm: migration/22 Tainted: G        W         5.8.0-rc5+ #121
[   36.839161] Call Trace:
[   36.839180] [c00000096d52b9b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   36.839204] [c00000096d52ba50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   36.839227] [c00000096d52bb20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   37.180102] [c00000096d52bbe0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   37.180124] [c00000096d52bcb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   37.180148] [c00000096d52bd60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   37.180170] [c00000096d52be20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   37.180192] watchdog: CPU 4 became unstuck TB:54141383398
[   37.180212] CPU: 4 PID: 30 Comm: migration/4 Tainted: G        W         5.8.0-rc5+ #121
[   37.180233] Call Trace:
[   37.180251] [c00000096f8a39b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   37.180276] [c00000096f8a3a50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   37.180300] [c00000096f8a3b20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   37.180323] [c00000096f8a3be0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   37.180346] [c00000096f8a3cb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   37.520174] [c00000096f8a3d60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   37.520197] [c00000096f8a3e20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   37.520220] watchdog: CPU 1 became unstuck TB:54141382975
[   37.520240] CPU: 1 PID: 15 Comm: migration/1 Tainted: G        W         5.8.0-rc5+ #121
[   37.520260] Call Trace:
[   37.520277] [c00000096f8db9b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   37.520300] [c00000096f8dba50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   37.520322] [c00000096f8dbb20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   37.520344] [c00000096f8dbbe0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   37.520366] [c00000096f8dbcb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   37.520388] [c00000096f8dbd60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   37.520409] [c00000096f8dbe20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   37.520430] watchdog: CPU 3 became unstuck TB:54141382976
[   37.857400] CPU: 3 PID: 25 Comm: migration/3 Tainted: G        W         5.8.0-rc5+ #121
[   37.857421] Call Trace:
[   37.857440] [c00000096f88f9b0] [c0000000006fc370] .dump_stack+0xbc/0x10c (unreliable)
[   37.857464] [c00000096f88fa50] [c00000000003269c] .wd_smp_clear_cpu_pending+0x40c/0x420
[   37.857488] [c00000096f88fb20] [c00000000027a794] .multi_cpu_stop+0x164/0x230
[   37.857512] [c00000096f88fbe0] [c00000000027a3dc] .cpu_stopper_thread+0xbc/0x210
[   37.857534] [c00000096f88fcb0] [c000000000195bdc] .smpboot_thread_fn+0x1fc/0x270
[   37.857559] [c00000096f88fd60] [c00000000018f14c] .kthread+0x18c/0x1a0
[   37.857581] [c00000096f88fe20] [c00000000000dac0] .ret_from_kernel_thread+0x58/0x78
[   37.857643] clocksource: Switched to clocksource timebase
[   37.878888] VFS: Disk quotas dquot_6.6.0
[   37.879029] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 bytes)
[   37.879550] AppArmor: AppArmor Filesystem Enabled
[   38.132936] NET: Registered protocol family 2
[   38.133377] tcp_listen_portaddr_hash hash table entries: 32768 (order: 3, 524288 bytes, linear)
[   38.133963] TCP established hash table entries: 524288 (order: 6, 4194304 bytes, linear)
[   38.140465] TCP bind hash table entries: 65536 (order: 4, 1048576 bytes, linear)
[   38.141579] TCP: Hash tables configured (established 524288 bind 65536)
[   38.141778] UDP hash table entries: 32768 (order: 4, 1048576 bytes, linear)
[   38.142901] UDP-Lite hash table entries: 32768 (order: 4, 1048576 bytes, linear)
[   38.144240] NET: Registered protocol family 1
[   38.144269] NET: Registered protocol family 44
[   38.144364] pci 0000:90:01.0: enabling device (0140 -> 0142)
[   38.144442] pci 0000:90:01.1: enabling device (0140 -> 0142)
[   38.144522] pci 0000:90:01.2: enabling device (0140 -> 0142)
[   38.144632] PCI: CLS 128 bytes, default 128
[   38.144752] Unpacking initramfs...
[   39.192569] Freeing initrd memory: 32512K
[   39.194773] Initialise system trusted keyrings
[   39.194814] Key type blacklist registered
[   39.194904] workingset: timestamp_bits=38 max_order=20 bucket_order=0
[   39.198211] zbud: loaded
[   39.198722] integrity: Platform Keyring initialized
[   39.198742] Key type asymmetric registered
[   39.198760] Asymmetric key parser 'x509' registered
[   39.198790] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[   39.198928] io scheduler mq-deadline registered
[   39.199432] Driver 'hvc_console' was unable to register with bus_type 'vio' because the bus was not initialized.
[   39.199481] hvc0: raw protocol on /ibm,opal/consoles/serial@0 (boot console)
[   39.199504] hvc0: No interrupts property, using OPAL event
[   39.199977] hvc1: hvsi protocol on /ibm,opal/consoles/serial@1
[   39.199999] hvc1: No interrupts property, using OPAL event
[   39.200042] hvc2: hvsi protocol on /ibm,opal/consoles/serial@2
[   39.200063] hvc2: No interrupts property, using OPAL event
[   39.200103] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[   39.200963] pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
[   39.201047] Non-volatile memory driver v1.3
[   39.201065] Linux agpgart interface v0.103
[   39.201644] mousedev: PS/2 mouse device common for all mice
[   39.220573] rtc-opal opal-rtc: registered as rtc0
[   39.240550] rtc-opal opal-rtc: setting system clock to 2020-07-15T09:57:43 UTC (1594807063)
[   39.242431] powernv-cpufreq: ibm,pstate-min node not found
[   39.242450] powernv-cpufreq: Platform driver disabled. System does not support PState control
[   39.242471] cpuidle-powernv : Only Snooze is available
[   39.242729] powernv_idle_driver registered
[   39.242958] ledtrig-cpu: registered to indicate activity on CPUs
[   39.243026] drop_monitor: Initializing network drop monitor service
[   39.243291] NET: Registered protocol family 10
[   39.259368] Segment Routing with IPv6
[   39.259405] mip6: Mobile IPv6
[   39.259421] NET: Registered protocol family 17
[   39.259492] mpls_gso: MPLS GSO support
[   39.259521] drmem: No dynamic reconfiguration memory found
[   39.259652] registered taskstats version 1
[   39.259670] Loading compiled-in X.509 certificates
[   39.259736] zswap: loaded using pool lzo/zbud
[   39.259938] Key type ._fscrypt registered
[   39.259953] Key type .fscrypt registered
[   39.259968] Key type fscrypt-provisioning registered
[   39.260000] AppArmor: AppArmor sha1 policy hashing enabled
[   39.263561] Freeing unused kernel memory: 6528K
[   39.263591] This architecture does not have kernel memory protection.
[   39.263614] Run /init as init process
[   39.263631]   with arguments:
[   39.263632]     /init
[   39.263633]   with environment:
[   39.263635]     HOME=/
[   39.263636]     TERM=linux
[   39.376393] pps_core: module verification failed: signature and/or required key missing - tainting kernel
[   39.376699] pps_core: LinuxPPS API ver. 1 registered
[   39.376715] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[   39.391414] ipr: IBM Power RAID SCSI Device Driver version: 2.6.4 (March 14, 2017)
[   39.455742] usbcore: registered new interface driver usbfs
[   39.455755] usbcore: registered new interface driver hub
[   39.455847] usbcore: registered new device driver usb
[   39.471918] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   39.485162] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[   39.488858] ehci-pci: EHCI PCI platform driver
[   39.488984] ehci-pci 0000:90:01.2: EHCI Host Controller
[   39.489004] ehci-pci 0000:90:01.2: new USB bus registered, assigned bus number 1
[   39.489170] ehci-pci 0000:90:01.2: irq 26, io mem 0x3da082020000
[   39.490103] ipr 0000:60:00.0: Found IOA with IRQ: 25
[   39.490375] ipr 0000:60:00.0: enabling device (0140 -> 0142)
[   39.490493] ipr 0000:60:00.0: Received IRQ : 34
[   39.490520] ipr 0000:60:00.0: Request for 1 MSIs succeeded.
[   39.490978] ipr 0000:60:00.0: Initializing IOA.
[   39.496248] PTP clock support registered
[   39.671497] Emulex LightPulse Fibre Channel SCSI driver 12.8.0.1
[   39.671498] Copyright (C) 2017-2019 Broadcom. All Rights Reserved. The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
[   39.828775] scsi host0: IBM 0 Storage Adapter
[   39.828838] ehci-pci 0000:90:01.2: USB 2.0 started, EHCI 1.00
[   39.828969] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.08
[   39.828989] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   39.829007] usb usb1: Product: EHCI Host Controller
[   39.829024] usb usb1: Manufacturer: Linux 5.8.0-rc5+ ehci_hcd
[   39.829041] usb usb1: SerialNumber: 0000:90:01.2
[   39.829325] hub 1-0:1.0: USB hub found
[   39.829354] hub 1-0:1.0: 5 ports detected
[   39.829894] lpfc 0005:01:00.0: enabling device (0140 -> 0142)
[   39.831642] scsi host1: Emulex LPe12000 PCIe Fibre Channel Adapter on PCI bus 01 device 00 irq 27
[   39.833544] ohci-pci: OHCI PCI platform driver
[   39.890916] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[   39.890917] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[   40.209903] e1000e 0000:a0:00.0: enabling device (0140 -> 0142)
[   40.210084] e1000e 0000:a0:00.0: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
[   40.210326] ohci-pci 0000:90:01.0: OHCI PCI host controller
[   40.210354] ohci-pci 0000:90:01.0: new USB bus registered, assigned bus number 2
[   40.210465] ohci-pci 0000:90:01.0: irq 24, io mem 0x3da082000000
[   40.344962] usb usb2: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.08
[   40.344985] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   40.345006] usb usb2: Product: OHCI PCI host controller
[   40.345025] usb usb2: Manufacturer: Linux 5.8.0-rc5+ ohci_hcd
[   40.345044] usb usb2: SerialNumber: 0000:90:01.0
[   40.345325] hub 2-0:1.0: USB hub found
[   40.669421] hub 2-0:1.0: 3 ports detected
[   40.669734] ohci-pci 0000:90:01.1: OHCI PCI host controller
[   40.669756] ohci-pci 0000:90:01.1: new USB bus registered, assigned bus number 3
[   40.669816] ohci-pci 0000:90:01.1: irq 25, io mem 0x3da082010000
[   40.758611] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.08
[   40.758630] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   40.758649] usb usb3: Product: OHCI PCI host controller
[   40.758665] usb usb3: Manufacturer: Linux 5.8.0-rc5+ ohci_hcd
[   40.758683] usb usb3: SerialNumber: 0000:90:01.1
[   40.758861] hub 3-0:1.0: USB hub found
[   40.758890] hub 3-0:1.0: 2 ports detected
[   40.801447] e1000e 0000:a0:00.0 eth0: (PCI Express:2.5GT/s:Width x4) 5c:f3:fc:eb:7c:ba
[   40.801469] e1000e 0000:a0:00.0 eth0: Intel(R) PRO/1000 Network Connection
[   40.801557] e1000e 0000:a0:00.0 eth0: MAC: 0, PHY: 4, PBA No: E34292-006
[   41.151832] e1000e 0000:a0:00.1: enabling device (0140 -> 0142)
[   41.151973] e1000e 0000:a0:00.1: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
[   41.313385] e1000e 0000:a0:00.1 eth1: (PCI Express:2.5GT/s:Width x4) 5c:f3:fc:eb:7c:bb
[   41.313405] e1000e 0000:a0:00.1 eth1: Intel(R) PRO/1000 Network Connection
[   41.313492] e1000e 0000:a0:00.1 eth1: MAC: 0, PHY: 4, PBA No: E34292-006
[   41.315058] e1000e 0000:a0:00.1 enp160s0f1: renamed from eth1
[   41.328772] e1000e 0000:a0:00.0 enp160s0f0: renamed from eth0
[   42.684625] lpfc 0005:01:00.1: enabling device (0140 -> 0142)
[   42.685603] scsi host2: Emulex LPe12000 PCIe Fibre Channel Adapter on PCI bus 01 device 01 irq 28
[   45.094490] random: lvm: uninitialized urandom read (4 bytes read)
[   45.159719] random: lvm: uninitialized urandom read (4 bytes read)
[   46.230810] random: lvm: uninitialized urandom read (4 bytes read)
[   46.470355] ipr 0000:60:00.0: Starting IOA initialization sequence.
[   46.470929] ipr 0000:60:00.0: Adapter firmware version: 04220029
[   46.537793] ipr 0000:60:00.0: IOA initialized.
[   46.538243] scsi 0:255:255:255: No Device         IBM      57C7001SISIOA    0150 PQ: 0 ANSI: 0
[   47.290177] random: lvm: uninitialized urandom read (4 bytes read)
[   48.338357] random: lvm: uninitialized urandom read (4 bytes read)
[   48.927161] scsi 0:8:0:0: Enclosure         IBM      VSBPD3E4A  3GSAS   01 PQ: 0 ANSI: 2
[   48.927415] scsi 0:8:1:0: Enclosure         IBM      VSBPD3E4B  3GSAS   01 PQ: 0 ANSI: 2
[   49.402253] random: lvm: uninitialized urandom read (4 bytes read)
[   50.470383] random: lvm: uninitialized urandom read (4 bytes read)
[   50.517573] ata1.00: ATA-10: ST1000NX0313         00LY266 00LY265IBM, BE32, max UDMA/133
[   50.517602] ata1.00: 1953525168 sectors, multi 0: LBA48 NCQ (depth 0/32)
[   50.518364] ata1.00: configured for UDMA/133
[   50.518473] scsi 0:0:0:0: Direct-Access     ATA      ST1000NX0313     BE32 PQ: 0 ANSI: 5
[   51.522363] random: lvm: uninitialized urandom read (4 bytes read)
[   52.109818] ata2.00: ATAPI: IBM     RMBO0040542, SA61, max UDMA/100
[   52.112397] ata2.00: configured for UDMA/100
[   52.115601] scsi 0:6:0:0: CD-ROM            IBM      RMBO0040542      SA61 PQ: 0 ANSI: 2
[   52.116289] scsi 0:1:0:0: Direct-Access     IBM      ST9300653SS      7411 PQ: 0 ANSI: 6
[   52.145086] sd 0:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
[   52.145120] sd 0:0:0:0: [sda] 4096-byte physical blocks
[   52.145163] sd 0:0:0:0: [sda] Write Protect is off
[   52.145181] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[   52.145205] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[   52.160740] sd 0:1:0:0: Power-on or device reset occurred
[   52.161529] sd 0:1:0:0: [sdb] 585937500 512-byte logical blocks: (300 GB/279 GiB)
[   52.161835] sd 0:1:0:0: [sdb] Write Protect is off
[   52.161852] sd 0:1:0:0: [sdb] Mode Sense: e1 00 10 08
[   52.162335] sd 0:1:0:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FUA
[   52.175799]  sda: sda1 sda2 sda3
[   52.176618] sd 0:0:0:0: [sda] Attached SCSI disk
[   52.179583] sr 0:6:0:0: [sr0] scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 cdda tray
[   52.179607] cdrom: Uniform CD-ROM driver Revision: 3.20
[   52.189486]  sdb:
[   52.192277] sd 0:1:0:0: [sdb] Attached SCSI disk
[   52.213447] sr 0:6:0:0: Attached scsi CD-ROM sr0
[   52.570565] random: lvm: uninitialized urandom read (4 bytes read)
[   52.634445] device-mapper: uevent: version 1.0.3
[   52.634598] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised: dm-devel@redhat.com
[   52.635735] random: lvm: uninitialized urandom read (2 bytes read)
[   58.139950] ses 0:8:0:0: Attached Enclosure device
[   58.139995] ses 0:8:1:0: Attached Enclosure device
[   58.155408] PM: Image not found (code -22)
[   59.685512] EXT4-fs (dm-1): mounted filesystem with ordered data mode. Opts: (null)
[   59.814229] Not activating Mandatory Access Control as /sbin/tomoyo-init does not exist.
[   60.273066] random: fast init done
[   60.600836] systemd[1]: Inserted module 'autofs4'
[   60.686979] systemd[1]: systemd 245.6-1 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid)
[   60.687409] systemd[1]: Detected architecture ppc64.
[   60.735750] systemd[1]: Set hostname to <amure>.
[   60.969265] random: crng init done
[   62.358333] systemd[1]: Created slice Virtual Machine and Container Slice.
[   62.359355] systemd[1]: Created slice system-getty.slice.
[   62.359864] systemd[1]: Created slice system-modprobe.slice.
[   62.360458] systemd[1]: Created slice system-postfix.slice.
[   62.360985] systemd[1]: Created slice system-serial\x2dgetty.slice.
[   62.361496] systemd[1]: Created slice system-systemd\x2dfsck.slice.
[   62.361973] systemd[1]: Created slice User and Session Slice.
[   62.362160] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[   62.362324] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[   62.362462] systemd[1]: Condition check resulted in Arbitrary Executable File Formats File System Automount Point being skipped.
[   62.362533] systemd[1]: Reached target Local Encrypted Volumes.
[   62.362661] systemd[1]: Reached target Paths.
[   62.362763] systemd[1]: Reached target Remote File Systems.
[   62.362865] systemd[1]: Reached target Slices.
[   62.362986] systemd[1]: Reached target Libvirt guests shutdown.
[   62.363172] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[   62.363436] systemd[1]: Listening on LVM2 poll daemon socket.
[   62.363650] systemd[1]: Listening on Syslog Socket.
[   62.363864] systemd[1]: Listening on fsck to fsckd communication Socket.
[   62.364021] systemd[1]: Listening on initctl Compatibility Named Pipe.
[   62.364367] systemd[1]: Listening on Journal Audit Socket.
[   62.364587] systemd[1]: Listening on Journal Socket (/dev/log).
[   62.364824] systemd[1]: Listening on Journal Socket.
[   62.365046] systemd[1]: Listening on udev Control Socket.
[   62.365220] systemd[1]: Listening on udev Kernel Socket.
[   62.366857] systemd[1]: Mounting Huge Pages File System...
[   62.368562] systemd[1]: Mounting POSIX Message Queue File System...
[   62.370479] systemd[1]: Mounting Kernel Debug File System...
[   62.372238] systemd[1]: Mounting Kernel Trace File System...
[   62.373886] systemd[1]: Starting Availability of block devices...
[   62.375687] systemd[1]: Starting Create list of static device nodes for the current kernel...
[   62.377248] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
[   62.378893] systemd[1]: Starting Load Kernel Module drm...
[   62.401843] systemd[1]: Condition check resulted in Set Up Additional Binary Formats being skipped.
[   62.401902] systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
[   62.403994] systemd[1]: Starting Journal Service...
[   62.416921] systemd[1]: Starting Load Kernel Modules...
[   62.418461] systemd[1]: Starting Remount Root and Kernel File Systems...
[   62.420012] systemd[1]: Starting udev Coldplug all Devices...
[   62.422478] systemd[1]: Mounted Huge Pages File System.
[   62.422820] systemd[1]: Mounted POSIX Message Queue File System.
[   62.423110] systemd[1]: Mounted Kernel Debug File System.
[   62.423386] systemd[1]: Mounted Kernel Trace File System.
[   62.424336] systemd[1]: Finished Availability of block devices.
[   62.424968] systemd[1]: modprobe@drm.service: Succeeded.
[   62.425550] systemd[1]: Finished Load Kernel Module drm.
[   62.429403] systemd[1]: Finished Create list of static device nodes for the current kernel.
[   62.477192] EXT4-fs (dm-1): re-mounted. Opts: errors=remount-ro
[   62.478974] systemd[1]: Finished Remount Root and Kernel File Systems.
[   62.522752] systemd[1]: Condition check resulted in Rebuild Hardware Database being skipped.
[   62.522808] systemd[1]: Condition check resulted in Platform Persistent Storage Archival being skipped.
[   62.524220] systemd[1]: Starting Load/Save Random Seed...
[   62.526265] systemd[1]: Starting Create System Users...
[   62.527492] systemd[1]: Finished Load Kernel Modules.
[   62.528018] systemd[1]: Condition check resulted in FUSE Control File System being skipped.
[   62.529625] systemd[1]: Mounting Kernel Configuration File System...
[   62.531233] systemd[1]: Starting Apply Kernel Variables...
[   62.533932] systemd[1]: Mounted Kernel Configuration File System.
[   62.590378] systemd[1]: Finished Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling.
[   62.638113] systemd[1]: Finished udev Coldplug all Devices.
[   62.656511] systemd[1]: Starting Helper to synchronize boot up for ifupdown...
[   62.657640] systemd[1]: Finished Apply Kernel Variables.
[   62.725974] systemd[1]: Finished Create System Users.
[   62.727600] systemd[1]: Starting Create Static Device Nodes in /dev...
[   62.728735] systemd[1]: Finished Helper to synchronize boot up for ifupdown.
[   62.772621] systemd[1]: Finished Load/Save Random Seed.
[   62.816410] systemd[1]: Finished Create Static Device Nodes in /dev.
[   62.816682] systemd[1]: Reached target Local File Systems (Pre).
[   62.816808] systemd[1]: Condition check resulted in Virtual Machine and Container Storage (Compatibility) being skipped.
[   62.816843] systemd[1]: Reached target Containers.
[   62.818458] systemd[1]: Starting udev Kernel Device Manager...
[   62.948568] systemd[1]: Started udev Kernel Device Manager.
[   63.032275] systemd[1]: Found device /dev/hvc0.
[   63.135641] systemd[1]: Started Journal Service.
[   63.140762] scsi 0:255:255:255: Attached scsi generic sg0 type 31
[   63.140847] ses 0:8:0:0: Attached scsi generic sg1 type 13
[   63.140908] ses 0:8:1:0: Attached scsi generic sg2 type 13
[   63.140975] sd 0:0:0:0: Attached scsi generic sg3 type 0
[   63.141044] sr 0:6:0:0: Attached scsi generic sg4 type 5
[   63.141111] sd 0:1:0:0: Attached scsi generic sg5 type 0
[   63.246208] systemd-journald[422]: Received client request to flush runtime journal.
[   64.284515] Adding 39251904k swap on /dev/mapper/vg--amure-swap.  Priority:-2 extents:1 across:39251904k FS
[   64.618407] EXT4-fs (sda2): mounting ext2 file system using the ext4 subsystem
[   64.645027] EXT4-fs (sda2): mounted filesystem without journal. Opts: (null)
[   65.086272] audit: type=1400 audit(1594807089.340:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=528 comm="apparmor_parser"
[   65.086978] audit: type=1400 audit(1594807089.340:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=527 comm="apparmor_parser"
[   65.087008] audit: type=1400 audit(1594807089.340:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=527 comm="apparmor_parser"
[   65.106970] audit: type=1400 audit(1594807089.360:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/man" pid=529 comm="apparmor_parser"
[   65.107002] audit: type=1400 audit(1594807089.360:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_filter" pid=529 comm="apparmor_parser"
[   65.107027] audit: type=1400 audit(1594807089.360:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_groff" pid=529 comm="apparmor_parser"
[   65.107901] audit: type=1400 audit(1594807089.360:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libvirtd" pid=531 comm="apparmor_parser"
[   65.107928] audit: type=1400 audit(1594807089.360:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libvirtd//qemu_bridge_helper" pid=531 comm="apparmor_parser"
[   65.196918] audit: type=1400 audit(1594807089.452:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="virt-aa-helper" pid=530 comm="apparmor_parser"
[   68.401440] e1000e 0000:a0:00.0 enp160s0f0: NIC Link is Up 1000 Mbps Full Duplex, Flow Control: Rx/Tx
[   68.401648] IPv6: ADDRCONF(NETDEV_CHANGE): enp160s0f0: link becomes ready
