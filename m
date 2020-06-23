Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 684E92054D0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 16:35:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rphm15VPzDqNT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 00:35:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--qperret.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3-a_yxgckdn0podqqdsfnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--qperret.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=L+PgZpf1; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rpPY1ksbzDqLF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 00:21:46 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id c17so24164260ybf.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=3FVZM6YK4WuItfsUzRuxaLQpo5idX99+ykpcHtbDxao=;
 b=L+PgZpf1ipA1/ahUV409sUxMwe9aXxIjms47WLR6AQumOcds1mlpb4KHQjOh8mUJos
 ZKooyOz/cW31DiK0jFqsCvhBDbK+LojeLU3VpOWEiavltM4rgbl5NtOQfDibxiUb4bLK
 4cu7P+h9YaxCtzDv/VSqgajZUcfnZX9KGphTkGSNAHsfwG40AtJ+uPy5Q4A5pZX1VkQv
 HkSEHOt21LFJRvA0k6k8RJs/SRMLYTpA+k3+vtbJ/I5AM/Tzs6lU3XHFxhLqsIJoOZ2L
 jyAwAuUNB1/nKjmUCnnvuJQfWJYAz86jtWt4Pmm/pbjnGeSnnqmuqvXuCPWs3SkxsM7Q
 6UHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=3FVZM6YK4WuItfsUzRuxaLQpo5idX99+ykpcHtbDxao=;
 b=AFlCk7PV0+SdrQnkbZvOf5zFBucVhlI0qKQDq6TauR4iE0JdbgqVjrOZNoulH+L8Wx
 B9xq8/R8lVMUaW5ut7zB1c5+aADAyv/osvfukjU3ICoXTd9C6EaB1dPJMXpUY571R19q
 IsxIVUIc6Y0TShqAHm8koSaKsSCnNMmUSFbUblZziEEMkBDHpNqqe1j4je+L9llfdHrl
 yW6S5PRbcCP0y4dZbHdKw5g9oyZQdsQmskzqBYrGgXB9BUi4oxwhxZWLBQcwzksjs74F
 Y3Ys0S/MQZO5No2EIHz2qVHwBY5fooCWSOEpLirtXejz77QcXPdS7k4ihi40eVVMginY
 JvQQ==
X-Gm-Message-State: AOAM531QXEksz6KLZQYhTfRBDQsY7y1DaADeCLNiEaS35Uu2w39Bp+/7
 TEEy36wOT20N0ehJhTXBrtl6f3ozIx/D
X-Google-Smtp-Source: ABdhPJwxz7yaVNFBCa7KewRziQgnrBazx0rNXq0015FvhEtCqD12iPNPYMWA9BTVzY0JbqD3X0mIRc8+ZLeM
X-Received: by 2002:a25:54e:: with SMTP id 75mr35259783ybf.222.1592922104320; 
 Tue, 23 Jun 2020 07:21:44 -0700 (PDT)
Date: Tue, 23 Jun 2020 15:21:38 +0100
In-Reply-To: <20200623142138.209513-1-qperret@google.com>
Message-Id: <20200623142138.209513-3-qperret@google.com>
Mime-Version: 1.0
References: <20200623142138.209513-1-qperret@google.com>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
Subject: [PATCH v2 2/2] cpufreq: Specify default governor on command line
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
 .../admin-guide/kernel-parameters.txt         |  5 ++++
 Documentation/admin-guide/pm/cpufreq.rst      |  6 ++---
 drivers/cpufreq/cpufreq.c                     | 23 +++++++++++++++----
 3 files changed, 26 insertions(+), 8 deletions(-)

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
index 0128de3603df..4b1a5c0173cf 100644
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
@@ -2320,6 +2322,9 @@ int cpufreq_register_governor(struct cpufreq_governor *governor)
 		list_add(&governor->governor_list, &cpufreq_governor_list);
 	}
 
+	if (!strncasecmp(cpufreq_param_governor, governor->name, CPUFREQ_NAME_LEN))
+		default_governor = governor;
+
 	mutex_unlock(&cpufreq_governor_mutex);
 	return err;
 }
@@ -2348,6 +2353,8 @@ void cpufreq_unregister_governor(struct cpufreq_governor *governor)
 
 	mutex_lock(&cpufreq_governor_mutex);
 	list_del(&governor->governor_list);
+	if (governor == default_governor)
+		default_governor = cpufreq_default_governor();
 	mutex_unlock(&cpufreq_governor_mutex);
 }
 EXPORT_SYMBOL_GPL(cpufreq_unregister_governor);
@@ -2789,7 +2796,13 @@ static int __init cpufreq_core_init(void)
 	cpufreq_global_kobject = kobject_create_and_add("cpufreq", &cpu_subsys.dev_root->kobj);
 	BUG_ON(!cpufreq_global_kobject);
 
+	mutex_lock(&cpufreq_governor_mutex);
+	if (!default_governor)
+		default_governor = cpufreq_default_governor();
+	mutex_unlock(&cpufreq_governor_mutex);
+
 	return 0;
 }
 module_param(off, int, 0444);
+module_param_string(default_governor, cpufreq_param_governor, CPUFREQ_NAME_LEN, 0444);
 core_initcall(cpufreq_core_init);
-- 
2.27.0.111.gc72c7da667-goog

