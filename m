Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD3366EEF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 17:18:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQPM76y6Lz3019
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 01:18:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZVfZBXn+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZVfZBXn+; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQPLh6cGlz2y6C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 01:17:46 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id c17so29151286pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 08:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zz5B+p0cNMkW1rEkNzARw3D9xZg+TnrLpd3faNzVO28=;
 b=ZVfZBXn+F1s7990zZsgByiKrOf3OkVI2nNv6/k11wRq9wq3nWlxR4ESusT77aVie40
 vsCHB9OutNnehaLTniikB9AGImmMUl6B611O7O7AyzpkQMB+I5N4H/Spc+AKrsEh6Kfi
 GGovZPR1AqvLlNFSxg6aAGFwrXSx3zhI10NNRTv/oIJFMbPiVOhc/gZN9Q2RWJF+K0HC
 Gu0YfEgfnOgI1hFHe4sbvjuKaBMLpVWvrbL+32rviUasWjBvylaRhItE4JHnNEJdghUr
 USKAmi/lztXDf7/ezxrCuVDkOOMXCrQAEM7P0L3FxAPEcYB+gMg10n2+v6uVLRPJ+jXV
 88AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zz5B+p0cNMkW1rEkNzARw3D9xZg+TnrLpd3faNzVO28=;
 b=VAhpFmdItcsjGRbSwB8FGiR6MIatPPqiPUam9yJ/1DjtcT1+FMxAl6Imm18z+5iLGa
 /hU4xBv6NpTxDoXY+CAmeVIBkvzw/ib8fY8zyvfzBGsLk8oAwrTjexBqnPL687J0U/BA
 dmdVTbaSlOkNM/Gw/SZ75r29WLfclhPzyvmVPKlHQP/tbJdt3fHt6382Q6C3U5kArINS
 cxeCykve4SGjis2yx4Jo6N7diXgqovDyFkYTYKlCs9H7oGisr4uQPZomEQt3OrPCsKzM
 gvCHBg2T/Ht3CQdh6wPgH9vUaRe3c7tMcaPfb1aWhf9rRI0c0anpOHLCz2A0kMug7Yxr
 O1fQ==
X-Gm-Message-State: AOAM532G6PaepAS0jZKQNSxcrafj5681nX+sQ7syXdqze6ppQKcR8x/E
 wSYG8x+p58/U5ouLK7WoWXhlhRS5VnwOlw==
X-Google-Smtp-Source: ABdhPJxc6MXtyNPkJEw3NnA5T/7QryfVt3lcOyKM/DlsDhBeXVrpIJ2uz1iGwmUMf8ys4wX2xtfvaw==
X-Received: by 2002:a17:90a:ff06:: with SMTP id
 ce6mr11544823pjb.204.1619018259182; 
 Wed, 21 Apr 2021 08:17:39 -0700 (PDT)
Received: from bobo.ibm.com ([59.102.87.99])
 by smtp.gmail.com with ESMTPSA id w6sm2044181pfj.85.2021.04.21.08.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 08:17:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Fix mm_cpumask memory ordering comment
Date: Thu, 22 Apr 2021 01:17:32 +1000
Message-Id: <20210421151733.212858-1-npiggin@gmail.com>
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

The memory ordering comment no longer applies, because mm_ctx_id is
no longer used anywhere. At best always been difficult to follow.

It's better to consider the load on which the slbmte depends on, which
the MMU depends on before it can start loading TLBs, rather than a
store which may or may not have a subsequent dependency chain to the
slbmte.

So update the comment and we use the load of the mm's user context ID.
This is much more analogous the radix ordering too, which is good.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/mmu_context.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
index 18f20da0d348..a857af401738 100644
--- a/arch/powerpc/mm/mmu_context.c
+++ b/arch/powerpc/mm/mmu_context.c
@@ -43,24 +43,26 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
 
 		/*
 		 * This full barrier orders the store to the cpumask above vs
-		 * a subsequent operation which allows this CPU to begin loading
-		 * translations for next.
+		 * a subsequent load which allows this CPU/MMU to begin loading
+		 * translations for 'next' from page table PTEs into the TLB.
 		 *
-		 * When using the radix MMU that operation is the load of the
+		 * When using the radix MMU, that operation is the load of the
 		 * MMU context id, which is then moved to SPRN_PID.
 		 *
 		 * For the hash MMU it is either the first load from slb_cache
-		 * in switch_slb(), and/or the store of paca->mm_ctx_id in
-		 * copy_mm_to_paca().
+		 * in switch_slb() to preload the SLBs, or the load of
+		 * get_user_context which loads the context for the VSID hash
+		 * to insert a new SLB, in the SLB fault handler.
 		 *
 		 * On the other side, the barrier is in mm/tlb-radix.c for
-		 * radix which orders earlier stores to clear the PTEs vs
-		 * the load of mm_cpumask. And pte_xchg which does the same
-		 * thing for hash.
+		 * radix which orders earlier stores to clear the PTEs before
+		 * the load of mm_cpumask to check which CPU TLBs should be
+		 * flushed. For hash, pte_xchg to clear the PTE includes the
+		 * barrier.
 		 *
-		 * This full barrier is needed by membarrier when switching
-		 * between processes after store to rq->curr, before user-space
-		 * memory accesses.
+		 * This full barrier is also needed by membarrier when
+		 * switching between processes after store to rq->curr, before
+		 * user-space memory accesses.
 		 */
 		smp_mb();
 
-- 
2.23.0

