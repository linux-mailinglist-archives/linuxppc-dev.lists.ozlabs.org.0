Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C557F5CDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 11:49:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iRG8lggd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbZcq1Cs0z3vcH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 21:49:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iRG8lggd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbZb61q3sz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 21:48:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 43CB361F0C;
	Thu, 23 Nov 2023 10:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54935C433C8;
	Thu, 23 Nov 2023 10:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700736495;
	bh=C+pNMYVLFZEmoFSbcwLsLirku3hsdHnT0ZOPIncJ5go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRG8lggdbvok32Jt1t2luxAHhXf4vpDXyQYUCywG0OpPWeBQRKMMXuvRbJcaLIoey
	 FZ1gcHucb3rsW9yiPHTQKm3bdccnyCEAbJuAX+OoD8yy00Wg6ziFj/tiJ3BGlEJBd5
	 7nWYhp+sYVXFeZ3AJ9HVEzLvCKkdYbABk4ORpjfjSgArvEU6rtE3sNV6ME7SdtVHaU
	 b6z4+SJYMdu7nUhBrj02zQA/CH/1gZmhV84bd0mp8PvtlXi7iETLVHTdxWuFUXIfF/
	 mwSihdNvMnJMeuorFxdmW93sUgIXg92TJwzBawfkX70Yf1KxpT7Gvnq47kAVKjtDn3
	 5VMKP+R09gD6g==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 1/3] powerpc: ps3: move udbg_shutdown_ps3gelic prototype
Date: Thu, 23 Nov 2023 11:47:59 +0100
Message-Id: <20231123104801.15537-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231123104801.15537-1-arnd@kernel.org>
References: <20231123104801.15537-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Allmodconfig kernels produce a missing-prototypes warning:

arch/powerpc/platforms/ps3/gelic_udbg.c:239:6: error: no previous prototype for 'udbg_shutdown_ps3gelic' [-Werror=missing-prototypes]

Move the declaration from a local header to asm/ps3.h where it can be
seen from both the caller and the definition. As suggested
by Michael Ellerman, remove the CONFIG_PS3GELIC_UDBG option to
prevent this from causing a build regression.

Acked-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/Kconfig.debug                   |  1 -
 arch/powerpc/include/asm/ps3.h               |  6 ++++++
 arch/powerpc/platforms/ps3/Kconfig           | 12 ------------
 arch/powerpc/platforms/ps3/Makefile          |  2 +-
 arch/powerpc/platforms/ps3/gelic_udbg.c      |  1 +
 drivers/net/ethernet/toshiba/ps3_gelic_net.h |  6 ------
 6 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index ea4033abc07d..8c80b154e814 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -271,7 +271,6 @@ config PPC_EARLY_DEBUG_USBGECKO
 config PPC_EARLY_DEBUG_PS3GELIC
 	bool "Early debugging through the PS3 Ethernet port"
 	depends on PPC_PS3
-	select PS3GELIC_UDBG
 	help
 	  Select this to enable early debugging for the PlayStation3 via
 	  UDP broadcasts sent out through the Ethernet port.
diff --git a/arch/powerpc/include/asm/ps3.h b/arch/powerpc/include/asm/ps3.h
index a5f36546a052..d13d8fdc3411 100644
--- a/arch/powerpc/include/asm/ps3.h
+++ b/arch/powerpc/include/asm/ps3.h
@@ -514,4 +514,10 @@ u64 ps3_get_spe_id(void *arg);
 
 void ps3_early_mm_init(void);
 
+#ifdef CONFIG_PPC_EARLY_DEBUG_PS3GELIC
+void udbg_shutdown_ps3gelic(void);
+#else
+static inline void udbg_shutdown_ps3gelic(void) {}
+#endif
+
 #endif
diff --git a/arch/powerpc/platforms/ps3/Kconfig b/arch/powerpc/platforms/ps3/Kconfig
index a44869e5ea70..e9c1087dd42e 100644
--- a/arch/powerpc/platforms/ps3/Kconfig
+++ b/arch/powerpc/platforms/ps3/Kconfig
@@ -167,16 +167,4 @@ config PS3_LPM
 	  profiling support of the Cell processor with programs like
 	  perfmon2, then say Y or M, otherwise say N.
 
-config PS3GELIC_UDBG
-	bool "PS3 udbg output via UDP broadcasts on Ethernet"
-	depends on PPC_PS3
-	help
-	  Enables udbg early debugging output by sending broadcast UDP
-	  via the Ethernet port (UDP port number 18194).
-
-	  This driver uses a trivial implementation and is independent
-	  from the main PS3 gelic network driver.
-
-	  If in doubt, say N here.
-
 endmenu
diff --git a/arch/powerpc/platforms/ps3/Makefile b/arch/powerpc/platforms/ps3/Makefile
index 86bf2967a8d4..bc79bb124d1e 100644
--- a/arch/powerpc/platforms/ps3/Makefile
+++ b/arch/powerpc/platforms/ps3/Makefile
@@ -3,7 +3,7 @@ obj-y += setup.o mm.o time.o hvcall.o htab.o repository.o
 obj-y += interrupt.o exports.o os-area.o
 obj-y += system-bus.o
 
-obj-$(CONFIG_PS3GELIC_UDBG) += gelic_udbg.o
+obj-$(CONFIG_PPC_EARLY_DEBUG_PS3GELIC) += gelic_udbg.o
 obj-$(CONFIG_SMP) += smp.o
 obj-$(CONFIG_SPU_BASE) += spu.o
 obj-y += device-init.o
diff --git a/arch/powerpc/platforms/ps3/gelic_udbg.c b/arch/powerpc/platforms/ps3/gelic_udbg.c
index 6b298010fd84..a5202c18c236 100644
--- a/arch/powerpc/platforms/ps3/gelic_udbg.c
+++ b/arch/powerpc/platforms/ps3/gelic_udbg.c
@@ -14,6 +14,7 @@
 #include <linux/ip.h>
 #include <linux/udp.h>
 
+#include <asm/ps3.h>
 #include <asm/io.h>
 #include <asm/udbg.h>
 #include <asm/lv1call.h>
diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.h b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
index 0d98defb011e..0ec7412febc7 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.h
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
@@ -346,12 +346,6 @@ static inline void *port_priv(struct gelic_port *port)
 	return port->priv;
 }
 
-#ifdef CONFIG_PPC_EARLY_DEBUG_PS3GELIC
-void udbg_shutdown_ps3gelic(void);
-#else
-static inline void udbg_shutdown_ps3gelic(void) {}
-#endif
-
 int gelic_card_set_irq_mask(struct gelic_card *card, u64 mask);
 /* shared netdev ops */
 void gelic_card_up(struct gelic_card *card);
-- 
2.39.2

