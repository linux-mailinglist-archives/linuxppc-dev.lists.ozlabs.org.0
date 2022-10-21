Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB19606F6B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 07:28:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MttLH0qD9z3f2l
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 16:28:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PKSbkeRP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PKSbkeRP;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MttFG4HSpz3dsL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 16:24:34 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29L4dxmT027556;
	Fri, 21 Oct 2022 05:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Do9srVtQ0CtUtZlo+GVOHZKq+VQG7PPV6A+8YVbfNqE=;
 b=PKSbkeRPO9NH34QWa66YDMWvFCB+AmE1mITs8SIVnIGbHI0dYBHsnlHG0Z4XUKa+Tbad
 bh9igUBUR9xvoQZpBJYCjn6D1Pxb/PjZESmFeihUHXLdSmK5BfUzqexihhvlZtS2g7AJ
 ygmxBiOlXwBlcOf3vB4B5wdwhEhhiu6/s5DwJvuFq1oyzA9h29ipxFG7H28vgzV7vyOp
 zcpn6kIOu1hLaUQ+PjYbjxIGlVaVlvR7ldfsSI+I0aSUU4dYAi4LNKN0cjlPv+xu3g4E
 k5v2JsxICeFi3M8iza4HQNhEAiBoQ+tRvpnjot5/4IVkI1hQR+cLvs8t2RRGEBD8E61f mA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbku7j8hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 05:24:24 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29L4pIRb009656;
	Fri, 21 Oct 2022 05:24:24 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbku7j8h8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 05:24:23 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29L5KMaV029520;
	Fri, 21 Oct 2022 05:24:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 3kajmrtqa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 05:24:21 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29L5OJdU54919520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Oct 2022 05:24:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6026CAE055;
	Fri, 21 Oct 2022 05:24:19 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B510CAE045;
	Fri, 21 Oct 2022 05:24:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 21 Oct 2022 05:24:18 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (unknown [9.177.89.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BC04760153;
	Fri, 21 Oct 2022 16:24:12 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 4/6] powerpc/tlb: Add local flush for page given mm_struct and psize
Date: Fri, 21 Oct 2022 16:22:36 +1100
Message-Id: <20221021052238.580986-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021052238.580986-1-bgray@linux.ibm.com>
References: <20221021052238.580986-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XjxTy3cLAvuqfu05ez-rTCWQ52-7c2V4
X-Proofpoint-ORIG-GUID: QL1xFaoXa8ZeA2hm1c6DCMXJLJacayai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_01,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxlogscore=872
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210210029
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
Cc: ajd@linux.ibm.com, jniethe5@gmail.com, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adds a local TLB flush operation that works given an mm_struct, VA to
flush, and page size representation.

This removes the need to create a vm_area_struct, which the temporary
patching mm work does not need.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/32/tlbflush.h      | 9 +++++++++
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 5 +++++
 arch/powerpc/include/asm/book3s/64/tlbflush.h      | 8 ++++++++
 arch/powerpc/include/asm/nohash/tlbflush.h         | 1 +
 4 files changed, 23 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
index ba1743c52b56..e5a688cebf69 100644
--- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
 #define _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
 
+#include <linux/build_bug.h>
+
 #define MMU_NO_CONTEXT      (0)
 /*
  * TLB flushing for "classic" hash-MMU 32-bit CPUs, 6xx, 7xx, 7xxx
@@ -74,6 +76,13 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma,
 {
 	flush_tlb_page(vma, vmaddr);
 }
+
+static inline void local_flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr, int psize)
+{
+	BUILD_BUG_ON(psize != MMU_PAGE_4K);
+	flush_range(mm, vmaddr, vmaddr + PAGE_SIZE);
+}
+
 static inline void local_flush_tlb_mm(struct mm_struct *mm)
 {
 	flush_tlb_mm(mm);
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index fab8332fe1ad..8fd9dc49b2a1 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -94,6 +94,11 @@ static inline void hash__local_flush_tlb_page(struct vm_area_struct *vma,
 {
 }
 
+static inline void hash__local_flush_tlb_page_psize(struct mm_struct *mm,
+						    unsigned long vmaddr, int psize)
+{
+}
+
 static inline void hash__flush_tlb_page(struct vm_area_struct *vma,
 				    unsigned long vmaddr)
 {
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 67655cd60545..2d839dd5c08c 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -92,6 +92,14 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma,
 	return hash__local_flush_tlb_page(vma, vmaddr);
 }
 
+static inline void local_flush_tlb_page_psize(struct mm_struct *mm,
+					      unsigned long vmaddr, int psize)
+{
+	if (radix_enabled())
+		return radix__local_flush_tlb_page_psize(mm, vmaddr, psize);
+	return hash__local_flush_tlb_page_psize(mm, vmaddr, psize);
+}
+
 static inline void local_flush_all_mm(struct mm_struct *mm)
 {
 	if (radix_enabled())
diff --git a/arch/powerpc/include/asm/nohash/tlbflush.h b/arch/powerpc/include/asm/nohash/tlbflush.h
index bdaf34ad41ea..59bce0ebdcf4 100644
--- a/arch/powerpc/include/asm/nohash/tlbflush.h
+++ b/arch/powerpc/include/asm/nohash/tlbflush.h
@@ -58,6 +58,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 extern void local_flush_tlb_mm(struct mm_struct *mm);
 extern void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
+extern void local_flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr, int psize);
 
 extern void __local_flush_tlb_page(struct mm_struct *mm, unsigned long vmaddr,
 				   int tsize, int ind);
-- 
2.37.3

