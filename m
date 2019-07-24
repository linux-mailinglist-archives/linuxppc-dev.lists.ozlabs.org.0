Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7742273022
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 15:45:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45txRq123vzDqM6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 23:45:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45txNp12LkzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 23:42:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45txNn1zS9z9s3l;
 Wed, 24 Jul 2019 23:42:33 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.3-2 tag
Date: Wed, 24 Jul 2019 23:42:31 +1000
Message-ID: <87o91j5z20.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: aarcange@redhat.com, ego@linux.vnet.ibm.com, mikey@neuling.org,
 shawn@anastas.io, linux-kernel@vger.kernel.org, clg@kaod.org,
 sjitindarsingh@gmail.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Linus,

Please pull some powerpc fixes for 5.3:

The following changes since commit 192f0f8e9db7efe4ac98d47f5fa4334e43c1204d:

  Merge tag 'powerpc-5.3-1' of git://git.kernel.org/pub/scm/linux/kernel/gi=
t/powerpc/linux (2019-07-13 16:08:36 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.3-2

for you to fetch changes up to 3a855b7ac7d5021674aa3e1cc9d3bfd6b604e9c0:

  powerpc/papr_scm: Force a scm-unbind if initial scm-bind fails (2019-07-2=
2 23:31:00 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.3 #2

An assortment of non-regression fixes that have accumulated since the start=
 of
the merge window.

A fix for a user triggerable oops on machines where transactional memory is
disabled, eg. Power9 bare metal, Power8 with TM disabled on the command lin=
e, or
all Power7 or earlier machines.

Three fixes for handling of PMU and power saving registers when running nes=
ted
KVM on Power9.

Two fixes for bugs found while stress testing the XIVE interrupt controller
code, also on Power9.

A fix to allow guests to boot under Qemu/KVM on Power9 using the the Hash M=
MU
with >=3D 1TB of memory.

Two fixes for bugs in the recent DMA cleanup, one of which could lead to
checkstops.

And finally three fixes for the PAPR SCM nvdimm driver.

Thanks to:
  Alexey Kardashevskiy, Andrea Arcangeli, C=C3=A9dric Le Goater, Christoph =
Hellwig,
  David Gibson, Gautham R. Shenoy, Michael Neuling, Oliver O'Halloran,, Sat=
heesh
  Rajendran, Shawn Anastasio, Suraj Jitindar Singh, Vaibhav Jain.

- ------------------------------------------------------------------
Andrea Arcangeli (1):
      powerpc: fix off by one in max_zone_pfn initialization for ZONE_DMA

C=C3=A9dric Le Goater (1):
      KVM: PPC: Book3S HV: XIVE: fix rollback when kvmppc_xive_create fails

Gautham R. Shenoy (1):
      powerpc/xive: Fix loop exit-condition in xive_find_target_in_mask()

Michael Neuling (1):
      powerpc/tm: Fix oops on sigreturn on systems without TM

Shawn Anastasio (1):
      powerpc/dma: Fix invalid DMA mmap behavior

Suraj Jitindar Singh (4):
      powerpc/mm: Limit rma_size to 1TB when running without HV mode
      KVM: PPC: Book3S HV: Always save guest pmu for guest capable of nesti=
ng
      powerpc/pmu: Set pmcregs_in_use in paca when running as LPAR
      KVM: PPC: Book3S HV: Save and restore guest visible PSSCR bits on pse=
ries

Vaibhav Jain (3):
      powerpc/pseries: Update SCM hcall op-codes in hvcall.h
      powerpc/papr_scm: Update drc_pmem_unbind() to use H_SCM_UNBIND_ALL
      powerpc/papr_scm: Force a scm-unbind if initial scm-bind fails


 arch/powerpc/Kconfig                      |  1 +
 arch/powerpc/include/asm/hvcall.h         | 11 +++++---
 arch/powerpc/include/asm/pmc.h            |  5 ++--
 arch/powerpc/kernel/Makefile              |  3 ++-
 arch/powerpc/kernel/dma-common.c          | 17 ++++++++++++
 arch/powerpc/kernel/signal_32.c           |  3 +++
 arch/powerpc/kernel/signal_64.c           |  5 ++++
 arch/powerpc/kvm/book3s_hv.c              | 13 +++++++++
 arch/powerpc/kvm/book3s_xive.c            |  4 +--
 arch/powerpc/kvm/book3s_xive_native.c     |  4 +--
 arch/powerpc/mm/book3s64/hash_utils.c     |  9 +++++++
 arch/powerpc/mm/mem.c                     |  2 +-
 arch/powerpc/platforms/pseries/papr_scm.c | 44 +++++++++++++++++++++++++--=
----
 arch/powerpc/sysdev/xive/common.c         |  7 +++--
 14 files changed, 103 insertions(+), 25 deletions(-)
 create mode 100644 arch/powerpc/kernel/dma-common.c
-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJdOF+PAAoJEFHr6jzI4aWAEQ4P/iw1q7wyO11sSAc+oNsdCFDh
tT7fPzQruFlulyDr67BqXrUPJ5OoDN7k2eiwa5/Gbte9YgyYQkgw8UspoRTPUNTt
1tjoeEC7KtdWByYdZ9yrhqhzN0OVhc8FSwFvqdprzdfsCyWx0Fuh9uhXShteqpiV
nU8qG7WmS4KmY/+FWuOzH3s75w80UscezZ5WU3SGNoTrZYItlmNrtwFcyU3k5KcE
XWwktFBQP1dQQ81gZTX6L6E2rKHPQ0jphbmLrNhk2qTwv7Z7uq7BDT6b83nS7/sK
DtUTNVD7Cp1HUtRUlla3GhFIW3WP4t8OtZaDLMYL2v1a/B04kSb0iMYQIeLv6Ti0
UvACpGss2s6JLMyGrJrxnzjQcHIk4jYeM/sa+viJ+XYu3rC8Li533MOkNzpyaZ4d
ueAiORVlH02yz6fezhJhXCCN2L7cS7ifufpPpnBWX+hkp7zthxG+1wVhuHnZ53MD
Muz8avaNBF0K3/1/dGDeX3WBKpQoEQP96yyfP+MtmRJsEfIEr/cJdOixetBhwZkU
9DvBGFibUFF4l2aAbv1fGkKak54iOrXzJiBbjvOXmErwYaHnBIKARLHvlgOlykrg
789enXFL3wH2wRtrLwQGC8jh6RyQio6vzbOxlJ011SmtueD/lbnMD67C+TdoYjGc
08eecoUyDMeoW62I9yhH
=3Dtkyv
-----END PGP SIGNATURE-----
