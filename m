Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1EA32654F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 17:13:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnF7v5B9rz3cxg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 03:13:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m1ZsyrjC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m1ZsyrjC; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnF7T5KTSz3cWJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 03:13:09 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QG4imG095183; Fri, 26 Feb 2021 11:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=zOkPsoMZ6RMzq/KFXTwBxweXFDIsf9ZjL3lIr22Id/Q=;
 b=m1ZsyrjCnrwANQ807oEzqd/ChrGy5YO7tiizEiqbqDAY414j/nLCULMmxp+pL+T5ZV1J
 NQtDvI21/gwjwsWikOchBaQAXdP3EmXoVOqUPJW0z54skgRLBOtTAt+FTRPTOp1XhE3n
 1gziEYkNIDUXc0gSfbxLzraC1GW8Z+IvkScsH7E0g1TihdBFJSJOqGoR/rtWpuK9VsbL
 4DTAyhEj/cW9deAzkbmTlT3nM/aCnbJXal2f7JPwZIx7CvBYER3IlobJ3ktRYwUgwqHw
 rb9/udpRUObyLzmCzor+FvQMLwy5mGj/vSwUgRJJYHVW3P7v7EhqLBZAchgqLnGt/e+O eA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36y02t0wb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 11:12:53 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11QG4XVI017456;
 Fri, 26 Feb 2021 16:12:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 36y30wr13j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 16:12:51 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 11QGCZH425297284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 16:12:35 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ABEDAE051;
 Fri, 26 Feb 2021 16:12:48 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5570AE055;
 Fri, 26 Feb 2021 16:12:47 +0000 (GMT)
Received: from thinkpad (unknown [9.171.23.180])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 26 Feb 2021 16:12:47 +0000 (GMT)
Date: Fri, 26 Feb 2021 17:12:46 +0100
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: Freeing page tables through RCU
Message-ID: <20210226171246.4afba7e9@thinkpad>
In-Reply-To: <20210225205820.GC2858050@casper.infradead.org>
References: <20210225205820.GC2858050@casper.infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_05:2021-02-26,
 2021-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260119
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
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 Feb 2021 20:58:20 +0000
Matthew Wilcox <willy@infradead.org> wrote:

> In order to walk the page tables without the mmap semaphore, it must
> be possible to prevent them from being freed and reused (eg if munmap()
> races with viewing /proc/$pid/smaps).
> 
> There is various commentary within the mm on how to prevent this.  One way
> is to disable interrupts, relying on that to block rcu_sched or IPIs.
> I don't think the RT people are terribly happy about reading a proc file
> disabling interrupts, and it doesn't work for architectures that free
> page tables directly instead of batching them into an rcu_sched (because
> the IPI may not be sent to this CPU if the task has never run on it).
> 
> See "Fast GUP" in mm/gup.c
> 
> Ideally, I'd like rcu_read_lock() to delay page table reuse.  This is
> close to trivial for architectures which use entire pages or multiple
> pages for levels of their page tables as we can use the rcu_head embedded
> in struct page to queue the page for RCU.
> 
> s390 and powerpc are the only two architectures I know of that have
> levels of their page table that are smaller than their PAGE_SIZE.
> I'd like to discuss options.  There may be a complicated scheme that
> allows partial pages to be freed via RCU, but I have something simpler
> in mind.  For powerpc in particular, it can have a PAGE_SIZE of 64kB
> and then the MMU wants to see 4kB entries in the PMD.  I suggest that
> instead of allocating each 4kB entry individually, we allocate a 64kB
> page and fill in 16 consecutive PMDs.  This could cost a bit more memory
> (although if you've asked for a CONFIG_PAGE_SIZE of 64kB, you presumably
> don't care too much about it), but it'll make future page faults cheaper
> (as the PMDs will already be present, assuming you have good locality
> of reference).
> 
> I'd like to hear better ideas than this.

Some background on the situation for s390: The architecture defines
an 8 bit pagetable index, so we have 256 entries in a 2 KB pagetable,
but PAGE_SIZE is 4 KB. pte_alloc(_one) will use alloc_page() to allocate
a full 4 KB page, and then do some housekeeping to maintain a per-mm list
of such 4 KB pages, which will contain either one or two 2 KB pagetable
fragments.

This is also the reason why pgtable_t on s390 is not pointing to the
struct page of the (4 KB) page containing a 2 KB pagetable fragment, but
rather to the 2 KB pagetable itself.

I see at least two issues here, with using rcu_head embedded in the
struct page (for a 4 KB page):

1) There might be two 2 KB pagetables present in that 4 KB page,
and the rcu_head would affect both. Not sure if this would really be
a problem, because we already have a similar situation with the split
ptlock embedded in struct page, which also might lock two 2 KB pagetables,
i.e. more than necessary. It still is far less "over-locking" than
using mm->page_table_lock, and the move_pte() code e.g. takes care
to avoid a deadlock if src and dst ptlocks happen to be on the
same page.

So, a similar "over-locking" might also be possible and acceptable
for the rcu_head approach, but I do not really understand if that could
have some deadlock or other unwanted side-effects.

2) The "housekeeping" of our 2 KB pagetable fragments uses page->lru
to maintain the per-mm list. It also (mis)uses page->_refcount to mark
which 2 KB half is used/free, but that should not be an issue I guess.
Using page->lru will be an issue though. IIUC, then page->rcu_head will
overlay with page->lru, so using page->rcu_head for pagetable pages
on s390 would conflict with our page->lru usage for such pagetable pages.

I do not really see how that could be fixed, maybe we could find and
re-use other struct page members for our 2 KB fragment list. Also, for
kvm, there seem to be even more users of page->lru for pagetable pages,
in arch/s390/mm/gmap.c. Not sure though if those would actually also
affect "regular" pagetable walks, or if they are somehow independent.
But if we'd find some new list home for the 2 KB fragments, then that
could probably also be used for the gmap stuff.
