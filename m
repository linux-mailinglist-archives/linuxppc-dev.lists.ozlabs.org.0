Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D186D3C84AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 14:49:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPy4R5d96z308m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 22:49:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VWf26k1k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=wnpg=mg=linux.ibm.com=hbathini@ozlabs.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VWf26k1k; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPy3w2y6Xz2ydK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 22:48:44 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4GPy3m15K6z9sXh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 22:48:36 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4GPy3l4s1Lz9sXN; Wed, 14 Jul 2021 22:48:35 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VWf26k1k; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4GPy3j3nF9z9sRR;
 Wed, 14 Jul 2021 22:48:30 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16ECmQf9009793; Wed, 14 Jul 2021 08:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=L2CYNOGRnUgkSItJv1nhqAlJlgH9/N0oRnq3YLmNOT4=;
 b=VWf26k1k6LU98xOAQcN7tohUBR6z+ZiSf2dZ8u7N2TH+tvSMxS3iBWUgAzNEc45q/8fw
 H9AWuGk7rnr0KqkDmkrmkcLKIxxjytf95C+fyNJx74sneis9MJRuUtVmpRgXCOpyWCOl
 Eohm/30xRxdkM+MGXbYJkX28Hi0tTPVNzZD/orcHg8DqAWTMpwoyYkiC7f5zkBNwS68w
 t7K8Bu4yYF+7O3D9fOnF1e4n8ikSLtsxG/Q3dvjfzabCm5Q+PcxFmt2j7lefhE97Zzsu
 hELWUXQqE5BxLhHE4wIYPpFDzegbDG+3gf57wazoQu+3FOSNwhdZoWIAnck6XhPNb2aT 2A== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39s8vgj61a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 08:48:28 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16ECm4oL030892;
 Wed, 14 Jul 2021 12:48:04 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 39q368gxq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:48:03 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16ECm0e429491634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 12:48:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C20511C050;
 Wed, 14 Jul 2021 12:48:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C17511C05E;
 Wed, 14 Jul 2021 12:47:59 +0000 (GMT)
Received: from hbathini-workstation.ibm.com (unknown [9.85.91.87])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Jul 2021 12:47:59 +0000 (GMT)
Subject: [PATCH] powerpc/kexec: blacklist functions called in real mode for
 kprobe
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 14 Jul 2021 18:17:58 +0530
Message-ID: <162626687834.155313.4692863392927831843.stgit@hbathini-workstation.ibm.com>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FXg1ABHxlPEPL4FVjgWG4VEVSiDLMpBH
X-Proofpoint-GUID: FXg1ABHxlPEPL4FVjgWG4VEVSiDLMpBH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_06:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1011 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140077
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As kprobe does not handle events happening in real mode, blacklist the
functions that only get called in real mode or in kexec sequence with
MMU turned off.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/head_64.S            |    2 ++
 arch/powerpc/kexec/core_64.c             |    6 ++++--
 arch/powerpc/mm/book3s64/hash_native.c   |    2 +-
 arch/powerpc/mm/book3s64/pgtable.c       |    4 ++--
 arch/powerpc/mm/book3s64/radix_pgtable.c |    3 ++-
 arch/powerpc/platforms/ps3/htab.c        |    3 ++-
 arch/powerpc/platforms/ps3/mm.c          |    8 ++++++--
 arch/powerpc/platforms/pseries/lpar.c    |    9 ++++++---
 8 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 79930b0bc781..f17ae2083733 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -712,6 +712,8 @@ _GLOBAL(copy_and_flush)
 	isync
 	blr
 
+_ASM_NOKPROBE_SYMBOL(copy_and_flush); /* Called in real mode */
+
 .align 8
 copy_to_here:
 
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 8a449b2d8715..84618d3c8013 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -72,7 +72,8 @@ int default_machine_kexec_prepare(struct kimage *image)
 	return 0;
 }
 
-static void copy_segments(unsigned long ind)
+/* Called during kexec sequence with MMU off */
+static notrace void copy_segments(unsigned long ind)
 {
 	unsigned long entry;
 	unsigned long *ptr;
@@ -105,7 +106,8 @@ static void copy_segments(unsigned long ind)
 	}
 }
 
