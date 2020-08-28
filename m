Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D2E255871
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 12:13:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdFls1HPCzDqHX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 20:12:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=opd5XTYH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdFgR6xqSzDqkS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 20:09:07 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07SA2XrZ171019; Fri, 28 Aug 2020 06:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=+R8bxbDAxYweEMevdqDiVuPszE2nZc4qx7Wa7ur4EAY=;
 b=opd5XTYHXOJzPxhPYjsR1EfBnzlYE0lF6emeb+BrR3h2WhUT+NcFfPKrmuGiJFUCWvq2
 cSgqD6sSzviepIxRo2Tq+5wCVfyA4RZg1+cdBZn0NzBAJ+Pdms3hHaiP1CkTpYE/sbX5
 xwGrr7TBLpjKncKEq0D425MLL87DFynawaKfrsFxj0Y+BcoNcFVAVhhY3FRFddK6YQnp
 dEh0042eMK8lLLs8W3BzrzYVtR6ibljh+hIH+OesA6K4bq4zpDiV8zXYEFZQl4i6mJse
 NDXfMmeU3/hDxC9jmPlhaXp+0PMiRM9rGqqtBJ014pnJpz0NVtaCkGhSp2+2dr4hMmZm tA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 336ypmgcmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 06:08:59 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07SA7nC9022642;
 Fri, 28 Aug 2020 10:08:59 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 332utudcvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 10:08:59 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07SA8vsH53346672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Aug 2020 10:08:57 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D65CB2064;
 Fri, 28 Aug 2020 10:08:57 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F69FB205F;
 Fri, 28 Aug 2020 10:08:55 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.63.76])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 28 Aug 2020 10:08:54 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/book3s64/radix: Fix boot failure with large amount
 of guest memory
Date: Fri, 28 Aug 2020 15:38:52 +0530
Message-Id: <20200828100852.426575-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-28_05:2020-08-28,
 2020-08-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 suspectscore=2 mlxlogscore=999 phishscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008280073
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
Cc: Shirisha Ganta <shiganta@in.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If the hypervisor doesn't support hugepages, the kernel ends up allocating a large
number of page table pages. The early page table allocation was wrongly
setting the max memblock limit to ppc64_rma_size with radix translation
which resulted in boot failure as shown below.

Kernel panic - not syncing:
early_alloc_pgtable: Failed to allocate 16777216 bytes align=0x1000000 nid=-1 from=0x0000000000000000 max_addr=0xffffffffffffffff
 CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-24.9-default+ #2
 Call Trace:
 [c0000000016f3d00] [c0000000007c6470] dump_stack+0xc4/0x114 (unreliable)
 [c0000000016f3d40] [c00000000014c78c] panic+0x164/0x418
 [c0000000016f3dd0] [c000000000098890] early_alloc_pgtable+0xe0/0xec
 [c0000000016f3e60] [c0000000010a5440] radix__early_init_mmu+0x360/0x4b4
 [c0000000016f3ef0] [c000000001099bac] early_init_mmu+0x1c/0x3c
 [c0000000016f3f10] [c00000000109a320] early_setup+0x134/0x170

This was because the kernel was checking for the radix feature before we enable the
feature via mmu_features. This resulted in the kernel using hash restrictions on
radix.

Rework the early init code such that the kernel boot with memblock restrictions
as imposed by hash. At that point, the kernel still hasn't finalized the
translation the kernel will end up using.

We have three different ways of detecting radix.

1. dt_cpu_ftrs_scan -> used only in case of PowerNV
2. ibm,pa-features -> Used when we don't use cpu_dt_ftr_scan
3. CAS -> Where we negotiate with hypervisor about the supported translation.

We look at 1 or 2 early in the boot and after that, we look at the CAS vector to
finalize the translation the kernel will use. We also support a kernel command
line option (disable_radix) to switch to hash.

Update the memblock limit after mmu_early_init_devtree() if the kernel is going
to use radix translation. This forces some of the memblock allocations we do before
mmu_early_init_devtree() to be within the RMA limit.

Fixes: 2bfd65e45e87 ("powerpc/mm/radix: Add radix callbacks for early init routines")
Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>
Reported-by: Shirisha Ganta <shiganta@in.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h | 10 +++++-----
 arch/powerpc/mm/book3s64/radix_pgtable.c | 15 ---------------
 arch/powerpc/mm/init_64.c                | 11 +++++++++--
 3 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 55442d45c597..b392384a3b15 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -239,14 +239,14 @@ static inline void early_init_mmu_secondary(void)
 
 extern void hash__setup_initial_memory_limit(phys_addr_t first_memblock_base,
 					 phys_addr_t first_memblock_size);
-extern void radix__setup_initial_memory_limit(phys_addr_t first_memblock_base,
-					 phys_addr_t first_memblock_size);
 static inline void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 					      phys_addr_t first_memblock_size)
 {
-	if (early_radix_enabled())
-		return radix__setup_initial_memory_limit(first_memblock_base,
-						   first_memblock_size);
+	/*
+	 * Hash has more strict restrictions. At this point we don't
+	 * know which translations we will pick. Hence go with hash
+	 * restrictions.
+	 */
 	return hash__setup_initial_memory_limit(first_memblock_base,
 					   first_memblock_size);
 }
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 28c784976bed..d5f0c10d752a 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -734,21 +734,6 @@ void radix__mmu_cleanup_all(void)
 	}
 }
 
-void radix__setup_initial_memory_limit(phys_addr_t first_memblock_base,
-				phys_addr_t first_memblock_size)
-{
-	/*
-	 * We don't currently support the first MEMBLOCK not mapping 0
-	 * physical on those processors
-	 */
-	BUG_ON(first_memblock_base != 0);
-
-	/*
-	 * Radix mode is not limited by RMA / VRMA addressing.
-	 */
-	ppc64_rma_size = ULONG_MAX;
-}
-
 #ifdef CONFIG_MEMORY_HOTPLUG
 static void free_pte_table(pte_t *pte_start, pmd_t *pmd)
 {
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 02e127fa5777..8459056cce67 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -433,9 +433,16 @@ void __init mmu_early_init_devtree(void)
 	if (!(mfmsr() & MSR_HV))
 		early_check_vec5();
 
-	if (early_radix_enabled())
+	if (early_radix_enabled()) {
 		radix__early_init_devtree();
-	else
+		/*
+		 * We have finalized the translation we are going to use by now.
+		 * Radix mode is not limited by RMA / VRMA addressing.
+		 * Hence don't limit memblock allocations.
+		 */
+		ppc64_rma_size = ULONG_MAX;
+		memblock_set_current_limit(MEMBLOCK_ALLOC_ANYWHERE);
+	} else
 		hash__early_init_devtree();
 }
 #endif /* CONFIG_PPC_BOOK3S_64 */
-- 
2.26.2

