Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFA7889584
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 09:30:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V35hz2jXdz3vYW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 19:30:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=114.132.62.65; helo=bg1.exmail.qq.com; envelope-from=dawei.li@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 347 seconds by postgrey-1.37 at boromir; Mon, 25 Mar 2024 18:39:04 AEDT
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.62.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V34Z05C9Vz2y70
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 18:39:04 +1100 (AEDT)
X-QQ-mid: bizesmtp82t1711351948tbro9jra
X-QQ-Originating-IP: jTvjEt9gndUpXpfzelODrStwvURDZtQlDlKhxJnh6LI=
Received: from localhost ( [112.0.147.175])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 25 Mar 2024 15:32:27 +0800 (CST)
X-QQ-SSF: 00400000000000704000000B0000000
X-QQ-FEAT: uWtt+4oZiA/IvKifwgE2D1pHO7oziC+j3bIl4RuaPIyxy+i9hUOHmo9B0YTsO
	SCWD9FcKbvZm4i9wqQBEBxBwMZEtBPo6neOmS1q3mYrbouDneA21H0ztL0ynr7jpYzAha6v
	eF5dLjp7vJ19KtOWEPk3VI/VwwLrHeU/SnWnTMs8eIx3rOmpfF9x+HO44Pj01Mt1B0BQifg
	y2jMDM902Jlsu7SXGAs0l8dWDV5PCf+rmpIJICZ1DFWxnAoAd7T7ppTS9XBuDYKUGQRkHlR
	XJ2inyvdo8RHawaPj5CUpAYpyOSW3E3IqYUnXZzcx+ONmM8+fomxMb5H62Dptep+jVPO6iQ
	WGhTToZ/VDPvAk/jcG+TY4xUBGtvFFO5taMcmkB4nJX/+28Egp6yXfnm80ICjk/IBlM1y8h
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 13569466777795910691
Date: Mon, 25 Mar 2024 15:32:27 +0800
From: Dawei Li <dawei.li@shingroup.cn>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [ppc64le] Boot failure kernel BUG at mm/usercopy.c:102!
Message-ID: <2EF9BB8F2BD76C25+ZgEoi50ImiF8vv6X@centos8>
References: <AE224519-3E62-41E3-A75D-62E7EA0E3EC7@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AE224519-3E62-41E3-A75D-62E7EA0E3EC7@linux.ibm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Mailman-Approved-At: Mon, 25 Mar 2024 19:29:51 +1100
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
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, LKML <linux-kernel@vger.kernel.org>, akpm@linux-foundation.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sachin,

Sorry for the mess.

