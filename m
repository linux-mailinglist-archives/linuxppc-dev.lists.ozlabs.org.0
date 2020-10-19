Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BB32920D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 03:03:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CDz5G4fYlzDqfs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 12:02:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CUwvraSm; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CDz2m54YkzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 12:00:47 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id g16so4397077pjv.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 18:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=luDFiwCFvZ4S/ocvfYokvbfwlURKO40K9uJPm65FtaU=;
 b=CUwvraSmlnTVYpKk+cbxz2BPx8rXuwHbLoguVm3LphNKWyyS9ID0rYm7AnkamxUuH4
 VfNSoD1RV8chXkrKGhiIPOyBYiOSWeiny4UFV/jmB6hJ1MV4MJw6oVX6pgRTNKPezufo
 Lz69z8bE8y5pzgRvjDrLMEnhLyW4eVZ1OHGIWeX3gjCdF7Ig1v+kChrBpKCsTLhpEwI9
 xrorza0VJ+eFmaqABz0OyissP0zwRrYBAWVQe9MOaSlVsCEDiliGrD5dIf56TX3Z1VqB
 B1BVKi4y59f+HIEYW4iI112H29v3OV8BP5/KFfI1/tGgAvlzBQmsnMpZqFauv5Penqxi
 +IbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=luDFiwCFvZ4S/ocvfYokvbfwlURKO40K9uJPm65FtaU=;
 b=iS60IH3L4tPMAmAGDJ4T7SS48RFTnL+fQ96p03/r435FORGTOmJAh6hghF7kmKxuka
 RzbR617w1XGAhHRJSKxfXPsvXZGY2jbTZ4yBR4CGj6XNmEPkjxnKZHX5KxINPVVTkfig
 YAOPTDNqqEK7GVhvf/v1WTQA2J1nNZ4+3BRL9eziHa6BI1EeVHGe4lG6nyN34vllXv3U
 wHdNYyvNWLmKNc2fQ6aERcDCfLBK7IW7iZ0+wl7efMrHjzFdjg2rQ0DrSuVNaRqN5i41
 AJ22yACOuJn3xGRQIpN54cDIEHs1M5Aqx8ldOPEeTWjsZdrW74HjiTNkEDPrQkQm0MKO
 oUcQ==
X-Gm-Message-State: AOAM530RAuHa8rygEqHdT0992VKA0Vv1QBsMuIIbzap4qmQYtStI7pgI
 mfvz91C4jz8wrxXGja4FWso=
X-Google-Smtp-Source: ABdhPJzBielqv9Z/RH4hOaRVNhA5uOc+UEFG/UWjV41F91pEkp233lMmCdiCYrqzpv9AO3ET8+K0wA==
X-Received: by 2002:a17:90a:fa8f:: with SMTP id
 cu15mr14601415pjb.56.1603069240874; 
 Sun, 18 Oct 2020 18:00:40 -0700 (PDT)
Received: from localhost ([1.129.224.104])
 by smtp.gmail.com with ESMTPSA id q8sm10452784pff.18.2020.10.18.18.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 18:00:40 -0700 (PDT)
