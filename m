Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A2C92701F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 08:55:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q6HUSL4d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WF6qC1ZlFz3fRR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 16:55:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q6HUSL4d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WF6p00Cvtz3fRD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 16:54:31 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-70af5c40f8aso244645b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2024 23:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720076069; x=1720680869; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cX8buroefB8E6dbxaZ62ekQqAJPRBxFIJid/1WsNJSU=;
        b=q6HUSL4dP09YxWfvfrLgax6GwnKeccaoFY/T7HjtzU5ccxmEEVZlL95nbF6VNNzYWk
         Nqm4XnPdPiasTQK89YNFqtbpgDfMUuKBR1/u2TgNxwnJS8aNWd9/lEVOk/JP4p80F2J6
         V4hpiHIGkTBQa8CHav2DzvqgreCprs9LB7FQhbI6cfMVVY5HFDay6UgVHlTFE+r69yRB
         9aHm/UOo25kAwzOaGujPLL/3M08Q/nlB5YzXjP8yC0lOiDAf3LOZ5abm+/DZieOUpm7z
         DuzYzacXDxUYpFI8aWxUBxWveZIGfNtYzDAEOxZxhRjkrN42f9SfGiCkJju5GPt6pWqH
         DxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720076069; x=1720680869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cX8buroefB8E6dbxaZ62ekQqAJPRBxFIJid/1WsNJSU=;
        b=ksE/vw1QE/qwD/qTzDAsbHRbTgyP2XBwLPd5VWxcJocDvAlgf/y0krPCcM0yFIovcx
         yvD4b54PYfjPA/UYX9NkZHd2bxBjc/jyn10HkV9QGf3tnLKZF6GbicJc+SCkY5oiDaZB
         im+qChhJMgAvN3kij/D187yrPe0q60cOgQjJr76HdPuNYZNKRcYhHqS6DRugVy+hEwUT
         PAE10lqJuD0kFB5P+hIeD0XeX6pJHXE793PzuHaUMV6npIUL+aq/d6NaaJsroUMPHVZX
         dYashCYCir36MyoDlDgYExAdv06Cr7oo6rH6Zw0DqOVxbW+qHBjWVRtnA5z3LWN4C6xO
         1dtA==
X-Forwarded-Encrypted: i=1; AJvYcCU7Ny6e71006Ng6rfNiycLJcCEuYM/tVvihn9qXMDfSeSNB4v+08vEkLIXQSEa5bkRoFAouredyB2YNnpKbJNtjJyY8k1yN0Tb/a/NZ6Q==
X-Gm-Message-State: AOJu0YxQB/mu3VHCiXEpbURQdzsmxidRY2KFURzHscoTZt4TrWaDdI/b
	KuU7QNM5uoyF8DpBDwmfmy+oaSfQSLlAoBIx3CHBJfQWTJyoGiiSe0IJTZtI7Pc=
X-Google-Smtp-Source: AGHT+IHb/ish9+ohH5ub0e29qxY/FTfbV+gjRAhLMOTo0HY1LhCudPsfofUDHf6hNsZZN9GoTmmEZQ==
X-Received: by 2002:a05:6a00:2d0c:b0:70a:f0f1:480f with SMTP id d2e1a72fcca58-70b0092ada1mr888903b3a.3.1720076068495;
        Wed, 03 Jul 2024 23:54:28 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecf878sm11466999b3a.135.2024.07.03.23.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 23:54:27 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Huang Rui <ray.huang@amd.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/4] cpufreq: Make cpufreq_driver->exit() return void
Date: Thu,  4 Jul 2024 12:23:55 +0530
Message-Id: <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1720075640.git.viresh.kumar@linaro.org>
References: <cover.1720075640.git.viresh.kumar@linaro.org>
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org, Lizhe <sensor1010@163.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Lizhe <sensor1010@163.com>

The cpufreq core doesn't check the return type of the exit() callback
and there is not much the core can do on failures at that point. Just
drop the returned value and make it return void.

