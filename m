Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 397292C51FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 11:30:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChYsy156VzDr34
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 21:29:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pUSnipMI; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChYn73c0gzDr5d
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 21:25:47 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id x15so945379pll.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 02:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MVMUvIqJ8dhjE+Eg7HjU+II7PAAb5TJyyw/3cKQYvnw=;
 b=pUSnipMILwrYYIB03zop0NkY4SfJcEG9Fd8NJfx4m4+allxIYQMVVV1dYUZpQJ+YUX
 f3PoSdHSA4PULfOPUZpbZgwcgZd9EH1yzet9Di4Tv6IFFWFVCJZoYRWrrivIHD9VeqOC
 HMtDLWmrez00a2ho831BFVUKDYx32smZ432Us1N093TclpWf8s7jVmx5VJkumlgMhaAf
 5MD6uHbA2bvzyRXgUAHof6PUAeZqojLi+aHQ5Su7KcRPjFL+KtKfOUfW1yPWhdWqtwVM
 75Oz2aTDjCzOuuBCaKk383nv4tDI4qiyxxoabPB0J5LBjvf0Ye+bNLeZ8eoAxyb5kCXJ
 tHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVMUvIqJ8dhjE+Eg7HjU+II7PAAb5TJyyw/3cKQYvnw=;
 b=U46DNbnfTdKoh+Q6zD9tO9NAxGoWWPHd8vUNsQp2S7ibgWK1rSZlkByyOykHbdR2Ue
 v1J6ScJbbnQ92iEHpOr76wds8EhQ660UzKL71tSzEvQq9TH8swvDbnUzunF2K/VgqMcl
 Ytmzws1lRLLrLauOUYs2+SQIjMdegDl20aE4iZMlLMy0akv4CJ2Wn8gFQVyUT/R5ZJ/8
 OQtXIDivKSSO7vvAeY3m3M4Qb5aUXNuSKREQI9amKEFGIf4kkuzkSk9fP5wBkHnXpNz+
 DccBO28udLBF7Us85U5MgEhddD+u7mwL3XofcMErZXzXaMb7GIIqEbLN+BSzz1mTArl/
 Yt3g==
X-Gm-Message-State: AOAM533O1Pqiw+OpjB/ELBjDBOWqgMZpovNYG5jOuLpqr2P3t8vIhp3j
 SPml+pY4x7iJFK+v6y6usmdo0y6tr0m4EA==
X-Google-Smtp-Source: ABdhPJxMiz7T1KTr4OxLHSjmb1vMJp8sC6RzDBgLnP0k+6Fbe/7wFbpLS+qYcFnQX6a/qCWfXnIiWA==
X-Received: by 2002:a17:902:bb94:b029:d6:edb2:4f41 with SMTP id
 m20-20020a170902bb94b02900d6edb24f41mr2262849pls.3.1606386344101; 
 Thu, 26 Nov 2020 02:25:44 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id h7sm4338134pgr.33.2020.11.26.02.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 02:25:43 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/64s/pseries: Fix hash tlbiel_all_isa300 for guest
 kernels
Date: Thu, 26 Nov 2020 20:25:28 +1000
Message-Id: <20201126102530.691335-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201126102530.691335-1-npiggin@gmail.com>
References: <20201126102530.691335-1-npiggin@gmail.com>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Milton Miller <miltonm@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tlbiel_all() can not be usable in !HVMODE when running hash presently,
remove HV privileged flushes when running in guest to make it usable.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_native.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index 97fa42d7027e..52e170bd95ae 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -92,16 +92,15 @@ static void tlbiel_all_isa300(unsigned int num_sets, unsigned int is)
 	asm volatile("ptesync": : :"memory");
 
 	/*
-	 * Flush the first set of the TLB, and any caching of partition table
-	 * entries. Then flush the remaining sets of the TLB. Hash mode uses
-	 * partition scoped TLB translations.
+	 * Flush the partition table cache if this is HV mode.
 	 */
-	tlbiel_hash_set_isa300(0, is, 0, 2, 0);
-	for (set = 1; set < num_sets; set++)
-		tlbiel_hash_set_isa300(set, is, 0, 0, 0);
+	if (early_cpu_has_feature(CPU_FTR_HVMODE))
+		tlbiel_hash_set_isa300(0, is, 0, 2, 0);
 
 	/*
-	 * Now invalidate the process table cache.
+	 * Now invalidate the process table cache. UPRT=0 HPT modes (what
+	 * current hardware implements) do not use the process table, but
+	 * add the flushes anyway.
 	 *
 	 * From ISA v3.0B p. 1078:
 	 *     The following forms are invalid.
@@ -110,6 +109,14 @@ static void tlbiel_all_isa300(unsigned int num_sets, unsigned int is)
 	 */
 	tlbiel_hash_set_isa300(0, is, 0, 2, 1);
 
+	/*
+	 * Then flush the sets of the TLB proper. Hash mode uses
+	 * partition scoped TLB translations, which may be flushed
+	 * in !HV mode.
+	 */
+	for (set = 0; set < num_sets; set++)
+		tlbiel_hash_set_isa300(set, is, 0, 0, 0);
+
 	ppc_after_tlbiel_barrier();
 
 	asm volatile(PPC_ISA_3_0_INVALIDATE_ERAT "; isync" : : :"memory");
-- 
2.23.0

