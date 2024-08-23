Return-Path: <linuxppc-dev+bounces-481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EF495DE94
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2024 16:53:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wrg1Q1VQjz2y06;
	Sun, 25 Aug 2024 00:53:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724422305;
	cv=none; b=aJ6MYmPw+5Sx6OkSts69OdjSP9MA8z7tDP4mOLd2jc6NsHvbc8YRg37mfkLpIhvwFazEPOUGmw7ciFD3lGgD10rTCk1Y5kd04oyjz7Gtra3SR+AGWha0ZwckSe3M6g3IHU5eOV9XuGRHtaPaRySdfpcS5RBUXcwncxVTZFLqIBJhE3d8cXnS7qUIMS8aorsTSZas5gYVZJiI/8pg4GoQD5flwY/kicLMc2f6qrnzTiCtEQx49JVdQKnO0EfzagUZ2xDejJQKET8KiwlVIGKLtX8To9632GCkUcF8ZJOK6comswUE1hK/5yyz4b/r64Q36xwXigW0uDOa4cel6igFyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724422305; c=relaxed/relaxed;
	bh=xTzVSI839AyH5SaDHizehgMouNRyS5B7xpiKr2jzx20=;
	h=X-Greylist:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-stable:X-Patchwork-Hint:X-stable-base:Content-Transfer-Encoding;
	b=Zbz/VJJw2bktHk/WKVxvdGCFLGrfywmmXtphygsJF3aDHUKGzRUNlsv5lSDRY0+S5LVQy07oRLsrL70G315EInP8kNFQXMpZmuEAx+RZzTulXWADUVhdFIleEAMtIDfloa2Vax/d4yJTwo7dMoP/+EUVKMRTaYHpdniJVZ5MlUEhQgDgMQSkw/QO28BXYH8owyS0bl0ZwHjeSjugvmtIh9Wsrxa/oN8CBvDQ43FBzLdwwVAG15daWiZ5c1cd03L94kXnMARsGZCK2c4LcIeYsc4bxyEvPKgO1FPNqHA0gepv3dCElDLVPte2vpg/6iqbUPk8ded/2mJpJqYIapyqvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VCdMj/+d; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VCdMj/+d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 472 seconds by postgrey-1.37 at boromir; Sat, 24 Aug 2024 00:11:45 AEST
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr27P2K4wz2ynj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 00:11:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BF253A40435;
	Fri, 23 Aug 2024 14:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CB2C4AF09;
	Fri, 23 Aug 2024 14:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724421828;
	bh=Pf5doyZj52sYU4ZkPBSvPV+8vO0qg1sLFS+ArTntM9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VCdMj/+dpinNjVQRIjaF8ETG5e28uQsJj1yLZQbZC10aXoBNzKa7Tmji4ayvbiEZn
	 JFwig4yCBefVY4aIhfEgtkTjVxGt0pg3L/kp/RBIWLIbDS8tzhfh0NoqyUuR/ncHbm
	 kge0U6Gd5nsEiGEmjm9ZBWlTzgdEmiyJ55abf14hNCFJR8GS9qdC3c9zP51tkicNKz
	 gAJ4kxpdhJwjpAqQZBqsNcjx/0yCA7M4NXdwtBogudeAxhUUxa8j4yf0II9AlsKb1a
	 TYvnhDO8D3d9CCE86CVU6cPZe1GXxLwgWBID129bFv8rEVz88H//7XBfx15q47L9eb
	 o4zDg4t0+hFGg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sasha Levin <sashal@kernel.org>,
	hbathini@linux.ibm.com,
	thorsten.blum@toblux.com,
	rostedt@goodmis.org,
	bhe@redhat.com,
	arnd@arndb.de,
	philmd@linaro.org,
	rppt@kernel.org,
	kent.overstreet@linux.dev,
	tzimmermann@suse.de,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.6 14/20] powerpc/mm: Fix boot warning with hugepages and CONFIG_DEBUG_VIRTUAL
Date: Fri, 23 Aug 2024 10:02:28 -0400
Message-ID: <20240823140309.1974696-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240823140309.1974696-1-sashal@kernel.org>
References: <20240823140309.1974696-1-sashal@kernel.org>
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
X-stable-base: Linux 6.6.47
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
index 20f72cd1d8138..03eaad5949f14 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -950,6 +950,7 @@ void __init setup_arch(char **cmdline_p)
 	mem_topology_setup();
 	/* Set max_mapnr before paging_init() */
 	set_max_mapnr(max_pfn);
+	high_memory = (void *)__va(max_low_pfn * PAGE_SIZE);
 
 	/*
 	 * Release secondary cpus out of their spinloops at 0x60 now that
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 07e8f4f1e07f8..9dbef559af4cb 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -287,8 +287,6 @@ void __init mem_init(void)
 	swiotlb_init(ppc_swiotlb_enable, ppc_swiotlb_flags);
 #endif
 
-	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
-
 	kasan_late_init();
 
 	memblock_free_all();
-- 
2.43.0


