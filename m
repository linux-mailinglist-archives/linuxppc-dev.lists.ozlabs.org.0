Return-Path: <linuxppc-dev+bounces-5400-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5077CA16FD0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:05:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcFYQ5N9Vz2yvq;
	Tue, 21 Jan 2025 03:05:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.143.211.150
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737377176;
	cv=none; b=cELOvL+geLP0Se4CU5/3NWDmaU0x7/HPmXfazc4XluvkJFGS0weRRWiQqGsg1VxDU3OGb4s462JQulxEE/ArFKUdc/quZ8fQkZZqMd1KiChDPiRwZTQpblgnuPUFaKz7dOgTBZXEahwYQxlX9slXtEvPh4auvG1KVSMoegBibOckulAU4JGmblz/CV7KKOMiITnfhufkNhKrbF3iWLTo/Fg4BVWgE/hcf4MwhNNV377FGL16Xx3zwQzZB7r3YGBy3hZ9VECCRx3S/3/SWy7lElOG41e1jBMbkLAJ8GDXVLv6Si+SQxGo1PnY+qF/h//FBILMN+ZypDwKQC3cME7gdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737377176; c=relaxed/relaxed;
	bh=mXZ3I+8rEu5hC7Bbr/07M4uZY5uMU2tu8N9VtF7I1iA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=llFILfzHXDUt4BLsEhRnKtEjA+co0VxPc9tXxdKNLFH18bEKY66ZigRVAHeumRj4UdJgPC862BRH+WtpdcJRSwRrZz4jnsumMfyqdsm89OcWPiG3YeaEvIkwaJCTe871yQpUMocgXW+pRrcPN+JwmtR6AgJtORYuIGFHLLjFuHuAsX42vAinWNddrVhQPGSPcY5u4fn/Sqfpw2Ka/hpcoV4jtRkiwbLI381zd2CZ0DqmjVa/K0jKp8jBDP3rBlFhoR2GaOpwQRRvQh4R1BqC6EHR2etNQAMQh0OWM1X+E2AYrjMbSJPW50xNQH5sBtHYtOekCSYYdHdqtqyRypqzAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; dkim=pass (1024-bit key; unprotected) header.d=swemel.ru header.i=@swemel.ru header.a=rsa-sha256 header.s=mail header.b=oai8Q/QK; dkim-atps=neutral; spf=pass (client-ip=95.143.211.150; helo=mx.swemel.ru; envelope-from=arefev@swemel.ru; receiver=lists.ozlabs.org) smtp.mailfrom=swemel.ru
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=swemel.ru header.i=@swemel.ru header.a=rsa-sha256 header.s=mail header.b=oai8Q/QK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=swemel.ru (client-ip=95.143.211.150; helo=mx.swemel.ru; envelope-from=arefev@swemel.ru; receiver=lists.ozlabs.org)
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yc97W2kcDz2y8X
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 23:46:15 +1100 (AEDT)
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1737377171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mXZ3I+8rEu5hC7Bbr/07M4uZY5uMU2tu8N9VtF7I1iA=;
	b=oai8Q/QKw5LqOWxxqAprZkqYpgoN8NZC/ObNCToUubGbEn/gh/nB7CRoHqDAkGqcegZSie
	W94FUdMXxAEa6f+YMfQ1Cxato7KLUzk2lCNMiEWVD63EuGJfOkqxUPSddTfEoLjGmSlKQL
	o9v/OvTZbUY9iASnWG4hyWlVn87tQy0=
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
Subject: [PATCH 5.10] ibmvnic: Add tx check to prevent skb leak
Date: Mon, 20 Jan 2025 15:46:10 +0300
Message-ID: <20250120124611.51436-1-arefev@swemel.ru>
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


