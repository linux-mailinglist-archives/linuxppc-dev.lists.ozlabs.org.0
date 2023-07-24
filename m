Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF2B7600C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 22:56:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CbrcTxIG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8ssV2G5Sz3bNj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 06:56:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CbrcTxIG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=wclc=dk=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8src5VKNz302R
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 06:56:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 42099613CA;
	Mon, 24 Jul 2023 20:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0476DC433C8;
	Mon, 24 Jul 2023 20:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690232157;
	bh=sj1kweh2LpsGQOuIcSQfoiRzu3VVJ8qGje7Q06bYrI8=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=CbrcTxIG7fZgkh/q4lnmrf/sk2/DyMjd0fD3k1uiiIkDRdTDcES0ew1WyhqJUkGjj
	 1iBbTvlOReHmmQ3ypuXZW+qDGxwV0HUknxMI3vaD+mz011tGowe6JiqaoCe3Jc4tWS
	 /NX6kCpDxfjrnuaHyns5xiwe6JKd0wb7SDi3HYF3VDl2yKuVQpRbirYzYj9iOtD0GP
	 Cg3KATDESJe+VpGTPFurgzUq2z6ikbV2qICmS03xkULxRp6U1ve1UvNU2morIKMMyM
	 ffd3JU0YRLdJP8jlgLxj6CvT4n6gasvftttUt/mOTyMjyfB9IOH1Lezkq8IU1OuNgl
	 uy/jIqRz6DvXg==
Received: (nullmailer pid 768905 invoked by uid 1000);
	Mon, 24 Jul 2023 20:55:55 -0000
From: Rob Herring <robh@kernel.org>
To: soc@kernel.org, Li Yang <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>
Subject: [PATCH v2] soc: fsl: Explicitly include correct DT includes
Date: Mon, 24 Jul 2023 14:55:51 -0600
Message-Id: <20230724205551.768767-1-robh@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
v2:
 - Add qe.c
---
 drivers/soc/fsl/dpaa2-console.c | 3 ++-
 drivers/soc/fsl/qe/qe.c         | 3 ++-
 drivers/soc/fsl/qe/qe_common.c  | 1 -
 drivers/soc/fsl/qe/qe_tdm.c     | 4 +---
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/dpaa2-console.c b/drivers/soc/fsl/dpaa2-console.c
index 53917410f2bd..1dca693b6b38 100644
--- a/drivers/soc/fsl/dpaa2-console.c
+++ b/drivers/soc/fsl/dpaa2-console.c
@@ -9,9 +9,10 @@
 #define pr_fmt(fmt) "dpaa2-console: " fmt
 
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/miscdevice.h>
+#include <linux/platform_device.h>
 #include <linux/uaccess.h>
 #include <linux/slab.h>
 #include <linux/fs.h>
diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index b3c226eb5292..95168b574627 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -25,7 +25,8 @@
 #include <linux/iopoll.h>
 #include <linux/crc32.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <soc/fsl/qe/immap_qe.h>
 #include <soc/fsl/qe/qe.h>
 
diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common.c
index a0cb8e746879..9729ce86db59 100644
--- a/drivers/soc/fsl/qe/qe_common.c
+++ b/drivers/soc/fsl/qe/qe_common.c
@@ -16,7 +16,6 @@
 #include <linux/genalloc.h>
 #include <linux/init.h>
 #include <linux/list.h>
-#include <linux/of_device.h>
 #include <linux/spinlock.h>
 #include <linux/export.h>
 #include <linux/of.h>
diff --git a/drivers/soc/fsl/qe/qe_tdm.c b/drivers/soc/fsl/qe/qe_tdm.c
index 7d7d78d3ee50..a3b691875c8e 100644
--- a/drivers/soc/fsl/qe/qe_tdm.c
+++ b/drivers/soc/fsl/qe/qe_tdm.c
@@ -9,9 +9,7 @@
  */
 #include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <soc/fsl/qe/qe_tdm.h>
 
 static int set_tdm_framer(const char *tdm_framer_type)
-- 
2.40.1

