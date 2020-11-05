Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4660D2A81E1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 16:08:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRn3T6sXMzDqc6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 02:08:53 +1100 (AEDT)
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
 header.s=20161025 header.b=f5UdKwxW; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmJn5lGSzDqyq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 01:35:21 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id z3so1595419pfz.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 06:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vxx5aXWOpnSgG6L/6dE3yyvF4pa4qMWs9mR9DPcWuRw=;
 b=f5UdKwxWkXuKD3+hvtjaZ7w4cyTtuc2j84kvcuzqN5DshYFLqAOV0LLjizKQesHnWM
 W2vFK9jEMQ5ZLVMjsYtJ8qNgygqdxTPUi9raC4JW8w0isrLUlthSowPGTfVUNj2LIEcr
 kmQu28pbKuGxIFtAL4jU4AT67EHqe7eLjQ/xiK1iu5FemHmAdgGUDw3LtyHIXtC+daEn
 /TrWUUAkei5qJkoxVBQukc2gOay7Cx1WLNfaW+844lKIENISvGtCjxITv4lk7kSpCngL
 KiWi+tD2dsxsd5yZtZTm7iQq9VqFbN5Ah1RzrUYFCterW1r4xeyHIhZvqHJIT9LdtQUH
 0rXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vxx5aXWOpnSgG6L/6dE3yyvF4pa4qMWs9mR9DPcWuRw=;
 b=acwoVDAiEL+Da0j8fj14b9TymBHCtmSChfSH2pnzAqs+2ByT5PXduVnhEymRvjBv4O
 zXEI2XoSVxXlXxs1aed97LUIhrqDVEvkTTqrC+l4glPhk/l3WErhsDEPHuyHr2LDcuPP
 WuHWeuqy2l8hckHjgCTXTupbtah8VZwHpTcQqE8HbBRVNls3u9NRJqOiV9do6qtDHOtK
 RdVhsojVh21S23oA0yHw8puqVoo5LBwj2xIN4+NAVgVI8ox8uxQg7mIKUIqC9eA+JRhS
 w0Db9EfktGLPyWYsiXHnhAgRlwa6SpvXlw+PtFPe9RITdheJJh31iX0f2s14yVYNUY50
 fjEA==
X-Gm-Message-State: AOAM531shNYeeGi9+kgx4gc2097PW9SmszqYEUo7DTc7cVJxyS2ONsqi
 unsePoLwVWtHLfK1aVDr7jfABcg3nm/T+g==
X-Google-Smtp-Source: ABdhPJyelAWjgyTqkSWMz4mECDqibBrXiMIRa39gMzwB/vS3tyfmAETh/FOH2nnn5UJFjQArHYu9yw==
X-Received: by 2002:a63:6243:: with SMTP id w64mr2616901pgb.430.1604586919244; 
 Thu, 05 Nov 2020 06:35:19 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id n15sm2876771pgt.75.2020.11.05.06.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:35:18 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/18] powerpc/64: move account_stolen_time into its own
 function
Date: Fri,  6 Nov 2020 00:34:25 +1000
Message-Id: <20201105143431.1874789-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201105143431.1874789-1-npiggin@gmail.com>
References: <20201105143431.1874789-1-npiggin@gmail.com>
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

This will be used by interrupt entry as well.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/cputime.h | 15 +++++++++++++++
 arch/powerpc/kernel/syscall_64.c   | 10 +---------
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
index ed75d1c318e3..3f61604e1fcf 100644
--- a/arch/powerpc/include/asm/cputime.h
+++ b/arch/powerpc/include/asm/cputime.h
@@ -87,6 +87,18 @@ static notrace inline void account_cpu_user_exit(void)
 	acct->starttime_user = tb;
 }
 
+static notrace inline void account_stolen_time(void)
+{
+#ifdef CONFIG_PPC_SPLPAR
+	if (IS_ENABLED(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) &&
+	    firmware_has_feature(FW_FEATURE_SPLPAR)) {
+		struct lppaca *lp = local_paca->lppaca_ptr;
+
+		if (unlikely(local_paca->dtl_ridx != be64_to_cpu(lp->dtl_idx)))
+			accumulate_stolen_time();
+	}
+#endif
+}
 
 #endif /* __KERNEL__ */
 #else /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
@@ -96,5 +108,8 @@ static inline void account_cpu_user_entry(void)
 static inline void account_cpu_user_exit(void)
 {
 }
+static notrace inline void account_stolen_time(void)
+{
+}
 #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
 #endif /* __POWERPC_CPUTIME_H */
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 5820a18672bc..672f2a796487 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -45,15 +45,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 
 	account_cpu_user_entry();
 
-#ifdef CONFIG_PPC_SPLPAR
-	if (IS_ENABLED(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) &&
-	    firmware_has_feature(FW_FEATURE_SPLPAR)) {
-		struct lppaca *lp = local_paca->lppaca_ptr;
-
-		if (unlikely(local_paca->dtl_ridx != be64_to_cpu(lp->dtl_idx)))
-			accumulate_stolen_time();
-	}
-#endif
+	account_stolen_time();
 
 	/*
 	 * This is not required for the syscall exit path, but makes the
-- 
2.23.0

