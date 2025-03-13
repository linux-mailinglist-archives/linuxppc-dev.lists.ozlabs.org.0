Return-Path: <linuxppc-dev+bounces-6958-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3818FA5F64F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 14:50:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD85b6Krgz3c1Q;
	Fri, 14 Mar 2025 00:50:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741873827;
	cv=none; b=mYp55GSc9ZYSQWE8I492xLgx/mlBQ6zHuG0OcYsSa1lGJVhLPX3sZSSKIzYMSLX3chdvH4TzzydxHsEMUnmYDA5hCT9mcoUdz12uXhmnCDVIRrP/Db0QvS+4wl9gCy+us6xOMScnDcAzIhTn8GwkeiOVTX0O/TUxLbC145Df2cdXu0crAAv89g1Y5hP3ndfPWljRIafFhUWEbK4JhY7qNO4fpG+PFXebyMUSvYvqz6GePlF1BsjNyDujmEDDrv9DdBkVBHUubO7CWX/COR1aHpt63PeW3qpND7obghWSkBpq6hr8QQn8xGQ5b/sy15p/FTY95Dn8Fy/vfmI/zZOIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741873827; c=relaxed/relaxed;
	bh=q3twzRg7JFtCcj4wct+pthKqDwlnYSVDhBZsfaP3eKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GP5rJ03R2kb6n/SZr8qM3NsfcWNUwNIi/gxCCuFR5l0g/6bQA+ExQs7g/sWy85kZztkxqUVkw/o/Ti/g1o6kHkr8sH6Oi7kpygUGoUANrGD+6dnKBxP/8vpA+gZJ9S/zyA5016IINvgbxduCoyan3Be6OCGUIbQVBP42Y2dThY/PfTWIJB0uASEfxf+gtp9gkbbxbmTGp3Z2dfNVebi4XX6sDwIhHnECfspmnaJqUOLBn3p7kYNsT++4E2asuyOCV5hQhoNDdh+OJd3k9YAPcq/fMO18n7yzHhwM+rhJtMw24i015HGm/e+kd9wDLan7kkp3Afj6LdAENJCPAWNkqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aBWKPm/h; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aBWKPm/h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD85Z71C2z30CB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 00:50:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3BAE8A474BF;
	Thu, 13 Mar 2025 13:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C704BC4CEEA;
	Thu, 13 Mar 2025 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741873822;
	bh=62myLVbZVVZFvzPE89he3yMa/a5QAFc2vHsMKxeLVb8=;
	h=From:To:Cc:Subject:Date:From;
	b=aBWKPm/h37x/i5+4FCPzxXZYbNjC4QtR+6/uzYQ4j82YaZ0nkwcNlRiBhZ3s4R+Lr
	 UbF6tAw/GLOmZOSjCm3jrX37f1OqnkT6FdjX3Szfhc1wjS/Zyf835B0imLzLMqYjcF
	 W5cI3ghKtUKRswhAYc77+5GSp1YmJnwSpf+x4AqcOGMZBAqFa6QHJIit/O7bFjGzmZ
	 g/lU9Dt6wqDCDU2wFqrq4LXF68UvvU/ytVgt54uUuF2Vagcx8WobuHEk6mGKRWMGKp
	 aLWh5ch4M9p8CvWw5jWVVvEJFFmiQHZ9S4CLDqJpDLqZJs/1wj2uAhd2lAzYblfH7W
	 BgZb5J0KHNyow==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v2 00/13] arch, mm: reduce code duplication in mem_init()
Date: Thu, 13 Mar 2025 15:49:50 +0200
Message-ID: <20250313135003.836600-1-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi,

Every architecture has implementation of mem_init() function and some
even more than one. All these release free memory to the buddy
allocator, most of them set high_memory to the end of directly
addressable memory and many of them set max_mapnr for FLATMEM case.

These patches pull the commonalities into the generic code and refactor
some of the mem_init() implementations so that many of them can be just
dropped.

v2 changes:
* don't use generic version for setting high_memory on architectures
  that use that varialble earlier than free_area_init()
