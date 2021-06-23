Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E653B139B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 08:01:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8t2D503sz30GS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 16:01:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xiOA5cyT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xiOA5cyT; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8t1k1RKxz2yWt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 16:01:27 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id k5so891402pjj.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 23:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vmGY3Ot51goPk1p3Lpw0VjAdttnKcLZKJGX8mraQh2o=;
 b=xiOA5cyTFfc7S50F/mYLiqzVw1IFhFzB9y/ImgSmau0rWxS23AkEhsBHcXg75Y1iF9
 MVVrrKTQ89JaDL72+ucoBqraZHPUx5IR4o2U3oob+lry76W5SVF4GmHCN7T3OABWCk0S
 X3ZWZTkbpww41Hw/mIoSM6Ouyx7r2WJN6e1H3ToMQnfX8bS2/VtW4zN8S4uREHvB7Tdt
 o/uLYdYmbP6xWREgQMFHwiaCV9UkQ1o+zCphSE1EDYg87osTGIeC8HnvOt/6JVaopqoa
 oT6OVjWnvK+CDAuYQKY9bYPt5XMvMPc/MWYke0ZfX4kuMa2Uy2bAv9EFBfxNAvAC9CEM
 k7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vmGY3Ot51goPk1p3Lpw0VjAdttnKcLZKJGX8mraQh2o=;
 b=R9JgWbw9eLnOBnVh2BtuAGecDvxK5bzhLh34nlycPogq4o1USPdTMSDnJAdJ+t3aqI
 jLaDpBjIwkdlUDgCByqo3n+TkFHEMHdoCA1AfMmes1dVR8jhyC5LhyIFeXQrq80EGTqC
 h8m7BP+emQa1zgEPPpgDYS/F1CqWisWRMrgpdVfEOWT5KYkhQyPKx1boQ33w4PrPOHqg
 BEp937GjX+Quoy+vG76MEY7x8QRjTh+k39cNLeK6dZPiWalIdYptJSfhxjy/1JWggTdp
 u11tw4p09QIxQo1h644MjhASpb65t1bA+K9xCCz/ruVhgjim31+Wmz5txW86u7FDAPmE
 HbIA==
X-Gm-Message-State: AOAM5337JqVk85Z34RQL1F4w8cUcCxIOY1NHqK2/YRWOHOYXj/0Od9ye
 zKKwvg40ixJ2BpypZAsaLCW37w==
X-Google-Smtp-Source: ABdhPJxeBynqwKKP16OmZpNnD+A9eWn+KrhkrpOGpTQHylT5BodUDPx/u0F7M/kanbMSEImpWZmaEA==
X-Received: by 2002:a17:90a:fa83:: with SMTP id
 cu3mr7985858pjb.164.1624428084712; 
 Tue, 22 Jun 2021 23:01:24 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id x20sm1122301pfh.112.2021.06.22.23.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 23:01:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH V4.1 3/4] cpufreq: powernv: Migrate to ->exit() callback
 instead of ->stop_cpu()
Date: Wed, 23 Jun 2021 11:31:14 +0530
Message-Id: <fec6e49c9b9b43080525c9eaddcc0e7e0fd4050f.1624428000.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <e40e57a97735614941e9ca7fa2f221f8db9a12b2.1624421816.git.viresh.kumar@linaro.org>
References: <e40e57a97735614941e9ca7fa2f221f8db9a12b2.1624421816.git.viresh.kumar@linaro.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 367dc4aa932b ("cpufreq: Add stop CPU callback to cpufreq_driver
interface") added the stop_cpu() callback to allow the drivers to do
clean up before the CPU is completely down and its state can't be
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
V4->V4.1:
- s/powerenv/powernv/

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