Date: Mon, 19 Oct 2020 11:00:33 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: KVM on POWER8 host lock up since 10d91611f426 ("powerpc/64s:
 Reimplement book3s idle code in C")
To: Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>
References: <20200830201145.GA29521@kitsune.suse.cz>
 <1598835313.5688ngko4f.astroid@bobo.none>
 <20200831091523.GC29521@kitsune.suse.cz> <87y2lv1430.fsf@mpe.ellerman.id.au>
 <1599484062.vgmycu6q5i.astroid@bobo.none>
 <20201016201410.GH29778@kitsune.suse.cz>
In-Reply-To: <20201016201410.GH29778@kitsune.suse.cz>
MIME-Version: 1.0
Message-Id: <1603066878.gtbyofrzyo.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: ro@suse.de, linuxppc-dev@lists.ozlabs.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michal Such=C3=A1nek's message of October 17, 2020 6:14 am:
> On Mon, Sep 07, 2020 at 11:13:47PM +1000, Nicholas Piggin wrote:
>> Excerpts from Michael Ellerman's message of August 31, 2020 8:50 pm:
>> > Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>> >> On Mon, Aug 31, 2020 at 11:14:18AM +1000, Nicholas Piggin wrote:
>> >>> Excerpts from Michal Such=C3=A1nek's message of August 31, 2020 6:11=
 am:
>> >>> > Hello,
>> >>> >=20
>> >>> > on POWER8 KVM hosts lock up since commit 10d91611f426 ("powerpc/64=
s:
>> >>> > Reimplement book3s idle code in C").
>> >>> >=20
>> >>> > The symptom is host locking up completely after some hours of KVM
>> >>> > workload with messages like
>> >>> >=20
>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab=
 cpu 47
>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab=
 cpu 71
>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab=
 cpu 47
>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab=
 cpu 71
>> >>> > 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab=
 cpu 47
>> >>> >=20
>> >>> > printed before the host locks up.
>> >>> >=20
>> >>> > The machines run sandboxed builds which is a mixed workload result=
ing in
>> >>> > IO/single core/mutiple core load over time and there are periods o=
f no
>> >>> > activity and no VMS runnig as well. The VMs are shortlived so VM
>> >>> > setup/terdown is somewhat excercised as well.
>> >>> >=20
>> >>> > POWER9 with the new guest entry fast path does not seem to be affe=
cted.
>> >>> >=20
>> >>> > Reverted the patch and the followup idle fixes on top of 5.2.14 an=
d
>> >>> > re-applied commit a3f3072db6ca ("powerpc/powernv/idle: Restore IAM=
R
>> >>> > after idle") which gives same idle code as 5.1.16 and the kernel s=
eems
>> >>> > stable.
>> >>> >=20
>> >>> > Config is attached.
>> >>> >=20
>> >>> > I cannot easily revert this commit, especially if I want to use th=
e same
>> >>> > kernel on POWER8 and POWER9 - many of the POWER9 fixes are applica=
ble
>> >>> > only to the new idle code.
>> >>> >=20
>> >>> > Any idea what can be the problem?
>> >>>=20
>> >>> So hwthread_state is never getting back to to HWTHREAD_IN_IDLE on
>> >>> those threads. I wonder what they are doing. POWER8 doesn't have a g=
ood
>> >>> NMI IPI and I don't know if it supports pdbg dumping registers from =
the
>> >>> BMC unfortunately.
>> >>
>> >> It may be possible to set up fadump with a later kernel version that
>> >> supports it on powernv and dump the whole kernel.
>> >=20
>> > Your firmware won't support it AFAIK.
>> >=20
>> > You could try kdump, but if we have CPUs stuck in KVM then there's a
>> > good chance it won't work :/
>>=20
>> I haven't had any luck yet reproducing this still. Testing with sub=20
>> cores of various different combinations, etc. I'll keep trying though.
>=20
> Hello,
>=20
> I tried running some KVM guests to simulate the workload and what I get
> is guests failing to start with a rcu stall. Tried both 5.3 and 5.9
> kernel and qemu 4.2.1 and 5.1.0
>=20
> To start some guests I run
>=20
> for i in $(seq 0 9) ; do /opt/qemu/bin/qemu-system-ppc64 -m 2048 -accel k=
vm -smp 8 -kernel /boot/vmlinux -initrd /boot/initrd -nodefaults -nographic=
 -serial mon:telnet::444$i,server,wait & done
>=20
> To simulate some workload I run
>=20
> xz -zc9T0 < /dev/zero > /dev/null &
> while true; do
>     killall -STOP xz; sleep 1; killall -CONT xz; sleep 1;
> done &
>=20
> on the host and add a job that executes this to the ramdisk. However, mos=
t
> guests never get to the point where the job is executed.
>=20
> Any idea what might be the problem?

I would say try without pv queued spin locks (but if the same thing is=20
happening with 5.3 then it must be something else I guess).=20

I'll try to test a similar setup on a POWER8 here.

Thanks,
Nick

>=20
> In the past I was able to boot guests quite realiably.
>=20
> This is boot log of one of the VMs
>=20
> Trying ::1...
> Connected to localhost.
> Escape character is '^]'.
>=20
>=20
> SLOF ********************************************************************=
**
> QEMU Starting
>  Build Date =3D Jul 17 2020 11:15:24
>  FW Version =3D git-e18ddad8516ff2cf
>  Press "s" to enter Open Firmware.
>=20
> Populating /vdevice methods
> Populating /vdevice/vty@71000000
> Populating /vdevice/nvram@71000001
> Populating /pci@800000020000000
> No NVRAM common partition, re-initializing...
> Scanning USB=20
> Using default console: /vdevice/vty@71000000
> Detected RAM kernel at 400000 (27c8620 bytes)=20
>     =20
>   Welcome to Open Firmware
>=20
>   Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
>   This program and the accompanying materials are made available
>   under the terms of the BSD License available at
>   http://www.opensource.org/licenses/bsd-license.php
>=20
> Booting from memory...
> OF stdout device is: /vdevice/vty@71000000
> Preparing to boot Linux version 5.9.0-1.g11733e1-default (geeko@buildhost=
) (gcc (SUSE Linux) 10.2.1 20200825 [revision c0746a1beb1ba073c7981eb09f55b=
3d993b32e5c], GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.34.0.20200325-1)=
 #1 SMP Sun Oct 11 22:20:46 UTC 2020 (11733e1)
> Detected machine type: 0000000000000101
> command line: =20
> Max number of cores passed to firmware: 2048 (NR_CPUS =3D 2048)
> Calling ibm,client-architecture-support... done
> memory layout at init:
>   memory_limit : 0000000000000000 (16 MB aligned)
>   alloc_bottom : 0000000003810000
>   alloc_top    : 0000000030000000
>   alloc_top_hi : 0000000080000000
>   rmo_top      : 0000000030000000
>   ram_top      : 0000000080000000
> instantiating rtas at 0x000000002fff0000... done
> prom_hold_cpus: skipped
> copying OF device tree...
> Building dt strings...
> Building dt structure...
> Device tree strings 0x0000000003820000 -> 0x0000000003820a2c
> Device tree struct  0x0000000003830000 -> 0x0000000003840000
> Quiescing Open Firmware ...
> Booting Linux via __start() @ 0x0000000000400000 ...
> [    0.000000] hash-mmu: Page sizes from device-tree:
> [    0.000000] hash-mmu: base_shift=3D12: shift=3D12, sllp=3D0x0000, avpn=
m=3D0x00000000, tlbiel=3D1, penc=3D0
> [    0.000000] hash-mmu: base_shift=3D16: shift=3D16, sllp=3D0x0110, avpn=
m=3D0x00000000, tlbiel=3D1, penc=3D1
> [    0.000000] Using 1TB segments
> [    0.000000] hash-mmu: Initializing hash mmu with SLB
> [    0.000000] Linux version 5.9.0-1.g11733e1-default (geeko@buildhost) (=
gcc (SUSE Linux) 10.2.1 20200825 [revision c0746a1beb1ba073c7981eb09f55b3d9=
93b32e5c], GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.34.0.20200325-1) #1=
 SMP Sun Oct 11 22:20:46 UTC 2020 (11733e1)
> [    0.000000] Found initrd at 0xc000000002be0000:0xc000000003804784
> [    0.000000] Using pSeries machine description
> [    0.000000] printk: bootconsole [udbg0] enabled
> [    0.000000] Partition configured for 8 cpus.
> [    0.000000] CPU maps initialized for 1 thread per core
> [    0.000000] -----------------------------------------------------
> [    0.000000] phys_mem_size     =3D 0x80000000
> [    0.000000] dcache_bsize      =3D 0x80
> [    0.000000] icache_bsize      =3D 0x80
> [    0.000000] cpu_features      =3D 0x000002eb8f4d91a7
> [    0.000000]   possible        =3D 0x000ffbfbcf5fb1a7
> [    0.000000]   always          =3D 0x00000003800081a1
> [    0.000000] cpu_user_features =3D 0xdc0065c2 0xae000000
> [    0.000000] mmu_features      =3D 0x78006001
> [    0.000000] firmware_features =3D 0x00000085455a445f
> [    0.000000] vmalloc start     =3D 0xc008000000000000
> [    0.000000] IO start          =3D 0xc00a000000000000
> [    0.000000] vmemmap start     =3D 0xc00c000000000000
> [    0.000000] hash-mmu: ppc64_pft_size    =3D 0x18
> [    0.000000] hash-mmu: htab_hash_mask    =3D 0x1ffff
> [    0.000000] -----------------------------------------------------
> [    0.000000] numa:   NODE_DATA [mem 0x7ffa8900-0x7ffaffff]
> [    0.000000] rfi-flush: fallback displacement flush available
> [    0.000000] rfi-flush: ori type flush available
> [    0.000000] rfi-flush: mttrig type flush available
> [    0.000000] count-cache-flush: hardware flush enabled.
> [    0.000000] link-stack-flush: software flush enabled.
> [    0.000000] stf-barrier: hwsync barrier available
> [    0.000000] PCI host bridge /pci@800000020000000  ranges:
> [    0.000000]   IO 0x0000200000000000..0x000020000000ffff -> 0x000000000=
0000000
> [    0.000000]  MEM 0x0000200080000000..0x00002000ffffffff -> 0x000000008=
0000000=20
> [    0.000000]  MEM 0x0000210000000000..0x000021ffffffffff -> 0x000021000=
0000000=20
> [    0.000000] PCI: OF: PROBE_ONLY disabled
> [    0.000000] PPC64 nvram contains 65536 bytes
> [    0.000000] PV qspinlock hash table entries: 4096 (order: 0, 65536 byt=
es, linear)
> [    0.000000] barrier-nospec: using ORI speculation barrier
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000000000000-0x000000007fffffff]
> [    0.000000]   Device   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000000000-0x000000007fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000007ff=
fffff]
> [    0.000000] percpu: Embedded 11 pages/cpu s629400 r0 d91496 u1048576
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 327=
36
> [    0.000000] Policy zone: Normal
> [    0.000000] Kernel command line:=20
> [    0.000000] Dentry cache hash table entries: 262144 (order: 5, 2097152=
 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 131072 (order: 4, 1048576 =
bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 0K/2097152K available (15104K kernel code, 1984K r=
wdata, 7040K rodata, 5824K init, 10721K bss, 131968K reserved, 0K cma-reser=
ved)
> [    0.000000] random: get_random_u64 called from kmem_cache_open+0x3c/0x=
330 with crng_init=3D0
> [    0.000000] SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CPUs=3D8=
, Nodes=3D1
> [    0.000000] ftrace: allocating 37469 entries in 14 pages
> [    0.000000] ftrace: allocated 14 pages with 3 groups
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu: 	RCU event tracing is enabled.
> [    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D2048 to nr_cpu_i=
ds=3D8.
> [    0.000000] 	Trampoline variant of Tasks RCU enabled.
> [    0.000000] 	Rude variant of Tasks RCU enabled.
> [    0.000000] 	Tracing variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is=
 10 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D8
> [    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
> [    0.000001] clocksource: timebase: mask: 0xffffffffffffffff max_cycles=
: 0x761537d007, max_idle_ns: 440795202126 ns
> [    0.001107] clocksource: timebase mult[1f40000] shift[24] registered
> [    0.001819] Console: colour dummy device 80x25
> [    0.002296] printk: console [hvc0] enabled
> [    0.002296] printk: console [hvc0] enabled
> [    0.002762] printk: bootconsole [udbg0] disabled
> [    0.002762] printk: bootconsole [udbg0] disabled
> [    0.003323] pid_max: default: 32768 minimum: 301
> [    0.003435] LSM: Security Framework initializing
> [    0.003529] AppArmor: AppArmor initialized
> [    0.003597] Mount-cache hash table entries: 8192 (order: 0, 65536 byte=
s, linear)
> [    0.003660] Mountpoint-cache hash table entries: 8192 (order: 0, 65536=
 bytes, linear)
> [    0.004286] EEH: pSeries platform initialized
> [    0.004329] POWER8 performance monitor hardware support registered
> [    0.004380] power8-pmu: PMAO restore workaround active.
> [    0.004434] rcu: Hierarchical SRCU implementation.
> [    0.004660] smp: Bringing up secondary CPUs ...
> [    0.007882] smp: Brought up 1 node, 8 CPUs
> [    0.007927] numa: Node 0 CPUs: 0-7
> [    0.007958] Using standard scheduler topology
> [    0.009002] node 0 deferred pages initialised in 0ms
> [    0.009491] devtmpfs: initialized
> [    0.018942] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 19112604462750000 ns
> [    0.019031] futex hash table entries: 2048 (order: 2, 262144 bytes, li=
near)
> [    0.019229] pinctrl core: initialized pinctrl subsystem
> [    0.019602] NET: Registered protocol family 16
> [    0.019805] audit: initializing netlink subsys (disabled)
> [    0.020018] audit: type=3D2000 audit(1602878417.010:1): state=3Dinitia=
lized audit_enabled=3D0 res=3D1
> [    0.020091] thermal_sys: Registered thermal governor 'fair_share'
> [    0.020092] thermal_sys: Registered thermal governor 'bang_bang'
> [    0.020180] thermal_sys: Registered thermal governor 'step_wise'
> [    0.020228] thermal_sys: Registered thermal governor 'user_space'
> [    0.020292] cpuidle: using governor ladder
> [    0.020372] cpuidle: using governor menu
> [    0.020521] pstore: Registered nvram as persistent store backend
> Linux ppc64le
> #1 SMP Sun Oct 1[    0.024636] PCI: Probing PCI hardware
> [    0.024713] PCI host bridge to bus 0000:00
> [    0.024746] pci_bus 0000:00: root bus resource [io  0x10000-0x1ffff] (=
bus address [0x0000-0xffff])
> [    0.024814] pci_bus 0000:00: root bus resource [mem 0x200080000000-0x2=
000ffffffff] (bus address [0x80000000-0xffffffff])
> [    0.024891] pci_bus 0000:00: root bus resource [mem 0x210000000000-0x2=
1ffffffffff]
> [    0.024950] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.026710] IOMMU table initialized, virtual merging enabled
> [    0.026769] pci_bus 0000:00: resource 4 [io  0x10000-0x1ffff]
> [    0.026820] pci_bus 0000:00: resource 5 [mem 0x200080000000-0x2000ffff=
ffff]
> [    0.026869] pci_bus 0000:00: resource 6 [mem 0x210000000000-0x21ffffff=
ffff]
> [    0.026918] EEH: No capable adapters found: recovery disabled.
> [    0.031232] iommu: Default domain type: Translated=20
> [    0.031358] vgaarb: loaded
> [    0.031439] pps_core: LinuxPPS API ver. 1 registered
> [    0.031479] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o Giometti <giometti@linux.it>
> [    0.031548] PTP clock support registered
> [    0.031585] EDAC MC: Ver: 3.0.0
> [    0.031861] NetLabel: Initializing
> [    0.031893] NetLabel:  domain hash size =3D 128
> [    0.031932] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
> [    0.031992] NetLabel:  unlabeled traffic allowed by default
> [    0.045283] clocksource: Switched to clocksource timebase
> [    0.061403] VFS: Disk quotas dquot_6.6.0
> [    0.061497] VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 =
bytes)
> [    0.061581] hugetlbfs: disabling because there are no supported hugepa=
ge sizes
> [    0.061727] AppArmor: AppArmor Filesystem Enabled
> [    0.063692] random: fast init done
> [    0.065139] NET: Registered protocol family 2
> [    0.065324] tcp_listen_portaddr_hash hash table entries: 4096 (order: =
0, 65536 bytes, linear)
> [    0.065401] TCP established hash table entries: 16384 (order: 1, 13107=
2 bytes, linear)
> [    0.065482] TCP bind hash table entries: 16384 (order: 2, 262144 bytes=
, linear)
> [    0.065564] TCP: Hash tables configured (established 16384 bind 16384)
> [    0.065658] MPTCP token hash table entries: 4096 (order: 0, 98304 byte=
s, linear)
> [    0.065729] UDP hash table entries: 2048 (order: 0, 65536 bytes, linea=
r)
> [    0.065785] UDP-Lite hash table entries: 2048 (order: 0, 65536 bytes, =
linear)
> [    0.065893] NET: Registered protocol family 1
> [    0.065937] NET: Registered protocol family 44
> [    0.065979] PCI: CLS 0 bytes, default 128
> [    0.066053] Trying to unpack rootfs image as initramfs...
> [    0.095306] rcu: INFO: rcu_sched self-detected stall on CPU
> [    0.095492] rcu: 	4-...!: (1 GPs behind) idle=3D0d6/0/0x1 softirq=3D6/=
7 fqs=3D0=20
> [    0.095647] 	(t=3D13508 jiffies g=3D-1187 q=3D215)
> [    0.095769] rcu: rcu_sched kthread starved for 13508 jiffies! g-1187 f=
0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D0
> [    0.096015] rcu: 	Unless rcu_sched kthread gets sufficient CPU time, O=
OM is now expected behavior.
> [    0.096233] rcu: RCU grace-period kthread stack dump:
> [    0.096360] task:rcu_sched       state:I stack:    0 pid:   10 ppid:  =
   2 flags:0x00000808
> [    0.096551] Call Trace:
> [    0.096621] [c000000007aab820] [c000000007aab890] 0xc000000007aab890 (=
unreliable)
> [    0.096812] [c000000007aaba00] [c00000000001c25c] __switch_to+0x11c/0x=
200
> [    0.096971] [c000000007aaba60] [c000000000ea50ac] __schedule+0x23c/0x8=
00
> [    0.097136] [c000000007aabb30] [c000000000ea56e4] schedule+0x74/0x140
> [    0.097294] [c000000007aabb60] [c000000000eab6b0] schedule_timeout+0xa=
0/0x1c0
> [    0.097483] [c000000007aabc30] [c00000000021f00c] rcu_gp_fqs_loop+0x48=
c/0x610
> [    0.097674] [c000000007aabcf0] [c000000000222f40] rcu_gp_kthread+0x200=
/0x290
> [    0.097859] [c000000007aabdb0] [c000000000190e60] kthread+0x190/0x1a0
> [    0.098018] [c000000007aabe20] [c00000000000d3d0] ret_from_kernel_thre=
ad+0x5c/0x6c
> [    0.098211] Sending NMI from CPU 4 to CPUs 0:
> [    6.719253] CPU 0 didn't respond to backtrace IPI, inspecting paca.
> [    6.722181] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 1 (swappe=
r/0)
> [    6.722297] Back trace of paca->saved_r1 (0xc000000007a8f140) (possibl=
y stale):
> [    6.722412] Call Trace:
> [    6.722489] [c000000007a8f140] [0000000000000075] 0x75 (unreliable)
> [    6.722581] [c000000007a8f1a0] [c000000007a8f280] 0xc000000007a8f280
> [    6.722680] [c000000007a8f250] [c000000000254e30] tick_do_update_jiffi=
es64.part.0+0x100/0x1f0
> [    6.722785] [c000000007a8f290] [c00000000025505c] tick_sched_timer+0x1=
3c/0x140
> [    6.722855] [c000000007a8f2d0] [c00000000023ac50] __run_hrtimer+0xb0/0=
x360
> [    6.722916] [c000000007a8f320] [c00000000023afd4] __hrtimer_run_queues=
+0xd4/0x1a0
> [    6.722986] [c000000007a8f380] [c00000000023c144] hrtimer_interrupt+0x=
124/0x300
> [    6.723064] [c000000007a8f430] [c0000000000272b4] timer_interrupt+0x10=
4/0x2d0
> [    6.723141] [c000000007a8f490] [c000000000009aa0] decrementer_common_v=
irt+0x190/0x1a0
> [    6.723227] --- interrupt: 900 at lzma_main+0x1d4/0x2a0
> [    6.723227]     LR =3D lzma_main+0xcc/0x2a0
> [    6.723317] [c000000007a8f790] [c0000000008dec00] lzma_main+0x1f0/0x2a=
0 (unreliable)
> [    6.723393] [c000000007a8f7d0] [c0000000008dee90] lzma2_lzma+0x1e0/0x3=
90
> [    6.723448] [c000000007a8f820] [c0000000008df150] xz_dec_lzma2_run+0x1=
10/0x6e0
> [    6.723523] [c000000007a8f8c0] [c0000000008dce58] dec_block+0x218/0x2b=
0
> [    6.723578] [c000000007a8f920] [c0000000008dd390] dec_main+0x1a0/0x590
> [    6.723645] [c000000007a8f9b0] [c0000000008dd7d4] xz_dec_run+0x54/0x18=
0
> [    6.723714] [c000000007a8f9f0] [c00000000160333c] unxz+0x1e8/0x408
> [    6.723786] [c000000007a8faa0] [c0000000015b6f58] unpack_to_rootfs+0x1=
e4/0x378
> [    6.723851] [c000000007a8fb50] [c0000000015b7264] populate_rootfs+0x98=
/0x184
> [    6.723926] [c000000007a8fbd0] [c000000000011ee0] do_one_initcall+0x60=
/0x2b0
> [    6.723992] [c000000007a8fca0] [c0000000015b4f34] do_initcalls+0x140/0=
x18c
> [    6.724062] [c000000007a8fd50] [c0000000015b520c] kernel_init_freeable=
+0x1f0/0x25c
> [    6.724129] [c000000007a8fdb0] [c000000000012534] kernel_init+0x2c/0x1=
68
> [    6.724183] [c000000007a8fe20] [c00000000000d3d0] ret_from_kernel_thre=
ad+0x5c/0x6c
> [    6.724315] Sending NMI from CPU 4 to CPUs 1:
> [    6.724569] CPU 1 didn't respond to backtrace IPI, inspecting paca.
> [    6.724582] NMI backtrace for cpu 1
> [    6.724640] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 0 (swappe=
r/1)
> [    6.724801] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.9.0-1.g11733e1=
-default #1 openSUSE Tumbleweed (unreleased)
> [    6.724838] Back trace of paca->saved_r1 (0xc000000007aff720) (possibl=
y stale):
> [    6.724841] Call Trace:
> [    6.724957] NIP:  c0000000000fb260 LR: c0000000000fdf58 CTR: c00000000=
012e014
> [    6.725027] Sending NMI from CPU 4 to CPUs 2:
> [    6.725049] REGS: c000000007ad7b00 TRAP: 0500   Not tainted  (5.9.0-1.=
g11733e1-default)
> [    6.725052] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 4800022=
4  XER: 00000000
> [    6.725188] CPU 2 didn't respond to backtrace IPI, inspecting paca.
> [    6.725194] NMI backtrace for cpu 2
> [    6.725200] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 5.9.0-1.g11733e1=
-default #1 openSUSE Tumbleweed (unreleased)
> [    6.725201] NIP:  c0000000000fb260 LR: c0000000000fdf58 CTR: c00000000=
012e014
> [    6.725203] REGS: c000000007af7b00 TRAP: 0500   Not tainted  (5.9.0-1.=
g11733e1-default)
> [    6.725203] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 4800002=
4  XER: 00000000
> [    6.725208] CFAR: c0000000001e8fbc IRQMASK: 0=20
> [    6.725208] GPR00: 0000000028000024 c000000007af7d90 c000000001cd4a00 =
0000000000000000=20
> [    6.725208] GPR04: c00000007f612c30 0000000000000000 00000000001570d0 =
000000000014de44=20
> [    6.725208] GPR08: 000000007df60000 c00000003fffd000 0000000000000001 =
00000000ffffffff=20
> [    6.725208] GPR12: c0000000000fdec0 c00000003fffd600 0000000000000000 =
0000000000000000=20
> [    6.725208] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
> [    6.725208] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
> [    6.725208] GPR24: 0000000000000002 0000000000000000 0000000000000000 =
c000000001d17640=20
> [    6.725208] GPR28: 0000000000000001 c000000007a49e00 c0000000016a7190 =
c0000000016a7188=20
> [    6.725233] NIP [c0000000000fb260] plpar_hcall_norets+0x1c/0x28
> [    6.725235] LR [c0000000000fdf58] pseries_lpar_idle+0x98/0x190
> [    6.725236] Call Trace:
> [    6.725238] [c000000007af7d90] [c000000007a49e00] 0xc000000007a49e00 (=
unreliable)
> [    6.725241] [c000000007af7e00] [c00000000001da40] arch_cpu_idle+0x50/0=
x180
> [    6.725266] [c000000007af7e30] [c000000000eacd84] default_idle_call+0x=
84/0x208
> [    6.725268] CFAR: c0000000001e9170=20
> [    6.725272] IRQMASK: 0=20
> [    6.725272] GPR00: 0000000028000224 c000000007ad7d90 c000000001cd4a00 =
0000000000000000=20
> [    6.725272] GPR04: c00000007f512c30 0000000000000000 0000000000101b60 =
00000000000fa76c=20
> [    6.725272] GPR08: 000000007de60000 c00000003fffe800 0000000000000001 =
00000000ffffffff=20
> [    6.725272] GPR12: c0000000000fdec0 c00000003fffee00 0000000000000000 =
0000000000000000=20
> [    6.725272] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
> [    6.725272] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
> [    6.725272] GPR24: 0000000000000001 0000000000000000 0000000000000000 =
c000000001d17640=20
> [    6.725272] GPR28: 0000000000000001 c000000007a42780 c0000000016a7190 =
c0000000016a7188=20
> [    6.725289] NIP [c0000000000fb260] plpar_hcall_norets+0x1c/0x28
> [    6.725291] LR [c0000000000fdf58] pseries_lpar_idle+0x98/0x190
> [    6.725292] Call Trace:
> [    6.725295] [c000000007ad7d90] [c000000007a42780] 0xc000000007a42780 (=
unreliable)
> [    6.725298] [c000000007ad7e00] [c00000000001da40] arch_cpu_idle+0x50/0=
x180
> [    6.725302] [c000000007ad7e30] [c000000000eacd84] default_idle_call+0x=
84/0x208
> [    6.725305] [c000000007ad7e70] [c0000000001afd6c] cpuidle_idle_call+0x=
20c/0x2d0
> [    6.725306] [c000000007ad7ec0] [c0000000001aff20] do_idle+0xf0/0x1d0
> [    6.725308] [c000000007ad7f10] [c0000000001b024c] cpu_startup_entry+0x=
3c/0x40
> [    6.725310] [c000000007ad7f40] [c00000000005f038] start_secondary+0x24=
8/0x250
> [    6.725312] [c000000007ad7f90] [c00000000000c454] start_secondary_prol=
og+0x10/0x14
> [    6.725312] Instruction dump:
> [    6.725337] 7c0803a6 3884fff8 78630100 78840020 4bfffeb0 3c4c01be 3842=
97bc 7c421378=20
> [    6.725340] 7c000026 90010008 60000000 44000022 <80010008> 7c0ff120 4e=
800020 7c0802a6=20
> [    6.725357] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 0 (swappe=
r/2)
> [    6.725517] [c000000007af7e70] [c0000000001afd6c] cpuidle_idle_call+0x=
20c/0x2d0
> [    6.725556] Back trace of paca->saved_r1 (0x0000000000000000) (possibl=
y stale):
> [    6.725558] Call Trace:
> [    6.725658] [c000000007af7ec0] [c0000000001aff20] do_idle+0xf0/0x1d0
> [    6.725740] Sending NMI from CPU 4 to CPUs 3:
> [    6.725806] [c000000007af7f10] [c0000000001b024c] cpu_startup_entry+0x=
3c/0x40
> [    6.728644] [c000000007af7f40] [c00000000005f038] start_secondary+0x24=
8/0x250
> [    6.728707] [c000000007af7f90] [c00000000000c454] start_secondary_prol=
og+0x10/0x14
> [    6.728769] Instruction dump:
> [    6.728805] 7c0803a6 3884fff8 78630100 78840020 4bfffeb0 3c4c01be 3842=
97bc 7c421378=20
> [    6.728869] 7c000026 90010008 60000000 44000022 <80010008> 7c0ff120 4e=
800020 7c0802a6=20
> [   12.209770] CPU 3 didn't respond to backtrace IPI, inspecting paca.
> [   12.210353] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 0 (swappe=
r/3)
> [   12.210436] Back trace of paca->saved_r1 (0xc000000007a83760) (possibl=
y stale):
> [   12.210546] Call Trace:
> [   12.210578] [c000000007a83760] [c000000007a837b0] 0xc000000007a837b0 (=
unreliable)
> [   12.210655] [c000000007a83800] [c0000000001e9574] __pv_queued_spin_loc=
k_slowpath+0x2f4/0x420
> [   12.210739] [c000000007a83850] [c000000000ead414] _raw_spin_lock_irqsa=
ve+0xa4/0xc0
> [   12.210814] [c000000007a83880] [c000000000220cc8] rcu_report_qs_rdp.co=
nstprop.0+0x38/0x170
> [   12.210892] [c000000007a838c0] [c000000000221334] rcu_core+0xa4/0x2a0
> [   12.210946] [c000000007a83910] [c000000000eadb40] __do_softirq+0x160/0=
x3f8
> [   12.211001] [c000000007a83a00] [c000000000162cf8] irq_exit+0xd8/0x140
> [   12.211066] [c000000007a83a30] [c0000000000272d8] timer_interrupt+0x12=
8/0x2d0
> [   12.211143] [c000000007a83a90] [c000000000009aa0] decrementer_common_v=
irt+0x190/0x1a0
> [   12.211222] --- interrupt: 900 at plpar_hcall_norets+0x1c/0x28
> [   12.211222]     LR =3D pseries_lpar_idle+0x98/0x190
> [   12.211307] [c000000007a83d90] [c000000007a4ed00] 0xc000000007a4ed00 (=
unreliable)
> [   12.211385] [c000000007a83e00] [c00000000001da40] arch_cpu_idle+0x50/0=
x180
> [   12.211441] [c000000007a83e30] [c000000000eacd84] default_idle_call+0x=
84/0x208
> [   12.211518] [c000000007a83e70] [c0000000001afd6c] cpuidle_idle_call+0x=
20c/0x2d0
> [   12.211584] [c000000007a83ec0] [c0000000001aff20] do_idle+0xf0/0x1d0
> [   12.211650] [c000000007a83f10] [c0000000001b024c] cpu_startup_entry+0x=
3c/0x40
> [   12.211717] [c000000007a83f40] [c00000000005f038] start_secondary+0x24=
8/0x250
> [   12.211792] [c000000007a83f90] [c00000000000c454] start_secondary_prol=
og+0x10/0x14
> [   12.211879] NMI backtrace for cpu 4
> [   12.211932] CPU: 4 PID: 0 Comm: swapper/4 Not tainted 5.9.0-1.g11733e1=
-default #1 openSUSE Tumbleweed (unreleased)
> [   12.212022] Call Trace:
> [   12.212055] [c000000007abb4f0] [c0000000008f5de0] dump_stack+0xc4/0x11=
4 (unreliable)
> [   12.212121] [c000000007abb540] [c00000000090316c] nmi_cpu_backtrace+0x=
ac/0x100
> [   12.212187] [c000000007abb5b0] [c00000000090336c] nmi_trigger_cpumask_=
backtrace+0x1ac/0x1f0
> [   12.212271] [c000000007abb650] [c000000000072e38] arch_trigger_cpumask=
_backtrace+0x28/0x40
> [   12.212338] [c000000007abb670] [c00000000022479c] rcu_dump_cpu_stacks+=
0x10c/0x168
> [   12.212416] [c000000007abb6c0] [c00000000021b4d0] print_cpu_stall+0x1d=
0/0x2a0
> [   12.212492] [c000000007abb770] [c00000000021d998] check_cpu_stall+0x14=
8/0x340
> [   12.212557] [c000000007abb7a0] [c00000000021dbe0] rcu_pending+0x50/0x1=
50
> [   12.212623] [c000000007abb7f0] [c0000000002233f4] rcu_sched_clock_irq+=
0x84/0x240
> [   12.212699] [c000000007abb830] [c000000000239b28] update_process_times=
+0x48/0xd0
> [   12.212765] [c000000007abb860] [c0000000002546bc] tick_sched_handle+0x=
3c/0xd0
> [   12.212842] [c000000007abb890] [c000000000254fb0] tick_sched_timer+0x9=
0/0x140
> [   12.212919] [c000000007abb8d0] [c00000000023ac50] __run_hrtimer+0xb0/0=
x360
> [   12.212973] [c000000007abb920] [c00000000023afd4] __hrtimer_run_queues=
+0xd4/0x1a0
> [   12.213050] [c000000007abb980] [c00000000023c144] hrtimer_interrupt+0x=
124/0x300
> [   12.213128] [c000000007abba30] [c0000000000272b4] timer_interrupt+0x10=
4/0x2d0
> [   12.213203] [c000000007abba90] [c000000000009aa0] decrementer_common_v=
irt+0x190/0x1a0
> [   12.213269] --- interrupt: 900 at plpar_hcall_norets+0x1c/0x28
> [   12.213269]     LR =3D pseries_lpar_idle+0x98/0x190
> [   12.213361] [c000000007abbd90] [c000000007a44f00] 0xc000000007a44f00 (=
unreliable)
> [   12.213437] [c000000007abbe00] [c00000000001da40] arch_cpu_idle+0x50/0=
x180
> [   12.213502] [c000000007abbe30] [c000000000eacd84] default_idle_call+0x=
84/0x208
> [   12.213567] [c000000007abbe70] [c0000000001afd6c] cpuidle_idle_call+0x=
20c/0x2d0
> [   12.213645] [c000000007abbec0] [c0000000001aff20] do_idle+0xf0/0x1d0
> [   12.213707] [c000000007abbf10] [c0000000001b0248] cpu_startup_entry+0x=
38/0x40
> [   12.213775] [c000000007abbf40] [c00000000005f038] start_secondary+0x24=
8/0x250
> [   12.213840] [c000000007abbf90] [c00000000000c454] start_secondary_prol=
og+0x10/0x14
> [   12.213917] Sending NMI from CPU 4 to CPUs 5:
> [   17.888326] CPU 5 didn't respond to backtrace IPI, inspecting paca.
> [   17.888947] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 0 (swappe=
r/5)
> [   17.889011] Back trace of paca->saved_r1 (0xc000000007ac7720) (possibl=
y stale):
> [   17.889108] Call Trace:
> [   17.889141] [c000000007ac7720] [c0000000001c1684] load_balance+0x1c4/0=
xaa0 (unreliable)
> [   17.889215] [c000000007ac7800] [c0000000001e9434] __pv_queued_spin_loc=
k_slowpath+0x1b4/0x420
> [   17.889303] [c000000007ac7850] [c000000000ead414] _raw_spin_lock_irqsa=
ve+0xa4/0xc0
> [   17.889383] [c000000007ac7880] [c000000000220cc8] rcu_report_qs_rdp.co=
nstprop.0+0x38/0x170
> [   17.889463] [c000000007ac78c0] [c000000000221334] rcu_core+0xa4/0x2a0
> [   17.889519] [c000000007ac7910] [c000000000eadb40] __do_softirq+0x160/0=
x3f8
> [   17.889582] [c000000007ac7a00] [c000000000162cf8] irq_exit+0xd8/0x140
> [   17.889641] [c000000007ac7a30] [c0000000000272d8] timer_interrupt+0x12=
8/0x2d0
> [   17.889712] [c000000007ac7a90] [c000000000009aa0] decrementer_common_v=
irt+0x190/0x1a0
> [   17.889795] --- interrupt: 900 at plpar_hcall_norets+0x1c/0x28
> [   17.889795]     LR =3D pseries_lpar_idle+0x98/0x190
> [   17.889899] [c000000007ac7d90] [c000000007a5da00] 0xc000000007a5da00 (=
unreliable)
> [   17.889979] [c000000007ac7e00] [c00000000001da40] arch_cpu_idle+0x50/0=
x180
> [   17.890044] [c000000007ac7e30] [c000000000eacd84] default_idle_call+0x=
84/0x208
> [   17.890123] [c000000007ac7e70] [c0000000001afd6c] cpuidle_idle_call+0x=
20c/0x2d0
> [   17.890201] [c000000007ac7ec0] [c0000000001aff20] do_idle+0xf0/0x1d0
> [   17.890258] [c000000007ac7f10] [c0000000001b0248] cpu_startup_entry+0x=
38/0x40
> [   17.890337] [c000000007ac7f40] [c00000000005f038] start_secondary+0x24=
8/0x250
> [   17.890402] [c000000007ac7f90] [c00000000000c454] start_secondary_prol=
og+0x10/0x14
> [   17.890492] Sending NMI from CPU 4 to CPUs 6:
> [   17.890573] NMI backtrace for cpu 6
> [   17.890574] CPU 6 didn't respond to backtrace IPI, inspecting paca.
> [   17.890576] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 0 (swappe=
r/6)
> [   17.890666] CPU: 6 PID: 0 Comm: swapper/6 Not tainted 5.9.0-1.g11733e1=
-default #1 openSUSE Tumbleweed (unreleased)
> [   17.890719] Back trace of paca->saved_r1 (0x0000000000000000) (possibl=
y stale):
> [   17.890720] Call Trace:
> [   17.890791] NIP:  c0000000000fb260 LR: c0000000000fdf58 CTR: c00000000=
012e014
> [   17.890885] Sending NMI from CPU 4 to CPUs 7:
> [   17.890955] REGS: c000000007ae7b00 TRAP: 0500   Not tainted  (5.9.0-1.=
g11733e1-default)
> [   17.890956] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 4800002=
4  XER: 00000000
> [   17.891234] CFAR: c0000000000276bc IRQMASK: 0=20
> [   17.891234] GPR00: 0000000028000024 c000000007ae7d90 c000000001cd4a00 =
0000000000000000=20
> [   17.891234] GPR04: c000000007ae7e00 0000000000000000 c000000001d03a00 =
000000000018ed08=20
> [   17.891234] GPR08: 000000007e360000 c00000003fff7400 0000000000000001 =
0000000000000006=20
> [   17.891234] GPR12: c0000000000fdec0 c00000003fff7800 0000000000000000 =
0000000000000000=20
> [   17.891234] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
> [   17.891234] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
> [   17.891234] GPR24: 0000000000000006 0000000000000000 0000000000000000 =
c000000001d17640=20
> [   17.891234] GPR28: 0000000000000001 c000000007a40000 c0000000016a7190 =
c0000000016a7188=20
> [   17.891807] NIP [c0000000000fb260] plpar_hcall_norets+0x1c/0x28
> [   17.891863] LR [c0000000000fdf58] pseries_lpar_idle+0x98/0x190
> [   17.891930] Call Trace:
> [   17.891954] [c000000007ae7d90] [c000000007a40000] 0xc000000007a40000 (=
unreliable)
> [   17.892034] [c000000007ae7e00] [c00000000001da40] arch_cpu_idle+0x50/0=
x180
> [   17.892091] [c000000007ae7e30] [c000000000eacd84] default_idle_call+0x=
84/0x208
> [   17.892172] [c000000007ae7e70] [c0000000001afd6c] cpuidle_idle_call+0x=
20c/0x2d0
> [   17.892240] [c000000007ae7ec0] [c0000000001aff20] do_idle+0xf0/0x1d0
> [   17.892307] [c000000007ae7f10] [c0000000001b0248] cpu_startup_entry+0x=
38/0x40
> [   17.892374] [c000000007ae7f40] [c00000000005f038] start_secondary+0x24=
8/0x250
> [   17.892452] [c000000007ae7f90] [c00000000000c454] start_secondary_prol=
og+0x10/0x14
> [   17.892529] Instruction dump:
> [   17.892566] 7c0803a6 3884fff8 78630100 78840020 4bfffeb0 3c4c01be 3842=
97bc 7c421378=20
> [   17.892647] 7c000026 90010008 60000000 44000022 <80010008> 7c0ff120 4e=
800020 7c0802a6=20
> [   24.118936] CPU 7 didn't respond to backtrace IPI, inspecting paca.
> [   24.120313] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 0 (swappe=
r/7)
> [   24.120568] Back trace of paca->saved_r1 (0xc000000007aa3760) (possibl=
y stale):
> [   24.120834] Call Trace:
> [   24.120927] [c000000007aa3800] [c0000000001e9574] __pv_queued_spin_loc=
k_slowpath+0x2f4/0x420
> [   24.121220] [c000000007aa3850] [c000000000ead414] _raw_spin_lock_irqsa=
ve+0xa4/0xc0
> [   24.121473] [c000000007aa3880] [c000000000220cc8] rcu_report_qs_rdp.co=
nstprop.0+0x38/0x170
> [   24.121724] [c000000007aa38c0] [c000000000221334] rcu_core+0xa4/0x2a0
> [   24.121933] [c000000007aa3910] [c000000000eadb40] __do_softirq+0x160/0=
x3f8
> [   24.122144] [c000000007aa3a00] [c000000000162cf8] irq_exit+0xd8/0x140
> [   24.122354] [c000000007aa3a30] [c0000000000272d8] timer_interrupt+0x12=
8/0x2d0
> [   24.122606] [c000000007aa3a90] [c000000000009aa0] decrementer_common_v=
irt+0x190/0x1a0
> [   24.122858] --- interrupt: 900 at plpar_hcall_norets+0x1c/0x28
> [   24.122858]     LR =3D pseries_lpar_idle+0x98/0x190
> [   24.123191] [c000000007aa3d90] [c000000007a71600] 0xc000000007a71600 (=
unreliable)
> [   24.123443] [c000000007aa3e00] [c00000000001da40] arch_cpu_idle+0x50/0=
x180
> [   24.123654] [c000000007aa3e30] [c000000000eacd84] default_idle_call+0x=
84/0x208
> [   24.123908] [c000000007aa3e70] [c0000000001afd6c] cpuidle_idle_call+0x=
20c/0x2d0
> [   24.124159] [c000000007aa3ec0] [c0000000001aff20] do_idle+0xf0/0x1d0
> [   24.124367] [c000000007aa3f10] [c0000000001b0248] cpu_startup_entry+0x=
38/0x40
> [   24.124619] [c000000007aa3f40] [c00000000005f038] start_secondary+0x24=
8/0x250
> [   24.124869] [c000000007aa3f90] [c00000000000c454] start_secondary_prol=
og+0x10/0x14
>=20
>=20
> qemu and overall the problem is the same - the boot stops early.
>=20
