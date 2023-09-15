Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 510167A2728
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 21:25:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yzd/ccnw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnPKp1d7Dz3dGw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 05:25:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yzd/ccnw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gustavoars@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnPJt2XzPz3cWp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 05:24:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 9B9B5CE2C12;
	Fri, 15 Sep 2023 19:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA574C433C8;
	Fri, 15 Sep 2023 19:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694805881;
	bh=MwqHe4JvGzG4fmXR069X5g/4C9oJN5CAAugIujwOjR0=;
	h=Date:From:To:Cc:Subject:From;
	b=Yzd/ccnw/jpnhpn+bE/Ms49Rl7aD6/8TKdway2v9+BbVA2BAJHLITBjaVZf9X77d1
	 fU+KDmmLjj0MQ8T2Mjxo3bnrw4On0yYxWpN7lDPbcFBBg7OaZdmNbiEtNOEUXZw4VS
	 r2eAOmzguYLY4oInOGggWoYmLIBLqkhGHmzQfeheLjJobKWnKuv7zablUqmUb7/+rG
	 BkX7+nO5HB3LOTJOPxfK/wZpcti98WWvttp/qWrJ1sEWdA6UlumNi8MXGTS7zkM1Go
	 KhrefT0si+o14upI4rsCpe5yY63ovVia8VBZge93yijsrHO7EA0iZcK4VT9vkCb983
	 5WWKjHrnJeSkw==
Date: Fri, 15 Sep 2023 13:25:36 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Ishizaki Kou <kou.ishizaki@toshiba.co.jp>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] net: spider_net: Use size_add() in call to
 struct_size()
Message-ID: <ZQSvsLmJrDsKtLCa@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-hardening@vger.kernel.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If, for any reason, the open-coded arithmetic causes a wraparound,
the protection that `struct_size()` adds against potential integer
overflows is defeated. Fix this by hardening call to `struct_size()`
with `size_add()`.

Fixes: 3f1071ec39f7 ("net: spider_net: Use struct_size() helper")
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/ethernet/toshiba/spider_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/toshiba/spider_net.c b/drivers/net/ethernet/toshiba/spider_net.c
index 50d7eacfec58..87e67121477c 100644
--- a/drivers/net/ethernet/toshiba/spider_net.c
+++ b/drivers/net/ethernet/toshiba/spider_net.c
@@ -2332,7 +2332,7 @@ spider_net_alloc_card(void)
 	struct spider_net_card *card;
 
 	netdev = alloc_etherdev(struct_size(card, darray,
-					    tx_descriptors + rx_descriptors));
+					    size_add(tx_descriptors, rx_descriptors)));
 	if (!netdev)
 		return NULL;
 
-- 
2.34.1

