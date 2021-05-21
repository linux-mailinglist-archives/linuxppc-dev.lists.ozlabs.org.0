Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB03938C772
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 15:04:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmmzM543rz307W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 23:04:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NXkHOQ3o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NXkHOQ3o; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmmyt1hWTz305p
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 23:04:21 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LCYUBC142110; Fri, 21 May 2021 09:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=lLlxUuXvSqw0IwXZwCQLje6wWvFFoSvkTZ6DvUBb0Pg=;
 b=NXkHOQ3oXybkBPfg4h3sUEzozRX2P/1afWYqMUgKmOzmMWVNtFzeRBj7mnzR+6iTY2i+
 W+3EEHQr+vWWm9tQazo5oP2iFG6cZMnavCY0u78MrovgmxRBf99G2K3Sx6DNe7Lf2h15
 +rs59mbKIdJAOVyC8wmYf1azbvp0qPVOyX5d1FFnxfHcU/4ldGXgUl52PaGXv6D8Fy+a
 3QZSh5NBhJrk9CqObrS7pfezxZf2SB3FCB3yGiRcvv7MNunf/ecxYxlPCCpXjy8Q/SbI
 hResUktfjPLuBYbzL0qqUrFmD+fbExVtu78QAbpnnpU4mkbpk7xPR088R/itBYI4njkN Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pa8q5ma0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 09:04:03 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14LCYm0n143102;
 Fri, 21 May 2021 09:04:03 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pa8q5m9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 09:04:02 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14LD3xcf025279;
 Fri, 21 May 2021 13:04:02 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 38j5xabkfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 13:04:02 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14LD3RLx33882478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 13:03:27 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AE5FAE063;
 Fri, 21 May 2021 13:03:27 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 241A8AE05F;
 Fri, 21 May 2021 13:03:24 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.42.28])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 13:03:23 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 7/9] mm/mremap: Move TLB flush outside page table lock
In-Reply-To: <5ea8fa4f-a5a2-7dc4-7958-23df6a2c1f3a@linux.ibm.com>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-8-aneesh.kumar@linux.ibm.com>
 <b3047082-fc82-b326-dbdb-835b88df78d0@linux.ibm.com>
 <2eafd7df-65fd-1e2c-90b6-d143557a1fdc@linux.ibm.com>
 <CAHk-=wjq8thag3uNv-2MMu75OgX5ybMon7gZDUHYwzeTwcZHoA@mail.gmail.com>
 <f676b053-bda4-a1f5-321e-f00fb3de8a40@linux.ibm.com>
 <CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com>
 <5ea8fa4f-a5a2-7dc4-7958-23df6a2c1f3a@linux.ibm.com>
Date: Fri, 21 May 2021 18:33:21 +0530
Message-ID: <874kewme7a.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ALR0bzLwBj-JomVvNt3-EhPZFUDCqFil
X-Proofpoint-GUID: O9Jp3yuS5vQIenJjZ9FvkegTSigipQpm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_04:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105210074
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
Cc: Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> On 5/21/21 11:43 AM, Linus Torvalds wrote:
>> On Thu, May 20, 2021 at 5:03 PM Aneesh Kumar K.V
>> <aneesh.kumar@linux.ibm.com> wrote:
>>>
>>> On 5/21/21 8:10 AM, Linus Torvalds wrote:
>>>>
>>>> So mremap does need to flush the TLB before releasing the page table
>>>> lock, because that's the lifetime boundary for the page that got
>>>> moved.
>>>
>>> How will we avoid that happening with
>>> c49dd340180260c6239e453263a9a244da9a7c85 /
>>> 2c91bd4a4e2e530582d6fd643ea7b86b27907151 . The commit improves mremap
>>> performance by moving level3/level2 page table entries. When doing so we
>>> are not holding level 4 ptl lock (pte_lock()). But rather we are holding
>>> pmd_lock or pud_lock(). So if we move pages around without holding the
>>> pte lock, won't the above issue happen even if we do a tlb flush with
>>> holding pmd lock/pud lock?
>> 
>> Hmm. Interesting.
>> 
>> Your patch (to flush the TLB after clearing the old location, and
>> before inserting it into the new one) looks like an "obvious" fix.
>> 
>> But I'm putting that "obvious" in quotes, because I'm now wondering if
>> it actually fixes anything.
>> 
>> Lookie here:
>> 
>>   - CPU1 does a mremap of a pmd or pud.
>> 
>>      It clears the old pmd/pud, flushes the old TLB range, and then
>> inserts the pmd/pud at the new location.
>> 
>>   - CPU2 does a page shrinker, which calls try_to_unmap, which calls
>> try_to_unmap_one.
>> 
>> These are entirely asynchronous, because they have no shared lock. The
>> mremap uses the pmd lock, the try_to_unmap_one() does the rmap walk,
>> which does the pte lock.
>> 
>> Now, imagine that the following ordering happens with the two
>> operations above, and a CPU3 that does accesses:
>> 
>>   - CPU2 follows (and sees) the old page tables in the old location and
>> the took the pte lock
>> 
>>   - the mremap on CPU1 starts - cleared the old pmd, flushed the tlb,
>> *and* inserts in the new place.
>> 
>>   - a user thread on CPU3 accesses the new location and fills the TLB
>> of the *new* address
>> 
>>   - only now does CPU2 get to the "pte_get_and_clear()" to remove one page
>> 
>>   - CPU2 does a TLB flush and frees the page
>> 
>> End result:
>> 
>>   - both CPU1 _and_ CPU2 have flushed the TLB.
>> 
>>   - but both flushed the *OLD* address
>> 
>>   - the page is freed
>> 
>>   - CPU3 still has the stale TLB entry pointing to the page that is now
>> free and might be reused for something else
>> 
>> Am I missing something?
>> 
>
> That is a problem. With that it looks like CONFIG_HAVE_MOVE_PMD/PUD is 
> broken? I don't see an easy way to fix this?

We could do MOVE_PMD with something like below? A equivalent MOVE_PUD
will be costlier which makes me wonder whether we should even support that?

diff --git a/mm/mremap.c b/mm/mremap.c
index 0270d6fed1dd..9e1e4392a1d9 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -233,7 +233,7 @@ static inline bool arch_supports_page_table_move(void)
 static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 		  unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
 {
-	spinlock_t *old_ptl, *new_ptl;
+	spinlock_t *pte_ptl, *old_ptl, *new_ptl;
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t pmd;
 
@@ -281,8 +281,17 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	 * flush the TLB before we move the page table entries.
 	 */
 	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PMD_SIZE);
+
+	/*
+	 * Take the ptl here so that we wait for parallel page table walk
+	 * and operations (eg: pageout) using old addr to finish.
+	 */
+	pte_ptl = pte_lockptr(mm, old_pmd);
+	spin_lock(pte_ptl);
+
 	VM_BUG_ON(!pmd_none(*new_pmd));
 	pmd_populate(mm, new_pmd, pmd_pgtable(pmd));
+	spin_unlock(pte_ptl);
 
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);

