Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B902B3AE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 16:04:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rt2h5GpmzDqdp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 00:04:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrb13r71zDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:58:53 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N8XHV-1gh8Cp1oHJ-014PTe; Sat, 27 Apr 2019 14:52:34 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 01/41] drivers: tty: serial: dz: use dev_err() instead of
 printk()
Date: Sat, 27 Apr 2019 14:51:42 +0200
Message-Id: <1556369542-13247-2-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:ZsvBvAt/rLDu1xNT1sLalxIcX9jz7QA0qevymQS/WxRCH2zr6Wl
 xgtlPQz+G8tT6HFrUdOePnL/g6Nz/IIjRENpXyf+TYdtSi3HrsJGdjKV+IdrLIpqWKUpGIr
 dGZH3/KAvVSKXLhp+eDtJ5SZp4iM/k7bWZWc3G+D3RpE/VH31kx+tVU+u8Iwg2ZCwcrt7Md
 VmQRsAPpOo0raWOEg8/zQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HsrgCbi2IK0=:LxZuNdOiXRzOLFOMqdcIUO
 ujN2qs1zVbC69CJApm+RMGjnmSWIBU1ovdNeVTBPIJzlZbi7KW7gnEOkRPpCg2KOtn0Aw9Z82
 Tyu61JVdJZqXMP9DikKB+3Klc88bt2h9BOsLCfijrP+5RE9ueY64d41JK0Xpm689y+Y7j972X
 vf9dATGY/0ld/zBDutesrHbCPPeBB4D//wHcHK/7UAM+UvSwmMsYzFEG1Dni7Xep7lGaqJ/eX
 bS43BwXXCB40VnWFdGmI514GvUWrZsDP4mIktpmc4j4OLZEFHDK84BkjXStPt4VLlYWS0LJti
 TLyIETk7FgHkqfdjaEs//NEhHzaXaAvFH63sFyUkuLJH3T7J89dzjgDHQWuFBaw2ISJNVqRDE
 C+nw3SIscszw6R8O7qhxsXYzJVOHgG7Dg5FzBsiJiryKnbf4OWE21JFdpaB/tCfCIUOtkDOWE
 Hwhs8BMTzIAJIfkgSe8hYaFwXKvMLzxPIRCSgrRXqz9P7MABHfMKmczKzTv56g97v7er+vbJT
 fUpCa7qKtFCawIeayw33iw2nVuBDChUxK30rQ9cLZUckt3xOZ/gD2KdqzK7RaX8/XzUoH+ul4
 1ORmht/a2rX/5fhm1eVoNIVIYBv5mek0kA4NOuzzreONA3KrD4Ghp3XLHVdgNSW4BUvNcuZ/7
 WgA49uWJ/ZsGam7QwgZhZNajXy8G0jvNIXabcMENTCu/UmteFIRtC0EHtdUKECqG2Q3D0Q4+1
 jRNzmpygMuCmvDdoEeilRd4698MvaTADm+UgJw==
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

Using dev_err() instead of printk() for more consistent output.
(prints device name, etc).

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/dz.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/dz.c b/drivers/tty/serial/dz.c
index 7b57e84..96e35af 100644
--- a/drivers/tty/serial/dz.c
+++ b/drivers/tty/serial/dz.c
@@ -416,7 +416,7 @@ static int dz_startup(struct uart_port *uport)
 			  IRQF_SHARED, "dz", mux);
 	if (ret) {
 		atomic_add(-1, &mux->irq_guard);
-		printk(KERN_ERR "dz: Cannot get IRQ %d!\n", dport->port.irq);
+		dev_err(uport->dev, "Cannot get IRQ %d!\n", dport->port.irq);
 		return ret;
 	}
 
@@ -680,7 +680,7 @@ static int dz_map_port(struct uart_port *uport)
 		uport->membase = ioremap_nocache(uport->mapbase,
 						 dec_kn_slot_size);
 	if (!uport->membase) {
-		printk(KERN_ERR "dz: Cannot map MMIO\n");
+		dev_err(uport->dev, "Cannot map MMIO\n");
 		return -ENOMEM;
 	}
 	return 0;
@@ -697,8 +697,8 @@ static int dz_request_port(struct uart_port *uport)
 		if (!request_mem_region(uport->mapbase, dec_kn_slot_size,
 					"dz")) {
 			atomic_add(-1, &mux->map_guard);
-			printk(KERN_ERR
-			       "dz: Unable to reserve MMIO resource\n");
+			dev_err(uport->dev,
+				"Unable to reserve MMIO resource\n");
 			return -EBUSY;
 		}
 	}
-- 
1.9.1

