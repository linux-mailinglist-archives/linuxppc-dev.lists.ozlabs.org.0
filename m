Return-Path: <linuxppc-dev+bounces-239-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B88958D38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 19:25:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpGYh0r3bz2yDx;
	Wed, 21 Aug 2024 03:24:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpGYg2Qn8z2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 03:24:55 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WpGYC1QTrz9sSg;
	Tue, 20 Aug 2024 19:24:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sfity9e57yWC; Tue, 20 Aug 2024 19:24:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WpGY75q1Vz9sST;
	Tue, 20 Aug 2024 19:24:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B64688B763;
	Tue, 20 Aug 2024 19:24:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id txbMshjJBVca; Tue, 20 Aug 2024 19:24:27 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.72])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 527DE8B779;
	Tue, 20 Aug 2024 19:24:27 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: CASAUBON Jean Michel <jean-michel.casaubon@cs-soprasteria.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/14] powerpc/8xx: Reduce default size of module/execmem area
Date: Tue, 20 Aug 2024 19:23:50 +0200
Message-ID: <8db23b61e33a0d1913d814f94bfe71ba7ac78b0f.1724173828.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1724173828.git.christophe.leroy@csgroup.eu>
References: <cover.1724173828.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724174648; l=2619; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Y2xw1EmXuQnmvM6jv8OU3bSa2BbXNV5g69vwUeoSLEg=; b=qDMjcatkrMNnuivxhHrYXeVieiaXOcPqMImPf++D8bSb+/sG61dNi94gwG3ro9RcHRj3g5w5T u/sJ6MUi0QHBgWu4PWYW3LKDfxyEVgrmjFhjd+z6X/dDl7bSpvcoc5A
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

8xx boards don't have much memory, the two I know have respectively
32Mbytes and 128Mbytes, so there is no point in having 256 Mbytes of
memory for module text.

Reduce it to 32Mbytes for 8xx, that's more than enough.

Nevertheless, make it a configurable value so that it can be customised
if needed.

Also add a build verification for overlap of module execmem space
with user PMD.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                         | 18 ++++++++++++++++++
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h |  3 ++-
 arch/powerpc/mm/nohash/8xx.c                 |  2 ++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 3c202785a146..f050a37aa857 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1271,6 +1271,24 @@ config TASK_SIZE
 	default "0x80000000" if PPC_8xx
 	default "0xb0000000" if PPC_BOOK3S_32
 	default "0xc0000000"
+
+config MODULES_SIZE_BOOL
+	bool "Set custom size for modules/execmem area"
+	depends on EXECMEM && ADVANCED_OPTIONS
+	depends on PPC_8xx
+	help
+	  This option allows you to set the size of kernel virtual address
+	  space dedicated for modules/execmem.
+	  For the time being it is only for 8xx.
+
+	  Say N here unless you know what you are doing.
+
+config MODULES_SIZE
+	int "Size of modules/execmem area (In Mbytes)" if MODULES_SIZE_BOOL
+	range 1 256 if EXECMEM
+	default 32 if EXECMEM && PPC_8xx
+	default 0
+
 endmenu
 
 if PPC64
diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index a756a1e59c54..2986f9ba40b8 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -170,8 +170,9 @@
 
 #define mmu_linear_psize	MMU_PAGE_8M
 
-#define MODULES_VADDR	(PAGE_OFFSET - SZ_256M)
 #define MODULES_END	PAGE_OFFSET
+#define MODULES_SIZE	(CONFIG_MODULES_SIZE * SZ_1M)
+#define MODULES_VADDR	(MODULES_END - MODULES_SIZE)
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 4c2f9d716993..8b54f12d1889 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -207,6 +207,8 @@ void __init setup_initial_memory_limit(phys_addr_t first_memblock_base,
 
 	/* 8xx can only access 32MB at the moment */
 	memblock_set_current_limit(min_t(u64, first_memblock_size, SZ_32M));
+
+	BUILD_BUG_ON(ALIGN_DOWN(MODULES_VADDR, PGDIR_SIZE) < TASK_SIZE);
 }
 
 int pud_clear_huge(pud_t *pud)
-- 
2.44.0


