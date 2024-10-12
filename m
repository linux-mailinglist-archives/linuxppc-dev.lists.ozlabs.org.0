Return-Path: <linuxppc-dev+bounces-2149-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8705499B37D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 13:27:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQh7F3GyYz2yMk;
	Sat, 12 Oct 2024 22:27:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728732473;
	cv=none; b=MRkDmhkDrHv4kzrJcJa6Wc60XrVxpdgrr4qKUR0lqcrELW19Kn42QD2DyXsA0+0z+j04qy/YcXteip9Zi4PMZmPcQ5a+RJEO3Ez45uYh3o5RSoUWvMlenot7RbRlPV/0DUaptsn8qMcs3SpTK8Jk7fWzglfNuCL6rnUFQPf2G8QoGNPwQxfYLQxEpF3sjjy0dHoxJcsbeUVcPdC25Z6jugKFNh4id80MmatKR5rj1oD4jEfT9QxC4SBKsDLgLDgbmMEm8vRMGSv0/+HZW3s9yKybkLMpD8paOk+izd4kH1+BasW/Fb8Wa6Te5xaACgo7GfyyWMtmvnwCK8jfd05cDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728732473; c=relaxed/relaxed;
	bh=xTzVSI839AyH5SaDHizehgMouNRyS5B7xpiKr2jzx20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2W7VfpVr85V6gjdPJzKh/km+JDC+kUtBm7/L3tmNZPbB82MAuzXvMsvqd1kkbt2WTak0cW6wozdncx5VafM7gn73b8eLic57/jrzZ/Zi30tJM1qTwNOfe+86Hv9739SC8nMMreRd0FCGQfnZz25bkqd48cAcE5JPaRK0JTgHQy/Le7Tpz8goTlM6e0Ft56W9HC2v53DQ0357NrPAbLqVI14l+pDa+KCYO/L49Aioi1gDhtMQCrhi/T9ptgb0BHHLc+GWTicVewyhiBD/4/t6EO9VGC+naXIl8TbNOG1qSuFcYGk01wQwbP2vn2UrXCK0HZy397NcKu4rjRsvYMhdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lj68/Uws; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lj68/Uws;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQh7D329vz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 22:27:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0D9F5C0439;
	Sat, 12 Oct 2024 11:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0D7C4CECF;
	Sat, 12 Oct 2024 11:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728732469;
	bh=Pf5doyZj52sYU4ZkPBSvPV+8vO0qg1sLFS+ArTntM9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lj68/UwsSZDJ9vX7KkuqqeZBYsGEpNtdMv4ZF2IcdQA8fv15UrYKURuRqDRdk2Uky
	 1h/TTxy/wJKGOFXE18zk/e9NntiWX1xcv4URDe6oAvdLB5xDbiW+tArfN4Rq8EjzUy
	 0JzVA20kHTAqXtKlAbp3tByvzM/ubvG6Aeg15pRqrWPdv5TEb4vaeyI+MYWhZSA0Nc
	 4lhj8f//p1aqSlkW75CNEilTxuuWYqsCDaEQDrbkfugqsNTOScOMOsR/fB4bUIowTV
	 wrEUxCUQbgts4pWgzfHBVfgJuPLsX7NisWPFjTLxNteuC/v6sHjRTyFyVdKs1PjIN5
	 Iye4RPS/vfR0Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sasha Levin <sashal@kernel.org>,
	hbathini@linux.ibm.com,
	arnd@arndb.de,
	robh@kernel.org,
	thorsten.blum@toblux.com,
	bhe@redhat.com,
	rppt@kernel.org,
	mcgrof@kernel.org,
	tzimmermann@suse.de,
	kent.overstreet@linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.6 14/20] powerpc/mm: Fix boot warning with hugepages and CONFIG_DEBUG_VIRTUAL
Date: Sat, 12 Oct 2024 07:26:46 -0400
Message-ID: <20241012112715.1763241-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241012112715.1763241-1-sashal@kernel.org>
References: <20241012112715.1763241-1-sashal@kernel.org>
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
X-stable-base: Linux 6.6.56
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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


