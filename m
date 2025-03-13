Return-Path: <linuxppc-dev+bounces-6966-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E310DA5F689
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 14:52:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD87M4WrYz3c7j;
	Fri, 14 Mar 2025 00:51:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741873919;
	cv=none; b=VU5h295mpRc137tqLGS7wPJ7EkOHMbdSBTgj8pToGGAGTtGEuFvUnNx8I6kUuycsi9GKoF7cecjII//O+CTxMdknEXkF+kcqlaxmyHxXiiTB9q6Zxvfcv3iEcVSv456hzJwYFp8M1bbf6rNS9+TEdvMHICBvnOvU4rIPTNcWu4Zkt3TLj11iBeK9kYGstVqOXV4L0AIBFpve34ny43+TkMuFVzT/V4bj0SV2zRGEHZr6T8QWiGDKQi2NPGIUeSYUz71Ir0FxTUgfBYkFefOZJ4WmaZ61SZdNNUxavkntJVXvPuPdRgx6M4kO+WTFL/jJ18y3d3Us4/szl3db3dMiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741873919; c=relaxed/relaxed;
	bh=c9I7HQ2NavvKSYyx5OHuIDWo643x0RWPfhB92n3oSpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ay30Lx9pOF6mRYyDthH++gN2MiTaf6L4UXjijv754zI3Fa3bhC2UAjLZ1Yz9D8cO11XlZWabwRRAtTgmj35KrkD4g3DrljiaJE1D7pFrOCxRDMcZBvn1tVw3iw8yLG07eSkSn7lVh58/GhEvciqOUBYzsnqSi231xSy7AbyrAs7zlFb+s8AKziZUFNtkLP9TS2xSMtKpTG/KAlTrqcS1PJtAtG1f8323gT91dMK5VFo0x30rIjEhqtmNrVPExwnUJzekPlMkN0ZOmuCCsALKpHEu50o2FdiwMlAce1jWCfR3OBVR12E501yENC4MDekXDsA2ocIJ+btarYFGjwaYxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lkivtWoT; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lkivtWoT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD87L5zBwz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 00:51:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 468B45C108A;
	Thu, 13 Mar 2025 13:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D278CC4CEE5;
	Thu, 13 Mar 2025 13:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741873916;
	bh=vJ1t8jcOv4IahmAbojjG/hS3bRjZ1yhzZyXAgkQKcCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lkivtWoTeJzPisCwCmeZ9L2Fz06iBYCw7N7oUdPfSyVbKGHBQSJRQN557ej/tzus0
	 RT9LYZZKsZEuccc831bWhcS16iFVfInWEJvOyu28bZGwYqulYjyTkus9rBocPVvhz4
	 m8zeNcqioCGuPo109d5hVWHgDD9f18aJRE/THVHMZkClmOyxFtvaA5ad1Sbfx5UsQa
	 /mN176Bn7itUz9e8h5ICJhb2Pyd0QqADYzYHfdo8hw/y2vYpPI7xdW6pUdF2K5dqLP
	 rpEfF6BvQYYCTc7YKFjKCOY7th9g+KIym2sJYOE6kTLClyLAp0snpD940nJFfAVx96
	 iFppF0Okn7hYA==
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
Subject: [PATCH v2 07/13] s390: make setup_zero_pages() use memblock
Date: Thu, 13 Mar 2025 15:49:57 +0200
Message-ID: <20250313135003.836600-8-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250313135003.836600-1-rppt@kernel.org>
References: <20250313135003.836600-1-rppt@kernel.org>
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
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Allocating the zero pages from memblock is simpler because the memory is
already reserved.

This will also help with pulling out memblock_free_all() to the generic
code and reducing code duplication in arch::mem_init().

Acked-by: Heiko Carstens <hca@linux.ibm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/s390/mm/init.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index f2298f7a3f21..f8333feb6a7e 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -73,8 +73,6 @@ static void __init setup_zero_pages(void)
 {
 	unsigned long total_pages = memblock_estimated_nr_free_pages();
 	unsigned int order;
-	struct page *page;
-	int i;
 
 	/* Latest machines require a mapping granularity of 512KB */
 	order = 7;
@@ -83,16 +81,7 @@ static void __init setup_zero_pages(void)
 	while (order > 2 && (total_pages >> 10) < (1UL << order))
 		order--;
 
-	empty_zero_page = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
-	if (!empty_zero_page)
-		panic("Out of memory in setup_zero_pages");
-
-	page = virt_to_page((void *) empty_zero_page);
-	split_page(page, order);
-	for (i = 1 << order; i > 0; i--) {
-		mark_page_reserved(page);
-		page++;
-	}
+	empty_zero_page = (unsigned long)memblock_alloc_or_panic(PAGE_SIZE << order, PAGE_SIZE);
 
 	zero_page_mask = ((PAGE_SIZE << order) - 1) & PAGE_MASK;
 }
@@ -176,9 +165,10 @@ void __init mem_init(void)
 	pv_init();
 	kfence_split_mapping();
 
+	setup_zero_pages();	/* Setup zeroed pages. */
+
 	/* this will put all low memory onto the freelists */
 	memblock_free_all();
-	setup_zero_pages();	/* Setup zeroed pages. */
 }
 
 unsigned long memory_block_size_bytes(void)
-- 
2.47.2


