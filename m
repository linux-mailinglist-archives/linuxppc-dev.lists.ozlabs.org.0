Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 748254EF8C0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 19:16:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVRfc2yK6z3c3Z
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 04:16:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVRf82m18z2yn1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 04:16:13 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KVRf03ZtPz9sRs;
 Fri,  1 Apr 2022 19:16:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id guAaRcRqI9M7; Fri,  1 Apr 2022 19:16:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KVRf01xbwz9sRj;
 Fri,  1 Apr 2022 19:16:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AE538B87E;
 Fri,  1 Apr 2022 19:16:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8zntGAyZIY_c; Fri,  1 Apr 2022 19:16:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.82])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C4AA18B879;
 Fri,  1 Apr 2022 19:16:07 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 231HFu4s663348
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 1 Apr 2022 19:15:56 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 231HFsTQ663346;
 Fri, 1 Apr 2022 19:15:54 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Colin Leroy <colin@colino.net>
Subject: [PATCH] macintosh: Prepare cleanup of powerpc's asm/prom.h
Date: Fri,  1 Apr 2022 19:15:53 +0200
Message-Id: <04961364547fe4556e30cb302b0e20a939b83426.1648833027.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648833352; l=15069; s=20211009;
 h=from:subject:message-id; bh=LQjtAC9SCwjs/OP9uybaBy7SgDJjugZHETZ6+i+RzHU=;
 b=niiTsYmSvNCvPUeoFoQwoMGFvu+IzQQqjg5PDo4TXpE7ioBjY4O9Kw35IyXOgp6LZmp29aSUARZz
 f4jgKpO/CIHotraF/O2D7l3xE6nWRz9WTjVmHHeVOh3gPhWg618y
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc's asm/prom.h brings some headers that it doesn't
need itself.

In order to clean it up, first add missing headers in
users of asm/prom.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/macintosh/adb.c                     | 2 +-
 drivers/macintosh/ans-lcd.c                 | 2 +-
 drivers/macintosh/macio-adb.c               | 5 ++++-
 drivers/macintosh/macio_asic.c              | 3 ++-
 drivers/macintosh/macio_sysfs.c             | 2 ++
 drivers/macintosh/mediabay.c                | 2 +-
 drivers/macintosh/rack-meter.c              | 1 -
 drivers/macintosh/smu.c                     | 1 -
 drivers/macintosh/therm_adt746x.c           | 1 -
 drivers/macintosh/therm_windtunnel.c        | 1 -
 drivers/macintosh/via-cuda.c                | 4 +++-
 drivers/macintosh/via-pmu-backlight.c       | 1 -
 drivers/macintosh/via-pmu-led.c             | 2 +-
 drivers/macintosh/via-pmu.c                 | 1 -
 drivers/macintosh/windfarm_ad7417_sensor.c  | 2 +-
 drivers/macintosh/windfarm_core.c           | 2 --
 drivers/macintosh/windfarm_cpufreq_clamp.c  | 2 --
 drivers/macintosh/windfarm_fcu_controls.c   | 2 +-
 drivers/macintosh/windfarm_lm75_sensor.c    | 1 -
 drivers/macintosh/windfarm_lm87_sensor.c    | 2 +-
 drivers/macintosh/windfarm_max6690_sensor.c | 2 +-
 drivers/macintosh/windfarm_mpu.h            | 2 ++
 drivers/macintosh/windfarm_pm112.c          | 4 +++-
 drivers/macintosh/windfarm_pm121.c          | 3 ++-
 drivers/macintosh/windfarm_pm72.c           | 2 +-
 drivers/macintosh/windfarm_pm81.c           | 3 ++-
 drivers/macintosh/windfarm_pm91.c           | 3 ++-
 drivers/macintosh/windfarm_rm31.c           | 2 +-
 drivers/macintosh/windfarm_smu_controls.c   | 3 ++-
 drivers/macintosh/windfarm_smu_sat.c        | 2 +-
 drivers/macintosh/windfarm_smu_sensors.c    | 3 ++-
 31 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/drivers/macintosh/adb.c b/drivers/macintosh/adb.c
index 73b396189039..439fab4eaa85 100644
--- a/drivers/macintosh/adb.c
+++ b/drivers/macintosh/adb.c
@@ -38,10 +38,10 @@
 #include <linux/kthread.h>
 #include <linux/platform_device.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 
 #include <linux/uaccess.h>
 #ifdef CONFIG_PPC
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #endif
 
diff --git a/drivers/macintosh/ans-lcd.c b/drivers/macintosh/ans-lcd.c
index b4821c751d04..fa904b24a600 100644
--- a/drivers/macintosh/ans-lcd.c
+++ b/drivers/macintosh/ans-lcd.c
@@ -11,10 +11,10 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/fs.h>
+#include <linux/of.h>
 
 #include <linux/uaccess.h>
 #include <asm/sections.h>
