Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BD4B8275
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 22:31:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z7m236M9zF3Ns
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 06:31:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z7jK4pTszF2Q4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 06:28:52 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8JKREn2070686; Thu, 19 Sep 2019 16:28:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v3vdfvrra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 16:28:45 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8JKRUYC071255;
 Thu, 19 Sep 2019 16:28:44 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v3vdfvrqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 16:28:43 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8JKPIbR012963;
 Thu, 19 Sep 2019 20:28:42 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 2v3vc5garw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 20:28:42 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8JKSfjK50856314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Sep 2019 20:28:41 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61554C6061;
 Thu, 19 Sep 2019 20:28:41 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43700C605B;
 Thu, 19 Sep 2019 20:28:41 +0000 (GMT)
Received: from localhost (unknown [9.41.179.186])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Sep 2019 20:28:41 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>
Subject: Re: [PATCH v5 05/12] powerpc/eeh: EEH for pSeries hot plug
In-Reply-To: <72ae8ae9c54097158894a52de23690448de38ea9.1565930772.git.sbobroff@linux.ibm.com>
References: <cover.1565930772.git.sbobroff@linux.ibm.com>
 <72ae8ae9c54097158894a52de23690448de38ea9.1565930772.git.sbobroff@linux.ibm.com>
Date: Thu, 19 Sep 2019 15:28:40 -0500
Message-ID: <871rwcqbd3.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-19_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=5 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909190173
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, oohall@gmail.com,
 tyreld@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Sam,

Sam Bobroff <sbobroff@linux.ibm.com> writes:
> On PowerNV and pSeries, devices currently acquire EEH support from
> several different places: Boot-time devices from eeh_probe_devices()
> and eeh_addr_cache_build(), Virtual Function devices from the pcibios
> bus add device hooks and hot plugged devices from pci_hp_add_devices()
> (with other platforms using other methods as well).  Unfortunately,
> pSeries machines currently discover hot plugged devices using
> pci_rescan_bus(), not pci_hp_add_devices(), and so those devices do
> not receive EEH support.
>
> Rather than adding another case for pci_rescan_bus(), this change
> widens the scope of the pcibios bus add device hooks so that they can
> handle all devices. As a side effect this also supports devices
> discovered after manually rescanning via /sys/bus/pci/rescan.
>
> Note that on PowerNV, this change allows the EEH subsystem to become
> enabled after boot as long as it has not been forced off, which was
> not previously possible (it was already possible on pSeries).

With this change, I get a crash (use after free by the looks of it) when
I remove and then add a pci device in qemu:

$ qemu-system-ppc64 -M pseries -append 'debug console=hvc0' \
  -nographic -vga none -m 1G,slots=32,maxmem=1024G -smp 2 \
  -kernel vmlinux -initrd ~/b/br/ppc64le-initramfs/images/rootfs.cpio \
  -nic model=e1000

...

# echo 1 > /sys/devices/pci0000:00/0000:00:00.0/remove ; \
  echo 1 > /sys/devices/pci0000:00/pci_bus/0000:00/rescan

