Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F356E64CB7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 14:42:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXGl864btz3c9s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 00:42:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXGkX6kHwz3bjc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 00:42:09 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4NXGkN0yH9z9snF;
	Wed, 14 Dec 2022 14:42:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hfhTWXB50so6; Wed, 14 Dec 2022 14:42:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4NXGkN05yxz9sn7;
	Wed, 14 Dec 2022 14:42:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E7C018B773;
	Wed, 14 Dec 2022 14:42:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id yYyqfqsYJ_Hn; Wed, 14 Dec 2022 14:42:03 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.7.109])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A4C018B766;
	Wed, 14 Dec 2022 14:42:03 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2BEDfs3H890976
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Dec 2022 14:41:54 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2BEDfqfY890971;
	Wed, 14 Dec 2022 14:41:52 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] spi: fsl_spi: Don't change speed while chipselect is active
Date: Wed, 14 Dec 2022 14:41:33 +0100
Message-Id: <8aab84c51aa330cf91f4b43782a1c483e150a4e3.1671025244.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1671025291; l=2546; s=20211009; h=from:subject:message-id; bh=8/jPqVq6+i4ZTuwdyPTYisS3aYHreLAZCFf6R55Qckc=; b=qC4a0ccjJlEsJPlSdNoPiAK0OdPp36lryj0XAXdRWkYMSkTpCRSKsHcmDwFHDrSe4T7embn0AI06 R/d0B4vFB3QmoUTj3Dpc7VRNc76rQnest+fh3CBywicoYi5Lwg4K
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
Cc: Herve Codina <herve.codina@bootlin.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-spi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit c9bfcb315104 ("spi_mpc83xx: much improved driver") made
modifications to the driver to not perform speed changes while
chipselect is active. But those changes where lost with the
convertion to tranfer_one.

Previous implementation was allowing speed changes during
message transfer when cs_change flag was set.
At the time being, core SPI does not provide any feature to change
speed while chipselect is off, so do not allow any speed change during
message transfer, and perform the transfer setup in prepare_message
in order to set correct speed while chipselect is still off.

Reported-by: Herve Codina <herve.codina@bootlin.com>
Fixes: 64ca1a034f00 ("spi: fsl_spi: Convert to transfer_one")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/spi/spi-fsl-spi.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index 731624f157fc..93152144fd2e 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -333,13 +333,26 @@ static int fsl_spi_prepare_message(struct spi_controller *ctlr,
 {
 	struct mpc8xxx_spi *mpc8xxx_spi = spi_controller_get_devdata(ctlr);
 	struct spi_transfer *t;
+	struct spi_transfer *first;
+
+	first = list_first_entry(&m->transfers, struct spi_transfer,
+				 transfer_list);
 
 	/*
 	 * In CPU mode, optimize large byte transfers to use larger
 	 * bits_per_word values to reduce number of interrupts taken.
+	 *
+	 * Some glitches can appear on the SPI clock when the mode changes.
+	 * Check that there is no speed change during the transfer and set it up
+	 * now to change the mode without having a chip-select asserted.
 	 */
-	if (!(mpc8xxx_spi->flags & SPI_CPM_MODE)) {
-		list_for_each_entry(t, &m->transfers, transfer_list) {
+	list_for_each_entry(t, &m->transfers, transfer_list) {
+		if (t->speed_hz != first->speed_hz) {
+			dev_err(&m->spi->dev,
+				"speed_hz cannot change during message.\n");
+			return -EINVAL;
+		}
+		if (!(mpc8xxx_spi->flags & SPI_CPM_MODE)) {
 			if (t->len < 256 || t->bits_per_word != 8)
 				continue;
 			if ((t->len & 3) == 0)
@@ -348,7 +361,7 @@ static int fsl_spi_prepare_message(struct spi_controller *ctlr,
 				t->bits_per_word = 16;
 		}
 	}
-	return 0;
+	return fsl_spi_setup_transfer(m->spi, first);
 }
 
 static int fsl_spi_transfer_one(struct spi_controller *controller,
-- 
2.38.1

