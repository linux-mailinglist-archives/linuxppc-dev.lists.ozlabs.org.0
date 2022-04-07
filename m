Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB0D4F7CF0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:33:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYyQZ20lLz3cFd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:33:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G3UZPome;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635;
 helo=mail-ej1-x635.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=G3UZPome; dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYyMw3c7zz2yXs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:31:07 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id l7so4472535ejn.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 03:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jhyzYWxSgWQ5UdJQbW741q+z9oGhpyCDqsCBhTcqlFE=;
 b=G3UZPomec6PoLWQr0bjC3OjAkRdJzUbc8hdH4J8L5rIZWtj65qOF0I5tw+uanOORtq
 M/QkTiV8pUSGlmzmp3/T/8gXv4ofkAQnbHHfbVNRR80ErhX14WWqa3zHwK6oMOxaABA8
 CXvz7W5DwipofPsajlF9nWVUSWrZjvu2UGyC4GTd4GfBrnoV8i8WJqIrUnF91eME18Z/
 li2jILa4O1yDRJp1q8IwWm+ClS9QJrbNBiMVn8sUaKRITd/xWXx5L1fpnf6pQ4bjpDdY
 rP5sGgqicELTA+FXuNOs5iiAGlujjTdxO4aWIpC80IYh7qHhgKXFKn0qVqddkhh09Sn1
 kTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jhyzYWxSgWQ5UdJQbW741q+z9oGhpyCDqsCBhTcqlFE=;
 b=dwdr4C/xnBIHtDRRCw5J4+o2fWLp8RoSq5HIFo/mKBTuVOWI73aum37VreWFojGXcW
 NIeLe9YY2A20PnDGAMvslI0C4BXg0zMyF2iQwO+556jE8C+8SZL7TFgBbocFOPLGRrY1
 zE2GjyiVstXFT0KPNka1SklJdj6p9xB5pa7ki5W1a7ZBma1MUWtoEPGvARwmfFqBDmwd
 eaXPtC9/t34iI52Eb3SUTKnMICKkn+k0bBqugcciqOoE1eDREokgv1vj4fVGl32HfI5c
 CIyiyjc4VnNru3SwPkubezr+yrLrLm+ryId3ojYu5emFCnvjE4gtVvDWBnwgLsn2k+iW
 IXQQ==
X-Gm-Message-State: AOAM5339amWq3ta22KYNicydktxjBJH7d2dxTLOamcQ47z0vfx7lkvBt
 jJTCaaZJBVxeYakO9f1FbcE=
X-Google-Smtp-Source: ABdhPJyE7I0SFQsOWGAsoCOLM9ViYaVOBqxCDbFEkgAjLcx6OMRDiQC9PRBkCRmOmfperDK8wZQAYg==
X-Received: by 2002:a17:906:8301:b0:6e4:896d:59b1 with SMTP id
 j1-20020a170906830100b006e4896d59b1mr12370590ejx.396.1649327464586; 
 Thu, 07 Apr 2022 03:31:04 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm7413573ejz.57.2022.04.07.03.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 03:31:04 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next 03/15] net: dsa: mv88e6xxx: Replace usage of found
 with dedicated iterator
Date: Thu,  7 Apr 2022 12:28:48 +0200
Message-Id: <20220407102900.3086255-4-jakobkoschel@gmail.com>
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
 drivers/net/dsa/mv88e6xxx/chip.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 64f4fdd02902..f254f537c357 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -1381,28 +1381,27 @@ static int mv88e6xxx_set_mac_eee(struct dsa_switch *ds, int port,
 /* Mask of the local ports allowed to receive frames from a given fabric port */
 static u16 mv88e6xxx_port_vlan(struct mv88e6xxx_chip *chip, int dev, int port)
 {
+	struct dsa_port *dp = NULL, *iter, *other_dp;
 	struct dsa_switch *ds = chip->ds;
 	struct dsa_switch_tree *dst = ds->dst;
-	struct dsa_port *dp, *other_dp;
-	bool found = false;
 	u16 pvlan;
 
 	/* dev is a physical switch */
 	if (dev <= dst->last_switch) {
-		list_for_each_entry(dp, &dst->ports, list) {
-			if (dp->ds->index == dev && dp->index == port) {
-				/* dp might be a DSA link or a user port, so it
+		list_for_each_entry(iter, &dst->ports, list) {
+			if (iter->ds->index == dev && iter->index == port) {
+				/* iter might be a DSA link or a user port, so it
 				 * might or might not have a bridge.
-				 * Use the "found" variable for both cases.
+				 * Set the "dp" variable for both cases.
 				 */
-				found = true;
+				dp = iter;
 				break;
 			}
 		}
 	/* dev is a virtual bridge */
 	} else {
-		list_for_each_entry(dp, &dst->ports, list) {
-			unsigned int bridge_num = dsa_port_bridge_num_get(dp);
+		list_for_each_entry(iter, &dst->ports, list) {
+			unsigned int bridge_num = dsa_port_bridge_num_get(iter);
 
 			if (!bridge_num)
 				continue;
@@ -1410,13 +1409,13 @@ static u16 mv88e6xxx_port_vlan(struct mv88e6xxx_chip *chip, int dev, int port)
 			if (bridge_num + dst->last_switch != dev)
 				continue;
 
-			found = true;
+			dp = iter;
 			break;
 		}
 	}
 
 	/* Prevent frames from unknown switch or virtual bridge */
-	if (!found)
+	if (!dp)
 		return 0;
 
 	/* Frames from DSA links and CPU ports can egress any local port */
-- 
2.25.1

