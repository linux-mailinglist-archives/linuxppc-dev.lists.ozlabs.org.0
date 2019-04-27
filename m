Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0345DB3B6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 16:16:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rtJr3RTczDqDx
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 00:16:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrbN602fzDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:59:12 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M4bA6-1hJp7z0BBm-001m7B; Sat, 27 Apr 2019 14:53:09 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 41/41] drivers: tty: serial: lpc32xx_hs: fill mapsize and use
 it
Date: Sat, 27 Apr 2019 14:52:22 +0200
Message-Id: <1556369542-13247-42-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:NfvV5UR6Ok9kQv6ROMSW720NbVRt8zJA2j6SiVCta9zO0Jw5F68
 oDYmpeAiqIZsk1sS86lqn4+pdFZWevIEnEZ69zvk7cMJbxGvaG9S0AMXx6E3vAMZVzd7pPE
 dnjPcyK+WGDDc90Ms7ezLEUDc+ruGvc0EkFIZ+8daJJAv3bsvnnSUMXjXwFBnPEgLp6qoWu
 RKq97jOfEVGzQSAvfA3Lw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:o0QwINSBCvI=:5NwwQl1Esd8QIcblEooFY8
 Wij0Blkkux3UaAKJGKSU7YRC2R/jgAt2BXt6ThqrZ+n9BW81xL1tkiHaY1L+G+NJdOP5kCfvb
 IEvhWTyHlfvSzifLjcE8u6ZIx4gQUqz5p21jIODouYUuJrOZANuiWfsDOYdeAHFkS9Hm6GEB3
 V29ZGJs8hAL9WOfO0rq7M+5dVuYDtzQHJsUWY7sUmrPOV9UYwtkzssIWY8dTZ47KlIghDkuOQ
 Jaq5NlFi7oJE7GO+3ky1ra/yMW0jNYG8XlDGkyp5hZT+29QQftgBHwPeiHsgr8eYYyKn9CUQ/
 EURBexcU4XMM6c6xyqhlhIB/4UTob3psDcR8azBtMbc8CQDYzoTcmr30WEPS52gjjiwu49Dog
 6+lYOhU0jAWfE9lLzrHpEDwHyyN8R0cbOB9iQ+Io3XHv8A9uT88rXhySDd3QrxyWl/A9pOht2
 vtM1Av0FTLQHWv0y5uWiMyUmicPKb47gIRemAA/Vs8vw3IPKQRUk78ZlBxm4f/j/ofFd2cOVi
 gCccn/Wxze8mP+G5e/EYNr469DGCTNau9a5adTze8eBcF13hOo6siMkcIcf2Y40FXToBd5s0s
 Ud8zUJZwkWhEGMUKn+6a6PUyVEbHA9EuFQsSnD+aOYctuTsIRkDmosMnRfYoSSGm1Xj7gbxYd
 xiKcMy8Fjzd8cryiboYVSUn1kiV+QJIjwLEL7u0SsnmBt1Nl3eM0/0HPWaZzTW2lQl/Zuovvn
 9KBQvtzuAb44Iwd1p7dTE3ibpht0hS8/dIsxZg==
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

Fill the struct uart_port->mapsize field and use it, insteaf of
hardcoded values in many places. This makes the code layout a bit
more consistent and easily allows using generic helpers for the
io memory handling.

Candidates for such helpers could be eg. the request+ioremap and
iounmap+release combinations.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/lpc32xx_hs.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/lpc32xx_hs.c b/drivers/tty/serial/lpc32xx_hs.c
index f4e27d0..d1f09aa 100644
--- a/drivers/tty/serial/lpc32xx_hs.c
+++ b/drivers/tty/serial/lpc32xx_hs.c
@@ -579,7 +579,7 @@ static void serial_lpc32xx_release_port(struct uart_port *port)
 			port->membase = NULL;
 		}
 
-		release_mem_region(port->mapbase, SZ_4K);
+		release_mem_region(port->mapbase, port->mapsize);
 	}
 }
 
@@ -590,12 +590,15 @@ static int serial_lpc32xx_request_port(struct uart_port *port)
 	if ((port->iotype == UPIO_MEM32) && (port->mapbase)) {
 		ret = 0;
 
-		if (!request_mem_region(port->mapbase, SZ_4K, MODNAME))
+		if (!request_mem_region(port->mapbase,
+					port->mapsize, MODNAME))
 			ret = -EBUSY;
 		else if (port->flags & UPF_IOREMAP) {
-			port->membase = ioremap(port->mapbase, SZ_4K);
+			port->membase = ioremap(port->mapbase,
+						port->mapsize);
 			if (!port->membase) {
-				release_mem_region(port->mapbase, SZ_4K);
+				release_mem_region(port->mapbase,
+						   port->mapsize);
 				ret = -ENOMEM;
 			}
 		}
@@ -684,6 +687,7 @@ static int serial_hs_lpc32xx_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 	p->port.mapbase = res->start;
+	p->port.mapsize = SZ_4K;
 	p->port.membase = NULL;
 
 	ret = platform_get_irq(pdev, 0);
-- 
1.9.1

