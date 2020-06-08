Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E24B41F170F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 12:56:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gVYm3zgvzDqHH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 20:56:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gVPW4lB0zDqR1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 20:49:35 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 058AWaJb042329
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Jun 2020 06:49:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31g59ra658-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jun 2020 06:49:31 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 058AWktr045689
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Jun 2020 06:49:30 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31g59ra644-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 06:49:30 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 058AjAkN030895;
 Mon, 8 Jun 2020 10:49:29 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 31g2s81hvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 10:49:28 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 058AnP1W61735020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jun 2020 10:49:26 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC8E84C04A;
 Mon,  8 Jun 2020 10:49:25 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB9EC4C04E;
 Mon,  8 Jun 2020 10:49:24 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.48.183])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jun 2020 10:49:24 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v0 1/4] powerpc/mm: Make GTSE as MMU FTR
Date: Mon,  8 Jun 2020 16:19:06 +0530
Message-Id: <20200608104909.14350-2-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608104909.14350-1-bharata@linux.ibm.com>
References: <20200608104909.14350-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_07:2020-06-08,
 2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 cotscore=-2147483648 bulkscore=0
 suspectscore=1 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080077
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make GTSE as an MMU feature and enable it by default for radix.
However for guest, conditionally enable it if hypervisor supports it
via OV5 vector.

Making GTSE as a MMU feature will make it easy to enable radix
without GTSE.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/include/asm/mmu.h    | 4 ++++
 arch/powerpc/kernel/dt_cpu_ftrs.c | 2 ++
 arch/powerpc/mm/init_64.c         | 6 +++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

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
index 3a409517c031..571aa39e35d5 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -337,6 +337,8 @@ static int __init feat_enable_mmu_radix(struct dt_cpu_feature *f)
 #ifdef CONFIG_PPC_RADIX_MMU
 	cur_cpu_spec->mmu_features |= MMU_FTR_TYPE_RADIX;
 	cur_cpu_spec->mmu_features |= MMU_FTRS_HASH_BASE;
+	/* TODO: Does this need a separate cpu dt feature? */
+	cur_cpu_spec->mmu_features |= MMU_FTR_GTSE;
 	cur_cpu_spec->cpu_user_features |= PPC_FEATURE_HAS_MMU;
 
 	return 1;
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index c7ce4ec5060e..feb9bed9177c 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -408,13 +408,17 @@ static void __init early_check_vec5(void)
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
+
 }
 
 void __init mmu_early_init_devtree(void)
-- 
2.21.3

