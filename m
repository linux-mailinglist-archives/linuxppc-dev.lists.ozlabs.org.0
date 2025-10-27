Return-Path: <linuxppc-dev+bounces-13341-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C164C0ED9F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 16:14:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwH8p5QSjz3bsb;
	Tue, 28 Oct 2025 02:14:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761578042;
	cv=none; b=gcpNBgIGPV9DCnQKZMRASDROLDgR142TkWUlDsknpYh96D1seOgH325HJHbt0i8AvSsjFQzlj0KbjomV/DmozsSY4kovBhw4oWau3fgsas1zzrl27Yh3dL2dXj+7AGDU7jMdxHeygd8h/6tNaDqNKcxVFyxADv9KNfjjFfhVTGt5KvtbbSO7muEq8aa7qKAoRBawCAYdGfozIaYJ1H2giUiQs7WSav4baz1SxEXQezpHjVr3oZvea8LVbG28OM8Za/7r24pQT1Edge5In1ARybanDByCLS4pG9bcPHkU591kr23mibahwv7eh1WlD6a9fwxse054zURAiZa1ozOh0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761578042; c=relaxed/relaxed;
	bh=QuFulyoplT+7kTiv7+zfQ7k375mvG+Pukwox9IrWomc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PhH+crfEikkR2h00RDC7RxAvX3bH1IW8bDa76UB5ZSNZnfib+upQsgZbaYMOLBtuddVyOQpU3i1ad5HCs+Qcsc/9JaGsffsbhoVe1JH18jQh7VeH0aEYogUQPu1bdYzNf4691N2KhuFboIqgDv3RXL2yWtT5Z5hpfw4detkL0lf3TdYbA661GSiosHdrn6pB/xHqK6eCDDsswAQcKD2kEe1EfX2WAXfWkBFtwelzXMedrGh5tQlloQ62YhQHr6IMGsGolmX50clGxq/0djNZJMN343xkJeCkQOdEkGtVRuKbKLXGu7Bm+RTUQCjCj+/GzTOqgGxU8ziqzrUVBbrRuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IAWkwIDn; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IAWkwIDn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwH8n5mBgz2yyx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 02:14:01 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RCkIxR020055;
	Mon, 27 Oct 2025 15:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=QuFulyoplT+7kTiv7
	+zfQ7k375mvG+Pukwox9IrWomc=; b=IAWkwIDn9IMR4uMPG8K1uEYBei6hcR6B3
	MAGD9/FG5jHe8VNn5wXPY74apRXcb++S85eVUebR8/R3o1Y2f7ELi06B2LAG4JEl
	3L6XuMhPNTweAiBeSnmDqD5lllw/1UrFgteKKagVMZBE0VMVUu7DSmmidyGcDr14
	pD5ucflQsa5aI3L1DgpvPVaNKTJmbtal1cq7okx2aJZhiQrozvhdexnAqDACqY6m
	/6QRI2fbUx+jzIjnAzAo76VM9QwNFkvrYcgqRcFegybl0xYJyDECmi+xWeXcu3uq
	DHOVXRDE5kmD42kujgC9EjaEtVkZQ7My4aCcCKUaZXbgcP3+RpPWA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0kyt7j4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:13:53 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59RFDqWU003261;
	Mon, 27 Oct 2025 15:13:52 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0kyt7j4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:13:52 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59RCQcQf009379;
	Mon, 27 Oct 2025 15:13:52 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a1b3hwyfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 15:13:51 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59RFDmAx37159412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Oct 2025 15:13:48 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CAAE2004B;
	Mon, 27 Oct 2025 15:13:48 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71EDB20040;
	Mon, 27 Oct 2025 15:13:46 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Oct 2025 15:13:46 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: [PATCH 1/4] powerpc/mmu: do MMU type discovery before crashkernel reservation
Date: Mon, 27 Oct 2025 20:43:35 +0530
Message-ID: <20251027151338.819957-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027151338.819957-1-sourabhjain@linux.ibm.com>
References: <20251027151338.819957-1-sourabhjain@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QbWrPqL6noaY1x-WKsef_cgfmWwU9Pvx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAwMSBTYWx0ZWRfX+OmOXtP3jyb9
 Z7qr3IXxGNhgigFQFzKzDtStXVNQ/EFvMRpF5+D1aQ03xV1lxGUsEiZNoSnU421NHz/Oy17Vq2M
 srvJbVIjvVuSwsN+7xvG5JvoGJoLRmu4wDb63pbQNe3vXivODvY4UILIUE3XAgaelHMK3hfzWWM
 H7Nl68quIV23C1CQa0kCHpl4DjwGMuthHgdF8WU8cbG2wgUefsppppxeuCQaOio3fMOVFwR1PLQ
 MuzeHxjQKlsd91jTbmSbCf/bFjiZC9sruLqK59ug2OJbJQF+szAQ36/3NCpxN4ZfT3q2kl4W9zh
 NJaP1ztV67aS2K89EaqMfxVvR/pYBmMa15NyBUJmz5x4MqvaSrJH24iVQcNKNyp2Pp8Gt9C7Ubo
 4rqzQE3fvUAUHMFPoCYxwR0c8T443g==
