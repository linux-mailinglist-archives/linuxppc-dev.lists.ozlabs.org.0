Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C63DD5F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 10:06:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sy1609HKzDqPB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 18:06:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sathnaga@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sxzN2SJLzDqLc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 18:05:19 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3T7xtTZ137379
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 04:05:17 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s5vpx9nep-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 04:05:16 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sathnaga@linux.vnet.ibm.com>;
 Mon, 29 Apr 2019 09:05:14 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 29 Apr 2019 09:05:12 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3T85BDf48234686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Apr 2019 08:05:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0359DA405B;
 Mon, 29 Apr 2019 08:05:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7731A4062;
 Mon, 29 Apr 2019 08:05:08 +0000 (GMT)
Received: from sathnaga86.in.ibm.com (unknown [9.193.110.53])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 29 Apr 2019 08:05:08 +0000 (GMT)
Date: Mon, 29 Apr 2019 13:35:06 +0530
From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v5 00/16] KVM: PPC: Book3S HV: add XIVE native
 exploitation mode
References: <20190410170448.3923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190410170448.3923-1-clg@kaod.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-TM-AS-GCONF: 00
x-cbid: 19042908-0008-0000-0000-000002E15E84
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042908-0009-0000-0000-0000224DC15E
Message-Id: <20190429080506.GA9070@sathnaga86.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904290060
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
Reply-To: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 10, 2019 at 07:04:32PM +0200, C=E9dric Le Goater wrote:
> Hello,
>=20
> GitHub trees available here :
>=20
> QEMU sPAPR:
>=20
>   https://github.com/legoater/qemu/commits/xive-next
>  =20
> Linux/KVM:
>=20
>   https://github.com/legoater/linux/commits/xive-5.1

Hi,

Xive(both ic-mode=3Ddual and ic-mode=3Dxive) guest fails to boot with guest=
 memory > 64G, till 64G it boots fine.

Note: xics(ic-mode=3Dxics) guest with the same configuration boots fine

Tested with below current latest code(v6).

HW: Power9 DD 2.2

Qemu:
# git log -1
commit 34cc68411a5ada92df6ef968c32bad424911474c (HEAD -> xive-next, origin/=
xive-next)
Author: C=E9dric Le Goater <clg@kaod.org>
Date:   Thu Apr 18 18:31:37 2019 +0200

    spapr/irq: add KVM support to the 'dual' machine
   =20
Kernel Guest/Host: (Host kernel built with `ppc64le_defconfig`, Guest kerne=
l built with `ppc64le_guest_defconfig`)
# git log -1
commit fac6994841aa8cfa5af02552f2eb9858fee9a25d (HEAD -> xive-5.1, origin/x=
ive-5.1, origin/HEAD)
Author: C=E9dric Le Goater <clg@kaod.org>
Date:   Thu Apr 18 08:46:33 2019 +0200

    KVM: PPC: Book3S HV: XIVE: replace the 'destroy' method by a 'release' =
method
   =20

