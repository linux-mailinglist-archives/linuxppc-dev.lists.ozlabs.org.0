Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6427C4F006E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 12:19:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVtLt2NfDz3c2N
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 21:19:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVtLT1FxYz2x99
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 21:19:11 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KVtLN4g91z9sSZ;
 Sat,  2 Apr 2022 12:19:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s7QbbWbzQsQ4; Sat,  2 Apr 2022 12:19:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KVtLN3qx2z9sSY;
 Sat,  2 Apr 2022 12:19:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7162A8B76D;
 Sat,  2 Apr 2022 12:19:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SZjgNuEO6j77; Sat,  2 Apr 2022 12:19:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.136])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 325398B768;
 Sat,  2 Apr 2022 12:19:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 232AIvQ2685097
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 2 Apr 2022 12:18:57 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 232AIu7B685096;
 Sat, 2 Apr 2022 12:18:56 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH] tty: hvc: Prepare cleanup of powerpc's asm/prom.h
Date: Sat,  2 Apr 2022 12:18:55 +0200
Message-Id: <8b3dbd25bbeb7949e1b0a2170fee7b9cc5a6f806.1648833418.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648894734; l=1944; s=20211009;
 h=from:subject:message-id; bh=d4LUWHLQYB2RBspoMFrYGp7sUPtfQOfZFFYlzBwjZ18=;
 b=BiONXo4uG0mji8rDUYDSSVtILJOt/5u6tTHNB7KtyrLARFgmQXCZKYViu1UctfBdC3xXB07nas8K
 CRNGLeYXAi1pENCITDmhjrchHk5Avf0ouiYheeH58S9RAZaYdO8l
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc's asm/prom.h brings some headers that it doesn't
need itself.

In order to clean it up, first add missing headers in
users of asm/prom.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/tty/hvc/hvc_opal.c | 2 +-
 drivers/tty/hvc/hvc_vio.c  | 2 +-
 drivers/tty/hvc/hvsi.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
index 056ae21a5121..84776bc641e6 100644
--- a/drivers/tty/hvc/hvc_opal.c
+++ b/drivers/tty/hvc/hvc_opal.c
@@ -13,12 +13,12 @@
 #include <linux/slab.h>
 #include <linux/console.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/export.h>
 #include <linux/interrupt.h>
 
 #include <asm/hvconsole.h>
-#include <asm/prom.h>
 #include <asm/firmware.h>
 #include <asm/hvsi.h>
 #include <asm/udbg.h>
diff --git a/drivers/tty/hvc/hvc_vio.c b/drivers/tty/hvc/hvc_vio.c
index 72b11aa7e0a6..736b230f5ec0 100644
--- a/drivers/tty/hvc/hvc_vio.c
+++ b/drivers/tty/hvc/hvc_vio.c
@@ -28,10 +28,10 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/console.h>
+#include <linux/of.h>
 
 #include <asm/hvconsole.h>
 #include <asm/vio.h>
-#include <asm/prom.h>
 #include <asm/hvsi.h>
 #include <asm/udbg.h>
 #include <asm/machdep.h>
diff --git a/drivers/tty/hvc/hvsi.c b/drivers/tty/hvc/hvsi.c
index aa81f4835fef..a200d01eceed 100644
--- a/drivers/tty/hvc/hvsi.c
+++ b/drivers/tty/hvc/hvsi.c
@@ -26,13 +26,13 @@
 #include <linux/module.h>
 #include <linux/major.h>
 #include <linux/kernel.h>
+#include <linux/of_irq.h>
 #include <linux/spinlock.h>
 #include <linux/sysrq.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
 #include <asm/hvcall.h>
 #include <asm/hvconsole.h>
-#include <asm/prom.h>
 #include <linux/uaccess.h>
 #include <asm/vio.h>
 #include <asm/param.h>
-- 
2.35.1

