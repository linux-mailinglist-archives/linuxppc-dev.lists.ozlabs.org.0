Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB82775796C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:44:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MLZgMgaF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4wYV4Vvhz3bYt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 20:44:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MLZgMgaF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4wXZ0ynhz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 20:43:25 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36IAVD5g015975;
	Tue, 18 Jul 2023 10:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=5pqryEuXi7w3clM0cicqo05Ow93ZiUNgOjfFt59QOcA=;
 b=MLZgMgaFynVGFhEZgy+HljSo8qlwdpEYmMyfEK4MDgMn+6vT/mCrDKND2C/bQBJYID+A
 IElpGNDZjJGZoeUao5GfVP8UFDh35vY8TnFF0xXVCxeXHYROhkY/sA7QgjGJvOb3SDF7
 YuvURhU5e/sD363f3LLHzLWmLZ/Q0HElF4zfBkeKSFKsnXOrMtpQvyAmyoupuCJMbcQu
 XaQZsZccdGAV5EXj3AFPpgsGWkWw32WYxVnMc4xqPiwnGnQ74uCUBafblBoWQpDl1n9f
 1oK7yLn/wZcT4B9USMqGYxi+gw/WbHD2PafF0ZKW/Aqi025Lix+1BhTHxniLNce/KY2i XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rws2breec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 10:41:43 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36IAVmXg019296;
	Tue, 18 Jul 2023 10:41:42 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rws2bred1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 10:41:42 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36I6lTQw016870;
	Tue, 18 Jul 2023 10:41:40 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv5srnpnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 10:41:40 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36IAfeE920972012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 10:41:40 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAFEF5805E;
	Tue, 18 Jul 2023 10:41:39 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C6C65805F;
	Tue, 18 Jul 2023 10:41:22 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.109.212.144])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Jul 2023 10:41:21 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 04/13] powerpc: assert_pte_locked() use
 pte_offset_map_nolock()
In-Reply-To: <e8d56c95-c132-a82e-5f5f-7bb1b738b057@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com>
 <e8d56c95-c132-a82e-5f5f-7bb1b738b057@google.com>
Date: Tue, 18 Jul 2023 16:11:19 +0530
Message-ID: <87msztbiy8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zKZQJ9IasJwI7nGrSugta0t-NqCMHUUs
X-Proofpoint-ORIG-GUID: ASlLD63EgmlMnfoUOkFOiogpO5Mj_Hpm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 spamscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180096
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Camp
 bell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hugh Dickins <hughd@google.com> writes:

> Instead of pte_lockptr(), use the recently added pte_offset_map_nolock()
> in assert_pte_locked().  BUG if pte_offset_map_nolock() fails: this is
> stricter than the previous implementation, which skipped when pmd_none()
> (with a comment on khugepaged collapse transitions): but wouldn't we want
> to know, if an assert_pte_locked() caller can be racing such transitions?
>

The reason we had that pmd_none check there was to handle khugpaged. In
case of khugepaged we do pmdp_collapse_flush and then do a ptep_clear.
ppc64 had the assert_pte_locked check inside that ptep_clear.

_pmd = pmdp_collapse_flush(vma, address, pmd);
..
ptep_clear()
-> asset_ptep_locked()
---> pmd_none
-----> BUG


The problem is how assert_pte_locked() verify whether we are holding
ptl. It does that by walking the page table again and in this specific
case by the time we call the function we already had cleared pmd .
>
> This mod might cause new crashes: which either expose my ignorance, or
> indicate issues to be fixed, or limit the usage of assert_pte_locked().
>
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>  arch/powerpc/mm/pgtable.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index cb2dcdb18f8e..16b061af86d7 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -311,6 +311,8 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
>  	p4d_t *p4d;
>  	pud_t *pud;
>  	pmd_t *pmd;
> +	pte_t *pte;
> +	spinlock_t *ptl;
>  
>  	if (mm == &init_mm)
>  		return;
> @@ -321,16 +323,10 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
>  	pud = pud_offset(p4d, addr);
>  	BUG_ON(pud_none(*pud));
>  	pmd = pmd_offset(pud, addr);
> -	/*
> -	 * khugepaged to collapse normal pages to hugepage, first set
> -	 * pmd to none to force page fault/gup to take mmap_lock. After
> -	 * pmd is set to none, we do a pte_clear which does this assertion
> -	 * so if we find pmd none, return.
> -	 */
> -	if (pmd_none(*pmd))
> -		return;
> -	BUG_ON(!pmd_present(*pmd));
> -	assert_spin_locked(pte_lockptr(mm, pmd));
> +	pte = pte_offset_map_nolock(mm, pmd, addr, &ptl);
> +	BUG_ON(!pte);
> +	assert_spin_locked(ptl);
> +	pte_unmap(pte);
>  }
>  #endif /* CONFIG_DEBUG_VM */
>  
> -- 
> 2.35.3