Qemu Commandline:
LC_ALL=3DC PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/=
bin QEMU_AUDIO_DRV=3Dnone /home/sath/qemu/ppc64-softmmu/qemu-system-ppc64 -=
name guest=3Dvm2,debug-threads=3Don -S -object secret,id=3DmasterKey0,forma=
t=3Draw,file=3D/var/lib/libvirt/qemu/domain-13-vm2/master-key.aes -machine =
pseries-4.0,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff -m 66560 -realtime =
mlock=3Doff -smp 56,sockets=3D1,cores=3D28,threads=3D2 -uuid 5510791f-f156-=
4f5a-8c3d-30cfa7a4c7a2 -display none -no-user-config -nodefaults -chardev s=
ocket,id=3Dcharmonitor,path=3D/var/lib/libvirt/qemu/domain-13-vm2/monitor.s=
ock,server,nowait -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -r=
tc base=3Dutc -no-shutdown -boot strict=3Don -kernel /home/sath/linux/vmlin=
ux -append 'root=3D/dev/sda2 rw console=3Dtty0 console=3DttyS0,115200 init=
=3D/sbin/init initcall_debug selinux=3D0 secure=3Don' -device qemu-xhci,id=
=3Dusb,bus=3Dpci.0,addr=3D0x3 -device virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.=
0,addr=3D0x2 -drive file=3D/home/sath/tests/data/avocado-vt/images/jeos-27-=
ppc64le_vm2.qcow2,format=3Dqcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0 -device s=
csi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=3Ddrive-scsi0-0-=
0-0,id=3Dscsi0-0-0-0,bootindex=3D1 -netdev tap,fd=3D25,id=3Dhostnet0,vhost=
=3Don,vhostfd=3D27 -device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=
=3D52:54:00:57:58:59,bus=3Dpci.0,addr=3D0x1 -chardev pty,id=3Dcharserial0 -=
device spapr-vty,chardev=3Dcharserial0,id=3Dserial0,reg=3D0x30000000 -devic=
e virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x4 -M pseries,ic-mod=
e=3Ddual -msg timestamp=3Don


Guest Console:

Escape character is ^]
Populating /vdevice methods
Populating /vdevice/vty@30000000
Populating /vdevice/nvram@71000000
Populating /pci@800000020000000
                     00 0800 (D) : 1af4 1000    virtio [ net ]
                     00 1000 (D) : 1af4 1004    virtio [ scsi ]
Populating /pci@800000020000000/scsi@2
       SCSI: Looking for devices
          100000000000000 DISK     : "QEMU     QEMU HARDDISK    2.5+"
                     00 1800 (D) : 1b36 000d    serial bus [ usb-xhci ]
                     00 2000 (D) : 1af4 1002    unknown-legacy-device*
No NVRAM common partition, re-initializing...
Scanning USB=20
  XHCI: Initializing
Using default console: /vdevice/vty@30000000
Detected RAM kernel at 400000 (17fe068 bytes)=20
    =20
  Welcome to Open Firmware

  Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
  This program and the accompanying materials are made available
  under the terms of the BSD License available at
  http://www.opensource.org/licenses/bsd-license.php

Booting from memory...
OF stdout device is: /vdevice/vty@30000000
Preparing to boot Linux version 5.1.0-rc5-176614-gfac6994841aa (root@kvmups=
tream) (gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04)) #2 SMP Wed Apr 24 =
07:58:04 EDT 2019
Detected machine type: 0000000000000101
command line: root=3D/dev/sda2 rw console=3Dtty0 console=3DttyS0,115200 ini=
t=3D/sbin/init initcall_debug selinux=3D0 secure=3Don
Max number of cores passed to firmware: 1024 (NR_CPUS =3D 2048)
Calling ibm,client-architecture-support...

SLOF **********************************************************************
QEMU Starting
 Build Date =3D Jan 14 2019 18:00:39
 FW Version =3D git-a5b428e1c1eae703
 Press "s" to enter Open Firmware.

Populating /vdevice methods
Populating /vdevice/vty@30000000
Populating /vdevice/nvram@71000000
Populating /pci@800000020000000
                     00 0800 (D) : 1af4 1000    virtio [ net ]
                     00 1000 (D) : 1af4 1004    virtio [ scsi ]
Populating /pci@800000020000000/scsi@2
       SCSI: Looking for devices
          100000000000000 DISK     : "QEMU     QEMU HARDDISK    2.5+"
                     00 1800 (D) : 1b36 000d    serial bus [ usb-xhci ]
                     00 2000 (D) : 1af4 1002    unknown-legacy-device*
Scanning USB=20
  XHCI: Initializing
Using default console: /vdevice/vty@30000000
Detected RAM kernel at 400000 (17fe068 bytes)=20
    =20
  Welcome to Open Firmware

  Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
  This program and the accompanying materials are made available
  under the terms of the BSD License available at
  http://www.opensource.org/licenses/bsd-license.php

