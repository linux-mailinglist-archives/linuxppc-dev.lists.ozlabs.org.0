Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7C98F9A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 06:13:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468qgN3680zDq8D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 14:13:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q7DanO/t"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468qY75XPvzDrDN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 14:07:55 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id c81so2415117pfc.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 21:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XFeI3MMdw+vLf2h/eQPceYAz2jMEXM4TlUoQFqFFVos=;
 b=Q7DanO/tyoXZpvkxgVZBBGnnNFAk3gBkKb6duBHkXlR3rt3Iw7VwMetiZO1Rfo3pZf
 7db9vZq0qNs47Ne0UWKWDuzvStmr+L3x8gizJv4A0OreGoi+ryiq5pHnXX5Qajzbuv0p
 Q35Dqo9m2hYMu+9rggPRt+C1q66xPMCa8J6cj1V8n/OhsbP88/oYAzdPO4OyoickeOsP
 zyP6GFknff3K0gyBHfiRNqKPWRgCOos3dqhQK35vP4gSuPCYkPbqmVAJvdgdSRqDIA2g
 jnmOOOwDbg1IDMyqXpr1AEwk+6iXyDgr0oyOqRSU4vDvCL2BWt+gE8QwVJoD1KfPZsmT
 o8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XFeI3MMdw+vLf2h/eQPceYAz2jMEXM4TlUoQFqFFVos=;
 b=dm+yjLM8C0nez2oh5B6IYPvaB19/MhpPwkQ5h4TnsYnEbntkNyM8iaCoI4SeMxyiL0
 M9vE5BbBTr3us/3DJBxAhITNhtUBCvlnw0zRznWfcjJLcqB2NYRnHZyZdSt4Y1ZDrZ8M
 Fr59NbeqdyVOeQPk6p6SuiFfFrhQ4avZZVqcWwOBvjS0t+5xUZ6DFipzjnDpWkD5cWEC
 0QNiROTU/6V++Ypst5Wrx6Tw+GcAxCbj99mPRE+2zpvG0smkxale59n+iXwvC8pv1Hra
 4JCdicT4R9uOkvb+hfpq1vRuwyZZts4tj9RQDF77ncDkhqMALxZyyFldvyKKUR2UMZR8
 G8eg==
X-Gm-Message-State: APjAAAVcQilmoLJVZqCr7da9uSUy4koZgpDdVYkwHh/N5nR8S+ioRcva
 XlPAHqnrI36xeSIXgVydSS2SNufc
X-Google-Smtp-Source: APXvYqypvWxkK795DVau1RqIoQIFof/e8f6iHZkDn4IUiEUphR6q+HTEg+ZgpneyfKuR2HCnfq76oQ==
X-Received: by 2002:a62:8344:: with SMTP id h65mr8834139pfe.85.1565928473779; 
 Thu, 15 Aug 2019 21:07:53 -0700 (PDT)
Received: from bobo.local0.net (61-68-63-22.tpgi.com.au. [61.68.63.22])
 by smtp.gmail.com with ESMTPSA id j187sm4994850pfg.178.2019.08.15.21.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 21:07:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/64s/radix: all CPUs should flush local
 translation structure before turning MMU on
Date: Fri, 16 Aug 2019 14:07:32 +1000
Message-Id: <20190816040733.5737-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190816040733.5737-1-npiggin@gmail.com>
References: <20190816040733.5737-1-npiggin@gmail.com>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than sprinkle various translation structure invalidations
around different places in early boot, have each CPU flush everything
from its local translation structures before enabling its MMU.

Radix guests can execute tlbie(l), so have them tlbiel_all in the same
place as radix host does.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index d60cfa05447a..839e01795211 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -382,11 +382,6 @@ static void __init radix_init_pgtable(void)
 	 */
 	register_process_table(__pa(process_tb), 0, PRTB_SIZE_SHIFT - 12);
 	pr_info("Process table %p and radix root for kernel: %p\n", process_tb, init_mm.pgd);
-	asm volatile("ptesync" : : : "memory");
-	asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
-		     "r" (TLBIEL_INVAL_SET_LPID), "r" (0));
-	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
-	trace_tlbie(0, 0, TLBIEL_INVAL_SET_LPID, 0, 2, 1, 1);
 
 	/*
 	 * The init_mm context is given the first available (non-zero) PID,
@@ -633,8 +628,7 @@ void __init radix__early_init_mmu(void)
 	radix_init_pgtable();
 	/* Switch to the guard PID before turning on MMU */
 	radix__switch_mmu_context(NULL, &init_mm);
-	if (cpu_has_feature(CPU_FTR_HVMODE))
-		tlbiel_all();
+	tlbiel_all();
 }
 
 void radix__early_init_mmu_secondary(void)
@@ -653,8 +647,7 @@ void radix__early_init_mmu_secondary(void)
 	}
 
 	radix__switch_mmu_context(NULL, &init_mm);
-	if (cpu_has_feature(CPU_FTR_HVMODE))
-		tlbiel_all();
+	tlbiel_all();
 }
 
 void radix__mmu_cleanup_all(void)
-- 
2.22.0

