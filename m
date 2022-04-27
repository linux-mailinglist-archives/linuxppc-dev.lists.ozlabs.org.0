Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DFA511C01
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 17:42:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpNKV6JQYz3bqW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 01:42:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=seE+Cwqa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=seE+Cwqa; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpNJq65dLz3bXw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 01:41:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FD016190F;
 Wed, 27 Apr 2022 15:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B29C385AF;
 Wed, 27 Apr 2022 15:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651074088;
 bh=AQ2M2cIdMLKFRoOhOa3L4wS6t0ZWgmj+IPNpm9VSkJ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=seE+Cwqa8hiSgbmdjS9MW4M3EBVzWCGeN0jgLmE9eq3pU+6hg6CEVcjBSJwDcSSIX
 koW4eq89pTGtsvENbKFGoSZJXtwXL8ef8R7vfRt4HGLuZrRNS6akXyDqjPZw6GxlFV
 NU8VhqW339ENzH9C9qLQq92CXQUxIquUC70nb9vyjW5FziQZR4WR3TaV4heKwrfCWv
 iOr6/jWKGryNxi3ih90VtCiW8gRTBK9KBuuU7MP6BkFJyXJMiBR5PnZ4wDahoyEYO/
 dBlDKwETCbDu1pgNoAgFAxVPpVkA6X6qSzUUg/vFJFeo/aGvXrykjF5ZDU3vuMs5Qi
 7uvmtDz7Y+C/g==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	pabeni@redhat.com
Subject: [PATCH net-next 13/14] eth: spider: remove a copy of the
 NAPI_POLL_WEIGHT define
Date: Wed, 27 Apr 2022 08:41:10 -0700
Message-Id: <20220427154111.529975-14-kuba@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220427154111.529975-1-kuba@kernel.org>
References: <20220427154111.529975-1-kuba@kernel.org>
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
Cc: geoff@infradead.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Jakub Kicinski <kuba@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Defining local versions of NAPI_POLL_WEIGHT with the same
values in the drivers just makes refactoring harder.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: kou.ishizaki@toshiba.co.jp
CC: geoff@infradead.org
CC: linuxppc-dev@lists.ozlabs.org
---
 drivers/net/ethernet/toshiba/spider_net.c | 2 +-
 drivers/net/ethernet/toshiba/spider_net.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/spider_net.c b/drivers/net/ethernet/toshiba/spider_net.c
index f47b8358669d..c09cd961edbb 100644
--- a/drivers/net/ethernet/toshiba/spider_net.c
+++ b/drivers/net/ethernet/toshiba/spider_net.c
@@ -2270,7 +2270,7 @@ spider_net_setup_netdev(struct spider_net_card *card)
 	timer_setup(&card->aneg_timer, spider_net_link_phy, 0);
 
 	netif_napi_add(netdev, &card->napi,
-		       spider_net_poll, SPIDER_NET_NAPI_WEIGHT);
+		       spider_net_poll, NAPI_POLL_WEIGHT);
 
 	spider_net_setup_netdev_ops(netdev);
 
diff --git a/drivers/net/ethernet/toshiba/spider_net.h b/drivers/net/ethernet/toshiba/spider_net.h
index 05b1a0736835..51948e2b3a34 100644
--- a/drivers/net/ethernet/toshiba/spider_net.h
+++ b/drivers/net/ethernet/toshiba/spider_net.h
@@ -44,7 +44,6 @@ extern char spider_net_driver_name[];
 #define SPIDER_NET_RX_CSUM_DEFAULT		1
 
 #define SPIDER_NET_WATCHDOG_TIMEOUT		50*HZ
-#define SPIDER_NET_NAPI_WEIGHT			64
 
 #define SPIDER_NET_FIRMWARE_SEQS	6
 #define SPIDER_NET_FIRMWARE_SEQWORDS	1024
-- 
2.34.1

