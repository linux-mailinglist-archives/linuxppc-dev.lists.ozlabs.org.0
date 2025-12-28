Return-Path: <linuxppc-dev+bounces-15056-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C061CE4CE1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Dec 2025 13:43:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfJtS5qRNz2yFp;
	Sun, 28 Dec 2025 23:43:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766925808;
	cv=none; b=V2nBMHWuS2hPHi5RCxQIrsw3hvN/ai8v3A7BIuFB5UGlsc7b6atjDTOpFM6V4sDl4FseJvem4q9TPqmEsKe6m6zaRfn8qwq9zO+5wkBj6FvBU8u1CeoOJMrgEi86pSTAYiDDIfFgAff2R1yiCMmvP1k94WJT5aufwbjcXThv74Nw5WfmUeHOVm02DmVAhp2ZmK7FGSjntNAChMaYPURLyYVjW6AGB3E+/ixlhm1Esr3AU901u8PwEyWUGxpr1zIzAa74bvoSV083I9vHVW8DutgDz0NuDnvZHMspa+K6bgxrUClWYm06oPaQrGe+3qWVX2h74MRCzZV18BBe5sLnng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766925808; c=relaxed/relaxed;
	bh=3rGoNEIN3+nxNy0Tllud3Z5Az96f5Wa9/ZyN58oX2nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDLOrrGfZRRhreakAM4SLnkPnDtS9UiKAB2Ub23zfEGczr6LZR8bCPyWaq+aBj1ADjd1CNPyBZ0t6o/CkNgvErIET3YEEebnS+idBmjudMMlCb0VSu0Cpml/NOxGITdQawVrUfRBxYuyIrZaqNYssGio/05rdpXQy5204WtDL1qGJt+eEOKWd3r2I26JiBtvYcqqw94o9FSFlEgdVnCVerYRHOIsIJtosGIrGcG9XqJYj0U/JgQKc8wobOr+YCp9yWrC/NClFsglDzw/esMRur/A5SRjradx7w1cLZPIGegdaAvJhNAv/w7Ybjiv+pCDCJ5TABktBU8kmkXZ+y2sYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mvnk+T/l; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mvnk+T/l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfJtR6qLMz2xJT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Dec 2025 23:43:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F74B60055;
	Sun, 28 Dec 2025 12:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEB3C4CEFB;
	Sun, 28 Dec 2025 12:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766925805;
	bh=KpWKwBVQ6/Wrpr2p5VE4NagR6mN2AIih488tiFO0eJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mvnk+T/l3iJfcZoVHMTxLWwAkj0lcr2wxYLznPNC6F8yayhhP2dJxOMoDSpp61w1q
	 FyDzRCr6J/Bc96cUb+UTemdxGnkCC3I9ro31Wo0224PqibhHPKKiwILUOOK+zFMW7a
	 /g4IJpQe2W38LqfkpdUspf0PLOPfv+DaYHjyflx+fc7AtcdkD92n69zlEY8e83Wj6Y
	 68sf7yQfGCVvoshnIPwOAY3fFq95dE7Ykvknc5EApPQxj6NXQpXi1wf6YW9xuk1m88
	 PemPb4fVX1lXHkpiOZHqgdGq4x4lcmT6AtAkYPzEwJQ+WehAws2BJqmLoGIHWJNyuu
	 7XMJl1UU7Ju7Q==
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
Subject: [PATCH 13/28] parisc: introduce arch_zone_limits_init()
Date: Sun, 28 Dec 2025 14:39:43 +0200
Message-ID: <20251228124001.3624742-14-rppt@kernel.org>
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
 arch/parisc/mm/init.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 14270715d754..dc5bd3efe738 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -693,12 +693,16 @@ static void __init fixmap_init(void)
 	} while (addr < end);
 }
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+	max_zone_pfns[ZONE_NORMAL] = PFN_DOWN(memblock_end_of_DRAM());
+}
+
 static void __init parisc_bootmem_free(void)
 {
 	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0, };
 
-	max_zone_pfn[0] = memblock_end_of_DRAM();
-
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 }
 
-- 
2.51.0


