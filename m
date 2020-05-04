Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EFB1C396A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 14:32:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G2Kx6mPHzDqSB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 22:32:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a+sgf7si; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G2Gq2dq5zDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 22:29:20 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id x15so5430951pfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 May 2020 05:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=opqu9eIqqtL16SC7d1UqvWpRAzAWBG9u3ryRUvHxu8E=;
 b=a+sgf7siF6jU9BmKBfawLaChFDhgOGoS12bQUpj9/BclMZ2hqCyZJzIkVfgFaSb2ro
 NSBFXWQjSS1DI/bs6bRwBJWjl0/ADgOUKPmIzmXKxCoZXk8llRYycFzh3RANTotoCjiB
 UQ/DCU7vrHiQ6zsoGNW6kf6G2KN6wyXoc/kvLURvSssxRzdZ0o3Uy1nUWO2ws2F0ZK80
 tNJru/gddgZY/2NQyn26RmXl8jOYlmQImc0OUQP4OPZNSB2BojaQQEspd18NGuWFSoZe
 Uhtz+iagh2Ab0DHPAWxf6OGxvK03WxmvTdGDbBjI0lG4ImXGmMUk6G7stMHtq6dEEYAe
 gvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=opqu9eIqqtL16SC7d1UqvWpRAzAWBG9u3ryRUvHxu8E=;
 b=pPkhHfElr9rsPwowmYoqrbmd909zMsOfvSh8VByPFGJEC5/4OvC6256LF1/+JhRCKD
 0giHV/DwAgJtDMgdJ5s+T6bUMsgfVISlWRZbDDxU3YgGBOBva7nLce3fn4USqULFhCbk
 mv6RaCVkmfK6I+2pj8EK5D7SikUx1RjQp3RU2DFCwvDGOWDisG8DYJoTBdGqpUeuYmuk
 dQ7bgY1cro6RLtHYn4egVJy3+NzWWNqdil/RJg0DziwyVXV0fdu0Ow7rW+zoDBcBlRDX
 NSrWXwLLhfkODCvGcg0SNheAezaf/pm4by1At9LhvFfvYoY5CHNREYg0omaCfgHPQGfH
 NxCA==
X-Gm-Message-State: AGi0PuYWIpOYJcXk4KWZU4n6fU/aRRF/AwCpYWv5qtqiTWUOv9jdpmHn
 uzqP6dCMJDKfzH9rd6PEW1iMmZiQ
X-Google-Smtp-Source: APiQypJntMJ9iMXcCU1VpV39yl3AWpbcQ0mHd+6D8P0j3k1q67Jxj0TOrgS3busWKxBYnK5Vxk8ssQ==
X-Received: by 2002:a62:7555:: with SMTP id q82mr17025033pfc.136.1588595357260; 
 Mon, 04 May 2020 05:29:17 -0700 (PDT)
Received: from bobo.ibm.com (193-116-199-65.tpgi.com.au. [193.116.199.65])
 by smtp.gmail.com with ESMTPSA id 189sm8874070pfd.55.2020.05.04.05.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 05:29:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/radix: Don't prefetch DAR in update_mmu_cache
Date: Mon,  4 May 2020 22:29:07 +1000
Message-Id: <20200504122907.49304-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The idea behind this prefetch was to kick off a page table walk before
returning from the fault, getting some pipelining advantage.

But this never showed up any noticable performance advantage, and in
fact with KUAP the prefetches are actually blocked and cause some
kind of micro-architectural fault. Removing this improves page fault
microbenchmark performance by about 9%.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |  7 +++++--
 arch/powerpc/mm/book3s64/hash_utils.c        |  5 -----
 arch/powerpc/mm/book3s64/pgtable.c           | 13 -------------
 3 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 368b136517e0..59ed15e43e89 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1139,8 +1139,11 @@ extern pmd_t mk_pmd(struct page *page, pgprot_t pgprot);
 extern pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot);
 extern void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 		       pmd_t *pmdp, pmd_t pmd);
-extern void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr,
-				 pmd_t *pmd);
+static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
+					unsigned long addr, pmd_t *pmd)
+{
+}
+
 extern int hash__has_transparent_hugepage(void);
 static inline int has_transparent_hugepage(void)
 {
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 845da1e8ca4f..2458615805ee 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1672,11 +1672,6 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
 	unsigned long trap;
 	bool is_exec;
 
-	if (radix_enabled()) {
-		prefetch((void *)address);
-		return;
-	}
-
 	/* We only want HPTEs for linux PTEs that have _PAGE_ACCESSED set */
 	if (!pte_young(*ptep) || address >= TASK_SIZE)
 		return;
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index e0bb69c616e4..821b483a5ac3 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -146,19 +146,6 @@ pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 	pmdv &= _HPAGE_CHG_MASK;
 	return pmd_set_protbits(__pmd(pmdv), newprot);
 }
-
-/*
- * This is called at the end of handling a user page fault, when the
- * fault has been handled by updating a HUGE PMD entry in the linux page tables.
- * We use it to preload an HPTE into the hash table corresponding to
- * the updated linux HUGE PMD entry.
- */
-void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr,
-			  pmd_t *pmd)
-{
-	if (radix_enabled())
-		prefetch((void *)addr);
-}
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 /* For use by kexec */
-- 
2.23.0

