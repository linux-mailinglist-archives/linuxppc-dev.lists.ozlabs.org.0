Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F63D4B1A3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 01:16:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvvL50D9Yz3cDY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 11:16:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pcjmfLwA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d33;
 helo=mail-io1-xd33.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pcjmfLwA; dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvvKL4nK6z2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 11:15:49 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id s18so9489396ioa.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 16:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PIovVUUoTXrNkGptnZalq8qTG6elYmmkmcndd2InBI8=;
 b=pcjmfLwAiS/XGbn7H5lJSwo1VmJtz/MoynS0X5Dcg+dWgAtP50rspk13S0E5pJvDty
 S6taB1oBu2sz0cRmYD0OrRjqt2eHBVSewuL1cld2PkhQsvFtl9InCW6guWZsBAakxHMk
 QeAHrP+IGJZPPsIbTyETpTaKJMX41JIs46ZQl2s+qGfwWzoybsFUJSxmhqN/EcMYGjqu
 aLAgKKOq45uiO1viWnPybbeWGhqL5zctU9mMIOJebmWir+BUuJeDQnU4GPsD0okN+NS4
 pJvRQWhfbiVaTp3GfeFPrI0rEQUVFFs+HDyaa7lPxlLEpozQBg6i1VzRnx8jLoMxeYZM
 MW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PIovVUUoTXrNkGptnZalq8qTG6elYmmkmcndd2InBI8=;
 b=7sGIuipLjBLqp2eAkbe86cBrVsPtXrHv38P27VEbl/nzRqUWqkh4qidcCxtAzu1T0p
 NBvKuIYDiIe/kz47T6ZBZhsgQyApUQBMGclFIyOxgx0te8OBUo3Wcm6RKyiQdhR9vR4+
 Y8mCLUAR3TW+BqjJLnCsun/uNCI6WCB7y8c1EC7BYzQpqTkUOEkag+JBZ7LrbnZaojkL
 PSRFmNBpKzW0O4F/RO9R+cX9VxMG0NfOb3U7702NHweZrLq2telXDgFfh9b6eLLZFs61
 dFPlJsHe20rjA2IT/MLrRSEWEICqoc9YY4XUB4f3/ZywmNK8HLQmOWsgzgGDfPiPE+un
 3yIA==
X-Gm-Message-State: AOAM532CSOnDJL+SzktXTh/MrH6Rqbrw06d+izhII+Pd4hFp56jOT+Ar
 30HzbJNY6RXFEw7ygfXhHnY=
X-Google-Smtp-Source: ABdhPJxRcsurSAFIVa51O5zD9bcY1kB5OJeXxGfVrQ9MyMfVmVSnWSLVAohEIbusFvdw1qpbmH+QRA==
X-Received: by 2002:a05:6638:d0c:: with SMTP id
 q12mr5411794jaj.310.1644538546802; 
 Thu, 10 Feb 2022 16:15:46 -0800 (PST)
Received: from localhost ([12.28.44.171])
 by smtp.gmail.com with ESMTPSA id h3sm12329728ioe.19.2022.02.10.16.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 16:15:46 -0800 (PST)
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
Subject: [PATCH 38/49] arch/powerpc: replace cpumask_weight with
 cpumask_weight_{eq, ...} where appropriate
Date: Thu, 10 Feb 2022 14:49:22 -0800
Message-Id: <20220210224933.379149-39-yury.norov@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220210224933.379149-1-yury.norov@gmail.com>
References: <20220210224933.379149-1-yury.norov@gmail.com>
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

PowerPC code uses cpumask_weight() to compare the weight of cpumask with
a given number. We can do it more efficiently with cpumask_weight_{eq, ...}
because conditional cpumask_weight may stop traversing the cpumask earlier,
as soon as condition is (or can't be)  met.

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
2.32.0

