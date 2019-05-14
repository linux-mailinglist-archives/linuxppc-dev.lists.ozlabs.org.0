Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4CA1C2D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 08:08:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4536gw1035zDqHr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 16:08:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4536ZS63CXzDqHv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 16:04:00 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E63oen033885
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 02:03:57 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sfqjdh19x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 02:03:47 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 14 May 2019 07:02:16 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 07:02:13 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4E62Bre9699618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 06:02:12 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C74C9BE051;
 Tue, 14 May 2019 06:02:11 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4133BE04F;
 Tue, 14 May 2019 06:02:09 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.80.230.27])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 06:02:09 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/book3s/mm: Clear MMU_FTR_HPTE_TABLE when radix is
 enabled.
Date: Tue, 14 May 2019 11:32:05 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19051406-0016-0000-0000-000009B210CF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011095; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01203055; UDB=6.00631455; IPR=6.00983977; 
 MB=3.00026878; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-14 06:02:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051406-0017-0000-0000-00004335DEC0
Message-Id: <20190514060205.20887-1-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140043
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Avoids confusion when printing Oops message like below

 Faulting instruction address: 0xc00000000008bdb4
 Oops: Kernel access of bad area, sig: 11 [#1]
 LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV

Either ibm,pa-features or ibm,powerpc-cpu-features can be used to enable the
MMU features. We don't clear related MMU feature bits there. We use the kernel
commandline to determine what translation mode we want to use and clear the
HPTE or radix bit accordingly. On LPAR we do have to renable HASH bit if the
hypervisor can't do radix.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/init_64.c | 11 ++++++++++-
 arch/powerpc/mm/pgtable.c |  7 +++----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 45b02fa11cd8..652d954444ba 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -355,15 +355,18 @@ static void __init early_check_vec5(void)
 	chosen = of_get_flat_dt_subnode_by_name(root, "chosen");
 	if (chosen == -FDT_ERR_NOTFOUND) {
 		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
+		cur_cpu_spec->mmu_features |= MMU_FTR_HPTE_TABLE;
 		return;
 	}
 	vec5 = of_get_flat_dt_prop(chosen, "ibm,architecture-vec-5", &size);
 	if (!vec5) {
 		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
+		cur_cpu_spec->mmu_features |= MMU_FTR_HPTE_TABLE;
 		return;
 	}
 	if (size <= OV5_INDX(OV5_MMU_SUPPORT)) {
 		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
+		cur_cpu_spec->mmu_features |= MMU_FTR_HPTE_TABLE;
 		return;
 	}
 
@@ -381,17 +384,23 @@ static void __init early_check_vec5(void)
 		}
 		/* Do radix anyway - the hypervisor said we had to */
 		cur_cpu_spec->mmu_features |= MMU_FTR_TYPE_RADIX;
+		cur_cpu_spec->mmu_features &= ~MMU_FTR_HPTE_TABLE;
 	} else if (mmu_supported == OV5_FEAT(OV5_MMU_HASH)) {
 		/* Hypervisor only supports hash - disable radix */
 		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
+		cur_cpu_spec->mmu_features |= MMU_FTR_HPTE_TABLE;
 	}
 }
 
 void __init mmu_early_init_devtree(void)
 {
 	/* Disable radix mode based on kernel command line. */
-	if (disable_radix)
+	if (disable_radix) {
 		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
+	} else {
+		if (early_radix_enabled())
+			cur_cpu_spec->mmu_features &= ~MMU_FTR_HPTE_TABLE;
+	}
 
 	/*
 	 * Check /chosen/ibm,architecture-vec-5 if running as a guest.
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index b97aee03924f..0fa6cac3fe82 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -77,9 +77,6 @@ static struct page *maybe_pte_to_page(pte_t pte)
 
 static pte_t set_pte_filter_hash(pte_t pte)
 {
-	if (radix_enabled())
-		return pte;
-
 	pte = __pte(pte_val(pte) & ~_PAGE_HPTEFLAGS);
 	if (pte_looks_normal(pte) && !(cpu_has_feature(CPU_FTR_COHERENT_ICACHE) ||
 				       cpu_has_feature(CPU_FTR_NOEXECUTE))) {
@@ -110,6 +107,8 @@ static pte_t set_pte_filter(pte_t pte)
 
 	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		return set_pte_filter_hash(pte);
+	else if (radix_enabled())
+		return pte;
 
 	/* No exec permission in the first place, move on */
 	if (!pte_exec(pte) || !pte_looks_normal(pte))
@@ -140,7 +139,7 @@ static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
 {
 	struct page *pg;
 
-	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
+	if (mmu_has_feature(MMU_FTR_HPTE_TABLE) || radix_enabled())
 		return pte;
 
 	/* So here, we only care about exec faults, as we use them
-- 
2.21.0

