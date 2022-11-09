Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5AE62234B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 06:00:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Xpt1MWtz3fB1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 16:00:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BwVhXEcB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BwVhXEcB;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Xcp1PQsz3cHX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 15:51:54 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A94o65N022618;
	Wed, 9 Nov 2022 04:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nvAJnAz2BvCM831ARLKDo5uCQY1I/wkj5OxZoC9OYus=;
 b=BwVhXEcBAW5rgcN0qtZ8Es7qL2e5UjJvv/nOts3T7EjTgqw/iZarLb0wEGGLImIeYrKD
 UMYkR7xbWm5wzRU4rPZRFrD6HEl/2KXQ/jzfbbLiT1Hz2RhXj/t43hJm4K+KL5DrGO1n
 AwIJkMDZBBlc5RL2dB4z8tqAsari07X5cKdwy5/8fTRAvfQPVnq+bd6/rKKiIwH0XuJu
 /FtnsyI7dmmHj/PlUXzIBDj2BwXkxd377Gsr6QCEds6nolnLErPi9FqpUSKazr/a6qV7
 Vh39vWwgzufnP0980F+5SfYvxgF+rV8LemV8qp0zZ+l15iCj4R1l3QLN5ZlAOsAa59jy jw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqxte47f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:38 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A93vMR9007272;
	Wed, 9 Nov 2022 04:51:37 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqxte47df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:37 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A94oRch020884;
	Wed, 9 Nov 2022 04:51:35 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03fra.de.ibm.com with ESMTP id 3kngp5kpfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:35 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A94jnbi50659686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Nov 2022 04:45:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22072A4051;
	Wed,  9 Nov 2022 04:51:33 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78967A4040;
	Wed,  9 Nov 2022 04:51:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  9 Nov 2022 04:51:32 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EF94060839;
	Wed,  9 Nov 2022 15:51:28 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 7/9] powerpc/tlb: Add local flush for page given mm_struct and psize
Date: Wed,  9 Nov 2022 15:51:10 +1100
Message-Id: <20221109045112.187069-8-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109045112.187069-1-bgray@linux.ibm.com>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m5IG4uaNmfJMMKGi0l4ctWrxkHZ83Agy
X-Proofpoint-ORIG-GUID: VGW1O-1Z-BKTBl3kMC0SnpB-0XCqX7_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-08_06,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211090028
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
flush, and page size representation. Most implementations mirror the
surrounding code. The book3s/32/tlbflush.h implementation is left as
a BUILD_BUG because it is more complicated and not required for
anything as yet.

This removes the need to create a vm_area_struct, which the temporary
patching mm work does not need.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
v10:	* Change warning to BUILD_BUG
v9:	* Replace book3s/32/tlbflush.h implementation with warning
---
 arch/powerpc/include/asm/book3s/32/tlbflush.h | 9 +++++++++
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 7 +++++++
 arch/powerpc/include/asm/nohash/tlbflush.h    | 7 +++++++
 arch/powerpc/mm/nohash/tlb.c                  | 8 ++++++++
 4 files changed, 31 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
index ba1743c52b56..4be572908124 100644
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
+static inline void local_flush_tlb_page_psize(struct mm_struct *mm,
+					      unsigned long vmaddr, int psize)
+{
+	BUILD_BUG();
+}
+
 static inline void local_flush_tlb_mm(struct mm_struct *mm)
 {
 	flush_tlb_mm(mm);
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index c56a0aee8124..dd39313242b4 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -86,6 +86,13 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma,
 		radix__local_flush_tlb_page(vma, vmaddr);
 }
 
+static inline void local_flush_tlb_page_psize(struct mm_struct *mm,
+					      unsigned long vmaddr, int psize)
+{
+	if (radix_enabled())
+		radix__local_flush_tlb_page_psize(mm, vmaddr, psize);
+}
+
 static inline void tlb_flush(struct mmu_gather *tlb)
 {
 	if (radix_enabled())
diff --git a/arch/powerpc/include/asm/nohash/tlbflush.h b/arch/powerpc/include/asm/nohash/tlbflush.h
index 0cef5e4f8d92..d98de9e3896f 100644
--- a/arch/powerpc/include/asm/nohash/tlbflush.h
+++ b/arch/powerpc/include/asm/nohash/tlbflush.h
@@ -44,6 +44,12 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma, unsigned lon
 	asm volatile ("tlbie %0; sync" : : "r" (vmaddr) : "memory");
 }
 
+static inline void local_flush_tlb_page_psize(struct mm_struct *mm,
+					      unsigned long vmaddr, int psize)
+{
+	asm volatile ("tlbie %0; sync" : : "r" (vmaddr) : "memory");
+}
+
 static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
 	start &= PAGE_MASK;
@@ -57,6 +63,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 void local_flush_tlb_mm(struct mm_struct *mm);
 void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
+void local_flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr, int psize);
 
 void __local_flush_tlb_page(struct mm_struct *mm, unsigned long vmaddr,
 			    int tsize, int ind);
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 2c15c86c7015..a903b308acc5 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -184,6 +184,14 @@ void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
 			       mmu_get_tsize(mmu_virtual_psize), 0);
 }
 EXPORT_SYMBOL(local_flush_tlb_page);
+
+void local_flush_tlb_page_psize(struct mm_struct *mm,
+				unsigned long vmaddr, int psize)
+{
+	__local_flush_tlb_page(mm, vmaddr, mmu_get_tsize(psize), 0);
+}
+EXPORT_SYMBOL(local_flush_tlb_page_psize);
+
 #endif
 
 /*
-- 
2.38.1

