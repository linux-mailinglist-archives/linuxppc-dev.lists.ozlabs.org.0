Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 770DA5838E5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:41:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgzJ2sR6z3flZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:41:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B6CUfzBb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B6CUfzBb;
	dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtgmS1C4Qz3000
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:32:08 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id f65so772255pgc.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iiS6dj2sB11ly4j4uSh7u5Zd1DrtVioNJewlYZWn2NM=;
        b=B6CUfzBbZjnzRHRrsBNv8gF6z/ywdCYWipmflsZQ68J0wAvUu50tO2TeMlPK/WZ0qI
         h0KZzjwSbtBZaorVor/zW2cTGhWosM0B2TDctmpxQvujSIQLYVzPDyA2LefSAQsmooqX
         x/3F1LjvQZU2fkjFQ2DKVS6Udqm1KeQAbmEUxNDhIsocgykcLKP6DIzn/z4j5GM7YXtT
         CNzWg9dkCkP1lvpNbzgyaYzRSRqQUF9awW6n4EY4IOsI39Zd6BRz1jGxJhQ68qiPKGS2
         XaxkFZSzjRxSrKIkFmjRJJ8ZU/5VKwlF2OyhtFUi+s/ZNVM+BqLrjPsAvZLbBipLHwv6
         +lMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iiS6dj2sB11ly4j4uSh7u5Zd1DrtVioNJewlYZWn2NM=;
        b=4tz98MQ/wSOuWkwP3hYDgKus9MuBCr9l8mJTgMrQQhnEBQKIpLY0eZTDmoEQ5xOpGE
         I0QpP5NCVkS6X8+waTOFuNNUZQ3YbYTJsPe/1Gsp2W3hKDiNBAoyzTzaOPW8HYgrcMSc
         UulaShy1FSpZA2CzWSgEnDThXONb7Vq/5hLwjyeWTX7tVQ4guBP1rvMMqHBevqzX34Oj
         o+dayuQc97VdxfSZgznIGGZuDqT9DTCrP+A91OQc7NIvy7PxtRHza/9wTgWPN/m3uX+i
         YyrbcuWNbjDNj5TD9ivSUs0Rzt8K+hfkRRoxbrNt0O0LAb6Ce522OzDlNFT9IV7vewXY
         KW2w==
X-Gm-Message-State: AJIora/MXzTvcqYZPM2j8IZpVfwb4MDOobAunU6rhDeKtITmvyi1tDGl
	5rsRKwf3RSfPSwyS1IeDjmH2iPhPB40=
X-Google-Smtp-Source: AGRyM1vKi3cOPXfrhaQuLI67EAW/R292iP/eQSqiekiN3ioMdeOPSiX6lfzM6ZHNG5tKKaooA4ldgQ==
X-Received: by 2002:a05:6a00:815:b0:52b:295a:fad with SMTP id m21-20020a056a00081500b0052b295a0fadmr25742875pfk.62.1658989925772;
        Wed, 27 Jul 2022 23:32:05 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:32:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 15/17] powerpc/qspinlock: reduce remote node steal spins
Date: Thu, 28 Jul 2022 16:31:18 +1000
Message-Id: <20220728063120.2867508-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220728063120.2867508-1-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allow for a reduction in the number of times a CPU from a different
node than the owner can attempt to steal the lock before queueing.
This could bias the transfer behaviour of the lock across the
machine and reduce NUMA crossings.
---
 arch/powerpc/lib/qspinlock.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index d4594c701f7d..24f68bd71e2b 100644
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
 static int STEAL_SPINS __read_mostly = (1<<5);
+static int REMOTE_STEAL_SPINS __read_mostly = (1<<2);
 #if _Q_SPIN_TRY_LOCK_STEAL == 1
 static const bool MAYBE_STEALERS = true;
 #else
@@ -39,9 +41,13 @@ static bool pv_prod_head __read_mostly = false;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
-static __always_inline int get_steal_spins(bool paravirt)
+static __always_inline int get_steal_spins(bool paravirt, bool remote)
 {
-	return STEAL_SPINS;
+	if (remote) {
+		return REMOTE_STEAL_SPINS;
+	} else {
+		return STEAL_SPINS;
+	}
 }
 
 static __always_inline int get_head_spins(bool paravirt)
@@ -380,8 +386,13 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 
 		iters++;
 
-		if (iters >= get_steal_spins(paravirt))
+		if (iters >= get_steal_spins(paravirt, false))
 			break;
+		if (iters >= get_steal_spins(paravirt, true)) {
+			int cpu = get_owner_cpu(val);
+			if (numa_node_id() != cpu_to_node(cpu))
+				break;
+		}
 	}
 	spin_end();
 
@@ -588,6 +599,22 @@ static int steal_spins_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_steal_spins, steal_spins_get, steal_spins_set, "%llu\n");
 
+static int remote_steal_spins_set(void *data, u64 val)
+{
+	REMOTE_STEAL_SPINS = val;
+
+	return 0;
+}
+
+static int remote_steal_spins_get(void *data, u64 *val)
+{
+	*val = REMOTE_STEAL_SPINS;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_remote_steal_spins, remote_steal_spins_get, remote_steal_spins_set, "%llu\n");
+
 static int head_spins_set(void *data, u64 val)
 {
 	HEAD_SPINS = val;
@@ -687,6 +714,7 @@ DEFINE_SIMPLE_ATTRIBUTE(fops_pv_prod_head, pv_prod_head_get, pv_prod_head_set, "
 static __init int spinlock_debugfs_init(void)
 {
 	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
+	debugfs_create_file("qspl_remote_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_remote_steal_spins);
 	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
 	if (is_shared_processor()) {
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
-- 
2.35.1

