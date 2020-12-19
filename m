Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 273322DF250
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Dec 2020 00:49:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cz2X7077BzDq5t
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Dec 2020 10:49:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LyyIwyTl; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cz2Vf4wnrzDqS5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Dec 2020 10:48:25 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id f14so3673475pju.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 15:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H4Iq/9eTVp0IUe98ScS8UQL+J5vj9xeqoWM1trXMCGo=;
 b=LyyIwyTlunUOiOd5aZ+waTdXF+K6wRyf+sL2faUjAKZo/K1hezSmjMDzJ+P4/yK1XL
 Jo8eBnwDgbq7LUxho8NysNhK4iASE/wCR9fREHfpwdiwQzaxjuLR5OXXevcvKxaqZXCO
 Pc+8giGJezd7DKwwRcqTBr2FRlJ4c61onbBIBUEzyhJUAX/1leu9qfOB0OZZ8btY6XCI
 e3C/P/RhpWm9Qruc8CPxc+x8Wcj3Fqs1Dv40ZZ9InCAHdIljuEzABQ6D2PlALF4cdll2
 U3SMpfD/1byFhJ0iJBVHDEWCLZLsfuMlViuhKY0xwa6fr5G96VzCMH+362JtbPYXRIIi
 tojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H4Iq/9eTVp0IUe98ScS8UQL+J5vj9xeqoWM1trXMCGo=;
 b=HO4cOPnmpm+dXEF7RPvkV+u/Q7MdmHEVBxrBxiIqzkfVws9shRC8+d09ZCHte1tzSg
 eJmxi0yL7XZBNG0ay6xcMdcHknTdmK7cuTPoeA8G+c322TF4bgA0d1u5Y5MDRR2ZxSLi
 azW9Nx7naTRQ7/boYdWPdzL8HoyvmcWkrXykQ29hTrWCgmJvdxUZ7PeNt/Uthj+CjrH2
 xYQ3tF2G8I57+cf9R1GqiD/EJPI/mjiXd/t41hBpygmr+bUFT/qcHI1GNuKahhJYFurr
 kxtZAdvBgini3UIfgjDYh5vm6f3+2t7m45H/11AKYi4R/4jhR5I9SlFb8bOIDfVbtfat
 MhYA==
X-Gm-Message-State: AOAM532SWji9WeShn4y1NxMkEqSQacEct75hEuJRNFRFO2iS8qtlx4La
 tjFqJyfUBgIPARgJrpthW1haQvaoK4s=
X-Google-Smtp-Source: ABdhPJy675pJt34ULW+n2p+eqQ2zW/Zd8Q4hLcmm8zlqWEciRf98/sTjVoWIACtYoRNk4ZMWy6QqCQ==
X-Received: by 2002:a17:90b:68d:: with SMTP id
 m13mr10751085pjz.164.1608421703176; 
 Sat, 19 Dec 2020 15:48:23 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id k15sm12729275pfh.40.2020.12.19.15.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Dec 2020 15:48:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/5] powerpc/64s: update_mmu_cache inline the radix test
Date: Sun, 20 Dec 2020 09:48:09 +1000
Message-Id: <20201219234813.830747-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201219234813.830747-1-npiggin@gmail.com>
References: <20201219234813.830747-1-npiggin@gmail.com>
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

This allows the function to be entirely noped if hash support is
compiled out (not possible yet).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/pgtable.h | 11 ++++++++++-
 arch/powerpc/mm/book3s32/mmu.c            |  4 ++--
 arch/powerpc/mm/book3s64/hash_utils.c     |  7 ++-----
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/pgtable.h b/arch/powerpc/include/asm/book3s/pgtable.h
index 0e1263455d73..914e9fc7b069 100644
--- a/arch/powerpc/include/asm/book3s/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/pgtable.h
@@ -35,7 +35,16 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
  * corresponding HPTE into the hash table ahead of time, instead of
  * waiting for the inevitable extra hash-table miss exception.
  */
-void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
+void hash__update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
+
+static inline void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep)
+{
+#ifdef CONFIG_PPC64
+	if (radix_enabled())
+		return;
+#endif
+	hash__update_mmu_cache(vma, address, ptep);
+}
 
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 859e5bd603ac..c5a570ca37ff 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -325,8 +325,8 @@ static void hash_preload(struct mm_struct *mm, unsigned long ea)
  *
  * This must always be called with the pte lock held.
  */
-void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
-		      pte_t *ptep)
+void hash__update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
+			    pte_t *ptep)
 {
 	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		return;
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 73b06adb6eeb..d52a3dee7cf2 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1667,8 +1667,8 @@ static void hash_preload(struct mm_struct *mm, pte_t *ptep, unsigned long ea,
  *
  * This must always be called with the pte lock held.
  */
-void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
-		      pte_t *ptep)
+void hash__update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
+			    pte_t *ptep)
 {
 	/*
 	 * We don't need to worry about _PAGE_PRESENT here because we are
@@ -1677,9 +1677,6 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
 	unsigned long trap;
 	bool is_exec;
 
-	if (radix_enabled())
-		return;
-
 	/* We only want HPTEs for linux PTEs that have _PAGE_ACCESSED set */
 	if (!pte_young(*ptep) || address >= TASK_SIZE)
 		return;
-- 
2.23.0

