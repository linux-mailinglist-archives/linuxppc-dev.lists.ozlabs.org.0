Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D125F242
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 07:21:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fRCF3tHpzDqZQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 15:20:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alliedtelesis.co.nz
 (client-ip=202.36.163.20; helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.b="pzkKAWqL"; dkim-atps=neutral
X-Greylist: delayed 451 seconds by postgrey-1.36 at bilbo;
 Thu, 04 Jul 2019 15:19:04 AEST
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fR946FhWzDqYp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 15:19:04 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 208D58365A
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 17:11:21 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1562217081;
 bh=oX0eAcrqeZrG8KqRA+cBoQVG26eBnE9jFgB+Wb5u8bY=;
 h=From:To:Subject:Date;
 b=pzkKAWqLcmlYRX3r9hIRU6ERW8V/5SLXfKZIJ6TE59bsymyKppoJXs9KSO0EVj8Gw
 gF+5shC2W3TpQx10Bh+S6ZkXYuQjvFl4vjxZ582CM0chSjA47AX2QEGUtEKHa35v24
 WeCYh4DPpejoM4H0TFXCFlUpJwgO39XliK+XOa+44O+lrrhPcXMRVPW/NnEHBnT8Rc
 Kco7gX+BKHjULGcZfMX4drarUTm7IWg7olGm16vwy7dIPezu2rHKCyIy0O4b2JSBGu
 Pb5emuykHSIE+SE2ZrwjekzD+zUlHpNyOCxpSbJK2SwZz7ipBERQK2532BEuEbjqZ3
 U3TJeHIspdYng==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d1d8a770000>; Thu, 04 Jul 2019 17:11:21 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Thu, 4 Jul 2019 17:11:18 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Thu, 4 Jul 2019 17:11:18 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: pci memory resources not being assigned to bridge
Thread-Topic: pci memory resources not being assigned to bridge
Thread-Index: AQHVMibp/H/XQspI0EmFnIB5TbUhDQ==
Date: Thu, 4 Jul 2019 05:11:18 +0000
Message-ID: <c4393deec4c14cb79ddf89daca5f78cc@svr-chch-ex1.atlnz.lc>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,=0A=
=0A=
I'm in the process of updating our products from a 4.4 based kernel to =0A=
5.1 (and probably 5.2 since that release is imminent).=0A=
=0A=
On one product which uses a Freescale/NXP P2041 CPU, IDT pcie bridge and =
=0A=
Marvell switch chip[1].=0A=
=0A=
Annoyingly the hardware has a reset line that holds the switch chip in =0A=
reset but the bridge chip has a separate reset line that is not held =0A=
high by default. So when the system starts up the initial scan sees the =0A=
bridge and assigns resource to its end points. Later once the switch =0A=
chip reset is released (either via a gpio-hog or manually) and the bus =0A=
rescanned the switch devices are detected but the host side of the pci =0A=
bridge isn't assigned any memory space so pci accesses trigger a master =0A=
abort which on that SoC leads to a machine check exception.=0A=
=0A=
[root@linuxbox ~]# uname -a=0A=
Linux linuxbox 5.2.0-rc7-at1+ #8 SMP Thu Jul 4 04:26:18 UTC 2019 ppc =0A=
GNU/Linu[root@linuxbox ~]# lspci -t=0A=
-+-[2000:00]---00.0-[01-06]----00.0-[02-06]--+-02.0-[03]--=0A=
  |                                           +-03.0-[04]--=0A=
  |                                           +-04.0-[05]--=0A=
  |                                           \-05.0-[06]--=0A=
  \-[0000:00]-=0A=
[root@linuxbox ~]# lspci -v -s 2000:01:00=0A=
2000:01:00.0 Class 0604: Device 111d:803e (rev 0e)=0A=
         Flags: bus master, fast devsel, latency 0=0A=
         Bus: primary=3D01, secondary=3D02, subordinate=3D06, sec-latency=
=3D0=0A=
         I/O behind bridge: None=0A=
         Memory behind bridge: None=0A=
         Prefetchable memory behind bridge: None=0A=
         Capabilities: [40] Express Upstream Port, MSI 00=0A=
         Capabilities: [c0] Power Management version 3=0A=
         Capabilities: [100] Advanced Error Reporting=0A=
         Capabilities: [200] Virtual Channel=0A=
         Kernel driver in use: pcieport=0A=
=0A=
[root@linuxbox ~]# echo 472 >/sys/class/gpio/export=0A=
[root@linuxbox ~]# echo out >/sys/class/gpio/gpio472/direction=0A=
[root@linuxbox ~]# echo 0 >/sys/class/gpio/gpio472/value=0A=
[root@linuxbox ~]# echo 1 >/sys/bus/pci/rescan=0A=
pci 2000:03:00.0: [11ab:e097] type 00 class 0x058000=0A=
pci 2000:03:00.0: reg 0x10: [mem 0xd0000000-0xd00fffff 64bit pref]=0A=
pci 2000:03:00.0: reg 0x18: [mem 0x00000000-0x03ffffff 64bit]=0A=
pci 2000:03:00.0: Adding to iommu group 15=0A=
pci_bus 2000:03: busn_res: [bus 03] end is updated to 03=0A=
pci 2000:04:00.0: [11ab:e097] type 00 class 0x058000=0A=
pci 2000:04:00.0: reg 0x10: [mem 0xd0000000-0xd00fffff 64bit pref]=0A=
pci 2000:04:00.0: reg 0x18: [mem 0x00000000-0x03ffffff 64bit]=0A=
pci 2000:04:00.0: Adding to iommu group 15=0A=
pci_bus 2000:04: busn_res: [bus 04] end is updated to 04=0A=
pci 2000:05:00.0: [11ab:e097] type 00 class 0x058000=0A=
pci 2000:05:00.0: reg 0x10: [mem 0xd0000000-0xd00fffff 64bit pref]=0A=
pci 2000:05:00.0: reg 0x18: [mem 0x00000000-0x03ffffff 64bit]=0A=
pci 2000:05:00.0: Adding to iommu group 15=0A=
pci_bus 2000:05: busn_res: [bus 05] end is updated to 05=0A=
pci 2000:06:00.0: [11ab:e097] type 00 class 0x058000=0A=
pci 2000:06:00.0: reg 0x10: [mem 0xd0000000-0xd00fffff 64bit pref]=0A=
pci 2000:06:00.0: reg 0x18: [mem 0x00000000-0x03ffffff 64bit]=0A=
pci 2000:06:00.0: Adding to iommu group 15=0A=
pci_bus 2000:06: busn_res: [bus 06] end is updated to 06=0A=
pci_bus 2000:02: busn_res: [bus 02-06] end is updated to 06=0A=
pci_bus 2000:01: busn_res: [bus 01-06] end is updated to 06=0A=
pcieport 2000:00:00.0: BAR 9: no space for [mem size 0x00400000 64bit pref]=
=0A=
pcieport 2000:00:00.0: BAR 9: failed to assign [mem size 0x00400000 =0A=
64bit pref]=0A=
pcieport 2000:01:00.0: BAR 8: assigned [mem 0xc40000000-0xc4fffffff]=0A=
pcieport 2000:01:00.0: BAR 9: assigned [mem 0xc50000000-0xc503fffff =0A=
64bit pref]=0A=
pci 2000:02:02.0: BAR 8: assigned [mem 0xc40000000-0xc43ffffff]=0A=
pci 2000:02:03.0: BAR 8: assigned [mem 0xc44000000-0xc47ffffff]=0A=
pci 2000:02:04.0: BAR 8: assigned [mem 0xc48000000-0xc4bffffff]=0A=
pci 2000:02:05.0: BAR 8: assigned [mem 0xc4c000000-0xc4fffffff]=0A=
pci 2000:02:02.0: BAR 9: assigned [mem 0xc50000000-0xc500fffff 64bit pref]=
=0A=
pci 2000:02:03.0: BAR 9: assigned [mem 0xc50100000-0xc501fffff 64bit pref]=
=0A=
pci 2000:02:04.0: BAR 9: assigned [mem 0xc50200000-0xc502fffff 64bit pref]=
=0A=
pci 2000:02:05.0: BAR 9: assigned [mem 0xc50300000-0xc503fffff 64bit pref]=
=0A=
pci 2000:03:00.0: BAR 2: assigned [mem 0xc40000000-0xc43ffffff 64bit]=0A=
pci 2000:03:00.0: BAR 0: assigned [mem 0xc50000000-0xc500fffff 64bit pref]=
=0A=
pci 2000:02:02.0: PCI bridge to [bus 03]=0A=
pci 2000:02:02.0:   bridge window [mem 0xc40000000-0xc43ffffff]=0A=
pci 2000:02:02.0:   bridge window [mem 0xc50000000-0xc500fffff 64bit pref]=
=0A=
pci 2000:04:00.0: BAR 2: assigned [mem 0xc44000000-0xc47ffffff 64bit]=0A=
pci 2000:04:00.0: BAR 0: assigned [mem 0xc50100000-0xc501fffff 64bit pref]=
=0A=
pci 2000:02:03.0: PCI bridge to [bus 04]=0A=
pci 2000:02:03.0:   bridge window [mem 0xc44000000-0xc47ffffff]=0A=
pci 2000:02:03.0:   bridge window [mem 0xc50100000-0xc501fffff 64bit pref]=
=0A=
pci 2000:05:00.0: BAR 2: assigned [mem 0xc48000000-0xc4bffffff 64bit]=0A=
pci 2000:05:00.0: BAR 0: assigned [mem 0xc50200000-0xc502fffff 64bit pref]=
=0A=
pci 2000:02:04.0: PCI bridge to [bus 05]=0A=
pci 2000:02:04.0:   bridge window [mem 0xc48000000-0xc4bffffff]=0A=
pci 2000:02:04.0:   bridge window [mem 0xc50200000-0xc502fffff 64bit pref]=
=0A=
pci 2000:06:00.0: BAR 2: assigned [mem 0xc4c000000-0xc4fffffff 64bit]=0A=
pci 2000:06:00.0: BAR 0: assigned [mem 0xc50300000-0xc503fffff 64bit pref]=
=0A=
pci 2000:02:05.0: PCI bridge to [bus 06]=0A=
pci 2000:02:05.0:   bridge window [mem 0xc4c000000-0xc4fffffff]=0A=
pci 2000:02:05.0:   bridge window [mem 0xc50300000-0xc503fffff 64bit pref]=
=0A=
[root@linuxbox ~]# lspci -t=0A=
-+-[2000:00]---00.0-[01-06]----00.0-[02-06]--+-02.0-[03]----00.0=0A=
  |                                           +-03.0-[04]----00.0=0A=
  |                                           +-04.0-[05]----00.0=0A=
  |                                           \-05.0-[06]----00.0=0A=
  \-[0000:00]-=0A=
[root@linuxbox ~]# lspci -v -s 2000:01:00=0A=
2000:01:00.0 Class 0604: Device 111d:803e (rev 0e)=0A=
         Flags: bus master, fast devsel, latency 0=0A=
         Bus: primary=3D01, secondary=3D02, subordinate=3D06, sec-latency=
=3D0=0A=
         I/O behind bridge: None=0A=
         Memory behind bridge: None=0A=
         Prefetchable memory behind bridge: None=0A=
         Capabilities: [40] Express Upstream Port, MSI 00=0A=
         Capabilities: [c0] Power Management version 3=0A=
         Capabilities: [100] Advanced Error Reporting=0A=
         Capabilities: [200] Virtual Channel=0A=
         Kernel driver in use: pcieport=0A=
=0A=
[root@linuxbox ~]# modprobe pptest=0A=
pptest: loading out-of-tree module taints kernel.=0A=
pptest: module license 'unspecified' taints kernel.=0A=
Disabling lock debugging due to kernel taint=0A=
pptest 2000:03:00.0: enabling device (0000 -> 0002)=0A=
pptest 2000:03:00.0: resource0 [mem 0xc50000000-0xc500fffff 64bit pref] =0A=
mapped to c1980000=0A=
pptest 2000:03:00.0: resource2 [mem 0xc40000000-0xc43ffffff 64bit] =0A=
mapped to c1b00000=0A=
Oops: Machine check, sig: 7 [#1]=0A=
BE PAGE_SIZE=3D4K SMP NR_CPUS=3D8 CoreNet Generic=0A=
Modules linked in: pptest(PO+)=0A=
CPU: 0 PID: 417 Comm: modprobe Tainted: P   M       O      5.2.0-rc7-at1+ #=
8=0A=
NIP:  b96fd10c LR: b96fd100 CTR: 80419df0=0A=
REGS: af19bf08 TRAP: 0204   Tainted: P   M       O       (5.2.0-rc7-at1+)=
=0A=
MSR:  00029002 <CE,EE,ME>  CR: 28228422  XER: 20000000=0A=
DEAR: c1b0004c ESR: 00000000=0A=
GPR00: b96fd100 ad107c68 ada1dd00 00000055 ae7303c4 ae739ba8 2dd8e000 =0A=
00021002=0A=
GPR08: 00000007 c1b0004c 2dd8e000 000001f8 000001f8 10030838 0000001d =0A=
00000003=0A=
GPR16: ad107eb0 b96fd68e b96fd61c 0000fff1 ad107e00 00000398 b96bd000 =0A=
00000017=0A=
GPR24: b96fd488 00000002 b96fd308 b96fd308 b96fd280 adb2cd10 a9e55800 =0A=
a9e55878=0A=
NIP [b96fd10c] 0xb96fd10c=0A=
LR [b96fd100] 0xb96fd100=0A=
Call Trace:=0A=
[ad107c68] [b96fd100] 0xb96fd100 (unreliable)=0A=
[ad107c88] [803d0344] pci_device_probe+0xc4/0x150=0A=
[ad107ca8] [8043898c] really_probe+0x1ec/0x340=0A=
[ad107cd8] [8043909c] device_driver_attach+0x7c/0x90=0A=
[ad107cf8] [8043916c] __driver_attach+0xbc/0x120=0A=
[ad107d18] [804364b8] bus_for_each_dev+0x68/0xc0=0A=
[ad107d48] [80437ad8] bus_add_driver+0x178/0x250=0A=
[ad107d68] [80439888] driver_register+0x88/0x160=0A=
[ad107d78] [80002c00] do_one_initcall+0x40/0x210=0A=
[ad107dd8] [800c1218] do_init_module+0x60/0x1e8=0A=
[ad107df8] [800c0198] load_module+0x1c68/0x2230=0A=
[ad107ea8] [800c0940] sys_finit_module+0xa0/0xd0=0A=
[ad107f38] [800111d8] ret_from_syscall+0x0/0x38=0A=
--- interrupt: c00 at 0xff1ca78=0A=
     LR =3D 0x1000edf4=0A=
Instruction dump:=0A=
7f84e378 38a00000 480000f5 80fd0008 7fe3fb78 7f84e378 38a00002 38de01e0=0A=
480000dd 813d0008 3929004c 7c0004ac <7ca04c2c> 0c050000 4c00012c 3c80b970=
=0A=
---[ end trace baaeae7553646d27 ]---=0A=
=0A=
Machine check in kernel mode.=0A=
Caused by (from MCSR=3Da000): Load Error Report=0A=
Guarded Load Error Report=0A=
Bus error=0A=
=0A=
If I remove the bridge, release the switch reset then rescan the pci bus =
=0A=
the memory space is assigned and things appear to work.=0A=
=0A=
[root@linuxbox ~]# echo 1 =0A=
 >/sys/bus/pci/devices/2000:01:00.0/removepci_bus 2000:03: busn_res: =0A=
[bus 03] is released=0A=
pci 2000:02:02.0: Removing from iommu group 15=0A=
pci_bus 2000:04: busn_res: [bus 04] is released=0A=
pci 2000:02:03.0: Removing from iommu group 15=0A=
pci_bus 2000:05: busn_res: [bus 05] is released=0A=
pci 2000:02:04.0: Removing from iommu group 15=0A=
pci_bus 2000:06: busn_res: [bus 06] is released=0A=
pci 2000:02:05.0: Removing from iommu group 15=0A=
pci_bus 2000:02: busn_res: [bus 02-06] is released=0A=
pci 2000:01:00.0: Removing from iommu group 15=0A=
[root@linuxbox ~]# echo 472 >/sys/class/gpio/export=0A=
[root@linuxbox ~]# echo out >/sys/class/gpio/gpio472/direction=0A=
[root@linuxbox ~]# echo 0 >/sys/class/gpio/gpio472/value=0A=
[root@linuxbox ~]# echo 1 >/sys/bus/pci/rescan=0A=
=0A=
snip=0A=
=0A=
[root@linuxbox ~]# lspci -t=0A=
-+-[2000:00]---00.0-[01-06]----00.0-[02-06]--+-02.0-[03]----00.0=0A=
  |                                           +-03.0-[04]----00.0=0A=
  |                                           +-04.0-[05]----00.0=0A=
  |                                           \-05.0-[06]----00.0=0A=
  \-[0000:00]-=0A=
[root@linuxbox ~]# lspci -v -s 2000:01:00=0A=
2000:01:00.0 Class 0604: Device 111d:803e (rev 0e)=0A=
         Flags: bus master, fast devsel, latency 0=0A=
         Bus: primary=3D01, secondary=3D02, subordinate=3D06, sec-latency=
=3D0=0A=
         I/O behind bridge: None=0A=
         Memory behind bridge: e0000000-efffffff [size=3D256M]=0A=
         Prefetchable memory behind bridge: =0A=
00000000f0000000-00000000f03fffff [size=3D4M]=0A=
         Capabilities: [40] Express Upstream Port, MSI 00=0A=
         Capabilities: [c0] Power Management version 3=0A=
         Capabilities: [100] Advanced Error Reporting=0A=
         Capabilities: [200] Virtual Channel=0A=
         Kernel driver in use: pcieport=0A=
=0A=
[root@linuxbox ~]# modprobe pptest=0A=
pptest: loading out-of-tree module taints kernel.=0A=
pptest: module license 'unspecified' taints kernel.=0A=
Disabling lock debugging due to kernel taint=0A=
pptest 2000:03:00.0: enabling device (0000 -> 0002)=0A=
pptest 2000:03:00.0: resource0 [mem 0xc50000000-0xc500fffff 64bit pref] =0A=
mapped to c1980000=0A=
pptest 2000:03:00.0: resource2 [mem 0xc40000000-0xc43ffffff 64bit] =0A=
mapped to c1b00000=0A=
pptest 2000:03:00.0:  0x4c =3D e0973=0A=
pptest 2000:03:00.0:  0x50 =3D 11ab=0A=
pptest 2000:04:00.0: enabling device (0000 -> 0002)=0A=
pptest 2000:04:00.0: resource0 [mem 0xc50100000-0xc501fffff 64bit pref] =0A=
mapped to c5b80000=0A=
pptest 2000:04:00.0: resource2 [mem 0xc44000000-0xc47ffffff 64bit] =0A=
mapped to c5d00000=0A=
pptest 2000:04:00.0:  0x4c =3D e0973=0A=
pptest 2000:04:00.0:  0x50 =3D 11ab=0A=
pptest 2000:05:00.0: enabling device (0000 -> 0002)=0A=
pptest 2000:05:00.0: resource0 [mem 0xc50200000-0xc502fffff 64bit pref] =0A=
mapped to c9d80000=0A=
pptest 2000:05:00.0: resource2 [mem 0xc48000000-0xc4bffffff 64bit] =0A=
mapped to c9f00000=0A=
pptest 2000:05:00.0:  0x4c =3D e0973=0A=
pptest 2000:05:00.0:  0x50 =3D 11ab=0A=
pptest 2000:06:00.0: enabling device (0000 -> 0002)=0A=
pptest 2000:06:00.0: resource0 [mem 0xc50300000-0xc503fffff 64bit pref] =0A=
mapped to cdf80000=0A=
pptest 2000:06:00.0: resource2 [mem 0xc4c000000-0xc4fffffff 64bit] =0A=
mapped to ce100000=0A=
pptest 2000:06:00.0:  0x4c =3D e0973=0A=
pptest 2000:06:00.0:  0x50 =3D 11ab=0A=
=0A=
Previously (under 4.4.x) we were able to get the memory space assigned =0A=
by triggering a rescan (i.e. the first case above) but I've always seen =0A=
the code that did that as a bit of a hack.=0A=
=0A=
Why would the rescan in the second case assign memory that wasn't =0A=
assigned by the first case? Is there any way I can avoid the removal =0A=
dance, ideally by assigning reset gpios in the device tree?=0A=
=0A=
Thanks,=0A=
Chris=0A=
=0A=
--=0A=
[1] - Similar hardware to =0A=
https://lore.kernel.org/linux-pci/403548ec3a7543b08ca32e47a1465e70@svr-chch=
-ex1.atlnz.lc/ =0A=
but a different CPU and architecture.=0A=
=0A=
