Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2752C7263B2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 17:08:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbrLj6Wthz3dy0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 01:07:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sTFo6bg6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sTFo6bg6;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbrKn036vz3ch8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 01:07:08 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 357EikRY006345;
	Wed, 7 Jun 2023 15:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=WoWnY5OlcOlfAy0oKMyGUvUcDzL5jYRQ6LgR5eVqANY=;
 b=sTFo6bg6oh6JaioAT8Y4r6UCB1F5ki0oPWpTjb1pJ4jsMQfQv8714dT+lfgMy2CEC624
 g/HRq/2sncdorEL039A6Uf+p+J6KoLvQ+L/tTR8bLIZAn4oXEjWzW85xNYCa6PobKnrr
 oVLhCkQfMUioRD7RcmH12vTI/1cnAJhYP6ABMl7e+ITK1TFZ7ccFFaPOmRjSVzZHIjCt
 EpyfTuvTOv8vRfYMUaPtAJWyiTzGZ/suRjxZHh9FYNADA2Gd448z+x6EkQcYEfiPP55R
 U88gcWvIbdgitDk00+xf6j25HYXlmANTdAhj8PKJdyKIVjavcJGe7XQ0U8PR5J0nDctN iA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2uww8p2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 15:07:01 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 357EilqT006353;
	Wed, 7 Jun 2023 15:07:00 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2uww8p2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 15:07:00 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 357EJeh2032105;
	Wed, 7 Jun 2023 15:02:00 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3r2a76pe0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 15:02:00 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 357F1wep14942574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jun 2023 15:01:58 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62BBA58060;
	Wed,  7 Jun 2023 15:01:58 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01C565803F;
	Wed,  7 Jun 2023 15:01:56 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.4.27])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jun 2023 15:01:55 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 1/2] powerpc/book3s64/mm: Remove radix_mem_block_size
Date: Wed,  7 Jun 2023 20:31:49 +0530
Message-Id: <20230607150150.237788-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1g0IQ2zh7a42N94cUWQFjsmmb4TWgGI1
X-Proofpoint-ORIG-GUID: BlNooEqtR0fVY1nemDThMahzAzyMWlCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_07,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070128
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, foraker1@llnl.gov
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Simplify powernv memory_block_size call back by directly using 1G value
instead of using radix_mem_block_size. Also, remove the variable and use
memory_block_size_bytes() in the kernel mapping function. This gets called
in radix__early_init_mmu() which is called after probe_machine is called
and correct machine-specific callback is assigned.

No functional change in this patch.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h |  5 --
 arch/powerpc/mm/book3s64/radix_pgtable.c | 64 +-----------------------
 arch/powerpc/platforms/powernv/setup.c   |  4 +-
 3 files changed, 3 insertions(+), 70 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 570a4960cf17..7b7643f32e0e 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -71,11 +71,6 @@ extern unsigned int mmu_pid_bits;
 /* Base PID to allocate from */
 extern unsigned int mmu_base_pid;
 
-/*
- * memory block size used with radix translation.
- */
-extern unsigned long __ro_after_init radix_mem_block_size;
-
 #define PRTB_SIZE_SHIFT	(mmu_pid_bits + 4)
 #define PRTB_ENTRIES	(1ul << mmu_pid_bits)
 
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 2297aa764ecd..905cfa0af1ae 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -37,7 +37,6 @@
 #include <mm/mmu_decl.h>
 
 unsigned int mmu_base_pid;
-unsigned long radix_mem_block_size __ro_after_init;
 
 static __ref void *early_alloc_pgtable(unsigned long size, int nid,
 			unsigned long region_start, unsigned long region_end)
@@ -300,7 +299,7 @@ static int __meminit create_physical_mapping(unsigned long start,
 	bool prev_exec, exec = false;
 	pgprot_t prot;
 	int psize;
-	unsigned long max_mapping_size = radix_mem_block_size;
+	unsigned long max_mapping_size = memory_block_size_bytes();
 
 	if (debug_pagealloc_enabled_or_kfence())
 		max_mapping_size = PAGE_SIZE;
@@ -502,58 +501,6 @@ static int __init radix_dt_scan_page_sizes(unsigned long node,
 	return 1;
 }
 
-#ifdef CONFIG_MEMORY_HOTPLUG
-static int __init probe_memory_block_size(unsigned long node, const char *uname, int
-					  depth, void *data)
-{
-	unsigned long *mem_block_size = (unsigned long *)data;
-	const __be32 *prop;
-	int len;
-
-	if (depth != 1)
-		return 0;
-
-	if (strcmp(uname, "ibm,dynamic-reconfiguration-memory"))
-		return 0;
-
-	prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
-
-	if (!prop || len < dt_root_size_cells * sizeof(__be32))
-		/*
-		 * Nothing in the device tree
-		 */
-		*mem_block_size = MIN_MEMORY_BLOCK_SIZE;
-	else
-		*mem_block_size = of_read_number(prop, dt_root_size_cells);
-	return 1;
-}
-
-static unsigned long __init radix_memory_block_size(void)
-{
-	unsigned long mem_block_size = MIN_MEMORY_BLOCK_SIZE;
-
-	/*
-	 * OPAL firmware feature is set by now. Hence we are ok
-	 * to test OPAL feature.
-	 */
-	if (firmware_has_feature(FW_FEATURE_OPAL))
-		mem_block_size = 1UL * 1024 * 1024 * 1024;
-	else
-		of_scan_flat_dt(probe_memory_block_size, &mem_block_size);
-
-	return mem_block_size;
-}
-
-#else   /* CONFIG_MEMORY_HOTPLUG */
-
-static unsigned long __init radix_memory_block_size(void)
-{
-	return 1UL * 1024 * 1024 * 1024;
-}
-
-#endif /* CONFIG_MEMORY_HOTPLUG */
-
-
 void __init radix__early_init_devtree(void)
 {
 	int rc;
@@ -578,15 +525,6 @@ void __init radix__early_init_devtree(void)
 			psize_to_rpti_pgsize(MMU_PAGE_64K);
 	}
 
-	/*
-	 * Max mapping size used when mapping pages. We don't use
-	 * ppc_md.memory_block_size() here because this get called
-	 * early and we don't have machine probe called yet. Also
-	 * the pseries implementation only check for ibm,lmb-size.
-	 * All hypervisor supporting radix do expose that device
-	 * tree node.
-	 */
-	radix_mem_block_size = radix_memory_block_size();
 	return;
 }
 
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 5e9c6b55809f..29f855c66ad3 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -488,9 +488,9 @@ static unsigned long pnv_memory_block_size(void)
 	 * this size.
 	 */
 	if (radix_enabled())
-		return radix_mem_block_size;
+		return 1UL << 30;
 	else
-		return 256UL * 1024 * 1024;
+		return 256UL << 20;
 }
 #endif
 
-- 
2.40.1

