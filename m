Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F010285E4DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 18:47:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W6mqhk0E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg3cr63Wkz3dVS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 04:47:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W6mqhk0E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg3c75mgzz3cNl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 04:46:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9A3E61586;
	Wed, 21 Feb 2024 17:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42776C433A6;
	Wed, 21 Feb 2024 17:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708537589;
	bh=08b+Vo67o6SmoB7++Gm/1GoSVDkHKmrdybkawQNPv0M=;
	h=From:Date:Subject:To:Cc:From;
	b=W6mqhk0E2fqFmRDkv4SmKqDnsrWdQ+XnKNmevMhJRmDJt2s4lvSb9gACGDSAbkCXQ
	 zqZZrspFK5rxlaBl7UTx9UVRpykou5gnm5pZMuP/Zs7dpseZSm7S3uHaHaudZw/Jy7
	 V/6G9M93ErOgPrPtn+WN/HTLGlGshqYZbR/ss0wWjBW4WhdP2jZWdKwU3ta+itH7tK
	 xIIwv+wM+cCW9H3n9vLWjGISZOeXGsnuVs2RwYUB7zb30TDd+CPb1IUjU+ZIbAFRtf
	 IMvBxx4JHoN0HQY5hUGLn47JWkgP03elIhfa+05rrcp5JNWTbzcsb8V4oUodOrBQOO
	 XPspKgseABGqw==
From: Simon Horman <horms@kernel.org>
Date: Wed, 21 Feb 2024 17:46:21 +0000
Subject: [PATCH net-next] ps3/gelic: minor Kernel Doc corrections
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-ps3-gelic-kdoc-v1-1-7629216d1340@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOw21mUC/x3MQQqAIBBA0avErBuoKci6SrQwnWwoLDQikO6et
 HyL/xNEDsIRhiJB4FuiHD6jLgswq/aOUWw2UEVtRVTjGRt0vIvBzR4GiZRVSve6m1vI0Rl4kec
 fjuD5Qs/PBdP7fiwThxJqAAAA
To: Geoff Levand <geoff@infradead.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.12.3
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, netdev@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Update the Kernel Doc for gelic_descr_set_tx_cmdstat()
  and gelic_net_setup_netdev() so that documented name
  and the actual name of the function match.

* Move define of GELIC_ALIGN() so that it is no longer
  between gelic_alloc_card_net() and it's Kernel Doc.

* Document netdev parameter of gelic_alloc_card_net()
  in a way consistent to the documentation of other netdev parameters
  in this file.

Addresses the following warnings flagged by ./scripts/kernel-doc -none:

  .../ps3_gelic_net.c:711: warning: expecting prototype for gelic_net_set_txdescr_cmdstat(). Prototype was for gelic_descr_set_tx_cmdstat() instead
  .../ps3_gelic_net.c:1474: warning: expecting prototype for gelic_ether_setup_netdev(). Prototype was for gelic_net_setup_netdev() instead
  .../ps3_gelic_net.c:1528: warning: expecting prototype for gelic_alloc_card_net(). Prototype was for GELIC_ALIGN() instead
  .../ps3_gelic_net.c:1531: warning: Function parameter or struct member 'netdev' not described in 'gelic_alloc_card_net'

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index d5b75af163d3..12b96ca66877 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -698,7 +698,7 @@ gelic_card_get_next_tx_descr(struct gelic_card *card)
 }
 
 /**
- * gelic_net_set_txdescr_cmdstat - sets the tx descriptor command field
+ * gelic_descr_set_tx_cmdstat - sets the tx descriptor command field
  * @descr: descriptor structure to fill out
  * @skb: packet to consider
  *
@@ -1461,7 +1461,7 @@ static void gelic_ether_setup_netdev_ops(struct net_device *netdev,
 }
 
 /**
- * gelic_ether_setup_netdev - initialization of net_device
+ * gelic_net_setup_netdev - initialization of net_device
  * @netdev: net_device structure
  * @card: card structure
  *
@@ -1518,14 +1518,16 @@ int gelic_net_setup_netdev(struct net_device *netdev, struct gelic_card *card)
 	return 0;
 }
 
+#define GELIC_ALIGN (32)
+
 /**
  * gelic_alloc_card_net - allocates net_device and card structure
+ * @netdev: interface device structure
  *
  * returns the card structure or NULL in case of errors
  *
  * the card and net_device structures are linked to each other
  */
-#define GELIC_ALIGN (32)
 static struct gelic_card *gelic_alloc_card_net(struct net_device **netdev)
 {
 	struct gelic_card *card;