On Mon, Mar 25, 2024 at 12:08:35PM +0530, Sachin Sant wrote:
> Today=E2=80=99s next (6.9.0-rc1-next-20240325) fails to boot on powerpc:
>=20
> [ 1.955512] usercopy: Kernel memory exposure attempt detected from SLUB o=
bject 'cpumask' (offset 0, size 16)!
> [ 1.955531] ------------[ cut here ]------------
> [ 1.955535] kernel BUG at mm/usercopy.c:102!
> [ 1.955539] Oops: Exception in kernel mode, sig: 5 [#1]
> [ 1.955543] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D8192 NUMA pSeries
> [ 1.955547] Modules linked in:
> [ 1.955551] CPU: 27 PID: 482 Comm: systemd-udevd Not tainted 6.9.0-rc1-ne=
xt-20240325 #1
> [ 1.955556] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 =
of:IBM,FW1060.00 (NH1060_018) hv:phyp pSeries
> [ 1.955561] NIP: c0000000005d08d4 LR: c0000000005d08d0 CTR: 00000000006e6=
38c
> [ 1.955565] REGS: c00000005383f9f0 TRAP: 0700 Not tainted (6.9.0-rc1-next=
-20240325)
> [ 1.955570] MSR: 8000000000029033 <SF,EE,ME,IR,DR,RI,LE> CR: 2800220f XER=
: 00000002
> [ 1.955579] CFAR: c0000000002141f0 IRQMASK: 0=20
> [ 1.955579] GPR00: c0000000005d08d0 c00000005383fc90 c000000001563b00 000=
0000000000061=20
> [ 1.955579] GPR04: c000000e855b7c08 c000000e8563e000 c00000005383fad8 000=
0000e83380000=20
> [ 1.955579] GPR08: 0000000000000027 c00000000223c030 0000000e83380000 000=
0000000000001=20
> [ 1.955579] GPR12: c000000002a37bd0 c000000e87be8300 0000000000000000 000=
0000000000000=20
> [ 1.955579] GPR16: 0000000000000000 0000000000000000 0000000000000000 000=
0000000000000=20
> [ 1.955579] GPR20: 0000000000000000 0000000000000000 0000000000000000 000=
0000000000000=20
> [ 1.955579] GPR24: 0000000000000000 0000000000000000 0000000000000000 000=
0000000000000=20
> [ 1.955579] GPR28: 0000000000000001 c000000004017200 0000000000000010 c00=
00000097129b0=20
> [ 1.955623] NIP [c0000000005d08d4] usercopy_abort+0x78/0xb0
> [ 1.955630] LR [c0000000005d08d0] usercopy_abort+0x74/0xb0
> [ 1.955634] Call Trace:
> [ 1.955636] [c00000005383fc90] [c0000000005d08d0] usercopy_abort+0x74/0xb=
0 (unreliable)
> [ 1.955642] [c00000005383fd00] [c0000000005424e4] __check_heap_object+0x1=
b0/0x1b4
> [ 1.955649] [c00000005383fd40] [c0000000005d0b24] check_heap_object+0x218=
/0x240
> [ 1.955654] [c00000005383fd80] [c0000000005d0bd0] __check_object_size+0x8=
4/0x1a4
> [ 1.955659] [c00000005383fdc0] [c0000000001c1990] sys_sched_getaffinity+0=
x114/0x174
> [ 1.955665] [c00000005383fe10] [c000000000033498] system_call_exception+0=
x138/0x330
> [ 1.955671] [c00000005383fe50] [c00000000000d05c] system_call_vectored_co=
mmon+0x15c/0x2ec
> [ 1.955678] --- interrupt: 3000 at 0x7fff8ccb72c0
> [ 1.955682] NIP: 00007fff8ccb72c0 LR: 00007fff8ccb72c0 CTR: 0000000000000=
000
> [ 1.955686] REGS: c00000005383fe80 TRAP: 3000 Not tainted (6.9.0-rc1-next=
-20240325)
> [ 1.955690] MSR: 800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE> CR=
: 44002808 XER: 00000000
> [ 1.955700] IRQMASK: 0=20
> [ 1.955700] GPR00: 00000000000000df 00007fffd97f38a0 00007fff8d337500 000=
0000000000000=20
> [ 1.955700] GPR04: 0000000000000010 0000000145511090 0000000145510010 000=
0000000145511=20
> [ 1.955700] GPR08: 0000000000000000 0000000000000000 0000000000000000 000=
0000000000000=20
> [ 1.955700] GPR12: 0000000000000000 00007fff8d3e4c40 0000000110e15770 000=
0000110e157c8=20
> [ 1.955700] GPR16: 0000000110e15840 0000000110e15880 0000000110e15800 000=
0000110e190c0=20
> [ 1.955700] GPR20: 0000000000000000 0000000000000001 0000000000000001 000=
0000110e60000=20
> [ 1.955700] GPR24: 0000000110e60340 0000000110e603c8 0000000110e603c0 000=
0000110e60058=20
> [ 1.955700] GPR28: 0000000000000038 0000000000000100 0000000145511090 000=
0000000000010=20
> [ 1.955742] NIP [00007fff8ccb72c0] 0x7fff8ccb72c0
> [ 1.955746] LR [00007fff8ccb72c0] 0x7fff8ccb72c0
> [ 1.955749] --- interrupt: 3000
> [ 1.955751] Code: 2c280000 41820050 3ce2ffe6 3d22ffe5 38e77ce8 3929c168 7=
c661b78 3c62ffe6 f9610060 38637cf0 4bc438dd 60000000 <0fe00000> 3c82ffe4 3c=
a2ffef 38846510=20
> [ 1.955765] ---[ end trace 0000000000000000 ]---
> [ 1.957568] pstore: backend (nvram) writing error (-1)
> [ 1.957572]=20
> [ 2.957575] Kernel panic - not syncing: Fatal exception
> [ 2.963038] Rebooting in 10 seconds..
>=20
> Git bisect points to following patch
>=20
> commit 328c801335d5f7edf2a3c9c331ddf8978f21e2a7
>     cpumask: create dedicated kmem cache for cpumask var
>=20
> Have attached the boot log and .config

> Detected machine type: 0000000000000101
> command line: BOOT_IMAGE=3D(ieee1275//vdevice/v-scsi@30000066/disk@810000=
0000000000,msdos3)/boot/vmlinuz-6.9.0-rc1-next-20240325 root=3DUUID=3D031d5=
30b-fe65-448d-ba13-558989868c84 ro crashkernel=3D2G-4G:384M,4G-16G:512M,16G=
-64G:1G,64G-128G:2G,128G-:4G
> Max number of cores passed to firmware: 1024 (NR_CPUS =3D 8192)
> Calling ibm,client-architecture-support... done
> memory layout at init:
>   memory_limit : 0000000000000000 (16 MB aligned)
>   alloc_bottom : 000000000f9e0000
>   alloc_top    : 0000000020000000
>   alloc_top_hi : 0000000020000000
>   rmo_top      : 0000000020000000
>   ram_top      : 0000000020000000
> instantiating rtas at 0x000000001ec10000... done
> instantiating sml at 0x000000001ec00000... done
> prom_hold_cpus: skipped
> copying OF device tree...
> Building dt strings...
> Building dt structure...
> Device tree strings 0x00000000119f0000 -> 0x00000000119f1838
> Device tree struct  0x0000000011a00000 -> 0x0000000011a10000
> Quiescing Open Firmware ...
> Booting Linux via __start() @ 0x000000000a720000 ...
> [    0.000000] Reserving 1024MB of memory at 256MB for crashkernel (Syste=
m RAM: 61440MB)
> [    0.000000] radix-mmu: Page sizes from device-tree:
> [    0.000000] radix-mmu: Page size shift =3D 12 AP=3D0x0
> [    0.000000] radix-mmu: Page size shift =3D 16 AP=3D0x5
> [    0.000000] radix-mmu: Page size shift =3D 21 AP=3D0x1
> [    0.000000] radix-mmu: Page size shift =3D 30 AP=3D0x2
> [    0.000000] Activating Kernel Userspace Access Prevention
> [    0.000000] Activating Kernel Userspace Execution Prevention
> [    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000002720000 wi=
th 64.0 KiB pages (exec)
> [    0.000000] radix-mmu: Mapped 0x0000000002720000-0x0000000f00000000 wi=
th 64.0 KiB pages
> [    0.000000] lpar: Using radix MMU under hypervisor
> [    0.000000] Linux version 6.9.0-rc1-next-20240325 (root@xxxx.xxxxx.xxx=
x.xxx) (gcc (GCC) 11.4.1 20231218 (Red Hat 11.4.1-3), GNU ld version 2.35.2=
-43.el9) #1 SMP Sun Mar 24 22:33:26 CDT 2024
> [    0.000000] Found initrd at 0xc00000000d900000:0xc00000000f9da580
> [    0.000000] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf0000=
06 of:IBM,FW1060.00 (NH1060_018) hv:phyp pSeries
> [    0.000000] printk: legacy bootconsole [udbg0] enabled
> [    0.000000] Partition configured for 128 cpus.
> [    0.000000] CPU maps initialized for 8 threads per core
> [    0.000000] numa: Partition configured for 32 NUMA nodes.
> [    0.000000] -----------------------------------------------------
> [    0.000000] phys_mem_size     =3D 0xf00000000
> [    0.000000] dcache_bsize      =3D 0x80
> [    0.000000] icache_bsize      =3D 0x80
> [    0.000000] cpu_features      =3D 0x001c00eb8f5f9187
> [    0.000000]   possible        =3D 0x001ffbfbcf5fb187
> [    0.000000]   always          =3D 0x0000000380008181
> [    0.000000] cpu_user_features =3D 0xdc0065c2 0xaef60000
> [    0.000000] mmu_features      =3D 0xbc007641
> [    0.000000] firmware_features =3D 0x00001dbfc45bfc57
> [    0.000000] vmalloc start     =3D 0xc008000000000000
> [    0.000000] IO start          =3D 0xc00a000000000000
> [    0.000000] vmemmap start     =3D 0xc00c000000000000
> [    0.000000] -----------------------------------------------------
> [    0.000000] numa:   NODE_DATA [mem 0xe85b0ee80-0xe85b1667f]
> [    0.000000] rfi-flush: fallback displacement flush available
> [    0.000000] count-cache-flush: hardware flush enabled.
> [    0.000000] link-stack-flush: software flush enabled.
> [    0.000000] stf-barrier: eieio barrier available
> [    0.000000] PPC64 nvram contains 15360 bytes
> [    0.000000] barrier-nospec: using ORI speculation barrier
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000000000000-0x0000000effffffff]
> [    0.000000]   Device   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   3: [mem 0x0000000000000000-0x0000000effffffff]
> [    0.000000] Initmem setup node 0 as memoryless
> [    0.000000] Initmem setup node 1 as memoryless
> [    0.000000] Initmem setup node 2 as memoryless
> [    0.000000] Initmem setup node 3 [mem 0x0000000000000000-0x0000000efff=
fffff]
> [    0.000000] Initmem setup node 4 as memoryless
> [    0.000000] Initmem setup node 5 as memoryless
> [    0.000000] Initmem setup node 6 as memoryless
> [    0.000000] Initmem setup node 7 as memoryless
> [    0.000000] Initmem setup node 8 as memoryless
> [    0.000000] Initmem setup node 9 as memoryless
> [    0.000000] Initmem setup node 10 as memoryless
> [    0.000000] Initmem setup node 11 as memoryless
> [    0.000000] Initmem setup node 12 as memoryless
> [    0.000000] Initmem setup node 13 as memoryless
> [    0.000000] Initmem setup node 14 as memoryless
> [    0.000000] Initmem setup node 15 as memoryless
> [    0.000000] Initmem setup node 16 as memoryless
> [    0.000000] Initmem setup node 17 as memoryless
> [    0.000000] Initmem setup node 18 as memoryless
> [    0.000000] Initmem setup node 19 as memoryless
> [    0.000000] Initmem setup node 20 as memoryless
> [    0.000000] Initmem setup node 21 as memoryless
> [    0.000000] Initmem setup node 22 as memoryless
> [    0.000000] Initmem setup node 23 as memoryless
> [    0.000000] Initmem setup node 24 as memoryless
> [    0.000000] Initmem setup node 25 as memoryless
> [    0.000000] Initmem setup node 26 as memoryless
> [    0.000000] Initmem setup node 27 as memoryless
> [    0.000000] Initmem setup node 28 as memoryless
> [    0.000000] Initmem setup node 29 as memoryless
> [    0.000000] Initmem setup node 30 as memoryless
> [    0.000000] Initmem setup node 31 as memoryless
> [    0.000000] percpu: cpu 32 has no node 0 or node-local memory
> [    0.000000] percpu: Embedded 10 pages/cpu s613160 r0 d42200 u655360
> [    0.000000] Kernel command line: BOOT_IMAGE=3D(ieee1275//vdevice/v-scs=
i@30000066/disk@8100000000000000,msdos3)/boot/vmlinuz-6.9.0-rc1-next-202403=
25 root=3DUUID=3D031d530b-fe65-448d-ba13-558989868c84 ro crashkernel=3D2G-4=
G:384M,4G-16G:512M,16G-64G:1G,64G-128G:2G,128G-:4G
> [    0.000000] Unknown kernel command line parameters "BOOT_IMAGE=3D(ieee=
1275//vdevice/v-scsi@30000066/disk@8100000000000000,msdos3)/boot/vmlinuz-6.=
9.0-rc1-next-20240325", will be passed to user space.
> [    0.000000] random: crng init done
> [    0.000000] Dentry cache hash table entries: 8388608 (order: 10, 67108=
864 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 4194304 (order: 9, 3355443=
2 bytes, linear)
> [    0.000000] Fallback order for Node 0: 3=20
> [    0.000000] Fallback order for Node 1: 3=20
> [    0.000000] Fallback order for Node 2: 3=20
> [    0.000000] Fallback order for Node 3: 3=20
> [    0.000000] Fallback order for Node 4: 3=20
> [    0.000000] Fallback order for Node 5: 3=20
> [    0.000000] Fallback order for Node 6: 3=20
> [    0.000000] Fallback order for Node 7: 3=20
> [    0.000000] Fallback order for Node 8: 3=20
> [    0.000000] Fallback order for Node 9: 3=20
> [    0.000000] Fallback order for Node 10: 3=20
> [    0.000000] Fallback order for Node 11: 3=20
> [    0.000000] Fallback order for Node 12: 3=20
> [    0.000000] Fallback order for Node 13: 3=20
> [    0.000000] Fallback order for Node 14: 3=20
> [    0.000000] Fallback order for Node 15: 3=20
> [    0.000000] Fallback order for Node 16: 3=20
> [    0.000000] Fallback order for Node 17: 3=20
> [    0.000000] Fallback order for Node 18: 3=20
> [    0.000000] Fallback order for Node 19: 3=20
> [    0.000000] Fallback order for Node 20: 3=20
> [    0.000000] Fallback order for Node 21: 3=20
> [    0.000000] Fallback order for Node 22: 3=20
> [    0.000000] Fallback order for Node 23: 3=20
> [    0.000000] Fallback order for Node 24: 3=20
> [    0.000000] Fallback order for Node 25: 3=20
> [    0.000000] Fallback order for Node 26: 3=20
> [    0.000000] Fallback order for Node 27: 3=20
> [    0.000000] Fallback order for Node 28: 3=20
> [    0.000000] Fallback order for Node 29: 3=20
> [    0.000000] Fallback order for Node 30: 3=20
> [    0.000000] Fallback order for Node 31: 3=20
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 983=
040
> [    0.000000] Policy zone: Normal
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 59497664K/62914560K available (16768K kernel code,=
 6144K rwdata, 16000K rodata, 7296K init, 2933K bss, 3416896K reserved, 0K =
cma-reserved)
> [    0.000000] SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CPUs=3D1=
28, Nodes=3D32
> [    0.000000] ftrace: allocating 42889 entries in 16 pages
> [    0.000000] ftrace: allocated 16 pages with 1 groups
> [    0.000000] trace event string verifier disabled
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_i=
ds=3D128.
> [    0.000000] 	Rude variant of Tasks RCU enabled.
> [    0.000000] 	Tracing variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is=
 10 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D128
> [    0.000000] RCU Tasks Rude: Setting shift to 7 and lim to 1 rcu_task_c=
b_adjust=3D1.
> [    0.000000] RCU Tasks Trace: Setting shift to 7 and lim to 1 rcu_task_=
cb_adjust=3D1.
> [    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
> [    0.000000] xive: Using IRQ range [400000-40007f]
> [    0.000000] xive: Interrupt handling initialized with spapr backend
> [    0.000000] xive: Using priority 7 for all interrupts
> [    0.000000] xive: Using 64kB queues
> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes to big.
> [    0.000001] time_init: 56 bit decrementer (max: 7fffffffffffff)
> [    0.000027] clocksource: timebase: mask: 0xffffffffffffffff max_cycles=
: 0x761537d007, max_idle_ns: 440795202126 ns
> [    0.000072] clocksource: timebase mult[1f40000] shift[24] registered
> [    0.000486] kfence: initialized - using 33554432 bytes for 255 objects=
 at 0x(____ptrval____)-0x(____ptrval____)
> [    0.000690] Console: colour dummy device 80x25
> [    0.000714] printk: legacy console [hvc0] enabled
> [    0.000714] printk: legacy console [hvc0] enabled
> [    0.000738] printk: legacy bootconsole [udbg0] disabled
> [    0.000738] printk: legacy bootconsole [udbg0] disabled
> [    0.000863] pid_max: default: 131072 minimum: 1024
> [    0.001087] LSM: initializing lsm=3Dcapability,yama,selinux,bpf,ima,evm
> [    0.001211] Yama: becoming mindful.
> [    0.001216] SELinux:  Initializing.
> [    0.001559] LSM support for eBPF active
> [    0.001712] Mount-cache hash table entries: 131072 (order: 4, 1048576 =
bytes, linear)
> [    0.001779] Mountpoint-cache hash table entries: 131072 (order: 4, 104=
8576 bytes, linear)
> [    0.003310] POWER10 performance monitor hardware support registered
> [    0.003360] rcu: Hierarchical SRCU implementation.
> [    0.003363] rcu: 	Max phase no-delay instances is 1000.
> [    0.004414] smp: Bringing up secondary CPUs ...
> [    0.013595] smp: Brought up 1 node, 32 CPUs
> [    0.013611] numa: Node 3 CPUs: 0-31
> [    0.013617] Big cores detected but using small core scheduling
> [    0.016579] devtmpfs: initialized
> [    0.019320] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 19112604462750000 ns
> [    0.019329] futex hash table entries: 32768 (order: 6, 4194304 bytes, =
linear)
> [    0.024979] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.025317] audit: initializing netlink subsys (disabled)
> [    0.025395] audit: type=3D2000 audit(1711337745.020:1): state=3Dinitia=
lized audit_enabled=3D0 res=3D1
> [    0.025471] thermal_sys: Registered thermal governor 'fair_share'
> [    0.025472] thermal_sys: Registered thermal governor 'step_wise'
> [    0.025511] cpuidle: using governor menu
> [    0.025869] pstore: Using crash dump compression: deflate
> [    0.025873] pstore: Registered nvram as persistent store backend
> [    0.026416] EEH: pSeries platform initialized
> [    0.026546] plpks: POWER LPAR Platform KeyStore is not supported or en=
abled
> [    0.032088] kprobes: kprobe jump-optimization is enabled. All kprobes =
are optimized if possible.
> [    0.032488] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pa=
ges
> [    0.032495] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
> [    0.032502] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pa=
ges
> [    0.032507] HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
> [    0.057077] Demotion targets for Node 3: null
> [    0.057246] cryptd: max_cpu_qlen set to 1000
> [    0.057643] iommu: Default domain type: Translated
> [    0.057647] iommu: DMA domain TLB invalidation policy: strict mode
> [    0.057742] SCSI subsystem initialized
> [    0.057770] usbcore: registered new interface driver usbfs
> [    0.057778] usbcore: registered new interface driver hub
> [    0.057811] usbcore: registered new device driver usb
> [    0.057835] pps_core: LinuxPPS API ver. 1 registered
> [    0.057838] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o Giometti <giometti@linux.it>
> [    0.057844] PTP clock support registered
> [    0.057977] EDAC MC: Ver: 3.0.0
> [    0.058230] NetLabel: Initializing
> [    0.058234] NetLabel:  domain hash size =3D 128
> [    0.058237] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
> [    0.058250] NetLabel:  unlabeled traffic allowed by default
> [    0.058260] PCI: Probing PCI hardware
> [    0.058265] EEH: No capable adapters found: recovery disabled.
> [    0.058327] vgaarb: loaded
> [    0.058601] clocksource: Switched to clocksource timebase
> [    0.059091] VFS: Disk quotas dquot_6.6.0
> [    0.059136] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 =
bytes)
> [    0.060960] NET: Registered PF_INET protocol family
> [    0.061108] IP idents hash table entries: 262144 (order: 5, 2097152 by=
tes, linear)
> [    0.063857] tcp_listen_portaddr_hash hash table entries: 32768 (order:=
 3, 524288 bytes, linear)
> [    0.063900] Table-perturb hash table entries: 65536 (order: 2, 262144 =
bytes, linear)
> [    0.063938] TCP established hash table entries: 524288 (order: 6, 4194=
304 bytes, linear)
> [    0.064377] TCP bind hash table entries: 65536 (order: 5, 2097152 byte=
s, linear)
> [    0.064533] TCP: Hash tables configured (established 524288 bind 65536)
> [    0.064851] MPTCP token hash table entries: 65536 (order: 4, 1572864 b=
ytes, linear)
> [    0.064928] UDP hash table entries: 32768 (order: 4, 1048576 bytes, li=
near)
> [    0.064995] UDP-Lite hash table entries: 32768 (order: 4, 1048576 byte=
s, linear)
> [    0.065225] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.065235] NET: Registered PF_XDP protocol family
> [    0.065242] PCI: CLS 0 bytes, default 128
> [    0.065298] Trying to unpack rootfs image as initramfs...
> [    0.071685] IOMMU table initialized, virtual merging enabled
> [    0.102816] vio_register_device_node: node lid missing 'reg'
> [    0.103002] vas: GZIP feature is available
> [    0.103636] hv-24x7: read 548 catalog entries, created 387 event attrs=
 (0 failures), 387 descs
