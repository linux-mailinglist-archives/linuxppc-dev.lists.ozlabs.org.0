Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB847732275
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 00:08:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=UUkUJO8x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhxJb4GgMz3bnc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 08:08:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=UUkUJO8x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhxHf4pwBz2yDL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 08:07:57 +1000 (AEST)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3409d944009so18905ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 15:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686866874; x=1689458874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KEqKkThMQzQYaVyTD2kgo4GkHwhHxMZnpLhGp1yGLGI=;
        b=UUkUJO8xJ5iMueO5x9c8SwYef9EZOHxDfvAZbgkfxaEvGaVvhAUhHii88SWwduaCuJ
         3LZR94Yyt/OxjoUYt+mt6EilDMbtFPRgpBePZI0CIn4Imt966ERgil3bo/f7GRgiFl+h
         l7zgxquvdnnIm/CFlsjcIq1Nd+gwekG/Ot8ggAFy67rmjxInj9s4Rlwb8lI4GYEHG4Ki
         YIagzlm6SMj37/Os5RmAZ034nyBC16BD1QQHIlGIlk9zHkq9sEL2FddgroYHSzCz5g9v
         rNCl5B9GZgqZciU2HSVXf6ysfLlvH/OQ/XHbv3Aws7qZ3Q+jwtmNuhX/bzzBBAg0gVZd
         9u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686866874; x=1689458874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEqKkThMQzQYaVyTD2kgo4GkHwhHxMZnpLhGp1yGLGI=;
        b=c3Fyhkd0pngtii68LmL1ZxjJhf0VIKLr+uwTK1pIPx5OrY+0pBrnWOWNf2yk5TXidt
         1Xs21vcj9vko5tyUPzi0FL2QeRTCCJKY2aU5uLofNawGALO4Ws4jHldKBgq7cDwRPuUz
         Do+6pEojBaH/drx9hcEKjjrLWd6in3x5CTgqRQbiKj7UsgVWiMwjO5FCBBktVSzP342q
         f35y/R+nJPyZD+FGhkFljhG82Or4qwte2WvsofyR/DhjG6hulyVKb6KzLLi9Qt1wtaLO
         oCEdqrV+fFtQbh6O5Lo3LOgCc+pxoTy4zhm71gPMFaEjJJn6T6deGmdqaFfDs7QV0Btd
         Kbvw==
X-Gm-Message-State: AC+VfDwzMGSKnymIBD/WRW7gvZw50aYpAJz9VSJeT2eArP3uWx925Idn
	+PfoqzONW4hS25WTpwiagtXv2w==
X-Google-Smtp-Source: ACHHUZ5PSUsX4TBlglte5PXxwY7OQy07gHXQmXZtXOgld5DvEn3H3RXARC81CLd3B/5nJfh4T753eA==
X-Received: by 2002:a05:6e02:1caa:b0:33d:8c8a:cd0e with SMTP id x10-20020a056e021caa00b0033d8c8acd0emr242053ill.20.1686866873554;
        Thu, 15 Jun 2023 15:07:53 -0700 (PDT)
Received: from google.com ([2620:15c:183:202:e767:3e73:f240:e08c])
        by smtp.gmail.com with ESMTPSA id h21-20020a02b615000000b0041d89b79fdasm5824838jam.20.2023.06.15.15.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 15:07:53 -0700 (PDT)
Date: Thu, 15 Jun 2023 16:07:48 -0600
From: Yu Zhao <yuzhao@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v2 07/23] mips: update_mmu_cache() can replace
 __update_tlb()
