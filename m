Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F7E5E9B5C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 10:00:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbZtX2crXz3f2j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 18:00:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LtlpKd/N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LtlpKd/N;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbZrn24kWz3c1c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 17:58:48 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q7i664025643;
	Mon, 26 Sep 2022 07:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BB+wh6wtHe+dAe2OZxFE8O58dZG4JU517/mlnl4dS/s=;
 b=LtlpKd/N9b4ZwJSiKSARqGjuN6HdPm43UZP0E54iNSsPqys/fr+FT92fTY529hxMfqx8
 ek0fu6bJWM3i0/2FuY08W0aOLI4LJ5hkt4oaFUoSen0lp3LXOWRDj1h+VqbocfWaotla
 qm9eWHVoGJa0cAyQItqjeOTWxScRDtGDRy/6bGrvDVcHkeRFpaq+tqF0tRsW5HZ8BEly
 EdOf3LlF9egOpjpxJIo/cbl5SalBNYqTrbvTat1/j1aa8CD6HPZzJ00/YgkAI/xYkum0
 Uu6PnVk/qa/Y7nO1ErEhg35PC1SrQ8UF17FHzLI2KNlyvHPQI3/+CsuaxOZ7/kugEomN VQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ju7pr8qtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 07:58:44 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28Q7plv4013174;
	Mon, 26 Sep 2022 07:57:42 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3jssh9a3kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 07:57:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28Q7rScD36635020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Sep 2022 07:53:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A304811C05B;
	Mon, 26 Sep 2022 07:57:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E6B711C054;
	Mon, 26 Sep 2022 07:57:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 26 Sep 2022 07:57:39 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 23C7F6057F;
	Mon, 26 Sep 2022 17:57:36 +1000 (AEST)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/4] powerpc/64s: Remove unneeded #ifdef CONFIG_DEBUG_PAGEALLOC in hash_utils
Date: Mon, 26 Sep 2022 07:57:24 +0000
Message-Id: <20220926075726.2846-2-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926075726.2846-1-nicholas@linux.ibm.com>
References: <20220926075726.2846-1-nicholas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IvsUPknRUhWqBVShpxAbcKTuNM0r9Stm
X-Proofpoint-ORIG-GUID: IvsUPknRUhWqBVShpxAbcKTuNM0r9Stm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_05,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260043
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

From: Christophe Leroy <christophe.leroy@csgroup.eu>

debug_pagealloc_enabled() is always defined and constant folds to
'false' when CONFIG_DEBUG_PAGEALLOC is not enabled.

Remove the #ifdefs, the code and associated static variables will
be optimised out by the compiler when CONFIG_DEBUG_PAGEALLOC is
not defined.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index fc92613dc2bf..e63ff401a6ea 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -123,11 +123,8 @@ EXPORT_SYMBOL_GPL(mmu_slb_size);
 #ifdef CONFIG_PPC_64K_PAGES
 int mmu_ci_restrictions;
 #endif
-#ifdef CONFIG_DEBUG_PAGEALLOC
 static u8 *linear_map_hash_slots;
 static unsigned long linear_map_hash_count;
-static DEFINE_SPINLOCK(linear_map_hash_lock);
-#endif /* CONFIG_DEBUG_PAGEALLOC */
 struct mmu_hash_ops mmu_hash_ops;
 EXPORT_SYMBOL(mmu_hash_ops);
 
@@ -427,11 +424,9 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 			break;
 
 		cond_resched();
-#ifdef CONFIG_DEBUG_PAGEALLOC
 		if (debug_pagealloc_enabled() &&
 			(paddr >> PAGE_SHIFT) < linear_map_hash_count)
 			linear_map_hash_slots[paddr >> PAGE_SHIFT] = ret | 0x80;
-#endif /* CONFIG_DEBUG_PAGEALLOC */
 	}
 	return ret < 0 ? ret : 0;
 }
@@ -1066,7 +1061,6 @@ static void __init htab_initialize(void)
 
 	prot = pgprot_val(PAGE_KERNEL);
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
 	if (debug_pagealloc_enabled()) {
 		linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
 		linear_map_hash_slots = memblock_alloc_try_nid(
@@ -1076,7 +1070,6 @@ static void __init htab_initialize(void)
 			panic("%s: Failed to allocate %lu bytes max_addr=%pa\n",
 			      __func__, linear_map_hash_count, &ppc64_rma_size);
 	}
-#endif /* CONFIG_DEBUG_PAGEALLOC */
 
 	/* create bolted the linear mapping in the hash table */
 	for_each_mem_range(i, &base, &end) {
@@ -1991,6 +1984,8 @@ long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
+static DEFINE_SPINLOCK(linear_map_hash_lock);
+
 static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 {
 	unsigned long hash;
-- 
2.34.1

