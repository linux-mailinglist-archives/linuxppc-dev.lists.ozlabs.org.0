Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 098CDA5ACB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 17:51:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MZM46lJKzDqgH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 01:51:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U9q9T0KA"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MYxT1LyqzDqdx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 01:32:41 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id w22so711700pfi.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2019 08:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6qnmNpAE6wHG0lYDsrUkP7Kt2hp/hE1NRSDUFKECCDU=;
 b=U9q9T0KAlBJBEOixJ4mSJuunaNjsBoeQGDYcYZtNhNj+ip/i61EOweXEQLSL1Vcfty
 tILq1xn2guHMZIICqf1CTXWteJKsNfgm7dhML2SKP7nxKL20rAANWvc7arqsHmkLBuht
 Tj7Tvhi+JONIGLcDFbX5MnH+LBRurxlu6qUtk4ooY+EcZAXkXZ++JRWrtV2lRcUH/VO4
 gOZPML/aDnejnybhm2g3lCuMGadpf25pSJ+7ajYr9ynC/jms4GCzLpZtG9ReqCz7eHog
 ykXw8HGJmrjFH4bJgCWvFqUJwJow6YB+HVEhjCiR2NNxtwIGgg3EowagCHva72Rz13Q2
 V4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6qnmNpAE6wHG0lYDsrUkP7Kt2hp/hE1NRSDUFKECCDU=;
 b=Tk0ZfOROc5/pPGC0xtWVlHZl7odFNRfjd5CYZYYO0W5yPigGegh7b6atJkTVSxq7H0
 uTsO3UdQF8mPn7QkWdjASLPtxnr5jmAclZICgPxULOA5jR12azdCAg9ABtbTGI9Aq8FM
 NOaryhln/Y1pjCfF5ZeTIwqE5ClkgGzoN+ZYC1mr+2VoQFSK185B4zHN5gDzXmmNv/ec
 b6OFYC/t+VFhtKYCaIgzizXu+RmTq7rnRf9LRiLR2B0IeLKncLnBT3jG9Ne0IZOtKD9e
 vevNWqPDAo0FTRwK1K1h7efl9kwidQZokteu3w387J+1gfLPWh/KZiii92GFKJRviO9k
 3QPA==
X-Gm-Message-State: APjAAAV82xaCUZnomN8Db8459xQhWziY3smdJptyVArLtKWQ6KIlGbjR
 T+l1SU4nwKa1+2ugG5Q5E7guoezFC00=
X-Google-Smtp-Source: APXvYqyulfj7j6I/NcGQcnqNlBli02hDvdhCUDD2e7H28QuwKLWtJWrM/pK3RtyQkpfcQQ9RkmhYiA==
X-Received: by 2002:aa7:9e05:: with SMTP id y5mr14852279pfq.38.1567438358947; 
 Mon, 02 Sep 2019 08:32:38 -0700 (PDT)
Received: from bobo.local0.net ([61.68.187.15])
 by smtp.gmail.com with ESMTPSA id b14sm15966033pfo.15.2019.09.02.08.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 08:32:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] powerpc/64s/pseries: radix flush translations before MMU
 is enabled at boot
Date: Tue,  3 Sep 2019 01:29:29 +1000
Message-Id: <20190902152931.17840-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902152931.17840-1-npiggin@gmail.com>
References: <20190902152931.17840-1-npiggin@gmail.com>
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

Radix guests are responsible for managing their own translation caches,
so make them match bare metal radix and hash, and make each CPU flush
all its translations right before enabling its MMU.

Radix guests may not flush partition scope translations, so in
tlbiel_all, make these flushes conditional on CPU_FTR_HVMODE. Process
scope translations are the only type visible to the guest.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c |  6 ++----
 arch/powerpc/mm/book3s64/radix_tlb.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 078a7eeec1f5..e1e711c4704a 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -616,8 +616,7 @@ void __init radix__early_init_mmu(void)
 
 	/* Switch to the guard PID before turning on MMU */
 	radix__switch_mmu_context(NULL, &init_mm);
-	if (cpu_has_feature(CPU_FTR_HVMODE))
-		tlbiel_all();
+	tlbiel_all();
 }
 
 void radix__early_init_mmu_secondary(void)
@@ -637,8 +636,7 @@ void radix__early_init_mmu_secondary(void)
 	}
 
 	radix__switch_mmu_context(NULL, &init_mm);
-	if (cpu_has_feature(CPU_FTR_HVMODE))
-		tlbiel_all();
+	tlbiel_all();
 }
 
 void radix__mmu_cleanup_all(void)
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 082f90d068ee..f9cf8ae59831 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -51,11 +51,15 @@ static void tlbiel_all_isa300(unsigned int num_sets, unsigned int is)
 	 * and partition table entries. Then flush the remaining sets of the
 	 * TLB.
 	 */
-	tlbiel_radix_set_isa300(0, is, 0, RIC_FLUSH_ALL, 0);
-	for (set = 1; set < num_sets; set++)
-		tlbiel_radix_set_isa300(set, is, 0, RIC_FLUSH_TLB, 0);
 
-	/* Do the same for process scoped entries. */
+	if (early_cpu_has_feature(CPU_FTR_HVMODE)) {
+		/* MSR[HV] should flush partition scope translations first. */
+		tlbiel_radix_set_isa300(0, is, 0, RIC_FLUSH_ALL, 0);
+		for (set = 1; set < num_sets; set++)
+			tlbiel_radix_set_isa300(set, is, 0, RIC_FLUSH_TLB, 0);
+	}
+
+	/* Flush process scoped entries. */
 	tlbiel_radix_set_isa300(0, is, 0, RIC_FLUSH_ALL, 1);
 	for (set = 1; set < num_sets; set++)
 		tlbiel_radix_set_isa300(set, is, 0, RIC_FLUSH_TLB, 1);
-- 
2.22.0

