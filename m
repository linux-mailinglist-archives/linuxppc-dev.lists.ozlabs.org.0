Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DD98A748A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 21:20:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=4+Btd8dy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJv5C1fSvz3vbB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 05:20:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=4+Btd8dy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=motorola.com (client-ip=148.163.152.46; helo=mx0b-00823401.pphosted.com; envelope-from=mbland@motorola.com; receiver=lists.ozlabs.org)
Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJv4V0K5lz3cp1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 05:19:51 +1000 (AEST)
Received: from pps.filterd (m0355090.ppops.net [127.0.0.1])
	by m0355090.ppops.net (8.17.1.24/8.17.1.24) with ESMTP id 43GJGh1x031887;
	Tue, 16 Apr 2024 19:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	message-id:to:cc:from:subject:date; s=DKIM202306; bh=nPCNGDgUTjF
	Uct67CoPadwCT/CFTexpW/OoeIwZTdjg=; b=4+Btd8dy1CjItEc9rwZIbiDJX0O
	IryHFnpJrw5oe4DQPENGAs7ttmfQJzDZwnXLDSnXwY7wftIvMkeFgbRc5OAVnmZ2
	ix5LoQH/x4NIA2VyWXGzNdxZmgF9SSKEhtfsc2FcxkawKWoSNHnP+5OrnxNUzCBb
	Y5TUGLzunEELVHJ0QqX4ck5OnO+Ac2BZvGjgXY5cNRqbEndmoKVo4lV1x4xpnlDc
	+H3k6Z8rVz3mO2lU2p9oKAVrPTbHlMFK7GNnKNGrUemibsB2vO94HCm2IYpA5bVj
	maFQTyviLAD7CoUYzPzWJNJysHcnZv14m/bxl7CsUucHEQ6PZMZNbvA0aaA==
Received: from ilclpfpp01.lenovo.com ([144.188.128.67])
	by m0355090.ppops.net (PPS) with ESMTPS id 3xhrya9mbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 19:19:22 +0000 (GMT)
Received: from va32lmmrp02.lenovo.com (va32lmmrp02.mot.com [10.62.176.191])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ilclpfpp01.lenovo.com (Postfix) with ESMTPS id 4VJv3t16vZzfBZq;
	Tue, 16 Apr 2024 19:19:22 +0000 (UTC)
Received: from ilclbld243.mot.com (ilclbld243.mot.com [100.64.22.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by va32lmmrp02.lenovo.com (Postfix) with ESMTPSA id 4VJv3s72K5z2Sl9H;
	Tue, 16 Apr 2024 19:19:21 +0000 (UTC)
Message-Id: <20240416122254.868007168-1-mbland@motorola.com>
To: linux-mm@kvack.org
From: Maxwell Bland <mbland@motorola.com>
Subject: [PATCH 0/5 RESEND] mm: code and data partitioning improvements
Date: Tue, 16 Apr 2024 14:18:14 -0500
X-Proofpoint-ORIG-GUID: -WDqzSxHhbjwHU89TvM11yY6SxcxElaL
X-Proofpoint-GUID: -WDqzSxHhbjwHU89TvM11yY6SxcxElaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_17,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160122
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maxwell Bland <mbland@motorola.com>, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

Zero-eth, apologies for the triple mail of these patches. I am in the process
of setting up a new SMTP/mail server for Motorola, but until then I've needed
to script the raw SMTP in order to send appropriately formatted patch emails.

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

