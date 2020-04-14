Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1122D1A8372
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:40:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491qT31F3lzDqk7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 01:40:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=KFHJ2r2n; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491qLR4phmzDqTh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 01:35:11 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7A4920678;
 Tue, 14 Apr 2020 15:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586878509;
 bh=YRkBGt/t8S4yK07N3TSLppsH8hd4kN+lD63XKVx6wHU=;
 h=From:To:Cc:Subject:Date:From;
 b=KFHJ2r2nepdYtO2DmnwctrU8zCZIwYxMysSA61wrKFckVM0hbk0Ch9hyC6nvi9+NV
 vmNYQOF8lKi7qW50B5gjWKTJgxWw1UNteSCih+OEllQibrID7VjGhz22npI9OZkHew
 yILktqHAWgwIfmNO5lqCs49BvjpTip4SO0rJAsik=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 00/14] mm: remove __ARCH_HAS_5LEVEL_HACK 
Date: Tue, 14 Apr 2020 18:34:41 +0300
Message-Id: <20200414153455.21744-1-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-hexagon@vger.kernel.org, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, Jonas Bonn <jonas@southpole.se>,
 linux-arch@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
 Marc Zyngier <maz@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-ppc@vger.kernel.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

These patches convert several architectures to use page table folding and
remove __ARCH_HAS_5LEVEL_HACK along with include/asm-generic/5level-fixup.h
and include/asm-generic/pgtable-nop4d-hack.h. With that we'll have a single
and consistent way of dealing with page table folding instead of a mix of
three existing options.

The changes are mostly about mechanical replacement of pgd accessors with
p4d ones and the addition of higher levels to page table traversals.

v4 is about rebasing on top of v5.7-rc1 
* split arm and arm64 changes as there is no KVM host on arm anymore
* update powerpc patches to reflect its recent changes in page table handling

v3:
* add Christophe's patch that removes ppc32 get_pteptr()
* reduce amount of upper layer walks in powerpc

v2:
* collect per-arch patches into a single set
* include Geert's update of 'sh' printing messages
* rebase on v5.6-rc1+

Geert Uytterhoeven (1):
  sh: fault: Modernize printing of kernel messages

