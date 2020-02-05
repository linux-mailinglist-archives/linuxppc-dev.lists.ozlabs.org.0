Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FF3153050
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 13:05:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CKyj0TbFzDqNf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 23:05:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=GU46OkPe; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CKwN6JSszDqH2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2020 23:03:47 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48CKwG2j3Wz9vBQB;
 Wed,  5 Feb 2020 13:03:42 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=GU46OkPe; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id n2QPUTf7otnk; Wed,  5 Feb 2020 13:03:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48CKwG1bYZz9vBQ8;
 Wed,  5 Feb 2020 13:03:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580904222; bh=C5M0Cj48NNBEOYHvqWjd1d/qw7guwrS5qscRXgVUNqo=;
 h=From:Subject:To:Cc:Date:From;
 b=GU46OkPeZvmRZ+kSnunZ4z8NT27FmHv/6wZpZ5v7QvXy5JwdOpdiLTLkEGIcC67tm
 U+vyox2GfDccu9iull750PB+VrBMkKA49BDq6rJ63VI8g891qH1zmome77g5/vjbcm
 QvlRLB5YxK6XWdIAAVWX1PwMbVLrSoaL9C6asddI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F37A8B838;
 Wed,  5 Feb 2020 13:03:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DjYsAgrkX-J5; Wed,  5 Feb 2020 13:03:43 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2321D8B835;
 Wed,  5 Feb 2020 13:03:43 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CE24665266; Wed,  5 Feb 2020 12:03:42 +0000 (UTC)
Message-Id: <3df15946ed0c29663dc7928b31ca07576e1444f6.1580904214.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/legacy_serial: Use early_ioremap()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  5 Feb 2020 12:03:42 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[    0.000000] ioremap() called early from find_legacy_serial_ports+0x3cc/0x474. Use early_ioremap() instead

find_legacy_serial_ports() is called early from setup_arch(), before
paging_init(). vmalloc is not available yet, ioremap shouldn't be
used that early.

Use early_ioremap() and switch to a regular ioremap() later.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/legacy_serial.c | 33 +++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index f061e06e9f51..8b2c1a8553a0 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -15,6 +15,7 @@
 #include <asm/udbg.h>
 #include <asm/pci-bridge.h>
 #include <asm/ppc-pci.h>
+#include <asm/early_ioremap.h>
 
 #undef DEBUG
 
@@ -34,6 +35,7 @@ static struct legacy_serial_info {
 	unsigned int			clock;
 	int				irq_check_parent;
 	phys_addr_t			taddr;
+	void __iomem			*early_addr;
 } legacy_serial_infos[MAX_LEGACY_SERIAL_PORTS];
 
 static const struct of_device_id legacy_serial_parents[] __initconst = {
@@ -325,17 +327,16 @@ static void __init setup_legacy_serial_console(int console)
 {
 	struct legacy_serial_info *info = &legacy_serial_infos[console];
 	struct plat_serial8250_port *port = &legacy_serial_ports[console];
-	void __iomem *addr;
 	unsigned int stride;
 
 	stride = 1 << port->regshift;
 
 	/* Check if a translated MMIO address has been found */
 	if (info->taddr) {
-		addr = ioremap(info->taddr, 0x1000);
-		if (addr == NULL)
+		info->early_addr = early_ioremap(info->taddr, 0x1000);
+		if (info->early_addr == NULL)
 			return;
-		udbg_uart_init_mmio(addr, stride);
+		udbg_uart_init_mmio(info->early_addr, stride);
 	} else {
 		/* Check if it's PIO and we support untranslated PIO */
 		if (port->iotype == UPIO_PORT && isa_io_special)
@@ -353,6 +354,30 @@ static void __init setup_legacy_serial_console(int console)
 	udbg_uart_setup(info->speed, info->clock);
 }
 
+static int __init ioremap_legacy_serial_console(void)
+{
+	struct legacy_serial_info *info = &legacy_serial_infos[legacy_serial_console];
+	struct plat_serial8250_port *port = &legacy_serial_ports[legacy_serial_console];
+	void __iomem *vaddr;
+
+	if (legacy_serial_console < 0)
+		return 0;
+
+	if (!info->early_addr)
+		return 0;
+
+	vaddr = ioremap(info->taddr, 0x1000);
+	if (WARN_ON(!vaddr))
+		return -ENOMEM;
+
+	udbg_uart_init_mmio(vaddr, 1 << port->regshift);
+	early_iounmap(info->early_addr, 0x1000);
+	info->early_addr = NULL;
+
+	return 0;
+}
+early_initcall(ioremap_legacy_serial_console);
+
 /*
  * This is called very early, as part of setup_system() or eventually
  * setup_arch(), basically before anything else in this file. This function
-- 
2.25.0