-#include <asm/prom.h>
 #include <asm/io.h>
 
 #include "ans-lcd.h"
diff --git a/drivers/macintosh/macio-adb.c b/drivers/macintosh/macio-adb.c
index dc634c2932fd..9b63bd2551c6 100644
--- a/drivers/macintosh/macio-adb.c
+++ b/drivers/macintosh/macio-adb.c
@@ -9,8 +9,11 @@
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/pgtable.h>
-#include <asm/prom.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/adb.h>
+
 #include <asm/io.h>
 #include <asm/hydra.h>
 #include <asm/irq.h>
diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asic.c
index 1943a007e2d5..3f519f573a63 100644
--- a/drivers/macintosh/macio_asic.c
+++ b/drivers/macintosh/macio_asic.c
@@ -20,13 +20,14 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 
 #include <asm/machdep.h>
 #include <asm/macio.h>
 #include <asm/pmac_feature.h>
-#include <asm/prom.h>
 
 #undef DEBUG
 
diff --git a/drivers/macintosh/macio_sysfs.c b/drivers/macintosh/macio_sysfs.c
index 27f5eefc508f..2bbe359b26d9 100644
--- a/drivers/macintosh/macio_sysfs.c
+++ b/drivers/macintosh/macio_sysfs.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/stat.h>
 #include <asm/macio.h>
 
diff --git a/drivers/macintosh/mediabay.c b/drivers/macintosh/mediabay.c
index b17660c022eb..36070c6586d1 100644
--- a/drivers/macintosh/mediabay.c
+++ b/drivers/macintosh/mediabay.c
@@ -17,7 +17,7 @@
 #include <linux/kthread.h>
 #include <linux/mutex.h>
 #include <linux/pgtable.h>
-#include <asm/prom.h>
+
 #include <asm/io.h>
 #include <asm/machdep.h>
 #include <asm/pmac_feature.h>
diff --git a/drivers/macintosh/rack-meter.c b/drivers/macintosh/rack-meter.c
index 60311e8d6240..c28893e41a8b 100644
--- a/drivers/macintosh/rack-meter.c
+++ b/drivers/macintosh/rack-meter.c
@@ -27,7 +27,6 @@
 #include <linux/of_irq.h>
 
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/pmac_feature.h>
 #include <asm/dbdma.h>
diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
index a4fbc3fc713d..4350dabd9e6e 100644
--- a/drivers/macintosh/smu.c
+++ b/drivers/macintosh/smu.c
@@ -41,7 +41,6 @@
 
 #include <asm/byteorder.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/pmac_feature.h>
 #include <asm/smu.h>
diff --git a/drivers/macintosh/therm_adt746x.c b/drivers/macintosh/therm_adt746x.c
index 7e218437730c..e604cbc91763 100644
--- a/drivers/macintosh/therm_adt746x.c
+++ b/drivers/macintosh/therm_adt746x.c
@@ -27,7 +27,6 @@
 #include <linux/freezer.h>
 #include <linux/of_platform.h>
 
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/sections.h>
diff --git a/drivers/macintosh/therm_windtunnel.c b/drivers/macintosh/therm_windtunnel.c
index f55f6adf5e5f..9226b74fa08f 100644
--- a/drivers/macintosh/therm_windtunnel.c
+++ b/drivers/macintosh/therm_windtunnel.c
@@ -38,7 +38,6 @@
 #include <linux/kthread.h>
 #include <linux/of_platform.h>
 
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/sections.h>
diff --git a/drivers/macintosh/via-cuda.c b/drivers/macintosh/via-cuda.c
index 3d0d0b9d471d..3838eb459ab1 100644
--- a/drivers/macintosh/via-cuda.c
+++ b/drivers/macintosh/via-cuda.c
@@ -18,8 +18,10 @@
 #include <linux/cuda.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+
 #ifdef CONFIG_PPC
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/pmac_feature.h>
 #else
diff --git a/drivers/macintosh/via-pmu-backlight.c b/drivers/macintosh/via-pmu-backlight.c
index 50ada02ae75d..2194016122d2 100644
--- a/drivers/macintosh/via-pmu-backlight.c
+++ b/drivers/macintosh/via-pmu-backlight.c
@@ -12,7 +12,6 @@
 #include <linux/adb.h>
 #include <linux/pmu.h>
 #include <asm/backlight.h>
-#include <asm/prom.h>
 
 #define MAX_PMU_LEVEL 0xFF
 
