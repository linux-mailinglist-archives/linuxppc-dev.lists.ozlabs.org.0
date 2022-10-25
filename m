Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA3060C2C3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 06:48:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxKFP3Cvbz3cLx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 15:48:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f7C77zBP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f7C77zBP;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxK9M1w29z3bjF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 15:44:38 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29P4HRts005796;
	Tue, 25 Oct 2022 04:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=oCGlfAXpfpsu29ffuxc1iugHB3y6jy0+f83MwZN7MWM=;
 b=f7C77zBPCpG9IjBrsUrO6k9jphGdbxpT4bWnuCezvRjfPlmY/I6Lq54AmaCWmlymIbMn
 KKqiwU/wMUz0X4YUpT9+Mq6Hv5aBs4AULflUriF1jvuozETQ2o5yK7KFP8N2du1QS9zu
 PIUOQxK0tlzP56ThhWi7g+Rq/LS9a4f2SqKl3R/Usi+wg1hGX+qlIoipYkzPC8Q87+iH
 U07s6cOEP+znLDCiw8iPbAABX55KjI7M1cCChP247aC4Z5J/f+pkcEDSStnidu4m38A/
 k3bD1Vtq+DxDn5HuObnLZML0A4dmvwXygzh5y+Z6fMajCOgnJN+bEaCZbcYu1TmUApkp sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke8n58p5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:29 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29P4Z7Ab011292;
	Tue, 25 Oct 2022 04:44:29 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke8n58p52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:29 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29P4LZ4i029629;
	Tue, 25 Oct 2022 04:44:27 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3kc7sj4cf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:27 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29P4ixpU30212354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Oct 2022 04:44:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3638052052;
	Tue, 25 Oct 2022 04:44:25 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8B8245204E;
	Tue, 25 Oct 2022 04:44:24 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 52D4360810;
	Tue, 25 Oct 2022 15:44:21 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 5/7] powerpc/tlb: Add local flush for page given mm_struct and psize
Date: Tue, 25 Oct 2022 15:44:07 +1100
Message-Id: <20221025044409.448755-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025044409.448755-1-bgray@linux.ibm.com>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KN7uxdELg9M3xDbVC1u_RGgeGmCSbTiS
X-Proofpoint-ORIG-GUID: 27bDxsc1YpjLfqoLjCTRS2QJQgLMCbff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_09,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=902 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250024
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
a WARN_ONCE_ON because it is more complicated and not required for
anything as yet.

This removes the need to create a vm_area_struct, which the temporary
patching mm work does not need.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
v9:	* Replace book3s/32/tlbflush.h implementation with warning
---
 arch/powerpc/include/asm/book3s/32/tlbflush.h      | 9 +++++++++
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 5 +++++
 arch/powerpc/include/asm/book3s/64/tlbflush.h      | 8 ++++++++
 arch/powerpc/include/asm/nohash/tlbflush.h         | 8 ++++++++
 4 files changed, 30 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
index ba1743c52b56..14d989d41f75 100644
--- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
 #define _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
 
+#include <asm/bug.h>
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
+	WARN_ONCE(true, "local TLB flush not implemented");
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
index bdaf34ad41ea..432bca4cac62 100644
--- a/arch/powerpc/include/asm/nohash/tlbflush.h
+++ b/arch/powerpc/include/asm/nohash/tlbflush.h
@@ -45,6 +45,12 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma, unsigned lon
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
@@ -58,6 +64,8 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 extern void local_flush_tlb_mm(struct mm_struct *mm);
 extern void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
+extern void local_flush_tlb_page_psize(struct mm_struct *mm,
+				       unsigned long vmaddr, int psize);
 
 extern void __local_flush_tlb_page(struct mm_struct *mm, unsigned long vmaddr,
 				   int tsize, int ind);
-- 
2.37.3