> [    0.111665] Initialise system trusted keyrings
> [    0.111750] workingset: timestamp_bits=3D38 max_order=3D20 bucket_orde=
r=3D0
> [    0.111771] zbud: loaded
> [    0.120518] NET: Registered PF_ALG protocol family
> [    0.120525] Key type asymmetric registered
> [    0.120528] Asymmetric key parser 'x509' registered
> [    0.470285] Freeing initrd memory: 33600K
> [    0.472902] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 245)
> [    0.472986] io scheduler mq-deadline registered
> [    0.472991] io scheduler kyber registered
> [    0.473006] io scheduler bfq registered
> [    0.474368] atomic64_test: passed
> [    0.474585] shpchp: Standard Hot Plug PCI Controller Driver version: 0=
=2E4
> [    0.474589] PowerPC PowerNV PCI Hotplug Driver version: 0.1
> [    0.474943] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    0.475494] tpm_ibmvtpm 30000003: CRQ initialization completed
> [    1.522948] rdac: device handler registered
> [    1.522995] hp_sw: device handler registered
> [    1.523001] emc: device handler registered
> [    1.523054] alua: device handler registered
> [    1.523259] usbcore: registered new interface driver usbserial_generic
> [    1.523267] usbserial: USB Serial support registered for generic
> [    1.523302] mousedev: PS/2 mouse device common for all mice
> [    1.523377] rtc-generic rtc-generic: registered as rtc0
> [    1.523406] rtc-generic rtc-generic: setting system clock to 2024-03-2=
5T03:35:47 UTC (1711337747)
> [    1.523481] xcede: xcede_record_size =3D 10
> [    1.523485] xcede: Record 0 : hint =3D 1, latency =3D 0x1800 tb ticks,=
 Wake-on-irq =3D 1
