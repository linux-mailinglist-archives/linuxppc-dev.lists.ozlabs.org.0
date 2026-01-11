Return-Path: <linuxppc-dev+bounces-15493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DCAD0E271
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jan 2026 09:21:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dppPz0bkPz2yVB;
	Sun, 11 Jan 2026 19:21:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768119702;
	cv=none; b=QQZaek/mq2uWPT8vPm+4atQQc820Llvs95FM1Q3+hy95nP8sNrL4/99qNOWvtSl+juq5IwEMOcfPhp8NIC4yiXX+kGxOQZ7g7vvuyLo/46kQaMNqkGNFm0KFwFUATQsEJ2nu44NV2eGwOmp/7CK3P64I3ekQ+reKKFAKBSljfcOnze6E0S7Kfk5g/5HWdQbzlYHEIHzPXa6wOpBZFvpNIv5jcIfm5Jkp81tI5R/9K2nP5sMZrqmwGOVUCSZj7NKS9F2bkYptW2Ey/Cyef64GFF3faptdtloX9mhE9WfyzHELcpQo3GG2JLuzfWl1e+QMGsKNo1KkQTypHeqB3nxZ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768119702; c=relaxed/relaxed;
	bh=hMSeghU9mFb/iSGNjAJ2/WETrT3nayTRWjrK9prgUyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLhnyzY8+v7L0fJVRN1b7dW6v2j3uj1GcnPO3L676khJQ0obCN3R5FLayWdLMVQKsjp3vUDeYydZurwQEOVCahN6rjC/YmkY6wjdxeFTsGTTBT0GHDPLZ2y3eeaIbbgjt7cke5gIB2Tul/wUYOwAEzjv0tOXwCp1MQS8Jf+0/NEEzQm0qa40nhxgg+/+HmYBfPebWasY59GfBKYqt0xYAcuZGbxZt+faVO+yoeXOX9bZpDxb7SN+SH02mnmFARt/ddnhQX6K2FsVWTOADfhyHhGzQZxFCoRMH3Z2LNsmVMelNhmEtz7GvvKPKzIoHKpfXivL9ojM+bZxxiiOIALtxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mKsFfy4h; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mKsFfy4h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dppPy1qNQz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jan 2026 19:21:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2928960010;
	Sun, 11 Jan 2026 08:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F81EC19424;
	Sun, 11 Jan 2026 08:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768119698;
	bh=KgO7SaOs49km6xau9XjjDmzydPHNaHbDsqRu17wGsEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mKsFfy4hncm+FQF9ArIXoeLTO/v06DCp8sXjb1/J7bQiazwbZMdpHIy9QotlxdrKv
	 cKzwRylS7hXf12+BEXaXStZUkeCwmqdBGWQzJ9yqdLS95oD2cS0pSBfDrcKw/dAkej
	 56RV0+FAFYsa39zRWlT7ql3sObFpMCuLtdFkflVRr4BAKpyPWA7tvw8HwpcQSyv04q
	 jpHzxotVHj204aEr/qLLNW0xVwVegN9kaR/1lVEctSggjpdCZQ9WegpvTuhQU3MJ26
	 pU23I8xS42R0TrNytKEIX7DhURcabHaDeWfPtsCINu3tImuaarWe0Jtqcs5M33w4wE
	 HXtsM6RgI0KhQ==
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
Subject: [PATCH v3 01/29] alpha: introduce arch_zone_limits_init()
Date: Sun, 11 Jan 2026 10:20:35 +0200
Message-ID: <20260111082105.290734-2-rppt@kernel.org>
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
Acked-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/mm/init.c | 15 ++++++++++-----
 include/linux/mm.h   |  1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 4c5ab9cd8a0a..cd0cb1abde5f 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -208,12 +208,8 @@ callback_init(void * kernel_end)
 	return kernel_end;
 }
 
-/*
- * paging_init() sets up the memory map.
- */
-void __init paging_init(void)
+void __init arch_zone_limits_init(unsigned long *max_zone_pfn)
 {
-	unsigned long max_zone_pfn[MAX_NR_ZONES] = {0, };
 	unsigned long dma_pfn;
 
 	dma_pfn = virt_to_phys((char *)MAX_DMA_ADDRESS) >> PAGE_SHIFT;
@@ -221,8 +217,17 @@ void __init paging_init(void)
 
 	max_zone_pfn[ZONE_DMA] = dma_pfn;
 	max_zone_pfn[ZONE_NORMAL] = max_pfn;
+}
+
+/*
+ * paging_init() sets up the memory map.
+ */
+void __init paging_init(void)
+{
+	unsigned long max_zone_pfn[MAX_NR_ZONES] = {0, };
 
 	/* Initialize mem_map[].  */
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 
 	/* Initialize the kernel's ZERO_PGE. */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 15076261d0c2..628c0e0ac313 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3552,6 +3552,7 @@ static inline unsigned long get_num_physpages(void)
  * free_area_init(max_zone_pfns);
  */
 void free_area_init(unsigned long *max_zone_pfn);
+void arch_zone_limits_init(unsigned long *max_zone_pfn);
 unsigned long node_map_pfn_alignment(void);
 extern unsigned long absent_pages_in_range(unsigned long start_pfn,
 						unsigned long end_pfn);
-- 
2.51.0


