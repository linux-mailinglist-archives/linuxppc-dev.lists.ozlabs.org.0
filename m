Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD0024ED45
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Aug 2020 14:52:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZFXR4Kx8zDqKK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Aug 2020 22:52:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZFTp2WnRzDqTv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Aug 2020 22:50:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UkL/Anna; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BZFTk3w5dz9sT6;
 Sun, 23 Aug 2020 22:50:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1598187020;
 bh=36vGer+nqIvAa91Rur3hVF1MUl6S4yF9te8MNA1RzSw=;
 h=From:To:Cc:Subject:Date:From;
 b=UkL/AnnaeDftOOKE/il5Usc8PnvhFiG1OiARnkcpLkuvD8CbSW/zf2yk4jQ4qWL+V
 UEGdQviTqFU54aazaGoscuAtlntVFJw9Kpz0tZsQfBi4C/nqRnme1LQzQ8xQRlj7X7
 jm+eM8r/UZfI6526/hrc60w4Rqp7CNcvoFtibvGaAWJ6v5QUVvCvtxZjSSFHSxOri/
 bGoRfJHbK0MoSbBPJkoiYAnhyJlo4DPCvwLgzxGV6unAkovtJfSX8cZGWJSUjshJro
 MZMqrrxResmo1r6cMkZglRrtsAO4ZST/3LFDtUi+DNWU7NW/JUasaAxQjpLYMkZP6F
 N4QBYbbbtqZbQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.9-3 tag
Date: Sun, 23 Aug 2020 22:50:13 +1000
Message-ID: <87v9h9h6gq.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, atrajeev@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 linux-kernel@vger.kernel.org, mdroth@linux.vnet.ibm.com,
 hegdevasant@linux.vnet.ibm.com, anju@linux.vnet.ibm.com, maddy@linux.ibm.com,
 kjain@linux.ibm.com, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.9.

There's one non-fix, which is the perf extended regs support. That was posted
way back but I waited for the tools/perf part to land, which it now has.

cheers


The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.9-3

