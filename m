Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 632CD728423
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 17:50:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcTDw1ZQzz3f8j
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 01:50:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DTy60rdZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DTy60rdZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcTD053k1z3dw1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 01:49:20 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 358FGlFn005695;
	Thu, 8 Jun 2023 15:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=tMWkrHWmdf0IYFFE01r4wAwCnOFP+Qrc/B/Q6JRs7Yw=;
 b=DTy60rdZZgh016ux5vpfVgalKqqM+vKEGoo5uLgRt1twE3XZKvHMmQ8lh/H7HdT7wLZw
 2gZHVI4ZDNDAyHNEyeHhIWBFqUFu+7etr1drsnnoLcvN0lLBl4/gotbDxkOTHV50Nx+q
 0AFJow3PLyKQF+DIQEs8MKVoS2KUIFx7oARSH1/vuFiq08XvGTeacsy3Msj3qEWv0MP6
 9fnZ9kJlFmhYfVgaVbGb2j/e7L4p59ewaqD/ENOovf7gVMbTviXZiglP4xuGssuDWRLN
 ekLhLsz8UfCCQOjGRddzEKBY/5eupoF5EVM0zN2sfTxws7+65EhKaV53MCjpoI+AVHFv Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r3hg710w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jun 2023 15:48:08 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 358FHAQQ007204;
	Thu, 8 Jun 2023 15:48:07 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r3hg710uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jun 2023 15:48:07 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3586jH87011521;
	Thu, 8 Jun 2023 15:48:04 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r2a77hbe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jun 2023 15:48:04 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 358Fm0LF25756168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Jun 2023 15:48:00 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B537520043;
	Thu,  8 Jun 2023 15:48:00 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90A1A2004B;
	Thu,  8 Jun 2023 15:47:58 +0000 (GMT)
Received: from thinkpad-T15 (unknown [9.179.28.214])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu,  8 Jun 2023 15:47:58 +0000 (GMT)
Date: Thu, 8 Jun 2023 17:47:56 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH 07/12] s390: add pte_free_defer(), with use of
 mmdrop_async()
Message-ID: <20230608174756.27cace18@thinkpad-T15>
In-Reply-To: <dbed4c5-1d-f278-d03a-66f5eff5e48e@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
	<6dd63b39-e71f-2e8b-7e0-83e02f3bcb39@google.com>
	<175ebec8-761-c3f-2d98-6c3bd87161c8@google.com>
	<20230606214037.09c6b280@thinkpad-T15>
	<dbed4c5-1d-f278-d03a-66f5eff5e48e@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: j2pxU5M5eHqEDuvzUa-GCOc-JmsCbsws
X-Proofpoint-GUID: CM_eGiry6q8Eks-V-DjTbf2yMscXJE-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_11,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306080136
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar
 K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Jun 2023 20:35:05 -0700 (PDT)
Hugh Dickins <hughd@google.com> wrote:

