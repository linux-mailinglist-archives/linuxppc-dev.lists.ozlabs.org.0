Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BAF4FDC31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 13:02:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd2rJ26Nwz3dR1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 21:02:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eSGSjXgh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629;
 helo=mail-ej1-x629.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eSGSjXgh; dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd2lp54Y1z2yh9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 20:59:02 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id r13so36579330ejd.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 03:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6t7Nl01e4cvCsyopQipowOOZNCNPO7CspXlgqSRJfN8=;
 b=eSGSjXghlomi9azQlGr8ioc93WtOY0TuT/i6asBU/eQ+Q1w2HuQr9Vbj0Lv+K2Uwd6
 lXdCp6Vbsjqb5Tp7v0fWY/1qyy/i8g8zwSwikdYrSgIRB7uQP9o+u+3aqohN3d5QBPnP
 O4mRo1gAyGu1nbzgZwnvP9EAz/wI6yc3NzZ4bclnifBH7zuHLKkaqhGX1U63ThGSZauP
 WZ+sMhbur0UIkqVmNVJeRpye8a4Q3jZgiinMGQQxTzyF3nF8Mw+K59r+DiRp3aQNsYpa
 DdIpdyl4Ejhf0ewOKioasVXY5lbD/Pnm2HFjg4mbFodfu/4l26vi13SEfg+nBtyg/yVz
 7lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6t7Nl01e4cvCsyopQipowOOZNCNPO7CspXlgqSRJfN8=;
 b=DfSERbKVYNYcI/aehxSitUG7YD51Te2jpgfEL+Xj/cGIYTihcoB47M6PlN32NQG4ik
 nC9pAKnp/eIK7ct8LL2BTNQDVCs0zI3DbaiO1QYUkMilxTkvJqftN5Rry+syKmkzd6yL
 QdB1QJIfqXhJGHhBsFvQIM1v8G9Jokj+PtTSXhqlMBjXb+QncmqWbceqLz9s4/NOQK/r
 gO168od4vktXAepyrkFzv13Lzxy53mA9pcnuRvWKbIJpo7o/8KIPgH2CBa5HpYX9or+n
 gGamXIsiXwzdZi7F5fpAfT8RsNGhXX/5xsccuOVGBeL+Xx5JLrlF4zdlfBzcw23mW7pr
 KcOw==
X-Gm-Message-State: AOAM531pF2MwbaFJk/I3hRbsPxakyn4AOnJP0mB/j6w4AZSt7UAllxNS
 W0+HGLdwqRfQtPVvdJmQedc=
X-Google-Smtp-Source: ABdhPJwVYANoguUGdZzhpnrpdU22VVN93loOJ+LRG4RlNJ4J6OzE+BXNUMPf7L3VgsdYHMP9/kOrsw==
X-Received: by 2002:a17:907:72c3:b0:6e8:a265:4232 with SMTP id
 du3-20020a17090772c300b006e8a2654232mr5352112ejc.86.1649761139587; 
 Tue, 12 Apr 2022 03:58:59 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 f1-20020a056402194100b00416b174987asm16986370edz.35.2022.04.12.03.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 03:58:59 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v2 06/18] net: dsa: mv88e6xxx: refactor
 mv88e6xxx_port_vlan()
Date: Tue, 12 Apr 2022 12:58:18 +0200
Message-Id: <20220412105830.3495846-7-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412105830.3495846-1-jakobkoschel@gmail.com>
References: <20220412105830.3495846-1-jakobkoschel@gmail.com>
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
 "Bos, H.J." <h.j.bos@vu.nl>, linux-arm-kernel@lists.infradead.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Yonghong Song <yhs@fb.com>,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Casper Andersson <casper.casan@gmail.com>, Xu Wang <vulab@iscas.ac.cn>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, bpf@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To avoid bugs and speculative execution exploits due to type-confused
pointers at the end of a list_for_each_entry() loop, one measure is to
restrict code to not use the iterator variable outside the loop block.

In the case of mv88e6xxx_port_vlan(), this isn't a problem, as we never
let the loops exit through "natural causes" anyway, by using a "found"
variable and then using the last "dp" iterator prior to the break, which
is a safe thing to do.

Nonetheless, with the expected new syntax, this pattern will no longer
be possible.

Profit off of the occasion and break the two port finding methods into
smaller sub-functions. Somehow, returning a copy of the iterator pointer
is still accepted.

This change makes it redundant to have a "bool found", since the "dp"
from mv88e6xxx_port_vlan() now holds NULL if we haven't found what we
were looking for.

Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 54 ++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index b3aa0e5bc842..1f35e89053e6 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -1378,42 +1378,50 @@ static int mv88e6xxx_set_mac_eee(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static struct dsa_port *mv88e6xxx_find_port(struct dsa_switch_tree *dst,
+					    int sw_index, int port)
+{
+	struct dsa_port *dp;
+
+	list_for_each_entry(dp, &dst->ports, list)
+		if (dp->ds->index == sw_index && dp->index == port)
+			return dp;
+
+	return NULL;
+}
+
+static struct dsa_port *
+mv88e6xxx_find_port_by_bridge_num(struct dsa_switch_tree *dst,
+				  unsigned int bridge_num)
+{
+	struct dsa_port *dp;
+
+	list_for_each_entry(dp, &dst->ports, list)
+		if (dsa_port_bridge_num_get(dp) == bridge_num)
+			return dp;
+
+	return NULL;
+}
+
 /* Mask of the local ports allowed to receive frames from a given fabric port */
 static u16 mv88e6xxx_port_vlan(struct mv88e6xxx_chip *chip, int dev, int port)
 {
 	struct dsa_switch *ds = chip->ds;
 	struct dsa_switch_tree *dst = ds->dst;
 	struct dsa_port *dp, *other_dp;
-	bool found = false;
 	u16 pvlan;
 
-	/* dev is a physical switch */
 	if (dev <= dst->last_switch) {
-		list_for_each_entry(dp, &dst->ports, list) {
-			if (dp->ds->index == dev && dp->index == port) {
-				/* dp might be a DSA link or a user port, so it
-				 * might or might not have a bridge.
-				 * Use the "found" variable for both cases.
-				 */
-				found = true;
-				break;
-			}
-		}
-	/* dev is a virtual bridge */
+		/* dev is a physical switch */
+		dp = mv88e6xxx_find_port(dst, dev, port);
 	} else {
-		list_for_each_entry(dp, &dst->ports, list) {
-			unsigned int bridge_num = dsa_port_bridge_num_get(dp);
-
-			if (bridge_num + dst->last_switch != dev)
-				continue;
-
-			found = true;
-			break;
-		}
+		/* dev is a virtual bridge */
+		dp = mv88e6xxx_find_port_by_bridge_num(dst,
+						       dev - dst->last_switch);
 	}
 
 	/* Prevent frames from unknown switch or virtual bridge */
-	if (!found)
+	if (!dp)
 		return 0;
 
 	/* Frames from DSA links and CPU ports can egress any local port */
-- 
2.25.1

