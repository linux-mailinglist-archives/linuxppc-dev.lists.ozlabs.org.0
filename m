Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF18209C7B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 12:06:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49swdr19DRzDqLj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 20:06:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oRBAfBlY; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49swbG4B0QzDqJN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 20:04:09 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id h15so5190689wrq.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 03:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qjt9FGmETvfKR/5xsJLSRwL7nHb55/cQw6w8IeMJDa8=;
 b=oRBAfBlYhs+gCkMLNsY5+o3d4mA8MXjRtlsxnpYDj98pF49IKQ9T3Wyx1UzQ2pCKMy
 YOGOLb4E3eoXrL82xVgZyspoWMNCgb7nguXOvdslJL3VPcShB2imihQHNQVnQmAszJiw
 W9izh0jyB0+XyERMVCyoWUvGxMjRmqp7c41fRdtYi4c0Tceei7YprvwYw3Bg+es0PeDE
 1j2umixzokbWYnpfq0Qo3U1X3D8KDJNz5zv0fJNvidIQGwSd5hr9rvYkvtml1wGOC4KD
 x8HUsKdzfTRch7NpOr9MAo3z4xDzHNfD9RJ42Mqgyi+MJSqsn0/bUdU0s2aZfEHT15ao
 XfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Qjt9FGmETvfKR/5xsJLSRwL7nHb55/cQw6w8IeMJDa8=;
 b=jDfCsLz3WYIwELy7BU5KRCY4iToMpVqBnbfD0MKZ/pKOPoOmKTctEZKvi3IANc3vY9
 oTyrD4OcOar9veETq+fgEOV3LMkTZwAiJf7myOI8KLXGb4Z11lv58oaXvGKNZ2oxNk37
 upDSrP4H575IM9m9SIFjOpOJNPqi9SKecHWwNvdbWJM10PwT+1d2bN63xrRUDN669plf
 6Jg/KYz7HJ+2/Z9A78BgLqEHOevE8Rc1qylEf4zc765NsMR9p3U9aZgf0HU6En/JOGOk
 d5LJrTBdbWGr3ciAXEfpLdx3/CoHIow+Sx3Eb4/8aCVyNv91QjZH3vK5DoZ4Mp0S4RUV
 bw1w==
X-Gm-Message-State: AOAM531cc672eDEg6vQQp/xnG67aPy77edsCvI4FJWwK4v42vgE7jjVo
 0gM+39Sd8jA9Yw1ai7kEw+MEhPmT7JQ=
X-Google-Smtp-Source: ABdhPJyEpB8CXLK0BU0+21ZqpeGx00tWrLhF8E4ZZnDGJqM+9anZJTDE1Njf7+csQQ+vWBvN+tIdZg==
X-Received: by 2002:adf:f542:: with SMTP id j2mr21651035wrp.61.1593079444667; 
 Thu, 25 Jun 2020 03:04:04 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id f186sm11472731wmf.29.2020.06.25.03.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 03:04:04 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Warn about use of smt_snooze_delay
Date: Thu, 25 Jun 2020 19:33:49 +0930
Message-Id: <20200625100349.2408899-1-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
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
Cc: ego@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's not done anything for a long time. Save the percpu variable, and
emit a warning to remind users to not expect it to do anything.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/kernel/sysfs.c | 41 +++++++++++++------------------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 571b3259697e..530ae92bc46d 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -32,29 +32,25 @@
 
 static DEFINE_PER_CPU(struct cpu, cpu_devices);
 
-/*
- * SMT snooze delay stuff, 64-bit only for now
- */
-
 #ifdef CONFIG_PPC64
 
-/* Time in microseconds we delay before sleeping in the idle loop */
-static DEFINE_PER_CPU(long, smt_snooze_delay) = { 100 };
+/*
+ * Snooze delay has not been hooked up since 3fa8cad82b94 ("powerpc/pseries/cpuidle:
+ * smt-snooze-delay cleanup.") and has been broken even longer. As was foretold in
+ * 2014:
+ *
+ *  "ppc64_util currently utilises it. Once we fix ppc64_util, propose to clean
+ *  up the kernel code."
+ *
+ * At some point in the future this code should be removed.
+ */
 
 static ssize_t store_smt_snooze_delay(struct device *dev,
 				      struct device_attribute *attr,
 				      const char *buf,
 				      size_t count)
 {
-	struct cpu *cpu = container_of(dev, struct cpu, dev);
-	ssize_t ret;
-	long snooze;
-
-	ret = sscanf(buf, "%ld", &snooze);
-	if (ret != 1)
-		return -EINVAL;
-
-	per_cpu(smt_snooze_delay, cpu->dev.id) = snooze;
+	WARN_ON_ONCE("smt_snooze_delay sysfs file has no effect\n");
 	return count;
 }
 
@@ -62,9 +58,9 @@ static ssize_t show_smt_snooze_delay(struct device *dev,
 				     struct device_attribute *attr,
 				     char *buf)
 {
-	struct cpu *cpu = container_of(dev, struct cpu, dev);
+	WARN_ON_ONCE("smt_snooze_delay sysfs file has no effect\n");
 
-	return sprintf(buf, "%ld\n", per_cpu(smt_snooze_delay, cpu->dev.id));
+	return sprintf(buf, "100\n");
 }
 
 static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
@@ -72,16 +68,7 @@ static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
 
 static int __init setup_smt_snooze_delay(char *str)
 {
-	unsigned int cpu;
-	long snooze;
-
-	if (!cpu_has_feature(CPU_FTR_SMT))
-		return 1;
-
-	snooze = simple_strtol(str, NULL, 10);
-	for_each_possible_cpu(cpu)
-		per_cpu(smt_snooze_delay, cpu) = snooze;
-
+	WARN_ON_ONCE("smt-snooze-delay command line option has no effect\n");
 	return 1;
 }
 __setup("smt-snooze-delay=", setup_smt_snooze_delay);
-- 
2.27.0

