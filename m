Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9191FA3A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 00:43:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m5w016r3zDqLc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 08:43:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--qperret.bounces.google.com
 (client-ip=2607:f8b0:4864:20::74a; helo=mail-qk1-x74a.google.com;
 envelope-from=3iajnxgckda443s55s7u22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--qperret.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=cuJ222JF; dkim-atps=neutral
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lyCF5LGTzDqV5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 02:56:03 +1000 (AEST)
Received: by mail-qk1-x74a.google.com with SMTP id v197so14670231qkb.16
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 09:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=rmttyKz0sTdI4/Wk+GTFfxu2WU1sGb9iqnCsy3KIwVE=;
 b=cuJ222JFgG6Wav6PHDylftDoc7puvRPmG+8eTu72bSGUEDOtWWfL4+qfs6opmi6DwM
 k4fhKoIQPuntLywxeo0hKhCsK4qsCMCRBF9tXG4SMjRayA2OsSVe2gtEohxjRthTVwsg
 2PRIQ+MXqxwI7h7FPzvHSRwfcVFwqQIfAQ6fhzP6emUXWKLfQCdRtQUVR1SixDh2VnUZ
 kbeu7Uwf9js422PujgnJcqmE/g3U4No3d/Pk+2Y9V8Z8/6B/5B+0a93k9ivzVPoe67O9
 rYMK+R/DUuGXU5RI1/kRC4kPtS7CMq8C5b+vJH5vEJ0fR1ZG7DUOx3RL1ptqOLpng+bP
 nBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=rmttyKz0sTdI4/Wk+GTFfxu2WU1sGb9iqnCsy3KIwVE=;
 b=pLcCvK6kewMYAXfpPk08Sqash9fIYXWc1f6Qtmp4nswpTJxNk+xBeomDp9ML+FwOc4
 XyGHROZbNawAhD/e5ciHHWwDsDvHMlC8pPMvl67aNBH1biE5iycz4JTUt/byKl9DPj3S
 L/g/mp8dL41UVQruygUCM3OlH+aaE+fZjRoKvAzWQii5llJO9mUSPk0TS7HoJ6d/sTNk
 mrSNSxsu3tAF8cABWxNWWdYQ9NCcJi7uc+xCbXcYSH/9P5SXurMIg2LICJrKc25dZgIi
 r1pEvAJHfHiX6OUh2q8mKepgWsHl51K2bTnJH6VPcb0haRVi8SjE4sZtQXmvvh944ZWg
 wkTg==
X-Gm-Message-State: AOAM532Nlnar+O5bL2qzh19pCd+wqXp1zOxsnazaz5ER0rE1dgFzI7AF
 IsqguAaLUhAsSW8hcmv7c3HCVj/Gznzb
X-Google-Smtp-Source: ABdhPJxu0sj2E89tKcmQTaKcRjumvWg2bCjfwFUYPI2vq1B6zd2GBouCZQ6YlWOEiSqJmqO1hAUpGCE4vThl
X-Received: by 2002:ad4:43c8:: with SMTP id o8mr26494403qvs.235.1592240161344; 
 Mon, 15 Jun 2020 09:56:01 -0700 (PDT)
Date: Mon, 15 Jun 2020 17:55:54 +0100
In-Reply-To: <20200615165554.228063-1-qperret@google.com>
Message-Id: <20200615165554.228063-3-qperret@google.com>
Mime-Version: 1.0
References: <20200615165554.228063-1-qperret@google.com>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: [PATCH 2/2] cpufreq: Specify default governor on command line
From: Quentin Perret <qperret@google.com>
To: rjw@rjwysocki.net, rafael@kernel.org, viresh.kumar@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 16 Jun 2020 08:37:34 +1000
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

Currently, the only way to specify the default CPUfreq governor is via
Kconfig options, which suits users who can build the kernel themselves
perfectly.

However, for those who use a distro-like kernel (such as Android, with
the Generic Kernel Image project), the only way to use a different
default is to boot to userspace, and to then switch using the sysfs
interface. Being able to specify the default governor on the command
line, like is the case for cpuidle, would enable those users to specify
their governor of choice earlier on, and to simplify slighlty the
userspace boot procedure.

To support this use-case, add a kernel command line parameter enabling
to specify a default governor for CPUfreq, which takes precedence over
the builtin default.

This implementation has one notable limitation: the default governor
must be registered before the driver. This is solved for builtin
governors and drivers using appropriate *_initcall() functions. And in
the modular case, this must be reflected as a constraint on the module
loading order.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  5 +++
 Documentation/admin-guide/pm/cpufreq.rst      |  6 ++--
 drivers/cpufreq/cpufreq.c                     | 34 ++++++++++++++++---
 3 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb95fad81c79..5fd3c9f187eb 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -703,6 +703,11 @@
 	cpufreq.off=1	[CPU_FREQ]
 			disable the cpufreq sub-system
 
+	cpufreq.default_governor=
+			[CPU_FREQ] Name of the default cpufreq governor to use.
+			This governor must be registered in the kernel before
+			the cpufreq driver probes.
+
 	cpu_init_udelay=N
 			[X86] Delay for N microsec between assert and de-assert
 			of APIC INIT to start processors.  This delay occurs
diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
index 0c74a7784964..368e612145d2 100644
--- a/Documentation/admin-guide/pm/cpufreq.rst
+++ b/Documentation/admin-guide/pm/cpufreq.rst
@@ -147,9 +147,9 @@ CPUs in it.
 
 The next major initialization step for a new policy object is to attach a
 scaling governor to it (to begin with, that is the default scaling governor
-determined by the kernel configuration, but it may be changed later
-via ``sysfs``).  First, a pointer to the new policy object is passed to the
-governor's ``->init()`` callback which is expected to initialize all of the
+determined by the kernel command line or configuration, but it may be changed
+later via ``sysfs``).  First, a pointer to the new policy object is passed to
+the governor's ``->init()`` callback which is expected to initialize all of the
 data structures necessary to handle the given policy and, possibly, to add
 a governor ``sysfs`` interface to it.  Next, the governor is started by
 invoking its ``->start()`` callback.
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 0128de3603df..0f05caedc320 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -50,6 +50,9 @@ static LIST_HEAD(cpufreq_governor_list);
 #define for_each_governor(__governor)				\
 	list_for_each_entry(__governor, &cpufreq_governor_list, governor_list)
 
