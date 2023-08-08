Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0907739EF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 13:42:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKrrR3DxVz30PJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 21:41:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=lizetao1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKrqq5KJ7z2ytb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 21:41:23 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RKrlZ5MsvzNmyj;
	Tue,  8 Aug 2023 19:37:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 19:41:14 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <geoff@infradead.org>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <christophe.leroy@csgroup.eu>
Subject: [PATCH -next] net/ps3_gelic_net: Use ether_addr_to_u64() to convert ethernet address
Date: Tue, 8 Aug 2023 19:40:50 +0800
Message-ID: <20230808114050.4034547-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
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
Cc: netdev@vger.kernel.org, lizetao1@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use ether_addr_to_u64() to convert an Ethernet address into a u64 value,
instead of directly calculating, as this is exactly what
this function does.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index 9d535ae59626..77a02819e412 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -596,7 +596,6 @@ void gelic_net_set_multi(struct net_device *netdev)
 	struct gelic_card *card = netdev_card(netdev);
 	struct netdev_hw_addr *ha;
 	unsigned int i;
-	uint8_t *p;
 	u64 addr;
 	int status;
 
@@ -629,12 +628,7 @@ void gelic_net_set_multi(struct net_device *netdev)
 
 	/* set multicast addresses */
 	netdev_for_each_mc_addr(ha, netdev) {
-		addr = 0;
-		p = ha->addr;
-		for (i = 0; i < ETH_ALEN; i++) {
-			addr <<= 8;
-			addr |= *p++;
-		}
+		addr = ether_addr_to_u64(ha->addr);
 		status = lv1_net_add_multicast_address(bus_id(card),
 						       dev_id(card),
 						       addr, 0);
-- 
2.34.1

