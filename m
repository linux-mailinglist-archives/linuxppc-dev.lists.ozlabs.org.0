Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB99324C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 13:14:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X0VhN6dJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNc0h2lFmz3cZ5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 21:14:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X0VhN6dJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNc020CRdz3cXG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 21:14:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2B2B6CE0E1D;
	Tue, 16 Jul 2024 11:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C31C116B1;
	Tue, 16 Jul 2024 11:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721128446;
	bh=if+tcTirPJEjQZ9+hNu3pbhZeoosE+eYDqBL2iUCmhY=;
	h=From:To:Cc:Subject:Date:From;
	b=X0VhN6dJqtR1KjO/1/PYElok6T5zjLlAKyzAypL4irsN/XbVAZy4V4Ko34zh46mCO
	 InPiqKaVQ28tbxcwQ4aVimRVIlcIG7FVByt+0X2HkmQfxKOSXpmdUg7tVXXoPVH3O7
	 BbMLzCEmNdPLheUOe2MVcpjILhanEbMxkyz6KTiQZpDiolKr6j+cpBRJ2wk7C/sjqQ
	 hk60jD7l8cR3gBkksbgwjOCoU9d6TY2/m3y2t9kHZ617IrSe3LuiYwKTxaVw+SfXFM
	 /XDwcDu/Py0vDadDsPVCXJ0VUNSQL7zgFwuHdJEjuK5Diy7HEvAJBTt1a5YVs8Sy7X
	 kjipDXq1Ftupw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/17] mm: introduce numa_memblks
Date: Tue, 16 Jul 2024 14:13:29 +0300
Message-ID: <20240716111346.3676969-1-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi,

Following the discussion about handling of CXL fixed memory windows on
arm64 [1] I decided to bite the bullet and move numa_memblks from x86 to
the generic code so they will be available on arm64/riscv and maybe on
loongarch sometime later.

While it could be possible to use memblock to describe CXL memory windows,
it currently lacks notion of unpopulated memory ranges and numa_memblks
does implement this.

Another reason to make numa_memblks generic is that both arch_numa (arm64
and riscv) and loongarch use trimmed copy of x86 code although there is no
fundamental reason why the same code cannot be used on all these platforms.
Having numa_memblks in mm/ will make it's interaction with ACPI and FDT
more consistent and I believe will reduce maintenance burden.

And with generic numa_memblks it is (almost) straightforward to enable NUMA
emulation on arm64 and riscv.

The first 5 commits in this series are cleanups that are not strictly
related to numa_memblks.

Commits 6-11 slightly reorder code in x86 to allow extracting numa_memblks
and NUMA emulation to the generic code.

Commits 12-14 actually move the code from arch/x86/ to mm/ and commit 15
does some aftermath cleanups.

Commit 16 switches arch_numa to numa_memblks.

Commit 17 enables usage of phys_to_target_node() and
memory_add_physaddr_to_nid() with numa_memblks.

[1] https://lore.kernel.org/all/20240529171236.32002-1-Jonathan.Cameron@huawei.com/

