Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C68EF2C1ED6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 08:26:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgFvX2SjTzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 18:26:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com;
 envelope-from=liwei391@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgDw35TF0zDqJm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 17:42:11 +1100 (AEDT)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CgDTw29jxzhbkW;
 Tue, 24 Nov 2020 14:23:00 +0800 (CST)
Received: from euler.huawei.com (10.175.124.27) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Tue, 24 Nov 2020 14:23:05 +0800
From: Wei Li <liwei391@huawei.com>
To: Li Yang <leoyang.li@nxp.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paul Gortmaker
 <paul.gortmaker@windriver.com>, Kumar Gala <galak@kernel.crashing.org>,
 "Timur Tabi" <timur@freescale.com>
Subject: [PATCH] net/ethernet/freescale: Fix incorrect IS_ERR_VALUE macro
 usages
Date: Tue, 24 Nov 2020 14:22:34 +0800
Message-ID: <20201124062234.678-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 24 Nov 2020 18:23:02 +1100
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, guohanjun@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

IS_ERR_VALUE macro should be used only with unsigned long type.
Especially it works incorrectly with unsigned shorter types on
64bit machines.

Fixes: 4c35630ccda5 ("[POWERPC] Change rheap functions to use ulongs instead of pointers")
Signed-off-by: Wei Li <liwei391@huawei.com>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 30 +++++++++++------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 714b501be7d0..8656d9be256a 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -286,7 +286,7 @@ static int fill_init_enet_entries(struct ucc_geth_private *ugeth,
 		else {
 			init_enet_offset =
 			    qe_muram_alloc(thread_size, thread_alignment);
-			if (IS_ERR_VALUE(init_enet_offset)) {
+			if (IS_ERR_VALUE((unsigned long)(int)init_enet_offset)) {
 				if (netif_msg_ifup(ugeth))
 					pr_err("Can not allocate DPRAM memory\n");
 				qe_put_snum((u8) snum);
@@ -2223,7 +2223,7 @@ static int ucc_geth_alloc_tx(struct ucc_geth_private *ugeth)
 			ugeth->tx_bd_ring_offset[j] =
 			    qe_muram_alloc(length,
 					   UCC_GETH_TX_BD_RING_ALIGNMENT);
-			if (!IS_ERR_VALUE(ugeth->tx_bd_ring_offset[j]))
+			if (!IS_ERR_VALUE((unsigned long)(int)ugeth->tx_bd_ring_offset[j]))
 				ugeth->p_tx_bd_ring[j] =
 				    (u8 __iomem *) qe_muram_addr(ugeth->
 							 tx_bd_ring_offset[j]);
@@ -2300,7 +2300,7 @@ static int ucc_geth_alloc_rx(struct ucc_geth_private *ugeth)
 			ugeth->rx_bd_ring_offset[j] =
 			    qe_muram_alloc(length,
 					   UCC_GETH_RX_BD_RING_ALIGNMENT);
-			if (!IS_ERR_VALUE(ugeth->rx_bd_ring_offset[j]))
+			if (!IS_ERR_VALUE((unsigned long)(int)ugeth->rx_bd_ring_offset[j]))
 				ugeth->p_rx_bd_ring[j] =
 				    (u8 __iomem *) qe_muram_addr(ugeth->
 							 rx_bd_ring_offset[j]);
@@ -2510,7 +2510,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 	ugeth->tx_glbl_pram_offset =
 	    qe_muram_alloc(sizeof(struct ucc_geth_tx_global_pram),
 			   UCC_GETH_TX_GLOBAL_PRAM_ALIGNMENT);
-	if (IS_ERR_VALUE(ugeth->tx_glbl_pram_offset)) {
+	if (IS_ERR_VALUE((unsigned long)(int)ugeth->tx_glbl_pram_offset)) {
 		if (netif_msg_ifup(ugeth))
 			pr_err("Can not allocate DPRAM memory for p_tx_glbl_pram\n");
 		return -ENOMEM;
@@ -2530,7 +2530,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 			   sizeof(struct ucc_geth_thread_data_tx) +
 			   32 * (numThreadsTxNumerical == 1),
 			   UCC_GETH_THREAD_DATA_ALIGNMENT);
-	if (IS_ERR_VALUE(ugeth->thread_dat_tx_offset)) {
+	if (IS_ERR_VALUE((unsigned long)(int)ugeth->thread_dat_tx_offset)) {
 		if (netif_msg_ifup(ugeth))
 			pr_err("Can not allocate DPRAM memory for p_thread_data_tx\n");
 		return -ENOMEM;
@@ -2557,7 +2557,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 	    qe_muram_alloc(ug_info->numQueuesTx *
 			   sizeof(struct ucc_geth_send_queue_qd),
 			   UCC_GETH_SEND_QUEUE_QUEUE_DESCRIPTOR_ALIGNMENT);
-	if (IS_ERR_VALUE(ugeth->send_q_mem_reg_offset)) {
+	if (IS_ERR_VALUE((unsigned long)(int)ugeth->send_q_mem_reg_offset)) {
 		if (netif_msg_ifup(ugeth))
 			pr_err("Can not allocate DPRAM memory for p_send_q_mem_reg\n");
 		return -ENOMEM;
@@ -2597,7 +2597,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 		ugeth->scheduler_offset =
 		    qe_muram_alloc(sizeof(struct ucc_geth_scheduler),
 				   UCC_GETH_SCHEDULER_ALIGNMENT);
-		if (IS_ERR_VALUE(ugeth->scheduler_offset)) {
+		if (IS_ERR_VALUE((unsigned long)(int)ugeth->scheduler_offset)) {
 			if (netif_msg_ifup(ugeth))
 				pr_err("Can not allocate DPRAM memory for p_scheduler\n");
 			return -ENOMEM;
@@ -2644,7 +2644,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 		    qe_muram_alloc(sizeof
 				   (struct ucc_geth_tx_firmware_statistics_pram),
 				   UCC_GETH_TX_STATISTICS_ALIGNMENT);
-		if (IS_ERR_VALUE(ugeth->tx_fw_statistics_pram_offset)) {
+		if (IS_ERR_VALUE((unsigned long)(int)ugeth->tx_fw_statistics_pram_offset)) {
 			if (netif_msg_ifup(ugeth))
 				pr_err("Can not allocate DPRAM memory for p_tx_fw_statistics_pram\n");
 			return -ENOMEM;
@@ -2681,7 +2681,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 	ugeth->rx_glbl_pram_offset =
 	    qe_muram_alloc(sizeof(struct ucc_geth_rx_global_pram),
 			   UCC_GETH_RX_GLOBAL_PRAM_ALIGNMENT);
-	if (IS_ERR_VALUE(ugeth->rx_glbl_pram_offset)) {
+	if (IS_ERR_VALUE((unsigned long)(int)ugeth->rx_glbl_pram_offset)) {
 		if (netif_msg_ifup(ugeth))
 			pr_err("Can not allocate DPRAM memory for p_rx_glbl_pram\n");
 		return -ENOMEM;
@@ -2700,7 +2700,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 	    qe_muram_alloc(numThreadsRxNumerical *
 			   sizeof(struct ucc_geth_thread_data_rx),
 			   UCC_GETH_THREAD_DATA_ALIGNMENT);
-	if (IS_ERR_VALUE(ugeth->thread_dat_rx_offset)) {
+	if (IS_ERR_VALUE((unsigned long)(int)ugeth->thread_dat_rx_offset)) {
 		if (netif_msg_ifup(ugeth))
 			pr_err("Can not allocate DPRAM memory for p_thread_data_rx\n");
 		return -ENOMEM;
@@ -2721,7 +2721,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 		    qe_muram_alloc(sizeof
 				   (struct ucc_geth_rx_firmware_statistics_pram),
 				   UCC_GETH_RX_STATISTICS_ALIGNMENT);
-		if (IS_ERR_VALUE(ugeth->rx_fw_statistics_pram_offset)) {
+		if (IS_ERR_VALUE((unsigned long)(int)ugeth->rx_fw_statistics_pram_offset)) {
 			if (netif_msg_ifup(ugeth))
 				pr_err("Can not allocate DPRAM memory for p_rx_fw_statistics_pram\n");
 			return -ENOMEM;
@@ -2741,7 +2741,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 	    qe_muram_alloc(ug_info->numQueuesRx *
 			   sizeof(struct ucc_geth_rx_interrupt_coalescing_entry)
 			   + 4, UCC_GETH_RX_INTERRUPT_COALESCING_ALIGNMENT);
-	if (IS_ERR_VALUE(ugeth->rx_irq_coalescing_tbl_offset)) {
+	if (IS_ERR_VALUE((unsigned long)(int)ugeth->rx_irq_coalescing_tbl_offset)) {
 		if (netif_msg_ifup(ugeth))
 			pr_err("Can not allocate DPRAM memory for p_rx_irq_coalescing_tbl\n");
 		return -ENOMEM;
@@ -2807,7 +2807,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 			   (sizeof(struct ucc_geth_rx_bd_queues_entry) +
 			    sizeof(struct ucc_geth_rx_prefetched_bds)),
 			   UCC_GETH_RX_BD_QUEUES_ALIGNMENT);
-	if (IS_ERR_VALUE(ugeth->rx_bd_qs_tbl_offset)) {
+	if (IS_ERR_VALUE((unsigned long)(int)ugeth->rx_bd_qs_tbl_offset)) {
 		if (netif_msg_ifup(ugeth))
 			pr_err("Can not allocate DPRAM memory for p_rx_bd_qs_tbl\n");
 		return -ENOMEM;
@@ -2892,7 +2892,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 		ugeth->exf_glbl_param_offset =
 		    qe_muram_alloc(sizeof(struct ucc_geth_exf_global_pram),
 		UCC_GETH_RX_EXTENDED_FILTERING_GLOBAL_PARAMETERS_ALIGNMENT);
-		if (IS_ERR_VALUE(ugeth->exf_glbl_param_offset)) {
+		if (IS_ERR_VALUE((unsigned long)(int)ugeth->exf_glbl_param_offset)) {
 			if (netif_msg_ifup(ugeth))
 				pr_err("Can not allocate DPRAM memory for p_exf_glbl_param\n");
 			return -ENOMEM;
@@ -3026,7 +3026,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 
 	/* Allocate InitEnet command parameter structure */
 	init_enet_pram_offset = qe_muram_alloc(sizeof(struct ucc_geth_init_pram), 4);
-	if (IS_ERR_VALUE(init_enet_pram_offset)) {
+	if (IS_ERR_VALUE((unsigned long)(int)init_enet_pram_offset)) {
 		if (netif_msg_ifup(ugeth))
 			pr_err("Can not allocate DPRAM memory for p_init_enet_pram\n");
 		return -ENOMEM;
-- 
2.17.1

