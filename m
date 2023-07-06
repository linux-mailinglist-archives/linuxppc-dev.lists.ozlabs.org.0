Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 014717497D3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 10:59:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q2Ou1NSx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxVpV3xCpz3bv9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 18:59:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q2Ou1NSx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxVnf0Pl8z2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 18:59:01 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3668ldjG022190;
	Thu, 6 Jul 2023 08:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=jya01t68fc8JLK+hrfh2OjUWWhl2B94Pgkkk7lQjqRU=;
 b=Q2Ou1NSxAEzImOb7iRroYl3Hbt4XhI5yZlE74qcw7xaSP6hKpLD4dJ/APBRApEuoMCDr
 w+0DKYjBAD9x4lrYmuGsZGfEqoS19HHBfSDCNOSj9PSMxpCY2vYYsPiFIEOaMo78GLuT
 NtimeO7/+iDK4DDdEjf75g5Rm0J9ZrTQSHv17QIHl7vHInoVMubfIBzbcXw2P2oJLzvR
 IIE/dbkGngdlSuTV7te1qmvV97jl4+VXJ+bzAShm00mMOnHaQhlvsYB1AmoFafATguxb
 chqPm1jOs+P9WrHtkeUsSlZqlUKH6pH1QfTQkF5NaNLTWyLypBq7OaC1fQdc9lzbFmDJ gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rntdp07xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:58:35 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3668m3PY023133;
	Thu, 6 Jul 2023 08:58:35 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rntdp07x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:58:35 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3667mKRp023006;
	Thu, 6 Jul 2023 08:58:33 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3rjbs5qxyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:58:33 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3668wWn860752178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 08:58:32 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C85258057;
	Thu,  6 Jul 2023 08:58:32 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC37A58059;
	Thu,  6 Jul 2023 08:58:27 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jul 2023 08:58:27 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v3 00/13] Add support for DAX vmemmap optimization for ppc64
Date: Thu,  6 Jul 2023 14:28:06 +0530
Message-ID: <20230706085819.827761-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qfvssAY7Xw1KVvzBFpjpBuE94obUoMzL
X-Proofpoint-ORIG-GUID: zoFb5m6H7o8KiZtOzZUJycGVAYIuQAqJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_05,2023-07-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060075
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
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
devdax vmemmap optimization"

Changes from v1:
* Rebase to latest linus tree
* Address review feedback

Changes from V1:
* Fix make htmldocs warning
* Fix vmemmap allocation bugs with different alignment values.
* Correctly check for section validity to before we free vmemmap area


Aneesh Kumar K.V (13):
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
  powerpc/mm/trace: Convert trace event to trace event class
  powerpc/book3s64/mm: Enable transparent pud hugepage
  powerpc/book3s64/vmemmap: Switch radix to use a different vmemmap
    handling function
  powerpc/book3s64/radix: Add support for vmemmap optimization for radix
  powerpc/book3s64/radix: Remove mmu_vmemmap_psize
  powerpc/book3s64/radix: Add debug message to give more details of
    vmemmap allocation

 Documentation/mm/vmemmap_dedup.rst            |   1 +
 Documentation/powerpc/index.rst               |   1 +
 Documentation/powerpc/vmemmap_dedup.rst       | 101 ++++
 arch/loongarch/Kconfig                        |   2 +-
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 156 ++++-
 arch/powerpc/include/asm/book3s/64/radix.h    |  47 ++
 .../include/asm/book3s/64/tlbflush-radix.h    |   2 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   8 +
 arch/powerpc/include/asm/pgtable.h            |   4 +
 arch/powerpc/mm/book3s64/hash_pgtable.c       |   2 +-
 arch/powerpc/mm/book3s64/pgtable.c            |  78 +++
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 565 ++++++++++++++++--
 arch/powerpc/mm/book3s64/radix_tlb.c          |   7 +
 arch/powerpc/mm/init_64.c                     |  37 +-
 arch/powerpc/platforms/Kconfig.cputype        |   1 +
 arch/riscv/Kconfig                            |   2 +-
 arch/s390/Kconfig                             |   2 +-
 arch/x86/Kconfig                              |   3 +-
 drivers/nvdimm/pfn_devs.c                     |   2 +-
 fs/Kconfig                                    |   2 +-
 include/linux/mm.h                            |  29 +-
 include/linux/pgtable.h                       |  11 +-
 include/trace/events/thp.h                    |  33 +-
 mm/Kconfig                                    |   5 +-
 mm/debug_vm_pgtable.c                         |   2 +-
 mm/huge_memory.c                              |   2 +-
 mm/mm_init.c                                  |   2 +-
 mm/mremap.c                                   |   2 +-
 mm/sparse-vmemmap.c                           |   3 +
 30 files changed, 1031 insertions(+), 82 deletions(-)
 create mode 100644 Documentation/powerpc/vmemmap_dedup.rst

-- 
2.41.0