Booting from memory...
OF stdout device is: /vdevice/vty@30000000
Preparing to boot Linux version 5.1.0-rc5-176614-gfac6994841aa (root@kvmups=
tream) (gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04)) #2 SMP Wed Apr 24 =
07:58:04 EDT 2019
Detected machine type: 0000000000000101
command line: root=3D/dev/sda2 rw console=3Dtty0 console=3DttyS0,115200 ini=
t=3D/sbin/init initcall_debug selinux=3D0 secure=3Don
Max number of cores passed to firmware: 1024 (NR_CPUS =3D 2048)
Calling ibm,client-architecture-support... done
memory layout at init:
  memory_limit : 0000000000000000 (16 MB aligned)
  alloc_bottom : 0000000001c10000
  alloc_top    : 0000000010000000
  alloc_top_hi : 0000001040000000
  rmo_top      : 0000000010000000
  ram_top      : 0000001040000000
instantiating rtas at 0x000000000daf0000... done
prom_hold_cpus: skipped
copying OF device tree...
Building dt strings...
Building dt structure...
Device tree strings 0x0000000001c20000 -> 0x0000000001c20af8
Device tree struct  0x0000000001c30000 -> 0x0000000001c40000
Quiescing Open Firmware ...
Booting Linux via __start() @ 0x0000000000400000 ...
[    0.000000] radix-mmu: Page sizes from device-tree:
[    0.000000] radix-mmu: Page size shift =3D 12 AP=3D0x0
[    0.000000] radix-mmu: Page size shift =3D 16 AP=3D0x5
[    0.000000] radix-mmu: Page size shift =3D 21 AP=3D0x1
[    0.000000] radix-mmu: Page size shift =3D 30 AP=3D0x2
[    0.000000] lpar: Using radix MMU under hypervisor
[    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000040000000 with=
 1.00 GiB pages (exec)
[    0.000000] radix-mmu: Mapped 0x0000000040000000-0x0000001040000000 with=
 1.00 GiB pages
[    0.000000] radix-mmu: Process table (____ptrval____) and radix root for=
 kernel: (____ptrval____)
[    0.000000] Linux version 5.1.0-rc5-176614-gfac6994841aa (root@kvmupstre=
am) (gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04)) #2 SMP Wed Apr 24 07:=
58:04 EDT 2019
[    0.000000] Using pSeries machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] Partition configured for 56 cpus.
[    0.000000] CPU maps initialized for 2 threads per core
[    0.000000] -----------------------------------------------------
[    0.000000] ppc64_pft_size    =3D 0x0
[    0.000000] phys_mem_size     =3D 0x1040000000
[    0.000000] dcache_bsize      =3D 0x80
[    0.000000] icache_bsize      =3D 0x80
[    0.000000] cpu_features      =3D 0x0000c06f8f5f91a7
[    0.000000]   possible        =3D 0x0000fbffcf5fb1a7
[    0.000000]   always          =3D 0x00000003800081a1
[    0.000000] cpu_user_features =3D 0xdc0065c2 0xaee00000
[    0.000000] mmu_features      =3D 0x3c006041
[    0.000000] firmware_features =3D 0x00000005455a445f
[    0.000000] -----------------------------------------------------
[    0.000000] numa:   NODE_DATA [mem 0x103fe17000-0x103fe1bfff]
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] rfi-flush: ori type flush available
[    0.000000] rfi-flush: mttrig type flush available
[    0.000000] count-cache-flush: full software flush sequence enabled.
[    0.000000] stf-barrier: eieio barrier available
[    0.000000] PCI host bridge /pci@800000020000000  ranges:
[    0.000000]   IO 0x0000200000000000..0x000020000000ffff -> 0x00000000000=
00000
[    0.000000]  MEM 0x0000200080000000..0x00002000ffffffff -> 0x00000000800=
00000=20
[    0.000000]  MEM 0x0000210000000000..0x000021ffffffffff -> 0x00002100000=
00000=20
[    0.000000] PPC64 nvram contains 65536 bytes
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000103fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000103fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000103ffff=
fff]
[    0.000000] random: get_random_u64 called from start_kernel+0xbc/0x648 w=
ith crng_init=3D0
[    0.000000] percpu: Embedded 4 pages/cpu @(____ptrval____) s169368 r0 d9=
2776 u262144
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 10639=
20
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: root=3D/dev/sda2 rw console=3Dtty0 cons=
ole=3DttyS0,115200 init=3D/sbin/init initcall_debug selinux=3D0 secure=3Don
[    0.000000] printk: log_buf_len individual max cpu contribution: 8192 by=
tes
[    0.000000] printk: log_buf_len total cpu_extra contributions: 450560 by=
tes
[    0.000000] printk: log_buf_len min size: 262144 bytes
[    0.000000] printk: log_buf_len: 1048576 bytes
[    0.000000] printk: early log buf free: 257356(98%)
[    0.000000] Memory: 68034688K/68157440K available (12800K kernel code, 1=
728K rwdata, 3264K rodata, 4224K init, 2488K bss, 122752K reserved, 0K cma-=
reserved)
[    0.000000] SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CPUs=3D56,=
 Nodes=3D1
