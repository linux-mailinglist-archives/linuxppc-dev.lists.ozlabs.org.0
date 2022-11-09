Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B7462233C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 05:52:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Xdf5x9bz3cH0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 15:52:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WhuO6UEX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WhuO6UEX;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Xch3nfVz3c6d
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 15:51:47 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A92j5Ks025125;
	Wed, 9 Nov 2022 04:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=ZBGUMPUY3g5BSAqg/1MCPVUPaWexqPyHy60P3/pyn74=;
 b=WhuO6UEXB5nMuTBRgT22S3knYgYMpaoYo0ShGhjUzwzPxt64LLNZLvXvSGyWaVvQwxan
 Z33BXvPpc4v2WBmg57AsFVqZrk08SDhgQdh7ydxdqGQNLQjcDUyQKpf3PrjgaDbNQECW
 f4359DEzjNxqUze932T5uDMHw+XZMXm97bQZ5ucm3v1ETy+61DqW6nKMMxCKWS6JPCJ9
 89ryGRtUha9VsEJr3Jqnd/OqNc3UF4Vm0aAoW5xTC18N5AIh3XhneWlTALaUtRRt2jbE
 cc0/hIFIziBBFhNrDFVbHUaAMzbWLbAiRpvvB8L8huGb++KsVsdtslUN9iIubw4dVKEq +g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr3pv3ucx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:37 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A94KWGK005340;
	Wed, 9 Nov 2022 04:51:37 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr3pv3uc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:37 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A94pOP2014740;
	Wed, 9 Nov 2022 04:51:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3kngqdd1vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:35 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A94pWYA61866490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Nov 2022 04:51:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC3F811C054;
	Wed,  9 Nov 2022 04:51:32 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DD6511C04A;
	Wed,  9 Nov 2022 04:51:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  9 Nov 2022 04:51:32 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E11C960810;
	Wed,  9 Nov 2022 15:51:28 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 6/9] powerpc/mm: Remove flush_all_mm, local_flush_all_mm
Date: Wed,  9 Nov 2022 15:51:09 +1100
Message-Id: <20221109045112.187069-7-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109045112.187069-1-bgray@linux.ibm.com>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xvwrauGG-8GId-2IQK6Ui7Pa9yeOZ6pI
X-Proofpoint-ORIG-GUID: zbzACr4NNjgzWwyllFJHssVzUgRsx9UQ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_01,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=878 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

These functions were introduced for "cxl: Enable global TLBIs for cxl
contexts" [1], which ended up using them for Radix only. They were never
implemented on Hash (and creating an implementation appears to be
difficult), so nothing can actually rely on them.

They behave differently to the existing surrounding functions too, in
that they actually need to do something on Hash. The other functions
are primarily for use in generic code that expects their definitions,
but Hash updates the TLB during PTE updates.

After replacing the only usage with the Radix specific version, there
are no more users of these functions, and given they are not implemented
anyway it is safe to delete them.

[1]: https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20170903181513.29635-1-fbarrat@linux.vnet.ibm.com/

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
v10:	* New in v10 to remove the hash__ set of functions
---
 .../include/asm/book3s/64/tlbflush-hash.h     | 22 -------------------
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 15 -------------
 2 files changed, 37 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 38d31c2489d3..cdbb1a04bb52 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -59,28 +59,6 @@ void flush_hash_range(unsigned long number, int local);
 void flush_hash_hugepage(unsigned long vsid, unsigned long addr, pmd_t *pmdp,
 			 unsigned int psize, int ssize, unsigned long flags);
 
-static inline void hash__local_flush_all_mm(struct mm_struct *mm)
-{
-	/*
-	 * There's no Page Walk Cache for hash, so what is needed is
-	 * the same as flush_tlb_mm(), which doesn't really make sense
-	 * with hash. So the only thing we could do is flush the
-	 * entire LPID! Punt for now, as it's not being used.
-	 */
-	WARN_ON_ONCE(1);
-}
-
-static inline void hash__flush_all_mm(struct mm_struct *mm)
-{
-	/*
-	 * There's no Page Walk Cache for hash, so what is needed is
-	 * the same as flush_tlb_mm(), which doesn't really make sense
-	 * with hash. So the only thing we could do is flush the
-	 * entire LPID! Punt for now, as it's not being used.
-	 */
-	WARN_ON_ONCE(1);
-}
-
 struct mmu_gather;
 void hash__tlb_flush(struct mmu_gather *tlb);
 
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 2254a40f0564..c56a0aee8124 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -86,13 +86,6 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma,
 		radix__local_flush_tlb_page(vma, vmaddr);
 }
 
-static inline void local_flush_all_mm(struct mm_struct *mm)
-{
-	if (radix_enabled())
-		return radix__local_flush_all_mm(mm);
-	return hash__local_flush_all_mm(mm);
-}
-
 static inline void tlb_flush(struct mmu_gather *tlb)
 {
 	if (radix_enabled())
@@ -112,17 +105,9 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
 	if (radix_enabled())
 		radix__flush_tlb_page(vma, vmaddr);
 }
-
-static inline void flush_all_mm(struct mm_struct *mm)
-{
-	if (radix_enabled())
-		return radix__flush_all_mm(mm);
-	return hash__flush_all_mm(mm);
-}
 #else
 #define flush_tlb_mm(mm)		local_flush_tlb_mm(mm)
 #define flush_tlb_page(vma, addr)	local_flush_tlb_page(vma, addr)
-#define flush_all_mm(mm)		local_flush_all_mm(mm)
 #endif /* CONFIG_SMP */
 
 #define flush_tlb_fix_spurious_fault flush_tlb_fix_spurious_fault
-- 
2.38.1

