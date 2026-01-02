Return-Path: <linuxppc-dev+bounces-15145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB19CEDCBB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 08:05:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djF8S4SMkz2ywy;
	Fri, 02 Jan 2026 18:05:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767337544;
	cv=none; b=j8JMAyYBjxV2oTQfn3jG1yO60OPJbH3WV7a0BCT0nAzyrUWehkVROPK5+ksplcPl45ucf2BlpMmhR304OglCuwg0Va0/wFf+V655O496IReBfLuxBZr7sbhjvqirwFmdS6qhN3n2rnIMRTbNABDL/pGIWpxq1gLkJE3r6e84/oNOp5jmu2m0r4en7/d9JEMu/tVestC4w0k+H94F9Pbjj+Jh3lw+QbZ5jvRMLvcWf81o3viSiRbehwwqZnG2vyJ/x+ycnPxuZrr8rrhdsxogb/oLUgparilwAnxtXR6eb85vqBehKkD4HgSkWngcFoJ27Ek2THTdCAL0MU0TvSD1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767337544; c=relaxed/relaxed;
	bh=azukzfgsXgu/EZDimou0ymklRTxVzT+QThHCfbcQvB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAqBbdK6MGW/ODidSpdoEwzGTZexHKKuYaeUnYE/wWyWuuJm6oTAwZjF2doUENAuwt/qXDx/GhPdhJObsnNen8JK5HC99Jx1pYeC+AYZQAiqCd0pLJ+hDtUS08VUMQ54h8aP8Aqcqe9jZrcwi2P+i0OaZP4tIPes0N7vbl7fIssBAt8yHCfXZEcC7JrfY10RJissFV7f1YHHoRRYTB5n0yEu869WTTIaqZSBpzgjcjaauGQEmff4AHKB9kksYuo8BBf8UNOnz53un9tntTD58xlaRzK+Estefnb79LBIBFcHMMHMFzOg3UaOuJQKzCQlj35OgKpgfLYHcKADS7dsrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X4nEWJ/0; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X4nEWJ/0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djF8R6cQTz2yGq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 18:05:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B0B541912;
	Fri,  2 Jan 2026 07:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5C2C116B1;
	Fri,  2 Jan 2026 07:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337512;
	bh=4MJzw8wq/vYacVlPos8SheQzjEj4nCDptI3YxDfhXAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X4nEWJ/0L+n3VAFD31SZ9u/rL4Rw0XhJxVYC7R+OXsmo1R+f6/lf31rINifRbzeb+
	 E7q+YbYslJsdX+mgT/DJOnTzdA8r1GLCYhATQ/6o7s0IJ73Te45CcPz4wjEFvvM/n3
	 ThGwO2GIstpYmbDXYc1dqebuTUIdt2HiOryT/ZvS5M8ujm1ShtTfK4zRsWEwkJ/FNF
	 8m/LHQ3fd5LrjZY8b6caOj2ahTu9OG/0IsdS9Q3L4EJW65MYUSuOxby2ogAIsiG7aF
	 EFowjrwFr63a8VLMXiTaiTSYHWDOX7bOW4u2qYH3Zafy+sjM5mjfd7Q7v9egCc3YOp
	 jgbCi3HZCBEVw==
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
Subject: [PATCH v2 20/28] x86: introduce arch_zone_limits_init()
Date: Fri,  2 Jan 2026 08:59:56 +0200
Message-ID: <20260102070005.65328-21-rppt@kernel.org>
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
 arch/x86/mm/init.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 8bf6ad4b9400..e7ef605a18d6 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -997,12 +997,8 @@ void __init free_initrd_mem(unsigned long start, unsigned long end)
 }
 #endif
 
-void __init zone_sizes_init(void)
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 {
-	unsigned long max_zone_pfns[MAX_NR_ZONES];
-
-	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
-
 #ifdef CONFIG_ZONE_DMA
 	max_zone_pfns[ZONE_DMA]		= min(MAX_DMA_PFN, max_low_pfn);
 #endif
@@ -1013,7 +1009,15 @@ void __init zone_sizes_init(void)
 #ifdef CONFIG_HIGHMEM
 	max_zone_pfns[ZONE_HIGHMEM]	= max_pfn;
 #endif
+}
+
+void __init zone_sizes_init(void)
+{
+	unsigned long max_zone_pfns[MAX_NR_ZONES];
+
+	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
 
+	arch_zone_limits_init(max_zone_pfns);
 	free_area_init(max_zone_pfns);
 }
 
-- 
2.51.0


