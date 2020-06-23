Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5B22054BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 16:29:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rpZS0LyYzDqVc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 00:29:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--qperret.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=39g_yxgckdnsnmboobqdlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--qperret.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=hlP5GaD7; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rpPW3RHDzDqSw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 00:21:45 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id w9so24503563ybt.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=MmmCUJDD5+9HI3EpNvpfkwmBn/Y1ec08N6RffRgzFpE=;
 b=hlP5GaD7sZVLXzLUF1+/TSx8tNzuFNpPcJruSl5+xZWxs4lXzAB/dQsqD9fi9nHR+E
 FBBnPiw3hBpPCV97Lccq/zkuWdm8suDybOZrqVAor+7eljJa2OafMb55go6vgABy7UV2
 iTIkeRcXpYRUYMGJShHdnXgTB9owLkRFygg1Hzb/+8CHlJ8vAvP6UO6DnWzsST8VADdk
 zsTx7sTGudHtLsrC4eTZr8N3c4r6SHBYptGm0kGDYGCt3hvCDLpoAuHKlL9iaOVM3QWe
 ZgPkPHf1Osz8VQj1AdLcvzsg8il+yQWjTMbo/chwn7aixe0HyTlT7cdF8STLgZdXJ86N
 vssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=MmmCUJDD5+9HI3EpNvpfkwmBn/Y1ec08N6RffRgzFpE=;
 b=gkLxtMb/OVHkr32f3l+OD4u6tFW9z2mrsFqinXOXczDjZF8OVDdY4v6L5uTPbFXSps
 6Y+sy9bhVjvaqxkh9W+hI9axaT++sx8cHXIhtRwZ5/zEONMA4e8YwVsubnZvzMp+70RL
 toYI9AvBt53Wm4P9Rq+rCL9sFHrAHtpNdz0kQddBaci6fEHzPYTcjgKz7z6f3HXYOMrC
 aRCEEIFh1uha5o7D+gdJ/dfYVU4OlN1GZ9RNAtuWTjaaehkbLm6ogHOmoTxIYR6J7ZIV
 VA30IBHWWCCzRvwNQHZYgsBXINm3FyIdLeShQFz/pknHwQFLxXnaUIqC2oepcpslJ4ur
 ksMg==
X-Gm-Message-State: AOAM532pavLDf4+NkXCD361lyAFhgWFpzBvRiMVo0bCHwgK2y0uZzxW2
 RAy6hGv6TS2QgQleiXAj49aMSdOVLesS
X-Google-Smtp-Source: ABdhPJwU5cC78BtgxriQavH8sPaUxDY8Glta7MskA0aXUMCLuOhQB5rj59Wj1TwN8u7FoJ4XFZpbeKPolqKx
X-Received: by 2002:a25:18d5:: with SMTP id 204mr29318722yby.209.1592922102120; 
 Tue, 23 Jun 2020 07:21:42 -0700 (PDT)
Date: Tue, 23 Jun 2020 15:21:37 +0100
In-Reply-To: <20200623142138.209513-1-qperret@google.com>
Message-Id: <20200623142138.209513-2-qperret@google.com>
Mime-Version: 1.0
References: <20200623142138.209513-1-qperret@google.com>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
Subject: [PATCH v2 1/2] cpufreq: Register governors at core_initcall
From: Quentin Perret <qperret@google.com>
To: rjw@rjwysocki.net, rafael@kernel.org, viresh.kumar@linaro.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: juri.lelli@redhat.com, kernel-team@android.com, vincent.guittot@linaro.org,
 arnd@arndb.de, linux-pm@vger.kernel.org, peterz@infradead.org,
 adharmap@codeaurora.org, qperret@google.com, linux-kernel@vger.kernel.org,
 mingo@redhat.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 tkjos@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, most CPUFreq governors are registered at core_initcall time
when used as default, and module_init otherwise. In preparation for
letting users specify the default governor on the kernel command line,
change all of them to use core_initcall unconditionally, as is already
the case for schedutil and performance. This will enable us to assume
builtin governors have been registered before the builtin CPUFreq
drivers probe.