for you to fetch changes up to 64ef8f2c4791940d7f3945507b6a45c20d959260:

  powerpc/perf/hv-24x7: Move cpumask file to top folder of hv-24x7 driver (2020-08-21 23:35:27 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.9 #3

Add perf support for emitting extended registers for power10.

A fix for CPU hotplug on pseries, where on large/loaded systems we may not wait
long enough for the CPU to be offlined, leading to crashes.

Addition of a raw cputable entry for Power10, which is not required to boot, but
is required to make our PMU setup work correctly in guests.

Three fixes for the recent changes on 32-bit Book3S to move modules into their
own segment for strict RWX.

A fix for a recent change in our powernv PCI code that could lead to crashes.

A change to our perf interrupt accounting to avoid soft lockups when using some
events, found by syzkaller.

A change in the way we handle power loss events from the hypervisor on pseries.
We no longer immediately shut down if we're told we're running on a UPS.

A few other minor fixes.

Thanks to:
  Alexey Kardashevskiy, Andreas Schwab, Aneesh Kumar K.V, Anju T Sudhakar,
  Athira Rajeev, Christophe Leroy, Frederic Barrat, Greg Kurz, Kajol Jain,
  Madhavan Srinivasan, Michael Neuling, Michael Roth, Nageswara R Sastry, Oliver
  O'Halloran, Thiago Jung Bauermann, Vaidyanathan Srinivasan, Vasant Hegde.

- ------------------------------------------------------------------
Aneesh Kumar K.V (1):
      powerpc/pkeys: Fix build error with PPC_MEM_KEYS disabled

Anju T Sudhakar (1):
      powerpc/perf: Add support for outputting extended regs in perf intr_regs

Athira Rajeev (2):
      powerpc/perf: Add extended regs support for power10 platform
      powerpc/perf: Fix soft lockups due to missed interrupt accounting

Christophe Leroy (4):
      powerpc/fixmap: Fix the size of the early debug area
      powerpc/kasan: Fix KASAN_SHADOW_START on BOOK3S_32
      powerpc/32s: Fix is_module_segment() when MODULES_VADDR is defined
      powerpc/32s: Fix module loading failure when VMALLOC_END is over 0xf0000000

Frederic Barrat (1):
      powerpc/powernv/pci: Fix possible crash when releasing DMA resources

Kajol Jain (1):
      powerpc/perf/hv-24x7: Move cpumask file to top folder of hv-24x7 driver

Madhavan Srinivasan (2):
      powerpc: Add POWER10 raw mode cputable entry
      powerpc/kernel: Cleanup machine check function declarations

Michael Neuling (1):
      powerpc: Fix P10 PVR revision in /proc/cpuinfo for SMT4 cores

Michael Roth (1):
      powerpc/pseries/hotplug-cpu: wait indefinitely for vCPU death

Vasant Hegde (1):
      powerpc/pseries: Do not initiate shutdown when system is running on UPS


 Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7 |  2 +-
 arch/powerpc/include/asm/cputable.h                              |  5 +++
 arch/powerpc/include/asm/fixmap.h                                |  2 +-
 arch/powerpc/include/asm/kasan.h                                 |  9 +++-
 arch/powerpc/include/asm/mce.h                                   |  7 ++++
 arch/powerpc/include/asm/perf_event.h                            |  3 ++
 arch/powerpc/include/asm/perf_event_server.h                     |  5 +++
 arch/powerpc/include/uapi/asm/perf_regs.h                        | 20 ++++++++-
 arch/powerpc/kernel/cputable.c                                   | 22 ++++++++--
 arch/powerpc/kernel/dt_cpu_ftrs.c                                |  4 --
 arch/powerpc/kernel/setup-common.c                               |  1 +
 arch/powerpc/mm/book3s32/mmu.c                                   |  9 +++-
 arch/powerpc/mm/book3s64/hash_utils.c                            |  4 +-
 arch/powerpc/perf/core-book3s.c                                  |  5 +++
 arch/powerpc/perf/hv-24x7.c                                      | 11 ++++-
 arch/powerpc/perf/perf_regs.c                                    | 44 ++++++++++++++++++--
 arch/powerpc/perf/power10-pmu.c                                  |  6 +++
 arch/powerpc/perf/power9-pmu.c                                   |  6 +++
 arch/powerpc/platforms/powernv/pci-ioda.c                        |  2 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c                     | 18 +++++---
 arch/powerpc/platforms/pseries/ras.c                             |  1 -
 21 files changed, 161 insertions(+), 25 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl9CZeAACgkQUevqPMjh
pYBRbQ//Yto2PypA1SYORhukdYSygpdELPW9wpSYZKqjnnbWlofkciIQvPGtdRNs
NabsJVp5LcVEBMsi+cDh3dXae2WQO9cm4q9FGLsYhzOSPBm+mH45Q2FNfBU71jyz
NNOxdzNtEtdz/2DYWo9uYFnuBWhMw+1w/XOwuupxh9+NU1jG2IP7y9QbPe3tBUbT
TY4ATGOeo3H+5V0FLfp/aVtgIUd78/fSVoElt3gDW/KVa4I+GFR+fQDQsRVFvtFK
4owLasJ2+JlPwm/RTQ1rlS5mnJDO/g/FM3r8veOzt/iC6zAaudB0zFF7RZ4MNFe4
bUKbhsSzHtbCaGpBRymVTeKyVKLsQ/MkAvz6ASLGw6lJtPTt0tDJzUNbdC1GMA/Z
LLUIEWw3Vusr0RMdNsHvocW65w2fWjCEFqZlVgHYe5oG7bq+FUdDgU1CNR1u/POA
S6ij2pn/5MW9Rn1PLnqUI5AA5/7QJAhsXVKcmWOZk94FF5e9DjlYTM3WHYFjmS8F
Kx/7qTDGAa0xSrgYF1MTly0b8pY14wrdYXvc3MEjw1kfK78woMzLdMeAwVt71zAn
Ecw+tlLAHUYVcAvJsOagUB6GZwsb2O5iTyudnPQrQm0FO5UlPAHhPRK4h9sLOut1
5EPE83OGA7pdbHLP10De0jX3/+6MvNuG6otNi1BIE1A8Ou/kbHU=
=S6Jz
-----END PGP SIGNATURE-----
