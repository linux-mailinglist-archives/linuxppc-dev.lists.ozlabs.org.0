Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB8A76EBB7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 16:03:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGrCs25xqz3fkt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 00:03:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGr5Y1CgPz3cWq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 23:57:52 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RGr4v4KHDz9t5J;
	Thu,  3 Aug 2023 15:57:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBQnO2JIAsnV; Thu,  3 Aug 2023 15:57:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RGr4m4W8Qz9t48;
	Thu,  3 Aug 2023 15:57:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 964E88B773;
	Thu,  3 Aug 2023 15:57:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Kl1IMwn4jdMF; Thu,  3 Aug 2023 15:57:12 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.144])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4DE3C8B763;
	Thu,  3 Aug 2023 15:57:12 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 373Dv3sK494201
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 3 Aug 2023 15:57:04 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 373Dv3Bu494200;
	Thu, 3 Aug 2023 15:57:03 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Timur Tabi <timur@kernel.org>
Subject: [PATCH v1 09/12] serial: cpm_uart: Remove cpm_uart/ subdirectory
Date: Thu,  3 Aug 2023 15:56:50 +0200
Message-ID: <9b8b8f89fc386480030f5339abe307541ae436a6.1691068700.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691068700.git.christophe.leroy@csgroup.eu>
References: <cover.1691068700.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691071001; l=2136; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=2acxSC4fZPJjOV4LM1mPnEJI/PngyFJEEkHBhlNg2TQ=; b=YgxQ7g01RNqoTvf18homXVUBRxjsg1kJK1TG/t81XtG70hzyS7tP4/HhQj2wTPUREm8mR1+5G 9laqmukkjvLAcDprHTMnYDsSiey4AJOjP5epzhqNSdxFsKkQ6OfYU44
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cpm_uart/ subdirectory only has cpm_uart_core.c and cpm_uart.h now.

Move them up and remove cpm_uart/ directory while renaming
cpm_uart_core.c as cpm_uart.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/tty/serial/Makefile                                 | 2 +-
 drivers/tty/serial/{cpm_uart/cpm_uart_core.c => cpm_uart.c} | 0
 drivers/tty/serial/{cpm_uart => }/cpm_uart.h                | 0
 drivers/tty/serial/cpm_uart/Makefile                        | 6 ------
 4 files changed, 1 insertion(+), 7 deletions(-)
 rename drivers/tty/serial/{cpm_uart/cpm_uart_core.c => cpm_uart.c} (100%)
 rename drivers/tty/serial/{cpm_uart => }/cpm_uart.h (100%)
 delete mode 100644 drivers/tty/serial/cpm_uart/Makefile

diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
index d4123469583d..138abbc89738 100644
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@ -41,7 +41,7 @@ obj-$(CONFIG_SERIAL_HS_LPC32XX) += lpc32xx_hs.o
 obj-$(CONFIG_SERIAL_DZ) += dz.o
 obj-$(CONFIG_SERIAL_ZS) += zs.o
 obj-$(CONFIG_SERIAL_SH_SCI) += sh-sci.o
-obj-$(CONFIG_SERIAL_CPM) += cpm_uart/
+obj-$(CONFIG_SERIAL_CPM) += cpm_uart.o
 obj-$(CONFIG_SERIAL_IMX) += imx.o
 obj-$(CONFIG_SERIAL_IMX_EARLYCON) += imx_earlycon.o
 obj-$(CONFIG_SERIAL_MPC52xx) += mpc52xx_uart.o
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart.c
similarity index 100%
rename from drivers/tty/serial/cpm_uart/cpm_uart_core.c
rename to drivers/tty/serial/cpm_uart.c
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart.h b/drivers/tty/serial/cpm_uart.h
similarity index 100%
rename from drivers/tty/serial/cpm_uart/cpm_uart.h
rename to drivers/tty/serial/cpm_uart.h
diff --git a/drivers/tty/serial/cpm_uart/Makefile b/drivers/tty/serial/cpm_uart/Makefile
deleted file mode 100644
index 91f202fa5251..000000000000
--- a/drivers/tty/serial/cpm_uart/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Makefile for the Motorola 8xx FEC ethernet controller
-#
-
-obj-$(CONFIG_SERIAL_CPM) += cpm_uart_core.o
-- 
2.41.0

