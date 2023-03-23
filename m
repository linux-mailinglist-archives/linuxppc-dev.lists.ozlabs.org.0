Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B768E6C6424
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 10:54:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj10H3r8sz3f4Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 20:54:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y/80Swkj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y/80Swkj;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj0zL52gzz3cHX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 20:53:50 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N9DncI005788;
	Thu, 23 Mar 2023 09:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : content-type : mime-version; s=pp1;
 bh=tPYlw/mCO1Vh8IJAdkAvkrj7ZSvh0qTRi3g5IAoGv6I=;
 b=Y/80SwkjOcjaVWhTnUPo0YQma8lP/2RbcJeM15uo4yxSZot29ibm/ykEtGQ/Hx54O8us
 96oT0Zw7yTx79Y2leSfxWLlEU8n94QGRf5kUeevAIWHw+mhZXIXB1tojdIeIrFbRyhH2
 XmFXsi/YI7J4hamRZ+H/gOiLxEJEVUQYaI6Gqwok8HEVJijFyZ28LPfjgz8sFyOFP6MP
 27Eg6u+hgOr3JOTTgvVuXZADffZgrN81g6eRibiKZKoURp4ro4ZFSVtJ37MK5oDwJtcA
 8L/H5PtBfVx8Nb8NIgBRXwXPNGT84TMUV9/bjhhIoAmQqBuYh1OfN92nj22QnlbtP37A iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgkxurvpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 09:53:40 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32N9rdCw000689;
	Thu, 23 Mar 2023 09:53:39 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgkxurvpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 09:53:39 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32N6mOVf017002;
	Thu, 23 Mar 2023 09:53:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3pd4jfe196-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 09:53:37 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32N9rZOX64881048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 09:53:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C26220043;
	Thu, 23 Mar 2023 09:53:35 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC8932004B;
	Thu, 23 Mar 2023 09:53:33 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu, 23 Mar 2023 09:53:33 +0000 (GMT)
Date: Thu, 23 Mar 2023 15:23:33 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Probing nvme disks fails on Upstream kernels on powerpc Maxconfig
Message-ID: <20230323095333.GI1005120@linux.vnet.ibm.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2nGW0BX5PNAe31P6pGwbaDLia2bOQT1R
X-Proofpoint-ORIG-GUID: JZAvPTMHa-jMKYSB7_RLv8TKPjUIhc-z
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230071
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: sachinp@linux.vnet.ibm.com, Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I am unable to boot upstream kernels from v5.16 to the latest upstream
kernel on a maxconfig system. (Machine config details given below)

At boot, we see a series of messages like the below.

dracut-initqueue[13917]: Warning: dracut-initqueue: timeout, still waiting for following initqueue hooks:
dracut-initqueue[13917]: Warning: /lib/dracut/hooks/initqueue/finished/devexists-\x2fdev\x2fdisk\x2fby-uuid\x2f93dc0767-18aa-467f-afa7-5b4e9c13108a.sh: "if ! grep -q After=remote-fs-pre.target /run/systemd/generator/systemd-cryptsetup@*.service 2>/dev/null; then
dracut-initqueue[13917]:     [ -e "/dev/disk/by-uuid/93dc0767-18aa-467f-afa7-5b4e9c13108a" ]
dracut-initqueue[13917]: fi"


