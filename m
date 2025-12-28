Return-Path: <linuxppc-dev+bounces-15046-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B469CCE4C57
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Dec 2025 13:41:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfJr35Pbmz2yKn;
	Sun, 28 Dec 2025 23:41:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766925683;
	cv=none; b=RnhzNtfjFMkbPPwQ7qEa4BleMhJm4/qmYtytIvMvrT/KDij4oqX8KTrKP1HtcQa+iMCpmtjjXU5k+UU1OENxq7oEEjQ+9AaPvGcvFZfCShR8Rm6OF5zHApn59WYJFtQQ4bz15cgLsNcskiCS2FTHazH13hxhrroBqpXraj6kTzjhkSpJm2q6+PwdW3sINf8PhYuoiqBUzPrXk8H1eTvBAjMolK/Nz6aAcwPpFIdE71UD/mJjBK++3ywOWPRNzhLTjG4P2Xr1S6i3a7K8tTWg0tnrfXgfIksAt9z10PWaGQqRCi5PYSAFtpVJ+inbiDa80g44qIVBouLwhLJr//+6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766925683; c=relaxed/relaxed;
	bh=m5gBzVEKGZBYJG6a1xNcNq9/H+kuM96Zeopb+7R3cQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jGVtm+/PIQzESr+scN/DN0xOUYRF7ZY7pjPIZ5LeAimEjL/V1qmNCS4ODcMH3yFO/M/g/Y8zNEHgYAJGbIpOIm+Q/2i5j/2gZdFk2/gtWx40SBYDdwCKHqJ3lgQ2369hTcRDc9jix+Igf+TdmUsp118iPozhs3GFCi0MDPoV+hd7D8FrlLy2TPi34yU/q7XzfkVuCa5Br56hOwyAuXKWF8kece7qR+ZDJYKYpiV0nDUxR4ldPH0FEOHrd/nOIAEg8mIxDRE8775Bc6wVNHaJgmLFX09usof5k32kalTAFlyfEoCoWs8geCMEIMHQGDosfAI3pt8kWhvj4t+Xeqbj8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LhVU7m6a; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LhVU7m6a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfJr30rM5z2xJT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Dec 2025 23:41:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D0454098F;
	Sun, 28 Dec 2025 12:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAFFC4CEFB;
	Sun, 28 Dec 2025 12:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766925651;
	bh=2qjSzGfqzjt078/1pNLigg8dFf1Az5AvC+tppJFEDck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LhVU7m6aMNTawbMgUYHYAGWf8tGvLDWJQnrYR9M9iZEDtX9rUa6AkiSPgLsKGpHEu
	 yqhg7rauWEgFfzeSjajMBB35m0wYexkotTqL86Fr8KzxxLKjSPwpwTRy6/ZU+JswRx
	 w9CA4wIctpL+HLRH8FdDCR/Zi/H28EoHxdzHxR/0KwaQ3XnPArjAXjmL6/E3kX3KCA
	 hRlv0cjWbs2iPZsWPWQkiY1piHErzRLSCgcfsrlIPlkZiX+FNt7Y9rx+tUYQd81TYz
	 ZDGhdTCcXHwVcM7pnnpQz7HoCD2XoFV9cVUbPQqPJaOgkDuhJ6/H1rQE7Q5NtaHsre
	 Dfp85vgM1xv/A==
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
Subject: [PATCH 02/28] arc: introduce arch_zone_limits_init()
Date: Sun, 28 Dec 2025 14:39:32 +0200
Message-ID: <20251228124001.3624742-3-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251228124001.3624742-1-rppt@kernel.org>
References: <20251228124001.3624742-1-rppt@kernel.org>
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

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/arc/mm/init.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index a73cc94f806e..ff7974d38011 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -75,6 +75,25 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 		base, TO_MB(size), !in_use ? "Not used":"");
 }
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfn)
+{
+	/*----------------- node/zones setup --------------------------*/
+	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
+
+#ifdef CONFIG_HIGHMEM
+	/*
+	 * max_high_pfn should be ok here for both HIGHMEM and HIGHMEM+PAE.
+	 * For HIGHMEM without PAE max_high_pfn should be less than
+	 * min_low_pfn to guarantee that these two regions don't overlap.
+	 * For PAE case highmem is greater than lowmem, so it is natural
+	 * to use max_high_pfn.
+	 *
+	 * In both cases, holes should be handled by pfn_valid().
+	 */
+	max_zone_pfn[ZONE_HIGHMEM] = max_high_pfn;
+#endif
+}
+
 /*
  * First memory setup routine called from setup_arch()
  * 1. setup swapper's mm @init_mm
@@ -122,9 +141,6 @@ void __init setup_arch_memory(void)
 
 	memblock_dump_all();
 
-	/*----------------- node/zones setup --------------------------*/
-	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
-
 #ifdef CONFIG_HIGHMEM
 	/*
 	 * On ARC (w/o PAE) HIGHMEM addresses are actually smaller (0 based)
@@ -139,21 +155,11 @@ void __init setup_arch_memory(void)
 	min_high_pfn = PFN_DOWN(high_mem_start);
 	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);
 
-	/*
-	 * max_high_pfn should be ok here for both HIGHMEM and HIGHMEM+PAE.
-	 * For HIGHMEM without PAE max_high_pfn should be less than
-	 * min_low_pfn to guarantee that these two regions don't overlap.
-	 * For PAE case highmem is greater than lowmem, so it is natural
-	 * to use max_high_pfn.
-	 *
-	 * In both cases, holes should be handled by pfn_valid().
-	 */
-	max_zone_pfn[ZONE_HIGHMEM] = max_high_pfn;
-
 	arch_pfn_offset = min(min_low_pfn, min_high_pfn);
 	kmap_init();
 #endif /* CONFIG_HIGHMEM */
 
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 }
 
-- 
2.51.0