Mike Rapoport (13):
  h8300: remove usage of __ARCH_USE_5LEVEL_HACK
  arm: add support for folded p4d page tables
  arm64: add support for folded p4d page tables
  hexagon: remove __ARCH_USE_5LEVEL_HACK
  ia64: add support for folded p4d page tables
  nios2: add support for folded p4d page tables
  openrisc: add support for folded p4d page tables
  powerpc: add support for folded p4d page tables
  sh: drop __pXd_offset() macros that duplicate pXd_index() ones
  sh: add support for folded p4d page tables
  unicore32: remove __ARCH_USE_5LEVEL_HACK
  asm-generic: remove pgtable-nop4d-hack.h
  mm: remove __ARCH_HAS_5LEVEL_HACK and include/asm-generic/5level-fixup.h

 arch/arm/include/asm/pgtable.h                |   1 -
 arch/arm/lib/uaccess_with_memcpy.c            |   7 +-
 arch/arm/mach-sa1100/assabet.c                |   2 +-
 arch/arm/mm/dump.c                            |  29 ++-
 arch/arm/mm/fault-armv.c                      |   7 +-
 arch/arm/mm/fault.c                           |  22 +-
 arch/arm/mm/idmap.c                           |   3 +-
 arch/arm/mm/init.c                            |   2 +-
 arch/arm/mm/ioremap.c                         |  12 +-
 arch/arm/mm/mm.h                              |   2 +-
 arch/arm/mm/mmu.c                             |  35 ++-
 arch/arm/mm/pgd.c                             |  40 +++-
 arch/arm64/include/asm/kvm_mmu.h              |  10 +-
 arch/arm64/include/asm/pgalloc.h              |  10 +-
 arch/arm64/include/asm/pgtable-types.h        |   5 +-
 arch/arm64/include/asm/pgtable.h              |  37 ++--
 arch/arm64/include/asm/stage2_pgtable.h       |  48 +++-
 arch/arm64/kernel/hibernate.c                 |  44 +++-
 arch/arm64/mm/fault.c                         |   9 +-
 arch/arm64/mm/hugetlbpage.c                   |  15 +-
 arch/arm64/mm/kasan_init.c                    |  26 ++-
 arch/arm64/mm/mmu.c                           |  52 +++--
 arch/arm64/mm/pageattr.c                      |   7 +-
 arch/h8300/include/asm/pgtable.h              |   1 -
 arch/hexagon/include/asm/fixmap.h             |   4 +-
 arch/hexagon/include/asm/pgtable.h            |   1 -
 arch/ia64/include/asm/pgalloc.h               |   4 +-
 arch/ia64/include/asm/pgtable.h               |  17 +-
 arch/ia64/mm/fault.c                          |   7 +-
 arch/ia64/mm/hugetlbpage.c                    |  18 +-
 arch/ia64/mm/init.c                           |  28 ++-
 arch/nios2/include/asm/pgtable.h              |   3 +-
 arch/nios2/mm/fault.c                         |   9 +-
 arch/nios2/mm/ioremap.c                       |   6 +-
 arch/openrisc/include/asm/pgtable.h           |   1 -
 arch/openrisc/mm/fault.c                      |  10 +-
 arch/openrisc/mm/init.c                       |   4 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h  |   1 -
 arch/powerpc/include/asm/book3s/64/hash.h     |   4 +-
 arch/powerpc/include/asm/book3s/64/pgalloc.h  |   4 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  60 ++---
 arch/powerpc/include/asm/book3s/64/radix.h    |   6 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h  |   1 -
 arch/powerpc/include/asm/nohash/64/pgalloc.h  |   2 +-
 .../include/asm/nohash/64/pgtable-4k.h        |  32 +--
 arch/powerpc/include/asm/nohash/64/pgtable.h  |   6 +-
 arch/powerpc/include/asm/pgtable.h            |  10 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |  32 +--
 arch/powerpc/lib/code-patching.c              |   7 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c       |   4 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  26 ++-
 arch/powerpc/mm/book3s64/subpage_prot.c       |   6 +-
 arch/powerpc/mm/hugetlbpage.c                 |  28 ++-
 arch/powerpc/mm/nohash/book3e_pgtable.c       |  15 +-
 arch/powerpc/mm/pgtable.c                     |  30 ++-
 arch/powerpc/mm/pgtable_64.c                  |  10 +-
 arch/powerpc/mm/ptdump/hashpagetable.c        |  20 +-
 arch/powerpc/mm/ptdump/ptdump.c               |  14 +-
 arch/powerpc/xmon/xmon.c                      |  18 +-
 arch/sh/include/asm/pgtable-2level.h          |   1 -
 arch/sh/include/asm/pgtable-3level.h          |   1 -
 arch/sh/include/asm/pgtable_32.h              |   5 +-
 arch/sh/include/asm/pgtable_64.h              |   5 +-
 arch/sh/kernel/io_trapped.c                   |   7 +-
 arch/sh/mm/cache-sh4.c                        |   4 +-
 arch/sh/mm/cache-sh5.c                        |   7 +-
 arch/sh/mm/fault.c                            |  65 ++++--
 arch/sh/mm/hugetlbpage.c                      |  28 ++-
 arch/sh/mm/init.c                             |  15 +-
 arch/sh/mm/kmap.c                             |   2 +-
 arch/sh/mm/tlbex_32.c                         |   6 +-
 arch/sh/mm/tlbex_64.c                         |   7 +-
 arch/unicore32/include/asm/pgtable.h          |   1 -
 arch/unicore32/kernel/hibernate.c             |   4 +-
 include/asm-generic/5level-fixup.h            |  58 -----
 include/asm-generic/pgtable-nop4d-hack.h      |  64 ------
 include/asm-generic/pgtable-nopud.h           |   4 -
 include/linux/mm.h                            |   6 -
 mm/kasan/init.c                               |  11 -
 mm/memory.c                                   |   8 -
 virt/kvm/arm/mmu.c                            | 209 +++++++++++++++---
 81 files changed, 872 insertions(+), 520 deletions(-)
 delete mode 100644 include/asm-generic/5level-fixup.h
 delete mode 100644 include/asm-generic/pgtable-nop4d-hack.h

-- 
2.25.1

