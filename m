Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7469759BA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 14:37:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zx9r5LFvzDqhR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 22:37:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org; envelope-from=mchehab@bombadil.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="ByUoDHNg"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zx1y4DzFzDqg9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 22:30:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W01P5QS3uRV3PL5GrkuJuIMkN8UN/CJyWU+iu5QOvQA=; b=ByUoDHNg+0H8Qs/m1RN9jnjl/g
 PhZlReBVQCQ3ubxdw/1nfki4i9C5SCMEmdI5EK0zLPc/vtAimnvml3RD5uzaSgL1ieLaEcBU5L9hh
 WqE3AvSTzrPjsXctTwJgmEkewDkOHrMYoRPGlmnopzJnnnsHviXNLdbtpRRXKJpvQdnhsO8l4K9OR
 zJCA5B68YSVtoweOX3wcUK7mtgCp50FtvkFedNESwqKroYKhsou4+04rIhVM4LpoXDRfFX1bLDYHP
 3ujCWwkxnzB11zGX5d8rBGrRibdqgaCwlhGsiwHlbiwfAPHihY/JS6TrVuoWqHLc9mn/h1jU8QtS1
 /T8MUoXA==;
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hgq1U-00055o-O0; Fri, 28 Jun 2019 12:30:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hgq1S-0005TR-PP; Fri, 28 Jun 2019 09:30:34 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 32/39] docs: serial: move it to the driver-api
Date: Fri, 28 Jun 2019 09:30:25 -0300
Message-Id: <98ded3b9747e187413aab3406da2d5e7c89f53cb.1561724493.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561724493.git.mchehab+samsung@kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
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
Cc: Timur Tabi <timur@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The contents of this directory is mostly driver-api stuff.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/driver-api/index.rst                       | 1 +
 Documentation/{ => driver-api}/serial/cyclades_z.rst     | 0
 Documentation/{ => driver-api}/serial/driver.rst         | 2 +-
 Documentation/{ => driver-api}/serial/index.rst          | 2 +-
 Documentation/{ => driver-api}/serial/moxa-smartio.rst   | 0
 Documentation/{ => driver-api}/serial/n_gsm.rst          | 0
 Documentation/{ => driver-api}/serial/rocket.rst         | 0
 Documentation/{ => driver-api}/serial/serial-iso7816.rst | 0
 Documentation/{ => driver-api}/serial/serial-rs485.rst   | 0
 Documentation/{ => driver-api}/serial/tty.rst            | 0
 MAINTAINERS                                              | 6 +++---
 drivers/tty/Kconfig                                      | 4 ++--
 drivers/tty/serial/ucc_uart.c                            | 2 +-
 include/linux/serial_core.h                              | 2 +-
 14 files changed, 10 insertions(+), 9 deletions(-)
 rename Documentation/{ => driver-api}/serial/cyclades_z.rst (100%)
 rename Documentation/{ => driver-api}/serial/driver.rst (99%)
 rename Documentation/{ => driver-api}/serial/index.rst (90%)
 rename Documentation/{ => driver-api}/serial/moxa-smartio.rst (100%)
 rename Documentation/{ => driver-api}/serial/n_gsm.rst (100%)
 rename Documentation/{ => driver-api}/serial/rocket.rst (100%)
 rename Documentation/{ => driver-api}/serial/serial-iso7816.rst (100%)
 rename Documentation/{ => driver-api}/serial/serial-rs485.rst (100%)
 rename Documentation/{ => driver-api}/serial/tty.rst (100%)

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index f44a3140f95d..d6f532c8d824 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -88,6 +88,7 @@ available subsections can be seen below.
    pti_intel_mid
    pwm
    rfkill
+   serial/index
    sgi-ioc4
    sm501
    smsc_ece1099
diff --git a/Documentation/serial/cyclades_z.rst b/Documentation/driver-api/serial/cyclades_z.rst
similarity index 100%
rename from Documentation/serial/cyclades_z.rst
rename to Documentation/driver-api/serial/cyclades_z.rst
diff --git a/Documentation/serial/driver.rst b/Documentation/driver-api/serial/driver.rst
similarity index 99%
rename from Documentation/serial/driver.rst
rename to Documentation/driver-api/serial/driver.rst
index 4537119bf624..31bd4e16fb1f 100644
--- a/Documentation/serial/driver.rst
+++ b/Documentation/driver-api/serial/driver.rst
@@ -311,7 +311,7 @@ hardware.
 	This call must not sleep
 
   set_ldisc(port,termios)
-	Notifier for discipline change. See Documentation/serial/tty.rst.
+	Notifier for discipline change. See Documentation/driver-api/serial/tty.rst.
 
 	Locking: caller holds tty_port->mutex
 
