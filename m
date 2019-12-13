Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E51A11DB0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 01:18:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Yrq94d6DzDqjp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 11:18:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=arista.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.b="aIUYOHnt"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YrdL49tmzDr1V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 11:09:42 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id x13so380500plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 16:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hompvs4TzHM6s+1/5TyS4xDRIwWIj/44vZj5QlCvckg=;
 b=aIUYOHntjzAwxd3L5BARNwmmEk6JQIP8acefncyZcp2QiHgm5HQZv+zhKNU/xkJ16s
 sPSrprQUm6NWIX3lQSCvjJRnLZCZygrbhvclb/9KRyJwACumT/xx48RI6QMCdcT5Bioj
 ZyMWZpiYgt4Awz4x0KzQTwlOAje8OnkoaLxXVxnJJP68wyH1RTYYtSpN6Ha54GhfC16Y
 WL3GMHzTrOEg7UEYYLonxEEz+lA3YcYBkfqQJuctAaOE1C4401OHGK1MPSKzUNnoM8Ig
 AU6McbGVMmCeb4Jeyawvqr++ESFWk0oJ+iKBM9fCWRvGDyfrpAz+3WNSfAEih82sdmeQ
 ki7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hompvs4TzHM6s+1/5TyS4xDRIwWIj/44vZj5QlCvckg=;
 b=dPWPL3IAwa6f3EwqVLV5vSISXK63A3vG9gpUgU9gSF8fZJWK5q/TyUKeJL27p/15oI
 BxBaqFbtdKOvfirj5vT0yMP+69gLjsGnoImTSgfvUMKMcvkteLBla6AWj2JEirf6l+XZ
 24FEvnxugGrtcGJIkx7Hvz2ZpFlnRoVq/07LIB4ccfhsph6+VW7YiO775QUhe2lgwIWq
 UFQRtnW7vdC3elkr/Z0uoOCs+nND4qaSOWjjmCgZ3/VIS8NMrpZ2CnYeabGpTKJaywsV
 9eqrLvsRqfd0I4Z1MB4Shg3Ce2tTJzqZX2vpvA6+ipuRqXQCMrB1tSGKht7UsKVlsLOP
 zz8w==
X-Gm-Message-State: APjAAAUuzkfVxDje9KBUOAWevT23oFxFDktw/GDzSuRIEKE7NenGg2cO
 reY2PVoz5tW5md0XitP9M+YX1Q==
X-Google-Smtp-Source: APXvYqwbjk8eQ60HCsyGrINj/6WOIvDOU0q5FM1bdjC6TvtdYoMStt8wLyL1RMXEwsRxfaqNgqVesQ==
X-Received: by 2002:a17:90a:d986:: with SMTP id
 d6mr13291140pjv.78.1576195780272; 
 Thu, 12 Dec 2019 16:09:40 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id j38sm8317647pgj.27.2019.12.12.16.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 16:09:39 -0800 (PST)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 49/58] serial/ucc_uart: Remove ifdef SUPPORT_SYSRQ
Date: Fri, 13 Dec 2019 00:06:48 +0000
Message-Id: <20191213000657.931618-50-dima@arista.com>
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
Cc: Vasiliy Khoruzhick <vasilykh@arista.com>, Timur Tabi <timur@kernel.org>,
 Dmitry Safonov <dima@arista.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ucc_uart doesn't seem to support console over itself, so maybe it can
be deleted with uart_handle_sysrq_char() from the file.

Cc: Timur Tabi <timur@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 drivers/tty/serial/ucc_uart.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index a0555ae2b1ef..ff7784047156 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -551,9 +551,7 @@ static void qe_uart_int_rx(struct uart_qe_port *qe_port)
 	/* Overrun does not affect the current character ! */
 	if (status & BD_SC_OV)
 		tty_insert_flip_char(tport, 0, TTY_OVERRUN);
-#ifdef SUPPORT_SYSRQ
 	port->sysrq = 0;
-#endif
 	goto error_return;
 }
 
-- 
2.24.0

