Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D55730B745
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 06:44:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVDJb50gFzDqyx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 16:43:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MGUcjiyj; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVDGQ2q3nzDqx6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 16:42:03 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id cl8so283389pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Feb 2021 21:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=frAkgVL2A/flsUkD71GYFVNqrXgLKUeulhJ4Bqnppzk=;
 b=MGUcjiyjgz3PsYXoJzyHlHKBA3biuY/GtlAnY21YDnrJbf0oyCTLdHywQ1wJcX7pbI
 3ahWvyl/Uw5KoHE1EA/7kgFFrqS9xMDyOJjxgWKBssojs90KY0TmgjbQhCebtfe7rTmq
 mIcFJSpSQModv1IRNycmrkbvJ1vGKGuHGmjTAM3PbgXe5OV9dz5NCiuIGBDtU4md9BSH
 quW8ivdCsZUJYWkYkDAwPBLwrd+ugRfdrfj8rc/UfsH8xAgXCi8Rd9O72Ovh5dwIzWOw
 xxEVpjGRy8HJHgbOdkXWEW3/AR3j8ZsCIUTm9+HM8t+Kr1gK2ja/4Pg40HhIDT1ZDl/4
 qqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=frAkgVL2A/flsUkD71GYFVNqrXgLKUeulhJ4Bqnppzk=;
 b=tvkVSXaH1Pu+xEPqMdWK2Myl2TFThAMPZWTgObiWB6l6dlcohMXbA3lZnlqgaC828w
 k9tMWaGRw0Cv8fFhSRoztDfYMTT8hCiogE3oDHQQ+LXeUi+ZQ7L5XHC0C3CjEPmv83Xy
 viuteSKwUvtNMW9Ch4xUp+tV9XUD5/b7IUSLpnrpPCLDzHC6Kts0mpX+Li+SoNEzxl7o
 AM3a2nf1kFdmli7pZPKoTjTrfkQW6/H8g5XNFfhYgdUjEAKbzFA0fwQpcZ7+3Utqoaaj
 CgzdyMH0gmYmLC6in2V+F2jS9EqJvjd1O7eLBcnyS4wgXRLNStoVPpcBEGN6waTsfpdk
 wiiQ==
X-Gm-Message-State: AOAM531jUlPAfXpnPCkxLEkcXbjEPDTLeLbhtGYtHd4vXND2gJ//L2LR
 E+Y3bAt5FndO9gKcBTyECSy4zQ==
X-Google-Smtp-Source: ABdhPJwBL3bzLIVURLuDJ0SFZ1X8RZlHop4HFGhEpJeW2qWp66VPCr62gyAbZxLYCJVhILDjbWheLw==
X-Received: by 2002:a17:902:ec83:b029:df:e942:93c0 with SMTP id
 x3-20020a170902ec83b02900dfe94293c0mr20605223plg.55.1612244521019; 
 Mon, 01 Feb 2021 21:42:01 -0800 (PST)
Received: from localhost ([122.172.59.240])
 by smtp.gmail.com with ESMTPSA id 184sm20062304pgi.92.2021.02.01.21.41.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 21:41:59 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH] cpufreq: Remove unused flag CPUFREQ_PM_NO_WARN
Date: Tue,  2 Feb 2021 11:11:55 +0530
Message-Id: <bed6bc7e15c3ed398dd61b8f3968049f1f16b1b6.1612244449.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
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

This flag is set by one of the drivers but it isn't used in the code
otherwise. Remove the unused flag and update the driver.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Rebased over:

https://lore.kernel.org/lkml/a59bb322b22c247d570b70a8e94067804287623b.1612241683.git.viresh.kumar@linaro.org/

 drivers/cpufreq/pmac32-cpufreq.c |  3 +--
 include/linux/cpufreq.h          | 13 +++++--------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
index 73621bc11976..4f20c6a9108d 100644
--- a/drivers/cpufreq/pmac32-cpufreq.c
+++ b/drivers/cpufreq/pmac32-cpufreq.c
@@ -439,8 +439,7 @@ static struct cpufreq_driver pmac_cpufreq_driver = {
 	.init		= pmac_cpufreq_cpu_init,
 	.suspend	= pmac_cpufreq_suspend,
 	.resume		= pmac_cpufreq_resume,
-	.flags		= CPUFREQ_PM_NO_WARN |
-			  CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING,
+	.flags		= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING,
 	.attr		= cpufreq_generic_attr,
 	.name		= "powermac",
 };
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index c8e40e91fe9b..353969c7acd3 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -398,8 +398,11 @@ struct cpufreq_driver {
 /* loops_per_jiffy or other kernel "constants" aren't affected by frequency transitions */
 #define CPUFREQ_CONST_LOOPS			BIT(1)
 
-/* don't warn on suspend/resume speed mismatches */
-#define CPUFREQ_PM_NO_WARN			BIT(2)
+/*
+ * Set by drivers that want the core to automatically register the cpufreq
+ * driver as a thermal cooling device.
+ */
+#define CPUFREQ_IS_COOLING_DEV			BIT(2)
 
 /*
  * This should be set by platforms having multiple clock-domains, i.e.
@@ -431,12 +434,6 @@ struct cpufreq_driver {
  */
 #define CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING	BIT(6)
 
-/*
- * Set by drivers that want the core to automatically register the cpufreq
- * driver as a thermal cooling device.
- */
-#define CPUFREQ_IS_COOLING_DEV			BIT(7)
-
 int cpufreq_register_driver(struct cpufreq_driver *driver_data);
 int cpufreq_unregister_driver(struct cpufreq_driver *driver_data);
 
-- 
2.25.0.rc1.19.g042ed3e048af

