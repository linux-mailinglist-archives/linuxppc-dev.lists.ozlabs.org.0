Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D07A4F7D27
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:40:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYyZH4Qz9z2ygC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:40:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nNuQkSMC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531;
 helo=mail-ed1-x531.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nNuQkSMC; dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYyN937J5z3bVH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:31:21 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id q26so5848568edc.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 03:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y4Pr090XMJdWC/DFcBeDDVj+LNsTMLYKFYstx7+jurs=;
 b=nNuQkSMCzLU1sEOB3kq25UUx35GFYl6QVT99wdmylAxE9TixTKmDmoqMFWdlbqiWZP
 I3kc8fEKcgXlSy83s+c0lRBGVAHJEWI14YpuOLndz3WHyzs7RLvuY/L5jpLgy2VXqiWT
 XQwh6mAxC9rRU/MR6v9XW+wUQVVEOTvTmVXHjIAtQWksNpk44d3f4eaYMV/Ys5xgW0v9
 binB3V+mZmDmJuRNiEbhTx36DO8zxBDOH6jcmiVJLU3GAGr2SdjmTgaIJRTM1VLnwUyN
 HqfyTsMQcIfkBrPyHbBLbFKivOQQn6H7EoI68pLa9qZa4b5aV/5ifQDEIQMvxl8t4KRy
 QpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y4Pr090XMJdWC/DFcBeDDVj+LNsTMLYKFYstx7+jurs=;
 b=RYQi9bUZTc3aI6hApJjqawF3VuAVJBQ64TQXn8u9z3bIxCyD9D+KTJXbwbiaGQFNba
 M9KNe9OXYpFwfZj1CKeElWMHXusCvdE+Wj7HCcgpbyZqWD8By3nJ+81XQbz+YSEWsfn4
 seiiVK7/osKS2PFS/AIVehixNubSfjp++p6gpZoE2Zxi9SotXi+Tjs5J/0sbylZFH23i
 E16W6ViG9ONW/TFe261jEielIAWxctHChSYfgRjfx9QFTQriN+2I9DgMLqHQRUWw8qM9
 r8KGU03pAAPZRGeuUicbhrpi1+IBIzdnWXxwBAxdh6rYDMgcxnwLqxcYNmSwGCkyE2el
 DtQw==
X-Gm-Message-State: AOAM5332HLqCb585ABDqxiUvN6hu4Mv71lLARuycDA9bebW5qBlq5TsL
 D8i+JiFWPtXWbrt+PGxl+KQ=
X-Google-Smtp-Source: ABdhPJyUVMuPNJKyBCwZCMXkNxTYAyM3gmvop0JowcoIjCJOFNiuXCadO642w0wu8JZyPI+BRtF6cg==
X-Received: by 2002:a05:6402:1111:b0:416:2ac8:b98e with SMTP id
 u17-20020a056402111100b004162ac8b98emr13450111edv.236.1649327478576; 
 Thu, 07 Apr 2022 03:31:18 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm7413573ejz.57.2022.04.07.03.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 03:31:18 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next 14/15] ipvlan: Remove usage of list iterator variable
 for the loop body
Date: Thu,  7 Apr 2022 12:28:59 +0200
Message-Id: <20220407102900.3086255-15-jakobkoschel@gmail.com>
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

In preparation to limit the scope of the list iterator variable to the
list traversal loop, use a dedicated pointer to iterate through the
list [1].

Since that variable should not be used past the loop iteration, a
separate variable is used to 'remember the current location within the
loop'.
By avoiding the use of the iterator variable after the loop, we can lower
the scope of it to the list traversal macros in the future.

To either continue iterating from that position or start a new
iteration (if the previous iteration was complete) list_prepare_entry()
is used.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/net/ipvlan/ipvlan_main.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ipvlan/ipvlan_main.c b/drivers/net/ipvlan/ipvlan_main.c
index 696e245f6d00..063d7c30e944 100644
--- a/drivers/net/ipvlan/ipvlan_main.c
+++ b/drivers/net/ipvlan/ipvlan_main.c
@@ -9,7 +9,7 @@
 static int ipvlan_set_port_mode(struct ipvl_port *port, u16 nval,
 				struct netlink_ext_ack *extack)
 {
-	struct ipvl_dev *ipvlan;
+	struct ipvl_dev *ipvlan, *tmp = NULL;
 	unsigned int flags;
 	int err;

@@ -26,8 +26,10 @@ static int ipvlan_set_port_mode(struct ipvl_port *port, u16 nval,
 						       flags & ~IFF_NOARP,
 						       extack);
 			}
-			if (unlikely(err))
+			if (unlikely(err)) {
+				tmp = ipvlan;
 				goto fail;
+			}
 		}
 		if (nval == IPVLAN_MODE_L3S) {
 			/* New mode is L3S */
@@ -43,6 +45,7 @@ static int ipvlan_set_port_mode(struct ipvl_port *port, u16 nval,
 	return 0;

 fail:
+	ipvlan = list_prepare_entry(tmp, &port->ipvlans, pnode);
 	/* Undo the flags changes that have been done so far. */
 	list_for_each_entry_continue_reverse(ipvlan, &port->ipvlans, pnode) {
 		flags = ipvlan->dev->flags;
--
2.25.1

