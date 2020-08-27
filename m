Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 409052540D8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 10:29:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcbVx4rJFzDqHk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:29:29 +1000 (AEST)
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
 header.s=pp1 header.b=VzBYEjyn; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcZzX6rv2zDqDs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 18:05:44 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R83dnp020480; Thu, 27 Aug 2020 04:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gz/41PaKLcJaLtxM9iDOE69IpKh3fx/lx/fXbWxymCc=;
 b=VzBYEjynZlV//CXxnVTCyoapjf/fbZhWVMw7DkWI52xKD+aRhSv+gZ88/C91uC3zm18u
 DZtx+BaTZTgCVSVt586OJIjqmJDQHdhRoz3XMEG1s+klE+Bkh+CmtthXjSTOb6aS2+Rj
 14pNn62TSEorq5QRb3VQCVEG3IcibCi6oYQCyVd/6ILTEiUkBmKxWiyfrU6VhYfmDLS+
 RRzK5N7ayEBDg+4+ExrxrMWP5iItrk8xHnHa5EUgPksR1oEaZjV8WGSKWQPVLYLOuE4p
 wMFCLRMCOWXTEeVjwVa1Rc3Fg8MGVK98qCVJQTR2F6c/MYfc+JmCgQqvaM7Mjv964Cbr HA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3368t9re7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:05:24 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R82tTi024560;
 Thu, 27 Aug 2020 08:05:23 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 332uw7r77g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 08:05:23 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R85JL435258878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 08:05:19 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EA037806B;
 Thu, 27 Aug 2020 08:05:22 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A00677807B;
 Thu, 27 Aug 2020 08:05:17 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.17.9])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 08:05:17 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v3 06/13] mm/debug_vm_pgtable/THP: Mark the pte entry huge
 before using set_pmd/pud_at
Date: Thu, 27 Aug 2020 13:34:31 +0530
Message-Id: <20200827080438.315345-7-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-27_02:2020-08-27,
 2020-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008270060
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vineet Gupta <vgupta@synopsys.com>,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kernel expects entries to be marked huge before we use set_pmd_at()/set_pud_at().

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 5c0680836fe9..de83a20c1b30 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -155,7 +155,7 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
 				      unsigned long pfn, unsigned long vaddr,
 				      pgprot_t prot)
 {
-	pmd_t pmd = pfn_pmd(pfn, prot);
+	pmd_t pmd;
 
 	if (!has_transparent_hugepage())
 		return;
@@ -164,19 +164,19 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
 	/* Align the address wrt HPAGE_PMD_SIZE */
 	vaddr = (vaddr & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE;
 
-	pmd = pfn_pmd(pfn, prot);
+	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
 	set_pmd_at(mm, vaddr, pmdp, pmd);
 	pmdp_set_wrprotect(mm, vaddr, pmdp);
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(pmd_write(pmd));
 
-	pmd = pfn_pmd(pfn, prot);
+	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
 	set_pmd_at(mm, vaddr, pmdp, pmd);
 	pmdp_huge_get_and_clear(mm, vaddr, pmdp);
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(!pmd_none(pmd));
 
-	pmd = pfn_pmd(pfn, prot);
+	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
 	pmd = pmd_wrprotect(pmd);
 	pmd = pmd_mkclean(pmd);
 	set_pmd_at(mm, vaddr, pmdp, pmd);
@@ -237,7 +237,7 @@ static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
 
 static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pfn_pmd(pfn, prot);
+	pmd_t pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
 
 	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
 		return;
@@ -277,7 +277,7 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
 				      unsigned long pfn, unsigned long vaddr,
 				      pgprot_t prot)
 {
-	pud_t pud = pfn_pud(pfn, prot);
+	pud_t pud;
 
 	if (!has_transparent_hugepage())
 		return;
@@ -286,25 +286,28 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
 	/* Align the address wrt HPAGE_PUD_SIZE */
 	vaddr = (vaddr & HPAGE_PUD_MASK) + HPAGE_PUD_SIZE;
 
+	pud = pud_mkhuge(pfn_pud(pfn, prot));
 	set_pud_at(mm, vaddr, pudp, pud);
 	pudp_set_wrprotect(mm, vaddr, pudp);
 	pud = READ_ONCE(*pudp);
 	WARN_ON(pud_write(pud));
 
 #ifndef __PAGETABLE_PMD_FOLDED
-	pud = pfn_pud(pfn, prot);
+
+	pud = pud_mkhuge(pfn_pud(pfn, prot));
 	set_pud_at(mm, vaddr, pudp, pud);
 	pudp_huge_get_and_clear(mm, vaddr, pudp);
 	pud = READ_ONCE(*pudp);
 	WARN_ON(!pud_none(pud));
 
-	pud = pfn_pud(pfn, prot);
+	pud = pud_mkhuge(pfn_pud(pfn, prot));
 	set_pud_at(mm, vaddr, pudp, pud);
 	pudp_huge_get_and_clear_full(mm, vaddr, pudp, 1);
 	pud = READ_ONCE(*pudp);
 	WARN_ON(!pud_none(pud));
 #endif /* __PAGETABLE_PMD_FOLDED */
-	pud = pfn_pud(pfn, prot);
+
+	pud = pud_mkhuge(pfn_pud(pfn, prot));
 	pud = pud_wrprotect(pud);
 	pud = pud_mkclean(pud);
 	set_pud_at(mm, vaddr, pudp, pud);
-- 
2.26.2

