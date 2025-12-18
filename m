Return-Path: <linuxppc-dev+bounces-14880-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 997BBCCCEF9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 18:11:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXHJT6nJhz2yGL;
	Fri, 19 Dec 2025 04:11:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766077897;
	cv=none; b=l7rRJmBHMV7jhd54L8FPSdY1KhJ1URenWMEwnnw1CAO6qzS2voV01t7rYu+4R/kzjqDi2dGIQT5xMyo9ko9iYsG/Udl2n3yyRKBbl4nroPD6Blla8SIo32TV2GfWTAOu43nHoGDCaycNa2kdNcSMr31ztZMmPs50ZBtQ+YOBRwHfA7YY9258G5uEmRtsoKR/omV19F833MIJqOWSm6icxE6ap7EdepkEUlp50V++RIVGqnd87UY6J7OecfNV5IVI7DG5GVlqYrD5sF1VlpmxdIREM4SbhwMb/CYBoiT1YDhrcZSHuZeN3zLxDFcjcf+ipWL1wMhiwz9+raoze4FRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766077897; c=relaxed/relaxed;
	bh=1fwQvJyMZVAAv6HXYlWftzVRzf9OZH1VwH0xnBk8m+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ONTPwL10iVNhmNtXNxkcGwqfw2V36mQhelVErcCpT3IpWElDRrekbnfFqj0fHRLcPsFryNnolOiBNRA+0MUEMDBvXZxrn35hp0wAvaF+0PeAn65TilX2qwmAAGFmjmvixZlDCjT1CG75bdYwfGImkJLa10sQz8qQaBzuNGluHkIKosl915VVAUuAyzkYxmWTchWOf3zC+dDqP3d/+KObndiXp0X8ca0kRG/uREekfpr2ZqOIV7C1LF5pnnfV914ygAFfVHJvpcmrHufkwmH7+q/14JpyMgC/b2SDf1yEay2tzNRHoWeeugW/t4yRpufKaGwhulH20EnpSeD83WstIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZmfaEqiD; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZmfaEqiD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXHJT0m9yz2yFp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 04:11:36 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIA7MtS020716;
	Thu, 18 Dec 2025 17:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1fwQvJ
	yMZVAAv6HXYlWftzVRzf9OZH1VwH0xnBk8m+w=; b=ZmfaEqiDN7uTmeEsaUs3S7
	t7rTb8Rn17YMYf535VBOyGoCs+7CtBkEIctKm3xltPwz7LOq069J1Jmq6T8+rqmY
	YrMq6PhS1kmEWqtN6JZJMbRS7ae8jY2my9n2PlBFTOSlMuX+cfiTqWaRsNZPciHb
	zdzztlWhZJRCPBBPx32huP3AdOUbtjaGaHxKvcb6M4r3HGDu/W6qHxrlQkHoBzbH
	kaFNzew8iN258HUpzXl+ohnDN2hH6851XsuPwYUi87YzjLxCVeAFdViNEblVS2yd
	d4Dc5GEpFEIZA5zNxzILe4hGleIZHotLhOHN0hCMOVo83nyhVHU/4sumht0dXEoA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0xjmb1c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 17:11:24 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BIH6aG1005750;
	Thu, 18 Dec 2025 17:11:23 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0xjmb1c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 17:11:23 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIF0dWF014324;
	Thu, 18 Dec 2025 17:11:22 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1mpk99ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 17:11:22 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BIHBKhW32047852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 17:11:21 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9DF25805A;
	Thu, 18 Dec 2025 17:11:20 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4626D58056;
	Thu, 18 Dec 2025 17:11:14 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.16.51])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Dec 2025 17:11:13 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Fri, 19 Dec 2025 04:09:44 +1100
Subject: [PATCH v18 12/12] powerpc/mm: Support page table check
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
Message-Id: <20251219-pgtable_check_v18rebase-v18-12-755bc151a50b@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: eNu2e127LIQy4aY2YrSIfr7iDjsVBUpr
X-Authority-Analysis: v=2.4 cv=CLgnnBrD c=1 sm=1 tr=0 ts=694435bc cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=1UX6Do5GAAAA:8 a=7ipKWUHlAAAA:8 a=4bd5X8VpKi2lnJFIGqUA:9
 a=QEXdDO2ut3YA:10 a=Et2XPkok5AAZYJIKzHr1:22 a=gpc5p9EgBqZVLdJeV_V1:22
