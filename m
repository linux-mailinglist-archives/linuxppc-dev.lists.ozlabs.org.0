Return-Path: <linuxppc-dev+bounces-3847-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7862D9E7A51
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2024 22:00:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y4kF02Jkkz2xQ8;
	Sat,  7 Dec 2024 08:00:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733518852;
	cv=none; b=oFNpbtPLZP0g+cHxO7gKu3z2jvy020LJwsQnuMXxA1oqgSxCluq98NXSA+zv5gVCvIDAFK0G3ct0UYbPjSIvJgzh3cJGexHxETVMMVqeM0eRK3SwIgGIVgupaOrnkTmNEVHPYb9rC5sUHUlHbiRuH/0GqRi1N7VMHYkILWqRKu8DiGFPjtPpQGscon+64HHscJhl6jNUnPv5UEH/DIPW19U6z9wMkP56Y9278swYWxi4O8ohRNwUarnS/XWJgydVMWkMlQoMCPLWlL9wQQ2HRqXKHFBtFyENgmTWz6MAKfLkZn0Z2BiyJ3OIyNcgiJLrWZAOnv5grCq2fcT/nqmcZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733518852; c=relaxed/relaxed;
	bh=iqCKTbZri/dO/bUPYbgQRksRR872BdoP7OQDjs+msd4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RUFaAc+ss6Fpi7OWJXQdOLrMYsKOJz6aV27PUpAHtEgo/d6r7IVmImGhw/3m5DRAOky5DoV1THgZb/fq9vfzmnML02IFkQTCQ9H/ObOo8LJZ8Sw2a4KV/YMM8Er+KUtCmI2x/UQq42mqOc0uMGBcadYvqPFuYSlDEm+qd56nU3/RnteND9cQUtV5VK4kZievwvGL/lb5Np4eoqeZV2aHmTu5A4+otd4cjhyGyyc6YM5rtxrb66H/5O/WisDCAElaMct8JsNYmkArd/6X6X97OG3MBHB0ZjLyYQwtyi2YMkT60oyI0ctCUIJdyqlh8GGE4E5xqiSvjN20gEkC03dguA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NNYbKOgE; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NNYbKOgE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y4kDz1bjtz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2024 08:00:50 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6F2i0c030874;
	Fri, 6 Dec 2024 21:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=iqCKTbZri/dO/bUPYbgQRksRR872BdoP7OQDjs+ms
	d4=; b=NNYbKOgE06YlAPOblX374nl8dxiZ6P7TdLLxSLEdGM2YULirg0juD4zzS
	cqgS0XEDhijTBTbhcSdGCyEYrb7rBZ41b++QzV1ysakqaE2byOp3YPbMIsa4m6Oh
	yP8fmFdDwtuSdbddSAcvpKdzjFNcCTnPZfc256VGWDWBiWkRXysyncsW/PYM36xR
	jziyMdlb8MSOl4QfpixNUs0Oo15Egr46EpQLQsXMoQTLvEDa+DZi3UdWYQZp7sid
	2IQT7drQsSv08xj3XLfLzjCpbXbZ4ZZ8tgPdoo9P/DhJ2Vpw64uNdw91s/4Dful1
	YbqUNptvma6wKNhAMHJ1z8iX7HVBw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43b6hbaabj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 21:00:41 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6I4EK7023733;
	Fri, 6 Dec 2024 21:00:40 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 438f8k0b20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 21:00:40 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B6L0dSA19857942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Dec 2024 21:00:40 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFA5E5805E;
	Fri,  6 Dec 2024 21:00:39 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 786D358061;
	Fri,  6 Dec 2024 21:00:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.10])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Dec 2024 21:00:39 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.ibm.com>
To: mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org, Gaurav Batra <gbatra@linux.ibm.com>
Subject: [PATCH] powerpc/pseries/iommu: IOMMU incorrectly marks MMIO range in DDW
Date: Fri,  6 Dec 2024 15:00:39 -0600
Message-Id: <20241206210039.93172-1-gbatra@linux.ibm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XLc7ujE6xAYhv-1TGnTcuUDrZuI3hK0z
X-Proofpoint-GUID: XLc7ujE6xAYhv-1TGnTcuUDrZuI3hK0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 clxscore=1011 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060158
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Power Hypervisor can possibily allocate MMIO window intersecting with
Dynamic DMA Window (DDW) range, which is over 32-bit addressing.

These MMIO pages needs to be marked as reserved so that IOMMU doesn't map
DMA buffers in this range.

The current code is not marking these pages correctly which is resulting
in LPAR to OOPS while booting. The stack is at below

