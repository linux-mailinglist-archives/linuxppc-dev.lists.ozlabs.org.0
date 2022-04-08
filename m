Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 163EB4F8F9F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 09:27:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZVFX722jz3dNN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 17:27:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZVCT3GJFz3brc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 17:25:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KZVC83NfLz9sSl;
 Fri,  8 Apr 2022 09:25:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7q_QCmr-WIUr; Fri,  8 Apr 2022 09:25:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KZVC41htkz9sSg;
 Fri,  8 Apr 2022 09:25:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1A6A68B792;
 Fri,  8 Apr 2022 09:25:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YlLnsYJdqYcf; Fri,  8 Apr 2022 09:25:20 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.13])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D3A38B765;
 Fri,  8 Apr 2022 09:25:19 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2387PCdD637067
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 8 Apr 2022 09:25:12 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2387PCNX637066;
 Fri, 8 Apr 2022 09:25:12 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 3/4] mm: Add len and flags parameters to arch_get_mmap_end()
Date: Fri,  8 Apr 2022 09:25:01 +0200
Message-Id: <f95464d3354057c6d40b92d902710eefc2bcb05c.1649401201.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649401201.git.christophe.leroy@csgroup.eu>
References: <cover.1649401201.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1649402687; l=2390; s=20211009;
 h=from:subject:message-id; bh=7CnSGmYwu5de/tnoCsoi/wJWczeTAc4nYg5B5vQynko=;
 b=T6DuHh1k8UF7/NG7IOu1Vkhz9tCJfFDPbguAGNlDOIpZEJ1tWhkuTdqHEVhCQJQfFWhJRqXoKqQY
 ysYfhgUsAbiswCfoaIob91FInfdItyWBImYbBhQ7p0K/UWD92G10
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Will Deacon <will@kernel.org>, Steve Capper <steve.capper@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Powerpc needs flags and len to make decision on arch_get_mmap_end().

So add them as parameters to arch_get_mmap_end().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/processor.h | 4 ++--
 mm/mmap.c                          | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 73e38d9a540c..bd22d94e844d 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -92,8 +92,8 @@
 #endif /* CONFIG_COMPAT */
 
 #ifndef CONFIG_ARM64_FORCE_52BIT
-#define arch_get_mmap_end(addr) ((addr > DEFAULT_MAP_WINDOW) ? TASK_SIZE :\
-				DEFAULT_MAP_WINDOW)
+#define arch_get_mmap_end(addr, len, flags) \
+		(((addr) > DEFAULT_MAP_WINDOW) ? TASK_SIZE : DEFAULT_MAP_WINDOW)
 
 #define arch_get_mmap_base(addr, base) ((addr > DEFAULT_MAP_WINDOW) ? \
 					base + TASK_SIZE - DEFAULT_MAP_WINDOW :\
diff --git a/mm/mmap.c b/mm/mmap.c
index 08b40a9715ee..4d63e1cb3b52 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2118,7 +2118,7 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 }
 
 #ifndef arch_get_mmap_end
-#define arch_get_mmap_end(addr)	(TASK_SIZE)
+#define arch_get_mmap_end(addr, len, flags)	(TASK_SIZE)
 #endif
 
 #ifndef arch_get_mmap_base
@@ -2144,7 +2144,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma, *prev;
 	struct vm_unmapped_area_info info;
-	const unsigned long mmap_end = arch_get_mmap_end(addr);
+	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
 	if (len > mmap_end - mmap_min_addr)
 		return -ENOMEM;
@@ -2192,7 +2192,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm = current->mm;
 	struct vm_unmapped_area_info info;
-	const unsigned long mmap_end = arch_get_mmap_end(addr);
+	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
 	/* requested length too big for entire address space */
 	if (len > mmap_end - mmap_min_addr)
-- 
2.35.1

