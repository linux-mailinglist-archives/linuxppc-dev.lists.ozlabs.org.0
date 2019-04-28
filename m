Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13440B578
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 08:57:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sJW32QyvzDqVD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 16:57:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sJTb3DGxzDqT3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 16:55:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44sJTZ5Lqqz9s7T;
 Sun, 28 Apr 2019 16:55:46 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.1-6 tag
Date: Sun, 28 Apr 2019 16:55:57 +1000
Message-ID: <87ftq2aa9u.fsf@concordia.ellerman.id.au>
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Linus,

Please pull some more powerpc fixes for 5.1.

I was 50/50 on whether these were worthy of sending at rc6, but decided I would
send them as they're in obscure areas of the code and they do fix user-visible
bugs.

cheers


The following changes since commit cf7cf6977f531acd5dfe55250d0ee8cbbb6f1ae8:

  powerpc/mm: Define MAX_PHYSMEM_BITS for all 64-bit configs (2019-04-10 14:45:57 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.1-6

for you to fetch changes up to 7a3a4d763837d3aa654cd1059030950410c04d77:

  powerpc/mm_iommu: Allow pinning large regions (2019-04-17 21:36:51 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.1 #6

A one-liner to make our Radix MMU support depend on HUGETLB_PAGE. We use some of
the hugetlb inlines (eg. pud_huge()) when operating on the linear mapping and if
they're compiled into empty wrappers we can corrupt memory.

Then two fixes to our VFIO IOMMU code. The first is not a regression but fixes
the locking to avoid a user-triggerable deadlock.

The second does fix a regression since rc1, and depends on the first fix. It
makes it possible to run guests with large amounts of memory again (~256GB).

Thanks to:
  Alexey Kardashevskiy.

- ------------------------------------------------------------------
Alexey Kardashevskiy (2):
      powerpc/mm_iommu: Fix potential deadlock
      powerpc/mm_iommu: Allow pinning large regions

Michael Ellerman (1):
      powerpc/mm/radix: Make Radix require HUGETLB_PAGE


 arch/powerpc/configs/skiroot_defconfig |  1 +
 arch/powerpc/mm/mmu_context_iommu.c    | 97 ++++++++++++++++++++--------------
 arch/powerpc/platforms/Kconfig.cputype |  2 +-
 3 files changed, 60 insertions(+), 40 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJcxU1hAAoJEFHr6jzI4aWAafIP/2Bg4WFdvVfmfMFSxZPP/5Rg
haS/4x6A6JJCVnxn0czaIUzY01s2Bgex4xAexoP1GtFTnNqXpWaxoPLveQQp0n4s
lrRC2e5R2O5d9CHVC+qzkUk16Cd6RjrXLzz1YhJo2kQrERJ/CcPQPF2SNkg08kyz
PtqrQVz2KMQsKiV/wPILwmOGLrxcJfH+01Z4/hbmJzveb9l4/SRN4aVZC12Wv7jQ
HDszTeDTNpFpTysA+cqC95t0ZQRK+Hb0c23zsDqVVFZxAwf083ZcU9IXwVdhoSsp
yXaoN/EFdTeVt8A4OL0/ER4wwyx1ShahvR1LuPDZ1x5/rzV0msExsNfRUOqeGUww
K9KnYEi5wWes/o+aLgf4adG96swmTvVChOSe7OUpod1hPO3UZ8vMpeAt0XB527TY
ptAcq7d6kpimd84A7qWM4lmC2QT9K5TqE9NoVpeCDgHbDqZZlWG2oMiXQXk/Thu2
OvpQwrbvX+vYgPgwuQbdyGnlNoxiTVT4oorsMo4YNIUi8OJB3Gu8ROL59tBjY/L+
jZFTNvj3fv/XYGy9mBBJhTpCG4SDz0D593iomrui+oAYczUkuNvlUv6lf9DCbXlU
mVbuqMbFin1JUtPngXROQbKkaQ8pf0QgGBS3y7ipPrV/3vAyJ66SqIcrm8XsXyzl
kAP6787TNrq3fosnfgBb
=EDog
-----END PGP SIGNATURE-----