X-Proofpoint-GUID: XG2VG8GP17OvRjJpZ3lNl1K6nBOipRVT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAwOSBTYWx0ZWRfX3gv6siLY5ojd
 d3c8VhUgacjdKodkvhOIBFQmtPF6r4ub/+2R3HGWICHxXRs9PM0vcdalmUHtSKh/wR2QHL0owkM
 AWHUuUVMYs71Tf4T7Zr6Qkg7gQcbbE62Oc3RUImO5e294NdNxK4t+gHtbe6XlZFuifuzawt8Vwf
 TfBK9xn6OjnNPSnpsu0hmJ6oMpd4XJaJXEKM0CTtEpTXsE1PvW4Or7zmKnl5L3GXFfVX85KeiU2
 YhhYEH7NXmx6CN1AD08uWBJ9NaQLpNOgwFCPksUlhVhBd1unnaJ614GfUUrVITkqEiMDgf10GFi
 aqVqf0HBPSCKoZ/tuUFiyooLt3BigdE5dAR4hl3wYTmUJPUyZWVyZiBBSnRtpykxeyy4QPKUUgE
 dApJRaiL/sZR6knvtm3sCE/NNWrBCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130009
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

On creation and clearing of a page table mapping, instrument such calls
by invoking page_table_check_pte_set and page_table_check_pte_clear
respectively. These calls serve as a sanity check against illegal
mappings.

Enable ARCH_SUPPORTS_PAGE_TABLE_CHECK on powerpc, except when HUGETLB_PAGE
is enabled (powerpc has some weirdness in how it implements
set_huge_pte_at(), which may require some further work).

See also:

riscv support in commit 3fee229a8eb9 ("riscv/mm: enable
ARCH_SUPPORTS_PAGE_TABLE_CHECK")
arm64 in commit 42b2547137f5 ("arm64/mm: enable
ARCH_SUPPORTS_PAGE_TABLE_CHECK")
x86_64 in commit d283d422c6c4 ("x86: mm: add x86_64 support for page table
check")

[ajd@linux.ibm.com: rebase, add additional instrumentation, misc fixes]
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
v18:
- instrument the new pudp_invalidate()
- don't allow with HUGETLB_PAGE, for now
---
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h |  7 ++++-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 45 +++++++++++++++++++++-------
 arch/powerpc/include/asm/nohash/pgtable.h    |  8 ++++-
 arch/powerpc/mm/book3s64/hash_pgtable.c      |  4 +++
 arch/powerpc/mm/book3s64/pgtable.c           | 19 ++++++++----
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  3 ++
 arch/powerpc/mm/pgtable.c                    |  4 +++
 8 files changed, 73 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9537a61ebae02dbfe44918232eb6114c2b763387..271690445a454b642041e47b0d73cc3fe7d38ae5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -172,6 +172,7 @@ config PPC
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx
+	select ARCH_SUPPORTS_PAGE_TABLE_CHECK	if !HUGETLB_PAGE
 	select ARCH_SUPPORTS_SCHED_MC		if SMP
 	select ARCH_SUPPORTS_SCHED_SMT		if PPC64 && SMP
 	select SCHED_MC				if ARCH_SUPPORTS_SCHED_MC
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 2edca1068b6f31e64ddc4f39f594bb3ac27a8435..dcbae85218304f9062e4414db17f589246733819 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -202,6 +202,7 @@ void unmap_kernel_page(unsigned long va);
 #ifndef __ASSEMBLER__
 #include <linux/sched.h>
 #include <linux/threads.h>
+#include <linux/page_table_check.h>
 
 /* Bits to mask out from a PGD to get to the PUD page */
 #define PGD_MASKED_BITS		0
@@ -315,7 +316,11 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pte_t *ptep)
 {
-	return __pte(pte_update(mm, addr, ptep, ~_PAGE_HASHPTE, 0, 0));
+	pte_t old_pte = __pte(pte_update(mm, addr, ptep, ~_PAGE_HASHPTE, 0, 0));
+
+	page_table_check_pte_clear(mm, addr, old_pte);
+
+	return old_pte;
 }
 
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 2d69a827594f3c8593283fa11acd4750577e71a7..1a91762b455d9380481eef01f7f86ba5f856e375 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -144,6 +144,8 @@
 #define PAGE_KERNEL_ROX	__pgprot(_PAGE_BASE | _PAGE_KERNEL_ROX)
 
 #ifndef __ASSEMBLER__
+#include <linux/page_table_check.h>
+
 /*
  * page table defines
  */
@@ -416,8 +418,11 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long addr, pte_t *ptep)
 {
-	unsigned long old = pte_update(mm, addr, ptep, ~0UL, 0, 0);
-	return __pte(old);
+	pte_t old_pte = __pte(pte_update(mm, addr, ptep, ~0UL, 0, 0));
+
+	page_table_check_pte_clear(mm, addr, old_pte);
+
+	return old_pte;
 }
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR_FULL
@@ -426,11 +431,16 @@ static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
 					    pte_t *ptep, int full)
 {
 	if (full && radix_enabled()) {
+		pte_t old_pte;
+
 		/*
 		 * We know that this is a full mm pte clear and
 		 * hence can be sure there is no parallel set_pte.
 		 */
-		return radix__ptep_get_and_clear_full(mm, addr, ptep, full);
+		old_pte = radix__ptep_get_and_clear_full(mm, addr, ptep, full);
+		page_table_check_pte_clear(mm, addr, old_pte);
+
+		return old_pte;
 	}
 	return ptep_get_and_clear(mm, addr, ptep);
 }
