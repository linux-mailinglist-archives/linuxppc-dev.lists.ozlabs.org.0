Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C7E6274AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:47:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9Ycr35sJz3f94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:47:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mINaLtMb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mINaLtMb;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YJ11FP1z3dvh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:49 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id o13so9114354pgu.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sPE9WOX7gvql4UktV0topV8AA5mTabSZc33TsfO13k=;
        b=mINaLtMbmHmX22/C0SYToPyvSnSzk7Q0FBLRHGZeq3IaRrnL3sBkGvi36vJc+cjKBn
         lbqgQR1s0j9QWZXYrzYGMXlTG2FHEGfyf1Hato/8Oh36FFRPdAiw4FZF8A3tvGcQ6AfY
         3YNHMq/rky+WJFvyoO7MWTgTuXIXIR0INPxVdWQPAIcbxPIzBpAczG8tCvy3Zb5T8A/q
         ImT0YrTZEQJ3a+Vzo8dsVbvY36sV3CdJM1SA5RYg20OLdOkjGb6Onvt26pkkx7KLHOVn
         /kW31mNaPtovVLHLIKmlNPcAYy5PsWA6eIDP8PegqMx+GcZMpaZj/tUOTibUYdBz3zX1
         qUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+sPE9WOX7gvql4UktV0topV8AA5mTabSZc33TsfO13k=;
        b=DrILsDVf6KEZl4Z5vC1HFq6KNytcYJ9PjMbFgLXIB5B3uXidpTcY7eOSYVbPLiq3xb
         ID223Wo2uN2Egd+VntPMgepWn7suHLtcUNX+RwlobD5mB/ru2U0GDTxvjPlwai80MpnZ
         6MJry4G/DujKyGA1JS7ykjZbtZGJl6iNW8M1pl5UOczML2QsbDkS8zFD/btW8kCDRwcS
         WVdkJRsFABNlI9p+5gDX24CwtypdG/Jh0PwlpFIHfYq4DtcdDh2tS6TLcaDrKWfzmhU3
         lraPMUVGIeKEZ4jhyNtzVSo0HUxlOcTKKV525WlXc3g2zsrwnBCjui5G8iof4tv/D3wZ
         u1Zg==
X-Gm-Message-State: ANoB5pkOh1ql5H30sJFpj+32piSX4ILZ1CJG0DTuS9o7I2989AZXX7Bm
	80Sp+K4ezD25ijlm4x9ll1ysKZf2r20=
X-Google-Smtp-Source: AA0mqf4sc4anC0OcXCmB2ByBsNcpwW41UFX4/3voNTztJlITC50Y9oPSUQZQybZ6d7AyrXrrFtGO5A==
X-Received: by 2002:a62:fb10:0:b0:56b:a4f6:e030 with SMTP id x16-20020a62fb10000000b0056ba4f6e030mr12226689pfm.85.1668393168085;
        Sun, 13 Nov 2022 18:32:48 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:47 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 15/17] powerpc/qspinlock: reduce remote node steal spins
Date: Mon, 14 Nov 2022 12:31:35 +1000
Message-Id: <20221114023137.2679627-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221114023137.2679627-1-npiggin@gmail.com>
References: <20221114023137.2679627-1-npiggin@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allow for a reduction in the number of times a CPU from a different
node than the owner can attempt to steal the lock before queueing.
This could bias the transfer behaviour of the lock across the
machine and reduce NUMA crossings.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 43 +++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index ea8886e2922b..a1c832a52d26 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -4,6 +4,7 @@
 #include <linux/export.h>
 #include <linux/percpu.h>
 #include <linux/smp.h>
+#include <linux/topology.h>
 #include <asm/qspinlock.h>
 #include <asm/paravirt.h>
 
@@ -24,6 +25,7 @@ struct qnodes {
 
 /* Tuning parameters */
 static int steal_spins __read_mostly = (1<<5);
+static int remote_steal_spins __read_mostly = (1<<2);
 #if _Q_SPIN_TRY_LOCK_STEAL == 1
 static const bool maybe_stealers = true;
 #else
@@ -44,6 +46,11 @@ static __always_inline int get_steal_spins(bool paravirt)
 	return steal_spins;
 }
 
+static __always_inline int get_remote_steal_spins(bool paravirt)
+{
+	return remote_steal_spins;
+}
+
 static __always_inline int get_head_spins(bool paravirt)
 {
 	return head_spins;
@@ -354,10 +361,24 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
 	spin_cpu_relax();
 }
 
+static __always_inline bool steal_break(u32 val, int iters, bool paravirt)
+{
+	if (iters >= get_steal_spins(paravirt))
+		return true;
+
+	if (IS_ENABLED(CONFIG_NUMA) &&
+			(iters >= get_remote_steal_spins(paravirt))) {
+		int cpu = get_owner_cpu(val);
+		if (numa_node_id() != cpu_to_node(cpu))
+			return true;
+	}
+	return false;
+}
 
 static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool paravirt)
 {
 	int iters = 0;
+	u32 val;
 
 	if (!maybe_stealers)
 		return false;
@@ -366,8 +387,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 	spin_begin();
 
 	do {
-		u32 val = READ_ONCE(lock->val);
-
+		val = READ_ONCE(lock->val);
 		if (val & _Q_MUST_Q_VAL)
 			break;
 
@@ -381,7 +401,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 		}
 
 		iters++;
-	} while (iters < get_steal_spins(paravirt));
+	} while (!steal_break(val, iters, paravirt));
 
 	spin_end();
 
@@ -606,6 +626,22 @@ static int steal_spins_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_steal_spins, steal_spins_get, steal_spins_set, "%llu\n");
 
+static int remote_steal_spins_set(void *data, u64 val)
+{
+	remote_steal_spins = val;
+
+	return 0;
+}
+
+static int remote_steal_spins_get(void *data, u64 *val)
+{
+	*val = remote_steal_spins;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_remote_steal_spins, remote_steal_spins_get, remote_steal_spins_set, "%llu\n");
+
 static int head_spins_set(void *data, u64 val)
 {
 	head_spins = val;
@@ -705,6 +741,7 @@ DEFINE_SIMPLE_ATTRIBUTE(fops_pv_prod_head, pv_prod_head_get, pv_prod_head_set, "
 static __init int spinlock_debugfs_init(void)
 {
 	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
+	debugfs_create_file("qspl_remote_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_remote_steal_spins);
 	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
 	if (is_shared_processor()) {
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
-- 
2.37.2

