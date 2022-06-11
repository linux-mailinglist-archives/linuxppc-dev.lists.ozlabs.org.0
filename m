Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D505476A2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 18:53:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LL3mm4lKTz3dQK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jun 2022 02:53:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL3l73Y02z3cdw
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jun 2022 02:51:47 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LL3kp2m7mz9tS8;
	Sat, 11 Jun 2022 18:51:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e77kAmNzPPzI; Sat, 11 Jun 2022 18:51:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LL3kl4SXYz9tS6;
	Sat, 11 Jun 2022 18:51:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7AC1B8B783;
	Sat, 11 Jun 2022 18:51:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id qK8-bb-lMSX0; Sat, 11 Jun 2022 18:51:27 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.192])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 038FC8B77D;
	Sat, 11 Jun 2022 18:51:26 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 25BGpDjx741172
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 11 Jun 2022 18:51:13 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 25BGpDmc741171;
	Sat, 11 Jun 2022 18:51:13 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, deller@gmx.de,
        manoj@linux.ibm.com, mrochs@linux.ibm.com, ukrishn@linux.ibm.com,
        jejb@linux.ibm.com, martin.petersen@oracle.com, tzimmermann@suse.de
Subject: [PATCH 2/4] scsi: cxlflash: Include missing linux/irqdomain.h
Date: Sat, 11 Jun 2022 18:50:58 +0200
Message-Id: <96e4cebb9f89660bf675cd1e5bf64cf768c0e6dc.1654966253.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <a1dfa936043eeed715e8cda7f8690fe553ba7c1a.1654966253.git.christophe.leroy@csgroup.eu>
References: <a1dfa936043eeed715e8cda7f8690fe553ba7c1a.1654966253.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1654966257; l=1730; s=20211009; h=from:subject:message-id; bh=glmmLkFUWKcFwMf3WNV7HqMCb0JAThkOWfrVWSfs2s0=; b=NI0seT4vXO19PwvZEf7YjuHZEAl9XjLEq9W3Qz/Vkxre0gC8NEpZDVtb1VWxKHHWiPv9WihqH755 y5rrUMutDRxxZhmCt1B9gCk9RzA1yquhu4Cfx00zbOJeXFIQoYJL
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
Cc: linux-fbdev@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc's asm/prom.h brings some headers that it doesn't need itself.

Once those headers are removed from asm/prom.h, the following
errors occur:

  CC [M]  drivers/scsi/cxlflash/ocxl_hw.o
drivers/scsi/cxlflash/ocxl_hw.c: In function 'afu_map_irq':
drivers/scsi/cxlflash/ocxl_hw.c:195:16: error: implicit declaration of function 'irq_create_mapping' [-Werror=implicit-function-declaration]
  195 |         virq = irq_create_mapping(NULL, irq->hwirq);
      |                ^~~~~~~~~~~~~~~~~~
drivers/scsi/cxlflash/ocxl_hw.c:222:9: error: implicit declaration of function 'irq_dispose_mapping' [-Werror=implicit-function-declaration]
  222 |         irq_dispose_mapping(virq);
      |         ^~~~~~~~~~~~~~~~~~~
drivers/scsi/cxlflash/ocxl_hw.c: In function 'afu_unmap_irq':
drivers/scsi/cxlflash/ocxl_hw.c:264:13: error: implicit declaration of function 'irq_find_mapping'; did you mean 'is_cow_mapping'? [-Werror=implicit-function-declaration]
  264 |         if (irq_find_mapping(NULL, irq->hwirq)) {
      |             ^~~~~~~~~~~~~~~~
      |             is_cow_mapping
cc1: some warnings being treated as errors

Fix it by including linux/irqdomain.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/scsi/cxlflash/ocxl_hw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
index 244fc27215dc..631eda2d467e 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -16,6 +16,7 @@
 #include <linux/poll.h>
 #include <linux/sched/signal.h>
 #include <linux/interrupt.h>
+#include <linux/irqdomain.h>
 #include <asm/xive.h>
 #include <misc/ocxl.h>
 
-- 
2.35.3

