Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4119820B257
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 15:19:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tctV0qLwzDqtt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:19:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tcgc36MrzDqsG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 23:10:20 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05QD4YBT114975; Fri, 26 Jun 2020 09:10:14 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31vbn8asj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 09:10:13 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05QD57Wv117423;
 Fri, 26 Jun 2020 09:10:12 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31vbn8asfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 09:10:12 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05QD2J6R030323;
 Fri, 26 Jun 2020 13:10:08 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 31uusjjypd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 13:10:08 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05QDA5h05702058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jun 2020 13:10:05 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7807A4067;
 Fri, 26 Jun 2020 13:10:05 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 905A0A405C;
 Fri, 26 Jun 2020 13:10:04 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.37.181])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jun 2020 13:10:04 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/3] powerpc/mm: Enable radix GTSE only if supported.
Date: Fri, 26 Jun 2020 18:39:58 +0530
Message-Id: <20200626131000.5207-2-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200626131000.5207-1-bharata@linux.ibm.com>
References: <20200626131000.5207-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-26_06:2020-06-26,
 2020-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 cotscore=-2147483648 suspectscore=1 bulkscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006260091
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
Cc: aneesh.kumar@linux.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make GTSE an MMU feature and enable it by default for radix.
However for guest, conditionally enable it if hypervisor supports
it via OV5 vector. Let prom_init ask for radix GTSE only if the
support exists.

Having GTSE as an MMU feature will make it easy to enable radix
without GTSE. Currently radix assumes GTSE is enabled by default.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/include/asm/mmu.h    |  4 ++++
 arch/powerpc/kernel/dt_cpu_ftrs.c |  1 +
 arch/powerpc/kernel/prom_init.c   | 13 ++++++++-----
 arch/powerpc/mm/init_64.c         |  5 ++++-
 4 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index f4ac25d4df05..884d51995934 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -28,6 +28,9 @@
  * Individual features below.
  */
 
+/* Guest Translation Shootdown Enable */
+#define MMU_FTR_GTSE			ASM_CONST(0x00001000)
+
 /*
  * Support for 68 bit VA space. We added that from ISA 2.05
  */
@@ -173,6 +176,7 @@ enum {
 #endif
 #ifdef CONFIG_PPC_RADIX_MMU
 		MMU_FTR_TYPE_RADIX |
+		MMU_FTR_GTSE |
 #ifdef CONFIG_PPC_KUAP
 		MMU_FTR_RADIX_KUAP |
 #endif /* CONFIG_PPC_KUAP */
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index a0edeb391e3e..ac650c233cd9 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -336,6 +336,7 @@ static int __init feat_enable_mmu_radix(struct dt_cpu_feature *f)
 #ifdef CONFIG_PPC_RADIX_MMU
 	cur_cpu_spec->mmu_features |= MMU_FTR_TYPE_RADIX;
 	cur_cpu_spec->mmu_features |= MMU_FTRS_HASH_BASE;
+	cur_cpu_spec->mmu_features |= MMU_FTR_GTSE;
 	cur_cpu_spec->cpu_user_features |= PPC_FEATURE_HAS_MMU;
 
 	return 1;
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 90c604d00b7d..cbc605cfdec0 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1336,12 +1336,15 @@ static void __init prom_check_platform_support(void)
 		}
 	}
 
-	if (supported.radix_mmu && supported.radix_gtse &&
-	    IS_ENABLED(CONFIG_PPC_RADIX_MMU)) {
-		/* Radix preferred - but we require GTSE for now */
-		prom_debug("Asking for radix with GTSE\n");
+	if (supported.radix_mmu && IS_ENABLED(CONFIG_PPC_RADIX_MMU)) {
+		/* Radix preferred - Check if GTSE is also supported */
+		prom_debug("Asking for radix\n");
 		ibm_architecture_vec.vec5.mmu = OV5_FEAT(OV5_MMU_RADIX);
-		ibm_architecture_vec.vec5.radix_ext = OV5_FEAT(OV5_RADIX_GTSE);
+		if (supported.radix_gtse)
+			ibm_architecture_vec.vec5.radix_ext =
+					OV5_FEAT(OV5_RADIX_GTSE);
+		else
+			prom_debug("Radix GTSE isn't supported\n");
 	} else if (supported.hash_mmu) {
 		/* Default to hash mmu (if we can) */
 		prom_debug("Asking for hash\n");
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index bc73abf0bc25..152aa0200cef 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -407,12 +407,15 @@ static void __init early_check_vec5(void)
 		if (!(vec5[OV5_INDX(OV5_RADIX_GTSE)] &
 						OV5_FEAT(OV5_RADIX_GTSE))) {
 			pr_warn("WARNING: Hypervisor doesn't support RADIX with GTSE\n");
-		}
+			cur_cpu_spec->mmu_features &= ~MMU_FTR_GTSE;
+		} else
+			cur_cpu_spec->mmu_features |= MMU_FTR_GTSE;
 		/* Do radix anyway - the hypervisor said we had to */
 		cur_cpu_spec->mmu_features |= MMU_FTR_TYPE_RADIX;
 	} else if (mmu_supported == OV5_FEAT(OV5_MMU_HASH)) {
 		/* Hypervisor only supports hash - disable radix */
 		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
+		cur_cpu_spec->mmu_features &= ~MMU_FTR_GTSE;
 	}
 }
 
-- 
2.21.3

