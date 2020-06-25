Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C57209D7F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 13:32:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49syXx1BsVzDqrV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 21:32:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49syWD217zzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 21:30:48 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05PB9MPd176927; Thu, 25 Jun 2020 07:30:40 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31vtt30kvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 07:30:40 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05PBTgeD001319;
 Thu, 25 Jun 2020 11:30:39 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 31uurt6d4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 11:30:39 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05PBUaSD25362860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jun 2020 11:30:36 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1B01C605A;
 Thu, 25 Jun 2020 11:30:37 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14ADEC6055;
 Thu, 25 Jun 2020 11:30:35 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.115.79])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Jun 2020 11:30:35 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: Re: [PATCH v2 1/4] powerpc/mm/radix: Fix PTE/PMD fragment count for
 early page table mappings
In-Reply-To: <20200625064547.228448-2-aneesh.kumar@linux.ibm.com>
References: <20200625064547.228448-1-aneesh.kumar@linux.ibm.com>
 <20200625064547.228448-2-aneesh.kumar@linux.ibm.com>
Date: Thu, 25 Jun 2020 17:00:33 +0530
Message-ID: <87o8p7l6w6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_04:2020-06-25,
 2020-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=2 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 spamscore=0 cotscore=-2147483648
 clxscore=1015 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006250066
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
Cc: Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:


> Fixing this includes 3 parts:
>
> - Re-walk the init_mm page tables from mem_init() and initialize
>   the PMD and PTE fragment count to 1.
> - When freeing PUD, PMD and PTE page table pages, check explicitly
>   if they come from memblock and if so free then appropriately.
> - When we do early memblock based allocation of PMD and PUD pages,
>   allocate in PAGE_SIZE granularity so that we are sure the
>   complete page is used as pagetable page.
>
> Since we now do PAGE_SIZE allocations for both PUD table and
> PMD table (Note that PTE table allocation is already of PAGE_SIZE),
> we end up allocating more memory for the same amount of system RAM.
> Here is a comparision of how much more we need for a 64T and 2G
> system after this patch:
>

Missed updating the commit message w.r.t page table fragments.  Updated
one below.

powerpc/mm/radix: Fix PTE/PMD fragment count for early page table mappings

We can hit the following BUG_ON during memory unplug:

kernel BUG at arch/powerpc/mm/book3s64/pgtable.c:342!
Oops: Exception in kernel mode, sig: 5 [#1]
LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
NIP [c000000000093308] pmd_fragment_free+0x48/0xc0
LR [c00000000147bfec] remove_pagetable+0x578/0x60c
Call Trace:
0xc000008050000000 (unreliable)
remove_pagetable+0x384/0x60c
radix__remove_section_mapping+0x18/0x2c
remove_section_mapping+0x1c/0x3c
arch_remove_memory+0x11c/0x180
try_remove_memory+0x120/0x1b0
__remove_memory+0x20/0x40
dlpar_remove_lmb+0xc0/0x114
dlpar_memory+0x8b0/0xb20
handle_dlpar_errorlog+0xc0/0x190
pseries_hp_work_fn+0x2c/0x60
process_one_work+0x30c/0x810
worker_thread+0x98/0x540
kthread+0x1c4/0x1d0
ret_from_kernel_thread+0x5c/0x74

This occurs when unplug is attempted for such memory which has
been mapped using memblock pages as part of early kernel page
table setup. We wouldn't have initialized the PMD or PTE fragment
count for those PMD or PTE pages.

This can be fixed by allocating memory in PAGE_SIZE granularity
during early page table allocation. This makes sure a specific
page is not shared for another memblock allocation and we can
free them correctly on removing page-table pages.

Since we now do PAGE_SIZE allocations for both PUD table and
PMD table (Note that PTE table allocation is already of PAGE_SIZE),
we end up allocating more memory for the same amount of system RAM.
Here is a comparision of how much more we need for a 64T and 2G
system after this patch:

1. 64T system
-------------
64T RAM would need 64G for vmemmap with struct page size being 64B.

128 PUD tables for 64T memory (1G mappings)
1 PUD table and 64 PMD tables for 64G vmemmap (2M mappings)

With default PUD[PMD]_TABLE_SIZE(4K), (128+1+64)*4K=772K
With PAGE_SIZE(64K) table allocations, (128+1+64)*64K=12352K

2. 2G system
------------
2G RAM would need 2M for vmemmap with struct page size being 64B.

1 PUD table for 2G memory (1G mapping)
1 PUD table and 1 PMD table for 2M vmemmap (2M mappings)

With default PUD[PMD]_TABLE_SIZE(4K), (1+1+1)*4K=12K
With new PAGE_SIZE(64K) table allocations, (1+1+1)*64K=192K

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

-aneesh
