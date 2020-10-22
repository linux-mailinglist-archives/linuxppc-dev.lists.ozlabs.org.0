Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAEB295B77
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 11:13:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH1qL64H5zDqkB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 20:13:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NsdNlgrZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH1np3VqRzDq7j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 20:11:42 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09M96K77132116; Thu, 22 Oct 2020 05:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=5iESia0HrN0BFigjd3/Hi0G+qlHfTjzk73ldrvqU3hE=;
 b=NsdNlgrZ4SpeepHU/ePaKR34aipWJ3Vc28YVoSEJ10pa8ARzVtrI/gN7RgPZlmJ7LkcY
 n6mT4g06vdotqScyx5jbvb1Ss2i4Bv12h8TNvGMQFeCGd4hPOi6vEcQend3AjYl5jmYg
 kQS2S0cd5dVAfeSR/9SLwOrLsi2NYGJ6g9Agj71qI0Li+UoCpmUite81UZVFtHAX/81R
 lcQ5fENsVEGcbdkJDBIXXIiy1AnHqc7SHXzUh3/v92Rpfo3MC5dZAXtMJiyz3oT3NCwW
 73jRz7X3pO9uMLXx1j//T3IEB/FA2DRNPoAkA0pEODya9o4FKi7Y357kf5lk+tk5Y8C/ HA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34b082aw5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 05:11:33 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09M97Hso003378;
 Thu, 22 Oct 2020 09:11:32 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 347r896tf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 09:11:32 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09M9BQ9b28705184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Oct 2020 09:11:26 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 280FD6A057;
 Thu, 22 Oct 2020 09:11:31 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7964F6A04D;
 Thu, 22 Oct 2020 09:11:28 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.97.120])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 22 Oct 2020 09:11:27 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/mm: move setting pte specific flags to pfn_pmd
Date: Thu, 22 Oct 2020 14:41:15 +0530
Message-Id: <20201022091115.39568-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-22_02:2020-10-20,
 2020-10-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=863
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220060
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
Cc: linux-mm@kvack.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc used to set the pte specific flags in set_pte_at().  This is
different from other architectures. To be consistent with other
architecture powerpc updated pfn_pte to set _PAGE_PTE with
commit 379c926d6334 ("powerpc/mm: move setting pte specific flags to pfn_pte")

The commit didn't do the same w.r.t pfn_pmd because we expect pmd_mkhuge
to do that. But as per Linus that is a bad rule [1].
Hence update pfn_pmd to set _PAGE_PTE.

[1]
" The rule that you must use "pmd_mkhuge()" seems _completely_ wrong.
It's insane. The only valid use to ever make a pmd out of a pfn is to
make a huge-page."

message-id: CAHk-=whG+Z2mBFTT026PZAdjn=gSsLk9bk0wnYJ5peyuVGfwyg@mail.gmail.com

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 17 ++++++++++++++++-
 arch/powerpc/mm/book3s64/pgtable.c           |  8 +++++++-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index cd3feeac6e87..a39886681629 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1231,13 +1231,28 @@ static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
 	return hash__pmd_same(pmd_a, pmd_b);
 }
 
-static inline pmd_t pmd_mkhuge(pmd_t pmd)
+static inline pmd_t __pmd_mkhuge(pmd_t pmd)
 {
 	if (radix_enabled())
 		return radix__pmd_mkhuge(pmd);
 	return hash__pmd_mkhuge(pmd);
 }
 
+/*
+ * pfn_pmd return a pmd_t that can be used as pmd pte entry.
+ */
+static inline pmd_t pmd_mkhuge(pmd_t pmd)
+{
+#ifdef CONFIG_DEBUG_VM
+	if (radix_enabled())
+		WARN_ON((pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE)) == 0);
+	else
+		WARN_ON((pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE | H_PAGE_THP_HUGE)) !=
+			cpu_to_be64(_PAGE_PTE | H_PAGE_THP_HUGE));
+#endif
+	return pmd;
+}
+
 #define __HAVE_ARCH_PMDP_SET_ACCESS_FLAGS
 extern int pmdp_set_access_flags(struct vm_area_struct *vma,
 				 unsigned long address, pmd_t *pmdp,
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index e18ae50a275c..5b3a3bae21aa 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -136,12 +136,18 @@ static pmd_t pmd_set_protbits(pmd_t pmd, pgprot_t pgprot)
 	return __pmd(pmd_val(pmd) | pgprot_val(pgprot));
 }
 
+/*
+ * At some point we should be able to get rid of
+ * pmd_mkhuge() and mk_huge_pmd() when we update all the
+ * other archs to mark the pmd huge in pfn_pmd()
+ */
 pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot)
 {
 	unsigned long pmdv;
 
 	pmdv = (pfn << PAGE_SHIFT) & PTE_RPN_MASK;
-	return pmd_set_protbits(__pmd(pmdv), pgprot);
+
+	return __pmd_mkhuge(pmd_set_protbits(__pmd(pmdv), pgprot));
 }
 
 pmd_t mk_pmd(struct page *page, pgprot_t pgprot)
-- 
2.26.2

