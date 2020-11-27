Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5042C5F5A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 05:57:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj2RX35C4zDrfZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 15:57:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=S4Rcu2XO; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cj29R2XxrzDrVW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 15:44:59 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AR4ViMs103350; Thu, 26 Nov 2020 23:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hA+ykBZwNqG/bC+c2jvI+KvybiWAjbwO0MJumNdE+pI=;
 b=S4Rcu2XOagllDfw5pN0ORWJBUVjICzTAC3WetoI1eKiuAebusy8vLN7LhsLewlgS68mg
 i0lK2aRvIk/0Ouecd7jZf9ekvzo5zH0p1grmtEX+DBnjA2h7969JpZLokE3OhoWBEf3/
 eEvB3J7qytJoDkAlsHA9A2f6HgarJPSwYF8joc7R+hOP1QtGGl0AxAsumeas+uxdsqjR
 DR11sgqezEKOPqSOOL9/0KCiiGsnBULFW58AnonqIREke8Dt4uCwJ8XV4+5pxMRumHAz
 O+pxY9V4eqjyubbEXLD0WVYu/UFezs4E2kJeUJ4kEpC22EW3Fh6Dr4aOjAsg6IWTxPs9 mg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352qs9bg3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 23:44:50 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AR4gM4Y002975;
 Fri, 27 Nov 2020 04:44:49 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 34xtha6wnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 04:44:49 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AR4imc312976610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 04:44:48 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27BC86E04E;
 Fri, 27 Nov 2020 04:44:48 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D88F36E053;
 Fri, 27 Nov 2020 04:44:45 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.45.115])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 27 Nov 2020 04:44:45 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 06/22] powerpc/book3s64/kuep: Move KUEP related function
 outside radix
Date: Fri, 27 Nov 2020 10:14:08 +0530
Message-Id: <20201127044424.40686-7-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
References: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_01:2020-11-26,
 2020-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011270021
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The next set of patches adds support for kuep with hash translation.
In preparation for that rename/move kuap related functions to
non radix names.

Also set MMU_FTR_KUEP and add the missing isync().

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h |  1 +
 arch/powerpc/mm/book3s64/pkeys.c         | 21 +++++++++++++++++++++
 arch/powerpc/mm/book3s64/radix_pgtable.c | 20 --------------------
 3 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 56dbe3666dc8..39d2e3a0d64d 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -7,6 +7,7 @@
 
 #define AMR_KUAP_BLOCK_READ	UL(0x4000000000000000)
 #define AMR_KUAP_BLOCK_WRITE	UL(0x8000000000000000)
+#define AMR_KUEP_BLOCKED	(1UL << 62)
 #define AMR_KUAP_BLOCKED	(AMR_KUAP_BLOCK_READ | AMR_KUAP_BLOCK_WRITE)
 #define AMR_KUAP_SHIFT		62
 
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index c75994cf50a7..82c722fbce52 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -229,6 +229,27 @@ void __init pkey_early_init_devtree(void)
 	return;
 }
 
+#ifdef CONFIG_PPC_KUEP
+void __init setup_kuep(bool disabled)
+{
+	if (disabled || !early_radix_enabled())
+		return;
+
+	if (smp_processor_id() == boot_cpuid) {
+		pr_info("Activating Kernel Userspace Execution Prevention\n");
+		cur_cpu_spec->mmu_features |= MMU_FTR_KUEP;
+	}
+
+	/*
+	 * Radix always uses key0 of the IAMR to determine if an access is
+	 * allowed. We set bit 0 (IBM bit 1) of key0, to prevent instruction
+	 * fetch.
+	 */
+	mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
+	isync();
+}
+#endif
+
 #ifdef CONFIG_PPC_KUAP
 void __init setup_kuap(bool disabled)
 {
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index fe2c26dbcb28..98f0b243c1ab 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -589,26 +589,6 @@ static void radix_init_amor(void)
 	mtspr(SPRN_AMOR, (3ul << 62));
 }
 
-#ifdef CONFIG_PPC_KUEP
-void setup_kuep(bool disabled)
-{
-	if (disabled || !early_radix_enabled())
-		return;
-
-	if (smp_processor_id() == boot_cpuid) {
-		pr_info("Activating Kernel Userspace Execution Prevention\n");
-		cur_cpu_spec->mmu_features |= MMU_FTR_KUEP;
-	}
-
-	/*
-	 * Radix always uses key0 of the IAMR to determine if an access is
-	 * allowed. We set bit 0 (IBM bit 1) of key0, to prevent instruction
-	 * fetch.
-	 */
-	mtspr(SPRN_IAMR, (1ul << 62));
-}
-#endif
-
 void __init radix__early_init_mmu(void)
 {
 	unsigned long lpcr;
-- 
2.28.0