-void kexec_copy_flush(struct kimage *image)
+/* Called during kexec sequence with MMU off */
+notrace void kexec_copy_flush(struct kimage *image)
 {
 	long i, nr_segments = image->nr_segments;
 	struct  kexec_segment ranges[KEXEC_SEGMENT_MAX];
diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index 52e170bd95ae..d8279bfe68ea 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -787,7 +787,7 @@ static void hpte_decode(struct hash_pte *hpte, unsigned long slot,
  * TODO: add batching support when enabled.  remember, no dynamic memory here,
  * although there is the control page available...
  */
-static void native_hpte_clear(void)
+static notrace void native_hpte_clear(void)
 {
 	unsigned long vpn = 0;
 	unsigned long slot, slots;
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 9ffa65074cb0..300099de553b 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -172,8 +172,8 @@ pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-/* For use by kexec */
-void mmu_cleanup_all(void)
+/* For use by kexec, called with MMU off */
+notrace void mmu_cleanup_all(void)
 {
 	if (radix_enabled())
 		radix__mmu_cleanup_all();
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index e50ddf129c15..ae20add7954a 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -679,7 +679,8 @@ void radix__early_init_mmu_secondary(void)
 	mtspr(SPRN_UAMOR, 0);
 }
 
-void radix__mmu_cleanup_all(void)
+/* Called during kexec sequence with MMU off */
+notrace void radix__mmu_cleanup_all(void)
 {
 	unsigned long lpcr;
 
diff --git a/arch/powerpc/platforms/ps3/htab.c b/arch/powerpc/platforms/ps3/htab.c
index 7ddc7ec6a7c0..ef710a715903 100644
--- a/arch/powerpc/platforms/ps3/htab.c
+++ b/arch/powerpc/platforms/ps3/htab.c
@@ -169,7 +169,8 @@ static void ps3_hpte_invalidate(unsigned long slot, unsigned long vpn,
 	spin_unlock_irqrestore(&ps3_htab_lock, flags);
 }
 
-static void ps3_hpte_clear(void)
+/* Called during kexec sequence with MMU off */
+static notrace void ps3_hpte_clear(void)
 {
 	unsigned long hpte_count = (1UL << ppc64_pft_size) >> 4;
 	u64 i;
diff --git a/arch/powerpc/platforms/ps3/mm.c b/arch/powerpc/platforms/ps3/mm.c
index a81eac35d900..9c44f335c0b9 100644
--- a/arch/powerpc/platforms/ps3/mm.c
+++ b/arch/powerpc/platforms/ps3/mm.c
@@ -195,9 +195,11 @@ void __init ps3_mm_vas_create(unsigned long* htab_size)
 
 /**
  * ps3_mm_vas_destroy -
+ *
+ * called during kexec sequence with MMU off.
  */
 
-void ps3_mm_vas_destroy(void)
+notrace void ps3_mm_vas_destroy(void)
 {
 	int result;
 
@@ -1243,9 +1245,11 @@ void __init ps3_mm_init(void)
 
 /**
  * ps3_mm_shutdown - final cleanup of address space
+ *
+ * called during kexec sequence with MMU off.
  */
 
-void ps3_mm_shutdown(void)
+notrace void ps3_mm_shutdown(void)
 {
 	ps3_mm_region_destroy(&map.r1);
 }
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index dab356e3ff87..869ef638698a 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -801,7 +801,8 @@ static long pSeries_lpar_hpte_remove(unsigned long hpte_group)
 	return -1;
 }
 
-static void manual_hpte_clear_all(void)
+/* Called during kexec sequence with MMU off */
+static notrace void manual_hpte_clear_all(void)
 {
 	unsigned long size_bytes = 1UL << ppc64_pft_size;
 	unsigned long hpte_count = size_bytes >> 4;
@@ -834,7 +835,8 @@ static void manual_hpte_clear_all(void)
 	}
 }
 
-static int hcall_hpte_clear_all(void)
+/* Called during kexec sequence with MMU off */
+static notrace int hcall_hpte_clear_all(void)
 {
 	int rc;
 
@@ -845,7 +847,8 @@ static int hcall_hpte_clear_all(void)
 	return rc;
 }
 
-static void pseries_hpte_clear_all(void)
+/* Called during kexec sequence with MMU off */
+static notrace void pseries_hpte_clear_all(void)
 {
 	int rc;
 


