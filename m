Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1E8B393
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:23:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rs6s1WGczDqQ4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:23:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrSw1xDHzDqZ3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:53:35 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MkYkI-1gvnxz13qI-00m5Hh; Sat, 27 Apr 2019 14:53:01 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 32/41] drivers: tty: serial: 21285: define's for address/size,
 use mapsize field
Date: Sat, 27 Apr 2019 14:52:13 +0200
Message-Id: <1556369542-13247-33-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:iEBl2J6aAGLLUc9gogjDel0fwK0zVBbCxPMJri/kbrSvb4JuRHU
 dMsu93FBbFwYR3dVsvSh1GJRRBnAct7RY5hnMruBRe4fpX6nxjKZ9a+FpdnPqRrRM6zajm/
 Zq6YvL7nAO4JNPTwsDDpcQwnA8FjfR6ICxhwBH3BRm3TCq2eoup3NR3iCqD3FNfZx2YoV/8
 V7MKmxrrBIOBo3I5f/tZw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:93H1R8MWbBw=:L0iEwc82GdE63pmHfe42UJ
 uQxcquJ3aJJ6XagNGb5FGjO5+Gqe68JZ8HjPmYBjEOz5cxI4FLV/EJb7ZZ4Y1tXzXf5DmiQSC
 jGjsnJLejS63nxXDdr7G7i1Zj87ckczGHw41+SX07w+g0h/OAWEt0Qrpak9E3FGVcyCmOJUga
 hbJqfS4JWsxbQKPw0kI+6ndJ373LfddM/MvpO5ERt4PzWcL0nspeNGet1o9gjCpUiD9nD01IT
 LngnK8dwnJOnWh/L/7tvgAI9bkBVglAvI4stcaTG+KJ02WFNPNQFlNn3tX8C/qqQ5ZoVtoH0o
 YCOtR2V+YpRlbPmvzp/NjwosNMtNg2fr2A4+jp8LVxwHEKx6Mq9rQlCZn48cIitdMCx3u2/8Z
 M7TdoDS9GdEIVYbxytMx9G63q7f34b7N4ovgVOyFqvk3EDR2ExnMQfI79d7+TthEa+OBHcMcP
 hc4ClgExLQpo/LSINaPEy9n00HY/I4d9QypfPIAHCYEnzCXADrc2t7CkhNepxTht+kgBJy1aS
 k+FsfSyCi2AqYiHiKoYXXuhlarg3YviDJeu51x/XK4YxQPvIdXBJG5P2i6KsHaq6UluVDG+QC
 qwQkfxB5GTCJhn4IkC2Um1VQxHSOGPJji3pBLjiV5pKZyGr1odsWyJb3bcwdxoTWDC1A0LmcQ
 VW3zq4vScC/GbUtZRrJdUVGJaF/4tuvZLntHWr9wcbtii+rDlmL0H4rk+Paj3NeMT503X+vXM
 zHbXOUjI7IZVWOStZx9mJyCXuG7NHF8tiIcRnA==
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

Instead of hardcoding raw numbers, add define's for the mmio address/size.
Also fill the mapsize field and use it on mem request/release calls, for
more consistency and allowing generic helpers to be used later.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/21285.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/21285.c b/drivers/tty/serial/21285.c
index 32b3acf..90684cd 100644
--- a/drivers/tty/serial/21285.c
+++ b/drivers/tty/serial/21285.c
@@ -27,6 +27,9 @@
 #define SERIAL_21285_MAJOR	204
 #define SERIAL_21285_MINOR	4
 
+#define SERIAL_21285_ADDRESS	0x42000160
+#define SERIAL_21285_SIZE	32
+
 #define RXSTAT_DUMMY_READ	0x80000000
 #define RXSTAT_FRAME		(1 << 0)
 #define RXSTAT_PARITY		(1 << 1)
@@ -305,12 +308,14 @@ static const char *serial21285_type(struct uart_port *port)
 
 static void serial21285_release_port(struct uart_port *port)
 {
-	release_mem_region(port->mapbase, 32);
+	release_mem_region(port->mapbase, port->mapsize);
 }
 
 static int serial21285_request_port(struct uart_port *port)
 {
-	return request_mem_region(port->mapbase, 32, serial21285_name)
+	return request_mem_region(port->mapbase,
+				  port->mapsize,
+				  serial21285_name)
 			 != NULL ? 0 : -EBUSY;
 }
 
@@ -354,7 +359,8 @@ static int serial21285_verify_port(struct uart_port *port, struct serial_struct
 };
 
 static struct uart_port serial21285_port = {
-	.mapbase	= 0x42000160,
+	.mapbase	= SERIAL_21285_BASE,
+	.mapsize	= SERIAL_21285_SIZE,
 	.iotype		= UPIO_MEM,
 	.irq		= 0,
 	.fifosize	= 16,
-- 
1.9.1

