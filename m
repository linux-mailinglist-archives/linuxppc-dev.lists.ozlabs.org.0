Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C0572367E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 06:57:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZys53ljmz3cD5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 14:57:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XtRGTHGb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XtRGTHGb;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZyrB32kJz3c7Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 14:56:57 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3564bwOx032116;
	Tue, 6 Jun 2023 04:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=lczS+3n1eVCHvm0ULIz5VuW4f/yn5ncHrY2/uwlQksg=;
 b=XtRGTHGblMsx1fG5KtspHWYS939MhLeaszYQLZ/lOtNI9JVZQtbYJJUig0hacn5+2ChF
 P/cwbY7ixbUiO2qxLOK7e2GuvO+beV9PV/Z6w7j8KbAm9TU0WCiYsvMQMjywY3npR44q
 decFOM/7OvJ2X1gSGqzYg5LnWrUaNcZwOTgZK8gV607NKvpFwDH41gV4/T+ydGnt0pk0
 sIKD9paiGEnehqLS9UGY86UVA1D9uW699eaySZ7H7shcIyemhiR4xVmtyaJ3PuZHwubY
 eqLrzP9G/DsU0E5NwhF9yc7yxE/QUMm724fLVJDatxnTLGiBZz9y2RCSwy27FQ2tPnVD rA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1wqxgex9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:56:30 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3564kkCs030491;
	Tue, 6 Jun 2023 04:56:30 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1wqxgex4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:56:30 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3564mAkB013549;
	Tue, 6 Jun 2023 04:56:29 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3qyxqqvbya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:56:29 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3564uSrO35652186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 04:56:28 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1D9D58055;
	Tue,  6 Jun 2023 04:56:27 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21BAD5804B;
	Tue,  6 Jun 2023 04:56:23 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.204.255])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 04:56:22 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 00/16] Add support for DAX vmemmap optimization for ppc64
Date: Tue,  6 Jun 2023 10:25:52 +0530
Message-Id: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c5VX_zwLJ2xoFbkfnhOsPv5PIShQNwJ4
X-Proofpoint-GUID: zrjaZhppAYsqUQXzd8a7u7hDjiuyRZVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_02,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060040
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
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series implements changes required to support DAX vmemmap
optimization for ppc64. The vmemmap optimization is only enabled with radix MMU
translation and 1GB PUD mapping with 64K page size. The patch series also split
hugetlb vmemmap optimization as a separate Kconfig variable so that
architectures can enable DAX vmemmap optimization without enabling hugetlb
vmemmap optimization. This should enable architectures like arm64 to enable DAX
vmemmap optimization while they can't enable hugetlb vmemmap optimization. More
details of the same are in patch "mm/vmemmap optimization: Split hugetlb and
d

Aneesh Kumar K.V (16):
  powerpc/mm/book3s64: Use pmdp_ptep helper instead of typecasting.
  powerpc/book3s64/mm: mmu_vmemmap_psize is used by radix
  powerpc/book3s64/mm: Fix DirectMap stats in /proc/meminfo
  powerpc/book3s64/mm: Use PAGE_KERNEL instead of opencoding
  powerpc/mm/dax: Fix the condition when checking if altmap vmemap can
    cross-boundary
  mm/hugepage pud: Allow arch-specific helper function to check huge
    page pud support
  mm: Change pudp_huge_get_and_clear_full take vm_area_struct as arg
  mm/vmemmap: Improve vmemmap_can_optimize and allow architectures to
    override
  mm/vmemmap: Allow architectures to override how vmemmap optimization
    works
  mm: Add __HAVE_ARCH_PUD_SAME similar to __HAVE_ARCH_P4D_SAME
  mm/huge pud: Use transparent huge pud helpers only with
    CONFIG_TRANSPARENT_HUGEPAGE
  mm/vmemmap optimization: Split hugetlb and devdax vmemmap optimization
  powerpc/book3s64/mm: Enable transparent pud hugepage
  powerpc/book3s64/vmemmap: Switch radix to use a different vmemmap
    handling function
  powerpc/book3s64/radix: Add support for vmemmap optimization for radix
  powerpc/book3s64/radix: Remove mmu_vmemmap_psize

 Documentation/mm/vmemmap_dedup.rst            |   1 +
 Documentation/powerpc/vmemmap_dedup.rst       | 101 ++++
 arch/loongarch/Kconfig                        |   2 +-
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 156 ++++-
 arch/powerpc/include/asm/book3s/64/radix.h    |  47 ++
 .../include/asm/book3s/64/tlbflush-radix.h    |   2 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   8 +
 arch/powerpc/include/asm/pgtable.h            |   3 +
 arch/powerpc/mm/book3s64/pgtable.c            |  78 +++
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 551 ++++++++++++++++--
 arch/powerpc/mm/book3s64/radix_tlb.c          |   7 +
 arch/powerpc/mm/init_64.c                     |  39 +-
 arch/powerpc/platforms/Kconfig.cputype        |   1 +
 arch/riscv/Kconfig                            |   2 +-
 arch/x86/Kconfig                              |   3 +-
 drivers/nvdimm/pfn_devs.c                     |   2 +-
 fs/Kconfig                                    |   2 +-
 include/linux/mm.h                            |  32 +-
 include/linux/pgtable.h                       |  11 +-
 include/trace/events/thp.h                    |  17 +
 mm/Kconfig                                    |   5 +-
 mm/debug_vm_pgtable.c                         |   2 +-
 mm/huge_memory.c                              |   2 +-
 mm/mm_init.c                                  |   2 +-
 mm/mremap.c                                   |   2 +-
 mm/sparse-vmemmap.c                           |   3 +
 27 files changed, 1005 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/powerpc/vmemmap_dedup.rst

-- 
2.40.1

