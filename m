Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07730511C57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 18:18:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpP7w6CWPz3fPP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 02:18:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=djNzVmRe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631;
 helo=mail-ej1-x631.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=djNzVmRe; dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpNv20LnRz3bs8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 02:07:42 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id l18so4354738ejc.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 09:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/A0b7QXPnRxcdjzjvBy95srF3RhPajcOL797uVjW17k=;
 b=djNzVmRevWSY+hIiC1/H30PkHbSU6xqUomoS6vNxNxSsA2vgIsDJmjFdrGiJt1K8MS
 XvJVUBQenTNDmnRY1OxwRpXMU6eq8+3j9NKMg8A0/fSUm/OXLuHTuvFMOxq1tfiv5/lo
 PETw/pty71e5r7Z5xql/U9OyQrFDpphWq0AKn82ZX5A9j9EvNXqncx1kGerazGaEhlhW
 BtwUHrzoVQidChJdfESgX4ChoMs1jqCIz+LCsesKzeGmJ4AwqLUMeAhlcZ0ui7hA1ca6
 FYrGCeBuXiEVcQ+uN5Ej2ozdZDqA9mtVVLC0RLXFL7lInO3enpCUsINJFZgSSzcJVwCF
 jf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/A0b7QXPnRxcdjzjvBy95srF3RhPajcOL797uVjW17k=;
 b=B2T/IwcpRnjhU3MfW68juZiTehpJWflqFYehxp2SskRl/wMiVXfK1ikb5i6F1TjZEA
 mEmXD1Otc+X6qwt3M5TuhK2FKCL4S5h0DjCpfABsXwil2UHDsZ1cbAmeae3TQu5bP4iS
 avp90NsohFyBnhu/e6EcedboBVhy/c0Y8KZH/JoTpw/IsKJrfQ+F+MWF04Fh3kDRsCCT
 7Dt+fXGLUfbQZQ5uSgoGAnZUjH6G1uTD1TcNFvRFu4GemIBjiHQHzu1HQRjjlxnijzBn
 ycxB4thuWLqKA4GAFK+TZLqGwqi/1oGvJ3YKZ4pqugKIiw7d14oxHuBEepc10GCj8mLW
 oCkg==
X-Gm-Message-State: AOAM531XSuc51Wn2RBoFUfAna7Rs0Wam3njLRY6xaHvffMUnUCHhWFDr
 Lxw3W55cy/O9SHdOrd6w4/g=
X-Google-Smtp-Source: ABdhPJzZ9GK5JMKIlGUFt2skqXUpBcMIDshg75p8eWcFCf8XLqwMsnXkioKQLmTu+ChB5hH1wuiIcQ==
X-Received: by 2002:a17:907:98eb:b0:6f3:ce56:c1a2 with SMTP id
 ke11-20020a17090798eb00b006f3ce56c1a2mr2984393ejc.173.1651075659037; 
 Wed, 27 Apr 2022 09:07:39 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 n5-20020a170906378500b006efb4ab6f59sm6984098ejc.86.2022.04.27.09.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 09:07:38 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v5 18/18] team: Remove use of list iterator variable
 for list_for_each_entry_from()
Date: Wed, 27 Apr 2022 18:06:35 +0200
Message-Id: <20220427160635.420492-19-jakobkoschel@gmail.com>
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

