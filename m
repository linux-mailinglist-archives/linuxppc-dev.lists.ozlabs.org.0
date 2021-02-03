Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1EA30D2B4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 06:00:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVqHP5HtfzDwx9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 16:00:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=l1OyS3i5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVqFb46R0zDwqd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 15:58:27 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1134YwxG027331; Tue, 2 Feb 2021 23:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=aUiSOJq6MID8SRGL2CwXpBzKwqa2cbBAFjYyXuKqQKc=;
 b=l1OyS3i51ncm9AHea8QVrdN2i/LsoI27DVTIeDGUMM74RaskER3cfD1mnURHPCad9o2W
 u9J5BpJ9y3UjY0xjGRQqJ7+p0qTc7wVps5IzFR2mhWIhFFsJcrCH2ASn2EIJKbHbWjbN
 5WuiyB0HezN+09lKyK+NRNtguAc3vxDoSFx2czD69bUks1XsI9nax5LWo6RdEidtGmRI
 YTuGcRFNwqtjNdOzuc27+kxv/RdKDEXsBTiIUIgWnCtPrVT0KfvlY9TwkDNKS89gd2LG
 kc2VTgV13JYwFH5nD4jXMNPnLeNzdejU+EED3kKcWOnj2HIgBWSVf0g9/kw2PtpYdNd2 mg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fkcntn2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 23:58:22 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1134w84S004160;
 Wed, 3 Feb 2021 04:58:21 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 36f3kv8cyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 04:58:21 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1134wK519503636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 04:58:20 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D63128060;
 Wed,  3 Feb 2021 04:58:20 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A24428058;
 Wed,  3 Feb 2021 04:58:19 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.69.155])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  3 Feb 2021 04:58:18 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 1/3] powerpc/mm: Enable compound page check for both THP and
 HugeTLB
Date: Wed,  3 Feb 2021 10:28:10 +0530
Message-Id: <20210203045812.234439-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_01:2021-02-02,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030024
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

THP config results in compound pages. Make sure the kernel enables
the PageCompound() check with CONFIG_HUGETLB_PAGE disabled and
CONFIG_TRANSPARENT_HUGEPAGE enabled.

This makes sure we correctly flush the icache with THP pages.
flush_dcache_icache_page only matter for platforms that don't support
COHERENT_ICACHE.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/hugetlb.h |  2 --
 arch/powerpc/mm/hugetlbpage.c      | 18 ------------------
 arch/powerpc/mm/mem.c              | 28 ++++++++++++++++++++++------
 3 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index 013165e62618..f18c543bc01d 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -17,8 +17,6 @@ extern bool hugetlb_disabled;
 
 void hugetlbpage_init_default(void);
 
-void flush_dcache_icache_hugepage(struct page *page);
-
 int slice_is_hugepage_only_range(struct mm_struct *mm, unsigned long addr,
 			   unsigned long len);
 
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 8b3cc4d688e8..7bdcb93eebae 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -663,24 +663,6 @@ static int __init hugetlbpage_init(void)
 
 arch_initcall(hugetlbpage_init);
 
-void flush_dcache_icache_hugepage(struct page *page)
-{
-	int i;
-	void *start;
-
-	BUG_ON(!PageCompound(page));
-
-	for (i = 0; i < compound_nr(page); i++) {
-		if (!PageHighMem(page)) {
-			__flush_dcache_icache(page_address(page+i));
-		} else {
-			start = kmap_atomic(page+i);
-			__flush_dcache_icache(start);
-			kunmap_atomic(start);
-		}
-	}
-}
-
 void __init gigantic_hugetlb_cma_reserve(void)
 {
 	unsigned long order = 0;
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index afab328d0887..ed64ca80d5fd 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -494,14 +494,30 @@ void flush_dcache_page(struct page *page)
 }
 EXPORT_SYMBOL(flush_dcache_page);
 
-void flush_dcache_icache_page(struct page *page)
+static void flush_dcache_icache_hugepage(struct page *page)
 {
-#ifdef CONFIG_HUGETLB_PAGE
-	if (PageCompound(page)) {
-		flush_dcache_icache_hugepage(page);
-		return;
+	int i;
+	void *start;
+
+	BUG_ON(!PageCompound(page));
+
+	for (i = 0; i < compound_nr(page); i++) {
+		if (!PageHighMem(page)) {
+			__flush_dcache_icache(page_address(page+i));
+		} else {
+			start = kmap_atomic(page+i);
+			__flush_dcache_icache(start);
+			kunmap_atomic(start);
+		}
 	}
-#endif
+}
+
+void flush_dcache_icache_page(struct page *page)
+{
+
+	if (PageCompound(page))
+		return flush_dcache_icache_hugepage(page);
+
 #if defined(CONFIG_PPC_8xx) || defined(CONFIG_PPC64)
 	/* On 8xx there is no need to kmap since highmem is not supported */
 	__flush_dcache_icache(page_address(page));
-- 
2.29.2

