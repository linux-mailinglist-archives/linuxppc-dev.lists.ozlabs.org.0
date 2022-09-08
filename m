Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 739595B1590
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 09:26:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNVzD48t0z3bvZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 17:26:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q02pxcTu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q02pxcTu;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNVyW4wd5z2yxF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 17:25:23 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2887LmTZ000370;
	Thu, 8 Sep 2022 07:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=eo1nB3wQR4aM3QuwAhAABgkjSVASYjD8+z8OeeqpH6Q=;
 b=Q02pxcTuHlbhdVsv8hzr9DyhU58wFeNyF87PNQ+Y+zfDoSxXFjYJ0zLvHCRxVdTcyHMX
 Oi+pkmwUxRPIsK5W957PPtABlHtUPU7Yz+xvmDIIZ/5VKZHxXCjAC2VrM+Cc8Wka0yTr
 fVxi9kSFpbnFsiTneyQbHCqtK1zYyM200EP/4+cyqB8Pf2ywQqsE0XP2RYg9qkkivEDW
 XO3VyeeIkht4UCkZcAPV4Bn5Q4ih6bc06tgZnFhkdV5D5nDRD2kmtkCQrkt+JY7hBHTq
 S53AvwktL2V22zS6IP+u8owvnPbeHZvAhLi8lde1cpIixI29UXazxxbwYfV9YWPQlmPY +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jfbxj838x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Sep 2022 07:25:09 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2887MJMT003815;
	Thu, 8 Sep 2022 07:25:08 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jfbxj8382-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Sep 2022 07:25:08 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2887LgpG019330;
	Thu, 8 Sep 2022 07:25:07 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma04wdc.us.ibm.com with ESMTP id 3jbxj9xtpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Sep 2022 07:25:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2887P7UV5636708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Sep 2022 07:25:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2089AAC059;
	Thu,  8 Sep 2022 07:25:07 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FF77AC05E;
	Thu,  8 Sep 2022 07:25:04 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.97.195])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu,  8 Sep 2022 07:25:04 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc/mm: Fix UBSAN warning reported on hugetlb
Date: Thu,  8 Sep 2022 12:54:40 +0530
Message-Id: <20220908072440.258301-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rBj1vJeVVNSw8fZKXtnAGWLEnSIuDt1A
X-Proofpoint-GUID: -Fs7kPVnkQVzbSkptSZbVmO1PPhuW_nO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_04,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209080025
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Powerpc architecture supports 16GB hugetlb pages with hash translation. For 4K
page size, this is implemented as a hugepage directory entry at PGD level and
for 64K it is implemented as a huge page pte at PUD level

With 16GB hugetlb size, offset within a page is greater than 32 bits. Hence
switch to use unsigned long type when using hugepd_shift.

Inorder to keep things simpler, we make sure we always use unsigned long type
when using hugepd_shift() even though all the hugetlb page size won't require
that.

The walk_hugepd_range change won't have any impact because we don't use that for
the hugetlb walk. That code is needed to support hugepd on init_mm with PPC_8XX
and 8M page. Even though 8M page size won't result in any real issue, we update
that to keep it simpler.

The hugetlb_free_p*d_range changes are all related to nohash usage where we can
have multiple pgd entries pointing to the same hugepd entries. Hence on book3s64
where we can have > 4GB hugetlb page size we will always find more < next even
if we compute the value of more correctly.

Hence there is no functional change in this patch except that it fixes the below
warning.

 UBSAN: shift-out-of-bounds in arch/powerpc/mm/hugetlbpage.c:499:21
 shift exponent 34 is too large for 32-bit type 'int'
 CPU: 39 PID: 1673 Comm: a.out Not tainted 6.0.0-rc2-00327-gee88a56e8517-dirty #1
 Call Trace:
 [c00000002ccb3720] [c000000000cb21e4] dump_stack_lvl+0x98/0xe0 (unreliable)
 [c00000002ccb3760] [c000000000cacf60] ubsan_epilogue+0x18/0x70
 [c00000002ccb37c0] [c000000000cac44c] __ubsan_handle_shift_out_of_bounds+0x1bc/0x390
 [c00000002ccb38c0] [c0000000000d6f78] hugetlb_free_pgd_range+0x5d8/0x600
 [c00000002ccb39f0] [c000000000550e94] free_pgtables+0x114/0x290
 [c00000002ccb3ac0] [c00000000056cbe0] exit_mmap+0x150/0x550
 [c00000002ccb3be0] [c00000000017bf0c] mmput+0xcc/0x210
 [c00000002ccb3c20] [c00000000018f180] do_exit+0x420/0xdd0
 [c00000002ccb3cf0] [c00000000018fcdc] do_group_exit+0x4c/0xd0
 [c00000002ccb3d30] [c00000000018fd84] sys_exit_group+0x24/0x30
 [c00000002ccb3d50] [c00000000003cde0] system_call_exception+0x250/0x600
 [c00000002ccb3e10] [c00000000000c3bc] system_call_common+0xec/0x250

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/hugetlbpage.c | 6 +++---
 mm/pagewalk.c                 | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index bc84a594ca62..d1af03db6181 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -392,7 +392,7 @@ static void hugetlb_free_pmd_range(struct mmu_gather *tlb, pud_t *pud,
 		 * single hugepage, but all of them point to
 		 * the same kmem cache that holds the hugepte.
 		 */
-		more = addr + (1 << hugepd_shift(*(hugepd_t *)pmd));
+		more = addr + (1UL << hugepd_shift(*(hugepd_t *)pmd));
 		if (more > next)
 			next = more;
 
@@ -434,7 +434,7 @@ static void hugetlb_free_pud_range(struct mmu_gather *tlb, p4d_t *p4d,
 			 * single hugepage, but all of them point to
 			 * the same kmem cache that holds the hugepte.
 			 */
-			more = addr + (1 << hugepd_shift(*(hugepd_t *)pud));
+			more = addr + (1UL << hugepd_shift(*(hugepd_t *)pud));
 			if (more > next)
 				next = more;
 
@@ -496,7 +496,7 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb,
 			 * for a single hugepage, but all of them point to the
 			 * same kmem cache that holds the hugepte.
 			 */
-			more = addr + (1 << hugepd_shift(*(hugepd_t *)pgd));
+			more = addr + (1ULL << hugepd_shift(*(hugepd_t *)pgd));
 			if (more > next)
 				next = more;
 
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index fa7a3d21a751..e210b737658c 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -65,7 +65,7 @@ static int walk_hugepd_range(hugepd_t *phpd, unsigned long addr,
 	int err = 0;
 	const struct mm_walk_ops *ops = walk->ops;
 	int shift = hugepd_shift(*phpd);
-	int page_size = 1 << shift;
+	long page_size = 1UL << shift;
 
 	if (!ops->pte_entry)
 		return 0;
-- 
2.37.3

