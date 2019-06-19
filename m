Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2388F4BBFE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 16:47:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TSTP04jmzDqv4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 00:47:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TSKq58RWzDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 00:40:31 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JEWflI087422
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 10:40:28 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t7p1ukkgf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 10:40:28 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Wed, 19 Jun 2019 15:40:26 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 15:40:24 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5JEeNUI56557728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 14:40:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA76211C052;
 Wed, 19 Jun 2019 14:40:23 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDCF411C04A;
 Wed, 19 Jun 2019 14:40:22 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.71.109])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Jun 2019 14:40:22 +0000 (GMT)
Date: Wed, 19 Jun 2019 20:10:17 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH v0] powerpc: Fix BUG_ON during memory unplug on radix
References: <20190619074545.11761-1-bharata@linux.ibm.com>
 <87tvcm0wr5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tvcm0wr5.fsf@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19061914-0028-0000-0000-0000037BB4C1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061914-0029-0000-0000-0000243BC2EF
Message-Id: <20190619144017.GC8097@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190119
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
Reply-To: bharata@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, aneesh.kumar@linux.vnet.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 19, 2019 at 02:36:54PM +0530, Aneesh Kumar K.V wrote:
> Bharata B Rao <bharata@linux.ibm.com> writes:
> 
> > We hit the following BUG_ON when memory hotplugged before reboot
> > is unplugged after reboot:
> >
> > kernel BUG at arch/powerpc/mm/pgtable-frag.c:113!
> >
> >  remove_pagetable+0x594/0x6a0
> >  (unreliable)
> >  remove_pagetable+0x94/0x6a0
> >  vmemmap_free+0x394/0x410
> >  sparse_remove_one_section+0x26c/0x2e8
> >  __remove_pages+0x428/0x540
> >  arch_remove_memory+0xd0/0x170
> >  __remove_memory+0xd4/0x1a0
> >  dlpar_remove_lmb+0xbc/0x110
> >  dlpar_memory+0xa80/0xd20
> >  handle_dlpar_errorlog+0xa8/0x160
> >  pseries_hp_work_fn+0x2c/0x60
> >  process_one_work+0x46c/0x860
> >  worker_thread+0x364/0x5e0
> >  kthread+0x1b0/0x1c0
> >  ret_from_kernel_thread+0x5c/0x68
> >
> > This occurs because, during reboot-after-hotplug, the hotplugged
> > memory range gets initialized as regular memory and page
> > tables are setup using memblock allocator. This means that we
> > wouldn't have initialized the PMD or PTE fragment count for
> > those PMD or PTE pages.
> >
> > Fixing this includes 3 aspects:
> >
> > - Walk the init_mm page tables from mem_init() and initialize
> >   the PMD and PTE fragment counts appropriately.
> > - When we do early allocation of PMD (and PGD as well) pages,
> >   allocate in page size PAGE_SIZE granularity so that we are
> >   sure that the complete page is available for us to set the
> >   fragment count which is part of struct page.
> 
> 
> That is an important change now. For early page table we now allocate
> PAGE_SIZE tables and hencec we consider then as pages with fragment
> count 1. You also may want to explain here why.

Sure will make this clear in my next version.