journalctl shows the below warning.

 WARNING: CPU: 242 PID: 1219 at /home/srikar/work/linux.git/arch/powerpc/kernel/iommu.c:227 iommu_range_alloc+0x3d4/0x450
 Modules linked in: lpfc(E+) nvmet_fc(E) nvmet(E) configfs(E) qla2xxx(E+) nvme_fc(E) nvme_fabrics(E) vmx_crypto(E) gf128mul(E) xhci_pci(E) xhci_pci_renesas(E) xhci_hcd(E) ipr(E+) nvme(E) usbcore(E) libata(E) nvme_core(E) t10_pi(E) scsi_transport_fc(E) usb_common(E) btrfs(E) blake2b_generic(E) libcrc32c(E) crc32c_vpmsum(E) xor(E) raid6_pq(E) sg(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) scsi_mod(E) scsi_common(E)
 CPU: 242 PID: 1219 Comm: kworker/u3843:0 Tainted: G        W   EL    5.15.0-sp4+ #33 91e1c36ffe385108bbe4a3834506a047dc78552d
 Workqueue: nvme-reset-wq nvme_reset_work [nvme]
 NIP:  c00000000005a134 LR: c00000000005a128 CTR: 0000000000000000
 REGS: c00007fd4c7eb580 TRAP: 0700   Tainted: G        W   EL     (5.15.0-sp4+)
 MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24002424  XER: 00000000
 CFAR: c00000000020972c IRQMASK: 0
 GPR00: c00000000005a128 c00007fd4c7eb820 c000000002aa4b00 0000000000000001
 GPR04: c00000000273d648 0000000000000003 00000bfbcb210000 c000000002d88390
 GPR08: 0000000000000000 0000000000000000 00000000000000f2 c000000002b05240
 GPR12: 0000000000002000 c0000bfbdfffcb00 0000000000000000 c00007fd4c9d1c40
 GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
 GPR20: 0000000000000000 0000000000000000 c000000002bab580 0000000000000000
 GPR24: c0000000073b30c8 0000000000000000 0000000000000000 0000000000000000
 GPR28: c00007fd71330000 0000000000000000 0000000000000001 0000000000010000
 NIP [c00000000005a134] iommu_range_alloc+0x3d4/0x450
 LR [c00000000005a128] iommu_range_alloc+0x3c8/0x450
 Call Trace:
 [c00007fd4c7eb820] [c00000000005a128] iommu_range_alloc+0x3c8/0x450 (unreliable)
 [c00007fd4c7eb8e0] [c00000000005a580] iommu_alloc+0x60/0x170
 [c00007fd4c7eb930] [c00000000005bd4c] iommu_alloc_coherent+0x11c/0x1d0
 [c00007fd4c7eb9d0] [c0000000000597e8] dma_iommu_alloc_coherent+0x38/0x50
 [c00007fd4c7eb9f0] [c000000000249ce8] dma_alloc_attrs+0x128/0x180
 [c00007fd4c7eba60] [c0080001093210d8] nvme_alloc_queue+0x90/0x2b0 [nvme]
 [c00007fd4c7ebac0] [c008000109326034] nvme_reset_work+0x44c/0x1870 [nvme]
 [c00007fd4c7ebc30] [c0000000001870b8] process_one_work+0x388/0x730
 [c00007fd4c7ebd10] [c0000000001874d8] worker_thread+0x78/0x5b0
 [c00007fd4c7ebda0] [c0000000001945cc] kthread+0x1bc/0x1d0
 [c00007fd4c7ebe10] [c00000000000cee4] ret_from_kernel_thread+0x5c/0x64
 Instruction dump:
 60000000 7b693e24 7d304a14 e9490100 f9490110 4bfffd44 3c62fe39 3863f0f8
 481af5d5 60000000 2fa30000 419e0050 <0fe00000> f9c10030 f9e10038 fa010040
 ---[ end trace 01e0ce48acf1df9b ]---
 nvme nvme0: Removing after probe failure status: -12

Please note we are failing to probe nvme disks.

This corresponds to the below code in iommu_range_alloc() function.
/* Sanity check */
if (unlikely(npages == 0)) {
	if (printk_ratelimit())
		WARN_ON(1);
	return DMA_MAPPING_ERROR;
}

So we are seeing npages to be 0.

We see similar messages for all the 4 nvme disks.  Now since the nvme probe
is failing, the kernel fails to boot as all the root/boot and other
partitions are carved out of nvme disks.

Do note, this problem happens only on cold boot or on reboot. There are no
problems when kernels are kexeced.

