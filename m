Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C1C3211B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 09:02:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkZRY3KH3z3cGN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 19:02:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130;
 helo=out30-130.freemail.mail.aliyun.com;
 envelope-from=yang.lee@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkZRD5WLmz30QH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 19:02:30 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=10; SR=0; TI=SMTPD_---0UPCfV1._1613980943; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UPCfV1._1613980943) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 22 Feb 2021 16:02:23 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mpe@ellerman.id.au
Subject: [PATCH] ibmveth: Switch to using the new API kobj_to_dev()
Date: Mon, 22 Feb 2021 16:02:21 +0800
Message-Id: <1613980941-45992-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: cforno12@linux.ibm.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 netdev@vger.kernel.org, kuba@kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

fixed the following coccicheck:
./drivers/net/ethernet/ibm/ibmveth.c:1805:51-52: WARNING opportunity for
kobj_to_dev()

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/net/ethernet/ibm/ibmveth.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index c3ec9ce..6e9572c 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -1801,8 +1801,7 @@ static ssize_t veth_pool_store(struct kobject *kobj, struct attribute *attr,
 	struct ibmveth_buff_pool *pool = container_of(kobj,
 						      struct ibmveth_buff_pool,
 						      kobj);
-	struct net_device *netdev = dev_get_drvdata(
-	    container_of(kobj->parent, struct device, kobj));
+	struct net_device *netdev = dev_get_drvdata(kobj_to_dev(kobj->parent));
 	struct ibmveth_adapter *adapter = netdev_priv(netdev);
 	long value = simple_strtol(buf, NULL, 10);
 	long rc;
-- 
1.8.3.1

