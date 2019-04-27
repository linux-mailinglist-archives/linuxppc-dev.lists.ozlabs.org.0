Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7BB3B0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 16:08:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rt7Q6srdzDqfC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 00:08:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrb817JpzDqZ3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:58:59 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MVNF1-1hBGYO2EDP-00SLNE; Sat, 27 Apr 2019 14:52:59 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 30/41] drivers: tty: serial: ioc4_serial: use dev_warn()
 instead of printk()
Date: Sat, 27 Apr 2019 14:52:11 +0200
Message-Id: <1556369542-13247-31-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:feZjQEPGewpWSo2bykBkAQkXP9Lb/ZtVsJ70Hc9aX4own7v09FA
 e65s7fBpQb+RWeo/XsvBCLQDRKkUOdSWYbg6QCmXdWbNheYrxgq5Ys1L3nrokeJAVzT8JZ+
 6QZ7hrXczsjiQ2m1ogHA/r87Uy8zuLwqRpXTsIxH63Kg2ZR+GURXbvN2XWzuqCWUQaBZhlg
 o8S6PJbm8wTsqW6D1wobQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nHmHVGZ+sFw=:XEUcLjplSSh4cLN3S86osQ
 RRbCB7db/0vzL9crkypDqE14Bon4jX8tkQp+cV84NUEPnutsi1rZQXkR4sVogL2UAX1EfdiiB
 ZWKYz5bKoCvZlKSiftMKZUka/T9wvECXHUhnEKxzzueMi2of8Uxue3lfBBkJH9b8PZkdj/aBu
 hAVrybHlnoB+Hts3s4Qq9Yy5z2frg+23hoDafdGDKzIJ0fvLfEsLMDIFMxm7LE/J9SKGTgIa7
 tZ58qm9OQ3Txpe70s8HAz/xkXSK4+XoXJQBqu7ZrQNx/jcX2JYhMfAepdO1NCxTYgqslwtvn+
 kxGGMTf6L2XUp+N+gXomgjjRSJMgH3W3gTzsgBNFIef44wNrxXIRqWnS0dqhzwnML+I21nJgT
 JsP72f0z1irz3kvXLjiL0k7sMDTuisgI6xTr5ERBxmcxPaoFNhcsOAkmaQTVpLiNF0fEV5/dL
 WK4RMr7D9o56XTKE0EQzBnfQDa7Zfr8vDHqPF4Vu3WxThIrFjgXz8Zsg61lyIUN4ZZjDrsICU
 PDnYPVUjW2oyN/4KWwTygxJqxEDU5ZojGlkJKNHwGdRLqoDvsOo0Hjgegt6+vxBdV7hn9HGQb
 Ugkk9R/zIcgd5+5y91jWlvjIUgrdf9fTgbe4Kfzgh4wQDYu3gYVeEwWAgn8sWpj2uVSa2HNmz
 hlBwqixysxqraJN0XG+N+twjuf4CX7sV3lyqftOAlfA0RV0fskMINh/77gW9ct+dzrZzjQeA2
 si+Yy2zUBy990FyaAGOADvUOkyowhyO4YvHeJQ==
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Using dev_warn() instead of printk() for more consistent output.
(prints device name, etc).

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/ioc4_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/ioc4_serial.c b/drivers/tty/serial/ioc4_serial.c
index db5b979..21c1b8f 100644
--- a/drivers/tty/serial/ioc4_serial.c
+++ b/drivers/tty/serial/ioc4_serial.c
@@ -2752,7 +2752,7 @@ static int ioc4_serial_remove_one(struct ioc4_driver_data *idd)
 		the_port->dev = &pdev->dev;
 		spin_lock_init(&the_port->lock);
 		if (uart_add_one_port(u_driver, the_port) < 0) {
-			printk(KERN_WARNING
+			dev_warn(&pdev->dev,
 		           "%s: unable to add port %d bus %d\n",
 			       __func__, the_port->line, pdev->bus->number);
 		} else {
-- 
1.9.1

