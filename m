Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AF4C10CA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 14:16:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46gSLv5QhgzDr1V
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 22:16:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46gSJV0XTVzDqyn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 22:14:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="kJZb5wZ/"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46gSJT0YY7z9sNf;
 Sat, 28 Sep 2019 22:14:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1569672857;
 bh=PDWq9hH3YyXXTpq0KMTZ1nCLI7LcPLMFtlg8UcURUrs=;
 h=From:To:Cc:Subject:Date:From;
 b=kJZb5wZ/f3p0EjPUFmga2ShvnC2dFqPfIdU2wOPijcQsrwUw0ZG/OO+Wd4uVECGnF
 bIVyINu/glpNmW47ubYSohvC14DI5HTpyvnd3IhJPVJn3rlK37dPp/+rWyb3VaHIFx
 N4/fLB+1AZ9dWCCpYa6FzLR0LNw+Lw9XpV8bfeQ01JX5JpgtKftYUNf6NZ9nGUgFcc
 VUj0eRYuuRiRJ1zvKJ7JcrFIEmEoP/jfXLel/oICir4CP+PwBcXc7p2GE3ArvpuRea
 WrRjhIa51fxNJZafTNMg8Mr/n4xnKkuaDvkYbfrGYyV3dJ3YcQ2ZqTKCjxgDYzngh4
 LHXSpZCYdCEYg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.4-2 tag
Date: Sat, 28 Sep 2019 22:14:15 +1000
Message-ID: <877e5sr52g.fsf@mpe.ellerman.id.au>
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
Cc: gromero@linux.ibm.com, alistair@popple.id.au, linux-kernel@vger.kernel.org,
 mdroth@linux.vnet.ibm.com, oohall@gmail.com, aneesh.kumar@linux.ibm.com,
 jniethe5@gmail.com, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc updates for 5.4:

The following changes since commit 45824fc0da6e46cc5d563105e1eaaf3098a686f9:

  Merge tag 'powerpc-5.4-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux (2019-09-20 11:48:06 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.4-2

