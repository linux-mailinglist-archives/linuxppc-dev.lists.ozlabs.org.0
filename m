Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9D12E876E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 14:14:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7Mmv61KvzDqxH
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 00:14:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kDApWUON; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7Lhx4jsHzDqpv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:26:09 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id x12so12033884plr.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RgL8Vm2dmUOfdddnVzmUO5NHqAf0RbTGNNWu5N8TpeM=;
 b=kDApWUONkrwxl4THdhJAx8Z/SRu6Pa7Kb0FAIgKMP/z7xYeMuWnRAjV3h00HpCO+Dt
 Z0/5fPahvEAgYMH7et7AU532pZ0/xovAAicKlMnxm+JFNwu3+q3pUQWe6XDMIDupgZym
 A36FHUWufPX8Q0KU3r18fJ8mklsTLbq4UIr966d70z0fyobnoZeF0KIowqaD1ngnKJTQ
 ra1AEc7D/uMz+UN8pIaBPcwqWbdsSfdh9+qXczDZsvQ4l5Cw3r2vCnp5VdK842hD+qdQ
 4+a4AHqYttoep05FsAxm59/o+60YGybuCRfnAgq5gVRKLBB7ql0tbl2WXoFUc09hXJj/
 oz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RgL8Vm2dmUOfdddnVzmUO5NHqAf0RbTGNNWu5N8TpeM=;
 b=VRFv+wGKnQOHnHU09wxyAqMkL9+EdRnq80fPdosZGJqz6E8b7Tr4erfNWXhxont7vy
 Yy5i0DtnBOst4j/GM5zRWQYpEBQgmwZXdUW5RUJnp65NIRcy/PW+ZyWUMAtljUcFguui
 xWiQUSqocfiqT1PaUVkFTod7csk9OTDDDPfoXoChO03V4sMCga08B4l/GiBD/GcPdunp
 JiXn3XO561Mh93smt6NdZiIaDIWpij3PLxCOrmuESB2EY5P1ekmpAbVgNlq2chbuMzHV
 fmkMPoayP2h5xznw4J59DfEdzvqdiTkU1XKAzmIjskXGS8ocLuOTtji3EmDrF26O9EP1
 /wzw==
X-Gm-Message-State: AOAM531jX3zbhZl1KlH/bjMYIUGy2vp2FgwO1kirgHqwVQv/YMHSTEb7
 Rfq5m5FBEvOpBlgE7R+D18Zu9x3I1yQ=
X-Google-Smtp-Source: ABdhPJxpfsZAZGKiZaGZDy0UjG4A4NnHB03bgOh5OGBNsWJlKN/cmB4CY7cxMvvktV39qGCzLmjYRQ==
X-Received: by 2002:a17:90a:74cd:: with SMTP id
 p13mr21028851pjl.25.1609590366047; 
 Sat, 02 Jan 2021 04:26:06 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:26:05 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 16/21] powerpc/64: move account_stolen_time into its own
 function
Date: Sat,  2 Jan 2021 22:25:03 +1000
Message-Id: <20210102122508.1950592-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210102122508.1950592-1-npiggin@gmail.com>
References: <20210102122508.1950592-1-npiggin@gmail.com>
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

