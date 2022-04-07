Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA984F7CD1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:31:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYyNW2kyZz2yZC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:31:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=A8dgIRU7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d;
 helo=mail-ej1-x62d.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=A8dgIRU7; dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYyMw3fGFz2yY1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:31:06 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id bq8so9851201ejb.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 03:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kT9lxrok+SOZ0lJZngMY/3t48p6ivac6h4GBagGgqlA=;
 b=A8dgIRU7XpwGn8L/TWG7eFAfHkVAzizRPgoC1D4gc2OIpAMDpQJiTRoz9/IZCjJOM9
 0s/42Xr99tqQ/JiR7ikZbfNGvGTjsSHBNU0AYR/pK/X2p6qv+xnvCz5faMoZxi90/IKT
 PNc0mh3GTFWBDQq/CMrWD0tfMR9PZS5MU6bXydxhfUYbVNe/A45xXvJgVLM0d4Ko+mBZ
 zEwllUgvuEavEaIEI448YgPIJ4PuwL86Fv8WZf4DJCkQAfkD6Ngv7DCP695sV2rZt6D+
 o3zzSLnoDfg2cEkyeyKGITs5rnEClHAm1GR6V9FxE6OPBIgGTU//ptm4fVdBqItJvn9G
 MWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kT9lxrok+SOZ0lJZngMY/3t48p6ivac6h4GBagGgqlA=;
 b=1Eq5oMpURtHM/eDNrlS3rfeHr2GmrDEfCbCAxfnUrZuLUnRLbxPyyEnTv/zbqJ5rRZ
 UZ7yPaiYgfV/Amwkn95KTmp/joE1bHzml1BXRoSFisCOBhDJfQoNGzzDSYcpqSgRgLdw
 fk3D5e/1GY6eZAYgefg7dNCKgqFNylc1DWpOTbGAn7M0vtDwB6ow35jcx/DAiXe5gSM9
 17VW//Xbo2T0bZ1/xtxym96lxg+2yApWZOWS+cbfdf8ls36j60epT5ZVdwgeBdUXmUiW
 zw7ZsOyjYzUz83EqAhNJcCMqmJrOMHs0SV1eCxyyq5J3oZYWsIU3vQh9RHXXMKgu8NDW
 O0Ow==
X-Gm-Message-State: AOAM531Wk+NZA3VBR3TyzBROBxYsb8PPgijDfw8f2kxbtxHFwjWtJbST
 lJnAAJoUbgVHVlklJv8GpDg=
X-Google-Smtp-Source: ABdhPJz1ozEcGcfvbMMbR7f3V/Sq2iRBo4hnJMmtYdRPitfh6Ug/fwJ4nnyfng/IyzCFUa3t6H3CwQ==
X-Received: by 2002:a17:906:4787:b0:6e1:409f:8deb with SMTP id
 cw7-20020a170906478700b006e1409f8debmr12629244ejc.80.1649327463446; 
 Thu, 07 Apr 2022 03:31:03 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm7413573ejz.57.2022.04.07.03.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 03:31:03 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next 02/15] net: dsa: sja1105: Remove usage of iterator
 for list_add() after loop
Date: Thu,  7 Apr 2022 12:28:47 +0200
Message-Id: <20220407102900.3086255-3-jakobkoschel@gmail.com>
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
 drivers/net/dsa/sja1105/sja1105_vl.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c b/drivers/net/dsa/sja1105/sja1105_vl.c
index b7e95d60a6e4..cfcae4d19eef 100644
--- a/drivers/net/dsa/sja1105/sja1105_vl.c
+++ b/drivers/net/dsa/sja1105/sja1105_vl.c
@@ -27,20 +27,24 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 	if (list_empty(&gating_cfg->entries)) {
 		list_add(&e->list, &gating_cfg->entries);
 	} else {
-		struct sja1105_gate_entry *p;
+		struct sja1105_gate_entry *p = NULL, *iter;
 
-		list_for_each_entry(p, &gating_cfg->entries, list) {
-			if (p->interval == e->interval) {
+		list_for_each_entry(iter, &gating_cfg->entries, list) {
+			if (iter->interval == e->interval) {
 				NL_SET_ERR_MSG_MOD(extack,
 						   "Gate conflict");
 				rc = -EBUSY;
 				goto err;
 			}
 
-			if (e->interval < p->interval)
+			if (e->interval < iter->interval) {
+				p = iter;
+				list_add(&e->list, iter->list.prev);
 				break;
+			}
 		}
-		list_add(&e->list, p->list.prev);
+		if (!p)
+			list_add(&e->list, gating_cfg->entries.prev);
 	}
 
 	gating_cfg->num_entries++;
-- 
2.25.1