* use memblock_alloc_or_panig() to allocate zero pages on MIPS and s390
* fix alignment in allocation of zero pages on s390
* add Acked-by

v1: https://lore.kernel.org/all/20250306185124.3147510-1-rppt@kernel.org

Mike Rapoport (Microsoft) (13):
  arm: mem_init: use memblock_phys_free() to free DMA memory on SA1111
  csky: move setup_initrd() to setup.c
  hexagon: move initialization of init_mm.context init to paging_init()
  MIPS: consolidate mem_init() for NUMA machines
  MIPS: make setup_zero_pages() use memblock
  nios2: move pr_debug() about memory start and end to setup_arch()
  s390: make setup_zero_pages() use memblock
  xtensa: split out printing of virtual memory layout to a function
  arch, mm: set max_mapnr when allocating memory map for FLATMEM
  arch, mm: set high_memory in free_area_init()
  arch, mm: streamline HIGHMEM freeing
  arch, mm: introduce arch_mm_preinit
  arch, mm: make releasing of memory to page allocator more explicit

 arch/alpha/mm/init.c               |  8 ----
 arch/arc/mm/init.c                 | 25 +----------
 arch/arm/mm/init.c                 | 43 +------------------
 arch/arm64/mm/init.c               | 12 +-----
 arch/csky/kernel/setup.c           | 43 +++++++++++++++++++
 arch/csky/mm/init.c                | 67 ------------------------------
 arch/hexagon/mm/init.c             | 32 ++------------
 arch/loongarch/kernel/numa.c       |  6 ---
 arch/loongarch/mm/init.c           |  8 ----
 arch/m68k/mm/init.c                |  2 -
 arch/microblaze/mm/init.c          | 25 -----------
 arch/mips/include/asm/mmzone.h     |  2 -
 arch/mips/loongson64/numa.c        |  7 ----
 arch/mips/mm/init.c                | 51 ++++-------------------
 arch/mips/sgi-ip27/ip27-memory.c   |  9 ----
 arch/nios2/kernel/setup.c          |  3 +-
 arch/nios2/mm/init.c               | 16 +------
 arch/openrisc/mm/init.c            |  6 ---
 arch/parisc/mm/init.c              |  4 --
 arch/powerpc/kernel/setup-common.c |  2 -
 arch/powerpc/mm/mem.c              | 18 +-------
 arch/riscv/mm/init.c               |  5 +--
 arch/s390/mm/init.c                | 20 +--------
 arch/sh/mm/init.c                  | 10 -----
 arch/sparc/mm/init_32.c            | 31 +-------------
 arch/sparc/mm/init_64.c            |  4 --
 arch/um/include/shared/mem_user.h  |  1 -
 arch/um/kernel/mem.c               |  9 ++--
 arch/um/kernel/physmem.c           | 12 ------
 arch/um/kernel/um_arch.c           |  2 -
 arch/x86/include/asm/highmem.h     |  3 --
 arch/x86/include/asm/numa.h        |  4 --
 arch/x86/include/asm/numa_32.h     | 13 ------
 arch/x86/kernel/setup.c            |  2 -
 arch/x86/mm/Makefile               |  2 -
 arch/x86/mm/highmem_32.c           | 34 ---------------
 arch/x86/mm/init_32.c              | 41 ++----------------
 arch/x86/mm/init_64.c              |  7 ++--
 arch/x86/mm/numa_32.c              |  3 --
 arch/xtensa/mm/init.c              | 66 +++++++----------------------
 include/asm-generic/memory_model.h |  5 ++-
 include/linux/memblock.h           |  1 -
 include/linux/mm.h                 | 13 +-----
 mm/internal.h                      |  3 +-
 mm/memblock.c                      |  3 +-
 mm/memory.c                        | 16 -------
 mm/mm_init.c                       | 65 +++++++++++++++++++++++++----
 mm/nommu.c                         |  6 ---
 48 files changed, 158 insertions(+), 612 deletions(-)
 delete mode 100644 arch/x86/include/asm/numa_32.h
 delete mode 100644 arch/x86/mm/highmem_32.c


base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
-- 
2.47.2


