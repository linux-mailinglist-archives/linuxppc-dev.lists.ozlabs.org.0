Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2054E38FCF5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 10:34:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fq6p60nGZz30C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 18:34:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TJHY1eM1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TJHY1eM1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fq6nZ40Dcz2yWR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 18:34:25 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14P8WbjP154216; Tue, 25 May 2021 04:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AfxNOjqF9LJeSahmaxMJCGW9X/G+3N1LoF4lN/GbI/Y=;
 b=TJHY1eM1nxdfHgIwqTE2wZufg8mCmoVJj4HcZlAKfowY2Kor9++RtF9ZwVvcS3RUjS7T
 ztrUXHSHcROrUQ1D9c874icRv8ov6mD2k828Vvv66c/aPKXygIRlszkxsq6hP2XJhSG4
 Z/30A5RqBZZNIfZr3EInXHZxXp8IbkdgmZQ2a3dHTmAclNPndJxvm8ugTwY6eszJ1iA7
 ffw2N1hRw/HMYCV7Iq8BSjFh9F1z8l1qfZQ4BzovUJkETjv5p9UbN4gotXGKH4nyVla9
 7KvxMhAwoF8xj5cyk+hNjL0oNwMXCEQn5WUkDlkD8KnaI//sQ1X/tpGnq8hPmizGL5wB 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38ruf44d91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 04:34:13 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14P8Wb1W154223;
 Tue, 25 May 2021 04:34:13 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38ruf44d7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 04:34:12 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14P8RIqW016162;
 Tue, 25 May 2021 08:34:11 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 38psk9de4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 08:34:11 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14P8YA7729032806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 08:34:10 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0E5AC6059;
 Tue, 25 May 2021 08:34:10 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D62C9C605B;
 Tue, 25 May 2021 08:34:06 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.69.234])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 08:34:06 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [RFC PATCH 2/2] mm/mremap: Fix race between MOVE_PUD mremap and
 pageout
Date: Tue, 25 May 2021 14:03:44 +0530
Message-Id: <20210525083344.162377-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525083344.162377-1-aneesh.kumar@linux.ibm.com>
References: <20210525083344.162377-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L4DAVE5xOk4BA6qopkTE-hS6-YRF3qPP
X-Proofpoint-ORIG-GUID: 96zbzpYr0N72PPDMETh8ZQX6uygMgBZF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_05:2021-05-24,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250059
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, npiggin@gmail.com,
 kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CPU 1				CPU 2					CPU 3

mremap(old_addr, new_addr)      page_shrinker/try_to_unmap_one

mmap_write_lock_killable()

				addr = old_addr
				lock(pte_ptl)
lock(pud_ptl)
pud = *old_pud
pud_clear(old_pud)
flush_tlb_range(old_addr)

*new_pud = pud
									*new_addr = 10; and fills
									TLB with new addr
									and old pfn

unlock(pud_ptl)
				ptep_clear_flush()
				old pfn is free.
									Stale TLB entry

Fix this race by holding pud lock in pageout.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 include/linux/rmap.h |  4 ++++
 mm/page_vma_mapped.c | 13 ++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 272ab0c2b60b..491c65ce1d46 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -209,6 +209,7 @@ struct page_vma_mapped_walk {
 	pte_t *pte;
 	spinlock_t *pte_ptl;
 	spinlock_t *pmd_ptl;
+	spinlock_t *pud_ptl;
 	unsigned int flags;
 };
 
@@ -221,6 +222,9 @@ static inline void page_vma_mapped_walk_done(struct page_vma_mapped_walk *pvmw)
 		spin_unlock(pvmw->pte_ptl);
 	if (pvmw->pmd_ptl)
 		spin_unlock(pvmw->pmd_ptl);
+	if (pvmw->pud_ptl)
+		spin_unlock(pvmw->pud_ptl);
+
 }
 
 bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw);
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 87a2c94c7e27..c913bc34b1d3 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -180,8 +180,11 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 	pud = pud_offset(p4d, pvmw->address);
 	if (!pud_present(*pud))
 		return false;
+
+	pvmw->pud_ptl = pud_lock(mm, pud);
 	pvmw->pmd = pmd_offset(pud, pvmw->address);
-	pvmw->pmd_ptl = pmd_lock(mm, pvmw->pmd);
+	if (USE_SPLIT_PMD_PTLOCKS)
+		pvmw->pmd_ptl = pmd_lock(mm, pvmw->pmd);
 	/*
 	 * Make sure the pmd value isn't cached in a register by the
 	 * compiler and used as a stale value after we've observed a
@@ -235,8 +238,12 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 					spin_unlock(pvmw->pte_ptl);
 					pvmw->pte_ptl = NULL;
 				}
-				spin_unlock(pvmw->pmd_ptl);
-				pvmw->pmd_ptl = NULL;
+				if (pvmw->pmd_ptl) {
+					spin_unlock(pvmw->pmd_ptl);
+					pvmw->pmd_ptl = NULL;
+				}
+				spin_unlock(pvmw->pud_ptl);
+				pvmw->pud_ptl = NULL;
 				goto restart;
 			} else {
 				pvmw->pte++;
-- 
2.31.1

