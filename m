Return-Path: <linuxppc-dev+bounces-10326-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF9DB0AA89
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jul 2025 21:08:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bkK894d4vz2xnM;
	Sat, 19 Jul 2025 05:08:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752865721;
	cv=none; b=nHrGaUZPMUMEHDCpS188uoqJVmnRZxxMa8SN50J5onCWfzTpr2zoJeksAmj36kolPRwy1b4zgpEqknHs4cvlqHydW1B9UD4ht9nO+EmBdQjidclDI4rN97e5K+i/VuImTO2XZTwcGDwIrlD5QqRgD+BRyFOBSCZ7CuE7ewHNhaQm3LyUUoh87hac5j4PbQdeTcE0Ie19oitLAf8CAePaQ5eVscpvWOUZsAzEwm4l+qtypitfY9LoqAHX5BFwWuBFKOsrCQ9tMr6a53qotzGpruMrep6FzMb/iHkmwcT4i99U7TZ4DUV4IJYVW7UAT1gsGonQi6QLHiVOBkCrJwxPWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752865721; c=relaxed/relaxed;
	bh=Q9YP6+xR9nE1nVepR13PsYNiBx4Vt3yln5P7RNF1cfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yo2MgpwDuYUHXNXw1aF9ts/R1x7BKuGhiPrwEbRC8S8KN+GYBFcVlK/5G5b68b9QtI4HXPNzqouROqeVDFl0SgA4A27HKIN/H3q8+m4AMh2OlHFJnQ0M8T+b4uN7MWfulZ6glkawlgoxMolmfZl6+D9Crl/jnx4kKy3NZ38DmQpzhCYOz28VtLjWcCD3k0R+VXia/q+ydl7SOcglC+/Xj4GKqQbel6WTnwTm3WKVLxhmztt5cLo2/W6P/tmKxJRp50kIgwBEdpD4lD7HK3dPWYUrhI4+AOzgdFKx2FMMy8M6W9F0AJUgvmEKoUVVW4mcnAigFJO8OF5+UvO93YKxMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZXven0Q3; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZXven0Q3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bkK884K3Dz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jul 2025 05:08:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E21C0601E4;
	Fri, 18 Jul 2025 19:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81733C4CEEB;
	Fri, 18 Jul 2025 19:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752865717;
	bh=Zg23yIftuBF5Np0+C1uWZCfudesuUWA1kBrOESxzh24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZXven0Q3xY/25qQwWIVLPn8g+w+7YszvI8H4fNZlm3jdwJRXltYXnAotsIxaxwxCt
	 FmI5Ul2w5J9uIq6vlV7yiPsttfkr/8j0klWIhussPo2YCgPi3FZFuSyD5dh1lsLOtH
	 vSuXm9aYRyBo0jnPaKgPfIz/LlYklEYY1obJ5jt6JaO4ck1rjXWbnsCxI0x42DG1vw
	 CprVwTC/x8RGlEN4oLiC7bCvfNeTuybyo7xfzn6/hoXwlzMxYh5f6TF+d+pqc/2QH+
	 +1eRSKbrY36XUxvvcIHzC2n+9hWYRuNGLnD1rrn8Blo0lEjVtlwLQqMvHqLc+XW12/
	 aCiqUmiH+6oTA==
Date: Fri, 18 Jul 2025 20:08:32 +0100
From: Simon Horman <horms@kernel.org>
To: Mingming Cao <mmc@linux.ibm.com>
Cc: netdev@vger.kernel.org, bjking1@linux.ibm.com, haren@linux.ibm.com,
	ricklind@linux.ibm.com, davemarq@linux.ibm.com, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
	edumazet@google.com, pabeni@redhat.com,
	linuxppc-dev@lists.ozlabs.org, Brian King <bjking@us.ibm.com>
Subject: Re: [PATCH net-next] ibmveth: Add multi buffers rx replenishment
 hcall support
