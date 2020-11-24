Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF042C1ECD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 08:24:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgFrz4lWqzDqVq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 18:24:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com;
 envelope-from=liwei391@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgDWr5xcCzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 17:24:40 +1100 (AEDT)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CgDWJ1Wk4z6vQq;
 Tue, 24 Nov 2020 14:24:12 +0800 (CST)
Received: from euler.huawei.com (10.175.124.27) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 24 Nov 2020 14:24:21 +0800
From: Wei Li <liwei391@huawei.com>
To: Pantelis Antoniou <pantelis.antoniou@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Scott Wood
 <scottwood@freescale.com>, Jeff Garzik <jeff@garzik.org>, Timur Tabi
 <timur@freescale.com>, Kumar Gala <galak@kernel.crashing.org>
Subject: [PATCH] net: fs_enet: Fix incorrect IS_ERR_VALUE macro usages
Date: Tue, 24 Nov 2020 14:24:09 +0800
Message-ID: <20201124062409.1142-1-liwei391@huawei.com>
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

Fixes: 976de6a8c304 ("fs_enet: Be an of_platform device when CONFIG_PPC_CPM_NEW_BINDING is set.")
Fixes: 4c35630ccda5 ("[POWERPC] Change rheap functions to use ulongs instead of pointers")
Signed-off-by: Wei Li <liwei391@huawei.com>
---
 drivers/net/ethernet/freescale/fs_enet/mac-fcc.c | 2 +-
 drivers/net/ethernet/freescale/fs_enet/mac-scc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
index b47490be872c..e2117ad46130 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -107,7 +107,7 @@ static int do_pd_setup(struct fs_enet_private *fep)
 
 	fep->fcc.mem = (void __iomem *)cpm2_immr;
 	fpi->dpram_offset = cpm_dpalloc(128, 32);
-	if (IS_ERR_VALUE(fpi->dpram_offset)) {
+	if (IS_ERR_VALUE((unsigned long)(int)fpi->dpram_offset)) {
 		ret = fpi->dpram_offset;
 		goto out_fcccp;
 	}
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
index 64300ac13e02..90f82df0b1bb 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
@@ -136,7 +136,7 @@ static int allocate_bd(struct net_device *dev)
 
 	fep->ring_mem_addr = cpm_dpalloc((fpi->tx_ring + fpi->rx_ring) *
 					 sizeof(cbd_t), 8);
-	if (IS_ERR_VALUE(fep->ring_mem_addr))
+	if (IS_ERR_VALUE((unsigned long)(int)fep->ring_mem_addr))
 		return -ENOMEM;
 
 	fep->ring_base = (void __iomem __force*)
-- 
2.17.1

