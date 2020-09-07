Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A74EF25FF9C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 18:35:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlYmS0tBczDqDZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 02:35:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ad6Z2xkO; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlYjR0DnPzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 02:32:43 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 871AC2080A;
 Mon,  7 Sep 2020 16:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599496359;
 bh=qrGrQGi+49D1Bobayjx6dob/oyG0cJnyBGPihvoBMYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ad6Z2xkOftAQb/6eYERzMPIRLCrHuCfFKicEY1rdCHkotGI739N/ECexxYHybBler
 p2/CZ51XxzRf0v/eKlP8HM7QZlXT0HOyQhJ+dJtLhJKj7PNVO4A4duWPB0br4kc/5k
 aBu636W6fOdT2BZEP76mFO83t4teQiIBe1Lf233o=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 14/53] ibmvnic fix NULL tx_pools and rx_tools
 issue at do_reset
Date: Mon,  7 Sep 2020 12:31:40 -0400
Message-Id: <20200907163220.1280412-14-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907163220.1280412-1-sashal@kernel.org>
References: <20200907163220.1280412-1-sashal@kernel.org>
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
 Mingming Cao <mmc@linux.vnet.ibm.com>, Dany Madden <drt@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mingming Cao <mmc@linux.vnet.ibm.com>

[ Upstream commit 9f13457377907fa253aef560e1a37e1ca4197f9b ]

At the time of do_rest, ibmvnic tries to re-initalize the tx_pools
and rx_pools to avoid re-allocating the long term buffer. However
there is a window inside do_reset that the tx_pools and
rx_pools were freed before re-initialized making it possible to deference
null pointers.

This patch fix this issue by always check the tx_pool
and rx_pool are not NULL after ibmvnic_login. If so, re-allocating
the pools. This will avoid getting into calling reset_tx/rx_pools with
NULL adapter tx_pools/rx_pools pointer. Also add null pointer check in
reset_tx_pools and reset_rx_pools to safe handle NULL pointer case.

Signed-off-by: Mingming Cao <mmc@linux.vnet.ibm.com>
Signed-off-by: Dany Madden <drt@linux.ibm.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 5afb3c9c52d20..d3a774331afc7 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -479,6 +479,9 @@ static int reset_rx_pools(struct ibmvnic_adapter *adapter)
 	int i, j, rc;
 	u64 *size_array;
 
+	if (!adapter->rx_pool)
+		return -1;
+
 	size_array = (u64 *)((u8 *)(adapter->login_rsp_buf) +
 		be32_to_cpu(adapter->login_rsp_buf->off_rxadd_buff_size));
 
@@ -649,6 +652,9 @@ static int reset_tx_pools(struct ibmvnic_adapter *adapter)
 	int tx_scrqs;
 	int i, rc;
 
+	if (!adapter->tx_pool)
+		return -1;
+
 	tx_scrqs = be32_to_cpu(adapter->login_rsp_buf->num_txsubm_subcrqs);
 	for (i = 0; i < tx_scrqs; i++) {
 		rc = reset_one_tx_pool(adapter, &adapter->tso_pool[i]);
@@ -2011,7 +2017,10 @@ static int do_reset(struct ibmvnic_adapter *adapter,
 		    adapter->req_rx_add_entries_per_subcrq !=
 		    old_num_rx_slots ||
 		    adapter->req_tx_entries_per_subcrq !=
-		    old_num_tx_slots) {
+		    old_num_tx_slots ||
+		    !adapter->rx_pool ||
+		    !adapter->tso_pool ||
+		    !adapter->tx_pool) {
 			release_rx_pools(adapter);
 			release_tx_pools(adapter);
 			release_napi(adapter);
@@ -2024,10 +2033,14 @@ static int do_reset(struct ibmvnic_adapter *adapter,
 		} else {
 			rc = reset_tx_pools(adapter);
 			if (rc)
+				netdev_dbg(adapter->netdev, "reset tx pools failed (%d)\n",
+						rc);
 				goto out;
 
 			rc = reset_rx_pools(adapter);
 			if (rc)
+				netdev_dbg(adapter->netdev, "reset rx pools failed (%d)\n",
+						rc);
 				goto out;
 		}
 		ibmvnic_disable_irqs(adapter);
-- 
2.25.1

