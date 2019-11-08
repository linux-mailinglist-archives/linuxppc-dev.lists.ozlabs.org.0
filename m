Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD50F4ED2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 16:00:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478k365HDxzF6Rh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 02:00:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="aPlA/IoE"; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gQr168QzF6tP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:02:12 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id v8so4386308lfa.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D4oV4L5jtcWTxjf1oA8VyXP7dsMMZPn/dF9MUNC7L/c=;
 b=aPlA/IoEhffEEFblnc9V412rJ8ksNjaxqTklchpJf/K3W357zmqd5+CvTMVOjUGR9f
 vHpBOP8gHlMWtsf0tBnmICEexywoHMojiuEDFPSR7FbopkcwuW99c0TFG3mLnJli/rDJ
 uIN1m9iOBe+LG2yqEIrL2SRuPet7yWk+uHSH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D4oV4L5jtcWTxjf1oA8VyXP7dsMMZPn/dF9MUNC7L/c=;
 b=DWKTWavihiIH8jI72kXSb8Cdj50AfG+W8dapx6xKQ4wJd1U7YEAPjzF++wMAQSR/8D
 pHf3X2CE3Q/xy10zGjmxqeXyI262qP8rKDHpkmfXDHh9+BvDbmA9DmrKrU/q/CADX9i4
 AtxZrdEjScf/EaGftuaZHEqhG3LlyX98oEgp1fxDN7vurWtJZaLjBJ3tIgw7W/gVxs98
 qOwpSxdYsi6KB2whxbSgphivwnoIUo4t6E4Rt6OpKNRAO8wWcDJdU9mFidEAeL2DC04z
 yWdNiAuaCwK+dwarMjILFMfUfrOnYf2XaLYRqM6KCLXQT5T2irm1y5wnmbXSsIfwSa61
 mtfg==
X-Gm-Message-State: APjAAAVOEXnZnEMHmWxnCLVRTceXOT2BZeRbdDheK73R6cG4eHpish8c
 y/6Z4Y8iv1nFg9R6r6tAo2U8Rw==
X-Google-Smtp-Source: APXvYqx/gMz4mkd5jKISKNXvWqvyaBmxQjDUwz3+6YpcYYTuJ8t1hWtanWE3i6cbS5YimIzMWNnZtg==
X-Received: by 2002:a19:911c:: with SMTP id t28mr6379304lfd.84.1573218128817; 
 Fri, 08 Nov 2019 05:02:08 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:02:08 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 32/47] serial: ucc_uart: use of_property_read_u32() in
 ucc_uart_probe()
Date: Fri,  8 Nov 2019 14:01:08 +0100
Message-Id: <20191108130123.6839-33-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
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
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For this to work correctly on little-endian hosts, don't access the
device-tree properties directly in native endianness, but use the
of_property_read_u32() helper.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/tty/serial/ucc_uart.c | 41 +++++++++++++++--------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index 313697842e24..f5ea84928a3b 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -1256,10 +1256,10 @@ static int soft_uart_init(struct platform_device *ofdev)
 static int ucc_uart_probe(struct platform_device *ofdev)
 {
 	struct device_node *np = ofdev->dev.of_node;
-	const unsigned int *iprop;      /* Integer OF properties */
 	const char *sprop;      /* String OF properties */
 	struct uart_qe_port *qe_port = NULL;
 	struct resource res;
+	u32 val;
 	int ret;
 
 	/*
@@ -1290,23 +1290,19 @@ static int ucc_uart_probe(struct platform_device *ofdev)
 
 	/* Get the UCC number (device ID) */
 	/* UCCs are numbered 1-7 */
-	iprop = of_get_property(np, "cell-index", NULL);
-	if (!iprop) {
-		iprop = of_get_property(np, "device-id", NULL);
-		if (!iprop) {
-			dev_err(&ofdev->dev, "UCC is unspecified in "
-				"device tree\n");
-			ret = -EINVAL;
-			goto out_free;
-		}
+	if (of_property_read_u32(np, "cell-index", &val) &&
+	    of_property_read_u32(np, "device-id", &val)) {
+		dev_err(&ofdev->dev, "UCC is unspecified in device tree\n");
+		ret = -EINVAL;
+		goto out_free;
 	}
 
-	if ((*iprop < 1) || (*iprop > UCC_MAX_NUM)) {
-		dev_err(&ofdev->dev, "no support for UCC%u\n", *iprop);
+	if (val < 1 || val > UCC_MAX_NUM) {
+		dev_err(&ofdev->dev, "no support for UCC%u\n", val);
 		ret = -ENODEV;
 		goto out_free;
 	}
-	qe_port->ucc_num = *iprop - 1;
+	qe_port->ucc_num = val - 1;
 
 	/*
 	 * In the future, we should not require the BRG to be specified in the
@@ -1350,13 +1346,12 @@ static int ucc_uart_probe(struct platform_device *ofdev)
 	}
 
 	/* Get the port number, numbered 0-3 */
-	iprop = of_get_property(np, "port-number", NULL);
-	if (!iprop) {
+	if (of_property_read_u32(np, "port-number", &val)) {
 		dev_err(&ofdev->dev, "missing port-number in device tree\n");
 		ret = -EINVAL;
 		goto out_free;
 	}
-	qe_port->port.line = *iprop;
+	qe_port->port.line = val;
 	if (qe_port->port.line >= UCC_MAX_UART) {
 		dev_err(&ofdev->dev, "port-number must be 0-%u\n",
 			UCC_MAX_UART - 1);
@@ -1386,31 +1381,29 @@ static int ucc_uart_probe(struct platform_device *ofdev)
 		}
 	}
 
-	iprop = of_get_property(np, "brg-frequency", NULL);
-	if (!iprop) {
+	if (of_property_read_u32(np, "brg-frequency", &val)) {
 		dev_err(&ofdev->dev,
 		       "missing brg-frequency in device tree\n");
 		ret = -EINVAL;
 		goto out_np;
 	}
 
-	if (*iprop)
-		qe_port->port.uartclk = *iprop;
+	if (val)
+		qe_port->port.uartclk = val;
 	else {
 		/*
 		 * Older versions of U-Boot do not initialize the brg-frequency
 		 * property, so in this case we assume the BRG frequency is
 		 * half the QE bus frequency.
 		 */
-		iprop = of_get_property(np, "bus-frequency", NULL);
-		if (!iprop) {
+		if (of_property_read_u32(np, "bus-frequency", &val)) {
 			dev_err(&ofdev->dev,
 				"missing QE bus-frequency in device tree\n");
 			ret = -EINVAL;
 			goto out_np;
 		}
-		if (*iprop)
-			qe_port->port.uartclk = *iprop / 2;
+		if (val)
+			qe_port->port.uartclk = val / 2;
 		else {
 			dev_err(&ofdev->dev,
 				"invalid QE bus-frequency in device tree\n");
-- 
2.23.0

