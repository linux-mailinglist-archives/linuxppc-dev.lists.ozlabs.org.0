Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A745E73CB76
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 16:54:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PjEYT+/P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QpHDm3yLFz3bsd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jun 2023 00:54:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PjEYT+/P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QpHCn65yjz30FW
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jun 2023 00:53:09 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35OEkxJQ011632;
	Sat, 24 Jun 2023 14:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=7t6yVx/S2dndE4uFEEcL0uKTeJDYhE48ld443i4rI2w=;
 b=PjEYT+/PCVLg1vWKmRngR+Bzvz8+0OnLHjjMe0whPUPd8yLY9JPh9hE4C0hUcnDS6kk8
 yoIalrAoFve3M+b2iRTfMYXiduUe9erI7VE29z05Wtd+IiAEDUKYsyHY97TY5D1ABcbe
 C2JXbLIpGSclN82MjqBUTCldUA3pCDnoW13nNILPUzqe56GWwSVvCDrHy0RisTZ7r9cO
 LtL+R6t+t5qfmsor5nQl4hVI86QFKg3INH3e0/xOyV0ZmNg+m+X6Tc1RSJ+lqKM2zqRy
 BtSFM4xU8si7L95JZkpTvnqUaiSqbn3m4//D3YvGem3hjZ30m32MMg1U6KN6Y7E/oML7 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3re0xdhdkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jun 2023 14:52:38 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35OEfS53000387;
	Sat, 24 Jun 2023 14:52:37 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3re0xdhdk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jun 2023 14:52:37 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35ODl33U008260;
	Sat, 24 Jun 2023 14:52:36 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3rdr45bbuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jun 2023 14:52:36 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35OEqZZ92818650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Jun 2023 14:52:35 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C5285805B;
	Sat, 24 Jun 2023 14:52:35 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 108375805C;
	Sat, 24 Jun 2023 14:52:30 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.67.238])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 24 Jun 2023 14:52:29 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: Re: [PATCH v2 00/16] Add support for DAX vmemmap optimization for
 ppc64
In-Reply-To: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
References: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
Date: Sat, 24 Jun 2023 20:22:27 +0530
Message-ID: <87edm0x68k.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dZiffyy5BFPiRoeIxmuRBOdM6odZps76
X-Proofpoint-GUID: setDkWvO0wX1qEZuuP51mYS3hXbl6MLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-24_10,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306240137
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Andrew,

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> This patch series implements changes required to support DAX vmemmap
> optimization for ppc64. The vmemmap optimization is only enabled with radix MMU
> translation and 1GB PUD mapping with 64K page size. The patch series also split
> hugetlb vmemmap optimization as a separate Kconfig variable so that
> architectures can enable DAX vmemmap optimization without enabling hugetlb
> vmemmap optimization. This should enable architectures like arm64 to enable DAX
> vmemmap optimization while they can't enable hugetlb vmemmap optimization. More
> details of the same are in patch "mm/vmemmap optimization: Split hugetlb and
> devdax vmemmap optimization"
>
> Changes from V1:
> * Fix make htmldocs warning
> * Fix vmemmap allocation bugs with different alignment values.
> * Correctly check for section validity to before we free vmemmap area
>
> Aneesh Kumar K.V (16):
>   powerpc/mm/book3s64: Use pmdp_ptep helper instead of typecasting.
>   powerpc/book3s64/mm: mmu_vmemmap_psize is used by radix
>   powerpc/book3s64/mm: Fix DirectMap stats in /proc/meminfo
>   powerpc/book3s64/mm: Use PAGE_KERNEL instead of opencoding
>   powerpc/mm/dax: Fix the condition when checking if altmap vmemap can
>     cross-boundary
>   mm/hugepage pud: Allow arch-specific helper function to check huge
>     page pud support
>   mm: Change pudp_huge_get_and_clear_full take vm_area_struct as arg
>   mm/vmemmap: Improve vmemmap_can_optimize and allow architectures to
>     override
>   mm/vmemmap: Allow architectures to override how vmemmap optimization
>     works
>   mm: Add __HAVE_ARCH_PUD_SAME similar to __HAVE_ARCH_P4D_SAME
>   mm/huge pud: Use transparent huge pud helpers only with
>     CONFIG_TRANSPARENT_HUGEPAGE
>   mm/vmemmap optimization: Split hugetlb and devdax vmemmap optimization
>   powerpc/book3s64/mm: Enable transparent pud hugepage
>   powerpc/book3s64/vmemmap: Switch radix to use a different vmemmap
>     handling function
>   powerpc/book3s64/radix: Add support for vmemmap optimization for radix
>   powerpc/book3s64/radix: Remove mmu_vmemmap_psize
>
>  Documentation/mm/vmemmap_dedup.rst            |   1 +
>  Documentation/powerpc/index.rst               |   1 +
>  Documentation/powerpc/vmemmap_dedup.rst       | 101 +++
>  arch/loongarch/Kconfig                        |   2 +-
>  arch/powerpc/Kconfig                          |   1 +
>  arch/powerpc/include/asm/book3s/64/pgtable.h  | 156 ++++-
>  arch/powerpc/include/asm/book3s/64/radix.h    |  47 ++
>  .../include/asm/book3s/64/tlbflush-radix.h    |   2 +
>  arch/powerpc/include/asm/book3s/64/tlbflush.h |   8 +
>  arch/powerpc/include/asm/pgtable.h            |   3 +
>  arch/powerpc/mm/book3s64/pgtable.c            |  78 +++
>  arch/powerpc/mm/book3s64/radix_pgtable.c      | 577 ++++++++++++++++--
>  arch/powerpc/mm/book3s64/radix_tlb.c          |   7 +
>  arch/powerpc/mm/init_64.c                     |  39 +-
>  arch/powerpc/platforms/Kconfig.cputype        |   1 +
>  arch/riscv/Kconfig                            |   2 +-
>  arch/x86/Kconfig                              |   3 +-
>  drivers/nvdimm/pfn_devs.c                     |   2 +-
>  fs/Kconfig                                    |   2 +-
>  include/linux/mm.h                            |  32 +-
>  include/linux/pgtable.h                       |  11 +-
>  include/trace/events/thp.h                    |  17 +
>  mm/Kconfig                                    |   5 +-
>  mm/debug_vm_pgtable.c                         |   2 +-
>  mm/huge_memory.c                              |   2 +-
>  mm/mm_init.c                                  |   2 +-
>  mm/mremap.c                                   |   2 +-
>  mm/sparse-vmemmap.c                           |   3 +
>  28 files changed, 1032 insertions(+), 77 deletions(-)
>  create mode 100644 Documentation/powerpc/vmemmap_dedup.rst
>

Michael Ellerman merged some of the ppc64 patches. How do
you like to merge the mm changes? Do you like a repost of patches 6-12?

-aneesh
