Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2532F83BD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:17:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHTt30C5hzDqnR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:17:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uJNZPPbt; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHS0315YtzDsjM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:52:18 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id c12so5838127pfo.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=42QXIbklStVSpKTXaLQXBx4puZRh8avmf/xFriH6D3U=;
 b=uJNZPPbtKC94868m2Y+P2TGCmUpHBpRZxQgdWDCU7rJshfG4OTn40fglYjfAVGlLGN
 uPdth3TS1NxH0hZQcc62/f65ozs3lbgbcjsnZIY1xLIVLbf7J6RSfQ5UtSko0/B4Ama3
 S21XpyrnvSmojbptiguxHxEz36mI1lkKG6C9x60YPTP02pfuI46Hz/ZsXzqx5drIL7oy
 tFJ019V64Px+siVs/DPmGfBqHhsZ9fqlYTyXZctk47PyT/ZP0LopAtUPjZkbsklFHn0m
 sGdatYITuECcaFMZ4PUvUdASkYZ/ybJcWmh5j6z4NfNIe5o7Or1u5O5cgzuaSYAFE5hq
 bV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=42QXIbklStVSpKTXaLQXBx4puZRh8avmf/xFriH6D3U=;
 b=XISKbgPcIET/kiupZOAKkDJmaV7+XYUE19drypK2uMjjJn84IIBjr2bLuV/PCK5fqR
 ebp/XI5sVgJlnr5lGJTBtsPopiBhoBXXoEhlHZplxxoE87mF8PobXwOpcnpMlQ/pgntg
 RySpF3NEiNf1Pxgn0QzCyFGkvsbuxiTSAxPusA8TcsA1D+V9/HIhurRf3CxGVyKrTTdo
 khM78tFIgMXqe/f6lV/jgmyv72hM0bA0YLcclXNB5fau7dZeJJHSEOOFqdD678wgFky8
 ORVsiAoNbr1N7q2ca9VjklZllZeOGuJxXCv6ox+6chwndQQ/Q1rfF0dBfQXADgzXQ982
 CNHA==
X-Gm-Message-State: AOAM533q8ggVN9nyZ+G59QTh/ePisPHCdkOhy3rjxEbols/ZW538b1oU
 FGTBYqdbf6J7FlqNKcaMzDI+QtXCCGk=
X-Google-Smtp-Source: ABdhPJx0kpwGe/HpdBL5ea6gOGFG0Iq1tMqEM7d5tsg3nBOkIjLCyHD0eIf4LynQ8tKzuCdM2GMa3Q==
X-Received: by 2002:a63:fd04:: with SMTP id d4mr13644163pgh.232.1610729535963; 
 Fri, 15 Jan 2021 08:52:15 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:52:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 34/39] powerpc/64: move account_stolen_time into its own
 function
Date: Sat, 16 Jan 2021 02:50:07 +1000
Message-Id: <20210115165012.1260253-35-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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
 arch/powerpc/include/asm/cputime.h | 14 ++++++++++++++
 arch/powerpc/kernel/syscall_64.c   | 10 +---------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
index ed75d1c318e3..504f7fe6711a 100644
--- a/arch/powerpc/include/asm/cputime.h
+++ b/arch/powerpc/include/asm/cputime.h
@@ -87,6 +87,17 @@ static notrace inline void account_cpu_user_exit(void)
 	acct->starttime_user = tb;
 }
 
+static notrace inline void account_stolen_time(void)
+{
+#ifdef CONFIG_PPC_SPLPAR
+	if (firmware_has_feature(FW_FEATURE_SPLPAR)) {
+		struct lppaca *lp = local_paca->lppaca_ptr;
+
+		if (unlikely(local_paca->dtl_ridx != be64_to_cpu(lp->dtl_idx)))
+			accumulate_stolen_time();
+	}
+#endif
+}
 
 #endif /* __KERNEL__ */
 #else /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
@@ -96,5 +107,8 @@ static inline void account_cpu_user_entry(void)
 static inline void account_cpu_user_exit(void)
 {
 }
+static notrace inline void account_stolen_time(void)
+{
+}
 #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
 #endif /* __POWERPC_CPUTIME_H */
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 42f0ad4b2fbb..32f72965da26 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -69,15 +69,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 
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