Signed-off-by: Lizhe <sensor1010@163.com>
[ Viresh: Reworked the patches to fix all missing changes together. ]
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/acpi-cpufreq.c         |  4 +---
 drivers/cpufreq/amd-pstate.c           |  7 ++-----
 drivers/cpufreq/apple-soc-cpufreq.c    |  4 +---
 drivers/cpufreq/bmips-cpufreq.c        |  4 +---
 drivers/cpufreq/cppc_cpufreq.c         |  3 +--
 drivers/cpufreq/cpufreq-dt.c           |  3 +--
 drivers/cpufreq/e_powersaver.c         |  3 +--
 drivers/cpufreq/intel_pstate.c         |  8 +++-----
 drivers/cpufreq/mediatek-cpufreq-hw.c  |  4 +---
 drivers/cpufreq/mediatek-cpufreq.c     |  4 +---
 drivers/cpufreq/omap-cpufreq.c         |  3 +--
 drivers/cpufreq/pasemi-cpufreq.c       |  6 ++----
 drivers/cpufreq/powernow-k6.c          |  5 ++---
 drivers/cpufreq/powernow-k7.c          |  3 +--
 drivers/cpufreq/powernow-k8.c          |  6 ++----
 drivers/cpufreq/powernv-cpufreq.c      |  4 +---
 drivers/cpufreq/ppc_cbe_cpufreq.c      |  3 +--
 drivers/cpufreq/qcom-cpufreq-hw.c      |  4 +---
 drivers/cpufreq/qoriq-cpufreq.c        |  4 +---
 drivers/cpufreq/scmi-cpufreq.c         |  4 +---
 drivers/cpufreq/scpi-cpufreq.c         |  4 +---
 drivers/cpufreq/sh-cpufreq.c           |  4 +---
 drivers/cpufreq/sparc-us2e-cpufreq.c   |  3 +--
 drivers/cpufreq/sparc-us3-cpufreq.c    |  3 +--
 drivers/cpufreq/speedstep-centrino.c   | 10 +++-------
 drivers/cpufreq/tegra194-cpufreq.c     |  4 +---
 drivers/cpufreq/vexpress-spc-cpufreq.c |  5 ++---
 include/linux/cpufreq.h                |  2 +-
 28 files changed, 37 insertions(+), 84 deletions(-)

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index fa2664f9f259..a8ca625a98b8 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -906,7 +906,7 @@ static int acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return result;
 }
 
-static int acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct acpi_cpufreq_data *data = policy->driver_data;
 
@@ -919,8 +919,6 @@ static int acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 	free_cpumask_var(data->freqdomain_cpus);
 	kfree(policy->freq_table);
 	kfree(data);
-
-	return 0;
 }
 
 static int acpi_cpufreq_resume(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 80eaa58f1405..c1f48a0d69b6 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -1090,7 +1090,7 @@ static int amd_pstate_cpu_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
-static int amd_pstate_cpu_exit(struct cpufreq_policy *policy)
+static void amd_pstate_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct amd_cpudata *cpudata = policy->driver_data;
 
@@ -1098,8 +1098,6 @@ static int amd_pstate_cpu_exit(struct cpufreq_policy *policy)
 	freq_qos_remove_request(&cpudata->req[0]);
 	policy->fast_switch_possible = false;
 	kfree(cpudata);
-
-	return 0;
 }
 
 static int amd_pstate_cpu_resume(struct cpufreq_policy *policy)
@@ -1542,7 +1540,7 @@ static int amd_pstate_epp_cpu_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
-static int amd_pstate_epp_cpu_exit(struct cpufreq_policy *policy)
+static void amd_pstate_epp_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct amd_cpudata *cpudata = policy->driver_data;
 
@@ -1552,7 +1550,6 @@ static int amd_pstate_epp_cpu_exit(struct cpufreq_policy *policy)
 	}
 
 	pr_debug("CPU %d exiting\n", policy->cpu);
-	return 0;
 }
 
 static void amd_pstate_epp_update_limit(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 021f423705e1..af34c22fa273 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -305,7 +305,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
-static int apple_soc_cpufreq_exit(struct cpufreq_policy *policy)
+static void apple_soc_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	struct apple_cpu_priv *priv = policy->driver_data;
 
@@ -313,8 +313,6 @@ static int apple_soc_cpufreq_exit(struct cpufreq_policy *policy)
 	dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
 	iounmap(priv->reg_base);
 	kfree(priv);
-
-	return 0;
 }
 
 static struct cpufreq_driver apple_soc_cpufreq_driver = {
diff --git a/drivers/cpufreq/bmips-cpufreq.c b/drivers/cpufreq/bmips-cpufreq.c
index 39221a9a187a..17a4c174553d 100644
--- a/drivers/cpufreq/bmips-cpufreq.c
+++ b/drivers/cpufreq/bmips-cpufreq.c
@@ -121,11 +121,9 @@ static int bmips_cpufreq_target_index(struct cpufreq_policy *policy,
 	return 0;
 }
 
-static int bmips_cpufreq_exit(struct cpufreq_policy *policy)
+static void bmips_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	kfree(policy->freq_table);
-
-	return 0;
 }
 
 static int bmips_cpufreq_init(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 15f1d41920a3..17aeb3785446 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -688,7 +688,7 @@ static int cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
-static int cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct cppc_cpudata *cpu_data = policy->driver_data;
 	struct cppc_perf_caps *caps = &cpu_data->perf_caps;
@@ -705,7 +705,6 @@ static int cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 			 caps->lowest_perf, cpu, ret);
 
 	cppc_cpufreq_put_cpu_data(policy);