> [    1.523489] xcede: Record 1 : hint =3D 2, latency =3D 0x3c00 tb ticks,=
 Wake-on-irq =3D 0
> [    1.523493] cpuidle: Skipping the 2 Extended CEDE idle states
> [    1.523497] cpuidle: Fixed up CEDE exit latency to 12 us
> [    1.524709] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_=
sync_size new:65536 old:0
> [    1.524715] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_=
sync_sg new:510 old:0
> [    1.524720] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_=
sg_len new:4080 old:0
> [    1.524790] hid: raw HID events driver (C) Jiri Kosina
> [    1.524810] usbcore: registered new interface driver usbhid
> [    1.524814] usbhid: USB HID core driver
> [    1.524856] drop_monitor: Initializing network drop monitor service
> [    1.524934] Initializing XFRM netlink socket
> [    1.524989] NET: Registered PF_INET6 protocol family
> [    1.525423] Segment Routing with IPv6
> [    1.525433] In-situ OAM (IOAM) with IPv6
> [    1.525452] NET: Registered PF_PACKET protocol family
> [    1.525483] mpls_gso: MPLS GSO support
> [    1.525518] secvar-sysfs: Failed to retrieve secvar operations
> [    1.526806] Timer migration: 3 hierarchy levels; 8 children per group;=
 1 crossnode level
