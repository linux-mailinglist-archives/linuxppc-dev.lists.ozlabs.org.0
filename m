Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1DC754162
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 19:52:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2fFc5chYz3cdM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 03:52:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.49; helo=mail-io1-f49.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2fF75Kqtz3c5P
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jul 2023 03:52:11 +1000 (AEST)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-78372625badso83219539f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 10:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357129; x=1691949129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+dvAcOgxDmgmtJaKkp391KUSnHq6CxLLiwJgC4XldE=;
        b=VcCYeIaRJjyrAiDXaXN8ilhwXGbBow2Kn0z5k3JS4wT/dtILRoJSfdaj4LGeCZCmlx
         W//wXbbuYm61R4HOelh24f1kbFL5Mo9yj5pQufvFeAc6C1NMCeVMAAocWcvd0KKcaWWl
         7vvFNU9dhRmVoRtp+t5kkrWvllNtVCSw6pSxwr88FZW8Wh7n2yFHNVQwqisXsBIFlmco
         c1nVDF97lPqkV1DCIvbvCbs0uFm69IncQOjLJjMR8GlPKpFusSSSwypkJfEt+OLEg34L
         lsiqeuQFc44HC9g/jNN8/rvA2YqTGKW5XAFAz198UlDrImETkaReK9sxqIiYzbqxB7f8
         j3hw==
X-Gm-Message-State: ABy/qLaXMuPQQAGueoLECA0B3WGELAZCFT3/LAU1cvrZga6RdVD/s2Jz
	b4CAZg91/uP3l2vj6IS6EHKbkeOCdY/8
X-Google-Smtp-Source: APBJJlHohBxe7Qp0+ZNeCvGssF6Gz6tQJIdtFT2lCWyZlAxy09JjZeeEjqhLOZQKLkUtF1Hiy/Gi/A==
X-Received: by 2002:a5d:9810:0:b0:783:72d4:8c38 with SMTP id a16-20020a5d9810000000b0078372d48c38mr5516566iol.13.1689357128804;
        Fri, 14 Jul 2023 10:52:08 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id cg5-20020a056602254500b0078335414ddesm2866650iob.26.2023.07.14.10.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:52:08 -0700 (PDT)
Received: (nullmailer pid 4067402 invoked by uid 1000);
	Fri, 14 Jul 2023 17:51:33 -0000
From: Rob Herring <robh@kernel.org>
To: Li Yang <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>
Subject: [PATCH] soc: fsl: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:51:31 -0600
Message-Id: <20230714175131.4067339-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
 drivers/soc/fsl/dpaa2-console.c | 3 ++-
 drivers/soc/fsl/qe/qe_common.c  | 1 -
 drivers/soc/fsl/qe/qe_tdm.c     | 4 +---
 3 files changed, 3 insertions(+), 5 deletions(-)

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