> On Tue, 6 Jun 2023, Gerald Schaefer wrote:
> > On Mon, 5 Jun 2023 22:11:52 -0700 (PDT)
> > Hugh Dickins <hughd@google.com> wrote: =20
> > > On Thu, 1 Jun 2023 15:57:51 +0200
> > > Gerald Schaefer <gerald.schaefer@linux.ibm.com> wrote: =20
> > > >=20
> > > > Yes, we have 2 pagetables in one 4K page, which could result in same
> > > > rcu_head reuse. It might be possible to use the cleverness from our
> > > > page_table_free() function, e.g. to only do the call_rcu() once, for
> > > > the case where both 2K pagetable fragments become unused, similar to
> > > > how we decide when to actually call __free_page().
> > > >=20
> > > > However, it might be much worse, and page->rcu_head from a pagetable
> > > > page cannot be used at all for s390, because we also use page->lru
> > > > to keep our list of free 2K pagetable fragments. I always get confu=
sed
> > > > by struct page unions, so not completely sure, but it seems to me t=
hat
> > > > page->rcu_head would overlay with page->lru, right?   =20
> > >=20
> > > Sigh, yes, page->rcu_head overlays page->lru.  But (please correct me=
 if
> > > I'm wrong) I think that s390 could use exactly the same technique for
> > > its list of free 2K pagetable fragments as it uses for its list of THP
> > > "deposited" pagetable fragments, over in arch/s390/mm/pgtable.c: use
> > > the first two longs of the page table itself for threading the list. =
=20
> >=20
> > Nice idea, I think that could actually work, since we only need the emp=
ty
> > 2K halves on the list. So it should be possible to store the list_head
> > inside those. =20
>=20
> Jason quickly pointed out the flaw in my thinking there.

Yes, while I had the right concerns about "the to-be-freed pagetables would
still be accessible, but not really valid, if we added them back to the lis=
t,
with list_heads inside them", when suggesting the approach w/o passing over
the mm, I missed that we would have the very same issue already with the
existing page_table_free_rcu().

Thankfully Jason was watching out!

>=20
> >  =20
> > >=20
> > > And while it could use third and fourth longs instead, I don't see any
> > > need for that: a deposited pagetable has been allocated, so would not
> > > be on the list of free fragments. =20
> >=20
> > Correct, that should not interfere.
> >  =20
> > >=20
> > > Below is one of the grossest patches I've ever posted: gross because
> > > it's a rushed attempt to see whether that is viable, while it would t=
ake
> > > me longer to understand all the s390 cleverness there (even though the
> > > PP AA commentary above page_table_alloc() is excellent). =20
> >=20
> > Sounds fair, this is also one of the grossest code we have, which is al=
so
> > why Alexander added the comment. I guess we could need even more commen=
ts
> > inside the code, as it still confuses me more than it should.
> >=20
> > Considering that, you did remarkably well. Your patch seems to work fin=
e,
> > at least it survived some LTP mm tests. I will also add it to our CI ru=
ns,
> > to give it some more testing. Will report tomorrow when it broke someth=
ing.
> > See also below for some patch comments. =20
>=20
> Many thanks for your effort on this patch.  I don't expect the testing
> of it to catch Jason's point, that I'm corrupting the page table while
> it's on its way through RCU to being freed, but he's right nonetheless.

Right, tests ran fine, but we would have introduced subtle issues with
racing gup_fast, I guess.

>=20
> I'll integrate your fixes below into what I have here, but probably
> just archive it as something to refer to later in case it might play
> a part; but probably it will not - sorry for wasting your time.

No worries, looking at that s390 code can never be amiss. It seems I need
regular refresh, at least I'm sure I already understood it better in the
past.

And who knows, with Jasons recent thoughts, that "list_head inside
pagetable" idea might not be dead yet.

>=20
> >  =20
> > >=20
> > > I'm hoping the use of page->lru in arch/s390/mm/gmap.c is disjoint.
> > > And cmma_init_nodat()? Ah, that's __init so I guess disjoint. =20
> >=20
> > cmma_init_nodat() should be disjoint, not only because it is __init,
> > but also because it explicitly skips pagetable pages, so it should
> > never touch page->lru of those.
> >=20
> > Not very familiar with the gmap code, it does look disjoint, and we sho=
uld
> > also use complete 4K pages for pagetables instead of 2K fragments there,
> > but Christian or Claudio should also have a look.
> >  =20
> > >=20
> > > Gerald, s390 folk: would it be possible for you to give this
> > > a try, suggest corrections and improvements, and then I can make it
> > > a separate patch of the series; and work on avoiding concurrent use
> > > of the rcu_head by pagetable fragment buddies (ideally fit in with
> > > the scheme already there, maybe DD bits to go along with the PP AA). =
=20
> >=20
> > It feels like it could be possible to not only avoid the double
> > rcu_head, but also avoid passing over the mm via page->pt_mm.
> > I.e. have pte_free_defer(), which has the mm, do all the checks and
> > list updates that page_table_free() does, for which we need the mm.
> > Then just skip the pgtable_pte_page_dtor() + __free_page() at the end,
> > and do call_rcu(pte_free_now) instead. The pte_free_now() could then
> > just do _dtor/__free_page similar to the generic version. =20
>=20
> I'm not sure: I missed your suggestion there when I first skimmed
> through, and today have spent more time getting deeper into how it's
> done at present.  I am now feeling more confident of a way forward,
> a nicely integrated way forward, than I was yesterday.
> Though getting it right may not be so easy.

I think my "feeling" was a d=C3=A9j=C3=A0 vu of the existing logic that we =
use for
page_table_free_rcu() -> __tlb_remove_table(), where we also have no mm
any more at the end, and use the PP bits magic to find out if the page
can be freed, or if we still have fragments left.

Of course, in that case, we also would not need the mm any more for
list handling, as the to-be-freed fragments were already put back
on the list, but with PP bits set, to prevent re-use. And clearing
those would then make the fragment usable from the list again.

I guess that would also be the major difference here, i.e. your RCU
call-back would need to be able to add fragments back to the list,
after having them removed before to make room for page->rcu_head,
but with Jasons thoughts that does not seem so impossible after all.

I do not yet understand if the list_head would then compulsorily need
to be inside the pagetable, because page->rcu_head/lru still cannot be
used (again). But you already have a patch for that, so either way
might be possible.

>=20
> When Jason pointed out the existing RCU, I initially hoped that it might
> already provide the necessary framework: but sadly not, because the
> unbatched case (used when additional memory is not available) does not
> use RCU at all, but instead the tlb_remove_table_sync_one() IRQ hack.
> If I used that, it would cripple the s390 implementation unacceptably.
>=20
> >=20
> > I must admit that I still have no good overview of the "big picture"
> > here, and especially if this approach would still fit in. Probably not,
> > as the to-be-freed pagetables would still be accessible, but not really
> > valid, if we added them back to the list, with list_heads inside them.
> > So maybe call_rcu() has to be done always, and not only for the case
> > where the whole 4K page becomes free, then we probably cannot do w/o
> > passing over the mm for proper list handling. =20
>=20
> My current thinking (but may be proved wrong) is along the lines of:
> why does something on its way to being freed need to be on any list
> than the rcu_head list?  I expect the current answer is, that the
> other half is allocated, so the page won't be freed; but I hope that
> we can put it back on that list once we're through with the rcu_head.

Yes, that looks promising. Such a fragment would not necessarily need
to be on the list, because while it is on its way, i.e. before the
RCU call-back finished, it cannot be re-used anyway.

page_table_alloc() could currently find such a fragment on the list, but
only to see the PP bits set, so it will not use it. Only after
__tlb_remove_table() in the RCU call-back resets the bits, it would be
usable again.

In your case, that could correspond to adding it back to the list.
That could even be an improvement, because page_table_alloc() would
not be bothered by such unusable fragments.

[...]
>=20
> Is it too early to wish you a happy reverse Xmas?

Nice idea, we should make June 24th the reverse Xmas Remembrance Day :-)
