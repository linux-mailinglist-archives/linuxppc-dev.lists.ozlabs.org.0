Return-Path: <linuxppc-dev+bounces-6961-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3921AA5F661
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 14:51:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD86K6ZZDz3c97;
	Fri, 14 Mar 2025 00:51:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741873865;
	cv=none; b=WzhJp46ri41akPJUL0NlH48Y93+XGAP5E+DjnWG0eYHS6irErD4Q3kZcXm3lG5PuJtaAB6JPikN2yC5d2ca7ZbG4jntoLIvXAkChjaj4bJaR5nGYtr+6XDbUZDiPSLt/uAEQON4EumJgzTbvcClnj5yQ73BHCEgr82vWbRLUbDH7tNQ/NERh84lO8XGNy9M0N9agXvLLvkwpt2Di4eapWHFEoCZcwrbRSx47JcpELOZxe7Phy4EGm5rJyFhXmNlETQpKBPwpzIrUg9+28d8abjGLqNFdDmmR8NmIxsvPN5Pyy++76LLSVzkS+eWmYGxCHjwDd6p9yL/VSIxXE32l2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741873865; c=relaxed/relaxed;
	bh=HLWO0CMiutRC/UaFKgn3zaOpEPV2sObAb62rg+W+5EI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n5KvFSVl/Ranqwvwv3iUtOoWiwAqQSIhPh+YWyoGYHsZFyo/teGAKTB8g1I6fMPF+750T5w8LkjlhmKwyaNSyukh8wfUJeAbt+BibR6UBJVX3ByQtK2Cwse7JXptM7H05yZkAxgVCG1YACcW2l1yMHBp7osRjzXpbXyNQ4zwyCrDGI8UaBlk3w1R3vEEHz0aZvVPRfXXeKiRdWcJwtVywM/FQoQciNwTwC0XNIH1VjZSAFSGtC/TfhttUuseSDVhyEh69YVjvH8BnCZM4U7gTfWTF/pXneYP0DF22dG7snEH7GUXV8j8KrGyyp7hEL6k7avRSVW1ZNOUfsVGPqj8AA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rfg04cX8; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rfg04cX8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD86K0wdcz30Tp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 00:51:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E6815C5E36;
	Thu, 13 Mar 2025 13:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233FDC4CEEB;
	Thu, 13 Mar 2025 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741873863;
	bh=3f2PL8+tvQz4kqOX8BsTM2Qrh30qjoJp6oFsaw3/420=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rfg04cX8uRvlfnBvZ49PtoBxznACelq74wTMIN8qaGJSvGheiS5WY6EK6llc1XTtF
	 6gfjK8h75FHHUhNF68dOsS/oFtjdkjJ/UdR0JOkjjNhf5t/t1YN6tT6GfUQu20OxSn
	 sbuSoNpq+VCYRnQZPmaeVNtJCUjqNbpq4ZSW1ecITC7ukkhURcBZHswtmqwfq9PUxP
	 RWxubMbulZgriXyglKo2XBY7VMr6SwCl2LDKXrjFYY2eYuzUNOABYWueIt6T5V5EjL
	 Sgo45wepOzt0oGbaLtKllAiqkUdgwedzAj+a3s0rcnt1uUTdhMjbsGZmC+q9b9/wNZ
	 UK2vqcKRO6tkw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
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
	Mark Brown <broonie@kernel.org>,
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
Subject: [PATCH v2 03/13] hexagon: move initialization of init_mm.context init to paging_init()
Date: Thu, 13 Mar 2025 15:49:53 +0200
Message-ID: <20250313135003.836600-4-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250313135003.836600-1-rppt@kernel.org>
References: <20250313135003.836600-1-rppt@kernel.org>
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
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

This will help with pulling out memblock_free_all() to the generic
code and reducing code duplication in arch::mem_init().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/hexagon/mm/init.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/hexagon/mm/init.c b/arch/hexagon/mm/init.c
index 3458f39ca2ac..508bb6a8dcc9 100644
--- a/arch/hexagon/mm/init.c
+++ b/arch/hexagon/mm/init.c
@@ -59,14 +59,6 @@ void __init mem_init(void)
 	 *  To-Do:  someone somewhere should wipe out the bootmem map
 	 *  after we're done?
 	 */
-
-	/*
-	 * This can be moved to some more virtual-memory-specific
-	 * initialization hook at some point.  Set the init_mm
-	 * descriptors "context" value to point to the initial
-	 * kernel segment table's physical address.
-	 */
-	init_mm.context.ptbase = __pa(init_mm.pgd);
 }
 
 void sync_icache_dcache(pte_t pte)
@@ -103,6 +95,12 @@ static void __init paging_init(void)
 
 	free_area_init(max_zone_pfn);  /*  sets up the zonelists and mem_map  */
 
+	/*
+	 * Set the init_mm descriptors "context" value to point to the
+	 * initial kernel segment table's physical address.
+	 */
+	init_mm.context.ptbase = __pa(init_mm.pgd);
+
 	/*
 	 * Start of high memory area.  Will probably need something more
 	 * fancy if we...  get more fancy.
-- 
2.47.2


