Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E047427DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 16:01:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qV8F6si/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsKqV0NQnz3bsQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 00:01:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qV8F6si/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsKpY4W4sz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 00:00:21 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35TDvSCY018330;
	Thu, 29 Jun 2023 13:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=LrYbdcM0evC7Xy9CDimNEkxtdbpvB/BFhHVZyMGsjWc=;
 b=qV8F6si/hA4BMAclDXBQy7EBDubLFaV1IUaBMl1NIzccoj5zCV2u77w6NVMJFtkznkr7
 ln1Oo/k2hNHfVuzudYvAvWMvXEoTFkxnXEBzShSU0D6WY/Cz2rBjy0HfxEbpc2zr6fmP
 eyeTGi/rLL1r1v/YRHvRsaWNFz6ptKjc1e2SbKrtxoqecgrANt4d9MN3C6N2f40/G59v
 8s53SGXTAAegChcxiBTp/H1hMkYuiyIemVNXovvrZxVX9xW/puzk/H9OmrdYihtTMFXI
 BxoprZF/nsWn8XGRF24lWPl4TyTd2X1b9IT+NYD+e9N4ZAskKqxAzZbLBGlbHonfl8li /A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhba183ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 13:59:20 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35TDvdpg018759;
	Thu, 29 Jun 2023 13:59:19 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhba183gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 13:59:18 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35T5nCVI014922;
	Thu, 29 Jun 2023 13:59:16 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3rdr452hpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 13:59:16 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35TDxCmc56885746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Jun 2023 13:59:12 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F48C20043;
	Thu, 29 Jun 2023 13:59:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EA7020040;
	Thu, 29 Jun 2023 13:59:09 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.171.2.247])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 29 Jun 2023 13:59:09 +0000 (GMT)
Date: Thu, 29 Jun 2023 15:59:07 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables sharing
 page
Message-ID: <ZJ2OK29zPB76i0Ga@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
 <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com>
 <20230628211624.531cdc58@thinkpad-T15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628211624.531cdc58@thinkpad-T15>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YMCVI8WX38wPGVoSaafWaumxPTpPmIfa
X-Proofpoint-ORIG-GUID: BptJCD1qhVG-ySwo39DLjqgVEpX_NEnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_03,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 clxscore=1011 mlxscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306290122
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, V
 asily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 28, 2023 at 09:16:24PM +0200, Gerald Schaefer wrote:
> On Tue, 20 Jun 2023 00:51:19 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:

Hi Gerald, Hugh!

...
> @@ -407,6 +445,88 @@ void __tlb_remove_table(void *_table)
>  	__free_page(page);
>  }
>  
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +static void pte_free_now0(struct rcu_head *head);
> +static void pte_free_now1(struct rcu_head *head);

What about pte_free_lower() / pte_free_upper()?

...
> +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> +{
> +	unsigned int bit, mask;
> +	struct page *page;
> +
> +	page = virt_to_page(pgtable);
> +	if (mm_alloc_pgste(mm)) {
> +		/*
> +		 * TODO: Do we need gmap_unlink(mm, pgtable, addr), like in
> +		 * page_table_free_rcu()?
> +		 * If yes -> need addr parameter here, like in pte_free_tlb().
> +		 */
> +		call_rcu(&page->rcu_head, pte_free_pgste);
> +		return;
> +}
> +	bit = ((unsigned long)pgtable & ~PAGE_MASK) / (PTRS_PER_PTE * sizeof(pte_t));
> +
> +	spin_lock_bh(&mm->context.lock);
> +	mask = atomic_xor_bits(&page->_refcount, 0x15U << (bit + 24));

This  makes the bit logic increasingly complicated to me.

What if instead we set the rule "one bit at a time only"?
That means an atomic group bit flip is only allowed between
pairs of bits, namely:

bit flip	initiated from
-----------	----------------------------------------
P      <- A	page_table_free(), page_table_free_rcu()
     H <- A	pte_free_defer()
P <- H		pte_free_half()

In the current model P bit could be on together with H
bit simultaneously. That actually brings in equation
nothing.

Besides, this check in page_table_alloc() (while still
correct) makes one (well, me) wonder "what about HH bits?":

	mask = (mask | (mask >> 4)) & 0x03U;
	if (mask != 0x03U) {
		...
	}

By contrast, with "one bit at a time only" policy every
of three bits effectevely indicates which state a page
half is currently in.

Thanks!
