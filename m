Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9911195D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 22:23:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XY2n2vW9zDqRL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 08:23:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="jc9H//Cs"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XXqV4fxDzDqZX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 08:13:58 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75F43205C9;
 Tue, 10 Dec 2019 21:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012436;
 bh=k2xihUgRcgrb7YUQR2Lk4IorRDQykZiKuabSVR5v+i4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jc9H//CsjbM85ERoTD3E8sDCaq9g9CqSbmyGKxEt2zIyxXznh7jmC/FyYkvPD8o6+
 StYwyXLrw7xytBIGxFjacHcIA6ciBUBTJOwvab1csEgGmOtz8ZHKbXJTSX8lnCfMRe
 NE2CP5ph11cjZ3pR0HMNWtmEmK8JHImQtffMDv7A=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 348/350] ibmvnic: Fix completion structure
 initialization
Date: Tue, 10 Dec 2019 16:07:33 -0500
Message-Id: <20191210210735.9077-309-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 Thomas Falcon <tlfalcon@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thomas Falcon <tlfalcon@linux.ibm.com>

[ Upstream commit 070eca955c4af1248cb78a216463ff757a5dc511 ]

Fix multiple calls to init_completion for device completion
structures. Instead, initialize them during device probe and
reinitialize them later as needed.

Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 0686ded7ad3a2..e1ab2feeae53d 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -176,7 +176,7 @@ static int alloc_long_term_buff(struct ibmvnic_adapter *adapter,
 	ltb->map_id = adapter->map_id;
 	adapter->map_id++;
 
-	init_completion(&adapter->fw_done);
+	reinit_completion(&adapter->fw_done);
 	rc = send_request_map(adapter, ltb->addr,
 			      ltb->size, ltb->map_id);
 	if (rc) {
@@ -215,7 +215,7 @@ static int reset_long_term_buff(struct ibmvnic_adapter *adapter,
 
 	memset(ltb->buff, 0, ltb->size);
 
-	init_completion(&adapter->fw_done);
+	reinit_completion(&adapter->fw_done);
 	rc = send_request_map(adapter, ltb->addr, ltb->size, ltb->map_id);
 	if (rc)
 		return rc;
@@ -943,7 +943,7 @@ static int ibmvnic_get_vpd(struct ibmvnic_adapter *adapter)
 	if (adapter->vpd->buff)
 		len = adapter->vpd->len;
 
-	init_completion(&adapter->fw_done);
+	reinit_completion(&adapter->fw_done);
 	crq.get_vpd_size.first = IBMVNIC_CRQ_CMD;
 	crq.get_vpd_size.cmd = GET_VPD_SIZE;
 	rc = ibmvnic_send_crq(adapter, &crq);
@@ -1689,7 +1689,7 @@ static int __ibmvnic_set_mac(struct net_device *netdev, u8 *dev_addr)
 	crq.change_mac_addr.cmd = CHANGE_MAC_ADDR;
 	ether_addr_copy(&crq.change_mac_addr.mac_addr[0], dev_addr);
 
-	init_completion(&adapter->fw_done);
+	reinit_completion(&adapter->fw_done);
 	rc = ibmvnic_send_crq(adapter, &crq);
 	if (rc) {
 		rc = -EIO;
@@ -2316,7 +2316,7 @@ static int wait_for_reset(struct ibmvnic_adapter *adapter)
 	adapter->fallback.rx_entries = adapter->req_rx_add_entries_per_subcrq;
 	adapter->fallback.tx_entries = adapter->req_tx_entries_per_subcrq;
 
-	init_completion(&adapter->reset_done);
+	reinit_completion(&adapter->reset_done);
 	adapter->wait_for_reset = true;
 	rc = ibmvnic_reset(adapter, VNIC_RESET_CHANGE_PARAM);
 	if (rc)
@@ -2332,7 +2332,7 @@ static int wait_for_reset(struct ibmvnic_adapter *adapter)
 		adapter->desired.rx_entries = adapter->fallback.rx_entries;
 		adapter->desired.tx_entries = adapter->fallback.tx_entries;
 
-		init_completion(&adapter->reset_done);
+		reinit_completion(&adapter->reset_done);
 		adapter->wait_for_reset = true;
 		rc = ibmvnic_reset(adapter, VNIC_RESET_CHANGE_PARAM);
 		if (rc)
@@ -2603,7 +2603,7 @@ static void ibmvnic_get_ethtool_stats(struct net_device *dev,
 	    cpu_to_be32(sizeof(struct ibmvnic_statistics));
 
 	/* Wait for data to be written */
-	init_completion(&adapter->stats_done);
+	reinit_completion(&adapter->stats_done);
 	rc = ibmvnic_send_crq(adapter, &crq);
 	if (rc)
 		return;
@@ -4408,7 +4408,7 @@ static int send_query_phys_parms(struct ibmvnic_adapter *adapter)
 	memset(&crq, 0, sizeof(crq));
 	crq.query_phys_parms.first = IBMVNIC_CRQ_CMD;
 	crq.query_phys_parms.cmd = QUERY_PHYS_PARMS;
-	init_completion(&adapter->fw_done);
+	reinit_completion(&adapter->fw_done);
 	rc = ibmvnic_send_crq(adapter, &crq);
 	if (rc)
 		return rc;
@@ -4960,6 +4960,9 @@ static int ibmvnic_probe(struct vio_dev *dev, const struct vio_device_id *id)
 	INIT_LIST_HEAD(&adapter->rwi_list);
 	spin_lock_init(&adapter->rwi_lock);
 	init_completion(&adapter->init_done);
+	init_completion(&adapter->fw_done);
+	init_completion(&adapter->reset_done);
+	init_completion(&adapter->stats_done);
 	clear_bit(0, &adapter->resetting);
 
 	do {
-- 
2.20.1

