Return-Path: <linuxppc-dev+bounces-15128-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 917F0CEDBA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 08:01:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djF3m20Msz2yN2;
	Fri, 02 Jan 2026 18:01:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767337300;
	cv=none; b=P8kRG3qVcpFBgvUw0HEHkh3ZVzutsacs0pleR+N2ce+cuQPXSjtA77QaRmsbihDEZddaBmM433rXz+szlKgcw6JODx/wibeaNO85mfGBawPlRABox/oOUXrBKfYMjS2vuh430R+6HiMrSaTjYOPMPioSq8KjaeRsSdpSA4o1YqEI+5guEC0gVlFsyhW1MIpMQMMUm9PpSVfvxtbkJc9eAlpMDSQLupOmtzC7nbbtbFKOEsyKMYzC38c+FxKQOzQLqU6IVzW/IYp39CNznbYvyYqLfIk/a1NG5oWaO8g1/lvWYTbnwg9S8Ip9nA0HHzILj/AinE/C4CHvkdyQb4J+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767337300; c=relaxed/relaxed;
	bh=b4qD+cVO4njaR2WMTsE5cyiXB7W0CbhxQFlHvnJsSI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FywJ1ZLU5ehrIYLvYLx+dDO0PA3bmA6FX+jG2Q31IwtMzDs+E0Y7za5Y8NFx2J1OakujqlUtZc4sVW3q8IPT/rx6P+LD9S80WlyB2K1fyIo9dRucWdRbm5+awEpzsKJIWTwTXy31bTV3X7sDAX4GZ9WoBJxIHPoKezZzPR3fx/5oTF0f/TfAnyImhkg9bkGQ5dPRUHuTwXLR/Bbl3OclLp+2veAq0WrsPiYTjp8wxbLI0Sl/gL66rfqQlJV38+GGLaGgbDQeRgq32is7Z0BgyJblCRkKPtL//AKDPGvHr0ADRKM+Ucu590D9RLGdHTOnFA2o4cfCj93KeD9XlvM/Ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FFZ7SBqL; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FFZ7SBqL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djF3l2zvSz2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 18:01:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6604417BC;
	Fri,  2 Jan 2026 07:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEB7C116D0;
	Fri,  2 Jan 2026 07:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337267;
	bh=sY65/RaZssilanqAkKMZORd+RGdNjje1eX8P0rlpw6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FFZ7SBqLRszGA55Y0dcTAeVUAFfhPI1J/Zu+nhszyk401f32Bb6bWLRKqrB+W2AKm
	 N38QT5+aUkSxN75WEW+blTrdKEOqeUiAH0BX1iOcat59Cv/SoweGwGsDzNvWrsSMlc
	 3QSzDoZKQleHv/14oFELN4CDb8KsNap/u7uUJ7UeoPHZ3CgPa49XZbUQPGXWMVadAQ
	 iGDYvbAw7yh54e+JFc4Kkqc0pB207lzVasPVl3cUpS+igbsvBxYsRn7xuxZTZdnkDI
	 isfveZxYymcuq0kzbQxRSK8ezAytSigXlJWJalxOdK1KDDwocwk/lYGd7pPWjjMlNX
	 rJZb3YeomLfgQ==
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
Subject: [PATCH v2 03/28] arm: introduce arch_zone_limits_init()
Date: Fri,  2 Jan 2026 08:59:39 +0200
Message-ID: <20260102070005.65328-4-rppt@kernel.org>
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
 arch/arm/mm/init.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 54bdca025c9f..bdcc3639681f 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -107,18 +107,23 @@ void __init setup_dma_zone(const struct machine_desc *mdesc)
 #endif
 }
 
-static void __init zone_sizes_init(unsigned long min, unsigned long max_low,
-	unsigned long max_high)
+void __init arch_zone_limits_init(unsigned long *max_zone_pfn)
 {
-	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
-
 #ifdef CONFIG_ZONE_DMA
-	max_zone_pfn[ZONE_DMA] = min(arm_dma_pfn_limit, max_low);
+	max_zone_pfn[ZONE_DMA] = min(arm_dma_pfn_limit, max_low_pfn);
 #endif
-	max_zone_pfn[ZONE_NORMAL] = max_low;
+	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
 #ifdef CONFIG_HIGHMEM
-	max_zone_pfn[ZONE_HIGHMEM] = max_high;
+	max_zone_pfn[ZONE_HIGHMEM] = max_pfn;
 #endif
+}
+
+static void __init zone_sizes_init(unsigned long min, unsigned long max_low,
+	unsigned long max_high)
+{
+	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
+
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 }
 
-- 
2.51.0