@@ -1301,19 +1311,34 @@ extern int pudp_test_and_clear_young(struct vm_area_struct *vma,
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 					    unsigned long addr, pmd_t *pmdp)
 {
-	if (radix_enabled())
-		return radix__pmdp_huge_get_and_clear(mm, addr, pmdp);
-	return hash__pmdp_huge_get_and_clear(mm, addr, pmdp);
+	pmd_t old_pmd;
+
+	if (radix_enabled()) {
+		old_pmd = radix__pmdp_huge_get_and_clear(mm, addr, pmdp);
+	} else {
+		old_pmd = hash__pmdp_huge_get_and_clear(mm, addr, pmdp);
+	}
+
+	page_table_check_pmd_clear(mm, addr, old_pmd);
+
+	return old_pmd;
 }
 
 #define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR
 static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 					    unsigned long addr, pud_t *pudp)
 {
-	if (radix_enabled())
-		return radix__pudp_huge_get_and_clear(mm, addr, pudp);
-	BUG();
-	return *pudp;
+	pud_t old_pud;
+
+	if (radix_enabled()) {
+		old_pud = radix__pudp_huge_get_and_clear(mm, addr, pudp);
+	} else {
+		BUG();
+	}
+
+	page_table_check_pud_clear(mm, addr, old_pud);
+
+	return old_pud;
 }
 
 static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 9bf3e40f27b645da660cbeeb561f08eeef180b1b..e6da5eaccff632a353139f27bf54472e716ac246 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -29,6 +29,8 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
 
 #ifndef __ASSEMBLER__
 
+#include <linux/page_table_check.h>
+
 extern int icache_44x_need_flush;
 
 #ifndef pte_huge_size
@@ -122,7 +124,11 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pte_t *ptep)
 {
-	return __pte(pte_update(mm, addr, ptep, ~0UL, 0, 0));
+	pte_t old_pte = __pte(pte_update(mm, addr, ptep, ~0UL, 0, 0));
+
+	page_table_check_pte_clear(mm, addr, old_pte);
+
+	return old_pte;
 }
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 82d31177630b810a70c9e7797f1f163fa97ccfaf..ac2a24d15d2e3733bd013eb168b2656ad61e7af7 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -8,6 +8,7 @@
 #include <linux/sched.h>
 #include <linux/mm_types.h>
 #include <linux/mm.h>
+#include <linux/page_table_check.h>
 #include <linux/stop_machine.h>
 
 #include <asm/sections.h>
@@ -230,6 +231,9 @@ pmd_t hash__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addres
 
 	pmd = *pmdp;
 	pmd_clear(pmdp);
