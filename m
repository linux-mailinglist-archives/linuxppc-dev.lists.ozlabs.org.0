Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D76FC94086E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 08:32:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=LDnWj7h+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WY55351b1z3cfT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 16:32:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=LDnWj7h+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY53q4fJLz3clY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 16:31:49 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4AD18C0005;
	Tue, 30 Jul 2024 06:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722321103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9oaw32SfWoWdpOCGj4cbaO4s/PkPuA9eMA+JWXWEy20=;
	b=LDnWj7h+3M0k/9trK9YpfYCOEPHFvG5dja4cagBcM68icJxeMArucrSTXuRXUu2x5EBApk
	XYznIeIRVt5GEhCaJZbSdQu0LC0UBvB9joWLdCZzYGvZG/NeKH0zfSYhIu9C0LVVomGPiK
	NKMBbrz3Gma55Rsg4hmWOQ7rK9qyldAbOtp2pcgzrH2nfuUIE+BD98Qg6EimV66//LI1qi
	s+0PWtfdRNw8+j6NQEHn5HPWv95n1OP8LbA05pIrlT8eiftPJIOE7xQfRfyWJeRZHZ5gyv
	s+lQUjGjSeqA+CgY8MLkbeqSiho8jPGwPTOavjGlC1cb/wQoybCxYCGjDEkmHg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH net v1] net: wan: fsl_qmc_hdlc: Discard received CRC
Date: Tue, 30 Jul 2024 08:31:33 +0200
Message-ID: <20240730063133.179598-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Received frame from QMC contains the CRC.
Upper layers don't need this CRC and tcpdump mentioned trailing junk
data due to this CRC presence.

As some other HDLC driver, simply discard this CRC.

Fixes: d0f2258e79fd ("net: wan: Add support for QMC HDLC")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/net/wan/fsl_qmc_hdlc.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdlc.c
index 64b4bfa6fea7..8fcfbde31a1c 100644
--- a/drivers/net/wan/fsl_qmc_hdlc.c
+++ b/drivers/net/wan/fsl_qmc_hdlc.c
@@ -250,6 +250,7 @@ static void qmc_hcld_recv_complete(void *context, size_t length, unsigned int fl
 	struct qmc_hdlc_desc *desc = context;
 	struct net_device *netdev;
 	struct qmc_hdlc *qmc_hdlc;
+	size_t crc_size;
 	int ret;
 
 	netdev = desc->netdev;
@@ -268,15 +269,26 @@ static void qmc_hcld_recv_complete(void *context, size_t length, unsigned int fl
 		if (flags & QMC_RX_FLAG_HDLC_CRC) /* CRC error */
 			netdev->stats.rx_crc_errors++;
 		kfree_skb(desc->skb);
-	} else {
-		netdev->stats.rx_packets++;
-		netdev->stats.rx_bytes += length;
+		goto re_queue;
+	}
 
-		skb_put(desc->skb, length);
-		desc->skb->protocol = hdlc_type_trans(desc->skb, netdev);
-		netif_rx(desc->skb);
+	/* Discard the CRC */
+	crc_size = qmc_hdlc->is_crc32 ? 4 : 2;
+	if (length < crc_size) {
+		netdev->stats.rx_length_errors++;
+		kfree_skb(desc->skb);
+		goto re_queue;
 	}
+	length -= crc_size;
+
+	netdev->stats.rx_packets++;
+	netdev->stats.rx_bytes += length;
+
+	skb_put(desc->skb, length);
+	desc->skb->protocol = hdlc_type_trans(desc->skb, netdev);
+	netif_rx(desc->skb);
 
+re_queue:
 	/* Re-queue a transfer using the same descriptor */
 	ret = qmc_hdlc_recv_queue(qmc_hdlc, desc, desc->dma_size);
 	if (ret) {
-- 
2.45.0

