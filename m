Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F191D26FC68
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 14:23:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtCgG2nTrzDqcV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 22:23:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtCbk0GLMzDqC5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 22:20:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EQfLz7aP; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BtCbj0rSDz9sTN;
 Fri, 18 Sep 2020 22:20:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1600431649;
 bh=yFZGkPkkRKTNYitF5ijMjnBBvIwsHCFQoy+CpzqTS6o=;
 h=From:To:Cc:Subject:Date:From;
 b=EQfLz7aP8ARy5Ea4CxebiT1bK+6DZOway8OaR52hVhRQTby4vdJFTxC60Ry/q/Onc
 JrE6M+Uj9phtR4+pMOdcio5B1s91aNVC/tLV8uGmwmMb1GrEbWVebIlBEtrWh3tdfy
 Z2hmgnvMRw4Pj4Z8GNistMoB2t0R+UigTiMK8G7h9O3eAtbkKxkA3Tu2O+C3XKa+uj
 LVYmm+kY1QNG/LkcZrIPJepBt/EacliNbrkyf5Yj6Zvkv1/EfKPMtrMW0Q4Sk24hTO
 0V7CfT/6/QU6qsCah/412vY5gFBG5Tyivfu/B2B0eqdQUwQ7o/Nr4P3XLFMpVO5MoN
 E7SFClEy89yzQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.9-5 tag
Date: Fri, 18 Sep 2020 22:20:48 +1000
Message-ID: <877dsr6ztr.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ego@linux.vnet.ibm.com, aik@ozlabs.ru, aneesh.kumar@linux.ibm.com,
 linux-kernel@vger.kernel.org, vaibhav@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.9:

The following changes since commit 4a133eb351ccc275683ad49305d0b04dde903733:

  powerpc/32s: Disable VMAP stack which CONFIG_ADB_PMU (2020-08-28 12:03:18 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.9-5

for you to fetch changes up to 0460534b532e5518c657c7d6492b9337d975eaa3:

  powerpc/papr_scm: Limit the readability of 'perf_stats' sysfs attribute (2020-09-09 14:44:38 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.9 #5

Opt us out of the DEBUG_VM_PGTABLE support for now as it's causing crashes.

Fix a long standing bug in our DMA mask handling that was hidden until recently,
and which caused problems with some drivers.

Fix a boot failure on systems with large amounts of RAM, and no hugepage support
and using Radix MMU, only seen in the lab.

A few other minor fixes.

Thanks to:
  Alexey Kardashevskiy, Aneesh Kumar K.V, Gautham R. Shenoy, Hari Bathini, Ira
  Weiny, Nick Desaulniers, Shirisha Ganta, Vaibhav Jain, Vaidyanathan
  Srinivasan.

- ------------------------------------------------------------------
Alexey Kardashevskiy (1):
      powerpc/dma: Fix dma_map_ops::get_required_mask

Aneesh Kumar K.V (2):
      powerpc/book3s64/radix: Fix boot failure with large amount of guest memory
      powerpc/mm: Remove DEBUG_VM_PGTABLE support on powerpc

Gautham R. Shenoy (1):
      cpuidle: pseries: Fix CEDE latency conversion from tb to us

Michael Ellerman (2):
      selftests/powerpc: Skip PROT_SAO test in guests/LPARS
      Revert "powerpc/build: vdso linker warning for orphan sections"

Vaibhav Jain (1):
      powerpc/papr_scm: Limit the readability of 'perf_stats' sysfs attribute


 Documentation/features/debug/debug-vm-pgtable/arch-support.txt |  2 +-
 arch/powerpc/Kconfig                                           |  1 -
 arch/powerpc/include/asm/book3s/64/mmu.h                       | 10 +++++-----
 arch/powerpc/kernel/dma-iommu.c                                |  3 ++-
 arch/powerpc/kernel/vdso32/Makefile                            |  2 +-
 arch/powerpc/kernel/vdso32/vdso32.lds.S                        |  1 -
 arch/powerpc/kernel/vdso64/Makefile                            |  2 +-
 arch/powerpc/kernel/vdso64/vdso64.lds.S                        |  3 +--
 arch/powerpc/mm/book3s64/radix_pgtable.c                       | 15 ---------------
 arch/powerpc/mm/init_64.c                                      | 11 +++++++++--
 arch/powerpc/platforms/pseries/papr_scm.c                      |  2 +-
 drivers/cpuidle/cpuidle-pseries.c                              | 15 +++++++++++----
 tools/testing/selftests/powerpc/mm/prot_sao.c                  |  9 +++++++--
 13 files changed, 39 insertions(+), 37 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl9kpeIACgkQUevqPMjh
pYC4aQ/9HwhZgP4aLepJ51l+SajCw7GkDco50MorgjJQLgP2t2Yua/bE2VdB4V4E
PFKq0ZFXytFRT6/njIFZVDsvrL5RbEyN5vHq7hwrmR3B+VJybQOzdyxncZUBlP7n
RZAQS/MvMAu+OR2NFG0QLo9zx4FA9QKMEVYbr20Eftw4l613hP6yV+ubxYR/ww/S
JvZw7JlyBRQfvpH8rb2x2sa1CLtPWGrZyUKWOQx8CTdIClgO7oghMGKAz5PyL+li
AyaIT5e9QKJw5qNUI7Mv56oat+dBHz0xRKSEhrYhjU9LfJ7HBCK23C7l3Wzw5OQO
94t3aAaCIa67uPk2TMdblM8aUN75hKxmRHg5GIBfTyhQKlWptb7A4M6BVd9sDm+d
ggoF+LOZfypoM/xgFPAvVtdyacmRHfhZ+OHILPsTL3IKZRK2Lmr6CgJgY12Dzelk
HudpQW58Egq/ZxwHH66UN6JzteYq7H6oKW7qmiJFftWm00Z78uSFlwFv9dX6aj1W
CGVcANquLY5x6WjrYr2HZa5dfU3rnSRNMrTrXz9S6+ctboGl63pkIfWS1dQ4nB/7
9SmPVivCK/gb1Sdv9LogGYTAgPgBUbC5lYzg1NlR3hOXyWre5P+do68RZFzujCtS
EO4Phx+h+duzLXth35dQQ3tkhn2u3S7tuuXq0s4KT8ZD2TRWc8I=
=UdKu
-----END PGP SIGNATURE-----
