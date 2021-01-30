Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5FB3095FB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:41:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DScN5015lzDqBc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:41:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AXcO9Jqc; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZMx2llJzDrTC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:11:09 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id j2so6844986pgl.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8MLxWxv9fyzoEN4djaF+gt5IjlEnQ6sgo5IOYAhko7Y=;
 b=AXcO9Jqc2VnbnHypSf5mrTmiKV+wkED727qMaRWo/F3yxnJDCZhzR5KIhTBazxYlsm
 PIJCvfwK+Xpt8G8TLbohr9+SfwhSdtz0iUWdCA5EenvH7+k6ugkqUioIMZB3QYkJtuK+
 nU8gnFS0zjjLhn9wHnty/4CatNsNjoY454nr0M2bJkndKwRBbtXqLTzSXqJXZLGrI2vV
 nylIfhHaPgRsLoTUclGJ0hhSHERwxc5tB/mFGsu2C1acsE1bgb33Hx0bwH9bEnJAUprR
 XnTRsQ2T6ji5piU9DP1F1ofXYOkPnuKACfQfrSwVlOmU/G1JUh1zM8Zzl5v88DBR5l6E
 J7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8MLxWxv9fyzoEN4djaF+gt5IjlEnQ6sgo5IOYAhko7Y=;
 b=nRgkj5zB//Ah0/ESOHlOipBq77DlkghPzP4Itv++Ly7PgOjPG6UKQmWxEQYg2XaSBn
 cKeruVsp265HlsnKKaIPETx2sRssly9Or07J9h/eTi8gcZC2F89YJtDYXlzcIv0Ch8gu
 sQ2rgVn7SF7+gvpUXVCZsxzgsbGqZohYHWgXn96AR4rNCmm+D8MOu/w2VpP+Gs6Y5ax0
 jBTFAaMV7K8EwVjXvNQtxKRQJWSOpnVY5jCYTaJfVGDInG0+qaC1AHK4VZX+kfllKQwB
 +vF5HC8Ic68RsjosNofNcHhVedVTnIQRUwDr3CTi8+bX7SYlfSZUmMVnmEivRMfg6w8f
 AzLA==
X-Gm-Message-State: AOAM531ITfeS+PneBTCG/q3TvrALjn4yLGozf73Bh1BqP5UignpG/b87
 ww88LlzI7JGVKCOkggRvA9Ez8rFZhfM=
X-Google-Smtp-Source: ABdhPJyJw0MgJUMIl4Vc9cRdjJDUDlUBKqXxjiJdZ+m82ItZFAhcffCCSmZA6dGV9NiQrcLsB2YXpw==
X-Received: by 2002:a63:c44d:: with SMTP id m13mr9152776pgg.64.1612012266008; 
 Sat, 30 Jan 2021 05:11:06 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:11:05 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 37/42] powerpc/64: move account_stolen_time into its own
 function
Date: Sat, 30 Jan 2021 23:08:47 +1000
Message-Id: <20210130130852.2952424-38-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
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
index a2102e7a2713..d6be4f9a67e5 100644
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

