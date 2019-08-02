Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4797FBAA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 16:01:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460TMv4QD2zDr99
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2019 00:00:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZCwZYVLx"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460SZD0Z9TzDq6y
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 23:24:52 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE4C3217D4;
 Fri,  2 Aug 2019 13:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564752289;
 bh=cuzsLpdJnu8xilvueIg4SUhy4s/85cu7P1L/irrvDH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZCwZYVLxdH0CVteS/PxLHsYNu3R3xGMPPVfxrwFRkX6ryqZdOvlNlYo/X89aaBCTO
 cs0nYx5z9ffEo6WaWeDZj0tpLPqGd2ZtLRDoT2fnivoF8X/BKc/oSAwREwhKudN1kQ
 Fo4Bg48Z9C/XTKzKzsAw9yTGr/xxU6RzLaS2PfSM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 13/30] cpufreq/pasemi: fix use-after-free in
 pas_cpufreq_cpu_init()
Date: Fri,  2 Aug 2019 09:24:05 -0400
Message-Id: <20190802132422.13963-13-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802132422.13963-1-sashal@kernel.org>
References: <20190802132422.13963-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-pm@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Wen Yang <wen.yang99@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Wen Yang <wen.yang99@zte.com.cn>

[ Upstream commit e0a12445d1cb186d875410d093a00d215bec6a89 ]

The cpu variable is still being used in the of_get_property() call
after the of_node_put() call, which may result in use-after-free.

Fixes: a9acc26b75f6 ("cpufreq/pasemi: fix possible object reference leak")
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/cpufreq/pasemi-cpufreq.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
index 8456492124f0c..d1bdd8f622476 100644
--- a/drivers/cpufreq/pasemi-cpufreq.c
+++ b/drivers/cpufreq/pasemi-cpufreq.c
@@ -145,10 +145,18 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	int err = -ENODEV;
 
 	cpu = of_get_cpu_node(policy->cpu, NULL);
+	if (!cpu)
+		goto out;
 
+	max_freqp = of_get_property(cpu, "clock-frequency", NULL);
 	of_node_put(cpu);
-	if (!cpu)
+	if (!max_freqp) {
+		err = -EINVAL;
 		goto out;
+	}
+
+	/* we need the freq in kHz */
+	max_freq = *max_freqp / 1000;
 
 	dn = of_find_compatible_node(NULL, NULL, "1682m-sdc");
 	if (!dn)
@@ -185,16 +193,6 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	}
 
 	pr_debug("init cpufreq on CPU %d\n", policy->cpu);
-
-	max_freqp = of_get_property(cpu, "clock-frequency", NULL);
-	if (!max_freqp) {
-		err = -EINVAL;
-		goto out_unmap_sdcpwr;
-	}
-
-	/* we need the freq in kHz */
-	max_freq = *max_freqp / 1000;
-
 	pr_debug("max clock-frequency is at %u kHz\n", max_freq);
 	pr_debug("initializing frequency table\n");
 
@@ -212,9 +210,6 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
 	return cpufreq_generic_init(policy, pas_freqs, get_gizmo_latency());
 
-out_unmap_sdcpwr:
-	iounmap(sdcpwr_mapbase);
-
 out_unmap_sdcasr:
 	iounmap(sdcasr_mapbase);
 out:
-- 
2.20.1

