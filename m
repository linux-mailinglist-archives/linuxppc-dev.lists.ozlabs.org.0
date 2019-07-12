Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBB8664A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 04:50:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lHTn05nwzDqkw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 12:50:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=zte.com.cn
 (client-ip=202.103.147.169; helo=mxct.zte.com.cn;
 envelope-from=wen.yang99@zte.com.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zte.com.cn
Received: from mxct.zte.com.cn (mx7.zte.com.cn [202.103.147.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lHPt3z0zzDqmR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 12:46:55 +1000 (AEST)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id 02851B7E4E108A4CE88C;
 Fri, 12 Jul 2019 10:46:50 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id x6C2kBEq014401;
 Fri, 12 Jul 2019 10:46:11 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019071210464634-2302204 ;
 Fri, 12 Jul 2019 10:46:46 +0800 
From: Wen Yang <wen.yang99@zte.com.cn>
To: rjw@rjwysocki.net
Subject: [PATCH v6] cpufreq/pasemi: fix an use-after-free in
 pas_cpufreq_cpu_init()
Date: Fri, 12 Jul 2019 10:44:21 +0800
Message-Id: <1562899461-24045-1-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-07-12 10:46:46,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-07-12 10:46:17, Serialize complete at 2019-07-12 10:46:17
X-MAIL: mse-fl1.zte.com.cn x6C2kBEq014401
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
Cc: wang.yi59@zte.com.cn, linux-pm@vger.kernel.org, viresh.kumar@linaro.org,
 linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn, cheng.shengyu@zte.com.cn,
 linuxppc-dev@lists.ozlabs.org, Wen Yang <wen.yang99@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The cpu variable is still being used in the of_get_property() call
after the of_node_put() call, which may result in use-after-free.

Fixes: a9acc26b75f6 ("cpufreq/pasemi: fix possible object reference leak")
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
v6: keep the blank line and fix warning: label 'out_unmap_sdcpwr' defined but not used.
v5: put together the code to get, use, and release cpu device_node.
v4: restore the blank line.
v3: fix a leaked reference.
v2: clean up the code according to the advice of viresh.

 drivers/cpufreq/pasemi-cpufreq.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
index 6b1e4ab..7d557f9 100644
--- a/drivers/cpufreq/pasemi-cpufreq.c
+++ b/drivers/cpufreq/pasemi-cpufreq.c
@@ -131,10 +131,18 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
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
@@ -171,16 +179,6 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
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
 
@@ -196,7 +194,11 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	policy->cur = pas_freqs[cur_astate].frequency;
 	ppc_proc_freq = policy->cur * 1000ul;
 
-	return cpufreq_generic_init(policy, pas_freqs, get_gizmo_latency());
+	err = cpufreq_generic_init(policy, pas_freqs, get_gizmo_latency());
+	if (err)
+		goto out_unmap_sdcpwr;
+
+	return 0;
 
 out_unmap_sdcpwr:
 	iounmap(sdcpwr_mapbase);
-- 
2.9.5

