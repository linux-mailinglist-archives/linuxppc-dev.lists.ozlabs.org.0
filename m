Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C1D7600D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 23:04:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YDhdpI0R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8t294S5vz3bsR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 07:04:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YDhdpI0R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=wclc=dk=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8t1L0d7Zz302R
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 07:03:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2FBD761263;
	Mon, 24 Jul 2023 21:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8C8C433C8;
	Mon, 24 Jul 2023 21:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690232611;
	bh=Gxnk+k530/MeL69TJxltdRy6gw4MxBZGo39IbW4F1DY=;
	h=From:To:Cc:Subject:Date:From;
	b=YDhdpI0RciRjPfgP5jBXT13H7mqoQXblmhGn7qpvwRnKxyfHZDpLyRCT6BES79UGh
	 Hc/teuadFOpGpkbQWAgHOSbN21aZJwmCP7cx9Vunr4A6KaGtVm7GU3vj2F7hMslN8/
	 WCq6dpFF+EPojIhUmnOMDYwrtJQpz2NGnoydHr2gNZDJZfZQQyF5fMZu6biHeD1xau
	 mSpFpJEHfkBmFD2QpjfmGfA5vTPdhYnRwTBRPQIQ5EGlApTTRXUolEEPRaNuLJn/Wj
	 SbuayusBmZL32as7rpKFxXEg6mApSuDO6eMQQilvkJJtpaLKIR294xos/ahf2h+YKl
	 l6UC/pBaPoUvA==
Received: (nullmailer pid 781440 invoked by uid 1000);
	Mon, 24 Jul 2023 21:03:29 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Scott Wood <oss@buserror.net>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3] powerpc: Explicitly include correct DT includes
Date: Mon, 24 Jul 2023 15:02:42 -0600
Message-Id: <20230724210247.778034-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v3:
- Add 83xx/mpc832x_rdb.c, 85xx/common.c, 86xx/common.c
v2:
- Fix double include of of.h
---
 arch/powerpc/include/asm/ibmebus.h              | 2 ++
 arch/powerpc/include/asm/macio.h                | 3 ++-
 arch/powerpc/kernel/legacy_serial.c             | 2 +-
 arch/powerpc/kernel/of_platform.c               | 4 +---
 arch/powerpc/kernel/setup-common.c              | 4 ++--
 arch/powerpc/kexec/file_load_64.c               | 2 +-
 arch/powerpc/kexec/ranges.c                     | 2 +-
 arch/powerpc/platforms/4xx/cpm.c                | 2 +-
 arch/powerpc/platforms/4xx/hsta_msi.c           | 2 +-
 arch/powerpc/platforms/4xx/soc.c                | 2 +-
 arch/powerpc/platforms/512x/mpc5121_ads.c       | 2 +-
 arch/powerpc/platforms/512x/mpc512x_generic.c   | 2 +-
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c   | 2 +-
 arch/powerpc/platforms/512x/pdm360ng.c          | 3 ++-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c       | 3 +--
 arch/powerpc/platforms/82xx/ep8248e.c           | 1 +
 arch/powerpc/platforms/83xx/km83xx.c            | 4 ++--
 arch/powerpc/platforms/83xx/mpc832x_rdb.c       | 4 +++-
 arch/powerpc/platforms/83xx/suspend.c           | 2 +-
 arch/powerpc/platforms/85xx/bsc913x_qds.c       | 2 +-
 arch/powerpc/platforms/85xx/bsc913x_rdb.c       | 2 +-
 arch/powerpc/platforms/85xx/c293pcie.c          | 3 +--
 arch/powerpc/platforms/85xx/common.c            | 1 +
 arch/powerpc/platforms/85xx/ge_imp3a.c          | 2 +-
 arch/powerpc/platforms/85xx/ksi8560.c           | 3 ++-
 arch/powerpc/platforms/85xx/mpc8536_ds.c        | 2 +-
 arch/powerpc/platforms/85xx/mpc85xx_ds.c        | 2 +-
 arch/powerpc/platforms/85xx/mpc85xx_mds.c       | 4 ++--
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c       | 3 ++-
 arch/powerpc/platforms/85xx/p1010rdb.c          | 2 +-
 arch/powerpc/platforms/85xx/p1022_ds.c          | 2 +-
 arch/powerpc/platforms/85xx/p1022_rdk.c         | 2 +-
 arch/powerpc/platforms/85xx/p1023_rdb.c         | 3 +--
 arch/powerpc/platforms/85xx/socrates.c          | 2 +-
 arch/powerpc/platforms/85xx/socrates_fpga_pic.c | 1 -
 arch/powerpc/platforms/85xx/stx_gp3.c           | 2 +-
 arch/powerpc/platforms/85xx/tqm85xx.c           | 2 +-
 arch/powerpc/platforms/85xx/twr_p102x.c         | 3 ++-
 arch/powerpc/platforms/85xx/xes_mpc85xx.c       | 2 +-
 arch/powerpc/platforms/86xx/common.c            | 3 +++
 arch/powerpc/platforms/86xx/gef_ppc9a.c         | 2 +-
 arch/powerpc/platforms/86xx/gef_sbc310.c        | 2 +-
 arch/powerpc/platforms/86xx/gef_sbc610.c        | 2 +-
 arch/powerpc/platforms/86xx/mvme7100.c          | 1 -
 arch/powerpc/platforms/86xx/pic.c               | 2 +-
 arch/powerpc/platforms/cell/axon_msi.c          | 3 ++-
 arch/powerpc/platforms/cell/cbe_regs.c          | 3 +--
 arch/powerpc/platforms/cell/iommu.c             | 2 +-
 arch/powerpc/platforms/cell/setup.c             | 1 +
 arch/powerpc/platforms/cell/spider-pci.c        | 1 -
 arch/powerpc/platforms/embedded6xx/holly.c      | 2 +-
 arch/powerpc/platforms/maple/setup.c            | 4 ++--
 arch/powerpc/platforms/pasemi/gpio_mdio.c       | 2 +-
 arch/powerpc/platforms/pasemi/setup.c           | 2 ++
 arch/powerpc/platforms/powermac/setup.c         | 2 +-
 arch/powerpc/platforms/powernv/opal-imc.c       | 1 -
 arch/powerpc/platforms/powernv/opal-rtc.c       | 3 ++-
 arch/powerpc/platforms/powernv/opal-secvar.c    | 2 +-
 arch/powerpc/platforms/powernv/opal-sensor.c    | 2 ++
 arch/powerpc/platforms/pseries/ibmebus.c        | 1 +
 arch/powerpc/sysdev/cpm_common.c                | 2 --
 arch/powerpc/sysdev/cpm_gpio.c                  | 3 ++-
 arch/powerpc/sysdev/fsl_pmc.c                   | 4 ++--
 arch/powerpc/sysdev/fsl_rio.c                   | 4 ++--
 arch/powerpc/sysdev/fsl_rmu.c                   | 1 -
 arch/powerpc/sysdev/fsl_soc.c                   | 1 -
 arch/powerpc/sysdev/mpic_msgr.c                 | 3 ++-
 arch/powerpc/sysdev/mpic_timer.c                | 1 -
 arch/powerpc/sysdev/of_rtc.c                    | 4 ++--
 arch/powerpc/sysdev/pmi.c                       | 4 ++--
 70 files changed, 86 insertions(+), 77 deletions(-)

