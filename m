Return-Path: <linuxppc-dev+bounces-15139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD981CEDC3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 08:04:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djF6p1v7Dz2yFq;
	Fri, 02 Jan 2026 18:04:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767337458;
	cv=none; b=iEVJBiv/KguVVmrjIUT8oy++CKC4hw30Gzq+dSP6fM+ZyXmECsMiyMMl989NS0VEvgOzF7oDCV6PzEOtOjigs8hpP8E5cilO7ud6nzc0tsDjjbbh566uVi13X9yjTQjTqu2CPIV77Dmjv8iQ8aKZzwrkwL9/OZF4KS5FamLqZZvJLiv6CqRDyHy5WrJR1ReH2I4tE0JDQuEUJMgdGiA4g3CPvNmslXFJEzLA39o/oPKfZ19FNDsPyJC7+KBQ4sLtV+RxrEQMdgYKZXXQKnQOo7G3vvWO4pKvsLctspJ9bOnQh8P7L49wd1AmURKwoG9mnE4S8jAiYgZHXYQO6hLxIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767337458; c=relaxed/relaxed;
	bh=0zKPan3W2SiqdNPRYPzd7IYJCfxuO94gDNri2EQoJXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KdmYTpnBSwXln9CHacCcRmDIZtPAbwX/sz75ZAh3mj4u6cKCvaS0b78RxUsh2ELylqu2U2fA82M6+3m+nNAPjc2aNhedvq4CdiTOr+0UTH6av+hEkoeEA1ODWCA679L+pViQkZFJSm4wDjCrDhDm0qilBIp+4pgWDcqZaDy+FYs0RjB1f5sGmwamiLG8fhMnMG/DBhnvK5FuC7NcAkRdwaouiEXLBGG8spgrZbUTKOJK8rI9ZKSt2xll4KdPPzFM0RkHkySeqI7bJbJzrHKqA8JjS7OAwZblkzyLVHRG8NfLNa5A3HyAdfY7pZGIHMajZaXQt4txGk/PHjOGdNxhkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WXMa09yB; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WXMa09yB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djF6n3YNKz2yFb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 18:04:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8AE543386;
	Fri,  2 Jan 2026 07:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC80EC116B1;
	Fri,  2 Jan 2026 07:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337425;
	bh=7cRQHQcJTxCSxc9tvl2G7dMvx0rutizHF89BihPwSeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WXMa09yBg0tSjYHq9f9IeN1blNFAUX5LPbmAcZXTIcLFIhw3wDjAOleJmx/F17HYv
	 DR/XhO43ZicM0ZzN/IylLOlc6TIvzzYw30yLyImZYlnIZOkfgkXLPeKS3KmqjXhef6
	 7Xqozq3RTQUIwv95IOKdrcgqsq7QTcmppbXQJr2NFgNTpEMaAaxVrHTWJemz62cI0e
	 EI+nC09iXbdxet8WSVPNLPNmYPWpC8MthdMNGYVSvRQn8uLJUVipftJdPEOnMLgFJC
	 Ffthwjks+FE6Yu/bSgN4+CtYSegAgdS1XujRR8oHw2GikpOK4R9aMTfMNz2zM8aM6W
	 fysQUznA4UdgQ==
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
Subject: [PATCH v2 14/28] powerpc: introduce arch_zone_limits_init()
Date: Fri,  2 Jan 2026 08:59:50 +0200
Message-ID: <20260102070005.65328-15-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102070005.65328-1-rppt@kernel.org>
References: <20260102070005.65328-1-rppt@kernel.org>
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
 arch/powerpc/mm/mem.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 3ddbfdbfa941..32c496bfab4f 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -221,13 +221,23 @@ static int __init mark_nonram_nosave(void)
  * anyway) will take a first dip into ZONE_NORMAL and get otherwise served by
  * ZONE_DMA.
  */
-static unsigned long max_zone_pfns[MAX_NR_ZONES];
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+#ifdef CONFIG_ZONE_DMA
+	max_zone_pfns[ZONE_DMA]	= min(zone_dma_limit, max_low_pfn - 1) + 1;
+#endif
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+#ifdef CONFIG_HIGHMEM
+	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
+#endif
+}
 
 /*
  * paging_init() sets up the page tables - in fact we've already done this.
  */
 void __init paging_init(void)
 {
+	unsigned long max_zone_pfns[MAX_NR_ZONES];
 	unsigned long long total_ram = memblock_phys_mem_size();
 	phys_addr_t top_of_ram = memblock_end_of_DRAM();
 	int zone_dma_bits;
@@ -259,15 +269,7 @@ void __init paging_init(void)
 
 	zone_dma_limit = DMA_BIT_MASK(zone_dma_bits);
 
-#ifdef CONFIG_ZONE_DMA
-	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn,
-				      1UL << (zone_dma_bits - PAGE_SHIFT));
-#endif
-	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
-#ifdef CONFIG_HIGHMEM
-	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
-#endif
-
+	arch_zone_limits_init(max_zone_pfns);
 	free_area_init(max_zone_pfns);
 
 	mark_nonram_nosave();
-- 
2.51.0