Message-ID: <ZIuLtABQvb8yiMih@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
 <178970b0-1539-8aac-76fd-972c6c46ec17@google.com>
 <20230614231758.GA1503611@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614231758.GA1503611@dev-arch.thelio-3990X>
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 14, 2023 at 04:17:58PM -0700, Nathan Chancellor wrote:
> Hi Hugh,
> 
> On Thu, Jun 08, 2023 at 12:17:24PM -0700, Hugh Dickins wrote:
> > Don't make update_mmu_cache() a wrapper around __update_tlb(): call it
> > directly, and use the ptep (or pmdp) provided by the caller, instead of
> > re-calling pte_offset_map() - which would raise a question of whether a
> > pte_unmap() is needed to balance it.
> > 
> > Check whether the "ptep" provided by the caller is actually the pmdp,
> > instead of testing pmd_huge(): or test pmd_huge() too and warn if it
> > disagrees?  This is "hazardous" territory: needs review and testing.
> > 
> > Signed-off-by: Hugh Dickins <hughd@google.com>
> > ---
> >  arch/mips/include/asm/pgtable.h | 15 +++------------
> >  arch/mips/mm/tlb-r3k.c          |  5 +++--
> >  arch/mips/mm/tlb-r4k.c          |  9 +++------
> >  3 files changed, 9 insertions(+), 20 deletions(-)
> > 
> 
> I just bisected a crash while powering down a MIPS machine in QEMU to
> this change as commit 8044511d3893 ("mips: update_mmu_cache() can
> replace __update_tlb()") in linux-next. Unfortunately, I can still
> reproduce it with the existing fix you have for this change on the
> mailing list, which is present in next-20230614.
> 
> I can reproduce it with the GCC 13.1.0 on kernel.org [1].
> 
>   $ make -skj"$(nproc)" ARCH=mips CROSS_COMPILE=mips-linux- mrproper malta_defconfig vmlinux
> 
>   $ qemu-system-mipsel \
>       -display none \
>       -nodefaults \
>       -cpu 24Kf \
>       -machine malta \
>       -kernel vmlinux \
>       -initrd rootfs.cpio \
>       -m 512m \
>       -serial mon:stdio
>   ...
>   Linux version 6.4.0-rc6-next-20230614 (nathan@dev-arch.thelio-3990X) (mips-linux-gcc (GCC) 13.1.0, GNU ld (GNU Binutils) 2.40) #1 SMP Wed Jun 14 16:13:02 MST 2023
>   ...
>   Run /init as init process
>   process '/bin/busybox' started with executable stack
>   do_page_fault(): sending SIGSEGV to init for invalid read access from 0000003c
>   epc = 77b893dc in ld-uClibc-1.0.39.so[77b84000+8000]
>   ra  = 77b8930c in ld-uClibc-1.0.39.so[77b84000+8000]
>   Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>   ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> 
> The rootfs is available at [2] if it is needed. I am more than happy to
> provide additional information or test patches if necessary.
> 
> [1]: https://mirrors.edge.kernel.org/pub/tools/crosstool/
> [2]: https://github.com/ClangBuiltLinux/boot-utils/releases/download/20230609-194440/mipsel-rootfs.cpio.zst

Seeing this on real h/w as well (just to confirm).

Linux version 6.4.0-rc4-00437-g4bab5c42a698 (root@yuzhao.bld.corp.google.com) (mips64el-linux-gnuabi64-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #3 SMP PREEMPT Thu Jun 15 01:05:20 MDT 2023
Skipping L2 locking due to reduced L2 cache size
CVMSEG size: 2 cache lines (256 bytes)
printk: bootconsole [early0] enabled
CPU0 revision is: 000d9602 (Cavium Octeon III)
FPU revision is: 00739600
Kernel sections are not in the memory maps
Wasting 243712 bytes for tracking 4352 unused pages
Initrd not found or empty - disabling initrd
Using passed Device Tree.
software IO TLB: SWIOTLB bounce buffer size adjusted to 0MB
software IO TLB: area num 1.
software IO TLB: mapped [mem 0x000000000370d000-0x000000000374d000] (0MB)
Primary instruction cache 78kB, virtually tagged, 39 way, 16 sets, linesize 128 bytes.
Primary data cache 32kB, 32-way, 8 sets, linesize 128 bytes.
Zone ranges:
  DMA32    [mem 0x0000000001100000-0x00000000efffffff]
  Normal   empty
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000001100000-0x0000000003646fff]
  node   0: [mem 0x0000000003700000-0x000000000fafffff]
  node   0: [mem 0x0000000020000000-0x000000004ebfffff]
Initmem setup node 0 [mem 0x0000000001100000-0x000000004ebfffff]
On node 0, zone DMA32: 4352 pages in unavailable ranges
On node 0, zone DMA32: 185 pages in unavailable ranges
On node 0, zone DMA32: 1280 pages in unavailable ranges
On node 0, zone DMA32: 5120 pages in unavailable ranges
percpu: Embedded 15 pages/cpu s24368 r8192 d28880 u61440
pcpu-alloc: s24368 r8192 d28880 u61440 alloc=15*4096
pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
Kernel command line:  loglevel=8 console=ttyS0,115200
printk: log_buf_len individual max cpu contribution: 4096 bytes
printk: log_buf_len total cpu_extra contributions: 12288 bytes
printk: log_buf_len min size: 16384 bytes
printk: log_buf_len: 32768 bytes
printk: early log buf free: 14184(86%)
Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
Built 1 zonelists, mobility grouping on.  Total pages: 247772
mem auto-init: stack:all(zero), heap alloc:off, heap free:off
Memory: 950032K/1004828K available (8058K kernel code, 575K rwdata, 1880K rodata, 27488K init, 158K bss, 54796K reserved, 0K cma-reserved)
rcu: Preemptible hierarchical RCU implementation.
rcu: 	RCU event tracing is enabled.
rcu: 	RCU restricting CPUs from NR_CPUS=32 to nr_cpu_ids=4.
rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
NR_IRQS: 512
CIB interrupt controller probed: 800107000000e000 23
CIB interrupt controller probed: 800107000000e200 12
CIB interrupt controller probed: 800107000000e400 6
CIB interrupt controller probed: 800107000000ec00 15
CIB interrupt controller probed: 800107000000e600 4
CIB interrupt controller probed: 800107000000e800 11
CIB interrupt controller probed: 800107000000e900 11
rcu: srcu_init: Setting srcu_struct sizes based on contention.
clocksource: OCTEON_CVMCOUNT: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
Calibrating delay loop (skipped) preset value.. 2000.00 BogoMIPS (lpj=10000000)
pid_max: default: 32768 minimum: 301
LSM: initializing lsm=capability,integrity
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
rcu: Hierarchical SRCU implementation.
rcu: 	Max phase no-delay instances is 1000.
smp: Bringing up secondary CPUs ...
SMP: Booting CPU01 (CoreId  1)...
CPU1 revision is: 000d9602 (Cavium Octeon III)
FPU revision is: 00739600
SMP: Booting CPU02 (CoreId  2)...
CPU2 revision is: 000d9602 (Cavium Octeon III)
FPU revision is: 00739600
SMP: Booting CPU03 (CoreId  3)...
CPU3 revision is: 000d9602 (Cavium Octeon III)
FPU revision is: 00739600
smp: Brought up 1 node, 4 CPUs
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
futex hash table entries: 1024 (order: 5, 131072 bytes, linear)
NET: Registered PF_NETLINK/PF_ROUTE protocol family
PCIe: Initializing port 0
PCIe: BIST2 FAILED for port 0 (0x0000000000000003)
PCIe: Link timeout on port 0, probably the slot is empty
PCIe: Initializing port 1
PCIe: BIST FAILED for port 1 (0xffffffffffffffff)
PCIe: Link timeout on port 1, probably the slot is empty
HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
SCSI subsystem initialized
libata version 3.00 loaded.
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
PTP clock support registered
EDAC MC: Ver: 3.0.0
PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [mem 0x1000000000000]
pci_bus 0000:00: root bus resource [io  0x0000]
pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
vgaarb: loaded
clocksource: Switched to clocksource OCTEON_CVMCOUNT
NET: Registered PF_INET protocol family
IP idents hash table entries: 16384 (order: 5, 131072 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 8192 bytes, linear)
Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
TCP established hash table entries: 8192 (order: 4, 65536 bytes, linear)
TCP bind hash table entries: 8192 (order: 6, 262144 bytes, linear)
TCP: Hash tables configured (established 8192 bind 8192)
UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
PCI: CLS 0 bytes, default 128
platform 1180068000000.uctl: clocks initialized.
platform 1180069000000.uctl: clocks initialized.
Starting KVM with MIPS VZ extensions
workingset: timestamp_bits=62 max_order=18 bucket_order=0
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
nfs4filelayout_init: NFSv4 File Layout Driver Registering...
nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
io scheduler mq-deadline registered
io scheduler kyber registered
io scheduler bfq registered
gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
octeon_gpio 1070000000800.gpio-controller: OCTEON GPIO driver probed.
Serial: 8250/16550 driver, 2 ports, IRQ sharing disabled
printk: console [ttyS0] disabled
1180000000800.serial: ttyS0 at MMIO 0x1180000000800 (irq = 34, base_baud = 25000000) is a OCTEON
printk: console [ttyS0] enabled
printk: console [ttyS0] enabled
printk: bootconsole [early0] disabled
printk: bootconsole [early0] disabled
1180000000c00.serial: ttyS1 at MMIO 0x1180000000c00 (irq = 35, base_baud = 25000000) is a OCTEON
loop: module loaded
Driver 'pata_octeon_cf' needs updating - please use bus_type methods
slram: not enough parameters.
spi-octeon 1070000001000.spi: OCTEON SPI bus driver
process '/bin/kmod' started with executable stack
do_page_fault(): sending SIGSEGV to modprobe for invalid read access from 0000000000000298
epc = 000000fff3346470 in ld.so.1[fff3328000+2e000]
ra  = 000000fff33456d0 in ld.so.1[fff3328000+2e000]
do_page_fault(): sending SIGSEGV to modprobe for invalid read access from 0000000000000298
epc = 000000fff3c78470 in ld.so.1[fff3c5a000+2e000]
ra  = 000000fff3c776d0 in ld.so.1[fff3c5a000+2e000]
do_page_fault(): sending SIGSEGV to modprobe for invalid read access from 0000000000021da8
epc = 000000fff35aa2c0 in ld.so.1[fff358d000+2e000]
ra  = 000000fff35aa688 in ld.so.1[fff358d000+2e000]
do_page_fault(): sending SIGSEGV to modprobe for invalid read access from 0000000000000298
epc = 000000fff34cc470 in ld.so.1[fff34ae000+2e000]
ra  = 000000fff34cb6d0 in ld.so.1[fff34ae000+2e000]
mdio_octeon 1180000001800.mdio: Probed
mdio_octeon 1180000001900.mdio: Probed
dwc3 1680000000000.xhci: Configuration mismatch. dr_mode forced to host
dwc3 1690000000000.xhci: Configuration mismatch. dr_mode forced to host
xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 1
xhci-hcd xhci-hcd.0.auto: hcc params 0x0220f06d hci version 0x100 quirks 0x0000000002010010
xhci-hcd xhci-hcd.0.auto: irq 25, io mem 0x1680000000000
dwc3 1680000000000.xhci: xhci_plat_probe get usb3phy fail (ret=-6)
xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 2
xhci-hcd xhci-hcd.0.auto: Host supports USB 3.0 SuperSpeed
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 1 port detected
xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 3
xhci-hcd xhci-hcd.1.auto: hcc params 0x0220f06d hci version 0x100 quirks 0x0000000002010010
xhci-hcd xhci-hcd.1.auto: irq 26, io mem 0x1690000000000
dwc3 1690000000000.xhci: xhci_plat_probe get usb3phy fail (ret=-6)
xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 4
xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 1 port detected
usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 1 port detected
usbcore: registered new interface driver usb-storage
i2c-octeon 1180000001000.i2c: probed
i2c-octeon 1180000001200.i2c: probed
octeon_wdt: Initial granularity 5 Sec
EDAC DEVICE0: Giving out device to module octeon-cpu controller cache: DEV octeon_pc_edac (INTERRUPT)
EDAC DEVICE1: Giving out device to module octeon-l2c controller octeon_l2c_err: DEV octeon_l2c_edac (POLLED)
octeon_lmc_edac octeon_lmc_edac.0: Disabled (ECC not enabled)
Interface 0 has 4 ports (SGMII)
Interface 1 has 4 ports (SGMII)
Interface 3 has 4 ports (LOOP)
NET: Registered PF_INET6 protocol family
Segment Routing with IPv6
In-situ OAM (IOAM) with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered PF_PACKET protocol family
Key type dns_resolver registered
OF: fdt: not creating '/sys/firmware/fdt': CRC check failed
Freeing unused kernel image (initmem) memory: 27488K
This architecture does not have kernel memory protection.
Run /init as init process
  with arguments:
    /init
  with environment:
    HOME=/
    TERM=linux
do_page_fault(): sending SIGSEGV to init for invalid read access from 0000000000021da8
epc = 000000fff3a542c0 in ld.so.1[fff3a37000+2e000]
ra  = 000000fff3a54688 in ld.so.1[fff3a37000+2e000]
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
