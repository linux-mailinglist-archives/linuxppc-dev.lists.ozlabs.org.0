Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5BB2E76DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Dec 2020 08:32:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5NKS5ptFzDqHp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Dec 2020 18:32:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=47.88.44.36;
 helo=out4436.biz.mail.alibaba.com;
 envelope-from=abaci-bugfix@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5N7h6kTzzDqGS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Dec 2020 18:23:53 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=abaci-bugfix@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0UKCfcPy_1609312996; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com
 fp:SMTPD_---0UKCfcPy_1609312996) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 30 Dec 2020 15:23:25 +0800
From: YANG LI <abaci-bugfix@linux.alibaba.com>
To: davem@davemloft.net
Subject: [PATCH] ibmvnic: fix: NULL pointer dereference.
Date: Wed, 30 Dec 2020 15:23:14 +0800
Message-Id: <1609312994-121032-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Wed, 30 Dec 2020 18:30:52 +1100
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
Cc: linux-kernel@vger.kernel.org, YANG LI <abaci-bugfix@linux.alibaba.com>,
 netdev@vger.kernel.org, ljp@linux.ibm.com, drt@linux.ibm.com, kuba@kernel.org,
 sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The error is due to dereference a null pointer in function
reset_one_sub_crq_queue():

if (!scrq) {
    netdev_dbg(adapter->netdev,
               "Invalid scrq reset. irq (%d) or msgs(%p).\n",
		scrq->irq, scrq->msgs);
		return -EINVAL;
}

If the expression is true, scrq must be a null pointer and cannot
dereference.

Signed-off-by: YANG LI <abaci-bugfix@linux.alibaba.com>
Reported-by: Abaci <abaci@linux.alibaba.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index f302504..d7472be 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2981,9 +2981,7 @@ static int reset_one_sub_crq_queue(struct ibmvnic_adapter *adapter,
 	int rc;
 
 	if (!scrq) {
-		netdev_dbg(adapter->netdev,
-			   "Invalid scrq reset. irq (%d) or msgs (%p).\n",
-			   scrq->irq, scrq->msgs);
+		netdev_dbg(adapter->netdev, "Invalid scrq reset.\n");
 		return -EINVAL;
 	}
 
-- 
1.8.3.1

