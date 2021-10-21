Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7F1436D8D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 00:36:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2Qk4hfXz3dcP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:36:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qt/SUvbG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qt/SUvbG; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2Hr6cZJz3cNP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 09:30:48 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id t11so1388824plq.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k7Tkq5sXkw4cpQUD/GPghO3VPNRygmiIp7/r25/whiQ=;
 b=qt/SUvbGtdZEm+wLLJxBbHLBtOeihVnfrGrTORuKXq2ZouvirE/3iJFW2EDh7MoPxh
 u4MMO/U9cW+OfAG93KoYx2toxsC7JBUUwPX2ScWkPgJUe3jnVpF1ZQGWBdjF0/xnen4A
 6al964On93lxnniNmrxTOvYVYPNDaqx8MLXXyq5PpAFsAlckTNWTgUh/OAO2eq6LfbVg
 2GqkFw98p7uVFue2HhRM+EatupjggcnN5OdKtPFMFlIHvAGQgvW0hwSs7qdjNdxV/gj6
 M6QyNLZyGIIwyqDGYVTPZVJKPTbTHGBja/e80SaGwCM2T1L6t9S7JkTQR/Tjaqjoj/Sa
 OGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k7Tkq5sXkw4cpQUD/GPghO3VPNRygmiIp7/r25/whiQ=;
 b=ONq7JO2dN5uhRiJhR2vfgOkiJMq0LTa018XFZrkCk90/gtUC8iPMdW2/djvdJtsHi5
 Z9nf+SHW7u5vju/U+PuW8btai0x4rdB46G+CyCA7eDoBlYheXhYKy3E5kpP2IxbiA4Di
 JxbOo3TM+nMblDD1ogFrs82GVcMoVvGBagAZXVb5ItBQEj610RQq2ZSBmtXX2rgGFGGa
 fQm2xWyzLMqW+6kep2nbiil6i9fMciv4ObiAWpR10s7sXikqnjrbNnQU7y39VkzsMD3y
 0DdR084eFfPXLa3wxiwI2jgu73VMA/z4tEJuKHCeUto4VX9u6Ez+H/0HIYnbXnBlLVWu
 +OiQ==
X-Gm-Message-State: AOAM533yQ8d8F9UytgPckAJr5tT7x9lN3XALrLAcAsfqtWoq4AA9MF4x
 WlEiULtDoK8Qf4OnGoFWyM5uAvozTiw=
X-Google-Smtp-Source: ABdhPJwjO9evg40scPGSangzz3g6FnYzVXLq1Evz9hKcUBC/xYmQTMyRef+Um9toA1sRzJgsk+kinA==
X-Received: by 2002:a17:90b:17d0:: with SMTP id
 me16mr10113532pjb.152.1634855446421; 
 Thu, 21 Oct 2021 15:30:46 -0700 (PDT)
Received: from bobo.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id e6sm7205716pfm.212.2021.10.21.15.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:30:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 09/18] powerpc/64s: move page size definitions from hash
 specific file
Date: Fri, 22 Oct 2021 08:30:04 +1000
Message-Id: <20211021223013.2641952-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021223013.2641952-1-npiggin@gmail.com>
References: <20211021223013.2641952-1-npiggin@gmail.com>
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

The radix code uses some of the psize variables. Move the common
ones from hash_utils.c to pgtable.c.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 5 -----
 arch/powerpc/mm/book3s64/pgtable.c    | 7 +++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index ffc52ff0b3f0..1cd28e3cd3b5 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -99,8 +99,6 @@
  */
 
 static unsigned long _SDR1;
-struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
-EXPORT_SYMBOL_GPL(mmu_psize_defs);
 
 u8 hpte_page_sizes[1 << LP_BITS];
 EXPORT_SYMBOL_GPL(hpte_page_sizes);
@@ -114,9 +112,6 @@ EXPORT_SYMBOL_GPL(mmu_linear_psize);
 int mmu_virtual_psize = MMU_PAGE_4K;
 int mmu_vmalloc_psize = MMU_PAGE_4K;
 EXPORT_SYMBOL_GPL(mmu_vmalloc_psize);
-#ifdef CONFIG_SPARSEMEM_VMEMMAP
-int mmu_vmemmap_psize = MMU_PAGE_4K;
-#endif
 int mmu_io_psize = MMU_PAGE_4K;
 int mmu_kernel_ssize = MMU_SEGSIZE_256M;
 EXPORT_SYMBOL_GPL(mmu_kernel_ssize);
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 049843c8c875..06565b452cbc 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -22,6 +22,13 @@
 
 #include "internal.h"
 
+struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
+EXPORT_SYMBOL_GPL(mmu_psize_defs);
+
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+int mmu_vmemmap_psize = MMU_PAGE_4K;
+#endif
+
 unsigned long __pmd_frag_nr;
 EXPORT_SYMBOL(__pmd_frag_nr);
 unsigned long __pmd_frag_size_shift;
-- 
2.23.0

