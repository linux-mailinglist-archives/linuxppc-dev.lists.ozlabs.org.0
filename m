Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4AE6A600
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 11:57:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nwmV5BsxzDqRM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 19:57:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=viresh.kumar@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="P7pXuZW1"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nwkJ756czDq9W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 19:55:17 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id m9so9794621pls.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 02:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SWb56XEnAkwuUUTQuv4g9CftmyTnuWFI0OcyOh8bV4E=;
 b=P7pXuZW1lJ8u1aom5nEmPqGoSfpfcmLJUxPBNeM2o020xDjJZewv9KksFoB5SSIQVi
 QIBeycHlDSjUHhcf4/+gxvCfMbAAfvKV9unZPA3EHVyJH+Sb0UOZieH4z/zj+GuLl6TX
 IR20OZ6VkiyhUKOFhO4M65yEN3xmPEySfEpi7QIO+Y6OWH44PnWjq9iDQxSA+0l53k5I
 bho1MEAFwdg9BzUeHBuD5/bt2B9vKl15Jb41phYGVYEZxtClXjm82f9oAe/tTA7Pmcu6
 8V13Iblir4uOpr7EzJTuZQL47KZXU19UiWMGXW79C38DHYcjHqmnP5PLPm6zAkJVhAHG
 TlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SWb56XEnAkwuUUTQuv4g9CftmyTnuWFI0OcyOh8bV4E=;
 b=IMkAkQF1GbVf+d0JdqEyMgjaCxrdvgYE2lJUNIikVmTIcIO8ehMeED2P5T57hKJ5b8
 dnO3hlKg/lBJIh2vN25F3BudgKgoAri5wrWMSAZa8xqB8sZJWQWmUsNHliXReqOHD2w6
 B4mFeRz8qBfFueC8vg1nyKTYPbtEBapaWR2CnptihsN4I77TzcEdIHwwV6E1iNtWtFPz
 ySXKZ61nWPmvsqEhtr86NFpkoqck0UXuqg7xjlutQ1WnqaaIxScrtztj9p/XvvNka9lr
 EU9TdZytjskC8gEHvp+iSoiK/m9B00Kvz5okUwxzHt7FUX/H8EBTf0LvC2DmkEMmbegp
 Nzuw==
X-Gm-Message-State: APjAAAUvv4rm3lPzRRnoRq0S0oubQxu5sDjS7yRel+tSYR6ViIE6SS0Z
 5y2A266Gqz+NzCxISgf9nDq0lw==
X-Google-Smtp-Source: APXvYqzxPE3AzSxZ4IozOeqfd8LPY3NZQhWn3t12CQyYfpNowAWHzPxfV0t1jEM6kojYvN9a82a2Wg==
X-Received: by 2002:a17:902:e282:: with SMTP id
 cf2mr34506552plb.301.1563270914414; 
 Tue, 16 Jul 2019 02:55:14 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id a5sm18383524pjv.21.2019.07.16.02.55.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 02:55:13 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 06/10] powerpc: macintosh: Switch to QoS requests instead of
 cpufreq notifier
Date: Tue, 16 Jul 2019 15:24:50 +0530
Message-Id: <c9c6dc91bb2315b30adb8d98264b6a5c4935ee52.1563270828.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1563270828.git.viresh.kumar@linaro.org>
References: <cover.1563270828.git.viresh.kumar@linaro.org>
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The cpufreq core now takes the min/max frequency constraints via QoS
requests and the CPUFREQ_ADJUST notifier shall get removed later on.

Switch over to using the QoS request for maximum frequency constraint
for windfarm_cpufreq_clamp driver.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/macintosh/windfarm_cpufreq_clamp.c | 77 ++++++++++++++--------
 1 file changed, 50 insertions(+), 27 deletions(-)

diff --git a/drivers/macintosh/windfarm_cpufreq_clamp.c b/drivers/macintosh/windfarm_cpufreq_clamp.c
index 52fd5fca89a0..705c6200814b 100644
--- a/drivers/macintosh/windfarm_cpufreq_clamp.c
+++ b/drivers/macintosh/windfarm_cpufreq_clamp.c
@@ -3,9 +3,11 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
+#include <linux/pm_qos.h>
 #include <linux/slab.h>
 #include <linux/init.h>
 #include <linux/wait.h>
