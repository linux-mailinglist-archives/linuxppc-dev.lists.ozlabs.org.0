Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3938A62233E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 05:54:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Xgk096tz3cMm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 15:54:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wl5I8IDd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wl5I8IDd;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Xch3hMXz3blY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 15:51:47 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A94RLjN004491;
	Wed, 9 Nov 2022 04:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BAXYPwRO5H3/zuF3seZiIEZEJavGQnxQe47vALPESsU=;
 b=Wl5I8IDdZ5gHPfwPaHszJi1PFoYMdWAGS0OFrLsrZnDjCnMrqTm7G6p6bJflliSnrsyV
 SsiRMm2o9MnWrjSpW+owvJFm5LgQPFE6A6MgU49fjDcIOafk/gyVpAC9LjkZQOH2DD3v
 CxJ/AKoE5r/uc2R63ZA/lpJTp9eRrSUpe3O5gKerKajXvGWLgcNbMkJ0UGMwurRu/BYt
 Oxbv0HQs+y4cpJ1B6AxncoawtvhzyYAhoxRByUZ8gGQ0WfuZBWOaN7BGMBrhNGrlgG4Q
 80LwtXl+RPr8rEJaD6Q6Rcasyq4MlswDNBfXX6dhZNClBjsOsYDFYOTfy1vrplc3p1Xx wg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr56mh8a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:36 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A94V0wB029077;
	Wed, 9 Nov 2022 04:51:36 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr56mh897-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:36 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A94nwrS031085;
	Wed, 9 Nov 2022 04:51:33 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3kngncd3cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:33 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A94jlNO34341354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Nov 2022 04:45:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52CBA11C050;
	Wed,  9 Nov 2022 04:51:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A955511C04A;
	Wed,  9 Nov 2022 04:51:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  9 Nov 2022 04:51:30 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CF05A6038F;
	Wed,  9 Nov 2022 15:51:28 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 4/9] powerpc/mm: Remove empty hash__ functions
Date: Wed,  9 Nov 2022 15:51:07 +1100
Message-Id: <20221109045112.187069-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109045112.187069-1-bgray@linux.ibm.com>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NVG-rvewwQioXGKlKF0NbH_7h5Tb7jZl
X-Proofpoint-ORIG-GUID: iJcPa2vo0jUiZ-Uh94ak5YX8Psazc29p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-08_06,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=972 adultscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090028
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

The empty hash__* functions are unnecessary. The empty definitions were
introduced when 64-bit Hash support was added, as the functions were
still used in generic code. These empty definitions were prefixed with
hash__ when Radix support was added, and new wrappers with the original
names were added that selected the Radix or Hash version based on
radix_enabled().

