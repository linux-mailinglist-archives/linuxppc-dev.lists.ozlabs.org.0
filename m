Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC78540C65C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 15:26:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8gvz4dxvz2yNT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 23:26:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux-m68k.org
 (client-ip=195.130.132.45; helo=newton.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir;
 Wed, 15 Sep 2021 23:25:44 AEST
Received: from newton.telenet-ops.be (newton.telenet-ops.be [195.130.132.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8gvX4sh3z2xtd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 23:25:43 +1000 (AEST)
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 4H8gnK2yjtzMrGrB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 15:20:21 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.186.194])
 by albert.telenet-ops.be with bizsmtp
 id uDLH2500s4C55Sk06DLHoU; Wed, 15 Sep 2021 15:20:20 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mQUnf-004eT9-TO; Wed, 15 Sep 2021 15:18:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mQUT7-002gSI-H7; Wed, 15 Sep 2021 14:56:53 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Scott Wood <oss@buserror.net>
Subject: [PATCH] serial: 8250: SERIAL_8250_FSL should not default to y when
 compile-testing
Date: Wed, 15 Sep 2021 14:56:52 +0200
Message-Id: <c5f8aa5c081755f3c960b86fc61c2baaa33edcd9.1631710216.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit b1442c55ce8977aa ("serial: 8250: extend compile-test coverage")
added compile-test support to the Freescale 16550 driver.  However, as
SERIAL_8250_FSL is an invisible symbol, merely enabling COMPILE_TEST now
enables this driver.

Fix this by making SERIAL_8250_FSL visible.  Tighten the dependencies to
prevent asking the user about this driver when configuring a kernel
without appropriate Freescale SoC or ACPI support.

Fixes: b1442c55ce8977aa ("serial: 8250: extend compile-test coverage")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Yes, it's ugly, but I see no better solution. Do you?

 drivers/tty/serial/8250/Kconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index 808268edd2e82a45..a2978b31144e94f2 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -361,9 +361,13 @@ config SERIAL_8250_BCM2835AUX
 	  If unsure, say N.
 
 config SERIAL_8250_FSL
-	bool
+	bool "Freescale 16550-style UART support (8250 based driver)"
 	depends on SERIAL_8250_CONSOLE
-	default PPC || ARM || ARM64 || COMPILE_TEST
+	depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || (ARM64 && ACPI) || COMPILE_TEST
+	default FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || (ARM64 && ACPI)
+	help
+	  Selecting this option will add support for the 16550-style serial
+	  port hardware found on Freescale SoCs.
 
 config SERIAL_8250_DW
 	tristate "Support for Synopsys DesignWare 8250 quirks"
-- 
2.25.1

