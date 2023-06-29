Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A3742A1D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 17:58:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fJat8Sya;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsNQr6g9tz3bvB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 01:58:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fJat8Sya;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsNPx3rv9z30PL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 01:57:41 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35TFkPM3013631;
	Thu, 29 Jun 2023 15:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=J7n4i56PjuYyheRXiT1h3zZxQxjoI3aURFtsNFhnzeA=;
 b=fJat8SyaeO/jZvMndX/6x2417ZRjc3DZarZ7bW3z0FoTpRYKPh4uN7pNn4UOWvjmarb3
 IQY5nUFE7bNlUXBdxYReE0UWVSc7h8MRtk0yunuB34XZ1e1IZ0OMI4kuGS/U9811cf7/
 U3nYS/uC5jUqbncbZPgN3IuVbY2a2fX8k2AeBsXt/Qf2VDYXWWMoLcGq2VFRMUuy7HEC
 KelsobjcuzPUpzItspSnwXtI5BMpby7hEFvy37e1OaFOZEdUaTogamnt2NO8uIdWrGxm
 i/5uAqXxKof5noy3h3DPc88V6gPsb3oWVvXrivfb1f6cNgZlA6YAnbwXml0QzwKKt0Xq Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhcw209q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 15:56:59 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35TFkvQd014751;
	Thu, 29 Jun 2023 15:56:58 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhcw209p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 15:56:58 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35T4lrrC024964;
	Thu, 29 Jun 2023 15:56:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3rdr452k48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 15:56:54 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35TFup4K56361424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Jun 2023 15:56:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2ACC20040;
	Thu, 29 Jun 2023 15:56:50 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2131120043;
	Thu, 29 Jun 2023 15:56:48 +0000 (GMT)
Received: from thinkpad-T15 (unknown [9.171.52.248])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu, 29 Jun 2023 15:56:48 +0000 (GMT)
Date: Thu, 29 Jun 2023 17:56:45 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables
 sharing page
Message-ID: <20230629175645.7654d0a8@thinkpad-T15>
In-Reply-To: <ZJ2hsM5Tn+yUZ5ZV@ziepe.ca>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
	<a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com>
	<20230628211624.531cdc58@thinkpad-T15>
	<cd7c2851-1440-7220-6c53-16b343b1474@google.com>
	<ZJ2hsM5Tn+yUZ5ZV@ziepe.ca>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3HDFPvbn1Kqe9hJCMmYTIt5DBeoBHNxy
X-Proofpoint-GUID: lDFvs8dRlpQ8RTlIWc53XmzE2FLLW2CQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_03,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306290140
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar
 K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill
 A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Jun 2023 12:22:24 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Wed, Jun 28, 2023 at 10:08:08PM -0700, Hugh Dickins wrote:
> > On Wed, 28 Jun 2023, Gerald Schaefer wrote:  
> > > 
> > > As discussed in the other thread, we would rather go with less complexity,
> > > possibly switching to an approach w/o the list and fragment re-use in the
> > > future. For now, as a first step in that direction, we can try with not
> > > adding fragments back only for pte_free_defer(). Here is an adjusted
> > > version of your patch, copying most of your pte_free_defer() logic and
> > > also description, tested with LTP and all three of your patch series applied:  
> > 
> > Thanks, Gerald: I don't mind abandoning my 13/12 SLAB_TYPESAFE_BY_RCU
> > patch (posted with fewer Cc's to the s390 list last week), and switching
> > to your simpler who-cares-if-we-sometimes-don't-make-maximal-use-of-page
> > patch.
> > 
> > But I didn't get deep enough into it today to confirm it - and disappointed
> > that you've found it necessary to play with pt_frag_refcount in addition to
> > _refcount and HH bits.  No real problem with that, but my instinct says it
> > should be simpler.  

Yes, I also found it a bit awkward, but it seemed "good and simple enough",
to have something to go forward with, while my instinct was in line with yours.

> 
> Is there any reason it should be any different at all from what PPC is
> doing?
> 
> I still think the right thing to do here is make the PPC code common
> (with Hugh's proposed RCU modification) and just use it in both
> arches....

With the current approach, we would not add back fragments _only_ for
the new pte_free_defer() path, while keeping our cleverness for the other
paths. Not having a good overview of the negative impact wrt potential
memory waste, I would rather take small steps, if possible.

If we later switch to never adding back fragments, of course we should
try to be in line with PPC implementation.
