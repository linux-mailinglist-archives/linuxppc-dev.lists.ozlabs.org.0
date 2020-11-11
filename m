Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E83A2AEEC2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 11:29:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWLZH5hpgzDqHF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 21:29:27 +1100 (AEDT)
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
 header.s=20161025 header.b=UVafeFGT; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWKZm6vKSzDqbm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 20:44:48 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id d3so703509plo.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 01:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vxx5aXWOpnSgG6L/6dE3yyvF4pa4qMWs9mR9DPcWuRw=;
 b=UVafeFGTPKkPMjHsYCOHg5t7oQlbcA/+pz1wl/pVBu90Lr/A4xlB+nVm7wlDNxzj4B
 tDCsmyMyhJi6ctwkd6xpJ8As102X8rX66FoToY8DMJGXI5fIQhf73KWhxuQjy1F8ovvW
 /VpcDxFuwxXxx5f8fLSavDR+5pgT3AQ04OtUdPXUxqMh7KkcQCRU/UC4XfI/H6X7amML
 pdmwyA8xSm3PvH8sx/IqKrQtabvTaMN//cihqIL6sK3FkwNGeTM5O1PQ3toyli93UxJU
 USZ9nqPFd7/NbKF6gY1CZDmvTjcONHA8te10sRZ32Orc8I05NyehIUvK3kO+4CK1L69v
 BKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vxx5aXWOpnSgG6L/6dE3yyvF4pa4qMWs9mR9DPcWuRw=;
 b=CdHxchpTlusxDb1/AKFWBRzyHvZgQl8f4SWniuJbFwGS6qvJ8hFy1gZ7J9Fsy2doLx
 LI+x+nxW0dFLZeGq0okDt5NFZzZmLN8g9CwhHshIs8mbw9maQaKGB/+Jp7R3sq9bog/w
 SIJg9BXFNdY2Hr+z3GSELWt1GObaGjEHdX7loV70JlvFKOJCD05Ne3HNA99QDmlUkY89
 r4hPmdHOmMOPX9ZZMm3ITiRlCwnjPqCmbpX6DV7xQd3kLHMKTqrxxlOWZdVyJ3ATskw6
 TYxyw6PTD5079FPRmIh4ZBeWLUIDAaZnFdDYU4W4C9SfpFE04MhnCioqH63GlDh3N5rt
 CUNw==
X-Gm-Message-State: AOAM5319r3yJgfUBtvQHOsX5YljfxDVtOFIGRemFxmutB6uFqDW/GIAQ
 p0eVVN1VhMDPxDZrF53RPFgIq2KpChM=
X-Google-Smtp-Source: ABdhPJyj0LDY+3PbHbrptGJaXHdyBT0NdCnWmCNWMyTzh/fNakOJ/NDVJNB0ii5cl3q3Su7AzvklEg==
X-Received: by 2002:a17:902:760c:b029:d6:efa5:4cdd with SMTP id
 k12-20020a170902760cb02900d6efa54cddmr20379646pll.56.1605087886432; 
 Wed, 11 Nov 2020 01:44:46 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id a3sm2046129pfd.58.2020.11.11.01.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:44:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 14/19] powerpc/64: move account_stolen_time into its own
 function
Date: Wed, 11 Nov 2020 19:44:05 +1000
Message-Id: <20201111094410.3038123-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201111094410.3038123-1-npiggin@gmail.com>
References: <20201111094410.3038123-1-npiggin@gmail.com>
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