> [    1.527403] registered taskstats version 1
> [    1.528553] Loading compiled-in X.509 certificates
> [    1.530692] page_owner is disabled
> [    1.530727] Key type big_key registered
> [    1.532801] Key type trusted registered
> [    1.540856] Key type encrypted registered
> [    1.540877] Secure boot mode disabled
> [    1.540884] Loading compiled-in module X.509 certificates
> [    1.598319] Loaded X.509 cert 'Build time autogenerated kernel key: d1=
2614b9e6e3723303747cae267b693449629cdc'
> [    1.598328] ima: Allocated hash algorithm: sha256
> [    1.609426] Secure boot mode disabled
> [    1.609439] Trusted boot mode disabled
> [    1.609442] ima: No architecture policies found
> [    1.609453] evm: Initialising EVM extended attributes:
> [    1.609457] evm: security.selinux
> [    1.609459] evm: security.SMACK64 (disabled)
> [    1.609462] evm: security.SMACK64EXEC (disabled)
> [    1.609465] evm: security.SMACK64TRANSMUTE (disabled)
> [    1.609467] evm: security.SMACK64MMAP (disabled)
> [    1.609470] evm: security.apparmor (disabled)
> [    1.609472] evm: security.ima
> [    1.609474] evm: security.capability
> [    1.609477] evm: HMAC attrs: 0x1
> [    1.609514] alg: No test for 842 (842-nx)
> [    1.734120] clk: Disabling unused clocks
> [    1.735436] Freeing unused kernel image (initmem) memory: 7296K
> [    1.747144] Checked W+X mappings: passed, no W+X pages found
> [    1.747157] Run /init as init process
> [    1.752966] systemd[1]: systemd 252-27.el9 running in system mode (+PA=
M +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +=
ACL +BLKID +CURL +ELFUTILS -FIDO2 +IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP +LI=
BFDISK +PCRE2 -PWQUALITY +P11KIT -QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZST=
D -BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunified)
> [    1.752987] systemd[1]: Detected virtualization powervm.
> [    1.752993] systemd[1]: Detected architecture ppc64-le.
> [    1.752998] systemd[1]: Running in initrd.
>=20
> Welcome to =1B[0;31mRed Hat Enterprise Linux 9.4 Beta (Plow) dracut-057-5=
3.git20240104.el9 (Initramfs)=1B[0m!
>=20
> [    1.753113] systemd[1]: Hostname set to <xxxx.xxxx.xxxx.xxxx>.
> [    1.866859] systemd[1]: Queued start job for default target Initrd Def=
ault Target.
> [    1.867012] systemd[1]: Started Dispatch Password Requests to Console =
Directory Watch.
> [=1B[0;32m  OK  =1B[0m] Started =1B[0;1;39mDispatch Password ???ts to Con=
sole Directory Watch=1B[0m.
> [    1.867153] systemd[1]: Reached target Initrd /usr File System.
> [=1B[0;32m  OK  =1B[0m] Reached target =1B[0;1;39mInitrd /usr File System=
=1B[0m.
> [    1.867203] systemd[1]: Reached target Local File Systems.
> [=1B[0;32m  OK  =1B[0m] Reached target =1B[0;1;39mLocal File Systems=1B[0=
m.
> [    1.867244] systemd[1]: Reached target Path Units.
> [=1B[0;32m  OK  =1B[0m] Reached target =1B[0;1;39mPath Units=1B[0m.
> [    1.867291] systemd[1]: Reached target Slice Units.
> [=1B[0;32m  OK  =1B[0m] Reached target =1B[0;1;39mSlice Units=1B[0m.
> [    1.867334] systemd[1]: Reached target Swaps.
> [=1B[0;32m  OK  =1B[0m] Reached target =1B[0;1;39mSwaps=1B[0m.
> [    1.867377] systemd[1]: Reached target Timer Units.
> [=1B[0;32m  OK  =1B[0m] Reached target =1B[0;1;39mTimer Units=1B[0m.
> [    1.867470] systemd[1]: Listening on D-Bus System Message Bus Socket.
> [=1B[0;32m  OK  =1B[0m] Listening on =1B[0;1;39mD-Bus System Message Bus =
Socket=1B[0m.
> [    1.867570] systemd[1]: Listening on Journal Socket (/dev/log).
> [=1B[0;32m  OK  =1B[0m] Listening on =1B[0;1;39mJournal Socket (/dev/log)=
=1B[0m.
> [    1.867670] systemd[1]: Listening on Journal Socket.
> [=1B[0;32m  OK  =1B[0m] Listening on =1B[0;1;39mJournal Socket=1B[0m.
> [    1.867772] systemd[1]: Listening on udev Control Socket.
> [=1B[0;32m  OK  =1B[0m] Listening on =1B[0;1;39mudev Control Socket=1B[0m.
> [    1.867853] systemd[1]: Listening on udev Kernel Socket.
> [=1B[0;32m  OK  =1B[0m] Listening on =1B[0;1;39mudev Kernel Socket=1B[0m.
> [    1.867897] systemd[1]: Reached target Socket Units.
> [=1B[0;32m  OK  =1B[0m] Reached target =1B[0;1;39mSocket Units=1B[0m.
> [    1.869788] systemd[1]: Starting Create List of Static Device Nodes...
>          Starting =1B[0;1;39mCreate List of Static Device Nodes=1B[0m...
> [    1.871108] systemd[1]: Starting Journal Service...
>          Starting =1B[0;1;39mJournal Service=1B[0m...
> [    1.871251] systemd[1]: Load Kernel Modules was skipped because no tri=
gger condition checks were met.
> [    1.872049] systemd[1]: Starting Apply Kernel Variables...
>          Starting =1B[0;1;39mApply Kernel Variables=1B[0m...
> [    1.872857] systemd[1]: Starting Create System Users...
>          Starting =1B[0;1;39mCreate System Users=1B[0m...
> [    1.873773] systemd[1]: Starting Setup Virtual Console...
>          Starting =1B[0;1;39mSetup Virtual Console=1B[0m...
> [    1.874925] systemd[1]: Finished Create List of Static Device Nodes.
> [=1B[0;32m  OK  =1B[0m] Finished =1B[0;1;39mCreate List of Static Device =
Nodes=1B[0m.
> [    1.876623] systemd[1]: Finished Apply Kernel Variables.
> [=1B[0;32m  OK  =1B[0m] Finished =1B[0;1;39mApply Kernel Variables=1B[0m.
> [    1.878887] systemd[1]: Finished Create System Users.
> [=1B[0;32m  OK  =1B[0m] Finished =1B[0;1;39mCreate System Users=1B[0m.
> [    1.879875] systemd[1]: Starting Create Static Device Nodes in /dev...
>          Starting =1B[0;1;39mCreate Static Device Nodes in /dev=1B[0m...
> [    1.884120] systemd[1]: Finished Create Static Device Nodes in /dev.
> [=1B[0;32m  OK  =1B[0m] Finished =1B[0;1;39mCreate Static Device Nodes in=
 /dev=1B[0m.
> [    1.885620] systemd[1]: Started Journal Service.
> [=1B[0;32m  OK  =1B[0m] Started =1B[0;1;39mJournal Service=1B[0m.
>          Starting =1B[0;1;39mCreate Volatile Files and Directories=1B[0m.=
=2E.
> [=1B[0;32m  OK  =1B[0m] Finished =1B[0;1;39mCreate Volatile Files and Dir=
ectories=1B[0m.
> [=1B[0;32m  OK  =1B[0m] Finished =1B[0;1;39mSetup Virtual Console=1B[0m.
>          Starting =1B[0;1;39mdracut cmdline hook=1B[0m...
> [=1B[0;32m  OK  =1B[0m] Finished =1B[0;1;39mdracut cmdline hook=1B[0m.
>          Starting =1B[0;1;39mdracut pre-udev hook=1B[0m...
> [=1B[0;32m  OK  =1B[0m] Finished =1B[0;1;39mdracut pre-udev hook=1B[0m.
>          Starting =1B[0;1;39mRule-based Manage???for Device Events and Fi=
les=1B[0m...
> [    1.955512] usercopy: Kernel memory exposure attempt detected from SLU=
B object 'cpumask' (offset 0, size 16)!
> [    1.955531] ------------[ cut here ]------------
> [    1.955535] kernel BUG at mm/usercopy.c:102!
> [    1.955539] Oops: Exception in kernel mode, sig: 5 [#1]
> [    1.955543] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D8192 NUMA pSe=
ries
> [    1.955547] Modules linked in:
> [    1.955551] CPU: 27 PID: 482 Comm: systemd-udevd Not tainted 6.9.0-rc1=
-next-20240325 #1
> [    1.955556] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf0000=
06 of:IBM,FW1060.00 (NH1060_018) hv:phyp pSeries
> [    1.955561] NIP:  c0000000005d08d4 LR: c0000000005d08d0 CTR: 000000000=
06e638c
> [    1.955565] REGS: c00000005383f9f0 TRAP: 0700   Not tainted  (6.9.0-rc=
1-next-20240325)
> [    1.955570] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 2800220=
f  XER: 00000002
> [    1.955579] CFAR: c0000000002141f0 IRQMASK: 0=20
> [    1.955579] GPR00: c0000000005d08d0 c00000005383fc90 c000000001563b00 =
0000000000000061=20
> [    1.955579] GPR04: c000000e855b7c08 c000000e8563e000 c00000005383fad8 =
0000000e83380000=20
> [    1.955579] GPR08: 0000000000000027 c00000000223c030 0000000e83380000 =
0000000000000001=20
> [    1.955579] GPR12: c000000002a37bd0 c000000e87be8300 0000000000000000 =
0000000000000000=20
> [    1.955579] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
> [    1.955579] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
> [    1.955579] GPR24: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
> [    1.955579] GPR28: 0000000000000001 c000000004017200 0000000000000010 =
c0000000097129b0=20
> [    1.955623] NIP [c0000000005d08d4] usercopy_abort+0x78/0xb0
> [    1.955630] LR [c0000000005d08d0] usercopy_abort+0x74/0xb0
> [    1.955634] Call Trace:
> [    1.955636] [c00000005383fc90] [c0000000005d08d0] usercopy_abort+0x74/=
0xb0 (unreliable)
> [    1.955642] [c00000005383fd00] [c0000000005424e4] __check_heap_object+=
0x1b0/0x1b4
> [    1.955649] [c00000005383fd40] [c0000000005d0b24] check_heap_object+0x=
218/0x240
> [    1.955654] [c00000005383fd80] [c0000000005d0bd0] __check_object_size+=
0x84/0x1a4
> [    1.955659] [c00000005383fdc0] [c0000000001c1990] sys_sched_getaffinit=
y+0x114/0x174
> [    1.955665] [c00000005383fe10] [c000000000033498] system_call_exceptio=
n+0x138/0x330
> [    1.955671] [c00000005383fe50] [c00000000000d05c] system_call_vectored=
_common+0x15c/0x2ec
> [    1.955678] --- interrupt: 3000 at 0x7fff8ccb72c0
> [    1.955682] NIP:  00007fff8ccb72c0 LR: 00007fff8ccb72c0 CTR: 000000000=
0000000
> [    1.955686] REGS: c00000005383fe80 TRAP: 3000   Not tainted  (6.9.0-rc=
1-next-20240325)
> [    1.955690] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE=
>  CR: 44002808  XER: 00000000
> [    1.955700] IRQMASK: 0=20
> [    1.955700] GPR00: 00000000000000df 00007fffd97f38a0 00007fff8d337500 =
0000000000000000=20
> [    1.955700] GPR04: 0000000000000010 0000000145511090 0000000145510010 =
0000000000145511=20
> [    1.955700] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
> [    1.955700] GPR12: 0000000000000000 00007fff8d3e4c40 0000000110e15770 =
0000000110e157c8=20
> [    1.955700] GPR16: 0000000110e15840 0000000110e15880 0000000110e15800 =
0000000110e190c0=20
> [    1.955700] GPR20: 0000000000000000 0000000000000001 0000000000000001 =
0000000110e60000=20
> [    1.955700] GPR24: 0000000110e60340 0000000110e603c8 0000000110e603c0 =
0000000110e60058=20
> [    1.955700] GPR28: 0000000000000038 0000000000000100 0000000145511090 =
0000000000000010=20
> [    1.955742] NIP [00007fff8ccb72c0] 0x7fff8ccb72c0
> [    1.955746] LR [00007fff8ccb72c0] 0x7fff8ccb72c0
> [    1.955749] --- interrupt: 3000
> [    1.955751] Code: 2c280000 41820050 3ce2ffe6 3d22ffe5 38e77ce8 3929c16=
8 7c661b78 3c62ffe6 f9610060 38637cf0 4bc438dd 60000000 <0fe00000> 3c82ffe4=
 3ca2ffef 38846510=20
> [    1.955765] ---[ end trace 0000000000000000 ]---
> [    1.957568] pstore: backend (nvram) writing error (-1)
> [    1.957572]=20
> [    2.957575] Kernel panic - not syncing: Fatal exception
> [    2.963038] Rebooting in 10 seconds..

It was odd that my previous reply didn't make it to lore, so I guess I
should resend it.

[cc Andrew]

Hi Andrew,

Can you please drop this commit from non-mm tree? Or an explicit revert
patch should be submitted from me?

Again, really sorry for this.

Thanks,

	Dawei
>=20
>=20
> -- Sachin

