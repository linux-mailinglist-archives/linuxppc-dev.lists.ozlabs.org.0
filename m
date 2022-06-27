Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC2255B831
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 09:28:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWfTd0jZSz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 17:28:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L2vst8OG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L2vst8OG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWfSx1Rv2z2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 17:27:44 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25R7BrcI009914;
	Mon, 27 Jun 2022 07:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=2tgiERtPLscMMZQZBSepSc7W+6t2H53YQG+CM3p3dho=;
 b=L2vst8OGUoowAITEmGIxJEAjpNXvddM85H0bJe41pyBfm1dGDUR3Mfdk1nTpKZw1K9Sg
 xgTXZpVpphriPvzZnp8qOpbBHYS0iOVN64Tv/gzvv4EPkxGAUtJkppmnGauJpHoXwV3i
 bTLJYiO43X3zVcO0E6JL8R4KSw1ozu6h8g6/pUEmdTKo+KDIVtMVKyVovuo2FJb/og1R
 1INKxqhwyGOlnp8DELOqcj047PIcvCxIH0c+YMOJP7tXhoj5XZH3CjaVq4bofVqbxno4
 REfowy51eC4Y+2LBy64cz3YJDrQX9EX5JwbZSRXhtpqLI9i3PJR4hfSsGV28vg3dOclD zA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gy7xq0j0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 07:27:28 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25R7Ka41025886;
	Mon, 27 Jun 2022 07:27:26 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma02wdc.us.ibm.com with ESMTP id 3gwt09cgtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 07:27:26 +0000
Received: from b03ledav001.gho.boulder.ibm.com (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25R7RPHu9830804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jun 2022 07:27:25 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C6E96E053;
	Mon, 27 Jun 2022 07:27:25 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3B276E054;
	Mon, 27 Jun 2022 07:27:22 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.47.235])
	by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon, 27 Jun 2022 07:27:22 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH V2] powerpc/memhotplug: Add add_pages override for PPC
Date: Mon, 27 Jun 2022 12:57:08 +0530
Message-Id: <20220627072708.75662-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GYn2Yicg6xQFlaVya1PjTUsOmkHhUswd
X-Proofpoint-ORIG-GUID: GYn2Yicg6xQFlaVya1PjTUsOmkHhUswd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_05,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206270030
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
Cc: linux-mm@kvack.org, Kefeng Wang <wangkefeng.wang@huawei.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With commit ffa0b64e3be5 ("powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit")
the kernel now validate the addr against high_memory value. This results
in the below BUG_ON with dax pfns.

[  635.798741][T26531] kernel BUG at mm/page_alloc.c:5521!
1:mon> e
cpu 0x1: Vector: 700 (Program Check) at [c000000007287630]
    pc: c00000000055ed48: free_pages.part.0+0x48/0x110
    lr: c00000000053ca70: tlb_finish_mmu+0x80/0xd0
    sp: c0000000072878d0
   msr: 800000000282b033
  current = 0xc00000000afabe00
  paca    = 0xc00000037ffff300   irqmask: 0x03   irq_happened: 0x05
    pid   = 26531, comm = 50-landscape-sy
kernel BUG at :5521!
Linux version 5.19.0-rc3-14659-g4ec05be7c2e1 (kvaneesh@ltc-boston8) (gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #625 SMP Thu Jun 23 00:35:43 CDT 2022
1:mon> t
[link register   ] c00000000053ca70 tlb_finish_mmu+0x80/0xd0
[c0000000072878d0] c00000000053ca54 tlb_finish_mmu+0x64/0xd0 (unreliable)
[c000000007287900] c000000000539424 exit_mmap+0xe4/0x2a0
[c0000000072879e0] c00000000019fc1c mmput+0xcc/0x210
[c000000007287a20] c000000000629230 begin_new_exec+0x5e0/0xf40
[c000000007287ae0] c00000000070b3cc load_elf_binary+0x3ac/0x1e00
[c000000007287c10] c000000000627af0 bprm_execve+0x3b0/0xaf0
[c000000007287cd0] c000000000628414 do_execveat_common.isra.0+0x1e4/0x310
[c000000007287d80] c00000000062858c sys_execve+0x4c/0x60
[c000000007287db0] c00000000002c1b0 system_call_exception+0x160/0x2c0
[c000000007287e10] c00000000000c53c system_call_common+0xec/0x250

The fix is to make sure we update high_memory on memory hotplug.
This is similar to what x86 does in commit 3072e413e305 ("mm/memory_hotplug: introduce add_pages")

Fixes: ffa0b64e3be5 ("powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit")
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/Kconfig  |  4 ++++
 arch/powerpc/mm/mem.c | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c2ce2e60c8f0..7aa12e88c580 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -358,6 +358,10 @@ config ARCH_SUSPEND_NONZERO_CPU
 	def_bool y
 	depends on PPC_POWERNV || PPC_PSERIES
 
+config ARCH_HAS_ADD_PAGES
+	def_bool y
+	depends on ARCH_ENABLE_MEMORY_HOTPLUG
+
 config PPC_DCR_NATIVE
 	bool
 
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 52b77684acda..2a63920c369d 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -105,6 +105,36 @@ void __ref arch_remove_linear_mapping(u64 start, u64 size)
 	vm_unmap_aliases();
 }
 
+/*
+ * After memory hotplug the variables max_pfn, max_low_pfn and high_memory need
+ * updating.
+ */
+static void update_end_of_memory_vars(u64 start, u64 size)
+{
+	unsigned long end_pfn = PFN_UP(start + size);
+
+	if (end_pfn > max_pfn) {
+		max_pfn = end_pfn;
+		max_low_pfn = end_pfn;
+		high_memory = (void *)__va(max_pfn * PAGE_SIZE - 1) + 1;
+	}
+}
+
+int __ref add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
+		    struct mhp_params *params)
+{
+	int ret;
+
+	ret = __add_pages(nid, start_pfn, nr_pages, params);
+	WARN_ON_ONCE(ret);
+
+	/* update max_pfn, max_low_pfn and high_memory */
+	update_end_of_memory_vars(start_pfn << PAGE_SHIFT,
+				  nr_pages << PAGE_SHIFT);
+
+	return ret;
+}
+
 int __ref arch_add_memory(int nid, u64 start, u64 size,
 			  struct mhp_params *params)
 {
@@ -115,7 +145,7 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
 	rc = arch_create_linear_mapping(nid, start, size, params);
 	if (rc)
 		return rc;
-	rc = __add_pages(nid, start_pfn, nr_pages, params);
+	rc = add_pages(nid, start_pfn, nr_pages, params);
 	if (rc)
 		arch_remove_linear_mapping(start, size);
 	return rc;
-- 
2.36.1

