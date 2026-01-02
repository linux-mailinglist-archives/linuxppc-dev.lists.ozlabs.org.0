Return-Path: <linuxppc-dev+bounces-15127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE03FCEDB9C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 08:01:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djF3l3tXDz2yFl;
	Fri, 02 Jan 2026 18:01:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767337299;
	cv=none; b=CwxHUOM404yd4Q3/UMUnwpP4wBOIcboyrVOgRbB5EUaYpt2mYI4lltdjNWY2ztOLE1ET9/4sTagKg3ujDqmJKhqqiEJ1tXo3cYNmKMtSC0k9YkQ9ZG386t1YBoxiPD7fjuii69bmmAi8VdHwKYR87aOYIffLiOguf++0zeayb0mdkjAU1A/CyH06AKuInrJeXcos5VVzJvecc/wjU0pk9TfEqlk6zHrBRsuHBnWFSjdVIRKJHuAwJmX3QDvuslsxRKuZ/BxpK3X/eUWpIlWgS7z3q5IyfLQ34gg3PbuGlGmUlx2Iz+fKqsFK5o7E9L0TTf49K9mEn7wF2pp5g5hYiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767337299; c=relaxed/relaxed;
	bh=qYVousDSpw+811qLPmYYO+fHKcpA4yVaAONn/C+5QeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYH0HBCC7O3gZEp4XISEDSVsS6Dz/ipT49LoiHiWM9WBU3PpnN/8xAdDMGrxWq8oJFA+5YsLxWDCRYmhLYjGKGkevkgWTdWjTU1RF9TcfLMN1LGK+GmJnhppUO9yX2grxK4poWbjTehOjiGX1wvg8X/AQN8N54mVMk10whaoiTDFbn/jvO6H4sGZXp2UcYT2B4oV7ZpHBZeXamdJICBfEtSVDrRFzx3KSsjfu0WBue/De+wOr2tC87XA02ZQjxetGah9z9jJO/D+IgfRN04fVyh8nOS6tv1bxzG9GpudUVS/h4pZnBbmEGD1QnzwoXhPaiwb0/px1A0r21Qtj+lCJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jKMirO/V; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jKMirO/V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djF3k4bHQz2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 18:01:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85BB160017;
	Fri,  2 Jan 2026 07:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626DBC19421;
	Fri,  2 Jan 2026 07:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337296;
	bh=beem9LtRR1HHqRgL6PattJCY9S8i8ATD31bTRr88sn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jKMirO/VuTg7k/DrwUhdWDqifrgFVKcZxjR3ngObsepKAUunHyot4zCyt4dbuSd/r
	 e8hg+giPXhpyeaesjjegSYPKpxLKNutC6OgDnsUOcv9WekXd+NB/AKiimQ9/mqBlv8
	 KlScv9DH/Nq3I8tdNl74MxiqcD3aAM6FCfxhT4H7mKg7ixaPZ+3fILSKwLRmLkM5hx
	 kysdZHAQiUMqmxsOZVYFQkemEYLKJWnM1VBLRTbuj7W90M9DavJ9z5GCk3Ez3M75pA
	 nX597Xg69ltfgiS52uEQG5kNsR9io22pRfGDTHSAzWoLyLsgooMbRZSv3J+2WVEAAS
	 pKICEEyQYsm7Q==
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
Subject: [PATCH v2 05/28] csky: introduce arch_zone_limits_init()
Date: Fri,  2 Jan 2026 08:59:41 +0200
Message-ID: <20260102070005.65328-6-rppt@kernel.org>
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
Acked-by: Guo Ren <guoren@kernel.org>
---
 arch/csky/kernel/setup.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/csky/kernel/setup.c b/arch/csky/kernel/setup.c
index e0d6ca86ea8c..8968815d93e6 100644
--- a/arch/csky/kernel/setup.c
+++ b/arch/csky/kernel/setup.c
@@ -51,6 +51,14 @@ static void __init setup_initrd(void)
 }
 #endif
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+#ifdef CONFIG_HIGHMEM
+	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
+#endif
+}
+
 static void __init csky_memblock_init(void)
 {
 	unsigned long lowmem_size = PFN_DOWN(LOWMEM_LIMIT - PHYS_OFFSET_OFFSET);
@@ -83,12 +91,9 @@ static void __init csky_memblock_init(void)
 	setup_initrd();
 #endif
 
-	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
-
 	mmu_init(min_low_pfn, max_low_pfn);
 
 #ifdef CONFIG_HIGHMEM
-	max_zone_pfn[ZONE_HIGHMEM] = max_pfn;
 
 	highstart_pfn = max_low_pfn;
 	highend_pfn   = max_pfn;
@@ -97,6 +102,7 @@ static void __init csky_memblock_init(void)
 
 	dma_contiguous_reserve(0);
 
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 }
 
-- 
2.51.0


