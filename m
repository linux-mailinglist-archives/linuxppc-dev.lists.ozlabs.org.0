Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E464F7CFB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:34:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYyRx0NNmz3cdm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:34:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U64EZxGR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b;
 helo=mail-ej1-x62b.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=U64EZxGR; dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYyMy0nRxz2yXP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:31:09 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id k23so9902473ejd.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 03:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7YEqjlB8bsXZ45gzNCMwH2JxmTxm4dwtRKumhhyyThw=;
 b=U64EZxGRbbD6pcGGxysdvb6UC8spWf9j4i/wUJz5ddDFhoazBBRgniBsbGKwfcoyB6
 Y3R4h1Jtnl+dMLUOBbQ3Mbtm240Zz7D8ggLMYTHXI8X/jbDk1z9cYJGh/sLyB33Q2ux0
 KIgo/Wp5dSFk/3NP6hRm8dkwZGAsHMDsOZULMSXvK/IP8Y9KLG1lBXjHYOTqUGyNCicZ
 wDNvabeOOARFjYAssvgtqouuoCfNlxKTBH/1005bkg7MdUe5xwWfEjQv76oDHtA04/ZY
 /HuBH2goLAhsQSwB7tRtkJ3V7VOarq6n22XJJGBdtp/b0lvGwyiWMwrDLCGrNCYZf+tp
 8R0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7YEqjlB8bsXZ45gzNCMwH2JxmTxm4dwtRKumhhyyThw=;
 b=aba068HVEwVfQKYIRwZ5cfxZ830H1k88LjYNDWHDVDuaomadGXqL3sE+PBBGanoRLi
 Dp+gY5IPV85sut0Dh8Rv5XKsFbYYkQx8NKsgzBpjbuMbNgQzPv7BWtVbr1MS52BXtQip
 twb9wfQgCyQW2GITkl4b2W3ETpAXTGmapE6EYcNvPOWdgVRSKTvQW64OHcSS2tGsIgR2
 /6T8C6sE4LzT2vsndmSRnnZic6X4+hYV6iFq/MhL+c/tEE1pj9zg2kS8SMuZBzFbvR7V
 40EEgFHjbSANr/TwXr7kdKTWMAi6EWlSe4cFlvEZstbCNbYhHy+3h7MLAbPBD+1taLwx
 ygWQ==
X-Gm-Message-State: AOAM533h+oZxyb72wJK/MXZRvqT2gmLUGTmjOIITLXBF3zM42G583b+u
 nefpUGe7q0qSTHdaPUuPLCk=
X-Google-Smtp-Source: ABdhPJzfK7J/oVVIzBQuOre8YptTYXi0JAQavlyqub2o6edmGoAwWmVzAvj4GmM2kfON5LuClIxWJQ==
X-Received: by 2002:a17:907:3f92:b0:6e7:2ad3:a92b with SMTP id
 hr18-20020a1709073f9200b006e72ad3a92bmr13146230ejc.239.1649327467049; 
 Thu, 07 Apr 2022 03:31:07 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm7413573ejz.57.2022.04.07.03.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 03:31:06 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next 05/15] net: sparx5: Replace usage of found with
 dedicated list iterator variable
Date: Thu,  7 Apr 2022 12:28:50 +0200
Message-Id: <20220407102900.3086255-6-jakobkoschel@gmail.com>
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

To move the list iterator variable into the list_for_each_entry_*()
macro in the future it should be avoided to use the list iterator
variable after the loop body.

To *never* use the list iterator variable after the loop it was
concluded to use a separate iterator variable instead of a
found boolean [1].

This removes the need to use a found variable and simply checking if
the variable was set, can determine if the break/goto was hit.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 .../microchip/sparx5/sparx5_mactable.c        | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c b/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
index a5837dbe0c7e..bb8d9ce79ac2 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
@@ -362,8 +362,7 @@ static void sparx5_mact_handle_entry(struct sparx5 *sparx5,
 				     unsigned char mac[ETH_ALEN],
 				     u16 vid, u32 cfg2)
 {
-	struct sparx5_mact_entry *mact_entry;
-	bool found = false;
+	struct sparx5_mact_entry *mact_entry = NULL, *iter;
 	u16 port;
 
 	if (LRN_MAC_ACCESS_CFG_2_MAC_ENTRY_ADDR_TYPE_GET(cfg2) !=
@@ -378,28 +377,28 @@ static void sparx5_mact_handle_entry(struct sparx5 *sparx5,
 		return;
 
 	mutex_lock(&sparx5->mact_lock);
-	list_for_each_entry(mact_entry, &sparx5->mact_entries, list) {
-		if (mact_entry->vid == vid &&
-		    ether_addr_equal(mac, mact_entry->mac)) {
-			found = true;
-			mact_entry->flags |= MAC_ENT_ALIVE;
-			if (mact_entry->port != port) {
+	list_for_each_entry(iter, &sparx5->mact_entries, list) {
+		if (iter->vid == vid &&
+		    ether_addr_equal(mac, iter->mac)) {
+			iter->flags |= MAC_ENT_ALIVE;
+			if (iter->port != port) {
 				dev_warn(sparx5->dev, "Entry move: %d -> %d\n",
-					 mact_entry->port, port);
-				mact_entry->port = port;
-				mact_entry->flags |= MAC_ENT_MOVED;
+					 iter->port, port);
+				iter->port = port;
+				iter->flags |= MAC_ENT_MOVED;
 			}
 			/* Entry handled */
+			mact_entry = iter;
 			break;
 		}
 	}
 	mutex_unlock(&sparx5->mact_lock);
 
-	if (found && !(mact_entry->flags & MAC_ENT_MOVED))
+	if (mact_entry && !(mact_entry->flags & MAC_ENT_MOVED))
 		/* Present, not moved */
 		return;
 
-	if (!found) {
+	if (!mact_entry) {
 		/* Entry not found - now add */
 		mact_entry = alloc_mact_entry(sparx5, mac, vid, port);
 		if (!mact_entry)
-- 
2.25.1

