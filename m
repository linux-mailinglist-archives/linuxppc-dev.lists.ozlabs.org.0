Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D022365A32
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 15:33:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPl4Z2F2zz30HD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 23:33:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPl492vcSz2xfr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 23:32:54 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FPl402GBrz9vBL3;
 Tue, 20 Apr 2021 15:32:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id CdJ_Rbk7WgIU; Tue, 20 Apr 2021 15:32:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FPl401SmBz9vBKm;
 Tue, 20 Apr 2021 15:32:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 905058B7ED;
 Tue, 20 Apr 2021 15:32:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1E2egr5WWqn7; Tue, 20 Apr 2021 15:32:49 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 47FDF8B807;
 Tue, 20 Apr 2021 15:32:49 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 28B6B6770B; Tue, 20 Apr 2021 13:32:49 +0000 (UTC)
Message-Id: <103ed8ee9e5973c958ec1da2d0b0764f69395d01.1618925560.git.christophe.leroy@csgroup.eu>
In-Reply-To: <0d51620eacf036d683d1a3c41328f69adb601dc0.1618925560.git.christophe.leroy@csgroup.eu>
References: <0d51620eacf036d683d1a3c41328f69adb601dc0.1618925560.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/2] powerpc/legacy_serial: Use early_ioremap()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 chris.packham@alliedtelesis.co.nz
Date: Tue, 20 Apr 2021 13:32:49 +0000 (UTC)
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

From: Christophe Leroy <christophe.leroy@c-s.fr>

[    0.000000] ioremap() called early from find_legacy_serial_ports+0x3cc/0x474. Use early_ioremap() instead

find_legacy_serial_ports() is called early from setup_arch(), before
paging_init(). vmalloc is not available yet, ioremap shouldn't be
used that early.

Use early_ioremap() and switch to a regular ioremap() later.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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

