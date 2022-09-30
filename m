Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 554515F0692
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 10:34:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf3ST1j1rz3f2W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 18:34:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf3S43xpCz2xy2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 18:34:26 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Mf3Ry0qJBz9spw;
	Fri, 30 Sep 2022 10:34:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XCZOBoODzobB; Fri, 30 Sep 2022 10:34:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Mf3Rx71YRz9spk;
	Fri, 30 Sep 2022 10:34:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E073D8B77C;
	Fri, 30 Sep 2022 10:34:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id LgUqmxvfm-X2; Fri, 30 Sep 2022 10:34:21 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.36])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FA358B763;
	Fri, 30 Sep 2022 10:34:21 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 28U8Y8rb592601
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Sep 2022 10:34:09 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 28U8Y8vK592599;
	Fri, 30 Sep 2022 10:34:08 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH] serial: cpm_uart: Don't request IRQ too early for console port
Date: Fri, 30 Sep 2022 10:33:56 +0200
Message-Id: <8bed0f30c2e9ef16ae64fb1243a16d54a48eb8da.1664526717.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1664526833; l=2487; s=20211009; h=from:subject:message-id; bh=Yu/jJ7+FWH6Gqx/87LIsVGgkhc4/6uGYsUdAKRxFQnM=; b=GjdQZ7trNHWV7vAf+pSYHG74IWPXZuBU/cM+hFTIrfu9YCC9VwNGMTovAqz2vyCCRlVW2Nx6/oCq 7M2i1Lz9Dn8BPtdh/bQOZmFhvkgwT4l9OyRJtMOql7yPugvIF2Jj
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
Cc: stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following message is seen during boot and the activation of
console port gets delayed until normal serial ports activation.

[    0.001346] irq: no irq domain found for pic@930 !

The console port doesn't need irq, perform irq reservation later,
during cpm_uart probe.

While at it, don't use NO_IRQ but 0 which is the value returned
by irq_of_parse_and_map() in case of error. By chance powerpc's
NO_IRQ has value 0 but on some architectures it is -1.

Fixes: 14d893fc6846 ("powerpc/8xx: Convert CPM1 interrupt controller to platform_device")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/tty/serial/cpm_uart/cpm_uart_core.c | 22 ++++++++++-----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
index db07d6a5d764..fa5c4633086e 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
@@ -1214,12 +1214,6 @@ static int cpm_uart_init_port(struct device_node *np,
 	pinfo->port.fifosize = pinfo->tx_nrfifos * pinfo->tx_fifosize;
 	spin_lock_init(&pinfo->port.lock);
 
-	pinfo->port.irq = irq_of_parse_and_map(np, 0);
-	if (pinfo->port.irq == NO_IRQ) {
-		ret = -EINVAL;
-		goto out_pram;
-	}
-
 	for (i = 0; i < NUM_GPIOS; i++) {
 		struct gpio_desc *gpiod;
 
@@ -1229,7 +1223,7 @@ static int cpm_uart_init_port(struct device_node *np,
 
 		if (IS_ERR(gpiod)) {
 			ret = PTR_ERR(gpiod);
-			goto out_irq;
+			goto out_pram;
 		}
 
 		if (gpiod) {
@@ -1255,8 +1249,6 @@ static int cpm_uart_init_port(struct device_node *np,
 
 	return cpm_uart_request_port(&pinfo->port);
 
-out_irq:
-	irq_dispose_mapping(pinfo->port.irq);
 out_pram:
 	cpm_uart_unmap_pram(pinfo, pram);
 out_mem:
@@ -1436,11 +1428,17 @@ static int cpm_uart_probe(struct platform_device *ofdev)
 	/* initialize the device pointer for the port */
 	pinfo->port.dev = &ofdev->dev;
 
+	pinfo->port.irq = irq_of_parse_and_map(ofdev->dev.of_node, 0);
+	if (!pinfo->port.irq)
+		return -EINVAL;
+
 	ret = cpm_uart_init_port(ofdev->dev.of_node, pinfo);
-	if (ret)
-		return ret;
+	if (!ret)
+		return uart_add_one_port(&cpm_reg, &pinfo->port);
 
-	return uart_add_one_port(&cpm_reg, &pinfo->port);
+	irq_dispose_mapping(pinfo->port.irq);
+
+	return ret;
 }
 
 static int cpm_uart_remove(struct platform_device *ofdev)
-- 
2.37.1

