Return-Path: <linuxppc-dev+bounces-9087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15049ACBCD3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 23:49:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bB6tm37j1z2yMF;
	Tue,  3 Jun 2025 07:49:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.143.211.150
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748878667;
	cv=none; b=HBuOTUlI9KhEuwunCwiJCvp9hU5qF5WDD48HMFnkrL6F2lAGhQKL19UmamtjXwTv1qKw8hTKnEY98UFWVXnJb3WUfjYmLPFdzm8T7LtEKkGwpaKewWfrL+QwI2pJl+xGbHOip+j5IgROGOtF9anS777LWBYMRG0Qkm6mb4CzdQHEa7CNpi2+MNxPIHCIO+OwfGsd7FI0HWxKnZrhYw1wPGC2Ax4A2aZoB5o380tsrQFXoe5CZDykSspMvN2jy+RW3oUSWLCEyapxQpOZAYA8uSSBnY3njORtQrrlGLB3Civam7dFifUwvT5Mk2NU9iq+rivpfC6cVftlTy7rrTIPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748878667; c=relaxed/relaxed;
	bh=71YeMes/eS2IUpNl7YzmLJ929hx1mUSYVecvfpFiJtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xy+Rd9QS6sGJppvS+1bGqu5WdxiSyu99KdjEHYiRGzv1CSoQwKBSRtWHB7/MW+sYrGGFWUwwIyKJb4I3OEnwTmd/D5qPr2ZiRf51mrhPBr0lQoVTI1WMpccBNaVUAHq8Fh7Z2n/1j+O7xbFJV4Wz/9rqYhUWhPCaHu5/qmKE45QS0tlnfY4X18pe2EhoXM1Yocka3PbPeu805EdwF8eI1SOAomR7VSJ6FNf2loe77ZRagyF48XEgX1lfEL8gBTS1FCDBqw9/niM+C3BYg+8zjZzKwhu5on6LtGOCIiezsFzcdyI+S5eXFD4sSBO43B0rYvGpRRGHvYwScXGHCcgjHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; dkim=pass (1024-bit key; unprotected) header.d=swemel.ru header.i=@swemel.ru header.a=rsa-sha256 header.s=mail header.b=vLEvMcXP; dkim-atps=neutral; spf=pass (client-ip=95.143.211.150; helo=mx.swemel.ru; envelope-from=arefev@swemel.ru; receiver=lists.ozlabs.org) smtp.mailfrom=swemel.ru
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=swemel.ru header.i=@swemel.ru header.a=rsa-sha256 header.s=mail header.b=vLEvMcXP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=swemel.ru (client-ip=95.143.211.150; helo=mx.swemel.ru; envelope-from=arefev@swemel.ru; receiver=lists.ozlabs.org)
X-Greylist: delayed 572 seconds by postgrey-1.37 at boromir; Tue, 03 Jun 2025 01:37:44 AEST
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9yf03CY8z2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 01:37:44 +1000 (AEST)
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1748878085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=71YeMes/eS2IUpNl7YzmLJ929hx1mUSYVecvfpFiJtQ=;
	b=vLEvMcXPgfQ3CsiGHcuIMQoFRBemffsEWU+/pLhYVIot8+IQON8erRN31hp7Wz1r3pHcJH
	uCmrxYYWnaxYkd5gZNpfhpXwYJPKYA2y8okms7S4ZDS3krqzFQD5QeoGTjWajDDdEy7IO9
	04idVRUI00JhAD4t9stKVQVk12j4LHk=
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Dany Madden <drt@linux.ibm.com>,
	Lijun Pan <ljp@linux.ibm.com>,
	Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Nick Child <nnac123@linux.ibm.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH 5.10] ibmvnic: Add tx check to prevent skb leak
Date: Mon,  2 Jun 2025 18:28:04 +0300
Message-ID: <20250602152805.88204-1-arefev@swemel.ru>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

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
index 84da6ccaf339..e63220ebb2ea 100644
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
+				     queue_num, index);
+		dev_kfree_skb_any(tx_buff->skb);
+	}
+
 	tx_buff->skb = skb;
 	tx_buff->data_dma[0] = data_dma_addr;
 	tx_buff->data_len[0] = skb->len;
-- 
2.43.0