And since all governors now have similar init/exit patterns, introduce
two new macros cpufreq_governor_{init,exit}() to factorize the code.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Quentin Perret <qperret@google.com>
---
Note: I couldn't boot-test the change to spudemand, by lack of hardware.
But I can confirm cell_defconfig compiles just fine.
---
 .../platforms/cell/cpufreq_spudemand.c        | 26 ++-----------------
 drivers/cpufreq/cpufreq_conservative.c        | 22 ++++------------
 drivers/cpufreq/cpufreq_ondemand.c            | 24 +++++------------
 drivers/cpufreq/cpufreq_performance.c         | 14 ++--------
 drivers/cpufreq/cpufreq_powersave.c           | 18 +++----------
 drivers/cpufreq/cpufreq_userspace.c           | 18 +++----------
 include/linux/cpufreq.h                       | 14 ++++++++++
 kernel/sched/cpufreq_schedutil.c              |  6 +----
 8 files changed, 36 insertions(+), 106 deletions(-)

diff --git a/arch/powerpc/platforms/cell/cpufreq_spudemand.c b/arch/powerpc/platforms/cell/cpufreq_spudemand.c
index 55b31eadb3c8..ca7849e113d7 100644
--- a/arch/powerpc/platforms/cell/cpufreq_spudemand.c
+++ b/arch/powerpc/platforms/cell/cpufreq_spudemand.c
@@ -126,30 +126,8 @@ static struct cpufreq_governor spu_governor = {
 	.stop = spu_gov_stop,
 	.owner = THIS_MODULE,
 };
-
-/*
- * module init and destoy
- */
-
-static int __init spu_gov_init(void)
-{
-	int ret;
-
-	ret = cpufreq_register_governor(&spu_governor);
-	if (ret)
-		printk(KERN_ERR "registration of governor failed\n");
-	return ret;
-}
-
-static void __exit spu_gov_exit(void)
-{
-	cpufreq_unregister_governor(&spu_governor);
-}
-
-
-module_init(spu_gov_init);
-module_exit(spu_gov_exit);
+cpufreq_governor_init(spu_governor);
+cpufreq_governor_exit(spu_governor);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Krafft <krafft@de.ibm.com>");
-
diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index 737ff3b9c2c0..aa39ff31ec9f 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -322,17 +322,7 @@ static struct dbs_governor cs_governor = {
 	.start = cs_start,
 };
 
