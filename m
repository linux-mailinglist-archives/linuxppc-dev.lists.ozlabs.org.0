Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BA41FF8EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 18:13:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nn6c4cRFzDq9H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 02:13:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nn2W1WmxzDrHp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 02:09:54 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05IG4e2K190001; Thu, 18 Jun 2020 12:09:49 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31r2vnrhfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 12:09:49 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05IG7i7T024580;
 Thu, 18 Jun 2020 12:09:48 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31r2vnrheq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 12:09:48 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05IG5Ckf024017;
 Thu, 18 Jun 2020 16:09:47 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 31r0u9gcjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 16:09:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05IG9h2o5636584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jun 2020 16:09:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53CE6A405C;
 Thu, 18 Jun 2020 16:09:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 217D8A4054;
 Thu, 18 Jun 2020 16:09:42 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.46.230])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jun 2020 16:09:41 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 1/5] powerpc/mm: Make GTSE an MMU FTR
Date: Thu, 18 Jun 2020 21:39:26 +0530
Message-Id: <20200618160930.26324-2-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200618160930.26324-1-bharata@linux.ibm.com>
References: <20200618160930.26324-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_14:2020-06-18,
 2020-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 cotscore=-2147483648 priorityscore=1501
 suspectscore=1 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006180118
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
it via OV5 vector.

Having GTSE as an MMU feature will make it easy to enable radix
without GTSE. Currently radix assumes GTSE is enabled by default.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/include/asm/mmu.h    | 4 ++++
 arch/powerpc/kernel/dt_cpu_ftrs.c | 1 +
 arch/powerpc/mm/init_64.c         | 5 ++++-
 3 files changed, 9 insertions(+), 1 deletion(-)

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
index 3a409517c031..fcb815b3a84d 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -337,6 +337,7 @@ static int __init feat_enable_mmu_radix(struct dt_cpu_feature *f)
 #ifdef CONFIG_PPC_RADIX_MMU
 	cur_cpu_spec->mmu_features |= MMU_FTR_TYPE_RADIX;
 	cur_cpu_spec->mmu_features |= MMU_FTRS_HASH_BASE;
+	cur_cpu_spec->mmu_features |= MMU_FTR_GTSE;
 	cur_cpu_spec->cpu_user_features |= PPC_FEATURE_HAS_MMU;
 
 	return 1;
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index c7ce4ec5060e..a7b571c60e90 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -408,12 +408,15 @@ static void __init early_check_vec5(void)
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

