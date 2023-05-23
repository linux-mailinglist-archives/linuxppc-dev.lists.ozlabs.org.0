Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B35AA70DBFF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 14:09:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQY5N4hqsz3fCG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 22:09:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oXVaQauy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=imbrenda@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oXVaQauy;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQY4T5ZwGz3cfp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 22:08:25 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34NBvhWn005111;
	Tue, 23 May 2023 12:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=hvBkau843ws4S1xlMiA8GiItRMnbuFuaqBLPZfwfBjM=;
 b=oXVaQauy/8g2xTnFTAcyRpsK6R0Z7PJKOkIjtetvDoFQ4C7Vaoz3bjS1jfMMcRnjGqV7
 TuXgAQJmG4wOpqKlAOC0mckK2z7bJPyGuNkmOInvXMBhkTAQCGGmYX8yjNUjUo/JotTY
 y88M7nr1R+3aKmsQxuw71PorXdAgogm3w8p+dxg1r3SXTNvYytY90PmqEKvkYUF0HdKS
 8vBGN4743QXYxRUd+1shtMbCEiv/f4q8PkkDhpBaoNjpbEOxCyZ2A2qB7Jw6mjy8Gg/a
 1VT3FbpG8YJZ455TWleqU6+xiSNDe9tLeM9AueFtcIQmIFB8f7TtJysKO1Yi+xa8PwRI Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qrw2n828u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 May 2023 12:01:08 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34NC09Ft011638;
	Tue, 23 May 2023 12:01:07 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qrw2n826b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 May 2023 12:01:07 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34N3PmcR020391;
	Tue, 23 May 2023 12:01:03 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qppcu9epm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 May 2023 12:01:03 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34NC0x7s59572662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 May 2023 12:00:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 148C520067;
	Tue, 23 May 2023 12:00:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5984120043;
	Tue, 23 May 2023 12:00:58 +0000 (GMT)
Received: from p-imbrenda (unknown [9.152.224.66])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 23 May 2023 12:00:58 +0000 (GMT)
Date: Tue, 23 May 2023 14:00:56 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH 15/23] s390: allow pte_offset_map_lock() to fail
Message-ID: <20230523140056.55b664b1@p-imbrenda>
In-Reply-To: <4a15dbaa-1614-ce-ce1f-f73959cef895@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
	<94aec8fe-383f-892-dcbf-d4c14e460a7@google.com>
	<20230517123546.672fb9b0@p-imbrenda>
	<4a15dbaa-1614-ce-ce1f-f73959cef895@google.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KdATZGw-PFRBi7nGruRJQHyOg66o4rOG
X-Proofpoint-ORIG-GUID: GKYQ85EtVUpqelakERxcPgEdd_8F7rRj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_07,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230092
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogen
 d@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 May 2023 14:50:28 -0700 (PDT)
Hugh Dickins <hughd@google.com> wrote:

> On Wed, 17 May 2023, Claudio Imbrenda wrote:
> > On Tue, 9 May 2023 22:01:16 -0700 (PDT)
> > Hugh Dickins <hughd@google.com> wrote:
> >   
> > > In rare transient cases, not yet made possible, pte_offset_map() and
> > > pte_offset_map_lock() may not find a page table: handle appropriately.
> > > 
> > > Signed-off-by: Hugh Dickins <hughd@google.com>
> > > ---
> > >  arch/s390/kernel/uv.c  |  2 ++
> > >  arch/s390/mm/gmap.c    |  2 ++
> > >  arch/s390/mm/pgtable.c | 12 +++++++++---
> > >  3 files changed, 13 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/s390/kernel/uv.c b/arch/s390/kernel/uv.c
> > > index cb2ee06df286..3c62d1b218b1 100644
> > > --- a/arch/s390/kernel/uv.c
> > > +++ b/arch/s390/kernel/uv.c
> > > @@ -294,6 +294,8 @@ int gmap_make_secure(struct gmap *gmap, unsigned long gaddr, void *uvcb)
> > >  
> > >  	rc = -ENXIO;
> > >  	ptep = get_locked_pte(gmap->mm, uaddr, &ptelock);
> > > +	if (!ptep)
> > > +		goto out;  
> 
> You may or may not be asking about this instance too.  When I looked at

actually no, because of the reasons you give here :)

