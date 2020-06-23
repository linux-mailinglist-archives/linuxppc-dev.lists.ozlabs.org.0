Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B56A2053BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 15:44:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rnZS0Zd9zDqK9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 23:44:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rnWr14dYzDqRb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 23:42:14 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05NDWbdD177023
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 09:42:11 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31sk2sbhu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 09:42:11 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05NDWjMe177344
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 09:42:11 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31sk2sbht9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 09:42:10 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05NDZ8X5020599;
 Tue, 23 Jun 2020 13:42:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 31sa3822r8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 13:42:08 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05NDg5PY53215458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jun 2020 13:42:05 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48E5811C052;
 Tue, 23 Jun 2020 13:42:05 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8732C11C04A;
 Tue, 23 Jun 2020 13:42:04 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.44.89])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Jun 2020 13:42:04 +0000 (GMT)
Date: Tue, 23 Jun 2020 19:12:02 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v1 2/3] powerpc/mm/radix: Fix PTE/PMD fragment count for
 early page table mappings
Message-ID: <20200623134202.GA11488@in.ibm.com>
References: <20200623073017.1951-1-bharata@linux.ibm.com>
 <20200623073017.1951-3-bharata@linux.ibm.com>
 <87sgem2hld.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sgem2hld.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_06:2020-06-23,
 2020-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=5 clxscore=1015 lowpriorityscore=0 bulkscore=0
 cotscore=-2147483648 mlxscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006230108
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 04:07:34PM +0530, Aneesh Kumar K.V wrote:
> Bharata B Rao <bharata@linux.ibm.com> writes:
> 
> > We can hit the following BUG_ON during memory unplug:
> >
> > kernel BUG at arch/powerpc/mm/book3s64/pgtable.c:342!
> > Oops: Exception in kernel mode, sig: 5 [#1]
> > LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> > NIP [c000000000093308] pmd_fragment_free+0x48/0xc0
> > LR [c00000000147bfec] remove_pagetable+0x578/0x60c
> > Call Trace:
> > 0xc000008050000000 (unreliable)
> > remove_pagetable+0x384/0x60c
> > radix__remove_section_mapping+0x18/0x2c
> > remove_section_mapping+0x1c/0x3c
> > arch_remove_memory+0x11c/0x180
> > try_remove_memory+0x120/0x1b0
> > __remove_memory+0x20/0x40
> > dlpar_remove_lmb+0xc0/0x114
> > dlpar_memory+0x8b0/0xb20
> > handle_dlpar_errorlog+0xc0/0x190
> > pseries_hp_work_fn+0x2c/0x60
> > process_one_work+0x30c/0x810
> > worker_thread+0x98/0x540
> > kthread+0x1c4/0x1d0
> > ret_from_kernel_thread+0x5c/0x74
> >
> > This occurs when unplug is attempted for such memory which has
> > been mapped using memblock pages as part of early kernel page
> > table setup. We wouldn't have initialized the PMD or PTE fragment
> > count for those PMD or PTE pages.
> >
> > Fixing this includes 3 parts:
> >
> > - Re-walk the init_mm page tables from mem_init() and initialize
> >   the PMD and PTE fragment count to 1.
> > - When freeing PUD, PMD and PTE page table pages, check explicitly
> >   if they come from memblock and if so free then appropriately.
> > - When we do early memblock based allocation of PMD and PUD pages,
> >   allocate in PAGE_SIZE granularity so that we are sure the
> >   complete page is used as pagetable page.
> >
> > Since we now do PAGE_SIZE allocations for both PUD table and
> > PMD table (Note that PTE table allocation is already of PAGE_SIZE),
> > we end up allocating more memory for the same amount of system RAM.
> > Here is a comparision of how much more we need for a 64T and 2G
> > system after this patch:
> >
> > 1. 64T system
> > -------------
> > 64T RAM would need 64G for vmemmap with struct page size being 64B.
> >
> > 128 PUD tables for 64T memory (1G mappings)
> > 1 PUD table and 64 PMD tables for 64G vmemmap (2M mappings)
> >
> > With default PUD[PMD]_TABLE_SIZE(4K), (128+1+64)*4K=772K
> > With PAGE_SIZE(64K) table allocations, (128+1+64)*64K=12352K
> >
> > 2. 2G system
> > ------------
> > 2G RAM would need 2M for vmemmap with struct page size being 64B.
> >
> > 1 PUD table for 2G memory (1G mapping)
> > 1 PUD table and 1 PMD table for 2M vmemmap (2M mappings)
> >
> > With default PUD[PMD]_TABLE_SIZE(4K), (1+1+1)*4K=12K
> > With new PAGE_SIZE(64K) table allocations, (1+1+1)*64K=192K
> 
> How about we just do
> 
> void pmd_fragment_free(unsigned long *pmd)
> {
> 	struct page *page = virt_to_page(pmd);
> 
> 	/*
> 	 * Early pmd pages allocated via memblock
> 	 * allocator need to be freed differently
> 	 */
> 	if (PageReserved(page))
> 		return free_reserved_page(page);
> 
> 	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
> 	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
> 		pgtable_pmd_page_dtor(page);
> 		__free_page(page);
> 	}
> }
> 
> That way we could avoid the fixup_pgtable_fragments completely?

Yes we could, by doing the same for pte_fragment_free() too.

However right from the early versions, we were going in the direction of
making the handling and behaviour of both early page tables and later
page tables as similar to each other as possible. Hence we started with
"fixing up" the early page tables.

If that's not a significant consideration, we can do away with fixup
and retain the other parts (PAGE_SIZE allocations and conditional
freeing) and still fix the bug.

Regards,
Bharata.
