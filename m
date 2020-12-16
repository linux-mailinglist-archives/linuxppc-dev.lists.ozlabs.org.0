Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9562DBD29
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 09:58:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cwptv5BgNzDqLC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 19:58:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fbVbEC/a; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwpqH0xvdzDqL8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 19:55:06 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BG8Uxik184704; Wed, 16 Dec 2020 03:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MDNA3xJ3VTEjr15P6WUJ09S2CQjeygx6FB8Un2JkJtE=;
 b=fbVbEC/ar5eYyqPw+FiwGpzbGcohvCTzz3pcCyE2IP/ImvJEOqYkV5gJxMgaBGc71OPV
 PpzshxqKUHrd5zK1xunssXi3r8z0hLFcJ/oCeW/npoahQtctDzwtYrjAHUOFO55aK7zp
 t91LLXhiU+2ycBkpryb9BxB+5oVlqd39Z3mJZ4J1yVvyQOGlJ1Hv2fVtB7ldLdBxQrlm
 LS7YzKRWbURycIEaAJDPCzEwY3xnF4vn68a6rvwQVUSiS/anaDNEwZZGd1YsOiUlYe8p
 Q1n2XH2PejQ3doVoQ7P+R3u5awjyOFTarfj0FDoFfahQ5/oeG28qDUx/yZw3QWSfC7hL 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fa98f7my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 03:55:00 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BG8VLnI187150;
 Wed, 16 Dec 2020 03:55:00 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fa98f7mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 03:54:59 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BG8rORt017450;
 Wed, 16 Dec 2020 08:54:58 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 35cng8e31u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 08:54:58 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BG8stML33227154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 08:54:55 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D7B34203F;
 Wed, 16 Dec 2020 08:54:55 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 951A242047;
 Wed, 16 Dec 2020 08:54:53 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.116.220])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 08:54:53 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in nested KVM
Date: Wed, 16 Dec 2020 14:24:47 +0530
Message-Id: <20201216085447.1265433-3-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216085447.1265433-1-bharata@linux.ibm.com>
References: <20201216085447.1265433-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_02:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160051
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
 Bharata B Rao <bharata@linux.ibm.com>, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the nested KVM case, replace H_TLB_INVALIDATE by the new hcall
H_RPT_INVALIDATE if available. The availability of this hcall
is determined from "hcall-rpt-invalidate" string in ibm,hypertas-functions
DT property.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 27 +++++++++++++++++++++-----
 arch/powerpc/kvm/book3s_hv_nested.c    | 12 ++++++++++--
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index bb35490400e9..7ea5459022cb 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -21,6 +21,7 @@
 #include <asm/pte-walk.h>
 #include <asm/ultravisor.h>
 #include <asm/kvm_book3s_uvmem.h>
+#include <asm/plpar_wrappers.h>
 
 /*
  * Supported radix tree geometry.
@@ -318,9 +319,19 @@ void kvmppc_radix_tlbie_page(struct kvm *kvm, unsigned long addr,
 	}
 
 	psi = shift_to_mmu_psize(pshift);
-	rb = addr | (mmu_get_ap(psi) << PPC_BITLSHIFT(58));
-	rc = plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(0, 0, 1),
-				lpid, rb);
+
+	if (!firmware_has_feature(FW_FEATURE_RPT_INVALIDATE)) {
+		rb = addr | (mmu_get_ap(psi) << PPC_BITLSHIFT(58));
+		rc = plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(0, 0, 1),
+					lpid, rb);
+	} else {
+		rc = pseries_rpt_invalidate(lpid, H_RPTI_TARGET_CMMU,
+					    H_RPTI_TYPE_NESTED |
+					    H_RPTI_TYPE_TLB,
+					    psize_to_rpti_pgsize(psi),
+					    addr, addr + psize);
+	}
+
 	if (rc)
 		pr_err("KVM: TLB page invalidation hcall failed, rc=%ld\n", rc);
 }
@@ -334,8 +345,14 @@ static void kvmppc_radix_flush_pwc(struct kvm *kvm, unsigned int lpid)
 		return;
 	}
 
-	rc = plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(1, 0, 1),
-				lpid, TLBIEL_INVAL_SET_LPID);
+	if (!firmware_has_feature(FW_FEATURE_RPT_INVALIDATE))
+		rc = plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(1, 0, 1),
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
index a54ba4b1d4a7..9dc694288757 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -19,6 +19,7 @@
 #include <asm/pgalloc.h>
 #include <asm/pte-walk.h>
 #include <asm/reg.h>
+#include <asm/plpar_wrappers.h>
 
 static struct patb_entry *pseries_partition_tb;
 
@@ -402,8 +403,15 @@ static void kvmhv_flush_lpid(unsigned int lpid)
 		return;
 	}
 
-	rc = plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(2, 0, 1),
-				lpid, TLBIEL_INVAL_SET_LPID);
+	if (!firmware_has_feature(FW_FEATURE_RPT_INVALIDATE))
+		rc = plpar_hcall_norets(H_TLB_INVALIDATE, H_TLBIE_P1_ENC(2, 0, 1),
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
-- 
2.26.2

