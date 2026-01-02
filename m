Return-Path: <linuxppc-dev+bounces-15124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A91CEDB41
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 08:00:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djF2M0Rzyz2yFb;
	Fri, 02 Jan 2026 18:00:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767337226;
	cv=none; b=a7GZnXvDJIAqb1e8Nl1LkWRxnaLOPGD8m9YGujMJHhFgi/KjssQoMNw/Q9NSBsxV8x7XS4+QdMQTKAWz6xODfKoAdU0YLLnxYmyFJqjlAlAfS1RVk3GF8qk+vcgLZUt7909IPeRWFwJEoV6JTE95xwvrYyvCDVCc0dfH0PeCXVPVFu69KJ4BVSX5OQwWAQbSjL2QQJEm3g3NRktWnzC4iwXZhDI1K09FDauoc4ivAwF2SgpGItsA6mkqBI9geVGTV03Md/raO6K2QCHNTelz3B4ESGJ5s/MQUKwsg6CvXKpoQdBrKUJhZh6S8TztsXl0I+Cc3XuaKTz5tQFjrN0CFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767337226; c=relaxed/relaxed;
	bh=fzGScPL8fKRb0zTLLc43dI7u38BalcaTw4vJNG5xahY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=miiqvDjxiVd23xwofDbOhbK1xcgRbgt47eT7sSoG8neKALU6X0jl60s06e6tZT/XHCoDcLBCnFLR6fU4y807NnhAS4mPmYakb4GIU+8zB/VrbS+iSJ4NhOSnAY4uEii4xjTci63kDq1e8fr8SCgJviavoRpQcCQNGXFtqHKw/T9cPkqSDCs30kY8Kc4yqW+S38MQGTc2j8ym9fcyQFvqbx5suUt+bRIOQaJoL86DFuxEdLUGz89nvnxCNbwezRE6aaUqAydvEnYGXf+h+AETkXmS4Z5YqNEad+EJ1HLn68yxAsRORUd654G9KBpwbaU/D84zOz20r+NuCfh4S8H/mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kzLnd/zM; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kzLnd/zM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djF2L1xhLz2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 18:00:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9720240427;
	Fri,  2 Jan 2026 07:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C319C116B1;
	Fri,  2 Jan 2026 07:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337224;
	bh=RKxDhFgzDq3YGxuar8UOMbGnphlEq9WWY3OvJ6HZDCo=;
	h=From:To:Cc:Subject:Date:From;
	b=kzLnd/zMHbNqm077UwFJpmx8HoFPlr4yUOCztzLmN9ZIQ5wnYsrJhy5QOduSZSZCu
	 ln9uSL2J89up8YOuvzJyKJyO0TdA9K2T7iLeGi3UcGq/gIK+YBe6n1UM9HyjDN81Sq
	 76SBcppamscXiSirWYQvkdTDQRv6PS/pxFFDuRGA16UKYTxA19TbqJvemVVe4C5li4
	 pveql/UPWwGhHkzRhKXcjRT1LfyID9hSKFNDryxzlL37GrYmkVlCNeoNw6tGBB11wg
	 4Q9cCOjdnixoCVxmJSjdUxwUdeNpINX7P7sMG5OTDvI2zodHKJ6nnE5Hqo24Re3kM2
	 Oq45tNJeyyGnA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 00/28] arch, mm: consolidate hugetlb early reservation
Date: Fri,  2 Jan 2026 08:59:36 +0200
Message-ID: <20260102070005.65328-1-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi,

Order in which early memory reservation for hugetlb happens depends on
architecture, on configuration options and on command line parameters.

Some architectures rely on the core MM to call hugetlb_bootmem_alloc()
while others call it very early to allow pre-allocation of HVO-style
vmemmap.

When hugetlb_cma is supported by an architecture it is initialized during
setup_arch() and then later hugetlb_init code needs to understand did it
happen or not.

To make everything consistent and unified, both reservation of hugetlb
memory from bootmem and creation of CMA areas for hugetlb must be called
from core MM initialization and it would have been a simple change.
However, HVO-style pre-initialization ordering requirements slightly
complicate things and for HVO pre-init to work sparse and memory map should
be initialized after hugetlb reservations.

This required pulling out the call to free_area_init() out of setup_arch()
path and moving it MM initialization and this is what the first 23 patches
do.