-	return 0;
 }
 
 static inline u64 get_delta(u64 t1, u64 t0)
diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
index 907e22632fda..6532c4d71338 100644
--- a/drivers/cpufreq/cpufreq-dt.c
+++ b/drivers/cpufreq/cpufreq-dt.c
@@ -157,10 +157,9 @@ static int cpufreq_offline(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int cpufreq_exit(struct cpufreq_policy *policy)
+static void cpufreq_exit(struct cpufreq_policy *policy)
 {
 	clk_put(policy->clk);
-	return 0;
 }
 
 static struct cpufreq_driver dt_cpufreq_driver = {
diff --git a/drivers/cpufreq/e_powersaver.c b/drivers/cpufreq/e_powersaver.c
index ab93bce8ae77..6e958b09e1b5 100644
--- a/drivers/cpufreq/e_powersaver.c
+++ b/drivers/cpufreq/e_powersaver.c
@@ -360,14 +360,13 @@ static int eps_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int eps_cpu_exit(struct cpufreq_policy *policy)
+static void eps_cpu_exit(struct cpufreq_policy *policy)
 {
 	unsigned int cpu = policy->cpu;
 
 	/* Bye */
 	kfree(eps_cpu[cpu]);
 	eps_cpu[cpu] = NULL;
-	return 0;
 }
 
 static struct cpufreq_driver eps_driver = {
diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 25389e43c392..392a8000b238 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -2715,13 +2715,11 @@ static int intel_pstate_cpu_offline(struct cpufreq_policy *policy)
 	return intel_cpufreq_cpu_offline(policy);
 }
 
-static int intel_pstate_cpu_exit(struct cpufreq_policy *policy)
+static void intel_pstate_cpu_exit(struct cpufreq_policy *policy)
 {
 	pr_debug("CPU %d exiting\n", policy->cpu);
 
 	policy->fast_switch_possible = false;
-
-	return 0;
 }
 
 static int __intel_pstate_cpu_init(struct cpufreq_policy *policy)
@@ -3052,7 +3050,7 @@ static int intel_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
-static int intel_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void intel_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct freq_qos_request *req;
 
@@ -3062,7 +3060,7 @@ static int intel_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 	freq_qos_remove_request(req);
 	kfree(req);
 
-	return intel_pstate_cpu_exit(policy);
+	intel_pstate_cpu_exit(policy);
 }
 
 static int intel_cpufreq_suspend(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 8d097dcddda4..8925e096d5b9 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -260,7 +260,7 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
+static void mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct mtk_cpufreq_data *data = policy->driver_data;
 	struct resource *res = data->res;
@@ -270,8 +270,6 @@ static int mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 	writel_relaxed(0x0, data->reg_bases[REG_FREQ_ENABLE]);
 	iounmap(base);
 	release_mem_region(res->start, resource_size(res));
-
-	return 0;
 }
 
 static void mtk_cpufreq_register_em(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 518606adf14e..102cfaa3b7e5 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -599,13 +599,11 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int mtk_cpufreq_exit(struct cpufreq_policy *policy)
+static void mtk_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	struct mtk_cpu_dvfs_info *info = policy->driver_data;
 
 	dev_pm_opp_free_cpufreq_table(info->cpu_dev, &policy->freq_table);
-
-	return 0;
 }
 
 static struct cpufreq_driver mtk_cpufreq_driver = {
diff --git a/drivers/cpufreq/omap-cpufreq.c b/drivers/cpufreq/omap-cpufreq.c
index 895690856665..3458d5cc9b7f 100644
--- a/drivers/cpufreq/omap-cpufreq.c
+++ b/drivers/cpufreq/omap-cpufreq.c
@@ -135,11 +135,10 @@ static int omap_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int omap_cpu_exit(struct cpufreq_policy *policy)
+static void omap_cpu_exit(struct cpufreq_policy *policy)
 {
 	freq_table_free();
 	clk_put(policy->clk);
-	return 0;
 }
 
 static struct cpufreq_driver omap_driver = {
diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
index 039a66bbe1be..ee925b53b6b9 100644
--- a/drivers/cpufreq/pasemi-cpufreq.c
+++ b/drivers/cpufreq/pasemi-cpufreq.c
@@ -204,21 +204,19 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return err;
 }
 
-static int pas_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void pas_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	/*
 	 * We don't support CPU hotplug. Don't unmap after the system
 	 * has already made it to a running state.
 	 */
 	if (system_state >= SYSTEM_RUNNING)
-		return 0;
+		return;
 
 	if (sdcasr_mapbase)
 		iounmap(sdcasr_mapbase);
 	if (sdcpwr_mapbase)
 		iounmap(sdcpwr_mapbase);
-
-	return 0;
 }
 
 static int pas_cpufreq_target(struct cpufreq_policy *policy,
diff --git a/drivers/cpufreq/powernow-k6.c b/drivers/cpufreq/powernow-k6.c
index 41eefef95d87..f0a4a6c31204 100644
--- a/drivers/cpufreq/powernow-k6.c
+++ b/drivers/cpufreq/powernow-k6.c
@@ -219,7 +219,7 @@ static int powernow_k6_cpu_init(struct cpufreq_policy *policy)
 }
 
 
-static int powernow_k6_cpu_exit(struct cpufreq_policy *policy)
+static void powernow_k6_cpu_exit(struct cpufreq_policy *policy)
 {
 	unsigned int i;
 
@@ -234,10 +234,9 @@ static int powernow_k6_cpu_exit(struct cpufreq_policy *policy)
 			cpufreq_freq_transition_begin(policy, &freqs);
 			powernow_k6_target(policy, i);
 			cpufreq_freq_transition_end(policy, &freqs, 0);
-			break;
+			return;
 		}
 	}
