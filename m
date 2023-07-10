Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9673874DAC2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 18:10:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ly1uqkRE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R089B4TVjz3c2t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 02:10:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ly1uqkRE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R088J02sZz3bX2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 02:09:19 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36AG0gke001389;
	Mon, 10 Jul 2023 16:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=avsSqBmtIw8X7zth4yLOaE23VJsCf2jWt5uEhh/d5ko=;
 b=ly1uqkRERRDpgHriegstan308Se3mtKg2zx7xXLSR1XswO1A8o7m4U0OEmbBaI45JOqi
 Vb/FgAZ7YjqvbgDXQI8PMoNK3pKkm4PDXnkvYA57oIQcvOSXb0Wpyu0+PyvKLNC+lNu3
 e4ud4miwPZYj1dcQXuBHKh4A/U/I+dy2CufnWesYCVuHdWYHMK/TKBaQ1G6WDCw9DAhF
 nwhC9DyPdDRbDvQNV6Hfi92YDXDUn+GYFMCU3+tj5XuGo+DcuuvsV18NNsyKOKJw32tu
 2in/JpO9t2vsv0AAldvstPMqmzh7+tkRT2Zhr+w1dDgeBM5FTm5m7IbR1dqb3IxWkSI/ TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrn0d0dw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 16:08:54 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36AFt78I011262;
	Mon, 10 Jul 2023 16:08:54 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrn0d0dvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 16:08:54 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36AG0ZUW014443;
	Mon, 10 Jul 2023 16:08:52 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3rpye5jnd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 16:08:52 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36AG8pfS19530400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Jul 2023 16:08:51 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A76D45803F;
	Mon, 10 Jul 2023 16:08:51 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E820058061;
	Mon, 10 Jul 2023 16:08:45 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.9.86])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Jul 2023 16:08:45 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v4 00/13] Add support for DAX vmemmap optimization for ppc64
Date: Mon, 10 Jul 2023 21:38:29 +0530
Message-ID: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UHBRW4tIa1hm0FO60lQ40rtn1vUpwO01
X-Proofpoint-ORIG-GUID: nUp1vSJKqpJQ5VYdhjvmaC0gyjMIyfLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 mlxscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307100145
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
 Documentation/powerpc/vmemmap_dedup.rst       | 101 +++
 arch/loongarch/Kconfig                        |   2 +-
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/include/asm/book3s/64/hash.h     |   9 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 155 ++++-
 arch/powerpc/include/asm/book3s/64/radix.h    |  47 ++
 .../include/asm/book3s/64/tlbflush-radix.h    |   2 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   8 +
 arch/powerpc/include/asm/pgtable.h            |   4 +
 arch/powerpc/mm/book3s64/hash_pgtable.c       |   2 +-
 arch/powerpc/mm/book3s64/pgtable.c            |  78 +++
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 573 ++++++++++++++++--
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
 31 files changed, 1047 insertions(+), 82 deletions(-)
 create mode 100644 Documentation/powerpc/vmemmap_dedup.rst

-- 
2.41.0