X-Proofpoint-GUID: diRAB5EchHdYTSTsFhjSBvLoLK_1bMCf
X-Authority-Analysis: v=2.4 cv=FaE6BZ+6 c=1 sm=1 tr=0 ts=68ff8c31 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8
 a=pGLkceISAAAA:8 a=-o-kazUmVXvP5PRTSMQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510250001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Crashkernel reservation on high memory depends on the MMU type, so
finalize the MMU type before calling arch_reserve_crashkernel().

With the changes introduced here, early_radix_enabled() becomes usable
and will be used in arch_reserve_crashkernel() in the upcoming patch.

early_radix_enabled() depends on cur_cpu_spec->mmu_features to find
out if the radix MMU is enabled. The radix MMU bit in mmu_features is
discovered from the FDT and kernel configs. To make sure the MMU type is
finalized before arch_reserve_crashkernel() is called, the function that
scans the FDT and sets mmu_features, along with some bits from
mmu_early_type_finalize(), has been moved above
arch_reserve_crashkernel().

Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h |  1 +
 arch/powerpc/include/asm/mmu.h           |  1 +
 arch/powerpc/kernel/prom.c               | 28 +++++++++++++-----------
 arch/powerpc/mm/init_64.c                | 27 ++++++++++++++---------
 4 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 48631365b48c..7a3b2ff02041 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -208,6 +208,7 @@ extern int mmu_vmemmap_psize;
 
 /* MMU initialization */
 void mmu_early_init_devtree(void);
+void mmu_early_type_finalize(void);
 void hash__early_init_devtree(void);
 void radix__early_init_devtree(void);
 #ifdef CONFIG_PPC_PKEY
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 5f9c5d436e17..c40dc6349e55 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -384,6 +384,7 @@ extern void early_init_mmu_secondary(void);
 extern void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 				       phys_addr_t first_memblock_size);
 static inline void mmu_early_init_devtree(void) { }
+static inline void mmu_early_type_finalize(void) { }
 
 static inline void pkey_early_init_devtree(void) {}
 
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 9ed9dde7d231..db1615f26075 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -853,6 +853,21 @@ void __init early_init_devtree(void *params)
 	if (PHYSICAL_START > MEMORY_START)
 		memblock_reserve(MEMORY_START, int_vector_size);
 	reserve_kdump_trampoline();
+
+	DBG("Scanning CPUs ...\n");
+
+	dt_cpu_ftrs_scan();
+
+	/* Retrieve CPU related informations from the flat tree
+	 * (altivec support, boot CPU ID, ...)
+	 */
+	of_scan_flat_dt(early_init_dt_scan_cpus, NULL);
+	if (boot_cpuid < 0) {
+		printk("Failed to identify boot CPU !\n");
+		BUG();
+	}
+
+	mmu_early_type_finalize();
 #if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
 	/*
 	 * If we fail to reserve memory for firmware-assisted dump then
@@ -884,19 +899,6 @@ void __init early_init_devtree(void *params)
 	 * FIXME .. and the initrd too? */
 	move_device_tree();
 
-	DBG("Scanning CPUs ...\n");
-
-	dt_cpu_ftrs_scan();
-
-	/* Retrieve CPU related informations from the flat tree
-	 * (altivec support, boot CPU ID, ...)
-	 */
-	of_scan_flat_dt(early_init_dt_scan_cpus, NULL);
-	if (boot_cpuid < 0) {
-		printk("Failed to identify boot CPU !\n");
-		BUG();
-	}
-
 	save_fscr_to_task();
 
 #if defined(CONFIG_SMP) && defined(CONFIG_PPC64)
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index b6f3ae03ca9e..cd52c1baa3bc 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -622,8 +622,10 @@ static void __init early_init_memory_block_size(void)
 	of_scan_flat_dt(probe_memory_block_size, &memory_block_size);
 }
 
-void __init mmu_early_init_devtree(void)
+
+void __init mmu_early_type_finalize(void)
 {
+
 	bool hvmode = !!(mfmsr() & MSR_HV);
 
 	/* Disable radix mode based on kernel command line. */
@@ -634,6 +636,20 @@ void __init mmu_early_init_devtree(void)
 			pr_warn("WARNING: Ignoring cmdline option disable_radix\n");
 	}
 
+	/*
+	 * Check /chosen/ibm,architecture-vec-5 if running as a guest.
+	 * When running bare-metal, we can use radix if we like
+	 * even though the ibm,architecture-vec-5 property created by
+	 * skiboot doesn't have the necessary bits set.
+	 */
+	if (!hvmode)
+		early_check_vec5();
+}
+
+void __init mmu_early_init_devtree(void)
+{
+	bool hvmode = !!(mfmsr() & MSR_HV);
+
 	of_scan_flat_dt(dt_scan_mmu_pid_width, NULL);
 	if (hvmode && !mmu_lpid_bits) {
 		if (early_cpu_has_feature(CPU_FTR_ARCH_207S))
@@ -646,15 +662,6 @@ void __init mmu_early_init_devtree(void)
 			mmu_pid_bits = 20; /* POWER9-10 */
 	}
 
-	/*
-	 * Check /chosen/ibm,architecture-vec-5 if running as a guest.
-	 * When running bare-metal, we can use radix if we like
-	 * even though the ibm,architecture-vec-5 property created by
-	 * skiboot doesn't have the necessary bits set.
-	 */
-	if (!hvmode)
-		early_check_vec5();
-
 	early_init_memory_block_size();
 
 	if (early_radix_enabled()) {
-- 
2.51.0


