Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE4C5E9B4F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 09:58:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbZrJ6pSYz3bpW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 17:58:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LmnamC3n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LmnamC3n;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbZqc0mJQz2xmw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 17:57:47 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q7WAjJ027373
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=5bU3hGFBybDOgNLs/7513B7uqZ31IwyQ+jEC0gDsh6s=;
 b=LmnamC3nAqSCDgafnpOc3SvJDhCWia6775IleuvBUAVhSjY0Vh+spLJx1Qi7RWtKSRVf
 rp+t21Gvke0MkUnpoTf5k2+QhmrXgAG+FcCySc+TPd4MzT9v/r1tAy7TbTpp895ls0HK
 c3Sutc6KM/K7J3BPuGegJKO9erykpyKc2uypN34B+xdr0HNvCEyJPCTzwEd6Ca/a86P+
 QkEesBPAWTZvZ0c7lTRULoVqyRqgmYpWNng/lXbhwKtU4bEytCaA55IemmAEWO6TChBx
 I7DPpVmRvIkuSclZkN08sPS68hCBsB4N9xFYmhaGy11RgtH3bnY2pwQkcPaEp3x3oeI+ vg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ju7sc0t1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:57:44 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28Q7paiT025630
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:57:42 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma02fra.de.ibm.com with ESMTP id 3jssh91j95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:57:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28Q7rSY515794554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:53:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A261411C04A
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:57:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E53611C050
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:57:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:57:39 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8692D6016C;
	Mon, 26 Sep 2022 17:57:34 +1000 (AEST)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/4] powerpc/64s: Add DEBUG_PAGEALLOC for radix
Date: Mon, 26 Sep 2022 07:57:23 +0000
Message-Id: <20220926075726.2846-1-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AT8YxMHtMNJ9ig98QQ39fao5dWkyi7GA
X-Proofpoint-ORIG-GUID: AT8YxMHtMNJ9ig98QQ39fao5dWkyi7GA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_05,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=964 bulkscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260046
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
Cc: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is support for DEBUG_PAGEALLOC on hash but not on radix.
Add support on radix.

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
v2: Revert change to radix_memory_block_size, instead set the size
in radix_init_pgtable and radix__create_section_mapping directly.
v3: Remove max_mapping_size argument of create_physical_mapping
as the value is the same at all call sites.
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index db2f3d193448..daa40e3b74dd 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -30,6 +30,7 @@
 #include <asm/trace.h>
 #include <asm/uaccess.h>
 #include <asm/ultravisor.h>
+#include <asm/set_memory.h>
 
 #include <trace/events/thp.h>
 
@@ -267,13 +268,16 @@ static unsigned long next_boundary(unsigned long addr, unsigned long end)
 
 static int __meminit create_physical_mapping(unsigned long start,
 					     unsigned long end,
-					     unsigned long max_mapping_size,
 					     int nid, pgprot_t _prot)
 {
 	unsigned long vaddr, addr, mapping_size = 0;
 	bool prev_exec, exec = false;
 	pgprot_t prot;
 	int psize;
+	unsigned long max_mapping_size = radix_mem_block_size;
+
+	if (debug_pagealloc_enabled())
+		max_mapping_size = PAGE_SIZE;
 
 	start = ALIGN(start, PAGE_SIZE);
 	end   = ALIGN_DOWN(end, PAGE_SIZE);
@@ -352,7 +356,6 @@ static void __init radix_init_pgtable(void)
 		}
 
 		WARN_ON(create_physical_mapping(start, end,
-						radix_mem_block_size,
 						-1, PAGE_KERNEL));
 	}
 
@@ -850,7 +853,7 @@ int __meminit radix__create_section_mapping(unsigned long start,
 	}
 
 	return create_physical_mapping(__pa(start), __pa(end),
-				       radix_mem_block_size, nid, prot);
+				       nid, prot);
 }
 
 int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
@@ -899,7 +902,14 @@ void __meminit radix__vmemmap_remove_mapping(unsigned long start, unsigned long
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void radix__kernel_map_pages(struct page *page, int numpages, int enable)
 {
-	pr_warn_once("DEBUG_PAGEALLOC not supported in radix mode\n");
+	unsigned long addr;
+
+	addr = (unsigned long)page_address(page);
+
+	if (enable)
+		set_memory_p(addr, numpages);
+	else
+		set_memory_np(addr, numpages);
 }
 #endif
 
-- 
2.34.1

