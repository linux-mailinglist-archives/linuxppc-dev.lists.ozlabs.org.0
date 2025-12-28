Return-Path: <linuxppc-dev+bounces-15054-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D19CE4CD5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Dec 2025 13:43:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfJsw5yLcz2yFc;
	Sun, 28 Dec 2025 23:43:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766925780;
	cv=none; b=oos5V6tOEbjJXB86+9wBXbFjiIlawlhGdiI3Ne59OPogy9SVK0PlNRTBQe6ryOemzVkKAlAjPUwr29i4Ai/xEfRB4Bhuky2q30gAtoOsCl4s7hI9orcKd62oOnte6I4wO4CLiSd13I3EoaGAS6zAaEix2UARDfMUh0/cbSIuA+rg3L6jWegto9ym563hGj/lyimz6pwKuzNmjWOdFM+4evOCOaQyX05m/YVF+LM4XHESJqzkiw8A9XBYDdULYG+zBcjtSSIjbhsP20rWRLshujVcbDiOTzciL9dQNvrdpehG8HBahGFv5lUNiLYEBZ42WKQJ+OqVg/n5lL6VbQxJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766925780; c=relaxed/relaxed;
	bh=hHem1jOpdanhU4wzja5jbwV5wSMJ+IR8AM9Fotb2ptk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAGO3knhekiRt3TAMwImw+0Vxh+Q4soqu9XrTbPDEHlWHAkb5ZEX8aC+3b2fLFIHSleh5o7M5fNSPzLT2doCGEE9YxwCMADyzD/PvRIwkLkO8fJwh42qE+9meqgTrP8H3D/pClD+JeysGibm8Ae9wKPhFc276zSgF80Ian9xkEZ9omDer1Jo6O6bWsNvgv0YMYLqDhVzteyynwHMgidptsa2COfiSvqPN/aQ1uT5NNj7dApxoVTPFLssG3m0lpV65ubjYzRgWjf/esktI+Jv9JVWmh9L12cf+G5FlRK7U7seFyLUHt1ljsOUJ1kGzwtyeU76n7OoHeiXjtYhiM+zcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UD2BERPl; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UD2BERPl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfJsv6lpJz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Dec 2025 23:42:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DCDAE60055;
	Sun, 28 Dec 2025 12:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1380CC4CEFB;
	Sun, 28 Dec 2025 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766925777;
	bh=7/XO61OP3oJL3oXo5SwiraqhSSBSqBw3/hQeqUzArSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UD2BERPlZ3ba4OSn/ykAf8NN0SaXrPzwsTk5aklWZwegjHk4YPqFP+mPCH1Og4nl2
	 wtcJ2uIyxWlfn1ediLSSmTIsfKU3/ze9Gq7AgyseaWU/v8PuZKG/ibcGLHdaqGs/XI
	 1Wx77f7NgvP4aGd9BtfQN6kCMWnqp0KZ3GSCAOLYmW8HRNtlSa6XTWWpkt0gSZPOUh
	 JnxNER3OfiH9ng60Vlm/awFv8D6oyJR6moDue9xFg+0rJO7htyIPTEKQD4sJJiYkPu
	 IYpzRIxBkyogdh33QXcABVHe6ViOEpZtcC7KoONKuCr6PTH+VdpveD1N3juKNj518C
	 j9t2gzzEoApfw==
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
Subject: [PATCH 11/28] nios2: introduce arch_zone_limits_init()
Date: Sun, 28 Dec 2025 14:39:41 +0200
Message-ID: <20251228124001.3624742-12-rppt@kernel.org>
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
 arch/nios2/mm/init.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
index 94efa3de3933..2cb666a65d9e 100644
--- a/arch/nios2/mm/init.c
+++ b/arch/nios2/mm/init.c
@@ -38,6 +38,11 @@
 
 pgd_t *pgd_current;
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+}
+
 /*
  * paging_init() continues the virtual memory environment setup which
  * was begun by the code in arch/head.S.
@@ -51,8 +56,7 @@ void __init paging_init(void)
 	pagetable_init();
 	pgd_current = swapper_pg_dir;
 
-	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
-
+	arch_zone_limits_init(max_zone_pfn);
 	/* pass the memory from the bootmem allocator to the main allocator */
 	free_area_init(max_zone_pfn);
 
-- 
2.51.0


