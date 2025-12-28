Return-Path: <linuxppc-dev+bounces-15044-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C253CE4C2A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Dec 2025 13:41:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfJqq6M0Dz2yFW;
	Sun, 28 Dec 2025 23:41:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766925671;
	cv=none; b=cJMwUNbspd78yAA6XLNllw6Q8Y+wgGBjizkh0BA5Du0x+bmE1OKDwwGjGwYsiFkrvAN2GnvpTJk112+irX3RLm9DMTiuaT43zR8YfSxN9VF6Y8l4h/kZuRIyEKx7A7AgBxNWlu6G2xk3L5mgZRXzFRpyVQhh2UmmJ2c1Oqau3pd9fO7KDMxIW5OXSgNbgXG1kqwx627+7LKDWSvR9R/WvjX/RZyrAWSzNi6cimNfvPn6WImIq/95HlJisze86hyNU/zkQV9Hxf0P1BQlKS3jh900KqYQYs1WXL9ebzM9sqD3F5+YIyDjO+BxeO/u2F177669sv/Z048GZPELv7Tt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766925671; c=relaxed/relaxed;
	bh=CDKGVymK57uzH9g/ob69grxMs4/CHVMEy4WJGOI0ovg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kztevMbAGjJvG5BqBJp5Jih2okpct5dOph4yEeh+HKlyyiafUjUB+Z7ibwjD0UaHkwApRK/dNQ2jbMqJaTTBofXHmd40p+OeyHxaNcmfHJNQ8xKxApMAunHkFX0N7xOBgteaO8mTtas1O9dUgEjbyn9mhaC6Y9pcaiVsaazP2S2OTGHHQJ3YCC4+QDltyMa2VDReyvT/kxvU8o2h0Fe6QdWPGrOfMCakd5ej2g6cMw/IrQxvvO//DoyrwCJRd1nbhMGFvgiMugQ82qiZ8N1DEkKoD1E1zZPWDA/NB3rcX3RgZq+Xm/1LpZqk9xBJtxwTB421derWa2Dq5nUHjMtNWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ny5n8bhx; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ny5n8bhx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfJqq0D0Cz2xJT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Dec 2025 23:41:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A04C560055;
	Sun, 28 Dec 2025 12:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A2FC19421;
	Sun, 28 Dec 2025 12:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766925637;
	bh=pGrH7LSUy/RWWaEZflrH8bSRmOyGysCgjYGTdbg1VRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ny5n8bhx4lGhdGkVESizKnB9s5NjTXyCzl/BNa3Ba9ZKpEvM/CZIdOIL7SOU9jff2
	 f9d7/RukDwQyZrvibX87GAMUHRnuu/jtE9lSsKII3JWBEOTYX6j4sd74c2ECetV/1v
	 efQADf10esO0n890dt3sP+OjZZ5uE3wI6PVBS5SExv55d39h4H7myjY/QFX0EizXtg
	 HUNJvz/qP4wR81roHy4qlL+10S1f9sDiJSTgMup03fwig5pGyQw/EYhxfP+eCAenCJ
	 7aBgLKnMx0G4Zdx1Cpyfjl9xvXr5bgSz5ylt3rHblj4ACGNjYm3Y/wasBOIdAic2Wg
	 pDiCOhnxJVisQ==
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
Subject: [PATCH 01/28] alpha: introduce arch_zone_limits_init()
Date: Sun, 28 Dec 2025 14:39:31 +0200
Message-ID: <20251228124001.3624742-2-rppt@kernel.org>
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


