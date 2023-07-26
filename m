Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C74763450
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 12:53:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hsEWGdoV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9rNw4zD9z3cM7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 20:53:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hsEWGdoV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9rN03dljz2yGb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 20:53:04 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36QAoXIJ001055;
	Wed, 26 Jul 2023 10:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=d5+2tdYkbIJbO93wUKLyfjaX00W9SSUF9S8RoyA4BHI=;
 b=hsEWGdoVwFNE+TLOs4xN6UeiLwVa/yV3b4X+cnnxQOXnbk0QLB0LjP4LJnUioolI6vpx
 VcLZoBIqOAxSRljRhYgqbFoY99cxkdUCX0mywH43SXQod/1Ygh+LA1cAfIYUTkpXyxEn
 hlZvIgEgU7cf2TK8kUeCK6Fa4zsdhQuWFEcpWN3TmF5z3x/pT54AEqzsUQ6kLjXTNzXI
 vrFtJX/GkMgDMV3hVCnDLwJcPn9wN5EPAJeuZCgdkNU2VgEEsUPL+JBWh3aZaU7PeY5Q
 eDGwAVHnMvA6t35IBmfmAVyctw18pTv7sYIE1D4zxUUlqjxNurOTsqtK/nSIbKkPq1zj Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s323dg1w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 10:52:45 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36QAonCL002066;
	Wed, 26 Jul 2023 10:52:44 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s323dg1vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 10:52:44 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q8mMni003624;
	Wed, 26 Jul 2023 10:52:44 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0txk3y7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 10:52:44 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36QAqhwE66322706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jul 2023 10:52:43 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 470245805E;
	Wed, 26 Jul 2023 10:52:43 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9300358051;
	Wed, 26 Jul 2023 10:52:38 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.89.11])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Jul 2023 10:52:38 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v6 01/13 -fix] mm/hugepage pud: Allow arch-specific helper
 function to check huge page pud support
In-Reply-To: <20230724190759.483013-2-aneesh.kumar@linux.ibm.com>
References: <20230724190759.483013-1-aneesh.kumar@linux.ibm.com>
 <20230724190759.483013-2-aneesh.kumar@linux.ibm.com>
Date: Wed, 26 Jul 2023 16:22:36 +0530
Message-ID: <87tttrvtaj.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OKgz1UCF95wC0drZObshdaGpAaaTmzGR
X-Proofpoint-GUID: xa9FGuP4-aeZMH_H1FH9DGC5qvT2TV7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_04,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307260094
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From 81719b31a4e86d2f7352da653175b7c508a94303 Mon Sep 17 00:00:00 2001
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Wed, 26 Jul 2023 13:45:28 +0530
Subject: [PATCH] mm/debug_vm_pgtable: Use the new
 has_transparent_pud_hugepage()

Use the new helper to check pud hugepage support. Architecture like ppc64
will enable the config value CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
and can still have pud hugepage support disabled for hash translation.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index ee2c4c1dcfc8..d61eaa075c75 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -302,7 +302,7 @@ static void __init pud_basic_tests(struct pgtable_debug_args *args, int idx)
 	unsigned long val = idx, *ptr = &val;
 	pud_t pud;
 
-	if (!has_transparent_hugepage())
+	if (!has_transparent_pud_hugepage())
 		return;
 
 	pr_debug("Validating PUD basic (%pGv)\n", ptr);
@@ -343,7 +343,7 @@ static void __init pud_advanced_tests(struct pgtable_debug_args *args)
 	unsigned long vaddr = args->vaddr;
 	pud_t pud;
 
-	if (!has_transparent_hugepage())
+	if (!has_transparent_pud_hugepage())
 		return;
 
 	page = (args->pud_pfn != ULONG_MAX) ? pfn_to_page(args->pud_pfn) : NULL;
@@ -405,7 +405,7 @@ static void __init pud_leaf_tests(struct pgtable_debug_args *args)
 {
 	pud_t pud;
 
-	if (!has_transparent_hugepage())
+	if (!has_transparent_pud_hugepage())
 		return;
 
 	pr_debug("Validating PUD leaf\n");
@@ -732,7 +732,7 @@ static void __init pud_devmap_tests(struct pgtable_debug_args *args)
 {
 	pud_t pud;
 
-	if (!has_transparent_hugepage())
+	if (!has_transparent_pud_hugepage())
 		return;
 
 	pr_debug("Validating PUD devmap\n");
@@ -981,7 +981,7 @@ static void __init pud_thp_tests(struct pgtable_debug_args *args)
 {
 	pud_t pud;
 
-	if (!has_transparent_hugepage())
+	if (!has_transparent_pud_hugepage())
 		return;
 
 	pr_debug("Validating PUD based THP\n");
@@ -1022,8 +1022,7 @@ static void __init destroy_args(struct pgtable_debug_args *args)
 
 	/* Free (huge) page */
 	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
-	    IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) &&
-	    has_transparent_hugepage() &&
+	    has_transparent_pud_hugepage() &&
 	    args->pud_pfn != ULONG_MAX) {
 		if (args->is_contiguous_page) {
 			free_contig_range(args->pud_pfn,
@@ -1274,8 +1273,7 @@ static int __init init_args(struct pgtable_debug_args *args)
 	 * if we fail to allocate (huge) pages.
 	 */
 	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
-	    IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) &&
-	    has_transparent_hugepage()) {
+	    has_transparent_pud_hugepage()) {
 		page = debug_vm_pgtable_alloc_huge_page(args,
 				HPAGE_PUD_SHIFT - PAGE_SHIFT);
 		if (page) {
-- 
2.41.0

