Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2D9511C4C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 18:15:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpP4R2v6Fz3dQy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 02:15:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Loswq8nv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531;
 helo=mail-ed1-x531.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Loswq8nv; dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpNtv0817z3bfc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 02:07:34 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id z99so2504829ede.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 09:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fIZenjsGtzoZOCvRY/8dIr7NFNGibTLVVWT+oNYuIJo=;
 b=Loswq8nvbzRxDR73WmbwfNXIJGBqOC3T+Wyo24t48yxcjf//w0mo3l9Ym0uXu/cZ9A
 Y22QBny9+t/M8zNI4cf7TfXze/2AggxqotMTFurZBhCPTYEO2+h9g9aiR/eJVXoKwegL
 cjrR3bUQtRNgySrtOaBt9/Kf1FfoMlTT01nygxeQrimJB/zoCEAs2Emyt1RSc7c51bGm
 Z7yuYGjT5B3iX0wv12wvEt2tcr2W+BQbB3Xp5mHBBe4BLBGoJ0tFH7b5ACm6jH9qYL7M
 OSkvFVGEotQRL9Ne9eyhT7HWSsrS8qbM4eeLpI4OETGfcXP84f0qR8TqMxbhiHkvmY2B
 jEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fIZenjsGtzoZOCvRY/8dIr7NFNGibTLVVWT+oNYuIJo=;
 b=gjS+ZM7PRbkYbkfMoB+9KnGG7/40o/1KIJnIUuPvB+PMl87hILl5SiVO9gNc+KvdDq
 wdcuVO2ZHf+crm0ENwHY9YctoEwP5iCeBUdpjyUpJij1wl/gB9XIBRAyPpMV7xM0wt9o
 CNJeqVBEzkf/tkNZw6StrTIDtY7xLnR4fk/EQFTWbrqAbfPacSojXq7AnV4iK0N2Cvwu
 b6t20cqOX7LgYEiPMNqhXybYSy1UV3b0IZl2w15zwO7HSgTG+m5FJVeQYYPPZ6JHNdRb
 pJ05pPAHLeV5yOcgc+jHCl36vqdyVdaMgp1u8ovqix9BWR+WE+rlquQZn85sdd6bxh75
 rG7w==
X-Gm-Message-State: AOAM532E7q3pJWRZ8l140uP+uY6mWHx5dGYzMIPJ+Qj/wSC5BpjQ/3xH
 V0uvxSOyEgQwPlWVk4rQofA=
X-Google-Smtp-Source: ABdhPJycm/m7LkEc21AKXttuikHx7Z81DgO8aTXJSz0bAgx9hTWZ3Wde84ZzMxbdpyXArZqhFoaUAA==
X-Received: by 2002:aa7:d393:0:b0:425:a8f8:663a with SMTP id
 x19-20020aa7d393000000b00425a8f8663amr30810362edq.323.1651075651612; 
 Wed, 27 Apr 2022 09:07:31 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 n5-20020a170906378500b006efb4ab6f59sm6984098ejc.86.2022.04.27.09.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 09:07:31 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v5 13/18] net: qede: Remove check of list iterator
 against head past the loop body
Date: Wed, 27 Apr 2022 18:06:30 +0200
Message-Id: <20220427160635.420492-14-jakobkoschel@gmail.com>
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

When list_for_each_entry() completes the iteration over the whole list
without breaking the loop, the iterator value will be a bogus pointer
computed based on the head element.

While it is safe to use the pointer to determine if it was computed
based on the head element, either with list_entry_is_head() or
&pos->member == head, using the iterator variable after the loop should
be avoided.

In preparation to limit the scope of a list iterator to the list
traversal loop, use a dedicated pointer to point to the found element [1].

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/net/ethernet/qlogic/qede/qede_filter.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qede/qede_filter.c b/drivers/net/ethernet/qlogic/qede/qede_filter.c
index 3010833ddde3..3d167e37e654 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_filter.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_filter.c
@@ -829,18 +829,21 @@ int qede_configure_vlan_filters(struct qede_dev *edev)
 int qede_vlan_rx_kill_vid(struct net_device *dev, __be16 proto, u16 vid)
 {
 	struct qede_dev *edev = netdev_priv(dev);
-	struct qede_vlan *vlan;
+	struct qede_vlan *vlan = NULL;
+	struct qede_vlan *iter;
 	int rc = 0;
 
 	DP_VERBOSE(edev, NETIF_MSG_IFDOWN, "Removing vlan 0x%04x\n", vid);
 
 	/* Find whether entry exists */
 	__qede_lock(edev);
-	list_for_each_entry(vlan, &edev->vlan_list, list)
-		if (vlan->vid == vid)
+	list_for_each_entry(iter, &edev->vlan_list, list)
+		if (iter->vid == vid) {
+			vlan = iter;
 			break;
+		}
 
-	if (list_entry_is_head(vlan, &edev->vlan_list, list)) {
+	if (!vlan) {
 		DP_VERBOSE(edev, (NETIF_MSG_IFUP | NETIF_MSG_IFDOWN),
 			   "Vlan isn't configured\n");
 		goto out;
-- 
2.25.1