diff --git a/drivers/macintosh/via-pmu-led.c b/drivers/macintosh/via-pmu-led.c
index ae067ab2373d..a4fb16d7db3c 100644
--- a/drivers/macintosh/via-pmu-led.c
+++ b/drivers/macintosh/via-pmu-led.c
@@ -25,7 +25,7 @@
 #include <linux/leds.h>
 #include <linux/adb.h>
 #include <linux/pmu.h>
-#include <asm/prom.h>
+#include <linux/of.h>
 
 static spinlock_t pmu_blink_lock;
 static struct adb_request pmu_blink_req;
diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index 4b98bc26a94b..9c162d747247 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -59,7 +59,6 @@
 #include <asm/pmac_feature.h>
 #include <asm/pmac_pfunc.h>
 #include <asm/pmac_low_i2c.h>
-#include <asm/prom.h>
 #include <asm/mmu_context.h>
 #include <asm/cputable.h>
 #include <asm/time.h>
diff --git a/drivers/macintosh/windfarm_ad7417_sensor.c b/drivers/macintosh/windfarm_ad7417_sensor.c
index e7dec328c7cf..6ad6441abcbc 100644
--- a/drivers/macintosh/windfarm_ad7417_sensor.c
+++ b/drivers/macintosh/windfarm_ad7417_sensor.c
@@ -13,7 +13,7 @@
 #include <linux/init.h>
 #include <linux/wait.h>
 #include <linux/i2c.h>
-#include <asm/prom.h>
+
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/sections.h>
diff --git a/drivers/macintosh/windfarm_core.c b/drivers/macintosh/windfarm_core.c
index 07f91ec1f960..5307b1e34261 100644
--- a/drivers/macintosh/windfarm_core.c
+++ b/drivers/macintosh/windfarm_core.c
@@ -35,8 +35,6 @@
 #include <linux/mutex.h>
 #include <linux/freezer.h>
 
-#include <asm/prom.h>
-
 #include "windfarm.h"
 
 #define VERSION "0.2"
diff --git a/drivers/macintosh/windfarm_cpufreq_clamp.c b/drivers/macintosh/windfarm_cpufreq_clamp.c
index 7b726f00f183..28d18ef22bbb 100644
--- a/drivers/macintosh/windfarm_cpufreq_clamp.c
+++ b/drivers/macintosh/windfarm_cpufreq_clamp.c
@@ -10,8 +10,6 @@
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
 
-#include <asm/prom.h>
-
 #include "windfarm.h"
 
 #define VERSION "0.3"
diff --git a/drivers/macintosh/windfarm_fcu_controls.c b/drivers/macintosh/windfarm_fcu_controls.c
index 2470e5a725c8..82e7b2005ae7 100644
--- a/drivers/macintosh/windfarm_fcu_controls.c
+++ b/drivers/macintosh/windfarm_fcu_controls.c
@@ -14,7 +14,7 @@
 #include <linux/init.h>
 #include <linux/wait.h>
 #include <linux/i2c.h>
-#include <asm/prom.h>
+
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/sections.h>
diff --git a/drivers/macintosh/windfarm_lm75_sensor.c b/drivers/macintosh/windfarm_lm75_sensor.c
index 29f48c2028b6..eb7e7f0bd219 100644
--- a/drivers/macintosh/windfarm_lm75_sensor.c
+++ b/drivers/macintosh/windfarm_lm75_sensor.c
@@ -15,7 +15,6 @@
 #include <linux/wait.h>
 #include <linux/i2c.h>
 #include <linux/of_device.h>
-#include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/sections.h>
diff --git a/drivers/macintosh/windfarm_lm87_sensor.c b/drivers/macintosh/windfarm_lm87_sensor.c
index 9fab0b47cd3d..807efdde86bc 100644
--- a/drivers/macintosh/windfarm_lm87_sensor.c
+++ b/drivers/macintosh/windfarm_lm87_sensor.c
@@ -13,7 +13,7 @@
 #include <linux/init.h>
 #include <linux/wait.h>
 #include <linux/i2c.h>
-#include <asm/prom.h>
+
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/sections.h>
diff --git a/drivers/macintosh/windfarm_max6690_sensor.c b/drivers/macintosh/windfarm_max6690_sensor.c
index 1e7b03d44ad9..55ee417fb878 100644
--- a/drivers/macintosh/windfarm_max6690_sensor.c
+++ b/drivers/macintosh/windfarm_max6690_sensor.c
@@ -10,7 +10,7 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/i2c.h>
-#include <asm/prom.h>
+
 #include <asm/pmac_low_i2c.h>
 
 #include "windfarm.h"
diff --git a/drivers/macintosh/windfarm_mpu.h b/drivers/macintosh/windfarm_mpu.h
index 157ce6e3f32e..b5ce347d12d4 100644
--- a/drivers/macintosh/windfarm_mpu.h
+++ b/drivers/macintosh/windfarm_mpu.h
@@ -8,6 +8,8 @@
 #ifndef __WINDFARM_MPU_H
 #define __WINDFARM_MPU_H
 
