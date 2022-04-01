Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7149A4EF8E8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 19:25:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVRrK28yfz3c2p
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 04:25:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVRqw3Dbcz2xSM
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 04:24:43 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KVRqr0ZQbz9sRy;
 Fri,  1 Apr 2022 19:24:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qjzDkK5GQhv; Fri,  1 Apr 2022 19:24:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KVRqq6mdHz9sRx;
 Fri,  1 Apr 2022 19:24:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D64128B87E;
 Fri,  1 Apr 2022 19:24:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fvM4XEFXo0GL; Fri,  1 Apr 2022 19:24:39 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.82])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8931B8B879;
 Fri,  1 Apr 2022 19:24:39 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 231HOSh9665353
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 1 Apr 2022 19:24:28 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 231HOS1i665352;
 Fri, 1 Apr 2022 19:24:28 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] cpufreq: Prepare cleanup of powerpc's asm/prom.h
Date: Fri,  1 Apr 2022 19:24:28 +0200
Message-Id: <4cb0c4573cce165657ad1f7275c4b3852cbcd115.1648833416.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648833867; l=2544; s=20211009;
 h=from:subject:message-id; bh=6HFH5vctb4CM6TLdbxSxVP3cPSYLITg6N2oWHo7zycc=;
 b=0BIt3RnuB6YZdFU81km55wIzh5IeKiTLNExtM96tTDNPAiacFInZhJksD8Sq0ZMwePxp99ntZew9
 Hm4h1wLFBvHEscGH+LPDl3CXVt+ySx0rXVo7e8M5zhqzah87dCkJ
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc's asm/prom.h brings some headers that it doesn't
need itself.

In order to clean it up, first add missing headers in
users of asm/prom.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/cpufreq/pasemi-cpufreq.c      | 1 -
 drivers/cpufreq/pmac32-cpufreq.c      | 2 +-
 drivers/cpufreq/pmac64-cpufreq.c      | 2 +-
 drivers/cpufreq/ppc_cbe_cpufreq.c     | 1 -
 drivers/cpufreq/ppc_cbe_cpufreq_pmi.c | 2 +-
 5 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
index 815645170c4d..039a66bbe1be 100644
--- a/drivers/cpufreq/pasemi-cpufreq.c
+++ b/drivers/cpufreq/pasemi-cpufreq.c
@@ -18,7 +18,6 @@
 
 #include <asm/hw_irq.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/time.h>
 #include <asm/smp.h>
 
diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
index 4f20c6a9108d..20f64a8b0a35 100644
--- a/drivers/cpufreq/pmac32-cpufreq.c
+++ b/drivers/cpufreq/pmac32-cpufreq.c
@@ -24,7 +24,7 @@
 #include <linux/device.h>
 #include <linux/hardirq.h>
 #include <linux/of_device.h>
-#include <asm/prom.h>
+
 #include <asm/machdep.h>
 #include <asm/irq.h>
 #include <asm/pmac_feature.h>
diff --git a/drivers/cpufreq/pmac64-cpufreq.c b/drivers/cpufreq/pmac64-cpufreq.c
index d7542a106e6b..ba9c31d98bd6 100644
--- a/drivers/cpufreq/pmac64-cpufreq.c
+++ b/drivers/cpufreq/pmac64-cpufreq.c
@@ -22,7 +22,7 @@
 #include <linux/completion.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
-#include <asm/prom.h>
+
 #include <asm/machdep.h>
 #include <asm/irq.h>
 #include <asm/sections.h>
diff --git a/drivers/cpufreq/ppc_cbe_cpufreq.c b/drivers/cpufreq/ppc_cbe_cpufreq.c
index c58abb4cca3a..e3313ce63b38 100644
--- a/drivers/cpufreq/ppc_cbe_cpufreq.c
+++ b/drivers/cpufreq/ppc_cbe_cpufreq.c
@@ -12,7 +12,6 @@
 #include <linux/of_platform.h>
 
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/cell-regs.h>
 
 #include "ppc_cbe_cpufreq.h"
diff --git a/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c b/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
index 037fe23bc6ed..4fba3637b115 100644
--- a/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
+++ b/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
@@ -13,9 +13,9 @@
 #include <linux/init.h>
 #include <linux/of_platform.h>
 #include <linux/pm_qos.h>
+#include <linux/slab.h>
 
 #include <asm/processor.h>
-#include <asm/prom.h>
 #include <asm/pmi.h>
 #include <asm/cell-regs.h>
 
-- 
2.35.1

