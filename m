Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 616D73A90CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 06:54:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4Xt90TKjz3cFb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 14:54:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TKSQ1kHf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TKSQ1kHf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4XrJ6NkZz30B3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 14:53:20 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15G4Y05o047888; Wed, 16 Jun 2021 00:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wSVs0jykmA15cbTs0KAocCzOVXGaNTPNU0fWwxoS9Rw=;
 b=TKSQ1kHfOx5GY5k4eXss4AfyoEq+ksrjH4/aVx+5UgW1CMeY6MfBEuyZYsxTnsy6WVYd
 JJRq15fQDCOdnghkSHWCms5PEXnUUkqwzNma0uR3gFx3CwYKIL2kCX2Y938ST1CmkVEp
 qp8joaLQity9etv7kMmnBSILfJKR5a1y0VQ/e5EQRRezoVIgjUtccEmx/7VHnkslqgZb
 WWQKGxG/Klx55HIFdQOcOguTJSg2oARC6JXRtngRboUfs+GSJR5niEssh03ngSvkhfLs
 l+PlCQq5P5pEIncjRdmhgMza5PZ2s8qilPz/01HvNrbiPBJP+4rOgSFweVuEBD0BmIsT yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3977pcbqwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 00:53:07 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15G4eUPm072413;
 Wed, 16 Jun 2021 00:53:06 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3977pcbqw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 00:53:06 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15G4qEPj020228;
 Wed, 16 Jun 2021 04:53:06 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 3965ytt54t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 04:53:06 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15G4r4eN12649050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 04:53:04 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A16237805C;
 Wed, 16 Jun 2021 04:53:04 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF3707805E;
 Wed, 16 Jun 2021 04:53:00 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.71.33])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Jun 2021 04:53:00 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2 3/6] mm/mremap: Convert huge PUD move to separate helper
Date: Wed, 16 Jun 2021 10:22:36 +0530
Message-Id: <20210616045239.370802-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616045239.370802-1-aneesh.kumar@linux.ibm.com>
References: <20210616045239.370802-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K16mr8dSMKO9BmdsXGJQ-vN_JlbX6ThY
X-Proofpoint-ORIG-GUID: osB_ykuT0OXnAVyS54-t8cUVBs3lACic
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_09:2021-06-15,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106160027
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

With TRANSPARENT_HUGEPAGE_PUD enabled the kernel can find huge PUD entries.
Add a helper to move huge PUD entries on mremap().

This will be used by a later patch to optimize mremap of PUD_SIZE aligned
level 4 PTE mapped address

This also make sure we support mremap on huge PUD entries even with
CONFIG_HAVE_MOVE_PUD disabled.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/mremap.c | 79 ++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 72 insertions(+), 7 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 47c255b60150..958ecdc6f29d 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -324,10 +324,61 @@ static inline bool move_normal_pud(struct vm_area_struct *vma,
 }
 #endif
 
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+static bool move_huge_pud(struct vm_area_struct *vma, unsigned long old_addr,
+			  unsigned long new_addr, pud_t *old_pud, pud_t *new_pud)
+{
+	spinlock_t *old_ptl, *new_ptl;
+	struct mm_struct *mm = vma->vm_mm;
+	pud_t pud;
+
+	/*
+	 * The destination pud shouldn't be established, free_pgtables()
+	 * should have released it.
+	 */
+	if (WARN_ON_ONCE(!pud_none(*new_pud)))
+		return false;
+
+	/*
+	 * We don't have to worry about the ordering of src and dst
+	 * ptlocks because exclusive mmap_lock prevents deadlock.
+	 */
+	old_ptl = pud_lock(vma->vm_mm, old_pud);
+	new_ptl = pud_lockptr(mm, new_pud);
+	if (new_ptl != old_ptl)
+		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
+
+	/* Clear the pud */
+	pud = *old_pud;
+	pud_clear(old_pud);
+
+	VM_BUG_ON(!pud_none(*new_pud));
+
+	/* Set the new pud */
+	/* mark soft_ditry when we add pud level soft dirty support */
+	set_pud_at(mm, new_addr, new_pud, pud);
+	flush_pud_tlb_range(vma, old_addr, old_addr + HPAGE_PUD_SIZE);
+	if (new_ptl != old_ptl)
+		spin_unlock(new_ptl);
+	spin_unlock(old_ptl);
+
+	return true;
+}
+#else
+static bool move_huge_pud(struct vm_area_struct *vma, unsigned long old_addr,
+			  unsigned long new_addr, pud_t *old_pud, pud_t *new_pud)
+{
+	WARN_ON_ONCE(1);
+	return false;
+
+}
+#endif
+
 enum pgt_entry {
 	NORMAL_PMD,
 	HPAGE_PMD,
 	NORMAL_PUD,
+	HPAGE_PUD,
 };
 
 /*
@@ -347,6 +398,7 @@ static __always_inline unsigned long get_extent(enum pgt_entry entry,
 		mask = PMD_MASK;
 		size = PMD_SIZE;
 		break;
+	case HPAGE_PUD:
 	case NORMAL_PUD:
 		mask = PUD_MASK;
 		size = PUD_SIZE;
@@ -395,6 +447,11 @@ static bool move_pgt_entry(enum pgt_entry entry, struct vm_area_struct *vma,
 			move_huge_pmd(vma, old_addr, new_addr, old_entry,
 				      new_entry);
 		break;
+	case HPAGE_PUD:
+		moved = move_huge_pud(vma, old_addr, new_addr, old_entry,
+				      new_entry);
+		break;
+
 	default:
 		WARN_ON_ONCE(1);
 		break;
@@ -414,6 +471,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
 	unsigned long extent, old_end;
 	struct mmu_notifier_range range;
 	pmd_t *old_pmd, *new_pmd;
+	pud_t *old_pud, *new_pud;
 
 	old_end = old_addr + len;
 	flush_cache_range(vma, old_addr, old_end);
@@ -429,15 +487,22 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
 		 * PUD level if possible.
 		 */
 		extent = get_extent(NORMAL_PUD, old_addr, old_end, new_addr);
-		if (IS_ENABLED(CONFIG_HAVE_MOVE_PUD) && extent == PUD_SIZE) {
-			pud_t *old_pud, *new_pud;
 
-			old_pud = get_old_pud(vma->vm_mm, old_addr);
-			if (!old_pud)
+		old_pud = get_old_pud(vma->vm_mm, old_addr);
+		if (!old_pud)
+			continue;
+		new_pud = alloc_new_pud(vma->vm_mm, vma, new_addr);
+		if (!new_pud)
+			break;
+		if (pud_trans_huge(*old_pud) || pud_devmap(*old_pud)) {
+			if (extent == HPAGE_PUD_SIZE) {
+				move_pgt_entry(HPAGE_PUD, vma, old_addr, new_addr,
+					       old_pud, new_pud, need_rmap_locks);
+				/* We ignore and continue on error? */
 				continue;
-			new_pud = alloc_new_pud(vma->vm_mm, vma, new_addr);
-			if (!new_pud)
-				break;
+			}
+		} else if (IS_ENABLED(CONFIG_HAVE_MOVE_PUD) && extent == PUD_SIZE) {
+
 			if (move_pgt_entry(NORMAL_PUD, vma, old_addr, new_addr,
 					   old_pud, new_pud, need_rmap_locks))
 				continue;
-- 
2.31.1

