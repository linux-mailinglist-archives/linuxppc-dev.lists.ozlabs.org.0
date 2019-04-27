Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44827B3A3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:48:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rshY2nt2zDqBK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:48:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrZw49mvzDqZB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:58:48 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MmDAW-1gu8kq1m7s-00iDvn; Sat, 27 Apr 2019 14:52:40 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 08/41] drivers: tty: serial: sb1250-duart: fix checkpatch
 warning on printk()
Date: Sat, 27 Apr 2019 14:51:49 +0200
Message-Id: <1556369542-13247-9-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:9XC3q0bfB2HQ4mApDU4u33n5sD/YoC7EqQPmqP5NMOedGA7sE7R
 zQ+4UMW4bXxRANtgf2zvHO2GKXDxkdKE28JdO/iNudeY0F3mJ+xc3fTNvs7ITqMXpD+h9nY
 QJb/I3M0+a59qd+LyzEcKpCXtBXjQ/BRgErxc0fambEKaAP14TyYVth7y55V4vy+3k5d+oN
 x/fGxgcPqoZSgK+QJd3pA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mA+DGbL3pn0=:LUwdV9FCkWYd8ew6AybJGN
 FyaYZYw27YD3za0BlTEdQTephU9v3aoDL7yH3xhlNPmX+5CM2PApdrigTC+ri8jcVQSmJ4rIZ
 tzjIZ7eEfYrHTPgsrBV4gEVQdGY0ZDyZx1NWo7s2aamBco75jVJh9WQ6GrN3mZ3pI4Ap1jWtK
 6c1sGlcYAomFgphkq8BH0qiKX1Y9a9NmvUArm8RIzX+ly9033kZwLR5tQmOvy3Quox0DSlQpA
 pYlu8M2iFL4kLArnCS1+1A0AfKy936ST8Yu7Wu5uWaQqtVEGOQWaJ50m/nf7mVYSWDnXDyy12
 lThD0nacpT5LNSK+F8rEaZvKfHMnNKlSc0KVB302O4ivHoBJI2eutUcuwHocV7ib9006cTrD7
 53H7kaHqt3lZV0LWdJkX7kc1UqBSSDkp4MPliAr50IVqjE5IlH5Z3DlTDghsTQqsCzoKrKEtH
 syFnn+I0PpYyNheAH3S8usOqqnfRFG/Ng1njF6jkgJ4p65qhFDaftDtLo0tLwn832At0vzYkN
 qGuVhCVMlHTVDEfvhiwUGmRHwkmm/IObaZ7FHB9BRejjgeCmzOTnWdXmkapyDTcFhKGQ/WWu/
 1gJKhScFqVxhyDgpd3/Q8Zx//i/vYjTYm5fUY/Vv5d6srYHH97E0UzBIsSEdLPSRaUJEDpQM3
 Gauk38ExJHTos8640rpLdqyTiLn/gAGfs8IlXPjViSeqlfTCehT7nmldWLacXvxvPgK6JCk8o
 QHrstXkPJ7dKqqvFajXBPfihCad38hiIfrsyWA==
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

checkpatch complaints:

    WARNING: printk() should include KERN_<LEVEL> facility level
    #698: FILE: drivers/tty/serial/sb1250-duart.c:698:
    +		printk(err);

    WARNING: printk() should include KERN_<LEVEL> facility level
    #706: FILE: drivers/tty/serial/sb1250-duart.c:706:
    +			printk(err);

Even though it's a false alarm here (the string is already prefixed
w/ KERN_ERR), it's nicer to use pr_err() here, which also makes
checkpatch happy.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/sb1250-duart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
index b4342c8..227af87 100644
--- a/drivers/tty/serial/sb1250-duart.c
+++ b/drivers/tty/serial/sb1250-duart.c
@@ -689,13 +689,13 @@ static int sbd_map_port(struct uart_port *uport)
 
 static int sbd_request_port(struct uart_port *uport)
 {
-	const char *err = KERN_ERR "sbd: Unable to reserve MMIO resource\n";
+	const char *err = "sbd: Unable to reserve MMIO resource\n";
 	struct sbd_duart *duart = to_sport(uport)->duart;
 	int ret = 0;
 
 	if (!request_mem_region(uport->mapbase, DUART_CHANREG_SPACING,
 				"sb1250-duart")) {
-		printk(err);
+		pr_err(err);
 		return -EBUSY;
 	}
 	refcount_inc(&duart->map_guard);
@@ -703,7 +703,7 @@ static int sbd_request_port(struct uart_port *uport)
 		if (!request_mem_region(duart->mapctrl, DUART_CHANREG_SPACING,
 					"sb1250-duart")) {
 			refcount_dec(&duart->map_guard);
-			printk(err);
+			pr_err(err);
 			ret = -EBUSY;
 		}
 	}
-- 
1.9.1