These changes are deliberately split into per-arch patches that change how
the zone limits are calculated for each architecture and the patches 22 and
23 just remove the calls to free_area_init() and sprase_init() from arch/*.

Patch 24 is a simple cleanup for MIPS.

Patches 25 and 26 actually consolidate hugetlb reservations and patches 27
and 28 perform some aftermath cleanups.

I tried to trim the distribution list and although it's still quite long
if you feel that someone was wrongly excluded please add them back.

The changes also available in git:
https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=hugetlb-init/v2

v2 changes:
* move the hugetlb and memory map initializaion to mm_core_init_early()
* add Acks

v1: https://lore.kernel.org/all/20251228124001.3624742-1-rppt@kernel.org

Mike Rapoport (Microsoft) (28):
  alpha: introduce arch_zone_limits_init()
  arc: introduce arch_zone_limits_init()
  arm: introduce arch_zone_limits_init()
  arm64: introduce arch_zone_limits_init()
  csky: introduce arch_zone_limits_init()
  hexagon: introduce arch_zone_limits_init()
  loongarch: introduce arch_zone_limits_init()
  m68k: introduce arch_zone_limits_init()
  microblaze: introduce arch_zone_limits_init()
  mips: introduce arch_zone_limits_init()
  nios2: introduce arch_zone_limits_init()
  openrisc: introduce arch_zone_limits_init()
  parisc: introduce arch_zone_limits_init()
  powerpc: introduce arch_zone_limits_init()
  riscv: introduce arch_zone_limits_init()
  s390: introduce arch_zone_limits_init()
  sh: introduce arch_zone_limits_init()
  sparc: introduce arch_zone_limits_init()
  um: introduce arch_zone_limits_init()
  x86: introduce arch_zone_limits_init()
  xtensa: introduce arch_zone_limits_init()
  arch, mm: consolidate initialization of nodes, zones and memory map
  arch, mm: consolidate initialization of SPARSE memory model
  mips: drop paging_init()
  x86: don't reserve hugetlb memory in setup_arch()
  mm, arch: consolidate hugetlb CMA reservation
  mm/hugetlb: drop hugetlb_cma_check()
  Revert "mm/hugetlb: deal with multiple calls to hugetlb_bootmem_alloc"

 .../driver-api/cxl/linux/early-boot.rst       |  2 +-
 Documentation/mm/memory-model.rst             |  3 --
 .../translations/zh_CN/mm/memory-model.rst    |  2 -
 arch/alpha/kernel/setup.c                     |  1 -
 arch/alpha/mm/init.c                          | 16 ++++----
 arch/arc/mm/init.c                            | 37 +++++++++---------
 arch/arm/mm/init.c                            | 25 ++----------
 arch/arm64/include/asm/hugetlb.h              |  2 -
 arch/arm64/mm/hugetlbpage.c                   | 10 ++---
 arch/arm64/mm/init.c                          | 39 ++++++++-----------
 arch/csky/kernel/setup.c                      | 16 ++++----
 arch/hexagon/mm/init.c                        | 19 +++------
 arch/loongarch/include/asm/pgtable.h          |  2 -
 arch/loongarch/kernel/setup.c                 | 10 -----
 arch/loongarch/mm/init.c                      |  6 +--
 arch/m68k/mm/init.c                           |  8 ++--
 arch/m68k/mm/mcfmmu.c                         |  3 --
 arch/m68k/mm/motorola.c                       |  6 +--
 arch/m68k/mm/sun3mmu.c                        |  9 -----
 arch/microblaze/mm/init.c                     | 22 +++++------
 arch/mips/include/asm/pgalloc.h               |  2 -
 arch/mips/include/asm/pgtable.h               |  2 +-
 arch/mips/kernel/setup.c                      | 15 +------
 arch/mips/loongson64/numa.c                   | 10 ++---
 arch/mips/mm/init.c                           |  8 +---
 arch/mips/sgi-ip27/ip27-memory.c              |  8 +---
 arch/nios2/mm/init.c                          | 12 +++---
 arch/openrisc/mm/init.c                       | 10 +----
 arch/parisc/mm/init.c                         | 11 +-----
 arch/powerpc/include/asm/hugetlb.h            |  5 ---
 arch/powerpc/include/asm/setup.h              |  4 ++
 arch/powerpc/kernel/setup-common.c            |  1 -
 arch/powerpc/mm/hugetlbpage.c                 | 11 ++----
 arch/powerpc/mm/mem.c                         | 27 +++++--------
 arch/powerpc/mm/numa.c                        |  2 -
 arch/riscv/mm/hugetlbpage.c                   |  8 ++++
 arch/riscv/mm/init.c                          | 10 +----
 arch/s390/kernel/setup.c                      |  2 -
 arch/s390/mm/hugetlbpage.c                    |  8 ++++
 arch/s390/mm/init.c                           | 13 +++----
 arch/sh/mm/init.c                             | 12 +++---
 arch/sparc/mm/init_64.c                       | 17 +++-----
 arch/sparc/mm/srmmu.c                         | 17 ++++----
 arch/um/kernel/mem.c                          | 10 ++---
 arch/x86/kernel/setup.c                       |  5 ---
 arch/x86/mm/hugetlbpage.c                     |  8 ++++
 arch/x86/mm/init.c                            |  8 +---
 arch/x86/mm/init_32.c                         |  2 -
 arch/x86/mm/init_64.c                         |  4 --
 arch/x86/mm/mm_internal.h                     |  1 -
 arch/xtensa/mm/init.c                         | 14 +++----
 include/linux/hugetlb.h                       | 12 ++----
 include/linux/mm.h                            |  5 ++-
 include/linux/mmzone.h                        |  2 -
 init/main.c                                   |  1 +
 mm/hugetlb.c                                  | 13 -------
 mm/hugetlb_cma.c                              | 33 ++++++++--------
 mm/hugetlb_cma.h                              |  5 ---
 mm/hugetlb_vmemmap.c                          | 11 ------
 mm/internal.h                                 |  6 +++
 mm/mm_init.c                                  | 20 ++++++----
 61 files changed, 219 insertions(+), 394 deletions(-)


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.51.0


