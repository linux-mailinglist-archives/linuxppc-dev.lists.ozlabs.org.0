Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9AE11DAF7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 01:13:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YrjF6jtVzDr5D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 11:13:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=arista.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.b="ZDU8FPg2"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YrZq3jnJzDq69
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 11:07:31 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id c23so389160plz.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 16:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+0zI46fwj74VyWlrHr0zE9775HtW1ixE7rUWLLJGBnQ=;
 b=ZDU8FPg2Z/bhIq5moxFbpIkJl5mkokE1M6A/l1ergMT75YFy3KCr76cQMYKo3eHU5P
 CJXrbFSqBKENrTaDehFlbEJpRc0qXOx/zU/pGPu4dQsLtQ9KyFGfwoGYt4GIUE6dN91s
 DCVoVBt2V2v4sjyYrmfV9GEGRvmbA+im9zVcWVnq8ncnJI7HyFUfpCMd1WhN/1B6C204
 dCFSZslPsdxyHcARs0dl+8C54fCm7BjFjlkGm9nLcFJ7eok/xzd6lxQuh9oAyAnYR8Ji
 om2C6achDu85oquscjvJ0+sUtX1QdzU5AuA4J7AIESCt87QQx3YOU6WCzuHfEt+trraM
 XlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+0zI46fwj74VyWlrHr0zE9775HtW1ixE7rUWLLJGBnQ=;
 b=t9eBtcaspnwPD4sibINEhhdmApRSUg0lMOXVgeW1NH5bcU2tuV5+ePPLsPFrRXIzTo
 BA6BTTmwEDjKe6VvQWHvCk9FD2dSiNswTvDzKuc5oH8dIqYqLOaTLZzL4TA+j+5X/c1X
 Kmjcv/0Bj60lx6QFLWiabBzS4gwwwHI1aaLn7D1jOLenbETV5mjqnIxpRC3xtnCYG9Rs
 qVN6qcc/RSf5nAqfvhew46qhrByI+vrydr76Z3BZl89Lvy6KOUFSeX+OZtSmIIq7/1jc
 w/nrEeMnMe1PoAOFBlODoL/pYzPaZhljKwo3GqqFZkb8YliWn8EjxS0jQUmNPHDKM355
 NEHA==
X-Gm-Message-State: APjAAAXcMNqyY/Z3YDK4/OoycD2fJPTac3eYCoN5/TTOQNxvocPRkeTA
 710ejNVwXT383NQ8ts0fh+aVhg==
X-Google-Smtp-Source: APXvYqzUouBK571xMsPgmTxzYkc013roUS4jik+x+H3RHyjBPl1Tw1IuLSGJx2UMcXU/rB8ETFaFeA==
X-Received: by 2002:a17:90b:f06:: with SMTP id
 br6mr13007319pjb.125.1576195649264; 
 Thu, 12 Dec 2019 16:07:29 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id j38sm8317647pgj.27.2019.12.12.16.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 16:07:28 -0800 (PST)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 05/58] tty/serial: Migrate 8250_fsl to use has_sysrq
Date: Fri, 13 Dec 2019 00:06:04 +0000
Message-Id: <20191213000657.931618-6-dima@arista.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213000657.931618-1-dima@arista.com>
References: <20191213000657.931618-1-dima@arista.com>
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
Cc: Vasiliy Khoruzhick <vasilykh@arista.com>, Dmitry Safonov <dima@arista.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The SUPPORT_SYSRQ ifdeffery is not nice as:
- May create misunderstanding about sizeof(struct uart_port) between
  different objects
- Prevents moving functions from serial_core.h
- Reduces readability (well, it's ifdeffery - it's hard to follow)

In order to remove SUPPORT_SYSRQ, has_sysrq variable has been added.
Initialise it in driver's probe and remove ifdeffery.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/powerpc/kernel/legacy_serial.c | 4 +++-
 drivers/tty/serial/8250/8250_fsl.c  | 4 ----
 drivers/tty/serial/8250/8250_of.c   | 4 +++-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index 7cea5978f21f..f061e06e9f51 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -479,8 +479,10 @@ static void __init fixup_port_irq(int index,
 	port->irq = virq;
 
 #ifdef CONFIG_SERIAL_8250_FSL
-	if (of_device_is_compatible(np, "fsl,ns16550"))
+	if (of_device_is_compatible(np, "fsl,ns16550")) {
 		port->handle_irq = fsl8250_handle_irq;
+		port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
+	}
 #endif
 }
 
diff --git a/drivers/tty/serial/8250/8250_fsl.c b/drivers/tty/serial/8250/8250_fsl.c
index aa0e216d5ead..0d0c80905c58 100644
--- a/drivers/tty/serial/8250/8250_fsl.c
+++ b/drivers/tty/serial/8250/8250_fsl.c
@@ -1,8 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#if defined(CONFIG_SERIAL_8250_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
-#define SUPPORT_SYSRQ
-#endif
-
 #include <linux/serial_reg.h>
 #include <linux/serial_8250.h>
 
diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index 92fbf46ce3bd..531ad67395e0 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -222,8 +222,10 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 
 	if (IS_ENABLED(CONFIG_SERIAL_8250_FSL) &&
 	    (of_device_is_compatible(np, "fsl,ns16550") ||
-	     of_device_is_compatible(np, "fsl,16550-FIFO64")))
+	     of_device_is_compatible(np, "fsl,16550-FIFO64"))) {
 		port->handle_irq = fsl8250_handle_irq;
+		port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
+	}
 
 	return 0;
 err_unprepare:
-- 
2.24.0