+#include <linux/of.h>
+
 typedef unsigned short fu16;
 typedef int fs32;
 typedef short fs16;
diff --git a/drivers/macintosh/windfarm_pm112.c b/drivers/macintosh/windfarm_pm112.c
index e8377ce0a95a..d1dec314ae30 100644
--- a/drivers/macintosh/windfarm_pm112.c
+++ b/drivers/macintosh/windfarm_pm112.c
@@ -12,7 +12,9 @@
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
-#include <asm/prom.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+
 #include <asm/smu.h>
 
 #include "windfarm.h"
diff --git a/drivers/macintosh/windfarm_pm121.c b/drivers/macintosh/windfarm_pm121.c
index ba1ec6fc11d2..36312f163aac 100644
--- a/drivers/macintosh/windfarm_pm121.c
+++ b/drivers/macintosh/windfarm_pm121.c
@@ -201,7 +201,8 @@
 #include <linux/kmod.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
-#include <asm/prom.h>
+#include <linux/of.h>
+
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/sections.h>
diff --git a/drivers/macintosh/windfarm_pm72.c b/drivers/macintosh/windfarm_pm72.c
index e81746b87cff..e21f973551cc 100644
--- a/drivers/macintosh/windfarm_pm72.c
+++ b/drivers/macintosh/windfarm_pm72.c
@@ -11,7 +11,7 @@
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
-#include <asm/prom.h>
+
 #include <asm/smu.h>
 
 #include "windfarm.h"
diff --git a/drivers/macintosh/windfarm_pm81.c b/drivers/macintosh/windfarm_pm81.c
index 82c67a4ee5f7..e0f4743f21cc 100644
--- a/drivers/macintosh/windfarm_pm81.c
+++ b/drivers/macintosh/windfarm_pm81.c
@@ -102,7 +102,8 @@
 #include <linux/kmod.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
-#include <asm/prom.h>
+#include <linux/of.h>
+
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/sections.h>
diff --git a/drivers/macintosh/windfarm_pm91.c b/drivers/macintosh/windfarm_pm91.c
index 3f346af9e3f7..c8535855360d 100644
--- a/drivers/macintosh/windfarm_pm91.c
+++ b/drivers/macintosh/windfarm_pm91.c
@@ -37,7 +37,8 @@
 #include <linux/kmod.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
-#include <asm/prom.h>
+#include <linux/of.h>
+
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/sections.h>
diff --git a/drivers/macintosh/windfarm_rm31.c b/drivers/macintosh/windfarm_rm31.c
index 7acd1684c451..e9eb7fdde48c 100644
--- a/drivers/macintosh/windfarm_rm31.c
+++ b/drivers/macintosh/windfarm_rm31.c
@@ -11,7 +11,7 @@
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
-#include <asm/prom.h>
+
 #include <asm/smu.h>
 
 #include "windfarm.h"
diff --git a/drivers/macintosh/windfarm_smu_controls.c b/drivers/macintosh/windfarm_smu_controls.c
index 75966052819a..e9957ad49a2a 100644
--- a/drivers/macintosh/windfarm_smu_controls.c
+++ b/drivers/macintosh/windfarm_smu_controls.c
@@ -14,7 +14,8 @@
 #include <linux/init.h>
 #include <linux/wait.h>
 #include <linux/completion.h>
-#include <asm/prom.h>
+#include <linux/of.h>
+
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/sections.h>
diff --git a/drivers/macintosh/windfarm_smu_sat.c b/drivers/macintosh/windfarm_smu_sat.c
index e46e1153a0b4..5ade627eaa78 100644
--- a/drivers/macintosh/windfarm_smu_sat.c
+++ b/drivers/macintosh/windfarm_smu_sat.c
@@ -13,7 +13,7 @@
 #include <linux/wait.h>
 #include <linux/i2c.h>
 #include <linux/mutex.h>
-#include <asm/prom.h>
+
 #include <asm/smu.h>
 #include <asm/pmac_low_i2c.h>
 
diff --git a/drivers/macintosh/windfarm_smu_sensors.c b/drivers/macintosh/windfarm_smu_sensors.c
index c8706cfb83fd..00c6fe25fcba 100644
--- a/drivers/macintosh/windfarm_smu_sensors.c
+++ b/drivers/macintosh/windfarm_smu_sensors.c
@@ -14,7 +14,8 @@
 #include <linux/init.h>
 #include <linux/wait.h>
 #include <linux/completion.h>
-#include <asm/prom.h>
+#include <linux/of.h>
+
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/sections.h>
-- 
2.35.1

