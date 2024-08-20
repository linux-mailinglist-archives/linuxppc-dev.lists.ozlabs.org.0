Return-Path: <linuxppc-dev+bounces-243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1EF958D41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 19:25:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpGYz26G6z2yMB;
	Wed, 21 Aug 2024 03:25:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpGYy72Pnz2yF7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 03:25:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WpGYJ5wD8z9sSN;
	Tue, 20 Aug 2024 19:24:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jYC3KazUz0SB; Tue, 20 Aug 2024 19:24:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WpGY93PQSz9sSR;
	Tue, 20 Aug 2024 19:24:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F28B8B779;
	Tue, 20 Aug 2024 19:24:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Vlae5TXNcBvg; Tue, 20 Aug 2024 19:24:29 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.72])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ED6048B763;
	Tue, 20 Aug 2024 19:24:28 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: CASAUBON Jean Michel <jean-michel.casaubon@cs-soprasteria.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/14] powerpc/32s: Reduce default size of module/execmem area
Date: Tue, 20 Aug 2024 19:23:54 +0200
Message-ID: <c1f6a4e47f177d919561c6e97d31af5564923cf6.1724173828.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724174648; l=2777; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=xWISBC+HZWeT+7sbGlnxkJbaWSL3lIRYp+GxGM24Vcg=; b=kl41C2bw6SknVBYORtjtyT4TK5guk8amlM2kC6nD+cBMDdY5JPuMyrMx6uW/X1VTbQHkdYJqD MElanox8PKuBTBOwm2J9AAeiZQGs4MpOB9eRDFl+xikZxgGIAlThajr
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

book3s/32 platforms have usually more memory than 8xx, but it is still
not worth reserving a full segment (256 Mbytes) for module text.
64Mbytes should be far enough.

Also fix TASK_SIZE when EXECMEM is not selected, and add a build
verification for overlap of module execmem space with user segments.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                         | 7 ++++---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 3 ++-
 arch/powerpc/mm/book3s32/mmu.c               | 2 ++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f050a37aa857..b9f11c262582 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1269,23 +1269,24 @@ config TASK_SIZE_BOOL
 config TASK_SIZE
 	hex "Size of user task space" if TASK_SIZE_BOOL
 	default "0x80000000" if PPC_8xx
-	default "0xb0000000" if PPC_BOOK3S_32
+	default "0xb0000000" if PPC_BOOK3S_32 && EXECMEM
 	default "0xc0000000"
 
 config MODULES_SIZE_BOOL
 	bool "Set custom size for modules/execmem area"
 	depends on EXECMEM && ADVANCED_OPTIONS
-	depends on PPC_8xx
 	help
 	  This option allows you to set the size of kernel virtual address
 	  space dedicated for modules/execmem.
-	  For the time being it is only for 8xx.
+	  For the time being it is only for 8xx and book3s/32. Other
+	  platform share it with vmalloc space.
 
 	  Say N here unless you know what you are doing.
 
 config MODULES_SIZE
 	int "Size of modules/execmem area (In Mbytes)" if MODULES_SIZE_BOOL
 	range 1 256 if EXECMEM
+	default 64 if EXECMEM && PPC_BOOK3S_32
 	default 32 if EXECMEM && PPC_8xx
 	default 0
 
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 52971ee30717..42c3af90d1f0 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -196,7 +196,8 @@ void unmap_kernel_page(unsigned long va);
 #endif
 
 #define MODULES_END	ALIGN_DOWN(PAGE_OFFSET, SZ_256M)
-#define MODULES_VADDR	(MODULES_END - SZ_256M)
+#define MODULES_SIZE	(CONFIG_MODULES_SIZE * SZ_1M)
+#define MODULES_VADDR	(MODULES_END - MODULES_SIZE)
 
 #ifndef __ASSEMBLY__
 #include <linux/sched.h>
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 625fe7d08e06..2db167f4233f 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -223,6 +223,8 @@ int mmu_mark_initmem_nx(void)
 
 	update_bats();
 
+	BUILD_BUG_ON(ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE);
+
 	for (i = TASK_SIZE >> 28; i < 16; i++) {
 		/* Do not set NX on VM space for modules */
 		if (is_module_segment(i << 28))
-- 
2.44.0


