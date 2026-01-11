Return-Path: <linuxppc-dev+bounces-15498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F13D0E303
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jan 2026 09:23:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dppRh4qksz2yds;
	Sun, 11 Jan 2026 19:23:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768119792;
	cv=none; b=W92pcs0VsgK8S67jyRiTJlMq0FpDwrgcKk2DNfYie3QiZsmOiZv71qGF2dRLKhh3hT6lXCE46h+COLvi8bbRxNAn3eYhzh0+gc14xY6tUhmqonshM7qVV0VIdwLhDSE1l/VQrC7SGi1RyknvRoeKQDdxqrPmdDh+Qfpy5uuRY0hqGqhJIa21Yth02sflGIW5bLxGjm0Qtmc4VkvvxDUBxxj4MdzQGaawPbftkik7jCQJJ3TDSImcARrnwQeo1lRDO0WTWRxuMr1ZT7D6dlJlJd569Qv4U5t85AkWwmhREwdq1vdJuUMjTo7y0W7pU2I6hXJlSUOOANcg+NUF8cqPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768119792; c=relaxed/relaxed;
	bh=pXj0Z2NgAtnlunEa9AvDDLLh6y0q3hS/njeAcboUK1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4V6Nvb5p62uHuVqO5vM26X1tUTbJOK3xiCyUwHpAW+/30xs5GOR4SBEjWTLT2MsCOszQEgo2CQioyqQEbouJ+GZDejbgG1cTCxKdt4ukw1zqtn3Mr0gB6pxvKCAiSAxWPld1u1KsobemXH7DUQL6U9XtCNpEFXJumdEBP7m6lE4JUCEEc/ulvUknf5vHOZLPVhDoVweViXg2P7X9HDAaQtfCyG7z3Msvj8WJ5y+2mrPVlJWM6QPf7WE2iSHYoDVEtFec7wsYX7HhfowsDHK1UUIKQzGVOoFeQ3E5nbd5qDmLvIYvCa5+Xs4fUV0mm7b9AYcV470N5lbznhRN+tvDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lw1lU3Ew; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lw1lU3Ew;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dppRg5hPNz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jan 2026 19:23:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5E5D60129;
	Sun, 11 Jan 2026 08:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA77CC16AAE;
	Sun, 11 Jan 2026 08:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768119759;
	bh=djQarGwsnsMGImsgSQVJ5sD5jo+ZigjiDeQZakHIJZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lw1lU3Ewc+dtv3vDYJfQvcR3SFOO3fNdQZbUcukOU8uBYk43EPjoMNLHvS+ZVTXFY
	 kFiAwsUS0cL97IqVcj9lfrxTQhOT2vwhsvZsYZ978UiUZIG/ymSeKzXUMCvGav2t3T
	 vM5MZTJCCtREKdgx/Ctorld3QmD4G38UlxAV/FKOUGToSqJ9W/z041Qg3ZqaKRg0C6
	 0pqyd0jXlvxFbMeJVINiPfxlP57E5VlMoy0DwyzLHcSHXAWp+XP+b3aDLtpYYqQcns
	 gv9MGzAi0TPrvCroxyxabPW1rlLFsb8P84S1OTpkxsCAf7ZizWZpxO+8YyP01fxPJX
	 jR8BRtnoVff+g==
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
	Klara Modin <klarasmodin@gmail.com>,
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
	Ritesh Harjani <ritesh.list@gmail.com>,
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
Subject: [PATCH v3 05/29] arm64: introduce arch_zone_limits_init()
Date: Sun, 11 Jan 2026 10:20:39 +0200
Message-ID: <20260111082105.290734-6-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111082105.290734-1-rppt@kernel.org>
References: <20260111082105.290734-1-rppt@kernel.org>
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

Move calculations of zone limits to a dedicated arch_zone_limits_init()
function.

Later MM core will use this function as an architecture specific callback
during nodes and zones initialization and thus there won't be a need to
call free_area_init() from every architecture.

While on it rename zone_sizes_init() to dma_limits_init() to better
reflect what that function does.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/arm64/mm/init.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 524d34a0e921..06815d34cc11 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -118,7 +118,21 @@ static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
 	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;
 }
 
-static void __init zone_sizes_init(void)
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+	phys_addr_t __maybe_unused dma32_phys_limit =
+		max_zone_phys(DMA_BIT_MASK(32));
+
+#ifdef CONFIG_ZONE_DMA
+	max_zone_pfns[ZONE_DMA] = PFN_DOWN(max_zone_phys(zone_dma_limit));
+#endif
+#ifdef CONFIG_ZONE_DMA32
+	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(dma32_phys_limit);
+#endif
+	max_zone_pfns[ZONE_NORMAL] = max_pfn;
+}
+
+static void __init dma_limits_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
 	phys_addr_t __maybe_unused acpi_zone_dma_limit;
@@ -139,17 +153,15 @@ static void __init zone_sizes_init(void)
 	if (memblock_start_of_DRAM() < U32_MAX)
 		zone_dma_limit = min(zone_dma_limit, U32_MAX);
 	arm64_dma_phys_limit = max_zone_phys(zone_dma_limit);
-	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
 #endif
 #ifdef CONFIG_ZONE_DMA32
-	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(dma32_phys_limit);
 	if (!arm64_dma_phys_limit)
 		arm64_dma_phys_limit = dma32_phys_limit;
 #endif
 	if (!arm64_dma_phys_limit)
 		arm64_dma_phys_limit = PHYS_MASK + 1;
-	max_zone_pfns[ZONE_NORMAL] = max_pfn;
 
+	arch_zone_limits_init(max_zone_pfns);
 	free_area_init(max_zone_pfns);
 }
 
@@ -319,7 +331,7 @@ void __init bootmem_init(void)
 	 * done after the fixed reservations
 	 */
 	sparse_init();
-	zone_sizes_init();
+	dma_limits_init();
 
 	/*
 	 * Reserve the CMA area after arm64_dma_phys_limit was initialised.
-- 
2.51.0


