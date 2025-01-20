Return-Path: <linuxppc-dev+bounces-5392-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D05CA16BF2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 13:03:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc89s1Xwzz2yyR;
	Mon, 20 Jan 2025 23:03:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.143.211.150
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737374432;
	cv=none; b=fn3TNBZRrMfzWuH2W5DMWRoiOPeTaPGDrk2saUJarQaElSFXcsfOsGIWAtB8hFdTEKhrIAsLg5xfNuvq7MHzNM4zc3h6xNi7BHNMC6o/c3q0OdF3NI+JttrYjEVn0ioJzvI6z8WrmaZbCi5HNbr+b+YxzziOr59bJgP1zCszxh3ZS9UakFoS150aWL38yZLO4DulsDKYCeXnalKZKzBNUVPDVLtS4SqxRWUPeAh6OcrJOM0Lx+n7bR8/QnwU0ARRfLp/9QwRX3mqcEN/WtCCmATAS8jrQsuzYLzr2i03tOFgxLBT2aBUg7ct1PppGbGed6/NYFiHjgHb9F4QgWG+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737374432; c=relaxed/relaxed;
	bh=mXZ3I+8rEu5hC7Bbr/07M4uZY5uMU2tu8N9VtF7I1iA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gTpJLfbKueOF1mZhx247Xp/JfjxqYGZyiQXND0vfd0jKD0Tsd4eCxwAjWdHl8t9YoxCSRfbM0bKLIjAJfuTQxF13OaVoz8hs6wBo6WUyT3HG2Hm5t04kAnvVoNZesp0iN3epAW4fJ25ahiMqLftlZY4ExUmi3Bm/01DYmWdvPgaWovNhBoSGWQGhfJPbvM3AYTnnK6PzYt288SZPIIJDLLtJto+3XY/y5j0g3f5yyW1ub5BSPE3NiQIwvSLdA1G4ibYsstOMPxb8CW98MTBFJ5Bxq/n3Lwpp2fQT9yni+avfNJo3VLjVZwc7XqRUIU/yo3CsaDoQHbOXnD1AD6EJDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; dkim=pass (1024-bit key; unprotected) header.d=swemel.ru header.i=@swemel.ru header.a=rsa-sha256 header.s=mail header.b=jqOCzB7p; dkim-atps=neutral; spf=pass (client-ip=95.143.211.150; helo=mx.swemel.ru; envelope-from=arefev@swemel.ru; receiver=lists.ozlabs.org) smtp.mailfrom=swemel.ru
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=swemel.ru header.i=@swemel.ru header.a=rsa-sha256 header.s=mail header.b=jqOCzB7p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=swemel.ru (client-ip=95.143.211.150; helo=mx.swemel.ru; envelope-from=arefev@swemel.ru; receiver=lists.ozlabs.org)
X-Greylist: delayed 387 seconds by postgrey-1.37 at boromir; Mon, 20 Jan 2025 23:00:29 AEDT
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yc86j4yLCz2ywh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 23:00:29 +1100 (AEDT)
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1737374034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mXZ3I+8rEu5hC7Bbr/07M4uZY5uMU2tu8N9VtF7I1iA=;
	b=jqOCzB7pFmmic5jfsD/stli7oRpav9Pv1HpqWYAbYMGjlBbhNW/x4/xgl1Ne942/izqIzb
	KsLDTvokPyL03Z9hXWk12SPJlnJeCnKfyYnAmUWYjxkPwn5rNYj+9NyLQSqvy1wZtgkVSs
	vqRoDwi8z3B4ygD7q98J9L/5cIQ9lEc=
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nick Child <nnac123@linux.ibm.com>,
	Dany Madden <drt@linux.ibm.com>,
	Lijun Pan <ljp@linux.ibm.com>,
	Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH] ibmvnic: Add tx check to prevent skb leak
Date: Mon, 20 Jan 2025 14:53:53 +0300
Message-ID: <20250120115354.49654-1-arefev@swemel.ru>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Nick Child <nnac123@linux.ibm.com>

From: Nick Child <nnac123@linux.ibm.com>

commit 0983d288caf984de0202c66641577b739caad561 upstream.

Below is a summary of how the driver stores a reference to an skb during
transmit:
    tx_buff[free_map[consumer_index]]->skb = new_skb;
    free_map[consumer_index] = IBMVNIC_INVALID_MAP;
    consumer_index ++;
Where variable data looks like this:
    free_map == [4, IBMVNIC_INVALID_MAP, IBMVNIC_INVALID_MAP, 0, 3]
                                               	consumer_index^
    tx_buff == [skb=null, skb=<ptr>, skb=<ptr>, skb=null, skb=null]

The driver has checks to ensure that free_map[consumer_index] pointed to
a valid index but there was no check to ensure that this index pointed
to an unused/null skb address. So, if, by some chance, our free_map and
tx_buff lists become out of sync then we were previously risking an
skb memory leak. This could then cause tcp congestion control to stop
sending packets, eventually leading to ETIMEDOUT.

Therefore, add a conditional to ensure that the skb address is null. If
not then warn the user (because this is still a bug that should be
patched) and free the old pointer to prevent memleak/tcp problems.

Signed-off-by: Nick Child <nnac123@linux.ibm.com>
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
[Denis: minor fix to resolve merge conflict.]
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
Backport fix for CVE-2024-41066
Link: https://nvd.nist.gov/vuln/detail/CVE-2024-41066
---
 drivers/net/ethernet/ibm/ibmvnic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 84da6ccaf339..439796975cbf 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -1625,6 +1625,18 @@ static netdev_tx_t ibmvnic_xmit(struct sk_buff *skb, struct net_device *netdev)
 	    (tx_pool->consumer_index + 1) % tx_pool->num_buffers;
 
 	tx_buff = &tx_pool->tx_buff[index];
+
+	/* Sanity checks on our free map to make sure it points to an index
+	 * that is not being occupied by another skb. If skb memory is
+	 * not freed then we see congestion control kick in and halt tx.
+	 */
+	if (unlikely(tx_buff->skb)) {
+		dev_warn_ratelimited(dev, "TX free map points to untracked skb (%s %d idx=%d)\n",
+				     skb_is_gso(skb) ? "tso_pool" : "tx_pool",
+				     queue_num, bufidx);
+		dev_kfree_skb_any(tx_buff->skb);
+	}
+
 	tx_buff->skb = skb;
 	tx_buff->data_dma[0] = data_dma_addr;
 	tx_buff->data_len[0] = skb->len;
-- 
2.43.0


