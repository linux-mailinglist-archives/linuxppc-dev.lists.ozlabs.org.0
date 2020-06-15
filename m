Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEC41F8EC9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 08:55:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lht83RP5zDqQM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 16:55:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lh0P61BmzDqPb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 16:15:49 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F62Ikk151107; Mon, 15 Jun 2020 02:15:45 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31n45c8j8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 02:15:45 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05F6Ew1t031725;
 Mon, 15 Jun 2020 06:15:43 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 31mpe9919h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 06:15:43 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05F6Ffia46858664
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 06:15:41 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7BF9C6055;
 Mon, 15 Jun 2020 06:15:41 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E367C605F;
 Mon, 15 Jun 2020 06:15:39 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.2.91])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 06:15:39 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 21/41] powerpc/book3s64/kuap: Move UAMOR setup to key init
 function
Date: Mon, 15 Jun 2020 11:44:10 +0530
Message-Id: <20200615061430.770174-22-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
References: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-12,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0 impostorscore=0
 clxscore=1015 cotscore=-2147483648 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150050
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With hash translation, the kernel will use key 3 for implementing
KUAP feature. Hence the default UAMOR value depends on what other
keys are marked reserved. Move the UAMOR initialization to pkeys init.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h |  2 ++
 arch/powerpc/kernel/smp.c                |  5 +++++
 arch/powerpc/mm/book3s64/pkeys.c         | 25 +++++++++++++++++++-----
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index aa2787c8b12a..e6ee1c34842f 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -67,6 +67,8 @@
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
+extern u64 default_uamor;
+
 static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
 {
 	if (mmu_has_feature(MMU_FTR_KUAP) && unlikely(regs->kuap != amr)) {
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index c820c95162ff..eec40082599f 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -59,6 +59,7 @@
 #include <asm/asm-prototypes.h>
 #include <asm/cpu_has_feature.h>
 #include <asm/ftrace.h>
+#include <asm/kup.h>
 
 #ifdef DEBUG
 #include <asm/udbg.h>
@@ -1256,6 +1257,10 @@ void start_secondary(void *unused)
 	mmgrab(&init_mm);
 	current->active_mm = &init_mm;
 
+#ifdef CONFIG_PPC_MEM_KEYS
+	mtspr(SPRN_UAMOR, default_uamor);
+#endif
+
 	smp_store_cpu_info(cpu);
 	set_dec(tb_ticks_per_jiffy);
 	preempt_disable();
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index ad3348b7e25c..4a7d05c1a9c7 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -24,7 +24,7 @@ static u32  initial_allocation_mask;   /* Bits set for the initially allocated k
 static u64 default_amr;
 static u64 default_iamr;
 /* Allow all keys to be modified by default */
-static u64 default_uamor = ~0x0UL;
+u64 default_uamor = ~0x0UL;
 /*
  * Key used to implement PROT_EXEC mmap. Denies READ/WRITE
  * We pick key 2 because 0 is special key and 1 is reserved as per ISA.
@@ -113,8 +113,16 @@ void __init pkey_early_init_devtree(void)
 	/* scan the device tree for pkey feature */
 	pkeys_total = scan_pkey_feature();
 	if (!pkeys_total) {
-		/* No support for pkey. Mark it disabled */
-		return;
+		/*
+		 * No key support but on radix we can use key 0
+		 * to implement kuap.
+		 */
+		if (early_radix_enabled())
+			/*
+			 * Make sure userspace can't change the AMR
+			 */
+			default_uamor = 0;
+		goto err_out;
 	}
 
 	cur_cpu_spec->mmu_features |= MMU_FTR_PKEY;
@@ -196,6 +204,12 @@ void __init pkey_early_init_devtree(void)
 	 */
 	initial_allocation_mask |= reserved_allocation_mask;
 
+err_out:
+	/*
+	 * Setup uamor on boot cpu
+	 */
+	mtspr(SPRN_UAMOR, default_uamor);
+
 	return;
 }
 
@@ -231,8 +245,9 @@ void __init setup_kuap(bool disabled)
 		cur_cpu_spec->mmu_features |= MMU_FTR_KUAP;
 	}
 
-	/* Make sure userspace can't change the AMR */
-	mtspr(SPRN_UAMOR, 0);
+	/*
+	 * Set the default kernel AMR values on all cpus.
+	 */
 	mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
 	isync();
 }
-- 
2.26.2