BUG: Unable to handle kernel data access on read at 0xc00800005cd40000
Faulting instruction address: 0xc00000000005cdac
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Modules linked in: af_packet rfkill ibmveth(X) lpfc(+) nvmet_fc nvmet nvme_keyring crct10dif_vpmsum nvme_fc nvme_fabrics nvme_core be2net(+) nvme_auth rtc_generic nfsd auth_rpcgss nfs_acl lockd grace sunrpc fuse configfs ip_tables x_tables xfs libcrc32c dm_service_time ibmvfc(X) scsi_transport_fc vmx_crypto gf128mul crc32c_vpmsum dm_mirror dm_region_hash dm_log dm_multipath dm_mod sd_mod scsi_dh_emc scsi_dh_rdac scsi_dh_alua t10_pi crc64_rocksoft_generic crc64_rocksoft sg crc64 scsi_mod
Supported: Yes, External
CPU: 8 PID: 241 Comm: kworker/8:1 Kdump: loaded Not tainted 6.4.0-150600.23.14-default #1 SLE15-SP6 b44ee71c81261b9e4bab5e0cde1f2ed891d5359b
Hardware name: IBM,9080-M9S POWER9 (raw) 0x4e2103 0xf000005 of:IBM,FW950.B0 (VH950_149) hv:phyp pSeries
Workqueue: events work_for_cpu_fn
NIP:  c00000000005cdac LR: c00000000005e830 CTR: 0000000000000000
REGS: c00001400c9ff770 TRAP: 0300   Not tainted  (6.4.0-150600.23.14-default)
MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24228448  XER: 00000001
CFAR: c00000000005cdd4 DAR: c00800005cd40000 DSISR: 40000000 IRQMASK: 0
GPR00: c00000000005e830 c00001400c9ffa10 c000000001987d00 c00001400c4fe800
GPR04: 0000080000000000 0000000000000001 0000000004000000 0000000000800000
GPR08: 0000000004000000 0000000000000001 c00800005cd40000 ffffffffffffffff
GPR12: 0000000084228882 c00000000a4c4f00 0000000000000010 0000080000000000
GPR16: c00001400c4fe800 0000000004000000 0800000000000000 c00000006088b800
GPR20: c00001401a7be980 c00001400eff3800 c000000002a2da68 000000000000002b
GPR24: c0000000026793a8 c000000002679368 000000000000002a c0000000026793c8
GPR28: 000008007effffff 0000080000000000 0000000000800000 c00001400c4fe800
NIP [c00000000005cdac] iommu_table_reserve_pages+0xac/0x100
LR [c00000000005e830] iommu_init_table+0x80/0x1e0
Call Trace:
[c00001400c9ffa10] [c00000000005e810] iommu_init_table+0x60/0x1e0 (unreliable)
[c00001400c9ffa90] [c00000000010356c] iommu_bypass_supported_pSeriesLP+0x9cc/0xe40
[c00001400c9ffc30] [c00000000005c300] dma_iommu_dma_supported+0xf0/0x230
[c00001400c9ffcb0] [c00000000024b0c4] dma_supported+0x44/0x90
[c00001400c9ffcd0] [c00000000024b14c] dma_set_mask+0x3c/0x80
[c00001400c9ffd00] [c0080000555b715c] be_probe+0xc4/0xb90 [be2net]
[c00001400c9ffdc0] [c000000000986f3c] local_pci_probe+0x6c/0x110
[c00001400c9ffe40] [c000000000188f28] work_for_cpu_fn+0x38/0x60
[c00001400c9ffe70] [c00000000018e454] process_one_work+0x314/0x620
[c00001400c9fff10] [c00000000018f280] worker_thread+0x2b0/0x620
[c00001400c9fff90] [c00000000019bb18] kthread+0x148/0x150
[c00001400c9fffe0] [c00000000000ded8] start_kernel_thread+0x14/0x18

There are 2 issues in the code

1. The index is "int" while the address is "unsigned long". This results in
   negative value when setting the bitmap.

2. The DMA offset is page shifted but the MMIO range is used as-is (64-bit
   address). MMIO address needs to be page shifted as well.

Fixes: 3c33066a2190 ("powerpc/kernel/iommu: Add new iommu_table_in_use() helper")

Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
---
 arch/powerpc/kernel/iommu.c            | 2 +-
 arch/powerpc/platforms/pseries/iommu.c | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 76381e14e800..0ebae6e4c19d 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -687,7 +687,7 @@ void iommu_table_clear(struct iommu_table *tbl)
 void iommu_table_reserve_pages(struct iommu_table *tbl,
 		unsigned long res_start, unsigned long res_end)
 {
-	int i;
+	unsigned long i;
 
 	WARN_ON_ONCE(res_end < res_start);
 	/*
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 534cd159e9ab..29f1a0cc59cd 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1650,7 +1650,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		iommu_table_setparms_common(newtbl, pci->phb->bus->number, create.liobn,
 					    dynamic_addr, dynamic_len, page_shift, NULL,
 					    &iommu_table_lpar_multi_ops);
-		iommu_init_table(newtbl, pci->phb->node, start, end);
+		iommu_init_table(newtbl, pci->phb->node,
+				 start >> page_shift, end >> page_shift);
 
 		pci->table_group->tables[default_win_removed ? 0 : 1] = newtbl;
 
@@ -2065,7 +2066,9 @@ static long spapr_tce_create_table(struct iommu_table_group *table_group, int nu
 							    offset, 1UL << window_shift,
 							    IOMMU_PAGE_SHIFT_4K, NULL,
 							    &iommu_table_lpar_multi_ops);
-				iommu_init_table(tbl, pci->phb->node, start, end);
+				iommu_init_table(tbl, pci->phb->node,
+						 start >> IOMMU_PAGE_SHIFT_4K,
+						 end >> IOMMU_PAGE_SHIFT_4K);
 
 				table_group->tables[0] = tbl;
 
@@ -2136,7 +2139,7 @@ static long spapr_tce_create_table(struct iommu_table_group *table_group, int nu
 	/* New table for using DDW instead of the default DMA window */
 	iommu_table_setparms_common(tbl, pci->phb->bus->number, create.liobn, win_addr,
 				    1UL << len, page_shift, NULL, &iommu_table_lpar_multi_ops);
-	iommu_init_table(tbl, pci->phb->node, start, end);
+	iommu_init_table(tbl, pci->phb->node, start >> page_shift, end >> page_shift);
 
 	pci->table_group->tables[num] = tbl;
 	set_iommu_table_base(&pdev->dev, tbl);
-- 
2.39.3 (Apple Git-146)


