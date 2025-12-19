Return-Path: <linuxppc-dev+bounces-14908-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB5CD0CD4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 17:17:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXt3D0kjzz2yFh;
	Sat, 20 Dec 2025 03:17:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766161031;
	cv=none; b=QcRRC5nOaVkRtS+ep3m8MW7ldLBY9x6h7x943CQ5HNxV3LKndK6+DgtuL1/iQC+qjrMSZyrZKmLdCgNp3hU1lRffupFSXKy2TtyPZn9S9Lp+fuuzi+nmh/w0G5MLSYvM4Z3gUVpZkCtBPU827NwROv4LYocWHAScxllOw287jt+azyBKPQ3m0QQjVmpdhQy5FXVSp3ApJ2UOw0LroyxjTl14dkStIE0RR4M0W7o6fjoxLMuUFuAGZotCilyoUmyEZPaLZV0RityVxCgEVLacfSEC3kUvVggry5dKo/90GKaj6NDjInJzQ4su+TxHGcTQpsI3J6j168bz1Kci2UYl3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766161031; c=relaxed/relaxed;
	bh=YrMU+/etl5QuQSZUiyvkx0eeq2klzraORmvlUQahEc8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kp2G9emKoA/Y/bDDEwRU9ywk5kKqQ7pLzM1WfIvvmA/xIYB4wSa3efGJYKfUQzGtcEFPjOGap2Hw7xjKw7QhHNWAXew9FA6xFYLqylUjlcUf9dzWf3VVeJdz7xObMrPljxB5K2jkvrRl54sGSwurY+7KX+oEUVN4G/Mn0EmW5R95Y+cLPdrfuMo+kV7fgXmUnF1TgIfa251U9KN5B7eOVgm7pklMiLjvnix+ryB6VxWVe7UyY2KqwZSp69h5i9BmBJKDd9KkgjpJNK6sDIk1g37NmRkRapBj0Rc4Vy1ZP5j5EazYCpUxfbL6e1CLTdPn4azIhWVEo6yWMW1Ny4jHcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AJ64F8Y9; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AJ64F8Y9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXt396CGPz2yFd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Dec 2025 03:17:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA1D740A41;
	Fri, 19 Dec 2025 16:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B064FC4CEF1;
	Fri, 19 Dec 2025 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766160997;
	bh=JUANTRw13L53ZJeWRkytCQq3wemKN/QVSV7VD+meYXA=;
	h=From:To:Cc:Subject:Date:From;
	b=AJ64F8Y9Olu9SXqmaxmT9KT0vAWaGBKrVOSF5D/0Oz74R9S7OUB4519d3Z2Lp1bl+
	 O8u/lVF5zadcmz+Jg7ZazmZGrJW4d4Va1PnH2siAZQ+9ghPxuy5UAsm7DU/mLVfq5r
	 hnksEovGij6hUHhTTaexE7/wA0zSddCm3xkBo5gXW6F07o6HD0gY/tadQ3Mrz7EbXB
	 S1D4hNCpD473VLN7fQzyjsiHa49R2e0xMzWwQkDuiqzMQmmO9guk6Kqz94jCpgzdfP
	 hn3U6Jmry9eImWjt1gJ5CsTA5x9BkByml4oyXj5zLBrNtTGtQjGdonwP5jZ7tWWVGG
	 gJZ0MXw+MyIAw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthew Wilcox <willy@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 0/4] mm: increase lowmem size in linux-7.0
Date: Fri, 19 Dec 2025 17:15:55 +0100
Message-Id: <20251219161559.556737-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

At the kernel summit in Tokyo last week, I hosted a session on dealing
with highmem in the long run, see the link below.

My feeling was that we got sufficient consensus on the plan to keep the
funcationality present for the time being but instead reduce the scope
of highmem in the kernel as much as we can without hurting users.

The short summary is a three stage process:

 1. Nudge users towards using a larger lowmem zone with the
    CONFIG_VMSPLIT_* options if at all possible.

 2. Drop most __GFP_HIGHMEM allocations and corresponding kmap()
    calls from the kernel, leaving only the subset that is likely
    to contain the majority of the actual allocations.
    Specifically we will keep anonymous and regular file backed
    user mappings, zsmalloc, and huge pages.

 3. In a few years, also drop the page cache allocations and leave
    perhaps only zsmalloc using a much simpler interface.  I suggested
    five years as the time until we do this, but the timing depends a
    lot on how the first two stages work out in practice, and how long
    the remaining highmem users plan to keep updating their kernels.

This series implements stage 1, mostly using Kconfig changes to the
default settings but leaving the traditional behavior as a CONFIG_EXPERT
choice in Kconfig. With the new defaults, most installations that use
highmem today with 1 GiB or 2 GiB of system RAM will see all of their
RAM in the lowmem zone after upgrading their kernels. My estimate is
that instead of 80% to 90% of maintained embedded 32-bit systems, this
should cover over 98%.

As I don't actually have hardware in the category that still needs
highmem, I tested this using a qemu-system for Armv7 and PPC6xx running a
Debian userland with all combinations of VMSPLIT and HIGHMEM options. I
ran some kernel builds on the Arm guest to ensure that the new options
don't cause functional or performance regressions for regular workloads
that don't exceed the virtual address space. I also ran some tests
with Firefox and was positively surprised to see that this still works
on the VMSPLIT_2G_OPT configuration without highmem, though it gets
close to both the address space and lowmem size limits.

The change to use VMSPLIT_3G_OPT by default on Armv5 means that I could
include a patch to no longer support highmem at all on VIVT caches,
as suggested by Jason Gunthorpe.

     Arnd

Link: https://lpc.events/event/19/contributions/2261/

Arnd Bergmann (4):
  arch/*: increase lowmem size to avoid highmem use
  ARM: add CONFIG_VMSPLIT_2G_OPT option
  ARM: remove support for highmem on VIVT
  mm: remove ARCH_NEEDS_KMAP_HIGH_GET

 arch/arm/Kconfig                            |  12 ++-
 arch/arm/configs/aspeed_g5_defconfig        |   1 -
 arch/arm/configs/dove_defconfig             |   2 -
 arch/arm/configs/gemini_defconfig           |   1 -
 arch/arm/configs/multi_v5_defconfig         |   1 -
 arch/arm/configs/mv78xx0_defconfig          |   2 -
 arch/arm/configs/mvebu_v5_defconfig         |   1 -
 arch/arm/configs/u8500_defconfig            |   1 -
 arch/arm/configs/vt8500_v6_v7_defconfig     |   3 -
 arch/arm/include/asm/highmem.h              |  56 +----------
 arch/arm/mach-omap2/Kconfig                 |   1 -
 arch/arm/mm/cache-feroceon-l2.c             |  31 +-----
 arch/arm/mm/cache-xsc3l2.c                  |  47 +--------
 arch/arm/mm/dma-mapping.c                   |  12 +--
 arch/arm/mm/flush.c                         |  19 +---
 arch/microblaze/Kconfig                     |   9 +-
 arch/microblaze/configs/mmu_defconfig       |   1 -
 arch/powerpc/Kconfig                        |  17 ++--
 arch/powerpc/configs/44x/akebono_defconfig  |   1 -
 arch/powerpc/configs/85xx/ksi8560_defconfig |   1 -
 arch/powerpc/configs/85xx/stx_gp3_defconfig |   1 -
 arch/x86/Kconfig                            |   4 +-
 mm/highmem.c                                | 100 ++------------------
 23 files changed, 56 insertions(+), 268 deletions(-)

-- 
2.39.5

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-fsdevel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>


