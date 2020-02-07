Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB431553B2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 09:29:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DT4C2kwvzDqhn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 19:29:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=pzrHF0EB; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DT2q4LxqzDqf0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 19:28:17 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48DT2g3x3NzB09ZL;
 Fri,  7 Feb 2020 09:28:11 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=pzrHF0EB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Iwhh_YsX0rAz; Fri,  7 Feb 2020 09:28:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48DT2g2pK7zB09ZJ;
 Fri,  7 Feb 2020 09:28:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581064091; bh=lrUfzRyhojLWVO6W9WJO9Q4UPNRLe8woHRMDMY2VMhs=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=pzrHF0EBKzRrjb/MfIAY02KihSqtVm2akZgbIdBP5Fv+AvQDdCTHtXskYKITuV5bG
 UYE9D6/5nQG7pxUiPtW7VVSOWQdlkwVKh1VtMGhnmB1GjgbcFsIs2gMCXPFQ/5gyFV
 e7dshXfDeHPufiqQI8DxO5L8QNjNyReFFKOXhX30=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8A63A8B8B5;
 Fri,  7 Feb 2020 09:28:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id G9EmNEWwkH5Y; Fri,  7 Feb 2020 09:28:12 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 451DB8B8B2;
 Fri,  7 Feb 2020 09:28:12 +0100 (CET)
Subject: Re: [PATCH v5 17/17] powerpc/32s: Enable CONFIG_VMAP_STACK
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Guenter Roeck <linux@roeck-us.net>
References: <cover.1576916812.git.christophe.leroy@c-s.fr>
 <2e2509a242fd5f3e23df4a06530c18060c4d321e.1576916812.git.christophe.leroy@c-s.fr>
 <20200206203146.GA23248@roeck-us.net>
 <c6285f2a-f8f5-0d97-2d80-061da1f1a7fc@c-s.fr>
