Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC636B4780
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 15:51:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PY8Bd2fbVz3fb2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 01:51:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.49; helo=mail-ot1-f49.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PY87Y0Zbcz3fQk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 01:48:40 +1100 (AEDT)
Received: by mail-ot1-f49.google.com with SMTP id g6-20020a056830308600b0068d4b30536aso3027325ots.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 06:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vK9rI6mTHq76BhXmDPa7BjkMjKI93uQSgJiPM86yG6U=;
        b=AftkAnZ1XUFFGeRcYSYgJlrsprsO7ORxnTdSXIdJesVY739sIUmrzbUK8aIuYn7EuI
         SDEtGwqAfOtkbhO8jx792tfp9sk840uDr7t18fN1A9f8Uav0cRSEsPRiu1DpsFQ4agHd
         UWvZksBOey+5uycS8jJt+SmgKNpKS4ZNQQKr7Enz7Y3GtyZ+baTBPuC7iluHJOALDCN7
         nmMJRlJ4rG6kl73VvilF9EH0i5LcFcRlVcoUrO++fnXEVkN7BtMMPfPa6V2u1kxl1AM7
         p2tFXxGstjBXuKWc4iRz+/+h7xTItkayB0yO2DuDRlOZ4n4GlnaFEtr3VzuaAkoS1mCA
         IuwQ==
X-Gm-Message-State: AO0yUKUOLSWPf8t2+PILHygcsCf5LjsR7iowQ3qyL5be0yDWwdFfvKbp
	ETMkjh79W710V+gwqQTmg2r5FkeykQ==
X-Google-Smtp-Source: AK7set+EbOmyZ/AksMSYYEuG7lFqQ6jiaAPpDlPQ5Tum+fcZZiV0qWudibu3pk/iibkSVwuFhfXHxg==
X-Received: by 2002:a9d:2e9:0:b0:684:dbfd:f239 with SMTP id 96-20020a9d02e9000000b00684dbfdf239mr1088619otl.9.1678459718677;
        Fri, 10 Mar 2023 06:48:38 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t18-20020a9d7292000000b0068bc476d777sm132335otj.13.2023.03.10.06.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:48:38 -0800 (PST)
Received: (nullmailer pid 1545743 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:27 -0000
From: Rob Herring <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Timur Tabi <timur@kernel.org>
Subject: [PATCH] serial: Use of_property_read_bool() for boolean properties
Date: Fri, 10 Mar 2023 08:47:27 -0600
Message-Id: <20230310144727.1545699-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties.
Convert reading boolean properties to to of_property_read_bool().

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/tty/serial/imx.c       | 14 +++++---------
 drivers/tty/serial/mxs-auart.c |  4 ++--
 drivers/tty/serial/ucc_uart.c  |  2 +-
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 5712a4f29607..be168792b635 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -2262,20 +2262,16 @@ static int imx_uart_probe(struct platform_device *pdev)
 	}
 	sport->port.line = ret;
 
-	if (of_get_property(np, "uart-has-rtscts", NULL) ||
-	    of_get_property(np, "fsl,uart-has-rtscts", NULL) /* deprecated */)
-		sport->have_rtscts = 1;
+	sport->have_rtscts = of_property_read_bool(np, "uart-has-rtscts") ||
+		of_property_read_bool(np, "fsl,uart-has-rtscts"); /* deprecated */
 
-	if (of_get_property(np, "fsl,dte-mode", NULL))
-		sport->dte_mode = 1;
+	sport->dte_mode = of_property_read_bool(np, "fsl,dte-mode");
 
 	sport->have_rtsgpio = of_property_present(np, "rts-gpios");
 
-	if (of_get_property(np, "fsl,inverted-tx", NULL))
-		sport->inverted_tx = 1;
+	sport->inverted_tx = of_property_read_bool(np, "fsl,inverted-tx");
 
-	if (of_get_property(np, "fsl,inverted-rx", NULL))
-		sport->inverted_rx = 1;
+	sport->inverted_rx = of_property_read_bool(np, "fsl,inverted-rx");
 
 	if (!of_property_read_u32_array(np, "fsl,dma-info", dma_buf_conf, 2)) {
 		sport->rx_period_length = dma_buf_conf[0];
diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index ef6e7bb6105c..a368f4293967 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1587,8 +1587,8 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	}
 	s->port.line = ret;
 
-	if (of_get_property(np, "uart-has-rtscts", NULL) ||
-	    of_get_property(np, "fsl,uart-has-rtscts", NULL) /* deprecated */)
+	if (of_property_read_bool(np, "uart-has-rtscts") ||
+	    of_property_read_bool(np, "fsl,uart-has-rtscts") /* deprecated */)
 		set_bit(MXS_AUART_RTSCTS, &s->flags);
 
 	if (s->port.line >= ARRAY_SIZE(auart_port)) {
diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index 32c7a5b43f8e..676840847962 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -1179,7 +1179,7 @@ static int soft_uart_init(struct platform_device *ofdev)
 	struct qe_firmware_info *qe_fw_info;
 	int ret;
 
-	if (of_find_property(np, "soft-uart", NULL)) {
+	if (of_property_read_bool(np, "soft-uart")) {
 		dev_dbg(&ofdev->dev, "using Soft-UART mode\n");
 		soft_uart = 1;
 	} else {
-- 
2.39.2

