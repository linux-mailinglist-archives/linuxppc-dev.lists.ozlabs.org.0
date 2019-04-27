Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8DEB392
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:21:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rs4n1LK9zDqRH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:21:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrSr69SFzDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:53:32 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N5G1V-1gbeYR2mc1-0118EA; Sat, 27 Apr 2019 14:52:58 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 29/41] drivers: tty: serial: sunzilog: cleanup logging
Date: Sat, 27 Apr 2019 14:52:10 +0200
Message-Id: <1556369542-13247-30-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:uxxvCa66CYSGi3Em4nuMPvtSzL45VE6ce5qM7EP5uZ2jwnJH/Rf
 VzWdbFvPirBwCJNu9f+Jwyc9lVwLpUGhejFkC7ldZJdxwR7DA2BRn+Vl0BQckBceQIF7qXC
 WyxgtztRffigF7v1SzndzvbVeMKNS2DbGfpYfH4EV+kNq293CGWXupsg6VWK6tqIR7aTFMf
 +tRlOKQpyia0QglzkJKNA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:y11A1qYqUqI=:8rPS9vSRvAXoCM5mb5BhuI
 WjE5yIVWUmfvDmA/AQ4ypZ+srkteIQs198t/oJOqUwZx5Rp3SPAGlO++llU7eG0RNjUsALBZq
 ZUvb6zw3f9sYxfEGhrGcIODhWtEO5jSQT4jIVhGurbVttXmC6195bA40SA690OEhhnFI/qCEi
 WSwQCTE70G9mH5ZlezP2NFueEhbG7kWFhxlgd96LRp1M9Nb1RFDllOpLiSlWwuEgrwYc/txEZ
 Jz5ZQj7Ur9cWxizBCpYX6lQ8MA/6iwg/+OwOBQFBaO9/oRTiS2RJak0h4ldhbLbwq2zihGidG
 1rGx2U2IrRbLZ4JMDQtJAaneQYfRx5ecqZDD3UkLCP4Ei05fNui5iI8OpZLsbkAWQMiKsryvO
 2kCFC0VRHePJTFZPqt9Ik9I0+gIoWPxwpdB8LfjEbEvj6k6/XPYQgonaBdL12TN97JkTvX7X2
 zPhIz62y5IwAPzLzViaQBeYU5gJWmkOIO+mcjozxcMghEPjcS0OHpgnDA8TYNsChOcClWQN5U
 ZTY0rQijbKo7+Fr6crZw1sEjpHfTqC53E74pOXaRvnpUsI/uBenbneEDtTlLAdpaHpm6wTBvF
 WLYWF5qQwW7fPx/YeqvLiajUl4U2/pvABrvxsQRwW6Zi/tOfEaKerfDWvrHkfNX97OpQ9rjqO
 aqTj8y5/k3NSG39yLJhNMUwbIOnBHg3Ua0eJn7jjxkxpYM82/aUzhOuEWTDJOxHkTsenB2gj8
 mCkokTH7YsmuOy7tzDvemUKChz641N4UkAKV+w==
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

Fix checkpatch warning:

    WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
    #1238: FILE: drivers/tty/serial/sunzilog.c:1238:
    +	printk(KERN_INFO "Console: ttyS%d (SunZilog zs%d)\n",

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/sunzilog.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/sunzilog.c b/drivers/tty/serial/sunzilog.c
index 85edb0d..dba723c 100644
--- a/drivers/tty/serial/sunzilog.c
+++ b/drivers/tty/serial/sunzilog.c
@@ -1235,7 +1235,7 @@ static int __init sunzilog_console_setup(struct console *con, char *options)
 	if (up->port.type != PORT_SUNZILOG)
 		return -1;
 
-	printk(KERN_INFO "Console: ttyS%d (SunZilog zs%d)\n",
+	pr_info("Console: ttyS%d (SunZilog zs%d)\n",
 	       (sunzilog_reg.minor - 64) + con->index, con->index);
 
 	/* Get firmware console settings.  */
@@ -1615,9 +1615,8 @@ static int __init sunzilog_init(void)
 		while (up) {
 			struct zilog_channel __iomem *channel;
 
-			/* printk(KERN_INFO
-			 *        "Enable IRQ for ZILOG Hardware %p\n",
-			 *        up);
+			/* pr_info("Enable IRQ for ZILOG Hardware %p\n",
+			 *         up);
 			 */
 			channel          = ZILOG_CHANNEL_FROM_PORT(&up->port);
 			up->flags       |= SUNZILOG_FLAG_ISR_HANDLER;
@@ -1655,9 +1654,8 @@ static void __exit sunzilog_exit(void)
 		while (up) {
 			struct zilog_channel __iomem *channel;
 
-			/* printk(KERN_INFO
-			 *        "Disable IRQ for ZILOG Hardware %p\n",
-			 *        up);
+			/* pr_info("Disable IRQ for ZILOG Hardware %p\n",
+			 *         up);
 			 */
 			channel          = ZILOG_CHANNEL_FROM_PORT(&up->port);
 			up->flags       &= ~SUNZILOG_FLAG_ISR_HANDLER;
-- 
1.9.1