Message-ID: <0f866131-4292-a66b-2637-c34139277486@c-s.fr>
Date: Fri, 7 Feb 2020 08:28:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <c6285f2a-f8f5-0d97-2d80-061da1f1a7fc@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/07/2020 06:13 AM, Christophe Leroy wrote:
> 
> 
> Le 06/02/2020 à 21:31, Guenter Roeck a écrit :
>> On Sat, Dec 21, 2019 at 08:32:38AM +0000, Christophe Leroy wrote:
>>> A few changes to retrieve DAR and DSISR from struct regs
>>> instead of retrieving them directly, as they may have
>>> changed due to a TLB miss.
>>>
>>> Also modifies hash_page() and friends to work with virtual
>>> data addresses instead of physical ones. Same on load_up_fpu()
>>> and load_up_altivec().
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>
>> This patch results in qemu boot failures (mac99 with pmac32_defconfig).
>> Images fail silently; there is no console output. Reverting the patch
>> fixes the problem. Bisect log is attached below.
>>
>> Assuming this was tested on real hardware, am I correct to assume that 
>> qemu
>> for ppc32 (more specifically, qemu's mac99 and g3beige machines) no 
>> longer
>> works with the upstream kernel ?
> 
> Before submitting the series, I successfully tested:
> - Real HW with powerpc 8xx
> - Real HW with powerpc 832x
> - Qemu's mac99
> 
> I'll re-check the upstream kernel.
> 

This is still working for me with the upstream kernel:


 >> =============================================================
 >> OpenBIOS 1.1 [Oct 19 2017 07:00]
 >> Configuration device id QEMU version 1 machine id 1
 >> CPUs: 1
 >> Memory: 1024M
 >> UUID: 00000000-0000-0000-0000-000000000000
 >> CPU type PowerPC,G4
milliseconds isn't unique.
Welcome to OpenBIOS v1.1 built on Oct 19 2017 07:00
 >> [ppc] Kernel already loaded (0x01000000 + 0x00902a90) (initrd 
0x01a03000 + 0x001d1a3b)
 >> [ppc] Kernel command line: early_ioremap_debug console=ttyS0
OF stdout device is: /pci@f2000000/mac-io@c/escc@13000/ch-a@13020
Preparing to boot Linux version 5.5.0+ (root@pc16570vm.idsi0.si.c-s.fr) 
(gcc version 5.5.0 (GCC)) #3111 Fri Feb 7 07:23:08 UTC 2020
Detected machine type: 00000400
command line:
memory layout at init:
   memory_limit : 00000000 (16 MB aligned)
   alloc_bottom : 01bd5000
   alloc_top    : 30000000
   alloc_top_hi : 40000000
   rmo_top      : 30000000
   ram_top      : 40000000
copying OF device tree...
Building dt strings...
Building dt structure...
Device tree strings 0x01bd6000 -> 0x01bd50a4
Device tree struct  0x01bd7000 -> 0x3fde7ef8
Quiescing Open Firmware ...
Booting Linux via __start() @ 0x01000000 ...
Hello World !
Total memory = 1024MB; using 2048kB for hash table
Activating Kernel Userspace Execution Prevention
Activating Kernel Userspace Access Protection
Linux version 5.5.0+ (root@pc16570vm.idsi0.si.c-s.fr) (gcc version 5.5.0 
(GCC)) #3111 Fri Feb 7 07:23:08 UTC 2020
Found initrd at 0xc1a03000:0xc1bd4a3b
ioremap() called early from pmac_feature_init+0xd8/0xad0. Use 
early_ioremap() instead
Found UniNorth memory controller & host bridge @ 0xf8000000 revision: 
0xa2cfbc60
Mapped at 0xff3c0000
ioremap() called early from probe_one_macio+0x124/0x228. Use 
early_ioremap() instead
Found a Keylargo mac-io controller, rev: 0, mapped at 0x(ptrval)
PowerMac motherboard: PowerMac G4 AGP Graphics
ioremap() called early from udbg_scc_init+0x164/0x35c. Use 
early_ioremap() instead
boot stdout isn't a display !
ioremap() called early from find_via_cuda+0x9c/0x3d4. Use 
early_ioremap() instead
Using PowerMac machine description
printk: bootconsole [udbg0] enabled
-----------------------------------------------------
phys_mem_size     = 0x40000000
dcache_bsize      = 0x20
icache_bsize      = 0x20
cpu_features      = 0x000000000401a00a
   possible        = 0x00000000277de14b
   always          = 0x0000000000000000
cpu_user_features = 0x9c000001 0x00000000
mmu_features      = 0x00000001
Hash_size         = 0x200000
Hash_mask         = 0x7fff
-----------------------------------------------------
ioremap() called early from pmac_pci_init+0x1b8/0x6e4. Use 
early_ioremap() instead
ioremap() called early from pmac_pci_init+0x1d0/0x6e4. Use 
early_ioremap() instead
Found UniNorth PCI host bridge at 0x00000000f2000000. Firmware bus 
number: 0->0
PCI host bridge /pci@f2000000 (primary) ranges:
   IO 0x00000000f2000000..0x00000000f27fffff -> 0x0000000000000000
ioremap() called early from pci_process_bridge_OF_ranges+0x1e4/0x2c0. 
Use early_ioremap() instead
  MEM 0x0000000080000000..0x000000008fffffff -> 0x0000000080000000
ioremap() called early from pmac_setup_arch+0x10c/0x294. Use 
early_ioremap() instead
ioremap() called early from pmac_nvram_init+0x140/0x4f8. Use 
early_ioremap() instead
nvram: Checking bank 0...
Invalid signature
Invalid checksum
nvram: gen0=0, gen1=0
nvram: Active bank is: 0
nvram: OF partition at 0xffffffff
nvram: XP partition at 0xffffffff
nvram: NR partition at 0xffffffff
Zone ranges:
   DMA      [mem 0x0000000000000000-0x000000002fffffff]
   Normal   empty
   HighMem  [mem 0x0000000030000000-0x000000003fffffff]
Movable zone start for each node
Early memory node ranges
   node   0: [mem 0x0000000000000000-0x000000003fffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x000000003fffffff]
Built 1 zonelists, mobility grouping on.  Total pages: 260608
Kernel command line: early_ioremap_debug console=ttyS0
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 1026364K/1048576K available (6476K kernel code, 684K rwdata, 
1612K rodata, 268K init, 186K bss, 22212K reserved, 0K cma-reserved, 
262144K highmem)
Kernel virtual memory layout:
   * 0xffbcf000..0xfffff000  : fixmap
   * 0xff400000..0xff800000  : highmem PTEs
   * 0xfeb36000..0xff400000  : early ioremap
   * 0xf1000000..0xfeb36000  : vmalloc & ioremap
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
mpic: Setting up MPIC " MPIC 1   " version 1.2 at 80040000, max 1 CPUs
mpic: ISU size: 64, shift: 6, mask: 3f
mpic: Initializing for 64 sources
GMT Delta read from XPRAM: 0 minutes, DST: on
clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 
0x171024e7e0, max_idle_ns: 440795205315 ns
clocksource: timebase mult[a000000] shift[24] registered
Console: colour dummy device 80x25
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
devtmpfs: initialized
random: get_random_u32 called from bucket_table_alloc.isra.27+0x64/0x188 
with crng_init=0
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, 
max_idle_ns: 7645041785100000 ns
futex hash table entries: 256 (order: -1, 3072 bytes, linear)
NET: Registered protocol family 16

PCI: Probing PCI hardware
PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0x7fffff]
pci_bus 0000:00: root bus resource [mem 0x80000000-0x8fffffff]
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
pci 0000:00:0b.0: [106b:0020] type 00 class 0x060000
pci 0000:00:0c.0: [106b:0022] type 00 class 0xff0000
pci 0000:00:0c.0: reg 0x10: [mem 0x80000000-0x8007ffff]
pci 0000:00:0d.0: [106b:003f] type 00 class 0x0c0310
pci 0000:00:0d.0: reg 0x10: [mem 0x80080000-0x800800ff]
pci 0000:00:0e.0: [10ec:8029] type 00 class 0x020000
pci 0000:00:0e.0: reg 0x10: [io  0x1000-0x10ff]
pci 0000:00:0e.0: reg 0x30: [mem 0x800c0000-0x800fffff pref]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
pci_bus 0000:00: resource 4 [io  0x0000-0x7fffff]
pci_bus 0000:00: resource 5 [mem 0x80000000-0x8fffffff]
vgaarb: loaded
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
clocksource: Switched to clocksource timebase
NET: Registered protocol family 2
tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, 
linear)
TCP established hash table entries: 8192 (order: 3, 32768 bytes, linear)
TCP bind hash table entries: 8192 (order: 3, 32768 bytes, linear)
TCP: Hash tables configured (established 8192 bind 8192)
UDP hash table entries: 512 (order: 1, 8192 bytes, linear)
UDP-Lite hash table entries: 512 (order: 1, 8192 bytes, linear)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
PCI: CLS 0 bytes, default 32
Trying to unpack rootfs image as initramfs...
Freeing initrd memory: 1860K
Initialise system trusted keyrings
workingset: timestamp_bits=30 max_order=18 bucket_order=0
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
Key type asymmetric registered
Asymmetric key parser 'x509' registered
bounce: pool size: 64 pages
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler mq-deadline registered
io scheduler kyber registered
Non-volatile memory driver v1.3
brd: module loaded
loop: module loaded
MacIO PCI driver attached to Keylargo chipset
Macintosh Cuda and Egret driver.
mesh: configured for synchronous 5 MB/s
st: Version 20160209, fixed bufsize 32768, s/g segs 256
Detected ADB keyboard, type ANSI.
input: ADB keyboard as /devices/virtual/input/input0
random: fast init done
input: ADB mouse as /devices/virtual/input/input1
pata-macio 0.00020000:ata-3: Activating pata-macio chipset KeyLargo 
ATA-3, Apple bus ID 0
scsi host0: pata_macio
ata1: PATA max MWDMA2 irq 16
pata-macio 0.00021000:ata-3: Activating pata-macio chipset KeyLargo 
ATA-3, Apple bus ID 1
scsi host1: pata_macio
ata2: PATA max MWDMA2 irq 18
pcnet32: pcnet32.c:v1.35 21.Apr.2008 tsbogend@alpha.franken.de
PPP generic driver version 2.4.2
PPP Deflate Compression module registered
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci-pci: OHCI PCI platform driver
ohci-pci 0000:00:0d.0: OHCI PCI host controller
ohci-pci 0000:00:0d.0: new USB bus registered, assigned bus number 1
ohci-pci 0000:00:0d.0: irq 28, io mem 0x80080000
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 3 ports detected
usbcore: registered new interface driver appletouch
rtc-generic rtc-generic: registered as rtc0
APM Battery Driver
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
oprofile: using timer interrupt.
Initializing XFRM netlink socket
NET: Registered protocol family 17
NET: Registered protocol family 15
Key type dns_resolver registered
drmem: No dynamic reconfiguration memory found
Loading compiled-in X.509 certificates
rtc-generic rtc-generic: setting system clock to 2020-02-07T07:46:01 UTC 
(1581061561)
Warning: unable to open an initial console.
ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
scsi 1:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM     2.5+ PQ: 0 ANSI: 5
sr 1:0:0:0: [sr0] scsi3-mmc drive: 4x/4x cd/rw xa/form2 tray
cdrom: Uniform CD-ROM driver Revision: 3.20
sr 1:0:0:0: Attached scsi generic sg0 type 5
Freeing unused kernel memory: 268K
This architecture does not have kernel memory protection.
Run /init as init process


Christophe
