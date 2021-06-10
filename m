Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 978843A26E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 10:25:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0xqQ0rH7z3c31
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 18:25:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z4oi+Qts;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=z4oi+Qts; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0xpY1sftz3097
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 18:24:20 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id h12so593985plf.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 01:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9brGsoPBB+d+RHY31m7cZqh3sPnjdxBD51bqiyGsmoM=;
 b=z4oi+QtsZIOkUCFtJ2RSljkQbvtIlKWhvmfPM3nkaTcx/SmP2SwZ/OG+gHmMtcJIVI
 Jz+fY/OSo8O9+ELcqVoo7u7WxCuKuZVq4HIvbp2fEaka2FusUdVtB2CaOnVDFdakQq1s
 WgD8eKYVt4xY7SKlklJT0+vTQaaOeIygjrFnC3E8n2TxgASfZSLqW6emrP4ePhogpd3p
 LCP0wfYPCSPY2fDENITlznVP5uwLlXyfFtXxpZyog9xudcUFU5hLh2OauKt2jpqkE710
 p8BQ3NdkFzKdUP8qDnJ5S4CR/6RqEXkcXwAaVGtyWxW6VDOUnL24T7ElbtkSHdIK+Xas
 nWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9brGsoPBB+d+RHY31m7cZqh3sPnjdxBD51bqiyGsmoM=;
 b=SL0alYFlNGEHkVvg/MZylwvVS89ADCtfpqCCKzKL3DEf2ZddGlJ3w69OHkyUdFoULL
 u1NTa6+kzq7A1dtqw2QmjRL+bGIveAR1s3XRT0LNoTSCeOyZIuQfi3eCh6ZQ5lAnCuAm
 bo/AGJSb0I27A2LHDy5slZ+nzJs2YUIzOTk+G/GrDkQk2DirVU/fTbzqsuWIYLTbSb56
 QlFA49LyZGGEP66xaaUdgxjP59md6SjISjx0QY+6UNGsGYRCiMPyupxEZFZxm41fQTq0
 ShN0/USt2idjuMFPL0ZdGxl+nek+01eofZgFkE9NK0YbVu6JP91nMswjja1t8YnQBtvW
 NeAg==
X-Gm-Message-State: AOAM530wFYwCWuRkjMVS5wvKnsdmX3tjEO4sn6nMJaBnfSl2i6ZMTRQv
 4v6QibqvCXfFy5gaUBtiSh6niw==
X-Google-Smtp-Source: ABdhPJyL6nxvcvsq34evJFOy65fc9gysLq/3WyEfD7vvQ+tDWp1jEmZFdtmAB1e5fkCXviRh9tP+3g==
X-Received: by 2002:a17:90a:1141:: with SMTP id
 d1mr2224862pje.56.1623313457758; 
 Thu, 10 Jun 2021 01:24:17 -0700 (PDT)
Received: from localhost ([136.185.169.128])
 by smtp.gmail.com with ESMTPSA id q13sm1741649pff.13.2021.06.10.01.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 01:24:17 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>, Qian Cai <quic_qiancai@quicinc.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH 3/5] cpufreq: powerenv: Migrate to ->exit() callback instead
 of ->stop_cpu()
Date: Thu, 10 Jun 2021 13:53:59 +0530
Message-Id: <0990172cba066ec7747e479f8f0a2069ae368339.1623313323.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1623313323.git.viresh.kumar@linaro.org>
References: <cover.1623313323.git.viresh.kumar@linaro.org>
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
Cc: Ionela Voinescu <ionela.voinescu@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 367dc4aa932b ("cpufreq: Add stop CPU callback to cpufreq_driver
interface") added the stop_cpu() callback to allow the drivers to do
clean up before the CPU is completely down and its state cannot be
modified.

At that time the CPU hotplug framework used to call the cpufreq core's
registered notifier for different events like CPU_DOWN_PREPARE and
CPU_POST_DEAD. The stop_cpu() callback was called during the
CPU_DOWN_PREPARE event.

This is no longer the case, cpuhp_cpufreq_offline() is called only once
by the CPU hotplug core now and we don't really need two separate
callbacks for cpufreq drivers, i.e. stop_cpu() and exit(), as everything
can be done from the exit() callback itself.

Migrate to using the exit() callback instead of stop_cpu().

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/powernv-cpufreq.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index e439b43c19eb..005600cef273 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -875,7 +875,15 @@ static int powernv_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
 static int powernv_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
-	/* timer is deleted in cpufreq_cpu_stop() */
+	struct powernv_smp_call_data freq_data;
+	struct global_pstate_info *gpstates = policy->driver_data;
+
+	freq_data.pstate_id = idx_to_pstate(powernv_pstate_info.min);
+	freq_data.gpstate_id = idx_to_pstate(powernv_pstate_info.min);
+	smp_call_function_single(policy->cpu, set_pstate, &freq_data, 1);
+	if (gpstates)
+		del_timer_sync(&gpstates->timer);
+
 	kfree(policy->driver_data);
 
 	return 0;
@@ -1007,18 +1015,6 @@ static struct notifier_block powernv_cpufreq_opal_nb = {
 	.priority	= 0,
 };
 
-static void powernv_cpufreq_stop_cpu(struct cpufreq_policy *policy)
-{
-	struct powernv_smp_call_data freq_data;
-	struct global_pstate_info *gpstates = policy->driver_data;
-
-	freq_data.pstate_id = idx_to_pstate(powernv_pstate_info.min);
-	freq_data.gpstate_id = idx_to_pstate(powernv_pstate_info.min);
-	smp_call_function_single(policy->cpu, set_pstate, &freq_data, 1);
-	if (gpstates)
-		del_timer_sync(&gpstates->timer);
-}
-
 static unsigned int powernv_fast_switch(struct cpufreq_policy *policy,
 					unsigned int target_freq)
 {
@@ -1042,7 +1038,6 @@ static struct cpufreq_driver powernv_cpufreq_driver = {
 	.target_index	= powernv_cpufreq_target_index,
 	.fast_switch	= powernv_fast_switch,
 	.get		= powernv_cpufreq_get,
-	.stop_cpu	= powernv_cpufreq_stop_cpu,
 	.attr		= powernv_cpu_freq_attr,
 };
 
-- 
2.31.1.272.g89b43f80a514

