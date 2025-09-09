Return-Path: <linuxppc-dev+bounces-11944-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7362B4AA43
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 12:20:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLfwN50Sqz2yr8;
	Tue,  9 Sep 2025 20:20:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757413236;
	cv=none; b=aCYK23zJQozmdciG50ACmLNS5juv+wSsAwBdZ4eMG6/JoTeh5j3QqKyb+u7n0Xx93P67THKSzrY6aahMxMDh/nHoO6B8d4yuLeP6ikC7m1nUxVz2QfJVW86F2cjdyhzwxmXYkNt1DludYzylNZdD3KpB+hFBQlXdI7nXaMg1cHuhB7sPfA66KuL+vwMuyz2fTlXgxnqyeWyQrvHBLn0o6i0JD9sFjSPxf9eUUwyZ94MVv5SD2f5PhMeZsWECZYWEd4ETSVSgNVPM4GgEsIqsUl7AGoKW1/iumoB0Ln1LYeAQPKkzl2aDecj9pMstKof0kagqofIYfJXEQSJJPUx5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757413236; c=relaxed/relaxed;
	bh=w3fCgu/e4g93MN8EsGeR/hx6rzYlzv34KWWv3FR0JQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nFYuCxw/EbhbwzPuCInr5+Zi4fYb9VwHmmpDpd9WdrK6F9GVTzoJJo7EYWAJhpTJ9RshdOX58qu7qwhSYF/WaEKUvmF0nH4VGuTIyy3jUA3lrIMlsuwv6qMCMSegA4B7M5yqrQIDhwpsvqZyYZzNFvhVca5VW/qeleuMG6P5YlAZwqgBTbQEB12lwk7wRhKCRtdBVi4rVbikHeK5bj32WvXShKN2jDwi9e/2X+vdOkLr9Niz/JN3RnOD5chKjIleM8P5zoaXgShdXPIyHdOX50mXziAeKNncRPsARDZqAThll+z7ndh2i31qfBNvsHZyzOkPIa2QET8vzjRJmMpHwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLfwM72JSz2xnq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 20:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cLfY46PJVz9sRh;
	Tue,  9 Sep 2025 12:03:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zw6k5wfbw6r7; Tue,  9 Sep 2025 12:03:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cLfY44SkBz9sRg;
	Tue,  9 Sep 2025 12:03:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 66B198B766;
	Tue,  9 Sep 2025 12:03:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id E-gQL_c33zki; Tue,  9 Sep 2025 12:03:52 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 30CE98B764;
	Tue,  9 Sep 2025 12:03:52 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Erhard Furtner <erhard_f@mailbox.org>
Subject: [PATCH v2] powerpc/32: Remove PAGE_KERNEL_TEXT to fix startup failure
Date: Tue,  9 Sep 2025 12:03:49 +0200
Message-ID: <8e2d793abf87ae3efb8f6dce10f974ac0eda61b8.1757412205.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757412230; l=3895; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=AOEaSonLtPZErc53eenT+EFbdPGQtfmJuRx+JaONPkE=; b=ywqv6sdz3DMjOTmHk3oFWKHjRSP4YPTppu/hzY2nkVSPy0mIV3Pa03KSqpKs+Cy0q95UbwVC4 7DZITk8d5VSCcW209ZE+Co1DBdtVckdvzVQCqceWyMfAGH4MKw2BT0T
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PAGE_KERNEL_TEXT is an old macro that is used to tell kernel whether
kernel text has to be mapped read-only or read-write based on build
time options.

But nowadays, with functionnalities like jump_labels, static links,
etc ... more only less all kernels need to be read-write at some
point, and some combinations of configs failed to work due to
innacurate setting of PAGE_KERNEL_TEXT. On the other hand, today
we have CONFIG_STRICT_KERNEL_RWX which implements a more controlled
access to kernel modifications.

Instead of trying to keep PAGE_KERNEL_TEXT accurate with all
possible options that may imply kernel text modification, always
set kernel text read-write at startup and rely on
CONFIG_STRICT_KERNEL_RWX to provide accurate protection.

Do this by passing PAGE_KERNEL_X to map_kernel_page() in
__maping_ram_chunk() instead of passing PAGE_KERNEL_TEXT. Once
this is done, the only remaining user of PAGE_KERNEL_TEXT is
mmu_mark_initmem_nx() which uses it in a call to setibat().
As setibat() ignores the RW/RO, we can seamlessly replace
PAGE_KERNEL_TEXT by PAGE_KERNEL_X here as well and get rid of
PAGE_KERNEL_TEXT completely.

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Closes: https://lore.kernel.org/all/342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org/
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Revised commit message
---
 arch/powerpc/include/asm/pgtable.h | 12 ------------
 arch/powerpc/mm/book3s32/mmu.c     |  4 ++--
 arch/powerpc/mm/pgtable_32.c       |  2 +-
 3 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 93d77ad5a92f..d8f944a5a037 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -20,18 +20,6 @@ struct mm_struct;
 #include <asm/nohash/pgtable.h>
 #endif /* !CONFIG_PPC_BOOK3S */
 
-/*
- * Protection used for kernel text. We want the debuggers to be able to
- * set breakpoints anywhere, so don't write protect the kernel text
- * on platforms where such control is possible.
- */
-#if defined(CONFIG_KGDB) || defined(CONFIG_XMON) || defined(CONFIG_BDI_SWITCH) || \
-	defined(CONFIG_KPROBES) || defined(CONFIG_DYNAMIC_FTRACE)
-#define PAGE_KERNEL_TEXT	PAGE_KERNEL_X
-#else
-#define PAGE_KERNEL_TEXT	PAGE_KERNEL_ROX
-#endif
-
 /* Make modules code happy. We don't set RO yet */
 #define PAGE_KERNEL_EXEC	PAGE_KERNEL_X
 
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index be9c4106e22f..c42ecdf94e48 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -204,7 +204,7 @@ int mmu_mark_initmem_nx(void)
 
 	for (i = 0; i < nb - 1 && base < top;) {
 		size = bat_block_size(base, top);
-		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
+		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_X);
 		base += size;
 	}
 	if (base < top) {
@@ -215,7 +215,7 @@ int mmu_mark_initmem_nx(void)
 				pr_warn("Some RW data is getting mapped X. "
 					"Adjust CONFIG_DATA_SHIFT to avoid that.\n");
 		}
-		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
+		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_X);
 		base += size;
 	}
 	for (; i < nb; i++)
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 15276068f657..0c9ef705803e 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -104,7 +104,7 @@ static void __init __mapin_ram_chunk(unsigned long offset, unsigned long top)
 	p = memstart_addr + s;
 	for (; s < top; s += PAGE_SIZE) {
 		ktext = core_kernel_text(v);
-		map_kernel_page(v, p, ktext ? PAGE_KERNEL_TEXT : PAGE_KERNEL);
+		map_kernel_page(v, p, ktext ? PAGE_KERNEL_X : PAGE_KERNEL);
 		v += PAGE_SIZE;
 		p += PAGE_SIZE;
 	}
-- 
2.49.0