Message-ID: <20250718190832.GL2459@horms.kernel.org>
References: <20250717201049.38497-1-mmc@linux.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717201049.38497-1-mmc@linux.ibm.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jul 17, 2025 at 04:10:49PM -0400, Mingming Cao wrote:
> This patch enables batched RX buffer replenishment in ibmveth by
> using the new firmware-supported h_add_logical_lan_buffers() hcall
>  to submit up to 8 RX buffers in a single call, instead of repeatedly
> calling the single-buffer h_add_logical_lan_buffer() hcall.
> 
> During the probe, with the patch, the driver queries ILLAN attributes
> to detect IBMVETH_ILLAN_RX_MULTI_BUFF_SUPPORT bit. If the attribute is
> present, rx_buffers_per_hcall is set to 8, enabling batched replenishment.
> Otherwise, it defaults to 1, preserving the original upstream behavior
>  with no change in code flow for unsupported systems.
> 
> The core rx replenish logic remains the same. But when batching
> is enabled, the driver aggregates up to 8 fully prepared descriptors
> into a single h_add_logical_lan_buffers() hypercall. If any allocation
> or DMA mapping fails while preparing a batch, only the successfully
> prepared buffers are submitted, and the remaining are deferred for
> the next replenish cycle.
> 
> If at runtime the firmware stops accepting the batched hcall—e,g,
> after a Live Partition Migration (LPM) to a host that does not
> support h_add_logical_lan_buffers(), the hypercall returns H_FUNCTION.
> In that case, the driver transparently disables batching, resets
> rx_buffers_per_hcall to 1, and falls back to the single-buffer hcall
> in next future replenishments to take care of these and future buffers.
> 
> Test were done on systems with firmware that both supports and
> does not support the new h_add_logical_lan_buffers hcall.
> 
> On supported firmware, this reduces hypercall overhead significantly
> over multiple buffers. SAR measurements showed about a 15% improvement
> in packet processing rate under moderate RX load, with heavier traffic
> seeing gains more than 30%
> 
> Signed-off-by: Mingming Cao <mmc@linux.ibm.com>
> Reviewed-by: Brian King <bjking@us.ibm.com>
> Reviewed-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Dave Marquardt <davemarq@linux.ibm.com>

Thanks, overall this change looks good to me.

However - perhaps it's not important, but here goes anyway - it
would be nice if the code moved towards two style aspects that
are preferred for networking code.

1. Wrap lines to 80 columns or less where it can be achieved
   without reducing readability.

   checkpatch.pl --max-line-length=80 can be of assistance here.

2. Arrange local variables in reverse xmas tree order - longest like to
   shortest.

   Edward Cree's tool can be of assistance here
   https://github.com/ecree-solarflare/xmastree/commits/master/

My fingers got a bit itchy so I had a go at adapting your code to match the
above. It is a very simplistic approach to this. But in case it is of any
use the relative diff is as follows.

Compile tested only!!!

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 8e885270d546..f407b963b3d2 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -211,15 +211,19 @@ static inline void ibmveth_flush_buffer(void *addr, unsigned long length)
 static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
 					  struct ibmveth_buff_pool *pool)
 {
-	struct device *dev = &adapter->vdev->dev;
 	u32 remaining = pool->size - atomic_read(&pool->available);
 	union ibmveth_buf_desc descs[IBMVETH_MAX_RX_PER_HCALL] = {0};
 	u64 correlators[IBMVETH_MAX_RX_PER_HCALL] = {0};
-	u32 index;
-	u32 i, filled, batch;
 	unsigned long lpar_rc;
-	dma_addr_t dma_addr;
 	u32 buffers_added = 0;
+	u32 i, filled, batch;
+	struct vio_dev *vdev;
+	dma_addr_t dma_addr;
+	struct device *dev;
+	u32 index;
+
+	vdev = adapter->vdev;
+	dev = &vdev->dev;
 
 	mb();
 
@@ -234,7 +238,8 @@ static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
 			if (WARN_ON(index == IBM_VETH_INVALID_MAP)) {
 				adapter->replenish_add_buff_failure++;
 				netdev_info(adapter->netdev,
-					    "Invalid map index %u, reset\n", index);
+					    "Invalid map index %u, reset\n",
+					    index);
 				schedule_work(&adapter->work);
 				break;
 			}