diff --git a/arch/powerpc/include/asm/ibmebus.h b/arch/powerpc/include/asm/ibmebus.h
index 088f95b2e14f..6f33253a364a 100644
--- a/arch/powerpc/include/asm/ibmebus.h
+++ b/arch/powerpc/include/asm/ibmebus.h
@@ -46,6 +46,8 @@
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
 
+struct platform_driver;
+
 extern struct bus_type ibmebus_bus_type;
 
 int ibmebus_register_driver(struct platform_driver *drv);
diff --git a/arch/powerpc/include/asm/macio.h b/arch/powerpc/include/asm/macio.h
index ff5fd82d9ff0..3a07c62973aa 100644
--- a/arch/powerpc/include/asm/macio.h
+++ b/arch/powerpc/include/asm/macio.h
@@ -3,7 +3,8 @@
 #define __MACIO_ASIC_H__
 #ifdef __KERNEL__
 
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 extern struct bus_type macio_bus_type;
 
diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index 6ee65741dbd5..1da2f6e7d2a1 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -5,8 +5,8 @@
 #include <linux/serial_core.h>
 #include <linux/console.h>
 #include <linux/pci.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/serial_reg.h>
 #include <asm/io.h>
diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_platform.c
index f89376ff633e..adc76fa58d1e 100644
--- a/arch/powerpc/kernel/of_platform.c
+++ b/arch/powerpc/kernel/of_platform.c
@@ -13,9 +13,7 @@
 #include <linux/export.h>
 #include <linux/mod_devicetable.h>
 #include <linux/pci.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/atomic.h>
 
 #include <asm/errno.h>
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index d2a446216444..e506699904ec 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -31,9 +31,9 @@
 #include <linux/serial_8250.h>
 #include <linux/percpu.h>
 #include <linux/memblock.h>
-#include <linux/of_irq.h>
+#include <linux/of.h>
 #include <linux/of_fdt.h>
