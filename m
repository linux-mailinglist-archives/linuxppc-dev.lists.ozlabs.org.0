Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E02E242588
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 08:39:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRKnR2jKZzDqTP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 16:39:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BEjXLNGY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRKgJ2hfLzDqQ9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 16:34:36 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07C6WiLg050542; Wed, 12 Aug 2020 02:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=szU68rPUX/AfgNy1BXm8Zx5Os8c/TkQtJ+EKW2ihKoQ=;
 b=BEjXLNGYi5hE+BzbqAFOqCagLnpTl9PnsU9exSc6gxnGo+xltHx+4k7lMhUKUdsDhKnE
 xT5WieCxdg85Sd8FJ0V7rbUw0jYVEyrPFFOQ+RHnmRE1+P5m4idy5wOt+t2qijfnuhdG
 IfourM72OrQ+dUqgo+eLo827yGk0r/c/CJtesYlcV23SuZN6v0GXRU2tObETMbn4MbBa
 hJjA+gA3k1GZ/VAv11gGQwbLr72L2Oy0ZnH94lX4H2+J9BwFPRjGMvAqO09MItaL2QVp
 LHSwR1QSJ5850epg7leiBuiVTvahHte8e0oa/kJSQZcTYCfky/BHUm3uPpbW33CPeCCu 1A== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32v7nyvsty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 02:34:27 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07C6YKMv007212;
 Wed, 12 Aug 2020 06:34:26 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 32skp97a9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 06:34:26 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07C6YPbf66126238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 06:34:25 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BF4913604F;
 Wed, 12 Aug 2020 06:34:25 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E319F136059;
 Wed, 12 Aug 2020 06:34:22 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.71.109])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 06:34:22 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH 03/16] debug_vm_pgtable/set_pte: Don't use set_pte_at to
 update an existing pte entry
Date: Wed, 12 Aug 2020 12:03:45 +0530
Message-Id: <20200812063358.369514-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-11_19:2020-08-11,
 2020-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 clxscore=1015 adultscore=0 mlxlogscore=674 lowpriorityscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008120047
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

set_pte_at() should not be used to set a pte entry at locations that
already holds a valid pte entry. Architectures like ppc64 don't do TLB
invalidate in set_pte_at() and hence expect it to be used to set locations
that are not a valid PTE.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 4c32063a8acf..02a7c20aa4a2 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -81,8 +81,6 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
 	pte = ptep_get(ptep);
 	WARN_ON(pte_write(pte));
 
-	pte = pfn_pte(pfn, prot);
-	set_pte_at(mm, vaddr, ptep, pte);
 	ptep_get_and_clear(mm, vaddr, ptep);
 	pte = ptep_get(ptep);
 	WARN_ON(!pte_none(pte));
@@ -97,12 +95,14 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
 	pte = ptep_get(ptep);
 	WARN_ON(!(pte_write(pte) && pte_dirty(pte)));
 
-	pte = pfn_pte(pfn, prot);
-	set_pte_at(mm, vaddr, ptep, pte);
 	ptep_get_and_clear_full(mm, vaddr, ptep, 1);
 	pte = ptep_get(ptep);
 	WARN_ON(!pte_none(pte));
 
+	/*
+	 * We should clear pte before we do set_pte_at
+	 */
+	pte = ptep_get_and_clear(mm, vaddr, ptep);
 	pte = pte_mkyoung(pte);
 	set_pte_at(mm, vaddr, ptep, pte);
 	ptep_test_and_clear_young(vma, vaddr, ptep);
-- 
2.26.2

