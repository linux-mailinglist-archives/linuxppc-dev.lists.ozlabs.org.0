Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 119282F45DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 09:10:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG0VS2H9wzDrcK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 19:10:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Cqh+9ria; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFzgg48N5zDqvv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 18:33:03 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id p12so582075pju.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 23:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RgL8Vm2dmUOfdddnVzmUO5NHqAf0RbTGNNWu5N8TpeM=;
 b=Cqh+9riaYr3ZrEPxS86UYljWI+GUIRt+z9fAEZMTNXgrCy/J+d3k04J3rC8mC6nbPu
 YzPAnUmNzoWUU+p3/pP8y/xvUTffKIBPklyhdsaF/vaJyVwCBS2DMO46qd8hV5nPYHWI
 g3Q0AcytEMBydenzVEZJHCLEG2fKVEJQtIfOsTu3IDX+m7N/o577RI0pODTtzqRp6Ycd
 wXiaZK5kwZxGzD7tOPqj6NsBo95KOPdDGGysQsSBWXgWjMkru8G/TYNx+WZRrbmXTxpo
 41wbQ3RouFh6O/PD2tyh3nxZV8FS3qnMykgQgyiIWSkHUz3ch5DWk9w30EDDb/XJ/qZ5
 rSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RgL8Vm2dmUOfdddnVzmUO5NHqAf0RbTGNNWu5N8TpeM=;
 b=n0ctIHObDG2D1bWGxVJ2PSd6uQvXSXxE+mOyQkcnqx7oPv/d2l2EO2CtwCW2xFMC0M
 lMvSf8EmZWOJaR6hwtm5qXkHyfOtpFKXPE14wx5mSgW1mU3Y+BjYL3wyH7CGIsWddPt1
 AmFRt8sNio4C4I3kL2pI/MkVCFv/rPj/1bFEcRMkZrtCA41GwGuyj77BcT565FHBeUQT
 h6be/iyKK7t3Dx4dI6kQIG9EIN7hS3R0H7jGt5xdcrxB5Vmz0GS+k4YHyATF+Ty04vtQ
 btovM72lrwsPu4xqm3smyLrQnjFuxxwH78nzU+bCF4Sk/ur+O/R5JQQ85SlEFUgMlk93
 Pzdg==
X-Gm-Message-State: AOAM530F14Dy/7Y0+DA+6JgnMiv2wHFLr7Db3s6qyNVGT90QC0WmjlOb
 tZByLlQTuDFGv/Z110zPhNtiMkHNG2k=
X-Google-Smtp-Source: ABdhPJxqto+lMrOZFh4KIZOmdEp70ptO1od43agzd7+rmFrTfZBTuFdCl6IN3paD/J8yZbFXOnct3Q==
X-Received: by 2002:a17:90b:4b86:: with SMTP id
 lr6mr877493pjb.107.1610523181578; 
 Tue, 12 Jan 2021 23:33:01 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id m77sm1394264pfd.105.2021.01.12.23.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:33:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 16/21] powerpc/64: move account_stolen_time into its own
 function
Date: Wed, 13 Jan 2021 17:32:10 +1000
Message-Id: <20210113073215.516986-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210113073215.516986-1-npiggin@gmail.com>
References: <20210113073215.516986-1-npiggin@gmail.com>
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

