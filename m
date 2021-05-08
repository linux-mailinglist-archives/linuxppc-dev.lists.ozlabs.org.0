Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD37C377020
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 08:36:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fcczk5nMSz309L
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 16:36:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcczK5bFtz2yXT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 16:36:25 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FcczB5JQCz9sbc;
 Sat,  8 May 2021 08:36:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dY9LIrX_eqFv; Sat,  8 May 2021 08:36:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FcczB4NYRz9sbC;
 Sat,  8 May 2021 08:36:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 75EEB8B774;
 Sat,  8 May 2021 08:36:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id P8c3zfm0TPmD; Sat,  8 May 2021 08:36:22 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 36C838B76B;
 Sat,  8 May 2021 08:36:22 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id ED3396492C; Sat,  8 May 2021 06:36:21 +0000 (UTC)
Message-Id: <d5e3c8e66bad3725d7d48d0e45c4b7eb7c02631d.1620455671.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/legacy_serial: Fix UBSAN: array-index-out-of-bounds
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 pmenzel@molgen.mpg.de
Date: Sat,  8 May 2021 06:36:21 +0000 (UTC)
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

UBSAN complains when a pointer is calculated with invalid
'legacy_serial_console' index, allthough the index is verified
before dereferencing the pointer.

Fix it by checking 'legacy_serial_console' validity before
calculating pointers.

Fixes: 0bd3f9e953bd ("powerpc/legacy_serial: Use early_ioremap()")
Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/legacy_serial.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index 8b2c1a8553a0..1c2e09e1d59b 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -354,15 +354,12 @@ static void __init setup_legacy_serial_console(int console)
 	udbg_uart_setup(info->speed, info->clock);
 }
 
-static int __init ioremap_legacy_serial_console(void)
+static int __init do_ioremap_legacy_serial_console(int console)
 {
-	struct legacy_serial_info *info = &legacy_serial_infos[legacy_serial_console];
-	struct plat_serial8250_port *port = &legacy_serial_ports[legacy_serial_console];
+	struct legacy_serial_info *info = &legacy_serial_infos[console];
+	struct plat_serial8250_port *port = &legacy_serial_ports[console];
 	void __iomem *vaddr;
 
-	if (legacy_serial_console < 0)
-		return 0;
-
 	if (!info->early_addr)
 		return 0;
 
@@ -376,6 +373,13 @@ static int __init ioremap_legacy_serial_console(void)
 
 	return 0;
 }
+
+static int __init ioremap_legacy_serial_console(void)
+{
+	if (legacy_serial_console < 0)
+		return 0;
+	return do_ioremap_legacy_serial_console(legacy_serial_console);
+}
 early_initcall(ioremap_legacy_serial_console);
 
 /*
-- 
2.25.0

