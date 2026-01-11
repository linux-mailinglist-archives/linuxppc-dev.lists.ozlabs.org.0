Return-Path: <linuxppc-dev+bounces-15512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CACD0E462
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jan 2026 09:26:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dppWl5YmRz2ytx;
	Sun, 11 Jan 2026 19:26:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768120003;
	cv=none; b=hJg1T6770nhAw6+p8mburqSOa1jBsKHFXAChvDnc47vA9zXWt5Xdm3cUlmvcskpsnnW9g+nPEBR4TUCrpHyJj+xwSfF9MAK8D3SaBuXNFW2xvI0q7/bYb1kDClDF1Okk14KnuibOla0KhVKJMAFx1ToLgVejlVyfQhV8JmXMrjSrsyfoLbvt+zWeMsJeLTSb7Lt/nFYcJKq70ypglkAGZsQBwQHsKy008Gu32NNGaAIhjgnYsy4OZVG8KPexz8PAQwDIJExjFCe8JhONQjowh7TttGthiARk9XL+l9QQGP3+E6p3XstNBaZUaKVMekBzrCdIts6ISS+7RrCdGWsZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768120003; c=relaxed/relaxed;
	bh=XCeW4b5bx6EOK5QjFUW3uRjrRx8sG0IrVuSe7S4JU8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PbRqQ0LWWD8OPtdtNpdnyYQcAZiCCk7+pGpN+pIUWv97R6XpK9K1yIDqBp7iZhLKGOsBVnaB2nAJPpTZIAwelcE9/IXQDaQmPSgUtzIZm1KrhscZfv+9RHrxdV0jZJLksI485YEa9UN3AkmtLmtAOI+3s7M+PA0v19E1ikNE5vjQRDgewqDZvqki5WsPZBGEWXt5JJjyf+hFR2wFkgTEOAAcXFIyFlvjv5nyJntlR3m7YSTWBQV+wy/ZElmAPM7i9NF8Q0f/Vkn1KSkQbCDeSFcORpqXRddwXfwLIUhxGkQcDCyKQYqDBo1AD9LJEdIuo1GK3xUeYCaOyWXqW3Psww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FCgoY/zC; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FCgoY/zC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dppWk74pSz2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jan 2026 19:26:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B90743473;
	Sun, 11 Jan 2026 08:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7D0C4CEF7;
	Sun, 11 Jan 2026 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768119971;
	bh=oB6QCqWGlUcVzO7N8KoxEGaOaNJpg/wuZYHeNsCpdgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FCgoY/zClmOALMEzX+QGECEEPV7T3L6P2l9SJuYtZBPLJ0TU7r1JmDmqmaOzlixHM
	 V2rn3TYFVY0bqHoDWhb0Gj662NbUSm1dBp81NYzRwzFZJGLo074/Se+IAyPFQ5leeD
	 PEsGh0XhkssNIwxce06F8DAs2N7MD0DYVETwqgDoFv+EtygOCimB4fbNvfrSxKyFgx
	 S9yGG1o2zhHPeqEfMleqAcgNBmPU9z6tzpBp7Fz2bq5tBLCcH10svoJMb5cEN8OLnE
	 b5siscAudenCVtmXNMhWhsVWfArzA/VV4IitFVVdWbDv49lESg6nfy6O7xkz2LhaAa
	 g0n4y+0e0Pw/A==
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
Subject: [PATCH v3 19/29] sparc: introduce arch_zone_limits_init()
Date: Sun, 11 Jan 2026 10:20:53 +0200
Message-ID: <20260111082105.290734-20-rppt@kernel.org>
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

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/sparc/mm/init_64.c |  6 ++++++
 arch/sparc/mm/srmmu.c   | 12 ++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index df9f7c444c39..fbaad449dfc9 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2279,6 +2279,11 @@ static void __init reduce_memory(phys_addr_t limit_ram)
 	memblock_enforce_memory_limit(limit_ram);
 }
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+	max_zone_pfns[ZONE_NORMAL] = last_valid_pfn;
+}
+
 void __init paging_init(void)
 {
 	unsigned long end_pfn, shift, phys_base;
@@ -2461,6 +2466,7 @@ void __init paging_init(void)
 
 		max_zone_pfns[ZONE_NORMAL] = end_pfn;
 
+		arch_zone_limits_init(max_zone_pfns);
 		free_area_init(max_zone_pfns);
 	}
 
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index f8fb4911d360..81e90151db90 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -884,6 +884,13 @@ static void __init map_kernel(void)
 
 void (*poke_srmmu)(void) = NULL;
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+	max_zone_pfns[ZONE_DMA] = max_low_pfn;
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+	max_zone_pfns[ZONE_HIGHMEM] = highend_pfn;
+}
+
 void __init srmmu_paging_init(void)
 {
 	int i;
@@ -967,10 +974,7 @@ void __init srmmu_paging_init(void)
 	{
 		unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
 
-		max_zone_pfn[ZONE_DMA] = max_low_pfn;
-		max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
-		max_zone_pfn[ZONE_HIGHMEM] = highend_pfn;
-
+		arch_zone_limits_init(max_zone_pfn);
 		free_area_init(max_zone_pfn);
 	}
 }
-- 
2.51.0


