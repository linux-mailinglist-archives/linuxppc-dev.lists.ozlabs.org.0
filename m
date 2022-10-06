Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 208675F6092
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 07:21:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjfv23rD1z3drn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:21:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjftV02jdz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 16:21:19 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MjftL283Tz9srK;
	Thu,  6 Oct 2022 07:21:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9oKkmBrAZGRU; Thu,  6 Oct 2022 07:21:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MjftL1Ccqz9scJ;
	Thu,  6 Oct 2022 07:21:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 115828B765;
	Thu,  6 Oct 2022 07:21:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id KU1udF-Ooh74; Thu,  6 Oct 2022 07:21:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.234])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E31278B763;
	Thu,  6 Oct 2022 07:21:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2965KxUq210731
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 6 Oct 2022 07:20:59 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2965KwCj210726;
	Thu, 6 Oct 2022 07:20:58 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH] tty: evh_bytechan: Replace NO_IRQ by 0
Date: Thu,  6 Oct 2022 07:20:52 +0200
Message-Id: <23f608ca57e7e19bc7060d3e563de383e0b2b337.1665033575.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665033651; l=1215; s=20211009; h=from:subject:message-id; bh=RSyt/Gv8m9uB7T2sCY9aTmpdb6yOURZSmr76/1Rk0ho=; b=z/tzeHK6e5604F4VwNDoOv+23OwiTE3fO2QZACrJmvVO3eKAgcpcBvpbIW7+tIHiHgoIvfFU7PzM rIXUVRBtBvNpIBdvVHHzycng5U4ZorNlFz9AXwj0Ur5zTnKa3Awv
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

NO_IRQ is used to check the return of irq_of_parse_and_map().

On some architecture NO_IRQ is 0, on other architectures it is -1.

irq_of_parse_and_map() returns 0 on error, independent of NO_IRQ.

So use 0 instead of using NO_IRQ.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/tty/ehv_bytechan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/ehv_bytechan.c b/drivers/tty/ehv_bytechan.c
index 19d32cb6af84..8595483f4697 100644
--- a/drivers/tty/ehv_bytechan.c
+++ b/drivers/tty/ehv_bytechan.c
@@ -118,7 +118,7 @@ static int find_console_handle(void)
 		return 0;
 
 	stdout_irq = irq_of_parse_and_map(np, 0);
-	if (stdout_irq == NO_IRQ) {
+	if (!stdout_irq) {
 		pr_err("ehv-bc: no 'interrupts' property in %pOF node\n", np);
 		return 0;
 	}
@@ -696,7 +696,7 @@ static int ehv_bc_tty_probe(struct platform_device *pdev)
 
 	bc->rx_irq = irq_of_parse_and_map(np, 0);
 	bc->tx_irq = irq_of_parse_and_map(np, 1);
-	if ((bc->rx_irq == NO_IRQ) || (bc->tx_irq == NO_IRQ)) {
+	if (!bc->rx_irq || !bc->tx_irq) {
 		dev_err(&pdev->dev, "no 'interrupts' property in %pOFn node\n",
 			np);
 		ret = -ENODEV;
-- 
2.37.1