diff --git a/Documentation/serial/index.rst b/Documentation/driver-api/serial/index.rst
similarity index 90%
rename from Documentation/serial/index.rst
rename to Documentation/driver-api/serial/index.rst
index d0ba22ea23bf..33ad10d05b26 100644
--- a/Documentation/serial/index.rst
+++ b/Documentation/driver-api/serial/index.rst
@@ -1,4 +1,4 @@
-:orphan:
+.. SPDX-License-Identifier: GPL-2.0
 
 ==========================
 Support for Serial devices
diff --git a/Documentation/serial/moxa-smartio.rst b/Documentation/driver-api/serial/moxa-smartio.rst
similarity index 100%
rename from Documentation/serial/moxa-smartio.rst
rename to Documentation/driver-api/serial/moxa-smartio.rst
diff --git a/Documentation/serial/n_gsm.rst b/Documentation/driver-api/serial/n_gsm.rst
similarity index 100%
rename from Documentation/serial/n_gsm.rst
rename to Documentation/driver-api/serial/n_gsm.rst
diff --git a/Documentation/serial/rocket.rst b/Documentation/driver-api/serial/rocket.rst
similarity index 100%
rename from Documentation/serial/rocket.rst
rename to Documentation/driver-api/serial/rocket.rst
diff --git a/Documentation/serial/serial-iso7816.rst b/Documentation/driver-api/serial/serial-iso7816.rst
similarity index 100%
rename from Documentation/serial/serial-iso7816.rst
rename to Documentation/driver-api/serial/serial-iso7816.rst
diff --git a/Documentation/serial/serial-rs485.rst b/Documentation/driver-api/serial/serial-rs485.rst
similarity index 100%
rename from Documentation/serial/serial-rs485.rst
rename to Documentation/driver-api/serial/serial-rs485.rst
diff --git a/Documentation/serial/tty.rst b/Documentation/driver-api/serial/tty.rst
similarity index 100%
rename from Documentation/serial/tty.rst
rename to Documentation/driver-api/serial/tty.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index 055db86fdd77..856db8015edd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10723,7 +10723,7 @@ F:	include/uapi/linux/meye.h
 MOXA SMARTIO/INDUSTIO/INTELLIO SERIAL CARD
 M:	Jiri Slaby <jirislaby@gmail.com>
 S:	Maintained
-F:	Documentation/serial/moxa-smartio.rst
+F:	Documentation/driver-api/serial/moxa-smartio.rst
 F:	drivers/tty/mxser.*
 
 MR800 AVERMEDIA USB FM RADIO DRIVER
@@ -13637,7 +13637,7 @@ ROCKETPORT DRIVER
 P:	Comtrol Corp.
 W:	http://www.comtrol.com
 S:	Maintained
-F:	Documentation/serial/rocket.rst
+F:	Documentation/driver-api/serial/rocket.rst
 F:	drivers/tty/rocket*
 
 ROCKETPORT EXPRESS/INFINITY DRIVER
@@ -16170,7 +16170,7 @@ M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 M:	Jiri Slaby <jslaby@suse.com>
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
-F:	Documentation/serial/
+F:	Documentation/driver-api/serial/
 F:	drivers/tty/
 F:	drivers/tty/serial/serial_core.c
 F:	include/linux/serial_core.h
diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
index ee51b9514225..c7623f99ac0f 100644
--- a/drivers/tty/Kconfig
+++ b/drivers/tty/Kconfig
@@ -175,7 +175,7 @@ config ROCKETPORT
 	  This driver supports Comtrol RocketPort and RocketModem PCI boards.   
           These boards provide 2, 4, 8, 16, or 32 high-speed serial ports or
           modems.  For information about the RocketPort/RocketModem  boards
-          and this driver read <file:Documentation/serial/rocket.rst>.
+          and this driver read <file:Documentation/driver-api/serial/rocket.rst>.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called rocket.
@@ -193,7 +193,7 @@ config CYCLADES
 	  your Linux box, for instance in order to become a dial-in server.
 
 	  For information about the Cyclades-Z card, read
-	  <file:Documentation/serial/cyclades_z.rst>.
+	  <file:Documentation/driver-api/serial/cyclades_z.rst>.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called cyclades.
diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index 6e3c66ab0e62..a0555ae2b1ef 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -1081,7 +1081,7 @@ static int qe_uart_verify_port(struct uart_port *port,
 }
 /* UART operations
  *
- * Details on these functions can be found in Documentation/serial/driver.rst
+ * Details on these functions can be found in Documentation/driver-api/serial/driver.rst
  */
 static const struct uart_ops qe_uart_pops = {
 	.tx_empty       = qe_uart_tx_empty,
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 05b179015d6c..2b78cc734719 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -32,7 +32,7 @@ struct device;
 
 /*
  * This structure describes all the operations that can be done on the
- * physical hardware.  See Documentation/serial/driver.rst for details.
+ * physical hardware.  See Documentation/driver-api/serial/driver.rst for details.
  */
 struct uart_ops {
 	unsigned int	(*tx_empty)(struct uart_port *);
-- 
2.21.0

