Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87979230051
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 05:38:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BG2T43QHMzDqsZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 13:38:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LR4TT1gn; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BG2PS3tMpzDqjY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 13:35:22 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id o22so10710333pjw.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 20:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WECce0LBXYVjXbrlpo11bHUpze9GJI1lVnSDe0W+y+4=;
 b=LR4TT1gn/htVF8c/22u1u+36l6MbOY8omKK1QrfKFh7EpljJaFABhwWa9g2ldtcZqp
 HWOYXXLyiVVdT7tvogFpfVRRJ5NlpM5E/1VlbSLLohpKtL5qu+Eb+GFwFshEelFxMS+4
 756Ga65My7y8NdfBf/I+FUmwNY1tMNDdcArxacDOeyD4ipsFlFdBMoHjZabadWx7Cb+G
 AFIG8FjoYXAjBqVBSu/3Lq30DcpDkkHu29sCZ8oj+ICdNqnoBYxgyyZJPFiR5ClFTrX9
 qdlvfZMYbV93inruHyenWeSb9Ews0pMS5keHZ17XGcfc6GHkP7AcYQsXFdUkcPG4A1zC
 TPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WECce0LBXYVjXbrlpo11bHUpze9GJI1lVnSDe0W+y+4=;
 b=px+EWVn0EPk/frLMzWVptRp5A114fKe+bIV5jwW8HBGSY/5SVpxEM0WlSTCMF/190i
 C+dB6BQNzHtjSwddjs9SYG/a4BxfH0H4/fWAN+vIbJvpyhtngjEE0gbN0A93S2uQcZCK
 Si62wC80Gz4wZ4N0aIH11Yve56If3xOSsGygQH2Py6YhaFdhpW6vcns2h/P9D6An7Q1d
 R3ZYPRKzwn6YVMsa6GHjm1x/5U7Ov9whJPPHLK1DEIMf6qIBpalyYnjvb4MWjKIArDcz
 8EN0lAxS2BbD9rfg5Ig72XteelvMveAINTvFmdw+o0jdFyo9uC6i2elnKhC2yeKGsdqz
 0Y5A==
X-Gm-Message-State: AOAM53209ohHGkqYhNyK9Z85b9DGHrYmm6b5LAEhdN5jpNk/6LOy4zK1
 267iTBASjscF+8NzmfTn2So=
X-Google-Smtp-Source: ABdhPJzuslCQp+8HbB3cDYhA5hqXaz9y/HEvXL86aufZSOGtcy8wjOcm865BoW4An1+Ax+pq2VZyIg==
X-Received: by 2002:a17:902:bb83:: with SMTP id
 m3mr19664485pls.209.1595907319521; 
 Mon, 27 Jul 2020 20:35:19 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (110-174-173-27.tpgi.com.au.
 [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id r4sm998707pji.37.2020.07.27.20.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 20:35:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Subject: [PATCH 16/24] powerpc: use asm-generic/mmu_context.h for no-op
 implementations
Date: Tue, 28 Jul 2020 13:33:57 +1000
Message-Id: <20200728033405.78469-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200728033405.78469-1-npiggin@gmail.com>
References: <20200728033405.78469-1-npiggin@gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/mmu_context.h | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 1a474f6b1992..242bd987247b 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -14,7 +14,9 @@
 /*
  * Most if the context management is out of line
  */
+#define init_new_context init_new_context
 extern int init_new_context(struct task_struct *tsk, struct mm_struct *mm);
+#define destroy_context destroy_context
 extern void destroy_context(struct mm_struct *mm);
 #ifdef CONFIG_SPAPR_TCE_IOMMU
 struct mm_iommu_table_group_mem_t;
@@ -237,27 +239,15 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 }
 #define switch_mm_irqs_off switch_mm_irqs_off
 
-
-#define deactivate_mm(tsk,mm)	do { } while (0)
-
-/*
- * After we have set current->mm to a new value, this activates
- * the context for the new mm so we see the new mappings.
- */
-static inline void activate_mm(struct mm_struct *prev, struct mm_struct *next)
-{
-	switch_mm(prev, next, current);
-}
-
-/* We don't currently use enter_lazy_tlb() for anything */
+#ifdef CONFIG_PPC_BOOK3E_64
+#define enter_lazy_tlb enter_lazy_tlb
 static inline void enter_lazy_tlb(struct mm_struct *mm,
 				  struct task_struct *tsk)
 {
 	/* 64-bit Book3E keeps track of current PGD in the PACA */
-#ifdef CONFIG_PPC_BOOK3E_64
 	get_paca()->pgd = NULL;
-#endif
 }
+#endif
 
 extern void arch_exit_mmap(struct mm_struct *mm);
 
@@ -300,5 +290,7 @@ static inline int arch_dup_mmap(struct mm_struct *oldmm,
 	return 0;
 }
 
+#include <asm-generic/mmu_context.h>
+
 #endif /* __KERNEL__ */
 #endif /* __ASM_POWERPC_MMU_CONTEXT_H */
-- 
2.23.0