-	return 0;
 }
 
 static unsigned int powernow_k6_get(unsigned int cpu)
diff --git a/drivers/cpufreq/powernow-k7.c b/drivers/cpufreq/powernow-k7.c
index 5d515fc34836..4271446c8725 100644
--- a/drivers/cpufreq/powernow-k7.c
+++ b/drivers/cpufreq/powernow-k7.c
@@ -644,7 +644,7 @@ static int powernow_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int powernow_cpu_exit(struct cpufreq_policy *policy)
+static void powernow_cpu_exit(struct cpufreq_policy *policy)
 {
 #ifdef CONFIG_X86_POWERNOW_K7_ACPI
 	if (acpi_processor_perf) {
@@ -655,7 +655,6 @@ static int powernow_cpu_exit(struct cpufreq_policy *policy)
 #endif
 
 	kfree(powernow_table);
-	return 0;
 }
 
 static struct cpufreq_driver powernow_driver = {
diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index b10f7a1b77f1..a01170f7d01c 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -1089,13 +1089,13 @@ static int powernowk8_cpu_init(struct cpufreq_policy *pol)
 	return -ENODEV;
 }
 
-static int powernowk8_cpu_exit(struct cpufreq_policy *pol)
+static void powernowk8_cpu_exit(struct cpufreq_policy *pol)
 {
 	struct powernow_k8_data *data = per_cpu(powernow_data, pol->cpu);
 	int cpu;
 
 	if (!data)
-		return -EINVAL;
+		return;
 
 	powernow_k8_cpu_exit_acpi(data);
 
@@ -1104,8 +1104,6 @@ static int powernowk8_cpu_exit(struct cpufreq_policy *pol)
 	/* pol->cpus will be empty here, use related_cpus instead. */
 	for_each_cpu(cpu, pol->related_cpus)
 		per_cpu(powernow_data, cpu) = NULL;
-
-	return 0;
 }
 
 static void query_values_on_cpu(void *_err)
diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index fddbd1ea1635..50c62929f7ca 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -874,7 +874,7 @@ static int powernv_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int powernv_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void powernv_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct powernv_smp_call_data freq_data;
 	struct global_pstate_info *gpstates = policy->driver_data;
@@ -886,8 +886,6 @@ static int powernv_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 		del_timer_sync(&gpstates->timer);
 
 	kfree(policy->driver_data);
-
-	return 0;
 }
 
 static int powernv_cpufreq_reboot_notifier(struct notifier_block *nb,
diff --git a/drivers/cpufreq/ppc_cbe_cpufreq.c b/drivers/cpufreq/ppc_cbe_cpufreq.c
index 88afc49941b7..5ee4c7bfdcc5 100644
--- a/drivers/cpufreq/ppc_cbe_cpufreq.c
+++ b/drivers/cpufreq/ppc_cbe_cpufreq.c
@@ -113,10 +113,9 @@ static int cbe_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int cbe_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void cbe_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	cbe_cpufreq_pmi_policy_exit(policy);
-	return 0;
 }
 
 static int cbe_cpufreq_target(struct cpufreq_policy *policy,
diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index ec8df5496a0c..370fe6a0104b 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -573,7 +573,7 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	return qcom_cpufreq_hw_lmh_init(policy, index);
 }
 
