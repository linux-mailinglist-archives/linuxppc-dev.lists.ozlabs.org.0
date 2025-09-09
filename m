Return-Path: <linuxppc-dev+bounces-11931-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD151B4A72A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 11:15:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLdTF1Zvkz3cYL;
	Tue,  9 Sep 2025 19:15:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757409329;
	cv=none; b=FllF2FUR0gjm1w5G+TK9vepBez3755GqiMmXT1cIUz/aMsyU3/au3abv3JGSDY/hziBuCSKBcwfTtymsbeIJJBl4pJflcBSpEEHQv0rtjVOmIS13uLPQ5XxjXe6fWRd767mvJo1gKg0AtSPmX557Ypq9MjgqfyL/fJlXag33ME9TpSNjYPATKsV23jYzqRXNR79aUsvv1NR9hRD3gNIXTkQaLgyi1jmlpiGTRjCqSmfXqigJOD4DxaDfb/fQ0u46jFQtCZOeROOXNpGbxAP97lq9dF4YxQ8U8UvStzT7A5vW3b9ejDTE5Fp9Kwdi7SGElImE7fxn5Mrb6oNa8lpDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757409329; c=relaxed/relaxed;
	bh=1uJ0iwhU4FqgLjbCr0UKoAb4D8xXYP27h7JXHlGAl7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cu3n9sHCGL9XFsBzXu9wHagSOOnNCbjB8pFBhU0XMnbQGBR8040H2+pJzkE3zNCasEMKtVT90I+xVMCQ9PTw6x/HTtNuWOMaNkgdW2pKidGKMsvIO7pQK0eIcKh0XreY5j1ixnDDCoKe1cMy9ytV0/2eT6bp7qGuk1f56pHirCGWiHxa3K6NmNcdkZp71NfrMJW9fKXwtav+krKgrTrr5s+PMsKHJwTVn+ve0Tf1utQ+P5+CtbwwU300NgeAAB77nMgBJ8qtUBLdz1Ytln1EP5avjNZLIRiuQ8KlVjmohbEOP0o7jTtk4zLF8VIdyf7QvkemW8L6Mb5dmnT/0WdGfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rG3jEanI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rG3jEanI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLdTD3PXpz3cQx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 19:15:28 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5898vfpP008280;
	Tue, 9 Sep 2025 09:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=1uJ0iwhU4FqgLjbCr
	0UKoAb4D8xXYP27h7JXHlGAl7o=; b=rG3jEanI3FXY3dnkcWjCDe6COQrTLx/1S
	phmA4pmOvaIUg+05jOHQoW/mXKHp2oRpISoAmEePVADf7ycNvytEMQhhZDgaTfvG
	daXUGRO9CE2o6LqolnkDO/Eks5USjnHqnOorKLX/G8O2wKnbrkm6AHTHIHHp04Ki
	IYJnjsPLqF9RL5Y8yx5U9lXsYpqIpuVpaKOwfdTVrE2jFwmqA8BMcC6vqfRDlcNS
	QPoKa0IWgDYTeMiUGkT8Oh1rUBNstFH7H8413Pug6NA56jkD4xMlVqM+1SKGS0rx
	N5c4pzY1YfZ9eQDjLfT/vvqFgN1sFIrAm1F3yslJQRhPUHgadwfVQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycum5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 09:15:11 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5897Rp9v001155;
	Tue, 9 Sep 2025 09:15:10 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 491203a26k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 09:15:10 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5899F9Ip17105516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 09:15:10 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3CA258055;
	Tue,  9 Sep 2025 09:15:09 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3457758061;
	Tue,  9 Sep 2025 09:15:04 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.2.198])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 09:15:03 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu,
        alexghiti@rivosinc.com, Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v17 08/12] mm/page_table_check: Reinstate address parameter in [__]page_table_check_pte_clear()
Date: Tue,  9 Sep 2025 19:13:31 +1000
Message-ID: <20250909091335.183439-9-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909091335.183439-1-ajd@linux.ibm.com>
References: <20250909091335.183439-1-ajd@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i-P0mBNkFrbrWx4MowX9rincM24gwjqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfX5jG7RcUpDjYe
 DTBelmUh1EIRNiIix0PGtJqmmqw3H5/SQQxGTVTgNjM3lYmQybOwujrFk9ibtU6kn67qeB/lFWL
 RkzbV1oG+9dhistyd+zNmWw6zwiC1yiDoBw2fJZH0Mt+jGYY6JzwHfxyhsehu8K6/sGI/rorQLZ
 Ks88LgkU2QN+AIsKfxNkmpci7RFC4/CNx1vZXH8UtWEUglPaexTA7rQqDeMo4HKTTYjeqwZHs0p
 r5lLW/GbEiFC3baUev9CwDpu+z2Jxtc0h+qaWGI3VJ3f8kvDvzc3rkmAY3du0xjKKnRxkxVje9Z
 TtWB2AeB6QCdeOP7gj5K9QsIeEZ4tikFOZD8KyKVy5824dLgmwLgv7l037Yb3Ar5U6XGTXwJPsW
 uR74/v1d
X-Proofpoint-GUID: i-P0mBNkFrbrWx4MowX9rincM24gwjqP
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68bff01f cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=VwQbUJbxAAAA:8
 a=h0uksLzaAAAA:8 a=brIg1AGlUOEcU9TjG_MA:9 a=gpc5p9EgBqZVLdJeV_V1:22
 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060235
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