[    0.000000] ftrace: allocating 32078 entries in 12 pages
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D2048 to nr_cpu_ids=
=3D56.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 1=
0 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D56
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] xive: Using IRQ range [0-df]
[    0.000000] xive: Interrupt handling initialized with spapr backend
[    0.000000] xive: Using priority 6 for all interrupts
[    0.000000] xive: Using 64kB queues
[    0.000002] time_init: 56 bit decrementer (max: 7fffffffffffff)
[    0.000536] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: =
0x761537d007, max_idle_ns: 440795202126 ns
[    0.001486] clocksource: timebase mult[1f40000] shift[24] registered
[    0.002374] Console: colour dummy device 80x25
[    0.000000] radix-mmu: Page sizes from device-tree:
[    0.000000] radix-mmu: Page size shift =3D 12 AP=3D0x0
[    0.000000] radix-mmu: Page size shift =3D 16 AP=3D0x5
[    0.000000] radix-mmu: Page size shift =3D 21 AP=3D0x1
[    0.000000] radix-mmu: Page size shift =3D 30 AP=3D0x2
[    0.000000] lpar: Using radix MMU under hypervisor
[    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000040000000 with=
 1.00 GiB pages (exec)
[    0.000000] radix-mmu: Mapped 0x0000000040000000-0x0000001040000000 with=
 1.00 GiB pages
[    0.000000] radix-mmu: Process table (____ptrval____) and radix root for=
 kernel: (____ptrval____)
[    0.000000] Linux version 5.1.0-rc5-176614-gfac6994841aa (root@kvmupstre=
am) (gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04)) #2 SMP Wed Apr 24 07:=
58:04 EDT 2019
[    0.000000] Using pSeries machine description
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] Partition configured for 56 cpus.
[    0.000000] CPU maps initialized for 2 threads per core
[    0.000000] -----------------------------------------------------
[    0.000000] ppc64_pft_size    =3D 0x0
[    0.000000] phys_mem_size     =3D 0x1040000000
[    0.000000] dcache_bsize      =3D 0x80
[    0.000000] icache_bsize      =3D 0x80
[    0.000000] cpu_features      =3D 0x0000c06f8f5f91a7
[    0.000000]   possible        =3D 0x0000fbffcf5fb1a7
[    0.000000]   always          =3D 0x00000003800081a1
[    0.000000] cpu_user_features =3D 0xdc0065c2 0xaee00000
[    0.000000] mmu_features      =3D 0x3c006041
[    0.000000] firmware_features =3D 0x00000005455a445f
[    0.000000] -----------------------------------------------------
[    0.000000] numa:   NODE_DATA [mem 0x103fe17000-0x103fe1bfff]
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] rfi-flush: ori type flush available
[    0.000000] rfi-flush: mttrig type flush available
[    0.000000] count-cache-flush: full software flush sequence enabled.
[    0.000000] stf-barrier: eieio barrier available
[    0.000000] PCI host bridge /pci@800000020000000  ranges:
[    0.000000]   IO 0x0000200000000000..0x000020000000ffff -> 0x00000000000=
00000
[    0.000000]  MEM 0x0000200080000000..0x00002000ffffffff -> 0x00000000800=
00000=20
[    0.000000]  MEM 0x0000210000000000..0x000021ffffffffff -> 0x00002100000=
00000=20
[    0.000000] PPC64 nvram contains 65536 bytes
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000103fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000103fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000103ffff=
fff]
[    0.000000] random: get_random_u64 called from start_kernel+0xbc/0x648 w=
ith crng_init=3D0
[    0.000000] percpu: Embedded 4 pages/cpu @(____ptrval____) s169368 r0 d9=
2776 u262144
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 10639=
20
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: root=3D/dev/sda2 rw console=3Dtty0 cons=
ole=3DttyS0,115200 init=3D/sbin/init initcall_debug selinux=3D0 secure=3Don
[    0.000000] printk: log_buf_len individual max cpu contribution: 8192 by=
tes
[    0.000000] printk: log_buf_len total cpu_extra contributions: 450560 by=
tes
[    0.000000] printk: log_buf_len min size: 262144 bytes
[    0.000000] printk: log_buf_len: 1048576 bytes
[    0.000000] printk: early log buf free: 257356(98%)
[    0.000000] Memory: 68034688K/68157440K available (12800K kernel code, 1=
728K rwdata, 3264K rodata, 4224K init, 2488K bss, 122752K reserved, 0K cma-=
reserved)
[    0.000000] SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CPUs=3D56,=
 Nodes=3D1
