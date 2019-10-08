Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F577CFC23
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 16:16:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nfY12sNfzDqPR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 01:16:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=monstr.eu
 (client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=monstr@monstr.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=monstr-eu.20150623.gappssmtp.com
 header.i=@monstr-eu.20150623.gappssmtp.com header.b="SGjyUqhN"; 
 dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nfS72M3BzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2019 01:12:16 +1100 (AEDT)
Received: by mail-wm1-x343.google.com with SMTP id 7so3344552wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Oct 2019 07:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:date:message-id;
 bh=hhi061WV6l5bWbobRameaZ9fCkXMs3Uy6r+tMzymC4k=;
 b=SGjyUqhNTPVgZePfTUEeMOde3BfWCV9UG9Nd5S/u8KasboYQCvwQl0RSXfJbDMDDbT
 t1nmS5O9zoCWwSvbrCbAaq7lckg6o/PHnphjhc4vEf7UqHY/WY2qBrsT+eec9EF+Pr2H
 Y/Wjioj2m/dhNoa/EYIVRj5w8fUruFsV1cHo2ahOFnguSfkN0L4xFGq93qNJw/VwqftI
 p3sagGJMdqR8yYGUK/FFJ5ahnQHJyysl14XeVlmwZ+dtjnDT1ggwr41YkP0YbzI+t87R
 RI02LAKnC7rdEgrjfqNmwfNfMP3aDA3Z7EXcs8spLMNSRBCWY9+1fn2lhfQgx6pbiszr
 3q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=hhi061WV6l5bWbobRameaZ9fCkXMs3Uy6r+tMzymC4k=;
 b=sz39jT1ZBdlfhbL4loZgpLaF+z8pWRjFu75aVjfG5Hr1HY9M/KFAxB3X2PbUnl5/T5
 nUpO1AvUL7wkRhc8Ljf1vxXfn3lkPQBXQgwGUEKRrl9HHcxCzZ4WhBLFYEpQY55ryNRm
 aB+wcX/JECLhzUUr1FISupf4lTRvozeCHlbJDm1a1qnFbzmjxXSlp/gMkUWZgxOgnQPO
 JMU/xTIozmd5b0Kz+Gs4yzseDFDHUPmiJqUMDA+QZM3++0z3qO+zV5qEujp3RNm52ewI
 rotF6IOVWT0BsztrRtGeoX9nZbbkl5sJfMAjYRV0hd9fhfzss95ktDqIQbD/yx+qb0U0
 6gZQ==
X-Gm-Message-State: APjAAAVcJ6mMGefqrDb5r8wYKVh+8Io6HtzEAWOAe+qQ5eErpVODGeUK
 1TXaWUe9ZNMbzM7jKHY13SR4ZQ==
X-Google-Smtp-Source: APXvYqyJXduMWr+YDS5spGRQEcNwmz3rzPzkWy1P/eYsPopGINliLMm8PKc/3GSGU5f2vUfY8jvStQ==
X-Received: by 2002:a05:600c:118a:: with SMTP id
 i10mr3972815wmf.80.1570543928879; 
 Tue, 08 Oct 2019 07:12:08 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id r18sm4362096wme.48.2019.10.08.07.12.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 08 Oct 2019 07:12:08 -0700 (PDT)
From: Michal Simek <michal.simek@xilinx.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com
Subject: [PATCH] hvc: dcc: Add earlycon support
Date: Tue,  8 Oct 2019 16:12:06 +0200
Message-Id: <41e2920a6348e65b2e986b0e65b66531e87cd756.1570543923.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, Jiri Slaby <jslaby@suse.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add DCC earlycon support for early printks. The patch is useful for SoC
bringup where HW serial console is broken.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

I have this patch in Xilinx tree for quite a long time and it was develop
as preparation work for SoC bringup where jtag is functional and get
information from kernel what's going on.

There is one checkpatch warning
WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
+static void dcc_early_write(struct console *con, const char *s, unsigned n)
but
console write is defined like that.
include/linux/console.h  +145
void    (*write)(struct console *, const char *, unsigned);
---
 drivers/tty/hvc/hvc_dcc.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/tty/hvc/hvc_dcc.c b/drivers/tty/hvc/hvc_dcc.c
index 02629a1f193d..8e0edb7d93fd 100644
--- a/drivers/tty/hvc/hvc_dcc.c
+++ b/drivers/tty/hvc/hvc_dcc.c
@@ -1,7 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (c) 2010, 2014 The Linux Foundation. All rights reserved.  */
 
+#include <linux/console.h>
 #include <linux/init.h>
+#include <linux/serial.h>
+#include <linux/serial_core.h>
 
 #include <asm/dcc.h>
 #include <asm/processor.h>
@@ -12,6 +15,31 @@
 #define DCC_STATUS_RX		(1 << 30)
 #define DCC_STATUS_TX		(1 << 29)
 
+static void dcc_uart_console_putchar(struct uart_port *port, int ch)
+{
+	while (__dcc_getstatus() & DCC_STATUS_TX)
+		cpu_relax();
+
+	__dcc_putchar(ch);
+}
+
+static void dcc_early_write(struct console *con, const char *s, unsigned n)
+{
+	struct earlycon_device *dev = con->data;
+
+	uart_console_write(&dev->port, s, n, dcc_uart_console_putchar);
+}
+
+static int __init dcc_early_console_setup(struct earlycon_device *device,
+					  const char *opt)
+{
+	device->con->write = dcc_early_write;
+
+	return 0;
+}
+
+EARLYCON_DECLARE(dcc, dcc_early_console_setup);
+
 static int hvc_dcc_put_chars(uint32_t vt, const char *buf, int count)
 {
 	int i;
-- 
2.17.1

