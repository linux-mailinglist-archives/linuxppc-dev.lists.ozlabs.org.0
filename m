Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3826757F99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 16:32:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=clYMJlj7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R51d16JLHz3cZC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 00:32:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=clYMJlj7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=7l2b=de=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R51bP0Gsqz3bSt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 00:31:12 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26280615E0;
	Tue, 18 Jul 2023 14:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB62C433C7;
	Tue, 18 Jul 2023 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689690670;
	bh=KFSOdgGe2AR4rCLx81EdF6WoCI+RZt43fQf1DLPQLYg=;
	h=From:To:Cc:Subject:Date:From;
	b=clYMJlj7g8He9tuMGZ8gXMzyV1Xn9XporLTeQxR7cM5i+sjbFBFNpglXf7kgfEOYj
	 fSt3DoxGYG1koXlwohYqsHcAAEPei3NecuG5uRQjzPEphai8TtgsVLv9cBnIDmoWMP
	 yH6B6+xTsmtOX+G17kMUHMEEIQ+fJhlV+41s+ENFHxdXPJmVHobxVfD/MtR+q/5L0V
	 MEijRNwKYh8YzFf00Jzw/khWAXIJmZwERzJMtxfYCOIHQes99tWXExjbdX5/xoUCdJ
	 OuSAGcf4hySbCSH/XjKvNP3On0YXcuIx7F6ewRiUzWAWfY0XkK12xGzm76W2zVgQU0
	 Yk51ZrYmZiqxQ==
Received: (nullmailer pid 1065624 invoked by uid 1000);
	Tue, 18 Jul 2023 14:31:08 -0000
From: Rob Herring <robh@kernel.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Amol Maheshwari <amahesh@qti.qualcomm.com>, Eric Piel <eric.piel@tremplin-utc.net>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Michal Simek <michal.simek@amd.com>, Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>
Subject: [PATCH v2] misc: Explicitly include correct DT includes
Date: Tue, 18 Jul 2023 08:31:01 -0600
Message-Id: <20230718143102.1065481-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
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

Acked-by: Andrew Donnellan <ajd@linux.ibm.com> # cxl
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
- Fix double include of of.h
---
 drivers/misc/cxl/base.c            | 1 +
 drivers/misc/fastrpc.c             | 1 +
 drivers/misc/lis3lv02d/lis3lv02d.c | 2 +-
 drivers/misc/qcom-coincell.c       | 1 -
 drivers/misc/sram.c                | 2 +-
 drivers/misc/vcpu_stall_detector.c | 1 -
 drivers/misc/xilinx_sdfec.c        | 3 ++-
 drivers/misc/xilinx_tmr_inject.c   | 3 ++-
 drivers/misc/xilinx_tmr_manager.c  | 3 ++-
 9 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/cxl/base.c b/drivers/misc/cxl/base.c
index cc0caf9192dc..b054562c046e 100644
--- a/drivers/misc/cxl/base.c
+++ b/drivers/misc/cxl/base.c
@@ -7,6 +7,7 @@
 #include <linux/rcupdate.h>
 #include <asm/errno.h>
 #include <misc/cxl-base.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include "cxl.h"
 
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 9666d28037e1..1c7c0532da6f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/sort.h>
 #include <linux/of_platform.h>
 #include <linux/rpmsg.h>
diff --git a/drivers/misc/lis3lv02d/lis3lv02d.c b/drivers/misc/lis3lv02d/lis3lv02d.c
index 299d316f1bda..49868a45c0ad 100644
--- a/drivers/misc/lis3lv02d/lis3lv02d.c
+++ b/drivers/misc/lis3lv02d/lis3lv02d.c
@@ -26,7 +26,7 @@
 #include <linux/miscdevice.h>
 #include <linux/pm_runtime.h>
 #include <linux/atomic.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include "lis3lv02d.h"
 
 #define DRIVER_NAME     "lis3lv02d"
diff --git a/drivers/misc/qcom-coincell.c b/drivers/misc/qcom-coincell.c
index 54d4f6ee8888..3c57f7429147 100644
--- a/drivers/misc/qcom-coincell.c
+++ b/drivers/misc/qcom-coincell.c
@@ -8,7 +8,6 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 struct qcom_coincell {
diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index 5757adf418b1..a88f92cf35be 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -10,8 +10,8 @@
 #include <linux/genalloc.h>
 #include <linux/io.h>
 #include <linux/list_sort.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/drivers/misc/vcpu_stall_detector.c b/drivers/misc/vcpu_stall_detector.c
index 53b5506080e1..6479c962da1a 100644
--- a/drivers/misc/vcpu_stall_detector.c
+++ b/drivers/misc/vcpu_stall_detector.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/nmi.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/param.h>
 #include <linux/percpu.h>
 #include <linux/platform_device.h>
diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index 270ff4c5971a..29e9c380b643 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -15,7 +15,8 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/poll.h>
 #include <linux/slab.h>
 #include <linux/clk.h>
diff --git a/drivers/misc/xilinx_tmr_inject.c b/drivers/misc/xilinx_tmr_inject.c
index d96f6d7cd109..9fc5835bfebc 100644
--- a/drivers/misc/xilinx_tmr_inject.c
+++ b/drivers/misc/xilinx_tmr_inject.c
@@ -11,7 +11,8 @@
 
 #include <asm/xilinx_mb_manager.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/fault-inject.h>
 
 /* TMR Inject Register offsets */
diff --git a/drivers/misc/xilinx_tmr_manager.c b/drivers/misc/xilinx_tmr_manager.c
index 0ef55e06d3a0..3e4e40c3766f 100644
--- a/drivers/misc/xilinx_tmr_manager.c
+++ b/drivers/misc/xilinx_tmr_manager.c
@@ -15,7 +15,8 @@
 
 #include <asm/xilinx_mb_manager.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 /* TMR Manager Register offsets */
 #define XTMR_MANAGER_CR_OFFSET		0x0
-- 
2.40.1