[    0.000000] ftrace: allocating 32078 entries in 12 pages
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D2048 to nr_cpu_ids=
=3D56.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 1=
0 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D56
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] xive: Using IRQ range [0-df]
[    0.000000] xive: Interrupt handling initialized with spapr backend
[    0.000000] xive: Using priority 6 for all interrupts
[    0.000000] xive: Using 64kB queues
[    0.000002] time_init: 56 bit decrementer (max: 7fffffffffffff)
[    0.000536] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: =
0x761537d007, max_idle_ns: 440795202126 ns
[    0.001486] clocksource: timebase mult[1f40000] shift[24] registered
[    0.002374] Console: colour dummy device 80x25
[    0.041204] printk: console [tty0] enabled
[    0.041652] pid_max: default: 57344 minimum: 448
[    0.047640] Dentry cache hash table entries: 8388608 (order: 10, 6710886=
4 bytes)
[    0.051167] Inode-cache hash table entries: 4194304 (order: 9, 33554432 =
bytes)
[    0.052040] Mount-cache hash table entries: 131072 (order: 4, 1048576 by=
tes)
[    0.052748] Mountpoint-cache hash table entries: 131072 (order: 4, 10485=
76 bytes)
[    0.053855] *** VALIDATE proc ***
[    0.054280] *** VALIDATE cgroup1 ***
[    0.054612] *** VALIDATE cgroup2 ***
[    0.055735] EEH: pSeries platform initialized
[    0.056187] POWER9 performance monitor hardware support registered
[    0.056912] rcu: Hierarchical SRCU implementation.
[    0.058350] smp: Bringing up secondary CPUs ...
[    0.594474] smp: Brought up 1 node, 56 CPUs
[    0.595265] numa: Node 0 CPUs: 0-55
[    0.595639] Using standard scheduler topology
[    0.624525] devtmpfs: initialized
[    0.644891] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 19112604462750000 ns
[    0.646019] futex hash table entries: 16384 (order: 5, 2097152 bytes)
[    0.647574] NET: Registered protocol family 16
[    0.665143] kworker/u112:0 (294) used greatest stack depth: 12608 bytes =
left
[    0.694670] cpuidle: using governor menu
Linux ppc64le
#2 SMP Wed Apr 2[    4.103966] kworker/u112:1 (324) used greatest stack dep=
th: 12464 bytes left
[  197.780442] PCI: Probing PCI hardware
[  197.781468] PCI host bridge to bus 0000:00
[  197.782323] pci_bus 0000:00: root bus resource [io  0x10000-0x1ffff] (bu=
s address [0x0000-0xffff])
[  197.784122] pci_bus 0000:00: root bus resource [mem 0x200080000000-0x200=
0ffffffff] (bus address [0x80000000-0xffffffff])
[  197.786303] pci_bus 0000:00: root bus resource [mem 0x210000000000-0x21f=
fffffffff]
[  197.787822] pci_bus 0000:00: root bus resource [bus 00-ff]
[  197.789299] pci 0000:00:01.0: calling  pci_dev_pdn_setup+0x0/0x50 @ 1
[  197.790809] pci 0000:00:01.0: pci_dev_pdn_setup+0x0/0x50 took 0 usecs
[  197.792106] pci 0000:00:01.0: calling  pnv_npu2_opencapi_cfg_size_fixup+=
0x0/0x50 @ 1
[  197.793659] pci 0000:00:01.0: pnv_npu2_opencapi_cfg_size_fixup+0x0/0x50 =
took 0 usecs
[  197.795269] pci 0000:00:01.0: calling  pcibios_fixup_resources+0x0/0x1b0=
 @ 1