pci 0000:00:00.0: Removing from iommu group 0
pci 0000:00:00.0: [8086:100e] type 00 class 0x020000
pci 0000:00:00.0: reg 0x10: [mem 0x200080000000-0x20008001ffff]
pci 0000:00:00.0: reg 0x14: [io  0x10040-0x1007f]
pci 0000:00:00.0: reg 0x30: [mem 0x200080040000-0x20008007ffff pref]
pci 0000:00:00.0: Adding to iommu group 0
pci 0000:00:00.0: BAR 6: assigned [mem 0x200080000000-0x20008003ffff pref]
pci 0000:00:00.0: BAR 0: assigned [mem 0x200080040000-0x20008005ffff]
pci 0000:00:00.0: BAR 1: assigned [io  0x10000-0x1003f]
e1000 0000:00:00.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
e1000 0000:00:00.0 eth0: Intel(R) PRO/1000 Network Connection
pci 0000:00:00.0: Removing from iommu group 0
pci 0000:00:00.0: [8086:100e] type 00 class 0x020000
pci 0000:00:00.0: reg 0x10: [mem 0x200080040000-0x20008005ffff]
pci 0000:00:00.0: reg 0x14: [io  0x10000-0x1003f]
pci 0000:00:00.0: reg 0x30: [mem 0x200080040000-0x20008007ffff pref]
pci 0000:00:00.0: BAR 6: assigned [mem 0x200080000000-0x20008003ffff pref]
pci 0000:00:00.0: BAR 0: assigned [mem 0x200080040000-0x20008005ffff]
pci 0000:00:00.0: BAR 1: assigned [io  0x10000-0x1003f]
BUG: Unable to handle kernel data access at 0x6b6b6b6b6b6b6bfb
Faulting instruction address: 0xc000000000597270
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Modules linked in:
CPU: 0 PID: 2464 Comm: pci-probe-vs-cp Not tainted 5.3.0-rc2-00092-gf381d5711f09 #76
NIP:  c000000000597270 LR: c000000000599470 CTR: c0000000002030b0
REGS: c00000003ee4f650 TRAP: 0380   Not tainted  (5.3.0-rc2-00092-gf381d5711f09)
MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24002442  XER: 00000000
CFAR: c00000000059946c IRQMASK: 0 
GPR00: c000000000599470 c00000003ee4f8e0 c000000003317a00 6b6b6b6b6b6b6b6b 
GPR04: c000000001d0fa38 0000000000000000 0000000000000000 221a64979a66f870 
GPR08: c00000000347b398 0000000000000000 c00000000336e070 ffffffffffffffff 
GPR12: 0000000000002000 c000000004060000 0000000000000000 0000000000000000 
GPR16: 00000000100a78d8 00007fffe9fdff96 00000000100a7898 0000000000000000 
GPR20: 0000000000000000 00000000100e0ff0 0000000000000000 00000000100e0fe8 
GPR24: 0000000000000000 000001002ae50260 c000000001d0fa38 6b6b6b6b6b6b6b6b 
GPR28: fffffffffffffff2 c000000001d0fa38 0000000000000000 c000000003118c18 
NIP [c000000000597270] kernfs_find_ns+0x50/0x3d0
LR [c000000000599470] kernfs_remove_by_name_ns+0x60/0xe0
Call Trace:
[c00000003ee4f8e0] [c00000000020950c] lockdep_hardirqs_on+0x10c/0x210 (unreliable)
[c00000003ee4f970] [c000000000599470] kernfs_remove_by_name_ns+0x60/0xe0
[c00000003ee4fa00] [c00000000059ca08] sysfs_remove_file_ns+0x28/0x40
[c00000003ee4fa20] [c000000000cbd70c] device_remove_file+0x2c/0x40
[c00000003ee4fa40] [c000000000051480] eeh_sysfs_remove_device+0x50/0xf0
[c00000003ee4fa80] [c00000000004a594] eeh_add_device_late.part.7+0x84/0x220
[c00000003ee4fb00] [c0000000000e94f0] pseries_pcibios_bus_add_device+0x60/0xb0
[c00000003ee4fb70] [c00000000006fc40] pcibios_bus_add_device+0x40/0x60
[c00000003ee4fb90] [c000000000bc5220] pci_bus_add_device+0x30/0x100
[c00000003ee4fc00] [c000000000bc5344] pci_bus_add_devices+0x54/0xb0
[c00000003ee4fc40] [c000000000bca058] pci_rescan_bus+0x48/0x70
[c00000003ee4fc70] [c000000000bd9adc] dev_bus_rescan_store+0xcc/0x100
[c00000003ee4fcb0] [c000000000cbc9d8] dev_attr_store+0x38/0x60
[c00000003ee4fcd0] [c00000000059c460] sysfs_kf_write+0x70/0xb0
[c00000003ee4fd10] [c00000000059aa98] kernfs_fop_write+0xf8/0x280
[c00000003ee4fd60] [c0000000004b3e5c] __vfs_write+0x3c/0x70
[c00000003ee4fd80] [c0000000004b81f0] vfs_write+0xd0/0x220
[c00000003ee4fdd0] [c0000000004b85ac] ksys_write+0x7c/0x140
[c00000003ee4fe20] [c00000000000bc6c] system_call+0x5c/0x70

FWIW during boot the EEH core reports:

  EEH: No capable adapters found: recovery disabled.

> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index ca8b0c58a6a7..87edac6f2fd9 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1272,7 +1272,7 @@ void eeh_add_device_late(struct pci_dev *dev)
>  	struct pci_dn *pdn;
>  	struct eeh_dev *edev;
>  
> -	if (!dev || !eeh_enabled())
> +	if (!dev)
>  		return;
>  
>  	pr_debug("EEH: Adding device %s\n", pci_name(dev));

Reverting this hunk works around (fixes?) it.
