Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1544248B424
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 18:39:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYHxd0RHMz3bZ2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 04:39:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VO+7AUmH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=bigunclemax@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VO+7AUmH; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYHwv2Gzsz2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 04:38:37 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id x7so58957649lfu.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 09:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XYYzoRrQ7r+3JpOotxz5TLZg5+kezFddh/tOm+gkJ/E=;
 b=VO+7AUmH236AUGDb7AjgqyhmDVLKPqSpwlxOVzs7tsXwPK0P7VM9FLd1qgG/mw6h6+
 J7n7iuaqOfOfcwJIvevHfCE+ByK0MLuvYslhG9hKA4IBnutDvHGxvwITCMHL9wnOxNR1
 zMVviY+gBjfQpwbRiQ0BUCCcSabRs2aM+roE0RCBguqwYaKdu7PU3y3kj4cJrLqA3rYA
 VTLr7GIJJJ4nOgOfrNdJDMGk0O3OSlkv3p39Z30mKPfkEMZsP9EYqD8nqinjD9eT39uG
 TaOFlZjaryuJ7o8Hhfcauy7IhKk4FU3G0pRhxicgme/zZqHKSwzXS1zplqJUshQ+hQNb
 JY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XYYzoRrQ7r+3JpOotxz5TLZg5+kezFddh/tOm+gkJ/E=;
 b=d7U21Cxz0CLa6al1PmthY5zJritMbV7vZyNwwly6lW62IVxlqLZ52gGj4TbTZoqY64
 KyQvbsAGne0N+xT+KyLi9HTmHUTaxkpAYOmQjWT+mGBczpsHF9gAaR+u6Omx7EIzROPe
 eim+iEK4vlrR6kT2ZCcrGW787z8PDvWeYtJFgfLKusXBc0La7HjgVfClwtIRFLbzh0Rn
 uuYsSa6ia9qKUA/U1xEG1pUJBWsXN3902mLtiwWXTsnXbpygmRFC4YitieRJ18wlPBAY
 e0REVRU2+BsGQtV0iGpvMulfpsKvUr7A7JyTlPqNSscau5FLE/7rS/EyzX9OIlXhgVAS
 BipA==
X-Gm-Message-State: AOAM530fd64ZbFQ46pFn/HPKkGG3CnnxJZIO/zKOjBvzVWTmmB987KEe
 TN7QftoQMz+HoiHgKOsoJPw=
X-Google-Smtp-Source: ABdhPJz17YczZ1GSZFlOG63TSsg8uPrzH5rSR9XRjtlmomJwtUPUnyThDi8aUVXoV962SqM1aNic4Q==
X-Received: by 2002:a19:2d0c:: with SMTP id k12mr4080549lfj.224.1641922712308; 
 Tue, 11 Jan 2022 09:38:32 -0800 (PST)
Received: from localhost.localdomain (host-95-152-62-123.dsl.sura.ru.
 [95.152.62.123])
 by smtp.gmail.com with ESMTPSA id m15sm1392428lfg.291.2022.01.11.09.38.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Jan 2022 09:38:31 -0800 (PST)
From: Maxim <bigunclemax@gmail.com>
To: vladimir.oltean@nxp.com
Subject: [PATCH v2] powerpc: dts: t1040rdb: fix ports names for Seville
 Ethernet switch
Date: Tue, 11 Jan 2022 20:37:23 +0300
Message-Id: <20220111173723.26212-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220111152947.6zvt7j7366wsg6o2@skbuf>
References: <20220111152947.6zvt7j7366wsg6o2@skbuf>
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
 fido_max@inbox.ru, robh+dt@kernel.org, paulus@samba.org, bigunclemax@gmail.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Maxim Kiselev <bigunclemax@gmail.com>

On board rev A, the network interface labels for the switch ports
written on the front panel are different than on rev B and later.

This patch fixes network interface names for the switch ports according
to labels that are written on the front panel of the board rev B.
They start from ETH3 and end at ETH10.

This patch also introduces a separate device tree for rev A.
The main device tree is supposed to cover rev B and later.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts | 30 ++++++++++++++++++++
 arch/powerpc/boot/dts/fsl/t1040rdb.dts       |  8 +++---
 2 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts

diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts b/arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts
new file mode 100644
index 00000000000..2203286b64b
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
+/include/ "t1040rdb.dts"
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
index af0c8a6f561..b6733e7e658 100644
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
2.32.0 (Apple Git-132)

