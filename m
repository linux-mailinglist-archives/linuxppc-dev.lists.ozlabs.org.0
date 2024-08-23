Return-Path: <linuxppc-dev+bounces-477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6F095DE90
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2024 16:52:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wrg035XBkz2xy0;
	Sun, 25 Aug 2024 00:52:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724421732;
	cv=none; b=iaNNGQ+WIcd9EdvKoIEFFG2NsnTO4TNbC3IxePS48kLxMIor8uyNNDE+MtfF6Nvgr84nsD4dPoWDExCmz+jgx/Ax6OkwtJ0AhoyLF3kXDP1x8XQdvlurMC7jD9jzhXzNY/2TwBvX4hQgiFND3d10P1Gsj/Y4UpKn7ZkWjCF5Amm/8VHSbSfznkz9LQtbAdX9F3vXtoWInGngaAmvy0l1ZZZdhvZ6X9hiOfNdpMuJBSbczFuRE1M+MBphJunavUPMA2ZGC3dlPJpCLSXRLIQMuWsbRM5Ivt2ncCj1cCkoVBadsbC097wAMopPRQqXlyi7gQFd+opEZ454LXlhHrIFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724421732; c=relaxed/relaxed;
	bh=GkUKOg4XFGcn0tGLZB0Lp50cKBjIVz+rCKOhaGnR3vM=;
	h=Received:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:X-stable:
	 X-Patchwork-Hint:X-stable-base:Content-Transfer-Encoding; b=nCRAh6horxbdlLlSdAGe02W/y5SWxA0Pm1OWqO67v/u/7gct2WBrKtbLQ1u5g23vv+1RDpm6nPVKzifmZOvK9PxQuNARwJQ3Pl+stX0xYDOZj0uDdbqx4ZuqkcQXWoRQAaGKNelFm/zKgkw/doyOLYnYAvIxzq6EzqA1XOnWBc5kH0mDWe/HkLiTR0zahhZ/D2fJ4KIu47wrGxDCL5+j6B9JXI3RimuP0mHp1HDAUMLMIMdWdCrvLbDCls++vqxaNQUdcmOfgBx+EKIrEH/ED9jxhuvngPDCdhxGil9NsUCZ7DEbmVERMhsWwjPJjxDlPrri2iCkvmc5D0y6YWIpAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kN8hg0RE; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kN8hg0RE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr1wM6NH2z2yw3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 00:02:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA60B6134A;
	Fri, 23 Aug 2024 14:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140A1C32786;
	Fri, 23 Aug 2024 14:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724421729;
	bh=s6ootnqXPe3/tfsEU981f0MlYubezBe3jzUesghAFzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kN8hg0RED23Tuyp65C5DjwjuszgGjpCyXUM919/ERSlJ/ZYEkz3NtqyI3BKh3Q3vL
	 UdsbOO/5qFQt0h0zocyKYRlrHmTpYVN0X8ZI5UCc10+WDluFd4/OAfu3N1QE70yhB1
	 j8eG+G1tJtaa1AlKECnYKkBUxm/Qe16bMoa7XRwOW4l8PWzOTgHX78gC1/1auMvfcp
	 eSFc6XiXBK11aNMmHRrlhlNQ/7/3C8FZpHgTRZAi5qfrSo7jCYZG4vYTQaU2SxRn+3
	 /tsBnKiD2xJ2L0NgrBNTRCxo+bUtMZ7Jt7dWCoJs/XjDdxsippk2r5Dx0S4IVBcMM1
	 b0Eejzwqt/sJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sasha Levin <sashal@kernel.org>,
	hbathini@linux.ibm.com,
	bhe@redhat.com,
	javierm@redhat.com,
	thorsten.blum@toblux.com,
	willy@infradead.org,
	arnd@arndb.de,
	tzimmermann@suse.de,
	mcgrof@kernel.org,
	rppt@kernel.org,
	kent.overstreet@linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.10 15/24] powerpc/mm: Fix boot warning with hugepages and CONFIG_DEBUG_VIRTUAL
Date: Fri, 23 Aug 2024 10:00:37 -0400
Message-ID: <20240823140121.1974012-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240823140121.1974012-1-sashal@kernel.org>
References: <20240823140121.1974012-1-sashal@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.6
Content-Transfer-Encoding: 8bit

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit e7e846dc6c73fbc94ae8b4ec20d05627646416f2 ]

