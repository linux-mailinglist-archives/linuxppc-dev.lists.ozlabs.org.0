Return-Path: <linuxppc-dev+bounces-6963-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD99A5F66F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 14:51:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD86c0FKDz3c8G;
	Fri, 14 Mar 2025 00:51:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741873879;
	cv=none; b=gupM+KG8pJFeUZaCOj6UyO7zvmtmODOitq48UjJErQKgYBcVN3QA0jd8itu6lipW/fTVgJxrfet+t5dlYD9wqv4kSae3mRUDm3dsUT5Ixyy3c+sI/MuaV0kORbul+tjfNHnSH8nGxthNncysaX5xvEvBQXjPa8PKHCNPrmrEkSQ2eoP35AxxAYzzcw6AW1L5mJeBF6Dk44BbGbIbiJquzyej/4v41k+AUH0z9qILYoOVqw3RHxEM11w9GXem0XBSJgSdFB003xYhTwsoQ7bX4UP1WbD+L4bMc8mNjPMSnZZwUPbLNfoeq7zd3+4kd6hqML9xXyJ2VnhTXI838yUBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741873879; c=relaxed/relaxed;
	bh=f/Tjv7nZ1RGU38sSJe49qG5HH8eeGxe0gmVd2kGHllo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQPPcqooY/Tj0gNKF8JRjmA8t1y/+0vLev76cwwnIRciSfNkl/ir3itIgA0WuVkyn6J1x+GF9rOEyKHEx03NUlVHe5oGYG1IeMTN4uJl592/EHd5WUeZajEHxGBi1uMekAdOV/goQQUWiDj0TnoQkEiGVN862VXOdWvhTfNt/JnIc6R74ZS8GZMEp1FibAri27bdr3pHxRotOgvJ8AYr14Q5lDupLXvAXerlvP+yZ1GRSsCgc6wGxzPC2Av6H+dJeB9A1YU4f+o2yij3WwBs5k6ciWlz3c872RlKuzrp46As3pr+fVlLMaLMBknSHZ5GtG0XA5GeJHYwvIKn4V6K6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DUZeqivF; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DUZeqivF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD86b1CyKz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 00:51:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ECF71A474BF;
	Thu, 13 Mar 2025 13:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA2EC4CEF2;
	Thu, 13 Mar 2025 13:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741873876;
	bh=nkBe6+9DINra8ChNyXeYcesTu6mPwjeTN1yq3Y1szbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DUZeqivFJ9EYP9Zy5Yb5dJalUE7Sb9X9atTVUnHZ/8j5kxTnIcryI91Lg+eLahCch
	 +4/sfT0f6PJUfGIy2IFanNG6A/SLgSjazaFTA527QDMKz4pRayRywROhwmKdm3JxlH
	 Uaj0ch2Iv70h6kezQtFA/9UBiPtXqykcVjOMdYtmACBIyWki5ZD6vyT7Dwybtv0ic7
	 n9LWmVF+6qTkSWN3/DV0+azu4ZrNZg6SffekFyWnjGKFnrFNUttXXpQq00r7GYSixQ
	 2oLgogEMVsNX2bHppECFrGmjyvZM4fH0hNySDtDwvQnL1mRuqs8UADBKrepv0pyUKk
	 bQ1hkzIwD6VDQ==
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
Subject: [PATCH v2 04/13] MIPS: consolidate mem_init() for NUMA machines
Date: Thu, 13 Mar 2025 15:49:54 +0200
Message-ID: <20250313135003.836600-5-rppt@kernel.org>
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
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Both MIPS systems that support numa (loongsoon3 and sgi-ip27) have
identical mem_init() for NUMA case.

Move that into arch/mips/mm/init.c and drop duplicate per-machine
definitions.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/mips/loongson64/numa.c      | 7 -------
 arch/mips/mm/init.c              | 7 +++++++
 arch/mips/sgi-ip27/ip27-memory.c | 9 ---------
 3 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index 8388400d052f..95d5f553ce19 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -164,13 +164,6 @@ void __init paging_init(void)
 	free_area_init(zones_size);
 }
 
-void __init mem_init(void)
-{
-	high_memory = (void *) __va(get_num_physpages() << PAGE_SHIFT);
-	memblock_free_all();
-	setup_zero_pages();	/* This comes from node 0 */
-}
-
 /* All PCI device belongs to logical Node-0 */
 int pcibus_to_node(struct pci_bus *bus)
 {
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 4583d1a2a73e..3db6082c611e 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -482,6 +482,13 @@ void __init mem_init(void)
 				0x80000000 - 4, KCORE_TEXT);
 #endif
 }
+#else  /* CONFIG_NUMA */
+void __init mem_init(void)
+{
+	high_memory = (void *) __va(get_num_physpages() << PAGE_SHIFT);
+	memblock_free_all();
+	setup_zero_pages();	/* This comes from node 0 */
+}
 #endif /* !CONFIG_NUMA */
 
 void free_init_pages(const char *what, unsigned long begin, unsigned long end)
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index 1963313f55d8..2b3e46e2e607 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -406,8 +406,6 @@ void __init prom_meminit(void)
 	}
 }
 
-extern void setup_zero_pages(void);
-
 void __init paging_init(void)
 {
 	unsigned long zones_size[MAX_NR_ZONES] = {0, };
@@ -416,10 +414,3 @@ void __init paging_init(void)
 	zones_size[ZONE_NORMAL] = max_low_pfn;
 	free_area_init(zones_size);
 }
-
-void __init mem_init(void)
-{
-	high_memory = (void *) __va(get_num_physpages() << PAGE_SHIFT);
-	memblock_free_all();
-	setup_zero_pages();	/* This comes from node 0 */
-}
-- 
2.47.2