> I guess the challenge is
> due to the fact that we can't clearly control how the rest of the page
> will get used and we are not sure they all will be allocated for backing
> page table pages.
> 
> > - When PMD or PTE page is freed, check if it comes from memblock
> >   allocator and free it appropriately.
> >
> > Reported-by: Srikanth Aithal <sraithal@linux.vnet.ibm.com>
> > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/book3s/64/radix.h |  1 +
> >  arch/powerpc/include/asm/sparsemem.h       |  1 +
> >  arch/powerpc/mm/book3s64/pgtable.c         | 12 +++-
> >  arch/powerpc/mm/book3s64/radix_pgtable.c   | 67 +++++++++++++++++++++-
> >  arch/powerpc/mm/mem.c                      |  5 ++
> >  arch/powerpc/mm/pgtable-frag.c             |  5 +-
> >  6 files changed, 87 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
> > index 574eca33f893..4320f2790e8d 100644
> > --- a/arch/powerpc/include/asm/book3s/64/radix.h
> > +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> > @@ -285,6 +285,7 @@ static inline unsigned long radix__get_tree_size(void)
> >  #ifdef CONFIG_MEMORY_HOTPLUG
> >  int radix__create_section_mapping(unsigned long start, unsigned long end, int nid);
> >  int radix__remove_section_mapping(unsigned long start, unsigned long end);
> > +void radix__fixup_pgtable_fragments(void);
> >  #endif /* CONFIG_MEMORY_HOTPLUG */
> >  #endif /* __ASSEMBLY__ */
> >  #endif
> > diff --git a/arch/powerpc/include/asm/sparsemem.h b/arch/powerpc/include/asm/sparsemem.h
> > index 3192d454a733..e662f9232d35 100644
> > --- a/arch/powerpc/include/asm/sparsemem.h
> > +++ b/arch/powerpc/include/asm/sparsemem.h
> > @@ -15,6 +15,7 @@
> >  #ifdef CONFIG_MEMORY_HOTPLUG
> >  extern int create_section_mapping(unsigned long start, unsigned long end, int nid);
> >  extern int remove_section_mapping(unsigned long start, unsigned long end);
> > +void fixup_pgtable_fragments(void);
> >
> >  #ifdef CONFIG_PPC_BOOK3S_64
> >  extern int resize_hpt_for_hotplug(unsigned long new_mem_size);
> > diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> > index 01bc9663360d..7efe9cc16b39 100644
> > --- a/arch/powerpc/mm/book3s64/pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/pgtable.c
> > @@ -186,6 +186,13 @@ int __meminit remove_section_mapping(unsigned long start, unsigned long end)
> >
> >  	return hash__remove_section_mapping(start, end);
> >  }
> > +
> > +void fixup_pgtable_fragments(void)
> > +{
> > +	if (radix_enabled())
> > +		radix__fixup_pgtable_fragments();
> > +}
> > +
> >  #endif /* CONFIG_MEMORY_HOTPLUG */
> >
> >  void __init mmu_partition_table_init(void)
> > @@ -320,7 +327,10 @@ void pmd_fragment_free(unsigned long *pmd)
> >  	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
> >  	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
> >  		pgtable_pmd_page_dtor(page);
> > -		__free_page(page);
> > +		if (PageReserved(page))
> > +			free_reserved_page(page);
> > +		else
> > +			__free_page(page);
> >  	}
> >  }
> >
> > diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> > index 273ae66a9a45..402e8da28cab 100644
> > --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> > @@ -32,6 +32,69 @@
> >  unsigned int mmu_pid_bits;
> >  unsigned int mmu_base_pid;
> >
> > +static void fixup_pmd_fragments(pmd_t *pmd)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < PTRS_PER_PMD; i++, pmd++) {
> > +		pte_t *pte;
> > +		struct page *page;
> > +
> > +		if (pmd_none(*pmd))
> > +			continue;
> > +		if (pmd_huge(*pmd))
> > +			continue;
> > +
> > +		pte = pte_offset_kernel(pmd, 0);
> > +		if (!pte_none(*pte)) {
> > +			page = virt_to_page(pte);
> > +			atomic_inc(&page->pt_frag_refcount);
> > +		}
> > +	}
> > +}
> 
> 
> That naming is confusing. You are fixing up fragemts used for level 4
> table here. I would call them pte fragments? 

Sure, will rename.

> 
> 
> > +
> > +static void fixup_pud_fragments(pud_t *pud)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < PTRS_PER_PUD; i++, pud++) {
> > +		pmd_t *pmd;
> > +		struct page *page;
> > +
> > +		if (pud_none(*pud))
> > +			continue;
> > +		if (pud_huge(*pud))
> > +			continue;
> > +
> > +		pmd = pmd_offset(pud, 0);
> > +		if (!pmd_none(*pmd)) {
> > +			page = virt_to_page(pmd);
> > +			atomic_inc(&page->pt_frag_refcount);
> > +		}
> > +		fixup_pmd_fragments(pmd);
> > +	}
> > +}
> > +
> 
> 
> How do we handle pud table free. That is going to be tricky for general
> allocation they are allocated out of slab and we free them back to slab.
> With pages allocated out of memblock, we need to special case them? 

Yes. With out addressing the freeing of pud table, we can't say that
memory unplug on radix is working fully. However with this fixing of
frag counts, it does work for a few cases.

May be we handle the pud case separately?

Regards,
Bharata.