+static char cpufreq_param_governor[CPUFREQ_NAME_LEN];
+static struct cpufreq_governor *default_governor;
+
 /**
  * The "cpufreq driver" - the arch- or hardware-dependent low
  * level driver of CPUFreq support, and its spinlock. This lock
@@ -1055,7 +1058,6 @@ __weak struct cpufreq_governor *cpufreq_default_governor(void)
 
 static int cpufreq_init_policy(struct cpufreq_policy *policy)
 {
-	struct cpufreq_governor *def_gov = cpufreq_default_governor();
 	struct cpufreq_governor *gov = NULL;
 	unsigned int pol = CPUFREQ_POLICY_UNKNOWN;
 
@@ -1065,8 +1067,8 @@ static int cpufreq_init_policy(struct cpufreq_policy *policy)
 		if (gov) {
 			pr_debug("Restoring governor %s for cpu %d\n",
 				 policy->governor->name, policy->cpu);
-		} else if (def_gov) {
-			gov = def_gov;
+		} else if (default_governor) {
+			gov = default_governor;
 		} else {
 			return -ENODATA;
 		}
@@ -1074,8 +1076,8 @@ static int cpufreq_init_policy(struct cpufreq_policy *policy)
 		/* Use the default policy if there is no last_policy. */
 		if (policy->last_policy) {
 			pol = policy->last_policy;
-		} else if (def_gov) {
-			pol = cpufreq_parse_policy(def_gov->name);
+		} else if (default_governor) {
+			pol = cpufreq_parse_policy(default_governor->name);
 			/*
 			 * In case the default governor is neiter "performance"
 			 * nor "powersave", fall back to the initial policy
@@ -2196,6 +2198,24 @@ __weak struct cpufreq_governor *cpufreq_fallback_governor(void)
 	return NULL;
 }
 
+static void cpufreq_get_default_governor(void)
+{
+	default_governor = cpufreq_parse_governor(cpufreq_param_governor);
+	if (!default_governor) {
+		if (*cpufreq_param_governor)
+			pr_warn("Failed to find %s\n", cpufreq_param_governor);
+		default_governor = cpufreq_default_governor();
+	}
+}
+
+static void cpufreq_put_default_governor(void)
+{
+	if (!default_governor)
+		return;
+	module_put(default_governor->owner);
+	default_governor = NULL;
+}
+
 static int cpufreq_init_governor(struct cpufreq_policy *policy)
 {
 	int ret;
@@ -2701,6 +2721,8 @@ int cpufreq_register_driver(struct cpufreq_driver *driver_data)
 
 	if (driver_data->setpolicy)
 		driver_data->flags |= CPUFREQ_CONST_LOOPS;
+	else
+		cpufreq_get_default_governor();
 
 	if (cpufreq_boost_supported()) {
 		ret = create_boost_sysfs_file();
@@ -2769,6 +2791,7 @@ int cpufreq_unregister_driver(struct cpufreq_driver *driver)
 	subsys_interface_unregister(&cpufreq_interface);
 	remove_boost_sysfs_file();
 	cpuhp_remove_state_nocalls_cpuslocked(hp_online);
+	cpufreq_put_default_governor();
 
 	write_lock_irqsave(&cpufreq_driver_lock, flags);
 
@@ -2792,4 +2815,5 @@ static int __init cpufreq_core_init(void)
 	return 0;
 }
 module_param(off, int, 0444);
+module_param_string(default_governor, cpufreq_param_governor, CPUFREQ_NAME_LEN, 0444);
 core_initcall(cpufreq_core_init);
-- 
2.27.0.290.gba653c62da-goog

