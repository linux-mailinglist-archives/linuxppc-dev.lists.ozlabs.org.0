Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 980A374B328
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 16:39:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JJiwO3bD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyGJW6jgKz3c5Q
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 00:39:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JJiwO3bD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QyGHd4dbhz30fm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jul 2023 00:39:09 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367EKoLn002537;
	Fri, 7 Jul 2023 14:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=xDHweLfB2jGmEALLzfHomsEO0iNqJHh+OCBfH7P6xK8=;
 b=JJiwO3bD6N7eg3IH8SPkBO+4d/XtPlb+o/JWZVlM7CzRU21imiL40tTT7ZrGWc/rcgC8
 /ZQawoJzJ/Wi4YLFowBQZTzFSsAioyMZPUQj2/+TzATXsOqAEwPAm/8Er5fao4qLfzKD
 kRYH5IZgLX1rkVyo5Dnxic2rIqYoORkHY4hH4THeouMwfaTpM9WXeJAc6VddXVoilfaE
 gfwbTZuv0iejbuxSU1u0BBVFoIAK4bhb+avBCh+DDMSLdfERrKFp1/Onb3Na6Dda/11u
 xhZI5AYKQfEArH0gbJFiFlEy61E8nbrzVLvMyMHX6afIi6idU/k5hOjVWQR8mRXwhuDJ Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rpmcv0h7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 14:38:17 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 367Ebf4c029017;
	Fri, 7 Jul 2023 14:37:44 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rpmcv0ftt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 14:37:44 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 367E0T2h032367;
	Fri, 7 Jul 2023 14:37:18 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3rjbde41s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 14:37:18 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 367EbECL36962894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jul 2023 14:37:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 024662004B;
	Fri,  7 Jul 2023 14:37:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 998F720043;
	Fri,  7 Jul 2023 14:37:10 +0000 (GMT)
Received: from thinkpad-T15 (unknown [9.179.12.113])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  7 Jul 2023 14:37:10 +0000 (GMT)
Date: Fri, 7 Jul 2023 16:37:08 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables
 sharing page
Message-ID: <20230707163708.5157e19f@thinkpad-T15>
In-Reply-To: <8c6a4a46-2d17-8cfb-50f-f89f1d44973f@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
	<a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com>
	<20230628211624.531cdc58@thinkpad-T15>
	<cd7c2851-1440-7220-6c53-16b343b1474@google.com>
	<ZJ2hsM5Tn+yUZ5ZV@ziepe.ca>
	<20230629175645.7654d0a8@thinkpad-T15>
	<edaa96f-80c1-1252-acbb-71c4f045b035@google.com>
	<7bef5695-fa4a-7215-7e9d-d4a83161c7ab@google.com>
	<ZKUR0HItN2Va8J1D@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
	<8c6a4a46-2d17-8cfb-50f-f89f1d44973f@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9Q6opkkwFp06hBkp91WUs1l0tejkNqki
X-Proofpoint-ORIG-GUID: IKcXEBRjrfIrdRwSgUlS8tQG9J7PotRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_10,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070134
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
 K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Mil
 ler" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 5 Jul 2023 17:52:40 -0700 (PDT)
Hugh Dickins <hughd@google.com> wrote:

> On Wed, 5 Jul 2023, Alexander Gordeev wrote:
> > On Sat, Jul 01, 2023 at 09:32:38PM -0700, Hugh Dickins wrote:  
> > > On Thu, 29 Jun 2023, Hugh Dickins wrote:  
> > 
> > Hi Hugh,
> > 
> > ...
> >   
> > > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > > +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> > > +{
> > > +	struct page *page;  
> > 
> > If I got your and Claudio conversation right, you were going to add
> > here WARN_ON_ONCE() in case of mm_alloc_pgste(mm)?  

Good point, thanks Alexander for noticing!

> 
> Well, Claudio approved, so I would have put it in, if we had stuck with
> that version which had "if (mm_alloc_pgste(mm)) {" in pte_free_defer();
> but once that went away, it became somewhat irrelevant... to me anyway.
> 
> But I don't mind adding it here, in the v3 I'll post when -rc1 is out,
> if it might help you guys - there is some point, since pte_free_defer()
> is a route which can usefully check for such a case, without confusion
> from harmless traffic from immediate frees of just-in-case allocations.
> 
> But don't expect it to catch all such cases (if they exist): another
> category of s390 page_table_free()s comes from the PageAnon
> zap_deposited_table() in zap_huge_pmd(): those tables might or might
> not have been exposed to userspace at some time in the past.

Right, after THP collapse, the previously active PTE table would be
deposited in this case, and then later freed in zap_deposited_table().
I guess we need to be very careful, if THP was ever enabled for KVM
guests.

> 
> I'll add the WARN_ON_ONCE in pte_free_defer() (after checking that
> WARN_ON_ONCE is the one we want - I get confused by all the different
> flavours of WARN, and have to check the header file each time to be
> sure of the syntax and semantics): but be aware that it won't be
> checking all potential cases.

Thanks, looks good.
