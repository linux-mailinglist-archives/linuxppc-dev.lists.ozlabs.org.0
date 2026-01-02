Return-Path: <linuxppc-dev+bounces-15146-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F42CEDCC1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 08:06:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djF8l2lJVz2yjm;
	Fri, 02 Jan 2026 18:05:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767337559;
	cv=none; b=IRjZxpMACZMnX8vNNK3b6yb7AKlVkABu9gfhJ2OkwLWipEnsykdpN07OkKaE2Oq+uyCeF5TKmfufaVdHBKX83afRmBgrtYED56q2GX8pDXFqT4o0NauhPfBt46z5BY4RO5SbNNWxTXIPbDp8bIWg+lEcAjA3tmaCrPa/Hxx5WPW2bpx9zMiPZw6294aUwjyh2siyCJP5RU5z3pVmRpxahx0p9EHCg2fk7VhXP2TrDEqOJjXv+ShS5iUB0Zhdj/Ou0BNTvRnZESVdd9jGCk38N+QqeituEa/xvKGJHkko9EzJAM3ElvD5cJDRyUIsrZDwi6uKBMFnAg8DWtXcORVmpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767337559; c=relaxed/relaxed;
	bh=1chzHxsrADOvWvHnGxP4KUnDWT2YzEh4P+Cw7lJ2EsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PU2XdUgmfiA+8/gIpEQl/N8iu5q8WAnY3JIOyjexhoiwH8vq+fJg+g5B8kjz+EXNg/K2IAC3XzmUyysYo4VSrpMBRW5tJpD20eI2tnBJAWDvbZDOH5b6tJmCeJXFT80Z360w/NI9mKLD4CXdjFEDrun6t8Y+xvby6DtNbji4j0jjKzLvUFNsFXCOoi4IRl0hhFM8Ek1UogyieBqgUYEeeFeAq2T38lejvVqMgAseiQJ5bEqXcmxCnCGST+LdHYSlMjXtNY6fRfyt2jtog228GjjuyfpPamR3MQuhvcspKyclFsGZkYFy6s0Ci8A2ZFvDySmTqbF5X9RG6tG7wN+iFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aVMy1uEj; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aVMy1uEj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djF8k3gc9z2yGq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 18:05:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADAAB436EC;
	Fri,  2 Jan 2026 07:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A822AC19421;
	Fri,  2 Jan 2026 07:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337526;
	bh=RfrVgNIj9rxp9R6SGMWNq/5X+PJ8wzbzZyqbje0LIeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVMy1uEjz+i8JVR5vvetsdLlgetPkDBi4pcNoZ4vjSKDBc19eAiwfNmFLk+7mga3L
	 CoRj28PGPQFLtYhjpAFGOpcJutt4IEAphYnmmrXUanPJV/sEjuRaYp5ErdlMYFMwBa
	 y7Tx3dNUc/RzrtMBd/C++WHUWIgC4F/tyXDOwS85cAPJvO+XvNSexJlAVbEAIac8yK
	 7B8AnG2S4pCOhihUnC0FMc3yT8kq9pvWxyPULUe8cP34d112OYpiJ6uofrGOoed7ZQ
	 J3GRwa/R04BfG9D1qMTYLWoomnB7hJ4FZjufi3DB/KiokHvaSbus/icytAHD/NLK2p
	 CLxFTDSXhTUeA==
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
Subject: [PATCH v2 21/28] xtensa: introduce arch_zone_limits_init()
Date: Fri,  2 Jan 2026 08:59:57 +0200
Message-ID: <20260102070005.65328-22-rppt@kernel.org>
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
 arch/xtensa/mm/init.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index cc52733a0649..60299f359a3c 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -116,15 +116,19 @@ static void __init print_vm_layout(void)
 		(unsigned long)(__bss_stop - __bss_start) >> 10);
 }
 
-void __init zones_init(void)
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 {
-	/* All pages are DMA-able, so we put them all in the DMA zone. */
-	unsigned long max_zone_pfn[MAX_NR_ZONES] = {
-		[ZONE_NORMAL] = max_low_pfn,
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 #ifdef CONFIG_HIGHMEM
-		[ZONE_HIGHMEM] = max_pfn,
+	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
 #endif
-	};
+}
+
+void __init zones_init(void)
+{
+	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0, };
+
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 	print_vm_layout();
 }
-- 
2.51.0