-#define CPU_FREQ_GOV_CONSERVATIVE	(&cs_governor.gov)
-
-static int __init cpufreq_gov_dbs_init(void)
-{
-	return cpufreq_register_governor(CPU_FREQ_GOV_CONSERVATIVE);
-}
-
-static void __exit cpufreq_gov_dbs_exit(void)
-{
-	cpufreq_unregister_governor(CPU_FREQ_GOV_CONSERVATIVE);
-}
+#define CPU_FREQ_GOV_CONSERVATIVE	(cs_governor.gov)
 
 MODULE_AUTHOR("Alexander Clouter <alex@digriz.org.uk>");
 MODULE_DESCRIPTION("'cpufreq_conservative' - A dynamic cpufreq governor for "
@@ -343,11 +333,9 @@ MODULE_LICENSE("GPL");
 #ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
 struct cpufreq_governor *cpufreq_default_governor(void)
 {
-	return CPU_FREQ_GOV_CONSERVATIVE;
+	return &CPU_FREQ_GOV_CONSERVATIVE;
 }
-
-core_initcall(cpufreq_gov_dbs_init);
-#else
-module_init(cpufreq_gov_dbs_init);
 #endif
-module_exit(cpufreq_gov_dbs_exit);
+
+cpufreq_governor_init(CPU_FREQ_GOV_CONSERVATIVE);
+cpufreq_governor_exit(CPU_FREQ_GOV_CONSERVATIVE);
diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index 82a4d37ddecb..ac361a8b1d3b 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -408,7 +408,7 @@ static struct dbs_governor od_dbs_gov = {
 	.start = od_start,
 };
 
-#define CPU_FREQ_GOV_ONDEMAND	(&od_dbs_gov.gov)
+#define CPU_FREQ_GOV_ONDEMAND	(od_dbs_gov.gov)
 
 static void od_set_powersave_bias(unsigned int powersave_bias)
 {
@@ -429,7 +429,7 @@ static void od_set_powersave_bias(unsigned int powersave_bias)
 			continue;
 
 		policy = cpufreq_cpu_get_raw(cpu);
-		if (!policy || policy->governor != CPU_FREQ_GOV_ONDEMAND)
+		if (!policy || policy->governor != &CPU_FREQ_GOV_ONDEMAND)
 			continue;
 
 		policy_dbs = policy->governor_data;
@@ -461,16 +461,6 @@ void od_unregister_powersave_bias_handler(void)
 }
 EXPORT_SYMBOL_GPL(od_unregister_powersave_bias_handler);
 
-static int __init cpufreq_gov_dbs_init(void)
-{
-	return cpufreq_register_governor(CPU_FREQ_GOV_ONDEMAND);
-}
-
-static void __exit cpufreq_gov_dbs_exit(void)
-{
-	cpufreq_unregister_governor(CPU_FREQ_GOV_ONDEMAND);
-}
-
 MODULE_AUTHOR("Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>");
 MODULE_AUTHOR("Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>");
 MODULE_DESCRIPTION("'cpufreq_ondemand' - A dynamic cpufreq governor for "
@@ -480,11 +470,9 @@ MODULE_LICENSE("GPL");
 #ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND
 struct cpufreq_governor *cpufreq_default_governor(void)
 {
-	return CPU_FREQ_GOV_ONDEMAND;
+	return &CPU_FREQ_GOV_ONDEMAND;
 }
-
-core_initcall(cpufreq_gov_dbs_init);
-#else
-module_init(cpufreq_gov_dbs_init);
 #endif
-module_exit(cpufreq_gov_dbs_exit);
+
+cpufreq_governor_init(CPU_FREQ_GOV_ONDEMAND);
+cpufreq_governor_exit(CPU_FREQ_GOV_ONDEMAND);
diff --git a/drivers/cpufreq/cpufreq_performance.c b/drivers/cpufreq/cpufreq_performance.c
index def9afe0f5b8..71c1d9aba772 100644
--- a/drivers/cpufreq/cpufreq_performance.c
+++ b/drivers/cpufreq/cpufreq_performance.c
@@ -23,16 +23,6 @@ static struct cpufreq_governor cpufreq_gov_performance = {
 	.limits		= cpufreq_gov_performance_limits,
 };
 
-static int __init cpufreq_gov_performance_init(void)
-{
-	return cpufreq_register_governor(&cpufreq_gov_performance);
-}
-
-static void __exit cpufreq_gov_performance_exit(void)
-{
-	cpufreq_unregister_governor(&cpufreq_gov_performance);
-}
-
 #ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
 struct cpufreq_governor *cpufreq_default_governor(void)
 {
@@ -50,5 +40,5 @@ MODULE_AUTHOR("Dominik Brodowski <linux@brodo.de>");
 MODULE_DESCRIPTION("CPUfreq policy governor 'performance'");
 MODULE_LICENSE("GPL");
 
-core_initcall(cpufreq_gov_performance_init);
-module_exit(cpufreq_gov_performance_exit);
+cpufreq_governor_init(cpufreq_gov_performance);
+cpufreq_governor_exit(cpufreq_gov_performance);
diff --git a/drivers/cpufreq/cpufreq_powersave.c b/drivers/cpufreq/cpufreq_powersave.c
index 1ae66019eb83..7749522355b5 100644
--- a/drivers/cpufreq/cpufreq_powersave.c
+++ b/drivers/cpufreq/cpufreq_powersave.c
@@ -23,16 +23,6 @@ static struct cpufreq_governor cpufreq_gov_powersave = {
 	.owner		= THIS_MODULE,
 };
 
-static int __init cpufreq_gov_powersave_init(void)
-{
-	return cpufreq_register_governor(&cpufreq_gov_powersave);
-}
-
-static void __exit cpufreq_gov_powersave_exit(void)
-{
-	cpufreq_unregister_governor(&cpufreq_gov_powersave);
-}
-
 MODULE_AUTHOR("Dominik Brodowski <linux@brodo.de>");
 MODULE_DESCRIPTION("CPUfreq policy governor 'powersave'");
 MODULE_LICENSE("GPL");
@@ -42,9 +32,7 @@ struct cpufreq_governor *cpufreq_default_governor(void)
 {
 	return &cpufreq_gov_powersave;
 }
-
-core_initcall(cpufreq_gov_powersave_init);
-#else
-module_init(cpufreq_gov_powersave_init);
 #endif
-module_exit(cpufreq_gov_powersave_exit);
+
+cpufreq_governor_init(cpufreq_gov_powersave);
+cpufreq_governor_exit(cpufreq_gov_powersave);
diff --git a/drivers/cpufreq/cpufreq_userspace.c b/drivers/cpufreq/cpufreq_userspace.c
index b43e7cd502c5..50a4d7846580 100644
--- a/drivers/cpufreq/cpufreq_userspace.c
+++ b/drivers/cpufreq/cpufreq_userspace.c
@@ -126,16 +126,6 @@ static struct cpufreq_governor cpufreq_gov_userspace = {
 	.owner		= THIS_MODULE,
 };
 
-static int __init cpufreq_gov_userspace_init(void)
-{
-	return cpufreq_register_governor(&cpufreq_gov_userspace);
-}
-
-static void __exit cpufreq_gov_userspace_exit(void)
-{
-	cpufreq_unregister_governor(&cpufreq_gov_userspace);
-}
-
 MODULE_AUTHOR("Dominik Brodowski <linux@brodo.de>, "
 		"Russell King <rmk@arm.linux.org.uk>");
 MODULE_DESCRIPTION("CPUfreq policy governor 'userspace'");
@@ -146,9 +136,7 @@ struct cpufreq_governor *cpufreq_default_governor(void)
 {
 	return &cpufreq_gov_userspace;
 }
-
-core_initcall(cpufreq_gov_userspace_init);
-#else
-module_init(cpufreq_gov_userspace_init);
 #endif
-module_exit(cpufreq_gov_userspace_exit);
+
+cpufreq_governor_init(cpufreq_gov_userspace);
+cpufreq_governor_exit(cpufreq_gov_userspace);
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 3494f6763597..e62b022cb07e 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -577,6 +577,20 @@ unsigned int cpufreq_policy_transition_delay_us(struct cpufreq_policy *policy);
 int cpufreq_register_governor(struct cpufreq_governor *governor);
 void cpufreq_unregister_governor(struct cpufreq_governor *governor);
 
+#define cpufreq_governor_init(__governor)			\
+static int __init __governor##_init(void)			\
+{								\
+	return cpufreq_register_governor(&__governor);	\
+}								\
+core_initcall(__governor##_init)
+
+#define cpufreq_governor_exit(__governor)			\
+static void __exit __governor##_exit(void)			\
+{								\
+	return cpufreq_unregister_governor(&__governor);	\
+}								\
+module_exit(__governor##_exit)
+
 struct cpufreq_governor *cpufreq_default_governor(void);
 struct cpufreq_governor *cpufreq_fallback_governor(void);
 
diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index 7fbaee24c824..402a09af9f43 100644
--- a/kernel/sched/cpufreq_schedutil.c
+++ b/kernel/sched/cpufreq_schedutil.c
@@ -909,11 +909,7 @@ struct cpufreq_governor *cpufreq_default_governor(void)
 }
 #endif
 
-static int __init sugov_register(void)
-{
-	return cpufreq_register_governor(&schedutil_gov);
-}
-core_initcall(sugov_register);
+cpufreq_governor_init(schedutil_gov);
 
 #ifdef CONFIG_ENERGY_MODEL
 extern bool sched_energy_update;
-- 
2.27.0.111.gc72c7da667-goog

