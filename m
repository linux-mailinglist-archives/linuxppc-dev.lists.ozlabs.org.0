Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E2E4FDBEC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 13:00:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd2mx55wlz3bgC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 21:00:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ITHb5Z6R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631;
 helo=mail-ej1-x631.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ITHb5Z6R; dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd2lm2K78z2ygC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 20:58:58 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id bg10so36566499ejb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 03:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8gxZv9czNrqSsp+NwDMxwad6YKQOb4DD102M9ETWSEU=;
 b=ITHb5Z6Ro2j7h9KvVs8LnHP+X9FORr367PPN32rttpJ+hrNMecB/3XZ4h+su6UDu5Q
 UHw8l+Pjwclo5Ysc5IzDvHR9VYp8P7ICq84aWXUN5djTntioSeCBzqLrmWEVOmxMzo/i
 lTo2zLR/QC4uKo0xVTLDz3Stqpju1oz1DsJ3jrjvDHTyr+zTXgTAcEffm7Wio8myKENt
 wbSzkkHS7T+8h5HggSK/6g02VLekQa/Em0l750WCJr+KqES7vhEzWKH+ooie57tmdXlR
 7uNWoRy+loFZl+7EYx6sA58obekFJFD4IGE7LZEGMkR2VSocff0x2mtDG+azcl2C6gjr
 ZO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8gxZv9czNrqSsp+NwDMxwad6YKQOb4DD102M9ETWSEU=;
 b=ozxuj6qAG4S82OE43PTR0kArbTbFSRiAenJ0VcrYPq3RLYy16PqvFayUyNP2UM6dxu
 Pd+Z1w7grFnMmU+HnOSMEsQk3QMIi84JPWixu4CCiWUBx94nGWqd9NAv5Sd8LOqeQVEP
 JdmQ+s60+o8dqvzay2k18E6o0UTDwDabuJCI99WbnmtwC34LNHX5I+/Pzc3X+4NIk7Q3
 KoxYpKdIK7U9tAojHRWBO7WWe/wHPgta0zVhiXX5qyxkTehQ+grFGXqKb7dDU05yNGi1
 y3hX+RpVM3MHqSu0oz7aCxiXZ0c4zQIszZ6cXAV1Ny5OOoGUzqANEGt8JRAXwM7wE9GD
 GeZA==
X-Gm-Message-State: AOAM5318AH8/fvS7kBYLmC9Gm3Rv895tM1IXbstF8m4rTNhX5d444Ww/
 sh5+/E1nU2To33PfavsE2Ik=
X-Google-Smtp-Source: ABdhPJzNTHWGl2lSK5El9AwYn/g4QL+TmEsz0QZcXmoF0HHdlRFYvO6ANFjRh9vxOm6k30pcEG3CMw==
X-Received: by 2002:a17:906:2883:b0:6e8:7012:4185 with SMTP id
 o3-20020a170906288300b006e870124185mr14014409ejd.204.1649761135581; 
 Tue, 12 Apr 2022 03:58:55 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 f1-20020a056402194100b00416b174987asm16986370edz.35.2022.04.12.03.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 03:58:55 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v2 03/18] net: dsa: sja1105: reorder
 sja1105_first_entry_longer_than with memory allocation
Date: Tue, 12 Apr 2022 12:58:15 +0200
Message-Id: <20220412105830.3495846-4-jakobkoschel@gmail.com>
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

sja1105_first_entry_longer_than() does not make use of the full struct
sja1105_gate_entry *e, just of e->interval which is set from the passed
entry_time.

This means that if there is a gate conflict, we have allocated e for
nothing, just to free it later. Reorder the memory allocation and the
function call, to avoid that and simplify the error unwind path.

Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/dsa/sja1105/sja1105_vl.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c b/drivers/net/dsa/sja1105/sja1105_vl.c
index 369be2ac3587..e5ea8eb9ec4e 100644
--- a/drivers/net/dsa/sja1105/sja1105_vl.c
+++ b/drivers/net/dsa/sja1105/sja1105_vl.c
@@ -36,7 +36,11 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 {
 	struct sja1105_gate_entry *e;
 	struct list_head *pos;
-	int rc;
+
+	pos = sja1105_first_entry_longer_than(&gating_cfg->entries,
+					      entry_time, extack);
+	if (IS_ERR(pos))
+		return PTR_ERR(pos);
 
 	e = kzalloc(sizeof(*e), GFP_KERNEL);
 	if (!e)
@@ -45,22 +49,11 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 	e->rule = rule;
 	e->gate_state = gate_state;
 	e->interval = entry_time;
-
-	pos = sja1105_first_entry_longer_than(&gating_cfg->entries,
-					      e->interval, extack);
-	if (IS_ERR(pos)) {
-		rc = PTR_ERR(pos);
-		goto err;
-	}
-
 	list_add(&e->list, pos->prev);
 
 	gating_cfg->num_entries++;
 
 	return 0;
-err:
-	kfree(e);
-	return rc;
 }
 
 /* The gate entries contain absolute times in their e->interval field. Convert
-- 
2.25.1

