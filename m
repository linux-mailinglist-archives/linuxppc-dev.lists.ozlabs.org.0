Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9947E25E99E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 20:07:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BkMvT4cMKzDqRJ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 04:07:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GS9S7V6w; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BkMNj6SHHzDqjg
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Sep 2020 03:44:05 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 31so5946043pgy.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Sep 2020 10:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QL7VssLrRAz2VMSrXKNVvh1acziL3jFUO7JivMAENJ0=;
 b=GS9S7V6wWxlEtjzmsn5mMg909X9kRKAw+TN08MoJtCV4yl0P0BV0c15EROxs7kRid+
 BwELRD1z6ZJ/3QiLKwlGxEGLv1G3Atls75XesvK52Ce5mJCuPxIvnkwZiT5wS6W5F8oq
 959fFPT8jp8+/FLWNWGcFmr+TffrxtY3x1kfKJwYJmMcT1Z5gfjHjfxJ4iRQLREyTOWl
 24JovE2NRhcTjMK2Day1wxzjGTxVsLGa1OtrADLLlNwX2+AKwq+WnfrYLTxlESPkLt5u
 SCCLhlcw4XxkxSDm3KTKEUim0cH0tVAMvGHzX1cVF9JYKGW25PmYWeOCRqJNpedd2TCh
 yF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QL7VssLrRAz2VMSrXKNVvh1acziL3jFUO7JivMAENJ0=;
 b=GOu4e4iR1ImR4Ry4lVwKw5c1DB/c4GkfZkS6sxgPyKaCd+UXhOS/5+8FodkTyomUrk
 Ova8TmfY0RVMLrVwSLQwbkeorTPvzKb7r0KPXl6Haj5Kgais0SEj7PuI/5O5T50NOoIF
 1a2QSLGkGQKFGnmh/WxsSAb2yXYxeGKfuAi45oPDFJVJQlO2Elsj1AaWlm5c9SL+2Rn0
 OysfkxTvFi/vnWrdbtbSF97IpSKO8YjzgSUTYquMmda54jQyoRoMeLjUexqKAgkmURBJ
 g7cskcelsIC7MXAZKdzAntbpiGk5DEweuF4scnq97xqvpjDH+GBH0m9UKyXYoz4MYjRa
 +H0A==
X-Gm-Message-State: AOAM531QBrNPTXDrSLe+HDe4b/uNgBH0spNDi7EKq9OZrM5l7ZlZcjx1
 OmC73WTYlTP3TP4wTlrNS+RbihtYOt4=
X-Google-Smtp-Source: ABdhPJyaOR3Z1Ps//re9UQgLw038paIEKNjd1bekNyHrr8cdfoBlpXB8MTIzkOcpNnbpRNQgAFDPMQ==
X-Received: by 2002:a63:7056:: with SMTP id a22mr11654397pgn.12.1599327842923; 
 Sat, 05 Sep 2020 10:44:02 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id i1sm10405317pfk.21.2020.09.05.10.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 10:44:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [RFC PATCH 07/12] powerpc/64: move account_stolen_time into its own
 function
Date: Sun,  6 Sep 2020 03:43:30 +1000
Message-Id: <20200905174335.3161229-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200905174335.3161229-1-npiggin@gmail.com>
References: <20200905174335.3161229-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
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
index 58eec1c7fdb8..27595aee5777 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -44,15 +44,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 
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

