Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E61F738B023
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:38:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm9n56VGgz3bsW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 23:38:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VBLVvwSc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VBLVvwSc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm9mf3nzxz2yqC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:38:25 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KDYEmK080342; Thu, 20 May 2021 09:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=NuCWYDIN/YyoCTk7d7iYGTID3NDT5MwwqoqJmhEbXrs=;
 b=VBLVvwScPXq5a4EcLQYNxHGnY2FzzplJe9NRFL3LW7YXpCTXtAQS+7+ZlC6JIo6O7wQk
 qe14HpJ3jR2QJBmDwNB5rLDuGSaB0CkbEpnHUcK7ZvY3zvfkN1jO56DF1CfWfeSAdKZM
 5NeRBkDhq3rTFiM/Qu2OMR+Hk4E51jG3aazfKVsvc/FnbWRC0ViXNVhEzUKR/DS0qAWC
 BmPuOiTw45aelTFFZRnRcJa4Y2JB5N7xHqku4Lwg2kTBlBycD4xZ4KQxBLTsAD77Cf85
 0U6msdHaqpj9g+v8kpcHY7wDzZrDcKf3/s7VW8akDhusuIE6Mbe7tFFio8gHna7KTZca NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38nqv32566-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 09:38:06 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14KDYFVZ080398;
 Thu, 20 May 2021 09:38:05 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38nqv32559-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 09:38:05 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14KDbZe6018575;
 Thu, 20 May 2021 13:38:04 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 38j5xa1jqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 13:38:04 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14KDc3DP25821450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 13:38:03 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69881AC05E;
 Thu, 20 May 2021 13:38:03 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F3F1AC060;
 Thu, 20 May 2021 13:38:00 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.101.109])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 20 May 2021 13:38:00 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v5 3/9] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
In-Reply-To: <e6525655-2e51-a0c0-fe54-596cfae9ce21@linux.ibm.com>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-4-aneesh.kumar@linux.ibm.com>
 <YKQdxpHVYB9H0M0j@Ryzen-9-3900X.localdomain>
 <87mtsrqqk0.fsf@linux.ibm.com> <YKXHA8/HmP6HXngO@t490s>
 <6e0dbb76-2b33-53f1-246e-30cec2b871e2@linux.ibm.com>
 <YKZaLHurH9nJWvbj@t490s>
 <e6525655-2e51-a0c0-fe54-596cfae9ce21@linux.ibm.com>
Date: Thu, 20 May 2021 19:07:57 +0530
Message-ID: <87o8d5le4q.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 863jj50PSjBTwNn_dMS9GRyeSmxH7V0f
X-Proofpoint-GUID: pQ4U2MCz_CFtNba1c_siPUy9LqT7xJyu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_03:2021-05-20,
 2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105200099
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
Cc: npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>,
 linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> On 5/20/21 6:16 PM, Peter Xu wrote:
>> On Thu, May 20, 2021 at 01:56:54PM +0530, Aneesh Kumar K.V wrote:
>>>> This seems to work at least for my userfaultfd test on shmem, however I don't
>>>> fully understand the commit message [1] on: How do we guarantee we're not
>>>> moving a thp pte?
>>>>
>>>
>>> move_page_tables() checks for pmd_trans_huge() and ends up calling
>>> move_huge_pmd if it is a THP entry.
>> 
>> Sorry to be unclear: what if a huge pud thp?
>> 
>
> I am still checking. Looking at the code before commit 
> c49dd340180260c6239e453263a9a244da9a7c85, I don't see kernel handling 
> huge pud thp. I haven't studied huge pud thp enough to understand 
> whether c49dd340180260c6239e453263a9a244da9a7c85 intent to add that 
> support.
>
> We can do a move_huge_pud() like we do for huge pmd thp. But I am not 
> sure whether we handle those VMA's earlier and restrict mremap on them?

something like this? (not even compile tested). I am still not sure
whether this is really needed or we handle DAX VMA's in some other form.

diff --git a/mm/mremap.c b/mm/mremap.c
index 47c255b60150..037a7bd311f1 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -324,10 +324,51 @@ static inline bool move_normal_pud(struct vm_area_struct *vma,
 }
 #endif
 
+
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
+	set_pud_at(mm, new_addr, new_pud, pud);
+	flush_pud_tlb_range(vma, old_addr, old_addr + HPAGE_PUD_SIZE);
+	if (new_ptl != old_ptl)
+		spin_unlock(new_ptl);
+	spin_unlock(old_ptl);
+
+	return true;
+}
+
 enum pgt_entry {
 	NORMAL_PMD,
 	HPAGE_PMD,
 	NORMAL_PUD,
+	HPAGE_PUD,
 };
 
 /*
@@ -347,6 +388,7 @@ static __always_inline unsigned long get_extent(enum pgt_entry entry,
 		mask = PMD_MASK;
 		size = PMD_SIZE;
 		break;
+	case HPAGE_PUD:
 	case NORMAL_PUD:
 		mask = PUD_MASK;
 		size = PUD_SIZE;
@@ -395,6 +437,12 @@ static bool move_pgt_entry(enum pgt_entry entry, struct vm_area_struct *vma,
 			move_huge_pmd(vma, old_addr, new_addr, old_entry,
 				      new_entry);
 		break;
+	case HPAGE_PUD:
+		moved = IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE_PUD) &&
+			move_huge_pud(vma, old_addr, new_addr, old_entry,
+				      new_entry);
+		break;
+
 	default:
 		WARN_ON_ONCE(1);
 		break;
@@ -429,15 +477,23 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
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
+			pud_t *old_pud, *new_pud;
+
 			if (move_pgt_entry(NORMAL_PUD, vma, old_addr, new_addr,
 					   old_pud, new_pud, need_rmap_locks))
 				continue;


>
> Are huge pud thp only allowed with DAX vmas?
>
>
> -aneesh
