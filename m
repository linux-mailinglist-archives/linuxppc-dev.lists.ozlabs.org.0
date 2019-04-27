Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 313C8B39F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:41:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rsXB2JlyzDqcp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:41:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
X-Greylist: delayed 327 seconds by postgrey-1.36 at bilbo;
 Sat, 27 Apr 2019 22:58:44 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrZr10n6zDqZ3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:58:43 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mdvyo-1gklM610Mw-00b6vt; Sat, 27 Apr 2019 14:52:48 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 17/41] drivers: tty: serial: apbuart: fix logging calls
Date: Sat, 27 Apr 2019 14:51:58 +0200
Message-Id: <1556369542-13247-18-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:74q7QZbgRgRsAUkPp9HoIcby/AiA8t4Mu2TUa7cvirQmdem+3Am
 8EQGnLshuK8zT/JT/rXJ1jMsYvUFcIBhmVWtNocXE1OdQlrcN6zxnc0lOKUkbKlCtWRyBOs
 SfDclKxIBbTDIEFobqRgxh4RYW3wCVdlAW+GkkAV2vRB5P9CXtzp+iTfXlW2e2cAPKtq+p3
 x9rgoBVikwGuHrHXLrrgQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uTiVp3Nczjw=:q1a1X6kKvjHfrhz1Px6grs
 y2cRAewloYSEeFwYySk0YrARqZHX8MO30d9uC8GmJDALaFdmlLqkw6kOPMdQTidaZ+DNwmHiq
 IazDQmrIO+v2lu9uFF5C0afTbj84APORT9xRNgIWfXuuU0izLJ0obJJd3I5TkdS12GTnhp5Ur
 EE2/Mtlbvto3kPE/WZRQACH3YRpUTmpIL/m0dGYHDy42saGN55NYEpdl1wSGpZcYpuwmJZo6d
 ehxYz13zJwKYfPNldFiO+CYbV+sbHa6kCHXFhkEiWRptPYEbmD5P0x1Aq4Ha0Dk6HsKrt4ZR3
 Ns67DYiDJQgMCkxJGuYCAUiutr2+7H4M4i6KzrI16WJ1ODcV/8T3OH6dIkiTc+OmGF6R5w338
 F5P3xx5qLXFl6rWARSAVFmouGusjIYCcINRYs+e6P0qtKQ4aqb+cGKSWGER3i6x0IoE6AiTc8
 0poScbN8XXBERjWafnDHE10SqEx2FZofVt8PhamE53PiboRklIOMXYlD1+Rs0AOP6q7nRseuQ
 +/Nt+QisBh0sliQtTfB7A7jox+V25n2QxajLYhvIDYiNuY3hKf50/+Fi5ln9Mwaol0bk/vsac
 fsnub6AMLtxhLdg4C1NOVyDgTrBvipolZ0UgY/g7u3MCpHa80W979KbaW8kD372HVeDuSyw1p
 CwKLh/xNKZvJyQhvmhqwnLi2HW2iH28NNNg4fT7Ze0ksGeM+xperH9HQBJn8xvHtN24TAjDx+
 VsRqVz8nC+PwpHOUYuTXVSAeJQWb3ep7HlkJvQ==
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

Fix checkpatch warnings:

    WARNING: Prefer using '"%s...", __func__' to using 'apbuart_console_setup', this function's name, in a string
    #491: FILE: drivers/tty/serial/apbuart.c:491:
    +	pr_debug("apbuart_console_setup co=%p, co->index=%i, options=%s\n",

    WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
    #661: FILE: drivers/tty/serial/apbuart.c:661:
    +	printk(KERN_INFO "Serial: GRLIB APBUART driver\n");

    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
    #666: FILE: drivers/tty/serial/apbuart.c:666:
    +		printk(KERN_ERR "%s: uart_register_driver failed (%i)\n",

    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
    #673: FILE: drivers/tty/serial/apbuart.c:673:
    +		printk(KERN_ERR

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/apbuart.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/apbuart.c b/drivers/tty/serial/apbuart.c
index 60cd133..d2b86f7 100644
--- a/drivers/tty/serial/apbuart.c
+++ b/drivers/tty/serial/apbuart.c
@@ -482,8 +482,8 @@ static int __init apbuart_console_setup(struct console *co, char *options)
 	int parity = 'n';
 	int flow = 'n';
 
-	pr_debug("apbuart_console_setup co=%p, co->index=%i, options=%s\n",
-		 co, co->index, options);
+	pr_debug("%s() co=%p, co->index=%i, options=%s\n",
+		 __func__, co, co->index, options);
 
 	/*
 	 * Check whether an invalid uart number has been specified, and
@@ -650,21 +650,20 @@ static int __init grlib_apbuart_init(void)
 	if (ret)
 		return ret;
 
-	printk(KERN_INFO "Serial: GRLIB APBUART driver\n");
+	pr_info("Serial: GRLIB APBUART driver\n");
 
 	ret = uart_register_driver(&grlib_apbuart_driver);
 
 	if (ret) {
-		printk(KERN_ERR "%s: uart_register_driver failed (%i)\n",
-		       __FILE__, ret);
+		pr_err("%s: uart_register_driver failed (%i)\n",
+		       __func__, ret);
 		return ret;
 	}
 
 	ret = platform_driver_register(&grlib_apbuart_of_driver);
 	if (ret) {
-		printk(KERN_ERR
-		       "%s: platform_driver_register failed (%i)\n",
-		       __FILE__, ret);
+		pr_err("%s: platform_driver_register failed (%i)\n",
+		       __func__, ret);
 		uart_unregister_driver(&grlib_apbuart_driver);
 		return ret;
 	}
-- 
1.9.1