> how the code lower down handles -ENXIO (promoting it to -EFAULT if an
> access fails, or to -EAGAIN to ask for a retry), this looked just right
> (whereas using -EAGAIN here would be wrong: that expects a "page" which
> has not been initialized at this point).
> 
> > >  	if (pte_present(*ptep) && !(pte_val(*ptep) & _PAGE_INVALID) && pte_write(*ptep)) {
> > >  		page = pte_page(*ptep);
> > >  		rc = -EAGAIN;
> > > diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
> > > index dc90d1eb0d55..d198fc9475a2 100644
> > > --- a/arch/s390/mm/gmap.c
> > > +++ b/arch/s390/mm/gmap.c
> > > @@ -2549,6 +2549,8 @@ static int __zap_zero_pages(pmd_t *pmd, unsigned long start,
> > >  		spinlock_t *ptl;
> > >  
> > >  		ptep = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
> > > +		if (!ptep)
> > > +			break;  
> > 
> > so if pte_offset_map_lock fails, we abort and skip both the failed
> > entry and the rest of the entries?  
> 
> Yes.
> 
> > 
> > can pte_offset_map_lock be retried immediately if it fails? (consider
> > that we currently don't allow THP with KVM guests)
> > 
> > Would something like this:
> > 
> > do {
> > 	ptep = pte_offset_map_lock(...);
> > 	mb();	/* maybe? */
> > } while (!ptep);
> > 
> > make sense?  
> 
> No.  But you're absolutely right to be asking: thank you for looking
> into it so carefully - and I realize that it's hard at this stage to
> judge what's appropriate, when I've not yet even posted the endpoint
> of these changes, the patches which make it possible not to find a
> page table here.  And I'm intentionally keeping that vague, because
> although I shall only introduce a THP case, I do expect it to be built
> upon later in reclaiming empty page tables: it would be nice not to
> have to change the arch code again when extending further.
> 
> My "rare transient cases" phrase may be somewhat misleading: one thing
> that's wrong with your tight pte_offset_map_lock() loop above is that
> the pmd entry pointing to page table may have been suddenly replaced
> by a pmd_none() entry; and there's nothing in your loop above to
> break out if that is so.
> 
> But if a page table is suddenly removed, that would be because it was
> either empty, or replaced by a THP entry, or easily reconstructable on
> demand (by that, I probably mean it was only mapping shared file
> pages, which can just be refaulted if needed again).
> 
> The case you're wary of, is if the page table were removed briefly,
> then put back shortly after: and still contains zero pages further
> down. That's not something mm does now, nor at the end of my several
> series, nor that I imagine us wanting to do in future: but I am
> struggling to find a killer argument to persuade you that it could
> never be done - most pages in a page table do need rmap tracking,
> which will BUG if it's broken, but that argument happens not to apply
> to the zero page.
> 
> (Hmm, there could be somewhere, where we would find it convenient to
> remove a page table with intent to do ...something, then validation
> of that isolated page table fails, so we just put it back again.)
> 
> Is it good enough for me to promise you that we won't do that?
> 
> There are several ways in which we could change __zap_zero_pages(),
> but I don't see them as actually dealing with the concern at hand.
> 
> One change, I've tended to make at the mm end but did not dare
> to interfere here: it would seem more sensible to do a single
> pte_offset_map_lock() outside the loop, return if that fails,
> increment ptep inside the loop, pte_unmap_unlock() after the loop.
> 
> But perhaps you have preemption reasons for not wanting that; and
> although it would eliminate the oddity of half-processing a page
> table, it would not really resolve the problem at hand: because,
> what if this page table got removed just before __zap_zero_pages()
> tries to take the lock, then got put back just after?
> 
> Another change: I see __zap_zero_pages() is driven by
> walk_page_range(), and over at the mm end I'm usually setting
> walk->action to ACTION_AGAIN in these failure cases; but thought that
> an unnecessary piece of magic here, and cannot see how it could
> actually help.  Your "retry the whole walk_page_range()" suggestion
> below would be a heavier equivalent of that: but neither way gives
> confidence, if a page table could actually be removed then reinserted
> without mmap_write_lock().
> 
> I think I want to keep this s390 __zap_zero_pages() issue in mind, it
> is important and thank you for raising it; but don't see any change
> to the patch as actually needed.
> 
> Hugh

so if I understand the above correctly, pte_offset_map_lock will only
fail if the whole page table has disappeared, and in that case, it will
never reappear with zero pages, therefore we can safely skip (in that
case just break). if we were to do a continue instead of a break, we
would most likely fail again anyway.

in that case I would still like a small change in your patch: please
write a short (2~3 lines max) comment about why it's ok to do things
that way