for you to fetch changes up to 253c892193ab58da6b1d94371285971b22c63260:

  powerpc/eeh: Fix eeh eeh_debugfs_break_device() with SRIOV devices (2019-09-27 09:04:17 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.4 #2

An assortment of fixes that were either missed by me, or didn't arrive quite in
time for the first v5.4 pull.

Most notable is a fix for an issue with tlbie (broadcast TLB invalidation) on
Power9, when using the Radix MMU. The tlbie can race with an mtpid (move to PID
register, essentially MMU context switch) on another thread of the core, which
can cause stores to continue to go to a page after it's unmapped.

A fix in our KVM code to add a missing barrier, the lack of which has been
observed to cause missed IPIs and subsequently stuck CPUs in the host.

A change to the way we initialise PCR (Processor Compatibility Register) to make
it forward compatible with future CPUs.

On some older PowerVM systems our H_BLOCK_REMOVE support could oops, fix it to
detect such systems and fallback to the old invalidation method.

A fix for an oops seen on some machines when using KASAN on 32-bit.

A handful of other minor fixes, and two new selftests.

Thanks to:
  Alistair Popple, Aneesh Kumar K.V, Christophe Leroy, Gustavo Romero, Joel
  Stanley, Jordan Niethe, Laurent Dufour, Michael Roth, Oliver O'Halloran.

- ------------------------------------------------------------------
Alistair Popple (1):
      powerpc: Fix definition of PCR bits to work with old binutils

Aneesh Kumar K.V (7):
      powerpc/book3s64/radix: Remove WARN_ON in destroy_context()
      powerpc/book3s64/mm: Don't do tlbie fixup for some hardware revisions
      powerpc/book3s64/radix: Rename CPU_FTR_P9_TLBIE_BUG feature flag
      powerpc/mm: Fixup tlbie vs mtpidr/mtlpidr ordering issue on POWER9
      selftests/powerpc: Add test case for tlbie vs mtpidr ordering issue
      powerpc/nvdimm: Use HCALL error as the return value
      powerpc/nvdimm: use H_SCM_QUERY hcall on H_OVERLAP error

Christophe Leroy (2):
      powerpc/mm: Add a helper to select PAGE_KERNEL_RO or PAGE_READONLY
      powerpc/mm: Fix an Oops in kasan_mmu_init()

Gustavo Romero (1):
      powerpc/tm: Add tm-poison test

Jordan Niethe (1):
      powerpc/64s: Set reserved PCR bits

Laurent Dufour (2):
      powerpc/pseries: Read TLB Block Invalidate Characteristics
      powerpc/pseries: Call H_BLOCK_REMOVE when supported

Michael Roth (1):
      KVM: PPC: Book3S HV: use smp_mb() when setting/clearing host_ipi flag

Oliver O'Halloran (1):
      powerpc/eeh: Fix eeh eeh_debugfs_break_device() with SRIOV devices


 arch/powerpc/include/asm/cputable.h             |   5 +-
 arch/powerpc/include/asm/kvm_ppc.h              | 100 ++-
 arch/powerpc/include/asm/reg.h                  |   9 +-
 arch/powerpc/kernel/cpu_setup_power.S           |   6 +
 arch/powerpc/kernel/dbell.c                     |   6 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c               |  35 +-
 arch/powerpc/kernel/eeh.c                       |   4 +-
 arch/powerpc/kvm/book3s_hv.c                    |  11 +-
 arch/powerpc/kvm/book3s_hv_nested.c             |   6 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c             |  42 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c            |   2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S         |  10 +-
 arch/powerpc/mm/book3s64/hash_native.c          |  31 +-
 arch/powerpc/mm/book3s64/mmu_context.c          |  15 +-
 arch/powerpc/mm/book3s64/radix_tlb.c            |  84 ++-
 arch/powerpc/mm/kasan/kasan_init_32.c           |  34 +-
 arch/powerpc/platforms/powernv/smp.c            |   2 +-
 arch/powerpc/platforms/pseries/lpar.c           | 163 ++++-
 arch/powerpc/platforms/pseries/papr_scm.c       |  72 +-
 arch/powerpc/platforms/pseries/pseries.h        |   1 +
 arch/powerpc/platforms/pseries/setup.c          |   1 +
 arch/powerpc/sysdev/xics/icp-native.c           |   6 +-
 arch/powerpc/sysdev/xics/icp-opal.c             |   6 +-
 tools/testing/selftests/powerpc/mm/Makefile     |   2 +
 tools/testing/selftests/powerpc/mm/tlbie_test.c | 734 ++++++++++++++++++++
 tools/testing/selftests/powerpc/tm/.gitignore   |   1 +
 tools/testing/selftests/powerpc/tm/Makefile     |   2 +-
 tools/testing/selftests/powerpc/tm/tm-poison.c  | 179 +++++
 28 files changed, 1476 insertions(+), 93 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/mm/tlbie_test.c
 create mode 100644 tools/testing/selftests/powerpc/tm/tm-poison.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl2PTlsACgkQUevqPMjh
pYAFmw//XZUKzoMT+p2U1o/4sJ+bgR4tulFKZVykGAgcp99gtqbUINKItvDyz/yS
FOudE1m+deEmf2lWlO+Z6Wd0Q8gEH2+3+mFm6WsBlPPj9KGzuLw+pabNgljW+Oz/
C41WufCeyuEd8TbhYIz4wRUrPn+LNFdppPqNgkYNwhhjks2SIO5oGypd5S/NmtRS
L0/F7Q9WL62NHUzgDXEa0AXF0h94hilOyHIfT5Ic+tfydoUHbj3CYP7d4Rk3ISrF
TZ9PONfyROFbPew50mI1PuktQurYSnk3B1Y3Voc33wJqqDPiIa6rqduKHTAo97rh
yMjyYSpZVN9q22/NGg3enXLSbLJGxWTGGBkcnrugA/7+D7TWaonfmmEJqFQBmKvN
t0+06DCpu+0L93/sPUtF8vIHQYuRJZNO9cDFb85Zpy1OjOYMhnKFJvIvv8Oa93yx
6Zn39Qf+SAdzdkzUah/kVK6ZEzOWGELrtqcQcUAFwNScs8OGVi9iQXsdhUib/HmA
WSy+ZVem1HvUVAvZBNv7RjGFDFAmL2uJlzHZjEQ/q1FjHZFA8H8n2kcAwGnj1jYq
sTwEhEnbjyC7sze0mGPuhNOMHcqjYisZlENlddfCde3/jP0CqQepqn9EfZFkTMLq
cy4+J3evuyvcMSLMYrIQsODZAhcXxCPxU03yNiO+4HQLyZXQ0Cg=
=+U4R
-----END PGP SIGNATURE-----
