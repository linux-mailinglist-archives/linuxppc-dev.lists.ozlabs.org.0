Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFCA2C6FBB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 16:07:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjvxD1TSHzF0ZD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 02:07:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AvV+rP27; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjvMk6vgxzDsNP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 01:41:54 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id w16so6603136pga.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q1oxRS5FyyLJX4t9U5i9EoJMPiKHbvtMI0FvqNKIIcM=;
 b=AvV+rP27q9xJ2GyuJ8hOuvObTUy8eB7wRkg8FPkGxZEr5ImnnN2pdijfNmeXHkPX9P
 BH8YxUw4q65C00CHJZ16WsQQkQk98Vjp1ZBiXCgy9d3SCXUNedMjbjVop+BprBnzWsWX
 8vO2rEQG26r8WbOgJy+1WsMojWd0VYglqMTntF3jM6acGFhGSVcwaN9Y6YexbHtAVnml
 9/MtsDZBdEgDGsUlssNKYsPqT1AG13DVX8l4OfoeZon3iEHVdUXNhGMjuQb6zYO7QfKg
 ybQERm9T9IfJbqBQW+TH0o9pgrZP2zy9GwEtCH+ucSOIZhOpMw/wwRcphBrr/WCv1k2T
 OIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q1oxRS5FyyLJX4t9U5i9EoJMPiKHbvtMI0FvqNKIIcM=;
 b=fBA6nvhYF3qYxdr2Q61GRVxOFg0Ensozsd1dUVT4OW+gsmfVnUFi6BX5OdH/Zk1n3I
 C1OD8u+lUmVLNmTNMpRCCIZlhJzIcxNl5TkNZZVsSKsJkYg0C+rprozpC/qjOMKWFDwr
 lQ59VcrC78NpjM/ecj28uuHogGgRdy0XfRic0Ot0uLMb7si3Ybt8jHn9dIUSHzZElLjn
 C+1dBSfpb+mTlSx23HtEQ7nrsSy/AKCD8xUbYJlF+XzKfcAN/3X3IzUvWoL9/jFFR4nG
 KN0HwDVPIWNTYRpwoaA7tCILUK516MSbdY58BOMqDkK39kHtYC4lyQB0oldlp/2FF2IB
 RWrg==
X-Gm-Message-State: AOAM530c5xN2vfYo9isMIWayWpC6hPf/Gv235i6G9cNhgy5oiSZJVEv4
 eBhlrId7m15j6vbUgxbZT+qM8A7si+4=
X-Google-Smtp-Source: ABdhPJyqEgNf49sqNkfLx54MlJsiy1K7+FLF58N0D43zW5jghHFkgp4OoJhL6wxUkObxlV2kYFIyVg==
X-Received: by 2002:a17:90a:5518:: with SMTP id
 b24mr16951346pji.138.1606574513157; 
 Sat, 28 Nov 2020 06:41:53 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-103-132.tpgi.com.au.
 [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id y201sm10750764pfb.2.2020.11.28.06.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 06:41:52 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 14/19] powerpc/64: move account_stolen_time into its own
 function
Date: Sun, 29 Nov 2020 00:41:09 +1000
Message-Id: <20201128144114.944000-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128144114.944000-1-npiggin@gmail.com>
References: <20201128144114.944000-1-npiggin@gmail.com>
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
index 668a4557fc3f..8ab5e16d640c 100644
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

