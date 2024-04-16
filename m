Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E797C8A7884
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 01:18:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=4lUpLmqj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VK0NC4sFrz3vdy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 09:18:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=4lUpLmqj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=motorola.com (client-ip=148.163.148.104; helo=mx0a-00823401.pphosted.com; envelope-from=mbland@motorola.com; receiver=lists.ozlabs.org)
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJy711wN1z3dTB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 07:37:16 +1000 (AEST)
Received: from pps.filterd (m0355087.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43GFWDc3006788;
	Tue, 16 Apr 2024 17:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	message-id:to:cc:date:from; s=DKIM202306; bh=AyTrvsZSwARaCj1O2qp
	psG4We3imhy0SwsYp/9clrq8=; b=4lUpLmqjZ4I19okvrxEElAOHjR0hfs04OL9
	AYoIe1JDM2vco9iDZdtrv4scMYjUZv0JhQOJ1+S0A0kfPEAjQcFr6GzED1t5HQpu
	mInbsl5eq07qL967wg82eqlMO+sDvkfEM/hh7McVN6H1zIPhNFnPS8Ev14mSx++J
	UJr+lLrplxEUw/4+qLZgs/KwF8tZN6NHMGCVKDePilCvh3g2tohKgyJEPG1MeE+L
	qNS8SArKyM5tjBWUI+TJSuaB+EKdtpoc6mLQdaKtOOFg4ix8HKdjaVk2gfEtOKXd
	kFp7jweo3ZBhjUya/Wa5mIFz232N00HCClshX5Ixlq+/KUdpavA==
Received: from va32lpfpp04.lenovo.com ([104.232.228.24])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 3xhfb73qgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 17:12:42 +0000 (GMT)
Received: from va32lmmrp01.lenovo.com (va32lmmrp01.mot.com [10.62.177.113])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by va32lpfpp04.lenovo.com (Postfix) with ESMTPS id 4VJrFj0bcvzbbbK;
	Tue, 16 Apr 2024 17:12:41 +0000 (UTC)
Received: from ilclbld243.mot.com (ilclbld243.mot.com [100.64.22.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by va32lmmrp01.lenovo.com (Postfix) with ESMTPSA id 4VJrFj0Nx6z2VZRf;
	Tue, 16 Apr 2024 17:12:41 +0000 (UTC)
Message-Id: <20240416120827.062020959-1-mbland@motorola.com>
To: linux-mm@kvack.org
Date: Tue, 16 Apr 2024 17:12:41 +0000 (UTC)
From: mbland@motorola.com
X-Proofpoint-GUID: 1a7hlKm2ucUem2p-jPjlpOxqjrnRUvhn
X-Proofpoint-ORIG-GUID: 1a7hlKm2ucUem2p-jPjlpOxqjrnRUvhn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_14,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404160107
X-Mailman-Approved-At: Wed, 17 Apr 2024 09:15:59 +1000
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
Cc: Maxwell Bland <mbland@motorola.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

linux-kernel@vger.kernel.org,
linux-arm-kernel@lists.infradead.org,
linux-riscv@lists.infradead.org,
linuxppc-dev@lists.ozlabs.org,
Mark Rutland <mark.rutland@arm.com>,
Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
Christoph Hellwig <hch@infradead.org>,
Christophe Leroy <christophe.leroy@csgroup.eu>,
David Hildenbrand <david@redhat.com>,
Conor Dooley <conor.dooley@microchip.com>
From: Maxwell Bland <mbland@motorola.com>
Date: Mon, 15 Apr 2024 15:16:08 -0500
Subject: [PATCH 0/5] mm: code and data partitioning improvements

Managing allocations to ensure code and data pages are not interleaved
is not possible prior to this patch, as ASLR requires programming a
dynamic _text offset while the vmalloc infrastructure maintains static
VMALLOC_START and VMALLOC_END constants.

In systems where code and data are interleaved at a PTE granularity,
kernel improvements targeting the prevention of exploit stages which
modify page tables are inefficient and less effective as individual PTE
updates occur at high frequency and cannot be coarsely grouped at the
PMD level or greater.

This patch adds minimal arch-specific callbacks to the initialization of
vmalloc and when deciding whether to use a specific virtual memory area
to satisfy a vmalloc request to provide the capability to prevent the
allocation of specific virtual addresses under specific system states.
By default these hooks are unimplemented.

To further support the practical use of these callbacks, this patch also
adds a virtual address parameter to pmd_populate_kernel, so that this
interface matches the equivalent pte-level interface and architectures
are not required to perform a reverse page table lookup to determine the
vaddr being allocated during pmd creation.

To demonstrate the impact and value of these changes, this patch
implements support for dynamic PXNTable under aarch64 in 71 lines of
code (a single "if" check during memory allocation), by checking the
virtual address of a given vmalloc call to determine whether it is code
or data. From experience in trying to implement kernel page table
immutability and protections in KVM to prevent recent CVEs, e.g.
CVE-2024-1086, this is a necessary first step.

To better help maintainers and future developers, this patch expands
ptdump.c so that non-leaf page table descriptors can be more easily
noted in debug output by setting a note_non_leaf bool in the ptdump
state.

Signed-off-by: Maxwell Bland <mbland@motorola.com>

---

First, thank you to a number of maintainers (Mark Rutland, Greg KH,
Christoph Hellwig, Christophe Leroy, David Hildenbrand, Conor Dooley)
for their feedback on

<20240220203256.31153-1-mbland@motorola.com>
and
<CAP5Mv+ydhk=Ob4b40ZahGMgT-5+-VEHxtmA=-LkJiEOOU+K6hw@mail.gmail.com>

This patch is a further refinement and overhaul of these prior two
attempts. Also, apologies for the roughly two months delay between patch
submissions! I had Motorola work to do.

In support of testing this patch (but not included in this patch), I set
note_non_leaf to true under arch/arm64/mm/ptdump.c and added
PMD_TABLE_PXN to pte_bits to print out whether the PXNTable bit was set.
The txt files under the following directory can be diff'ed to see the
result:

github.com/maxwell-bland/linux-patch-data/tree/main/code_data_parting/ptdump

I also created a script to fetch and cross-compile the kernel for each
of the 21 subarchitectures which required fixes to provide a virtual
address to pmd_populate_kernel. I have no idea if it is useful and maybe
one already exists, but it worked well for me over some alternatives
(xcross, buildroot):

github.com/maxwell-bland/x-linux

As with the last patchset, I also measured performance using Torvald's 
test-tlb program on an aarch64 QEMU instance, with results here:

github.com/maxwell-bland/linux-patch-data/tree/main/code_data_parting/tlbperf

As all changes to other arches are effectively no-ops, performance
impacts in those domains are negligible. 

Maxwell Bland (5):
  mm: allow arch refinement/skip for vmap alloc
  arm64: mm: code and data partitioning for aslr
  mm: add vaddr param to pmd_populate_kernel
  arm64: dynamic enforcement of PXNTable
  ptdump: add state parameter for non-leaf callback

 arch/alpha/include/asm/pgalloc.h             |  5 +-
 arch/arc/include/asm/pgalloc.h               |  3 +-
 arch/arc/mm/highmem.c                        |  2 +-
 arch/arm/include/asm/kfence.h                |  2 +-
 arch/arm/include/asm/pgalloc.h               |  3 +-
 arch/arm/mm/kasan_init.c                     |  2 +-
 arch/arm/mm/mmu.c                            |  2 +-
 arch/arm64/include/asm/module.h              | 12 ++++
 arch/arm64/include/asm/pgalloc.h             | 15 ++++-
 arch/arm64/include/asm/vmalloc.h             | 17 ++++-
 arch/arm64/kernel/Makefile                   |  2 +-
 arch/arm64/kernel/module.c                   |  7 +-
 arch/arm64/kernel/probes/kprobes.c           |  7 +-
 arch/arm64/kernel/setup.c                    |  4 ++
 arch/arm64/kernel/vmalloc.c                  | 71 ++++++++++++++++++++
 arch/arm64/mm/ptdump.c                       | 10 +--
 arch/arm64/mm/trans_pgd.c                    |  2 +-
 arch/arm64/net/bpf_jit_comp.c                |  8 ++-
 arch/csky/include/asm/pgalloc.h              |  2 +-
 arch/hexagon/include/asm/pgalloc.h           |  2 +-
 arch/loongarch/include/asm/pgalloc.h         |  3 +-
 arch/loongarch/mm/init.c                     |  2 +-
 arch/loongarch/mm/kasan_init.c               |  2 +-
 arch/m68k/include/asm/mcf_pgalloc.h          |  2 +-
 arch/m68k/include/asm/motorola_pgalloc.h     |  3 +-
 arch/m68k/include/asm/sun3_pgalloc.h         |  3 +-
 arch/microblaze/include/asm/pgalloc.h        |  2 +-
 arch/mips/include/asm/pgalloc.h              |  2 +-
 arch/mips/kvm/mmu.c                          |  2 +-
 arch/nios2/include/asm/pgalloc.h             |  2 +-
 arch/openrisc/include/asm/pgalloc.h          |  2 +-
 arch/parisc/include/asm/pgalloc.h            |  5 +-
 arch/parisc/mm/init.c                        |  6 +-
 arch/powerpc/include/asm/book3s/32/pgalloc.h |  2 +-
 arch/powerpc/include/asm/book3s/64/pgalloc.h |  2 +-
 arch/powerpc/include/asm/nohash/32/pgalloc.h |  2 +-
 arch/powerpc/include/asm/nohash/64/pgalloc.h |  2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  2 +-
 arch/powerpc/mm/kasan/init_32.c              |  4 +-
 arch/powerpc/mm/kasan/init_book3e_64.c       |  9 ++-
 arch/powerpc/mm/kasan/init_book3s_64.c       |  7 +-
 arch/powerpc/mm/nohash/book3e_pgtable.c      |  2 +-
 arch/powerpc/mm/pgtable_32.c                 |  4 +-
 arch/powerpc/mm/ptdump/ptdump.c              |  2 +
 arch/riscv/include/asm/pgalloc.h             |  2 +-
 arch/riscv/kernel/hibernate.c                |  2 +-
 arch/riscv/mm/ptdump.c                       |  6 +-
 arch/s390/include/asm/pgalloc.h              |  2 +-
 arch/s390/mm/dump_pagetables.c               |  6 +-
 arch/sh/include/asm/pgalloc.h                |  2 +-
 arch/sh/mm/init.c                            |  2 +-
 arch/sparc/include/asm/pgalloc_32.h          |  3 +-
 arch/sparc/include/asm/pgalloc_64.h          |  4 +-
 arch/sparc/mm/init_64.c                      |  8 +--
 arch/um/include/asm/pgalloc.h                |  4 +-
 arch/x86/include/asm/pgalloc.h               |  3 +-
 arch/x86/mm/dump_pagetables.c                |  3 +-
 arch/x86/mm/init_64.c                        | 14 +++-
 arch/x86/mm/ioremap.c                        |  2 +-
 arch/x86/mm/kasan_init_64.c                  |  2 +-
 arch/xtensa/include/asm/pgalloc.h            |  2 +-
 include/linux/mm.h                           |  4 +-
 include/linux/ptdump.h                       |  1 +
 include/linux/vmalloc.h                      | 24 +++++++
 mm/hugetlb_vmemmap.c                         |  4 +-
 mm/kasan/init.c                              | 14 ++--
 mm/memory.c                                  |  4 +-
 mm/percpu.c                                  |  2 +-
 mm/pgalloc-track.h                           |  3 +-
 mm/ptdump.c                                  | 13 ++++
 mm/sparse-vmemmap.c                          |  2 +-
 mm/vmalloc.c                                 | 16 +++--
 72 files changed, 299 insertions(+), 107 deletions(-)
 create mode 100644 arch/arm64/kernel/vmalloc.c


base-commit: 0bbac3facb5d6cc0171c45c9873a2dc96bea9680
-- 
2.39.2

