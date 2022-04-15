Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DEB5026E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 10:41:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfqYw4Fbcz3bXq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 18:41:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfqYW1hBSz2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 18:41:18 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KfqYQ5GBXz9sTl;
 Fri, 15 Apr 2022 10:41:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cnvaje_jr36M; Fri, 15 Apr 2022 10:41:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KfqYQ4P8Hz9sTc;
 Fri, 15 Apr 2022 10:41:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 83BC98B778;
 Fri, 15 Apr 2022 10:41:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FbeYgdJuP9wg; Fri, 15 Apr 2022 10:41:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 685C18B764;
 Fri, 15 Apr 2022 10:41:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 23F8f47P1535056
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 15 Apr 2022 10:41:04 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 23F8f4ch1535055;
 Fri, 15 Apr 2022 10:41:04 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2] char: tpm: Prepare cleanup of powerpc's asm/prom.h
Date: Fri, 15 Apr 2022 10:40:59 +0200
Message-Id: <a3188c216e3cc59b12c5ea3682e233733911475d.1650012003.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1650012058; l=1804; s=20211009;
 h=from:subject:message-id; bh=laEHdlAgAs/Q2svl9E1r8Ks4UkHqnLIbIE7RJWdkDX0=;
 b=Dl23TTptfZCDKMsY+HCUPjlD1Z4/HVOQLbOyXM1bmbDS9LWsPuu31yDRopWUQMAB09Osn9x5yZW5
 e40RypkZAyU0LPYcfNRQ7OleWwEP2DcjB5IkSjCoLnvJ0UQr1U75
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
Cc: linux-arm-kernel@lists.infradead.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc's asm/prom.h brings some headers that it doesn't
need itself.

In order to clean it up in a further step, first clean all
files that include asm/prom.h

Some files don't need asm/prom.h at all. For those ones,
just remove inclusion of asm/prom.h

Some files don't need any of the items provided by asm/prom.h,
but need some of the headers included by asm/prom.h. For those
ones, add the needed headers that are brought by asm/prom.h at
the moment, then remove asm/prom.h

Some files really need asm/prom.h but also need some of the
headers included by asm/prom.h. For those one, leave asm/prom.h
but also add the needed headers so that they can be removed
from asm/prom.h in a later step.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: More detailed commit description
---
 drivers/char/tpm/tpm_atmel.h   | 2 --
 drivers/char/tpm/tpm_ibmvtpm.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/char/tpm/tpm_atmel.h b/drivers/char/tpm/tpm_atmel.h
index ba37e77e8af3..959f7cce8301 100644
--- a/drivers/char/tpm/tpm_atmel.h
+++ b/drivers/char/tpm/tpm_atmel.h
@@ -26,8 +26,6 @@ struct tpm_atmel_priv {
 
 #ifdef CONFIG_PPC64
 
-#include <asm/prom.h>
-
 #define atmel_getb(priv, offset) readb(priv->iobase + offset)
 #define atmel_putb(val, priv, offset) writeb(val, priv->iobase + offset)
 #define atmel_request_region request_mem_region
diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index 3af4c07a9342..1180cce7067a 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -20,7 +20,6 @@
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/wait.h>
-#include <asm/prom.h>
 
 #include "tpm.h"
 #include "tpm_ibmvtpm.h"
-- 
2.35.1

