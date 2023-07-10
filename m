Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B867B74DB5E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 18:45:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DUaNIuXj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R08yY4FgQz3c5Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 02:45:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DUaNIuXj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R08xc3Qvvz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 02:45:08 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36AGHurW010516;
	Mon, 10 Jul 2023 16:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XCQvO4AMwAl3UVUAgFYIr0Tyqbjq93TFj9IeImIxS/c=;
 b=DUaNIuXjPrGAiW08/9O5WqZ2YaewIiMP/qiGskSPK7RG0ORefyt6HgdTiE3dSMgFhPBG
 xlYhxs+iW9uF5yKJ97lyH0Ev1WTLZ4qjPM2SdRSIPejtS5zLInQM5fwCrGJomDTC2XqN
 MPelDvTB8c+uRLWwuYs1C+WiRMO112fllJWVDrWN/YpEv9FXyPD9T6AtMl8iV6jc2RnG
 nQ79QDbpYRxvhtS+pG9jWQMNhzpk/E3uGNkbCpPjVGlfajJnmRLNU5djEnhrmI8V3RGB
 6Q+SI5vod/8mFiyltET+jWxOlR6FlbkW+QLW/urL9n+WTdw6TGg0vpidvsywBJAZc5w8 tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrnckrk8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 16:44:48 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36AGbN0v001960;
	Mon, 10 Jul 2023 16:44:48 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrnckrk89-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 16:44:48 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36AEDLte016682;
	Mon, 10 Jul 2023 16:10:19 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3rpye60kx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 16:10:19 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36AGAImU64094606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Jul 2023 16:10:18 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0F5D5803F;
	Mon, 10 Jul 2023 16:10:18 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF7E058056;
	Mon, 10 Jul 2023 16:10:12 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.9.86])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Jul 2023 16:10:12 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v4 13/13] powerpc/book3s64/radix: Add debug message to give more details of vmemmap allocation
Date: Mon, 10 Jul 2023 21:38:42 +0530
Message-ID: <20230710160842.56300-14-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
References: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UKYBQNzylw66poHeRX3bseGikd3W8RyS
X-Proofpoint-ORIG-GUID: GCRqle8WNpa5R1TL9XzHcq0-XjHrQdOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307100149
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add some extra vmemmap pr_debug message that will indicate the type of
vmemmap allocations.

For ex: with DAX vmemmap optimization we can find the below details:
[  187.166580] radix-mmu: PAGE_SIZE vmemmap mapping
[  187.166587] radix-mmu: PAGE_SIZE vmemmap mapping
[  187.166591] radix-mmu: Tail page reuse vmemmap mapping
[  187.166594] radix-mmu: Tail page reuse vmemmap mapping
[  187.166598] radix-mmu: Tail page reuse vmemmap mapping
[  187.166601] radix-mmu: Tail page reuse vmemmap mapping
[  187.166604] radix-mmu: Tail page reuse vmemmap mapping
[  187.166608] radix-mmu: Tail page reuse vmemmap mapping
[  187.166611] radix-mmu: Tail page reuse vmemmap mapping
[  187.166614] radix-mmu: Tail page reuse vmemmap mapping
[  187.166617] radix-mmu: Tail page reuse vmemmap mapping
[  187.166620] radix-mmu: Tail page reuse vmemmap mapping
[  187.166623] radix-mmu: Tail page reuse vmemmap mapping
[  187.166626] radix-mmu: Tail page reuse vmemmap mapping
[  187.166629] radix-mmu: Tail page reuse vmemmap mapping
[  187.166632] radix-mmu: Tail page reuse vmemmap mapping

And without vmemmap optimization
[  293.549931] radix-mmu: PMD_SIZE vmemmap mapping
[  293.549984] radix-mmu: PMD_SIZE vmemmap mapping
[  293.550032] radix-mmu: PMD_SIZE vmemmap mapping
[  293.550076] radix-mmu: PMD_SIZE vmemmap mapping
[  293.550117] radix-mmu: PMD_SIZE vmemmap mapping

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 73d0987369ff..2828e7e0802c 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1034,6 +1034,7 @@ static pte_t * __meminit radix__vmemmap_pte_populate(pmd_t *pmdp, unsigned long
 				p = vmemmap_alloc_block_buf(PAGE_SIZE, node, NULL);
 			if (!p)
 				return NULL;
+			pr_debug("PAGE_SIZE vmemmap mapping\n");
 		} else {
 			/*
 			 * When a PTE/PMD entry is freed from the init_mm
@@ -1046,6 +1047,7 @@ static pte_t * __meminit radix__vmemmap_pte_populate(pmd_t *pmdp, unsigned long
 			 */
 			get_page(reuse);
 			p = page_to_virt(reuse);
+			pr_debug("Tail page reuse vmemmap mapping\n");
 		}
 
 		VM_BUG_ON(!PAGE_ALIGNED(addr));
@@ -1155,6 +1157,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 			p = vmemmap_alloc_block_buf(PMD_SIZE, node, altmap);
 			if (p) {
 				vmemmap_set_pmd(pmd, p, node, addr, next);
+				pr_debug("PMD_SIZE vmemmap mapping\n");
 				continue;
 			} else if (altmap) {
 				/*
-- 
2.41.0

