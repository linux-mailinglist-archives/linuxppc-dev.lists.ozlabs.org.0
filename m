Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2746E511C51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 18:17:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpP5r0jgpz3c88
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 02:17:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ggGv5P+E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f;
 helo=mail-ej1-x62f.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ggGv5P+E; dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpNtx73XVz3bgV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 02:07:37 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id y3so4326978ejo.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 09:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=woYPht1iAY/ITrpUe+WmESGMoM6pZPj3PA3p1Q9RO1s=;
 b=ggGv5P+EjcqZAl8voak+pwbzxzcjAmNNNxozwigeVhgulY+Vg7Hr8WKASQPrdbJxaK
 iNx74FS82CGgZTJVRSG4Oomayax8Ix2G83dwD/ChqX7H3+drsjBoiyv5lCzqeyuioEaS
 XBD5wk28Byq9pX2aiPXMyH6LlS/LvHPJDThnFQKgh3nlde4cQ2ah/HtfA3uKG+KOtjGk
 xhzjAAKQPnpbxT1RB3eO/pkRPdJwrx+Vpa+tNsGGA6zuKUYXr3twD3nOR/1emeN0SbJi
 Y4gsNXWxuiO8WT6EK1yWlB0Uc+qo03WXDB1xMzaj7Jhdwr74YVl19BVt0dpCl+0lzojy
 2L+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=woYPht1iAY/ITrpUe+WmESGMoM6pZPj3PA3p1Q9RO1s=;
 b=yffGKK3pmh24JPHx2bCB/QJN3iGjGuoKDMn1gJXntZwZzjLumHnpmobs9prbivb3NS
 +pUxuqukQfY9RZSsjKCb9QDjJ1XsamuClLS895Zs0fAywtDswERh1LIfohb1q8Xyg/JQ
 3rJdwbGXHm8H3RQCQxe6KlP0lvYOY3oGIloyGkHpzmqho1oIm7qiHvAW0GJ+cmuiYboG
 pI5TpRBcQk/ZsC2qfXokzlx75XaWqEJGixXZNyhNHF95Qgz/T6nMezUSkFJmoE1Ue4AZ
 he8cQIskiCKfNS3MJ+HlRR/+ZaeGjo2PQ/xIzfaT81b7Tr0H0kM8MkcdksKN0rDEqDMh
 1jGQ==
X-Gm-Message-State: AOAM530SnVbAeBldYLkNhDb7xAF6mhMiZC4uiWfWYAsSibS3aNbL0Fjv
 5HuYhdqpH7/YOREgROKXRaI=
X-Google-Smtp-Source: ABdhPJxu/+RIi87EI1f36Vr7Li+Ul/kNIIoagY73de2BeXztI3uQN8w4l7WqyA51zpnq1qGpZm55vg==
X-Received: by 2002:a17:906:1c12:b0:6f3:9eed:e0 with SMTP id
 k18-20020a1709061c1200b006f39eed00e0mr14192987ejg.656.1651075654602; 
 Wed, 27 Apr 2022 09:07:34 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 n5-20020a170906378500b006efb4ab6f59sm6984098ejc.86.2022.04.27.09.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 09:07:34 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v5 15/18] net: netcp: Remove usage of list iterator
 for list_add() after loop body
Date: Wed, 27 Apr 2022 18:06:32 +0200
Message-Id: <20220427160635.420492-16-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427160635.420492-1-jakobkoschel@gmail.com>
References: <20220427160635.420492-1-jakobkoschel@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Ariel Elior <aelior@marvell.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, Arnd Bergmann <arnd@arndb.de>,
 KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Yonghong Song <yhs@fb.com>,
 Edward Cree <ecree.xilinx@gmail.com>,
 Casper Andersson <casper.casan@gmail.com>, Xu Wang <vulab@iscas.ac.cn>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, bpf@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation to limit the scope of a list iterator to the list
traversal loop, use a dedicated pointer pointing to the location
where the element should be inserted [1].

Before, the code implicitly used the head when no element was found
when using &next->list. The new 'pos' variable is set to the list head
by default and overwritten if the list exits early, marking the
insertion point for list_add().

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/net/ethernet/ti/netcp_core.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ti/netcp_core.c b/drivers/net/ethernet/ti/netcp_core.c
index 16507bff652a..f25104b5a31b 100644
--- a/drivers/net/ethernet/ti/netcp_core.c
+++ b/drivers/net/ethernet/ti/netcp_core.c
@@ -471,6 +471,7 @@ struct netcp_hook_list {
 int netcp_register_txhook(struct netcp_intf *netcp_priv, int order,
 			  netcp_hook_rtn *hook_rtn, void *hook_data)
 {
+	struct list_head *pos = &netcp_priv->txhook_list_head;
 	struct netcp_hook_list *entry;
 	struct netcp_hook_list *next;
 	unsigned long flags;
@@ -485,10 +486,12 @@ int netcp_register_txhook(struct netcp_intf *netcp_priv, int order,
 
 	spin_lock_irqsave(&netcp_priv->lock, flags);
 	list_for_each_entry(next, &netcp_priv->txhook_list_head, list) {
-		if (next->order > order)
+		if (next->order > order) {
+			pos = &next->list;
 			break;
+		}
 	}
-	__list_add(&entry->list, next->list.prev, &next->list);
+	list_add_tail(&entry->list, pos);
 	spin_unlock_irqrestore(&netcp_priv->lock, flags);
 
 	return 0;
@@ -520,6 +523,7 @@ EXPORT_SYMBOL_GPL(netcp_unregister_txhook);
 int netcp_register_rxhook(struct netcp_intf *netcp_priv, int order,
 			  netcp_hook_rtn *hook_rtn, void *hook_data)
 {
+	struct list_head *pos = &netcp_priv->rxhook_list_head;
 	struct netcp_hook_list *entry;
 	struct netcp_hook_list *next;
 	unsigned long flags;
@@ -534,10 +538,12 @@ int netcp_register_rxhook(struct netcp_intf *netcp_priv, int order,
 
 	spin_lock_irqsave(&netcp_priv->lock, flags);
 	list_for_each_entry(next, &netcp_priv->rxhook_list_head, list) {
-		if (next->order > order)
+		if (next->order > order) {
+			pos = &next->list;
 			break;
+		}
 	}
-	__list_add(&entry->list, next->list.prev, &next->list);
+	list_add_tail(&entry->list, pos);
 	spin_unlock_irqrestore(&netcp_priv->lock, flags);
 
 	return 0;
-- 
2.25.1