-#include <linux/of_platform.h>
+#include <linux/of_irq.h>
 #include <linux/hugetlb.h>
 #include <linux/pgtable.h>
 #include <asm/io.h>
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 110d28bede2a..7e69be55451a 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -17,7 +17,7 @@
 #include <linux/kexec.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index 5fc53a5fcfdf..fb3e12f15214 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -18,7 +18,7 @@
 
 #include <linux/sort.h>
 #include <linux/kexec.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <asm/sections.h>
 #include <asm/kexec_ranges.h>
diff --git a/arch/powerpc/platforms/4xx/cpm.c b/arch/powerpc/platforms/4xx/cpm.c
index 182e12855c27..670f8ad4465b 100644
--- a/arch/powerpc/platforms/4xx/cpm.c
+++ b/arch/powerpc/platforms/4xx/cpm.c
@@ -18,7 +18,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/sysfs.h>
 #include <linux/cpu.h>
 #include <linux/suspend.h>
diff --git a/arch/powerpc/platforms/4xx/hsta_msi.c b/arch/powerpc/platforms/4xx/hsta_msi.c
index e11b57a62b05..c6bd846b0d65 100644
--- a/arch/powerpc/platforms/4xx/hsta_msi.c
+++ b/arch/powerpc/platforms/4xx/hsta_msi.c
@@ -11,7 +11,7 @@
 #include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/pci.h>
 #include <linux/semaphore.h>
 #include <asm/msi_bitmap.h>
diff --git a/arch/powerpc/platforms/4xx/soc.c b/arch/powerpc/platforms/4xx/soc.c
index ac1cd8b17879..f91df0827877 100644
--- a/arch/powerpc/platforms/4xx/soc.c
+++ b/arch/powerpc/platforms/4xx/soc.c
@@ -15,8 +15,8 @@
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
 
 #include <asm/dcr.h>
 #include <asm/dcr-regs.h>
diff --git a/arch/powerpc/platforms/512x/mpc5121_ads.c b/arch/powerpc/platforms/512x/mpc5121_ads.c
index 80b25ce076bc..a18f85b3ef36 100644
--- a/arch/powerpc/platforms/512x/mpc5121_ads.c
+++ b/arch/powerpc/platforms/512x/mpc5121_ads.c
@@ -10,7 +10,7 @@
 
 #include <linux/kernel.h>
 #include <linux/io.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 
 #include <asm/machdep.h>
 #include <asm/ipic.h>
diff --git a/arch/powerpc/platforms/512x/mpc512x_generic.c b/arch/powerpc/platforms/512x/mpc512x_generic.c
index 97dfaac8f7ff..0d58ab257cd9 100644
--- a/arch/powerpc/platforms/512x/mpc512x_generic.c
+++ b/arch/powerpc/platforms/512x/mpc512x_generic.c
@@ -9,7 +9,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 
 #include <asm/machdep.h>
 #include <asm/ipic.h>
diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
index 1bfb29574caa..6edbbe6918f1 100644
--- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
+++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
@@ -10,9 +10,9 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 #include <asm/mpc5121.h>
 #include <asm/io.h>
 #include <linux/spinlock.h>
diff --git a/arch/powerpc/platforms/512x/pdm360ng.c b/arch/powerpc/platforms/512x/pdm360ng.c
index 4bdec1c25de7..ce51cfeeb066 100644
--- a/arch/powerpc/platforms/512x/pdm360ng.c
+++ b/arch/powerpc/platforms/512x/pdm360ng.c
@@ -7,11 +7,12 @@
  * PDM360NG board setup
  */
 
+#include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/io.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_fdt.h>
-#include <linux/of_platform.h>
 
 #include <asm/machdep.h>
 #include <asm/ipic.h>
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 3fce4e1c3af6..581059527c36 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -48,7 +48,6 @@
  * the output mode.  This driver does not change the output mode setting.
  */
 
-#include <linux/device.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -57,8 +56,8 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
 #include <linux/of_gpio.h>
+#include <linux/platform_device.h>
 #include <linux/kernel.h>
 #include <linux/property.h>
 #include <linux/slab.h>
diff --git a/arch/powerpc/platforms/82xx/ep8248e.c b/arch/powerpc/platforms/82xx/ep8248e.c
index 8f1856ba692e..16808536f788 100644
--- a/arch/powerpc/platforms/82xx/ep8248e.c
+++ b/arch/powerpc/platforms/82xx/ep8248e.c
@@ -13,6 +13,7 @@
 #include <linux/of_mdio.h>
 #include <linux/slab.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/cpm2.h>