git bisect shows Commit 387273118714 ("powerps/pseries/dma: Add support for
2M IOMMU page size") as the cause of the regression.

git bisect start
# bad: [df0cc57e057f18e44dac8e6c18aba47ab53202f9] Linux 5.16
git bisect bad df0cc57e057f18e44dac8e6c18aba47ab53202f9
# good: [8bb7eca972ad531c9b149c0a51ab43a417385813] Linux 5.15
git bisect good 8bb7eca972ad531c9b149c0a51ab43a417385813
# good: [2219b0ceefe835b92a8a74a73fe964aa052742a2] Merge tag 'soc-5.16' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 2219b0ceefe835b92a8a74a73fe964aa052742a2
# bad: [206825f50f908771934e1fba2bfc2e1f1138b36a] Merge tag 'mtd/for-5.16' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
git bisect bad 206825f50f908771934e1fba2bfc2e1f1138b36a
# good: [5cd4dc44b8a0f656100e3b6916cf73b1623299eb] Merge tag 'staging-5.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
git bisect good 5cd4dc44b8a0f656100e3b6916cf73b1623299eb
# bad: [5af06603c4090617be216a9185193a7be3ca60af] Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid
git bisect bad 5af06603c4090617be216a9185193a7be3ca60af
# good: [5c904c66ed4e86c31ac7c033b64274cebed04e0e] Merge tag 'char-misc-5.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
git bisect good 5c904c66ed4e86c31ac7c033b64274cebed04e0e
# good: [7e113d01f5f9fe6ad018d8289239d0bbb41311d7] Merge tag 'iommu-updates-v5.16' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
git bisect good 7e113d01f5f9fe6ad018d8289239d0bbb41311d7
# bad: [5c0b0c676ac2d84f69568715af91e45b610fe17a] Merge tag 'powerpc-5.16-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
git bisect bad 5c0b0c676ac2d84f69568715af91e45b610fe17a
# bad: [fef071be57dc43679a32d5b0e6ee176d6f12e9f2] powerpc/dcr: Use cmplwi instead of 3-argument cmpli
git bisect bad fef071be57dc43679a32d5b0e6ee176d6f12e9f2
# bad: [a97dd9e2f760c6996a8f1385ddab0bfef325b364] powerpc/fsl_booke: Enable reloading of TLBCAM without switching to AS1
git bisect bad a97dd9e2f760c6996a8f1385ddab0bfef325b364
# bad: [983f9101740641434cea4f2e172175ff4b0276ad] powerpc/cpuhp: BUG -> WARN conversion in offline path
git bisect bad 983f9101740641434cea4f2e172175ff4b0276ad
# bad: [7eff9bc00ddf1e2281dff575884b7f676c85b006] powerpc/mem: Fix arch/powerpc/mm/mem.c:53:12: error: no previous prototype for 'create_section_mapping'
git bisect bad 7eff9bc00ddf1e2281dff575884b7f676c85b006
# bad: [494f238a3861863d908af7b98a369f6d8a986c85] powerpc/476: Fix sparse report
git bisect bad 494f238a3861863d908af7b98a369f6d8a986c85
# bad: [3c2172c1c47b4079c29f0e6637d764a99355ebcd] powerpc/85xx: Fix oops when mpc85xx_smp_guts_ids node cannot be found
git bisect bad 3c2172c1c47b4079c29f0e6637d764a99355ebcd
# bad: [3872731187141d5d0a5c4fb30007b8b9ec36a44d] powerps/pseries/dma: Add support for 2M IOMMU page size
git bisect bad 3872731187141d5d0a5c4fb30007b8b9ec36a44d
# first bad commit: [3872731187141d5d0a5c4fb30007b8b9ec36a44d] powerps/pseries/dma: Add support for 2M IOMMU page size

After reverting the commit, I am able to boot into the machine.

$ lscpu
Architecture:                    ppc64le
Byte Order:                      Little Endian
CPU(s):                          1920
On-line CPU(s) list:             0-1919
Model name:                      POWER10 (architected), altivec supported
Model:                           2.0 (pvr 0080 0200)
Thread(s) per core:              8
Core(s) per socket:              15
Socket(s):                       16
Hypervisor vendor:               pHyp
Virtualization type:             para
L1d cache:                       15 MiB (480 instances)
L1i cache:                       22.5 MiB (480 instances)
L2 cache:                        480 MiB (480 instances)
L3 cache:                        1.9 GiB (480 instances)
NUMA node(s):                    16
NUMA node0 CPU(s):               0-119
NUMA node1 CPU(s):               120-239
NUMA node2 CPU(s):               240-359
NUMA node3 CPU(s):               360-479
NUMA node4 CPU(s):               480-599
NUMA node5 CPU(s):               600-719
NUMA node6 CPU(s):               720-839
NUMA node7 CPU(s):               840-959
NUMA node8 CPU(s):               960-1079
NUMA node9 CPU(s):               1080-1199
NUMA node10 CPU(s):              1200-1319
NUMA node11 CPU(s):              1320-1439
NUMA node12 CPU(s):              1440-1559
NUMA node13 CPU(s):              1560-1679
NUMA node14 CPU(s):              1680-1799
NUMA node15 CPU(s):              1800-1919

$ lspci
0010:01:00.0 Ethernet controller: Mellanox Technologies MT27710 Family [ConnectX-4 Lx]
0010:01:00.1 Ethernet controller: Mellanox Technologies MT27710 Family [ConnectX-4 Lx]
0012:01:00.0 Fibre Channel: Emulex Corporation LPe31000/LPe32000 Series 16Gb/32Gb Fibre Channel Adapter (rev 01)
0012:01:00.1 Fibre Channel: Emulex Corporation LPe31000/LPe32000 Series 16Gb/32Gb Fibre Channel Adapter (rev 01)
0013:01:00.0 RAID bus controller: IBM PCI-E IPR SAS Adapter (ASIC) (rev 02)
0014:01:00.0 USB controller: Texas Instruments TUSB73x0 SuperSpeed USB 3.0 xHCI Host Controller (rev 02)
0016:01:00.0 Fibre Channel: QLogic Corp. ISP2714-based 16/32Gb Fibre Channel to PCIe Adapter (rev 01)
0016:01:00.1 Fibre Channel: QLogic Corp. ISP2714-based 16/32Gb Fibre Channel to PCIe Adapter (rev 01)
0016:01:00.2 Fibre Channel: QLogic Corp. ISP2714-based 16/32Gb Fibre Channel to PCIe Adapter (rev 01)
0016:01:00.3 Fibre Channel: QLogic Corp. ISP2714-based 16/32Gb Fibre Channel to PCIe Adapter (rev 01)
0018:01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller PM9A1/PM9A3/980PRO
0023:01:00.0 RAID bus controller: IBM PCI-E IPR SAS Adapter (ASIC) (rev 02)
0028:01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller PM9A1/PM9A3/980PRO
0033:01:00.0 Ethernet controller: Mellanox Technologies MT27710 Family [ConnectX-4 Lx]
0033:01:00.1 Ethernet controller: Mellanox Technologies MT27710 Family [ConnectX-4 Lx]
0038:01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller PM9A1/PM9A3/980PRO
0043:01:00.0 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme II BCM57810 10 Gigabit Ethernet (rev 10)
0043:01:00.1 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme II BCM57810 10 Gigabit Ethernet (rev 10)
0048:01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller PM9A1/PM9A3/980PRO

$ df
Filesystem       1K-blocks     Used   Available Use% Mounted on
devtmpfs              4096        0        4096   0% /dev
tmpfs          32511249472        0 32511249472   0% /dev/shm
tmpfs          13004499840    19968 13004479872   1% /run
tmpfs                 4096        0        4096   0% /sys/fs/cgroup
/dev/nvme0n1p2    41943040 18486848    23400448  45% /
/dev/nvme0n1p2    41943040 18486848    23400448  45% /.snapshots
/dev/nvme0n1p2    41943040 18486848    23400448  45% /var
/dev/nvme0n1p2    41943040 18486848    23400448  45% /usr/local
/dev/nvme0n1p2    41943040 18486848    23400448  45% /srv
/dev/nvme0n1p2    41943040 18486848    23400448  45% /opt
/dev/nvme0n1p2    41943040 18486848    23400448  45% /root
/dev/nvme0n1p2    41943040 18486848    23400448  45% /tmp
/dev/nvme0n1p2    41943040 18486848    23400448  45% /boot/grub2/powerpc-ieee1275
/dev/nvme0n1p3   739098844 19459884   719638960   3% /home
tmpfs           6502249856       64  6502249792   1% /run/user/1005

-- 
Thanks and Regards
Srikar Dronamraju
