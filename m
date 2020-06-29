Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD320CD46
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 10:28:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wLGx6zqFzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 18:28:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CH5VwQtB; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wLCK0l97zDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 18:25:16 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id u5so7591737pfn.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bDEuNi6VcWGVZVG3Ao7I2ar+mftbkIzW0ZQYBhMw7zM=;
 b=CH5VwQtBwbK7psYBEhtv+ShpD0ybafiNCeyEP4XUtP5hi+Sqgi6uV4Jt6LVnSi7p9T
 NkHzvSd52VNpimgFoZZqHNLrx3CSEsuY5gsVUKGCli/5+XruiPVSQjO89BV7UEOglnxj
 eEcGuBBGYiCYGiiSaWdtMDrOP7mu+zLkQhj6HObnhwMa79GWwkwY1s3x3KFVcdDdcVoy
 NDpFYgZtPN1xcAoLtWIhp8wMaWszjZ6zxz0/yoQYIQoieY/GJ7CK8uIXbKCZjSmh3E/M
 yJM7aw8DDBt6SPHBK4AkaancxZzkQLOJucjfYxaUu3Gt0+YO8NS9J3JTuxmddkf1nBPQ
 un1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bDEuNi6VcWGVZVG3Ao7I2ar+mftbkIzW0ZQYBhMw7zM=;
 b=e0RJqmR0NnIKMCnoou4llQCm1PBsx5j/Q5POIbsJRxeChqf5/jGQVRRyPJxEwF9F3+
 ZbARtOfD0LF6RZ3xacMLnYSE17Ho1nHBj33NHgudfslI8CV1KL/oF+tWdEe+kNZttZUA
 J+zUsAb3+rQwKZDl3YGVg/XTTdoHN3esjsnvi3xjvI+11GIkq8KxJrIcp2+Fad93dyvm
 D7x3WJYexF8FTcrEETJZ+BtzHAz3CUqZlgycX8kPTgBxnTU8lN8xCrtTZIrY09/o2sUY
 JdukywNjsMqc31ujxPgh9X+3aqGbRl+TkUmr7v1vYIfYuZXv3cpxywBkiZub+55jF/aY
 psew==
X-Gm-Message-State: AOAM532AgYc/x0kF3pEEMsjkPa4PQH89Q70NOeq0/FpTtPiuKQZ5RVKA
 ioVRD9XEsJDH09xuwXl3RLeQUA==
X-Google-Smtp-Source: ABdhPJxKS+tnpfq+snMQNel0FINgShzWxWL+ahyS1rhejANCnpTtrynuTl48vDRixQnXKcJDiwAmyg==
X-Received: by 2002:a62:7847:: with SMTP id t68mr5093605pfc.112.1593419114535; 
 Mon, 29 Jun 2020 01:25:14 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id 21sm13043683pfu.124.2020.06.29.01.25.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 01:25:13 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>, Arnd Bergmann <arnd@arndb.de>,
 Viresh Kumar <viresh.kumar@linaro.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>
Subject: [PATCH V4 2/3] cpufreq: Register governors at core_initcall
Date: Mon, 29 Jun 2020 13:54:59 +0530
Message-Id: <643132f6e7c8b0e94d03a4d4c121c738504b8aa3.1593418662.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1593418662.git.viresh.kumar@linaro.org>
References: <cover.1593418662.git.viresh.kumar@linaro.org>
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
Cc: Quentin Perret <qperret@google.com>, kernel-team@android.com,
 adharmap@codeaurora.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, tkjos@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Quentin Perret <qperret@google.com>

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
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
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
2.25.0.rc1.19.g042ed3e048af

