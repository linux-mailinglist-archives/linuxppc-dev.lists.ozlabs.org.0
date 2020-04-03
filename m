Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E05819D8B7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 16:11:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v2113RFszDr1r
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 01:11:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xv2KwAxs; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v11t1NJczDrcG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 00:27:14 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id x1so2692848plm.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fSwLvC6wsgQWWAFa91/AyR+S2J/30GBuYoon1wIXLTA=;
 b=Xv2KwAxs3lKMmI7dPSvLolcyWAEaQja+ktO9F6eMfk6HOMY7Z/Gpw5EpjE8s5J0hOB
 F5h2V1U0lqy65SQ5ZToNwdHD98xa4A2XXVEIW79Cm8eI/enqbGiBdKAKTjiUCLPjnwBk
 TikL8JGlC9R6elQdhAvP0yQp/O+NpxtyuDQSeTWR1nx8h7QiXUMB+CptEFvJ5L1Xue81
 hlcFMgWvgc3KZeDAWGeyUvwcgD4xAOozRS+PH6gVPZ7TwHPc/8VWlL7b4ihRzc0D9TP3
 GvzGK8kocJdPJqJQ/IJIjxjrnSs1RJJk86rRrOuqftiNwLmNuetzPmH33DoXMOrxXfxN
 JLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fSwLvC6wsgQWWAFa91/AyR+S2J/30GBuYoon1wIXLTA=;
 b=AuJK/oa305TobFfAtNqBR3xLYkhUz7sp8EM8Lyq9Ni5m3VMetEPVFB3Icv6wG4nrvA
 kPb0izn2UTCUU75z54RS1RkT7V9yK1puETPCZJCLecnoc5pACweZ9T5SYyJFQRpnBV/Z
 1ZyxixsvKop0oE5/6NHvSOYrNx4y0vdYMColeY3wX4da/rXHcU6Uw52W2gCsmNqo+4UB
 riMwZCVSJ3Z31mEiOBcTXJ0qvktIJaIHZim6C//vxdixrxx4Tvs4JkRwNhWkHeklcTBW
 K4MRXYq06pHtyipmpUA6H4gFP5miTZvzmr7Y6PHXX0c0o2/Ulm124/08FcBagB6kuaXr
 PATA==
X-Gm-Message-State: AGi0Pubw5ir6meBVv9zGoBcyCtMyS5lTqDG4BR3I7raqvbEe42Cm9hrn
 sjW6JxJ91vxXKBxivJX8kYht4kpv
X-Google-Smtp-Source: APiQypLO8W8pPmVG2xkQ6XvNfrwULrxZe6advDc4ohYuARTYr0G4A/EkDCI1hCXa+vkJsa/jgxLevg==
X-Received: by 2002:a17:902:7297:: with SMTP id
 d23mr7792062pll.63.1585920431161; 
 Fri, 03 Apr 2020 06:27:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o65sm5941422pfg.187.2020.04.03.06.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:27:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 09/14] powerpc/pseries: limit machine check stack to 4GB
Date: Fri,  3 Apr 2020 23:26:17 +1000
Message-Id: <20200403132622.130394-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200403132622.130394-1-npiggin@gmail.com>
References: <20200403132622.130394-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows rtas_args to be put on the machine check stack, which
avoids a lot of complications with re-entrancy deadlocks.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/setup_64.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index e05e6dd67ae6..3a2428aa3d9a 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -692,6 +692,9 @@ void __init exc_lvl_early_init(void)
 void __init emergency_stack_init(void)
 {
 	u64 limit;
+#ifdef CONFIG_PPC_BOOK3S_64
+	u64 mce_limit;
+#endif
 	unsigned int i;
 
 	/*
@@ -710,6 +713,18 @@ void __init emergency_stack_init(void)
 	 */
 	limit = min(ppc64_bolted_size(), ppc64_rma_size);
 
+	/*
+	 * Machine check on pseries calls rtas, but can't use the static
+	 * rtas_args due to a machine check hitting while the lock is held.
+	 * rtas args have to be under 4GB, so the machine check stack is
+	 * limited to 4GB so args can be put on stack.
+	 */
+#ifdef CONFIG_PPC_BOOK3S_64
+	mce_limit = limit;
+	if (firmware_has_feature(FW_FEATURE_LPAR) && mce_limit > 4UL*1024*1024*1024)
+		mce_limit = 4UL*1024*1024*1024;
+#endif
+
 	for_each_possible_cpu(i) {
 		paca_ptrs[i]->emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
 
@@ -718,7 +733,7 @@ void __init emergency_stack_init(void)
 		paca_ptrs[i]->nmi_emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
 
 		/* emergency stack for machine check exception handling. */
-		paca_ptrs[i]->mc_emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
+		paca_ptrs[i]->mc_emergency_sp = alloc_stack(mce_limit, i) + THREAD_SIZE;
 #endif
 	}
 }
-- 
2.23.0

