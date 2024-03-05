Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 516D087128A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 02:58:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=W2UD9PQk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpdyB11lcz3dTr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 12:58:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=W2UD9PQk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.171; helo=mout-p-201.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpdxH0sgQz3bV2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 12:57:37 +1100 (AEDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Tpdx72VXFz9t9t;
	Tue,  5 Mar 2024 02:57:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1709603851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r0W/xSsgYZieznhpfZ/EUvPWRHdiBSmyoWxwuS9P1Jw=;
	b=W2UD9PQkVoTXvCDwMWTcAIWkbFrKzUvXtuBPbOcDcYxWCHoUt6ndr0wrGeNtPyqwN7jvJD
	15xXafu0csY1C0Z5DfZrSKnglZ9XUide3Xhun85IWcL98yUvP/U4jiggIMC864pT26flkj
	l/6D08di7iC/tsANYkTTuzjMqFaFYAQWJxpNnfHci751vE7Xv1yjsLtsdFDjBfRxOwH/x3
	sznlpvJjhgcZlqKFCWt39AyzfO2WpGWRqJn7Qt/q2wbNllUk9FnOYzPbwKyXsHnNzk/hVg
	fhpOzE7E7+WLhT8ajuUyck3dW6dUjpA+yVwYUOrGlcPm6Kz6+Z5FVhln/sqisQ==
Date: Tue, 5 Mar 2024 02:57:24 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: BUG: Bad page map in process init pte:c0ab684c pmd:01182000 (on
 a PowerMac G4 DP)
Message-ID: <20240305025724.7733c3a3@yea>
In-Reply-To: <707f617f-45c8-4fa1-83aa-779f2b542871@csgroup.eu>
References: <20221130224402.15c0cf8b@yea>
	<COZK2W38W2NA.27P9YGDJYUOBO@bobo>
	<20240229020941.2b30abe0@yea>
	<707f617f-45c8-4fa1-83aa-779f2b542871@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/Kn_DPsjWzthGNH9x5hato4f"
X-MBO-RS-META: oirx344sqh4q7aafor79p899d7u9xywg
X-MBO-RS-ID: d0811fee67beb2e8970
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--MP_/Kn_DPsjWzthGNH9x5hato4f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, 29 Feb 2024 17:11:28 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Interesting.
> 
> I guess 0xe0000000 is where linear RAM starts to be mapped with pages ? 
> Can you confirm with a dump of 
> /sys/kernel/debug/powerpc/block_address_translation ?
> 
> Do we have a problem of race with hash table ?

What I sometimes get at boot which may be related is this "BUG: KASAN: slab-out-of-bounds in filemap_map_pages":

[...]
BUG: KASAN: slab-out-of-bounds in filemap_map_pages+0x5e8/0x98c
Read of size 4 at addr c43beb88 by task (udev-worker)/595

CPU: 0 PID: 595 Comm: (udev-worker) Not tainted 6.8.0-rc7-PMacG4 #1
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
ohci-pci 0001:00:12.0: OHCI PCI host controller
[f40abc10] [c1675c5c] dump_stack_lvl+0x60/0x80 (unreliable)
[f40abc30] [c04c4fd4] print_report+0xd4/0x4fc
[f40abc80] [c04c5680] kasan_report+0xfc/0x10c
[f40abd00] [c03bd348] filemap_map_pages+0x5e8/0x98c
[f40abde0] [c0447380] handle_mm_fault+0x14fc/0x1988
[f40abec0] [c00462b0] ___do_page_fault+0x918/0xbf0
[f40abf10] [c004697c] do_page_fault+0x28/0x50
[f40abf30] [c000433c] DataAccess_virt+0x124/0x17c
ohci-pci 0001:00:12.0: new USB bus registered, assigned bus number 3
--- interrupt: 300 at 0x8a5d50
NIP:  008a5d50 LR: 008a5cd4 CTR: 00486290
REGS: f40abf40 TRAP: 0300   Not tainted  (6.8.0-rc7-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24004280  XER: 00000000
ohci-pci 0001:00:12.0: irq 52, io mem 0x8008c000
DAR: a6ed7038 DSISR: 40000000 
GPR00: 008a6a1c afe0f3a0 a7adf6e0 013d9620 013aefd0 00000000 00000000 00000000 
GPR08: 00000000 a6ed7038 00000000 afe0fbf0 44004280 009afaf4 afe0fc9c afe0fcb4 
GPR16: afe0fcb0 afe0fca8 afe0fcb8 00000000 afe0fcac a6ed7000 0000005b 0000003f 
GPR24: 0000002a afe0f3b4 013aefd0 00000000 013d9620 013d9620 009b311c afe0f3a0 
NIP [008a5d50] 0x8a5d50
LR [008a5cd4] 0x8a5cd4
--- interrupt: 300

Allocated by task 1 on cpu 1 at 4.791311s:
 kasan_save_stack+0x38/0x54
 kasan_save_track+0x20/0x3c
 __kasan_slab_alloc+0x60/0x6c
 kmem_cache_alloc+0x19c/0x264
 __kernfs_new_node+0xfc/0x54c
 kernfs_new_node+0x138/0x180
usb usb3: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 6.08
 __kernfs_create_file+0x44/0x2c8
 sysfs_add_file_mode_ns+0x284/0x304
 internal_create_group+0x7dc/0xa54
 sysfs_slab_add+0xb0/0x240
usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
 __kmem_cache_create+0xf0/0x2cc
 kmem_cache_create_usercopy+0x150/0x21c
usb usb3: Product: OHCI PCI host controller
 bioset_init+0x4fc/0x808
 btrfs_init_compress+0x38/0x25c
 init_btrfs_fs+0xa8/0x288
 do_one_initcall+0x144/0x434
usb usb3: Manufacturer: Linux 6.8.0-rc7-PMacG4 ohci_hcd
 kernel_init_freeable+0x7d4/0x7f4
usb usb3: SerialNumber: 0001:00:12.0
 kernel_init+0x28/0x148
 ret_from_kernel_user_thread+0x10/0x18

The buggy address belongs to the object at c43beb30
 which belongs to the cache kernfs_node_cache of size 88
The buggy address is located 0 bytes to the right of
 allocated 88-byte region [c43beb30, c43beb88)

The buggy address belongs to the physical page:
page:eee706b8 refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0x43be
flags: 0x800(slab|zone=0)
page_type: 0xffffffff()
raw: 00000800 c208ee20 00000100 00000122 00000000 001e003c ffffffff 00000001
raw: 00000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x12cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY), pid 1, tgid 1 (swapper/0), ts 4790613568, free_ts 4778274944
 prep_new_page+0x24/0x9c
 get_page_from_freelist+0xcd0/0xeec
 __alloc_pages+0x1e0/0xe08
 alloc_slab_page+0x30/0x6c
 new_slab+0xb4/0x308
 ___slab_alloc+0x400/0x5c8
 kmem_cache_alloc+0xfc/0x264
 __kernfs_new_node+0xfc/0x54c
 kernfs_new_node+0x138/0x180
 __kernfs_create_file+0x44/0x2c8
 sysfs_add_file_mode_ns+0x284/0x304
 sysfs_merge_group+0x2e0/0x310
 btrfs_init_sysfs+0x3a8/0x52c
 init_btrfs_fs+0xa8/0x288
 do_one_initcall+0x144/0x434
 kernel_init_freeable+0x7d4/0x7f4
page last free pid 1 tgid 1 stack trace:
 free_unref_page_prepare+0x2a8/0x440
 free_unref_page+0x84/0x2a8
 destroy_args+0x1b8/0x388
 debug_vm_pgtable+0xc40/0x12c0
 do_one_initcall+0x144/0x434
 kernel_init_freeable+0x7d4/0x7f4
 kernel_init+0x28/0x148
 ret_from_kernel_user_thread+0x10/0x18

Memory state around the buggy address:
 c43bea80: fc fc fc fc fc 00 00 00 00 00 00 00 00 00 00 00
 c43beb00: fc fc fc fc fc fc 00 00 00 00 00 00 00 00 00 00
>c43beb80: 00 fc fc fc fc fc fc 00 00 00 00 00 00 00 00 00
              ^
 c43bec00: 00 00 fc fc fc fc fc fc 00 00 00 00 00 00 00 00
 c43bec80: 00 00 00 fc fc fc fc fc fc 00 00 00 00 00 00 00
==================================================================
Disabling lock debugging due to kernel taint
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 3 ports detected
b43-pci-bridge 0001:00:16.0: enabling device (0004 -> 0006)
------------[ cut here ]------------
kernel BUG at include/linux/swapops.h:466!
Oops: Exception in kernel mode, sig: 5 [#1]
BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 DEBUG_PAGEALLOC PowerMac
Modules linked in: ssb(+) pcmcia pcmcia_core hwmon drm_suballoc_helper i2c_algo_bit drm_ttm_helper ttm drm_display_helper backlight ohci_pci(+)
CPU: 0 PID: 595 Comm: (udev-worker) Tainted: G    B              6.8.0-rc7-PMacG4 #1
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
NIP:  c03c10d0 LR: c03c1084 CTR: 00000000
REGS: f40abb90 TRAP: 0700   Tainted: G    B               (6.8.0-rc7-PMacG4)
MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 22084f32  XER: 00000000

GPR00: c03c1084 f40abc50 c34e8020 ef1253e8 fefefefe 00000000 f40abcb8 00000008 
GPR08: 00000000 00000000 00000003 f40abc50 22084f32 009afaf4 1e8157c6 000f4240 
GPR16: 00000000 afe1873c c6d868e0 00000001 c34e8390 f40abe3c 00707908 f40abf40 
GPR24: a6ed6767 70c177aa c5e8b440 00000026 c6516884 ef1253e8 ef1253e8 fe81578c 
NIP [c03c10d0] migration_entry_wait_on_locked+0x184/0x34c
LR [c03c1084] migration_entry_wait_on_locked+0x138/0x34c
Call Trace:
[f40abc50] [c03c1084] migration_entry_wait_on_locked+0x138/0x34c (unreliable)
[f40abd10] [c04caa94] migration_entry_wait+0xf0/0x110
[f40abd70] [c04440b0] do_swap_page+0x208/0x16d8
[f40abde0] [c0447808] handle_mm_fault+0x1984/0x1988
ohci-pci 0001:00:12.1: OHCI PCI host controller
[f40abec0] [c00462b0] ___do_page_fault+0x918/0xbf0
[f40abf10] [c004697c] do_page_fault+0x28/0x50
[f40abf30] [c000433c] DataAccess_virt+0x124/0x17c
--- interrupt: 300 at 0x6f7bd0
NIP:  006f7bd0 LR: 006f7b60 CTR: 006f3e60
REGS: f40abf40 TRAP: 0300   Tainted: G    B               (6.8.0-rc7-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 4200448c  XER: 20000000
DAR: a6ed6767 DSISR: 40000000 
GPR00: 006f983c afe162c0 a7adf6e0 013dfd00 20026767 afe175dc afe18614 00000007 
GPR08: 839b87df 00026767 00000000 00000003 4200448c 009afaf4 00000000 000f4240 
GPR16: 00000000 afe1873c 00000000 0aba9500 00000009 afe18724 00707908 afe1872c 
GPR24: afe175dc 013dfd00 20000000 013d8040 afe175dc 20026767 00727c74 a6ed6767 
ohci-pci 0001:00:12.1: new USB bus registered, assigned bus number 4
NIP [006f7bd0] 0x6f7bd0
LR [006f7b60] 0x6f7b60
--- interrupt: 300
Code: 5529cffe 7d485010 7d290194 5529063e 2c090000 41820010 2c080000 41a20008 481057b9 813e0000 71290001 40a20008 <0fe00000> 7fa3eb78 3fa061c8 3f40c1f7 
---[ end trace 0000000000000000 ]---
[...]

Also got a different hit "BUG: KASAN: slab-out-of-bounds in handle_mm_fault+0x9d4/0x19ac" with a slightly different .config with kernel 6.8-rc6. Kernel .config + both dmesg attached.

Regards,
Erhard

--MP_/Kn_DPsjWzthGNH9x5hato4f
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=dmesg_68-rc7_g4_v01.txt

[    0.000000] Total memory = 2048MB; using 4096kB for hash table
[    0.000000] Activating Kernel Userspace Access Protection
[    0.000000] Activating Kernel Userspace Execution Prevention
[    0.000000] Linux version 6.8.0-rc7-PMacG4 (root@T1000) (gcc (Gentoo 13.2.1_p20240210 p13) 13.2.1 20240210, GNU ld (Gentoo 2.41 p4) 2.41.0) #1 SMP Tue Mar  5 01:35:43 CET 2024
[    0.000000] KASAN init done
[    0.000000] ioremap() called early from pmac_feature_init+0x2a0/0x11e4. Use early_ioremap() instead
[    0.000000] Found UniNorth memory controller & host bridge @ 0xf8000000 revision: 0x24
[    0.000000] Mapped at 0xf53bf000
[    0.000000] ioremap() called early from probe_one_macio+0x234/0x6dc. Use early_ioremap() instead
[    0.000000] Found a Keylargo mac-io controller, rev: 3, mapped at 0x(ptrval)
[    0.000000] PowerMac motherboard: PowerMac G4 Windtunnel
[    0.000000] ioremap() called early from btext_map+0x5c/0x7c. Use early_ioremap() instead
[    0.000000] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[    0.000000] printk: legacy bootconsole [udbg0] enabled
[    0.000000] CPU maps initialized for 1 thread per core
[    0.000000]  (thread shift is 0)
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x80000000
[    0.000000] dcache_bsize      = 0x20
[    0.000000] icache_bsize      = 0x20
[    0.000000] cpu_features      = 0x000000002514600a
[    0.000000]   possible        = 0x00000000277de00a
[    0.000000]   always          = 0x0000000001000000
[    0.000000] cpu_user_features = 0x9c000001 0x00000000
[    0.000000] mmu_features      = 0x00010201
[    0.000000] Hash_size         = 0x400000
[    0.000000] Hash_mask         = 0xffff
[    0.000000] -----------------------------------------------------
[    0.000000] ioremap() called early from pmac_setup_arch+0x1e4/0x6c0. Use early_ioremap() instead
[    0.000000] ioremap() called early from find_via_pmu+0x4cc/0x5b8. Use early_ioremap() instead
[    0.000000] ioremap() called early from find_via_pmu+0x1b0/0x5b8. Use early_ioremap() instead
[    0.000000] via-pmu: Server Mode is disabled
[    0.000000] PMU driver v2 initialized for Core99, firmware: 0c
[    0.000000] ioremap() called early from pmac_nvram_init+0x48c/0xeb0. Use early_ioremap() instead
[    0.000000] nvram: Checking bank 0...
[    0.000000] nvram: gen0=3393, gen1=3394
[    0.000000] nvram: Active bank is: 1
[    0.000000] nvram: OF partition at 0x410
[    0.000000] nvram: XP partition at 0x1020
[    0.000000] nvram: NR partition at 0x1120
[    0.000000] Top of RAM: 0x80000000, Total RAM: 0x80000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x000000002fffffff]
[    0.000000]   Normal   empty
[    0.000000]   HighMem  [mem 0x0000000030000000-0x000000007fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000] percpu: Embedded 29 pages/cpu s24800 r8192 d85792 u118784
[    0.000000] pcpu-alloc: s24800 r8192 d85792 u118784 alloc=29*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 
[    0.000000] Kernel command line: ro debug_pagealloc=on page_owner=on root=/dev/sda5 slub_debug=FZP page_poison=1 netconsole=6666@192.168.2.8/eth0,6666@192.168.2.3/A8:A1:59:16:4F:EA debug 
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 522560
[    0.000000] allocated 35651584 bytes of page_ext
[    0.000000] mem auto-init: stack:all(pattern), heap alloc:off, heap free:off
[    0.000000] stackdepot: allocating hash table via alloc_large_system_hash
[    0.000000] stackdepot hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xf6000000..0xfec00000  : kasan shadow mem
[    0.000000]   * 0xf5bbf000..0xf5fff000  : fixmap
[    0.000000]   * 0xf5400000..0xf5800000  : highmem PTEs
[    0.000000]   * 0xf5115000..0xf5400000  : early ioremap
[    0.000000]   * 0xf1000000..0xf5110000  : vmalloc & ioremap
[    0.000000]   * 0xb0000000..0xc0000000  : modules
[    0.000000] Memory: 1898556K/2097152K available (23444K kernel code, 1980K rwdata, 5228K rodata, 1624K init, 408K bss, 198596K reserved, 0K cma-reserved, 1212416K highmem)
[    0.000000] **********************************************************
[    0.000000] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    0.000000] **                                                      **
[    0.000000] ** This system shows unhashed kernel memory addresses   **
[    0.000000] ** via the console, logs, and other interfaces. This    **
[    0.000000] ** might reduce the security of your system.            **
[    0.000000] **                                                      **
[    0.000000] ** If you see this message and you are not debugging    **
[    0.000000] ** the kernel, report this immediately to your system   **
[    0.000000] ** administrator!                                       **
[    0.000000] **                                                      **
[    0.000000] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    0.000000] **********************************************************
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] Node 0, zone      DMA: page owner found early allocated 49 pages
[    0.000000] Node 0, zone  HighMem: page owner found early allocated 0 pages
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] mpic: Resetting
[    0.000000] mpic: Setting up MPIC " MPIC 1   " version 1.2 at 80040000, max 2 CPUs
[    0.000000] mpic: ISU size: 64, shift: 6, mask: 3f
[    0.000000] mpic: Initializing for 64 sources
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] time_init: decrementer frequency = 41.658676 MHz
[    0.000000] time_init: processor frequency   = 1416.666661 MHz
[    0.000009] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x99b9699db, max_idle_ns: 440795204297 ns
[    0.000575] clocksource: timebase mult[18012db2] shift[24] registered
[    0.001096] clockevent: decrementer mult[aaa249b] shift[32] cpu[0]
[    0.004607] Console: colour dummy device 80x25
[    0.005105] printk: legacy console [tty0] enabled
[    0.005589] printk: legacy bootconsole [udbg0] disabled
[    0.006165] pid_max: default: 32768 minimum: 301
[    0.011033] LSM: initializing lsm=capability,yama
[    0.011250] Yama: becoming mindful.
[    0.013927] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.014103] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.031947] PowerMac SMP probe found 2 cpus
[    0.033045] KeyWest i2c @0xf8001003 irq 42 /uni-n@f8000000/i2c@f8001000
[    0.033680]  channel 0 bus <multibus>
[    0.033776]  channel 1 bus <multibus>
[    0.034076] KeyWest i2c @0x80018000 irq 26 /pci@f2000000/mac-io@17/i2c@18000
[    0.034212]  channel 0 bus <multibus>
[    0.034341] PMU i2c /pci@f2000000/mac-io@17/via-pmu@16000/pmu-i2c
[    0.035023]  channel 1 bus <multibus>
[    0.035120]  channel 2 bus <multibus>
[    0.035366] pmf: no parser for command 17 !
[    0.035519] Processor timebase sync using GPIO 0x73
[    0.035554] mpic: requesting IPIs...
[    0.035989] CPU0: L2CR is 80000000
[    0.036024] CPU0: L3CR is 9c030000
[    0.043332] RCU Tasks Trace: Setting shift to 1 and lim to 1 rcu_task_cb_adjust=1.
[    0.044034] MPC7450 family performance monitor hardware support registered
[    0.044905] rcu: Hierarchical SRCU implementation.
[    0.045010] rcu: 	Max phase no-delay instances is 1000.
[    0.048608] smp: Bringing up secondary CPUs ...
[84919679.535921] CPU1: L2CR was 0
[84919679.536008] CPU1: L2CR set to 80000000
[84919679.536022] CPU1: L3CR was 0
[84919679.536171] CPU1: L3CR set to 9c030000
[    0.055844] smp: Brought up 1 node, 2 CPUs
[    0.064159] devtmpfs: initialized
[    0.067648] Duplicate name in PowerPC,G4@0, renamed to "l2-cache#1"
[    0.068248] Duplicate name in l2-cache#1, renamed to "l2-cache#1"
[    0.070286] Duplicate name in PowerPC,G4@1, renamed to "l2-cache#1"
[    0.070773] Duplicate name in l2-cache#1, renamed to "l2-cache#1"
[    0.095681] Duplicate name in gpio@50, renamed to "gpio5@6f#1"
[    0.096168] Duplicate name in gpio@50, renamed to "gpio6@70#1"
[    0.096979] Duplicate name in gpio@50, renamed to "gpio11@75#1"
[    0.097450] Duplicate name in gpio@50, renamed to "extint-gpio15@67#1"
[    0.134662] Found UniNorth PCI host bridge at 0x00000000f0000000. Firmware bus number: 0->0
[    0.134783] PCI host bridge /pci@f0000000  ranges:
[    0.134878]  MEM 0x00000000f1000000..0x00000000f1ffffff -> 0x00000000f1000000 
[    0.134947]   IO 0x00000000f0000000..0x00000000f07fffff -> 0x0000000000000000
[    0.151765]  MEM 0x0000000090000000..0x00000000afffffff -> 0x0000000090000000 
[    0.152093] Found UniNorth PCI host bridge at 0x00000000f2000000. Firmware bus number: 0->0
[    0.152152] PCI host bridge /pci@f2000000 (primary) ranges:
[    0.152239]  MEM 0x00000000f3000000..0x00000000f3ffffff -> 0x00000000f3000000 
[    0.152306]   IO 0x00000000f2000000..0x00000000f27fffff -> 0x0000000000000000
[    0.169140]  MEM 0x0000000080000000..0x000000008fffffff -> 0x0000000080000000 
[    0.169471] Found UniNorth PCI host bridge at 0x00000000f4000000. Firmware bus number: 0->0
[    0.169531] PCI host bridge /pci@f4000000  ranges:
[    0.169614]  MEM 0x00000000f5000000..0x00000000f5ffffff -> 0x00000000f5000000 
[    0.169670]   IO 0x00000000f4000000..0x00000000f47fffff -> 0x0000000000000000
[    0.187017] Found NEC PD720100A USB2 chip with disabled EHCI, fixing up...
[    0.189037] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    0.189360] futex hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.199748] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.231691] PCI: Probing PCI hardware
[    0.234486] PCI host bridge to bus 0000:00
[    0.234583] pci_bus 0000:00: root bus resource [io  0xff780000-0xfff7ffff] (bus address [0x0000-0x7fffff])
[    0.234660] pci_bus 0000:00: root bus resource [mem 0xf1000000-0xf1ffffff]
[    0.234718] pci_bus 0000:00: root bus resource [mem 0x90000000-0xafffffff]
[    0.234783] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.234832] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    0.236686] pci 0000:00:0b.0: [106b:0034] type 00 class 0x060000 conventional PCI endpoint
[    0.239142] pci 0000:00:10.0: [1002:4150] type 00 class 0x030000 conventional PCI endpoint
[    0.239249] pci 0000:00:10.0: BAR 0 [mem 0xa0000000-0xafffffff pref]
[    0.239309] pci 0000:00:10.0: BAR 1 [io  0xff780400-0xff7804ff]
[    0.239360] pci 0000:00:10.0: BAR 2 [mem 0x90000000-0x9000ffff]
[    0.239434] pci 0000:00:10.0: ROM [mem 0x90020000-0x9003ffff pref]
[    0.239548] pci 0000:00:10.0: supports D1 D2
[    0.242355] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
[    0.245059] OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not find phandle 1751474532
[    0.245234] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio15@67: could not find phandle 1751474532
[    0.245406] OF: /pci@f2000000/mac-io@17/gpio@50/gpio6@70: could not find phandle 1634562093
[    0.245554] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio16@68: could not find phandle 1936745825
[    0.245726] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio14@66: could not find phandle 1818848869
[    0.245892] OF: /pci@f2000000/mac-io@17/gpio@50/gpio12@76: could not find phandle 1835103092
[    0.246032] OF: /pci@f2000000/mac-io@17/gpio@50/gpio11@75: could not find phandle 1635083369
[    0.246161] OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not find phandle 1751474532
[    0.246290] OF: /pci@f2000000/mac-io@17/gpio@50/gpio6@70: could not find phandle 1634562093
[    0.246420] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio4@5c: could not find phandle 1818848869
[    0.246584] OF: /pci@f2000000/mac-io@17/gpio@50/gpio11@75: could not find phandle 1635083369
[    0.246715] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio15@67: could not find phandle 1751474532
[    0.249560] pci_bus 0001:00: Fixed dependency cycle(s) with /pci@f2000000/mac-io@17/interrupt-controller@40000
[    0.249824] PCI host bridge to bus 0001:00
[    0.249880] pci_bus 0001:00: root bus resource [io  0x0000-0x7fffff]
[    0.249940] pci_bus 0001:00: root bus resource [mem 0xf3000000-0xf3ffffff]
[    0.249997] pci_bus 0001:00: root bus resource [mem 0x80000000-0x8fffffff]
[    0.250058] pci_bus 0001:00: root bus resource [bus 00-ff]
[    0.250105] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to ff
[    0.251460] pci 0001:00:0b.0: [106b:0035] type 00 class 0x060000 conventional PCI endpoint
[    0.253405] pci 0001:00:12.0: [1033:0035] type 00 class 0x0c0310 conventional PCI endpoint
[    0.253500] pci 0001:00:12.0: BAR 0 [mem 0x8008c000-0x8008cfff]
[    0.253643] pci 0001:00:12.0: supports D1 D2
[    0.253682] pci 0001:00:12.0: PME# supported from D0 D1 D2 D3hot
[    0.255497] pci 0001:00:12.1: [1033:0035] type 00 class 0x0c0310 conventional PCI endpoint
[    0.255591] pci 0001:00:12.1: BAR 0 [mem 0x8008b000-0x8008bfff]
[    0.255735] pci 0001:00:12.1: supports D1 D2
[    0.255773] pci 0001:00:12.1: PME# supported from D0 D1 D2 D3hot
[    0.257530] pci 0001:00:12.2: [1033:00e0] type 00 class 0x0c0320 conventional PCI endpoint
[    0.257622] pci 0001:00:12.2: BAR 0 [mem 0x80081000-0x800810ff]
[    0.257765] pci 0001:00:12.2: supports D1 D2
[    0.257803] pci 0001:00:12.2: PME# supported from D0 D1 D2 D3hot
[    0.259710] pci 0001:00:13.0: [1095:3112] type 00 class 0x018000 conventional PCI endpoint
[    0.259804] pci 0001:00:13.0: BAR 0 [io  0x0460-0x0467]
[    0.259856] pci 0001:00:13.0: BAR 1 [io  0x0450-0x0453]
[    0.259903] pci 0001:00:13.0: BAR 2 [io  0x0440-0x0447]
[    0.259949] pci 0001:00:13.0: BAR 3 [io  0x0430-0x0433]
[    0.259996] pci 0001:00:13.0: BAR 4 [io  0x0420-0x042f]
[    0.260045] pci 0001:00:13.0: BAR 5 [mem 0x80082000-0x800821ff]
[    0.260094] pci 0001:00:13.0: ROM [mem 0x80100000-0x8017ffff pref]
[    0.260198] pci 0001:00:13.0: supports D1 D2
[    0.261682] pci 0001:00:15.0: [9710:9865] type 00 class 0x070002 conventional PCI endpoint
[    0.261775] pci 0001:00:15.0: BAR 0 [io  0x0410-0x0417]
[    0.261828] pci 0001:00:15.0: BAR 1 [mem 0x8008a000-0x8008afff]
[    0.261891] pci 0001:00:15.0: BAR 4 [mem 0x80089000-0x80089fff]
[    0.262008] pci 0001:00:15.0: supports D1 D2
[    0.262047] pci 0001:00:15.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.263810] pci 0001:00:15.1: [9710:9865] type 00 class 0x070002 conventional PCI endpoint
[    0.263901] pci 0001:00:15.1: BAR 0 [io  0x0400-0x0407]
[    0.263954] pci 0001:00:15.1: BAR 1 [mem 0x80088000-0x80088fff]
[    0.264016] pci 0001:00:15.1: BAR 4 [mem 0x80087000-0x80087fff]
[    0.264133] pci 0001:00:15.1: supports D1 D2
[    0.264171] pci 0001:00:15.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.265658] pci 0001:00:15.2: [ffff:9865] type 00 class 0x070103 conventional PCI endpoint
[    0.265751] pci 0001:00:15.2: BAR 0 [io  0x0000-0x0007]
[    0.265802] pci 0001:00:15.2: BAR 1 [io  0x0000-0x0007]
[    0.265849] pci 0001:00:15.2: BAR 2 [mem 0x00000000-0x00000fff]
[    0.265904] pci 0001:00:15.2: BAR 4 [mem 0x00000000-0x00000fff]
[    0.266019] pci 0001:00:15.2: supports D1 D2
[    0.266056] pci 0001:00:15.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.268271] pci 0001:00:16.0: [14e4:4320] type 00 class 0x028000 conventional PCI endpoint
[    0.268368] pci 0001:00:16.0: BAR 0 [mem 0x8008e000-0x8008ffff]
[    0.268513] pci 0001:00:16.0: supports D1 D2
[    0.268551] pci 0001:00:16.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.269904] pci 0001:00:17.0: [106b:0022] type 00 class 0xff0000 conventional PCI endpoint
[    0.269995] pci 0001:00:17.0: BAR 0 [mem 0x80000000-0x8007ffff]
[    0.272091] pci 0001:00:18.0: [106b:0019] type 00 class 0x0c0310 conventional PCI endpoint
[    0.272186] pci 0001:00:18.0: BAR 0 [mem 0x80086000-0x80086fff]
[    0.273453] pci 0001:00:19.0: [106b:0019] type 00 class 0x0c0310 conventional PCI endpoint
[    0.273543] pci 0001:00:19.0: BAR 0 [mem 0x80085000-0x80085fff]
[    0.275475] pci 0001:00:1b.0: [1033:0035] type 00 class 0x0c0310 conventional PCI endpoint
[    0.275573] pci 0001:00:1b.0: BAR 0 [mem 0x80084000-0x80084fff]
[    0.275719] pci 0001:00:1b.0: supports D1 D2
[    0.275758] pci 0001:00:1b.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.277567] pci 0001:00:1b.1: [1033:0035] type 00 class 0x0c0310 conventional PCI endpoint
[    0.277660] pci 0001:00:1b.1: BAR 0 [mem 0x80083000-0x80083fff]
[    0.277804] pci 0001:00:1b.1: supports D1 D2
[    0.277842] pci 0001:00:1b.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.279737] pci 0001:00:1b.2: [1033:00e0] type 00 class 0x0c0320 conventional PCI endpoint
[    0.279831] pci 0001:00:1b.2: BAR 0 [mem 0x80080000-0x800800ff]
[    0.279976] pci 0001:00:1b.2: supports D1 D2
[    0.280014] pci 0001:00:1b.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.281627] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to 00
[    0.286958] PCI host bridge to bus 0002:00
[    0.287048] pci_bus 0002:00: root bus resource [io  0x880000-0x107ffff] (bus address [0x0000-0x7fffff])
[    0.287123] pci_bus 0002:00: root bus resource [mem 0xf5000000-0xf5ffffff]
[    0.287187] pci_bus 0002:00: root bus resource [bus 00-ff]
[    0.287233] pci_bus 0002:00: busn_res: [bus 00-ff] end is updated to ff
[    0.288598] pci 0002:00:0b.0: [106b:0036] type 00 class 0x060000 conventional PCI endpoint
[    0.290026] pci 0002:00:0d.0: [106b:0033] type 00 class 0xff0000 conventional PCI endpoint
[    0.290119] pci 0002:00:0d.0: BAR 0 [mem 0xf5004000-0xf5007fff]
[    0.292520] pci 0002:00:0e.0: [106b:0031] type 00 class 0x0c0010 conventional PCI endpoint
[    0.292619] pci 0002:00:0e.0: BAR 0 [mem 0xf5000000-0xf5000fff]
[    0.292757] pci 0002:00:0e.0: supports D1 D2
[    0.292796] pci 0002:00:0e.0: PME# supported from D0 D1 D2 D3hot
[    0.294551] pci 0002:00:0f.0: [106b:0032] type 00 class 0x020000 conventional PCI endpoint
[    0.294644] pci 0002:00:0f.0: BAR 0 [mem 0xf5200000-0xf53fffff]
[    0.294736] pci 0002:00:0f.0: ROM [mem 0xf5100000-0xf51fffff pref]
[    0.298025] pci_bus 0002:00: busn_res: [bus 00-ff] end is updated to 00
[    0.299522] PCI 0000:00 Cannot reserve Legacy IO [io  0xff780000-0xff780fff]
[    0.299607] PCI 0001:00 Cannot reserve Legacy IO [io  0x0000-0x0fff]
[    0.299683] pci_bus 0000:00: resource 4 [io  0xff780000-0xfff7ffff]
[    0.299729] pci_bus 0000:00: resource 5 [mem 0xf1000000-0xf1ffffff]
[    0.299771] pci_bus 0000:00: resource 6 [mem 0x90000000-0xafffffff]
[    0.299883] pci 0001:00:15.2: BAR 2 [mem 0xf3000000-0xf3000fff]: assigned
[    0.299944] pci 0001:00:15.2: BAR 4 [mem 0xf3001000-0xf3001fff]: assigned
[    0.299999] pci 0001:00:15.2: BAR 0 [io  0x1000-0x1007]: assigned
[    0.300050] pci 0001:00:15.2: BAR 1 [io  0x1008-0x100f]: assigned
[    0.300120] pci_bus 0001:00: resource 4 [io  0x0000-0x7fffff]
[    0.300163] pci_bus 0001:00: resource 5 [mem 0xf3000000-0xf3ffffff]
[    0.300204] pci_bus 0001:00: resource 6 [mem 0x80000000-0x8fffffff]
[    0.300251] pci_bus 0002:00: resource 4 [io  0x880000-0x107ffff]
[    0.300293] pci_bus 0002:00: resource 5 [mem 0xf5000000-0xf5ffffff]
[    0.379276] raid6: altivecx8 gen()  1346 MB/s
[    0.436155] raid6: altivecx4 gen()  1448 MB/s
[    0.493019] raid6: altivecx2 gen()  1249 MB/s
[    0.549907] raid6: altivecx1 gen()   878 MB/s
[    0.606785] raid6: int32x8  gen()   169 MB/s
[    0.663663] raid6: int32x4  gen()   179 MB/s
[    0.720620] raid6: int32x2  gen()   198 MB/s
[    0.777432] raid6: int32x1  gen()   158 MB/s
[    0.777467] raid6: using algorithm altivecx4 gen() 1448 MB/s
[    0.777499] raid6: using intx1 recovery algorithm
[    0.788654] SCSI subsystem initialized
[    0.791769] libata version 3.00 loaded.
[    0.795435] usbcore: registered new interface driver usbfs
[    0.795904] usbcore: registered new interface driver hub
[    0.796847] usbcore: registered new device driver usb
[    0.814816] pci 0000:00:10.0: vgaarb: setting as boot VGA device
[    0.814906] pci 0000:00:10.0: vgaarb: bridge control possible
[    0.814945] pci 0000:00:10.0: vgaarb: VGA device added: decodes=io+mem,owns=mem,locks=none
[    0.815051] vgaarb: loaded
[    0.816131] clocksource: Switched to clocksource timebase
[    0.932405] NET: Registered PF_INET protocol family
[    0.935047] IP idents hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.943862] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 10240 bytes, linear)
[    0.947447] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.949322] TCP established hash table entries: 8192 (order: 3, 32768 bytes, linear)
[    0.956947] TCP bind hash table entries: 8192 (order: 6, 327680 bytes, linear)
[    0.958265] TCP: Hash tables configured (established 8192 bind 8192)
[    0.960742] UDP hash table entries: 512 (order: 2, 24576 bytes, linear)
[    0.961405] UDP-Lite hash table entries: 512 (order: 2, 24576 bytes, linear)
[    0.963147] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.964406] pci 0001:00:12.0: enabling device (0000 -> 0002)
[    0.964608] pci 0001:00:12.1: enabling device (0000 -> 0002)
[    0.964728] pci 0001:00:12.2: enabling device (0004 -> 0006)
[    0.964926] Apple USB OHCI 0001:00:18.0 disabled by firmware
[    0.964965] pci 0001:00:18.0: Can't enable PCI device, BIOS handoff failed.
[    0.965020] Apple USB OHCI 0001:00:19.0 disabled by firmware
[    0.965054] pci 0001:00:19.0: Can't enable PCI device, BIOS handoff failed.
[    0.965116] pci 0001:00:1b.0: enabling device (0000 -> 0002)
[    0.965227] pci 0001:00:1b.1: enabling device (0000 -> 0002)
[    0.965332] pci 0001:00:1b.2: enabling device (0004 -> 0006)
[    0.965480] pci 0002:00:0f.0: CLS mismatch (32 != 1020), using 32 bytes
[    0.971043] Thermal assist unit not available
[    0.983073] Initialise system trusted keyrings
[    0.984242] workingset: timestamp_bits=14 max_order=19 bucket_order=5
[    1.008238] fuse: init (API version 7.39)
[    1.011336] 9p: Installing v9fs 9p2000 file system support
[    1.014374] NET: Registered PF_ALG protocol family
[    1.014683] xor: measuring software checksum speed
[    1.058513]    8regs           :   224 MB/sec
[    1.104960]    8regs_prefetch  :   212 MB/sec
[    1.150518]    32regs          :   216 MB/sec
[    1.198225]    32regs_prefetch :   206 MB/sec
[    1.202493]    altivec         :  2337 MB/sec
[    1.202528] xor: using function: altivec (2337 MB/sec)
[    1.202598] Key type asymmetric registered
[    1.202634] Asymmetric key parser 'x509' registered
[    1.227477] bounce: pool size: 64 pages
[    1.228604] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    1.229268] io scheduler bfq registered
[    1.240464] atomic64_test: passed
[    1.243222] Using unsupported 1920x1080 (null) at a0008000, depth=8, pitch=2048
[    1.297856] Console: switching to colour frame buffer device 240x67
[    1.342904] fb0: Open Firmware frame buffer device on /pci@f0000000/ATY,AlteracParent@10/ATY,Alterac_A@0
[    1.347528] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    1.367608] serial 0001:00:15.0: enabling device (0004 -> 0007)
[    1.374817] 0001:00:15.0: ttyS0 at I/O 0x410 (irq = 58, base_baud = 115200) is a 16550A
[    1.377626] serial 0001:00:15.1: enabling device (0004 -> 0007)
[    1.383485] 0001:00:15.1: ttyS1 at I/O 0x400 (irq = 58, base_baud = 115200) is a 16550A
[    1.395334] MacIO PCI driver attached to Keylargo chipset
[    1.427857] sata_sil 0001:00:13.0: version 2.4
[    1.428763] sata_sil 0001:00:13.0: enabling device (0004 -> 0007)
[    1.440974] scsi host0: sata_sil
[    1.447949] scsi host1: sata_sil
[    1.450456] ata1: SATA max UDMA/100 mmio m512@0x80082000 tf 0x80082080 irq 53 lpm-pol 0
[    1.450799] ata2: SATA max UDMA/100 mmio m512@0x80082000 tf 0x800820c0 irq 53 lpm-pol 0
[    1.452885] pata-pci-macio 0002:00:0d.0: enabling device (0004 -> 0006)
[    1.469549] pata-pci-macio 0002:00:0d.0: Activating pata-macio chipset UniNorth ATA-6, Apple bus ID 3
[    1.478712] scsi host2: pata_macio
[    1.481791] ata3: PATA max UDMA/100 irq 39 lpm-pol 0
[    1.766344] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[    1.769662] ata1.00: ATA-9: SanDisk SSD PLUS 240GB, UF4500RL, max UDMA/133
[    1.769963] ata1.00: 468877312 sectors, multi 1: LBA48 NCQ (depth 0/32)
[    1.771663] ata1.00: Features: Dev-Sleep
[    1.794532] ata1.00: configured for UDMA/100
[    1.797916] scsi 0:0:0:0: Direct-Access     ATA      SanDisk SSD PLUS 00RL PQ: 0 ANSI: 5
[    1.808495] sd 0:0:0:0: [sda] 468877312 512-byte logical blocks: (240 GB/224 GiB)
[    1.809088] sd 0:0:0:0: [sda] Write Protect is off
[    1.809378] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.810112] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.810982] sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
[    1.822301]  sda: [mac] sda1 sda2 sda3 sda4 sda5 sda6 sda7 sda8
[    1.836490] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.292840] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[    2.295777] ata2.00: ATA-9: WDC WD5000LPLX-60ZNTT1, 02.01A02, max UDMA/133
[    2.296079] ata2.00: 976773168 sectors, multi 0: LBA48 NCQ (depth 0/32)
[    2.299104] ata2.00: configured for UDMA/100
[    2.301503] scsi 1:0:0:0: Direct-Access     ATA      WDC WD5000LPLX-6 1A02 PQ: 0 ANSI: 5
[    2.313187] sd 1:0:0:0: [sdb] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    2.313565] sd 1:0:0:0: [sdb] 4096-byte physical blocks
[    2.314047] sd 1:0:0:0: [sdb] Write Protect is off
[    2.314286] sd 1:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    2.315051] sd 1:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.315927] sd 1:0:0:0: [sdb] Preferred minimum I/O size 4096 bytes
[    2.512845] pata-macio 0.0001f000:ata-4: Activating pata-macio chipset KeyLargo ATA-4, Apple bus ID 2
[    2.532559] scsi host3: pata_macio
[    2.545718] ata4: PATA max UDMA/66 irq 19 lpm-pol 0
[    2.715630] ata4.00: CFA: DeLOCK 54143 512MB, 100511E, max UDMA/66
[    2.726681] ata4.00: 1009008 sectors, multi 1: LBA 
[    3.046820]  sdb: [mac] sdb1 sdb2 sdb3 sdb4 sdb5 sdb6 sdb7 sdb8
[    3.071020] sd 1:0:0:0: [sdb] Attached SCSI disk
[    3.085305] scsi 3:0:0:0: Direct-Access     ATA      DeLOCK 54143 512 11E  PQ: 0 ANSI: 5
[    3.106659] sd 3:0:0:0: [sdc] 1009008 512-byte logical blocks: (517 MB/493 MiB)
[    3.117975] sd 3:0:0:0: [sdc] Write Protect is off
[    3.128825] sd 3:0:0:0: [sdc] Mode Sense: 00 3a 00 00
[    3.140099] sd 3:0:0:0: [sdc] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    3.151776] sd 3:0:0:0: [sdc] Preferred minimum I/O size 512 bytes
[    3.173388]  sdc: [mac] sdc1 sdc2 sdc3 sdc4 sdc5 sdc6
[    3.195153] sd 3:0:0:0: [sdc] Attached SCSI disk
[    3.579548] pata-macio 0.00020000:ata-3: Activating pata-macio chipset KeyLargo ATA-3, Apple bus ID 0
[    3.600026] scsi host4: pata_macio
[    3.614079] ata5: PATA max MWDMA2 irq 20 lpm-pol 0
[    3.628122] sungem.c:v1.0 David S. Miller <davem@redhat.com>
[    3.651059] gem 0002:00:0f.0 eth0: Sun GEM (PCI) 10/100/1000BaseT Ethernet 00:0a:95:9c:76:3a
[    3.669970] ehci-pci 0001:00:12.2: EHCI Host Controller
[    3.682139] ehci-pci 0001:00:12.2: new USB bus registered, assigned bus number 1
[    3.683404] rtc-generic rtc-generic: registered as rtc0
[    3.695295] ehci-pci 0001:00:12.2: irq 52, io mem 0x80081000
[    3.708935] PowerMac i2c bus pmu 2 registered
[    3.729497] ehci-pci 0001:00:12.2: USB 2.0 started, EHCI 1.00
[    3.730920] PowerMac i2c bus pmu 1 registered
[    3.743238] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.08
[    3.756935] PowerMac i2c bus mac-io 0 registered
[    3.764067] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.776996] i2c i2c-2: No i2c address for /pci@f2000000/mac-io@17/i2c@18000/i2c-modem
[    3.787043] usb usb1: Product: EHCI Host Controller
[    3.799953] PowerMac i2c bus uni-n 1 registered
[    3.810064] usb usb1: Manufacturer: Linux 6.8.0-rc7-PMacG4 ehci_hcd
[    3.821518] i2c i2c-3: i2c-powermac: modalias failure on /uni-n@f8000000/i2c@f8001000/cereal@1c0
[    3.833020] usb usb1: SerialNumber: 0001:00:12.2
[    3.847635] ata5.00: ATAPI: _NEC DVD_RW ND-3520A, 1.04, max UDMA/33
[    3.868760] PowerMac i2c bus uni-n 0 registered
[    3.872827] hub 1-0:1.0: USB hub found
[    3.887243] hid: raw HID events driver (C) Jiri Kosina
[    3.892828] hub 1-0:1.0: 5 ports detected
[    3.907442] usbcore: registered new interface driver usbhid
[    3.925885] ehci-pci 0001:00:1b.2: EHCI Host Controller
[    3.927890] usbhid: USB HID core driver
[    3.941437] scsi 4:0:0:0: CD-ROM            _NEC     DVD_RW ND-3520A  1.04 PQ: 0 ANSI: 5
[    3.954811] NET: Registered PF_INET6 protocol family
[    3.963904] ehci-pci 0001:00:1b.2: new USB bus registered, assigned bus number 2
[    3.991155] ehci-pci 0001:00:1b.2: irq 63, io mem 0x80080000
[    4.008260] Segment Routing with IPv6
[    4.020716] In-situ OAM (IOAM) with IPv6
[    4.022826] ehci-pci 0001:00:1b.2: USB 2.0 started, EHCI 1.00
[    4.034388] sr 4:0:0:0: [sr0] scsi3-mmc drive: 48x/48x writer cd/rw xa/form2 cdda tray
[    4.045982] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.08
[    4.056199] cdrom: Uniform CD-ROM driver Revision: 3.20
[    4.068124] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.080659] 9pnet: Installing 9P2000 support
[    4.092174] usb usb2: Product: EHCI Host Controller
[    4.107994] drmem: No dynamic reconfiguration memory found
[    4.115944] usb usb2: Manufacturer: Linux 6.8.0-rc7-PMacG4 ehci_hcd
[    4.115968] usb usb2: SerialNumber: 0001:00:1b.2
[    4.157747] hub 2-0:1.0: USB hub found
[    4.169761] hub 2-0:1.0: 5 ports detected
[    4.191462] sr 4:0:0:0: Attached scsi CD-ROM sr0
[    4.272876] usb 1-3: new high-speed USB device number 2 using ehci-pci
[    4.272953] registered taskstats version 1
[    4.300130] Loading compiled-in X.509 certificates
[    4.445987] usb 1-3: New USB device found, idVendor=05e3, idProduct=0610, bcdDevice=32.98
[    4.457894] usb 1-3: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    4.469518] usb 1-3: Product: USB2.0 Hub
[    4.485416] hub 1-3:1.0: USB hub found
[    4.497598] hub 1-3:1.0: 4 ports detected
[    4.751037] zswap: loaded using pool zstd/zsmalloc
[    4.765019] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
[    4.778325] page_owner is disabled
[    4.802853] usb 1-3.1: new low-speed USB device number 3 using ehci-pci
[    4.880404] Btrfs loaded, zoned=no, fsverity=no
[    4.946594] usb 1-3.1: New USB device found, idVendor=04d9, idProduct=0006, bcdDevice= 1.40
[    4.958714] usb 1-3.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    4.970525] usb 1-3.1: Product: RPI Wired Keyboard 5
[    4.982190] usb 1-3.1: Manufacturer:  
[    5.019258] input:   RPI Wired Keyboard 5 as /devices/pci0001:00/0001:00:12.2/usb1/1-3/1-3.1/1-3.1:1.0/0003:04D9:0006.0001/input/input0
[    5.095364] hid-generic 0003:04D9:0006.0001: input,hidraw0: USB HID v1.11 Keyboard [  RPI Wired Keyboard 5] on usb-0001:00:12.2-3.1/input0
[    5.129615] input:   RPI Wired Keyboard 5 as /devices/pci0001:00/0001:00:12.2/usb1/1-3/1-3.1/1-3.1:1.1/0003:04D9:0006.0002/input/input1
[    5.199620] hid-generic 0003:04D9:0006.0002: input,hidraw1: USB HID v1.11 Device [  RPI Wired Keyboard 5] on usb-0001:00:12.2-3.1/input1
[    5.289525] usb 1-3.3: new low-speed USB device number 4 using ehci-pci
[    5.403965] usb 1-3.3: New USB device found, idVendor=275d, idProduct=0ba6, bcdDevice= 1.00
[    5.416612] usb 1-3.3: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    5.429122] usb 1-3.3: Product: USB OPTICAL MOUSE 
[    5.455597] input: USB OPTICAL MOUSE  as /devices/pci0001:00/0001:00:12.2/usb1/1-3/1-3.3/1-3.3:1.0/0003:275D:0BA6.0003/input/input2
[    5.471794] hid-generic 0003:275D:0BA6.0003: input,hidraw2: USB HID v1.11 Mouse [USB OPTICAL MOUSE ] on usb-0001:00:12.2-3.3/input0
[    8.497805] input: PMU as /devices/virtual/input/input3
[    8.513051] netpoll: netconsole: local port 6666
[    8.526031] netpoll: netconsole: local IPv4 address 192.168.2.8
[    8.538918] netpoll: netconsole: interface 'eth0'
[    8.551650] netpoll: netconsole: remote port 6666
[    8.564198] netpoll: netconsole: remote IPv4 address 192.168.2.3
[    8.576672] netpoll: netconsole: remote ethernet address a8:a1:59:16:4f:ea
[    8.589112] netpoll: netconsole: device eth0 not up yet, forcing it
[    8.699876] sungem_phy: PHY ID: 2060e1, addr: 0
[    8.712570] gem 0002:00:0f.0 eth0: Found BCM5421 PHY
[   12.379815] gem 0002:00:0f.0 eth0: Link is up at 1000 Mbps, full-duplex
[   12.392219] gem 0002:00:0f.0 eth0: Pause is enabled (rxfifo: 10240 off: 7168 on: 5632)
[   12.412813] printk: legacy console [netcon0] enabled
[   12.456794] netconsole: network logging started
[   12.516001] EXT4-fs (sda5): mounted filesystem fa07e66f-b4f9-404f-85d8-487d3c097aec ro with ordered data mode. Quota mode: disabled.
[   12.529694] VFS: Mounted root (ext4 filesystem) readonly on device 8:5.
[   12.550843] devtmpfs: mounted
[   12.569311] Freeing unused kernel image (initmem) memory: 1624K
[   12.616521] Checked W+X mappings: passed, no W+X pages found
[   12.629344] rodata_test: all tests were successful
[   12.642030] Run /sbin/init as init process
[   12.654532]   with arguments:
[   12.666836]     /sbin/init
[   12.678990]   with environment:
[   12.691384]     HOME=/
[   12.703556]     TERM=linux
[   17.549489] random: crng init done
[   32.498236] ==================================================================
[   32.509250] BUG: KASAN: slab-out-of-bounds in filemap_map_pages+0x5e8/0x98c
[   32.520088] Read of size 4 at addr c43beb88 by task (udev-worker)/595
[   32.530820] 
[   32.541367] CPU: 0 PID: 595 Comm: (udev-worker) Not tainted 6.8.0-rc7-PMacG4 #1
[   32.552277] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   32.563081] Call Trace:
[   32.564273] ohci-pci 0001:00:12.0: OHCI PCI host controller
[   32.573485] [f40abc10] [c1675c5c] dump_stack_lvl+0x60/0x80 (unreliable)
[   32.573549] [f40abc30] [c04c4fd4] print_report+0xd4/0x4fc
[   32.604502] [f40abc80] [c04c5680] kasan_report+0xfc/0x10c
[   32.614223] [f40abd00] [c03bd348] filemap_map_pages+0x5e8/0x98c
[   32.623876] [f40abde0] [c0447380] handle_mm_fault+0x14fc/0x1988
[   32.633477] [f40abec0] [c00462b0] ___do_page_fault+0x918/0xbf0
[   32.643019] [f40abf10] [c004697c] do_page_fault+0x28/0x50
[   32.652445] [f40abf30] [c000433c] DataAccess_virt+0x124/0x17c
[   32.660352] ohci-pci 0001:00:12.0: new USB bus registered, assigned bus number 3
[   32.661480] --- interrupt: 300 at 0x8a5d50
[   32.680420] NIP:  008a5d50 LR: 008a5cd4 CTR: 00486290
[   32.689467] REGS: f40abf40 TRAP: 0300   Not tainted  (6.8.0-rc7-PMacG4)
[   32.698616] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24004280  XER: 00000000
[   32.703805] ohci-pci 0001:00:12.0: irq 52, io mem 0x8008c000
[   32.707886] DAR: a6ed7038 DSISR: 40000000 
[   32.707886] GPR00: 008a6a1c afe0f3a0 a7adf6e0 013d9620 013aefd0 00000000 00000000 00000000 
[   32.707886] GPR08: 00000000 a6ed7038 00000000 afe0fbf0 44004280 009afaf4 afe0fc9c afe0fcb4 
[   32.707886] GPR16: afe0fcb0 afe0fca8 afe0fcb8 00000000 afe0fcac a6ed7000 0000005b 0000003f 
[   32.707886] GPR24: 0000002a afe0f3b4 013aefd0 00000000 013d9620 013d9620 009b311c afe0f3a0 
[   32.764896] NIP [008a5d50] 0x8a5d50
[   32.774372] LR [008a5cd4] 0x8a5cd4
[   32.783671] --- interrupt: 300
[   32.792911] 
[   32.802003] Allocated by task 1 on cpu 1 at 4.791311s:
[   32.810926]  kasan_save_stack+0x38/0x54
[   32.819754]  kasan_save_track+0x20/0x3c
[   32.828458]  __kasan_slab_alloc+0x60/0x6c
[   32.837106]  kmem_cache_alloc+0x19c/0x264
[   32.845714]  __kernfs_new_node+0xfc/0x54c
[   32.854278]  kernfs_new_node+0x138/0x180
[   32.858137] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 6.08
[   32.862780]  __kernfs_create_file+0x44/0x2c8
[   32.862809]  sysfs_add_file_mode_ns+0x284/0x304
[   32.862829]  internal_create_group+0x7dc/0xa54
[   32.862848]  sysfs_slab_add+0xb0/0x240
[   32.872028] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   32.880910]  __kmem_cache_create+0xf0/0x2cc
[   32.880937]  kmem_cache_create_usercopy+0x150/0x21c
[   32.890044] usb usb3: Product: OHCI PCI host controller
[   32.899047]  bioset_init+0x4fc/0x808
[   32.899078]  btrfs_init_compress+0x38/0x25c
[   32.899103]  init_btrfs_fs+0xa8/0x288
[   32.899120]  do_one_initcall+0x144/0x434
[   32.908277] usb usb3: Manufacturer: Linux 6.8.0-rc7-PMacG4 ohci_hcd
[   32.917500]  kernel_init_freeable+0x7d4/0x7f4
[   32.926854] usb usb3: SerialNumber: 0001:00:12.0
[   32.936069]  kernel_init+0x28/0x148
[   32.936100]  ret_from_kernel_user_thread+0x10/0x18
[   32.936117] 
[   32.936122] The buggy address belongs to the object at c43beb30
[   32.936122]  which belongs to the cache kernfs_node_cache of size 88
[   32.936137] The buggy address is located 0 bytes to the right of
[   32.936137]  allocated 88-byte region [c43beb30, c43beb88)
[   32.936153] 
[   32.936162] The buggy address belongs to the physical page:
[   32.936172] page:eee706b8 refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0x43be
[   32.936187] flags: 0x800(slab|zone=0)
[   32.936205] page_type: 0xffffffff()
[   32.936227] raw: 00000800 c208ee20 00000100 00000122 00000000 001e003c ffffffff 00000001
[   33.138176] raw: 00000000
[   33.147942] page dumped because: kasan: bad access detected
[   33.157749] page_owner tracks the page as allocated
[   33.167500] page last allocated via order 0, migratetype Unmovable, gfp_mask 0x12cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY), pid 1, tgid 1 (swapper/0), ts 4790613568, free_ts 4778274944
[   33.177941]  prep_new_page+0x24/0x9c
[   33.188206]  get_page_from_freelist+0xcd0/0xeec
[   33.198459]  __alloc_pages+0x1e0/0xe08
[   33.208665]  alloc_slab_page+0x30/0x6c
[   33.218920]  new_slab+0xb4/0x308
[   33.228986]  ___slab_alloc+0x400/0x5c8
[   33.239077]  kmem_cache_alloc+0xfc/0x264
[   33.249148]  __kernfs_new_node+0xfc/0x54c
[   33.259194]  kernfs_new_node+0x138/0x180
[   33.269237]  __kernfs_create_file+0x44/0x2c8
[   33.279284]  sysfs_add_file_mode_ns+0x284/0x304
[   33.289420]  sysfs_merge_group+0x2e0/0x310
[   33.299377]  btrfs_init_sysfs+0x3a8/0x52c
[   33.309239]  init_btrfs_fs+0xa8/0x288
[   33.319057]  do_one_initcall+0x144/0x434
[   33.328954]  kernel_init_freeable+0x7d4/0x7f4
[   33.338733] page last free pid 1 tgid 1 stack trace:
[   33.348358]  free_unref_page_prepare+0x2a8/0x440
[   33.358012]  free_unref_page+0x84/0x2a8
[   33.367485]  destroy_args+0x1b8/0x388
[   33.376888]  debug_vm_pgtable+0xc40/0x12c0
[   33.386239]  do_one_initcall+0x144/0x434
[   33.395542]  kernel_init_freeable+0x7d4/0x7f4
[   33.404750]  kernel_init+0x28/0x148
[   33.413937]  ret_from_kernel_user_thread+0x10/0x18
[   33.423200] 
[   33.432593] Memory state around the buggy address:
[   33.441922]  c43bea80: fc fc fc fc fc 00 00 00 00 00 00 00 00 00 00 00
[   33.451324]  c43beb00: fc fc fc fc fc fc 00 00 00 00 00 00 00 00 00 00
[   33.460705] >c43beb80: 00 fc fc fc fc fc fc 00 00 00 00 00 00 00 00 00
[   33.470034]               ^
[   33.479296]  c43bec00: 00 00 fc fc fc fc fc fc 00 00 00 00 00 00 00 00
[   33.488703]  c43bec80: 00 00 00 fc fc fc fc fc fc 00 00 00 00 00 00 00
[   33.498044] ==================================================================
[   33.508012] Disabling lock debugging due to kernel taint
[   33.541346] hub 3-0:1.0: USB hub found
[   33.653362] hub 3-0:1.0: 3 ports detected
[   33.714951] b43-pci-bridge 0001:00:16.0: enabling device (0004 -> 0006)
[   33.725711] ------------[ cut here ]------------
[   33.735116] kernel BUG at include/linux/swapops.h:466!
[   33.744391] Oops: Exception in kernel mode, sig: 5 [#1]
[   33.753666] BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 DEBUG_PAGEALLOC PowerMac
[   33.763045] Modules linked in: ssb(+) pcmcia pcmcia_core hwmon drm_suballoc_helper i2c_algo_bit drm_ttm_helper ttm drm_display_helper backlight ohci_pci(+)
[   33.773048] CPU: 0 PID: 595 Comm: (udev-worker) Tainted: G    B              6.8.0-rc7-PMacG4 #1
[   33.783050] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   33.793050] NIP:  c03c10d0 LR: c03c1084 CTR: 00000000
[   33.803074] REGS: f40abb90 TRAP: 0700   Tainted: G    B               (6.8.0-rc7-PMacG4)
[   33.813362] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 22084f32  XER: 00000000
[   33.823558] 
[   33.823558] GPR00: c03c1084 f40abc50 c34e8020 ef1253e8 fefefefe 00000000 f40abcb8 00000008 
[   33.823558] GPR08: 00000000 00000000 00000003 f40abc50 22084f32 009afaf4 1e8157c6 000f4240 
[   33.823558] GPR16: 00000000 afe1873c c6d868e0 00000001 c34e8390 f40abe3c 00707908 f40abf40 
[   33.823558] GPR24: a6ed6767 70c177aa c5e8b440 00000026 c6516884 ef1253e8 ef1253e8 fe81578c 
[   33.874883] NIP [c03c10d0] migration_entry_wait_on_locked+0x184/0x34c
[   33.885321] LR [c03c1084] migration_entry_wait_on_locked+0x138/0x34c
[   33.895736] Call Trace:
[   33.906029] [f40abc50] [c03c1084] migration_entry_wait_on_locked+0x138/0x34c (unreliable)
[   33.916670] [f40abd10] [c04caa94] migration_entry_wait+0xf0/0x110
[   33.927233] [f40abd70] [c04440b0] do_swap_page+0x208/0x16d8
[   33.937708] [f40abde0] [c0447808] handle_mm_fault+0x1984/0x1988
[   33.940913] ohci-pci 0001:00:12.1: OHCI PCI host controller
[   33.948029] [f40abec0] [c00462b0] ___do_page_fault+0x918/0xbf0
[   33.948082] [f40abf10] [c004697c] do_page_fault+0x28/0x50
[   33.948111] [f40abf30] [c000433c] DataAccess_virt+0x124/0x17c
[   33.948139] --- interrupt: 300 at 0x6f7bd0
[   33.948157] NIP:  006f7bd0 LR: 006f7b60 CTR: 006f3e60
[   33.948169] REGS: f40abf40 TRAP: 0300   Tainted: G    B               (6.8.0-rc7-PMacG4)
[   33.948181] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 4200448c  XER: 20000000
[   34.029824] DAR: a6ed6767 DSISR: 40000000 
[   34.029824] GPR00: 006f983c afe162c0 a7adf6e0 013dfd00 20026767 afe175dc afe18614 00000007 
[   34.029824] GPR08: 839b87df 00026767 00000000 00000003 4200448c 009afaf4 00000000 000f4240 
[   34.029824] GPR16: 00000000 afe1873c 00000000 0aba9500 00000009 afe18724 00707908 afe1872c 
[   34.029824] GPR24: afe175dc 013dfd00 20000000 013d8040 afe175dc 20026767 00727c74 a6ed6767 
[   34.043034] ohci-pci 0001:00:12.1: new USB bus registered, assigned bus number 4
[   34.079761] NIP [006f7bd0] 0x6f7bd0
[   34.079787] LR [006f7b60] 0x6f7b60
[   34.079798] --- interrupt: 300
[   34.079807] Code: 5529cffe 7d485010 7d290194 5529063e 2c090000 41820010 2c080000 41a20008 481057b9 813e0000 71290001 40a20008 <0fe00000> 7fa3eb78 3fa061c8 3f40c1f7 
[   34.132370] ---[ end trace 0000000000000000 ]---
[   34.143190] 
[   34.153906] note: (udev-worker)[595] exited with irqs disabled
[   34.163211] ssb: Found chip with id 0x4306, rev 0x02 and package 0x00
[   34.238483] b43-pci-bridge 0001:00:16.0: Sonics Silicon Backplane found on PCI device 0001:00:16.0
[   34.448957] ohci-pci 0001:00:12.1: irq 52, io mem 0x8008b000
[   34.800851] usb usb4: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 6.08
[   34.813315] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   34.824966] usb usb4: Product: OHCI PCI host controller
[   34.836620] usb usb4: Manufacturer: Linux 6.8.0-rc7-PMacG4 ohci_hcd
[   34.848480] usb usb4: SerialNumber: 0001:00:12.1
[   36.218229] hub 4-0:1.0: USB hub found
[   36.358888] [drm] radeon kernel modesetting enabled.
[   36.423206] hub 4-0:1.0: 2 ports detected
[   36.640970] Console: switching to colour dummy device 80x25
[   36.694257] radeon 0000:00:10.0: enabling device (0006 -> 0007)
[   36.701985] Apple USB OHCI 0001:00:18.0 disabled by firmware
[   36.702328] Apple USB OHCI 0001:00:19.0 disabled by firmware
[   36.719721] ohci-pci 0001:00:1b.0: OHCI PCI host controller
[   36.720200] ohci-pci 0001:00:1b.0: new USB bus registered, assigned bus number 5
[   36.721069] ohci-pci 0001:00:1b.0: irq 63, io mem 0x80084000
[   36.725309] [drm] initializing kernel modesetting (RV350 0x1002:0x4150 0x1002:0x0002 0x00).
[   36.725484] [drm] Forcing AGP to PCI mode
[   36.757309] radeon 0000:00:10.0: Invalid PCI ROM header signature: expecting 0xaa55, got 0x0000
[   37.014367] usb usb5: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 6.08
[   37.014669] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   37.014775] usb usb5: Product: OHCI PCI host controller
[   37.014891] usb usb5: Manufacturer: Linux 6.8.0-rc7-PMacG4 ohci_hcd
[   37.015005] usb usb5: SerialNumber: 0001:00:1b.0
[   37.107512] hub 5-0:1.0: USB hub found
[   37.108115] hub 5-0:1.0: 3 ports detected
[   37.174399] ohci-pci 0001:00:1b.1: OHCI PCI host controller
[   37.174793] ohci-pci 0001:00:1b.1: new USB bus registered, assigned bus number 6
[   37.175658] ohci-pci 0001:00:1b.1: irq 63, io mem 0x80083000
[   37.345577] [drm] Generation 2 PCI interface, using max accessible memory
[   37.345917] radeon 0000:00:10.0: VRAM: 256M 0x00000000A0000000 - 0x00000000AFFFFFFF (256M used)
[   37.346043] radeon 0000:00:10.0: GTT: 512M 0x0000000080000000 - 0x000000009FFFFFFF
[   37.346452] [drm] Detected VRAM RAM=256M, BAR=256M
[   37.346553] [drm] RAM width 128bits DDR
[   37.624090] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 6.08
[   37.624397] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   37.624501] usb usb6: Product: OHCI PCI host controller
[   37.624618] usb usb6: Manufacturer: Linux 6.8.0-rc7-PMacG4 ohci_hcd
[   37.624733] usb usb6: SerialNumber: 0001:00:1b.1
[   37.669716] hub 6-0:1.0: USB hub found
[   37.670219] hub 6-0:1.0: 2 ports detected
[   37.769863] [drm] radeon: 256M of VRAM memory ready
[   37.770198] [drm] radeon: 512M of GTT memory ready.
[   37.771370] [drm] GART: num cpu pages 131072, num gpu pages 131072
[   38.000188] [drm] radeon: 1 quad pipes, 1 Z pipes initialized
[   38.000400] [drm] PCI GART of 512M enabled (table at 0x0000000008D80000).
[   38.000883] radeon 0000:00:10.0: WB enabled
[   38.001051] radeon 0000:00:10.0: fence driver on ring 0 use gpu addr 0x0000000080000000
[   38.024458] [drm] radeon: irq initialized.
[   38.024894] [drm] Loading R300 Microcode
[   38.208534] [drm] radeon: ring at 0x0000000080001000
[   38.208794] [drm] ring test succeeded in 1 usecs
[   38.285261] [drm] ib test succeeded in 0 usecs
[   38.441690] [drm] Radeon Display Connectors
[   38.441946] [drm] Connector 0:
[   38.442062] [drm]   DVI-I-1
[   38.442141] [drm]   HPD2
[   38.442240] [drm]   DDC: 0x64 0x64 0x64 0x64 0x64 0x64 0x64 0x64
[   38.442329] [drm]   Encoders:
[   38.442400] [drm]     CRT1: INTERNAL_DAC1
[   38.443054] [drm]     DFP2: INTERNAL_DVO1
[   38.443181] [drm] Connector 1:
[   38.443256] [drm]   DVI-I-2
[   38.443325] [drm]   HPD1
[   38.443420] [drm]   DDC: 0x60 0x60 0x60 0x60 0x60 0x60 0x60 0x60
[   38.443505] [drm]   Encoders:
[   38.443598] [drm]     CRT2: INTERNAL_DAC2
[   38.443699] [drm]     DFP1: INTERNAL_TMDS1
[   38.447632] [drm] Initialized radeon 2.50.0 20080528 for 0000:00:10.0 on minor 0
[   38.881859] [drm] fb mappable at 0xA0040000
[   38.882083] [drm] vram apper at 0xA0000000
[   38.882163] [drm] size 8294400
[   38.882323] [drm] fb depth is 24
[   38.882406] [drm]    pitch is 7680
[   39.224338] firewire_ohci 0002:00:0e.0: enabling device (0000 -> 0002)
[   39.353100] firewire_ohci 0002:00:0e.0: added OHCI v1.10 device as card 0, 8 IR + 8 IT contexts, quirks 0x0
[   39.693275] Console: switching to colour frame buffer device 240x67
[   39.776756] gem 0002:00:0f.0 enP2p0s15: renamed from eth0 (while UP)
[   39.875227] firewire_core 0002:00:0e.0: created device fw0: GUID 000a95fffe9c763a, S800
[   39.974816] radeon 0000:00:10.0: [drm] fb0: radeondrmfb frame buffer device
[   40.712892] ADM1030 fan controller [@2c]
[   40.726379] DS1775 digital thermometer [@49]
[   40.726753] Temp: 54.8 C
[   40.726772]   Hyst: 70.0 C
[   40.726966]   OS: 75.0 C
[   40.727163] 
[   45.607887] snd-aoa-fabric-layout: Using direct GPIOs
[   45.732067] snd-aoa-fabric-layout: can use this codec
[   45.812665] snd-aoa-codec-tas: tas found, addr 0x35 on /pci@f2000000/mac-io@17/i2c@18000/deq@6a
[   48.915194] CPU-temp: 55.0 C
[   48.915238] , Case: 32.5 C
[   48.915585] ,  Fan: 0 (tuned -11)
[   56.052768] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [(udev-worker):595]
[   56.053325] Modules linked in: snd_aoa_codec_tas cfg80211(+) snd_aoa_fabric_layout snd_aoa rfkill therm_windtunnel firewire_ohci firewire_core crc_itu_t mac_hid snd_aoa_i2sbus snd_aoa_soundbus snd_pcm snd_timer radeon snd soundcore ssb pcmcia pcmcia_core hwmon drm_suballoc_helper i2c_algo_bit drm_ttm_helper ttm drm_display_helper backlight ohci_pci
[   56.055140] CPU: 0 PID: 595 Comm: (udev-worker) Tainted: G    B D            6.8.0-rc7-PMacG4 #1
[   56.055748] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   56.056109] NIP:  c0163f28 LR: c0163f00 CTR: 00000000
[   56.056430] REGS: f40ab5a0 TRAP: 0900   Tainted: G    B D             (6.8.0-rc7-PMacG4)
[   56.056878] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 480a2b88  XER: 00000000
[   56.057340] 
[   56.057340] GPR00: c0163ef8 f40ab660 c34e8020 00000001 c170a9a0 f40ab6d0 f40ab790 00000000 
[   56.057340] GPR08: 00000007 00000000 00000000 f40ab660 880a2b88 009afaf4 00000000 000f4240 
[   56.057340] GPR16: 00000000 1e81572c c6d868e0 00000001 00259000 c440c000 00000000 f8ca2d10 
[   56.057340] GPR24: 18ca2d11 00000004 00000007 c651688c 18ca2d12 00000000 c6516890 c6516884 
[   56.059334] NIP [c0163f28] do_raw_spin_lock+0x1b8/0x2b4
[   56.059686] LR [c0163f00] do_raw_spin_lock+0x190/0x2b4
[   56.060013] Call Trace:
[   56.060207] [f40ab660] [c0163ef8] do_raw_spin_lock+0x188/0x2b4 (unreliable)
[   56.060626] [f40ab6a0] [c0464378] __pte_offset_map_lock+0x98/0x150
[   56.061016] [f40ab710] [c044164c] unmap_page_range+0x3dc/0xd04
[   56.061525] [f40ab810] [c0442168] unmap_vmas+0x1f4/0x238
[   56.061874] [f40ab8d0] [c0454b08] exit_mmap+0x1c0/0x4b4
[   56.062216] [f40ab9f0] [c008ed44] __mmput+0x78/0x370
[   56.062617] [f40aba20] [c00a5794] do_exit+0xa14/0x1c5c
[   56.062950] [f40abac0] [c00a6cec] sys_exit+0x0/0x68
[   56.063266] [f40abae0] [c0017e98] die+0x4b0/0x4b8
[   56.063576] [f40abb20] [c0017f24] exception_common+0x84/0x304
[   56.077973] [f40abb60] [c0018294] _exception+0x20/0x58
[   56.092107] [f40abb80] [c0004828] ProgramCheck_virt+0x108/0x158
[   56.106231] --- interrupt: 700 at migration_entry_wait_on_locked+0x184/0x34c
[   56.120603] NIP:  c03c10d0 LR: c03c1084 CTR: 00000000
[   56.135106] REGS: f40abb90 TRAP: 0700   Tainted: G    B D             (6.8.0-rc7-PMacG4)
[   56.149944] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 22084f32  XER: 00000000
[   56.164785] 
[   56.164785] GPR00: c03c1084 f40abc50 c34e8020 ef1253e8 fefefefe 00000000 f40abcb8 00000008 
[   56.164785] GPR08: 00000000 00000000 00000003 f40abc50 22084f32 009afaf4 1e8157c6 000f4240 
[   56.164785] GPR16: 00000000 afe1873c c6d868e0 00000001 c34e8390 f40abe3c 00707908 f40abf40 
[   56.164785] GPR24: a6ed6767 70c177aa c5e8b440 00000026 c6516884 ef1253e8 ef1253e8 fe81578c 
[   56.240768] NIP [c03c10d0] migration_entry_wait_on_locked+0x184/0x34c
[   56.256428] LR [c03c1084] migration_entry_wait_on_locked+0x138/0x34c
[   56.272137] --- interrupt: 700
[   56.287937] [f40abd10] [c04caa94] migration_entry_wait+0xf0/0x110
[   56.303931] [f40abd70] [c04440b0] do_swap_page+0x208/0x16d8
[   56.319869] [f40abde0] [c0447808] handle_mm_fault+0x1984/0x1988
[   56.335722] [f40abec0] [c00462b0] ___do_page_fault+0x918/0xbf0
[   56.351532] [f40abf10] [c004697c] do_page_fault+0x28/0x50
[   56.367345] [f40abf30] [c000433c] DataAccess_virt+0x124/0x17c
[   56.383216] --- interrupt: 300 at 0x6f7bd0
[   56.399155] NIP:  006f7bd0 LR: 006f7b60 CTR: 006f3e60
[   56.415406] REGS: f40abf40 TRAP: 0300   Tainted: G    B D             (6.8.0-rc7-PMacG4)
[   56.431702] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 4200448c  XER: 20000000
[   56.448009] DAR: a6ed6767 DSISR: 40000000 
[   56.448009] GPR00: 006f983c afe162c0 a7adf6e0 013dfd00 20026767 afe175dc afe18614 00000007 
[   56.448009] GPR08: 839b87df 00026767 00000000 00000003 4200448c 009afaf4 00000000 000f4240 
[   56.448009] GPR16: 00000000 afe1873c 00000000 0aba9500 00000009 afe18724 00707908 afe1872c 
[   56.448009] GPR24: afe175dc 013dfd00 20000000 013d8040 afe175dc 20026767 00727c74 a6ed6767 
[   56.528672] NIP [006f7bd0] 0x6f7bd0
[   56.544691] LR [006f7b60] 0x6f7b60
[   56.560636] --- interrupt: 300
[   56.576664] Code: 7fe3fb78 4bfff879 2c030000 41a20058 57f7e8fe 57fa077e 3ac00000 3ef7e000 3b5a0003 89370000 7d2a0774 5529cffe <7d0ad010> 7d29b114 5529063e 2c090000 
[   80.052763] watchdog: BUG: soft lockup - CPU#0 stuck for 45s! [(udev-worker):595]
[   80.070196] Modules linked in: snd_aoa_codec_tas cfg80211(+) snd_aoa_fabric_layout snd_aoa rfkill therm_windtunnel firewire_ohci firewire_core crc_itu_t mac_hid snd_aoa_i2sbus snd_aoa_soundbus snd_pcm snd_timer radeon snd soundcore ssb pcmcia pcmcia_core hwmon drm_suballoc_helper i2c_algo_bit drm_ttm_helper ttm drm_display_helper backlight ohci_pci
[   80.107565] CPU: 0 PID: 595 Comm: (udev-worker) Tainted: G    B D      L     6.8.0-rc7-PMacG4 #1
[   80.126329] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   80.144971] NIP:  c0163f54 LR: c0163f00 CTR: 00000000
[   80.163652] REGS: f40ab5a0 TRAP: 0900   Tainted: G    B D      L      (6.8.0-rc7-PMacG4)
[   80.182709] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 480a2b88  XER: 00000000
[   80.201879] 
[   80.201879] GPR00: c0163ef8 f40ab660 c34e8020 00000001 c170a9a0 f40ab6d0 f40ab790 00000000 
[   80.201879] GPR08: 00000007 00000001 00000000 f40ab660 880a2b88 009afaf4 00000000 000f4240 
[   80.201879] GPR16: 00000000 1e81572c c6d868e0 00000001 00259000 c440c000 00000000 f8ca2d10 
[   80.201879] GPR24: 18ca2d11 00000004 00000007 c651688c 18ca2d12 00000000 c6516890 c6516884 
[   80.290323] NIP [c0163f54] do_raw_spin_lock+0x1e4/0x2b4
[   80.307908] LR [c0163f00] do_raw_spin_lock+0x190/0x2b4
[   80.325326] Call Trace:
[   80.342586] [f40ab660] [c0163ef8] do_raw_spin_lock+0x188/0x2b4 (unreliable)
[   80.360032] [f40ab6a0] [c0464378] __pte_offset_map_lock+0x98/0x150
[   80.377448] [f40ab710] [c044164c] unmap_page_range+0x3dc/0xd04
[   80.394845] [f40ab810] [c0442168] unmap_vmas+0x1f4/0x238
[   80.412160] [f40ab8d0] [c0454b08] exit_mmap+0x1c0/0x4b4
[   80.429225] [f40ab9f0] [c008ed44] __mmput+0x78/0x370
[   80.446244] [f40aba20] [c00a5794] do_exit+0xa14/0x1c5c
[   80.463223] [f40abac0] [c00a6cec] sys_exit+0x0/0x68
[   80.480045] [f40abae0] [c0017e98] die+0x4b0/0x4b8
[   80.496926] [f40abb20] [c0017f24] exception_common+0x84/0x304
[   80.513668] [f40abb60] [c0018294] _exception+0x20/0x58
[   80.530413] [f40abb80] [c0004828] ProgramCheck_virt+0x108/0x158
[   80.547214] --- interrupt: 700 at migration_entry_wait_on_locked+0x184/0x34c
[   80.564190] NIP:  c03c10d0 LR: c03c1084 CTR: 00000000
[   80.581250] REGS: f40abb90 TRAP: 0700   Tainted: G    B D      L      (6.8.0-rc7-PMacG4)
[   80.598575] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 22084f32  XER: 00000000
[   80.616060] 
[   80.616060] GPR00: c03c1084 f40abc50 c34e8020 ef1253e8 fefefefe 00000000 f40abcb8 00000008 
[   80.616060] GPR08: 00000000 00000000 00000003 f40abc50 22084f32 009afaf4 1e8157c6 000f4240 
[   80.616060] GPR16: 00000000 afe1873c c6d868e0 00000001 c34e8390 f40abe3c 00707908 f40abf40 
[   80.616060] GPR24: a6ed6767 70c177aa c5e8b440 00000026 c6516884 ef1253e8 ef1253e8 fe81578c 
[   80.704195] NIP [c03c10d0] migration_entry_wait_on_locked+0x184/0x34c
[   80.722032] LR [c03c1084] migration_entry_wait_on_locked+0x138/0x34c
[   80.739688] --- interrupt: 700
[   80.757173] [f40abd10] [c04caa94] migration_entry_wait+0xf0/0x110
[   80.774784] [f40abd70] [c04440b0] do_swap_page+0x208/0x16d8
[   80.792418] [f40abde0] [c0447808] handle_mm_fault+0x1984/0x1988
[   80.809918] [f40abec0] [c00462b0] ___do_page_fault+0x918/0xbf0
[   80.827319] [f40abf10] [c004697c] do_page_fault+0x28/0x50
[   80.844569] [f40abf30] [c000433c] DataAccess_virt+0x124/0x17c
[   80.861714] --- interrupt: 300 at 0x6f7bd0
[   80.878756] NIP:  006f7bd0 LR: 006f7b60 CTR: 006f3e60
[   80.895787] REGS: f40abf40 TRAP: 0300   Tainted: G    B D      L      (6.8.0-rc7-PMacG4)
[   80.913043] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 4200448c  XER: 20000000
[   80.930474] DAR: a6ed6767 DSISR: 40000000 
[   80.930474] GPR00: 006f983c afe162c0 a7adf6e0 013dfd00 20026767 afe175dc afe18614 00000007 
[   80.930474] GPR08: 839b87df 00026767 00000000 00000003 4200448c 009afaf4 00000000 000f4240 
[   80.930474] GPR16: 00000000 afe1873c 00000000 0aba9500 00000009 afe18724 00707908 afe1872c 
[   80.930474] GPR24: afe175dc 013dfd00 20000000 013d8040 afe175dc 20026767 00727c74 a6ed6767 
[   81.018295] NIP [006f7bd0] 0x6f7bd0
[   81.036006] LR [006f7b60] 0x6f7b60
[   81.053388] --- interrupt: 300
[   81.070670] Code: 5529cffe 7d0ad010 7d29b114 5529063e 2c090000 41820014 2c0a0000 41a2000c 7fe3fb78 48362931 813f0000 2c090000 <4182ffa4> 4bffffc4 38620004 7c5a1378 
[   81.341783] CPU-temp: 55.3 C
[   81.341829] , Case: 32.5 C
[   81.358983] ,  Fan: 0 (tuned +0)
[   91.792768] BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=0 stuck for 57s!
[   91.811159] BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=-20 stuck for 54s!
[   91.829310] Showing busy workqueues and worker pools:
[   91.847318] workqueue events: flags=0x0
[   91.864843]   pwq 2: cpus=1 node=0 flags=0x0 nice=0 active=2/256 refcnt=3
[   91.864895]     in-flight: 35:do_free_init do_free_init
[   91.864957]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=2/256 refcnt=3
[   91.864987]     pending: vmstat_shepherd, kfree_rcu_monitor
[   91.865041] workqueue mm_percpu_wq: flags=0x8
[   91.946563]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[   91.946614]     pending: vmstat_update
[   91.946655] workqueue kblockd: flags=0x18
[   91.993708]   pwq 1: cpus=0 node=0 flags=0x0 nice=-20 active=1/256 refcnt=2
[   91.993756]     pending: blk_mq_timeout_work
[   91.993820] pool 2: cpus=1 node=0 flags=0x0 nice=0 hung=0s workers=4 idle: 599 636 21
[   91.993877] Showing backtraces of running workers in stalled CPU-bound worker pools:
[   94.252745] rcu: INFO: rcu_sched self-detected stall on CPU
[   94.268545] rcu: 	0-....: (17466 ticks this GP) idle=0644/1/0x40000002 softirq=2375/2375 fqs=5681
[   94.282862] rcu: 	         hardirqs   softirqs   csw/system
[   94.297109] rcu: 	 number:       30        755            0
[   94.311328] rcu: 	cputime:        0         53        28699   ==> 30011(ms)
[   94.325480] rcu: 	(t=18005 jiffies g=3169 q=5153 ncpus=2)
[   94.341161] CPU: 0 PID: 595 Comm: (udev-worker) Tainted: G    B D      L     6.8.0-rc7-PMacG4 #1
[   94.356681] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   94.371069] NIP:  c0163f28 LR: c0163f00 CTR: 00000000
[   94.385467] REGS: f40ab5a0 TRAP: 0900   Tainted: G    B D      L      (6.8.0-rc7-PMacG4)
[   94.400221] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 480a2b88  XER: 00000000
[   94.415031] 
[   94.415031] GPR00: c0163ef8 f40ab660 c34e8020 00000001 c170a9a0 f40ab6d0 f40ab790 00000000 
[   94.415031] GPR08: 00000007 00000000 00000000 f40ab660 880a2b88 009afaf4 00000000 000f4240 
[   94.415031] GPR16: 00000000 1e81572c c6d868e0 00000001 00259000 c440c000 00000000 f8ca2d10 
[   94.415031] GPR24: 18ca2d11 00000004 00000007 c651688c 18ca2d12 00000000 c6516890 c6516884 
[   94.490278] NIP [c0163f28] do_raw_spin_lock+0x1b8/0x2b4
[   94.505462] LR [c0163f00] do_raw_spin_lock+0x190/0x2b4
[   94.520556] Call Trace:
[   94.535499] [f40ab660] [c0163ef8] do_raw_spin_lock+0x188/0x2b4 (unreliable)
[   94.550581] [f40ab6a0] [c0464378] __pte_offset_map_lock+0x98/0x150
[   94.565577] [f40ab710] [c044164c] unmap_page_range+0x3dc/0xd04
[   94.580488] [f40ab810] [c0442168] unmap_vmas+0x1f4/0x238
[   94.595229] [f40ab8d0] [c0454b08] exit_mmap+0x1c0/0x4b4
[   94.609922] [f40ab9f0] [c008ed44] __mmput+0x78/0x370
[   94.624523] [f40aba20] [c00a5794] do_exit+0xa14/0x1c5c
[   94.638979] [f40abac0] [c00a6cec] sys_exit+0x0/0x68
[   94.653451] [f40abae0] [c0017e98] die+0x4b0/0x4b8
[   94.667685] [f40abb20] [c0017f24] exception_common+0x84/0x304
[   94.681876] [f40abb60] [c0018294] _exception+0x20/0x58
[   94.696038] [f40abb80] [c0004828] ProgramCheck_virt+0x108/0x158
[   94.710224] --- interrupt: 700 at migration_entry_wait_on_locked+0x184/0x34c
[   94.724564] NIP:  c03c10d0 LR: c03c1084 CTR: 00000000
[   94.738982] REGS: f40abb90 TRAP: 0700   Tainted: G    B D      L      (6.8.0-rc7-PMacG4)
[   94.753531] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 22084f32  XER: 00000000
[   94.768178] 
[   94.768178] GPR00: c03c1084 f40abc50 c34e8020 ef1253e8 fefefefe 00000000 f40abcb8 00000008 
[   94.768178] GPR08: 00000000 00000000 00000003 f40abc50 22084f32 009afaf4 1e8157c6 000f4240 
[   94.768178] GPR16: 00000000 afe1873c c6d868e0 00000001 c34e8390 f40abe3c 00707908 f40abf40 
[   94.768178] GPR24: a6ed6767 70c177aa c5e8b440 00000026 c6516884 ef1253e8 ef1253e8 fe81578c 
[   94.840825] NIP [c03c10d0] migration_entry_wait_on_locked+0x184/0x34c
[   94.855414] LR [c03c1084] migration_entry_wait_on_locked+0x138/0x34c
[   94.870016] --- interrupt: 700
[   94.884488] [f40abd10] [c04caa94] migration_entry_wait+0xf0/0x110
[   94.899171] [f40abd70] [c04440b0] do_swap_page+0x208/0x16d8
[   94.913789] [f40abde0] [c0447808] handle_mm_fault+0x1984/0x1988
[   94.928424] [f40abec0] [c00462b0] ___do_page_fault+0x918/0xbf0
[   94.942729] [f40abf10] [c004697c] do_page_fault+0x28/0x50
[   94.956622] [f40abf30] [c000433c] DataAccess_virt+0x124/0x17c
[   94.970611] --- interrupt: 300 at 0x6f7bd0
[   94.984566] NIP:  006f7bd0 LR: 006f7b60 CTR: 006f3e60
[   94.998551] REGS: f40abf40 TRAP: 0300   Tainted: G    B D      L      (6.8.0-rc7-PMacG4)
[   95.012729] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 4200448c  XER: 20000000
[   95.026933] DAR: a6ed6767 DSISR: 40000000 
[   95.026933] GPR00: 006f983c afe162c0 a7adf6e0 013dfd00 20026767 afe175dc afe18614 00000007 
[   95.026933] GPR08: 839b87df 00026767 00000000 00000003 4200448c 009afaf4 00000000 000f4240 
[   95.026933] GPR16: 00000000 afe1873c 00000000 0aba9500 00000009 afe18724 00707908 afe1872c 
[   95.026933] GPR24: afe175dc 013dfd00 20000000 013d8040 afe175dc 20026767 00727c74 a6ed6767 
[   95.097771] NIP [006f7bd0] 0x6f7bd0
[   95.111958] LR [006f7b60] 0x6f7b60
[   95.126007] --- interrupt: 300
[   95.140061] Code: 7fe3fb78 4bfff879 2c030000 41a20058 57f7e8fe 57fa077e 3ac00000 3ef7e000 3b5a0003 89370000 7d2a0774 5529cffe <7d0ad010> 7d29b114 5529063e 2c090000 
[  120.052754] watchdog: BUG: soft lockup - CPU#0 stuck for 82s! [(udev-worker):595]
[  120.069314] Modules linked in: snd_aoa_codec_tas cfg80211(+) snd_aoa_fabric_layout snd_aoa rfkill therm_windtunnel firewire_ohci firewire_core crc_itu_t mac_hid snd_aoa_i2sbus snd_aoa_soundbus snd_pcm snd_timer radeon snd soundcore ssb pcmcia pcmcia_core hwmon drm_suballoc_helper i2c_algo_bit drm_ttm_helper ttm drm_display_helper backlight ohci_pci
[  120.104774] CPU: 0 PID: 595 Comm: (udev-worker) Tainted: G    B D      L     6.8.0-rc7-PMacG4 #1
[  120.122559] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[  120.140219] NIP:  c0163f30 LR: c0163f00 CTR: 00000000
[  120.157883] REGS: f40ab5a0 TRAP: 0900   Tainted: G    B D      L      (6.8.0-rc7-PMacG4)
[  120.175399] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 480a2b88  XER: 00000000
[  120.192970] 
[  120.192970] GPR00: c0163ef8 f40ab660 c34e8020 00000001 c170a9a0 f40ab6d0 f40ab790 00000000 
[  120.192970] GPR08: 00000007 00000001 00000000 f40ab660 880a2b88 009afaf4 00000000 000f4240 
[  120.192970] GPR16: 00000000 1e81572c c6d868e0 00000001 00259000 c440c000 00000000 f8ca2d10 
[  120.192970] GPR24: 18ca2d11 00000004 00000007 c651688c 18ca2d12 00000000 c6516890 c6516884 
[  120.280721] NIP [c0163f30] do_raw_spin_lock+0x1c0/0x2b4
[  120.298355] LR [c0163f00] do_raw_spin_lock+0x190/0x2b4
[  120.315822] Call Trace:
[  120.333188] [f40ab660] [c0163ef8] do_raw_spin_lock+0x188/0x2b4 (unreliable)
[  120.350681] [f40ab6a0] [c0464378] __pte_offset_map_lock+0x98/0x150
[  120.368087] [f40ab710] [c044164c] unmap_page_range+0x3dc/0xd04
[  120.385513] [f40ab810] [c0442168] unmap_vmas+0x1f4/0x238
[  120.402741] [f40ab8d0] [c0454b08] exit_mmap+0x1c0/0x4b4
[  120.419798] [f40ab9f0] [c008ed44] __mmput+0x78/0x370
[  120.436789] [f40aba20] [c00a5794] do_exit+0xa14/0x1c5c
[  120.453895] [f40abac0] [c00a6cec] sys_exit+0x0/0x68
[  120.470731] [f40abae0] [c0017e98] die+0x4b0/0x4b8
[  120.487398] [f40abb20] [c0017f24] exception_common+0x84/0x304
[  120.504116] [f40abb60] [c0018294] _exception+0x20/0x58
[  120.520835] [f40abb80] [c0004828] ProgramCheck_virt+0x108/0x158
[  120.537623] --- interrupt: 700 at migration_entry_wait_on_locked+0x184/0x34c
[  120.554520] NIP:  c03c10d0 LR: c03c1084 CTR: 00000000
[  120.571583] REGS: f40abb90 TRAP: 0700   Tainted: G    B D      L      (6.8.0-rc7-PMacG4)
[  120.588864] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 22084f32  XER: 00000000
[  120.606288] 
[  120.606288] GPR00: c03c1084 f40abc50 c34e8020 ef1253e8 fefefefe 00000000 f40abcb8 00000008 
[  120.606288] GPR08: 00000000 00000000 00000003 f40abc50 22084f32 009afaf4 1e8157c6 000f4240 
[  120.606288] GPR16: 00000000 afe1873c c6d868e0 00000001 c34e8390 f40abe3c 00707908 f40abf40 
[  120.606288] GPR24: a6ed6767 70c177aa c5e8b440 00000026 c6516884 ef1253e8 ef1253e8 fe81578c 
[  120.694438] NIP [c03c10d0] migration_entry_wait_on_locked+0x184/0x34c
[  120.712079] LR [c03c1084] migration_entry_wait_on_locked+0x138/0x34c
[  120.729689] --- interrupt: 700
[  120.747259] [f40abd10] [c04caa94] migration_entry_wait+0xf0/0x110
[  120.764775] [f40abd70] [c04440b0] do_swap_page+0x208/0x16d8
[  120.782216] [f40abde0] [c0447808] handle_mm_fault+0x1984/0x1988
[  120.799570] [f40abec0] [c00462b0] ___do_page_fault+0x918/0xbf0
[  120.816827] [f40abf10] [c004697c] do_page_fault+0x28/0x50
[  120.833924] [f40abf30] [c000433c] DataAccess_virt+0x124/0x17c
[  120.850997] --- interrupt: 300 at 0x6f7bd0
[  120.867919] NIP:  006f7bd0 LR: 006f7b60 CTR: 006f3e60
[  120.884933] REGS: f40abf40 TRAP: 0300   Tainted: G    B D      L      (6.8.0-rc7-PMacG4)
[  120.902076] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 4200448c  XER: 20000000
[  120.919400] DAR: a6ed6767 DSISR: 40000000 
[  120.919400] GPR00: 006f983c afe162c0 a7adf6e0 013dfd00 20026767 afe175dc afe18614 00000007 
[  120.919400] GPR08: 839b87df 00026767 00000000 00000003 4200448c 009afaf4 00000000 000f4240 
[  120.919400] GPR16: 00000000 afe1873c 00000000 0aba9500 00000009 afe18724 00707908 afe1872c 
[  120.919400] GPR24: afe175dc 013dfd00 20000000 013d8040 afe175dc 20026767 00727c74 a6ed6767 
[  121.006648] NIP [006f7bd0] 0x6f7bd0
[  121.024175] LR [006f7b60] 0x6f7b60
[  121.041632] --- interrupt: 300
[  121.058764] Code: 2c030000 41a20058 57f7e8fe 57fa077e 3ac00000 3ef7e000 3b5a0003 89370000 7d2a0774 5529cffe 7d0ad010 7d29b114 <5529063e> 2c090000 41820014 2c0a0000 
[  144.052750] watchdog: BUG: soft lockup - CPU#0 stuck for 105s! [(udev-worker):595]
[  144.070979] Modules linked in: snd_aoa_codec_tas cfg80211(+) snd_aoa_fabric_layout snd_aoa rfkill therm_windtunnel firewire_ohci firewire_core crc_itu_t mac_hid snd_aoa_i2sbus snd_aoa_soundbus snd_pcm snd_timer radeon snd soundcore ssb pcmcia pcmcia_core hwmon drm_suballoc_helper i2c_algo_bit drm_ttm_helper ttm drm_display_helper backlight ohci_pci
[  144.109856] CPU: 0 PID: 595 Comm: (udev-worker) Tainted: G    B D      L     6.8.0-rc7-PMacG4 #1
[  144.129383] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[  144.148954] NIP:  c0163f30 LR: c0163f00 CTR: 00000000
[  144.168525] REGS: f40ab5a0 TRAP: 0900   Tainted: G    B D      L      (6.8.0-rc7-PMacG4)
[  144.187942] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 480a2b88  XER: 00000000
[  144.207078] 
[  144.207078] GPR00: c0163ef8 f40ab660 c34e8020 00000001 c170a9a0 f40ab6d0 f40ab790 00000000 
[  144.207078] GPR08: 00000007 00000001 00000000 f40ab660 880a2b88 009afaf4 00000000 000f4240 
[  144.207078] GPR16: 00000000 1e81572c c6d868e0 00000001 00259000 c440c000 00000000 f8ca2d10 
[  144.207078] GPR24: 18ca2d11 00000004 00000007 c651688c 18ca2d12 00000000 c6516890 c6516884 
[  144.296309] NIP [c0163f30] do_raw_spin_lock+0x1c0/0x2b4
[  144.314131] LR [c0163f00] do_raw_spin_lock+0x190/0x2b4
[  144.331768] Call Trace:
[  144.349230] [f40ab660] [c0163ef8] do_raw_spin_lock+0x188/0x2b4 (unreliable)
[  144.366949] [f40ab6a0] [c0464378] __pte_offset_map_lock+0x98/0x150
[  144.384515] [f40ab710] [c044164c] unmap_page_range+0x3dc/0xd04
[  144.401997] [f40ab810] [c0442168] unmap_vmas+0x1f4/0x238
[  144.419330] [f40ab8d0] [c0454b08] exit_mmap+0x1c0/0x4b4
[  144.436488] [f40ab9f0] [c008ed44] __mmput+0x78/0x370
[  144.453567] [f40aba20] [c00a5794] do_exit+0xa14/0x1c5c
[  144.470631] [f40abac0] [c00a6cec] sys_exit+0x0/0x68
[  144.487537] [f40abae0] [c0017e98] die+0x4b0/0x4b8
[  144.504309] [f40abb20] [c0017f24] exception_common+0x84/0x304
[  144.521118] [f40abb60] [c0018294] _exception+0x20/0x58
[  144.537942] [f40abb80] [c0004828] ProgramCheck_virt+0x108/0x158
[  144.554935] --- interrupt: 700 at migration_entry_wait_on_locked+0x184/0x34c
[  144.572121] NIP:  c03c10d0 LR: c03c1084 CTR: 00000000
[  144.589268] REGS: f40abb90 TRAP: 0700   Tainted: G    B D      L      (6.8.0-rc7-PMacG4)
[  144.606632] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 22084f32  XER: 00000000
[  144.624194] 
[  144.624194] GPR00: c03c1084 f40abc50 c34e8020 ef1253e8 fefefefe 00000000 f40abcb8 00000008 
[  144.624194] GPR08: 00000000 00000000 00000003 f40abc50 22084f32 009afaf4 1e8157c6 000f4240 
[  144.624194] GPR16: 00000000 afe1873c c6d868e0 00000001 c34e8390 f40abe3c 00707908 f40abf40 
[  144.624194] GPR24: a6ed6767 70c177aa c5e8b440 00000026 c6516884 ef1253e8 ef1253e8 fe81578c 
[  144.712476] NIP [c03c10d0] migration_entry_wait_on_locked+0x184/0x34c
[  144.730281] LR [c03c1084] migration_entry_wait_on_locked+0x138/0x34c
[  144.747955] --- interrupt: 700
[  144.765471] [f40abd10] [c04caa94] migration_entry_wait+0xf0/0x110
[  144.783096] [f40abd70] [c04440b0] do_swap_page+0x208/0x16d8
[  144.800620] [f40abde0] [c0447808] handle_mm_fault+0x1984/0x1988
[  144.818138] [f40abec0] [c00462b0] ___do_page_fault+0x918/0xbf0
[  144.835565] [f40abf10] [c004697c] do_page_fault+0x28/0x50
[  144.852830] [f40abf30] [c000433c] DataAccess_virt+0x124/0x17c
[  144.870217] --- interrupt: 300 at 0x6f7bd0
[  144.887278] NIP:  006f7bd0 LR: 006f7b60 CTR: 006f3e60
[  144.904371] REGS: f40abf40 TRAP: 0300   Tainted: G    B D      L      (6.8.0-rc7-PMacG4)
[  144.921666] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 4200448c  XER: 20000000
[  144.939099] DAR: a6ed6767 DSISR: 40000000 
[  144.939099] GPR00: 006f983c afe162c0 a7adf6e0 013dfd00 20026767 afe175dc afe18614 00000007 
[  144.939099] GPR08: 839b87df 00026767 00000000 00000003 4200448c 009afaf4 00000000 000f4240 
[  144.939099] GPR16: 00000000 afe1873c 00000000 0aba9500 00000009 afe18724 00707908 afe1872c 
[  144.939099] GPR24: afe175dc 013dfd00 20000000 013d8040 afe175dc 20026767 00727c74 a6ed6767 
[  145.027130] NIP [006f7bd0] 0x6f7bd0
[  145.044737] LR [006f7b60] 0x6f7b60
[  145.062175] --- interrupt: 300
[  145.079446] Code: 2c030000 41a20058 57f7e8fe 57fa077e 3ac00000 3ef7e000 3b5a0003 89370000 7d2a0774 5529cffe 7d0ad010 7d29b114 <5529063e> 2c090000 41820014 2c0a0000 
[...]
--MP_/Kn_DPsjWzthGNH9x5hato4f
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=dmesg_68-rc6_g4_v05.txt

[    0.000000] Total memory = 2048MB; using 4096kB for hash table
[    0.000000] Activating Kernel Userspace Access Protection
[    0.000000] Activating Kernel Userspace Execution Prevention
[    0.000000] Linux version 6.8.0-rc6-PMacG4 (root@T1000) (gcc (Gentoo 13.2.1_p20240210 p13) 13.2.1 20240210, GNU ld (Gentoo 2.41 p4) 2.41.0) #2 SMP Mon Mar  4 23:35:34 CET 2024
[    0.000000] KASAN init done
[    0.000000] ioremap() called early from pmac_feature_init+0x2c8/0x120c. Use early_ioremap() instead
[    0.000000] Found UniNorth memory controller & host bridge @ 0xf8000000 revision: 0x24
[    0.000000] Mapped at 0xf53bf000
[    0.000000] ioremap() called early from probe_one_macio+0x260/0x70c. Use early_ioremap() instead
[    0.000000] Found a Keylargo mac-io controller, rev: 3, mapped at 0x(ptrval)
[    0.000000] PowerMac motherboard: PowerMac G4 Windtunnel
[    0.000000] ioremap() called early from btext_map+0x5c/0x8c. Use early_ioremap() instead
[    0.000000] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[    0.000000] printk: legacy bootconsole [udbg0] enabled
[    0.000000] CPU maps initialized for 1 thread per core
[    0.000000]  (thread shift is 0)
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x80000000
[    0.000000] dcache_bsize      = 0x20
[    0.000000] icache_bsize      = 0x20
[    0.000000] cpu_features      = 0x000000002514600a
[    0.000000]   possible        = 0x00000000277de00a
[    0.000000]   always          = 0x0000000001000000
[    0.000000] cpu_user_features = 0x9c000001 0x00000000
[    0.000000] mmu_features      = 0x00010201
[    0.000000] Hash_size         = 0x400000
[    0.000000] Hash_mask         = 0xffff
[    0.000000] -----------------------------------------------------
[    0.000000] ioremap() called early from pmac_setup_arch+0x1e4/0x6dc. Use early_ioremap() instead
[    0.000000] ioremap() called early from find_via_pmu+0x4cc/0x5d4. Use early_ioremap() instead
[    0.000000] ioremap() called early from find_via_pmu+0x1b0/0x5d4. Use early_ioremap() instead
[    0.000000] via-pmu: Server Mode is disabled
[    0.000000] PMU driver v2 initialized for Core99, firmware: 0c
[    0.000000] ioremap() called early from pmac_nvram_init+0x48c/0xed0. Use early_ioremap() instead
[    0.000000] nvram: Checking bank 0...
[    0.000000] nvram: gen0=3391, gen1=3392
[    0.000000] nvram: Active bank is: 1
[    0.000000] nvram: OF partition at 0x410
[    0.000000] nvram: XP partition at 0x1020
[    0.000000] nvram: NR partition at 0x1120
[    0.000000] Top of RAM: 0x80000000, Total RAM: 0x80000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x000000002fffffff]
[    0.000000]   Normal   empty
[    0.000000]   HighMem  [mem 0x0000000030000000-0x000000007fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000] percpu: Embedded 29 pages/cpu s24768 r8192 d85824 u118784
[    0.000000] pcpu-alloc: s24768 r8192 d85824 u118784 alloc=29*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 
[    0.000000] Kernel command line: ro debug_pagealloc=on page_owner=on root=/dev/sda5 slub_debug=FZP page_poison=1 netconsole=6666@192.168.2.8/eth0,6666@192.168.2.3/A8:A1:59:16:4F:EA debug 
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 522560
[    0.000000] allocated 35651584 bytes of page_ext
[    0.000000] mem auto-init: stack:all(pattern), heap alloc:off, heap free:off
[    0.000000] stackdepot: allocating hash table via alloc_large_system_hash
[    0.000000] stackdepot hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xf6000000..0xfec00000  : kasan shadow mem
[    0.000000]   * 0xf5bbf000..0xf5fff000  : fixmap
[    0.000000]   * 0xf5400000..0xf5800000  : highmem PTEs
[    0.000000]   * 0xf5115000..0xf5400000  : early ioremap
[    0.000000]   * 0xf1000000..0xf5110000  : vmalloc & ioremap
[    0.000000]   * 0xb0000000..0xc0000000  : modules
[    0.000000] Memory: 1898608K/2097152K available (23160K kernel code, 1940K rwdata, 5512K rodata, 1624K init, 403K bss, 198544K reserved, 0K cma-reserved, 1212416K highmem)
[    0.000000] **********************************************************
[    0.000000] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    0.000000] **                                                      **
[    0.000000] ** This system shows unhashed kernel memory addresses   **
[    0.000000] ** via the console, logs, and other interfaces. This    **
[    0.000000] ** might reduce the security of your system.            **
[    0.000000] **                                                      **
[    0.000000] ** If you see this message and you are not debugging    **
[    0.000000] ** the kernel, report this immediately to your system   **
[    0.000000] ** administrator!                                       **
[    0.000000] **                                                      **
[    0.000000] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    0.000000] **********************************************************
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] Node 0, zone      DMA: page owner found early allocated 47 pages
[    0.000000] Node 0, zone  HighMem: page owner found early allocated 0 pages
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] mpic: Resetting
[    0.000000] mpic: Setting up MPIC " MPIC 1   " version 1.2 at 80040000, max 2 CPUs
[    0.000000] mpic: ISU size: 64, shift: 6, mask: 3f
[    0.000000] mpic: Initializing for 64 sources
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] time_init: decrementer frequency = 41.658586 MHz
[    0.000000] time_init: processor frequency   = 1416.666661 MHz
[    0.000009] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x99b953d88, max_idle_ns: 440795203627 ns
[    0.000577] clocksource: timebase mult[18013118] shift[24] registered
[    0.001099] clockevent: decrementer mult[aaa2318] shift[32] cpu[0]
[    0.005526] Console: colour dummy device 80x25
[    0.006026] printk: legacy console [tty0] enabled
[    0.006512] printk: legacy bootconsole [udbg0] disabled
[    0.007089] pid_max: default: 32768 minimum: 301
[    0.011756] LSM: initializing lsm=capability,yama
[    0.011963] Yama: becoming mindful.
[    0.014245] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.014421] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.033322] PowerMac SMP probe found 2 cpus
[    0.035720] KeyWest i2c @0xf8001003 irq 42 /uni-n@f8000000/i2c@f8001000
[    0.036364]  channel 0 bus <multibus>
[    0.036463]  channel 1 bus <multibus>
[    0.036782] KeyWest i2c @0x80018000 irq 26 /pci@f2000000/mac-io@17/i2c@18000
[    0.036921]  channel 0 bus <multibus>
[    0.037052] PMU i2c /pci@f2000000/mac-io@17/via-pmu@16000/pmu-i2c
[    0.037665]  channel 1 bus <multibus>
[    0.037760]  channel 2 bus <multibus>
[    0.037837] pmf: no parser for command 17 !
[    0.037993] Processor timebase sync using GPIO 0x73
[    0.038030] mpic: requesting IPIs...
[    0.038560] CPU0: L2CR is 80000000
[    0.038600] CPU0: L3CR is 9c030000
[    0.047029] RCU Tasks Trace: Setting shift to 1 and lim to 1 rcu_task_cb_adjust=1.
[    0.047733] MPC7450 family performance monitor hardware support registered
[    0.048804] rcu: Hierarchical SRCU implementation.
[    0.048864] rcu: 	Max phase no-delay instances is 1000.
[    0.052717] smp: Bringing up secondary CPUs ...
[85876329.749419] CPU1: L2CR was 0
[85876329.749509] CPU1: L2CR set to 80000000
[85876329.749522] CPU1: L3CR was 0
[85876329.749672] CPU1: L3CR set to 9c030000
[    0.060306] smp: Brought up 1 node, 2 CPUs
[    0.069276] devtmpfs: initialized
[    0.072806] Duplicate name in PowerPC,G4@0, renamed to "l2-cache#1"
[    0.073449] Duplicate name in l2-cache#1, renamed to "l2-cache#1"
[    0.075779] Duplicate name in PowerPC,G4@1, renamed to "l2-cache#1"
[    0.076399] Duplicate name in l2-cache#1, renamed to "l2-cache#1"
[    0.103219] Duplicate name in gpio@50, renamed to "gpio5@6f#1"
[    0.103728] Duplicate name in gpio@50, renamed to "gpio6@70#1"
[    0.104682] Duplicate name in gpio@50, renamed to "gpio11@75#1"
[    0.105184] Duplicate name in gpio@50, renamed to "extint-gpio15@67#1"
[    0.143873] Found UniNorth PCI host bridge at 0x00000000f0000000. Firmware bus number: 0->0
[    0.144000] PCI host bridge /pci@f0000000  ranges:
[    0.144097]  MEM 0x00000000f1000000..0x00000000f1ffffff -> 0x00000000f1000000 
[    0.144168]   IO 0x00000000f0000000..0x00000000f07fffff -> 0x0000000000000000
[    0.161263]  MEM 0x0000000090000000..0x00000000afffffff -> 0x0000000090000000 
[    0.161747] Found UniNorth PCI host bridge at 0x00000000f2000000. Firmware bus number: 0->0
[    0.161811] PCI host bridge /pci@f2000000 (primary) ranges:
[    0.161902]  MEM 0x00000000f3000000..0x00000000f3ffffff -> 0x00000000f3000000 
[    0.161971]   IO 0x00000000f2000000..0x00000000f27fffff -> 0x0000000000000000
[    0.178598]  MEM 0x0000000080000000..0x000000008fffffff -> 0x0000000080000000 
[    0.179099] Found UniNorth PCI host bridge at 0x00000000f4000000. Firmware bus number: 0->0
[    0.179163] PCI host bridge /pci@f4000000  ranges:
[    0.179254]  MEM 0x00000000f5000000..0x00000000f5ffffff -> 0x00000000f5000000 
[    0.179312]   IO 0x00000000f4000000..0x00000000f47fffff -> 0x0000000000000000
[    0.196462] Found NEC PD720100A USB2 chip with disabled EHCI, fixing up...
[    0.198253] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    0.198587] futex hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.209678] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.244542] PCI: Probing PCI hardware
[    0.246809] PCI host bridge to bus 0000:00
[    0.246906] pci_bus 0000:00: root bus resource [io  0xff780000-0xfff7ffff] (bus address [0x0000-0x7fffff])
[    0.246986] pci_bus 0000:00: root bus resource [mem 0xf1000000-0xf1ffffff]
[    0.247045] pci_bus 0000:00: root bus resource [mem 0x90000000-0xafffffff]
[    0.247229] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.247283] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    0.249248] pci 0000:00:0b.0: [106b:0034] type 00 class 0x060000 conventional PCI endpoint
[    0.252342] pci 0000:00:10.0: [1002:4150] type 00 class 0x030000 conventional PCI endpoint
[    0.252456] pci 0000:00:10.0: BAR 0 [mem 0xa0000000-0xafffffff pref]
[    0.252519] pci 0000:00:10.0: BAR 1 [io  0xff780400-0xff7804ff]
[    0.252574] pci 0000:00:10.0: BAR 2 [mem 0x90000000-0x9000ffff]
[    0.252651] pci 0000:00:10.0: ROM [mem 0x90020000-0x9003ffff pref]
[    0.252769] pci 0000:00:10.0: supports D1 D2
[    0.255530] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
[    0.258448] OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not find phandle 1751474532
[    0.258724] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio15@67: could not find phandle 1751474532
[    0.259032] OF: /pci@f2000000/mac-io@17/gpio@50/gpio6@70: could not find phandle 1634562093
[    0.259190] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio16@68: could not find phandle 1936745825
[    0.259369] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio14@66: could not find phandle 1818848869
[    0.259541] OF: /pci@f2000000/mac-io@17/gpio@50/gpio12@76: could not find phandle 1835103092
[    0.259682] OF: /pci@f2000000/mac-io@17/gpio@50/gpio11@75: could not find phandle 1635083369
[    0.259814] OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not find phandle 1751474532
[    0.259945] OF: /pci@f2000000/mac-io@17/gpio@50/gpio6@70: could not find phandle 1634562093
[    0.260077] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio4@5c: could not find phandle 1818848869
[    0.260245] OF: /pci@f2000000/mac-io@17/gpio@50/gpio11@75: could not find phandle 1635083369
[    0.260378] OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio15@67: could not find phandle 1751474532
[    0.262969] pci_bus 0001:00: Fixed dependency cycle(s) with /pci@f2000000/mac-io@17/interrupt-controller@40000
[    0.263223] PCI host bridge to bus 0001:00
[    0.263280] pci_bus 0001:00: root bus resource [io  0x0000-0x7fffff]
[    0.263343] pci_bus 0001:00: root bus resource [mem 0xf3000000-0xf3ffffff]
[    0.263401] pci_bus 0001:00: root bus resource [mem 0x80000000-0x8fffffff]
[    0.263466] pci_bus 0001:00: root bus resource [bus 00-ff]
[    0.263514] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to ff
[    0.264844] pci 0001:00:0b.0: [106b:0035] type 00 class 0x060000 conventional PCI endpoint
[    0.266886] pci 0001:00:12.0: [1033:0035] type 00 class 0x0c0310 conventional PCI endpoint
[    0.266990] pci 0001:00:12.0: BAR 0 [mem 0x8008c000-0x8008cfff]
[    0.267139] pci 0001:00:12.0: supports D1 D2
[    0.267181] pci 0001:00:12.0: PME# supported from D0 D1 D2 D3hot
[    0.269046] pci 0001:00:12.1: [1033:0035] type 00 class 0x0c0310 conventional PCI endpoint
[    0.269145] pci 0001:00:12.1: BAR 0 [mem 0x8008b000-0x8008bfff]
[    0.269294] pci 0001:00:12.1: supports D1 D2
[    0.269333] pci 0001:00:12.1: PME# supported from D0 D1 D2 D3hot
[    0.271241] pci 0001:00:12.2: [1033:00e0] type 00 class 0x0c0320 conventional PCI endpoint
[    0.271337] pci 0001:00:12.2: BAR 0 [mem 0x80081000-0x800810ff]
[    0.271485] pci 0001:00:12.2: supports D1 D2
[    0.271525] pci 0001:00:12.2: PME# supported from D0 D1 D2 D3hot
[    0.273389] pci 0001:00:13.0: [1095:3112] type 00 class 0x018000 conventional PCI endpoint
[    0.273485] pci 0001:00:13.0: BAR 0 [io  0x0460-0x0467]
[    0.273539] pci 0001:00:13.0: BAR 1 [io  0x0450-0x0453]
[    0.273588] pci 0001:00:13.0: BAR 2 [io  0x0440-0x0447]
[    0.273637] pci 0001:00:13.0: BAR 3 [io  0x0430-0x0433]
[    0.273685] pci 0001:00:13.0: BAR 4 [io  0x0420-0x042f]
[    0.273735] pci 0001:00:13.0: BAR 5 [mem 0x80082000-0x800821ff]
[    0.273786] pci 0001:00:13.0: ROM [mem 0x80100000-0x8017ffff pref]
[    0.273892] pci 0001:00:13.0: supports D1 D2
[    0.275542] pci 0001:00:15.0: [9710:9865] type 00 class 0x070002 conventional PCI endpoint
[    0.275640] pci 0001:00:15.0: BAR 0 [io  0x0410-0x0417]
[    0.275696] pci 0001:00:15.0: BAR 1 [mem 0x8008a000-0x8008afff]
[    0.275761] pci 0001:00:15.0: BAR 4 [mem 0x80089000-0x80089fff]
[    0.275883] pci 0001:00:15.0: supports D1 D2
[    0.275922] pci 0001:00:15.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.277729] pci 0001:00:15.1: [9710:9865] type 00 class 0x070002 conventional PCI endpoint
[    0.277824] pci 0001:00:15.1: BAR 0 [io  0x0400-0x0407]
[    0.277879] pci 0001:00:15.1: BAR 1 [mem 0x80088000-0x80088fff]
[    0.277944] pci 0001:00:15.1: BAR 4 [mem 0x80087000-0x80087fff]
[    0.278061] pci 0001:00:15.1: supports D1 D2
[    0.278100] pci 0001:00:15.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.279505] pci 0001:00:15.2: [ffff:9865] type 00 class 0x070103 conventional PCI endpoint
[    0.279600] pci 0001:00:15.2: BAR 0 [io  0x0000-0x0007]
[    0.279654] pci 0001:00:15.2: BAR 1 [io  0x0000-0x0007]
[    0.279704] pci 0001:00:15.2: BAR 2 [mem 0x00000000-0x00000fff]
[    0.279761] pci 0001:00:15.2: BAR 4 [mem 0x00000000-0x00000fff]
[    0.279878] pci 0001:00:15.2: supports D1 D2
[    0.279916] pci 0001:00:15.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.282288] pci 0001:00:16.0: [14e4:4320] type 00 class 0x028000 conventional PCI endpoint
[    0.282388] pci 0001:00:16.0: BAR 0 [mem 0x8008e000-0x8008ffff]
[    0.282535] pci 0001:00:16.0: supports D1 D2
[    0.282574] pci 0001:00:16.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.283907] pci 0001:00:17.0: [106b:0022] type 00 class 0xff0000 conventional PCI endpoint
[    0.284002] pci 0001:00:17.0: BAR 0 [mem 0x80000000-0x8007ffff]
[    0.286241] pci 0001:00:18.0: [106b:0019] type 00 class 0x0c0310 conventional PCI endpoint
[    0.286343] pci 0001:00:18.0: BAR 0 [mem 0x80086000-0x80086fff]
[    0.287672] pci 0001:00:19.0: [106b:0019] type 00 class 0x0c0310 conventional PCI endpoint
[    0.287765] pci 0001:00:19.0: BAR 0 [mem 0x80085000-0x80085fff]
[    0.289755] pci 0001:00:1b.0: [1033:0035] type 00 class 0x0c0310 conventional PCI endpoint
[    0.289859] pci 0001:00:1b.0: BAR 0 [mem 0x80084000-0x80084fff]
[    0.290009] pci 0001:00:1b.0: supports D1 D2
[    0.290048] pci 0001:00:1b.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.292007] pci 0001:00:1b.1: [1033:0035] type 00 class 0x0c0310 conventional PCI endpoint
[    0.292108] pci 0001:00:1b.1: BAR 0 [mem 0x80083000-0x80083fff]
[    0.292256] pci 0001:00:1b.1: supports D1 D2
[    0.292295] pci 0001:00:1b.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.294182] pci 0001:00:1b.2: [1033:00e0] type 00 class 0x0c0320 conventional PCI endpoint
[    0.294279] pci 0001:00:1b.2: BAR 0 [mem 0x80080000-0x800800ff]
[    0.294427] pci 0001:00:1b.2: supports D1 D2
[    0.294466] pci 0001:00:1b.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.296082] pci_bus 0001:00: busn_res: [bus 00-ff] end is updated to 00
[    0.302269] PCI host bridge to bus 0002:00
[    0.302367] pci_bus 0002:00: root bus resource [io  0x880000-0x107ffff] (bus address [0x0000-0x7fffff])
[    0.302443] pci_bus 0002:00: root bus resource [mem 0xf5000000-0xf5ffffff]
[    0.302567] pci_bus 0002:00: root bus resource [bus 00-ff]
[    0.302620] pci_bus 0002:00: busn_res: [bus 00-ff] end is updated to ff
[    0.303952] pci 0002:00:0b.0: [106b:0036] type 00 class 0x060000 conventional PCI endpoint
[    0.306029] pci 0002:00:0d.0: [106b:0033] type 00 class 0xff0000 conventional PCI endpoint
[    0.306131] pci 0002:00:0d.0: BAR 0 [mem 0xf5004000-0xf5007fff]
[    0.307977] pci 0002:00:0e.0: [106b:0031] type 00 class 0x0c0010 conventional PCI endpoint
[    0.308072] pci 0002:00:0e.0: BAR 0 [mem 0xf5000000-0xf5000fff]
[    0.308211] pci 0002:00:0e.0: supports D1 D2
[    0.308250] pci 0002:00:0e.0: PME# supported from D0 D1 D2 D3hot
[    0.310275] pci 0002:00:0f.0: [106b:0032] type 00 class 0x020000 conventional PCI endpoint
[    0.310375] pci 0002:00:0f.0: BAR 0 [mem 0xf5200000-0xf53fffff]
[    0.310470] pci 0002:00:0f.0: ROM [mem 0xf5100000-0xf51fffff pref]
[    0.313866] pci_bus 0002:00: busn_res: [bus 00-ff] end is updated to 00
[    0.315993] PCI 0000:00 Cannot reserve Legacy IO [io  0xff780000-0xff780fff]
[    0.316143] PCI 0001:00 Cannot reserve Legacy IO [io  0x0000-0x0fff]
[    0.316228] pci_bus 0000:00: resource 4 [io  0xff780000-0xfff7ffff]
[    0.316277] pci_bus 0000:00: resource 5 [mem 0xf1000000-0xf1ffffff]
[    0.316320] pci_bus 0000:00: resource 6 [mem 0x90000000-0xafffffff]
[    0.316440] pci 0001:00:15.2: BAR 2 [mem 0xf3000000-0xf3000fff]: assigned
[    0.316504] pci 0001:00:15.2: BAR 4 [mem 0xf3001000-0xf3001fff]: assigned
[    0.316562] pci 0001:00:15.2: BAR 0 [io  0x1000-0x1007]: assigned
[    0.316616] pci 0001:00:15.2: BAR 1 [io  0x1008-0x100f]: assigned
[    0.316687] pci_bus 0001:00: resource 4 [io  0x0000-0x7fffff]
[    0.316731] pci_bus 0001:00: resource 5 [mem 0xf3000000-0xf3ffffff]
[    0.316774] pci_bus 0001:00: resource 6 [mem 0x80000000-0x8fffffff]
[    0.316823] pci_bus 0002:00: resource 4 [io  0x880000-0x107ffff]
[    0.316866] pci_bus 0002:00: resource 5 [mem 0xf5000000-0xf5ffffff]
[    0.396716] raid6: altivecx8 gen()  1352 MB/s
[    0.453599] raid6: altivecx4 gen()  1474 MB/s
[    0.510490] raid6: altivecx2 gen()  1255 MB/s
[    0.567385] raid6: altivecx1 gen()   881 MB/s
[    0.624380] raid6: int32x8  gen()   168 MB/s
[    0.681251] raid6: int32x4  gen()   177 MB/s
[    0.738160] raid6: int32x2  gen()   198 MB/s
[    0.794983] raid6: int32x1  gen()   158 MB/s
[    0.795018] raid6: using algorithm altivecx4 gen() 1474 MB/s
[    0.795051] raid6: using intx1 recovery algorithm
[    0.808482] SCSI subsystem initialized
[    0.811552] libata version 3.00 loaded.
[    0.814846] usbcore: registered new interface driver usbfs
[    0.815433] usbcore: registered new interface driver hub
[    0.816409] usbcore: registered new device driver usb
[    0.837216] pci 0000:00:10.0: vgaarb: setting as boot VGA device
[    0.837317] pci 0000:00:10.0: vgaarb: bridge control possible
[    0.837357] pci 0000:00:10.0: vgaarb: VGA device added: decodes=io+mem,owns=mem,locks=none
[    0.837467] vgaarb: loaded
[    0.838380] clocksource: Switched to clocksource timebase
[    0.961749] NET: Registered PF_INET protocol family
[    0.964206] IP idents hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.975995] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 10240 bytes, linear)
[    0.979564] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.980793] TCP established hash table entries: 8192 (order: 3, 32768 bytes, linear)
[    0.988325] TCP bind hash table entries: 8192 (order: 6, 327680 bytes, linear)
[    0.989733] TCP: Hash tables configured (established 8192 bind 8192)
[    0.992227] UDP hash table entries: 512 (order: 2, 24576 bytes, linear)
[    0.992905] UDP-Lite hash table entries: 512 (order: 2, 24576 bytes, linear)
[    0.995321] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.996992] pci 0001:00:12.0: enabling device (0000 -> 0002)
[    0.997198] pci 0001:00:12.1: enabling device (0000 -> 0002)
[    0.997323] pci 0001:00:12.2: enabling device (0004 -> 0006)
[    0.997526] Apple USB OHCI 0001:00:18.0 disabled by firmware
[    0.997566] pci 0001:00:18.0: Can't enable PCI device, BIOS handoff failed.
[    0.997621] Apple USB OHCI 0001:00:19.0 disabled by firmware
[    0.997657] pci 0001:00:19.0: Can't enable PCI device, BIOS handoff failed.
[    0.997721] pci 0001:00:1b.0: enabling device (0000 -> 0002)
[    0.997834] pci 0001:00:1b.1: enabling device (0000 -> 0002)
[    0.997943] pci 0001:00:1b.2: enabling device (0004 -> 0006)
[    0.998095] pci 0002:00:0f.0: CLS mismatch (32 != 1020), using 32 bytes
[    1.003582] Thermal assist unit not available
[    1.017097] Initialise system trusted keyrings
[    1.019066] workingset: timestamp_bits=14 max_order=19 bucket_order=5
[    1.041601] fuse: init (API version 7.39)
[    1.045362] 9p: Installing v9fs 9p2000 file system support
[    1.048252] xor: measuring software checksum speed
[    1.092188]    8regs           :   224 MB/sec
[    1.138848]    8regs_prefetch  :   211 MB/sec
[    1.184395]    32regs          :   216 MB/sec
[    1.233925]    32regs_prefetch :   200 MB/sec
[    1.238206]    altivec         :  2330 MB/sec
[    1.238240] xor: using function: altivec (2330 MB/sec)
[    1.238309] Key type asymmetric registered
[    1.238379] Asymmetric key parser 'x509' registered
[    1.245722] alg: extra crypto tests enabled.  This is intended for developer use only.
[    1.403398] bounce: pool size: 64 pages
[    1.405090] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    1.405653] io scheduler bfq registered
[    1.487621] atomic64_test: passed
[    1.492654] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    1.513419] serial 0001:00:15.0: enabling device (0004 -> 0007)
[    1.521094] 0001:00:15.0: ttyS0 at I/O 0x410 (irq = 58, base_baud = 115200) is a 16550A
[    1.524229] serial 0001:00:15.1: enabling device (0004 -> 0007)
[    1.530338] 0001:00:15.1: ttyS1 at I/O 0x400 (irq = 58, base_baud = 115200) is a 16550A
[    1.542468] MacIO PCI driver attached to Keylargo chipset
[    1.578560] sata_sil 0001:00:13.0: version 2.4
[    1.579252] sata_sil 0001:00:13.0: enabling device (0004 -> 0007)
[    1.594384] scsi host0: sata_sil
[    1.601082] scsi host1: sata_sil
[    1.603469] ata1: SATA max UDMA/100 mmio m512@0x80082000 tf 0x80082080 irq 53 lpm-pol 0
[    1.603547] ata2: SATA max UDMA/100 mmio m512@0x80082000 tf 0x800820c0 irq 53 lpm-pol 0
[    1.606271] pata-pci-macio 0002:00:0d.0: enabling device (0004 -> 0006)
[    1.621841] pata-pci-macio 0002:00:0d.0: Activating pata-macio chipset UniNorth ATA-6, Apple bus ID 3
[    1.632515] scsi host2: pata_macio
[    1.635269] ata3: PATA max UDMA/100 irq 39 lpm-pol 0
[    1.918606] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[    1.919621] ata1.00: ATA-9: SanDisk SSD PLUS 240GB, UF4500RL, max UDMA/133
[    1.919691] ata1.00: 468877312 sectors, multi 1: LBA48 NCQ (depth 0/32)
[    1.921135] ata1.00: Features: Dev-Sleep
[    1.945616] ata1.00: configured for UDMA/100
[    1.948868] scsi 0:0:0:0: Direct-Access     ATA      SanDisk SSD PLUS 00RL PQ: 0 ANSI: 5
[    1.962530] sd 0:0:0:0: [sda] 468877312 512-byte logical blocks: (240 GB/224 GiB)
[    1.962898] sd 0:0:0:0: [sda] Write Protect is off
[    1.962974] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    1.963579] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.964168] sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
[    1.976888]  sda: [mac] sda1 sda2 sda3 sda4 sda5 sda6 sda7 sda8
[    1.990790] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.441755] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 310)
[    2.444362] ata2.00: ATA-9: WDC WD5000LPLX-60ZNTT1, 02.01A02, max UDMA/133
[    2.444426] ata2.00: 976773168 sectors, multi 0: LBA48 NCQ (depth 0/32)
[    2.447158] ata2.00: configured for UDMA/100
[    2.450256] scsi 1:0:0:0: Direct-Access     ATA      WDC WD5000LPLX-6 1A02 PQ: 0 ANSI: 5
[    2.460037] sd 1:0:0:0: [sdb] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[    2.460154] sd 1:0:0:0: [sdb] 4096-byte physical blocks
[    2.460532] sd 1:0:0:0: [sdb] Write Protect is off
[    2.460611] sd 1:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    2.461068] sd 1:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.461729] sd 1:0:0:0: [sdb] Preferred minimum I/O size 4096 bytes
[    2.678563] pata-macio 0.0001f000:ata-4: Activating pata-macio chipset KeyLargo ATA-4, Apple bus ID 2
[    2.688698] scsi host3: pata_macio
[    2.691314] ata4: PATA max UDMA/66 irq 19 lpm-pol 0
[    2.847894] ata4.00: CFA: DeLOCK 54143 512MB, 100511E, max UDMA/66
[    2.847997] ata4.00: 1009008 sectors, multi 1: LBA 
[    3.185274]  sdb: [mac] sdb1 sdb2 sdb3 sdb4 sdb5 sdb6 sdb7 sdb8
[    3.198797] sd 1:0:0:0: [sdb] Attached SCSI disk
[    3.202230] scsi 3:0:0:0: Direct-Access     ATA      DeLOCK 54143 512 11E  PQ: 0 ANSI: 5
[    3.212163] sd 3:0:0:0: [sdc] 1009008 512-byte logical blocks: (517 MB/493 MiB)
[    3.212528] sd 3:0:0:0: [sdc] Write Protect is off
[    3.212602] sd 3:0:0:0: [sdc] Mode Sense: 00 3a 00 00
[    3.213057] sd 3:0:0:0: [sdc] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    3.213633] sd 3:0:0:0: [sdc] Preferred minimum I/O size 512 bytes
[    3.225404]  sdc: [mac] sdc1 sdc2 sdc3 sdc4 sdc5 sdc6
[    3.236068] sd 3:0:0:0: [sdc] Attached SCSI disk
[    3.718413] pata-macio 0.00020000:ata-3: Activating pata-macio chipset KeyLargo ATA-3, Apple bus ID 0
[    3.727950] scsi host4: pata_macio
[    3.730608] ata5: PATA max MWDMA2 irq 20 lpm-pol 0
[    3.733649] sungem.c:v1.0 David S. Miller <davem@redhat.com>
[    3.746277] gem 0002:00:0f.0 eth0: Sun GEM (PCI) 10/100/1000BaseT Ethernet 00:0a:95:9c:76:3a
[    3.751397] ehci-pci 0001:00:12.2: EHCI Host Controller
[    3.751609] ehci-pci 0001:00:12.2: new USB bus registered, assigned bus number 1
[    3.752916] ehci-pci 0001:00:12.2: irq 52, io mem 0x80081000
[    3.757198] rtc-generic rtc-generic: registered as rtc0
[    3.760371] PowerMac i2c bus pmu 2 registered
[    3.762278] PowerMac i2c bus pmu 1 registered
[    3.765133] ehci-pci 0001:00:12.2: USB 2.0 started, EHCI 1.00
[    3.766981] PowerMac i2c bus mac-io 0 registered
[    3.767448] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.08
[    3.767536] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.767583] usb usb1: Product: EHCI Host Controller
[    3.767618] usb usb1: Manufacturer: Linux 6.8.0-rc6-PMacG4 ehci_hcd
[    3.767657] usb usb1: SerialNumber: 0001:00:12.2
[    3.768261] i2c i2c-2: No i2c address for /pci@f2000000/mac-io@17/i2c@18000/i2c-modem
[    3.771334] PowerMac i2c bus uni-n 1 registered
[    3.771430] i2c i2c-3: i2c-powermac: modalias failure on /uni-n@f8000000/i2c@f8001000/cereal@1c0
[    3.772491] hub 1-0:1.0: USB hub found
[    3.772816] hub 1-0:1.0: 5 ports detected
[    3.773836] PowerMac i2c bus uni-n 0 registered
[    3.779648] hid: raw HID events driver (C) Jiri Kosina
[    3.780641] ehci-pci 0001:00:1b.2: EHCI Host Controller
[    3.780946] ehci-pci 0001:00:1b.2: new USB bus registered, assigned bus number 2
[    3.781987] ehci-pci 0001:00:1b.2: irq 63, io mem 0x80080000
[    3.782705] usbcore: registered new interface driver usbhid
[    3.782774] usbhid: USB HID core driver
[    3.786613] 9pnet: Installing 9P2000 support
[    3.790019] drmem: No dynamic reconfiguration memory found
[    3.795131] ehci-pci 0001:00:1b.2: USB 2.0 started, EHCI 1.00
[    3.796604] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.08
[    3.796681] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.796728] usb usb2: Product: EHCI Host Controller
[    3.796764] usb usb2: Manufacturer: Linux 6.8.0-rc6-PMacG4 ehci_hcd
[    3.796801] usb usb2: SerialNumber: 0001:00:1b.2
[    3.802387] hub 2-0:1.0: USB hub found
[    3.803481] hub 2-0:1.0: 5 ports detected
[    3.891124] ata5.00: ATAPI: _NEC DVD_RW ND-3520A, 1.04, max UDMA/33
[    3.902087] scsi 4:0:0:0: CD-ROM            _NEC     DVD_RW ND-3520A  1.04 PQ: 0 ANSI: 5
[    3.929800] registered taskstats version 1
[    3.932570] Loading compiled-in X.509 certificates
[    4.066798] sr 4:0:0:0: [sr0] scsi3-mmc drive: 48x/48x writer cd/rw xa/form2 cdda tray
[    4.066909] cdrom: Uniform CD-ROM driver Revision: 3.20
[    4.157651] sr 4:0:0:0: Attached scsi CD-ROM sr0
[    4.380946] zswap: loaded using pool zstd/zsmalloc
[    4.384378] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
[    4.385999] page_owner is disabled
[    4.476614] Btrfs loaded, zoned=no, fsverity=no
[    8.317404] input: PMU as /devices/virtual/input/input0
[    8.320142] netpoll: netconsole: local port 6666
[    8.320210] netpoll: netconsole: local IPv4 address 192.168.2.8
[    8.320254] netpoll: netconsole: interface 'eth0'
[    8.320284] netpoll: netconsole: remote port 6666
[    8.320315] netpoll: netconsole: remote IPv4 address 192.168.2.3
[    8.320350] netpoll: netconsole: remote ethernet address a8:a1:59:16:4f:ea
[    8.320399] netpoll: netconsole: device eth0 not up yet, forcing it
[    8.418795] sungem_phy: PHY ID: 2060e1, addr: 0
[    8.419130] gem 0002:00:0f.0 eth0: Found BCM5421 PHY
[   12.092064] gem 0002:00:0f.0 eth0: Link is up at 1000 Mbps, full-duplex
[   12.092263] gem 0002:00:0f.0 eth0: Pause is enabled (rxfifo: 10240 off: 7168 on: 5632)
[   12.104786] printk: legacy console [netcon0] enabled
[   12.135834] netconsole: network logging started
[   12.187267] EXT4-fs (sda5): mounted filesystem fa07e66f-b4f9-404f-85d8-487d3c097aec ro with ordered data mode. Quota mode: disabled.
[   12.187801] VFS: Mounted root (ext4 filesystem) readonly on device 8:5.
[   12.196728] devtmpfs: mounted
[   12.202308] Freeing unused kernel image (initmem) memory: 1624K
[   12.238089] Checked W+X mappings: passed, no W+X pages found
[   12.238447] rodata_test: all tests were successful
[   12.239083] Run /sbin/init as init process
[   12.239363]   with arguments:
[   12.239442]     /sbin/init
[   12.239664]   with environment:
[   12.239734]     HOME=/
[   12.239800]     TERM=linux
[   17.218402] random: crng init done
[   22.103832] ==================================================================
[   22.104062] BUG: KASAN: slab-out-of-bounds in handle_mm_fault+0x9d4/0x19ac
[   22.104197] Read of size 4 at addr c48b95c8 by task openrc-run.sh/449
[   22.104286] 
[   22.104355] CPU: 0 PID: 449 Comm: openrc-run.sh Not tainted 6.8.0-rc6-PMacG4 #2
[   22.104452] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.104534] Call Trace:
[   22.104603] [f3b7bcf0] [c162b128] dump_stack_lvl+0x60/0x94 (unreliable)
[   22.104726] [f3b7bd10] [c04ef6e0] print_report+0xd4/0x520
[   22.104830] [f3b7bd60] [c04efde8] kasan_report+0x118/0x128
[   22.104926] [f3b7bde0] [c046c468] handle_mm_fault+0x9d4/0x19ac
[   22.105023] [f3b7bec0] [c0047b8c] ___do_page_fault+0x93c/0xc14
[   22.105134] [f3b7bf10] [c0048278] do_page_fault+0x28/0x60
[   22.105231] [f3b7bf30] [c000433c] DataAccess_virt+0x124/0x17c
[   22.105330] --- interrupt: 300 at 0x829c2c
[   22.105414] NIP:  00829c2c LR: 00829ba4 CTR: 00000000
[   22.105491] REGS: f3b7bf40 TRAP: 0300   Not tainted  (6.8.0-rc6-PMacG4)
[   22.105575] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 28042428  XER: 00000000
[   22.105737] DAR: afd72a70 DSISR: 0a000000 
[   22.105737] GPR00: 28048428 afd729c0 a7c61300 00000000 00829ba4 28048428 fe76f7e1 00824700 
[   22.105737] GPR08: 0000d032 406b1f18 00950f0c 406b213a 406b1e07 0099fff4 00000001 0240ea6e 
[   22.105737] GPR16: ffffff84 afd72b00 00000000 afd72b0c afd72b1c 00000000 00000000 009a049c 
[   22.105737] GPR24: 00000000 0240ea54 00000001 009a02b4 00000002 0240ea54 0094ffac 00000000 
[   22.106298] NIP [00829c2c] 0x829c2c
[   22.106378] LR [00829ba4] 0x829ba4
[   22.106454] --- interrupt: 300
[   22.106525] 
[   22.106589] Allocated by task 1 on cpu 494910 at 14000.630695s:
[   22.106671] ------------[ cut here ]------------
[   22.106743] pool index 61754 out of bounds (158) for stack id 789d4095
[   22.107015] WARNING: CPU: 0 PID: 449 at lib/stackdepot.c:488 depot_fetch_stack+0x34/0xd0
[   22.107147] Modules linked in:
[   22.107233] CPU: 0 PID: 449 Comm: openrc-run.sh Not tainted 6.8.0-rc6-PMacG4 #2
[   22.107328] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.107556] NIP:  c0d6fe94 LR: c0d6fe94 CTR: 00000000
[   22.107639] REGS: f3b7bc00 TRAP: 0700   Not tainted  (6.8.0-rc6-PMacG4)
[   22.107722] MSR:  00021032 <ME,IR,DR,RI>  CR: 24b82f34  XER: 00000000
[   22.107862] 
[   22.107862] GPR00: c0d6fe94 f3b7bcc0 c4393c20 00000000 00000000 00000000 00000000 00000000 
[   22.107862] GPR08: 00000000 00000000 00000000 f3b7bcc0 00000000 0099fff4 00000001 0240ea6e 
[   22.107862] GPR16: ffffff84 afd72b00 00000000 00000001 c4393f90 c433a7b0 00000000 f3b7bf40 
[   22.107862] GPR24: afd72a70 c1a07141 c1a054f3 c48b95c8 00000004 eee7ba04 f3b7bd68 f3b7bd0c 
[   22.108469] NIP [c0d6fe94] depot_fetch_stack+0x34/0xd0
[   22.108560] LR [c0d6fe94] depot_fetch_stack+0x34/0xd0
[   22.108647] Call Trace:
[   22.108714] [f3b7bcc0] [c0d6fe94] depot_fetch_stack+0x34/0xd0 (unreliable)
[   22.108820] [f3b7bcd0] [c0d6ff68] stack_depot_fetch+0x38/0x90
[   22.108913] [f3b7bcf0] [c0d6ffd4] stack_depot_print+0x14/0x54
[   22.109006] [f3b7bd10] [c04ef71c] print_report+0x110/0x520
[   22.109104] [f3b7bd60] [c04efde8] kasan_report+0x118/0x128
[   22.109199] [f3b7bde0] [c046c468] handle_mm_fault+0x9d4/0x19ac
[   22.109442] [f3b7bec0] [c0047b8c] ___do_page_fault+0x93c/0xc14
[   22.109550] [f3b7bf10] [c0048278] do_page_fault+0x28/0x60
[   22.109647] [f3b7bf30] [c000433c] DataAccess_virt+0x124/0x17c
[   22.109742] --- interrupt: 300 at 0x829c2c
[   22.109821] NIP:  00829c2c LR: 00829ba4 CTR: 00000000
[   22.109972] REGS: f3b7bf40 TRAP: 0300   Not tainted  (6.8.0-rc6-PMacG4)
[   22.110056] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 28042428  XER: 00000000
[   22.110212] DAR: afd72a70 DSISR: 0a000000 
[   22.110212] GPR00: 28048428 afd729c0 a7c61300 00000000 00829ba4 28048428 fe76f7e1 00824700 
[   22.110212] GPR08: 0000d032 406b1f18 00950f0c 406b213a 406b1e07 0099fff4 00000001 0240ea6e 
[   22.110212] GPR16: ffffff84 afd72b00 00000000 afd72b0c afd72b1c 00000000 00000000 009a049c 
[   22.110212] GPR24: 00000000 0240ea54 00000001 009a02b4 00000002 0240ea54 0094ffac 00000000 
[   22.110763] NIP [00829c2c] 0x829c2c
[   22.110841] LR [00829ba4] 0x829ba4
[   22.110917] --- interrupt: 300
[   22.110987] Code: 54648bfe 392944e0 80a90008 7c042800 40a10050 9421fff0 7c661b78 3c60c1a3 7c0802a6 38639cca 90010014 4b32d7f5 <0fe00000> 80010014 38600000 38210010 
[   22.111246] ---[ end trace 0000000000000000 ]---
[   22.111455] ------------[ cut here ]------------
[   22.111527] corrupt handle or use after stack_depot_put()
[   22.111635] WARNING: CPU: 0 PID: 449 at lib/stackdepot.c:747 stack_depot_fetch+0x6c/0x90
[   22.111811] Modules linked in:
[   22.111891] CPU: 0 PID: 449 Comm: openrc-run.sh Tainted: G        W          6.8.0-rc6-PMacG4 #2
[   22.111988] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.112146] NIP:  c0d6ff9c LR: c0d6ff9c CTR: 00000000
[   22.112227] REGS: f3b7bc10 TRAP: 0700   Tainted: G        W           (6.8.0-rc6-PMacG4)
[   22.112317] MSR:  00021032 <ME,IR,DR,RI>  CR: 24b82f34  XER: 00000000
[   22.112455] 
[   22.112455] GPR00: c0d6ff9c f3b7bcd0 c4393c20 00000000 00000000 00000000 00000000 00000000 
[   22.112455] GPR08: 00000000 00000000 00000000 f3b7bcd0 00000000 0099fff4 00000001 0240ea6e 
[   22.112455] GPR16: ffffff84 afd72b00 00000000 00000001 c4393f90 c433a7b0 00000000 f3b7bf40 
[   22.112455] GPR24: afd72a70 c1a07141 c1a054f3 c48b95c8 00000004 eee7ba04 f3b7bd68 f3b7bd0c 
[   22.112985] NIP [c0d6ff9c] stack_depot_fetch+0x6c/0x90
[   22.113073] LR [c0d6ff9c] stack_depot_fetch+0x6c/0x90
[   22.113157] Call Trace:
[   22.113357] [f3b7bcd0] [c0d6ff9c] stack_depot_fetch+0x6c/0x90 (unreliable)
[   22.113469] [f3b7bcf0] [c0d6ffd4] stack_depot_print+0x14/0x54
[   22.113564] [f3b7bd10] [c04ef71c] print_report+0x110/0x520
[   22.113661] [f3b7bd60] [c04efde8] kasan_report+0x118/0x128
[   22.113757] [f3b7bde0] [c046c468] handle_mm_fault+0x9d4/0x19ac
[   22.113855] [f3b7bec0] [c0047b8c] ___do_page_fault+0x93c/0xc14
[   22.113957] [f3b7bf10] [c0048278] do_page_fault+0x28/0x60
[   22.114130] [f3b7bf30] [c000433c] DataAccess_virt+0x124/0x17c
[   22.114228] --- interrupt: 300 at 0x829c2c
[   22.114307] NIP:  00829c2c LR: 00829ba4 CTR: 00000000
[   22.114384] REGS: f3b7bf40 TRAP: 0300   Tainted: G        W           (6.8.0-rc6-PMacG4)
[   22.114472] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 28042428  XER: 00000000
[   22.114756] DAR: afd72a70 DSISR: 0a000000 
[   22.114756] GPR00: 28048428 afd729c0 a7c61300 00000000 00829ba4 28048428 fe76f7e1 00824700 
[   22.114756] GPR08: 0000d032 406b1f18 00950f0c 406b213a 406b1e07 0099fff4 00000001 0240ea6e 
[   22.114756] GPR16: ffffff84 afd72b00 00000000 afd72b0c afd72b1c 00000000 00000000 009a049c 
[   22.114756] GPR24: 00000000 0240ea54 00000001 009a02b4 00000002 0240ea54 0094ffac 00000000 
[   22.115308] NIP [00829c2c] 0x829c2c
[   22.115385] LR [00829ba4] 0x829ba4
[   22.115460] --- interrupt: 300
[   22.115529] Code: 41820024 39230018 913f0000 8063000c 39610020 38000000 38800000 39200000 4b2e0534 3c60c1a3 38639d0f 4b32d6ed <0fe00000> 38600000 4bffffd8 38600000 
[   22.115784] ---[ end trace 0000000000000000 ]---
[   22.115858] 
[   22.115921] The buggy address belongs to the object at c48b9560
[   22.115921]  which belongs to the cache kernfs_node_cache of size 88
[   22.116018] The buggy address is located 16 bytes to the right of
[   22.116018]  allocated 88-byte region [c48b9560, c48b95b8)
[   22.116189] 
[   22.116253] The buggy address belongs to the physical page:
[   22.116328] page:eee7ba04 refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0x48b9
[   22.116418] flags: 0x800(slab|zone=0)
[   22.116627] page_type: 0xffffffff()
[   22.116714] raw: 00000800 c20b0120 00000100 00000122 00000000 001a0034 ffffffff 00000001
[   22.116800] raw: 00000000
[   22.116863] page dumped because: kasan: bad access detected
[   22.116938] page_owner tracks the page as allocated
[   22.117008] page last allocated via order 0, migratetype Unmovable, gfp_mask 0x12cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY), pid 1, tgid 1 (swapper/0), ts 4386559424, free_ts 4385950528
[   22.117150]  prep_new_page+0x24/0xbc
[   22.117236]  get_page_from_freelist+0xcd0/0xf10
[   22.117316]  __alloc_pages+0x204/0xe2c
[   22.117393]  alloc_slab_page+0x30/0x7c
[   22.117553]  new_slab+0xb4/0x320
[   22.117635]  ___slab_alloc+0x400/0x5e8
[   22.117717]  kmem_cache_alloc+0x11c/0x284
[   22.117926]  __kernfs_new_node+0xfc/0x570
[   22.118009]  kernfs_new_node+0x138/0x1a0
[   22.118087]  __kernfs_create_file+0x44/0x2e8
[   22.118167]  sysfs_add_file_mode_ns+0x2a4/0x324
[   22.118248]  internal_create_group+0x800/0xa78
[   22.118330]  btrfs_init_sysfs+0x38c/0x54c
[   22.118410]  init_btrfs_fs+0xa8/0x298
[   22.118486]  do_one_initcall+0x144/0x454
[   22.118569]  kernel_init_freeable+0x7d0/0x814
[   22.119723] page last free pid 1 tgid 1 stack trace:
[   22.119817]  free_unref_page_prepare+0x2a8/0x45c
[   22.120004]  free_unref_page+0x84/0x2cc
[   22.120214]  destroy_args+0x1b8/0x3a0
[   22.120304]  debug_vm_pgtable+0xc60/0x12e8
[   22.120386]  do_one_initcall+0x144/0x454
[   22.120466]  kernel_init_freeable+0x7d0/0x814
[   22.120548]  kernel_init+0x28/0x158
[   22.120627]  ret_from_kernel_user_thread+0x10/0x18
[   22.120708] 
[   22.120769] Memory state around the buggy address:
[   22.120845]  c48b9480: 00 fc fc fc fc fc fc fc fc 00 00 00 00 00 00 00
[   22.120927]  c48b9500: 00 00 00 00 fc fc fc fc fc fc fc fc 00 00 00 00
[   22.121003] >c48b9580: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc 00
[   22.121076]                                       ^
[   22.121282]  c48b9600: 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc
[   22.121436]  c48b9680: fc fc 00 00 00 00 00 00 00 00 00 00 00 fc fc fc
[   22.121511] ==================================================================
[   22.121969] Disabling lock debugging due to kernel taint
[   22.126424] _swap_info_get: Bad swap file entry 2c5a5a5a
[   22.126653] BUG: Bad page map in process openrc-run.sh  pte:5a5a5a5a pmd:048b9000
[   22.126756] addr:afd54000 vm_flags:00100173 anon_vma:c43a67c0 mapping:00000000 index:affe0
[   22.126853] file:(null) fault:0x0 mmap:0x0 read_folio:0x0
[   22.126956] CPU: 0 PID: 449 Comm: openrc-run.sh Tainted: G    B   W          6.8.0-rc6-PMacG4 #2
[   22.127055] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.127134] Call Trace:
[   22.127202] [f3b7b950] [c162b128] dump_stack_lvl+0x60/0x94 (unreliable)
[   22.127463] [f3b7b970] [c045f880] print_bad_pte+0x648/0x658
[   22.127565] [f3b7ba00] [c04677b0] unmap_page_range+0xbec/0xd2c
[   22.127663] [f3b7bb00] [c0467ae4] unmap_vmas+0x1f4/0x25c
[   22.127833] [f3b7bbc0] [c047b008] exit_mmap+0x1e4/0x4d8
[   22.127934] [f3b7bce0] [c0093090] __mmput+0x78/0x388
[   22.128036] [f3b7bd10] [c00aa3a4] do_exit+0xa14/0x1c5c
[   22.128131] [f3b7bdb0] [c00aba18] do_group_exit+0xb4/0x220
[   22.128224] [f3b7bde0] [c00abbec] pid_child_should_wake+0x0/0x25c
[   22.128321] [f3b7be00] [c001e7e4] system_call_exception+0x2f0/0x430
[   22.128424] [f3b7bf30] [c002a1ac] ret_from_syscall+0x0/0x2c
[   22.128517] --- interrupt: c00 at 0x824780
[   22.128596] NIP:  00824780 LR: 00824748 CTR: 00882868
[   22.128805] REGS: f3b7bf40 TRAP: 0c00   Tainted: G    B   W           (6.8.0-rc6-PMacG4)
[   22.128897] MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002282  XER: 00000000
[   22.129076] 
[   22.129076] GPR00: 000000ea afd72e50 a7c61300 0000007f 00000000 afd73020 afd73030 009a02d0 
[   22.129076] GPR08: 009a02c0 00000000 009a02b8 afd72a40 2404842c 0099fff4 00000001 006298c8 
[   22.129076] GPR16: afde9344 00000000 006293a4 008e97a8 fffffffe a7c5bff8 009635a0 a7c5d008 
[   22.129076] GPR24: 00000000 afd733c8 00000004 afd73460 a7c5a308 fffff000 0094ffac 0000007f 
[   22.129615] NIP [00824780] 0x824780
[   22.129693] LR [00824748] 0x824748
[   22.129844] --- interrupt: c00
[   22.130216] _swap_info_get: Bad swap file entry 2c5a5a5a
[   22.130312] BUG: Bad page map in process openrc-run.sh  pte:5a5a5a5a pmd:048b9000
[   22.130399] addr:afd55000 vm_flags:00100173 anon_vma:c43a67c0 mapping:00000000 index:affe1
[   22.130488] file:(null) fault:0x0 mmap:0x0 read_folio:0x0
[   22.130619] CPU: 0 PID: 449 Comm: openrc-run.sh Tainted: G    B   W          6.8.0-rc6-PMacG4 #2
[   22.130713] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.130789] Call Trace:
[   22.130991] [f3b7b950] [c162b128] dump_stack_lvl+0x60/0x94 (unreliable)
[   22.131107] [f3b7b970] [c045f880] print_bad_pte+0x648/0x658
[   22.131202] [f3b7ba00] [c04677b0] unmap_page_range+0xbec/0xd2c
[   22.131298] [f3b7bb00] [c0467ae4] unmap_vmas+0x1f4/0x25c
[   22.131389] [f3b7bbc0] [c047b008] exit_mmap+0x1e4/0x4d8
[   22.131487] [f3b7bce0] [c0093090] __mmput+0x78/0x388
[   22.131659] [f3b7bd10] [c00aa3a4] do_exit+0xa14/0x1c5c
[   22.131755] [f3b7bdb0] [c00aba18] do_group_exit+0xb4/0x220
[   22.131849] [f3b7bde0] [c00abbec] pid_child_should_wake+0x0/0x25c
[   22.131944] [f3b7be00] [c001e7e4] system_call_exception+0x2f0/0x430
[   22.132045] [f3b7bf30] [c002a1ac] ret_from_syscall+0x0/0x2c
[   22.132138] --- interrupt: c00 at 0x824780
[   22.132344] NIP:  00824780 LR: 00824748 CTR: 00882868
[   22.132421] REGS: f3b7bf40 TRAP: 0c00   Tainted: G    B   W           (6.8.0-rc6-PMacG4)
[   22.132507] MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002282  XER: 00000000
[   22.132683] 
[   22.132683] GPR00: 000000ea afd72e50 a7c61300 0000007f 00000000 afd73020 afd73030 009a02d0 
[   22.132683] GPR08: 009a02c0 00000000 009a02b8 afd72a40 2404842c 0099fff4 00000001 006298c8 
[   22.132683] GPR16: afde9344 00000000 006293a4 008e97a8 fffffffe a7c5bff8 009635a0 a7c5d008 
[   22.132683] GPR24: 00000000 afd733c8 00000004 afd73460 a7c5a308 fffff000 0094ffac 0000007f 
[   22.133211] NIP [00824780] 0x824780
[   22.133286] LR [00824748] 0x824748
[   22.133357] --- interrupt: c00
[   22.133702] _swap_info_get: Bad swap file entry 64cccccc
[   22.133928] BUG: Bad page map in process openrc-run.sh  pte:cccccccc pmd:048b9000
[   22.134020] addr:afd56000 vm_flags:00100173 anon_vma:c43a67c0 mapping:00000000 index:affe2
[   22.134110] file:(null) fault:0x0 mmap:0x0 read_folio:0x0
[   22.134200] CPU: 0 PID: 449 Comm: openrc-run.sh Tainted: G    B   W          6.8.0-rc6-PMacG4 #2
[   22.134293] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.134501] Call Trace:
[   22.134568] [f3b7b950] [c162b128] dump_stack_lvl+0x60/0x94 (unreliable)
[   22.134678] [f3b7b970] [c045f880] print_bad_pte+0x648/0x658
[   22.134772] [f3b7ba00] [c04677b0] unmap_page_range+0xbec/0xd2c
[   22.134866] [f3b7bb00] [c0467ae4] unmap_vmas+0x1f4/0x25c
[   22.134959] [f3b7bbc0] [c047b008] exit_mmap+0x1e4/0x4d8
[   22.135056] [f3b7bce0] [c0093090] __mmput+0x78/0x388
[   22.135152] [f3b7bd10] [c00aa3a4] do_exit+0xa14/0x1c5c
[   22.135245] [f3b7bdb0] [c00aba18] do_group_exit+0xb4/0x220
[   22.135415] [f3b7bde0] [c00abbec] pid_child_should_wake+0x0/0x25c
[   22.135513] [f3b7be00] [c001e7e4] system_call_exception+0x2f0/0x430
[   22.135614] [f3b7bf30] [c002a1ac] ret_from_syscall+0x0/0x2c
[   22.135835] --- interrupt: c00 at 0x824780
[   22.135912] NIP:  00824780 LR: 00824748 CTR: 00882868
[   22.135985] REGS: f3b7bf40 TRAP: 0c00   Tainted: G    B   W           (6.8.0-rc6-PMacG4)
[   22.136071] MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002282  XER: 00000000
[   22.136246] 
[   22.136246] GPR00: 000000ea afd72e50 a7c61300 0000007f 00000000 afd73020 afd73030 009a02d0 
[   22.136246] GPR08: 009a02c0 00000000 009a02b8 afd72a40 2404842c 0099fff4 00000001 006298c8 
[   22.136246] GPR16: afde9344 00000000 006293a4 008e97a8 fffffffe a7c5bff8 009635a0 a7c5d008 
[   22.136246] GPR24: 00000000 afd733c8 00000004 afd73460 a7c5a308 fffff000 0094ffac 0000007f 
[   22.136775] NIP [00824780] 0x824780
[   22.136849] LR [00824748] 0x824748
[   22.136921] --- interrupt: c00
[   22.137224] _swap_info_get: Bad swap file entry 64cccccc
[   22.137316] BUG: Bad page map in process openrc-run.sh  pte:cccccccc pmd:048b9000
[   22.137402] addr:afd57000 vm_flags:00100173 anon_vma:c43a67c0 mapping:00000000 index:affe3
[   22.137611] file:(null) fault:0x0 mmap:0x0 read_folio:0x0
[   22.137703] CPU: 0 PID: 449 Comm: openrc-run.sh Tainted: G    B   W          6.8.0-rc6-PMacG4 #2
[   22.137929] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.138006] Call Trace:
[   22.138070] [f3b7b950] [c162b128] dump_stack_lvl+0x60/0x94 (unreliable)
[   22.138179] [f3b7b970] [c045f880] print_bad_pte+0x648/0x658
[   22.138273] [f3b7ba00] [c04677b0] unmap_page_range+0xbec/0xd2c
[   22.138368] [f3b7bb00] [c0467ae4] unmap_vmas+0x1f4/0x25c
[   22.138460] [f3b7bbc0] [c047b008] exit_mmap+0x1e4/0x4d8
[   22.138557] [f3b7bce0] [c0093090] __mmput+0x78/0x388
[   22.138652] [f3b7bd10] [c00aa3a4] do_exit+0xa14/0x1c5c
[   22.138745] [f3b7bdb0] [c00aba18] do_group_exit+0xb4/0x220
[   22.138838] [f3b7bde0] [c00abbec] pid_child_should_wake+0x0/0x25c
[   22.138934] [f3b7be00] [c001e7e4] system_call_exception+0x2f0/0x430
[   22.139233] [f3b7bf30] [c002a1ac] ret_from_syscall+0x0/0x2c
[   22.139332] --- interrupt: c00 at 0x824780
[   22.139408] NIP:  00824780 LR: 00824748 CTR: 00882868
[   22.139482] REGS: f3b7bf40 TRAP: 0c00   Tainted: G    B   W           (6.8.0-rc6-PMacG4)
[   22.139567] MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002282  XER: 00000000
[   22.139743] 
[   22.139743] GPR00: 000000ea afd72e50 a7c61300 0000007f 00000000 afd73020 afd73030 009a02d0 
[   22.139743] GPR08: 009a02c0 00000000 009a02b8 afd72a40 2404842c 0099fff4 00000001 006298c8 
[   22.139743] GPR16: afde9344 00000000 006293a4 008e97a8 fffffffe a7c5bff8 009635a0 a7c5d008 
[   22.139743] GPR24: 00000000 afd733c8 00000004 afd73460 a7c5a308 fffff000 0094ffac 0000007f 
[   22.140729] NIP [00824780] 0x824780
[   22.140817] LR [00824748] 0x824748
[   22.140891] --- interrupt: c00
[   22.141248] BUG: Bad page map in process openrc-run.sh  pte:00000001 pmd:048b9000
[   22.141392] page:eedd8000 refcount:1 mapcount:-1 mapping:00000000 index:0x0 pfn:0x0
[   22.141491] flags: 0x4000(reserved|zone=0)
[   22.141577] page_type: 0xfffffffe()
[   22.141881] raw: 00004000 eedd8004 eedd8004 00000000 00000000 00000000 fffffffe 00000001
[   22.142091] raw: 00000000
[   22.142188] page dumped because: bad pte
[   22.142262] page_owner info is not present (never set?)
[   22.142334] addr:afd58000 vm_flags:00100173 anon_vma:c43a67c0 mapping:00000000 index:affe4
[   22.142427] file:(null) fault:0x0 mmap:0x0 read_folio:0x0
[   22.142551] CPU: 0 PID: 449 Comm: openrc-run.sh Tainted: G    B   W          6.8.0-rc6-PMacG4 #2
[   22.142650] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.142728] Call Trace:
[   22.142795] [f3b7b950] [c162b128] dump_stack_lvl+0x60/0x94 (unreliable)
[   22.142909] [f3b7b970] [c045f880] print_bad_pte+0x648/0x658
[   22.143005] [f3b7ba00] [c04676c0] unmap_page_range+0xafc/0xd2c
[   22.143236] [f3b7bb00] [c0467ae4] unmap_vmas+0x1f4/0x25c
[   22.143333] [f3b7bbc0] [c047b008] exit_mmap+0x1e4/0x4d8
[   22.143431] [f3b7bce0] [c0093090] __mmput+0x78/0x388
[   22.143607] [f3b7bd10] [c00aa3a4] do_exit+0xa14/0x1c5c
[   22.143703] [f3b7bdb0] [c00aba18] do_group_exit+0xb4/0x220
[   22.143796] [f3b7bde0] [c00abbec] pid_child_should_wake+0x0/0x25c
[   22.143892] [f3b7be00] [c001e7e4] system_call_exception+0x2f0/0x430
[   22.143992] [f3b7bf30] [c002a1ac] ret_from_syscall+0x0/0x2c
[   22.144084] --- interrupt: c00 at 0x824780
[   22.144162] NIP:  00824780 LR: 00824748 CTR: 00882868
[   22.144240] REGS: f3b7bf40 TRAP: 0c00   Tainted: G    B   W           (6.8.0-rc6-PMacG4)
[   22.144328] MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002282  XER: 00000000
[   22.144639] 
[   22.144639] GPR00: 000000ea afd72e50 a7c61300 0000007f 00000000 afd73020 afd73030 009a02d0 
[   22.144639] GPR08: 009a02c0 00000000 009a02b8 afd72a40 2404842c 0099fff4 00000001 006298c8 
[   22.144639] GPR16: afde9344 00000000 006293a4 008e97a8 fffffffe a7c5bff8 009635a0 a7c5d008 
[   22.144639] GPR24: 00000000 afd733c8 00000004 afd73460 a7c5a308 fffff000 0094ffac 0000007f 
[   22.145173] NIP [00824780] 0x824780
[   22.145251] LR [00824748] 0x824748
[   22.145325] --- interrupt: c00
[   22.145611] _swap_info_get: Bad swap file entry 2cc48b98
[   22.145783] BUG: Bad page map in process openrc-run.sh  pte:c48b9858 pmd:048b9000
[   22.145871] addr:afd5a000 vm_flags:00100173 anon_vma:c43a67c0 mapping:00000000 index:affe6
[   22.146000] file:(null) fault:0x0 mmap:0x0 read_folio:0x0
[   22.146120] CPU: 0 PID: 449 Comm: openrc-run.sh Tainted: G    B   W          6.8.0-rc6-PMacG4 #2
[   22.146214] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.146289] Call Trace:
[   22.146353] [f3b7b950] [c162b128] dump_stack_lvl+0x60/0x94 (unreliable)
[   22.146464] [f3b7b970] [c045f880] print_bad_pte+0x648/0x658
[   22.146693] [f3b7ba00] [c04677b0] unmap_page_range+0xbec/0xd2c
[   22.146793] [f3b7bb00] [c0467ae4] unmap_vmas+0x1f4/0x25c
[   22.146886] [f3b7bbc0] [c047b008] exit_mmap+0x1e4/0x4d8
[   22.146983] [f3b7bce0] [c0093090] __mmput+0x78/0x388
[   22.147079] [f3b7bd10] [c00aa3a4] do_exit+0xa14/0x1c5c
[   22.147173] [f3b7bdb0] [c00aba18] do_group_exit+0xb4/0x220
[   22.147341] [f3b7bde0] [c00abbec] pid_child_should_wake+0x0/0x25c
[   22.147440] [f3b7be00] [c001e7e4] system_call_exception+0x2f0/0x430
[   22.147540] [f3b7bf30] [c002a1ac] ret_from_syscall+0x0/0x2c
[   22.147632] --- interrupt: c00 at 0x824780
[   22.147707] NIP:  00824780 LR: 00824748 CTR: 00882868
[   22.147782] REGS: f3b7bf40 TRAP: 0c00   Tainted: G    B   W           (6.8.0-rc6-PMacG4)
[   22.148000] MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002282  XER: 00000000
[   22.148178] 
[   22.148178] GPR00: 000000ea afd72e50 a7c61300 0000007f 00000000 afd73020 afd73030 009a02d0 
[   22.148178] GPR08: 009a02c0 00000000 009a02b8 afd72a40 2404842c 0099fff4 00000001 006298c8 
[   22.148178] GPR16: afde9344 00000000 006293a4 008e97a8 fffffffe a7c5bff8 009635a0 a7c5d008 
[   22.148178] GPR24: 00000000 afd733c8 00000004 afd73460 a7c5a308 fffff000 0094ffac 0000007f 
[   22.148704] NIP [00824780] 0x824780
[   22.148778] LR [00824748] 0x824748
[   22.148850] --- interrupt: c00
[   22.149154] _swap_info_get: Bad swap file entry 58c1a05b
[   22.149245] BUG: Bad page map in process openrc-run.sh  pte:c1a05bb0 pmd:048b9000
[   22.149331] addr:afd5b000 vm_flags:00100173 anon_vma:c43a67c0 mapping:00000000 index:affe7
[   22.149537] file:(null) fault:0x0 mmap:0x0 read_folio:0x0
[   22.149628] CPU: 0 PID: 449 Comm: openrc-run.sh Tainted: G    B   W          6.8.0-rc6-PMacG4 #2
[   22.149720] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.149795] Call Trace:
[   22.149859] [f3b7b950] [c162b128] dump_stack_lvl+0x60/0x94 (unreliable)
[   22.150097] [f3b7b970] [c045f880] print_bad_pte+0x648/0x658
[   22.150194] [f3b7ba00] [c04677b0] unmap_page_range+0xbec/0xd2c
[   22.150290] [f3b7bb00] [c0467ae4] unmap_vmas+0x1f4/0x25c
[   22.150382] [f3b7bbc0] [c047b008] exit_mmap+0x1e4/0x4d8
[   22.150479] [f3b7bce0] [c0093090] __mmput+0x78/0x388
[   22.150575] [f3b7bd10] [c00aa3a4] do_exit+0xa14/0x1c5c
[   22.150668] [f3b7bdb0] [c00aba18] do_group_exit+0xb4/0x220
[   22.150761] [f3b7bde0] [c00abbec] pid_child_should_wake+0x0/0x25c
[   22.150857] [f3b7be00] [c001e7e4] system_call_exception+0x2f0/0x430
[   22.151034] [f3b7bf30] [c002a1ac] ret_from_syscall+0x0/0x2c
[   22.151130] --- interrupt: c00 at 0x824780
[   22.151205] NIP:  00824780 LR: 00824748 CTR: 00882868
[   22.151407] REGS: f3b7bf40 TRAP: 0c00   Tainted: G    B   W           (6.8.0-rc6-PMacG4)
[   22.151496] MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002282  XER: 00000000
[   22.151672] 
[   22.151672] GPR00: 000000ea afd72e50 a7c61300 0000007f 00000000 afd73020 afd73030 009a02d0 
[   22.151672] GPR08: 009a02c0 00000000 009a02b8 afd72a40 2404842c 0099fff4 00000001 006298c8 
[   22.151672] GPR16: afde9344 00000000 006293a4 008e97a8 fffffffe a7c5bff8 009635a0 a7c5d008 
[   22.151672] GPR24: 00000000 afd733c8 00000004 afd73460 a7c5a308 fffff000 0094ffac 0000007f 
[   22.152196] NIP [00824780] 0x824780
[   22.152271] LR [00824748] 0x824748
[   22.152342] --- interrupt: c00
[   22.152692] BUG: Bad page map in process openrc-run.sh  pte:c48b9311 pmd:048b9000
[   22.152795] addr:afd5c000 vm_flags:00100173 anon_vma:c43a67c0 mapping:00000000 index:affe8
[   22.152889] file:(null) fault:0x0 mmap:0x0 read_folio:0x0
[   22.152981] CPU: 0 PID: 449 Comm: openrc-run.sh Tainted: G    B   W          6.8.0-rc6-PMacG4 #2
[   22.153078] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.153240] Call Trace:
[   22.153310] [f3b7b920] [c162b128] dump_stack_lvl+0x60/0x94 (unreliable)
[   22.153554] [f3b7b940] [c045f880] print_bad_pte+0x648/0x658
[   22.153654] [f3b7b9d0] [c0463b10] vm_normal_page+0x4c/0x1b4
[   22.153751] [f3b7ba00] [c0467090] unmap_page_range+0x4cc/0xd2c
[   22.153846] [f3b7bb00] [c0467ae4] unmap_vmas+0x1f4/0x25c
[   22.153938] [f3b7bbc0] [c047b008] exit_mmap+0x1e4/0x4d8
[   22.154035] [f3b7bce0] [c0093090] __mmput+0x78/0x388
[   22.154131] [f3b7bd10] [c00aa3a4] do_exit+0xa14/0x1c5c
[   22.154224] [f3b7bdb0] [c00aba18] do_group_exit+0xb4/0x220
[   22.154319] [f3b7bde0] [c00abbec] pid_child_should_wake+0x0/0x25c
[   22.154415] [f3b7be00] [c001e7e4] system_call_exception+0x2f0/0x430
[   22.154515] [f3b7bf30] [c002a1ac] ret_from_syscall+0x0/0x2c
[   22.154608] --- interrupt: c00 at 0x824780
[   22.154900] NIP:  00824780 LR: 00824748 CTR: 00882868
[   22.154981] REGS: f3b7bf40 TRAP: 0c00   Tainted: G    B   W           (6.8.0-rc6-PMacG4)
[   22.155069] MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002282  XER: 00000000
[   22.155249] 
[   22.155249] GPR00: 000000ea afd72e50 a7c61300 0000007f 00000000 afd73020 afd73030 009a02d0 
[   22.155249] GPR08: 009a02c0 00000000 009a02b8 afd72a40 2404842c 0099fff4 00000001 006298c8 
[   22.155249] GPR16: afde9344 00000000 006293a4 008e97a8 fffffffe a7c5bff8 009635a0 a7c5d008 
[   22.155249] GPR24: 00000000 afd733c8 00000004 afd73460 a7c5a308 fffff000 0094ffac 0000007f 
[   22.155778] NIP [00824780] 0x824780
[   22.155856] LR [00824748] 0x824748
[   22.155930] --- interrupt: c00
[   22.156261] _swap_info_get: Bad swap file entry 30c48b9b
[   22.156353] BUG: Bad page map in process openrc-run.sh  pte:c48b9b60 pmd:048b9000
[   22.156439] addr:afd5d000 vm_flags:00100173 anon_vma:c43a67c0 mapping:00000000 index:affe9
[   22.156527] file:(null) fault:0x0 mmap:0x0 read_folio:0x0
[   22.156616] CPU: 0 PID: 449 Comm: openrc-run.sh Tainted: G    B   W          6.8.0-rc6-PMacG4 #2
[   22.156711] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.156925] Call Trace:
[   22.157070] [f3b7b950] [c162b128] dump_stack_lvl+0x60/0x94 (unreliable)
[   22.157180] [f3b7b970] [c045f880] print_bad_pte+0x648/0x658
[   22.157274] [f3b7ba00] [c04677b0] unmap_page_range+0xbec/0xd2c
[   22.157369] [f3b7bb00] [c0467ae4] unmap_vmas+0x1f4/0x25c
[   22.157462] [f3b7bbc0] [c047b008] exit_mmap+0x1e4/0x4d8
[   22.157558] [f3b7bce0] [c0093090] __mmput+0x78/0x388
[   22.157654] [f3b7bd10] [c00aa3a4] do_exit+0xa14/0x1c5c
[   22.157747] [f3b7bdb0] [c00aba18] do_group_exit+0xb4/0x220
[   22.157840] [f3b7bde0] [c00abbec] pid_child_should_wake+0x0/0x25c
[   22.157935] [f3b7be00] [c001e7e4] system_call_exception+0x2f0/0x430
[   22.158035] [f3b7bf30] [c002a1ac] ret_from_syscall+0x0/0x2c
[   22.158259] --- interrupt: c00 at 0x824780
[   22.158337] NIP:  00824780 LR: 00824748 CTR: 00882868
[   22.158413] REGS: f3b7bf40 TRAP: 0c00   Tainted: G    B   W           (6.8.0-rc6-PMacG4)
[   22.158576] MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002282  XER: 00000000
[   22.158753] 
[   22.158753] GPR00: 000000ea afd72e50 a7c61300 0000007f 00000000 afd73020 afd73030 009a02d0 
[   22.158753] GPR08: 009a02c0 00000000 009a02b8 afd72a40 2404842c 0099fff4 00000001 006298c8 
[   22.158753] GPR16: afde9344 00000000 006293a4 008e97a8 fffffffe a7c5bff8 009635a0 a7c5d008 
[   22.158753] GPR24: 00000000 afd733c8 00000004 afd73460 a7c5a308 fffff000 0094ffac 0000007f 
[   22.159280] NIP [00824780] 0x824780
[   22.159354] LR [00824748] 0x824748
[   22.159426] --- interrupt: c00
[   22.159769] _swap_info_get: Bad swap file entry 60c48b9d
[   22.159861] BUG: Bad page map in process openrc-run.sh  pte:c48b9dc0 pmd:048b9000
[   22.159947] addr:afd5e000 vm_flags:00100173 anon_vma:c43a67c0 mapping:00000000 index:affea
[   22.160073] file:(null) fault:0x0 mmap:0x0 read_folio:0x0
[   22.160163] CPU: 0 PID: 449 Comm: openrc-run.sh Tainted: G    B   W          6.8.0-rc6-PMacG4 #2
[   22.160393] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.160471] Call Trace:
[   22.160536] [f3b7b950] [c162b128] dump_stack_lvl+0x60/0x94 (unreliable)
[   22.160648] [f3b7b970] [c045f880] print_bad_pte+0x648/0x658
[   22.160819] [f3b7ba00] [c04677b0] unmap_page_range+0xbec/0xd2c
[   22.160917] [f3b7bb00] [c0467ae4] unmap_vmas+0x1f4/0x25c
[   22.161010] [f3b7bbc0] [c047b008] exit_mmap+0x1e4/0x4d8
[   22.161107] [f3b7bce0] [c0093090] __mmput+0x78/0x388
[   22.161203] [f3b7bd10] [c00aa3a4] do_exit+0xa14/0x1c5c
[   22.161296] [f3b7bdb0] [c00aba18] do_group_exit+0xb4/0x220
[   22.161389] [f3b7bde0] [c00abbec] pid_child_should_wake+0x0/0x25c
[   22.161484] [f3b7be00] [c001e7e4] system_call_exception+0x2f0/0x430
[   22.161713] [f3b7bf30] [c002a1ac] ret_from_syscall+0x0/0x2c
[   22.161809] --- interrupt: c00 at 0x824780
[   22.161883] NIP:  00824780 LR: 00824748 CTR: 00882868
[   22.161957] REGS: f3b7bf40 TRAP: 0c00   Tainted: G    B   W           (6.8.0-rc6-PMacG4)
[   22.162042] MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002282  XER: 00000000
[   22.162218] 
[   22.162218] GPR00: 000000ea afd72e50 a7c61300 0000007f 00000000 afd73020 afd73030 009a02d0 
[   22.162218] GPR08: 009a02c0 00000000 009a02b8 afd72a40 2404842c 0099fff4 00000001 006298c8 
[   22.162218] GPR16: afde9344 00000000 006293a4 008e97a8 fffffffe a7c5bff8 009635a0 a7c5d008 
[   22.162218] GPR24: 00000000 afd733c8 00000004 afd73460 a7c5a308 fffff000 0094ffac 0000007f 
[   22.162818] NIP [00824780] 0x824780
[   22.162893] LR [00824748] 0x824748
[   22.162965] --- interrupt: c00
[   22.163287] _swap_info_get: Bad swap file entry 681baccd
[   22.163380] BUG: Bad page map in process openrc-run.sh  pte:1baccdd4 pmd:048b9000
[   22.163464] addr:afd60000 vm_flags:00100173 anon_vma:c43a67c0 mapping:00000000 index:affec
[   22.163553] file:(null) fault:0x0 mmap:0x0 read_folio:0x0
[   22.163817] CPU: 0 PID: 449 Comm: openrc-run.sh Tainted: G    B   W          6.8.0-rc6-PMacG4 #2
[   22.163914] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.163989] Call Trace:
[   22.164052] [f3b7b950] [c162b128] dump_stack_lvl+0x60/0x94 (unreliable)
[   22.164160] [f3b7b970] [c045f880] print_bad_pte+0x648/0x658
[   22.164254] [f3b7ba00] [c04677b0] unmap_page_range+0xbec/0xd2c
[   22.164350] [f3b7bb00] [c0467ae4] unmap_vmas+0x1f4/0x25c
[   22.164519] [f3b7bbc0] [c047b008] exit_mmap+0x1e4/0x4d8
[   22.164618] [f3b7bce0] [c0093090] __mmput+0x78/0x388
[   22.164715] [f3b7bd10] [c00aa3a4] do_exit+0xa14/0x1c5c
[   22.164809] [f3b7bdb0] [c00aba18] do_group_exit+0xb4/0x220
[   22.164902] [f3b7bde0] [c00abbec] pid_child_should_wake+0x0/0x25c
[   22.165127] [f3b7be00] [c001e7e4] system_call_exception+0x2f0/0x430
[   22.165230] [f3b7bf30] [c002a1ac] ret_from_syscall+0x0/0x2c
[   22.165323] --- interrupt: c00 at 0x824780
[   22.165398] NIP:  00824780 LR: 00824748 CTR: 00882868
[   22.165472] REGS: f3b7bf40 TRAP: 0c00   Tainted: G    B   W           (6.8.0-rc6-PMacG4)
[   22.165557] MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002282  XER: 00000000
[   22.165732] 
[   22.165732] GPR00: 000000ea afd72e50 a7c61300 0000007f 00000000 afd73020 afd73030 009a02d0 
[   22.165732] GPR08: 009a02c0 00000000 009a02b8 afd72a40 2404842c 0099fff4 00000001 006298c8 
[   22.165732] GPR16: afde9344 00000000 006293a4 008e97a8 fffffffe a7c5bff8 009635a0 a7c5d008 
[   22.165732] GPR24: 00000000 afd733c8 00000004 afd73460 a7c5a308 fffff000 0094ffac 0000007f 
[   22.166259] NIP [00824780] 0x824780
[   22.166333] LR [00824748] 0x824748
[   22.166481] --- interrupt: c00
[   22.166936] ------------[ cut here ]------------
[   22.167038] kernel BUG at include/linux/swapops.h:466!
[   22.167125] Oops: Exception in kernel mode, sig: 5 [#1]
[   22.167346] BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 DEBUG_PAGEALLOC PowerMac
[   22.167439] Modules linked in:
[   22.167520] CPU: 0 PID: 449 Comm: openrc-run.sh Tainted: G    B   W          6.8.0-rc6-PMacG4 #2
[   22.167617] Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
[   22.167695] NIP:  c0460e10 LR: c0460dc4 CTR: 00000001
[   22.167772] REGS: f3b7b8e0 TRAP: 0700   Tainted: G    B   W           (6.8.0-rc6-PMacG4)
[   22.167864] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 24002284  XER: 00000000
[   22.168012] 
[   22.168012] GPR00: c0460dc4 f3b7b9a0 c4393c20 ef11b428 00000000 00000000 00000000 00000000 
[   22.168012] GPR08: 00000000 00000000 00000003 f3b7b9a0 00000000 0099fff4 00000000 afd5d000 
[   22.168012] GPR16: 189172b1 1e76f78a 0000001c 70c1733a afd74000 c43f1afc afd74000 f3b7bc50 
[   22.168012] GPR24: f3b7bb30 f3b7bab0 fe76f74a c433a778 c1733ae0 ef11b428 ef11b428 fe76f736 
[   22.168542] NIP [c0460e10] pfn_swap_entry_to_page+0x118/0x144
[   22.168639] LR [c0460dc4] pfn_swap_entry_to_page+0xcc/0x144
[   22.168807] Call Trace:
[   22.168876] [f3b7b9a0] [c0460dc4] pfn_swap_entry_to_page+0xcc/0x144 (unreliable)
[   22.168992] [f3b7ba00] [c04677ec] unmap_page_range+0xc28/0xd2c
[   22.169218] [f3b7bb00] [c0467ae4] unmap_vmas+0x1f4/0x25c
[   22.169315] [f3b7bbc0] [c047b008] exit_mmap+0x1e4/0x4d8
[   22.169415] [f3b7bce0] [c0093090] __mmput+0x78/0x388
[   22.169513] [f3b7bd10] [c00aa3a4] do_exit+0xa14/0x1c5c
[   22.169607] [f3b7bdb0] [c00aba18] do_group_exit+0xb4/0x220
[   22.169701] [f3b7bde0] [c00abbec] pid_child_should_wake+0x0/0x25c
[   22.169797] [f3b7be00] [c001e7e4] system_call_exception+0x2f0/0x430
[   22.169897] [f3b7bf30] [c002a1ac] ret_from_syscall+0x0/0x2c
[   22.169991] --- interrupt: c00 at 0x824780
[   22.170071] NIP:  00824780 LR: 00824748 CTR: 00882868
[   22.170149] REGS: f3b7bf40 TRAP: 0c00   Tainted: G    B   W           (6.8.0-rc6-PMacG4)
[   22.170316] MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22002282  XER: 00000000
[   22.170627] 
[   22.170627] GPR00: 000000ea afd72e50 a7c61300 0000007f 00000000 afd73020 afd73030 009a02d0 
[   22.170627] GPR08: 009a02c0 00000000 009a02b8 afd72a40 2404842c 0099fff4 00000001 006298c8 
[   22.170627] GPR16: afde9344 00000000 006293a4 008e97a8 fffffffe a7c5bff8 009635a0 a7c5d008 
[   22.170627] GPR24: 00000000 afd733c8 00000004 afd73460 a7c5a308 fffff000 0094ffac 0000007f 
[   22.171165] NIP [00824780] 0x824780
[   22.171244] LR [00824748] 0x824748
[   22.171319] --- interrupt: c00
[   22.171389] Code: 5529cffe 7d485010 7d290194 5529063e 2c090000 41820010 2c080000 41a20008 48090789 813e0000 71290001 40a20008 <0fe00000> 39200000 7fa3eb78 913f0000 
[   22.171656] ---[ end trace 0000000000000000 ]---
[   22.171729] 
[   22.171794] note: openrc-run.sh[449] exited with irqs disabled
[   22.172298] Fixing recursive fault but reboot is needed!
[  286.698377] usb 1-3: new high-speed USB device number 2 using ehci-pci
[  287.041696] usb 1-3: device descriptor read/64, error -71
[  287.297822] usb 1-3: New USB device found, idVendor=05e3, idProduct=0610, bcdDevice=32.98
[  287.297974] usb 1-3: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[  287.298116] usb 1-3: Product: USB2.0 Hub
[  287.301507] hub 1-3:1.0: USB hub found
[  287.302341] hub 1-3:1.0: 4 ports detected
[  287.588366] usb 1-3.1: new low-speed USB device number 3 using ehci-pci
[  287.715094] usb 1-3.1: New USB device found, idVendor=04d9, idProduct=0006, bcdDevice= 1.40
[  287.715290] usb 1-3.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[  287.715421] usb 1-3.1: Product: RPI Wired Keyboard 5
[  287.715532] usb 1-3.1: Manufacturer:  
[  287.739435] input:   RPI Wired Keyboard 5 as /devices/pci0001:00/0001:00:12.2/usb1/1-3/1-3.1/1-3.1:1.0/0003:04D9:0006.0001/input/input1
[  287.801408] hid-generic 0003:04D9:0006.0001: input,hidraw0: USB HID v1.11 Keyboard [  RPI Wired Keyboard 5] on usb-0001:00:12.2-3.1/input0
[  287.822723] input:   RPI Wired Keyboard 5 as /devices/pci0001:00/0001:00:12.2/usb1/1-3/1-3.1/1-3.1:1.1/0003:04D9:0006.0002/input/input2
[  287.881101] hid-generic 0003:04D9:0006.0002: input,hidraw1: USB HID v1.11 Device [  RPI Wired Keyboard 5] on usb-0001:00:12.2-3.1/input1
[  287.958366] usb 1-3.3: new low-speed USB device number 4 using ehci-pci
[  288.059248] usb 1-3.3: New USB device found, idVendor=275d, idProduct=0ba6, bcdDevice= 1.00
[  288.059413] usb 1-3.3: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[  288.059553] usb 1-3.3: Product: USB OPTICAL MOUSE 
[  288.073050] input: USB OPTICAL MOUSE  as /devices/pci0001:00/0001:00:12.2/usb1/1-3/1-3.3/1-3.3:1.0/0003:275D:0BA6.0003/input/input3
[  288.076134] hid-generic 0003:275D:0BA6.0003: input,hidraw2: USB HID v1.11 Mouse [USB OPTICAL MOUSE ] on usb-0001:00:12.2-3.3/input0

--MP_/Kn_DPsjWzthGNH9x5hato4f
Content-Type: application/octet-stream; name=config_68-rc7_g4-
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=config_68-rc7_g4-

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L3Bv
d2VycGMgNi44LjAtcmM3IEtlcm5lbCBDb25maWd1cmF0aW9uCiMKQ09ORklHX0NDX1ZFUlNJT05f
VEVYVD0iZ2NjIChHZW50b28gMTMuMi4xX3AyMDI0MDIxMCBwMTMpIDEzLjIuMSAyMDI0MDIxMCIK
Q09ORklHX0NDX0lTX0dDQz15CkNPTkZJR19HQ0NfVkVSU0lPTj0xMzAyMDEKQ09ORklHX0NMQU5H
X1ZFUlNJT049MApDT05GSUdfQVNfSVNfR05VPXkKQ09ORklHX0FTX1ZFUlNJT049MjQxMDAKQ09O
RklHX0xEX0lTX0JGRD15CkNPTkZJR19MRF9WRVJTSU9OPTI0MTAwCkNPTkZJR19MTERfVkVSU0lP
Tj0wCkNPTkZJR19DQ19IQVNfQVNNX0dPVE9fT1VUUFVUPXkKQ09ORklHX0NDX0hBU19BU01fR09U
T19USUVEX09VVFBVVD15CkNPTkZJR19HQ0NfQVNNX0dPVE9fT1VUUFVUX1dPUktBUk9VTkQ9eQpD
T05GSUdfVE9PTFNfU1VQUE9SVF9SRUxSPXkKQ09ORklHX0NDX0hBU19BU01fSU5MSU5FPXkKQ09O
RklHX0NDX0hBU19OT19QUk9GSUxFX0ZOX0FUVFI9eQpDT05GSUdfUEFIT0xFX1ZFUlNJT049MApD
T05GSUdfQ09OU1RSVUNUT1JTPXkKQ09ORklHX0lSUV9XT1JLPXkKQ09ORklHX0JVSUxEVElNRV9U
QUJMRV9TT1JUPXkKQ09ORklHX1RIUkVBRF9JTkZPX0lOX1RBU0s9eQoKIwojIEdlbmVyYWwgc2V0
dXAKIwpDT05GSUdfSU5JVF9FTlZfQVJHX0xJTUlUPTMyCiMgQ09ORklHX0NPTVBJTEVfVEVTVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1dFUlJPUiBpcyBub3Qgc2V0CkNPTkZJR19MT0NBTFZFUlNJT049
Ii1QTWFjRzQiCiMgQ09ORklHX0xPQ0FMVkVSU0lPTl9BVVRPIGlzIG5vdCBzZXQKQ09ORklHX0JV
SUxEX1NBTFQ9IiIKQ09ORklHX0hBVkVfS0VSTkVMX0daSVA9eQpDT05GSUdfSEFWRV9LRVJORUxf
WFo9eQpDT05GSUdfS0VSTkVMX0daSVA9eQojIENPTkZJR19LRVJORUxfWFogaXMgbm90IHNldApD
T05GSUdfREVGQVVMVF9JTklUPSIiCkNPTkZJR19ERUZBVUxUX0hPU1ROQU1FPSIobm9uZSkiCkNP
TkZJR19TWVNWSVBDPXkKQ09ORklHX1NZU1ZJUENfU1lTQ1RMPXkKQ09ORklHX1BPU0lYX01RVUVV
RT15CkNPTkZJR19QT1NJWF9NUVVFVUVfU1lTQ1RMPXkKQ09ORklHX1dBVENIX1FVRVVFPXkKQ09O
RklHX0NST1NTX01FTU9SWV9BVFRBQ0g9eQojIENPTkZJR19VU0VMSUIgaXMgbm90IHNldAojIENP
TkZJR19BVURJVCBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfQVVESVRTWVNDQUxMPXkKCiMK
IyBJUlEgc3Vic3lzdGVtCiMKQ09ORklHX0dFTkVSSUNfSVJRX1NIT1c9eQpDT05GSUdfR0VORVJJ
Q19JUlFfU0hPV19MRVZFTD15CkNPTkZJR19HRU5FUklDX0lSUV9NSUdSQVRJT049eQpDT05GSUdf
SVJRX0RPTUFJTj15CkNPTkZJR19JUlFfRE9NQUlOX0hJRVJBUkNIWT15CkNPTkZJR19JUlFfRE9N
QUlOX05PTUFQPXkKQ09ORklHX0dFTkVSSUNfTVNJX0lSUT15CkNPTkZJR19JUlFfRk9SQ0VEX1RI
UkVBRElORz15CkNPTkZJR19TUEFSU0VfSVJRPXkKIyBDT05GSUdfR0VORVJJQ19JUlFfREVCVUdG
UyBpcyBub3Qgc2V0CiMgZW5kIG9mIElSUSBzdWJzeXN0ZW0KCkNPTkZJR19HRU5FUklDX1RJTUVf
VlNZU0NBTEw9eQpDT05GSUdfR0VORVJJQ19DTE9DS0VWRU5UUz15CkNPTkZJR19BUkNIX0hBU19U
SUNLX0JST0FEQ0FTVD15CkNPTkZJR19HRU5FUklDX0NMT0NLRVZFTlRTX0JST0FEQ0FTVD15CkNP
TkZJR19HRU5FUklDX0NNT1NfVVBEQVRFPXkKQ09ORklHX1RJTUVfS1VOSVRfVEVTVD1tCkNPTkZJ
R19DT05URVhUX1RSQUNLSU5HPXkKQ09ORklHX0NPTlRFWFRfVFJBQ0tJTkdfSURMRT15CgojCiMg
VGltZXJzIHN1YnN5c3RlbQojCkNPTkZJR19USUNLX09ORVNIT1Q9eQpDT05GSUdfTk9fSFpfQ09N
TU9OPXkKIyBDT05GSUdfSFpfUEVSSU9ESUMgaXMgbm90IHNldApDT05GSUdfTk9fSFpfSURMRT15
CiMgQ09ORklHX05PX0haX0ZVTEwgaXMgbm90IHNldAojIENPTkZJR19OT19IWiBpcyBub3Qgc2V0
CkNPTkZJR19ISUdIX1JFU19USU1FUlM9eQojIGVuZCBvZiBUaW1lcnMgc3Vic3lzdGVtCgpDT05G
SUdfQlBGPXkKQ09ORklHX0hBVkVfRUJQRl9KSVQ9eQpDT05GSUdfQVJDSF9XQU5UX0RFRkFVTFRf
QlBGX0pJVD15CgojCiMgQlBGIHN1YnN5c3RlbQojCkNPTkZJR19CUEZfU1lTQ0FMTD15CkNPTkZJ
R19CUEZfSklUPXkKQ09ORklHX0JQRl9KSVRfQUxXQVlTX09OPXkKQ09ORklHX0JQRl9KSVRfREVG
QVVMVF9PTj15CkNPTkZJR19CUEZfVU5QUklWX0RFRkFVTFRfT0ZGPXkKIyBDT05GSUdfQlBGX1BS
RUxPQUQgaXMgbm90IHNldAojIGVuZCBvZiBCUEYgc3Vic3lzdGVtCgpDT05GSUdfUFJFRU1QVF9W
T0xVTlRBUllfQlVJTEQ9eQojIENPTkZJR19QUkVFTVBUX05PTkUgaXMgbm90IHNldApDT05GSUdf
UFJFRU1QVF9WT0xVTlRBUlk9eQojIENPTkZJR19QUkVFTVBUIGlzIG5vdCBzZXQKCiMKIyBDUFUv
VGFzayB0aW1lIGFuZCBzdGF0cyBhY2NvdW50aW5nCiMKQ09ORklHX1RJQ0tfQ1BVX0FDQ09VTlRJ
Tkc9eQojIENPTkZJR19WSVJUX0NQVV9BQ0NPVU5USU5HX05BVElWRSBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZJUlRfQ1BVX0FDQ09VTlRJTkdfR0VOIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJRX1RJTUVf
QUNDT1VOVElORyBpcyBub3Qgc2V0CkNPTkZJR19CU0RfUFJPQ0VTU19BQ0NUPXkKQ09ORklHX0JT
RF9QUk9DRVNTX0FDQ1RfVjM9eQpDT05GSUdfVEFTS1NUQVRTPXkKQ09ORklHX1RBU0tfREVMQVlf
QUNDVD15CkNPTkZJR19UQVNLX1hBQ0NUPXkKQ09ORklHX1RBU0tfSU9fQUNDT1VOVElORz15CiMg
Q09ORklHX1BTSSBpcyBub3Qgc2V0CiMgZW5kIG9mIENQVS9UYXNrIHRpbWUgYW5kIHN0YXRzIGFj
Y291bnRpbmcKCkNPTkZJR19DUFVfSVNPTEFUSU9OPXkKCiMKIyBSQ1UgU3Vic3lzdGVtCiMKQ09O
RklHX1RSRUVfUkNVPXkKIyBDT05GSUdfUkNVX0VYUEVSVCBpcyBub3Qgc2V0CkNPTkZJR19UUkVF
X1NSQ1U9eQpDT05GSUdfTkVFRF9TUkNVX05NSV9TQUZFPXkKQ09ORklHX1RBU0tTX1JDVV9HRU5F
UklDPXkKQ09ORklHX1RBU0tTX1RSQUNFX1JDVT15CkNPTkZJR19SQ1VfU1RBTExfQ09NTU9OPXkK
Q09ORklHX1JDVV9ORUVEX1NFR0NCTElTVD15CiMgZW5kIG9mIFJDVSBTdWJzeXN0ZW0KCiMgQ09O
RklHX0lLQ09ORklHIGlzIG5vdCBzZXQKIyBDT05GSUdfSUtIRUFERVJTIGlzIG5vdCBzZXQKQ09O
RklHX0xPR19CVUZfU0hJRlQ9MTYKQ09ORklHX0xPR19DUFVfTUFYX0JVRl9TSElGVD0xMwojIENP
TkZJR19QUklOVEtfSU5ERVggaXMgbm90IHNldAoKIwojIFNjaGVkdWxlciBmZWF0dXJlcwojCiMg
ZW5kIG9mIFNjaGVkdWxlciBmZWF0dXJlcwoKQ09ORklHX0NDX0lNUExJQ0lUX0ZBTExUSFJPVUdI
PSItV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTUiCkNPTkZJR19HQ0MxMV9OT19BUlJBWV9CT1VORFM9
eQpDT05GSUdfQ0NfTk9fQVJSQVlfQk9VTkRTPXkKQ09ORklHX0dDQ19OT19TVFJJTkdPUF9PVkVS
RkxPVz15CkNPTkZJR19DQ19OT19TVFJJTkdPUF9PVkVSRkxPVz15CkNPTkZJR19DR1JPVVBTPXkK
Q09ORklHX1BBR0VfQ09VTlRFUj15CiMgQ09ORklHX0NHUk9VUF9GQVZPUl9EWU5NT0RTIGlzIG5v
dCBzZXQKQ09ORklHX01FTUNHPXkKQ09ORklHX01FTUNHX0tNRU09eQpDT05GSUdfQkxLX0NHUk9V
UD15CkNPTkZJR19DR1JPVVBfV1JJVEVCQUNLPXkKQ09ORklHX0NHUk9VUF9TQ0hFRD15CkNPTkZJ
R19GQUlSX0dST1VQX1NDSEVEPXkKIyBDT05GSUdfQ0ZTX0JBTkRXSURUSCBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUX0dST1VQX1NDSEVEIGlzIG5vdCBzZXQKQ09ORklHX1NDSEVEX01NX0NJRD15CkNP
TkZJR19DR1JPVVBfUElEUz15CkNPTkZJR19DR1JPVVBfUkRNQT15CkNPTkZJR19DR1JPVVBfRlJF
RVpFUj15CkNPTkZJR19DUFVTRVRTPXkKQ09ORklHX1BST0NfUElEX0NQVVNFVD15CkNPTkZJR19D
R1JPVVBfREVWSUNFPXkKQ09ORklHX0NHUk9VUF9DUFVBQ0NUPXkKQ09ORklHX0NHUk9VUF9QRVJG
PXkKQ09ORklHX0NHUk9VUF9CUEY9eQpDT05GSUdfQ0dST1VQX01JU0M9eQojIENPTkZJR19DR1JP
VVBfREVCVUcgaXMgbm90IHNldApDT05GSUdfU09DS19DR1JPVVBfREFUQT15CkNPTkZJR19OQU1F
U1BBQ0VTPXkKQ09ORklHX1VUU19OUz15CkNPTkZJR19USU1FX05TPXkKQ09ORklHX0lQQ19OUz15
CkNPTkZJR19VU0VSX05TPXkKQ09ORklHX1BJRF9OUz15CkNPTkZJR19ORVRfTlM9eQojIENPTkZJ
R19DSEVDS1BPSU5UX1JFU1RPUkUgaXMgbm90IHNldApDT05GSUdfU0NIRURfQVVUT0dST1VQPXkK
IyBDT05GSUdfUkVMQVkgaXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9JTklUUkQ9eQpDT05GSUdf
SU5JVFJBTUZTX1NPVVJDRT0iIgpDT05GSUdfUkRfR1pJUD15CiMgQ09ORklHX1JEX0JaSVAyIGlz
IG5vdCBzZXQKIyBDT05GSUdfUkRfTFpNQSBpcyBub3Qgc2V0CiMgQ09ORklHX1JEX1haIGlzIG5v
dCBzZXQKIyBDT05GSUdfUkRfTFpPIGlzIG5vdCBzZXQKIyBDT05GSUdfUkRfTFo0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfUkRfWlNURCBpcyBub3Qgc2V0CiMgQ09ORklHX0JPT1RfQ09ORklHIGlzIG5v
dCBzZXQKIyBDT05GSUdfSU5JVFJBTUZTX1BSRVNFUlZFX01USU1FIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ0NfT1BUSU1JWkVfRk9SX1BFUkZPUk1BTkNFIGlzIG5vdCBzZXQKQ09ORklHX0NDX09QVElN
SVpFX0ZPUl9TSVpFPXkKQ09ORklHX0hBVkVfTERfREVBRF9DT0RFX0RBVEFfRUxJTUlOQVRJT049
eQojIENPTkZJR19MRF9ERUFEX0NPREVfREFUQV9FTElNSU5BVElPTiBpcyBub3Qgc2V0CkNPTkZJ
R19MRF9PUlBIQU5fV0FSTj15CkNPTkZJR19MRF9PUlBIQU5fV0FSTl9MRVZFTD0id2FybiIKQ09O
RklHX1NZU0NUTD15CkNPTkZJR19TWVNDVExfRVhDRVBUSU9OX1RSQUNFPXkKQ09ORklHX0VYUEVS
VD15CkNPTkZJR19NVUxUSVVTRVI9eQojIENPTkZJR19TR0VUTUFTS19TWVNDQUxMIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU1lTRlNfU1lTQ0FMTCBpcyBub3Qgc2V0CkNPTkZJR19GSEFORExFPXkKQ09O
RklHX1BPU0lYX1RJTUVSUz15CkNPTkZJR19QUklOVEs9eQpDT05GSUdfQlVHPXkKQ09ORklHX0VM
Rl9DT1JFPXkKQ09ORklHX0JBU0VfRlVMTD15CkNPTkZJR19GVVRFWD15CkNPTkZJR19GVVRFWF9Q
ST15CkNPTkZJR19FUE9MTD15CkNPTkZJR19TSUdOQUxGRD15CkNPTkZJR19USU1FUkZEPXkKQ09O
RklHX0VWRU5URkQ9eQpDT05GSUdfU0hNRU09eQpDT05GSUdfQUlPPXkKQ09ORklHX0lPX1VSSU5H
PXkKQ09ORklHX0FEVklTRV9TWVNDQUxMUz15CkNPTkZJR19NRU1CQVJSSUVSPXkKQ09ORklHX0tD
TVA9eQpDT05GSUdfUlNFUT15CiMgQ09ORklHX0RFQlVHX1JTRVEgaXMgbm90IHNldApDT05GSUdf
Q0FDSEVTVEFUX1NZU0NBTEw9eQojIENPTkZJR19QQzEwNCBpcyBub3Qgc2V0CkNPTkZJR19LQUxM
U1lNUz15CiMgQ09ORklHX0tBTExTWU1TX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfS0FM
TFNZTVNfQUxMIGlzIG5vdCBzZXQKQ09ORklHX0tBTExTWU1TX0JBU0VfUkVMQVRJVkU9eQpDT05G
SUdfQVJDSF9IQVNfTUVNQkFSUklFUl9DQUxMQkFDS1M9eQpDT05GSUdfQVJDSF9IQVNfTUVNQkFS
UklFUl9TWU5DX0NPUkU9eQpDT05GSUdfSEFWRV9QRVJGX0VWRU5UUz15CgojCiMgS2VybmVsIFBl
cmZvcm1hbmNlIEV2ZW50cyBBbmQgQ291bnRlcnMKIwpDT05GSUdfUEVSRl9FVkVOVFM9eQojIGVu
ZCBvZiBLZXJuZWwgUGVyZm9ybWFuY2UgRXZlbnRzIEFuZCBDb3VudGVycwoKQ09ORklHX1NZU1RF
TV9EQVRBX1ZFUklGSUNBVElPTj15CiMgQ09ORklHX1BST0ZJTElORyBpcyBub3Qgc2V0CgojCiMg
S2V4ZWMgYW5kIGNyYXNoIGZlYXR1cmVzCiMKIyBDT05GSUdfS0VYRUMgaXMgbm90IHNldAojIENP
TkZJR19DUkFTSF9EVU1QIGlzIG5vdCBzZXQKIyBlbmQgb2YgS2V4ZWMgYW5kIGNyYXNoIGZlYXR1
cmVzCiMgZW5kIG9mIEdlbmVyYWwgc2V0dXAKCkNPTkZJR19QUEMzMj15CiMgQ09ORklHX1BQQzY0
IGlzIG5vdCBzZXQKCiMKIyBQcm9jZXNzb3Igc3VwcG9ydAojCkNPTkZJR19QUENfQk9PSzNTXzMy
PXkKIyBDT05GSUdfUFBDXzg1eHggaXMgbm90IHNldAojIENPTkZJR19QUENfOHh4IGlzIG5vdCBz
ZXQKIyBDT05GSUdfNDB4IGlzIG5vdCBzZXQKIyBDT05GSUdfNDR4IGlzIG5vdCBzZXQKIyBDT05G
SUdfUFBDX0JPT0szU182MDMgaXMgbm90IHNldApDT05GSUdfUFBDX0JPT0szU182MDQ9eQojIENP
TkZJR19QT1dFUlBDX0NQVSBpcyBub3Qgc2V0CiMgQ09ORklHX0UzMDBDMl9DUFUgaXMgbm90IHNl
dAojIENPTkZJR19FMzAwQzNfQ1BVIGlzIG5vdCBzZXQKQ09ORklHX0c0X0NQVT15CiMgQ09ORklH
X1RPT0xDSEFJTl9ERUZBVUxUX0NQVSBpcyBub3Qgc2V0CkNPTkZJR19UQVJHRVRfQ1BVX0JPT0w9
eQpDT05GSUdfVEFSR0VUX0NQVT0iRzQiCkNPTkZJR19QUENfQk9PSzNTPXkKQ09ORklHX1BQQ19G
UFVfUkVHUz15CkNPTkZJR19QUENfRlBVPXkKQ09ORklHX0FMVElWRUM9eQpDT05GSUdfUFBDX0tV
RVA9eQpDT05GSUdfUFBDX0tVQVA9eQojIENPTkZJR19QUENfS1VBUF9ERUJVRyBpcyBub3Qgc2V0
CkNPTkZJR19QUENfSEFWRV9QTVVfU1VQUE9SVD15CiMgQ09ORklHX1BNVV9TWVNGUyBpcyBub3Qg
c2V0CkNPTkZJR19QUENfUEVSRl9DVFJTPXkKQ09ORklHX1NNUD15CkNPTkZJR19OUl9DUFVTPTIK
IyBlbmQgb2YgUHJvY2Vzc29yIHN1cHBvcnQKCkNPTkZJR19WRFNPMzI9eQpDT05GSUdfQ1BVX0JJ
R19FTkRJQU49eQpDT05GSUdfMzJCSVQ9eQpDT05GSUdfTU1VPXkKQ09ORklHX0FSQ0hfTU1BUF9S
TkRfQklUU19NQVg9MTcKQ09ORklHX0FSQ0hfTU1BUF9STkRfQklUU19NSU49MTEKQ09ORklHX0FS
Q0hfTU1BUF9STkRfQ09NUEFUX0JJVFNfTUFYPTE3CkNPTkZJR19BUkNIX01NQVBfUk5EX0NPTVBB
VF9CSVRTX01JTj0xMQpDT05GSUdfTlJfSVJRUz01MTIKQ09ORklHX05NSV9JUEk9eQpDT05GSUdf
U1RBQ0tUUkFDRV9TVVBQT1JUPXkKQ09ORklHX0xPQ0tERVBfU1VQUE9SVD15CkNPTkZJR19HRU5F
UklDX0hXRUlHSFQ9eQpDT05GSUdfUFBDPXkKQ09ORklHX0VBUkxZX1BSSU5USz15CkNPTkZJR19Q
QU5JQ19USU1FT1VUPTQwCkNPTkZJR19TQ0hFRF9PTUlUX0ZSQU1FX1BPSU5URVI9eQpDT05GSUdf
QVJDSF9NQVlfSEFWRV9QQ19GREM9eQpDT05GSUdfR0VORVJJQ19UQlNZTkM9eQpDT05GSUdfQVVE
SVRfQVJDSD15CkNPTkZJR19HRU5FUklDX0JVRz15CkNPTkZJR19HRU5FUklDX0JVR19SRUxBVElW
RV9QT0lOVEVSUz15CkNPTkZJR19TWVNfU1VQUE9SVFNfQVBNX0VNVUxBVElPTj15CkNPTkZJR19B
UkNIX0hJQkVSTkFUSU9OX1BPU1NJQkxFPXkKQ09ORklHX0FSQ0hfU1VTUEVORF9QT1NTSUJMRT15
CkNPTkZJR19BUkNIX0hBU19BRERfUEFHRVM9eQojIENPTkZJR19QUENfUENJX09GX0JVU19NQVAg
aXMgbm90IHNldApDT05GSUdfUFBDX1BDSV9CVVNfTlVNX0RPTUFJTl9ERVBFTkRFTlQ9eQpDT05G
SUdfQVJDSF9TVVBQT1JUU19VUFJPQkVTPXkKQ09ORklHX1BHVEFCTEVfTEVWRUxTPTIKQ09ORklH
X1BQQ19NU0lfQklUTUFQPXkKCiMKIyBQbGF0Zm9ybSBzdXBwb3J0CiMKIyBDT05GSUdfU0NPTV9E
RUJVR0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFBDX0NIUlAgaXMgbm90IHNldAojIENPTkZJR19Q
UENfTVBDNTEyeCBpcyBub3Qgc2V0CiMgQ09ORklHX1BQQ19NUEM1Mnh4IGlzIG5vdCBzZXQKQ09O
RklHX1BQQ19QTUFDPXkKQ09ORklHX1BQQ19QTUFDMzJfUFNVUkdFPXkKIyBDT05GSUdfUFBDXzgy
eHggaXMgbm90IHNldAojIENPTkZJR19QUENfODN4eCBpcyBub3Qgc2V0CiMgQ09ORklHX1BQQ184
Nnh4IGlzIG5vdCBzZXQKQ09ORklHX0tWTV9HVUVTVD15CkNPTkZJR19FUEFQUl9QQVJBVklSVD15
CkNPTkZJR19QUENfSEFTSF9NTVVfTkFUSVZFPXkKQ09ORklHX1BQQ19PRl9CT09UX1RSQU1QT0xJ
TkU9eQpDT05GSUdfUFBDX1NNUF9NVVhFRF9JUEk9eQpDT05GSUdfTVBJQz15CkNPTkZJR19NUElD
X01TR1I9eQpDT05GSUdfUFBDX01QQzEwNj15CgojCiMgQ1BVIEZyZXF1ZW5jeSBzY2FsaW5nCiMK
Q09ORklHX0NQVV9GUkVRPXkKQ09ORklHX0NQVV9GUkVRX0dPVl9BVFRSX1NFVD15CkNPTkZJR19D
UFVfRlJFUV9HT1ZfQ09NTU9OPXkKIyBDT05GSUdfQ1BVX0ZSRVFfU1RBVCBpcyBub3Qgc2V0CiMg
Q09ORklHX0NQVV9GUkVRX0RFRkFVTFRfR09WX1BFUkZPUk1BTkNFIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfUE9XRVJTQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BV
X0ZSRVFfREVGQVVMVF9HT1ZfVVNFUlNQQUNFIGlzIG5vdCBzZXQKQ09ORklHX0NQVV9GUkVRX0RF
RkFVTFRfR09WX09OREVNQU5EPXkKIyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfQ09OU0VS
VkFUSVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfU0NIRURVVElM
IGlzIG5vdCBzZXQKQ09ORklHX0NQVV9GUkVRX0dPVl9QRVJGT1JNQU5DRT15CiMgQ09ORklHX0NQ
VV9GUkVRX0dPVl9QT1dFUlNBVkUgaXMgbm90IHNldAojIENPTkZJR19DUFVfRlJFUV9HT1ZfVVNF
UlNQQUNFIGlzIG5vdCBzZXQKQ09ORklHX0NQVV9GUkVRX0dPVl9PTkRFTUFORD15CiMgQ09ORklH
X0NQVV9GUkVRX0dPVl9DT05TRVJWQVRJVkUgaXMgbm90IHNldAojIENPTkZJR19DUFVfRlJFUV9H
T1ZfU0NIRURVVElMIGlzIG5vdCBzZXQKCiMKIyBDUFUgZnJlcXVlbmN5IHNjYWxpbmcgZHJpdmVy
cwojCiMgQ09ORklHX0NQVUZSRVFfRFRfUExBVERFViBpcyBub3Qgc2V0CkNPTkZJR19DUFVfRlJF
UV9QTUFDPXkKIyBlbmQgb2YgQ1BVIEZyZXF1ZW5jeSBzY2FsaW5nCgojCiMgQ1BVSWRsZSBkcml2
ZXIKIwoKIwojIENQVSBJZGxlCiMKIyBDT05GSUdfQ1BVX0lETEUgaXMgbm90IHNldAojIGVuZCBv
ZiBDUFUgSWRsZQojIGVuZCBvZiBDUFVJZGxlIGRyaXZlcgoKQ09ORklHX1RBVT15CiMgQ09ORklH
X1RBVV9JTlQgaXMgbm90IHNldAojIENPTkZJR19UQVVfQVZFUkFHRSBpcyBub3Qgc2V0CiMgQ09O
RklHX0dFTl9SVEMgaXMgbm90IHNldAojIGVuZCBvZiBQbGF0Zm9ybSBzdXBwb3J0CgojCiMgS2Vy
bmVsIG9wdGlvbnMKIwpDT05GSUdfSElHSE1FTT15CiMgQ09ORklHX0haXzEwMCBpcyBub3Qgc2V0
CiMgQ09ORklHX0haXzI1MCBpcyBub3Qgc2V0CkNPTkZJR19IWl8zMDA9eQojIENPTkZJR19IWl8x
MDAwIGlzIG5vdCBzZXQKQ09ORklHX0haPTMwMApDT05GSUdfU0NIRURfSFJUSUNLPXkKQ09ORklH
X0hPVFBMVUdfQ1BVPXkKIyBDT05GSUdfUFBDX1FVRVVFRF9TUElOTE9DS1MgaXMgbm90IHNldApD
T05GSUdfQVJDSF9DUFVfUFJPQkVfUkVMRUFTRT15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0tFWEVD
PXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfS0VYRUNfUFVSR0FUT1JZPXkKQ09ORklHX0FSQ0hfU1VQ
UE9SVFNfQ1JBU0hfRFVNUD15CkNPTkZJR19JUlFfQUxMX0NQVVM9eQpDT05GSUdfQVJDSF9GTEFU
TUVNX0VOQUJMRT15CkNPTkZJR19JTExFR0FMX1BPSU5URVJfVkFMVUU9MApDT05GSUdfUFBDXzRL
X1BBR0VTPXkKQ09ORklHX1BBR0VfU0laRV80S0I9eQpDT05GSUdfUFBDX1BBR0VfU0hJRlQ9MTIK
Q09ORklHX1RIUkVBRF9TSElGVD0xMwpDT05GSUdfREFUQV9TSElGVD0yMgpDT05GSUdfQVJDSF9G
T1JDRV9NQVhfT1JERVI9MTAKQ09ORklHX0NNRExJTkU9IiIKQ09ORklHX0VYVFJBX1RBUkdFVFM9
IiIKQ09ORklHX0FSQ0hfV0FOVFNfRlJFRVpFUl9DT05UUk9MPXkKIyBDT05GSUdfU1VTUEVORCBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJQkVSTkFUSU9OIGlzIG5vdCBzZXQKQ09ORklHX1BNPXkKIyBD
T05GSUdfUE1fREVCVUcgaXMgbm90IHNldApDT05GSUdfQVBNX0VNVUxBVElPTj1tCkNPTkZJR19X
UV9QT1dFUl9FRkZJQ0lFTlRfREVGQVVMVD15CiMgQ09ORklHX0VORVJHWV9NT0RFTCBpcyBub3Qg
c2V0CiMgZW5kIG9mIEtlcm5lbCBvcHRpb25zCgpDT05GSUdfSVNBX0RNQV9BUEk9eQoKIwojIEJ1
cyBvcHRpb25zCiMKQ09ORklHX0dFTkVSSUNfSVNBX0RNQT15CkNPTkZJR19QUENfSU5ESVJFQ1Rf
UENJPXkKIyBDT05GSUdfRlNMX0xCQyBpcyBub3Qgc2V0CiMgZW5kIG9mIEJ1cyBvcHRpb25zCgoj
CiMgQWR2YW5jZWQgc2V0dXAKIwojIENPTkZJR19BRFZBTkNFRF9PUFRJT05TIGlzIG5vdCBzZXQK
CiMKIyBEZWZhdWx0IHNldHRpbmdzIGZvciBhZHZhbmNlZCBjb25maWd1cmF0aW9uIG9wdGlvbnMg
YXJlIHVzZWQKIwpDT05GSUdfTE9XTUVNX1NJWkU9MHgzMDAwMDAwMApDT05GSUdfUEFHRV9PRkZT
RVQ9MHhjMDAwMDAwMApDT05GSUdfS0VSTkVMX1NUQVJUPTB4YzAwMDAwMDAKQ09ORklHX1BIWVNJ
Q0FMX1NUQVJUPTB4MDAwMDAwMDAKQ09ORklHX1RBU0tfU0laRT0weGIwMDAwMDAwCiMgZW5kIG9m
IEFkdmFuY2VkIHNldHVwCgojIENPTkZJR19WSVJUVUFMSVpBVElPTiBpcyBub3Qgc2V0CkNPTkZJ
R19IQVZFX0xJVkVQQVRDSD15CgojCiMgR2VuZXJhbCBhcmNoaXRlY3R1cmUtZGVwZW5kZW50IG9w
dGlvbnMKIwpDT05GSUdfSE9UUExVR19TTVQ9eQpDT05GSUdfU01UX05VTV9USFJFQURTX0RZTkFN
SUM9eQojIENPTkZJR19LUFJPQkVTIGlzIG5vdCBzZXQKQ09ORklHX0pVTVBfTEFCRUw9eQojIENP
TkZJR19TVEFUSUNfS0VZU19TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NUQVRJQ19DQUxM
X1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NF
U1M9eQpDT05GSUdfQVJDSF9VU0VfQlVJTFRJTl9CU1dBUD15CkNPTkZJR19IQVZFX0lPUkVNQVBf
UFJPVD15CkNPTkZJR19IQVZFX0tQUk9CRVM9eQpDT05GSUdfSEFWRV9LUkVUUFJPQkVTPXkKQ09O
RklHX0hBVkVfT1BUUFJPQkVTPXkKQ09ORklHX0hBVkVfS1BST0JFU19PTl9GVFJBQ0U9eQpDT05G
SUdfSEFWRV9GVU5DVElPTl9FUlJPUl9JTkpFQ1RJT049eQpDT05GSUdfSEFWRV9OTUk9eQpDT05G
SUdfVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVD15CkNPTkZJR19IQVZFX0FSQ0hfVFJBQ0VIT09LPXkK
Q09ORklHX0dFTkVSSUNfU01QX0lETEVfVEhSRUFEPXkKQ09ORklHX0dFTkVSSUNfSURMRV9QT0xM
X1NFVFVQPXkKQ09ORklHX0FSQ0hfSEFTX0ZPUlRJRllfU09VUkNFPXkKQ09ORklHX0FSQ0hfSEFT
X1NFVF9NRU1PUlk9eQpDT05GSUdfQVJDSF8zMkJJVF9PRkZfVD15CkNPTkZJR19IQVZFX0FTTV9N
T0RWRVJTSU9OUz15CkNPTkZJR19IQVZFX1JFR1NfQU5EX1NUQUNLX0FDQ0VTU19BUEk9eQpDT05G
SUdfSEFWRV9SU0VRPXkKQ09ORklHX0hBVkVfRlVOQ1RJT05fQVJHX0FDQ0VTU19BUEk9eQpDT05G
SUdfSEFWRV9IV19CUkVBS1BPSU5UPXkKQ09ORklHX0hBVkVfUEVSRl9SRUdTPXkKQ09ORklHX0hB
VkVfUEVSRl9VU0VSX1NUQUNLX0RVTVA9eQpDT05GSUdfSEFWRV9BUkNIX0pVTVBfTEFCRUw9eQpD
T05GSUdfSEFWRV9BUkNIX0pVTVBfTEFCRUxfUkVMQVRJVkU9eQpDT05GSUdfTU1VX0dBVEhFUl9U
QUJMRV9GUkVFPXkKQ09ORklHX01NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUU9eQpDT05GSUdfTU1V
X0dBVEhFUl9QQUdFX1NJWkU9eQpDT05GSUdfTU1VX0dBVEhFUl9NRVJHRV9WTUFTPXkKQ09ORklH
X0FSQ0hfV0FOVF9JUlFTX09GRl9BQ1RJVkFURV9NTT15CkNPTkZJR19NTVVfTEFaWV9UTEJfUkVG
Q09VTlQ9eQpDT05GSUdfQVJDSF9IQVZFX05NSV9TQUZFX0NNUFhDSEc9eQpDT05GSUdfQVJDSF9X
RUFLX1JFTEVBU0VfQUNRVUlSRT15CkNPTkZJR19BUkNIX1dBTlRfSVBDX1BBUlNFX1ZFUlNJT049
eQpDT05GSUdfSEFWRV9BUkNIX1NFQ0NPTVA9eQpDT05GSUdfSEFWRV9BUkNIX1NFQ0NPTVBfRklM
VEVSPXkKQ09ORklHX1NFQ0NPTVA9eQpDT05GSUdfU0VDQ09NUF9GSUxURVI9eQojIENPTkZJR19T
RUNDT01QX0NBQ0hFX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfU1RBQ0tQUk9URUNUT1I9
eQpDT05GSUdfU1RBQ0tQUk9URUNUT1I9eQojIENPTkZJR19TVEFDS1BST1RFQ1RPUl9TVFJPTkcg
aXMgbm90IHNldApDT05GSUdfTFRPX05PTkU9eQpDT05GSUdfSEFWRV9BUkNIX1dJVEhJTl9TVEFD
S19GUkFNRVM9eQpDT05GSUdfSEFWRV9DT05URVhUX1RSQUNLSU5HX1VTRVI9eQpDT05GSUdfSEFW
RV9WSVJUX0NQVV9BQ0NPVU5USU5HPXkKQ09ORklHX0hBVkVfVklSVF9DUFVfQUNDT1VOVElOR19H
RU49eQpDT05GSUdfSEFWRV9JUlFfVElNRV9BQ0NPVU5USU5HPXkKQ09ORklHX0hBVkVfTU9EX0FS
Q0hfU1BFQ0lGSUM9eQpDT05GSUdfTU9EVUxFU19VU0VfRUxGX1JFTEE9eQpDT05GSUdfQVJDSF9X
QU5UU19NT0RVTEVTX0RBVEFfSU5fVk1BTExPQz15CkNPTkZJR19IQVZFX1NPRlRJUlFfT05fT1dO
X1NUQUNLPXkKQ09ORklHX1NPRlRJUlFfT05fT1dOX1NUQUNLPXkKQ09ORklHX0FSQ0hfSEFTX0VM
Rl9SQU5ET01JWkU9eQpDT05GSUdfSEFWRV9BUkNIX01NQVBfUk5EX0JJVFM9eQpDT05GSUdfQVJD
SF9NTUFQX1JORF9CSVRTPTExCkNPTkZJR19QQUdFX1NJWkVfTEVTU19USEFOXzY0S0I9eQpDT05G
SUdfUEFHRV9TSVpFX0xFU1NfVEhBTl8yNTZLQj15CkNPTkZJR19BUkNIX1dBTlRfREVGQVVMVF9U
T1BET1dOX01NQVBfTEFZT1VUPXkKQ09ORklHX0hBVkVfT0JKVE9PTD15CkNPTkZJR19IQVZFX1JF
TElBQkxFX1NUQUNLVFJBQ0U9eQpDT05GSUdfSEFWRV9BUkNIX05WUkFNX09QUz15CkNPTkZJR19D
TE9ORV9CQUNLV0FSRFM9eQpDT05GSUdfT0xEX1NJR1NVU1BFTkQ9eQpDT05GSUdfT0xEX1NJR0FD
VElPTj15CkNPTkZJR19DT01QQVRfMzJCSVRfVElNRT15CkNPTkZJR19IQVZFX0FSQ0hfVk1BUF9T
VEFDSz15CkNPTkZJR19WTUFQX1NUQUNLPXkKQ09ORklHX0hBVkVfQVJDSF9SQU5ET01JWkVfS1NU
QUNLX09GRlNFVD15CkNPTkZJR19SQU5ET01JWkVfS1NUQUNLX09GRlNFVD15CkNPTkZJR19SQU5E
T01JWkVfS1NUQUNLX09GRlNFVF9ERUZBVUxUPXkKQ09ORklHX0FSQ0hfT1BUSU9OQUxfS0VSTkVM
X1JXWD15CkNPTkZJR19BUkNIX09QVElPTkFMX0tFUk5FTF9SV1hfREVGQVVMVD15CkNPTkZJR19B
UkNIX0hBU19TVFJJQ1RfS0VSTkVMX1JXWD15CkNPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWD15CkNP
TkZJR19BUkNIX0hBU19TVFJJQ1RfTU9EVUxFX1JXWD15CiMgQ09ORklHX1NUUklDVF9NT0RVTEVf
UldYIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX1BIWVNfVE9fRE1BPXkKIyBDT05GSUdfTE9D
S19FVkVOVF9DT1VOVFMgaXMgbm90IHNldApDT05GSUdfSEFWRV9TVEFUSUNfQ0FMTD15CkNPTkZJ
R19BUkNIX1dBTlRfTERfT1JQSEFOX1dBUk49eQpDT05GSUdfQVJDSF9TVVBQT1JUU19ERUJVR19Q
QUdFQUxMT0M9eQpDT05GSUdfQVJDSF9TUExJVF9BUkc2ND15CgojCiMgR0NPVi1iYXNlZCBrZXJu
ZWwgcHJvZmlsaW5nCiMKIyBDT05GSUdfR0NPVl9LRVJORUwgaXMgbm90IHNldApDT05GSUdfQVJD
SF9IQVNfR0NPVl9QUk9GSUxFX0FMTD15CiMgZW5kIG9mIEdDT1YtYmFzZWQga2VybmVsIHByb2Zp
bGluZwoKQ09ORklHX0hBVkVfR0NDX1BMVUdJTlM9eQpDT05GSUdfR0NDX1BMVUdJTlM9eQpDT05G
SUdfR0NDX1BMVUdJTl9MQVRFTlRfRU5UUk9QWT15CkNPTkZJR19GVU5DVElPTl9BTElHTk1FTlRf
NEI9eQpDT05GSUdfRlVOQ1RJT05fQUxJR05NRU5UPTQKIyBlbmQgb2YgR2VuZXJhbCBhcmNoaXRl
Y3R1cmUtZGVwZW5kZW50IG9wdGlvbnMKCkNPTkZJR19SVF9NVVRFWEVTPXkKQ09ORklHX0JBU0Vf
U01BTEw9MApDT05GSUdfTU9EVUxFUz15CiMgQ09ORklHX01PRFVMRV9ERUJVRyBpcyBub3Qgc2V0
CiMgQ09ORklHX01PRFVMRV9GT1JDRV9MT0FEIGlzIG5vdCBzZXQKQ09ORklHX01PRFVMRV9VTkxP
QUQ9eQpDT05GSUdfTU9EVUxFX0ZPUkNFX1VOTE9BRD15CiMgQ09ORklHX01PRFVMRV9VTkxPQURf
VEFJTlRfVFJBQ0tJTkcgaXMgbm90IHNldAojIENPTkZJR19NT0RWRVJTSU9OUyBpcyBub3Qgc2V0
CiMgQ09ORklHX01PRFVMRV9TUkNWRVJTSU9OX0FMTCBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVM
RV9TSUcgaXMgbm90IHNldApDT05GSUdfTU9EVUxFX0NPTVBSRVNTX05PTkU9eQojIENPTkZJR19N
T0RVTEVfQ09NUFJFU1NfR1pJUCBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9DT01QUkVTU19Y
WiBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9DT01QUkVTU19aU1REIGlzIG5vdCBzZXQKIyBD
T05GSUdfTU9EVUxFX0FMTE9XX01JU1NJTkdfTkFNRVNQQUNFX0lNUE9SVFMgaXMgbm90IHNldApD
T05GSUdfTU9EUFJPQkVfUEFUSD0iL3NiaW4vbW9kcHJvYmUiCiMgQ09ORklHX1RSSU1fVU5VU0VE
X0tTWU1TIGlzIG5vdCBzZXQKQ09ORklHX01PRFVMRVNfVFJFRV9MT09LVVA9eQpDT05GSUdfQkxP
Q0s9eQojIENPTkZJR19CTE9DS19MRUdBQ1lfQVVUT0xPQUQgaXMgbm90IHNldApDT05GSUdfQkxL
X0NHUk9VUF9SV1NUQVQ9eQpDT05GSUdfQkxLX0NHUk9VUF9QVU5UX0JJTz15CkNPTkZJR19CTEtf
REVWX0JTR19DT01NT049eQpDT05GSUdfQkxLX0lDUT15CiMgQ09ORklHX0JMS19ERVZfQlNHTElC
IGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl9JTlRFR1JJVFkgaXMgbm90IHNldAojIENPTkZJ
R19CTEtfREVWX1dSSVRFX01PVU5URUQgaXMgbm90IHNldAojIENPTkZJR19CTEtfREVWX1pPTkVE
IGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl9USFJPVFRMSU5HIGlzIG5vdCBzZXQKQ09ORklH
X0JMS19XQlQ9eQpDT05GSUdfQkxLX1dCVF9NUT15CiMgQ09ORklHX0JMS19DR1JPVVBfSU9MQVRF
TkNZIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0NHUk9VUF9JT0NPU1QgaXMgbm90IHNldAojIENP
TkZJR19CTEtfQ0dST1VQX0lPUFJJTyBpcyBub3Qgc2V0CkNPTkZJR19CTEtfREVCVUdfRlM9eQoj
IENPTkZJR19CTEtfU0VEX09QQUwgaXMgbm90IHNldAojIENPTkZJR19CTEtfSU5MSU5FX0VOQ1JZ
UFRJT04gaXMgbm90IHNldAoKIwojIFBhcnRpdGlvbiBUeXBlcwojCkNPTkZJR19QQVJUSVRJT05f
QURWQU5DRUQ9eQojIENPTkZJR19BQ09STl9QQVJUSVRJT04gaXMgbm90IHNldAojIENPTkZJR19B
SVhfUEFSVElUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfT1NGX1BBUlRJVElPTiBpcyBub3Qgc2V0
CkNPTkZJR19BTUlHQV9QQVJUSVRJT049eQojIENPTkZJR19BVEFSSV9QQVJUSVRJT04gaXMgbm90
IHNldApDT05GSUdfTUFDX1BBUlRJVElPTj15CkNPTkZJR19NU0RPU19QQVJUSVRJT049eQpDT05G
SUdfQlNEX0RJU0tMQUJFTD15CiMgQ09ORklHX01JTklYX1NVQlBBUlRJVElPTiBpcyBub3Qgc2V0
CiMgQ09ORklHX1NPTEFSSVNfWDg2X1BBUlRJVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1VOSVhX
QVJFX0RJU0tMQUJFTCBpcyBub3Qgc2V0CkNPTkZJR19MRE1fUEFSVElUSU9OPXkKIyBDT05GSUdf
TERNX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfU0dJX1BBUlRJVElPTiBpcyBub3Qgc2V0CiMg
Q09ORklHX1VMVFJJWF9QQVJUSVRJT04gaXMgbm90IHNldAojIENPTkZJR19TVU5fUEFSVElUSU9O
IGlzIG5vdCBzZXQKIyBDT05GSUdfS0FSTUFfUEFSVElUSU9OIGlzIG5vdCBzZXQKQ09ORklHX0VG
SV9QQVJUSVRJT049eQojIENPTkZJR19TWVNWNjhfUEFSVElUSU9OIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ01ETElORV9QQVJUSVRJT04gaXMgbm90IHNldAojIGVuZCBvZiBQYXJ0aXRpb24gVHlwZXMK
CkNPTkZJR19CTEtfTVFfUENJPXkKQ09ORklHX0JMS19NUV9WSVJUSU89eQpDT05GSUdfQkxLX1BN
PXkKQ09ORklHX0JMT0NLX0hPTERFUl9ERVBSRUNBVEVEPXkKQ09ORklHX0JMS19NUV9TVEFDS0lO
Rz15CgojCiMgSU8gU2NoZWR1bGVycwojCiMgQ09ORklHX01RX0lPU0NIRURfREVBRExJTkUgaXMg
bm90IHNldAojIENPTkZJR19NUV9JT1NDSEVEX0tZQkVSIGlzIG5vdCBzZXQKQ09ORklHX0lPU0NI
RURfQkZRPXkKQ09ORklHX0JGUV9HUk9VUF9JT1NDSEVEPXkKIyBDT05GSUdfQkZRX0NHUk9VUF9E
RUJVRyBpcyBub3Qgc2V0CiMgZW5kIG9mIElPIFNjaGVkdWxlcnMKCkNPTkZJR19QQURBVEE9eQpD
T05GSUdfQVNOMT15CkNPTkZJR19VTklOTElORV9TUElOX1VOTE9DSz15CkNPTkZJR19BUkNIX1NV
UFBPUlRTX0FUT01JQ19STVc9eQpDT05GSUdfTVVURVhfU1BJTl9PTl9PV05FUj15CkNPTkZJR19S
V1NFTV9TUElOX09OX09XTkVSPXkKQ09ORklHX0xPQ0tfU1BJTl9PTl9PV05FUj15CkNPTkZJR19B
UkNIX0hBU19OT05fT1ZFUkxBUFBJTkdfQUREUkVTU19TUEFDRT15CkNPTkZJR19BUkNIX0hBU19T
WVNDQUxMX1dSQVBQRVI9eQpDT05GSUdfRlJFRVpFUj15CgojCiMgRXhlY3V0YWJsZSBmaWxlIGZv
cm1hdHMKIwpDT05GSUdfQklORk1UX0VMRj15CkNPTkZJR19FTEZDT1JFPXkKQ09ORklHX0NPUkVf
RFVNUF9ERUZBVUxUX0VMRl9IRUFERVJTPXkKQ09ORklHX0JJTkZNVF9TQ1JJUFQ9eQpDT05GSUdf
QklORk1UX01JU0M9eQpDT05GSUdfQ09SRURVTVA9eQojIGVuZCBvZiBFeGVjdXRhYmxlIGZpbGUg
Zm9ybWF0cwoKIwojIE1lbW9yeSBNYW5hZ2VtZW50IG9wdGlvbnMKIwpDT05GSUdfWlBPT0w9eQpD
T05GSUdfU1dBUD15CkNPTkZJR19aU1dBUD15CkNPTkZJR19aU1dBUF9ERUZBVUxUX09OPXkKQ09O
RklHX1pTV0FQX0VYQ0xVU0lWRV9MT0FEU19ERUZBVUxUX09OPXkKQ09ORklHX1pTV0FQX1NIUklO
S0VSX0RFRkFVTFRfT049eQojIENPTkZJR19aU1dBUF9DT01QUkVTU09SX0RFRkFVTFRfREVGTEFU
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1pTV0FQX0NPTVBSRVNTT1JfREVGQVVMVF9MWk8gaXMgbm90
IHNldAojIENPTkZJR19aU1dBUF9DT01QUkVTU09SX0RFRkFVTFRfODQyIGlzIG5vdCBzZXQKIyBD
T05GSUdfWlNXQVBfQ09NUFJFU1NPUl9ERUZBVUxUX0xaNCBpcyBub3Qgc2V0CiMgQ09ORklHX1pT
V0FQX0NPTVBSRVNTT1JfREVGQVVMVF9MWjRIQyBpcyBub3Qgc2V0CkNPTkZJR19aU1dBUF9DT01Q
UkVTU09SX0RFRkFVTFRfWlNURD15CkNPTkZJR19aU1dBUF9DT01QUkVTU09SX0RFRkFVTFQ9Inpz
dGQiCiMgQ09ORklHX1pTV0FQX1pQT09MX0RFRkFVTFRfWkJVRCBpcyBub3Qgc2V0CiMgQ09ORklH
X1pTV0FQX1pQT09MX0RFRkFVTFRfWjNGT0xEIGlzIG5vdCBzZXQKQ09ORklHX1pTV0FQX1pQT09M
X0RFRkFVTFRfWlNNQUxMT0M9eQpDT05GSUdfWlNXQVBfWlBPT0xfREVGQVVMVD0ienNtYWxsb2Mi
CiMgQ09ORklHX1pCVUQgaXMgbm90IHNldAojIENPTkZJR19aM0ZPTEQgaXMgbm90IHNldApDT05G
SUdfWlNNQUxMT0M9eQojIENPTkZJR19aU01BTExPQ19TVEFUIGlzIG5vdCBzZXQKQ09ORklHX1pT
TUFMTE9DX0NIQUlOX1NJWkU9OAoKIwojIFNsYWIgYWxsb2NhdG9yIG9wdGlvbnMKIwpDT05GSUdf
U0xVQj15CiMgQ09ORklHX1NMVUJfVElOWSBpcyBub3Qgc2V0CiMgQ09ORklHX1NMQUJfTUVSR0Vf
REVGQVVMVCBpcyBub3Qgc2V0CkNPTkZJR19TTEFCX0ZSRUVMSVNUX1JBTkRPTT15CkNPTkZJR19T
TEFCX0ZSRUVMSVNUX0hBUkRFTkVEPXkKIyBDT05GSUdfU0xVQl9TVEFUUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NMVUJfQ1BVX1BBUlRJQUwgaXMgbm90IHNldApDT05GSUdfUkFORE9NX0tNQUxMT0Nf
Q0FDSEVTPXkKIyBlbmQgb2YgU2xhYiBhbGxvY2F0b3Igb3B0aW9ucwoKQ09ORklHX1NIVUZGTEVf
UEFHRV9BTExPQ0FUT1I9eQojIENPTkZJR19DT01QQVRfQlJLIGlzIG5vdCBzZXQKQ09ORklHX0ZM
QVRNRU09eQpDT05GSUdfSEFWRV9GQVNUX0dVUD15CkNPTkZJR19BUkNIX0tFRVBfTUVNQkxPQ0s9
eQpDT05GSUdfRVhDTFVTSVZFX1NZU1RFTV9SQU09eQpDT05GSUdfQVJDSF9FTkFCTEVfTUVNT1JZ
X0hPVFBMVUc9eQpDT05GSUdfQVJDSF9FTkFCTEVfTUVNT1JZX0hPVFJFTU9WRT15CkNPTkZJR19T
UExJVF9QVExPQ0tfQ1BVUz00CkNPTkZJR19DT01QQUNUSU9OPXkKQ09ORklHX0NPTVBBQ1RfVU5F
VklDVEFCTEVfREVGQVVMVD0xCkNPTkZJR19QQUdFX1JFUE9SVElORz15CkNPTkZJR19NSUdSQVRJ
T049eQpDT05GSUdfUENQX0JBVENIX1NDQUxFX01BWD01CkNPTkZJR19CT1VOQ0U9eQpDT05GSUdf
TU1VX05PVElGSUVSPXkKQ09ORklHX0tTTT15CkNPTkZJR19ERUZBVUxUX01NQVBfTUlOX0FERFI9
MTYzODQKIyBDT05GSUdfQ01BIGlzIG5vdCBzZXQKQ09ORklHX0dFTkVSSUNfRUFSTFlfSU9SRU1B
UD15CiMgQ09ORklHX0lETEVfUEFHRV9UUkFDS0lORyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hB
U19DVVJSRU5UX1NUQUNLX1BPSU5URVI9eQpDT05GSUdfWk9ORV9ETUE9eQpDT05GSUdfVk1fRVZF
TlRfQ09VTlRFUlM9eQojIENPTkZJR19QRVJDUFVfU1RBVFMgaXMgbm90IHNldAojIENPTkZJR19H
VVBfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQVBPT0xfVEVTVCBpcyBub3Qgc2V0CkNPTkZJ
R19BUkNIX0hBU19QVEVfU1BFQ0lBTD15CkNPTkZJR19LTUFQX0xPQ0FMPXkKQ09ORklHX01FTUZE
X0NSRUFURT15CiMgQ09ORklHX0FOT05fVk1BX05BTUUgaXMgbm90IHNldApDT05GSUdfVVNFUkZB
VUxURkQ9eQpDT05GSUdfTFJVX0dFTj15CkNPTkZJR19MUlVfR0VOX0VOQUJMRUQ9eQojIENPTkZJ
R19MUlVfR0VOX1NUQVRTIGlzIG5vdCBzZXQKQ09ORklHX0xPQ0tfTU1fQU5EX0ZJTkRfVk1BPXkK
CiMKIyBEYXRhIEFjY2VzcyBNb25pdG9yaW5nCiMKIyBDT05GSUdfREFNT04gaXMgbm90IHNldAoj
IGVuZCBvZiBEYXRhIEFjY2VzcyBNb25pdG9yaW5nCiMgZW5kIG9mIE1lbW9yeSBNYW5hZ2VtZW50
IG9wdGlvbnMKCkNPTkZJR19ORVQ9eQpDT05GSUdfTkVUX0lOR1JFU1M9eQpDT05GSUdfTkVUX0VH
UkVTUz15CkNPTkZJR19ORVRfWEdSRVNTPXkKQ09ORklHX1NLQl9FWFRFTlNJT05TPXkKCiMKIyBO
ZXR3b3JraW5nIG9wdGlvbnMKIwpDT05GSUdfUEFDS0VUPW0KQ09ORklHX1BBQ0tFVF9ESUFHPW0K
Q09ORklHX1VOSVg9eQpDT05GSUdfVU5JWF9TQ009eQpDT05GSUdfQUZfVU5JWF9PT0I9eQpDT05G
SUdfVU5JWF9ESUFHPW0KQ09ORklHX1RMUz1tCkNPTkZJR19UTFNfREVWSUNFPXkKIyBDT05GSUdf
VExTX1RPRSBpcyBub3Qgc2V0CkNPTkZJR19YRlJNPXkKQ09ORklHX1hGUk1fQUxHTz1tCkNPTkZJ
R19YRlJNX1VTRVI9bQojIENPTkZJR19YRlJNX0lOVEVSRkFDRSBpcyBub3Qgc2V0CiMgQ09ORklH
X1hGUk1fU1VCX1BPTElDWSBpcyBub3Qgc2V0CiMgQ09ORklHX1hGUk1fTUlHUkFURSBpcyBub3Qg
c2V0CiMgQ09ORklHX1hGUk1fU1RBVElTVElDUyBpcyBub3Qgc2V0CkNPTkZJR19YRlJNX0FIPW0K
Q09ORklHX1hGUk1fRVNQPW0KQ09ORklHX1hGUk1fSVBDT01QPW0KQ09ORklHX05FVF9LRVk9bQoj
IENPTkZJR19ORVRfS0VZX01JR1JBVEUgaXMgbm90IHNldAojIENPTkZJR19YRFBfU09DS0VUUyBp
cyBub3Qgc2V0CkNPTkZJR19ORVRfSEFORFNIQUtFPXkKIyBDT05GSUdfTkVUX0hBTkRTSEFLRV9L
VU5JVF9URVNUIGlzIG5vdCBzZXQKQ09ORklHX0lORVQ9eQojIENPTkZJR19JUF9NVUxUSUNBU1Qg
aXMgbm90IHNldAojIENPTkZJR19JUF9BRFZBTkNFRF9ST1VURVIgaXMgbm90IHNldAojIENPTkZJ
R19JUF9QTlAgaXMgbm90IHNldAojIENPTkZJR19ORVRfSVBJUCBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVF9JUEdSRV9ERU1VWCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfSVBfVFVOTkVMPW0KQ09ORklH
X1NZTl9DT09LSUVTPXkKIyBDT05GSUdfTkVUX0lQVlRJIGlzIG5vdCBzZXQKQ09ORklHX05FVF9V
RFBfVFVOTkVMPW0KIyBDT05GSUdfTkVUX0ZPVSBpcyBub3Qgc2V0CkNPTkZJR19JTkVUX0FIPW0K
Q09ORklHX0lORVRfRVNQPW0KIyBDT05GSUdfSU5FVF9FU1BfT0ZGTE9BRCBpcyBub3Qgc2V0CiMg
Q09ORklHX0lORVRfRVNQSU5UQ1AgaXMgbm90IHNldApDT05GSUdfSU5FVF9JUENPTVA9bQpDT05G
SUdfSU5FVF9UQUJMRV9QRVJUVVJCX09SREVSPTE2CkNPTkZJR19JTkVUX1hGUk1fVFVOTkVMPW0K
Q09ORklHX0lORVRfVFVOTkVMPW0KIyBDT05GSUdfSU5FVF9ESUFHIGlzIG5vdCBzZXQKQ09ORklH
X1RDUF9DT05HX0FEVkFOQ0VEPXkKIyBDT05GSUdfVENQX0NPTkdfQklDIGlzIG5vdCBzZXQKIyBD
T05GSUdfVENQX0NPTkdfQ1VCSUMgaXMgbm90IHNldApDT05GSUdfVENQX0NPTkdfV0VTVFdPT0Q9
eQojIENPTkZJR19UQ1BfQ09OR19IVENQIGlzIG5vdCBzZXQKIyBDT05GSUdfVENQX0NPTkdfSFNU
Q1AgaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19IWUJMQSBpcyBub3Qgc2V0CiMgQ09ORklH
X1RDUF9DT05HX1ZFR0FTIGlzIG5vdCBzZXQKIyBDT05GSUdfVENQX0NPTkdfTlYgaXMgbm90IHNl
dAojIENPTkZJR19UQ1BfQ09OR19TQ0FMQUJMRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05H
X0xQIGlzIG5vdCBzZXQKIyBDT05GSUdfVENQX0NPTkdfVkVOTyBpcyBub3Qgc2V0CiMgQ09ORklH
X1RDUF9DT05HX1lFQUggaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19JTExJTk9JUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0RDVENQIGlzIG5vdCBzZXQKIyBDT05GSUdfVENQX0NP
TkdfQ0RHIGlzIG5vdCBzZXQKIyBDT05GSUdfVENQX0NPTkdfQkJSIGlzIG5vdCBzZXQKQ09ORklH
X0RFRkFVTFRfV0VTVFdPT0Q9eQojIENPTkZJR19ERUZBVUxUX1JFTk8gaXMgbm90IHNldApDT05G
SUdfREVGQVVMVF9UQ1BfQ09ORz0id2VzdHdvb2QiCiMgQ09ORklHX1RDUF9NRDVTSUcgaXMgbm90
IHNldApDT05GSUdfSVBWNj15CiMgQ09ORklHX0lQVjZfUk9VVEVSX1BSRUYgaXMgbm90IHNldAoj
IENPTkZJR19JUFY2X09QVElNSVNUSUNfREFEIGlzIG5vdCBzZXQKQ09ORklHX0lORVQ2X0FIPW0K
Q09ORklHX0lORVQ2X0VTUD1tCiMgQ09ORklHX0lORVQ2X0VTUF9PRkZMT0FEIGlzIG5vdCBzZXQK
IyBDT05GSUdfSU5FVDZfRVNQSU5UQ1AgaXMgbm90IHNldApDT05GSUdfSU5FVDZfSVBDT01QPW0K
IyBDT05GSUdfSVBWNl9NSVA2IGlzIG5vdCBzZXQKQ09ORklHX0lORVQ2X1hGUk1fVFVOTkVMPW0K
Q09ORklHX0lORVQ2X1RVTk5FTD1tCiMgQ09ORklHX0lQVjZfVlRJIGlzIG5vdCBzZXQKIyBDT05G
SUdfSVBWNl9TSVQgaXMgbm90IHNldAojIENPTkZJR19JUFY2X1RVTk5FTCBpcyBub3Qgc2V0CiMg
Q09ORklHX0lQVjZfTVVMVElQTEVfVEFCTEVTIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9NUk9V
VEUgaXMgbm90IHNldAojIENPTkZJR19JUFY2X1NFRzZfTFdUVU5ORUwgaXMgbm90IHNldAojIENP
TkZJR19JUFY2X1NFRzZfSE1BQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfUlBMX0xXVFVOTkVM
IGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9JT0FNNl9MV1RVTk5FTCBpcyBub3Qgc2V0CiMgQ09O
RklHX05FVExBQkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfTVBUQ1AgaXMgbm90IHNldAojIENPTkZJ
R19ORVRXT1JLX1NFQ01BUksgaXMgbm90IHNldAojIENPTkZJR19ORVRXT1JLX1BIWV9USU1FU1RB
TVBJTkcgaXMgbm90IHNldAojIENPTkZJR19ORVRGSUxURVIgaXMgbm90IHNldAojIENPTkZJR19J
UF9EQ0NQIGlzIG5vdCBzZXQKQ09ORklHX0lQX1NDVFA9bQojIENPTkZJR19TQ1RQX0RCR19PQkpD
TlQgaXMgbm90IHNldApDT05GSUdfU0NUUF9ERUZBVUxUX0NPT0tJRV9ITUFDX01ENT15CiMgQ09O
RklHX1NDVFBfREVGQVVMVF9DT09LSUVfSE1BQ19TSEExIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NU
UF9ERUZBVUxUX0NPT0tJRV9ITUFDX05PTkUgaXMgbm90IHNldApDT05GSUdfU0NUUF9DT09LSUVf
SE1BQ19NRDU9eQojIENPTkZJR19TQ1RQX0NPT0tJRV9ITUFDX1NIQTEgaXMgbm90IHNldAojIENP
TkZJR19SRFMgaXMgbm90IHNldAojIENPTkZJR19USVBDIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRN
IGlzIG5vdCBzZXQKIyBDT05GSUdfTDJUUCBpcyBub3Qgc2V0CkNPTkZJR19TVFA9bQpDT05GSUdf
QlJJREdFPW0KQ09ORklHX0JSSURHRV9JR01QX1NOT09QSU5HPXkKIyBDT05GSUdfQlJJREdFX01S
UCBpcyBub3Qgc2V0CiMgQ09ORklHX0JSSURHRV9DRk0gaXMgbm90IHNldAojIENPTkZJR19ORVRf
RFNBIGlzIG5vdCBzZXQKIyBDT05GSUdfVkxBTl84MDIxUSBpcyBub3Qgc2V0CkNPTkZJR19MTEM9
bQojIENPTkZJR19MTEMyIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRBTEsgaXMgbm90IHNldAojIENP
TkZJR19YMjUgaXMgbm90IHNldAojIENPTkZJR19MQVBCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhP
TkVUIGlzIG5vdCBzZXQKIyBDT05GSUdfNkxPV1BBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0lFRUU4
MDIxNTQgaXMgbm90IHNldApDT05GSUdfTkVUX1NDSEVEPXkKCiMKIyBRdWV1ZWluZy9TY2hlZHVs
aW5nCiMKIyBDT05GSUdfTkVUX1NDSF9IVEIgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0hG
U0MgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1BSSU8gaXMgbm90IHNldAojIENPTkZJR19O
RVRfU0NIX01VTFRJUSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfUkVEIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX1NDSF9TRkIgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1NGUSBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfVEVRTCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hf
VEJGIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9DQlMgaXMgbm90IHNldAojIENPTkZJR19O
RVRfU0NIX0VURiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfVEFQUklPIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX1NDSF9HUkVEIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9ORVRFTSBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfRFJSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ND
SF9NUVBSSU8gaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1NLQlBSSU8gaXMgbm90IHNldAoj
IENPTkZJR19ORVRfU0NIX0NIT0tFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9RRlEgaXMg
bm90IHNldAojIENPTkZJR19ORVRfU0NIX0NPREVMIGlzIG5vdCBzZXQKQ09ORklHX05FVF9TQ0hf
RlFfQ09ERUw9eQojIENPTkZJR19ORVRfU0NIX0NBS0UgaXMgbm90IHNldAojIENPTkZJR19ORVRf
U0NIX0ZRIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9ISEYgaXMgbm90IHNldAojIENPTkZJ
R19ORVRfU0NIX1BJRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfUExVRyBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9TQ0hfRVRTIGlzIG5vdCBzZXQKQ09ORklHX05FVF9TQ0hfREVGQVVMVD15
CkNPTkZJR19ERUZBVUxUX0ZRX0NPREVMPXkKIyBDT05GSUdfREVGQVVMVF9QRklGT19GQVNUIGlz
IG5vdCBzZXQKQ09ORklHX0RFRkFVTFRfTkVUX1NDSD0iZnFfY29kZWwiCgojCiMgQ2xhc3NpZmlj
YXRpb24KIwojIENPTkZJR19ORVRfQ0xTX0JBU0lDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0NM
U19ST1VURTQgaXMgbm90IHNldAojIENPTkZJR19ORVRfQ0xTX0ZXIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUX0NMU19VMzIgaXMgbm90IHNldAojIENPTkZJR19ORVRfQ0xTX0ZMT1cgaXMgbm90IHNl
dAojIENPTkZJR19ORVRfQ0xTX0NHUk9VUCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9DTFNfQlBG
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0NMU19GTE9XRVIgaXMgbm90IHNldAojIENPTkZJR19O
RVRfQ0xTX01BVENIQUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0VNQVRDSCBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9DTFNfQUNUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9TQ0hfRklGTz15CiMg
Q09ORklHX0RDQiBpcyBub3Qgc2V0CkNPTkZJR19ETlNfUkVTT0xWRVI9bQojIENPTkZJR19CQVRN
QU5fQURWIGlzIG5vdCBzZXQKIyBDT05GSUdfT1BFTlZTV0lUQ0ggaXMgbm90IHNldApDT05GSUdf
VlNPQ0tFVFM9bQpDT05GSUdfVlNPQ0tFVFNfRElBRz1tCiMgQ09ORklHX1ZTT0NLRVRTX0xPT1BC
QUNLIGlzIG5vdCBzZXQKIyBDT05GSUdfVklSVElPX1ZTT0NLRVRTIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUTElOS19ESUFHIGlzIG5vdCBzZXQKIyBDT05GSUdfTVBMUyBpcyBub3Qgc2V0CiMgQ09O
RklHX05FVF9OU0ggaXMgbm90IHNldAojIENPTkZJR19IU1IgaXMgbm90IHNldAojIENPTkZJR19O
RVRfU1dJVENIREVWIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0wzX01BU1RFUl9ERVYgaXMgbm90
IHNldAojIENPTkZJR19RUlRSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX05DU0kgaXMgbm90IHNl
dApDT05GSUdfUENQVV9ERVZfUkVGQ05UPXkKQ09ORklHX01BWF9TS0JfRlJBR1M9MTcKQ09ORklH
X1JQUz15CkNPTkZJR19SRlNfQUNDRUw9eQpDT05GSUdfU09DS19SWF9RVUVVRV9NQVBQSU5HPXkK
Q09ORklHX1hQUz15CiMgQ09ORklHX0NHUk9VUF9ORVRfUFJJTyBpcyBub3Qgc2V0CkNPTkZJR19D
R1JPVVBfTkVUX0NMQVNTSUQ9eQpDT05GSUdfTkVUX1JYX0JVU1lfUE9MTD15CkNPTkZJR19CUUw9
eQpDT05GSUdfQlBGX1NUUkVBTV9QQVJTRVI9eQpDT05GSUdfTkVUX0ZMT1dfTElNSVQ9eQoKIwoj
IE5ldHdvcmsgdGVzdGluZwojCiMgQ09ORklHX05FVF9QS1RHRU4gaXMgbm90IHNldAojIGVuZCBv
ZiBOZXR3b3JrIHRlc3RpbmcKIyBlbmQgb2YgTmV0d29ya2luZyBvcHRpb25zCgojIENPTkZJR19I
QU1SQURJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTiBpcyBub3Qgc2V0CkNPTkZJR19CVD1tCkNP
TkZJR19CVF9CUkVEUj15CkNPTkZJR19CVF9SRkNPTU09bQpDT05GSUdfQlRfUkZDT01NX1RUWT15
CkNPTkZJR19CVF9CTkVQPW0KQ09ORklHX0JUX0JORVBfTUNfRklMVEVSPXkKQ09ORklHX0JUX0JO
RVBfUFJPVE9fRklMVEVSPXkKQ09ORklHX0JUX0hJRFA9bQpDT05GSUdfQlRfSFM9eQpDT05GSUdf
QlRfTEU9eQpDT05GSUdfQlRfTEVfTDJDQVBfRUNSRUQ9eQojIENPTkZJR19CVF9MRURTIGlzIG5v
dCBzZXQKQ09ORklHX0JUX01TRlRFWFQ9eQpDT05GSUdfQlRfQU9TUEVYVD15CkNPTkZJR19CVF9E
RUJVR0ZTPXkKIyBDT05GSUdfQlRfU0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdfQlRfRkVBVFVS
RV9ERUJVRz15CgojCiMgQmx1ZXRvb3RoIGRldmljZSBkcml2ZXJzCiMKQ09ORklHX0JUX0lOVEVM
PW0KQ09ORklHX0JUX0JDTT1tCkNPTkZJR19CVF9SVEw9bQpDT05GSUdfQlRfTVRLPW0KQ09ORklH
X0JUX0hDSUJUVVNCPW0KQ09ORklHX0JUX0hDSUJUVVNCX0FVVE9TVVNQRU5EPXkKQ09ORklHX0JU
X0hDSUJUVVNCX1BPTExfU1lOQz15CkNPTkZJR19CVF9IQ0lCVFVTQl9CQ009eQpDT05GSUdfQlRf
SENJQlRVU0JfTVRLPXkKQ09ORklHX0JUX0hDSUJUVVNCX1JUTD15CkNPTkZJR19CVF9IQ0lVQVJU
PW0KQ09ORklHX0JUX0hDSVVBUlRfSDQ9eQpDT05GSUdfQlRfSENJVUFSVF9CQ1NQPXkKQ09ORklH
X0JUX0hDSVVBUlRfQVRIM0s9eQpDT05GSUdfQlRfSENJVUFSVF9BRzZYWD15CkNPTkZJR19CVF9I
Q0lCQ00yMDNYPW0KIyBDT05GSUdfQlRfSENJQkNNNDM3NyBpcyBub3Qgc2V0CiMgQ09ORklHX0JU
X0hDSUJQQTEwWCBpcyBub3Qgc2V0CkNPTkZJR19CVF9IQ0lCRlVTQj1tCiMgQ09ORklHX0JUX0hD
SURUTDEgaXMgbm90IHNldAojIENPTkZJR19CVF9IQ0lCVDNDIGlzIG5vdCBzZXQKIyBDT05GSUdf
QlRfSENJQkxVRUNBUkQgaXMgbm90IHNldAojIENPTkZJR19CVF9IQ0lWSENJIGlzIG5vdCBzZXQK
Q09ORklHX0JUX01SVkw9bQpDT05GSUdfQlRfQVRIM0s9bQojIENPTkZJR19CVF9WSVJUSU8gaXMg
bm90IHNldAojIGVuZCBvZiBCbHVldG9vdGggZGV2aWNlIGRyaXZlcnMKCiMgQ09ORklHX0FGX1JY
UlBDIGlzIG5vdCBzZXQKIyBDT05GSUdfQUZfS0NNIGlzIG5vdCBzZXQKQ09ORklHX1NUUkVBTV9Q
QVJTRVI9eQojIENPTkZJR19NQ1RQIGlzIG5vdCBzZXQKQ09ORklHX1dJUkVMRVNTPXkKQ09ORklH
X0NGRzgwMjExPW0KIyBDT05GSUdfTkw4MDIxMV9URVNUTU9ERSBpcyBub3Qgc2V0CiMgQ09ORklH
X0NGRzgwMjExX0RFVkVMT1BFUl9XQVJOSU5HUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NGRzgwMjEx
X0NFUlRJRklDQVRJT05fT05VUyBpcyBub3Qgc2V0CkNPTkZJR19DRkc4MDIxMV9SRVFVSVJFX1NJ
R05FRF9SRUdEQj15CkNPTkZJR19DRkc4MDIxMV9VU0VfS0VSTkVMX1JFR0RCX0tFWVM9eQpDT05G
SUdfQ0ZHODAyMTFfREVGQVVMVF9QUz15CiMgQ09ORklHX0NGRzgwMjExX0RFQlVHRlMgaXMgbm90
IHNldApDT05GSUdfQ0ZHODAyMTFfQ1JEQV9TVVBQT1JUPXkKIyBDT05GSUdfQ0ZHODAyMTFfV0VY
VCBpcyBub3Qgc2V0CkNPTkZJR19DRkc4MDIxMV9LVU5JVF9URVNUPW0KQ09ORklHX01BQzgwMjEx
PW0KQ09ORklHX01BQzgwMjExX0hBU19SQz15CkNPTkZJR19NQUM4MDIxMV9SQ19NSU5TVFJFTD15
CkNPTkZJR19NQUM4MDIxMV9SQ19ERUZBVUxUX01JTlNUUkVMPXkKQ09ORklHX01BQzgwMjExX1JD
X0RFRkFVTFQ9Im1pbnN0cmVsX2h0IgpDT05GSUdfTUFDODAyMTFfS1VOSVRfVEVTVD1tCiMgQ09O
RklHX01BQzgwMjExX01FU0ggaXMgbm90IHNldApDT05GSUdfTUFDODAyMTFfTEVEUz15CiMgQ09O
RklHX01BQzgwMjExX01FU1NBR0VfVFJBQ0lORyBpcyBub3Qgc2V0CiMgQ09ORklHX01BQzgwMjEx
X0RFQlVHX01FTlUgaXMgbm90IHNldApDT05GSUdfTUFDODAyMTFfU1RBX0hBU0hfTUFYX1NJWkU9
MApDT05GSUdfUkZLSUxMPW0KQ09ORklHX1JGS0lMTF9MRURTPXkKIyBDT05GSUdfUkZLSUxMX0lO
UFVUIGlzIG5vdCBzZXQKQ09ORklHX05FVF85UD15CkNPTkZJR19ORVRfOVBfRkQ9eQpDT05GSUdf
TkVUXzlQX1ZJUlRJTz15CiMgQ09ORklHX05FVF85UF9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklH
X0NBSUYgaXMgbm90IHNldAojIENPTkZJR19DRVBIX0xJQiBpcyBub3Qgc2V0CiMgQ09ORklHX05G
QyBpcyBub3Qgc2V0CiMgQ09ORklHX1BTQU1QTEUgaXMgbm90IHNldAojIENPTkZJR19ORVRfSUZF
IGlzIG5vdCBzZXQKIyBDT05GSUdfTFdUVU5ORUwgaXMgbm90IHNldApDT05GSUdfRFNUX0NBQ0hF
PXkKQ09ORklHX0dST19DRUxMUz15CkNPTkZJR19TT0NLX1ZBTElEQVRFX1hNSVQ9eQpDT05GSUdf
TkVUX1NPQ0tfTVNHPXkKQ09ORklHX1BBR0VfUE9PTD15CiMgQ09ORklHX1BBR0VfUE9PTF9TVEFU
UyBpcyBub3Qgc2V0CkNPTkZJR19GQUlMT1ZFUj15CkNPTkZJR19FVEhUT09MX05FVExJTks9eQpD
T05GSUdfTkVUREVWX0FERFJfTElTVF9URVNUPW0KQ09ORklHX05FVF9URVNUPW0KCiMKIyBEZXZp
Y2UgRHJpdmVycwojCkNPTkZJR19IQVZFX1BDST15CkNPTkZJR19GT1JDRV9QQ0k9eQpDT05GSUdf
UENJPXkKQ09ORklHX1BDSV9ET01BSU5TPXkKQ09ORklHX1BDSV9TWVNDQUxMPXkKIyBDT05GSUdf
UENJRVBPUlRCVVMgaXMgbm90IHNldAojIENPTkZJR19QQ0lFQVNQTSBpcyBub3Qgc2V0CiMgQ09O
RklHX1BDSUVfUFRNIGlzIG5vdCBzZXQKQ09ORklHX1BDSV9NU0k9eQpDT05GSUdfUENJX01TSV9B
UkNIX0ZBTExCQUNLUz15CkNPTkZJR19QQ0lfUVVJUktTPXkKIyBDT05GSUdfUENJX0RFQlVHIGlz
IG5vdCBzZXQKIyBDT05GSUdfUENJX1NUVUIgaXMgbm90IHNldAojIENPTkZJR19QQ0lfSU9WIGlz
IG5vdCBzZXQKIyBDT05GSUdfUENJX1BSSSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9QQVNJRCBp
cyBub3Qgc2V0CkNPTkZJR19QQ0lfRFlOQU1JQ19PRl9OT0RFUz15CiMgQ09ORklHX1BDSUVfQlVT
X1RVTkVfT0ZGIGlzIG5vdCBzZXQKQ09ORklHX1BDSUVfQlVTX0RFRkFVTFQ9eQojIENPTkZJR19Q
Q0lFX0JVU19TQUZFIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9CVVNfUEVSRk9STUFOQ0UgaXMg
bm90IHNldAojIENPTkZJR19QQ0lFX0JVU19QRUVSMlBFRVIgaXMgbm90IHNldApDT05GSUdfVkdB
X0FSQj15CkNPTkZJR19WR0FfQVJCX01BWF9HUFVTPTQKIyBDT05GSUdfSE9UUExVR19QQ0kgaXMg
bm90IHNldAoKIwojIFBDSSBjb250cm9sbGVyIGRyaXZlcnMKIwojIENPTkZJR19QQ0lfRlRQQ0kx
MDAgaXMgbm90IHNldAojIENPTkZJR19QQ0lfSE9TVF9HRU5FUklDIGlzIG5vdCBzZXQKIyBDT05G
SUdfUENJRV9NSUNST0NISVBfSE9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfWElMSU5YIGlz
IG5vdCBzZXQKCiMKIyBDYWRlbmNlLWJhc2VkIFBDSWUgY29udHJvbGxlcnMKIwojIENPTkZJR19Q
Q0lFX0NBREVOQ0VfUExBVF9IT1NUIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ2FkZW5jZS1iYXNlZCBQ
Q0llIGNvbnRyb2xsZXJzCgojCiMgRGVzaWduV2FyZS1iYXNlZCBQQ0llIGNvbnRyb2xsZXJzCiMK
IyBDT05GSUdfUENJX01FU09OIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9EV19QTEFUX0hPU1Qg
aXMgbm90IHNldAojIGVuZCBvZiBEZXNpZ25XYXJlLWJhc2VkIFBDSWUgY29udHJvbGxlcnMKCiMK
IyBNb2JpdmVpbC1iYXNlZCBQQ0llIGNvbnRyb2xsZXJzCiMKIyBlbmQgb2YgTW9iaXZlaWwtYmFz
ZWQgUENJZSBjb250cm9sbGVycwojIGVuZCBvZiBQQ0kgY29udHJvbGxlciBkcml2ZXJzCgojCiMg
UENJIEVuZHBvaW50CiMKIyBDT05GSUdfUENJX0VORFBPSU5UIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
UENJIEVuZHBvaW50CgojCiMgUENJIHN3aXRjaCBjb250cm9sbGVyIGRyaXZlcnMKIwojIENPTkZJ
R19QQ0lfU1dfU1dJVENIVEVDIGlzIG5vdCBzZXQKIyBlbmQgb2YgUENJIHN3aXRjaCBjb250cm9s
bGVyIGRyaXZlcnMKCiMgQ09ORklHX0NYTF9CVVMgaXMgbm90IHNldApDT05GSUdfUENDQVJEPW0K
Q09ORklHX1BDTUNJQT1tCkNPTkZJR19QQ01DSUFfTE9BRF9DSVM9eQpDT05GSUdfQ0FSREJVUz15
CgojCiMgUEMtY2FyZCBicmlkZ2VzCiMKQ09ORklHX1lFTlRBPW0KQ09ORklHX1lFTlRBX08yPXkK
Q09ORklHX1lFTlRBX1JJQ09IPXkKQ09ORklHX1lFTlRBX1RJPXkKQ09ORklHX1lFTlRBX0VORV9U
VU5FPXkKQ09ORklHX1lFTlRBX1RPU0hJQkE9eQojIENPTkZJR19QRDY3MjkgaXMgbm90IHNldAoj
IENPTkZJR19JODIwOTIgaXMgbm90IHNldApDT05GSUdfUENDQVJEX05PTlNUQVRJQz15CiMgQ09O
RklHX1JBUElESU8gaXMgbm90IHNldAoKIwojIEdlbmVyaWMgRHJpdmVyIE9wdGlvbnMKIwojIENP
TkZJR19VRVZFTlRfSEVMUEVSIGlzIG5vdCBzZXQKQ09ORklHX0RFVlRNUEZTPXkKQ09ORklHX0RF
VlRNUEZTX01PVU5UPXkKQ09ORklHX0RFVlRNUEZTX1NBRkU9eQpDT05GSUdfU1RBTkRBTE9ORT15
CkNPTkZJR19QUkVWRU5UX0ZJUk1XQVJFX0JVSUxEPXkKCiMKIyBGaXJtd2FyZSBsb2FkZXIKIwpD
T05GSUdfRldfTE9BREVSPXkKQ09ORklHX0VYVFJBX0ZJUk1XQVJFPSIiCiMgQ09ORklHX0ZXX0xP
QURFUl9VU0VSX0hFTFBFUiBpcyBub3Qgc2V0CkNPTkZJR19GV19MT0FERVJfQ09NUFJFU1M9eQoj
IENPTkZJR19GV19MT0FERVJfQ09NUFJFU1NfWFogaXMgbm90IHNldApDT05GSUdfRldfTE9BREVS
X0NPTVBSRVNTX1pTVEQ9eQojIENPTkZJR19GV19VUExPQUQgaXMgbm90IHNldAojIGVuZCBvZiBG
aXJtd2FyZSBsb2FkZXIKCkNPTkZJR19BTExPV19ERVZfQ09SRURVTVA9eQojIENPTkZJR19ERUJV
R19EUklWRVIgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19ERVZSRVMgaXMgbm90IHNldAojIENP
TkZJR19ERUJVR19URVNUX0RSSVZFUl9SRU1PVkUgaXMgbm90IHNldAojIENPTkZJR19URVNUX0FT
WU5DX0RSSVZFUl9QUk9CRSBpcyBub3Qgc2V0CkNPTkZJR19ETV9LVU5JVF9URVNUPW0KQ09ORklH
X0RSSVZFUl9QRV9LVU5JVF9URVNUPW0KQ09ORklHX0dFTkVSSUNfQ1BVX0FVVE9QUk9CRT15CkNP
TkZJR19SRUdNQVA9eQpDT05GSUdfUkVHTUFQX0tVTklUPW0KIyBDT05GSUdfUkVHTUFQX0JVSUxE
IGlzIG5vdCBzZXQKQ09ORklHX1JFR01BUF9SQU09bQpDT05GSUdfRE1BX1NIQVJFRF9CVUZGRVI9
eQpDT05GSUdfRE1BX0ZFTkNFX1RSQUNFPXkKIyBDT05GSUdfRldfREVWTElOS19TWU5DX1NUQVRF
X1RJTUVPVVQgaXMgbm90IHNldAojIGVuZCBvZiBHZW5lcmljIERyaXZlciBPcHRpb25zCgojCiMg
QnVzIGRldmljZXMKIwojIENPTkZJR19NSElfQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfTUhJX0JV
U19FUCBpcyBub3Qgc2V0CiMgZW5kIG9mIEJ1cyBkZXZpY2VzCgojCiMgQ2FjaGUgRHJpdmVycwoj
CiMgZW5kIG9mIENhY2hlIERyaXZlcnMKCkNPTkZJR19DT05ORUNUT1I9eQpDT05GSUdfUFJPQ19F
VkVOVFM9eQoKIwojIEZpcm13YXJlIERyaXZlcnMKIwoKIwojIEFSTSBTeXN0ZW0gQ29udHJvbCBh
bmQgTWFuYWdlbWVudCBJbnRlcmZhY2UgUHJvdG9jb2wKIwojIGVuZCBvZiBBUk0gU3lzdGVtIENv
bnRyb2wgYW5kIE1hbmFnZW1lbnQgSW50ZXJmYWNlIFByb3RvY29sCgpDT05GSUdfRklSTVdBUkVf
TUVNTUFQPXkKQ09ORklHX0ZXX0NGR19TWVNGUz1tCiMgQ09ORklHX0ZXX0NGR19TWVNGU19DTURM
SU5FIGlzIG5vdCBzZXQKIyBDT05GSUdfR09PR0xFX0ZJUk1XQVJFIGlzIG5vdCBzZXQKCiMKIyBR
dWFsY29tbSBmaXJtd2FyZSBkcml2ZXJzCiMKIyBlbmQgb2YgUXVhbGNvbW0gZmlybXdhcmUgZHJp
dmVycwoKIwojIFRlZ3JhIGZpcm13YXJlIGRyaXZlcgojCiMgZW5kIG9mIFRlZ3JhIGZpcm13YXJl
IGRyaXZlcgojIGVuZCBvZiBGaXJtd2FyZSBEcml2ZXJzCgojIENPTkZJR19HTlNTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTVREIGlzIG5vdCBzZXQKQ09ORklHX0RUQz15CkNPTkZJR19PRj15CiMgQ09O
RklHX09GX1VOSVRURVNUIGlzIG5vdCBzZXQKQ09ORklHX09GX0ZMQVRUUkVFPXkKQ09ORklHX09G
X0VBUkxZX0ZMQVRUUkVFPXkKQ09ORklHX09GX0tPQko9eQpDT05GSUdfT0ZfRFlOQU1JQz15CkNP
TkZJR19PRl9BRERSRVNTPXkKQ09ORklHX09GX0lSUT15CkNPTkZJR19PRl9SRVNFUlZFRF9NRU09
eQojIENPTkZJR19PRl9PVkVSTEFZIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfTUlHSFRfSEFWRV9Q
Q19QQVJQT1JUPXkKIyBDT05GSUdfUEFSUE9SVCBpcyBub3Qgc2V0CkNPTkZJR19CTEtfREVWPXkK
IyBDT05GSUdfQkxLX0RFVl9OVUxMX0JMSyBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfRkQg
aXMgbm90IHNldAojIENPTkZJR19NQUNfRkxPUFBZIGlzIG5vdCBzZXQKQ09ORklHX0NEUk9NPXkK
IyBDT05GSUdfQkxLX0RFVl9QQ0lFU1NEX01USVAzMlhYIGlzIG5vdCBzZXQKIyBDT05GSUdfWlJB
TSBpcyBub3Qgc2V0CkNPTkZJR19CTEtfREVWX0xPT1A9bQpDT05GSUdfQkxLX0RFVl9MT09QX01J
Tl9DT1VOVD04CiMgQ09ORklHX0JMS19ERVZfRFJCRCBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19E
RVZfTkJEIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl9SQU0gaXMgbm90IHNldAojIENPTkZJ
R19DRFJPTV9QS1RDRFZEIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRBX09WRVJfRVRIIGlzIG5vdCBz
ZXQKQ09ORklHX1ZJUlRJT19CTEs9eQojIENPTkZJR19CTEtfREVWX1JCRCBpcyBub3Qgc2V0CiMg
Q09ORklHX0JMS19ERVZfVUJMSyBpcyBub3Qgc2V0CgojCiMgTlZNRSBTdXBwb3J0CiMKIyBDT05G
SUdfQkxLX0RFVl9OVk1FIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRV9GQyBpcyBub3Qgc2V0CiMg
Q09ORklHX05WTUVfVENQIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRV9UQVJHRVQgaXMgbm90IHNl
dAojIGVuZCBvZiBOVk1FIFN1cHBvcnQKCiMKIyBNaXNjIGRldmljZXMKIwojIENPTkZJR19BRDUy
NVhfRFBPVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RVTU1ZX0lSUSBpcyBub3Qgc2V0CiMgQ09ORklH
X1BIQU5UT00gaXMgbm90IHNldAojIENPTkZJR19USUZNX0NPUkUgaXMgbm90IHNldAojIENPTkZJ
R19JQ1M5MzJTNDAxIGlzIG5vdCBzZXQKIyBDT05GSUdfRU5DTE9TVVJFX1NFUlZJQ0VTIGlzIG5v
dCBzZXQKIyBDT05GSUdfSFBfSUxPIGlzIG5vdCBzZXQKIyBDT05GSUdfQVBEUzk4MDJBTFMgaXMg
bm90IHNldAojIENPTkZJR19JU0wyOTAwMyBpcyBub3Qgc2V0CiMgQ09ORklHX0lTTDI5MDIwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UU0wyNTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19CSDE3NzAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FQRFM5OTBYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSE1DNjM1MiBpcyBub3Qgc2V0CiMgQ09ORklHX0RTMTY4MiBpcyBub3Qgc2V0
CiMgQ09ORklHX1NSQU0gaXMgbm90IHNldAojIENPTkZJR19EV19YREFUQV9QQ0lFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUENJX0VORFBPSU5UX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19YSUxJTlhf
U0RGRUMgaXMgbm90IHNldAojIENPTkZJR19PUEVOX0RJQ0UgaXMgbm90IHNldAojIENPTkZJR19W
Q1BVX1NUQUxMX0RFVEVDVE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfTlNNIGlzIG5vdCBzZXQKIyBD
T05GSUdfQzJQT1JUIGlzIG5vdCBzZXQKCiMKIyBFRVBST00gc3VwcG9ydAojCiMgQ09ORklHX0VF
UFJPTV9BVDI0IGlzIG5vdCBzZXQKIyBDT05GSUdfRUVQUk9NX01BWDY4NzUgaXMgbm90IHNldAoj
IENPTkZJR19FRVBST01fOTNDWDYgaXMgbm90IHNldAojIENPTkZJR19FRVBST01fSURUXzg5SFBF
U1ggaXMgbm90IHNldAojIENPTkZJR19FRVBST01fRUUxMDA0IGlzIG5vdCBzZXQKIyBlbmQgb2Yg
RUVQUk9NIHN1cHBvcnQKCiMgQ09ORklHX0NCNzEwX0NPUkUgaXMgbm90IHNldAoKIwojIFRleGFz
IEluc3RydW1lbnRzIHNoYXJlZCB0cmFuc3BvcnQgbGluZSBkaXNjaXBsaW5lCiMKIyBlbmQgb2Yg
VGV4YXMgSW5zdHJ1bWVudHMgc2hhcmVkIHRyYW5zcG9ydCBsaW5lIGRpc2NpcGxpbmUKCiMgQ09O
RklHX1NFTlNPUlNfTElTM19JMkMgaXMgbm90IHNldAojIENPTkZJR19BTFRFUkFfU1RBUEwgaXMg
bm90IHNldAojIENPTkZJR19FQ0hPIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNNX1ZLIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUlTQ19BTENPUl9QQ0kgaXMgbm90IHNldAojIENPTkZJR19NSVNDX1JUU1hf
UENJIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlTQ19SVFNYX1VTQiBpcyBub3Qgc2V0CkNPTkZJR19Q
VlBBTklDPXkKQ09ORklHX1BWUEFOSUNfTU1JTz1tCkNPTkZJR19QVlBBTklDX1BDST1tCiMgZW5k
IG9mIE1pc2MgZGV2aWNlcwoKIwojIFNDU0kgZGV2aWNlIHN1cHBvcnQKIwpDT05GSUdfU0NTSV9N
T0Q9eQojIENPTkZJR19SQUlEX0FUVFJTIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfQ09NTU9OPXkK
Q09ORklHX1NDU0k9eQpDT05GSUdfU0NTSV9ETUE9eQojIENPTkZJR19TQ1NJX1BST0NfRlMgaXMg
bm90IHNldAoKIwojIFNDU0kgc3VwcG9ydCB0eXBlIChkaXNrLCB0YXBlLCBDRC1ST00pCiMKQ09O
RklHX0JMS19ERVZfU0Q9eQojIENPTkZJR19DSFJfREVWX1NUIGlzIG5vdCBzZXQKQ09ORklHX0JM
S19ERVZfU1I9eQpDT05GSUdfQ0hSX0RFVl9TRz1tCkNPTkZJR19CTEtfREVWX0JTRz15CiMgQ09O
RklHX0NIUl9ERVZfU0NIIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfQ09OU1RBTlRTPXkKIyBDT05G
SUdfU0NTSV9MT0dHSU5HIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfU0NBTl9BU1lOQz15CgojCiMg
U0NTSSBUcmFuc3BvcnRzCiMKIyBDT05GSUdfU0NTSV9TUElfQVRUUlMgaXMgbm90IHNldAojIENP
TkZJR19TQ1NJX0ZDX0FUVFJTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9JU0NTSV9BVFRSUyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfU0FTX0FUVFJTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NT
SV9TQVNfTElCU0FTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9TUlBfQVRUUlMgaXMgbm90IHNl
dAojIGVuZCBvZiBTQ1NJIFRyYW5zcG9ydHMKCkNPTkZJR19TQ1NJX0xPV0xFVkVMPXkKIyBDT05G
SUdfSVNDU0lfVENQIGlzIG5vdCBzZXQKIyBDT05GSUdfSVNDU0lfQk9PVF9TWVNGUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NDU0lfQ1hHQjNfSVNDU0kgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0NY
R0I0X0lTQ1NJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9CTlgyX0lTQ1NJIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkUySVNDU0kgaXMgbm90IHNldAojIENPTkZJR19CTEtfREVWXzNXX1hYWFhfUkFJ
RCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSFBTQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lf
M1dfOVhYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfM1dfU0FTIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0NTSV9BQ0FSRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQUFDUkFJRCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NDU0lfQUlDN1hYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQUlDNzlYWCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQUlDOTRYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lf
TVZTQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX01WVU1JIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0NTSV9BRFZBTlNZUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQVJDTVNSIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NTSV9FU0FTMlIgaXMgbm90IHNldAojIENPTkZJR19NRUdBUkFJRF9ORVdHRU4g
aXMgbm90IHNldAojIENPTkZJR19NRUdBUkFJRF9MRUdBQ1kgaXMgbm90IHNldAojIENPTkZJR19N
RUdBUkFJRF9TQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX01QVDNTQVMgaXMgbm90IHNldAoj
IENPTkZJR19TQ1NJX01QVDJTQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX01QSTNNUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NDU0lfU01BUlRQUUkgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0hQ
VElPUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQlVTTE9HSUMgaXMgbm90IHNldAojIENPTkZJ
R19TQ1NJX01ZUkIgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1NOSUMgaXMgbm90IHNldAojIENP
TkZJR19TQ1NJX0RNWDMxOTFEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9GRE9NQUlOX1BDSSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSVBTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9JTklU
SU8gaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0lOSUExMDAgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX1NURVggaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1NZTTUzQzhYWF8yIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NTSV9JUFIgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1FMT0dJQ18xMjgwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0NTSV9RTEFfSVNDU0kgaXMgbm90IHNldAojIENPTkZJR19TQ1NJ
X0RDMzk1eCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQU01M0M5NzQgaXMgbm90IHNldAojIENP
TkZJR19TQ1NJX05TUDMyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9XRDcxOVggaXMgbm90IHNl
dAojIENPTkZJR19TQ1NJX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NRVNIIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0NTSV9NQUM1M0M5NCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfUE1D
UkFJRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfUE04MDAxIGlzIG5vdCBzZXQKQ09ORklHX1ND
U0lfVklSVElPPW0KIyBDT05GSUdfU0NTSV9MT1dMRVZFTF9QQ01DSUEgaXMgbm90IHNldAojIENP
TkZJR19TQ1NJX0RIIGlzIG5vdCBzZXQKIyBlbmQgb2YgU0NTSSBkZXZpY2Ugc3VwcG9ydAoKQ09O
RklHX0FUQT15CkNPTkZJR19TQVRBX0hPU1Q9eQpDT05GSUdfQVRBX1ZFUkJPU0VfRVJST1I9eQoj
IENPTkZJR19BVEFfRk9SQ0UgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1BNUCBpcyBub3Qgc2V0
CgojCiMgQ29udHJvbGxlcnMgd2l0aCBub24tU0ZGIG5hdGl2ZSBpbnRlcmZhY2UKIwojIENPTkZJ
R19TQVRBX0FIQ0kgaXMgbm90IHNldAojIENPTkZJR19TQVRBX0FIQ0lfUExBVEZPUk0gaXMgbm90
IHNldAojIENPTkZJR19BSENJX0RXQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FIQ0lfQ0VWQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NBVEFfSU5JQzE2MlggaXMgbm90IHNldAojIENPTkZJR19TQVRBX0FD
QVJEX0FIQ0kgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1NJTDI0IGlzIG5vdCBzZXQKQ09ORklH
X0FUQV9TRkY9eQoKIwojIFNGRiBjb250cm9sbGVycyB3aXRoIGN1c3RvbSBETUEgaW50ZXJmYWNl
CiMKIyBDT05GSUdfUERDX0FETUEgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1FTVE9SIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0FUQV9TWDQgaXMgbm90IHNldApDT05GSUdfQVRBX0JNRE1BPXkKCiMK
IyBTQVRBIFNGRiBjb250cm9sbGVycyB3aXRoIEJNRE1BCiMKIyBDT05GSUdfQVRBX1BJSVggaXMg
bm90IHNldAojIENPTkZJR19TQVRBX01WIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9OViBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NBVEFfUFJPTUlTRSBpcyBub3Qgc2V0CkNPTkZJR19TQVRBX1NJTD15
CiMgQ09ORklHX1NBVEFfU0lTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9TVlcgaXMgbm90IHNl
dAojIENPTkZJR19TQVRBX1VMSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfVklBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0FUQV9WSVRFU1NFIGlzIG5vdCBzZXQKCiMKIyBQQVRBIFNGRiBjb250cm9s
bGVycyB3aXRoIEJNRE1BCiMKIyBDT05GSUdfUEFUQV9BTEkgaXMgbm90IHNldAojIENPTkZJR19Q
QVRBX0FNRCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfQVJUT1AgaXMgbm90IHNldAojIENPTkZJ
R19QQVRBX0FUSUlYUCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfQVRQODY3WCBpcyBub3Qgc2V0
CiMgQ09ORklHX1BBVEFfQ01ENjRYIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9DWVBSRVNTIGlz
IG5vdCBzZXQKIyBDT05GSUdfUEFUQV9FRkFSIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9IUFQz
NjYgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0hQVDM3WCBpcyBub3Qgc2V0CiMgQ09ORklHX1BB
VEFfSFBUM1gyTiBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfSFBUM1gzIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEFUQV9JVDgyMTMgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0lUODIxWCBpcyBub3Qg
c2V0CiMgQ09ORklHX1BBVEFfSk1JQ1JPTiBpcyBub3Qgc2V0CkNPTkZJR19QQVRBX01BQ0lPPXkK
IyBDT05GSUdfUEFUQV9NQVJWRUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9ORVRDRUxMIGlz
IG5vdCBzZXQKIyBDT05GSUdfUEFUQV9OSU5KQTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9O
Uzg3NDE1IGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9PTERQSUlYIGlzIG5vdCBzZXQKIyBDT05G
SUdfUEFUQV9PUFRJRE1BIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9QREMyMDI3WCBpcyBub3Qg
c2V0CiMgQ09ORklHX1BBVEFfUERDX09MRCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfUkFESVNZ
UyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfUkRDIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9T
Q0ggaXMgbm90IHNldAojIENPTkZJR19QQVRBX1NFUlZFUldPUktTIGlzIG5vdCBzZXQKIyBDT05G
SUdfUEFUQV9TSUw2ODAgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1NJUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1BBVEFfVE9TSElCQSBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfVFJJRkxFWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BBVEFfVklBIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9XSU5CT05E
IGlzIG5vdCBzZXQKCiMKIyBQSU8tb25seSBTRkYgY29udHJvbGxlcnMKIwojIENPTkZJR19QQVRB
X0NNRDY0MF9QQ0kgaXMgbm90IHNldAojIENPTkZJR19QQVRBX01QSUlYIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEFUQV9OUzg3NDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9PUFRJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEFUQV9QQ01DSUEgaXMgbm90IHNldAojIENPTkZJR19QQVRBX09GX1BMQVRG
T1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9SWjEwMDAgaXMgbm90IHNldAoKIwojIEdlbmVy
aWMgZmFsbGJhY2sgLyBsZWdhY3kgZHJpdmVycwojCiMgQ09ORklHX0FUQV9HRU5FUklDIGlzIG5v
dCBzZXQKIyBDT05GSUdfUEFUQV9MRUdBQ1kgaXMgbm90IHNldApDT05GSUdfTUQ9eQojIENPTkZJ
R19CTEtfREVWX01EIGlzIG5vdCBzZXQKIyBDT05GSUdfTURfQklUTUFQX0ZJTEUgaXMgbm90IHNl
dAojIENPTkZJR19CQ0FDSEUgaXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9ETV9CVUlMVElOPXkK
Q09ORklHX0JMS19ERVZfRE09bQpDT05GSUdfRE1fREVCVUc9eQpDT05GSUdfRE1fQlVGSU89bQpD
T05GSUdfRE1fREVCVUdfQkxPQ0tfTUFOQUdFUl9MT0NLSU5HPXkKIyBDT05GSUdfRE1fREVCVUdf
QkxPQ0tfU1RBQ0tfVFJBQ0lORyBpcyBub3Qgc2V0CkNPTkZJR19ETV9CSU9fUFJJU09OPW0KQ09O
RklHX0RNX1BFUlNJU1RFTlRfREFUQT1tCiMgQ09ORklHX0RNX1VOU1RSSVBFRCBpcyBub3Qgc2V0
CkNPTkZJR19ETV9DUllQVD1tCiMgQ09ORklHX0RNX1NOQVBTSE9UIGlzIG5vdCBzZXQKQ09ORklH
X0RNX1RISU5fUFJPVklTSU9OSU5HPW0KIyBDT05GSUdfRE1fQ0FDSEUgaXMgbm90IHNldAojIENP
TkZJR19ETV9XUklURUNBQ0hFIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fRVJBIGlzIG5vdCBzZXQK
IyBDT05GSUdfRE1fQ0xPTkUgaXMgbm90IHNldAojIENPTkZJR19ETV9NSVJST1IgaXMgbm90IHNl
dAojIENPTkZJR19ETV9SQUlEIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fWkVSTyBpcyBub3Qgc2V0
CiMgQ09ORklHX0RNX01VTFRJUEFUSCBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0RFTEFZIGlzIG5v
dCBzZXQKIyBDT05GSUdfRE1fRFVTVCBpcyBub3Qgc2V0CkNPTkZJR19ETV9VRVZFTlQ9eQojIENP
TkZJR19ETV9GTEFLRVkgaXMgbm90IHNldAojIENPTkZJR19ETV9WRVJJVFkgaXMgbm90IHNldAoj
IENPTkZJR19ETV9TV0lUQ0ggaXMgbm90IHNldAojIENPTkZJR19ETV9MT0dfV1JJVEVTIGlzIG5v
dCBzZXQKIyBDT05GSUdfRE1fSU5URUdSSVRZIGlzIG5vdCBzZXQKIyBDT05GSUdfVEFSR0VUX0NP
UkUgaXMgbm90IHNldAojIENPTkZJR19GVVNJT04gaXMgbm90IHNldAoKIwojIElFRUUgMTM5NCAo
RmlyZVdpcmUpIHN1cHBvcnQKIwpDT05GSUdfRklSRVdJUkU9bQpDT05GSUdfRklSRVdJUkVfS1VO
SVRfVUFQSV9URVNUPW0KQ09ORklHX0ZJUkVXSVJFX0tVTklUX0RFVklDRV9BVFRSSUJVVEVfVEVT
VD1tCkNPTkZJR19GSVJFV0lSRV9PSENJPW0KQ09ORklHX0ZJUkVXSVJFX1NCUDI9bQpDT05GSUdf
RklSRVdJUkVfTkVUPW0KIyBDT05GSUdfRklSRVdJUkVfTk9TWSBpcyBub3Qgc2V0CiMgZW5kIG9m
IElFRUUgMTM5NCAoRmlyZVdpcmUpIHN1cHBvcnQKCkNPTkZJR19NQUNJTlRPU0hfRFJJVkVSUz15
CkNPTkZJR19BREI9eQojIENPTkZJR19BREJfQ1VEQSBpcyBub3Qgc2V0CkNPTkZJR19BREJfUE1V
PXkKQ09ORklHX0FEQl9QTVVfRVZFTlQ9eQpDT05GSUdfQURCX1BNVV9MRUQ9eQojIENPTkZJR19B
REJfUE1VX0xFRF9ESVNLIGlzIG5vdCBzZXQKQ09ORklHX1BNQUNfQVBNX0VNVT1tCkNPTkZJR19Q
TUFDX01FRElBQkFZPXkKIyBDT05GSUdfUE1BQ19CQUNLTElHSFQgaXMgbm90IHNldApDT05GSUdf
SU5QVVRfQURCSElEPXkKQ09ORklHX01BQ19FTVVNT1VTRUJUTj1tCkNPTkZJR19USEVSTV9XSU5E
VFVOTkVMPW0KQ09ORklHX1RIRVJNX0FEVDc0Nlg9bQpDT05GSUdfV0lOREZBUk09bQojIENPTkZJ
R19QTUFDX1JBQ0tNRVRFUiBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0FNUz1tCkNPTkZJR19T
RU5TT1JTX0FNU19QTVU9eQpDT05GSUdfU0VOU09SU19BTVNfSTJDPXkKQ09ORklHX05FVERFVklD
RVM9eQpDT05GSUdfTkVUX0NPUkU9eQojIENPTkZJR19CT05ESU5HIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFVNTVkgaXMgbm90IHNldApDT05GSUdfV0lSRUdVQVJEPW0KIyBDT05GSUdfV0lSRUdVQVJE
X0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfRVFVQUxJWkVSIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX0ZDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1RFQU0gaXMgbm90IHNldAojIENPTkZJR19N
QUNWTEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWTEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfVlhM
QU4gaXMgbm90IHNldAojIENPTkZJR19HRU5FVkUgaXMgbm90IHNldAojIENPTkZJR19CQVJFVURQ
IGlzIG5vdCBzZXQKIyBDT05GSUdfR1RQIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFDU0VDIGlzIG5v
dCBzZXQKQ09ORklHX05FVENPTlNPTEU9eQojIENPTkZJR19ORVRDT05TT0xFX0VYVEVOREVEX0xP
RyBpcyBub3Qgc2V0CkNPTkZJR19ORVRQT0xMPXkKQ09ORklHX05FVF9QT0xMX0NPTlRST0xMRVI9
eQpDT05GSUdfVFVOPW0KIyBDT05GSUdfVFVOX1ZORVRfQ1JPU1NfTEUgaXMgbm90IHNldAojIENP
TkZJR19WRVRIIGlzIG5vdCBzZXQKQ09ORklHX1ZJUlRJT19ORVQ9eQojIENPTkZJR19OTE1PTiBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVEtJVCBpcyBub3Qgc2V0CkNPTkZJR19TVU5HRU1fUEhZPXkK
IyBDT05GSUdfQVJDTkVUIGlzIG5vdCBzZXQKQ09ORklHX0VUSEVSTkVUPXkKIyBDT05GSUdfTkVU
X1ZFTkRPUl8zQ09NIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9BREFQVEVDIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9BR0VSRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9W
RU5ET1JfQUxBQ1JJVEVDSCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQUxURU9OIGlz
IG5vdCBzZXQKIyBDT05GSUdfQUxURVJBX1RTRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5E
T1JfQU1BWk9OIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9BTUQgaXMgbm90IHNldAoj
IENPTkZJR19ORVRfVkVORE9SX0FQUExFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9B
UVVBTlRJQSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQVJDIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX1ZFTkRPUl9BU0lYIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9BVEhF
Uk9TIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9CUk9BRENPTSBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9WRU5ET1JfQ0FERU5DRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1Jf
Q0FWSVVNIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9DSEVMU0lPIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX1ZFTkRPUl9DSVNDTyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1Jf
Q09SVElOQSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfREFWSUNPTSBpcyBub3Qgc2V0
CiMgQ09ORklHX0RORVQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0RFQyBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVF9WRU5ET1JfRExJTksgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVO
RE9SX0VNVUxFWCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfRU5HTEVERVIgaXMgbm90
IHNldAojIENPTkZJR19ORVRfVkVORE9SX0VaQ0hJUCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9W
RU5ET1JfRlVKSVRTVSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfRlVOR0lCTEUgaXMg
bm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0dPT0dMRSBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfSFVBV0VJIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9JTlRFTCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0pNRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfTElURVgg
aXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX01BUlZFTEwgaXMgbm90IHNldAojIENPTkZJ
R19ORVRfVkVORE9SX01FTExBTk9YIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9NSUNS
RUwgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX01JQ1JPQ0hJUCBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9WRU5ET1JfTUlDUk9TRU1JIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRP
Ul9NSUNST1NPRlQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX01ZUkkgaXMgbm90IHNl
dAojIENPTkZJR19GRUFMTlggaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX05JIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9OQVRTRU1JIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1ZFTkRPUl9ORVRFUklPTiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfTkVUUk9OT01F
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9OVklESUEgaXMgbm90IHNldAojIENPTkZJ
R19ORVRfVkVORE9SX09LSSBpcyBub3Qgc2V0CiMgQ09ORklHX0VUSE9DIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX1ZFTkRPUl9QQUNLRVRfRU5HSU5FUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9W
RU5ET1JfUEVOU0FORE8gaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1FMT0dJQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQlJPQ0FERSBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfUVVBTENPTU0gaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1JEQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfUkVBTFRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfUkVORVNBUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfUk9DS0VSIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TQU1TVU5HIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX1ZFTkRPUl9TRUVRIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TSUxBTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfU0lTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZF
TkRPUl9TT0xBUkZMQVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TTVNDIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TT0NJT05FWFQgaXMgbm90IHNldAojIENPTkZJR19O
RVRfVkVORE9SX1NUTUlDUk8gaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9TVU49eQojIENP
TkZJR19IQVBQWU1FQUwgaXMgbm90IHNldApDT05GSUdfU1VOR0VNPXkKIyBDT05GSUdfQ0FTU0lO
SSBpcyBub3Qgc2V0CiMgQ09ORklHX05JVSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1Jf
U1lOT1BTWVMgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1RFSFVUSSBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9WRU5ET1JfVEkgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1ZF
UlRFWENPTSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfVklBIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX1ZFTkRPUl9XQU5HWFVOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9X
SVpORVQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1hJTElOWCBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9WRU5ET1JfWElSQ09NIGlzIG5vdCBzZXQKIyBDT05GSUdfRkRESSBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJUFBJIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZTElCIGlzIG5vdCBzZXQK
IyBDT05GSUdfUFNFX0NPTlRST0xMRVIgaXMgbm90IHNldAojIENPTkZJR19NRElPX0RFVklDRSBp
cyBub3Qgc2V0CgojCiMgUENTIGRldmljZSBkcml2ZXJzCiMKIyBlbmQgb2YgUENTIGRldmljZSBk
cml2ZXJzCgojIENPTkZJR19QUFAgaXMgbm90IHNldAojIENPTkZJR19TTElQIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX05FVF9EUklWRVJTIGlzIG5vdCBzZXQKQ09ORklHX1dMQU49eQojIENPTkZJ
R19XTEFOX1ZFTkRPUl9BRE1URUsgaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9BVEgg
aXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9BVE1FTCBpcyBub3Qgc2V0CkNPTkZJR19X
TEFOX1ZFTkRPUl9CUk9BRENPTT15CiMgQ09ORklHX0I0MyBpcyBub3Qgc2V0CkNPTkZJR19CNDNM
RUdBQ1k9bQpDT05GSUdfQjQzTEVHQUNZX1BDSV9BVVRPU0VMRUNUPXkKQ09ORklHX0I0M0xFR0FD
WV9QQ0lDT1JFX0FVVE9TRUxFQ1Q9eQpDT05GSUdfQjQzTEVHQUNZX0xFRFM9eQpDT05GSUdfQjQz
TEVHQUNZX0hXUk5HPXkKQ09ORklHX0I0M0xFR0FDWV9ERUJVRz15CkNPTkZJR19CNDNMRUdBQ1lf
RE1BPXkKQ09ORklHX0I0M0xFR0FDWV9QSU89eQpDT05GSUdfQjQzTEVHQUNZX0RNQV9BTkRfUElP
X01PREU9eQojIENPTkZJR19CNDNMRUdBQ1lfRE1BX01PREUgaXMgbm90IHNldAojIENPTkZJR19C
NDNMRUdBQ1lfUElPX01PREUgaXMgbm90IHNldAojIENPTkZJR19CUkNNU01BQyBpcyBub3Qgc2V0
CiMgQ09ORklHX0JSQ01GTUFDIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xBTl9WRU5ET1JfSU5URUwg
aXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9JTlRFUlNJTCBpcyBub3Qgc2V0CiMgQ09O
RklHX1dMQU5fVkVORE9SX01BUlZFTEwgaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9N
RURJQVRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX01JQ1JPQ0hJUCBpcyBub3Qg
c2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX1BVUkVMSUZJIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xB
Tl9WRU5ET1JfUkFMSU5LIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX1JFQUxURUs9eQoj
IENPTkZJR19SVEw4MTgwIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRMODE4NyBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUTF9DQVJEUyBpcyBub3Qgc2V0CkNPTkZJR19SVEw4WFhYVT1tCiMgQ09ORklHX1JU
TDhYWFhVX1VOVEVTVEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRXODggaXMgbm90IHNldAojIENP
TkZJR19SVFc4OSBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX1JTSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1dMQU5fVkVORE9SX1NJTEFCUyBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVO
RE9SX1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xBTl9WRU5ET1JfVEkgaXMgbm90IHNldAojIENP
TkZJR19XTEFOX1ZFTkRPUl9aWURBUyBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX1FV
QU5URU5OQSBpcyBub3Qgc2V0CiMgQ09ORklHX01BQzgwMjExX0hXU0lNIGlzIG5vdCBzZXQKIyBD
T05GSUdfVklSVF9XSUZJIGlzIG5vdCBzZXQKIyBDT05GSUdfV0FOIGlzIG5vdCBzZXQKCiMKIyBX
aXJlbGVzcyBXQU4KIwojIENPTkZJR19XV0FOIGlzIG5vdCBzZXQKIyBlbmQgb2YgV2lyZWxlc3Mg
V0FOCgojIENPTkZJR19WTVhORVQzIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUREVWU0lNIGlzIG5v
dCBzZXQKQ09ORklHX05FVF9GQUlMT1ZFUj15CiMgQ09ORklHX0lTRE4gaXMgbm90IHNldAoKIwoj
IElucHV0IGRldmljZSBzdXBwb3J0CiMKQ09ORklHX0lOUFVUPXkKQ09ORklHX0lOUFVUX0xFRFM9
eQpDT05GSUdfSU5QVVRfRkZfTUVNTEVTUz1tCiMgQ09ORklHX0lOUFVUX1NQQVJTRUtNQVAgaXMg
bm90IHNldAojIENPTkZJR19JTlBVVF9NQVRSSVhLTUFQIGlzIG5vdCBzZXQKCiMKIyBVc2VybGFu
ZCBpbnRlcmZhY2VzCiMKIyBDT05GSUdfSU5QVVRfTU9VU0VERVYgaXMgbm90IHNldApDT05GSUdf
SU5QVVRfSk9ZREVWPW0KQ09ORklHX0lOUFVUX0VWREVWPXkKIyBDT05GSUdfSU5QVVRfRVZCVUcg
aXMgbm90IHNldApDT05GSUdfSU5QVVRfS1VOSVRfVEVTVD1tCiMgQ09ORklHX0lOUFVUX0FQTVBP
V0VSIGlzIG5vdCBzZXQKCiMKIyBJbnB1dCBEZXZpY2UgRHJpdmVycwojCiMgQ09ORklHX0lOUFVU
X0tFWUJPQVJEIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX01PVVNFPXkKIyBDT05GSUdfTU9VU0Vf
UFMyIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfU0VSSUFMIGlzIG5vdCBzZXQKQ09ORklHX01P
VVNFX0FQUExFVE9VQ0g9bQojIENPTkZJR19NT1VTRV9CQ001OTc0IGlzIG5vdCBzZXQKIyBDT05G
SUdfTU9VU0VfQ1lBUEEgaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9FTEFOX0kyQyBpcyBub3Qg
c2V0CiMgQ09ORklHX01PVVNFX1ZTWFhYQUEgaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9TWU5B
UFRJQ1NfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfU1lOQVBUSUNTX1VTQiBpcyBub3Qg
c2V0CkNPTkZJR19JTlBVVF9KT1lTVElDSz15CiMgQ09ORklHX0pPWVNUSUNLX0FOQUxPRyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX0EzRCBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNL
X0FESSBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX0NPQlJBIGlzIG5vdCBzZXQKIyBDT05G
SUdfSk9ZU1RJQ0tfR0YySyBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX0dSSVAgaXMgbm90
IHNldAojIENPTkZJR19KT1lTVElDS19HUklQX01QIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJ
Q0tfR1VJTExFTU9UIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfSU5URVJBQ1QgaXMgbm90
IHNldAojIENPTkZJR19KT1lTVElDS19TSURFV0lOREVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9Z
U1RJQ0tfVE1EQyBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX0lGT1JDRSBpcyBub3Qgc2V0
CiMgQ09ORklHX0pPWVNUSUNLX1dBUlJJT1IgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19N
QUdFTExBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX1NQQUNFT1JCIGlzIG5vdCBzZXQK
IyBDT05GSUdfSk9ZU1RJQ0tfU1BBQ0VCQUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tf
U1RJTkdFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX1RXSURKT1kgaXMgbm90IHNldAoj
IENPTkZJR19KT1lTVElDS19aSEVOSFVBIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfQVM1
MDExIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfSk9ZRFVNUCBpcyBub3Qgc2V0CkNPTkZJ
R19KT1lTVElDS19YUEFEPW0KIyBDT05GSUdfSk9ZU1RJQ0tfWFBBRF9GRiBpcyBub3Qgc2V0CkNP
TkZJR19KT1lTVElDS19YUEFEX0xFRFM9eQojIENPTkZJR19KT1lTVElDS19QWFJDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSk9ZU1RJQ0tfUVdJSUMgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19G
U0lBNkIgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19TRU5TRUhBVCBpcyBub3Qgc2V0CiMg
Q09ORklHX0pPWVNUSUNLX1NFRVNBVyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1RBQkxFVCBp
cyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1RPVUNIU0NSRUVOIGlzIG5vdCBzZXQKQ09ORklHX0lO
UFVUX01JU0M9eQojIENPTkZJR19JTlBVVF9BRDcxNFggaXMgbm90IHNldAojIENPTkZJR19JTlBV
VF9BVE1FTF9DQVBUT1VDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0JNQTE1MCBpcyBub3Qg
c2V0CiMgQ09ORklHX0lOUFVUX0UzWDBfQlVUVE9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRf
TU1BODQ1MCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0FUSV9SRU1PVEUyIGlzIG5vdCBzZXQK
IyBDT05GSUdfSU5QVVRfS0VZU1BBTl9SRU1PVEUgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9L
WFRKOSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1BPV0VSTUFURSBpcyBub3Qgc2V0CiMgQ09O
RklHX0lOUFVUX1lFQUxJTksgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9DTTEwOSBpcyBub3Qg
c2V0CkNPTkZJR19JTlBVVF9VSU5QVVQ9bQojIENPTkZJR19JTlBVVF9QQ0Y4NTc0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfSU5QVVRfREE3MjgwX0hBUFRJQ1MgaXMgbm90IHNldAojIENPTkZJR19JTlBV
VF9BRFhMMzRYIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfSU1TX1BDVSBpcyBub3Qgc2V0CiMg
Q09ORklHX0lOUFVUX0lRUzI2OUEgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9JUVM2MjZBIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfSVFTNzIyMiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVU
X0NNQTMwMDAgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9EUlYyNjY1X0hBUFRJQ1MgaXMgbm90
IHNldAojIENPTkZJR19JTlBVVF9EUlYyNjY3X0hBUFRJQ1MgaXMgbm90IHNldAojIENPTkZJR19S
TUk0X0NPUkUgaXMgbm90IHNldAoKIwojIEhhcmR3YXJlIEkvTyBwb3J0cwojCiMgQ09ORklHX1NF
UklPIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfTUlHSFRfSEFWRV9QQ19TRVJJTz15CiMgQ09ORklH
X0dBTUVQT1JUIGlzIG5vdCBzZXQKIyBlbmQgb2YgSGFyZHdhcmUgSS9PIHBvcnRzCiMgZW5kIG9m
IElucHV0IGRldmljZSBzdXBwb3J0CgojCiMgQ2hhcmFjdGVyIGRldmljZXMKIwpDT05GSUdfVFRZ
PXkKQ09ORklHX1ZUPXkKQ09ORklHX0NPTlNPTEVfVFJBTlNMQVRJT05TPXkKQ09ORklHX1ZUX0NP
TlNPTEU9eQpDT05GSUdfSFdfQ09OU09MRT15CkNPTkZJR19WVF9IV19DT05TT0xFX0JJTkRJTkc9
eQpDT05GSUdfVU5JWDk4X1BUWVM9eQojIENPTkZJR19MRUdBQ1lfUFRZUyBpcyBub3Qgc2V0CiMg
Q09ORklHX0xFR0FDWV9USU9DU1RJIGlzIG5vdCBzZXQKQ09ORklHX0xESVNDX0FVVE9MT0FEPXkK
CiMKIyBTZXJpYWwgZHJpdmVycwojCkNPTkZJR19TRVJJQUxfRUFSTFlDT049eQpDT05GSUdfU0VS
SUFMXzgyNTA9eQojIENPTkZJR19TRVJJQUxfODI1MF9ERVBSRUNBVEVEX09QVElPTlMgaXMgbm90
IHNldAojIENPTkZJR19TRVJJQUxfODI1MF8xNjU1MEFfVkFSSUFOVFMgaXMgbm90IHNldAojIENP
TkZJR19TRVJJQUxfODI1MF9GSU5URUsgaXMgbm90IHNldApDT05GSUdfU0VSSUFMXzgyNTBfQ09O
U09MRT15CkNPTkZJR19TRVJJQUxfODI1MF9QQ0lMSUI9eQpDT05GSUdfU0VSSUFMXzgyNTBfUENJ
PXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfRVhBUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84
MjUwX0NTIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX05SX1VBUlRTPTgKQ09ORklHX1NF
UklBTF84MjUwX1JVTlRJTUVfVUFSVFM9NAojIENPTkZJR19TRVJJQUxfODI1MF9FWFRFTkRFRCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84MjUwX1BDSTFYWFhYIGlzIG5vdCBzZXQKQ09ORklH
X1NFUklBTF84MjUwX0ZTTD15CiMgQ09ORklHX1NFUklBTF84MjUwX0RXIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VSSUFMXzgyNTBfUlQyODhYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBf
UEVSSUNPTSBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfT0ZfUExBVEZPUk09eQoKIwojIE5vbi04
MjUwIHNlcmlhbCBwb3J0IHN1cHBvcnQKIwojIENPTkZJR19TRVJJQUxfVUFSVExJVEUgaXMgbm90
IHNldApDT05GSUdfU0VSSUFMX0NPUkU9eQpDT05GSUdfU0VSSUFMX0NPUkVfQ09OU09MRT15CiMg
Q09ORklHX1NFUklBTF9QTUFDWklMT0cgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfSlNNIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1NJRklWRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklB
TF9TQ0NOWFAgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfU0MxNklTN1hYIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VSSUFMX0FMVEVSQV9KVEFHVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklB
TF9BTFRFUkFfVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9YSUxJTlhfUFNfVUFSVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BUkMgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxf
UlAyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0ZTTF9MUFVBUlQgaXMgbm90IHNldAojIENP
TkZJR19TRVJJQUxfRlNMX0xJTkZMRVhVQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0NP
TkVYQU5UX0RJR0lDT0xPUiBpcyBub3Qgc2V0CiMgZW5kIG9mIFNlcmlhbCBkcml2ZXJzCgojIENP
TkZJR19TRVJJQUxfTk9OU1RBTkRBUkQgaXMgbm90IHNldAojIENPTkZJR19QUENfRVBBUFJfSFZf
QllURUNIQU4gaXMgbm90IHNldAojIENPTkZJR19JUFdJUkVMRVNTIGlzIG5vdCBzZXQKIyBDT05G
SUdfTl9HU00gaXMgbm90IHNldAojIENPTkZJR19OT1pPTUkgaXMgbm90IHNldAojIENPTkZJR19O
VUxMX1RUWSBpcyBub3Qgc2V0CkNPTkZJR19IVkNfRFJJVkVSPXkKIyBDT05GSUdfSFZDX1VEQkcg
aXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfREVWX0JVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RU
WV9QUklOVEsgaXMgbm90IHNldApDT05GSUdfVklSVElPX0NPTlNPTEU9eQojIENPTkZJR19JUE1J
X0hBTkRMRVIgaXMgbm90IHNldApDT05GSUdfSFdfUkFORE9NPXkKIyBDT05GSUdfSFdfUkFORE9N
X1RJTUVSSU9NRU0gaXMgbm90IHNldAojIENPTkZJR19IV19SQU5ET01fQkE0MzEgaXMgbm90IHNl
dApDT05GSUdfSFdfUkFORE9NX1ZJUlRJTz1tCiMgQ09ORklHX0hXX1JBTkRPTV9DQ1RSTkcgaXMg
bm90IHNldAojIENPTkZJR19IV19SQU5ET01fWElQSEVSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0FQ
UExJQ09NIGlzIG5vdCBzZXQKQ09ORklHX0RFVk1FTT15CkNPTkZJR19OVlJBTT1tCkNPTkZJR19E
RVZQT1JUPXkKIyBDT05GSUdfVENHX1RQTSBpcyBub3Qgc2V0CiMgQ09ORklHX1hJTExZQlVTIGlz
IG5vdCBzZXQKIyBDT05GSUdfWElMTFlVU0IgaXMgbm90IHNldAojIGVuZCBvZiBDaGFyYWN0ZXIg
ZGV2aWNlcwoKIwojIEkyQyBzdXBwb3J0CiMKQ09ORklHX0kyQz15CkNPTkZJR19JMkNfQk9BUkRJ
TkZPPXkKIyBDT05GSUdfSTJDX0NPTVBBVCBpcyBub3Qgc2V0CkNPTkZJR19JMkNfQ0hBUkRFVj1t
CiMgQ09ORklHX0kyQ19NVVggaXMgbm90IHNldApDT05GSUdfSTJDX0hFTFBFUl9BVVRPPXkKQ09O
RklHX0kyQ19BTEdPQklUPW0KCiMKIyBJMkMgSGFyZHdhcmUgQnVzIHN1cHBvcnQKIwoKIwojIFBD
IFNNQnVzIGhvc3QgY29udHJvbGxlciBkcml2ZXJzCiMKIyBDT05GSUdfSTJDX0FMSTE1MzUgaXMg
bm90IHNldAojIENPTkZJR19JMkNfQUxJMTU2MyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19BTEkx
NVgzIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0FNRDc1NiBpcyBub3Qgc2V0CiMgQ09ORklHX0ky
Q19BTUQ4MTExIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0k4MDEgaXMgbm90IHNldAojIENPTkZJ
R19JMkNfSVNDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19QSUlYNCBpcyBub3Qgc2V0CiMgQ09O
RklHX0kyQ19ORk9SQ0UyIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX05WSURJQV9HUFUgaXMgbm90
IHNldAojIENPTkZJR19JMkNfU0lTNTU5NSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19TSVM2MzAg
aXMgbm90IHNldAojIENPTkZJR19JMkNfU0lTOTZYIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1ZJ
QSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19WSUFQUk8gaXMgbm90IHNldAoKIwojIE1hYyBTTUJ1
cyBob3N0IGNvbnRyb2xsZXIgZHJpdmVycwojCkNPTkZJR19JMkNfUE9XRVJNQUM9eQoKIwojIEky
QyBzeXN0ZW0gYnVzIGRyaXZlcnMgKG1vc3RseSBlbWJlZGRlZCAvIHN5c3RlbS1vbi1jaGlwKQoj
CiMgQ09ORklHX0kyQ19ERVNJR05XQVJFX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJD
X0RFU0lHTldBUkVfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX01QQyBpcyBub3Qgc2V0CiMg
Q09ORklHX0kyQ19PQ09SRVMgaXMgbm90IHNldAojIENPTkZJR19JMkNfUENBX1BMQVRGT1JNIGlz
IG5vdCBzZXQKIyBDT05GSUdfSTJDX1NJTVRFQyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19YSUxJ
TlggaXMgbm90IHNldAoKIwojIEV4dGVybmFsIEkyQy9TTUJ1cyBhZGFwdGVyIGRyaXZlcnMKIwoj
IENPTkZJR19JMkNfRElPTEFOX1UyQyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19DUDI2MTUgaXMg
bm90IHNldAojIENPTkZJR19JMkNfUENJMVhYWFggaXMgbm90IHNldAojIENPTkZJR19JMkNfUk9C
T1RGVVpaX09TSUYgaXMgbm90IHNldAojIENPTkZJR19JMkNfVEFPU19FVk0gaXMgbm90IHNldAoj
IENPTkZJR19JMkNfVElOWV9VU0IgaXMgbm90IHNldAoKIwojIE90aGVyIEkyQy9TTUJ1cyBidXMg
ZHJpdmVycwojCiMgQ09ORklHX0kyQ19WSVJUSU8gaXMgbm90IHNldAojIGVuZCBvZiBJMkMgSGFy
ZHdhcmUgQnVzIHN1cHBvcnQKCiMgQ09ORklHX0kyQ19TVFVCIGlzIG5vdCBzZXQKIyBDT05GSUdf
STJDX1NMQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFQlVHX0NPUkUgaXMgbm90IHNldAoj
IENPTkZJR19JMkNfREVCVUdfQUxHTyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19ERUJVR19CVVMg
aXMgbm90IHNldAojIGVuZCBvZiBJMkMgc3VwcG9ydAoKIyBDT05GSUdfSTNDIGlzIG5vdCBzZXQK
IyBDT05GSUdfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BNSSBpcyBub3Qgc2V0CiMgQ09ORklH
X0hTSSBpcyBub3Qgc2V0CiMgQ09ORklHX1BQUyBpcyBub3Qgc2V0CgojCiMgUFRQIGNsb2NrIHN1
cHBvcnQKIwojIENPTkZJR19QVFBfMTU4OF9DTE9DSyBpcyBub3Qgc2V0CkNPTkZJR19QVFBfMTU4
OF9DTE9DS19PUFRJT05BTD15CgojCiMgRW5hYmxlIFBIWUxJQiBhbmQgTkVUV09SS19QSFlfVElN
RVNUQU1QSU5HIHRvIHNlZSB0aGUgYWRkaXRpb25hbCBjbG9ja3MuCiMKIyBlbmQgb2YgUFRQIGNs
b2NrIHN1cHBvcnQKCiMgQ09ORklHX1BJTkNUUkwgaXMgbm90IHNldAojIENPTkZJR19HUElPTElC
IGlzIG5vdCBzZXQKIyBDT05GSUdfVzEgaXMgbm90IHNldAojIENPTkZJR19QT1dFUl9SRVNFVCBp
cyBub3Qgc2V0CkNPTkZJR19QT1dFUl9TVVBQTFk9eQojIENPTkZJR19QT1dFUl9TVVBQTFlfREVC
VUcgaXMgbm90IHNldApDT05GSUdfQVBNX1BPV0VSPW0KIyBDT05GSUdfSVA1WFhYX1BPV0VSIGlz
IG5vdCBzZXQKIyBDT05GSUdfVEVTVF9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJf
QURQNTA2MSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfQ1cyMDE1IGlzIG5vdCBzZXQKIyBD
T05GSUdfQkFUVEVSWV9EUzI3ODAgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0RTMjc4MSBp
cyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfRFMyNzgyIGlzIG5vdCBzZXQKQ09ORklHX0JBVFRF
UllfUE1VPW0KIyBDT05GSUdfQkFUVEVSWV9TQU1TVU5HX1NESSBpcyBub3Qgc2V0CiMgQ09ORklH
X0JBVFRFUllfU0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9TQlMgaXMgbm90IHNldAoj
IENPTkZJR19CQVRURVJZX0JRMjdYWFggaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX01BWDE3
MDQyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9NQVg4OTAzIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ0hBUkdFUl9MUDg3MjcgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0xUQzQxNjJMIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9ERVRFQ1RPUl9NQVgxNDY1NiBpcyBub3Qgc2V0CiMg
Q09ORklHX0NIQVJHRVJfTUFYNzc5NzYgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjQx
NVggaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0dBVUdFX0xUQzI5NDEgaXMgbm90IHNldAoj
IENPTkZJR19CQVRURVJZX0dPTERGSVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9SVDUw
MzMgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JEOTk5NTQgaXMgbm90IHNldAojIENPTkZJ
R19CQVRURVJZX1VHMzEwNSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZVRUxfR0FVR0VfTU04MDEzIGlz
IG5vdCBzZXQKQ09ORklHX0hXTU9OPW0KQ09ORklHX0hXTU9OX0RFQlVHX0NISVA9eQoKIwojIE5h
dGl2ZSBkcml2ZXJzCiMKIyBDT05GSUdfU0VOU09SU19BRDc0MTQgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX0FENzQxOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURNMTAyMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURNMTAyNSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfQURNMTAyNiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURNMTAyOSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfQURNMTAzMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURN
MTE3NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURNOTI0MCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfQURUNzQxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURUNzQxMSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURUNzQ2MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfQURUNzQ3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURUNzQ3NSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfQUhUMTAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FR
VUFDT01QVVRFUl9ENU5FWFQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FTMzcwIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19BU0M3NjIxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19BWElfRkFOX0NPTlRST0wgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FUWFAxIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19DT1JTQUlSX0NQUk8gaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0NPUlNBSVJfUFNVIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfRFJJVkVURU1QPW0K
IyBDT05GSUdfU0VOU09SU19EUzYyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRFMxNjIx
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19JNUtfQU1CIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19GNzUzNzVTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19HSUdBQllURV9XQVRF
UkZPUkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19HTDUxOFNNIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19HTDUyMFNNIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19HNzYwQSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRzc2MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfSElINjEzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSFMzMDAxIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19KQzQyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19QT1dFUlog
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1BPV1IxMjIwIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19MSU5FQUdFIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEMyOTQ1IGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEMyOTQ3X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfTFRDMjk5MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDMjk5MSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDNDE1MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
TFRDNDIxNSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDNDIyMiBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfTFRDNDI0NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDNDI2
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDNDI2MSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfTUFYMTI3IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgxNjA2NSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYMTYxOSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfTUFYMTY2OCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYMTk3IGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19NQVgzMTczMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFY
MzE3NjAgaXMgbm90IHNldAojIENPTkZJR19NQVgzMTgyNyBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfTUFYNjYyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYNjYyMSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYNjYzOSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
TUFYNjY0MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYNjY1MCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfTUFYNjY5NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYMzE3
OTAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01DMzRWUjUwMCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfTUNQMzAyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVEM2NTQgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX1RQUzIzODYxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19NUjc1MjAzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTYzIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19MTTczIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTc1IGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTc3IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19MTTc4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTgwIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19MTTgzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTg1IGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19MTTg3IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTkw
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTkyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19MTTkzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTk1MjM0IGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19MTTk1MjQxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTk1
MjQ1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19OQ1Q2Nzc1X0kyQyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfTkNUNzgwMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTlBDTTdY
WCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTlpYVF9LUkFLRU4yIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19OWlhUX1NNQVJUMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfT0ND
X1A4X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfUENGODU5MSBpcyBub3Qgc2V0CiMg
Q09ORklHX1BNQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19TQlRTSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfU0JSTUkgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NIVDIx
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19TSFQzeCBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfU0hUNHggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NIVEMxIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19TSVM1NTk1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19FTUMx
NDAzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19FTUMyMTAzIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19FTUMyMzA1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19FTUM2VzIwMSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU01TQzQ3TTE5MiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfU1RUUzc1MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURDMTI4RDgxOCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURTNzgyOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfQU1DNjgyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSU5BMjA5IGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19JTkEyWFggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0lO
QTIzOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSU5BMzIyMSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfVEM3NCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVEhNQzUwIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19UTVAxMDIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X1RNUDEwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVE1QMTA4IGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19UTVA0MDEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RNUDQyMSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVE1QNDY0IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19UTVA1MTMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1ZJQTY4NkEgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX1ZUODIzMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVzgz
NzczRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVzgzNzgxRCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfVzgzNzkxRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVzgzNzkyRCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVzgzNzkzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19XODM3OTUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1c4M0w3ODVUUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfVzgzTDc4Nk5HIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhFUk1B
TCBpcyBub3Qgc2V0CiMgQ09ORklHX1dBVENIRE9HIGlzIG5vdCBzZXQKQ09ORklHX1NTQl9QT1NT
SUJMRT15CkNPTkZJR19TU0I9bQpDT05GSUdfU1NCX1NQUk9NPXkKQ09ORklHX1NTQl9QQ0lIT1NU
X1BPU1NJQkxFPXkKQ09ORklHX1NTQl9QQ0lIT1NUPXkKQ09ORklHX1NTQl9CNDNfUENJX0JSSURH
RT15CkNPTkZJR19TU0JfUENNQ0lBSE9TVF9QT1NTSUJMRT15CkNPTkZJR19TU0JfUENNQ0lBSE9T
VD15CkNPTkZJR19TU0JfRFJJVkVSX1BDSUNPUkVfUE9TU0lCTEU9eQpDT05GSUdfU1NCX0RSSVZF
Ul9QQ0lDT1JFPXkKQ09ORklHX0JDTUFfUE9TU0lCTEU9eQojIENPTkZJR19CQ01BIGlzIG5vdCBz
ZXQKCiMKIyBNdWx0aWZ1bmN0aW9uIGRldmljZSBkcml2ZXJzCiMKIyBDT05GSUdfTUZEX0FDVDg5
NDVBIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FTMzcxMSBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9TTVBSTyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BUzM3MjIgaXMgbm90IHNldAojIENPTkZJ
R19QTUlDX0FEUDU1MjAgaXMgbm90IHNldAojIENPTkZJR19NRkRfQVRNRUxfRkxFWENPTSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9BVE1FTF9ITENEQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9C
Q001OTBYWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9CRDk1NzFNV1YgaXMgbm90IHNldAojIENP
TkZJR19NRkRfQVhQMjBYX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9DUzQyTDQzX0kyQyBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQURFUkEgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFY
NTk3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BNSUNfREE5MDNYIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX0RBOTA1Ml9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfREE5MDU1IGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX0RBOTA2MiBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9EQTkwNjMgaXMgbm90
IHNldAojIENPTkZJR19NRkRfREE5MTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RMTjIgaXMg
bm90IHNldAojIENPTkZJR19NRkRfR0FURVdPUktTX0dTQyBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9NQzEzWFhYX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NUDI2MjkgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfSEk2NDIxX1BNSUMgaXMgbm90IHNldAojIENPTkZJR19MUENfSUNIIGlzIG5v
dCBzZXQKIyBDT05GSUdfTFBDX1NDSCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9JUVM2MlggaXMg
bm90IHNldAojIENPTkZJR19NRkRfSkFOWl9DTU9ESU8gaXMgbm90IHNldAojIENPTkZJR19NRkRf
S0VNUExEIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEXzg4UE04MDAgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfODhQTTgwNSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF84OFBNODYwWCBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9NQVgxNDU3NyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg3NzU0MSBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg3NzYyMCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9N
QVg3NzY1MCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg3NzY4NiBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9NQVg3NzY5MyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg3NzcxNCBpcyBub3Qg
c2V0CiMgQ09ORklHX01GRF9NQVg3Nzg0MyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg4OTA3
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDg5MjUgaXMgbm90IHNldAojIENPTkZJR19NRkRf
TUFYODk5NyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg4OTk4IGlzIG5vdCBzZXQKIyBDT05G
SUdfTUZEX01UNjM2MCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NVDYzNzAgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfTVQ2Mzk3IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01FTkYyMUJNQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9WSVBFUkJPQVJEIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX05U
WEVDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JFVFUgaXMgbm90IHNldAojIENPTkZJR19NRkRf
UENGNTA2MzMgaXMgbm90IHNldAojIENPTkZJR19NRkRfU1k3NjM2QSBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9SREMzMjFYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JUNDgzMSBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9SVDUwMzMgaXMgbm90IHNldAojIENPTkZJR19NRkRfUlQ1MTIwIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX1JDNVQ1ODMgaXMgbm90IHNldAojIENPTkZJR19NRkRfUks4WFhf
STJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JONVQ2MTggaXMgbm90IHNldAojIENPTkZJR19N
RkRfU0VDX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19NRkRfU0k0NzZYX0NPUkUgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfU001MDEgaXMgbm90IHNldAojIENPTkZJR19NRkRfU0tZODE0NTIgaXMg
bm90IHNldAojIENPTkZJR19NRkRfU1RNUEUgaXMgbm90IHNldAojIENPTkZJR19NRkRfU1lTQ09O
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0xQMzk0MyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9M
UDg3ODggaXMgbm90IHNldAojIENPTkZJR19NRkRfVElfTE1VIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX1BBTE1BUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RQUzYxMDVYIGlzIG5vdCBzZXQKIyBDT05G
SUdfVFBTNjUwN1ggaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjUwODYgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfVFBTNjUwOTAgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjUyMTcgaXMg
bm90IHNldAojIENPTkZJR19NRkRfVElfTFA4NzNYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJ
X0xQODc1NjUgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjUyMTggaXMgbm90IHNldAojIENP
TkZJR19NRkRfVFBTNjUyMTkgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjU4NlggaXMgbm90
IHNldAojIENPTkZJR19NRkRfVFBTNjU5MTJfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQ
UzY1OTRfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfVFdMNDAzMF9DT1JFIGlzIG5vdCBzZXQKIyBD
T05GSUdfVFdMNjA0MF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1dMMTI3M19DT1JFIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX0xNMzUzMyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9UQzM1
ODlYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RRTVg4NiBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9WWDg1NSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9MT0NITkFHQVIgaXMgbm90IHNldAojIENP
TkZJR19NRkRfQVJJWk9OQV9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004NDAwIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX1dNODMxWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004
MzUwX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTTg5OTQgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfUk9ITV9CRDcxOFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JPSE1fQkQ3MTgyOCBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9ST0hNX0JEOTU3WE1VRiBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9TVFBNSUMxIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NUTUZYIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX0FUQzI2MFhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1FDT01fUE04MDA4
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JTTVVfSTJDIGlzIG5vdCBzZXQKIyBlbmQgb2YgTXVs
dGlmdW5jdGlvbiBkZXZpY2UgZHJpdmVycwoKIyBDT05GSUdfUkVHVUxBVE9SIGlzIG5vdCBzZXQK
IyBDT05GSUdfUkNfQ09SRSBpcyBub3Qgc2V0CgojCiMgQ0VDIHN1cHBvcnQKIwojIENPTkZJR19N
RURJQV9DRUNfU1VQUE9SVCBpcyBub3Qgc2V0CiMgZW5kIG9mIENFQyBzdXBwb3J0CgojIENPTkZJ
R19NRURJQV9TVVBQT1JUIGlzIG5vdCBzZXQKCiMKIyBHcmFwaGljcyBzdXBwb3J0CiMKQ09ORklH
X0FQRVJUVVJFX0hFTFBFUlM9eQpDT05GSUdfVklERU9fQ01ETElORT15CkNPTkZJR19WSURFT19O
T01PREVTRVQ9eQojIENPTkZJR19BVVhESVNQTEFZIGlzIG5vdCBzZXQKIyBDT05GSUdfQUdQIGlz
IG5vdCBzZXQKQ09ORklHX0RSTT15CiMgQ09ORklHX0RSTV9ERUJVR19NTSBpcyBub3Qgc2V0CkNP
TkZJR19EUk1fS1VOSVRfVEVTVF9IRUxQRVJTPW0KQ09ORklHX0RSTV9LVU5JVF9URVNUPW0KQ09O
RklHX0RSTV9LTVNfSEVMUEVSPXkKIyBDT05GSUdfRFJNX0RFQlVHX0RQX01TVF9UT1BPTE9HWV9S
RUZTIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9ERUJVR19NT0RFU0VUX0xPQ0s9eQpDT05GSUdfRFJN
X0ZCREVWX0VNVUxBVElPTj15CkNPTkZJR19EUk1fRkJERVZfT1ZFUkFMTE9DPTEwMAojIENPTkZJ
R19EUk1fRkJERVZfTEVBS19QSFlTX1NNRU0gaXMgbm90IHNldAojIENPTkZJR19EUk1fTE9BRF9F
RElEX0ZJUk1XQVJFIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9ESVNQTEFZX0hFTFBFUj1tCkNPTkZJ
R19EUk1fRElTUExBWV9EUF9IRUxQRVI9eQojIENPTkZJR19EUk1fRFBfQVVYX0NIQVJERVYgaXMg
bm90IHNldAojIENPTkZJR19EUk1fRFBfQ0VDIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9UVE09bQpD
T05GSUdfRFJNX0VYRUM9bQpDT05GSUdfRFJNX0JVRERZPW0KQ09ORklHX0RSTV9WUkFNX0hFTFBF
Uj1tCkNPTkZJR19EUk1fVFRNX0hFTFBFUj1tCkNPTkZJR19EUk1fR0VNX1NITUVNX0hFTFBFUj1t
CkNPTkZJR19EUk1fU1VCQUxMT0NfSEVMUEVSPW0KCiMKIyBJMkMgZW5jb2RlciBvciBoZWxwZXIg
Y2hpcHMKIwojIENPTkZJR19EUk1fSTJDX0NINzAwNiBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9J
MkNfU0lMMTY0IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0kyQ19OWFBfVERBOTk4WCBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9JMkNfTlhQX1REQTk5NTAgaXMgbm90IHNldAojIGVuZCBvZiBJMkMg
ZW5jb2RlciBvciBoZWxwZXIgY2hpcHMKCiMKIyBBUk0gZGV2aWNlcwojCiMgZW5kIG9mIEFSTSBk
ZXZpY2VzCgpDT05GSUdfRFJNX1JBREVPTj1tCkNPTkZJR19EUk1fUkFERU9OX1VTRVJQVFI9eQoj
IENPTkZJR19EUk1fQU1ER1BVIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX05PVVZFQVUgaXMgbm90
IHNldApDT05GSUdfRFJNX1ZHRU09bQojIENPTkZJR19EUk1fVktNUyBpcyBub3Qgc2V0CiMgQ09O
RklHX0RSTV9VREwgaXMgbm90IHNldAojIENPTkZJR19EUk1fQVNUIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFJNX01HQUcyMDAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUVhMIGlzIG5vdCBzZXQKQ09O
RklHX0RSTV9WSVJUSU9fR1BVPW0KQ09ORklHX0RSTV9WSVJUSU9fR1BVX0tNUz15CkNPTkZJR19E
Uk1fUEFORUw9eQoKIwojIERpc3BsYXkgUGFuZWxzCiMKIyBDT05GSUdfRFJNX1BBTkVMX0xWRFMg
aXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0lNUExFIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFJNX1BBTkVMX0VEUCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9PTElNRVhfTENEX09M
SU5VWElOTyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9TQU1TVU5HX0FUTkEzM1hDMjAg
aXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0FNU1VOR19TNkQ3QUEwIGlzIG5vdCBzZXQK
IyBDT05GSUdfRFJNX1BBTkVMX1NBTVNVTkdfUzZFNjNNMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RS
TV9QQU5FTF9TQU1TVU5HX1M2RTg4QTBfQU1TNDUyRUYwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0RS
TV9QQU5FTF9TQU1TVU5HX1M2RThBQTAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfU0VJ
S09fNDNXVkYxRyBpcyBub3Qgc2V0CiMgZW5kIG9mIERpc3BsYXkgUGFuZWxzCgpDT05GSUdfRFJN
X0JSSURHRT15CkNPTkZJR19EUk1fUEFORUxfQlJJREdFPXkKCiMKIyBEaXNwbGF5IEludGVyZmFj
ZSBCcmlkZ2VzCiMKIyBDT05GSUdfRFJNX0NISVBPTkVfSUNONjIxMSBpcyBub3Qgc2V0CiMgQ09O
RklHX0RSTV9DSFJPTlRFTF9DSDcwMzMgaXMgbm90IHNldAojIENPTkZJR19EUk1fRElTUExBWV9D
T05ORUNUT1IgaXMgbm90IHNldAojIENPTkZJR19EUk1fSVRFX0lUNjUwNSBpcyBub3Qgc2V0CiMg
Q09ORklHX0RSTV9MT05USVVNX0xUODkxMkIgaXMgbm90IHNldAojIENPTkZJR19EUk1fTE9OVElV
TV9MVDkyMTEgaXMgbm90IHNldAojIENPTkZJR19EUk1fTE9OVElVTV9MVDk2MTEgaXMgbm90IHNl
dAojIENPTkZJR19EUk1fTE9OVElVTV9MVDk2MTFVWEMgaXMgbm90IHNldAojIENPTkZJR19EUk1f
SVRFX0lUNjYxMjEgaXMgbm90IHNldAojIENPTkZJR19EUk1fTFZEU19DT0RFQyBpcyBub3Qgc2V0
CiMgQ09ORklHX0RSTV9NRUdBQ0hJUFNfU1REUFhYWFhfR0VfQjg1MFYzX0ZXIGlzIG5vdCBzZXQK
IyBDT05GSUdfRFJNX05YUF9QVE4zNDYwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBUkFERV9Q
Uzg2MjIgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFSQURFX1BTODY0MCBpcyBub3Qgc2V0CiMg
Q09ORklHX0RSTV9TSUxfU0lJODYyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9TSUk5MDJYIGlz
IG5vdCBzZXQKIyBDT05GSUdfRFJNX1NJSTkyMzQgaXMgbm90IHNldAojIENPTkZJR19EUk1fU0lN
UExFX0JSSURHRSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9USElORV9USEM2M0xWRDEwMjQgaXMg
bm90IHNldAojIENPTkZJR19EUk1fVE9TSElCQV9UQzM1ODc2MiBpcyBub3Qgc2V0CiMgQ09ORklH
X0RSTV9UT1NISUJBX1RDMzU4NzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RPU0hJQkFfVEMz
NTg3NjcgaXMgbm90IHNldAojIENPTkZJR19EUk1fVE9TSElCQV9UQzM1ODc2OCBpcyBub3Qgc2V0
CiMgQ09ORklHX0RSTV9UT1NISUJBX1RDMzU4Nzc1IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RJ
X0RMUEMzNDMzIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RJX1RGUDQxMCBpcyBub3Qgc2V0CiMg
Q09ORklHX0RSTV9USV9TTjY1RFNJODMgaXMgbm90IHNldAojIENPTkZJR19EUk1fVElfU042NURT
STg2IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RJX1RQRDEyUzAxNSBpcyBub3Qgc2V0CiMgQ09O
RklHX0RSTV9BTkFMT0dJWF9BTlg2MzQ1IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0FOQUxPR0lY
X0FOWDc4WFggaXMgbm90IHNldAojIENPTkZJR19EUk1fQU5BTE9HSVhfQU5YNzYyNSBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9JMkNfQURWNzUxMSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9DRE5T
X0RTSSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9DRE5TX01IRFA4NTQ2IGlzIG5vdCBzZXQKIyBl
bmQgb2YgRGlzcGxheSBJbnRlcmZhY2UgQnJpZGdlcwoKIyBDT05GSUdfRFJNX0VUTkFWSVYgaXMg
bm90IHNldAojIENPTkZJR19EUk1fTE9HSUNWQyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9BUkNQ
R1UgaXMgbm90IHNldApDT05GSUdfRFJNX0JPQ0hTPW0KIyBDT05GSUdfRFJNX0NJUlJVU19RRU1V
IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0dNMTJVMzIwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJN
X09GRFJNIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1NJTVBMRURSTSBpcyBub3Qgc2V0CiMgQ09O
RklHX0RSTV9HVUQgaXMgbm90IHNldAojIENPTkZJR19EUk1fU1NEMTMwWCBpcyBub3Qgc2V0CkNP
TkZJR19EUk1fRVhQT1JUX0ZPUl9URVNUUz15CkNPTkZJR19EUk1fUEFORUxfT1JJRU5UQVRJT05f
UVVJUktTPXkKQ09ORklHX0RSTV9MSUJfUkFORE9NPXkKCiMKIyBGcmFtZSBidWZmZXIgRGV2aWNl
cwojCkNPTkZJR19GQj15CkNPTkZJR19GQl9NQUNNT0RFUz15CiMgQ09ORklHX0ZCX0NJUlJVUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0ZCX1BNMiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0NZQkVSMjAw
MCBpcyBub3Qgc2V0CkNPTkZJR19GQl9PRj15CiMgQ09ORklHX0ZCX0NPTlRST0wgaXMgbm90IHNl
dAojIENPTkZJR19GQl9QTEFUSU5VTSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1ZBTEtZUklFIGlz
IG5vdCBzZXQKQ09ORklHX0ZCX0NUNjU1NTA9eQojIENPTkZJR19GQl9BU0lMSUFOVCBpcyBub3Qg
c2V0CiMgQ09ORklHX0ZCX0lNU1RUIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVVZFU0EgaXMgbm90
IHNldAojIENPTkZJR19GQl9PUEVOQ09SRVMgaXMgbm90IHNldAojIENPTkZJR19GQl9TMUQxM1hY
WCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX05WSURJQSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1JJ
VkEgaXMgbm90IHNldAojIENPTkZJR19GQl9JNzQwIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfTUFU
Uk9YIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfUkFERU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJf
QVRZMTI4IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfQVRZIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJf
UzMgaXMgbm90IHNldAojIENPTkZJR19GQl9TQVZBR0UgaXMgbm90IHNldAojIENPTkZJR19GQl9T
SVMgaXMgbm90IHNldAojIENPTkZJR19GQl9ORU9NQUdJQyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZC
X0tZUk8gaXMgbm90IHNldAojIENPTkZJR19GQl8zREZYIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJf
VlQ4NjIzIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVFJJREVOVCBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZCX0FSSyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1BNMyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZC
X0NBUk1JTkUgaXMgbm90IHNldAojIENPTkZJR19GQl9TTVNDVUZYIGlzIG5vdCBzZXQKIyBDT05G
SUdfRkJfSUJNX0dYVDQ1MDAgaXMgbm90IHNldAojIENPTkZJR19GQl9WSVJUVUFMIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRkJfTUVUUk9OT01FIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfTUI4NjJYWCBp
cyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NJTVBMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NNNzEy
IGlzIG5vdCBzZXQKQ09ORklHX0ZCX0NPUkU9eQpDT05GSUdfRkJfTk9USUZZPXkKIyBDT05GSUdf
RklSTVdBUkVfRURJRCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0RFVklDRSBpcyBub3Qgc2V0CkNP
TkZJR19GQl9DRkJfRklMTFJFQ1Q9eQpDT05GSUdfRkJfQ0ZCX0NPUFlBUkVBPXkKQ09ORklHX0ZC
X0NGQl9JTUFHRUJMSVQ9eQpDT05GSUdfRkJfU1lTX0ZJTExSRUNUPXkKQ09ORklHX0ZCX1NZU19D
T1BZQVJFQT15CkNPTkZJR19GQl9TWVNfSU1BR0VCTElUPXkKIyBDT05GSUdfRkJfRk9SRUlHTl9F
TkRJQU4gaXMgbm90IHNldApDT05GSUdfRkJfU1lTTUVNX0ZPUFM9eQpDT05GSUdfRkJfREVGRVJS
RURfSU89eQpDT05GSUdfRkJfSU9NRU1fRk9QUz15CkNPTkZJR19GQl9JT01FTV9IRUxQRVJTPXkK
Q09ORklHX0ZCX1NZU01FTV9IRUxQRVJTPXkKQ09ORklHX0ZCX1NZU01FTV9IRUxQRVJTX0RFRkVS
UkVEPXkKIyBDT05GSUdfRkJfTU9ERV9IRUxQRVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVElM
RUJMSVRUSU5HIGlzIG5vdCBzZXQKIyBlbmQgb2YgRnJhbWUgYnVmZmVyIERldmljZXMKCiMKIyBC
YWNrbGlnaHQgJiBMQ0QgZGV2aWNlIHN1cHBvcnQKIwpDT05GSUdfTENEX0NMQVNTX0RFVklDRT1t
CkNPTkZJR19MQ0RfUExBVEZPUk09bQpDT05GSUdfQkFDS0xJR0hUX0NMQVNTX0RFVklDRT1tCiMg
Q09ORklHX0JBQ0tMSUdIVF9LVFo4ODY2IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX1FD
T01fV0xFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9BRFA4ODYwIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkFDS0xJR0hUX0FEUDg4NzAgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRf
TE0zNjM5IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0xWNTIwN0xQIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkFDS0xJR0hUX0JENjEwNyBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9B
UkNYQ05OIGlzIG5vdCBzZXQKQ09ORklHX0JBQ0tMSUdIVF9MRUQ9bQojIGVuZCBvZiBCYWNrbGln
aHQgJiBMQ0QgZGV2aWNlIHN1cHBvcnQKCkNPTkZJR19IRE1JPXkKCiMKIyBDb25zb2xlIGRpc3Bs
YXkgZHJpdmVyIHN1cHBvcnQKIwpDT05GSUdfRFVNTVlfQ09OU09MRT15CkNPTkZJR19EVU1NWV9D
T05TT0xFX0NPTFVNTlM9ODAKQ09ORklHX0RVTU1ZX0NPTlNPTEVfUk9XUz0yNQpDT05GSUdfRlJB
TUVCVUZGRVJfQ09OU09MRT15CiMgQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEVfTEVHQUNZX0FD
Q0VMRVJBVElPTiBpcyBub3Qgc2V0CkNPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFX0RFVEVDVF9Q
UklNQVJZPXkKIyBDT05GSUdfRlJBTUVCVUZGRVJfQ09OU09MRV9ST1RBVElPTiBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEVfREVGRVJSRURfVEFLRU9WRVIgaXMgbm90IHNl
dAojIGVuZCBvZiBDb25zb2xlIGRpc3BsYXkgZHJpdmVyIHN1cHBvcnQKCiMgQ09ORklHX0xPR08g
aXMgbm90IHNldAojIGVuZCBvZiBHcmFwaGljcyBzdXBwb3J0CgojIENPTkZJR19EUk1fQUNDRUwg
aXMgbm90IHNldApDT05GSUdfU09VTkQ9bQpDT05GSUdfU05EPW0KQ09ORklHX1NORF9USU1FUj1t
CkNPTkZJR19TTkRfUENNPW0KQ09ORklHX1NORF9IV0RFUD1tCkNPTkZJR19TTkRfU0VRX0RFVklD
RT1tCkNPTkZJR19TTkRfUkFXTUlEST1tCkNPTkZJR19TTkRfSkFDSz15CkNPTkZJR19TTkRfSkFD
S19JTlBVVF9ERVY9eQojIENPTkZJR19TTkRfT1NTRU1VTCBpcyBub3Qgc2V0CkNPTkZJR19TTkRf
UENNX1RJTUVSPXkKQ09ORklHX1NORF9IUlRJTUVSPW0KQ09ORklHX1NORF9EWU5BTUlDX01JTk9S
Uz15CkNPTkZJR19TTkRfTUFYX0NBUkRTPTYKIyBDT05GSUdfU05EX1NVUFBPUlRfT0xEX0FQSSBp
cyBub3Qgc2V0CkNPTkZJR19TTkRfUFJPQ19GUz15CkNPTkZJR19TTkRfVkVSQk9TRV9QUk9DRlM9
eQojIENPTkZJR19TTkRfVkVSQk9TRV9QUklOVEsgaXMgbm90IHNldAojIENPTkZJR19TTkRfQ1RM
X0ZBU1RfTE9PS1VQIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0RFQlVHIGlzIG5vdCBzZXQKQ09O
RklHX1NORF9DVExfSU5QVVRfVkFMSURBVElPTj15CkNPTkZJR19TTkRfVk1BU1RFUj15CkNPTkZJ
R19TTkRfU0VRVUVOQ0VSPW0KIyBDT05GSUdfU05EX1NFUV9EVU1NWSBpcyBub3Qgc2V0CkNPTkZJ
R19TTkRfU0VRX0hSVElNRVJfREVGQVVMVD15CkNPTkZJR19TTkRfU0VRX01JRElfRVZFTlQ9bQpD
T05GSUdfU05EX1NFUV9NSURJPW0KQ09ORklHX1NORF9TRVFfVklSTUlEST1tCiMgQ09ORklHX1NO
RF9TRVFfVU1QIGlzIG5vdCBzZXQKQ09ORklHX1NORF9EUklWRVJTPXkKIyBDT05GSUdfU05EX0RV
TU1ZIGlzIG5vdCBzZXQKQ09ORklHX1NORF9BTE9PUD1tCiMgQ09ORklHX1NORF9QQ01URVNUIGlz
IG5vdCBzZXQKQ09ORklHX1NORF9WSVJNSURJPW0KIyBDT05GSUdfU05EX01UUEFWIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NFUklBTF9VMTY1NTAgaXMgbm90IHNldAojIENPTkZJR19TTkRfTVBV
NDAxIGlzIG5vdCBzZXQKQ09ORklHX1NORF9QQ0k9eQojIENPTkZJR19TTkRfQUQxODg5IGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX0FMUzMwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BTFM0MDAw
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FMSTU0NTEgaXMgbm90IHNldAojIENPTkZJR19TTkRf
QVRJSVhQIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FUSUlYUF9NT0RFTSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9BVTg4MTAgaXMgbm90IHNldAojIENPTkZJR19TTkRfQVU4ODIwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX0FVODgzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BVzIgaXMgbm90
IHNldAojIENPTkZJR19TTkRfQVpUMzMyOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9CVDg3WCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9DQTAxMDYgaXMgbm90IHNldAojIENPTkZJR19TTkRfQ01J
UENJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX09YWUdFTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9DUzQyODEgaXMgbm90IHNldAojIENPTkZJR19TTkRfQ1M0NlhYIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0NUWEZJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0RBUkxBMjAgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfR0lOQTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0xBWUxBMjAgaXMgbm90
IHNldAojIENPTkZJR19TTkRfREFSTEEyNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9HSU5BMjQg
aXMgbm90IHNldAojIENPTkZJR19TTkRfTEFZTEEyNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9N
T05BIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX01JQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9F
Q0hPM0cgaXMgbm90IHNldAojIENPTkZJR19TTkRfSU5ESUdPIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX0lORElHT0lPIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lORElHT0RKIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX0lORElHT0lPWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTkRJR09ESlgg
aXMgbm90IHNldAojIENPTkZJR19TTkRfRU1VMTBLMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9F
TVUxMEsxWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9FTlMxMzcwIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0VOUzEzNzEgaXMgbm90IHNldAojIENPTkZJR19TTkRfRVMxOTM4IGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX0VTMTk2OCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9GTTgwMSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9IRFNQIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEU1BNIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX0lDRTE3MTIgaXMgbm90IHNldAojIENPTkZJR19TTkRfSUNFMTcy
NCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTlRFTDhYMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9JTlRFTDhYME0gaXMgbm90IHNldAojIENPTkZJR19TTkRfS09SRzEyMTIgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfTE9MQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9MWDY0NjRFUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9NQUVTVFJPMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9NSVhBUlQg
aXMgbm90IHNldAojIENPTkZJR19TTkRfTk0yNTYgaXMgbm90IHNldAojIENPTkZJR19TTkRfUENY
SFIgaXMgbm90IHNldAojIENPTkZJR19TTkRfUklQVElERSBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9STUUzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9STUU5NiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9STUU5NjUyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NFNlggaXMgbm90IHNldAojIENP
TkZJR19TTkRfU09OSUNWSUJFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9UUklERU5UIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1ZJQTgyWFggaXMgbm90IHNldAojIENPTkZJR19TTkRfVklBODJY
WF9NT0RFTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9WSVJUVU9TTyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9WWDIyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9ZTUZQQ0kgaXMgbm90IHNldAoK
IwojIEhELUF1ZGlvCiMKQ09ORklHX1NORF9IREE9bQpDT05GSUdfU05EX0hEQV9JTlRFTD1tCkNP
TkZJR19TTkRfSERBX0hXREVQPXkKQ09ORklHX1NORF9IREFfUkVDT05GSUc9eQojIENPTkZJR19T
TkRfSERBX0lOUFVUX0JFRVAgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX1BBVENIX0xPQURF
UiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ0lSUlVTX1NDT0RFQ19LVU5JVF9URVNUIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9DT0RFQ19SRUFMVEVLIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0hEQV9DT0RFQ19BTkFMT0cgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVD
X1NJR01BVEVMIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9DT0RFQ19WSUEgaXMgbm90IHNl
dApDT05GSUdfU05EX0hEQV9DT0RFQ19IRE1JPW0KIyBDT05GSUdfU05EX0hEQV9DT0RFQ19DSVJS
VVMgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVDX0NTODQwOSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9IREFfQ09ERUNfQ09ORVhBTlQgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERB
X0NPREVDX0NBMDExMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09ERUNfQ0EwMTMyIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9DT0RFQ19DTUVESUEgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfSERBX0NPREVDX1NJMzA1NCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfR0VORVJJ
QyBpcyBub3Qgc2V0CkNPTkZJR19TTkRfSERBX1BPV0VSX1NBVkVfREVGQVVMVD0wCiMgQ09ORklH
X1NORF9IREFfSU5URUxfSERNSV9TSUxFTlRfU1RSRUFNIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X0hEQV9DVExfREVWX0lEIGlzIG5vdCBzZXQKIyBlbmQgb2YgSEQtQXVkaW8KCkNPTkZJR19TTkRf
SERBX0NPUkU9bQpDT05GSUdfU05EX0hEQV9DT01QT05FTlQ9eQpDT05GSUdfU05EX0hEQV9QUkVB
TExPQ19TSVpFPTIwNDgKQ09ORklHX1NORF9JTlRFTF9EU1BfQ09ORklHPW0KIyBDT05GSUdfU05E
X1BQQyBpcyBub3Qgc2V0CkNPTkZJR19TTkRfQU9BPW0KQ09ORklHX1NORF9BT0FfRkFCUklDX0xB
WU9VVD1tCkNPTkZJR19TTkRfQU9BX09OWVg9bQpDT05GSUdfU05EX0FPQV9UQVM9bQpDT05GSUdf
U05EX0FPQV9UT09OSUU9bQpDT05GSUdfU05EX0FPQV9TT1VOREJVUz1tCkNPTkZJR19TTkRfQU9B
X1NPVU5EQlVTX0kyUz1tCiMgQ09ORklHX1NORF9VU0IgaXMgbm90IHNldApDT05GSUdfU05EX0ZJ
UkVXSVJFPXkKQ09ORklHX1NORF9GSVJFV0lSRV9MSUI9bQojIENPTkZJR19TTkRfRElDRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9PWEZXIGlzIG5vdCBzZXQKQ09ORklHX1NORF9JU0lHSFQ9bQoj
IENPTkZJR19TTkRfRklSRVdPUktTIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0JFQk9CIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX0ZJUkVXSVJFX0RJR0kwMFggaXMgbm90IHNldAojIENPTkZJR19T
TkRfRklSRVdJUkVfVEFTQ0FNIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0ZJUkVXSVJFX01PVFUg
aXMgbm90IHNldAojIENPTkZJR19TTkRfRklSRUZBQ0UgaXMgbm90IHNldAojIENPTkZJR19TTkRf
UENNQ0lBIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9WSVJUSU8gaXMgbm90IHNldApDT05GSUdfSElEX1NVUFBPUlQ9eQpDT05GSUdfSElEPXkKQ09O
RklHX0hJRF9CQVRURVJZX1NUUkVOR1RIPXkKQ09ORklHX0hJRFJBVz15CkNPTkZJR19VSElEPW0K
Q09ORklHX0hJRF9HRU5FUklDPXkKCiMKIyBTcGVjaWFsIEhJRCBkcml2ZXJzCiMKIyBDT05GSUdf
SElEX0E0VEVDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9BQ0NVVE9VQ0ggaXMgbm90IHNldAoj
IENPTkZJR19ISURfQUNSVVggaXMgbm90IHNldApDT05GSUdfSElEX0FQUExFPXkKIyBDT05GSUdf
SElEX0FQUExFSVIgaXMgbm90IHNldAojIENPTkZJR19ISURfQVNVUyBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9BVVJFQUwgaXMgbm90IHNldAojIENPTkZJR19ISURfQkVMS0lOIGlzIG5vdCBzZXQK
IyBDT05GSUdfSElEX0JFVE9QX0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0JJR0JFTl9GRiBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DSEVSUlkgaXMgbm90IHNldAojIENPTkZJR19ISURfQ0hJ
Q09OWSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DT1JTQUlSIGlzIG5vdCBzZXQKIyBDT05GSUdf
SElEX0NPVUdBUiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NQUNBTExZIGlzIG5vdCBzZXQKIyBD
T05GSUdfSElEX1BST0RJS0VZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DTUVESUEgaXMgbm90
IHNldAojIENPTkZJR19ISURfQ1JFQVRJVkVfU0IwNTQwIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X0NZUFJFU1MgaXMgbm90IHNldAojIENPTkZJR19ISURfRFJBR09OUklTRSBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9FTVNfRkYgaXMgbm90IHNldAojIENPTkZJR19ISURfRUxBTiBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9FTEVDT00gaXMgbm90IHNldAojIENPTkZJR19ISURfRUxPIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX0VWSVNJT04gaXMgbm90IHNldAojIENPTkZJR19ISURfRVpLRVkgaXMg
bm90IHNldAojIENPTkZJR19ISURfRlQyNjAgaXMgbm90IHNldAojIENPTkZJR19ISURfR0VNQklS
RCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9HRlJNIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0dM
T1JJT1VTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0hPTFRFSyBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9HT09HTEVfU1RBRElBX0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1ZJVkFMREkgaXMg
bm90IHNldAojIENPTkZJR19ISURfR1Q2ODNSIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0tFWVRP
VUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0tZRSBpcyBub3Qgc2V0CkNPTkZJR19ISURfVUNM
T0dJQz1tCiMgQ09ORklHX0hJRF9XQUxUT1AgaXMgbm90IHNldAojIENPTkZJR19ISURfVklFV1NP
TklDIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1ZSQzIgaXMgbm90IHNldAojIENPTkZJR19ISURf
WElBT01JIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0dZUkFUSU9OIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX0lDQURFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0lURSBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9KQUJSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9UV0lOSEFOIGlzIG5vdCBzZXQK
IyBDT05GSUdfSElEX0tFTlNJTkdUT04gaXMgbm90IHNldAojIENPTkZJR19ISURfTENQT1dFUiBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJRF9MRUQgaXMgbm90IHNldAojIENPTkZJR19ISURfTEVOT1ZP
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0xFVFNLRVRDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9MT0dJVEVDSCBpcyBub3Qgc2V0CkNPTkZJR19ISURfTUFHSUNNT1VTRT15CiMgQ09ORklHX0hJ
RF9NQUxUUk9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX01BWUZMQVNIIGlzIG5vdCBzZXQKIyBD
T05GSUdfSElEX01FR0FXT1JMRF9GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9SRURSQUdPTiBp
cyBub3Qgc2V0CkNPTkZJR19ISURfTUlDUk9TT0ZUPW0KIyBDT05GSUdfSElEX01PTlRFUkVZIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX01VTFRJVE9VQ0ggaXMgbm90IHNldApDT05GSUdfSElEX05J
TlRFTkRPPW0KIyBDT05GSUdfTklOVEVORE9fRkYgaXMgbm90IHNldAojIENPTkZJR19ISURfTlRJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX05UUklHIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX05W
SURJQV9TSElFTEQgaXMgbm90IHNldAojIENPTkZJR19ISURfT1JURUsgaXMgbm90IHNldAojIENP
TkZJR19ISURfUEFOVEhFUkxPUkQgaXMgbm90IHNldAojIENPTkZJR19ISURfUEVOTU9VTlQgaXMg
bm90IHNldAojIENPTkZJR19ISURfUEVUQUxZTlggaXMgbm90IHNldAojIENPTkZJR19ISURfUElD
T0xDRCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QTEFOVFJPTklDUyBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9QWFJDIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1JBWkVSIGlzIG5vdCBzZXQKIyBD
T05GSUdfSElEX1BSSU1BWCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9SRVRST0RFIGlzIG5vdCBz
ZXQKQ09ORklHX0hJRF9ST0NDQVQ9bQojIENPTkZJR19ISURfU0FJVEVLIGlzIG5vdCBzZXQKIyBD
T05GSUdfSElEX1NBTVNVTkcgaXMgbm90IHNldAojIENPTkZJR19ISURfU0VNSVRFSyBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9TSUdNQU1JQ1JPIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9TT05ZPW0K
IyBDT05GSUdfU09OWV9GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TUEVFRExJTksgaXMgbm90
IHNldAojIENPTkZJR19ISURfU1RFQU0gaXMgbm90IHNldAojIENPTkZJR19ISURfU1RFRUxTRVJJ
RVMgaXMgbm90IHNldAojIENPTkZJR19ISURfU1VOUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9STUkgaXMgbm90IHNldAojIENPTkZJR19ISURfR1JFRU5BU0lBIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX1NNQVJUSk9ZUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9USVZPIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX1RPUFNFRUQgaXMgbm90IHNldAojIENPTkZJR19ISURfVE9QUkUgaXMg
bm90IHNldAojIENPTkZJR19ISURfVEhJTkdNIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1RIUlVT
VE1BU1RFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9VRFJBV19QUzMgaXMgbm90IHNldAojIENP
TkZJR19ISURfVTJGWkVSTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9XQUNPTSBpcyBub3Qgc2V0
CkNPTkZJR19ISURfV0lJTU9URT1tCiMgQ09ORklHX0hJRF9YSU5NTyBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9aRVJPUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9aWURBQ1JPTiBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9TRU5TT1JfSFVCIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0FMUFMg
aXMgbm90IHNldAojIENPTkZJR19ISURfTUNQMjIyMSBpcyBub3Qgc2V0CkNPTkZJR19ISURfS1VO
SVRfVEVTVD1tCiMgZW5kIG9mIFNwZWNpYWwgSElEIGRyaXZlcnMKCiMKIyBISUQtQlBGIHN1cHBv
cnQKIwojIGVuZCBvZiBISUQtQlBGIHN1cHBvcnQKCiMKIyBVU0IgSElEIHN1cHBvcnQKIwpDT05G
SUdfVVNCX0hJRD15CiMgQ09ORklHX0hJRF9QSUQgaXMgbm90IHNldApDT05GSUdfVVNCX0hJRERF
Vj15CiMgZW5kIG9mIFVTQiBISUQgc3VwcG9ydAoKIyBDT05GSUdfSTJDX0hJRCBpcyBub3Qgc2V0
CkNPTkZJR19VU0JfT0hDSV9CSUdfRU5ESUFOX0RFU0M9eQpDT05GSUdfVVNCX09IQ0lfQklHX0VO
RElBTl9NTUlPPXkKQ09ORklHX1VTQl9PSENJX0xJVFRMRV9FTkRJQU49eQpDT05GSUdfVVNCX1NV
UFBPUlQ9eQpDT05GSUdfVVNCX0NPTU1PTj15CiMgQ09ORklHX1VTQl9MRURfVFJJRyBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9VTFBJX0JVUyBpcyBub3Qgc2V0CkNPTkZJR19VU0JfQVJDSF9IQVNf
SENEPXkKQ09ORklHX1VTQj15CkNPTkZJR19VU0JfUENJPXkKIyBDT05GSUdfVVNCX1BDSV9BTUQg
aXMgbm90IHNldApDT05GSUdfVVNCX0FOTk9VTkNFX05FV19ERVZJQ0VTPXkKCiMKIyBNaXNjZWxs
YW5lb3VzIFVTQiBvcHRpb25zCiMKQ09ORklHX1VTQl9ERUZBVUxUX1BFUlNJU1Q9eQojIENPTkZJ
R19VU0JfRkVXX0lOSVRfUkVUUklFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9EWU5BTUlDX01J
Tk9SUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9PVEcgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
T1RHX1BST0RVQ1RMSVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX09UR19ESVNBQkxFX0VYVEVS
TkFMX0hVQiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MRURTX1RSSUdHRVJfVVNCUE9SVCBpcyBu
b3Qgc2V0CkNPTkZJR19VU0JfQVVUT1NVU1BFTkRfREVMQVk9MgpDT05GSUdfVVNCX01PTj1tCgoj
CiMgVVNCIEhvc3QgQ29udHJvbGxlciBEcml2ZXJzCiMKIyBDT05GSUdfVVNCX0M2N1gwMF9IQ0Qg
aXMgbm90IHNldAojIENPTkZJR19VU0JfWEhDSV9IQ0QgaXMgbm90IHNldApDT05GSUdfVVNCX0VI
Q0lfSENEPXkKQ09ORklHX1VTQl9FSENJX1JPT1RfSFVCX1RUPXkKQ09ORklHX1VTQl9FSENJX1RU
X05FV1NDSEVEPXkKQ09ORklHX1VTQl9FSENJX1BDST15CiMgQ09ORklHX1hQU19VU0JfSENEX1hJ
TElOWCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9FSENJX0ZTTCBpcyBub3Qgc2V0CkNPTkZJR19V
U0JfRUhDSV9IQ0RfUFBDX09GPXkKIyBDT05GSUdfVVNCX0VIQ0lfSENEX1BMQVRGT1JNIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX09YVTIxMEhQX0hDRCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9J
U1AxMTZYX0hDRCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfT0hDSV9IQ0Q9eQpDT05GSUdfVVNCX09I
Q0lfSENEX1BQQ19PRl9CRT15CiMgQ09ORklHX1VTQl9PSENJX0hDRF9QUENfT0ZfTEUgaXMgbm90
IHNldApDT05GSUdfVVNCX09IQ0lfSENEX1BQQ19PRj15CkNPTkZJR19VU0JfT0hDSV9IQ0RfUENJ
PW0KIyBDT05GSUdfVVNCX09IQ0lfSENEX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X1VIQ0lfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NMODExX0hDRCBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9SOEE2NjU5N19IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfSENEX1NTQiBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9IQ0RfVEVTVF9NT0RFIGlzIG5vdCBzZXQKCiMKIyBVU0Ig
RGV2aWNlIENsYXNzIGRyaXZlcnMKIwojIENPTkZJR19VU0JfQUNNIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX1BSSU5URVIgaXMgbm90IHNldAojIENPTkZJR19VU0JfV0RNIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1RNQyBpcyBub3Qgc2V0CgojCiMgTk9URTogVVNCX1NUT1JBR0UgZGVwZW5kcyBv
biBTQ1NJIGJ1dCBCTEtfREVWX1NEIG1heQojCgojCiMgYWxzbyBiZSBuZWVkZWQ7IHNlZSBVU0Jf
U1RPUkFHRSBIZWxwIGZvciBtb3JlIGluZm8KIwpDT05GSUdfVVNCX1NUT1JBR0U9bQojIENPTkZJ
R19VU0JfU1RPUkFHRV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX1JFQUxU
RUsgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9EQVRBRkFCIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1NUT1JBR0VfRlJFRUNPTSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdF
X0lTRDIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX1VTQkFUIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1NUT1JBR0VfU0REUjA5IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NUT1JB
R0VfU0REUjU1IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NUT1JBR0VfSlVNUFNIT1QgaXMgbm90
IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9BTEFVREEgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
U1RPUkFHRV9PTkVUT1VDSCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX0tBUk1BIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX1NUT1JBR0VfQ1lQUkVTU19BVEFDQiBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9TVE9SQUdFX0VORV9VQjYyNTAgaXMgbm90IHNldApDT05GSUdfVVNCX1VBUz1t
CgojCiMgVVNCIEltYWdpbmcgZGV2aWNlcwojCiMgQ09ORklHX1VTQl9NREM4MDAgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfTUlDUk9URUsgaXMgbm90IHNldAojIENPTkZJR19VU0JJUF9DT1JFIGlz
IG5vdCBzZXQKCiMKIyBVU0IgZHVhbC1tb2RlIGNvbnRyb2xsZXIgZHJpdmVycwojCiMgQ09ORklH
X1VTQl9DRE5TX1NVUFBPUlQgaXMgbm90IHNldAojIENPTkZJR19VU0JfTVVTQl9IRFJDIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX0RXQzMgaXMgbm90IHNldAojIENPTkZJR19VU0JfRFdDMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9DSElQSURFQSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JU1Ax
NzYwIGlzIG5vdCBzZXQKCiMKIyBVU0IgcG9ydCBkcml2ZXJzCiMKQ09ORklHX1VTQl9TRVJJQUw9
bQojIENPTkZJR19VU0JfU0VSSUFMX0dFTkVSSUMgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VS
SUFMX1NJTVBMRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfQUlSQ0FCTEUgaXMgbm90
IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0FSSzMxMTYgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
U0VSSUFMX0JFTEtJTiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfQ0gzNDEgaXMgbm90
IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1dISVRFSEVBVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9TRVJJQUxfRElHSV9BQ0NFTEVQT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9D
UDIxMFggaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0NZUFJFU1NfTTggaXMgbm90IHNl
dAojIENPTkZJR19VU0JfU0VSSUFMX0VNUEVHIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9TRVJJQUxf
RlRESV9TSU89bQojIENPTkZJR19VU0JfU0VSSUFMX1ZJU09SIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1NFUklBTF9JUEFRIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9JUiBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfRURHRVBPUlQgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
U0VSSUFMX0VER0VQT1JUX1RJIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9GODEyMzIg
aXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0Y4MTUzWCBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9TRVJJQUxfR0FSTUlOIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9JUFcgaXMg
bm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0lVVSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9T
RVJJQUxfS0VZU1BBTl9QREEgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0tFWVNQQU4g
aXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0tMU0kgaXMgbm90IHNldAojIENPTkZJR19V
U0JfU0VSSUFMX0tPQklMX1NDVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfTUNUX1Uy
MzIgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX01FVFJPIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX1NFUklBTF9NT1M3NzIwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9NT1M3
ODQwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9NWFVQT1JUIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1NFUklBTF9OQVZNQU4gaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1BM
MjMwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfT1RJNjg1OCBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9TRVJJQUxfUUNBVVggaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1FV
QUxDT01NIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9TUENQOFg1IGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1NFUklBTF9TQUZFIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9T
SUVSUkFXSVJFTEVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfU1lNQk9MIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9USSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJ
QUxfQ1lCRVJKQUNLIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9PUFRJT04gaXMgbm90
IHNldAojIENPTkZJR19VU0JfU0VSSUFMX09NTklORVQgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
U0VSSUFMX09QVElDT04gaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1hTRU5TX01UIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9XSVNIQk9ORSBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9TRVJJQUxfU1NVMTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9RVDIgaXMg
bm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1VQRDc4RjA3MzAgaXMgbm90IHNldAojIENPTkZJ
R19VU0JfU0VSSUFMX1hSIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9ERUJVRyBpcyBu
b3Qgc2V0CgojCiMgVVNCIE1pc2NlbGxhbmVvdXMgZHJpdmVycwojCiMgQ09ORklHX1VTQl9FTUk2
MiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9FTUkyNiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9B
RFVUVVggaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VWU0VHIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX0xFR09UT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MQ0QgaXMgbm90IHNldAojIENP
TkZJR19VU0JfQ1lQUkVTU19DWTdDNjMgaXMgbm90IHNldAojIENPTkZJR19VU0JfQ1lUSEVSTSBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JRE1PVVNFIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9BUFBM
RURJU1BMQVk9bQojIENPTkZJR19BUFBMRV9NRklfRkFTVENIQVJHRSBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9TSVNVU0JWR0EgaXMgbm90IHNldAojIENPTkZJR19VU0JfTEQgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfVFJBTkNFVklCUkFUT1IgaXMgbm90IHNldAojIENPTkZJR19VU0JfSU9XQVJS
SU9SIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
RUhTRVRfVEVTVF9GSVhUVVJFIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9JU0lHSFRGVz1tCiMgQ09O
RklHX1VTQl9ZVVJFWCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9FWlVTQl9GWDIgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfSFVCX1VTQjI1MVhCIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0hTSUNf
VVNCMzUwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9IU0lDX1VTQjQ2MDQgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfTElOS19MQVlFUl9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0NIQU9T
S0VZIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX09OQk9BUkRfSFVCIGlzIG5vdCBzZXQKCiMKIyBV
U0IgUGh5c2ljYWwgTGF5ZXIgZHJpdmVycwojCiMgQ09ORklHX05PUF9VU0JfWENFSVYgaXMgbm90
IHNldAojIENPTkZJR19VU0JfSVNQMTMwMSBpcyBub3Qgc2V0CiMgZW5kIG9mIFVTQiBQaHlzaWNh
bCBMYXllciBkcml2ZXJzCgojIENPTkZJR19VU0JfR0FER0VUIGlzIG5vdCBzZXQKIyBDT05GSUdf
VFlQRUMgaXMgbm90IHNldAojIENPTkZJR19VU0JfUk9MRV9TV0lUQ0ggaXMgbm90IHNldAojIENP
TkZJR19NTUMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1VGU0hDRCBpcyBub3Qgc2V0CiMgQ09O
RklHX01FTVNUSUNLIGlzIG5vdCBzZXQKQ09ORklHX05FV19MRURTPXkKQ09ORklHX0xFRFNfQ0xB
U1M9eQojIENPTkZJR19MRURTX0NMQVNTX0ZMQVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19D
TEFTU19NVUxUSUNPTE9SIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfQlJJR0hUTkVTU19IV19DSEFO
R0VEPXkKCiMKIyBMRUQgZHJpdmVycwojCiMgQ09ORklHX0xFRFNfQU4zMDI1OUEgaXMgbm90IHNl
dAojIENPTkZJR19MRURTX0FXMjAwWFggaXMgbm90IHNldAojIENPTkZJR19MRURTX0FXMjAxMyBp
cyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQkNNNjMyOCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNf
QkNNNjM1OCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTE0zNTMwIGlzIG5vdCBzZXQKIyBDT05G
SUdfTEVEU19MTTM1MzIgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xNMzY0MiBpcyBub3Qgc2V0
CiMgQ09ORklHX0xFRFNfTE0zNjkyWCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfUENBOTUzMiBp
cyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTFAzOTQ0IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19M
UDU1WFhfQ09NTU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MUDg4NjAgaXMgbm90IHNldAoj
IENPTkZJR19MRURTX1BDQTk1NVggaXMgbm90IHNldAojIENPTkZJR19MRURTX1BDQTk2M1ggaXMg
bm90IHNldAojIENPTkZJR19MRURTX1BDQTk5NVggaXMgbm90IHNldAojIENPTkZJR19MRURTX0JE
MjYwNk1WViBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQkQyODAyIGlzIG5vdCBzZXQKIyBDT05G
SUdfTEVEU19UQ0E2NTA3IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UTEM1OTFYWCBpcyBub3Qg
c2V0CiMgQ09ORklHX0xFRFNfTE0zNTV4IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19JUzMxRkwz
MTlYIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19JUzMxRkwzMlhYIGlzIG5vdCBzZXQKCiMKIyBM
RUQgZHJpdmVyIGZvciBibGluaygxKSBVU0IgUkdCIExFRCBpcyB1bmRlciBTcGVjaWFsIEhJRCBk
cml2ZXJzIChISURfVEhJTkdNKQojCiMgQ09ORklHX0xFRFNfQkxJTktNIGlzIG5vdCBzZXQKIyBD
T05GSUdfTEVEU19NTFhSRUcgaXMgbm90IHNldAojIENPTkZJR19MRURTX1VTRVIgaXMgbm90IHNl
dAojIENPTkZJR19MRURTX0xNMzY5NyBpcyBub3Qgc2V0CgojCiMgRmxhc2ggYW5kIFRvcmNoIExF
RCBkcml2ZXJzCiMKCiMKIyBSR0IgTEVEIGRyaXZlcnMKIwoKIwojIExFRCBUcmlnZ2VycwojCkNP
TkZJR19MRURTX1RSSUdHRVJTPXkKIyBDT05GSUdfTEVEU19UUklHR0VSX1RJTUVSIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX09ORVNIT1QgaXMgbm90IHNldApDT05GSUdfTEVEU19U
UklHR0VSX0RJU0s9eQojIENPTkZJR19MRURTX1RSSUdHRVJfSEVBUlRCRUFUIGlzIG5vdCBzZXQK
IyBDT05GSUdfTEVEU19UUklHR0VSX0JBQ0tMSUdIVCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNf
VFJJR0dFUl9DUFUgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfQUNUSVZJVFkgaXMg
bm90IHNldApDT05GSUdfTEVEU19UUklHR0VSX0RFRkFVTFRfT049eQoKIwojIGlwdGFibGVzIHRy
aWdnZXIgaXMgdW5kZXIgTmV0ZmlsdGVyIGNvbmZpZyAoTEVEIHRhcmdldCkKIwojIENPTkZJR19M
RURTX1RSSUdHRVJfVFJBTlNJRU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0NB
TUVSQSBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RSSUdHRVJfUEFOSUM9eQojIENPTkZJR19MRURT
X1RSSUdHRVJfTkVUREVWIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX1BBVFRFUk4g
aXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfQVVESU8gaXMgbm90IHNldAojIENPTkZJ
R19MRURTX1RSSUdHRVJfVFRZIGlzIG5vdCBzZXQKCiMKIyBTaW1wbGUgTEVEIGRyaXZlcnMKIwoj
IENPTkZJR19BQ0NFU1NJQklMSVRZIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5GSU5JQkFORCBpcyBu
b3Qgc2V0CkNPTkZJR19FREFDX0FUT01JQ19TQ1JVQj15CkNPTkZJR19FREFDX1NVUFBPUlQ9eQpD
T05GSUdfUlRDX0xJQj15CkNPTkZJR19SVENfQ0xBU1M9eQojIENPTkZJR19SVENfSENUT1NZUyBp
cyBub3Qgc2V0CkNPTkZJR19SVENfU1lTVE9IQz15CkNPTkZJR19SVENfU1lTVE9IQ19ERVZJQ0U9
InJ0YzAiCiMgQ09ORklHX1JUQ19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19SVENfTElCX0tVTklU
X1RFU1Q9bQpDT05GSUdfUlRDX05WTUVNPXkKCiMKIyBSVEMgaW50ZXJmYWNlcwojCkNPTkZJR19S
VENfSU5URl9TWVNGUz15CkNPTkZJR19SVENfSU5URl9QUk9DPXkKQ09ORklHX1JUQ19JTlRGX0RF
Vj15CiMgQ09ORklHX1JUQ19JTlRGX0RFVl9VSUVfRU1VTCBpcyBub3Qgc2V0CiMgQ09ORklHX1JU
Q19EUlZfVEVTVCBpcyBub3Qgc2V0CgojCiMgSTJDIFJUQyBkcml2ZXJzCiMKIyBDT05GSUdfUlRD
X0RSVl9BQkI1WkVTMyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfQUJFT1o5IGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlRDX0RSVl9BQlg4MFggaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RT
MTMwNyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxMzc0IGlzIG5vdCBzZXQKIyBDT05G
SUdfUlRDX0RSVl9EUzE2NzIgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0hZTTg1NjMgaXMg
bm90IHNldAojIENPTkZJR19SVENfRFJWX01BWDY5MDAgaXMgbm90IHNldAojIENPTkZJR19SVENf
RFJWX05DVDMwMThZIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SUzVDMzcyIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlRDX0RSVl9JU0wxMjA4IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9J
U0wxMjAyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfSVNMMTIwMjYgaXMgbm90IHNldAoj
IENPTkZJR19SVENfRFJWX1gxMjA1IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9QQ0Y4NTIz
IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9QQ0Y4NTA2MyBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUQ19EUlZfUENGODUzNjMgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1BDRjg1NjMgaXMg
bm90IHNldAojIENPTkZJR19SVENfRFJWX1BDRjg1ODMgaXMgbm90IHNldAojIENPTkZJR19SVENf
RFJWX000MVQ4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfQlEzMksgaXMgbm90IHNldAoj
IENPTkZJR19SVENfRFJWX1MzNTM5MEEgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0ZNMzEz
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlg4MDEwIGlzIG5vdCBzZXQKIyBDT05GSUdf
UlRDX0RSVl9SWDg1ODEgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JYODAyNSBpcyBub3Qg
c2V0CiMgQ09ORklHX1JUQ19EUlZfRU0zMDI3IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9S
VjMwMjggaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JWMzAzMiBpcyBub3Qgc2V0CiMgQ09O
RklHX1JUQ19EUlZfUlY4ODAzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9TRDMwNzggaXMg
bm90IHNldAoKIwojIFNQSSBSVEMgZHJpdmVycwojCkNPTkZJR19SVENfSTJDX0FORF9TUEk9eQoK
IwojIFNQSSBhbmQgSTJDIFJUQyBkcml2ZXJzCiMKIyBDT05GSUdfUlRDX0RSVl9EUzMyMzIgaXMg
bm90IHNldAojIENPTkZJR19SVENfRFJWX1BDRjIxMjcgaXMgbm90IHNldAojIENPTkZJR19SVENf
RFJWX1JWMzAyOUMyIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SWDYxMTAgaXMgbm90IHNl
dAoKIwojIFBsYXRmb3JtIFJUQyBkcml2ZXJzCiMKIyBDT05GSUdfUlRDX0RSVl9DTU9TIGlzIG5v
dCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzEyODYgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJW
X0RTMTUxMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxNTUzIGlzIG5vdCBzZXQKIyBD
T05GSUdfUlRDX0RSVl9EUzE2ODVfRkFNSUxZIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9E
UzE3NDIgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMjQwNCBpcyBub3Qgc2V0CiMgQ09O
RklHX1JUQ19EUlZfU1RLMTdUQTggaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX000OFQ4NiBp
cyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfTTQ4VDM1IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRD
X0RSVl9NNDhUNTkgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX01TTTYyNDIgaXMgbm90IHNl
dAojIENPTkZJR19SVENfRFJWX1JQNUMwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfWllO
UU1QIGlzIG5vdCBzZXQKCiMKIyBvbi1DUFUgUlRDIGRyaXZlcnMKIwpDT05GSUdfUlRDX0RSVl9H
RU5FUklDPXkKIyBDT05GSUdfUlRDX0RSVl9DQURFTkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRD
X0RSVl9GVFJUQzAxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUjczMDEgaXMgbm90IHNl
dAoKIwojIEhJRCBTZW5zb3IgUlRDIGRyaXZlcnMKIwojIENPTkZJR19SVENfRFJWX0dPTERGSVNI
IGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BREVWSUNFUyBpcyBub3Qgc2V0CgojCiMgRE1BQlVGIG9w
dGlvbnMKIwpDT05GSUdfU1lOQ19GSUxFPXkKIyBDT05GSUdfU1dfU1lOQyBpcyBub3Qgc2V0CkNP
TkZJR19VRE1BQlVGPXkKIyBDT05GSUdfRE1BQlVGX01PVkVfTk9USUZZIGlzIG5vdCBzZXQKQ09O
RklHX0RNQUJVRl9ERUJVRz15CkNPTkZJR19ETUFCVUZfU0VMRlRFU1RTPW0KQ09ORklHX0RNQUJV
Rl9IRUFQUz15CiMgQ09ORklHX0RNQUJVRl9TWVNGU19TVEFUUyBpcyBub3Qgc2V0CkNPTkZJR19E
TUFCVUZfSEVBUFNfU1lTVEVNPXkKIyBlbmQgb2YgRE1BQlVGIG9wdGlvbnMKCiMgQ09ORklHX1VJ
TyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZGSU8gaXMgbm90IHNldAojIENPTkZJR19WSVJUX0RSSVZF
UlMgaXMgbm90IHNldApDT05GSUdfVklSVElPX0FOQ0hPUj15CkNPTkZJR19WSVJUSU89eQpDT05G
SUdfVklSVElPX1BDSV9MSUI9eQpDT05GSUdfVklSVElPX1BDSV9MSUJfTEVHQUNZPXkKQ09ORklH
X1ZJUlRJT19NRU5VPXkKQ09ORklHX1ZJUlRJT19QQ0k9eQpDT05GSUdfVklSVElPX1BDSV9MRUdB
Q1k9eQojIENPTkZJR19WSVJUSU9fQkFMTE9PTiBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fSU5Q
VVQ9eQojIENPTkZJR19WSVJUSU9fTU1JTyBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fRE1BX1NI
QVJFRF9CVUZGRVI9bQojIENPTkZJR19WRFBBIGlzIG5vdCBzZXQKQ09ORklHX1ZIT1NUX0lPVExC
PW0KQ09ORklHX1ZIT1NUX1RBU0s9eQpDT05GSUdfVkhPU1Q9bQpDT05GSUdfVkhPU1RfTUVOVT15
CkNPTkZJR19WSE9TVF9ORVQ9bQojIENPTkZJR19WSE9TVF9WU09DSyBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZIT1NUX0NST1NTX0VORElBTl9MRUdBQ1kgaXMgbm90IHNldAoKIwojIE1pY3Jvc29mdCBI
eXBlci1WIGd1ZXN0IHN1cHBvcnQKIwojIGVuZCBvZiBNaWNyb3NvZnQgSHlwZXItViBndWVzdCBz
dXBwb3J0CgojIENPTkZJR19HUkVZQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NRURJIGlzIG5v
dCBzZXQKIyBDT05GSUdfU1RBR0lORyBpcyBub3Qgc2V0CiMgQ09ORklHX0dPTERGSVNIIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMSyBpcyBub3Qgc2V0CiMgQ09ORklHX0hXU1BJTkxPQ0sg
aXMgbm90IHNldAoKIwojIENsb2NrIFNvdXJjZSBkcml2ZXJzCiMKIyBlbmQgb2YgQ2xvY2sgU291
cmNlIGRyaXZlcnMKCiMgQ09ORklHX01BSUxCT1ggaXMgbm90IHNldApDT05GSUdfSU9NTVVfU1VQ
UE9SVD15CgojCiMgR2VuZXJpYyBJT01NVSBQYWdldGFibGUgU3VwcG9ydAojCiMgZW5kIG9mIEdl
bmVyaWMgSU9NTVUgUGFnZXRhYmxlIFN1cHBvcnQKCiMgQ09ORklHX0lPTU1VX0RFQlVHRlMgaXMg
bm90IHNldAojIENPTkZJR19JT01NVUZEIGlzIG5vdCBzZXQKCiMKIyBSZW1vdGVwcm9jIGRyaXZl
cnMKIwojIENPTkZJR19SRU1PVEVQUk9DIGlzIG5vdCBzZXQKIyBlbmQgb2YgUmVtb3RlcHJvYyBk
cml2ZXJzCgojCiMgUnBtc2cgZHJpdmVycwojCiMgQ09ORklHX1JQTVNHX1ZJUlRJTyBpcyBub3Qg
c2V0CiMgZW5kIG9mIFJwbXNnIGRyaXZlcnMKCiMgQ09ORklHX1NPVU5EV0lSRSBpcyBub3Qgc2V0
CgojCiMgU09DIChTeXN0ZW0gT24gQ2hpcCkgc3BlY2lmaWMgRHJpdmVycwojCgojCiMgQW1sb2dp
YyBTb0MgZHJpdmVycwojCiMgZW5kIG9mIEFtbG9naWMgU29DIGRyaXZlcnMKCiMKIyBCcm9hZGNv
bSBTb0MgZHJpdmVycwojCiMgZW5kIG9mIEJyb2FkY29tIFNvQyBkcml2ZXJzCgojCiMgTlhQL0Zy
ZWVzY2FsZSBRb3JJUSBTb0MgZHJpdmVycwojCiMgQ09ORklHX1FVSUNDX0VOR0lORSBpcyBub3Qg
c2V0CiMgZW5kIG9mIE5YUC9GcmVlc2NhbGUgUW9ySVEgU29DIGRyaXZlcnMKCiMKIyBmdWppdHN1
IFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgZnVqaXRzdSBTb0MgZHJpdmVycwoKIwojIGkuTVggU29D
IGRyaXZlcnMKIwojIGVuZCBvZiBpLk1YIFNvQyBkcml2ZXJzCgojCiMgRW5hYmxlIExpdGVYIFNv
QyBCdWlsZGVyIHNwZWNpZmljIGRyaXZlcnMKIwojIENPTkZJR19MSVRFWF9TT0NfQ09OVFJPTExF
UiBpcyBub3Qgc2V0CiMgZW5kIG9mIEVuYWJsZSBMaXRlWCBTb0MgQnVpbGRlciBzcGVjaWZpYyBk
cml2ZXJzCgojIENPTkZJR19XUENNNDUwX1NPQyBpcyBub3Qgc2V0CgojCiMgUXVhbGNvbW0gU29D
IGRyaXZlcnMKIwojIGVuZCBvZiBRdWFsY29tbSBTb0MgZHJpdmVycwoKIyBDT05GSUdfU09DX1RJ
IGlzIG5vdCBzZXQKCiMKIyBYaWxpbnggU29DIGRyaXZlcnMKIwojIGVuZCBvZiBYaWxpbnggU29D
IGRyaXZlcnMKIyBlbmQgb2YgU09DIChTeXN0ZW0gT24gQ2hpcCkgc3BlY2lmaWMgRHJpdmVycwoK
IwojIFBNIERvbWFpbnMKIwoKIwojIEFtbG9naWMgUE0gRG9tYWlucwojCiMgZW5kIG9mIEFtbG9n
aWMgUE0gRG9tYWlucwoKIwojIEJyb2FkY29tIFBNIERvbWFpbnMKIwojIGVuZCBvZiBCcm9hZGNv
bSBQTSBEb21haW5zCgojCiMgaS5NWCBQTSBEb21haW5zCiMKIyBlbmQgb2YgaS5NWCBQTSBEb21h
aW5zCgojCiMgUXVhbGNvbW0gUE0gRG9tYWlucwojCiMgZW5kIG9mIFF1YWxjb21tIFBNIERvbWFp
bnMKIyBlbmQgb2YgUE0gRG9tYWlucwoKIyBDT05GSUdfUE1fREVWRlJFUSBpcyBub3Qgc2V0CiMg
Q09ORklHX0VYVENPTiBpcyBub3Qgc2V0CiMgQ09ORklHX01FTU9SWSBpcyBub3Qgc2V0CiMgQ09O
RklHX0lJTyBpcyBub3Qgc2V0CiMgQ09ORklHX05UQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BXTSBp
cyBub3Qgc2V0CgojCiMgSVJRIGNoaXAgc3VwcG9ydAojCkNPTkZJR19JUlFDSElQPXkKIyBDT05G
SUdfQUxfRklDIGlzIG5vdCBzZXQKIyBDT05GSUdfWElMSU5YX0lOVEMgaXMgbm90IHNldAojIGVu
ZCBvZiBJUlEgY2hpcCBzdXBwb3J0CgojIENPTkZJR19JUEFDS19CVVMgaXMgbm90IHNldAojIENP
TkZJR19SRVNFVF9DT05UUk9MTEVSIGlzIG5vdCBzZXQKCiMKIyBQSFkgU3Vic3lzdGVtCiMKIyBD
T05GSUdfR0VORVJJQ19QSFkgaXMgbm90IHNldAojIENPTkZJR19QSFlfQ0FOX1RSQU5TQ0VJVkVS
IGlzIG5vdCBzZXQKCiMKIyBQSFkgZHJpdmVycyBmb3IgQnJvYWRjb20gcGxhdGZvcm1zCiMKIyBD
T05GSUdfQkNNX0tPTkFfVVNCMl9QSFkgaXMgbm90IHNldAojIGVuZCBvZiBQSFkgZHJpdmVycyBm
b3IgQnJvYWRjb20gcGxhdGZvcm1zCgojIENPTkZJR19QSFlfQ0FERU5DRV9EUEhZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEhZX0NBREVOQ0VfRFBIWV9SWCBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9D
QURFTkNFX1NBTFZPIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1BYQV8yOE5NX0hTSUMgaXMgbm90
IHNldAojIENPTkZJR19QSFlfUFhBXzI4Tk1fVVNCMiBpcyBub3Qgc2V0CiMgZW5kIG9mIFBIWSBT
dWJzeXN0ZW0KCiMgQ09ORklHX1BPV0VSQ0FQIGlzIG5vdCBzZXQKIyBDT05GSUdfTUNCIGlzIG5v
dCBzZXQKCiMKIyBQZXJmb3JtYW5jZSBtb25pdG9yIHN1cHBvcnQKIwojIENPTkZJR19EV0NfUENJ
RV9QTVUgaXMgbm90IHNldAojIGVuZCBvZiBQZXJmb3JtYW5jZSBtb25pdG9yIHN1cHBvcnQKCiMg
Q09ORklHX1JBUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQjQgaXMgbm90IHNldAoKIwojIEFuZHJv
aWQKIwojIENPTkZJR19BTkRST0lEX0JJTkRFUl9JUEMgaXMgbm90IHNldAojIGVuZCBvZiBBbmRy
b2lkCgojIENPTkZJR19EQVggaXMgbm90IHNldApDT05GSUdfTlZNRU09eQpDT05GSUdfTlZNRU1f
U1lTRlM9eQpDT05GSUdfTlZNRU1fTEFZT1VUUz15CgojCiMgTGF5b3V0IFR5cGVzCiMKIyBDT05G
SUdfTlZNRU1fTEFZT1VUX1NMMjhfVlBEIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRU1fTEFZT1VU
X09OSUVfVExWIGlzIG5vdCBzZXQKIyBlbmQgb2YgTGF5b3V0IFR5cGVzCgojIENPTkZJR19OVk1F
TV9STUVNIGlzIG5vdCBzZXQKCiMKIyBIVyB0cmFjaW5nIHN1cHBvcnQKIwojIENPTkZJR19TVE0g
aXMgbm90IHNldAojIENPTkZJR19JTlRFTF9USCBpcyBub3Qgc2V0CiMgZW5kIG9mIEhXIHRyYWNp
bmcgc3VwcG9ydAoKIyBDT05GSUdfRlBHQSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZTSSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NJT1ggaXMgbm90IHNldAojIENPTkZJR19TTElNQlVTIGlzIG5vdCBzZXQK
IyBDT05GSUdfSU5URVJDT05ORUNUIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09VTlRFUiBpcyBub3Qg
c2V0CiMgQ09ORklHX01PU1QgaXMgbm90IHNldAojIENPTkZJR19QRUNJIGlzIG5vdCBzZXQKIyBD
T05GSUdfSFRFIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGV2aWNlIERyaXZlcnMKCiMKIyBGaWxlIHN5
c3RlbXMKIwpDT05GSUdfVkFMSURBVEVfRlNfUEFSU0VSPXkKQ09ORklHX0ZTX0lPTUFQPXkKQ09O
RklHX0JVRkZFUl9IRUFEPXkKQ09ORklHX0xFR0FDWV9ESVJFQ1RfSU89eQojIENPTkZJR19FWFQy
X0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUM19GUyBpcyBub3Qgc2V0CkNPTkZJR19FWFQ0X0ZT
PXkKQ09ORklHX0VYVDRfVVNFX0ZPUl9FWFQyPXkKQ09ORklHX0VYVDRfRlNfUE9TSVhfQUNMPXkK
IyBDT05GSUdfRVhUNF9GU19TRUNVUklUWSBpcyBub3Qgc2V0CiMgQ09ORklHX0VYVDRfREVCVUcg
aXMgbm90IHNldApDT05GSUdfRVhUNF9LVU5JVF9URVNUUz1tCkNPTkZJR19KQkQyPXkKIyBDT05G
SUdfSkJEMl9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19GU19NQkNBQ0hFPXkKIyBDT05GSUdfUkVJ
U0VSRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19KRlNfRlMgaXMgbm90IHNldApDT05GSUdfWEZT
X0ZTPW0KIyBDT05GSUdfWEZTX1NVUFBPUlRfVjQgaXMgbm90IHNldAojIENPTkZJR19YRlNfU1VQ
UE9SVF9BU0NJSV9DSSBpcyBub3Qgc2V0CiMgQ09ORklHX1hGU19RVU9UQSBpcyBub3Qgc2V0CkNP
TkZJR19YRlNfUE9TSVhfQUNMPXkKIyBDT05GSUdfWEZTX1JUIGlzIG5vdCBzZXQKIyBDT05GSUdf
WEZTX09OTElORV9TQ1JVQiBpcyBub3Qgc2V0CiMgQ09ORklHX1hGU19XQVJOIGlzIG5vdCBzZXQK
IyBDT05GSUdfWEZTX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfR0ZTMl9GUyBpcyBub3Qgc2V0
CiMgQ09ORklHX09DRlMyX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0JUUkZTX0ZTPXkKQ09ORklHX0JU
UkZTX0ZTX1BPU0lYX0FDTD15CiMgQ09ORklHX0JUUkZTX0ZTX1JVTl9TQU5JVFlfVEVTVFMgaXMg
bm90IHNldAojIENPTkZJR19CVFJGU19ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0JUUkZTX0FT
U0VSVCBpcyBub3Qgc2V0CiMgQ09ORklHX0JUUkZTX0ZTX1JFRl9WRVJJRlkgaXMgbm90IHNldAoj
IENPTkZJR19OSUxGUzJfRlMgaXMgbm90IHNldAojIENPTkZJR19GMkZTX0ZTIGlzIG5vdCBzZXQK
Q09ORklHX0JDQUNIRUZTX0ZTPW0KIyBDT05GSUdfQkNBQ0hFRlNfUVVPVEEgaXMgbm90IHNldAoj
IENPTkZJR19CQ0FDSEVGU19FUkFTVVJFX0NPRElORyBpcyBub3Qgc2V0CkNPTkZJR19CQ0FDSEVG
U19QT1NJWF9BQ0w9eQojIENPTkZJR19CQ0FDSEVGU19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19C
Q0FDSEVGU19URVNUUz15CiMgQ09ORklHX0JDQUNIRUZTX0xPQ0tfVElNRV9TVEFUUyBpcyBub3Qg
c2V0CiMgQ09ORklHX0JDQUNIRUZTX05PX0xBVEVOQ1lfQUNDVCBpcyBub3Qgc2V0CkNPTkZJR19C
Q0FDSEVGU19TSVhfT1BUSU1JU1RJQ19TUElOPXkKQ09ORklHX01FQU5fQU5EX1ZBUklBTkNFX1VO
SVRfVEVTVD1tCkNPTkZJR19GU19QT1NJWF9BQ0w9eQpDT05GSUdfRVhQT1JURlM9eQojIENPTkZJ
R19FWFBPUlRGU19CTE9DS19PUFMgaXMgbm90IHNldApDT05GSUdfRklMRV9MT0NLSU5HPXkKIyBD
T05GSUdfRlNfRU5DUllQVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZTX1ZFUklUWSBpcyBub3Qg
c2V0CkNPTkZJR19GU05PVElGWT15CkNPTkZJR19ETk9USUZZPXkKQ09ORklHX0lOT1RJRllfVVNF
Uj15CkNPTkZJR19GQU5PVElGWT15CiMgQ09ORklHX0ZBTk9USUZZX0FDQ0VTU19QRVJNSVNTSU9O
UyBpcyBub3Qgc2V0CiMgQ09ORklHX1FVT1RBIGlzIG5vdCBzZXQKQ09ORklHX0FVVE9GU19GUz15
CkNPTkZJR19GVVNFX0ZTPXkKIyBDT05GSUdfQ1VTRSBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9f
RlM9eQojIENPTkZJR19PVkVSTEFZX0ZTIGlzIG5vdCBzZXQKCiMKIyBDYWNoZXMKIwpDT05GSUdf
TkVURlNfU1VQUE9SVD15CiMgQ09ORklHX05FVEZTX1NUQVRTIGlzIG5vdCBzZXQKIyBDT05GSUdf
RlNDQUNIRSBpcyBub3Qgc2V0CiMgZW5kIG9mIENhY2hlcwoKIwojIENELVJPTS9EVkQgRmlsZXN5
c3RlbXMKIwpDT05GSUdfSVNPOTY2MF9GUz15CkNPTkZJR19KT0xJRVQ9eQpDT05GSUdfWklTT0ZT
PXkKQ09ORklHX1VERl9GUz1tCiMgZW5kIG9mIENELVJPTS9EVkQgRmlsZXN5c3RlbXMKCiMKIyBE
T1MvRkFUL0VYRkFUL05UIEZpbGVzeXN0ZW1zCiMKQ09ORklHX0ZBVF9GUz1tCkNPTkZJR19NU0RP
U19GUz1tCkNPTkZJR19WRkFUX0ZTPW0KQ09ORklHX0ZBVF9ERUZBVUxUX0NPREVQQUdFPTQzNwpD
T05GSUdfRkFUX0RFRkFVTFRfSU9DSEFSU0VUPSJpc284ODU5LTE1IgpDT05GSUdfRkFUX0RFRkFV
TFRfVVRGOD15CkNPTkZJR19GQVRfS1VOSVRfVEVTVD1tCkNPTkZJR19FWEZBVF9GUz1tCkNPTkZJ
R19FWEZBVF9ERUZBVUxUX0lPQ0hBUlNFVD0idXRmOCIKIyBDT05GSUdfTlRGU19GUyBpcyBub3Qg
c2V0CkNPTkZJR19OVEZTM19GUz1tCkNPTkZJR19OVEZTM19MWlhfWFBSRVNTPXkKIyBDT05GSUdf
TlRGUzNfRlNfUE9TSVhfQUNMIGlzIG5vdCBzZXQKIyBlbmQgb2YgRE9TL0ZBVC9FWEZBVC9OVCBG
aWxlc3lzdGVtcwoKIwojIFBzZXVkbyBmaWxlc3lzdGVtcwojCkNPTkZJR19QUk9DX0ZTPXkKIyBD
T05GSUdfUFJPQ19LQ09SRSBpcyBub3Qgc2V0CkNPTkZJR19QUk9DX1NZU0NUTD15CkNPTkZJR19Q
Uk9DX1BBR0VfTU9OSVRPUj15CiMgQ09ORklHX1BST0NfQ0hJTERSRU4gaXMgbm90IHNldApDT05G
SUdfS0VSTkZTPXkKQ09ORklHX1NZU0ZTPXkKQ09ORklHX1RNUEZTPXkKQ09ORklHX1RNUEZTX1BP
U0lYX0FDTD15CkNPTkZJR19UTVBGU19YQVRUUj15CiMgQ09ORklHX1RNUEZTX1FVT1RBIGlzIG5v
dCBzZXQKQ09ORklHX0NPTkZJR0ZTX0ZTPW0KIyBlbmQgb2YgUHNldWRvIGZpbGVzeXN0ZW1zCgpD
T05GSUdfTUlTQ19GSUxFU1lTVEVNUz15CiMgQ09ORklHX09SQU5HRUZTX0ZTIGlzIG5vdCBzZXQK
IyBDT05GSUdfQURGU19GUyBpcyBub3Qgc2V0CkNPTkZJR19BRkZTX0ZTPW0KIyBDT05GSUdfRUNS
WVBUX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0hGU19GUz1tCkNPTkZJR19IRlNQTFVTX0ZTPW0KQ09O
RklHX0JFRlNfRlM9bQpDT05GSUdfQkVGU19ERUJVRz15CiMgQ09ORklHX0JGU19GUyBpcyBub3Qg
c2V0CiMgQ09ORklHX0VGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQU1GUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NRVUFTSEZTIGlzIG5vdCBzZXQKIyBDT05GSUdfVlhGU19GUyBpcyBub3Qgc2V0
CiMgQ09ORklHX01JTklYX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfT01GU19GUyBpcyBub3Qgc2V0
CiMgQ09ORklHX0hQRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19RTlg0RlNfRlMgaXMgbm90IHNl
dAojIENPTkZJR19RTlg2RlNfRlMgaXMgbm90IHNldAojIENPTkZJR19ST01GU19GUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1BTVE9SRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU1ZfRlMgaXMgbm90IHNl
dAojIENPTkZJR19VRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19FUk9GU19GUyBpcyBub3Qgc2V0
CkNPTkZJR19ORVRXT1JLX0ZJTEVTWVNURU1TPXkKQ09ORklHX05GU19GUz1tCiMgQ09ORklHX05G
U19WMiBpcyBub3Qgc2V0CiMgQ09ORklHX05GU19WMyBpcyBub3Qgc2V0CkNPTkZJR19ORlNfVjQ9
bQojIENPTkZJR19ORlNfU1dBUCBpcyBub3Qgc2V0CkNPTkZJR19ORlNfVjRfMT15CkNPTkZJR19O
RlNfVjRfMj15CkNPTkZJR19QTkZTX0ZJTEVfTEFZT1VUPW0KQ09ORklHX1BORlNfQkxPQ0s9bQpD
T05GSUdfUE5GU19GTEVYRklMRV9MQVlPVVQ9bQpDT05GSUdfTkZTX1Y0XzFfSU1QTEVNRU5UQVRJ
T05fSURfRE9NQUlOPSJrZXJuZWwub3JnIgojIENPTkZJR19ORlNfVjRfMV9NSUdSQVRJT04gaXMg
bm90IHNldApDT05GSUdfTkZTX1Y0X1NFQ1VSSVRZX0xBQkVMPXkKIyBDT05GSUdfTkZTX0ZTQ0FD
SEUgaXMgbm90IHNldAojIENPTkZJR19ORlNfVVNFX0xFR0FDWV9ETlMgaXMgbm90IHNldApDT05G
SUdfTkZTX1VTRV9LRVJORUxfRE5TPXkKQ09ORklHX05GU19ERUJVRz15CkNPTkZJR19ORlNfRElT
QUJMRV9VRFBfU1VQUE9SVD15CiMgQ09ORklHX05GU19WNF8yX1JFQURfUExVUyBpcyBub3Qgc2V0
CiMgQ09ORklHX05GU0QgaXMgbm90IHNldApDT05GSUdfR1JBQ0VfUEVSSU9EPW0KQ09ORklHX0xP
Q0tEPW0KQ09ORklHX05GU19DT01NT049eQpDT05GSUdfTkZTX1Y0XzJfU1NDX0hFTFBFUj15CkNP
TkZJR19TVU5SUEM9bQpDT05GSUdfU1VOUlBDX0JBQ0tDSEFOTkVMPXkKIyBDT05GSUdfUlBDU0VD
X0dTU19LUkI1IGlzIG5vdCBzZXQKQ09ORklHX1NVTlJQQ19ERUJVRz15CiMgQ09ORklHX0NFUEhf
RlMgaXMgbm90IHNldApDT05GSUdfQ0lGUz1tCkNPTkZJR19DSUZTX1NUQVRTMj15CkNPTkZJR19D
SUZTX0FMTE9XX0lOU0VDVVJFX0xFR0FDWT15CiMgQ09ORklHX0NJRlNfVVBDQUxMIGlzIG5vdCBz
ZXQKQ09ORklHX0NJRlNfWEFUVFI9eQpDT05GSUdfQ0lGU19QT1NJWD15CkNPTkZJR19DSUZTX0RF
QlVHPXkKIyBDT05GSUdfQ0lGU19ERUJVRzIgaXMgbm90IHNldAojIENPTkZJR19DSUZTX0RFQlVH
X0RVTVBfS0VZUyBpcyBub3Qgc2V0CkNPTkZJR19DSUZTX0RGU19VUENBTEw9eQpDT05GSUdfQ0lG
U19TV05fVVBDQUxMPXkKIyBDT05GSUdfU01CX1NFUlZFUiBpcyBub3Qgc2V0CkNPTkZJR19TTUJG
Uz1tCiMgQ09ORklHX0NPREFfRlMgaXMgbm90IHNldAojIENPTkZJR19BRlNfRlMgaXMgbm90IHNl
dApDT05GSUdfOVBfRlM9eQpDT05GSUdfOVBfRlNfUE9TSVhfQUNMPXkKIyBDT05GSUdfOVBfRlNf
U0VDVVJJVFkgaXMgbm90IHNldApDT05GSUdfTkxTPXkKQ09ORklHX05MU19ERUZBVUxUPSJ1dGY4
IgpDT05GSUdfTkxTX0NPREVQQUdFXzQzNz1tCiMgQ09ORklHX05MU19DT0RFUEFHRV83MzcgaXMg
bm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfNzc1IGlzIG5vdCBzZXQKQ09ORklHX05MU19D
T0RFUEFHRV84NTA9bQojIENPTkZJR19OTFNfQ09ERVBBR0VfODUyIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkxTX0NPREVQQUdFXzg1NSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NTcg
aXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODYwIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkxTX0NPREVQQUdFXzg2MSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NjIgaXMg
bm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODYzIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxT
X0NPREVQQUdFXzg2NCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NjUgaXMgbm90
IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODY2IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NP
REVQQUdFXzg2OSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV85MzYgaXMgbm90IHNl
dAojIENPTkZJR19OTFNfQ09ERVBBR0VfOTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQ
QUdFXzkzMiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV85NDkgaXMgbm90IHNldAoj
IENPTkZJR19OTFNfQ09ERVBBR0VfODc0IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlf
OCBpcyBub3Qgc2V0CkNPTkZJR19OTFNfQ09ERVBBR0VfMTI1MD1tCiMgQ09ORklHX05MU19DT0RF
UEFHRV8xMjUxIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0FTQ0lJIGlzIG5vdCBzZXQKQ09ORklH
X05MU19JU084ODU5XzE9bQojIENPTkZJR19OTFNfSVNPODg1OV8yIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkxTX0lTTzg4NTlfMyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzQgaXMgbm90
IHNldAojIENPTkZJR19OTFNfSVNPODg1OV81IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4
NTlfNiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzcgaXMgbm90IHNldAojIENPTkZJ
R19OTFNfSVNPODg1OV85IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfMTMgaXMgbm90
IHNldAojIENPTkZJR19OTFNfSVNPODg1OV8xNCBpcyBub3Qgc2V0CkNPTkZJR19OTFNfSVNPODg1
OV8xNT1tCiMgQ09ORklHX05MU19LT0k4X1IgaXMgbm90IHNldAojIENPTkZJR19OTFNfS09JOF9V
IGlzIG5vdCBzZXQKQ09ORklHX05MU19NQUNfUk9NQU49bQojIENPTkZJR19OTFNfTUFDX0NFTFRJ
QyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfQ0VOVEVVUk8gaXMgbm90IHNldAojIENPTkZJ
R19OTFNfTUFDX0NST0FUSUFOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19DWVJJTExJQyBp
cyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfR0FFTElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxT
X01BQ19HUkVFSyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfSUNFTEFORCBpcyBub3Qgc2V0
CiMgQ09ORklHX05MU19NQUNfSU5VSVQgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX1JPTUFO
SUFOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19UVVJLSVNIIGlzIG5vdCBzZXQKQ09ORklH
X05MU19VVEY4PXkKQ09ORklHX05MU19VQ1MyX1VUSUxTPW0KIyBDT05GSUdfRExNIGlzIG5vdCBz
ZXQKQ09ORklHX1VOSUNPREU9bQojIENPTkZJR19VTklDT0RFX05PUk1BTElaQVRJT05fU0VMRlRF
U1QgaXMgbm90IHNldApDT05GSUdfSU9fV1E9eQojIGVuZCBvZiBGaWxlIHN5c3RlbXMKCiMKIyBT
ZWN1cml0eSBvcHRpb25zCiMKQ09ORklHX0tFWVM9eQpDT05GSUdfS0VZU19SRVFVRVNUX0NBQ0hF
PXkKIyBDT05GSUdfUEVSU0lTVEVOVF9LRVlSSU5HUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RSVVNU
RURfS0VZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0VOQ1JZUFRFRF9LRVlTIGlzIG5vdCBzZXQKQ09O
RklHX0tFWV9ESF9PUEVSQVRJT05TPXkKQ09ORklHX0tFWV9OT1RJRklDQVRJT05TPXkKIyBDT05G
SUdfU0VDVVJJVFlfRE1FU0dfUkVTVFJJQ1QgaXMgbm90IHNldApDT05GSUdfU0VDVVJJVFk9eQoj
IENPTkZJR19TRUNVUklUWUZTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfTkVUV09SSyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX1BBVEggaXMgbm90IHNldApDT05GSUdfSEFSREVO
RURfVVNFUkNPUFk9eQpDT05GSUdfRk9SVElGWV9TT1VSQ0U9eQojIENPTkZJR19TVEFUSUNfVVNF
Uk1PREVIRUxQRVIgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9TTUFDSyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFQ1VSSVRZX1RPTU9ZTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX0FQ
UEFSTU9SIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfTE9BRFBJTiBpcyBub3Qgc2V0CkNP
TkZJR19TRUNVUklUWV9ZQU1BPXkKIyBDT05GSUdfU0VDVVJJVFlfU0FGRVNFVElEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VDVVJJVFlfTE9DS0RPV05fTFNNIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VD
VVJJVFlfTEFORExPQ0sgaXMgbm90IHNldAojIENPTkZJR19JTlRFR1JJVFkgaXMgbm90IHNldApD
T05GSUdfREVGQVVMVF9TRUNVUklUWV9EQUM9eQpDT05GSUdfTFNNPSJsYW5kbG9jayxsb2NrZG93
bix5YW1hLGxvYWRwaW4sc2FmZXNldGlkLGludGVncml0eSxicGYiCgojCiMgS2VybmVsIGhhcmRl
bmluZyBvcHRpb25zCiMKCiMKIyBNZW1vcnkgaW5pdGlhbGl6YXRpb24KIwpDT05GSUdfQ0NfSEFT
X0FVVE9fVkFSX0lOSVRfUEFUVEVSTj15CkNPTkZJR19DQ19IQVNfQVVUT19WQVJfSU5JVF9aRVJP
X0JBUkU9eQpDT05GSUdfQ0NfSEFTX0FVVE9fVkFSX0lOSVRfWkVSTz15CiMgQ09ORklHX0lOSVRf
U1RBQ0tfTk9ORSBpcyBub3Qgc2V0CkNPTkZJR19JTklUX1NUQUNLX0FMTF9QQVRURVJOPXkKIyBD
T05GSUdfSU5JVF9TVEFDS19BTExfWkVSTyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOSVRfT05fQUxM
T0NfREVGQVVMVF9PTiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOSVRfT05fRlJFRV9ERUZBVUxUX09O
IGlzIG5vdCBzZXQKQ09ORklHX0NDX0hBU19aRVJPX0NBTExfVVNFRF9SRUdTPXkKIyBDT05GSUdf
WkVST19DQUxMX1VTRURfUkVHUyBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lbW9yeSBpbml0aWFsaXph
dGlvbgoKIwojIEhhcmRlbmluZyBvZiBrZXJuZWwgZGF0YSBzdHJ1Y3R1cmVzCiMKQ09ORklHX0xJ
U1RfSEFSREVORUQ9eQpDT05GSUdfQlVHX09OX0RBVEFfQ09SUlVQVElPTj15CiMgZW5kIG9mIEhh
cmRlbmluZyBvZiBrZXJuZWwgZGF0YSBzdHJ1Y3R1cmVzCgpDT05GSUdfUkFORFNUUlVDVF9OT05F
PXkKIyBDT05GSUdfUkFORFNUUlVDVF9GVUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFORFNUUlVD
VF9QRVJGT1JNQU5DRSBpcyBub3Qgc2V0CiMgZW5kIG9mIEtlcm5lbCBoYXJkZW5pbmcgb3B0aW9u
cwojIGVuZCBvZiBTZWN1cml0eSBvcHRpb25zCgpDT05GSUdfWE9SX0JMT0NLUz15CkNPTkZJR19D
UllQVE89eQoKIwojIENyeXB0byBjb3JlIG9yIGhlbHBlcgojCkNPTkZJR19DUllQVE9fQUxHQVBJ
PXkKQ09ORklHX0NSWVBUT19BTEdBUEkyPXkKQ09ORklHX0NSWVBUT19BRUFEPW0KQ09ORklHX0NS
WVBUT19BRUFEMj15CkNPTkZJR19DUllQVE9fU0lHMj15CkNPTkZJR19DUllQVE9fU0tDSVBIRVI9
bQpDT05GSUdfQ1JZUFRPX1NLQ0lQSEVSMj15CkNPTkZJR19DUllQVE9fSEFTSD15CkNPTkZJR19D
UllQVE9fSEFTSDI9eQpDT05GSUdfQ1JZUFRPX1JORz1tCkNPTkZJR19DUllQVE9fUk5HMj15CkNP
TkZJR19DUllQVE9fUk5HX0RFRkFVTFQ9bQpDT05GSUdfQ1JZUFRPX0FLQ0lQSEVSMj15CkNPTkZJ
R19DUllQVE9fQUtDSVBIRVI9eQpDT05GSUdfQ1JZUFRPX0tQUDI9eQpDT05GSUdfQ1JZUFRPX0tQ
UD15CkNPTkZJR19DUllQVE9fQUNPTVAyPXkKQ09ORklHX0NSWVBUT19NQU5BR0VSPXkKQ09ORklH
X0NSWVBUT19NQU5BR0VSMj15CkNPTkZJR19DUllQVE9fVVNFUj1tCiMgQ09ORklHX0NSWVBUT19N
QU5BR0VSX0RJU0FCTEVfVEVTVFMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fTUFOQUdFUl9F
WFRSQV9URVNUUyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fTlVMTD1tCkNPTkZJR19DUllQVE9f
TlVMTDI9bQpDT05GSUdfQ1JZUFRPX1BDUllQVD1tCkNPTkZJR19DUllQVE9fQ1JZUFREPW0KQ09O
RklHX0NSWVBUT19BVVRIRU5DPW0KIyBDT05GSUdfQ1JZUFRPX1RFU1QgaXMgbm90IHNldApDT05G
SUdfQ1JZUFRPX0VOR0lORT1tCiMgZW5kIG9mIENyeXB0byBjb3JlIG9yIGhlbHBlcgoKIwojIFB1
YmxpYy1rZXkgY3J5cHRvZ3JhcGh5CiMKQ09ORklHX0NSWVBUT19SU0E9eQpDT05GSUdfQ1JZUFRP
X0RIPXkKIyBDT05GSUdfQ1JZUFRPX0RIX1JGQzc5MTlfR1JPVVBTIGlzIG5vdCBzZXQKQ09ORklH
X0NSWVBUT19FQ0M9bQpDT05GSUdfQ1JZUFRPX0VDREg9bQojIENPTkZJR19DUllQVE9fRUNEU0Eg
aXMgbm90IHNldAojIENPTkZJR19DUllQVE9fRUNSRFNBIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX1NNMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DVVJWRTI1NTE5IGlzIG5vdCBzZXQK
IyBlbmQgb2YgUHVibGljLWtleSBjcnlwdG9ncmFwaHkKCiMKIyBCbG9jayBjaXBoZXJzCiMKQ09O
RklHX0NSWVBUT19BRVM9bQojIENPTkZJR19DUllQVE9fQUVTX1RJIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ1JZUFRPX0FSSUEgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQkxPV0ZJU0ggaXMgbm90
IHNldAojIENPTkZJR19DUllQVE9fQ0FNRUxMSUEgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9f
Q0FTVDUgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQ0FTVDYgaXMgbm90IHNldApDT05GSUdf
Q1JZUFRPX0RFUz1tCiMgQ09ORklHX0NSWVBUT19GQ1JZUFQgaXMgbm90IHNldAojIENPTkZJR19D
UllQVE9fU0VSUEVOVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TTTRfR0VORVJJQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19UV09GSVNIIGlzIG5vdCBzZXQKIyBlbmQgb2YgQmxvY2sg
Y2lwaGVycwoKIwojIExlbmd0aC1wcmVzZXJ2aW5nIGNpcGhlcnMgYW5kIG1vZGVzCiMKQ09ORklH
X0NSWVBUT19BRElBTlRVTT1tCkNPTkZJR19DUllQVE9fQ0hBQ0hBMjA9bQpDT05GSUdfQ1JZUFRP
X0NCQz1tCkNPTkZJR19DUllQVE9fQ1RSPW0KIyBDT05GSUdfQ1JZUFRPX0NUUyBpcyBub3Qgc2V0
CkNPTkZJR19DUllQVE9fRUNCPW0KIyBDT05GSUdfQ1JZUFRPX0hDVFIyIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ1JZUFRPX0tFWVdSQVAgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fTFJXIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1JZUFRPX1BDQkMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1hUUz1t
CkNPTkZJR19DUllQVE9fTkhQT0xZMTMwNT1tCiMgZW5kIG9mIExlbmd0aC1wcmVzZXJ2aW5nIGNp
cGhlcnMgYW5kIG1vZGVzCgojCiMgQUVBRCAoYXV0aGVudGljYXRlZCBlbmNyeXB0aW9uIHdpdGgg
YXNzb2NpYXRlZCBkYXRhKSBjaXBoZXJzCiMKIyBDT05GSUdfQ1JZUFRPX0FFR0lTMTI4IGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1JZUFRPX0NIQUNIQTIwUE9MWTEzMDUgaXMgbm90IHNldApDT05GSUdf
Q1JZUFRPX0NDTT1tCkNPTkZJR19DUllQVE9fR0NNPW0KQ09ORklHX0NSWVBUT19HRU5JVj1tCkNP
TkZJR19DUllQVE9fU0VRSVY9bQpDT05GSUdfQ1JZUFRPX0VDSEFJTklWPW0KQ09ORklHX0NSWVBU
T19FU1NJVj1tCiMgZW5kIG9mIEFFQUQgKGF1dGhlbnRpY2F0ZWQgZW5jcnlwdGlvbiB3aXRoIGFz
c29jaWF0ZWQgZGF0YSkgY2lwaGVycwoKIwojIEhhc2hlcywgZGlnZXN0cywgYW5kIE1BQ3MKIwpD
T05GSUdfQ1JZUFRPX0JMQUtFMkI9eQpDT05GSUdfQ1JZUFRPX0NNQUM9bQpDT05GSUdfQ1JZUFRP
X0dIQVNIPW0KQ09ORklHX0NSWVBUT19ITUFDPXkKIyBDT05GSUdfQ1JZUFRPX01ENCBpcyBub3Qg
c2V0CkNPTkZJR19DUllQVE9fTUQ1PW0KIyBDT05GSUdfQ1JZUFRPX01JQ0hBRUxfTUlDIGlzIG5v
dCBzZXQKQ09ORklHX0NSWVBUT19QT0xZMTMwNT1tCiMgQ09ORklHX0NSWVBUT19STUQxNjAgaXMg
bm90IHNldApDT05GSUdfQ1JZUFRPX1NIQTE9bQpDT05GSUdfQ1JZUFRPX1NIQTI1Nj15CkNPTkZJ
R19DUllQVE9fU0hBNTEyPW0KQ09ORklHX0NSWVBUT19TSEEzPW0KIyBDT05GSUdfQ1JZUFRPX1NN
M19HRU5FUklDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NUUkVFQk9HIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ1JZUFRPX1ZNQUMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fV1A1MTIgaXMg
bm90IHNldAojIENPTkZJR19DUllQVE9fWENCQyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fWFhI
QVNIPXkKIyBlbmQgb2YgSGFzaGVzLCBkaWdlc3RzLCBhbmQgTUFDcwoKIwojIENSQ3MgKGN5Y2xp
YyByZWR1bmRhbmN5IGNoZWNrcykKIwpDT05GSUdfQ1JZUFRPX0NSQzMyQz15CiMgQ09ORklHX0NS
WVBUT19DUkMzMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DUkNUMTBESUYgaXMgbm90IHNl
dAojIENPTkZJR19DUllQVE9fQ1JDNjRfUk9DS1NPRlQgaXMgbm90IHNldAojIGVuZCBvZiBDUkNz
IChjeWNsaWMgcmVkdW5kYW5jeSBjaGVja3MpCgojCiMgQ29tcHJlc3Npb24KIwpDT05GSUdfQ1JZ
UFRPX0RFRkxBVEU9bQpDT05GSUdfQ1JZUFRPX0xaTz15CiMgQ09ORklHX0NSWVBUT184NDIgaXMg
bm90IHNldApDT05GSUdfQ1JZUFRPX0xaND1tCiMgQ09ORklHX0NSWVBUT19MWjRIQyBpcyBub3Qg
c2V0CkNPTkZJR19DUllQVE9fWlNURD15CiMgZW5kIG9mIENvbXByZXNzaW9uCgojCiMgUmFuZG9t
IG51bWJlciBnZW5lcmF0aW9uCiMKIyBDT05GSUdfQ1JZUFRPX0FOU0lfQ1BSTkcgaXMgbm90IHNl
dApDT05GSUdfQ1JZUFRPX0RSQkdfTUVOVT1tCkNPTkZJR19DUllQVE9fRFJCR19ITUFDPXkKIyBD
T05GSUdfQ1JZUFRPX0RSQkdfSEFTSCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fRFJCR19DVFI9
eQpDT05GSUdfQ1JZUFRPX0RSQkc9bQpDT05GSUdfQ1JZUFRPX0pJVFRFUkVOVFJPUFk9bQpDT05G
SUdfQ1JZUFRPX0pJVFRFUkVOVFJPUFlfTUVNT1JZX0JMT0NLUz02NApDT05GSUdfQ1JZUFRPX0pJ
VFRFUkVOVFJPUFlfTUVNT1JZX0JMT0NLU0laRT0zMgpDT05GSUdfQ1JZUFRPX0pJVFRFUkVOVFJP
UFlfT1NSPTEKQ09ORklHX0NSWVBUT19LREY4MDAxMDhfQ1RSPXkKIyBlbmQgb2YgUmFuZG9tIG51
bWJlciBnZW5lcmF0aW9uCgojCiMgVXNlcnNwYWNlIGludGVyZmFjZQojCkNPTkZJR19DUllQVE9f
VVNFUl9BUEk9eQpDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX0hBU0g9eQpDT05GSUdfQ1JZUFRPX1VT
RVJfQVBJX1NLQ0lQSEVSPW0KQ09ORklHX0NSWVBUT19VU0VSX0FQSV9STkc9bQojIENPTkZJR19D
UllQVE9fVVNFUl9BUElfUk5HX0NBVlAgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1VTRVJfQVBJ
X0FFQUQ9bQojIENPTkZJR19DUllQVE9fVVNFUl9BUElfRU5BQkxFX09CU09MRVRFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ1JZUFRPX1NUQVRTIGlzIG5vdCBzZXQKIyBlbmQgb2YgVXNlcnNwYWNlIGlu
dGVyZmFjZQoKQ09ORklHX0NSWVBUT19IQVNIX0lORk89eQoKIwojIEFjY2VsZXJhdGVkIENyeXB0
b2dyYXBoaWMgQWxnb3JpdGhtcyBmb3IgQ1BVIChwb3dlcnBjKQojCkNPTkZJR19DUllQVE9fTUQ1
X1BQQz1tCkNPTkZJR19DUllQVE9fU0hBMV9QUEM9bQojIGVuZCBvZiBBY2NlbGVyYXRlZCBDcnlw
dG9ncmFwaGljIEFsZ29yaXRobXMgZm9yIENQVSAocG93ZXJwYykKCkNPTkZJR19DUllQVE9fSFc9
eQojIENPTkZJR19DUllQVE9fREVWX0hJRk5fNzk1WCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBU
T19ERVZfQVRNRUxfRUNDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9BVE1FTF9TSEEy
MDRBIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19ERVZfVklSVElPPW0KIyBDT05GSUdfQ1JZUFRP
X0RFVl9TQUZFWENFTCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfQ0NSRUUgaXMgbm90
IHNldAojIENPTkZJR19DUllQVE9fREVWX0FNTE9HSUNfR1hMIGlzIG5vdCBzZXQKQ09ORklHX0FT
WU1NRVRSSUNfS0VZX1RZUEU9eQpDT05GSUdfQVNZTU1FVFJJQ19QVUJMSUNfS0VZX1NVQlRZUEU9
eQpDT05GSUdfWDUwOV9DRVJUSUZJQ0FURV9QQVJTRVI9eQpDT05GSUdfUEtDUzhfUFJJVkFURV9L
RVlfUEFSU0VSPW0KQ09ORklHX1BLQ1M3X01FU1NBR0VfUEFSU0VSPXkKIyBDT05GSUdfUEtDUzdf
VEVTVF9LRVkgaXMgbm90IHNldAojIENPTkZJR19TSUdORURfUEVfRklMRV9WRVJJRklDQVRJT04g
aXMgbm90IHNldAojIENPTkZJR19GSVBTX1NJR05BVFVSRV9TRUxGVEVTVCBpcyBub3Qgc2V0Cgoj
CiMgQ2VydGlmaWNhdGVzIGZvciBzaWduYXR1cmUgY2hlY2tpbmcKIwpDT05GSUdfU1lTVEVNX1RS
VVNURURfS0VZUklORz15CkNPTkZJR19TWVNURU1fVFJVU1RFRF9LRVlTPSIiCiMgQ09ORklHX1NZ
U1RFTV9FWFRSQV9DRVJUSUZJQ0FURSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ09OREFSWV9UUlVT
VEVEX0tFWVJJTkcgaXMgbm90IHNldAojIENPTkZJR19TWVNURU1fQkxBQ0tMSVNUX0tFWVJJTkcg
aXMgbm90IHNldAojIGVuZCBvZiBDZXJ0aWZpY2F0ZXMgZm9yIHNpZ25hdHVyZSBjaGVja2luZwoK
Q09ORklHX0JJTkFSWV9QUklOVEY9eQoKIwojIExpYnJhcnkgcm91dGluZXMKIwpDT05GSUdfUkFJ
RDZfUFE9eQpDT05GSUdfUkFJRDZfUFFfQkVOQ0hNQVJLPXkKQ09ORklHX0xJTkVBUl9SQU5HRVM9
bQojIENPTkZJR19QQUNLSU5HIGlzIG5vdCBzZXQKQ09ORklHX0JJVFJFVkVSU0U9eQpDT05GSUdf
R0VORVJJQ19TVFJOQ1BZX0ZST01fVVNFUj15CkNPTkZJR19HRU5FUklDX1NUUk5MRU5fVVNFUj15
CkNPTkZJR19HRU5FUklDX05FVF9VVElMUz15CiMgQ09ORklHX0NPUkRJQyBpcyBub3Qgc2V0CkNP
TkZJR19QUklNRV9OVU1CRVJTPW0KQ09ORklHX0dFTkVSSUNfUENJX0lPTUFQPXkKCiMKIyBDcnlw
dG8gbGlicmFyeSByb3V0aW5lcwojCkNPTkZJR19DUllQVE9fTElCX1VUSUxTPXkKQ09ORklHX0NS
WVBUT19MSUJfQUVTPW0KQ09ORklHX0NSWVBUT19MSUJfQVJDND1tCkNPTkZJR19DUllQVE9fTElC
X0dGMTI4TVVMPW0KQ09ORklHX0NSWVBUT19MSUJfQkxBS0UyU19HRU5FUklDPXkKQ09ORklHX0NS
WVBUT19MSUJfQ0hBQ0hBX0dFTkVSSUM9bQpDT05GSUdfQ1JZUFRPX0xJQl9DSEFDSEE9bQpDT05G
SUdfQ1JZUFRPX0xJQl9DVVJWRTI1NTE5X0dFTkVSSUM9bQpDT05GSUdfQ1JZUFRPX0xJQl9DVVJW
RTI1NTE5PW0KQ09ORklHX0NSWVBUT19MSUJfREVTPW0KQ09ORklHX0NSWVBUT19MSUJfUE9MWTEz
MDVfUlNJWkU9MQpDT05GSUdfQ1JZUFRPX0xJQl9QT0xZMTMwNV9HRU5FUklDPW0KQ09ORklHX0NS
WVBUT19MSUJfUE9MWTEzMDU9bQpDT05GSUdfQ1JZUFRPX0xJQl9DSEFDSEEyMFBPTFkxMzA1PW0K
Q09ORklHX0NSWVBUT19MSUJfU0hBMT15CkNPTkZJR19DUllQVE9fTElCX1NIQTI1Nj15CiMgZW5k
IG9mIENyeXB0byBsaWJyYXJ5IHJvdXRpbmVzCgojIENPTkZJR19DUkNfQ0NJVFQgaXMgbm90IHNl
dApDT05GSUdfQ1JDMTY9eQojIENPTkZJR19DUkNfVDEwRElGIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q1JDNjRfUk9DS1NPRlQgaXMgbm90IHNldApDT05GSUdfQ1JDX0lUVV9UPW0KQ09ORklHX0NSQzMy
PXkKIyBDT05GSUdfQ1JDMzJfU0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdfQ1JDMzJfU0xJQ0VC
WTg9eQojIENPTkZJR19DUkMzMl9TTElDRUJZNCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQzMyX1NB
UldBVEUgaXMgbm90IHNldAojIENPTkZJR19DUkMzMl9CSVQgaXMgbm90IHNldApDT05GSUdfQ1JD
NjQ9bQojIENPTkZJR19DUkM0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JDNyBpcyBub3Qgc2V0CkNP
TkZJR19MSUJDUkMzMkM9eQojIENPTkZJR19DUkM4IGlzIG5vdCBzZXQKQ09ORklHX1hYSEFTSD15
CiMgQ09ORklHX1JBTkRPTTMyX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX1pMSUJfSU5GTEFU
RT15CkNPTkZJR19aTElCX0RFRkxBVEU9eQpDT05GSUdfTFpPX0NPTVBSRVNTPXkKQ09ORklHX0xa
T19ERUNPTVBSRVNTPXkKQ09ORklHX0xaNF9DT01QUkVTUz1tCkNPTkZJR19MWjRIQ19DT01QUkVT
Uz1tCkNPTkZJR19MWjRfREVDT01QUkVTUz1tCkNPTkZJR19aU1REX0NPTU1PTj15CkNPTkZJR19a
U1REX0NPTVBSRVNTPXkKQ09ORklHX1pTVERfREVDT01QUkVTUz15CiMgQ09ORklHX1haX0RFQyBp
cyBub3Qgc2V0CkNPTkZJR19ERUNPTVBSRVNTX0daSVA9eQpDT05GSUdfR0VORVJJQ19BTExPQ0FU
T1I9eQpDT05GSUdfUkVFRF9TT0xPTU9OPW0KQ09ORklHX1JFRURfU09MT01PTl9FTkMxNj15CkNP
TkZJR19SRUVEX1NPTE9NT05fREVDMTY9eQpDT05GSUdfSU5URVJWQUxfVFJFRT15CkNPTkZJR19B
U1NPQ0lBVElWRV9BUlJBWT15CkNPTkZJR19DTE9TVVJFUz15CkNPTkZJR19IQVNfSU9NRU09eQpD
T05GSUdfSEFTX0lPUE9SVD15CkNPTkZJR19IQVNfSU9QT1JUX01BUD15CkNPTkZJR19IQVNfRE1B
PXkKQ09ORklHX05FRURfU0dfRE1BX0xFTkdUSD15CkNPTkZJR19ETUFfREVDTEFSRV9DT0hFUkVO
VD15CkNPTkZJR19BUkNIX0RNQV9ERUZBVUxUX0NPSEVSRU5UPXkKIyBDT05GSUdfRE1BX0FQSV9E
RUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQV9NQVBfQkVOQ0hNQVJLIGlzIG5vdCBzZXQKQ09O
RklHX1NHTF9BTExPQz15CiMgQ09ORklHX0ZPUkNFX05SX0NQVVMgaXMgbm90IHNldApDT05GSUdf
Q1BVX1JNQVA9eQpDT05GSUdfRFFMPXkKQ09ORklHX0dMT0I9eQojIENPTkZJR19HTE9CX1NFTEZU
RVNUIGlzIG5vdCBzZXQKQ09ORklHX05MQVRUUj15CkNPTkZJR19HRU5FUklDX0FUT01JQzY0PXkK
Q09ORklHX0NMWl9UQUI9eQojIENPTkZJR19JUlFfUE9MTCBpcyBub3Qgc2V0CkNPTkZJR19NUElM
SUI9eQpDT05GSUdfRElNTElCPXkKQ09ORklHX0xJQkZEVD15CkNPTkZJR19PSURfUkVHSVNUUlk9
eQpDT05GSUdfSEFWRV9HRU5FUklDX1ZEU089eQpDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVk9
eQpDT05GSUdfR0VORVJJQ19WRFNPX1RJTUVfTlM9eQpDT05GSUdfRk9OVF9TVVBQT1JUPXkKIyBD
T05GSUdfRk9OVFMgaXMgbm90IHNldApDT05GSUdfRk9OVF84eDg9eQpDT05GSUdfRk9OVF84eDE2
PXkKQ09ORklHX0ZPTlRfU1VOOHgxNj15CkNPTkZJR19TR19QT09MPXkKQ09ORklHX0FSQ0hfSEFT
X1BNRU1fQVBJPXkKQ09ORklHX0FSQ0hfSEFTX1VBQ0NFU1NfRkxVU0hDQUNIRT15CkNPTkZJR19B
UkNIX1NUQUNLV0FMSz15CkNPTkZJR19TVEFDS0RFUE9UPXkKQ09ORklHX1NUQUNLREVQT1RfQUxX
QVlTX0lOSVQ9eQpDT05GSUdfU1RBQ0tERVBPVF9NQVhfRlJBTUVTPTY0CkNPTkZJR19TQklUTUFQ
PXkKIyBDT05GSUdfTFdRX1RFU1QgaXMgbm90IHNldAojIGVuZCBvZiBMaWJyYXJ5IHJvdXRpbmVz
CgpDT05GSUdfR0VORVJJQ19JT1JFTUFQPXkKCiMKIyBLZXJuZWwgaGFja2luZwojCgojCiMgcHJp
bnRrIGFuZCBkbWVzZyBvcHRpb25zCiMKQ09ORklHX1BSSU5US19USU1FPXkKIyBDT05GSUdfUFJJ
TlRLX0NBTExFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NUQUNLVFJBQ0VfQlVJTERfSUQgaXMgbm90
IHNldApDT05GSUdfQ09OU09MRV9MT0dMRVZFTF9ERUZBVUxUPTcKQ09ORklHX0NPTlNPTEVfTE9H
TEVWRUxfUVVJRVQ9NApDT05GSUdfTUVTU0FHRV9MT0dMRVZFTF9ERUZBVUxUPTQKIyBDT05GSUdf
RFlOQU1JQ19ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0RZTkFNSUNfREVCVUdfQ09SRSBpcyBu
b3Qgc2V0CkNPTkZJR19TWU1CT0xJQ19FUlJOQU1FPXkKQ09ORklHX0RFQlVHX0JVR1ZFUkJPU0U9
eQojIGVuZCBvZiBwcmludGsgYW5kIGRtZXNnIG9wdGlvbnMKCkNPTkZJR19ERUJVR19LRVJORUw9
eQojIENPTkZJR19ERUJVR19NSVNDIGlzIG5vdCBzZXQKCiMKIyBDb21waWxlLXRpbWUgY2hlY2tz
IGFuZCBjb21waWxlciBvcHRpb25zCiMKQ09ORklHX0FTX0hBU19OT05fQ09OU1RfVUxFQjEyOD15
CkNPTkZJR19ERUJVR19JTkZPX05PTkU9eQojIENPTkZJR19ERUJVR19JTkZPX0RXQVJGX1RPT0xD
SEFJTl9ERUZBVUxUIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfSU5GT19EV0FSRjQgaXMgbm90
IHNldAojIENPTkZJR19ERUJVR19JTkZPX0RXQVJGNSBpcyBub3Qgc2V0CkNPTkZJR19GUkFNRV9X
QVJOPTEwMjQKQ09ORklHX1NUUklQX0FTTV9TWU1TPXkKIyBDT05GSUdfUkVBREFCTEVfQVNNIGlz
IG5vdCBzZXQKIyBDT05GSUdfSEVBREVSU19JTlNUQUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfREVC
VUdfU0VDVElPTl9NSVNNQVRDSCBpcyBub3Qgc2V0CkNPTkZJR19TRUNUSU9OX01JU01BVENIX1dB
Uk5fT05MWT15CiMgQ09ORklHX0RFQlVHX0ZPUkNFX0ZVTkNUSU9OX0FMSUdOXzY0QiBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZNTElOVVhfTUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfRk9SQ0Vf
V0VBS19QRVJfQ1BVIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ29tcGlsZS10aW1lIGNoZWNrcyBhbmQg
Y29tcGlsZXIgb3B0aW9ucwoKIwojIEdlbmVyaWMgS2VybmVsIERlYnVnZ2luZyBJbnN0cnVtZW50
cwojCiMgQ09ORklHX01BR0lDX1NZU1JRIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0ZTPXkKQ09O
RklHX0RFQlVHX0ZTX0FMTE9XX0FMTD15CiMgQ09ORklHX0RFQlVHX0ZTX0RJU0FMTE9XX01PVU5U
IGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfRlNfQUxMT1dfTk9ORSBpcyBub3Qgc2V0CkNPTkZJ
R19IQVZFX0FSQ0hfS0dEQj15CiMgQ09ORklHX0tHREIgaXMgbm90IHNldApDT05GSUdfQVJDSF9I
QVNfVUJTQU5fU0FOSVRJWkVfQUxMPXkKIyBDT05GSUdfVUJTQU4gaXMgbm90IHNldApDT05GSUdf
SEFWRV9BUkNIX0tDU0FOPXkKQ09ORklHX0hBVkVfS0NTQU5fQ09NUElMRVI9eQojIGVuZCBvZiBH
ZW5lcmljIEtlcm5lbCBEZWJ1Z2dpbmcgSW5zdHJ1bWVudHMKCiMKIyBOZXR3b3JraW5nIERlYnVn
Z2luZwojCiMgQ09ORklHX05FVF9ERVZfUkVGQ05UX1RSQUNLRVIgaXMgbm90IHNldAojIENPTkZJ
R19ORVRfTlNfUkVGQ05UX1RSQUNLRVIgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19ORVQgaXMg
bm90IHNldAojIGVuZCBvZiBOZXR3b3JraW5nIERlYnVnZ2luZwoKIwojIE1lbW9yeSBEZWJ1Z2dp
bmcKIwpDT05GSUdfUEFHRV9FWFRFTlNJT049eQpDT05GSUdfREVCVUdfUEFHRUFMTE9DPXkKIyBD
T05GSUdfREVCVUdfUEFHRUFMTE9DX0VOQUJMRV9ERUZBVUxUIGlzIG5vdCBzZXQKQ09ORklHX1NM
VUJfREVCVUc9eQojIENPTkZJR19TTFVCX0RFQlVHX09OIGlzIG5vdCBzZXQKQ09ORklHX1BBR0Vf
T1dORVI9eQpDT05GSUdfUEFHRV9QT0lTT05JTkc9eQpDT05GSUdfREVCVUdfUk9EQVRBX1RFU1Q9
eQpDT05GSUdfQVJDSF9IQVNfREVCVUdfV1g9eQpDT05GSUdfREVCVUdfV1g9eQpDT05GSUdfR0VO
RVJJQ19QVERVTVA9eQpDT05GSUdfUFREVU1QX0NPUkU9eQpDT05GSUdfUFREVU1QX0RFQlVHRlM9
eQpDT05GSUdfSEFWRV9ERUJVR19LTUVNTEVBSz15CiMgQ09ORklHX0RFQlVHX0tNRU1MRUFLIGlz
IG5vdCBzZXQKIyBDT05GSUdfREVCVUdfT0JKRUNUUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NIUklO
S0VSX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfU1RBQ0tfVVNBR0UgaXMgbm90IHNl
dApDT05GSUdfU0NIRURfU1RBQ0tfRU5EX0NIRUNLPXkKQ09ORklHX0FSQ0hfSEFTX0RFQlVHX1ZN
X1BHVEFCTEU9eQojIENPTkZJR19ERUJVR19WTSBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19WTV9Q
R1RBQkxFPXkKQ09ORklHX0FSQ0hfSEFTX0RFQlVHX1ZJUlRVQUw9eQojIENPTkZJR19ERUJVR19W
SVJUVUFMIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX01FTU9SWV9JTklUPXkKIyBDT05GSUdfREVC
VUdfUEVSX0NQVV9NQVBTIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfS01BUF9MT0NBTCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RFQlVHX0hJR0hNRU0gaXMgbm90IHNldApDT05GSUdfSEFWRV9ERUJV
R19TVEFDS09WRVJGTE9XPXkKQ09ORklHX0RFQlVHX1NUQUNLT1ZFUkZMT1c9eQpDT05GSUdfSEFW
RV9BUkNIX0tBU0FOPXkKQ09ORklHX0hBVkVfQVJDSF9LQVNBTl9WTUFMTE9DPXkKQ09ORklHX0ND
X0hBU19LQVNBTl9HRU5FUklDPXkKQ09ORklHX0NDX0hBU19XT1JLSU5HX05PU0FOSVRJWkVfQURE
UkVTUz15CkNPTkZJR19LQVNBTj15CkNPTkZJR19DQ19IQVNfS0FTQU5fTUVNSU5UUklOU0lDX1BS
RUZJWD15CkNPTkZJR19LQVNBTl9HRU5FUklDPXkKIyBDT05GSUdfS0FTQU5fT1VUTElORSBpcyBu
b3Qgc2V0CkNPTkZJR19LQVNBTl9JTkxJTkU9eQpDT05GSUdfS0FTQU5fU1RBQ0s9eQpDT05GSUdf
S0FTQU5fVk1BTExPQz15CiMgQ09ORklHX0tBU0FOX01PRFVMRV9URVNUIGlzIG5vdCBzZXQKQ09O
RklHX0tBU0FOX0VYVFJBX0lORk89eQpDT05GSUdfSEFWRV9BUkNIX0tGRU5DRT15CiMgQ09ORklH
X0tGRU5DRSBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lbW9yeSBEZWJ1Z2dpbmcKCkNPTkZJR19ERUJV
R19TSElSUT15CgojCiMgRGVidWcgT29wcywgTG9ja3VwcyBhbmQgSGFuZ3MKIwojIENPTkZJR19Q
QU5JQ19PTl9PT1BTIGlzIG5vdCBzZXQKQ09ORklHX1BBTklDX09OX09PUFNfVkFMVUU9MApDT05G
SUdfTE9DS1VQX0RFVEVDVE9SPXkKQ09ORklHX1NPRlRMT0NLVVBfREVURUNUT1I9eQojIENPTkZJ
R19CT09UUEFSQU1fU09GVExPQ0tVUF9QQU5JQyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0hBUkRM
T0NLVVBfREVURUNUT1JfQlVERFk9eQpDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUj15CiMgQ09O
RklHX0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRiBpcyBub3Qgc2V0CkNPTkZJR19IQVJETE9DS1VQ
X0RFVEVDVE9SX0JVRERZPXkKIyBDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNIIGlzIG5v
dCBzZXQKQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1JfQ09VTlRTX0hSVElNRVI9eQpDT05GSUdf
Qk9PVFBBUkFNX0hBUkRMT0NLVVBfUEFOSUM9eQpDT05GSUdfREVURUNUX0hVTkdfVEFTSz15CkNP
TkZJR19ERUZBVUxUX0hVTkdfVEFTS19USU1FT1VUPTYwCiMgQ09ORklHX0JPT1RQQVJBTV9IVU5H
X1RBU0tfUEFOSUMgaXMgbm90IHNldApDT05GSUdfV1FfV0FUQ0hET0c9eQojIENPTkZJR19XUV9D
UFVfSU5URU5TSVZFX1JFUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfTE9DS1VQIGlzIG5v
dCBzZXQKIyBlbmQgb2YgRGVidWcgT29wcywgTG9ja3VwcyBhbmQgSGFuZ3MKCiMKIyBTY2hlZHVs
ZXIgRGVidWdnaW5nCiMKIyBDT05GSUdfU0NIRURfREVCVUcgaXMgbm90IHNldApDT05GSUdfU0NI
RURfSU5GTz15CiMgQ09ORklHX1NDSEVEU1RBVFMgaXMgbm90IHNldAojIGVuZCBvZiBTY2hlZHVs
ZXIgRGVidWdnaW5nCgojIENPTkZJR19ERUJVR19USU1FS0VFUElORyBpcyBub3Qgc2V0CgojCiMg
TG9jayBEZWJ1Z2dpbmcgKHNwaW5sb2NrcywgbXV0ZXhlcywgZXRjLi4uKQojCkNPTkZJR19MT0NL
X0RFQlVHR0lOR19TVVBQT1JUPXkKIyBDT05GSUdfUFJPVkVfTE9DS0lORyBpcyBub3Qgc2V0CiMg
Q09ORklHX0xPQ0tfU1RBVCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19SVF9NVVRFWEVTPXkKQ09O
RklHX0RFQlVHX1NQSU5MT0NLPXkKQ09ORklHX0RFQlVHX01VVEVYRVM9eQojIENPTkZJR19ERUJV
R19XV19NVVRFWF9TTE9XUEFUSCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19SV1NFTVM9eQojIENP
TkZJR19ERUJVR19MT0NLX0FMTE9DIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfQVRPTUlDX1NM
RUVQIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfTE9DS0lOR19BUElfU0VMRlRFU1RTIGlzIG5v
dCBzZXQKIyBDT05GSUdfTE9DS19UT1JUVVJFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19XV19N
VVRFWF9TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDRl9UT1JUVVJFX1RFU1QgaXMgbm90
IHNldAojIGVuZCBvZiBMb2NrIERlYnVnZ2luZyAoc3BpbmxvY2tzLCBtdXRleGVzLCBldGMuLi4p
CgpDT05GSUdfREVCVUdfSVJRRkxBR1M9eQpDT05GSUdfU1RBQ0tUUkFDRT15CiMgQ09ORklHX1dB
Uk5fQUxMX1VOU0VFREVEX1JBTkRPTSBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0tPQkpFQ1Qg
aXMgbm90IHNldAoKIwojIERlYnVnIGtlcm5lbCBkYXRhIHN0cnVjdHVyZXMKIwpDT05GSUdfREVC
VUdfTElTVD15CiMgQ09ORklHX0RFQlVHX1BMSVNUIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX1NH
PXkKQ09ORklHX0RFQlVHX05PVElGSUVSUz15CkNPTkZJR19ERUJVR19DTE9TVVJFUz15CkNPTkZJ
R19ERUJVR19NQVBMRV9UUkVFPXkKIyBlbmQgb2YgRGVidWcga2VybmVsIGRhdGEgc3RydWN0dXJl
cwoKIwojIFJDVSBEZWJ1Z2dpbmcKIwojIENPTkZJR19SQ1VfU0NBTEVfVEVTVCBpcyBub3Qgc2V0
CiMgQ09ORklHX1JDVV9UT1JUVVJFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19SQ1VfUkVGX1ND
QUxFX1RFU1QgaXMgbm90IHNldApDT05GSUdfUkNVX0NQVV9TVEFMTF9USU1FT1VUPTYwCkNPTkZJ
R19SQ1VfRVhQX0NQVV9TVEFMTF9USU1FT1VUPTAKQ09ORklHX1JDVV9DUFVfU1RBTExfQ1BVVElN
RT15CiMgQ09ORklHX1JDVV9UUkFDRSBpcyBub3Qgc2V0CiMgQ09ORklHX1JDVV9FUVNfREVCVUcg
aXMgbm90IHNldAojIGVuZCBvZiBSQ1UgRGVidWdnaW5nCgojIENPTkZJR19ERUJVR19XUV9GT1JD
RV9SUl9DUFUgaXMgbm90IHNldAojIENPTkZJR19DUFVfSE9UUExVR19TVEFURV9DT05UUk9MIGlz
IG5vdCBzZXQKIyBDT05GSUdfTEFURU5DWVRPUCBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0ZVTkNU
SU9OX1RSQUNFUj15CkNPTkZJR19IQVZFX0ZVTkNUSU9OX0dSQVBIX1RSQUNFUj15CkNPTkZJR19I
QVZFX0RZTkFNSUNfRlRSQUNFPXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdT
PXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9BUkdTPXkKQ09ORklHX0hBVkVfRlRS
QUNFX01DT1VOVF9SRUNPUkQ9eQpDT05GSUdfSEFWRV9TWVNDQUxMX1RSQUNFUE9JTlRTPXkKQ09O
RklHX0hBVkVfT0JKVE9PTF9NQ09VTlQ9eQpDT05GSUdfSEFWRV9DX1JFQ09SRE1DT1VOVD15CkNP
TkZJR19UUkFDSU5HX1NVUFBPUlQ9eQojIENPTkZJR19GVFJBQ0UgaXMgbm90IHNldAojIENPTkZJ
R19TQU1QTEVTIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0RFVk1FTV9JU19BTExPV0VEPXkK
Q09ORklHX1NUUklDVF9ERVZNRU09eQpDT05GSUdfSU9fU1RSSUNUX0RFVk1FTT15CgojCiMgcG93
ZXJwYyBEZWJ1Z2dpbmcKIwojIENPTkZJR19QUENfRElTQUJMRV9XRVJST1IgaXMgbm90IHNldApD
T05GSUdfUFBDX1dFUlJPUj15CkNPTkZJR19QUklOVF9TVEFDS19ERVBUSD02NAojIENPTkZJR19Q
UENfRU1VTEFURURfU1RBVFMgaXMgbm90IHNldAojIENPTkZJR19DT0RFX1BBVENISU5HX1NFTEZU
RVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfSlVNUF9MQUJFTF9GRUFUVVJFX0NIRUNLUyBpcyBub3Qg
c2V0CiMgQ09ORklHX0ZUUl9GSVhVUF9TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX01TSV9C
SVRNQVBfU0VMRlRFU1QgaXMgbm90IHNldAojIENPTkZJR19YTU9OIGlzIG5vdCBzZXQKIyBDT05G
SUdfQkRJX1NXSVRDSCBpcyBub3Qgc2V0CkNPTkZJR19CT09UWF9URVhUPXkKIyBDT05GSUdfUFBD
X0VBUkxZX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0tBU0FOX1NIQURPV19PRkZTRVQ9MHhlMDAw
MDAwMAojIGVuZCBvZiBwb3dlcnBjIERlYnVnZ2luZwoKIwojIEtlcm5lbCBUZXN0aW5nIGFuZCBD
b3ZlcmFnZQojCkNPTkZJR19LVU5JVD1tCkNPTkZJR19LVU5JVF9ERUJVR0ZTPXkKQ09ORklHX0tV
TklUX1RFU1Q9bQojIENPTkZJR19LVU5JVF9FWEFNUExFX1RFU1QgaXMgbm90IHNldAojIENPTkZJ
R19LVU5JVF9BTExfVEVTVFMgaXMgbm90IHNldApDT05GSUdfS1VOSVRfREVGQVVMVF9FTkFCTEVE
PXkKIyBDT05GSUdfTk9USUZJRVJfRVJST1JfSU5KRUNUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdf
RkFVTFRfSU5KRUNUSU9OIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0tDT1Y9eQpDT05GSUdf
Q0NfSEFTX1NBTkNPVl9UUkFDRV9QQz15CiMgQ09ORklHX0tDT1YgaXMgbm90IHNldApDT05GSUdf
UlVOVElNRV9URVNUSU5HX01FTlU9eQojIENPTkZJR19URVNUX0RIUlkgaXMgbm90IHNldAojIENP
TkZJR19MS0RUTSBpcyBub3Qgc2V0CkNPTkZJR19DUFVNQVNLX0tVTklUX1RFU1Q9bQpDT05GSUdf
VEVTVF9MSVNUX1NPUlQ9bQpDT05GSUdfVEVTVF9NSU5fSEVBUD1tCkNPTkZJR19URVNUX1NPUlQ9
bQpDT05GSUdfVEVTVF9ESVY2ND1tCkNPTkZJR19URVNUX0lPVl9JVEVSPW0KQ09ORklHX0JBQ0tU
UkFDRV9TRUxGX1RFU1Q9bQojIENPTkZJR19URVNUX1JFRl9UUkFDS0VSIGlzIG5vdCBzZXQKQ09O
RklHX1JCVFJFRV9URVNUPW0KQ09ORklHX1JFRURfU09MT01PTl9URVNUPW0KQ09ORklHX0lOVEVS
VkFMX1RSRUVfVEVTVD1tCkNPTkZJR19QRVJDUFVfVEVTVD1tCkNPTkZJR19BVE9NSUM2NF9TRUxG
VEVTVD15CiMgQ09ORklHX1RFU1RfSEVYRFVNUCBpcyBub3Qgc2V0CkNPTkZJR19TVFJJTkdfU0VM
RlRFU1Q9bQpDT05GSUdfVEVTVF9TVFJJTkdfSEVMUEVSUz1tCkNPTkZJR19URVNUX0tTVFJUT1g9
eQojIENPTkZJR19URVNUX1BSSU5URiBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfU0NBTkYgaXMg
bm90IHNldAojIENPTkZJR19URVNUX0JJVE1BUCBpcyBub3Qgc2V0CkNPTkZJR19URVNUX1VVSUQ9
bQpDT05GSUdfVEVTVF9YQVJSQVk9bQpDT05GSUdfVEVTVF9NQVBMRV9UUkVFPW0KIyBDT05GSUdf
VEVTVF9SSEFTSFRBQkxFIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9JREEgaXMgbm90IHNldAoj
IENPTkZJR19URVNUX0xLTSBpcyBub3Qgc2V0CkNPTkZJR19URVNUX0JJVE9QUz1tCkNPTkZJR19U
RVNUX1ZNQUxMT0M9bQpDT05GSUdfVEVTVF9VU0VSX0NPUFk9bQpDT05GSUdfVEVTVF9CUEY9bQoj
IENPTkZJR19URVNUX0JMQUNLSE9MRV9ERVYgaXMgbm90IHNldApDT05GSUdfRklORF9CSVRfQkVO
Q0hNQVJLPW0KIyBDT05GSUdfVEVTVF9GSVJNV0FSRSBpcyBub3Qgc2V0CkNPTkZJR19URVNUX1NZ
U0NUTD1tCkNPTkZJR19CSVRGSUVMRF9LVU5JVD1tCkNPTkZJR19DSEVDS1NVTV9LVU5JVD1tCkNP
TkZJR19IQVNIX0tVTklUX1RFU1Q9bQpDT05GSUdfUkVTT1VSQ0VfS1VOSVRfVEVTVD1tCkNPTkZJ
R19TWVNDVExfS1VOSVRfVEVTVD1tCkNPTkZJR19MSVNUX0tVTklUX1RFU1Q9bQpDT05GSUdfSEFT
SFRBQkxFX0tVTklUX1RFU1Q9bQpDT05GSUdfTElORUFSX1JBTkdFU19URVNUPW0KQ09ORklHX0NN
RExJTkVfS1VOSVRfVEVTVD1tCkNPTkZJR19CSVRTX1RFU1Q9bQpDT05GSUdfU0xVQl9LVU5JVF9U
RVNUPW0KQ09ORklHX01FTUNQWV9LVU5JVF9URVNUPW0KQ09ORklHX01FTUNQWV9TTE9XX0tVTklU
X1RFU1Q9eQpDT05GSUdfSVNfU0lHTkVEX1RZUEVfS1VOSVRfVEVTVD1tCkNPTkZJR19PVkVSRkxP
V19LVU5JVF9URVNUPW0KQ09ORklHX1NUQUNLSU5JVF9LVU5JVF9URVNUPW0KQ09ORklHX0ZPUlRJ
RllfS1VOSVRfVEVTVD1tCkNPTkZJR19TVFJDQVRfS1VOSVRfVEVTVD1tCkNPTkZJR19TVFJTQ1BZ
X0tVTklUX1RFU1Q9bQpDT05GSUdfU0lQSEFTSF9LVU5JVF9URVNUPW0KIyBDT05GSUdfVEVTVF9V
REVMQVkgaXMgbm90IHNldAojIENPTkZJR19URVNUX1NUQVRJQ19LRVlTIGlzIG5vdCBzZXQKIyBD
T05GSUdfVEVTVF9LTU9EIGlzIG5vdCBzZXQKQ09ORklHX1RFU1RfTUVNQ0FUX1A9bQpDT05GSUdf
VEVTVF9NRU1JTklUPW0KQ09ORklHX1RFU1RfRlJFRV9QQUdFUz1tCkNPTkZJR19URVNUX09CSlBP
T0w9bQpDT05GSUdfQVJDSF9VU0VfTUVNVEVTVD15CiMgQ09ORklHX01FTVRFU1QgaXMgbm90IHNl
dAojIGVuZCBvZiBLZXJuZWwgVGVzdGluZyBhbmQgQ292ZXJhZ2UKCiMKIyBSdXN0IGhhY2tpbmcK
IwojIGVuZCBvZiBSdXN0IGhhY2tpbmcKIyBlbmQgb2YgS2VybmVsIGhhY2tpbmcK

--MP_/Kn_DPsjWzthGNH9x5hato4f--