@@ -242,16 +247,18 @@ static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
 			if (!pool->skbuff[index]) {
 				struct sk_buff *skb = NULL;
 
-				skb = netdev_alloc_skb(adapter->netdev, pool->buff_size);
+				skb = netdev_alloc_skb(adapter->netdev,
+						       pool->buff_size);
 				if (!skb) {
 					adapter->replenish_no_mem++;
 					adapter->replenish_add_buff_failure++;
 					break;
 				}
 
-				dma_addr = dma_map_single(&adapter->vdev->dev, skb->data,
-							  pool->buff_size, DMA_FROM_DEVICE);
-				if (dma_mapping_error(&adapter->vdev->dev, dma_addr)) {
+				dma_addr = dma_map_single(dev, skb->data,
+							  pool->buff_size,
+							  DMA_FROM_DEVICE);
+				if (dma_mapping_error(dev, dma_addr)) {
 					dev_kfree_skb_any(skb);
 					adapter->replenish_add_buff_failure++;
 					break;
@@ -265,12 +272,16 @@ static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
 			}
 
 			if (rx_flush) {
-				unsigned int len = min(pool->buff_size,
-						       adapter->netdev->mtu + IBMVETH_BUFF_OH);
-				ibmveth_flush_buffer(pool->skbuff[index]->data, len);
+				unsigned int len;
+
+				len = adapter->netdev->mtu + IBMVETH_BUFF_OH;
+				len = min(pool->buff_size, len);
+				ibmveth_flush_buffer(pool->skbuff[index]->data,
+						     len);
 			}
 
-			descs[filled].fields.flags_len = IBMVETH_BUF_VALID | pool->buff_size;
+			descs[filled].fields.flags_len = IBMVETH_BUF_VALID |
+							 pool->buff_size;
 			descs[filled].fields.address = dma_addr;
 
 			correlators[filled] = ((u64)pool->index << 32) | index;
@@ -286,15 +297,19 @@ static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
 
 		/* single buffer case*/
 		if (filled == 1)
-			lpar_rc = h_add_logical_lan_buffer(adapter->vdev->unit_address,
+			lpar_rc = h_add_logical_lan_buffer(vdev->unit_address,
 							   descs[0].desc);
 		else
 			/* Multi-buffer hcall */
-			lpar_rc = h_add_logical_lan_buffers(adapter->vdev->unit_address,
-							    descs[0].desc, descs[1].desc,
-							    descs[2].desc, descs[3].desc,
-							    descs[4].desc, descs[5].desc,
-							    descs[6].desc, descs[7].desc);
+			lpar_rc = h_add_logical_lan_buffers(vdev->unit_address,
+							    descs[0].desc,
+							    descs[1].desc,
+							    descs[2].desc,
+							    descs[3].desc,
+							    descs[4].desc,
+							    descs[5].desc,
+							    descs[6].desc,
+							    descs[7].desc);
 		if (lpar_rc != H_SUCCESS) {
 			dev_warn_ratelimited(dev,
 					     "RX h_add_logical_lan failed: filled=%u, rc=%lu, batch=%u\n",
@@ -327,9 +342,10 @@ static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
 
 			if (pool->skbuff[index]) {
 				if (dma_addr &&
-				    !dma_mapping_error(&adapter->vdev->dev, dma_addr))
-					dma_unmap_single(&adapter->vdev->dev, dma_addr,
-							 pool->buff_size, DMA_FROM_DEVICE);
+				    !dma_mapping_error(dev, dma_addr))
+					dma_unmap_single(dev, dma_addr,
+							 pool->buff_size,
+							 DMA_FROM_DEVICE);
 
 				dev_kfree_skb_any(pool->skbuff[index]);
 				pool->skbuff[index] = NULL;
diff --git a/drivers/net/ethernet/ibm/ibmveth.h b/drivers/net/ethernet/ibm/ibmveth.h
index f19b7267b2ae..625f92ee6c39 100644
--- a/drivers/net/ethernet/ibm/ibmveth.h
+++ b/drivers/net/ethernet/ibm/ibmveth.h
@@ -48,15 +48,20 @@
   plpar_hcall_norets(H_ADD_LOGICAL_LAN_BUFFER, ua, buf)
 
 static inline long h_add_logical_lan_buffers(unsigned long unit_address,
-					     unsigned long desc1, unsigned long desc2,
-					     unsigned long desc3, unsigned long desc4,
-					     unsigned long desc5, unsigned long desc6,
-					     unsigned long desc7, unsigned long desc8)
+					     unsigned long desc1,
+					     unsigned long desc2,
+					     unsigned long desc3,
+					     unsigned long desc4,
+					     unsigned long desc5,
+					     unsigned long desc6,
+					     unsigned long desc7,
+					     unsigned long desc8)
 {
 	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
 
-	return plpar_hcall9(H_ADD_LOGICAL_LAN_BUFFERS, retbuf, unit_address, desc1, desc2,
-			    desc3, desc4, desc5, desc6, desc7, desc8);
+	return plpar_hcall9(H_ADD_LOGICAL_LAN_BUFFERS, retbuf, unit_address,
+			    desc1, desc2, desc3, desc4, desc5, desc6, desc7,
+			    desc8);
 }
 
 /* FW allows us to send 6 descriptors but we only use one so mark