+#include <linux/cpu.h>
 #include <linux/cpufreq.h>
 
 #include <asm/prom.h>
@@ -16,36 +18,24 @@
 
 static int clamped;
 static struct wf_control *clamp_control;
-
-static int clamp_notifier_call(struct notifier_block *self,
-			       unsigned long event, void *data)
-{
-	struct cpufreq_policy *p = data;
-	unsigned long max_freq;
-
-	if (event != CPUFREQ_ADJUST)
-		return 0;
-
-	max_freq = clamped ? (p->cpuinfo.min_freq) : (p->cpuinfo.max_freq);
-	cpufreq_verify_within_limits(p, 0, max_freq);
-
-	return 0;
-}
-
-static struct notifier_block clamp_notifier = {
-	.notifier_call = clamp_notifier_call,
-};
+static struct dev_pm_qos_request qos_req;
+static unsigned int min_freq, max_freq;
 
 static int clamp_set(struct wf_control *ct, s32 value)
 {
-	if (value)
+	unsigned int freq;
+
+	if (value) {
+		freq = min_freq;
 		printk(KERN_INFO "windfarm: Clamping CPU frequency to "
 		       "minimum !\n");
-	else
+	} else {
+		freq = max_freq;
 		printk(KERN_INFO "windfarm: CPU frequency unclamped !\n");
+	}
 	clamped = value;
-	cpufreq_update_policy(0);
-	return 0;
+
+	return dev_pm_qos_update_request(&qos_req, freq);
 }
 
 static int clamp_get(struct wf_control *ct, s32 *value)
@@ -74,27 +64,60 @@ static const struct wf_control_ops clamp_ops = {
 
 static int __init wf_cpufreq_clamp_init(void)
 {
+	struct cpufreq_policy *policy;
 	struct wf_control *clamp;
+	struct device *dev;
+	int ret;
+
+	policy = cpufreq_cpu_get(0);
+	if (!policy) {
+		pr_warn("%s: cpufreq policy not found cpu0\n", __func__);
+		return -EPROBE_DEFER;
+	}
+
+	min_freq = policy->cpuinfo.min_freq;
+	max_freq = policy->cpuinfo.max_freq;
+	cpufreq_cpu_put(policy);
+
+	dev = get_cpu_device(0);
+	if (unlikely(!dev)) {
+		pr_warn("%s: No cpu device for cpu0\n", __func__);
+		return -ENODEV;
+	}
 
 	clamp = kmalloc(sizeof(struct wf_control), GFP_KERNEL);
 	if (clamp == NULL)
 		return -ENOMEM;
-	cpufreq_register_notifier(&clamp_notifier, CPUFREQ_POLICY_NOTIFIER);
+
+	ret = dev_pm_qos_add_request(dev, &qos_req, DEV_PM_QOS_MAX_FREQUENCY,
+				     max_freq);
+	if (ret < 0) {
+		pr_err("%s: Failed to add freq constraint (%d)\n", __func__,
+		       ret);
+		goto free;
+	}
+
 	clamp->ops = &clamp_ops;
 	clamp->name = "cpufreq-clamp";
-	if (wf_register_control(clamp))
+	ret = wf_register_control(clamp);
+	if (ret)
 		goto fail;
 	clamp_control = clamp;
 	return 0;
  fail:
+	dev_pm_qos_remove_request(&qos_req);
+
+ free:
 	kfree(clamp);
-	return -ENODEV;
+	return ret;
 }
 
 static void __exit wf_cpufreq_clamp_exit(void)
 {
-	if (clamp_control)
+	if (clamp_control) {
 		wf_unregister_control(clamp_control);
+		dev_pm_qos_remove_request(&qos_req);
+	}
 }
 
 
-- 
2.21.0.rc0.269.g1a574e7a288b

