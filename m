Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5671150D1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 14:08:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TtFH42RpzDqLN
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 00:08:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TsmH1CrmzDqD0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 23:46:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Pd4OEH3Q"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47TsmG090Nz9sR0;
 Fri,  6 Dec 2019 23:46:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1575636414;
 bh=pTiShooK7WTN6d++Oi82nGEAlwoIAVhnFjjHQQA+Z/k=;
 h=From:To:Cc:Subject:Date:From;
 b=Pd4OEH3QNDcjTimn24g7sNJeZCeOD8DQ2j6raD8gMMyNuSL93iEgYkNdi5V/S24sH
 ejT3Du9TuYo5Utpkr4luEG/m0j3f9rHgtSP3wG7yhUvhpgjZ5D+CtSLQ0TpoegJ4k9
 HGEjId5aucnINC5NQIUk0JWE5KBEx3SUGunhbQuV9v4HmXzif0KoQkpGT7X9sjxBl0
 cNvIHi5OzgPvOgAkWPOcWYBYaqxzuf3Unqc7t18nzqBPfkwHZOdbCS5WtJgPUW+Nh/
 L2o/F/qRGCi1zQpDEwO+dd4qh0XspHc+c5YiiTPjtjruTaZJ93ALMNA0Zf6myVZR93
 1ExargDWyqU6g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-3 tag
Date: Fri, 06 Dec 2019 23:46:53 +1100
Message-ID: <878snpei4i.fsf@mpe.ellerman.id.au>
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
Cc: maddy@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 linux-kernel@vger.kernel.org, anju@linux.vnet.ibm.com, clg@kaod.org,
 skhan@linuxfoundation.org, vincenzo.frascino@arm.com,
 linuxppc-dev@lists.ozlabs.org, ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some powerpc fixes for 5.5.

This is just a regular batch of fixes, it shouldn't interact at all with the
other pull request I sent for the KASAN bitops.

cheers


The following changes since commit 63de37476ebd1e9bab6a9e17186dc5aa1da9ea99:

  Merge tag 'tag-chrome-platform-for-v5.5' of git://git.kernel.org/pub/scm/=
linux/kernel/git/chrome-platform/linux (2019-12-03 14:37:12 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.5-3

for you to fetch changes up to 249fad734a25889a4f23ed014d43634af6798063:

  powerpc/perf: Disable trace_imc pmu (2019-12-05 17:06:40 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.5 #3

One fix for a regression introduced by our recent rework of cache flushing =
on
memory hotunplug.

Like several other arches, our VDSO clock_getres() needed a fix to match the
semantics of posix_get_hrtimer_res().

A fix for a boot crash on Power9 LPARs using PCI LSI interrupts.

A commit disabling use of the trace_imc PMU (not the core PMU) on Power9
systems, because it can lead to checkstops, until a workaround is developed.

A handful of other minor fixes.

Thanks to:
  Aneesh Kumar K.V, Anju T Sudhakar, Ard Biesheuvel, Christophe Leroy, C=C3=
=A9dric Le
  Goater, Madhavan Srinivasan, Vincenzo Frascino.

- ------------------------------------------------------------------
Aneesh Kumar K.V (2):
      powerpc/pmem: Fix kernel crash due to wrong range value usage in flus=
h_dcache_range
      powerpc/pmem: Convert to EXPORT_SYMBOL_GPL

Anju T Sudhakar (1):
      powerpc/powernv: Avoid re-registration of imc debugfs directory

Ard Biesheuvel (1):
      powerpc/archrandom: fix arch_get_random_seed_int()

Christophe Leroy (1):
      powerpc/kasan: Fix boot failure with RELOCATABLE && FSL_BOOKE

C=C3=A9dric Le Goater (1):
      powerpc/xive: Skip ioremap() of ESB pages for LSI interrupts

Madhavan Srinivasan (1):
      powerpc/perf: Disable trace_imc pmu

Vincenzo Frascino (1):
      powerpc: Fix vDSO clock_getres()


 arch/powerpc/include/asm/archrandom.h     |  2 +-
 arch/powerpc/include/asm/vdso_datapage.h  |  2 +
 arch/powerpc/kernel/asm-offsets.c         |  2 +-
 arch/powerpc/kernel/head_fsl_booke.S      |  6 +--
 arch/powerpc/kernel/time.c                |  1 +
 arch/powerpc/kernel/vdso32/gettimeofday.S |  7 ++-
 arch/powerpc/kernel/vdso64/gettimeofday.S |  7 ++-
 arch/powerpc/lib/pmem.c                   |  4 +-
 arch/powerpc/mm/mem.c                     |  2 +-
 arch/powerpc/platforms/powernv/opal-imc.c | 48 ++++++++++----------
 arch/powerpc/sysdev/xive/spapr.c          | 12 ++++-
 11 files changed, 55 insertions(+), 38 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl3qSawACgkQUevqPMjh
pYAG7w/+N4DgaedZKwObZndcNPEjWm0qZ46N3jQ0w/y4L3hRAY4uQ4NBLLGltyUo
KVWZt6x9fvH/rcBrVS1B50+FkKj4bYi5QS5dQqzJIiLfVNgBPDE1BnT9c1a/fbFM
7wC69dRlLUqtu/C3bJ2ZC9RpWYRW+E8mQVlcR/bFJ4ZvNtEIm2SPqxiSHPGnF7rS
ljfqq3dLHWIqGT9AWop1MYCOrBzmwEI91kcghDzakQzYr5r/Wo8d0kkeTl0inbr1
BsaasBHY/2qPlKDjCcWqYPsO6jRcCmk1tEfJ6MtJFHw6SdQ0HjiVbBMx4hDvcU7g
5K9evECHVxN6lXRI5w/1dEfZA90ZUult/A2Y73Zuph0mA8yo+PesDiRpTtYRvi8d
Hxyc7W+qoa+NUhsuRoGjLaGqsCY94UrkPQYFmBdKE3aEqAYUBF/JxyrNmgpOjZb6
t15KlspKapLRVrdmNFFuziYJfkJuTG7Rr4OlTaDL5UAse+kNi5g0tEZ6z5h6X751
VFaRx6GXGZCyFi2mURMuq7Cn/z5gKefiuvgtq/+dU43tE7DstgabTc+han/st9Di
gutAhaDcJSjHo5ZsxXXfa6Z0umNdByxSzDD4vz5rJg2tvxNlVKV2lJtwkH/wnRh5
WSs5BjF4I9Hcc03Dl99XBHvOcEyB01QIbPUGPgkFoRd4es91P6s=3D
=3DvzlR
-----END PGP SIGNATURE-----