diff --git a/arch/powerpc/platforms/83xx/km83xx.c b/arch/powerpc/platforms/83xx/km83xx.c
index 26ddc7136547..2b5d187d9b62 100644
--- a/arch/powerpc/platforms/83xx/km83xx.c
+++ b/arch/powerpc/platforms/83xx/km83xx.c
@@ -20,8 +20,8 @@
 #include <linux/seq_file.h>
 #include <linux/root_dev.h>
 #include <linux/initrd.h>
-#include <linux/of_platform.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
 
 #include <linux/atomic.h>
 #include <linux/time.h>
diff --git a/arch/powerpc/platforms/83xx/mpc832x_rdb.c b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
index 3b4e4173c59e..d523ce0f48db 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
@@ -15,8 +15,10 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/mmc_spi.h>
 #include <linux/mmc/host.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/fsl_devices.h>
 
 #include <asm/time.h>
diff --git a/arch/powerpc/platforms/83xx/suspend.c b/arch/powerpc/platforms/83xx/suspend.c
index 3fa8979ac8a6..9833c36bda83 100644
--- a/arch/powerpc/platforms/83xx/suspend.c
+++ b/arch/powerpc/platforms/83xx/suspend.c
@@ -19,7 +19,7 @@
 #include <linux/fsl_devices.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/export.h>
 
 #include <asm/reg.h>
diff --git a/arch/powerpc/platforms/85xx/bsc913x_qds.c b/arch/powerpc/platforms/85xx/bsc913x_qds.c
index a029aa090538..2eb62bff86d4 100644
--- a/arch/powerpc/platforms/85xx/bsc913x_qds.c
+++ b/arch/powerpc/platforms/85xx/bsc913x_qds.c
@@ -9,7 +9,7 @@
  * Copyright 2014 Freescale Semiconductor Inc.
  */
 
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/pci.h>
 #include <asm/mpic.h>
 #include <sysdev/fsl_soc.h>
diff --git a/arch/powerpc/platforms/85xx/bsc913x_rdb.c b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
index 361b4371d073..161f006cb3bb 100644
--- a/arch/powerpc/platforms/85xx/bsc913x_rdb.c
+++ b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
@@ -7,7 +7,7 @@
  * Copyright 2011-2012 Freescale Semiconductor Inc.
  */
 
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/pci.h>
 #include <asm/mpic.h>
 #include <sysdev/fsl_soc.h>
diff --git a/arch/powerpc/platforms/85xx/c293pcie.c b/arch/powerpc/platforms/85xx/c293pcie.c
index 34975708be79..7a63a3ad5e8a 100644
--- a/arch/powerpc/platforms/85xx/c293pcie.c
+++ b/arch/powerpc/platforms/85xx/c293pcie.c
@@ -7,8 +7,7 @@
 
 #include <linux/stddef.h>
 #include <linux/kernel.h>
-#include <linux/of_fdt.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 
 #include <asm/machdep.h>
 #include <asm/udbg.h>
diff --git a/arch/powerpc/platforms/85xx/common.c b/arch/powerpc/platforms/85xx/common.c
index a554b6d87cf7..757811155587 100644
--- a/arch/powerpc/platforms/85xx/common.c
+++ b/arch/powerpc/platforms/85xx/common.c
@@ -3,6 +3,7 @@
  * Routines common to most mpc85xx-based boards.
  */
 
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 
diff --git a/arch/powerpc/platforms/85xx/ge_imp3a.c b/arch/powerpc/platforms/85xx/ge_imp3a.c
index 3678a1fbf5ad..9c3b44a1952e 100644
--- a/arch/powerpc/platforms/85xx/ge_imp3a.c
+++ b/arch/powerpc/platforms/85xx/ge_imp3a.c
@@ -17,8 +17,8 @@
 #include <linux/delay.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/85xx/ksi8560.c b/arch/powerpc/platforms/85xx/ksi8560.c
index af38c3aec042..1b6326a4b0f2 100644
--- a/arch/powerpc/platforms/85xx/ksi8560.c
+++ b/arch/powerpc/platforms/85xx/ksi8560.c
@@ -18,7 +18,8 @@
 #include <linux/kdev_t.h>
 #include <linux/delay.h>
 #include <linux/seq_file.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/85xx/mpc8536_ds.c b/arch/powerpc/platforms/85xx/mpc8536_ds.c
index 58ab3831913f..e966b2ad8ecd 100644
--- a/arch/powerpc/platforms/85xx/mpc8536_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc8536_ds.c
@@ -12,7 +12,7 @@
 #include <linux/delay.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 4347d629b567..2856148321b3 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -15,8 +15,8 @@
 #include <linux/delay.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_mds.c b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
