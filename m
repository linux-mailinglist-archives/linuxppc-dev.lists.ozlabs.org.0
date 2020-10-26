Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A29A298A99
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 11:44:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKWfP4SzbzDqLy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 21:43:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKWcq0GGhzDqGk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 21:42:34 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D071ABBE;
 Mon, 26 Oct 2020 10:42:30 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: Thomas Bogendoerfer <tbogendoerfer@suse.de>,
	netdev@vger.kernel.org
Subject: [PATCH] ibmveth: Fix use of ibmveth in a bridge.
Date: Mon, 26 Oct 2020 11:42:21 +0100
Message-Id: <20201026104221.26570-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: Cristobal Forno <cforno12@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Cris Forno <cforno12@linux.vnet.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Michal Suchanek <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thomas Bogendoerfer <tbogendoerfer@suse.de>

The check for src mac address in ibmveth_is_packet_unsupported is wrong.
Commit 6f2275433a2f wanted to shut down messages for loopback packets,
but now suppresses bridged frames, which are accepted by the hypervisor
otherwise bridging won't work at all.

Fixes: 6f2275433a2f ("ibmveth: Detect unsupported packets before sending to the hypervisor")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
ms: added commit message
---
 drivers/net/ethernet/ibm/ibmveth.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 7ef3369953b6..c3ec9ceed833 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -1031,12 +1031,6 @@ static int ibmveth_is_packet_unsupported(struct sk_buff *skb,
 		ret = -EOPNOTSUPP;
 	}
 
-	if (!ether_addr_equal(ether_header->h_source, netdev->dev_addr)) {
-		netdev_dbg(netdev, "source packet MAC address does not match veth device's, dropping packet.\n");
-		netdev->stats.tx_dropped++;
-		ret = -EOPNOTSUPP;
-	}
-
 	return ret;
 }
 
-- 
2.28.0

