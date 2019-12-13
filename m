Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A4211DAFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 01:16:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Yrmj4htmzDr75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 11:16:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=arista.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.b="EajhwHVd"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YrcL4lCkzDqXg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 11:08:50 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id k20so370352pll.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 16:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oFqw+HPsj+UvL3ErVQQmLmN+s/+CgB/NwHLHlutjOiw=;
 b=EajhwHVdE3viF6OTqFPMh/mMhJda3aVHtZVSvDfWNRga5xkSjsM3jyQK1O7FKTOWKp
 FA9x5OeKeLVn7IZoFwXwdis4MujSaLsdJFTb4AIJD23KP+5XJC2e3yD1aqBCz0iP9Pix
 3ziyudM3CqRn6mEK9owgMvbHihbvnA8MwB331cPepfB1KWUAkq/5dflShGPRrQUAUb0W
 FWWV8Bq8N6vgVXZCkMJrET3VPLaG5o/goCy9AMbnVa6bpGtq0IHlQw0W1ByEHiqG749V
 W0E5uCm68XlrEo4WAWw77o8nYomafrEjUNyszlsN7japK9WeUqT4aHzWeauSRydNtSRT
 p/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oFqw+HPsj+UvL3ErVQQmLmN+s/+CgB/NwHLHlutjOiw=;
 b=BUMOu3VbW3oWw8+aEu+/nMTGfQx53QPGOHO/dhbBqH42LmF7I27D5K30pHDu+doyAZ
 Zrskp3hypTZDYhxo8oC/5tbZlTVz+uyjKNu7X+KVhfWuVp2PgB5uyOx9uM4MhBKLX5ra
 kasRrxY132KVDdEa3UDFWczR5i1nDZpJoANKkWX6lEfj/m1qfaWF9/Xpqu3nzZBOmIf2
 7ZK0p1QZIm6iYtkd4hYXq2B6hBbSzk0NLFGGluSQ83b4DP6sUeFnwzxfCGBvNjpl9xCI
 8iu0YAaNZ8DLMK6L2Z7XbZj5WyR4gNz+M7zryvGndAFLDMwFGAfaiIfYyGRylou9hY0j
 Gsdw==
X-Gm-Message-State: APjAAAXyJ89cpQ5UCXxfy7SSlYAPtvitfzZHVhInov7UwBPeYLAhPCKF
 hPjIU4k4DIPo6tTtgCgbhCX+Tw==
X-Google-Smtp-Source: APXvYqyF6KmCyw2+4DGZMs1GewyAV9nRslaYtpLZSwxmJE8Eo7U1bhbKpvG5tJ/6K6I51waBc+InfQ==
X-Received: by 2002:a17:90a:2223:: with SMTP id
 c32mr13646956pje.15.1576195726336; 
 Thu, 12 Dec 2019 16:08:46 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id j38sm8317647pgj.27.2019.12.12.16.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 16:08:45 -0800 (PST)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 31/58] tty/serial: Migrate pmac_zilog to use has_sysrq
Date: Fri, 13 Dec 2019 00:06:30 +0000
Message-Id: <20191213000657.931618-32-dima@arista.com>
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
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 drivers/tty/serial/pmac_zilog.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index bcb5bf70534e..ba65a3bbd72a 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -61,10 +61,6 @@
 #define of_machine_is_compatible(x) (0)
 #endif
 
-#if defined (CONFIG_SERIAL_PMACZILOG_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
-#define SUPPORT_SYSRQ
-#endif
-
 #include <linux/serial.h>
 #include <linux/serial_core.h>
 
@@ -1721,6 +1717,7 @@ static int __init pmz_init_port(struct uart_pmac_port *uap)
 	uap->control_reg   = uap->port.membase;
 	uap->data_reg      = uap->control_reg + 4;
 	uap->port_type     = 0;
+	uap->port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_PMACZILOG_CONSOLE);
 
 	pmz_convert_to_zs(uap, CS8, 0, 9600);
 
-- 
2.24.0