index 0546f19416c2..c19490cf6376 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_mds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
@@ -26,8 +26,8 @@
 #include <linux/seq_file.h>
 #include <linux/initrd.h>
 #include <linux/fsl_devices.h>
-#include <linux/of_platform.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/phy.h>
 #include <linux/memblock.h>
 #include <linux/fsl/guts.h>
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index c42a68da6dfd..ec9f60fbebc7 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -12,7 +12,8 @@
 #include <linux/delay.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/fsl/guts.h>
 
 #include <asm/time.h>
diff --git a/arch/powerpc/platforms/85xx/p1010rdb.c b/arch/powerpc/platforms/85xx/p1010rdb.c
index 14ec79a32746..10d6f1fa3327 100644
--- a/arch/powerpc/platforms/85xx/p1010rdb.c
+++ b/arch/powerpc/platforms/85xx/p1010rdb.c
@@ -10,7 +10,7 @@
 #include <linux/pci.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/85xx/p1022_ds.c b/arch/powerpc/platforms/85xx/p1022_ds.c
index 23d0926298b9..0dd786a061a6 100644
--- a/arch/powerpc/platforms/85xx/p1022_ds.c
+++ b/arch/powerpc/platforms/85xx/p1022_ds.c
@@ -18,8 +18,8 @@
 
 #include <linux/fsl/guts.h>
 #include <linux/pci.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <asm/div64.h>
 #include <asm/mpic.h>
 #include <asm/swiotlb.h>
diff --git a/arch/powerpc/platforms/85xx/p1022_rdk.c b/arch/powerpc/platforms/85xx/p1022_rdk.c
index d1159150c3b5..25ab6e9c1470 100644
--- a/arch/powerpc/platforms/85xx/p1022_rdk.c
+++ b/arch/powerpc/platforms/85xx/p1022_rdk.c
@@ -14,8 +14,8 @@
 
 #include <linux/fsl/guts.h>
 #include <linux/pci.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <asm/div64.h>
 #include <asm/mpic.h>
 #include <asm/swiotlb.h>
diff --git a/arch/powerpc/platforms/85xx/p1023_rdb.c b/arch/powerpc/platforms/85xx/p1023_rdb.c
index 9df0439a9382..e4fa8731fd2d 100644
--- a/arch/powerpc/platforms/85xx/p1023_rdb.c
+++ b/arch/powerpc/platforms/85xx/p1023_rdb.c
@@ -15,9 +15,8 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/fsl_devices.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
-#include <linux/of_device.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/85xx/socrates.c b/arch/powerpc/platforms/85xx/socrates.c
index 9fa1338bc002..403367b318db 100644
--- a/arch/powerpc/platforms/85xx/socrates.c
+++ b/arch/powerpc/platforms/85xx/socrates.c
@@ -23,7 +23,7 @@
 #include <linux/kdev_t.h>
 #include <linux/delay.h>
 #include <linux/seq_file.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/85xx/socrates_fpga_pic.c b/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
index 3768c86b9629..baa12eff6d5d 100644
--- a/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
+++ b/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
@@ -6,7 +6,6 @@
 #include <linux/irq.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
 #include <linux/io.h>
 
 /*
diff --git a/arch/powerpc/platforms/85xx/stx_gp3.c b/arch/powerpc/platforms/85xx/stx_gp3.c
index 5e2646b4c039..c10efc45894c 100644
--- a/arch/powerpc/platforms/85xx/stx_gp3.c
+++ b/arch/powerpc/platforms/85xx/stx_gp3.c
@@ -22,7 +22,7 @@
 #include <linux/kdev_t.h>
 #include <linux/delay.h>
 #include <linux/seq_file.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/85xx/tqm85xx.c b/arch/powerpc/platforms/85xx/tqm85xx.c
index 80effb028bf4..6be1b9809db6 100644
--- a/arch/powerpc/platforms/85xx/tqm85xx.c
+++ b/arch/powerpc/platforms/85xx/tqm85xx.c
@@ -20,7 +20,7 @@
 #include <linux/kdev_t.h>
 #include <linux/delay.h>
 #include <linux/seq_file.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/85xx/twr_p102x.c b/arch/powerpc/platforms/85xx/twr_p102x.c
index b88e23a334a4..c0a0456f1674 100644
--- a/arch/powerpc/platforms/85xx/twr_p102x.c
+++ b/arch/powerpc/platforms/85xx/twr_p102x.c
@@ -13,7 +13,8 @@
 #include <linux/errno.h>
 #include <linux/fsl/guts.h>
 #include <linux/pci.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
 
 #include <asm/pci-bridge.h>
 #include <asm/udbg.h>
diff --git a/arch/powerpc/platforms/85xx/xes_mpc85xx.c b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
index 184013e6601e..45f257fc1ade 100644
--- a/arch/powerpc/platforms/85xx/xes_mpc85xx.c
+++ b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
@@ -16,8 +16,8 @@
 #include <linux/delay.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/86xx/common.c b/arch/powerpc/platforms/86xx/common.c
index 0069d38263e7..a4a550527609 100644
--- a/arch/powerpc/platforms/86xx/common.c
+++ b/arch/powerpc/platforms/86xx/common.c
@@ -3,7 +3,10 @@
  * Routines common to most mpc86xx-based boards.
  */
 