[  197.796674] pci 0000:00:01.0: pcibios_fixup_resources+0x0/0x1b0 took 0 u=
secs
[  197.798102] pci 0000:00:01.0: calling  pnv_ocxl_fixup_actag+0x0/0x2a0 @ 1
[  197.799461] pci 0000:00:01.0: pnv_ocxl_fixup_actag+0x0/0x2a0 took 0 usecs
[  197.801612] pci 0000:00:02.0: calling  pci_dev_pdn_setup+0x0/0x50 @ 1
[  197.802395] pci 0000:00:02.0: pci_dev_pdn_setup+0x0/0x50 took 0 usecs
[  197.803195] pci 0000:00:02.0: calling  pnv_npu2_opencapi_cfg_size_fixup+=
0x0/0x50 @ 1
[  197.804167] pci 0000:00:02.0: pnv_npu2_opencapi_cfg_size_fixup+0x0/0x50 =
took 0 usecs
[  197.805140] pci 0000:00:02.0: calling  pcibios_fixup_resources+0x0/0x1b0=
 @ 1
[  197.806018] pci 0000:00:02.0: pcibios_fixup_resources+0x0/0x1b0 took 0 u=
secs
[  197.806902] pci 0000:00:02.0: calling  pnv_ocxl_fixup_actag+0x0/0x2a0 @ 1
[  197.807746] pci 0000:00:02.0: pnv_ocxl_fixup_actag+0x0/0x2a0 took 0 usecs
[  197.809277] pci 0000:00:03.0: calling  pci_dev_pdn_setup+0x0/0x50 @ 1
[  197.810068] pci 0000:00:03.0: pci_dev_pdn_setup+0x0/0x50 took 0 usecs
[  197.810956] pci 0000:00:03.0: calling  pnv_npu2_opencapi_cfg_size_fixup+=
0x0/0x50 @ 1
[  197.811944] pci 0000:00:03.0: pnv_npu2_opencapi_cfg_size_fixup+0x0/0x50 =
took 0 usecs
[  197.812930] pci 0000:00:03.0: calling  pcibios_fixup_resources+0x0/0x1b0=
 @ 1
[  197.813827] pci 0000:00:03.0: pcibios_fixup_resources+0x0/0x1b0 took 0 u=
secs
[  197.814739] pci 0000:00:03.0: calling  pnv_ocxl_fixup_actag+0x0/0x2a0 @ 1
[  197.815599] pci 0000:00:03.0: pnv_ocxl_fixup_actag+0x0/0x2a0 took 0 usecs
[  197.816935] pci 0000:00:04.0: calling  pci_dev_pdn_setup+0x0/0x50 @ 1
[  197.817725] pci 0000:00:04.0: pci_dev_pdn_setup+0x0/0x50 took 0 usecs
[  197.818487] pci 0000:00:04.0: calling  pnv_npu2_opencapi_cfg_size_fixup+=
0x0/0x50 @ 1
[  197.819407] pci 0000:00:04.0: pnv_npu2_opencapi_cfg_size_fixup+0x0/0x50 =
took 0 usecs
[  197.820414] pci 0000:00:04.0: calling  pcibios_fixup_resources+0x0/0x1b0=
 @ 1
