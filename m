Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A24A25A224
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 02:02:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh3zR0tQczDqG1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 10:02:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=I3wFWCSK; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh3xQ28XXzDqLT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 10:00:58 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id p37so1587784pgl.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 17:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gLgEk3oGYS9l0OApWlO9HFN2XY5iBk93OwZsgGJtEj0=;
 b=I3wFWCSK/UvUd39MfLJZs/LPVIq/xRbdSHiY4YXM6Z3lICDgaLiTLOifdOVjqEV/GX
 QPuGZsTwrWQOj8cp/8ckWBfnNE/Er1zf5aflJtK88IcX8nsn02chroog+FjwYlXPB6EC
 /kZ7XN6mZ5DuUejJk1+Pv7ILE1Z9Vo6vNKqCMcZNmXdYclhsr6bQQ15ShCkeIGqh9fAg
 jeCjZGkPUEAKhZmGVRBhfFOrzv/eyFiDSLSWhQ06hQSs2fCFaIdCmLRmSajbkhEkNjQr
 QXnkgo/tBW28PYZi6LlAGFKNr5bqgvQA1R6zvSeEmO9GsZZoMCyHs55Y64DvD+k484mi
 hZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gLgEk3oGYS9l0OApWlO9HFN2XY5iBk93OwZsgGJtEj0=;
 b=SrRt3Bk0wNTrYvJHhwqtwLp0ygfV2k3dRmWfgRAEd+BGiNxyWdsTwrge+lbTC7+xhC
 S2ZWrzuCtxkWMPG5jCAcyPy7xZY/OKysH6Zz83yAtAO/CJECEipaA0G7mZCVKkWqRLFz
 RAJCJMg/WhcvXOQpCZUoAiwiiuH2Q9LXYkHT1eY9FreB0oGxriD7zlfUs0uP2NbWuQqR
 z/tQxPHP2kKBCYkl/H6ZAPDmkppSzr1u/mAyLOITeiBWNajAzxRhj6BxT4iOnfGwINu4
 V/xQnKcXHW/lWlTcXFgBf0PaHEHeqsn5cKMxy0fLaKNvC0bjBIFwQdaZJA0iaNmQGCA5
 ALQw==
X-Gm-Message-State: AOAM531Tnfhxs9mb0yCpdObTsJC9vJPkFjTmfusVD/k1YQ6RSSVVGKbc
 5lnvAF2lHZDvKJZ02q20JWD3Uk3uC0//FA==
X-Google-Smtp-Source: ABdhPJxaekKuwnoezWo88n5gDtI35ajcVnYQxsZvsHePfpF5r50wgXiVw5H3M9owb98AKZBj4nQiig==
X-Received: by 2002:a63:342:: with SMTP id 63mr3733954pgd.134.1599004853766;
 Tue, 01 Sep 2020 17:00:53 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id d77sm3339372pfd.121.2020.09.01.17.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 17:00:52 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc: Warn about use of smt_snooze_delay
Date: Wed,  2 Sep 2020 09:30:11 +0930
Message-Id: <20200902000012.3440389-1-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's not done anything for a long time. Save the percpu variable, and
emit a warning to remind users to not expect it to do anything.

This uses pr_warn_once instead of pr_warn_ratelimit as testing
'ppc64_cpu --smt=off' on a 24 core / 4 SMT system showed the warning to
be noisy, as the online/offline loop is slow.

Fixes: 3fa8cad82b94 ("powerpc/pseries/cpuidle: smt-snooze-delay cleanup.")
Cc: stable@vger.kernel.org # v3.14
Acked-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
--
v3:
 pr_warn_once instead of pr_warn_ratelimited
 Update meessages with mpe's suggestions
v2:
 Use pr_warn instead of WARN
 Reword and print proccess name with pid in message
 Leave CPU_FTR_SMT test in
---
 arch/powerpc/kernel/sysfs.c | 42 +++++++++++++++----------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 46b4ebc33db7..5dea98fa2f93 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -32,29 +32,27 @@
 
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
+ * powerpc-utils stopped using it as of 1.3.8. At some point in the future this
+ * code should be removed.
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
+	pr_warn_once("%s (%d) stored to unsupported smt_snooze_delay, which has no effect.\n",
+		     current->comm, current->pid);
 	return count;
 }
 
@@ -62,9 +60,9 @@ static ssize_t show_smt_snooze_delay(struct device *dev,
 				     struct device_attribute *attr,
 				     char *buf)
 {
-	struct cpu *cpu = container_of(dev, struct cpu, dev);
-
-	return sprintf(buf, "%ld\n", per_cpu(smt_snooze_delay, cpu->dev.id));
+	pr_warn_once("%s (%d) read from unsupported smt_snooze_delay\n",
+		     current->comm, current->pid);
+	return sprintf(buf, "100\n");
 }
 
 static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
@@ -72,16 +70,10 @@ static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
 
 static int __init setup_smt_snooze_delay(char *str)
 {
-	unsigned int cpu;
-	long snooze;
-
 	if (!cpu_has_feature(CPU_FTR_SMT))
 		return 1;
 
-	snooze = simple_strtol(str, NULL, 10);
-	for_each_possible_cpu(cpu)
-		per_cpu(smt_snooze_delay, cpu) = snooze;
-
+	pr_warn("smt-snooze-delay command line option has no effect\n");
 	return 1;
 }
 __setup("smt-snooze-delay=", setup_smt_snooze_delay);
-- 
2.28.0