Booting with CONFIG_DEBUG_VIRTUAL leads to following warning when
passing hugepage reservation on command line:

  Kernel command line: hugepagesz=1g hugepages=1 hugepagesz=64m hugepages=1 hugepagesz=256m hugepages=1 noreboot
  HugeTLB: allocating 1 of page size 1.00 GiB failed.  Only allocated 0 hugepages.
  ------------[ cut here ]------------
  WARNING: CPU: 0 PID: 0 at arch/powerpc/include/asm/io.h:948 __alloc_bootmem_huge_page+0xd4/0x284
  Modules linked in:
  CPU: 0 PID: 0 Comm: swapper Not tainted 6.10.0-rc6-00396-g6b0e82791bd0-dirty #936
  Hardware name: MPC8544DS e500v2 0x80210030 MPC8544 DS
  NIP:  c1020240 LR: c10201d0 CTR: 00000000
  REGS: c13fdd30 TRAP: 0700   Not tainted  (6.10.0-rc6-00396-g6b0e82791bd0-dirty)
  MSR:  00021000 <CE,ME>  CR: 44084288  XER: 20000000

  GPR00: c10201d0 c13fde20 c130b560 e8000000 e8001000 00000000 00000000 c1420000
  GPR08: 00000000 00028001 00000000 00000004 44084282 01066ac0 c0eb7c9c efffe149
  GPR16: c0fc4228 0000005f ffffffff c0eb7d0c c0eb7cc0 c0eb7ce0 ffffffff 00000000
  GPR24: c1441cec efffe153 e8001000 c14240c0 00000000 c1441d64 00000000 e8000000
  NIP [c1020240] __alloc_bootmem_huge_page+0xd4/0x284
  LR [c10201d0] __alloc_bootmem_huge_page+0x64/0x284
  Call Trace:
  [c13fde20] [c10201d0] __alloc_bootmem_huge_page+0x64/0x284 (unreliable)
  [c13fde50] [c10207b8] hugetlb_hstate_alloc_pages+0x8c/0x3e8
  [c13fdeb0] [c1021384] hugepages_setup+0x240/0x2cc
  [c13fdef0] [c1000574] unknown_bootoption+0xfc/0x280
  [c13fdf30] [c0078904] parse_args+0x200/0x4c4
  [c13fdfa0] [c1000d9c] start_kernel+0x238/0x7d0
  [c13fdff0] [c0000434] set_ivor+0x12c/0x168
  Code: 554aa33e 7c042840 3ce0c142 80a7427c 5109a016 50caa016 7c9a2378 7fdcf378 4180000c 7c052040 41810160 7c095040 <0fe00000> 38c00000 40800108 3c60c0eb
  ---[ end trace 0000000000000000 ]---

This is due to virt_addr_valid() using high_memory before it is set.

high_memory is set in mem_init() using max_low_pfn, but max_low_pfn
is available long before, it is set in mem_topology_setup(). So just
like commit daa9ada2093e ("powerpc/mm: Fix boot crash with FLATMEM")
moved the setting of max_mapnr immediately after the call to
mem_topology_setup(), the same can be done for high_memory.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/62b69c4baad067093f39e7e60df0fe27a86b8d2a.1723100702.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/setup-common.c | 1 +
 arch/powerpc/mm/mem.c              | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 4bd2f87616baa..943430077375a 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -959,6 +959,7 @@ void __init setup_arch(char **cmdline_p)
 	mem_topology_setup();
 	/* Set max_mapnr before paging_init() */
 	set_max_mapnr(max_pfn);
+	high_memory = (void *)__va(max_low_pfn * PAGE_SIZE);
 
 	/*
 	 * Release secondary cpus out of their spinloops at 0x60 now that
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index d325217ab2012..da21cb018984e 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -290,8 +290,6 @@ void __init mem_init(void)
 	swiotlb_init(ppc_swiotlb_enable, ppc_swiotlb_flags);
 #endif
 
-	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
-
 	kasan_late_init();
 
 	memblock_free_all();
-- 
2.43.0