+#include <linux/init.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of_platform.h>
+#include <asm/reg.h>
 #include <asm/synch.h>
 
 #include "mpc86xx.h"
diff --git a/arch/powerpc/platforms/86xx/gef_ppc9a.c b/arch/powerpc/platforms/86xx/gef_ppc9a.c
index f0512e51300c..f7f98cca7b91 100644
--- a/arch/powerpc/platforms/86xx/gef_ppc9a.c
+++ b/arch/powerpc/platforms/86xx/gef_ppc9a.c
@@ -18,8 +18,8 @@
 #include <linux/kdev_t.h>
 #include <linux/delay.h>
 #include <linux/seq_file.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/86xx/gef_sbc310.c b/arch/powerpc/platforms/86xx/gef_sbc310.c
index 1430b524d982..689835f7f088 100644
--- a/arch/powerpc/platforms/86xx/gef_sbc310.c
+++ b/arch/powerpc/platforms/86xx/gef_sbc310.c
@@ -18,8 +18,8 @@
 #include <linux/kdev_t.h>
 #include <linux/delay.h>
 #include <linux/seq_file.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/86xx/gef_sbc610.c b/arch/powerpc/platforms/86xx/gef_sbc610.c
index c92af0d964e1..365f511186ca 100644
--- a/arch/powerpc/platforms/86xx/gef_sbc610.c
+++ b/arch/powerpc/platforms/86xx/gef_sbc610.c
@@ -18,8 +18,8 @@
 #include <linux/kdev_t.h>
 #include <linux/delay.h>
 #include <linux/seq_file.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/86xx/mvme7100.c b/arch/powerpc/platforms/86xx/mvme7100.c
index c0ac40514361..cee49ecd32d2 100644
--- a/arch/powerpc/platforms/86xx/mvme7100.c
+++ b/arch/powerpc/platforms/86xx/mvme7100.c
@@ -20,7 +20,6 @@
 #include <linux/pci.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
-#include <linux/of_platform.h>
 #include <linux/of_address.h>
 #include <asm/udbg.h>
 #include <asm/mpic.h>
diff --git a/arch/powerpc/platforms/86xx/pic.c b/arch/powerpc/platforms/86xx/pic.c
index 2c32c3488afb..5c7bd925653d 100644
--- a/arch/powerpc/platforms/86xx/pic.c
+++ b/arch/powerpc/platforms/86xx/pic.c
@@ -6,8 +6,8 @@
 #include <linux/stddef.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
 
 #include <asm/mpic.h>
 #include <asm/i8259.h>
diff --git a/arch/powerpc/platforms/cell/axon_msi.c b/arch/powerpc/platforms/cell/axon_msi.c
index 106000449d3b..28dc86744cac 100644
--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -10,10 +10,11 @@
 #include <linux/pci.h>
 #include <linux/msi.h>
 #include <linux/export.h>
-#include <linux/of_platform.h>
 #include <linux/slab.h>
 #include <linux/debugfs.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 
 #include <asm/dcr.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/cell/cbe_regs.c b/arch/powerpc/platforms/cell/cbe_regs.c
index fb4023f9ea6b..99b3558753e9 100644
--- a/arch/powerpc/platforms/cell/cbe_regs.c
+++ b/arch/powerpc/platforms/cell/cbe_regs.c
@@ -10,9 +10,8 @@
 #include <linux/percpu.h>
 #include <linux/types.h>
 #include <linux/export.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
 #include <linux/pgtable.h>
 
 #include <asm/io.h>
diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
index 8c7133039566..1202a69b0a20 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -16,7 +16,7 @@
 #include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/memblock.h>
 
diff --git a/arch/powerpc/platforms/cell/setup.c b/arch/powerpc/platforms/cell/setup.c
index 9e07d101bcee..f64a1ef98aa8 100644
--- a/arch/powerpc/platforms/cell/setup.c
+++ b/arch/powerpc/platforms/cell/setup.c
@@ -27,6 +27,7 @@
 #include <linux/mutex.h>
 #include <linux/memory_hotplug.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include <asm/mmu.h>
 #include <asm/processor.h>