But the hash__ prefixed functions were not part of a public interface,
so there is no need to include them for compatibility with anything.
Generic code will use the non-prefixed wrappers, and Hash specific code
will know that there is no point in calling them (or even worse, call
them and expect them to do something).

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
v10:	* New in v10 for consistency with new functions
---
 .../include/asm/book3s/64/tlbflush-hash.h     | 28 -------------------
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 27 ++++++------------
 2 files changed, 9 insertions(+), 46 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 3c89e625e620..38d31c2489d3 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -58,13 +58,6 @@ void flush_hash_page(unsigned long vpn, real_pte_t pte, int psize, int ssize,
 void flush_hash_range(unsigned long number, int local);
 void flush_hash_hugepage(unsigned long vsid, unsigned long addr, pmd_t *pmdp,
 			 unsigned int psize, int ssize, unsigned long flags);
-static inline void hash__local_flush_tlb_mm(struct mm_struct *mm)
-{
-}
-
-static inline void hash__flush_tlb_mm(struct mm_struct *mm)
-{
-}
 
 static inline void hash__local_flush_all_mm(struct mm_struct *mm)
 {
@@ -88,27 +81,6 @@ static inline void hash__flush_all_mm(struct mm_struct *mm)
 	WARN_ON_ONCE(1);
 }
 
-static inline void hash__local_flush_tlb_page(struct vm_area_struct *vma,
-					  unsigned long vmaddr)
-{
-}
-
-static inline void hash__flush_tlb_page(struct vm_area_struct *vma,
-				    unsigned long vmaddr)
-{
-}
-
-static inline void hash__flush_tlb_range(struct vm_area_struct *vma,
-				     unsigned long start, unsigned long end)
-{
-}
-
-static inline void hash__flush_tlb_kernel_range(unsigned long start,
-					    unsigned long end)
-{
-}
-
-
 struct mmu_gather;
 void hash__tlb_flush(struct mmu_gather *tlb);
 
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 67655cd60545..2254a40f0564 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -47,8 +47,7 @@ static inline void flush_pmd_tlb_range(struct vm_area_struct *vma,
 				       unsigned long start, unsigned long end)
 {
 	if (radix_enabled())
-		return radix__flush_pmd_tlb_range(vma, start, end);
-	return hash__flush_tlb_range(vma, start, end);
+		radix__flush_pmd_tlb_range(vma, start, end);
 }
 
 #define __HAVE_ARCH_FLUSH_HUGETLB_TLB_RANGE
@@ -57,39 +56,34 @@ static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
 					   unsigned long end)
 {
 	if (radix_enabled())
-		return radix__flush_hugetlb_tlb_range(vma, start, end);
-	return hash__flush_tlb_range(vma, start, end);
+		radix__flush_hugetlb_tlb_range(vma, start, end);
 }
 
 static inline void flush_tlb_range(struct vm_area_struct *vma,
 				   unsigned long start, unsigned long end)
 {
 	if (radix_enabled())
-		return radix__flush_tlb_range(vma, start, end);
-	return hash__flush_tlb_range(vma, start, end);
+		radix__flush_tlb_range(vma, start, end);
 }
 
 static inline void flush_tlb_kernel_range(unsigned long start,
 					  unsigned long end)
 {
 	if (radix_enabled())
-		return radix__flush_tlb_kernel_range(start, end);
-	return hash__flush_tlb_kernel_range(start, end);
+		radix__flush_tlb_kernel_range(start, end);
 }
 
 static inline void local_flush_tlb_mm(struct mm_struct *mm)
 {
 	if (radix_enabled())
-		return radix__local_flush_tlb_mm(mm);
-	return hash__local_flush_tlb_mm(mm);
+		radix__local_flush_tlb_mm(mm);
 }
 
 static inline void local_flush_tlb_page(struct vm_area_struct *vma,
 					unsigned long vmaddr)
 {
 	if (radix_enabled())
-		return radix__local_flush_tlb_page(vma, vmaddr);
-	return hash__local_flush_tlb_page(vma, vmaddr);
+		radix__local_flush_tlb_page(vma, vmaddr);
 }
 
 static inline void local_flush_all_mm(struct mm_struct *mm)
@@ -102,24 +96,21 @@ static inline void local_flush_all_mm(struct mm_struct *mm)
 static inline void tlb_flush(struct mmu_gather *tlb)
 {
 	if (radix_enabled())
-		return radix__tlb_flush(tlb);
-	return hash__tlb_flush(tlb);
+		radix__tlb_flush(tlb);
 }
 
 #ifdef CONFIG_SMP
 static inline void flush_tlb_mm(struct mm_struct *mm)
 {
 	if (radix_enabled())
-		return radix__flush_tlb_mm(mm);
-	return hash__flush_tlb_mm(mm);
+		radix__flush_tlb_mm(mm);
 }
 
 static inline void flush_tlb_page(struct vm_area_struct *vma,
 				  unsigned long vmaddr)
 {
 	if (radix_enabled())
-		return radix__flush_tlb_page(vma, vmaddr);
-	return hash__flush_tlb_page(vma, vmaddr);
+		radix__flush_tlb_page(vma, vmaddr);
 }
 
 static inline void flush_all_mm(struct mm_struct *mm)
-- 
2.38.1