+
+	page_table_check_pmd_clear(vma->vm_mm, address, pmd);
+
 	/*
 	 * Wait for all pending hash_page to finish. This is needed
 	 * in case of subpage collapse. When we collapse normal pages
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 97db2f42ea3d3bd476d0ef03da47ff325eb73db9..4b09c04654a8f26e84f811df61461d83ae71f299 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -10,6 +10,7 @@
 #include <linux/pkeys.h>
 #include <linux/debugfs.h>
 #include <linux/proc_fs.h>
+#include <linux/page_table_check.h>
 
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
@@ -127,6 +128,7 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 	WARN_ON(!(pmd_leaf(pmd)));
 #endif
 	trace_hugepage_set_pmd(addr, pmd_val(pmd));
+	page_table_check_pmd_set(mm, addr, pmdp, pmd);
 	return set_pte_at_unchecked(mm, addr, pmdp_ptep(pmdp), pmd_pte(pmd));
 }
 
@@ -144,6 +146,7 @@ void set_pud_at(struct mm_struct *mm, unsigned long addr,
 	WARN_ON(!(pud_leaf(pud)));
 #endif
 	trace_hugepage_set_pud(addr, pud_val(pud));
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	return set_pte_at_unchecked(mm, addr, pudp_ptep(pudp), pud_pte(pud));
 }
 
@@ -179,23 +182,27 @@ void serialize_against_pte_lookup(struct mm_struct *mm)
 pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 		     pmd_t *pmdp)
 {
-	unsigned long old_pmd;
+	pmd_t old_pmd;
 
 	VM_WARN_ON_ONCE(!pmd_present(*pmdp));
-	old_pmd = pmd_hugepage_update(vma->vm_mm, address, pmdp, _PAGE_PRESENT, _PAGE_INVALID);
+	old_pmd = __pmd(pmd_hugepage_update(vma->vm_mm, address, pmdp, _PAGE_PRESENT, _PAGE_INVALID));
 	flush_pmd_tlb_range(vma, address, address + HPAGE_PMD_SIZE);
-	return __pmd(old_pmd);
+	page_table_check_pmd_clear(vma->vm_mm, address, old_pmd);
+
+	return old_pmd;
 }
 
 pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
 		      pud_t *pudp)
 {
-	unsigned long old_pud;
+	pud_t old_pud;
 
 	VM_WARN_ON_ONCE(!pud_present(*pudp));
-	old_pud = pud_hugepage_update(vma->vm_mm, address, pudp, _PAGE_PRESENT, _PAGE_INVALID);
+	old_pud = __pud(pud_hugepage_update(vma->vm_mm, address, pudp, _PAGE_PRESENT, _PAGE_INVALID));
 	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
-	return __pud(old_pud);
+	page_table_check_pud_clear(vma->vm_mm, address, old_pud);
+
+	return old_pud;
 }
 
 pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index b2541bf33d01cbb59562866d844354b39b14a86c..10aced261cff4d39e64407e31ac05e9eb340007b 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/mm.h>
+#include <linux/page_table_check.h>
 #include <linux/hugetlb.h>
 #include <linux/string_helpers.h>
 #include <linux/memory.h>
@@ -1474,6 +1475,8 @@ pmd_t radix__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addre
 	pmd = *pmdp;
 	pmd_clear(pmdp);
 
+	page_table_check_pmd_clear(vma->vm_mm, address, pmd);
+
 	radix__flush_tlb_collapsed_pmd(vma->vm_mm, address);
 
 	return pmd;
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 7b69cd16e011c31fffac2439a76ba20e00fc9a78..a9be337be3e461fdffa7181a87376cd8329aa9e0 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -22,6 +22,7 @@
 #include <linux/mm.h>
 #include <linux/percpu.h>
 #include <linux/hardirq.h>
+#include <linux/page_table_check.h>
 #include <linux/hugetlb.h>
 #include <asm/tlbflush.h>
 #include <asm/tlb.h>
@@ -206,6 +207,9 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 	 * and not hw_valid ptes. Hence there is no translation cache flush
 	 * involved that need to be batched.
 	 */
+
+	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
+
 	for (;;) {
 
 		/*

-- 
2.52.0


