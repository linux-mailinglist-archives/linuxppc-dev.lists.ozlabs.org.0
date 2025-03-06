Return-Path: <linuxppc-dev+bounces-6776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD75A555A5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 19:53:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7z8J3B21z3cBx;
	Fri,  7 Mar 2025 05:53:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741287200;
	cv=none; b=fzWMz1rrlXGevsrZ5vsqV2oaBI7MblxtSt4gr8LCtVAcaZwM6rNRNUJXy7a0ZChheMG9lgao5y+w30Ogefb0IM3WOFzT0GFqkdGc/3aRjRu03uPeG2HsOZdhbKeD4EzpmyJa6zhuCBrRQo1rODiifiacuQ+NXxcxTb+SAzYbTxnUXK+Kn5ZeZ3t5byxrardA2/oJyVucPoR+/KBr2+Q29Ssd5todLd6ghwgcbE93PwbNO2g0MkL2QcZSvQjEZ+Bbk3OIjWa8nwWatrSePdEIfQPAl7KPAHy7Ms5GFV9zYm0oX5jBUEe6Z5Y4AcLR+Aq3Gu8r0zxax7cVt+bYeIft8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741287200; c=relaxed/relaxed;
	bh=cjjeOY4XBjuFiJaanm3Vhggpqwt0qk0uWA9+wvm49V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XlNg0i2e5pq2ghYPfAmQ6iTLeW5P2wxJ3FlAngp7M0/keHjiSyXFNrfrkge+H05HcSnKlemFzUVuRCvmsilnhqg2Hk4b8YyG5yMPFLJIT5p4uZp6Gaw3gxW6M3GTFcprR9Bp1CKTZ+0mo1frOTZ5dmw4iZuulCzSgA/coSezzChFj/mrvYTUWH/AmOANA59Eq9ST/M2gmfSrOeIRRKmKHHQkIX9cAV8aBfx+HZK6L1XMeKfpH9MVvjdPPVJ1zoEFdImTzrHzf6t/NxrOUpAdcQ3R0DhLiiIfwyinqJ0MHzapulqMRWorPJZI5OrKMhBtnQijkmOpkAa9kQmxZd12lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H78DLSl+; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H78DLSl+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7z8H4Gymz3c81
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 05:53:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0F5CA44F0F;
	Thu,  6 Mar 2025 18:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8163DC4CEE8;
	Thu,  6 Mar 2025 18:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741287197;
	bh=BkE0IFJXSKU77+xC0N2TBlUULdAjqoteouUfp8/gZ9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H78DLSl+IjdnXrOdxgT+/xt6JTBU4euW24C/yDa5I+IadYyC+HEIKf8v9/STSql0w
	 8Ci9p73t1w+Xz+YHbbWW0NqRvPAsTTGgkup9RJxFt3IWYCiwU8KzktKs78WPfgstEp
	 r3TBxtlGs5W73C+QSyCEERn1fqDTHnrNMca8jScShJM1AOJsNrVThziirlU9DWuCQI
	 NxI/6QapAZIvA0iPZvBo0oljP9L1r5qcoH4ZPCXNbth214GQA4i6M5RW8Tday7NHzb
	 PgoPccIN87hXyD3eA9w781HCQ9lk9kdOFTozIS7Gy/SywY4wv8FVfsBzQ613ahQ7F+
	 9OZnlgrDMKwRQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
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
Subject: [PATCH 07/13] s390: make setup_zero_pages() use memblock
Date: Thu,  6 Mar 2025 20:51:17 +0200
Message-ID: <20250306185124.3147510-8-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250306185124.3147510-1-rppt@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
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
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Allocating the zero pages from memblock is simpler because the memory is
already reserved.

This will also help with pulling out memblock_free_all() to the generic
code and reducing code duplication in arch::mem_init().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/s390/mm/init.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index f2298f7a3f21..020aa2f78d01 100644
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
@@ -83,17 +81,10 @@ static void __init setup_zero_pages(void)
 	while (order > 2 && (total_pages >> 10) < (1UL << order))
 		order--;
 
-	empty_zero_page = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
+	empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
 	if (!empty_zero_page)
 		panic("Out of memory in setup_zero_pages");
 
-	page = virt_to_page((void *) empty_zero_page);
-	split_page(page, order);
-	for (i = 1 << order; i > 0; i--) {
-		mark_page_reserved(page);
-		page++;
-	}
-
 	zero_page_mask = ((PAGE_SIZE << order) - 1) & PAGE_MASK;
 }
 
@@ -176,9 +167,10 @@ void __init mem_init(void)
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