diff --git a/arch/powerpc/platforms/cell/spider-pci.c b/arch/powerpc/platforms/cell/spider-pci.c
index e36ebd84f55b..68439445b1c3 100644
--- a/arch/powerpc/platforms/cell/spider-pci.c
+++ b/arch/powerpc/platforms/cell/spider-pci.c
@@ -9,7 +9,6 @@
 
 #include <linux/kernel.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 
diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index 02ff260ae1ee..ce9e58ee9754 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -22,9 +22,9 @@
 #include <linux/serial.h>
 #include <linux/tty.h>
 #include <linux/serial_core.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
 #include <linux/extable.h>
 
 #include <asm/time.h>
diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
index a4a79d77eca2..665d37e437ce 100644
--- a/arch/powerpc/platforms/maple/setup.c
+++ b/arch/powerpc/platforms/maple/setup.c
@@ -3,7 +3,7 @@
  *  Maple (970 eval board) setup code
  *
  *  (c) Copyright 2004 Benjamin Herrenschmidt (benh@kernel.crashing.org),
- *                     IBM Corp. 
+ *                     IBM Corp.
  */
 
 #undef DEBUG
@@ -36,8 +36,8 @@
 #include <linux/serial.h>
 #include <linux/smp.h>
 #include <linux/bitops.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/memblock.h>
 
 #include <asm/processor.h>
diff --git a/arch/powerpc/platforms/pasemi/gpio_mdio.c b/arch/powerpc/platforms/pasemi/gpio_mdio.c
index 913b77b92cea..fd130fe7a65a 100644
--- a/arch/powerpc/platforms/pasemi/gpio_mdio.c
+++ b/arch/powerpc/platforms/pasemi/gpio_mdio.c
@@ -20,7 +20,7 @@
 #include <linux/phy.h>
 #include <linux/of_address.h>
 #include <linux/of_mdio.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #define DELAY 1
 
diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/pasemi/setup.c
index 5c5b4a034f9e..ef985ba2bf21 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -16,7 +16,9 @@
 #include <linux/console.h>
 #include <linux/export.h>
 #include <linux/pci.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/gfp.h>
 #include <linux/irqdomain.h>
 
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 0c41f4b005bc..6de1cd5d8a58 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -45,7 +45,7 @@
 #include <linux/root_dev.h>
 #include <linux/bitops.h>
 #include <linux/suspend.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 
 #include <asm/reg.h>
diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
index 348a8cdaecd6..828fc4d88471 100644
--- a/arch/powerpc/platforms/powernv/opal-imc.c
+++ b/arch/powerpc/platforms/powernv/opal-imc.c
@@ -11,7 +11,6 @@
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <linux/crash_dump.h>
 #include <linux/debugfs.h>
 #include <asm/opal.h>
diff --git a/arch/powerpc/platforms/powernv/opal-rtc.c b/arch/powerpc/platforms/powernv/opal-rtc.c
index a9bcf9217e64..79011a263aa6 100644
--- a/arch/powerpc/platforms/powernv/opal-rtc.c
+++ b/arch/powerpc/platforms/powernv/opal-rtc.c
@@ -11,8 +11,9 @@
 #include <linux/bcd.h>
 #include <linux/rtc.h>
 #include <linux/delay.h>
-#include <linux/platform_device.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include <asm/opal.h>
 #include <asm/firmware.h>
diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c b/arch/powerpc/platforms/powernv/opal-secvar.c
index a8436bf35e2f..6ac410f4d3c7 100644
--- a/arch/powerpc/platforms/powernv/opal-secvar.c
+++ b/arch/powerpc/platforms/powernv/opal-secvar.c
@@ -12,8 +12,8 @@
 #define pr_fmt(fmt) "secvar: "fmt
 
 #include <linux/types.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/of_platform.h>
 #include <asm/opal.h>
 #include <asm/secvar.h>
 #include <asm/secure_boot.h>
diff --git a/arch/powerpc/platforms/powernv/opal-sensor.c b/arch/powerpc/platforms/powernv/opal-sensor.c
index 3192c614a1e1..8880a1c14573 100644
--- a/arch/powerpc/platforms/powernv/opal-sensor.c
+++ b/arch/powerpc/platforms/powernv/opal-sensor.c
@@ -6,7 +6,9 @@
  */
 
 #include <linux/delay.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <asm/opal.h>
 #include <asm/machdep.h>
 
diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/platforms/pseries/ibmebus.c
index da7eccaeac63..5848f2a08750 100644
--- a/arch/powerpc/platforms/pseries/ibmebus.c
+++ b/arch/powerpc/platforms/pseries/ibmebus.c
@@ -46,6 +46,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/stat.h>
 #include <asm/ibmebus.h>
