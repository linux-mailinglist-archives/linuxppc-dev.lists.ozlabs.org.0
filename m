Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C51FF91F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 18:23:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nnKv2zcQzDrJ7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 02:23:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nn2c0Y0lzDrDr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 02:09:59 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05IG1lrw033073; Thu, 18 Jun 2020 12:09:55 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31r8xswn36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 12:09:55 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05IG1uSP034010;
 Thu, 18 Jun 2020 12:09:54 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31r8xswn2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 12:09:54 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05IG5ia2030655;
 Thu, 18 Jun 2020 16:09:53 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 31quax9cac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 16:09:53 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05IG8VRm61276474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jun 2020 16:08:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BFF2A4064;
 Thu, 18 Jun 2020 16:09:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B4EFA4054;
 Thu, 18 Jun 2020 16:09:48 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.46.230])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jun 2020 16:09:47 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 5/5] KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in nested KVM
Date: Thu, 18 Jun 2020 21:39:30 +0530
Message-Id: <20200618160930.26324-6-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200618160930.26324-1-bharata@linux.ibm.com>
References: <20200618160930.26324-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_13:2020-06-18,
 2020-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 bulkscore=0
 adultscore=0 cotscore=-2147483648 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
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

In the nested KVM case, replace H_TLB_INVALIDATE by the new hcall
H_RPT_INVALIDATE if available. The availability of this hcall
is determined from "hcall-rpt-invalidate" string in ibm,hypertas-functions
DT property.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/include/asm/firmware.h       |  4 +++-
 arch/powerpc/kvm/book3s_64_mmu_radix.c    | 27 ++++++++++++++++++-----
 arch/powerpc/kvm/book3s_hv_nested.c       | 13 +++++++++--
 arch/powerpc/platforms/pseries/firmware.c |  1 +
 4 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 6003c2e533a0..aa6a5ef5d483 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -52,6 +52,7 @@
 #define FW_FEATURE_PAPR_SCM 	ASM_CONST(0x0000002000000000)
 #define FW_FEATURE_ULTRAVISOR	ASM_CONST(0x0000004000000000)
 #define FW_FEATURE_STUFF_TCE	ASM_CONST(0x0000008000000000)
+#define FW_FEATURE_RPT_INVALIDATE ASM_CONST(0x0000010000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -71,7 +72,8 @@ enum {
 		FW_FEATURE_TYPE1_AFFINITY | FW_FEATURE_PRRN |
 		FW_FEATURE_HPT_RESIZE | FW_FEATURE_DRMEM_V2 |
 		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
-		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR,
+		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR |
+		FW_FEATURE_RPT_INVALIDATE,
 	FW_FEATURE_PSERIES_ALWAYS = 0,
 	FW_FEATURE_POWERNV_POSSIBLE = FW_FEATURE_OPAL | FW_FEATURE_ULTRAVISOR,
 	FW_FEATURE_POWERNV_ALWAYS = 0,
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 84acb4769487..fcf8b031a32e 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -21,6 +21,7 @@
 #include <asm/pte-walk.h>
 #include <asm/ultravisor.h>
 #include <asm/kvm_book3s_uvmem.h>
+#include <asm/plpar_wrappers.h>
 
 /*
  * Supported radix tree geometry.
@@ -313,10 +314,17 @@ void kvmppc_radix_tlbie_page(struct kvm *kvm, unsigned long addr,
 		return;
 	}
 
-	psi = shift_to_mmu_psize(pshift);
-	rb = addr | (mmu_get_ap(psi) << PPC_BITLSHIFT(58));
-	rc = plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(0, 0, 1),
-				lpid, rb);
+	if (!firmware_has_feature(FW_FEATURE_RPT_INVALIDATE)) {
+		psi = shift_to_mmu_psize(pshift);
+		rb = addr | (mmu_get_ap(psi) << PPC_BITLSHIFT(58));
+		rc = plpar_hcall_norets(H_TLB_INVALIDATE,
+					H_TLBIE_P1_ENC(0, 0, 1), lpid, rb);
+	} else {
+		rc = pseries_rpt_invalidate(lpid, H_RPTI_TARGET_CMMU,
+					    H_RPTI_TYPE_NESTED |
+					    H_RPTI_TYPE_TLB, H_RPTI_PAGE_ALL,
+					    addr, addr + psize);
+	}
 	if (rc)
 		pr_err("KVM: TLB page invalidation hcall failed, rc=%ld\n", rc);
 }
@@ -330,8 +338,15 @@ static void kvmppc_radix_flush_pwc(struct kvm *kvm, unsigned int lpid)
 		return;
 	}
 
-	rc = plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(1, 0, 1),
-				lpid, TLBIEL_INVAL_SET_LPID);
+	if (!firmware_has_feature(FW_FEATURE_RPT_INVALIDATE))
+		rc = plpar_hcall_norets(H_TLB_INVALIDATE,
+					H_TLBIE_P1_ENC(1, 0, 1),
+					lpid, TLBIEL_INVAL_SET_LPID);
+	else
+		rc = pseries_rpt_invalidate(lpid, H_RPTI_TARGET_CMMU,
+					    H_RPTI_TYPE_NESTED |
+					    H_RPTI_TYPE_PWC, H_RPTI_PAGE_ALL,
+					    0, -1UL);
 	if (rc)
 		pr_err("KVM: TLB PWC invalidation hcall failed, rc=%ld\n", rc);
 }
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 75993f44519b..81f903284d34 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -19,6 +19,7 @@
 #include <asm/pgalloc.h>
 #include <asm/pte-walk.h>
 #include <asm/reg.h>
+#include <asm/plpar_wrappers.h>
 
 static struct patb_entry *pseries_partition_tb;
 
@@ -402,8 +403,16 @@ static void kvmhv_flush_lpid(unsigned int lpid)
 		return;
 	}
 
-	rc = plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(2, 0, 1),
-				lpid, TLBIEL_INVAL_SET_LPID);
+	if (!firmware_has_feature(FW_FEATURE_RPT_INVALIDATE))
+		rc = plpar_hcall_norets(H_TLB_INVALIDATE,
+					H_TLBIE_P1_ENC(2, 0, 1),
+					lpid, TLBIEL_INVAL_SET_LPID);
+	else
+		rc = pseries_rpt_invalidate(lpid, H_RPTI_TARGET_CMMU,
+					    H_RPTI_TYPE_NESTED |
+					    H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
+					    H_RPTI_TYPE_PAT,
+					    H_RPTI_PAGE_ALL, 0, -1UL);
 	if (rc)
 		pr_err("KVM: TLB LPID invalidation hcall failed, rc=%ld\n", rc);
 }
diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/platforms/pseries/firmware.c
index 3e49cc23a97a..4c7b7f5a2ebc 100644
--- a/arch/powerpc/platforms/pseries/firmware.c
+++ b/arch/powerpc/platforms/pseries/firmware.c
@@ -65,6 +65,7 @@ hypertas_fw_features_table[] = {
 	{FW_FEATURE_HPT_RESIZE,		"hcall-hpt-resize"},
 	{FW_FEATURE_BLOCK_REMOVE,	"hcall-block-remove"},
 	{FW_FEATURE_PAPR_SCM,		"hcall-scm"},
+	{FW_FEATURE_RPT_INVALIDATE,	"hcall-rpt-invalidate"},
 };
 
 /* Build up the firmware features bitmask using the contents of
-- 
2.21.3

