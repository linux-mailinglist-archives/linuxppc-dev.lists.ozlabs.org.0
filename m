Return-Path: <linuxppc-dev+bounces-14869-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E58B1CCCECC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 18:10:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXHH30BGlz2yFc;
	Fri, 19 Dec 2025 04:10:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766077822;
	cv=none; b=LuPt7exs/rp1fSRhWhqsJ6NpvEnjV/spSMnovJQl0pwRgbbvZwfz77XXcdykR5I/VH28NnggaeV8NLU6yEFDmQB4s+5YwBMoY/MTIwSyRL+xhucJpxNeBSnB/BJCVtiIhdYXoZXdtJsHnG16RMOFvZOaHcpK+AZ413kb0Q4cWLUSTUqqZBC0zblYbiH7F2Uj6UBir6Od22VPmFVKf6krrAH6Gv25Dbvtk51+/n+yDoLfo+l38Gttvb4d8ancHblazShPbbMzKeYJxA5FKuy3ZuPndNMu8nM1yP7xGYrJsdqvbx5RnfQO4mJOPcGa8jKgKdx+2diORklrFGNxAcabQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766077822; c=relaxed/relaxed;
	bh=own5/WUxkJ7uUm7nDnOfa3J9RGTcbUFWeyg//NbZZm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6EAKs8AOGUIpTE9Cn4+qM3if6ckXBtavgVM3E2qLcEhAThpmRb6KqMN0MLxg7DJU2WW0EQTXV0Wn4vqHT0jrogu5X+Ga3x4ytAgS4RliZJWs9s61gQzSW1Y5tplWuoLGPz46R6nMYw5b1jXNXjcoH/p4VOxogML1nCbQfWtiPBgCbjMeCsdowXLua3QwqMUKSj/GdVHJXD7aTawb6qHOnYxo5cbjTCFFYijvIEgvDfS+VLXyeM18JAO9QmseuQzg6k+wJgLfF4pcXz7jZ6ru6eXQOCpl6b0G1uc/ExElEUue+caUfl/n+iS9YjVESe9DCDU9DxkuSH9eV1jMi5gBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f7LT/bCY; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f7LT/bCY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXHH21Gf5z2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 04:10:21 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIEQY12032421;
	Thu, 18 Dec 2025 17:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=own5/W
	UxkJ7uUm7nDnOfa3J9RGTcbUFWeyg//NbZZm8=; b=f7LT/bCYuTb2RsBrMKjwiN
	puc/TVz7zgjtBIu7K2Jh3vboqdjgu+EjGFEp9iHywQkgZ1W77p5c4HNDYFqPv24X
	+3/a1AFNJHLqUZWY5KGyqfxbm8WgJUxrD9LOiTFiUXwnlg5yZ+jSytS6ze+1grVB
	zuglpqOuyt5g5L+lH8HJIfdnWYJV496Sjyxm9lhl9CGu1Si7ciODRA9iwzrN0Zo0
	VEJBmnuxaMAnHt10nhmUXSpQG+S4Z/Pn0pmYmOmmujt//XePRZPgnkTqkTr+dU6s
	G4fyLmx0+bZQC5ph31JPAz5tmH8hYHhXX7dz8YDhTFo2nX2+dw9+4b16sxbG/koA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0wjqb7n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 17:10:08 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BIH9vtj032577;
	Thu, 18 Dec 2025 17:10:07 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0wjqb7my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 17:10:07 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIElrQu014318;
	Thu, 18 Dec 2025 17:10:06 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1mpk99ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 17:10:06 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BIHA5fa27001514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 17:10:05 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3A995805A;
	Thu, 18 Dec 2025 17:10:05 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 247805803F;
	Thu, 18 Dec 2025 17:09:59 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.16.51])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Dec 2025 17:09:58 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Fri, 19 Dec 2025 04:09:34 +1100
