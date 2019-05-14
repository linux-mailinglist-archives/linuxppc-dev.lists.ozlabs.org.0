Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC6C1C2C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 08:06:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4536d02vnwzDqJg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 16:06:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4536Yj2qd3zDqHr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 16:03:21 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E61lLm066462
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 02:03:18 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sfq981ghk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 02:03:17 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 14 May 2019 07:03:17 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 07:03:14 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4E63DKE11338104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 06:03:13 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B90C3BE056;
 Tue, 14 May 2019 06:03:12 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1A45BE058;
 Tue, 14 May 2019 06:03:10 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.80.230.27])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 06:03:10 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH 2/3] powerpc/mm: pmd_devmap implies pmd_large().
Date: Tue, 14 May 2019 11:33:01 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190514060302.21505-1-aneesh.kumar@linux.ibm.com>
References: <20190514060302.21505-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19051406-0012-0000-0000-000017361D82
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011095; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01203055; UDB=6.00631455; IPR=6.00983978; 
 MB=3.00026878; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-14 06:03:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051406-0013-0000-0000-00005741F163
Message-Id: <20190514060302.21505-2-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=895 adultscore=0 classifier=spam adjust=0 reason=mlx
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

large devmap usage is dependent on THP. Hence once check is sufficient.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/pgtable.c | 2 +-
 arch/powerpc/mm/pgtable_64.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 16bda049187a..471cea271dd3 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -76,7 +76,7 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 
 	WARN_ON(pte_hw_valid(pmd_pte(*pmdp)) && !pte_protnone(pmd_pte(*pmdp)));
 	assert_spin_locked(pmd_lockptr(mm, pmdp));
-	WARN_ON(!(pmd_large(pmd) || pmd_devmap(pmd)));
+	WARN_ON(!(pmd_large(pmd)));
 #endif
 	trace_hugepage_set_pmd(addr, pmd_val(pmd));
 	return set_pte_at(mm, addr, pmdp_ptep(pmdp), pmd_pte(pmd));
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index bfb47b037a2f..c1541371f224 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -320,7 +320,7 @@ struct page *pud_page(pud_t pud)
 struct page *pmd_page(pmd_t pmd)
 {
 	if (pmd_is_leaf(pmd)) {
-		VM_WARN_ON(!(pmd_large(pmd) || pmd_huge(pmd) || pmd_devmap(pmd)));
+		VM_WARN_ON(!(pmd_large(pmd) || pmd_huge(pmd)));
 		return pte_page(pmd_pte(pmd));
 	}
 	return virt_to_page(pmd_page_vaddr(pmd));
-- 
2.21.0

