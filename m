Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADB298A15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 05:59:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DW4g50YmzDqRs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 13:59:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DVrm44DYzDr3t
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 13:49:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46DVrl6r07z8t5T
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 13:49:11 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46DVrl081Tz9sN1; Thu, 22 Aug 2019 13:49:11 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46DVrj750pz9sDQ;
 Thu, 22 Aug 2019 13:49:09 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7M3mpWw027689; Wed, 21 Aug 2019 23:49:08 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhjx5ru0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2019 23:49:07 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7M3iRpT030499;
 Thu, 22 Aug 2019 03:49:07 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2ue9770nek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2019 03:49:06 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7M3n5Hf35193314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 03:49:05 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B56DC605F;
 Thu, 22 Aug 2019 03:49:05 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59F76C6057;
 Thu, 22 Aug 2019 03:49:01 +0000 (GMT)
Received: from rino.ibm.com (unknown [9.80.203.17])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 03:49:01 +0000 (GMT)
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v6 5/7] powerpc/mm: Write to PTCR only if ultravisor disabled
Date: Thu, 22 Aug 2019 00:48:36 -0300
Message-Id: <20190822034838.27876-6-cclaudio@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822034838.27876-1-cclaudio@linux.ibm.com>
References: <20190822034838.27876-1-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=990 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220037
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Guerney Hunt <gdhh@linux.ibm.com>, Thiago Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In ultravisor enabled systems, PTCR becomes ultravisor privileged only
for writing and an attempt to write to it will cause a Hypervisor
Emulation Assitance interrupt.

This patch uses the set_ptcr_when_no_uv() function to restrict PTCR
writing to only when ultravisor is disabled.

Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
---
 arch/powerpc/include/asm/ultravisor.h    | 12 ++++++++++++
 arch/powerpc/mm/book3s64/hash_utils.c    |  5 +++--
 arch/powerpc/mm/book3s64/pgtable.c       |  2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c |  8 +++++---
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
index 6fe1f365dec8..d7aa97aa7834 100644
--- a/arch/powerpc/include/asm/ultravisor.h
+++ b/arch/powerpc/include/asm/ultravisor.h
@@ -10,10 +10,22 @@
 
 #include <asm/asm-prototypes.h>
 #include <asm/ultravisor-api.h>
+#include <asm/firmware.h>
 
 int early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
 				  int depth, void *data);
 
+/*
+ * In ultravisor enabled systems, PTCR becomes ultravisor privileged only for
+ * writing and an attempt to write to it will cause a Hypervisor Emulation
+ * Assistance interrupt.
+ */
+static inline void set_ptcr_when_no_uv(u64 val)
+{
+	if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
+		mtspr(SPRN_PTCR, val);
+}
+
 static inline int uv_register_pate(u64 lpid, u64 dw0, u64 dw1)
 {
 	return ucall_norets(UV_WRITE_PATE, lpid, dw0, dw1);
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index c3bfef08dcf8..4d0bb194ed70 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -62,6 +62,7 @@
 #include <asm/ps3.h>
 #include <asm/pte-walk.h>
 #include <asm/asm-prototypes.h>
+#include <asm/ultravisor.h>
 
 #include <mm/mmu_decl.h>
 
@@ -1076,8 +1077,8 @@ void hash__early_init_mmu_secondary(void)
 		if (!cpu_has_feature(CPU_FTR_ARCH_300))
 			mtspr(SPRN_SDR1, _SDR1);
 		else
-			mtspr(SPRN_PTCR,
-			      __pa(partition_tb) | (PATB_SIZE_SHIFT - 12));
+			set_ptcr_when_no_uv(__pa(partition_tb) |
+					    (PATB_SIZE_SHIFT - 12));
 	}
 	/* Initialize SLB */
 	slb_initialize();
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 4173f6931009..01a7570c10e0 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -207,7 +207,7 @@ void __init mmu_partition_table_init(void)
 	 * 64 K size.
 	 */
 	ptcr = __pa(partition_tb) | (PATB_SIZE_SHIFT - 12);
-	mtspr(SPRN_PTCR, ptcr);
+	set_ptcr_when_no_uv(ptcr);
 	powernv_set_nmmu_ptcr(ptcr);
 }
 
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 2204d8eeb784..ec3560b96177 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -27,6 +27,7 @@
 #include <asm/sections.h>
 #include <asm/trace.h>
 #include <asm/uaccess.h>
+#include <asm/ultravisor.h>
 
 #include <trace/events/thp.h>
 
@@ -650,8 +651,9 @@ void radix__early_init_mmu_secondary(void)
 		lpcr = mfspr(SPRN_LPCR);
 		mtspr(SPRN_LPCR, lpcr | LPCR_UPRT | LPCR_HR);
 
-		mtspr(SPRN_PTCR,
-		      __pa(partition_tb) | (PATB_SIZE_SHIFT - 12));
+		set_ptcr_when_no_uv(__pa(partition_tb) |
+				    (PATB_SIZE_SHIFT - 12));
+
 		radix_init_amor();
 	}
 
@@ -667,7 +669,7 @@ void radix__mmu_cleanup_all(void)
 	if (!firmware_has_feature(FW_FEATURE_LPAR)) {
 		lpcr = mfspr(SPRN_LPCR);
 		mtspr(SPRN_LPCR, lpcr & ~LPCR_UPRT);
-		mtspr(SPRN_PTCR, 0);
+		set_ptcr_when_no_uv(0);
 		powernv_set_nmmu_ptcr(0);
 		radix__flush_tlb_all();
 	}
-- 
2.20.1

