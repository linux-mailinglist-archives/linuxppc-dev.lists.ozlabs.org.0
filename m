Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A14F192638
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 11:53:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nQ2Q5H5VzDqFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 21:53:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P/mwiem+; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPdb1HzwzDqYW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:35:15 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id h72so858889pfe.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CjrBdl89uLGUYYorywGQgUgF0MkugPo/towfDP5qi5I=;
 b=P/mwiem+RnBLcIUNpaMZV6iJX+GnCGHJx9EVe6ULHDvzbtk333jFaHsvS/9Y0k767A
 3vQfY1qVPyNyM8lSBT7QM/lo+NfgldK5RQdNk6z/qeYx+WQ7SPGqxPtRdXkpYrYxzVij
 D2Sl+4bvRuqxC0c879UO4x4hAd5165mujI60z65RamEM44+yEXIyHax6ed85mSdAu+H+
 QhCU8AqpeBOm2EakUDkjVHa/YRGo4VlK3kjvItwVuoX3thPwEnMgy38R4pIHfdhb25jA
 9K1ybdqhlwe5zgPBkYSOSH3LKaXmBARws70WA08IQTy2lsxyM7vJ/lGa+kuAsuSavCXd
 Ltxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CjrBdl89uLGUYYorywGQgUgF0MkugPo/towfDP5qi5I=;
 b=mWJO0O7Gn/c54A+bQy7/tMdvuyhDFLSPQBDMG57iexmyR01rXSk/LUUKVxmpOCBYVh
 57QopDspB16jcm8PXXSR+HxSUdaGu4GRzNQqSNJJ7PrYhbeN9nmILr/VJL3qJIfYT9Kl
 PlJLXuTofP7yEvYuT665TR3ELe5kTx5vsj8JMbTijSkXrBpix09HOCDUZ9vxR7j3GRSO
 eNN6nwWjoyh5ZbtrHPbWJzXTfpC4gDsliqLMQvpeacfUsVeeoA0dURxGcwZ9Fwwi1gc+
 6zN5C7L/wbDnyohGb39Huwc1wpABF5rMfw4+AL5Laj16GglCUTk6xEEFUkY29wEdwy9E
 q5Uw==
X-Gm-Message-State: ANhLgQ0ta8No5GZfVZDh9/1YfEZHR23BN7ajBYYtip7gAq/pQipcivBA
 CYvUwHzFCNNugNosWmD+t+NorG7b
X-Google-Smtp-Source: ADFU+vtvaazLBUQQDxM/dB1rm5GJkghJ5WGgkLckZF5UmdKSlvc0drmj7StInEnQwQS8hQC1+Cr/7g==
X-Received: by 2002:a65:5a87:: with SMTP id c7mr2411009pgt.237.1585132512789; 
 Wed, 25 Mar 2020 03:35:12 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id b9sm16549701pgi.75.2020.03.25.03.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:35:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/12] powerpc/pseries: limit machine check stack to 4GB
Date: Wed, 25 Mar 2020 20:34:06 +1000
Message-Id: <20200325103410.157573-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200325103410.157573-1-npiggin@gmail.com>
References: <20200325103410.157573-1-npiggin@gmail.com>
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
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows rtas_args to be put on the machine check stack, which
avoids a lot of complications with re-entrancy deadlocks.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/setup_64.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 3bf03666ee09..ca1041f8a578 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -695,6 +695,9 @@ void __init exc_lvl_early_init(void)
 void __init emergency_stack_init(void)
 {
 	u64 limit;
+#ifdef CONFIG_PPC_BOOK3S_64
+	u64 mce_limit;
+#endif
 	unsigned int i;
 
 	/*
@@ -713,6 +716,16 @@ void __init emergency_stack_init(void)
 	 */
 	limit = min(ppc64_bolted_size(), ppc64_rma_size);
 
+	/*
+	 * Machine check on pseries calls rtas, but can't use the static
+	 * rtas_args due to a machine check hitting while the lock is held.
+	 * rtas args have to be under 4GB, so the machine check stack is
+	 * limited to 4GB so args can be put on stack.
+	 */
+	mce_limit = limit;
+	if (firmware_has_feature(FW_FEATURE_LPAR) && mce_limit > 4UL*1024*1024*1024)
+		mce_limit = 4UL*1024*1024*1024;
+
 	for_each_possible_cpu(i) {
 		paca_ptrs[i]->emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
 
@@ -721,7 +734,7 @@ void __init emergency_stack_init(void)
 		paca_ptrs[i]->nmi_emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
 
 		/* emergency stack for machine check exception handling. */
-		paca_ptrs[i]->mc_emergency_sp = alloc_stack(limit, i) + THREAD_SIZE;
+		paca_ptrs[i]->mc_emergency_sp = alloc_stack(mce_limit, i) + THREAD_SIZE;
 #endif
 	}
 }
-- 
2.23.0

