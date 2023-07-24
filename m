Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 570FF75FF9D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 21:10:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C0HoySyt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8qW61jj2z30fp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 05:10:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C0HoySyt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8qVB719Nz2ytq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 05:09:54 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36OHb9D1025456;
	Mon, 24 Jul 2023 19:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KUU7x4WkmO8tgXgdtsNmmaVdO7kIKRGwdAt0iZLt8c8=;
 b=C0HoySytrwHWJ7pbT/VgF9YYAUmIOfnEU7hSkcXdEtjqVT5oCrlclXG2zrpCopu7o3oG
 9KXWqh/+zPxUNQXcBiWymZF1WXxEzBPeZkFrzOMOWETKuvRkuyUN99BxQcWceL7nXuLY
 /JAECQTuMMLclfKRX3gfRxzqJhKcR5vK5w6h4AJinc9M3ZhgC6K8S45hiZt9jORDy0BL
 /D6xzC52ph6ZXC0jwo7R2aoqtfOyccb2nbaeDzRBtFh7kNB93l5ROrf8SBi0Cg7vL4Cu
 wWdjU0g8y6yZFF0Dmf6+szuSUBgxe3Fb/2y7a4vD0CdgybxS53tcDH+WFhpVP2b8IT0W XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1w6d375t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 19:09:32 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36OJ62Zk030699;
	Mon, 24 Jul 2023 19:09:31 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1w6d375f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 19:09:31 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36OIXBrs002181;
	Mon, 24 Jul 2023 19:09:30 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0unj5b4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 19:09:30 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36OJ9TYT61014346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jul 2023 19:09:30 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8CC258055;
	Mon, 24 Jul 2023 19:09:29 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0612B58063;
	Mon, 24 Jul 2023 19:08:19 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.177.66.22])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jul 2023 19:08:18 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v6 00/13] Add support for DAX vmemmap optimization for ppc64
Date: Tue, 25 Jul 2023 00:37:46 +0530
Message-ID: <20230724190759.483013-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1ElcPnMktnGRgV7I5960J9OyFtUHSQ2D
X-Proofpoint-GUID: OdDNWbqaNGjUMmhQKC_Z-s8QutFlfk5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_14,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307240168
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

Changes from v5:
* rebase to mm-unstable branch

Changes from v4:
* Address review feedback
* Add the Reviewed-by:

Changes from v3:
* Rebase to latest linus tree
* Build fix with SPARSEMEM_VMEMMP disabled
* Add hash_pud_same outisde THP Kconfig

Changes from v2:
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
  mm: Add pud_same similar to __HAVE_ARCH_P4D_SAME
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
 arch/powerpc/include/asm/book3s/64/hash.h     |   9 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 155 ++++-
 arch/powerpc/include/asm/book3s/64/radix.h    |  47 ++
 .../include/asm/book3s/64/tlbflush-radix.h    |   2 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   8 +
 arch/powerpc/include/asm/pgtable.h            |   6 +
 arch/powerpc/mm/book3s64/hash_pgtable.c       |   2 +-
 arch/powerpc/mm/book3s64/pgtable.c            |  78 +++
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 572 ++++++++++++++++--
 arch/powerpc/mm/book3s64/radix_tlb.c          |   7 +
 arch/powerpc/mm/init_64.c                     |  37 +-
 arch/powerpc/platforms/Kconfig.cputype        |   1 +
 arch/riscv/Kconfig                            |   2 +-
 arch/s390/Kconfig                             |   2 +-
 arch/x86/Kconfig                              |   3 +-
 drivers/nvdimm/pfn_devs.c                     |   2 +-
 fs/Kconfig                                    |   2 +-
 include/linux/mm.h                            |  29 +-
 include/linux/pgtable.h                       |  12 +-
 include/trace/events/thp.h                    |  33 +-
 mm/Kconfig                                    |   5 +-
 mm/debug_vm_pgtable.c                         |   2 +-
 mm/huge_memory.c                              |   2 +-
 mm/mm_init.c                                  |   2 +-
 mm/mremap.c                                   |   2 +-
 mm/sparse-vmemmap.c                           |   3 +
 31 files changed, 1049 insertions(+), 82 deletions(-)
 create mode 100644 Documentation/powerpc/vmemmap_dedup.rst

-- 
2.41.0

