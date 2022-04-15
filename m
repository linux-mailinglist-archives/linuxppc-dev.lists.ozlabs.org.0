Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE99C5029EE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 14:32:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfwhD4pdKz3cC8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 22:32:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GuZnsylT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GuZnsylT; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfwfM5RHDz2yn1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 22:30:51 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id s18so15235164ejr.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 05:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UiT3RVqcqw/2HXUfTd1U2cSmXIntDYXehGziaThTk/w=;
 b=GuZnsylT3pcSouW5ddrLgN/m/YCesZsnWJ/E2onIZFIgxUc1qQptGQ3sweZxexEYv1
 vKlJMVgVRvAHa7/xdpFsMQ7uN3QSB6rhQkI5NwIS+W5EXVWFe0Bn0kjiOkXq0IBLCkuj
 lclTi38+gNurzHOHabPerljHiV+bP8CqpHqv8YsEab7edLhwB/IWh/ItcQeZ8y+awFYY
 R40H+T+SiaWZmaxtr/yh0dEt2Em33fUKgR21HmEKqqnYjBTxJgzmiwJG7e8Y8Wu0KHia
 cxok0g1QeVV7AlcK2vRmUgq2jI19VWMbd6X2aIXlxOrQF1HXjHfs/YnAFJ3UmApH9h3/
 0f/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UiT3RVqcqw/2HXUfTd1U2cSmXIntDYXehGziaThTk/w=;
 b=SrG7QgFHWD7CJVJQL0XCjAm/pXxHPIyB6LLJSxK6UgKa3FMU9jPulD+Wf5/4mGh6gG
 tcJDgUG1CrFH1m3xGrHhZKgoYHdu/oojNwt94ugMFTUAJoVIcAowMoVrLFsmj/JxE58b
 NTMzqNRQmLkPRf/NaWw4YtNsrs0pDE1YA9Vsx2E+hr0VkBuY4kcx15/VGqus+e3yUU3J
 l1JlJinIAQqTYjO+vJodcvXJZ5bMRz8v6QxcsPH7FWAPqe7LihyPWK5Wmk5kVUmAK8YO
 +/cDrnxQyb1j34O6ZiIU+ovrCCu5xMNxHRs8VJg34ktZt9nR+Z8yaZlJhWvznA57vlBM
 QOBQ==
X-Gm-Message-State: AOAM533RjrcJHJqgOnvkChr+gIr/y99bQX/JEqNaBfMoKfkEVr+I1jg0
 bmflzQvXuFVoSEp69nDYjI0=
X-Google-Smtp-Source: ABdhPJxpgeSXdYhbvP5O8IUq9aUGmAkJDetH/MVX0ebgJq8cESmyiLB+RwgqipJncxMfJg4FKayNBg==
X-Received: by 2002:a17:906:4d1a:b0:6e8:8860:8a72 with SMTP id
 r26-20020a1709064d1a00b006e888608a72mr6334437eju.540.1650025847533; 
 Fri, 15 Apr 2022 05:30:47 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1649533ejb.194.2022.04.15.05.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 05:30:47 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v4 02/18] net: dsa: sja1105: remove use of iterator
 after list_for_each_entry() loop
Date: Fri, 15 Apr 2022 14:29:31 +0200
Message-Id: <20220415122947.2754662-3-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220415122947.2754662-1-jakobkoschel@gmail.com>
References: <20220415122947.2754662-1-jakobkoschel@gmail.com>
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
 Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

The link below explains that there is a desire to syntactically change
list_for_each_entry() and list_for_each() such that it becomes
impossible to use the iterator variable outside the scope of the loop.

Although sja1105_insert_gate_entry() makes legitimate use of the
iterator pointer when it breaks out, the pattern it uses may become
illegal, so it needs to change.

It is deemed acceptable to use a copy of the loop iterator, and
sja1105_insert_gate_entry() only needs to know the list_head element
before which the list insertion should be made. So let's profit from the
occasion and refactor the list iteration to a dedicated function.

An additional benefit is given by the fact that with the helper function
in place, we no longer need to special-case the empty list, since it is
equivalent to not having found any gating entry larger than the
specified interval in the list. We just need to insert at the tail of
that list (list_add vs list_add_tail on an empty list does the same
thing).

Link: https://patchwork.kernel.org/project/netdevbpf/patch/20220407102900.3086255-3-jakobkoschel@gmail.com/#24810127
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/net/dsa/sja1105/sja1105_vl.c | 46 ++++++++++++++++++----------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c b/drivers/net/dsa/sja1105/sja1105_vl.c
index b7e95d60a6e4..369be2ac3587 100644
--- a/drivers/net/dsa/sja1105/sja1105_vl.c
+++ b/drivers/net/dsa/sja1105/sja1105_vl.c
@@ -7,6 +7,27 @@
 
 #define SJA1105_SIZE_VL_STATUS			8
 
+static struct list_head *
+sja1105_first_entry_longer_than(struct list_head *entries,
+				s64 interval,
+				struct netlink_ext_ack *extack)
+{
+	struct sja1105_gate_entry *p;
+
+	list_for_each_entry(p, entries, list) {
+		if (p->interval == interval) {
+			NL_SET_ERR_MSG_MOD(extack, "Gate conflict");
+			return ERR_PTR(-EBUSY);
+		}
+
+		if (interval < p->interval)
+			return &p->list;
+	}
+
+	/* Empty list, or specified interval is largest within the list */
+	return entries;
+}
+
 /* Insert into the global gate list, sorted by gate action time. */
 static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 				     struct sja1105_rule *rule,
@@ -14,6 +35,7 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 				     struct netlink_ext_ack *extack)
 {
 	struct sja1105_gate_entry *e;
+	struct list_head *pos;
 	int rc;
 
 	e = kzalloc(sizeof(*e), GFP_KERNEL);
@@ -24,25 +46,15 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 	e->gate_state = gate_state;
 	e->interval = entry_time;
 
-	if (list_empty(&gating_cfg->entries)) {
-		list_add(&e->list, &gating_cfg->entries);
-	} else {
-		struct sja1105_gate_entry *p;
-
-		list_for_each_entry(p, &gating_cfg->entries, list) {
-			if (p->interval == e->interval) {
-				NL_SET_ERR_MSG_MOD(extack,
-						   "Gate conflict");
-				rc = -EBUSY;
-				goto err;
-			}
-
-			if (e->interval < p->interval)
-				break;
-		}
-		list_add(&e->list, p->list.prev);
+	pos = sja1105_first_entry_longer_than(&gating_cfg->entries,
+					      e->interval, extack);
+	if (IS_ERR(pos)) {
+		rc = PTR_ERR(pos);
+		goto err;
 	}
 
+	list_add(&e->list, pos->prev);
+
 	gating_cfg->num_entries++;
 
 	return 0;
-- 
2.25.1

