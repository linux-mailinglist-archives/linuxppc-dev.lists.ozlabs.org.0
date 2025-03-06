Return-Path: <linuxppc-dev+bounces-6770-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A86A55567
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 19:52:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7z6n3Vh0z3c7q;
	Fri,  7 Mar 2025 05:52:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741287121;
	cv=none; b=CQwhRKjTZaLCiFendkW/Pzmm37cCDWBpX7uNIQQLqFTBeXOXKhFYRTiflGDXxtP4Qe154IZ68EDqhBxJDOmyoeQUaxxm0fl3j/VVOb4dMAOvplfoTDAKGZGu02wk9nCbKHmkIzNTLV8TGPCfKAGUTKj93GVf0whlNZX8vcMnONDx1xOkJ/8nUJbbdJhZkjn3tazUz3CA8ZTzehSw8qjIcUAyDLt3R7u3rVDED6G+VeB+2yDq4R/+G9SSjeBpFo9JZrFgm1L9DiQlWlJdKkE+MMcksmunTXPC+aOSa9LlLY4VuAod7kS5X33iHXGktDrB3ZeGtw3ZrbB61c8TPG2+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741287121; c=relaxed/relaxed;
	bh=+UjMwhEht30vCR6c5BWARp/0Kl/5L2IcrBToHAC3ydk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0tI18WSlRLrDol5f0V7XIevwv07bWrlR8ftxZvIrPbUODDuuSaTuToc0QJGctVk19sjk/3VVnur3bdBS1R8/Jy6UR1vOZvrAFtXs0J2lzLY5CiI6o2vkoAtAKZr9YRf/k+v6ZRc16voJVz2eudIq0PkbfKRPe3aCZs7NTj1UZFwDkTADDICCvsH1taSZkOivDWpkoUvZiMZ882gyBYHsh0oYrD5Nlf6frcFswIh8pU9DVZg30KKAcg4/HxGVlNQuK+mSsRRAEdIR6R2VYs2P7Hw/5bLj7/CQLowys8npKhjZz2BhEq4mjZZdK7dz6iFyXA+YzAZGD2lOtadh4/AMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mc3+5VBd; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mc3+5VBd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7z6m4VzYz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 05:52:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 01C9AA45015;
	Thu,  6 Mar 2025 18:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A344CC4AF09;
	Thu,  6 Mar 2025 18:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741287118;
	bh=xXhNVtoRAjb56OLfL+MIUyuiC6fNrGdmFypg4AHZHss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mc3+5VBdIIu92zQEQScIdHtZDhsV8+TCREp8qojNXCswdu86fU2tpoEml4nZd+poR
	 eQ0aLJbVQzCZz9QzHALQCbJDJmU+0IljCo21Q5bN5Bm7RSinZHmM9kZn2YJ+28Da5R
	 F3c4gmZD4pIuuzDv9PqqG1EoltUBB5A6ciiMy22TEZs/vmhrtV3uwpgLjhtCkg5Rdv
	 BvwfrE5ADeSFTJF2WiyoCmebxERnGD71/MtMVpgpA/CV54VKWpKBskx5rbT/nROo1f
	 YwI/WFO7c+f3jMkR6/CwCcPcELWSYBwm/v51JOMhWtqAnUyjyq8a8lee+Mg1IXoDLQ
	 F1y1chgJwbe0w==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH 01/13] arm: mem_init: use memblock_phys_free() to free DMA memory on SA1111
Date: Thu,  6 Mar 2025 20:51:11 +0200
Message-ID: <20250306185124.3147510-2-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250306185124.3147510-1-rppt@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

This will help to pull out memblock_free_all() to generic code.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/arm/mm/init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 5345d218899a..9aec1cb2386f 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -277,14 +277,14 @@ void __init mem_init(void)
 
 	set_max_mapnr(pfn_to_page(max_pfn) - mem_map);
 
-	/* this will put all unused low memory onto the freelists */
-	memblock_free_all();
-
 #ifdef CONFIG_SA1111
 	/* now that our DMA memory is actually so designated, we can free it */
-	free_reserved_area(__va(PHYS_OFFSET), swapper_pg_dir, -1, NULL);
+	memblock_phys_free(PHYS_OFFSET, __pa(swapper_pg_dir) - PHYS_OFFSET);
 #endif
 
+	/* this will put all unused low memory onto the freelists */
+	memblock_free_all();
+
 	free_highpages();
 
 	/*
-- 
2.47.2


