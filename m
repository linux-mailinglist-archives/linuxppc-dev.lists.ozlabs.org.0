Return-Path: <linuxppc-dev+bounces-15505-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0D8D0E3F3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jan 2026 09:25:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dppV074PPz2yds;
	Sun, 11 Jan 2026 19:25:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768119912;
	cv=none; b=Aedzwvc7IBvg3Ld9FGn94DIGE40EnLAgEmfd93ehyjukmmhl+N9o1TBUn4hRCvqxmTyQb1YUMgnUQIEdPQ1EPVJqH47yLVzT2AEJ5H9I9jSagLyn1FH1u6Yav5Nil4GG3rQSyRzO3HbLypf727Noz+KJ7HuKX5iTKAs/6XhHaXB+ITP1punHuqOLTi0pSGZiHghg7ma+uGTmTBfHAuj2QaGYQhPcwMfOXWjfaYHiHkBRXwOdJq+V39gDpJZY5IYH+fNT+J5Hw1M/E0YvXGBIpBzJd5I5yfhRx3HpFpYNSxmbAnc1eXvYJOFICtaFkQcvYNetH/sEwXEtIlfvF670tA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768119912; c=relaxed/relaxed;
	bh=q4Huzw4vQWzU7fH6ZK6JDqF2BuozGGTADwuU/KDDhMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThJTmFRAaf5msWjBVswjFv5rMd+6AMI8eK560Tz+E4xLvQeS0zENVTEMwh0nUapxVfZ5t8MRdhWNhjU8wMnyLMDiytzpsLBWmW1NMtwFb9kHfxCr3KFWeujJHHIddR5wNI0Xfr8t8LiuFAdLauuJ6ip5amx0mwCDrWWHCMBHWM/l+t5JA706fm4vKIcIHdXodygHMahhb1LRgJitLVlHpNsUDPfBpWb7H35BYXzbr9BLMgJ8PUrdruTcOgOkgek/OuZRNXkD5/snQUOFzbJW0iqtjkW7VSBzyn4c/digbHjxBrGnSaGCelN7VjLyc6DHBG9m7X1gD9TDVPEXr4+Tjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mM4gqA+w; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mM4gqA+w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dppV00xFYz2yZ3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jan 2026 19:25:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 79699438C6;
	Sun, 11 Jan 2026 08:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8137C4CEF7;
	Sun, 11 Jan 2026 08:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768119880;
	bh=MPCX/BFx4rAVGYDlSF6Q7jr1d4V0F9NA7QfDXfFeFe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mM4gqA+wEauIWJ05bMigWXYtTWEEcyei1F4xEUgbq+RsfmmBoFF0o2GyqORORg1ZU
	 O/PYlnHLs5sTgxaOrCtPEumRYmzE68tz4XVKb4jcrkG7r74JwA2U4FKssm1FbXJ6xw
	 HYCTcGgnjPE0xv3HeS3AlJMYLl+WS5Pav/teScenNnOMDF4+Oi5hyxTIHvqQEBKyMT
	 LBhszlQ/gyTtQUq8WRDvcUevZ9GQ3Eg4UWOWAeBVjU1yDAFpJgs4IcDiZOwNaB6enz
	 UgD8N8DDwHSsVPXiavsWLV9g5SI2abirmq3NT4jYL+pitalVFi0JACgYgU7Jmtd+21
	 Qi+05xubHRvkQ==
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
Subject: [PATCH v3 13/29] openrisc: introduce arch_zone_limits_init()
Date: Sun, 11 Jan 2026 10:20:47 +0200
Message-ID: <20260111082105.290734-14-rppt@kernel.org>
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
Acked-by: Stafford Horne <shorne@gmail.com>
---
 arch/openrisc/mm/init.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
index 9382d9a0ec78..67de93e7a685 100644
--- a/arch/openrisc/mm/init.c
+++ b/arch/openrisc/mm/init.c
@@ -39,15 +39,19 @@
 
 int mem_init_done;
 
-static void __init zone_sizes_init(void)
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 {
-	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
-
 	/*
 	 * We use only ZONE_NORMAL
 	 */
-	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+}
+
+static void __init zone_sizes_init(void)
+{
+	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
 
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 }
 
-- 
2.51.0


