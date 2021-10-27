Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F4043C796
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 12:23:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfPsw0SCCz3bjG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 21:23:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux-m68k.org
 (client-ip=2a02:1800:120:4::f00:d; helo=newton.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
X-Greylist: delayed 455 seconds by postgrey-1.36 at boromir;
 Wed, 27 Oct 2021 21:23:06 AEDT
Received: from newton.telenet-ops.be (newton.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfPsQ6kRTz2xX5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 21:23:06 +1100 (AEDT)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 4HfPhM6TLmzMr5fj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 12:15:15 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:441:6c1a:bc30:46e])
 by xavier.telenet-ops.be with bizsmtp
 id AyFF260052hfXWm01yFFKF; Wed, 27 Oct 2021 12:15:15 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mffiU-008HRd-Op; Wed, 27 Oct 2021 11:59:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mfdkV-00DitM-UB; Wed, 27 Oct 2021 09:53:27 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH] serial: cpm_uart: Protect udbg definitions by
 CONFIG_SERIAL_CPM_CONSOLE
Date: Wed, 27 Oct 2021 09:53:26 +0200
Message-Id: <20211027075326.3270785-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 linux-serial@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If CONFIG_CONSOLE_POLL=y, and CONFIG_SERIAL_CPM=m (hence
CONFIG_SERIAL_CPM_CONSOLE=n):

    drivers/tty/serial/cpm_uart/cpm_uart_core.c:1109:12: warning: ‘udbg_cpm_getc’ defined but not used [-Wunused-function]
     1109 | static int udbg_cpm_getc(void)
	  |            ^~~~~~~~~~~~~
    drivers/tty/serial/cpm_uart/cpm_uart_core.c:1095:13: warning: ‘udbg_cpm_putc’ defined but not used [-Wunused-function]
     1095 | static void udbg_cpm_putc(char c)
	  |             ^~~~~~~~~~~~~

Fix this by making the udbg definitions depend on
CONFIG_SERIAL_CPM_CONSOLE, in addition to CONFIG_CONSOLE_POLL.

Fixes: a60526097f42eb98 ("tty: serial: cpm_uart: Add udbg support for enabling xmon")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
One more casualty of CONFIG_WERROR=y.
http://kisskb.ellerman.id.au/kisskb/buildresult/14652935/
---
 drivers/tty/serial/cpm_uart/cpm_uart_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
index c719aa2b18328321..d6d3db9c3b1f83ab 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
@@ -1090,6 +1090,7 @@ static void cpm_put_poll_char(struct uart_port *port,
 	cpm_uart_early_write(pinfo, ch, 1, false);
 }
 
+#ifdef CONFIG_SERIAL_CPM_CONSOLE
 static struct uart_port *udbg_port;
 
 static void udbg_cpm_putc(char c)
@@ -1114,6 +1115,7 @@ static int udbg_cpm_getc(void)
 		cpu_relax();
 	return c;
 }
+#endif /* CONFIG_SERIAL_CPM_CONSOLE */
 
 #endif /* CONFIG_CONSOLE_POLL */
 
-- 
2.25.1

