Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 934F7667048
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 11:55:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nt1fm3PxFz3fCJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 21:55:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h8QjrQBs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h8QjrQBs;
	dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nt1dp3gRrz3c2W
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 21:54:37 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id s67so12512247pgs.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 02:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9iP7sVq72owAsCaLRDRWrJyz/2SPBWD/zqMuimFV62c=;
        b=h8QjrQBsSmb5hvUQB05p02td/5Hg9ajyH+4BzoOFHUlA//3317l/BmN1NVnFFREt/Q
         IBYThpMg+IFwrC4k7nTg5+oHLhLnG7NWH4EfINdh0wCpVwi+EWhzzbUxyqqVnH5XgRAy
         UDz7mdbINvdPV0+IEgLpKHOnHs4kxEcfvbTkSfo/xaa/+8RKt+sfHaLbql7OwzTlqlSY
         1RAUC0PSqIYTE50N+hAI5Zyba16DrbbbiEXHglsRzXAeysPUkAmTrkQX8NCVbXfwLKv1
         kBbUv1DyAVVGaWc77h3uChMcshP9p4ahu+mbOvxU+WRnaWoS5bG4cSnkZrHTntF1YxZN
         Qbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iP7sVq72owAsCaLRDRWrJyz/2SPBWD/zqMuimFV62c=;
        b=idZvYOZzWX/Ffac9TdsM/4SLgbH5v/IUxZ/LpohPoq/l9Se6cw1T1HWwEt0PPEAcbP
         TAKqJdGAjVbMQZYVyMKsBLM9Zryfij8tBzQmpaKS24t6Q0Hp7wasd0K4SdS9QhPkBGLV
         te7W2fZy8wJX0cQGcn45xSZP5yGrubQ6S3iVLRX3ART7OEGc36asNaWshEHkLElTEKwU
         0bzZrbIGaSgfqRFBOumaDTlabJUZZY+3gJ1t3R7zMK/tD/V1bHj7K6etik40qIajhJny
         XXun2cJVthfi4lXyvTQ7Lz2iulBYielNYCiRBUDiGbYhx1ZS6SzvjthjPZAk2O6gdscb
         UPKg==
X-Gm-Message-State: AFqh2kp1/wfuJaJD4a7GALqAkFdjb8SgN3vsAvJXUPY3Jcun7JOC6EBg
	/mKJ58kHpFZschrT5i7yUHo=
X-Google-Smtp-Source: AMrXdXuJYr7IANlERZdu5+nkMfo07TmOuFv1Pk8yIXbtU+EySoO4KIlu2FFiHnWNzz1MkZdOyvkThg==
X-Received: by 2002:a62:5f43:0:b0:576:dc40:6db9 with SMTP id t64-20020a625f43000000b00576dc406db9mr70336312pfb.13.1673520874465;
        Thu, 12 Jan 2023 02:54:34 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-88-198.tpgi.com.au. [193.116.88.198])
        by smtp.gmail.com with ESMTPSA id g26-20020aa796ba000000b005891c98e1aasm7070970pfk.119.2023.01.12.02.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 02:54:33 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] kallsyms: Fix scheduling with interrupts disabled in self-test
Date: Thu, 12 Jan 2023 20:54:26 +1000
Message-Id: <20230112105426.1037325-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: "Erhard F ." <erhard_f@mailbox.org>, Nicholas Piggin <npiggin@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, kernel test robot <oliver.sang@intel.com>, Zhen Lei <thunder.leizhen@huawei.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kallsyms_on_each* may schedule so must not be called with interrupts
disabled. The iteration function could disable interrupts, but this
also changes lookup_symbol() to match the change to the other timing
code.

Reported-by: Erhard F. <erhard_f@mailbox.org>
Link: https://lore.kernel.org/all/bug-216902-206035@https.bugzilla.kernel.org%2F/
Reported-by: kernel test robot <oliver.sang@intel.com>
Link: https://lore.kernel.org/oe-lkp/202212251728.8d0872ff-oliver.sang@intel.com
Fixes: 30f3bb09778d ("kallsyms: Add self-test facility")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 kernel/kallsyms_selftest.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/kernel/kallsyms_selftest.c b/kernel/kallsyms_selftest.c
index f35d9cc1aab1..bfbc12da3326 100644
--- a/kernel/kallsyms_selftest.c
+++ b/kernel/kallsyms_selftest.c
@@ -157,14 +157,11 @@ static void test_kallsyms_compression_ratio(void)
 static int lookup_name(void *data, const char *name, struct module *mod, unsigned long addr)
 {
 	u64 t0, t1, t;
-	unsigned long flags;
 	struct test_stat *stat = (struct test_stat *)data;
 
-	local_irq_save(flags);
-	t0 = sched_clock();
+	t0 = ktime_get_ns();
 	(void)kallsyms_lookup_name(name);
-	t1 = sched_clock();
-	local_irq_restore(flags);
+	t1 = ktime_get_ns();
 
 	t = t1 - t0;
 	if (t < stat->min)
@@ -234,18 +231,15 @@ static int find_symbol(void *data, const char *name, struct module *mod, unsigne
 static void test_perf_kallsyms_on_each_symbol(void)
 {
 	u64 t0, t1;
-	unsigned long flags;
 	struct test_stat stat;
 
 	memset(&stat, 0, sizeof(stat));
 	stat.max = INT_MAX;
 	stat.name = stub_name;
 	stat.perf = 1;
-	local_irq_save(flags);
-	t0 = sched_clock();
+	t0 = ktime_get_ns();
 	kallsyms_on_each_symbol(find_symbol, &stat);
-	t1 = sched_clock();
-	local_irq_restore(flags);
+	t1 = ktime_get_ns();
 	pr_info("kallsyms_on_each_symbol() traverse all: %lld ns\n", t1 - t0);
 }
 
@@ -270,17 +264,14 @@ static int match_symbol(void *data, unsigned long addr)
 static void test_perf_kallsyms_on_each_match_symbol(void)
 {
 	u64 t0, t1;
-	unsigned long flags;
 	struct test_stat stat;
 
 	memset(&stat, 0, sizeof(stat));
 	stat.max = INT_MAX;
 	stat.name = stub_name;
-	local_irq_save(flags);
-	t0 = sched_clock();
+	t0 = ktime_get_ns();
 	kallsyms_on_each_match_symbol(match_symbol, stat.name, &stat);
-	t1 = sched_clock();
-	local_irq_restore(flags);
+	t1 = ktime_get_ns();
 	pr_info("kallsyms_on_each_match_symbol() traverse all: %lld ns\n", t1 - t0);
 }
 
-- 
2.37.2

