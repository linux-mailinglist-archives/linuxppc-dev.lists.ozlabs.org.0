Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2511A20EB39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 04:02:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wngJ0CpTzDqJW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 12:02:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LB2Y8MLt; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wncB0yfBzDqgj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 11:59:53 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id z15so7226949wrl.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 18:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E8duhiUCiqFmcUkMK29eJJFiPET89diObOD3QWIrfFw=;
 b=LB2Y8MLtwC+2NYPZyP7S+TA+WOZ8S5TYHwx6XBQPi7y3GZ+MJPPEVrugx01gEsQEDH
 zpwkPbaAwyYyhvkl4dFvvjSNZtGcRRxJBc9ke7tsENDqsdEdTZz0yjQ2NJjyGQjyoKtp
 oHQUTpo3c/qcJtr9xYURIL/FT4a0iBoLj+d0ATYDAPFclbnRW0IwUjc5zl9GX/G2dDJO
 i4ZF4W0FVvcmHemHhmo95a9Q0Q81JLai1EBDvoo3HQx+hen3qk+i496gvnKumbiHLS0i
 SwT/bdMrWnLXgSvifir8WABRdHk4DX9AABecsIzcRQ03XeaBw0GVBg+m9uwwQU1Z+r4n
 +N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=E8duhiUCiqFmcUkMK29eJJFiPET89diObOD3QWIrfFw=;
 b=QcYPnmky/p3r/s4zkjNIeQSvmFY9YaKbmRVWATzgPgPqrLuwwFGfJN3itDW2SrFXVl
 lguvc1HAhEsOnY3Whysbf/xIvAqS2WvYvI7rY1d0IRpdxXt+rJQWOA3m3tU0hSnPLnGL
 XFFA9P+3kRrK7Ya0NrleKAJjCspGlcJV4lVPFxMod3dsIiDZFqYkNitgIB1SemR2D0nH
 6ro4Wjx2VA352SZG55OYbZOl9xm3qNtuuONGkCpGvq+2Hv07BLhUheMsqt8AFIIoe70v
 9LuFudxpiSgAgPCrK0XNp28+3R5FG3Z7HJroluQjMkoKqTBXnKQ0OpXVH88gfVvY8zrc
 gDBQ==
X-Gm-Message-State: AOAM531oCwS704j6wkL2DAxqxfha/XANqES5UVLaRAt4jaHKa1WsCcSw
 6KTIz9xgvoFyOV78x/J1eXqM/4vlEl4=
X-Google-Smtp-Source: ABdhPJw9hKxdQQLtZsJYcHM7YRSKGzGwVD1qUzsNIHZOOySZxXeqmBmt/Amp1H+Ob7jPX1TMTZGKzg==
X-Received: by 2002:adf:8b50:: with SMTP id v16mr20428772wra.188.1593482388879; 
 Mon, 29 Jun 2020 18:59:48 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id f12sm1757505wrw.53.2020.06.29.18.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 18:59:48 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc: Warn about use of smt_snooze_delay
Date: Tue, 30 Jun 2020 11:29:35 +0930
Message-Id: <20200630015935.2675676-1-joel@jms.id.au>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's not done anything for a long time. Save the percpu variable, and
emit a warning to remind users to not expect it to do anything.

Fixes: 3fa8cad82b94 ("powerpc/pseries/cpuidle: smt-snooze-delay cleanup.")
Cc: stable@vger.kernel.org # v3.14
Signed-off-by: Joel Stanley <joel@jms.id.au>
--
v2:
 Use pr_warn instead of WARN
 Reword and print proccess name with pid in message
 Leave CPU_FTR_SMT test in
 Add Fixes line

mpe, if you don't agree then feel free to drop the cc stable.

Testing 'ppc64_cpu --smt=off' on a 24 core / 4 SMT system it's quite noisy
as the online/offline loop that ppc64_cpu runs is slow.

This could be fixed by open coding pr_warn_ratelimit with the ratelimit
parameters tweaked if someone was concerned. I'll leave that to someone
else as a future enhancement.

[  237.642088][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  237.642175][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  237.642261][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  237.642345][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  237.642430][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  237.642516][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  237.642625][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  237.642709][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  237.642793][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  237.642878][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  254.264030][ T1197] store_smt_snooze_delay: 14 callbacks suppressed
[  254.264033][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  254.264048][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  254.264062][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  254.264075][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  254.264089][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  254.264103][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  254.264116][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  254.264130][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  254.264143][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect
[  254.264157][ T1197] ppc64_cpu (1197) used unsupported smt_snooze_delay, this has no effect

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/kernel/sysfs.c | 41 +++++++++++++++----------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 571b3259697e..ba6d4cee19ef 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -32,29 +32,26 @@
 
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
+	pr_warn_ratelimited("%s (%d) used unsupported smt_snooze_delay, this has no effect\n",
+			    current->comm, current->pid);
 	return count;
 }
 
@@ -62,9 +59,9 @@ static ssize_t show_smt_snooze_delay(struct device *dev,
 				     struct device_attribute *attr,
 				     char *buf)
 {
-	struct cpu *cpu = container_of(dev, struct cpu, dev);
-
-	return sprintf(buf, "%ld\n", per_cpu(smt_snooze_delay, cpu->dev.id));
+	pr_warn_ratelimited("%s (%d) used unsupported smt_snooze_delay, this has no effect\n",
+			    current->comm, current->pid);
+	return sprintf(buf, "100\n");
 }
 
 static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
@@ -72,16 +69,10 @@ static DEVICE_ATTR(smt_snooze_delay, 0644, show_smt_snooze_delay,
 
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
2.27.0

