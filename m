Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AA64F7D25
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:38:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYyXw0bx6z3f36
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:38:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Brx4PkxB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635;
 helo=mail-ej1-x635.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Brx4PkxB; dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYyN70M8mz3bXG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:31:19 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id dr20so9836627ejc.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 03:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MSY1nTudb+PZHTwNW0++Hw3ZkegN7YQIOboMBZ6jBg0=;
 b=Brx4PkxB2qdWTRw7gD0HT3PEDbMMWi0XZkbblBnTtAVRKFZm8RAn4P1cLxUzGaUSWj
 r6JxWEq0muCi0zq0RyRsEDl8YQa7DCNKZBC1Gj5rF17+x2LK3VvqVWEVI6k/8DvOCHIq
 xClZCgthVxp4u5kv6LFjYJJnSkK1bZEibqrgmMQ0JP8dYZ+15cOAVnkRAzi3IgoT+dqm
 k4uFx+UARieV2bsoVD67F5Xff9RQaJx4M76B8zZgTKoP9mHwlZS7m8uDs2+oJzpKPok8
 ktve3WHvQOVXDYKLjmG23a4XmTmuEu3OvZtYcVC0FpEHV2nWXBTKR8Gatcf/PU9USmof
 mfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MSY1nTudb+PZHTwNW0++Hw3ZkegN7YQIOboMBZ6jBg0=;
 b=HqytMwSWf6rNzlNY5AWzA+AG4KaJxqIJm710PTGingck8LctX7LN25VSfm9eJoVvyc
 n9+A/xUYufAKpVOmLniyB7BWKIB8LZ/qZQ5JvA/Z0zfldXXRbA0UccCZKbjNy4lOl5fC
 Q66XoPjk0CoT1PdUJH+bVysNn6GYx4lNFI9/02ZtXhCe9R2cRzmpBb+EWbBu+2a4MiEb
 +BlSt90d9jV3dbb72YudGlb78eZslYpljIr/KA4sOnNTTDiT0n4iLWw2Qedzdkq6W9ug
 797rBco14nkpobR+q4xuVFQlGbnYSUU7U+7v8WMMc9Jh4pdjhMjjV82x7OAcIrt6GRvE
 PGqw==
X-Gm-Message-State: AOAM530p+XcjbwN9q37+xszT5o4wJQ1IMTvaGaVlb2F03Tc6ArvFhvat
 TqOBQ7HUzE2PKFOTzpxEXIA=
X-Google-Smtp-Source: ABdhPJwwT5jmVo5qc9B+eZATYpRQi7yTuAnE1UXZHjgZUgliXLWJp7twbPBsvZlMRQCsjFWFpTIFiQ==
X-Received: by 2002:a17:907:7f1a:b0:6e8:4127:6bc4 with SMTP id
 qf26-20020a1709077f1a00b006e841276bc4mr375201ejc.496.1649327476146; 
 Thu, 07 Apr 2022 03:31:16 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm7413573ejz.57.2022.04.07.03.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 03:31:15 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next 12/15] net: netcp: Remove usage of list iterator for
 list_add() after loop body
Date: Thu,  7 Apr 2022 12:28:57 +0200
Message-Id: <20220407102900.3086255-13-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407102900.3086255-1-jakobkoschel@gmail.com>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 Ariel Elior <aelior@marvell.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Manish Chopra <manishc@marvell.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Di Zhu <zhudi21@huawei.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Xu Wang <vulab@iscas.ac.cn>, Vladimir Oltean <olteanv@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Casper Andersson <casper.casan@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation to limit the scope of a list iterator to the list
traversal loop, use a dedicated pointer to point to the found element [1].

Before, the code implicitly used the head when no element was found
when using &pos->list. Since the new variable is only set if an
element was found, the list_add() is performed within the loop
and only done after the loop if it is done on the list head directly.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/net/ethernet/ti/netcp_core.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/ti/netcp_core.c b/drivers/net/ethernet/ti/netcp_core.c
index 16507bff652a..7f89fd82ecc8 100644
--- a/drivers/net/ethernet/ti/netcp_core.c
+++ b/drivers/net/ethernet/ti/netcp_core.c
@@ -471,8 +471,8 @@ struct netcp_hook_list {
 int netcp_register_txhook(struct netcp_intf *netcp_priv, int order,
 			  netcp_hook_rtn *hook_rtn, void *hook_data)
 {
+	struct netcp_hook_list *next = NULL, *iter;
 	struct netcp_hook_list *entry;
-	struct netcp_hook_list *next;
 	unsigned long flags;
 
 	entry = devm_kzalloc(netcp_priv->dev, sizeof(*entry), GFP_KERNEL);
@@ -484,11 +484,15 @@ int netcp_register_txhook(struct netcp_intf *netcp_priv, int order,
 	entry->order     = order;
 
 	spin_lock_irqsave(&netcp_priv->lock, flags);
-	list_for_each_entry(next, &netcp_priv->txhook_list_head, list) {
-		if (next->order > order)
+	list_for_each_entry(iter, &netcp_priv->txhook_list_head, list) {
+		if (iter->order > order) {
+			next = iter;
+			list_add_tail(&entry->list, &iter->list);
 			break;
+		}
 	}
-	__list_add(&entry->list, next->list.prev, &next->list);
+	if (!next)
+		list_add_tail(&entry->list, &netcp_priv->txhook_list_head);
 	spin_unlock_irqrestore(&netcp_priv->lock, flags);
 
 	return 0;
@@ -520,8 +524,8 @@ EXPORT_SYMBOL_GPL(netcp_unregister_txhook);
 int netcp_register_rxhook(struct netcp_intf *netcp_priv, int order,
 			  netcp_hook_rtn *hook_rtn, void *hook_data)
 {
+	struct netcp_hook_list *next = NULL, *iter;
 	struct netcp_hook_list *entry;
-	struct netcp_hook_list *next;
 	unsigned long flags;
 
 	entry = devm_kzalloc(netcp_priv->dev, sizeof(*entry), GFP_KERNEL);
@@ -533,11 +537,15 @@ int netcp_register_rxhook(struct netcp_intf *netcp_priv, int order,
 	entry->order     = order;
 
 	spin_lock_irqsave(&netcp_priv->lock, flags);
-	list_for_each_entry(next, &netcp_priv->rxhook_list_head, list) {
-		if (next->order > order)
+	list_for_each_entry(iter, &netcp_priv->rxhook_list_head, list) {
+		if (iter->order > order) {
+			next = iter;
+			list_add_tail(&entry->list, &iter->list);
 			break;
+		}
 	}
-	__list_add(&entry->list, next->list.prev, &next->list);
+	if (!next)
+		list_add_tail(&entry->list, &netcp_priv->rxhook_list_head);
 	spin_unlock_irqrestore(&netcp_priv->lock, flags);
 
 	return 0;
-- 
2.25.1

