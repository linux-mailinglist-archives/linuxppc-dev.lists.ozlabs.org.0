Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A7649749F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 19:42:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jhhn65G37z30hX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 05:42:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gYPbDS3x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gYPbDS3x; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhhmN5X88z30Ky
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 05:41:54 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 d12-20020a17090a628c00b001b4f47e2f51so15467076pjj.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 10:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6C24rFRm4D9dQifkbAjpKYbgU7hbqSNfEMJXgU+U9KI=;
 b=gYPbDS3xW8Bof6/g8XIUI3VOyuWClFWj+Zb1KxH7n8eeylpaD7S+0cAQt0BGU2As3z
 duZ9/03UsRs07ChTiteduoXTEha9M3JOt6tS2tzofY+aoNv/yDnGgcW162IO7pfl0wRn
 ZdC0c7yMRUF0QVaQPTId/pywxUsN08BWrvHjR6PfR/383ALFfcq0bHBGeuYVyfzZTOTt
 y5IAqKFglXI7xWlG7X5EuweqyLRNOsqcKnZPCn+pO0ZCouINBgits28kN7Bj2Z0Eniua
 b/brsWqVckOYFra9U6GGgIJGIuiycyhOEhIHy1iVyx8K7y1oYTijPy9C6uKNewCLCHDK
 pV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6C24rFRm4D9dQifkbAjpKYbgU7hbqSNfEMJXgU+U9KI=;
 b=6cri/5eCZTTjB6lBfCU+AyDM7bw0jA0S0GMZbHvDQBExYS8nb2WZqsebY9tcTu7KS+
 UpOBIoAlGlUhJtHG5Fcj/qu+Wwce1GAzJkpIpx89FTUwVdDmFoki7QohgRiCIk6OlYvM
 Zqoksa0x2q1O3A8vguAKLyKJoNL3c20MYbTnSh5IQRtC7g5S68dG8OHzBHMSqzR5Rs6+
 0XtnQVAYpA19qmnwxaqLTB+G0RrWvXdtZeFmQXAH7LiQ1PfGzq/AMqU3hQirzBSmQMe5
 DXEb4za/drZLrxS5dDyf3Zwnvjwfcl5NzfCukzIBoA3woOur07GuYAr2MZBQO0Jx1f+s
 xIWg==
X-Gm-Message-State: AOAM530dO98GUj6+TWOWRt96kbQJbbSN2shhq1C2eZj2aD85PybiNyp0
 04lBE/eOalRsFogPyFBwZSQ=
X-Google-Smtp-Source: ABdhPJwCUm5LGUQRIavV14WvbHJtSguBHM0RRlDYhBuujEK/erleabWJrnbTCB8LogwV7QJ8p8LuVA==
X-Received: by 2002:a17:90b:4f87:: with SMTP id
 qe7mr7183731pjb.154.1642963310342; 
 Sun, 23 Jan 2022 10:41:50 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id pj7sm1942706pjb.50.2022.01.23.10.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 10:41:50 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: Yury Norov <yury.norov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 David Laight <David.Laight@aculab.com>, Joe Perches <joe@perches.com>,
 Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Alexey Klimov <aklimov@redhat.com>, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Parth Shah <parth@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Hari Bathini <hbathini@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Laurent Dufour <ldufour@linux.ibm.com>, Petr Mladek <pmladek@suse.com>,
 John Ogness <john.ogness@linutronix.de>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Xiongwei Song <sxwjean@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 39/54] arch/powerpc: replace cpumask_weight with
 cpumask_weight_{eq, ...} where appropriate
Date: Sun, 23 Jan 2022 10:39:10 -0800
Message-Id: <20220123183925.1052919-40-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220123183925.1052919-1-yury.norov@gmail.com>
References: <20220123183925.1052919-1-yury.norov@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerPC code uses cpumask_weight() to compare the weight of cpumask
with a given number. We can do it more efficiently with
cpumask_weight_{eq, ...} because conditional cpumask_weight may stop
traversing the cpumask earlier, as soon as condition is met.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/powerpc/kernel/smp.c      | 2 +-
 arch/powerpc/kernel/watchdog.c | 2 +-
 arch/powerpc/xmon/xmon.c       | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index b7fd6a72aa76..8bff748df402 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1656,7 +1656,7 @@ void start_secondary(void *unused)
 		if (has_big_cores)
 			sibling_mask = cpu_smallcore_mask;
 
-		if (cpumask_weight(mask) > cpumask_weight(sibling_mask(cpu)))
+		if (cpumask_weight_gt(mask, cpumask_weight(sibling_mask(cpu))))
 			shared_caches = true;
 	}
 
diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index bfc27496fe7e..62937a077de7 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -483,7 +483,7 @@ static void start_watchdog(void *arg)
 
 	wd_smp_lock(&flags);
 	cpumask_set_cpu(cpu, &wd_cpus_enabled);
-	if (cpumask_weight(&wd_cpus_enabled) == 1) {
+	if (cpumask_weight_eq(&wd_cpus_enabled, 1)) {
 		cpumask_set_cpu(cpu, &wd_smp_cpus_pending);
 		wd_smp_last_reset_tb = get_tb();
 	}
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index fd72753e8ad5..b423812e94e0 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -469,7 +469,7 @@ static bool wait_for_other_cpus(int ncpus)
 
 	/* We wait for 2s, which is a metric "little while" */
 	for (timeout = 20000; timeout != 0; --timeout) {
-		if (cpumask_weight(&cpus_in_xmon) >= ncpus)
+		if (cpumask_weight_ge(&cpus_in_xmon, ncpus))
 			return true;
 		udelay(100);
 		barrier();
@@ -1338,7 +1338,7 @@ static int cpu_cmd(void)
 			case 'S':
 			case 't':
 				cpumask_copy(&xmon_batch_cpus, &cpus_in_xmon);
-				if (cpumask_weight(&xmon_batch_cpus) <= 1) {
+				if (cpumask_weight_le(&xmon_batch_cpus, 1)) {
 					printf("There are no other cpus in xmon\n");
 					break;
 				}
-- 
2.30.2