Subject: [PATCH v18 02/12] arm64/mm: Add addr parameter to
 __ptep_get_and_clear_anysz()
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-pgtable_check_v18rebase-v18-2-755bc151a50b@linux.ibm.com>
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
In-Reply-To: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
To: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>,
        Christophe Leroy <chleroy@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org,
        Nicholas Miehlbradt <nicholas@linux.ibm.com>,
        Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
        Andrew Donnellan <andrew+kernel@donnellan.id.au>,
        Srish Srinivasan <ssrish@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAwMSBTYWx0ZWRfXz2BXSIdKVlKv
 ph9tKMbKKWgYJVE+YjwoQH0CGqLmECCZuiPUxLGsr8MwdqdkA8rTAYBjfJDSxUZgPcTSCkUlPmI
 lrD6On7m+7WClXQRr/QUvAS/AzaiFk738mzAq/MNE/QEAnrWFN4IQoh1mvzN4XNh3o4psowF+En
 o0SQzcV9ma2BDAxdicQfTUQGAux5hiGzwXObHpGF8UM3KhQfN+zZgaP/NrE9mEbV0DiYOkOW3tK
 bBiaxKSJ6vzSdQE2xqk+F9uEh72/Gm3JHQPPBq2cFFMeZ1tf0Q7Nb8tIWKREu7hUFh7vd1SwFTy
 oWjCzTFJUjN9/O7DRNd5Joq7acw0Lp4Wj6opSl+Hg2U4+4RPUbO3qsVVpbqQUl9a8KF2auN2tw5
 Um4BFfMgWrVAulVcQVsHYjJfsF86JQ==
X-Proofpoint-GUID: E5wcBm6o_TA3p2uE06S9hUaC0FTJM0c3
X-Proofpoint-ORIG-GUID: Gme6pxPtjG-OXJ3yR_iw4NEDBblaNn5Y
X-Authority-Analysis: v=2.4 cv=Kq5AGGWN c=1 sm=1 tr=0 ts=69443570 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=4PT1ayd0SIKHQ98-h3UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

To provide support for page table check on powerpc, we need to reinstate the
address parameter in several functions, including
page_table_check_{pte,pmd,pud}_clear().

In preparation for this, add the addr parameter to arm64's
__ptep_get_and_clear_anysz() and change its callsites accordingly.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v15: new patch
---
 arch/arm64/include/asm/pgtable.h | 5 +++--
 arch/arm64/mm/hugetlbpage.c      | 7 ++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 52f3ea07427cef399e68bea0dbab39d03ea83060..29f7ae7011a820687f5b1e2fdc782eb37f85fc1b 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1332,6 +1332,7 @@ static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
 
 static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
+					       unsigned long address,
 					       pte_t *ptep,
 					       unsigned long pgsize)
 {
@@ -1359,7 +1360,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
 static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long address, pte_t *ptep)
 {
-	return __ptep_get_and_clear_anysz(mm, ptep, PAGE_SIZE);
+	return __ptep_get_and_clear_anysz(mm, address, ptep, PAGE_SIZE);
 }
 
 static inline void __clear_full_ptes(struct mm_struct *mm, unsigned long addr,
@@ -1398,7 +1399,7 @@ static inline pte_t __get_and_clear_full_ptes(struct mm_struct *mm,
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 					    unsigned long address, pmd_t *pmdp)
 {
-	return pte_pmd(__ptep_get_and_clear_anysz(mm, (pte_t *)pmdp, PMD_SIZE));
+	return pte_pmd(__ptep_get_and_clear_anysz(mm, address, (pte_t *)pmdp, PMD_SIZE));
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 1003b502075208d4252c27ffdacb1aaf4928639b..bcc28031eb7aa4ba175b5552f5449e69c6af5e61 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -159,11 +159,12 @@ static pte_t get_clear_contig(struct mm_struct *mm,
 	pte_t pte, tmp_pte;
 	bool present;
 
-	pte = __ptep_get_and_clear_anysz(mm, ptep, pgsize);
+	pte = __ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
 	present = pte_present(pte);
 	while (--ncontig) {
 		ptep++;
-		tmp_pte = __ptep_get_and_clear_anysz(mm, ptep, pgsize);
+		addr += pgsize;
+		tmp_pte = __ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
 		if (present) {
 			if (pte_dirty(tmp_pte))
 				pte = pte_mkdirty(pte);
@@ -207,7 +208,7 @@ static void clear_flush(struct mm_struct *mm,
 	unsigned long i, saddr = addr;
 
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		__ptep_get_and_clear_anysz(mm, ptep, pgsize);
+		__ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
 
 	if (mm == &init_mm)
 		flush_tlb_kernel_range(saddr, addr);

-- 
2.52.0


