Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DDD495C9C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 10:16:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgDJb4DRGz3cC7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 20:16:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DViKZjc0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=bigunclemax@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DViKZjc0; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgDHx4W6gz2xXV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 20:15:40 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id b14so31812998lff.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 01:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fusO5f+lHxDaOb0VSmz+4+tHP16TPs0f0afJOTsfjE4=;
 b=DViKZjc0KCTHv8wOQQlnN6CuLmc8/xCiTlBVbrBCFEvqKQzBDQYosVt2+/Ecl7Q817
 RoC4J/Q5lv0vWa6QvOH48BRboPuiGcGLZumd2rIG5tv2m0EniL9p6YQUhHlAzSD7NYLD
 fE/Yg7IYVLXyrobpPbguB2YBZTUI3MgbfS2fnE+6MstwCkC8kDwxxRmzg9JjKoMfpbTl
 Rd9+pTuaFPueeJJYDuxQNVIKmGiGo2Jop7LGxmMhvo58MviMwiZx9vbtMAkNazSOd2gY
 Mb7kkGpBzGgN12B06GuH9c0lxQFpqBO4ZkuxDkLt1PPj5ZY/b2cdlwR8NrosG8tMmmQv
 CUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fusO5f+lHxDaOb0VSmz+4+tHP16TPs0f0afJOTsfjE4=;
 b=QhWd+Ei8CweCgzGPYv7SPvnlpLN0JtnM9UnfbMZSff4eYmFDfBfi8Y75JS3IK15gr+
 D4Uq9znZ/LeHigA3989K8SZLH2vdx0jF5vhC0jm9KqVJl9QW+YSZBTzns0gmLouX+uI2
 4eNh7noLqXinDtkDKjKCFZnzm/SQOuhALg14FJ8wxLsfIcvU/FE5oXIf4Xw92Zkeb1ub
 OOeVAQPOq+tgEW+AWwcSZuo5UyfJkfW5CohJfjL/1jthyy7n/lVkEuGWpOT0ECTRdlJj
 2rJ+ryz/5S5ZxGYGmHRbnp768GcAtBlRcxLtjz9WfRYvwIS/ZTBy8x5rtvYdBmp22DTf
 2l4g==
X-Gm-Message-State: AOAM531obzCZygsoQybWx+ol2wRj4v2I7JIWq3Zv+yU2ztFYE58W5xZJ
 3QhtKs+BT29TAkDuzxp1Khk=
X-Google-Smtp-Source: ABdhPJyq/AiVI/98A8fQ3Rfe6G7qDquOCgOGLHmgUGcerpGxZXW4bSGIamkROJRIV2WfGF5ar6fwkg==
X-Received: by 2002:a19:7914:: with SMTP id u20mr3088831lfc.325.1642756534107; 
 Fri, 21 Jan 2022 01:15:34 -0800 (PST)
Received: from localhost.localdomain ([185.6.236.169])
 by smtp.googlemail.com with ESMTPSA id m2sm191429lfh.163.2022.01.21.01.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 01:15:33 -0800 (PST)
From: Maxim Kiselev <bigunclemax@gmail.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3] powerpc: dts: t1040rdb: fix ports names for Seville
 Ethernet switch
Date: Fri, 21 Jan 2022 12:14:47 +0300
Message-Id: <20220121091447.3412907-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <87czkmudh0.fsf@mpe.ellerman.id.au>
References: <87czkmudh0.fsf@mpe.ellerman.id.au>
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
Cc: andrew@lunn.ch, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fido_max@inbox.ru, robh+dt@kernel.org, paulus@samba.org,
 vladimir.oltean@nxp.com, bigunclemax@gmail.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On board rev A, the network interface labels for the switch ports
written on the front panel are different than on rev B and later.

This patch fixes network interface names for the switch ports according
to labels that are written on the front panel of the board rev B.
They start from ETH3 and end at ETH10.

This patch also introduces a separate device tree for rev A.
The main device tree is supposed to cover rev B and later.

Fixes: e69eb0824d8c ("powerpc: dts: t1040rdb: add ports for Seville Ethernet switch")
Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Here is the fix for the error in t1040rdb-rev-a.dts caused by containing '#include' directive inside '/include/'
---
 arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts | 30 ++++++++++++++++++++
 arch/powerpc/boot/dts/fsl/t1040rdb.dts       |  8 +++---
 2 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts

diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts b/arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts
new file mode 100644
index 0000000000000..73f8c998c64df
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * T1040RDB-REV-A Device Tree Source
+ *
+ * Copyright 2014 - 2015 Freescale Semiconductor Inc.
+ *
+ */
+
+#include "t1040rdb.dts"
+
+/ {
+	model = "fsl,T1040RDB-REV-A";
+	compatible = "fsl,T1040RDB-REV-A";
+};
+
+&seville_port0 {
+	label = "ETH5";
+};
+
+&seville_port2 {
+	label = "ETH7";
+};
+
+&seville_port4 {
+	label = "ETH9";
+};
+
+&seville_port6 {
+	label = "ETH11";
+};
diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb.dts b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
index af0c8a6f56138..b6733e7e65805 100644
--- a/arch/powerpc/boot/dts/fsl/t1040rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
@@ -119,7 +119,7 @@ &seville_port0 {
 	managed = "in-band-status";
 	phy-handle = <&phy_qsgmii_0>;
 	phy-mode = "qsgmii";
-	label = "ETH5";
+	label = "ETH3";
 	status = "okay";
 };
 
@@ -135,7 +135,7 @@ &seville_port2 {
 	managed = "in-band-status";
 	phy-handle = <&phy_qsgmii_2>;
 	phy-mode = "qsgmii";
-	label = "ETH7";
+	label = "ETH5";
 	status = "okay";
 };
 
@@ -151,7 +151,7 @@ &seville_port4 {
 	managed = "in-band-status";
 	phy-handle = <&phy_qsgmii_4>;
 	phy-mode = "qsgmii";
-	label = "ETH9";
+	label = "ETH7";
 	status = "okay";
 };
 
@@ -167,7 +167,7 @@ &seville_port6 {
 	managed = "in-band-status";
 	phy-handle = <&phy_qsgmii_6>;
 	phy-mode = "qsgmii";
-	label = "ETH11";
+	label = "ETH9";
 	status = "okay";
 };
 
-- 
2.32.0

