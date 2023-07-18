Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 245627571E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 04:42:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=koVSyh8T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4jsX08G9z3ckp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:42:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=koVSyh8T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4jcq4Q8Qz300f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 12:31:23 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36I22tdw028188;
	Tue, 18 Jul 2023 02:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XCQvO4AMwAl3UVUAgFYIr0Tyqbjq93TFj9IeImIxS/c=;
 b=koVSyh8TTP4JpgNw+6IrFaNhVGR/n3nMNDCCKrhgqhuhCk5jR3WZYFRDF3g2RRUKTOK1
 sxIBAxBCnKqvHC+qJ5P6e5ejalPquSFcot3kidgftuGoI8z9rw34nIrgGtRsQT0ne8dr
 8Mkb0FApg+VsWIxbagdk3/BrCgeIykJ7u6L4zub7Ng4yY8Cs//j5LqwF3aMMvyaEn6j/
 8HdbtMH2nBlEnmGyBTinMu1OShhkXw5uFGOrKMh16lotjRUw8vwfX2CWrBotOFTVudbL
 SEhy+WDNUbufjGpa7oXv5ZvnqeN66eDjCZ3l5nHYgxS9G6YLS8lt3zG0azl9DPM7hqSm yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwhksgmmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:31:00 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36I2PZ9p004618;
	Tue, 18 Jul 2023 02:30:59 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwhksgmm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:59 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36HMo58M016880;
	Tue, 18 Jul 2023 02:30:58 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv5srmrdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:58 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36I2UvRI55312664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 02:30:58 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA40158057;
	Tue, 18 Jul 2023 02:30:57 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6D2F58064;
	Tue, 18 Jul 2023 02:30:52 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.62.199])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Jul 2023 02:30:52 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v5 13/13] powerpc/book3s64/radix: Add debug message to give more details of vmemmap allocation
Date: Tue, 18 Jul 2023 07:59:33 +0530
Message-ID: <20230718022934.90447-14-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
References: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: THKORosA-E6gq1GbH_AJ8roPk4CkfDLz
X-Proofpoint-ORIG-GUID: N271qjflk5lA9Iab8e12PGo5M26ghhsz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307180017
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