[  197.821322] pci 0000:00:04.0: pcibios_fixup_resources+0x0/0x1b0 took 0 u=
secs
[  197.822219] pci 0000:00:04.0: calling  pnv_ocxl_fixup_actag+0x0/0x2a0 @ 1
[  197.823088] pci 0000:00:04.0: pnv_ocxl_fixup_actag+0x0/0x2a0 took 0 usecs
[  197.826289] IOMMU table initialized, virtual merging enabled
[  197.827014] pci 0000:00:01.0: Adding to iommu group 0
[  197.827749] pci 0000:00:02.0: Adding to iommu group 0
[  197.828451] pci 0000:00:03.0: Adding to iommu group 0
[  197.829158] pci 0000:00:04.0: Adding to iommu group 0
[  197.831587] EEH: No capable adapters found
[  200.724067] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[  200.724986] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[  202.781050] vgaarb: loaded
[  202.782052] SCSI subsystem initialized
[  204.738109] usbcore: registered new interface driver usbfs
[  204.738794] usbcore: registered new interface driver hub
[  204.739502] usbcore: registered new device driver usb
[  204.740234] pps_core: LinuxPPS API ver. 1 registered
[  204.741014] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[  204.742571] PTP clock support registered
[  208.752064] EDAC MC: Ver: 3.0.0

---gets stuck here





