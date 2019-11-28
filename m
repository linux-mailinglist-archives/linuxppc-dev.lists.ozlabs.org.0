Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A328E10CCD1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 17:28:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P33c07zYzDr3S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 03:28:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="WL+NyXT4"; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P1320nZqzDqrM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:57:50 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id n21so28798660ljg.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lk3laNSvKrksBmzvW1+vBhhKfEZjlULs2tdXrxvrw9M=;
 b=WL+NyXT4PE96r/aFfykz6rJ/jSO5ngXrbuEXhHV2hvCO2pLlE226VK6kJOehz+jQDF
 aLFIJFEAZY+IOodG+ekGt6hgWrjisce5XzijEQcM5TRjGF3DmtuQDgzP9yT52SmHQvQE
 +CXBMdpP8v47QFJKPuUJL3H7gaGIy0wI6SElg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lk3laNSvKrksBmzvW1+vBhhKfEZjlULs2tdXrxvrw9M=;
 b=Q8sBUFtWHWjVR6Waa9C484Dz2Ix8tfkC4j+2WwTQuJLq/PKXoc92rW5R4myE6FGRUD
 JRxOLf7jRWzApSEQ1raLKhkAQfB4uQgfYZ2qn/xAX1dd4sdwyv1nv4Jaa9tOP3HjsDo1
 piQtL4dwPVl1ApsuwboqvS7ObMcBc4K67vzn5oCy9NzqqMfxvpq80sPVmTbDsgzHvBV/
 /9BlZ1Kz/mF+63EkRwgLG3r9Wr3uxhdKUwP4OYnPUjOd1rVcwFgsSRWZDYsC7RYBzF5h
 E7QY+PnXr3o5sHUpgPxzhAWLjrhtvb5/tW+xRpKMAi7o4a3ZdJJHhVj179Ke3Nn8ZclN
 WJEg==
X-Gm-Message-State: APjAAAWNytxxCulzNCi5qcl0p83sG3ZYPrAC+d2ul+JT7gtQJMJKrTtu
 h+v4F1qhZNrdnq9RXp2YM/aAuw==
X-Google-Smtp-Source: APXvYqzWZGc7U6YNYIXxabBpQROWk46uY46htczHX91iAC5ZJJaEArYMvILp8Ju6zSpngcewVqC5vw==
X-Received: by 2002:a2e:8ed1:: with SMTP id e17mr10842604ljl.52.1574953066298; 
 Thu, 28 Nov 2019 06:57:46 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:45 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 31/49] serial: ucc_uart: stub out soft_uart_init for
 !CONFIG_PPC32
Date: Thu, 28 Nov 2019 15:55:36 +0100
Message-Id: <20191128145554.1297-32-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Soft UART hack is only needed for some PPC-based SOCs. To allow
building this driver for non-PPC, guard soft_uart_init() and its
helpers by CONFIG_PPC32, and use a no-op soft_uart_init() otherwise.

Reviewed-by: Timur Tabi <timur@kernel.org>
Acked-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/tty/serial/ucc_uart.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index f286e91714cb..313697842e24 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -33,7 +33,10 @@
 
 #include <linux/firmware.h>
 #include <soc/fsl/cpm.h>
-#include <asm/reg.h>
+
+#ifdef CONFIG_PPC32
+#include <asm/reg.h> /* mfspr, SPRN_SVR */
+#endif
 
 /*
  * The GUMR flag for Soft UART.  This would normally be defined in qe.h,
@@ -1096,6 +1099,8 @@ static const struct uart_ops qe_uart_pops = {
 	.verify_port    = qe_uart_verify_port,
 };
 
+
+#ifdef CONFIG_PPC32
 /*
  * Obtain the SOC model number and revision level
  *
@@ -1238,6 +1243,16 @@ static int soft_uart_init(struct platform_device *ofdev)
 	return 0;
 }
 
+#else /* !CONFIG_PPC32 */
+
+static int soft_uart_init(struct platform_device *ofdev)
+{
+	return 0;
+}
+
+#endif
+
+
 static int ucc_uart_probe(struct platform_device *ofdev)
 {
 	struct device_node *np = ofdev->dev.of_node;
-- 
2.23.0