-static int qcom_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
+static void qcom_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct device *cpu_dev = get_cpu_device(policy->cpu);
 	struct qcom_cpufreq_data *data = policy->driver_data;
@@ -583,8 +583,6 @@ static int qcom_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 	qcom_cpufreq_hw_lmh_exit(data);
 	kfree(policy->freq_table);
 	kfree(data);
-
-	return 0;
 }
 
 static void qcom_cpufreq_ready(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/qoriq-cpufreq.c b/drivers/cpufreq/qoriq-cpufreq.c
index 0aecaecbb0e6..3519bf34d397 100644
--- a/drivers/cpufreq/qoriq-cpufreq.c
+++ b/drivers/cpufreq/qoriq-cpufreq.c
@@ -225,7 +225,7 @@ static int qoriq_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return -ENODEV;
 }
 
-static int qoriq_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void qoriq_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct cpu_data *data = policy->driver_data;
 
@@ -233,8 +233,6 @@ static int qoriq_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 	kfree(data->table);
 	kfree(data);
 	policy->driver_data = NULL;
-
-	return 0;
 }
 
 static int qoriq_cpufreq_target(struct cpufreq_policy *policy,
diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 3b4f6bfb2f4c..bf5f17f0dfb1 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -308,7 +308,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
-static int scmi_cpufreq_exit(struct cpufreq_policy *policy)
+static void scmi_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	struct scmi_data *priv = policy->driver_data;
 
@@ -316,8 +316,6 @@ static int scmi_cpufreq_exit(struct cpufreq_policy *policy)
 	dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
 	free_cpumask_var(priv->opp_shared_cpus);
 	kfree(priv);
-
-	return 0;
 }
 
 static void scmi_cpufreq_register_em(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
index d33be56983ed..8d73e6e8be2a 100644
--- a/drivers/cpufreq/scpi-cpufreq.c
+++ b/drivers/cpufreq/scpi-cpufreq.c
@@ -167,7 +167,7 @@ static int scpi_cpufreq_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
-static int scpi_cpufreq_exit(struct cpufreq_policy *policy)
+static void scpi_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	struct scpi_data *priv = policy->driver_data;
 
@@ -175,8 +175,6 @@ static int scpi_cpufreq_exit(struct cpufreq_policy *policy)
 	dev_pm_opp_free_cpufreq_table(priv->cpu_dev, &policy->freq_table);
 	dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
 	kfree(priv);
-
-	return 0;
 }
 
 static struct cpufreq_driver scpi_cpufreq_driver = {
diff --git a/drivers/cpufreq/sh-cpufreq.c b/drivers/cpufreq/sh-cpufreq.c
index b8704232c27b..aa74036d0420 100644
--- a/drivers/cpufreq/sh-cpufreq.c
+++ b/drivers/cpufreq/sh-cpufreq.c
@@ -135,14 +135,12 @@ static int sh_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int sh_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void sh_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	unsigned int cpu = policy->cpu;
 	struct clk *cpuclk = &per_cpu(sh_cpuclk, cpu);
 
 	clk_put(cpuclk);
-
-	return 0;
 }
 
 static struct cpufreq_driver sh_cpufreq_driver = {
diff --git a/drivers/cpufreq/sparc-us2e-cpufreq.c b/drivers/cpufreq/sparc-us2e-cpufreq.c
index 2783d3d55fce..8a0cd5312a59 100644
--- a/drivers/cpufreq/sparc-us2e-cpufreq.c
+++ b/drivers/cpufreq/sparc-us2e-cpufreq.c
@@ -296,10 +296,9 @@ static int us2e_freq_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int us2e_freq_cpu_exit(struct cpufreq_policy *policy)
+static void us2e_freq_cpu_exit(struct cpufreq_policy *policy)
 {
 	us2e_freq_target(policy, 0);
-	return 0;
 }
 
 static struct cpufreq_driver cpufreq_us2e_driver = {
diff --git a/drivers/cpufreq/sparc-us3-cpufreq.c b/drivers/cpufreq/sparc-us3-cpufreq.c
index 6c3657679a88..b50f9d13e6d2 100644
--- a/drivers/cpufreq/sparc-us3-cpufreq.c
+++ b/drivers/cpufreq/sparc-us3-cpufreq.c
@@ -140,10 +140,9 @@ static int us3_freq_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int us3_freq_cpu_exit(struct cpufreq_policy *policy)
+static void us3_freq_cpu_exit(struct cpufreq_policy *policy)
 {
 	us3_freq_target(policy, 0);
-	return 0;
 }
 
 static struct cpufreq_driver cpufreq_us3_driver = {
diff --git a/drivers/cpufreq/speedstep-centrino.c b/drivers/cpufreq/speedstep-centrino.c
index ddd6f53bfd2a..3fafedb983b5 100644
--- a/drivers/cpufreq/speedstep-centrino.c
+++ b/drivers/cpufreq/speedstep-centrino.c
@@ -400,16 +400,12 @@ static int centrino_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int centrino_cpu_exit(struct cpufreq_policy *policy)
+static void centrino_cpu_exit(struct cpufreq_policy *policy)
 {
 	unsigned int cpu = policy->cpu;
 
-	if (!per_cpu(centrino_model, cpu))
-		return -ENODEV;
-
-	per_cpu(centrino_model, cpu) = NULL;
-
-	return 0;
+	if (per_cpu(centrino_model, cpu))
+		per_cpu(centrino_model, cpu) = NULL;
 }
 
 /**
diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
index 59865ea455a8..07ea7ed61b68 100644
--- a/drivers/cpufreq/tegra194-cpufreq.c
+++ b/drivers/cpufreq/tegra194-cpufreq.c
@@ -551,14 +551,12 @@ static int tegra194_cpufreq_offline(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int tegra194_cpufreq_exit(struct cpufreq_policy *policy)
+static void tegra194_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	struct device *cpu_dev = get_cpu_device(policy->cpu);
 
 	dev_pm_opp_remove_all_dynamic(cpu_dev);
 	dev_pm_opp_of_cpumask_remove_table(policy->related_cpus);
-
-	return 0;
 }
 
 static int tegra194_cpufreq_set_target(struct cpufreq_policy *policy,
diff --git a/drivers/cpufreq/vexpress-spc-cpufreq.c b/drivers/cpufreq/vexpress-spc-cpufreq.c
index 9ac4ea50b874..3fadf536c429 100644
--- a/drivers/cpufreq/vexpress-spc-cpufreq.c
+++ b/drivers/cpufreq/vexpress-spc-cpufreq.c
@@ -447,7 +447,7 @@ static int ve_spc_cpufreq_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int ve_spc_cpufreq_exit(struct cpufreq_policy *policy)
+static void ve_spc_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	struct device *cpu_dev;
 
@@ -455,11 +455,10 @@ static int ve_spc_cpufreq_exit(struct cpufreq_policy *policy)
 	if (!cpu_dev) {
 		pr_err("%s: failed to get cpu%d device\n", __func__,
 		       policy->cpu);
-		return -ENODEV;
+		return;
 	}
 
 	put_cluster_clk_and_freq_table(cpu_dev, policy->related_cpus);
-	return 0;
 }
 
 static struct cpufreq_driver ve_spc_cpufreq_driver = {
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 6f57de7de433..d4d2f4d1d7cb 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -396,7 +396,7 @@ struct cpufreq_driver {
 
 	int		(*online)(struct cpufreq_policy *policy);
 	int		(*offline)(struct cpufreq_policy *policy);
-	int		(*exit)(struct cpufreq_policy *policy);
+	void		(*exit)(struct cpufreq_policy *policy);
 	int		(*suspend)(struct cpufreq_policy *policy);
 	int		(*resume)(struct cpufreq_policy *policy);
 
-- 
2.31.1.272.g89b43f80a514