>=20
> Thanks,
>=20
> C.
>=20
> Caveats :
>=20
>  - We should introduce a set of definitions common to XIVE and XICS
>  - The XICS-over-XIVE device file book3s_xive.c could be renamed to
>    book3s_xics_on_xive.c or book3s_xics_p9.c
>  - The XICS-over-XIVE device still has locking issues in the setup.
>  - xc->valid is not useful
>  - xc->xive is not very useful either
>=20
> Changes since v4:
>=20
>  - add check on EQ page alignment
>  - add requirement on KVM_XIVE_EQ_ALWAYS_NOTIFY
>  - add documentation in Documentation/virtual/kvm/api.txt
>  - remove 'destroy' method
>  - introduce a 'release' device operation called when device fd is
>    closed.
>  - introduce a 'xive_devices' array under the VM to store kvmppc_xive
>    objects until VM is destroyed.
>=20
> Changes since v3:
>=20
>  - removed a couple of useless includes
>  - fix the test ont the initial setting of the EQ toggle bit : 0 -> 1
>  - renamed qsize to qshift
>  - renamed qpage to qaddr
>  - checked host page size
>  - limited flags to KVM_XIVE_EQ_ALWAYS_NOTIFY to fit sPAPR specs
>  - Fixed xive_timaval description in documentation
>=20
> Changes since v2:
>=20
>  - removed extra OPAL call definitions
>  - removed ->q_order setting. Only useful in the XICS-on-XIVE KVM
>    device which allocates the EQs on behalf of the guest.
>  - returned -ENXIO when VP base is invalid
>  - made use of the xive_vp() macro to compute VP identifiers
>  - reworked locking in kvmppc_xive_native_connect_vcpu() to fix races=20
>  - stop advertising KVM_CAP_PPC_IRQ_XIVE as support is not fully
>    available yet
>  - fixed comment on XIVE IRQ number space
>  - removed usage of the __x_* macros
>  - fixed locking on source block
>  - fixed comments on the KVM device attribute definitions
>  - handled MASKED EAS configuration
>  - fixed check on supported EQ size to restrict to 64K pages
>  - checked kvm_eq.flags that need to be zero
>  - removed the OPAL call when EQ qtoggle bit and index are zero.=20
>  - reduced the size of kvmppc_one_reg timaval attribute to two u64s
>  - stopped returning of the OS CAM line value
>=20
> Changes since v1:
>=20
>  - Better documentation (was missing)
>  - Nested support. XIVE not advertised on non PowerNV platforms. This
>    is a good way to test the fallback on QEMU emulated devices.
>  - ESB and TIMA special mapping done using the KVM device fd
>  - All hcalls moved to QEMU. Dropped the patch moving the hcall flags.
>  - Reworked of the KVM device ioctl controls to support hcalls and
>    migration needs to capture/save states
>  - Merged the control syncing XIVE and marking the EQ page dirty
>  - Fixed passthrough support using the KVM device file address_space
>    to clear the ESB pages from the mapping
>  - Misc enhancements and fixes=20
>=20
> C=E9dric Le Goater (16):
>   powerpc/xive: add OPAL extensions for the XIVE native exploitation
>     support
>   KVM: PPC: Book3S HV: add a new KVM device for the XIVE native
>     exploitation mode
>   KVM: PPC: Book3S HV: XIVE: introduce a new capability
>     KVM_CAP_PPC_IRQ_XIVE
>   KVM: PPC: Book3S HV: XIVE: add a control to initialize a source
>   KVM: PPC: Book3S HV: XIVE: add a control to configure a source
>   KVM: PPC: Book3S HV: XIVE: add controls for the EQ configuration
>   KVM: PPC: Book3S HV: XIVE: add a global reset control
>   KVM: PPC: Book3S HV: XIVE: add a control to sync the sources
>   KVM: PPC: Book3S HV: XIVE: add a control to dirty the XIVE EQ pages
>   KVM: PPC: Book3S HV: XIVE: add get/set accessors for the VP XIVE state
>   KVM: introduce a 'mmap' method for KVM devices
>   KVM: PPC: Book3S HV: XIVE: add a TIMA mapping
>   KVM: PPC: Book3S HV: XIVE: add a mapping for the source ESB pages
>   KVM: PPC: Book3S HV: XIVE: add passthrough support
>   KVM: PPC: Book3S HV: XIVE: activate XIVE exploitation mode
>   KVM: PPC: Book3S HV: XIVE: introduce a 'release' device operation
>=20
>  arch/powerpc/include/asm/kvm_host.h        |    3 +
>  arch/powerpc/include/asm/kvm_ppc.h         |   32 +
>  arch/powerpc/include/asm/opal-api.h        |    7 +-
>  arch/powerpc/include/asm/opal.h            |    7 +
>  arch/powerpc/include/asm/xive.h            |   17 +
>  arch/powerpc/include/uapi/asm/kvm.h        |   46 +
>  arch/powerpc/kvm/book3s_xive.h             |   37 +
>  include/linux/kvm_host.h                   |    2 +
>  include/uapi/linux/kvm.h                   |    3 +
>  arch/powerpc/kvm/book3s.c                  |   31 +-
>  arch/powerpc/kvm/book3s_xive.c             |  230 +++-
>  arch/powerpc/kvm/book3s_xive_native.c      | 1243 ++++++++++++++++++++
>  arch/powerpc/kvm/powerpc.c                 |   37 +
>  arch/powerpc/platforms/powernv/opal-call.c |    3 +
>  arch/powerpc/sysdev/xive/native.c          |  110 ++
>  virt/kvm/kvm_main.c                        |   24 +
>  Documentation/virtual/kvm/api.txt          |   10 +
>  Documentation/virtual/kvm/devices/xive.txt |  197 ++++
>  arch/powerpc/kvm/Makefile                  |    2 +-
>  19 files changed, 1980 insertions(+), 61 deletions(-)
>  create mode 100644 arch/powerpc/kvm/book3s_xive_native.c
>  create mode 100644 Documentation/virtual/kvm/devices/xive.txt
>=20
> --=20
> 2.20.1
>=20

