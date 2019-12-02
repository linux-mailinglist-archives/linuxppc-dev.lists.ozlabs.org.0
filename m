Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAA710E613
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 07:44:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RFwK2rXyzDqK5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 17:44:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RFqd3KfPzDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 17:40:45 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB26WhLW031140; Mon, 2 Dec 2019 01:40:39 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wm6g7xtss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2019 01:40:39 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB26eS7J004172;
 Mon, 2 Dec 2019 06:40:43 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 2wkg25r8ku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2019 06:40:43 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB26ecen14353030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Dec 2019 06:40:38 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F217124052;
 Mon,  2 Dec 2019 06:40:38 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AB82124054;
 Mon,  2 Dec 2019 06:40:37 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.124.35.144])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  2 Dec 2019 06:40:37 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerepc/book3s64/hash: Align start address correctly with
 bolt mapping
Date: Mon,  2 Dec 2019 12:10:34 +0530
Message-Id: <20191202064034.155218-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-01_04:2019-11-29,2019-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 suspectscore=1 spamscore=0 mlxscore=0 adultscore=0
 mlxlogscore=641 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912020058
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This ensures we don't do a partial mapping of memory. With nvdimm, when creating
namespaces with size not aligned to 16MB, kernel ends up partially mapping the pages.
This results in a crash when a namespace is removed. This is due to kernel doing
unmap of a page that was part of both the namespace.

Another patch series will make sure we always create namespaces aligned to 16MB.
But we can do better by avoiding mapping pages that are not aligned. This helps
to catch access to these partially mapped pages early.

A kernel crash will look like below:

BUG: Unable to handle kernel data access at 0xc001000406000000
Faulting instruction address: 0xc000000000090790
NIP [c000000000090790] arch_add_memory+0xc0/0x130
LR [c000000000090744] arch_add_memory+0x74/0x130
Call Trace:
 arch_add_memory+0x74/0x130 (unreliable)
 memremap_pages+0x74c/0xa30
 devm_memremap_pages+0x3c/0xa0
 pmem_attach_disk+0x188/0x770
 nvdimm_bus_probe+0xd8/0x470
 really_probe+0x148/0x570
 driver_probe_device+0x19c/0x1d0
 device_driver_attach+0xcc/0x100
 bind_store+0x134/0x1c0
 drv_attr_store+0x44/0x60
 sysfs_kf_write+0x74/0xc0
 kernfs_fop_write+0x1b4/0x290
 __vfs_write+0x3c/0x70
 vfs_write+0xd0/0x260
 ksys_write+0xdc/0x130
 system_call+0x5c/0x68

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c    | 12 +++++++++---
 arch/powerpc/mm/book3s64/radix_pgtable.c |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index b30435c7d804..51fb4a4df57b 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -257,8 +257,12 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 	DBG("htab_bolt_mapping(%lx..%lx -> %lx (%lx,%d,%d)\n",
 	    vstart, vend, pstart, prot, psize, ssize);
 
-	for (vaddr = vstart, paddr = pstart; vaddr < vend;
-	     vaddr += step, paddr += step) {
+	/* Carefully map only the possible range */
+	vaddr = _ALIGN_UP(vstart, step);
+	paddr = _ALIGN_UP(pstart, step);
+	vend = _ALIGN_DOWN(vend, step);
+
+	for (; vaddr < vend; vaddr += step, paddr += step) {
 		unsigned long hash, hpteg;
 		unsigned long vsid = get_kernel_vsid(vaddr, ssize);
 		unsigned long vpn  = hpt_vpn(vaddr, vsid, ssize);
@@ -340,7 +344,9 @@ int htab_remove_mapping(unsigned long vstart, unsigned long vend,
 	if (!mmu_hash_ops.hpte_removebolted)
 		return -ENODEV;
 
-	for (vaddr = vstart; vaddr < vend; vaddr += step) {
+	/* Unmap the full reange specificied */
+	vaddr = _ALIGN_DOWN(vstart, step);
+	for (;vaddr < vend; vaddr += step) {
 		rc = mmu_hash_ops.hpte_removebolted(vaddr, psize, ssize);
 		if (rc == -ENOENT) {
 			ret = -ENOENT;
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 6ee17d09649c..e40d2f923d4d 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -260,6 +260,7 @@ static int __meminit create_physical_mapping(unsigned long start,
 	int psize;
 
 	start = _ALIGN_UP(start, PAGE_SIZE);
+	end = _ALIGN_DOWN(end, PAGE_SIZE);
 	for (addr = start; addr < end; addr += mapping_size) {
 		unsigned long gap, previous_size;
 		int rc;
-- 
2.23.0

