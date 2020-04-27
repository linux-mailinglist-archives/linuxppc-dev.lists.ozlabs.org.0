Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EC91B9A4D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 10:33:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499dMT4rRxzDqbB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 18:33:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 499cm40XzKzDqTy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 18:05:55 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03R7XtoD039672; Mon, 27 Apr 2020 04:05:51 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mfhcna4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 04:05:51 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03R7XxPl040011;
 Mon, 27 Apr 2020 04:05:50 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mfhcna45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 04:05:50 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03R85OTk002876;
 Mon, 27 Apr 2020 08:05:49 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 30mcu6h9t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 08:05:49 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03R85lDg8979164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 08:05:47 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 611E4C6059;
 Mon, 27 Apr 2020 08:05:48 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D23BC6057;
 Mon, 27 Apr 2020 08:05:46 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.72.10])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 27 Apr 2020 08:05:45 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH 10/25] powerpc/book3s64/kuap: Move UAMOR setup to key init
 function
Date: Mon, 27 Apr 2020 13:34:51 +0530
Message-Id: <20200427080507.1626327-11-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200427080507.1626327-1-aneesh.kumar@linux.ibm.com>
References: <20200427080507.1626327-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_03:2020-04-24,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270067
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
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With hash translation, the kernel will use key 3 for implementing
KUAP feature. Hence the default UAMOR value depends on what other
keys are marked reserved. Move the UAMOR initialization to pkeys init.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/pkeys.h |  1 +
 arch/powerpc/kernel/smp.c        |  3 +++
 arch/powerpc/mm/book3s64/pkeys.c | 25 ++++++++++++++++++++-----
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index b1d448c53209..6e8157f78b52 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -12,6 +12,7 @@
 #include <asm/firmware.h>
 
 extern int max_pkey;
+extern u64 default_uamor;
 extern u32 reserved_allocation_mask; /* bits set for reserved keys */
 
 #define ARCH_VM_PKEY_FLAGS (VM_PKEY_BIT0 | VM_PKEY_BIT1 | VM_PKEY_BIT2 | \
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 6d2a3a3666f0..5d1e5489bcd2 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -59,6 +59,7 @@
 #include <asm/asm-prototypes.h>
 #include <asm/cpu_has_feature.h>
 #include <asm/ftrace.h>
+#include <asm/pkeys.h>
 
 #ifdef DEBUG
 #include <asm/udbg.h>
@@ -1256,6 +1257,8 @@ void start_secondary(void *unused)
 	mmgrab(&init_mm);
 	current->active_mm = &init_mm;
 
+	mtspr(SPRN_UAMOR, default_uamor);
+
 	smp_store_cpu_info(cpu);
 	set_dec(tb_ticks_per_jiffy);
 	preempt_disable();
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 727284607fa8..a0406ea32487 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -23,7 +23,7 @@ static u32  initial_allocation_mask;   /* Bits set for the initially allocated k
 static u64 default_amr;
 static u64 default_iamr;
 /* Allow all keys to be modified by default */
-static u64 default_uamor = ~0x0UL;
+u64 default_uamor = ~0x0UL;
 /*
  * Key used to implement PROT_EXEC mmap. Denies READ/WRITE
  * We pick key 2 because 0 is special key and 1 is reserved as per ISA.
@@ -112,8 +112,16 @@ void __init pkey_early_init_devtree(void)
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
@@ -195,6 +203,12 @@ void __init pkey_early_init_devtree(void)
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
 
@@ -230,8 +244,9 @@ void setup_kuap(bool disabled)
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
2.25.3