diff --git a/arch/powerpc/sysdev/cpm_common.c b/arch/powerpc/sysdev/cpm_common.c
index 8234013a8772..47db732981a8 100644
--- a/arch/powerpc/sysdev/cpm_common.c
+++ b/arch/powerpc/sysdev/cpm_common.c
@@ -15,11 +15,9 @@
  */
 
 #include <linux/init.h>
-#include <linux/of_device.h>
 #include <linux/spinlock.h>
 #include <linux/export.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/slab.h>
 
 #include <asm/udbg.h>
diff --git a/arch/powerpc/sysdev/cpm_gpio.c b/arch/powerpc/sysdev/cpm_gpio.c
index 0695d26bd301..40f57111e93e 100644
--- a/arch/powerpc/sysdev/cpm_gpio.c
+++ b/arch/powerpc/sysdev/cpm_gpio.c
@@ -9,7 +9,8 @@
  */
 
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/cpm.h>
 #ifdef CONFIG_8xx_GPIO
diff --git a/arch/powerpc/sysdev/fsl_pmc.c b/arch/powerpc/sysdev/fsl_pmc.c
index 76896de970ca..9f6dd11c1344 100644
--- a/arch/powerpc/sysdev/fsl_pmc.c
+++ b/arch/powerpc/sysdev/fsl_pmc.c
@@ -13,9 +13,9 @@
 #include <linux/export.h>
 #include <linux/suspend.h>
 #include <linux/delay.h>
-#include <linux/device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 struct pmc_regs {
 	__be32 devdisr;
diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index 0331962bc6d2..efd8f6291ea6 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -23,10 +23,10 @@
 #include <linux/types.h>
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
-#include <linux/device.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 
diff --git a/arch/powerpc/sysdev/fsl_rmu.c b/arch/powerpc/sysdev/fsl_rmu.c
index c1f724973589..58221b6e1465 100644
--- a/arch/powerpc/sysdev/fsl_rmu.c
+++ b/arch/powerpc/sysdev/fsl_rmu.c
@@ -25,7 +25,6 @@
 #include <linux/interrupt.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
 #include <linux/slab.h>
 
 #include "fsl_rio.h"
diff --git a/arch/powerpc/sysdev/fsl_soc.c b/arch/powerpc/sysdev/fsl_soc.c
index 68709743450e..e71b3ede147e 100644
--- a/arch/powerpc/sysdev/fsl_soc.c
+++ b/arch/powerpc/sysdev/fsl_soc.c
@@ -19,7 +19,6 @@
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/phy.h>
 #include <linux/spi/spi.h>
 #include <linux/fsl_devices.h>
diff --git a/arch/powerpc/sysdev/mpic_msgr.c b/arch/powerpc/sysdev/mpic_msgr.c
index 1a3ac0b5dd89..7b449cc51aef 100644
--- a/arch/powerpc/sysdev/mpic_msgr.c
+++ b/arch/powerpc/sysdev/mpic_msgr.c
@@ -7,9 +7,10 @@
  */
 
 #include <linux/list.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/export.h>
diff --git a/arch/powerpc/sysdev/mpic_timer.c b/arch/powerpc/sysdev/mpic_timer.c
index b2f0a73e8f93..7166e2e0baaf 100644
--- a/arch/powerpc/sysdev/mpic_timer.c
+++ b/arch/powerpc/sysdev/mpic_timer.c
@@ -16,7 +16,6 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/syscore_ops.h>
 #include <sysdev/fsl_soc.h>
diff --git a/arch/powerpc/sysdev/of_rtc.c b/arch/powerpc/sysdev/of_rtc.c
index 420f949b7485..2211937d3788 100644
--- a/arch/powerpc/sysdev/of_rtc.c
+++ b/arch/powerpc/sysdev/of_rtc.c
@@ -5,10 +5,10 @@
  * Copyright 2007 David Gibson <dwg@au1.ibm.com>, IBM Corporation.
  */
 #include <linux/kernel.h>
-#include <linux/of.h>
 #include <linux/init.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 
 #include <asm/prom.h>
diff --git a/arch/powerpc/sysdev/pmi.c b/arch/powerpc/sysdev/pmi.c
index 9dabb50c36eb..fcf8d1516210 100644
--- a/arch/powerpc/sysdev/pmi.c
+++ b/arch/powerpc/sysdev/pmi.c
@@ -16,11 +16,11 @@
 #include <linux/completion.h>
 #include <linux/spinlock.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/workqueue.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/pmi.h>
-- 
2.40.1

