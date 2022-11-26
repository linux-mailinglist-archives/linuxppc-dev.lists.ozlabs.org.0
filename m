Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF0663953A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:13:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6xt0Tbdz3f7X
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:13:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Uz2ctzj8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Uz2ctzj8;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6g046Fkz3f5N
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 21:00:28 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id p24so2206850plw.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 02:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBy5d72hkipKEzW7/+Qx9hfjXm8nInTVQ43zZOGgfU4=;
        b=Uz2ctzj8rweykYICpms/OKJqj5L0r7Tur5w+zXFNPYc1QNKs1iIwNATumYISt51BhJ
         YO38WUA9yQqG7rkEjXZs5oYVxUkUY/zHgU0ATD6wVsb0vZtsFQYjKQ17xShnLwi8THQN
         +awT95h4aD8AJZfG02BEnGCx6mb9L1IePwt5kiE+Xz/KHsq3bNRmlgXhU7L9XbqhW8KN
         SZ1nNOfR4MtanXoertuXh7ATi4D7tbbDIjgs3sdTpK3RV9JUC6oQdoP++kJhjd+yQOQ2
         Jsy/bIMzj2eJfIvMDhx2/dERpahaRepuezeJ9MA0fV1ZFFnfb9QIN7/y24Qi4NJQMExx
         QNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBy5d72hkipKEzW7/+Qx9hfjXm8nInTVQ43zZOGgfU4=;
        b=LbYwLBK4t57rYsmZxUkEH8K3Bmq9j2kBlw25i/69HdYhcyqYF2dDrDFY1PtNnisZ+g
         l+XW20vGclp5v/3tUrbhqT3q/+jPPXUPvy1sL/Y7QhxDPC0juBKkIED5W4hUgyQHWvIG
         WGqMLEZfAH1xBjyLocr9Mk+RamRACWsMiNTGwd6tVfwYWHUGL95FkMJae4CiKopJxwYP
         LdUj2Kh0g92BLsa6jus4JLH0pdmybc7j/+9nh5mD8RZViwz25368fkk6VbpaTyO15zGH
         CmSo3Zyyt0p9nvb3hEUqX+eRXaouy355U5lo52c1eRyBcBZlLJLrZmbhvNRC9SVc+3LK
         IqVQ==
X-Gm-Message-State: ANoB5pnE/ekUL+j6IQpOV842D7HHkegAyfa26VABAUvdUBwbKh2Ihoa/
	eTz7o7GhCxwm0bHxKCJnq6OcJ1G1xAQoKw==
X-Google-Smtp-Source: AA0mqf6Fn0hjvb8uHVGVZITKzghyrrD5jvcCRFMJrep6wm4aUvR2A+Y+h0toyeeghQcRJVHLp0oPPA==
X-Received: by 2002:a17:902:7fc6:b0:189:680d:f063 with SMTP id t6-20020a1709027fc600b00189680df063mr6884206plb.55.1669456826024;
        Sat, 26 Nov 2022 02:00:26 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.02.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 02:00:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 14/17] powerpc/qspinlock: reduce remote node steal spins
Date: Sat, 26 Nov 2022 19:59:29 +1000
Message-Id: <20221126095932.1234527-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221126095932.1234527-1-npiggin@gmail.com>
References: <20221126095932.1234527-1-npiggin@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
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
index 70f924296b36..7f6b41627351 100644
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
@@ -335,10 +342,24 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
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
 
 	if (!steal_spins)
 		return false;
@@ -347,8 +368,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 	spin_begin();
 
 	do {
-		u32 val = READ_ONCE(lock->val);
-
+		val = READ_ONCE(lock->val);
 		if (val & _Q_MUST_Q_VAL)
 			break;
 
@@ -362,7 +382,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 		}
 
 		iters++;
-	} while (iters < get_steal_spins(paravirt));
+	} while (!steal_break(val, iters, paravirt));
 
 	spin_end();
 
@@ -560,6 +580,22 @@ static int steal_spins_get(void *data, u64 *val)
 
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
@@ -659,6 +695,7 @@ DEFINE_SIMPLE_ATTRIBUTE(fops_pv_prod_head, pv_prod_head_get, pv_prod_head_set, "
 static __init int spinlock_debugfs_init(void)
 {
 	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
+	debugfs_create_file("qspl_remote_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_remote_steal_spins);
 	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
 	if (is_shared_processor()) {
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
-- 
2.37.2

