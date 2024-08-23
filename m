Return-Path: <linuxppc-dev+bounces-480-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BFA95DE93
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2024 16:53:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wrg1B5nHjz2y1W;
	Sun, 25 Aug 2024 00:53:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:40e1:4800::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724421960;
	cv=none; b=IStKv14s2t3j/CAGPewAxSJ/BhfHH+7FzrX/a1Lu2SpUDzRgf2KefUxv+fOwu6BepV9S9dqUAuIY5HE95G6SH9uIX2JLDAsKJFrRbgsOZMnXVol/D4Ru6fADBD/eyzHloP+P8IjWvvBxqh1xrwdd/LLDYdh5pN7UWbKtVBsd43hxppffNZXy9d7g5JpAaEUMncjCaf4anCY3ci2PtHjHSmQRKKPcSO93ZyHJQ/nbII8dj4sNtz0BEGlV2I6iPC0a9i6RcgJ1L5A4lThUvXp4i1bIWn4qCKn7jZtrIzbvJFhTddNBy8EcnObCFeYANkWbFJ5gETymSTQ80j7eR/Ycqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724421960; c=relaxed/relaxed;
	bh=iM6Drz3q8LoAJ+UhJEJxkTKKByloIQ2M7b8yTj2oiDU=;
	h=Received:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:X-stable:
	 X-Patchwork-Hint:X-stable-base:Content-Transfer-Encoding; b=b3roNFORO3FAtsE6rp99T4ioU+Q6nry0fgXj2mgcmEusgwvbejc3I0FTMDNQYTSdI5tTCIb6ClI94YR08yyHEUzNYZH6MzC9B4iKk+BdfQh3c8Af7Tr+sM+gTGFglMDAFeNVBOQLsDxdBfBT+2wQAqR9woH7KCWRnm1q56HH5/F4KQdi1vmFEXRD+aKiYrCMZzQfczB6kpkaFiBMxXeWcJsUjzlHoA+l3+MrKOky2VF/tk8tzvc9xIGrCzU3LodvYqm5imp9aUNqYhATrEzYx9ekehZASsjC2GxBwlRAW1a+Kjms7vEX58pcgrj3lMZDvVyXiI/T3/FFSk44TgOlug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mI3KpkBI; dkim-atps=neutral; spf=pass (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mI3KpkBI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr20m1kf2z2yGD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 00:06:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4A0FCCE10B3;
	Fri, 23 Aug 2024 14:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC47C4AF0E;
	Fri, 23 Aug 2024 14:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724421957;
	bh=3ipNgFXEv1Z6dXG1UQRzbPPBalOv+YVRIzEMNJpi51Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mI3KpkBIeS6nHzQa7C3tigVKgvU1qAo+LmFiEZroQhcIvCKxBn0L/Uz8ZyWZuEpix
	 LIDAJb1sHqz1O0nCUYFu3wArGmCSjDgbsopX6dSaBWVyHk6y+gyg2eHgVoGJkwKx1H
	 Euf34MJsk0MFPw1IiP0UdbE9+JgtzdaHT8RqHwhaXFsWK0LMUroASCEBYUrrPrQC5J
	 QS4NuyeG8veoemmFTZhejWCmk2Wgmz0HUcptkowwiZ//FAtQeJWJ3ZSSxUHMR3vq9m
	 9eYKu3+fHcA8HX4pq55NSEgKJDG58xZsNsbGUw2AVVPX5svUJ98TCmfqb/CdEfNzyo
	 qghHO5DaeinIA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sasha Levin <sashal@kernel.org>,
	hbathini@linux.ibm.com,
	thorsten.blum@toblux.com,
	gregkh@linuxfoundation.org,
	bhe@redhat.com,
	arnd@arndb.de,
	mcgrof@kernel.org,
	tzimmermann@suse.de,
	kent.overstreet@linux.dev,
	rppt@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 5.10 5/9] powerpc/mm: Fix boot warning with hugepages and CONFIG_DEBUG_VIRTUAL
Date: Fri, 23 Aug 2024 10:05:25 -0400
Message-ID: <20240823140541.1975737-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240823140541.1975737-1-sashal@kernel.org>
References: <20240823140541.1975737-1-sashal@kernel.org>
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
X-stable-base: Linux 5.10.224
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
index 1e417c3eedfef..b99b35ba2412d 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -908,6 +908,7 @@ void __init setup_arch(char **cmdline_p)
 	mem_topology_setup();
 	/* Set max_mapnr before paging_init() */
 	set_max_mapnr(max_pfn);
+	high_memory = (void *)__va(max_low_pfn * PAGE_SIZE);
 
 	/*
 	 * Release secondary cpus out of their spinloops at 0x60 now that
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 08e3422eb7926..cd6a68a64d87c 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -292,8 +292,6 @@ void __init mem_init(void)
 		swiotlb_init(0);
 #endif
 
-	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
-
 	kasan_late_init();
 
 	memblock_free_all();
-- 
2.43.0


