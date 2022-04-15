Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3835F502A5B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 14:41:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kfwtj0FTBz3fNk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 22:41:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b3hc5PlQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535;
 helo=mail-ed1-x535.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=b3hc5PlQ; dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kfwfm1Xzzz3bfC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 22:31:12 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id v15so9741683edb.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 05:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yEn2KXl6YaWL8lEsoeTa0NhbbIFQf0W1A7EAGx1tWC4=;
 b=b3hc5PlQNJwnipmFgPKwKobkYuBqu+VhbGWKUONdb7h8D0d0QpzlgKH51PWjk95WTj
 ADJ4mluAmAow9uamrXzOVaO9sedPih8JXQg90Vp3D1U92O6F899Tf10rxWd7mAQjHEQA
 Szl5d9kjQph2s2n7ZeS5O3MZOHbMGtfCwoSSDSjugBjqNC9T4FwaS+WJ27MLXp8aIGVs
 DStAyL1wpAzpwElDS8FsoZW3S0OtwFzTPi8FKiZu1nwZMkCYJFTcEzRuXgZEBCkvC2DF
 h85SkTuD2SDpZQrDmEoOr3Eq95jeyRza5A0Porbl8XGQU+vuJ1UPBCPW5+GyonbvM5KD
 kwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yEn2KXl6YaWL8lEsoeTa0NhbbIFQf0W1A7EAGx1tWC4=;
 b=FyQGo4yj9CTes71YX2payh+RzYJD7V0HMYCYPpTwY2QWlD3Qi6F2rRl7LhKDe0A8pp
 jqfQFzVwEIjPwdx15ntGmNTopR3zm/hErJZ6CN7b8rQCSZ2e5yn7/Ai1fLEERvcEmg29
 Z3AeFKWZunPhhVW9V2rU1EobQ3w991MXKQ0EYRNKvD1OrIbWcoi4Kl85grBCGu/vykpG
 3bYVwQExyS1KvMYvDW0TBjAnE63ht3YNWYYdURgB/3L0gY04klrt01olwTI/9JLY/9jx
 3rDa5MgUUV/OMUkDtnjJxYJurrr0OmT5L1J/crrgN9eU5+c4lBn/PPzGihxPX+AWwNxj
 Dnrw==
X-Gm-Message-State: AOAM531PaAOLW9gg9BIYKFQ+eEIG69DZBpBoiooEKZYyCUYhKhpwMUN5
 P89Q/fySot7eS1QoPkAiLbA=
X-Google-Smtp-Source: ABdhPJxFA6/82EYIOUmoGfM6Rwv35qSZg1kJewtxaRvXjq59AYMYC+/ozksdzIoDL0AQZRXVthp7Cw==
X-Received: by 2002:a50:d613:0:b0:41d:71bb:4af3 with SMTP id
 x19-20020a50d613000000b0041d71bb4af3mr8166908edi.99.1650025869469; 
 Fri, 15 Apr 2022 05:31:09 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1649533ejb.194.2022.04.15.05.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 05:31:08 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v4 17/18] ipvlan: Remove usage of list iterator
 variable for the loop body
Date: Fri, 15 Apr 2022 14:29:46 +0200
Message-Id: <20220415122947.2754662-18-jakobkoschel@gmail.com>
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

In preparation to limit the scope of the list iterator variable to the
list traversal loop, use a dedicated pointer to iterate through the
list [1].

Since that variable should not be used past the loop iteration, a
separate variable is used to 'remember the current location within the
loop'.

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

