Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1717493A7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 04:25:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hEatLd2V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxL3N5Vc1z3bpk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 12:25:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hEatLd2V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxL2S5fHtz2y3Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 12:24:32 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3662H2PK014126;
	Thu, 6 Jul 2023 02:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=E4XfvDjAjvtomsNMGsdZfRhagOuyf4UEnvpvpa5cbvk=;
 b=hEatLd2VHuOAqoWdGS0ppsYt3iopdifos6M9YLx5x/J4Z9BqkacB6TMuSEicObwQNamW
 6LT40UXRV+N7izTAGqLComTWMAox8xhZGgZU8rbVh1p/wVJu8gGjywRxhNECL93c1LtR
 d+4C8vOPgGCnZm4myxuK3QJqww8ZjJ1xF5qzpqYFpM5Sui9wgMoTSuXVFHoTdOeJnpxn
 XXw/GLrW/gbenop9mAg4W90xpHnBZER6UjCuKIpuPHlz7rJSyQIsgrLPzbAk/6bR83uo
 Kyk3lWDKNWF6b/d+/zOmETAWtd/kiv1+IdFyEYbROA2QiEkZ8zS1Gny8gSuWz5jSOE4R Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnmpjr43j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 02:24:23 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3662KbNw024598;
	Thu, 6 Jul 2023 02:24:23 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnmpjr438-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 02:24:23 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36627JEa008598;
	Thu, 6 Jul 2023 02:24:22 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3rjbs6b4jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 02:24:22 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3662OKs824969774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 02:24:21 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF85758051;
	Thu,  6 Jul 2023 02:24:20 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F0145805A;
	Thu,  6 Jul 2023 02:24:18 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.92.106])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jul 2023 02:24:17 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc/mm/book3s64/hash/4k: Add pmd_same callback for 4K page size
Date: Thu,  6 Jul 2023 07:54:05 +0530
Message-ID: <20230706022405.798157-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FWSVhzQINnps6mJBnE37r2dWDoXCCZ3h
X-Proofpoint-ORIG-GUID: uffMLxwjtQTcFA6dBrfbXxybKDpIj8nL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_11,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060016
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Hugh Dickins <hughd@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With commit 0d940a9b270b ("mm/pgtable: allow pte_offset_map[_lock]() to
fail") the kernel is now using pmd_same to compare pmd values that are
pointing to a level 4 page table page. Move the functions out of #ifdef
CONFIG_TRANSPARENT_HUGEPAGE and add a variant that can work with both 4K
and 64K page size.

kernel BUG at arch/powerpc/include/asm/book3s/64/hash-4k.h:141!
Oops: Exception in kernel mode, sig: 5 [#1]
LE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
.....
NIP [c00000000048aee0] __pte_offset_map_lock+0xf0/0x164
LR [c00000000048ae78] __pte_offset_map_lock+0x88/0x164
Call Trace:
 0xc0003f000009a340 (unreliable)
 __handle_mm_fault+0x1340/0x1980
 handle_mm_fault+0xbc/0x380
 __get_user_pages+0x320/0x550
 get_user_pages_remote+0x13c/0x520
 get_arg_page+0x80/0x1d0
 copy_string_kernel+0xc8/0x250
 kernel_execve+0x11c/0x270
 run_init_process+0xe4/0x10c
 kernel_init+0xbc/0x1a0
 ret_from_kernel_user_thread+0x14/0x1c

Cc: Hugh Dickins <hughd@google.com>
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/hash-4k.h  | 6 ------
 arch/powerpc/include/asm/book3s/64/hash-64k.h | 5 -----
 arch/powerpc/include/asm/book3s/64/hash.h     | 5 +++++
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
index b6ac4f86c87b..6472b08fa1b0 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
@@ -136,12 +136,6 @@ static inline int hash__pmd_trans_huge(pmd_t pmd)
 	return 0;
 }
 
-static inline int hash__pmd_same(pmd_t pmd_a, pmd_t pmd_b)
-{
-	BUG();
-	return 0;
-}
-
 static inline pmd_t hash__pmd_mkhuge(pmd_t pmd)
 {
 	BUG();
diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/powerpc/include/asm/book3s/64/hash-64k.h
index 338e62fbea0b..0bf6fd0bf42a 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-64k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-64k.h
@@ -263,11 +263,6 @@ static inline int hash__pmd_trans_huge(pmd_t pmd)
 		  (_PAGE_PTE | H_PAGE_THP_HUGE));
 }
 
-static inline int hash__pmd_same(pmd_t pmd_a, pmd_t pmd_b)
-{
-	return (((pmd_raw(pmd_a) ^ pmd_raw(pmd_b)) & ~cpu_to_be64(_PAGE_HPTEFLAGS)) == 0);
-}
-
 static inline pmd_t hash__pmd_mkhuge(pmd_t pmd)
 {
 	return __pmd(pmd_val(pmd) | (_PAGE_PTE | H_PAGE_THP_HUGE));
diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index 17e7a778c856..d4a19e6547ac 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -132,6 +132,11 @@ static inline int get_region_id(unsigned long ea)
 	return region_id;
 }
 
+static inline int hash__pmd_same(pmd_t pmd_a, pmd_t pmd_b)
+{
+	return (((pmd_raw(pmd_a) ^ pmd_raw(pmd_b)) & ~cpu_to_be64(_PAGE_HPTEFLAGS)) == 0);
+}
+
 #define	hash__pmd_bad(pmd)		(pmd_val(pmd) & H_PMD_BAD_BITS)
 #define	hash__pud_bad(pud)		(pud_val(pud) & H_PUD_BAD_BITS)
 static inline int hash__p4d_bad(p4d_t p4d)
-- 
2.41.0

