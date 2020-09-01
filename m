Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C96F25903C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 16:22:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgq5T49rtzDqMx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 00:22:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BxF08WZg; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgpzW6MXMzDqMC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 00:16:53 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id ls14so675173pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 07:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=czZmpjb3vWAAbgZB/UHnONa23SwklaXJVc63sdY/64U=;
 b=BxF08WZg7f9I9Et2+jcWpVaEzPjARaog5uM5wGwG4A58L3P0zaVBFSmpRtrYT6Hy0W
 bKOQSv85r2Fkq2HviYC2riKtzPV6ReyulkO7gR214ovKByXCloxpk+/fHJjwRWkryA1X
 TTgsWzcq8LK326EbUzegAFcO2haF3IQLJEcS7BDHgFvEUC48w+8ePTaVSr8G/d2S/G1L
 bZGFFm/WYLmc1vGGVcq/8nbBrjCVXfJwI9PW44HCjeKraYST3Cd0XckNAD5no3j4Wt5H
 uP3ZVzkLnLNLQ4U60lo2QOjU4i1QXJ+ooiqDUUe9iUn0vKTL4JrCKKLafGzybt/7LLfq
 g+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=czZmpjb3vWAAbgZB/UHnONa23SwklaXJVc63sdY/64U=;
 b=VlReTHiioMWCe2bw2sfJ/usPNA9ToUw8DTQVbEGL0MwTvV+MBmUi/fTQo1j+wERucO
 fTEeg3oy49FdBwT0v/U9qq8PAovXrAjqSqybahGm+/+RFOewep7V/ZA4MOnQLjyv0Gta
 RchHRAbb35FmCdcWt9opTsOBm9iArpRyw1bpb4vc5hsrFcqB+Yw4NNP2XMkKy9gcN3mO
 Kf2CASAL+qqee4YApH35MvhGm66kf8/nVnsx7r0sEO+/sKjkEniffewTqGCHdTwIjEqU
 ygNC3bWlgGFBzzfn9c+fdZuICSvTuIsHpdKhhqBbbk/rkUTvssgwJ4xqM+0/PrTKQ4eM
 ujWA==
X-Gm-Message-State: AOAM532cPEzZY0n6FtffXAUo9Vt/1JnC4T591t77OWp24URyOKoBU6Wb
 AdlSuZBwv6LxIJyA5w6gmuI=
X-Google-Smtp-Source: ABdhPJxhNbtvq/3SFlenMBvIZJCfMciJFkJ0i1FlBjYooCyqjinZrlhhJXw4FKe0Q5JjFy8BKa4yrw==
X-Received: by 2002:a17:90a:de87:: with SMTP id
 n7mr1784368pjv.208.1598969809728; 
 Tue, 01 Sep 2020 07:16:49 -0700 (PDT)
Received: from bobo.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id w9sm2212816pgg.76.2020.09.01.07.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 07:16:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Subject: [PATCH v3 16/23] powerpc: use asm-generic/mmu_context.h for no-op
 implementations
Date: Wed,  2 Sep 2020 00:15:32 +1000
Message-Id: <20200901141539.1757549-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200901141539.1757549-1-npiggin@gmail.com>
References: <20200901141539.1757549-1-npiggin@gmail.com>
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

Cc: linuxppc-dev@lists.ozlabs.org
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/mmu_context.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 7f3658a97384..a3a12a8341b2 100644
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
@@ -235,27 +237,26 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 }
 #define switch_mm_irqs_off switch_mm_irqs_off
 
-
-#define deactivate_mm(tsk,mm)	do { } while (0)
-
 /*
  * After we have set current->mm to a new value, this activates
  * the context for the new mm so we see the new mappings.
  */
+#define activate_mm activate_mm
 static inline void activate_mm(struct mm_struct *prev, struct mm_struct *next)
 {
 	switch_mm(prev, next, current);
 }
 
 /* We don't currently use enter_lazy_tlb() for anything */
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
 
@@ -298,5 +299,7 @@ static inline int arch_dup_mmap(struct mm_struct *oldmm,
 	return 0;
 }
 
+#include <asm-generic/mmu_context.h>
+
 #endif /* __KERNEL__ */
 #endif /* __ASM_POWERPC_MMU_CONTEXT_H */
-- 
2.23.0

