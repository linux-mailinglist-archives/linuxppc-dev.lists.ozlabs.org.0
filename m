Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D6B39EFF8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 09:53:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzjCj184wz3bs6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 17:53:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ii36guTl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ii36guTl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzjC939wZz2ylk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 17:52:52 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1587Wd9S147256; Tue, 8 Jun 2021 03:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=pHxQTffpT8MNScJ2PzHY8/iTPQyyMHyALA6l13WVtaQ=;
 b=Ii36guTl4UXPw+MsDPIdJDJeTBo9L2xObaaExG5Xj7f/godx692VgYUroSyrph6W6yr5
 DB5vLv4vHhTeUtNsO0+iXO+h15x+hI/QLoOUtLeyCxmaj/1ARt0YaWhj2Rm/MurAywJe
 dpERmWRgX+oEqfZklg7vGK4K2Gc+44ROwXZ21pAPBr9coZgovX8bqNL0zJcBERe8t9xC
 ACXAJ+AvFwtGON08aUudND1Ou8Wx6rpLp9YzfhdrAKwRixiI/Ai7AT0IP09bstp4RLIv
 5aUFQXXat0Jqr2MPmH0BLCwYBVWhK5Iz51pRCoX/tgbpu46L6gC1RMcrQU+nV7elEx1y 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3922ctbjfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 03:52:31 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1587WjdS147640;
 Tue, 8 Jun 2021 03:52:31 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3922ctbjf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 03:52:31 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1587parP006061;
 Tue, 8 Jun 2021 07:52:30 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 3900wajqf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 07:52:30 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1587qT6T34013520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Jun 2021 07:52:29 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9960B2805A;
 Tue,  8 Jun 2021 07:52:29 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E72D28065;
 Tue,  8 Jun 2021 07:52:26 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.43.138])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Jun 2021 07:52:25 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v7 01/11] mm/mremap: Fix race between MOVE_PMD mremap
 and pageout
In-Reply-To: <f789af6-8924-3b83-6f82-c662175af126@google.com>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
 <20210607055131.156184-2-aneesh.kumar@linux.ibm.com>
 <f789af6-8924-3b83-6f82-c662175af126@google.com>
Date: Tue, 08 Jun 2021 13:22:23 +0530
Message-ID: <87o8cgokso.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6AE8WM2JGgOt_mHvRY6UMdqApxYrMhQG
X-Proofpoint-GUID: OPXD8vYoUZR3B6cqwCB98fPJjiFtgNmz
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-08_05:2021-06-04,
 2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080051
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, npiggin@gmail.com,
 linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Hugh,

Hugh Dickins <hughd@google.com> writes:

> On Mon, 7 Jun 2021, Aneesh Kumar K.V wrote:
>
>> CPU 1				CPU 2					CPU 3
>> 
>> mremap(old_addr, new_addr)      page_shrinker/try_to_unmap_one
>> 
>> mmap_write_lock_killable()
>> 
>> 				addr = old_addr
>> 				lock(pte_ptl)
>> lock(pmd_ptl)
>> pmd = *old_pmd
>> pmd_clear(old_pmd)
>> flush_tlb_range(old_addr)
>> 
>> *new_pmd = pmd
>> 									*new_addr = 10; and fills
>> 									TLB with new addr
>> 									and old pfn
>> 
>> unlock(pmd_ptl)
>> 				ptep_clear_flush()
>> 				old pfn is free.
>> 									Stale TLB entry
>> 
>> Fix this race by holding pmd lock in pageout. This still doesn't handle the race
>> between MOVE_PUD and pageout.
>> 
>> Fixes: 2c91bd4a4e2e ("mm: speed up mremap by 20x on large regions")
>> Link: https://lore.kernel.org/linux-mm/CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>
> This seems very wrong to me, to require another level of locking in the
> rmap lookup, just to fix some new pagetable games in mremap.
>
> But Linus asked "Am I missing something?": neither of you have mentioned
> mremap's take_rmap_locks(), so I hope that already meets your need.  And
> if it needs to be called more often than before (see "need_rmap_locks"),
> that's probably okay.
>
> Hugh
>

Thanks for reviewing the change. I missed the rmap lock in the code
path. How about the below change?

    mm/mremap: hold the rmap lock in write mode when moving page table entries.
    
    To avoid a race between rmap walk and mremap, mremap does take_rmap_locks().
    The lock was taken to ensure that rmap walk don't miss a page table entry due to
    PTE moves via move_pagetables(). The kernel does further optimization of
    this lock such that if we are going to find the newly added vma after the
    old vma, the rmap lock is not taken. This is because rmap walk would find the
    vmas in the same order and if we don't find the page table attached to
    older vma we would find it with the new vma which we would iterate later.
    The actual lifetime of the page is still controlled by the PTE lock.
    
    This patch updates the locking requirement to handle another race condition
    explained below with optimized mremap::
    
    Optmized PMD move
    
        CPU 1                           CPU 2                                   CPU 3
    
        mremap(old_addr, new_addr)      page_shrinker/try_to_unmap_one
    
        mmap_write_lock_killable()
    
                                        addr = old_addr
                                        lock(pte_ptl)
        lock(pmd_ptl)
        pmd = *old_pmd
        pmd_clear(old_pmd)
        flush_tlb_range(old_addr)
    
        *new_pmd = pmd
                                                                                *new_addr = 10; and fills
                                                                                TLB with new addr
                                                                                and old pfn
    
        unlock(pmd_ptl)
                                        ptep_clear_flush()
                                        old pfn is free.
                                                                                Stale TLB entry
    
    Optmized PUD move:
    
        CPU 1                           CPU 2                                   CPU 3
    
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
    
    Both the above race condition can be fixed if we force mremap path to take rmap lock.
    
    Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

diff --git a/mm/mremap.c b/mm/mremap.c
index 9cd352fb9cf8..f12df630fb37 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -517,7 +517,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
 		} else if (IS_ENABLED(CONFIG_HAVE_MOVE_PUD) && extent == PUD_SIZE) {
 
 			if (move_pgt_entry(NORMAL_PUD, vma, old_addr, new_addr,
-					   old_pud, new_pud, need_rmap_locks))
+					   old_pud, new_pud, true))
 				continue;
 		}
 
@@ -544,7 +544,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
 			 * moving at the PMD level if possible.
 			 */
 			if (move_pgt_entry(NORMAL_PMD, vma, old_addr, new_addr,
-					   old_pmd, new_pmd, need_rmap_locks))
+					   old_pmd, new_pmd, true))
 				continue;
 		}
 