Mike Rapoport (Microsoft) (17):
  mm: move kernel/numa.c to mm/
  MIPS: sgi-ip27: make NODE_DATA() the same as on all other
    architectures
  MIPS: loongson64: rename __node_data to node_data
  arch, mm: move definition of node_data to generic code
  arch, mm: pull out allocation of NODE_DATA to generic code
  x86/numa: simplify numa_distance allocation
  x86/numa: move FAKE_NODE_* defines to numa_emu
  x86/numa_emu: simplify allocation of phys_dist
  x86/numa_emu: split __apicid_to_node update to a helper function
  x86/numa_emu: use a helper function to get MAX_DMA32_PFN
  x86/numa: numa_{add,remove}_cpu: make cpu parameter unsigned
  mm: introduce numa_memblks
  mm: move numa_distance and related code from x86 to numa_memblks
  mm: introduce numa_emulation
  mm: make numa_memblks more self-contained
  arch_numa: switch over to numa_memblks
  mm: make range-to-target_node lookup facility a part of numa_memblks

 arch/arm64/include/asm/Kbuild                 |   1 +
 arch/arm64/include/asm/mmzone.h               |  13 -
 arch/arm64/include/asm/topology.h             |   1 +
 arch/loongarch/include/asm/Kbuild             |   1 +
 arch/loongarch/include/asm/mmzone.h           |  16 -
 arch/loongarch/include/asm/topology.h         |   1 +
 arch/loongarch/kernel/numa.c                  |  21 -
 arch/mips/include/asm/mach-ip27/mmzone.h      |   1 -
 .../mips/include/asm/mach-loongson64/mmzone.h |   4 -
 arch/mips/loongson64/numa.c                   |  20 +-
 arch/mips/sgi-ip27/ip27-memory.c              |   2 +-
 arch/powerpc/include/asm/mmzone.h             |   6 -
 arch/powerpc/mm/numa.c                        |  26 +-
 arch/riscv/include/asm/Kbuild                 |   1 +
 arch/riscv/include/asm/mmzone.h               |  13 -
 arch/riscv/include/asm/topology.h             |   4 +
 arch/s390/include/asm/Kbuild                  |   1 +
 arch/s390/include/asm/mmzone.h                |  17 -
 arch/s390/kernel/numa.c                       |   3 -
 arch/sh/include/asm/mmzone.h                  |   3 -
 arch/sh/mm/init.c                             |   7 +-
 arch/sh/mm/numa.c                             |   3 -
 arch/sparc/include/asm/mmzone.h               |   4 -
 arch/sparc/mm/init_64.c                       |  11 +-
 arch/x86/Kconfig                              |   9 +-
 arch/x86/include/asm/Kbuild                   |   1 +
 arch/x86/include/asm/mmzone.h                 |   6 -
 arch/x86/include/asm/mmzone_32.h              |  17 -
 arch/x86/include/asm/mmzone_64.h              |  18 -
 arch/x86/include/asm/numa.h                   |  24 +-
 arch/x86/include/asm/sparsemem.h              |   9 -
 arch/x86/mm/Makefile                          |   1 -
 arch/x86/mm/amdtopology.c                     |   1 +
 arch/x86/mm/numa.c                            | 618 +-----------------
 arch/x86/mm/numa_internal.h                   |  24 -
 drivers/acpi/numa/srat.c                      |   1 +
 drivers/base/Kconfig                          |   1 +
 drivers/base/arch_numa.c                      | 223 ++-----
 drivers/cxl/Kconfig                           |   2 +-
 drivers/dax/Kconfig                           |   2 +-
 drivers/of/of_numa.c                          |   1 +
 include/asm-generic/mmzone.h                  |   5 +
 include/asm-generic/numa.h                    |   6 +-
 include/linux/numa.h                          |   5 +
 include/linux/numa_memblks.h                  |  58 ++
 kernel/Makefile                               |   1 -
 kernel/numa.c                                 |  26 -
 mm/Kconfig                                    |  11 +
 mm/Makefile                                   |   3 +
 mm/numa.c                                     |  57 ++
 {arch/x86/mm => mm}/numa_emulation.c          |  42 +-
 mm/numa_memblks.c                             | 565 ++++++++++++++++
 52 files changed, 847 insertions(+), 1070 deletions(-)
 delete mode 100644 arch/arm64/include/asm/mmzone.h
 delete mode 100644 arch/loongarch/include/asm/mmzone.h
 delete mode 100644 arch/riscv/include/asm/mmzone.h
 delete mode 100644 arch/s390/include/asm/mmzone.h
 delete mode 100644 arch/x86/include/asm/mmzone.h
 delete mode 100644 arch/x86/include/asm/mmzone_32.h
 delete mode 100644 arch/x86/include/asm/mmzone_64.h
 create mode 100644 include/asm-generic/mmzone.h
 create mode 100644 include/linux/numa_memblks.h
 delete mode 100644 kernel/numa.c
 create mode 100644 mm/numa.c
 rename {arch/x86/mm => mm}/numa_emulation.c (94%)
 create mode 100644 mm/numa_memblks.c


base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
-- 
2.43.0

