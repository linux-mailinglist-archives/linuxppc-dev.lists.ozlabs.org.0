Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC28956A55F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 16:28:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdzKP50czz3dqg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 00:28:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdzJm4WwYz3c7q
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 00:27:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LdzJj2k5kz9tGl;
	Thu,  7 Jul 2022 16:27:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lIQkD5xcE8ZG; Thu,  7 Jul 2022 16:27:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LdzJj227gz9tGb;
	Thu,  7 Jul 2022 16:27:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 342598B7A0;
	Thu,  7 Jul 2022 16:27:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0l7yik7sNIjV; Thu,  7 Jul 2022 16:27:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.174])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F02258B768;
	Thu,  7 Jul 2022 16:27:32 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 267ERNJ1537817
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 7 Jul 2022 16:27:23 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 267ERN5e537814;
	Thu, 7 Jul 2022 16:27:23 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 2/4] scsi: cxlflash: Include missing linux/irqdomain.h
Date: Thu,  7 Jul 2022 16:27:02 +0200
Message-Id: <8359b1bc3a41248774bbf4315e16ee976253da71.1657204012.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <d107b9ed8b4ba5d10d1df7ba6317c36d07f2317e.1657204012.git.christophe.leroy@csgroup.eu>
References: <d107b9ed8b4ba5d10d1df7ba6317c36d07f2317e.1657204012.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657204023; l=1730; s=20211009; h=from:subject:message-id; bh=48X8ZLFinvI6xSHRLAcSqxxzVN1Ahbtv4N3knADh6qU=; b=eAJvsyerAvje7AiQN3MCv3NhddrpdB0+VxBxgWYhX3bfnJOTilfqQ2AmmyKkDdTBGUyzAESYIeZm W4LZVpnRA/nwuefIZACIQDVyMv1hFH0QKqKmccM3lnvAm99QrHoh
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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
2.36.1

