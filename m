Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 135AC3A92EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 08:41:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4bF35Nkfz3cNF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 16:41:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iaSacDYc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iaSacDYc; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4bDF5kc2z3byT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 16:40:45 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id l184so1149369pgd.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6a7/7P/WOJQ+/PmIgspG1zB1PV41tmG6f1/nfdy7CoM=;
 b=iaSacDYcEtxx/MsUryuoNYhVhvHu4/YAkds2/zlwCB5k3q0y2bYgm4bQ+SkVbx9+6M
 sL+eo2HDNGjujx3quAQKcufA7TPDTnmQ34Zm2uRuUZQ7EVEg6pRInFALPcFJDi/G4FeU
 JM+8EF3W3lK3P0olWSBysQvMYp5H1p/T1UHp4EwL9eQra+NRK3mWgqSB10pa6Xm0h6mD
 Mtavp70tvXNUNPU0w0yhJAvLA9TN2AN66SDTsI1FKMNlUs76adVIbz6RafNE+/xiteUJ
 k1R4bKmJKLpa2zg5qEmGb0RpLC2SvthSi/zripD16l53LCfCBQ4Cgu8nhWWTxoBznDjc
 MFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6a7/7P/WOJQ+/PmIgspG1zB1PV41tmG6f1/nfdy7CoM=;
 b=Pfzt8gDzXzRpYChPcyuVOqsDkk0KuvsHRxjJAfVfu8/Zn9QPTyvPdtNNA3d+7xwJuT
 l/WyFATfU9hMYSKtT0iNm2Lftaz2/xPqtN6+1rtHauvsh9vD0ZWgKOgH6LH0HOuWeDpS
 aFE3WTJTr19k3OUKgqVCPo8l07PXMf+X6DYt7d/2VVnmUnum8O6lMQv85iq9UcorKIZt
 /tvMRswoyuPApE6nSxy99I1ukuhO883yxfRwpA+7kLu7vQYDwZLcffq7fSfX6FLdXspk
 NagRNtIabRWZyUySU2tIsVwhTXLgmwT4p/aYUs/AO620RqBX70sxa8DPo2g/eNFudafO
 ioGA==
X-Gm-Message-State: AOAM530zrM/yotREqVvdFiqSLm7LXc5DHjsvfLAspaOXkOHL2zTY295X
 Vbrgqo9Psmhu/p4v+2E11jwBiw==
X-Google-Smtp-Source: ABdhPJxuBDHSvp2jU3VUgo8rb7U+TO6siVyHDNIEpnu25aTr+0eg3ip1eS8kfvE7DLdzHMxtXtjgBA==
X-Received: by 2002:aa7:949d:0:b029:2ef:d1ca:ddd3 with SMTP id
 z29-20020aa7949d0000b02902efd1caddd3mr8026579pfk.39.1623825642747; 
 Tue, 15 Jun 2021 23:40:42 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id s21sm1167876pgo.42.2021.06.15.23.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 23:40:42 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH V2 3/3] cpufreq: powerenv: Migrate to ->exit() callback
 instead of ->stop_cpu()
Date: Wed, 16 Jun 2021 12:10:28 +0530
Message-Id: <c1dac4fd3b87d16895acbef6b4894a2d2b38dc83.1623825358.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1623825358.git.viresh.kumar@linaro.org>
References: <cover.1623825358.git.viresh.kumar@linaro.org>
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

