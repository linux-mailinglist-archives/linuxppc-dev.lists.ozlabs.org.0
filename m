Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47822502A63
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 14:42:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfwvP0bgGz2yp5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 22:42:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XPxIYgo6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536;
 helo=mail-ed1-x536.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XPxIYgo6; dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kfwfp1nJBz3bq8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 22:31:14 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id g20so9760945edw.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 05:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/A0b7QXPnRxcdjzjvBy95srF3RhPajcOL797uVjW17k=;
 b=XPxIYgo6M0hFOfIDjd1x3rJvr403xWmkCv4BfN5SzQ6rl/o2LtUELnVEK2flTgl7Mu
 h9HynkeZlcHvrZKXB463qAGm4ubHnZ3K84JE6vUQ2VAllYUyaKrzCWHOr4clD8wcI+rZ
 QpgplpTYCxRlhudFZFTA3TZD85lBUtoeJR2ZadxDeZWKjD8aVgCwTAxdaBFqyCFEJ1J8
 PEwKA6HHOLREZ0lK50ZwI1XpJLo79AgBKnxd7WsP5o/j86FlHeBFkz4B3rHD3RofjoY7
 6FtJSZWBNVcMaDMJQhhI3uZMtMt0Od6Y/b3KCJAVC6iktp21nwQegu5vn8S6PUNDQGsm
 aPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/A0b7QXPnRxcdjzjvBy95srF3RhPajcOL797uVjW17k=;
 b=waBSUFkHx18iVvkQe4Q8HjXVA7S6vNEv294akFHFIOk8AY3bUVSYWjVa0MsyWpFiy0
 TK9vYGNjyIrmn7TVjEZh8U6f/4+6ZV7Agx2zjcZVWZlDrHDH9+d7+PjlyQxaCizBtiUY
 NBqmb13iGrrIhi/gz15BUC4PMnojK0BqkM1ABsoCDLK+521CE2d2EDq+JYVTp7agydDz
 wuCi7+HuJqhnSa9jI69Bc74RqIfPU9hSDkvakEdm/CdZXThedBQwGriIf0PU5RJXSupf
 x3qWpzT59FQDtuNqnQmMI3b7q0AuO1cl+gjlc1R3drkx9B63gXxozYxWQcTp5BYJSB73
 fmBA==
X-Gm-Message-State: AOAM533n4zH+z8OWHIY2Wucen3VCJfOGLv+SrO0Wbu1wcVby6BYZeOfz
 XzQo412OFKAdjYZScamdbmI=
X-Google-Smtp-Source: ABdhPJzMXbUYQrLVI7KhkcyMDrJ0/R3dZbgsUde+fJ0qaBD2PAAuaj6vloHxnRVzxDfc0Lz8L3X0Bw==
X-Received: by 2002:a05:6402:26cb:b0:421:e28f:4776 with SMTP id
 x11-20020a05640226cb00b00421e28f4776mr4442275edd.400.1650025870912; 
 Fri, 15 Apr 2022 05:31:10 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1649533ejb.194.2022.04.15.05.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 05:31:10 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v4 18/18] team: Remove use of list iterator variable
 for list_for_each_entry_from()
Date: Fri, 15 Apr 2022 14:29:47 +0200
Message-Id: <20220415122947.2754662-19-jakobkoschel@gmail.com>
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

To either continue iterating from that position or skip the iteration
(if the previous iteration was complete) list_prepare_entry() is used.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/net/team/team.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/team/team.c b/drivers/net/team/team.c
index b07dde6f0abf..688c4393f099 100644
--- a/drivers/net/team/team.c
+++ b/drivers/net/team/team.c
@@ -2425,17 +2425,17 @@ static int team_nl_send_options_get(struct team *team, u32 portid, u32 seq,
 				    int flags, team_nl_send_func_t *send_func,
 				    struct list_head *sel_opt_inst_list)
 {
+	struct team_option_inst *opt_inst, *tmp = NULL;
 	struct nlattr *option_list;
 	struct nlmsghdr *nlh;
 	void *hdr;
-	struct team_option_inst *opt_inst;
 	int err;
 	struct sk_buff *skb = NULL;
 	bool incomplete;
 	int i;
 
-	opt_inst = list_first_entry(sel_opt_inst_list,
-				    struct team_option_inst, tmp_list);
+	tmp = list_first_entry(sel_opt_inst_list,
+			       struct team_option_inst, tmp_list);
 
 start_again:
 	err = __send_and_alloc_skb(&skb, team, portid, send_func);
@@ -2456,7 +2456,9 @@ static int team_nl_send_options_get(struct team *team, u32 portid, u32 seq,
 		goto nla_put_failure;
 
 	i = 0;
+	opt_inst = list_prepare_entry(tmp, sel_opt_inst_list, tmp_list);
 	incomplete = false;
+	tmp = NULL;
 	list_for_each_entry_from(opt_inst, sel_opt_inst_list, tmp_list) {
 		err = team_nl_fill_one_option_get(skb, team, opt_inst);
 		if (err) {
@@ -2464,6 +2466,7 @@ static int team_nl_send_options_get(struct team *team, u32 portid, u32 seq,
 				if (!i)
 					goto errout;
 				incomplete = true;
+				tmp = opt_inst;
 				break;
 			}
 			goto errout;
@@ -2707,14 +2710,14 @@ static int team_nl_send_port_list_get(struct team *team, u32 portid, u32 seq,
 	struct nlattr *port_list;
 	struct nlmsghdr *nlh;
 	void *hdr;
-	struct team_port *port;
+	struct team_port *port, *tmp = NULL;
 	int err;
 	struct sk_buff *skb = NULL;
 	bool incomplete;
 	int i;
 
-	port = list_first_entry_or_null(&team->port_list,
-					struct team_port, list);
+	tmp = list_first_entry_or_null(&team->port_list,
+				       struct team_port, list);
 
 start_again:
 	err = __send_and_alloc_skb(&skb, team, portid, send_func);
@@ -2744,7 +2747,9 @@ static int team_nl_send_port_list_get(struct team *team, u32 portid, u32 seq,
 		err = team_nl_fill_one_port_get(skb, one_port);
 		if (err)
 			goto errout;
-	} else if (port) {
+	} else {
+		port = list_prepare_entry(tmp, &team->port_list, list);
+		tmp = NULL;
 		list_for_each_entry_from(port, &team->port_list, list) {
 			err = team_nl_fill_one_port_get(skb, port);
 			if (err) {
@@ -2752,6 +2757,7 @@ static int team_nl_send_port_list_get(struct team *team, u32 portid, u32 seq,
 					if (!i)
 						goto errout;
 					incomplete = true;
+					tmp = port;
 					break;
 				}
 				goto errout;
-- 
2.25.1