This reverts commit aa232204c468 ("mm/page_table_check: remove unused
parameter in [__]page_table_check_pte_clear").

Reinstate previously unused parameters for the purpose of supporting
powerpc platforms, as many do not encode user/kernel ownership of the
page in the pte, but instead in the address of the access.

[ajd@linux.ibm.com: rebase, fix additional occurrence and loop handling]
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: Ingo Molnar <mingo@kernel.org>  # x86
Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v13: fix an additional occurrence
v15: rebase, fix loop handling
---
 arch/arm64/include/asm/pgtable.h |  2 +-
 arch/riscv/include/asm/pgtable.h |  2 +-
 arch/x86/include/asm/pgtable.h   |  4 ++--
 include/linux/page_table_check.h | 11 +++++++----
 include/linux/pgtable.h          |  4 ++--
 mm/page_table_check.c            |  7 ++++---
 6 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index dfcdf051b114..2203ebac81d9 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1367,7 +1367,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
 
 	switch (pgsize) {
 	case PAGE_SIZE:
-		page_table_check_pte_clear(mm, pte);
+		page_table_check_pte_clear(mm, address, pte);
 		break;
 	case PMD_SIZE:
 		page_table_check_pmd_clear(mm, address, pte_pmd(pte));
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index d8bf210b57aa..65e8bc4ce45e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -591,7 +591,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 {
 	pte_t pte = __pte(atomic_long_xchg((atomic_long_t *)ptep, 0));
 
-	page_table_check_pte_clear(mm, pte);
+	page_table_check_pte_clear(mm, address, pte);
 
 	return pte;
 }
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index b68bea15f32d..63350b76c0c6 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1251,7 +1251,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pte_t *ptep)
 {
 	pte_t pte = native_ptep_get_and_clear(ptep);
-	page_table_check_pte_clear(mm, pte);
+	page_table_check_pte_clear(mm, addr, pte);
 	return pte;
 }
 
@@ -1267,7 +1267,7 @@ static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
 		 * care about updates and native needs no locking
 		 */
 		pte = native_local_ptep_get_and_clear(ptep);
-		page_table_check_pte_clear(mm, pte);
+		page_table_check_pte_clear(mm, addr, pte);
 	} else {
 		pte = ptep_get_and_clear(mm, addr, ptep);
 	}
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 3973b69ae294..12268a32e8be 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -14,7 +14,8 @@ extern struct static_key_true page_table_check_disabled;
 extern struct page_ext_operations page_table_check_ops;
 
 void __page_table_check_zero(struct page *page, unsigned int order);
-void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte);
+void __page_table_check_pte_clear(struct mm_struct *mm, unsigned long addr,
+				  pte_t pte);
 void __page_table_check_pmd_clear(struct mm_struct *mm, unsigned long addr,
 				  pmd_t pmd);
 void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
@@ -45,12 +46,13 @@ static inline void page_table_check_free(struct page *page, unsigned int order)
 	__page_table_check_zero(page, order);
 }
 
-static inline void page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
+static inline void page_table_check_pte_clear(struct mm_struct *mm,
+					      unsigned long addr, pte_t pte)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_pte_clear(mm, pte);
+	__page_table_check_pte_clear(mm, addr, pte);
 }
 
 static inline void page_table_check_pmd_clear(struct mm_struct *mm,
@@ -119,7 +121,8 @@ static inline void page_table_check_free(struct page *page, unsigned int order)
 {
 }
 
-static inline void page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
+static inline void page_table_check_pte_clear(struct mm_struct *mm,
+					      unsigned long addr, pte_t pte)
 {
 }
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 46fe3daa4b18..e3f302ddb734 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -494,7 +494,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 {
 	pte_t pte = ptep_get(ptep);
 	pte_clear(mm, address, ptep);
-	page_table_check_pte_clear(mm, pte);
+	page_table_check_pte_clear(mm, address, pte);
 	return pte;
 }
 #endif
@@ -553,7 +553,7 @@ static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
 	 * No need for ptep_get_and_clear(): page table check doesn't care about
 	 * any bits that could have been set by HW concurrently.
 	 */
-	page_table_check_pte_clear(mm, pte);
+	page_table_check_pte_clear(mm, addr, pte);
 }
 
 #ifdef CONFIG_GUP_GET_PXX_LOW_HIGH
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index e8c26b616aed..1c33439b9c0b 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -145,7 +145,8 @@ void __page_table_check_zero(struct page *page, unsigned int order)
 	rcu_read_unlock();
 }
 
-void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte)
+void __page_table_check_pte_clear(struct mm_struct *mm, unsigned long addr,
+				  pte_t pte)
 {
 	if (&init_mm == mm)
 		return;
@@ -206,7 +207,7 @@ void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
 	page_table_check_pte_flags(pte);
 
 	for (i = 0; i < nr; i++)
-		__page_table_check_pte_clear(mm, ptep_get(ptep + i));
+		__page_table_check_pte_clear(mm, addr + PAGE_SIZE * i, ptep_get(ptep + i));
 	if (pte_user_accessible_page(pte))
 		page_table_check_set(pte_pfn(pte), nr, pte_write(pte));
 }
@@ -268,7 +269,7 @@ void __page_table_check_pte_clear_range(struct mm_struct *mm,
 		if (WARN_ON(!ptep))
 			return;
 		for (i = 0; i < PTRS_PER_PTE; i++) {
-			__page_table_check_pte_clear(mm, ptep_get(ptep));
+			__page_table_check_pte_clear(mm, addr, ptep_get(ptep));
 			addr += PAGE_SIZE;
 			ptep++;
 		}
-- 
2.51.0


