Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 622ED502A4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 14:38:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfwqH1Rfvz3f4c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 22:38:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HpKlEPRp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529;
 helo=mail-ed1-x529.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HpKlEPRp; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kfwfd31bLz3bfg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 22:31:05 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id z12so9795069edl.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 05:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0WZ3VKnVxGM80qdLHkweZkrBfRptzeVUXSKm7/OGDn8=;
 b=HpKlEPRptbD/f1jBswuHJ3tvWie+EvRLe0jlVv7fhDSfxhscO+VA6roZkgEC6/6ZDJ
 wjwgmhdS9bdvuRaYewcvaOMAsf0uZh+KFcQdXxRcE7NsGF5sGyFWYDL3rrc5XIK+0sSO
 YeNC4Ky18jsviNL6gUw7JnOE6cABTwUTyG7OJdPu+4KpKpcJ/KlP71IwKL4zNi2SLj60
 h2MQmYdTvasp8jQDaGuzgrwE9rqpx6+DqAbk0uAyvaQ1v67IfmfBM/OUmgBmfluTvH0N
 OBl0XAO7QH6NSqt5pqsXAmGOEcTZ9cWxXP+bpDI62KX5XkzgQa4C4e2lxC2sBmFPQU1j
 tgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0WZ3VKnVxGM80qdLHkweZkrBfRptzeVUXSKm7/OGDn8=;
 b=0z8j7BQBiwpxNLOGQN4MdID3rYIw+vnoiEOzKhVYhYk8T+o+03XUWevc+eE0OxizZi
 7oWswcu246uzWBERh4bots+2P0Z8IBuY2e8IKdP+WYoKZVP+5q+QsJmDHwxP3BLSzFnU
 lcXnfxohIMNsDcyzgjO89jzDTQ7HRnoL0CZiSBNiAvqPAlLkk4LjI/NG65rulQB8+vlk
 WHhvqCTYoPYrCNpfOOQDgT2xPnrQhSUKDXkoOzGZkQyAbVZYr/PWyMxUB42zOWF2H5Um
 N+YMxwt1VE1p2MhsrP5swp6I5Ot3mPns506Qy/cPTyoGbjpjc3RMxfeRoF9VRnDdQ651
 fGTA==
X-Gm-Message-State: AOAM5313HscKa472irEI3Z3AxVJFsMf6+jBGS2rcY8PQ3aCaFDJVq0kG
 bEhxddzVyd2W31UEbS3ToYQ=
X-Google-Smtp-Source: ABdhPJzrQprMTk8zfgWwJ+kQwuxXWp8pz8/Ul5emjvpU5KWxuLgjh/e6TfXZxlX60bako3WcwVs9QQ==
X-Received: by 2002:a05:6402:430c:b0:419:4660:e261 with SMTP id
 m12-20020a056402430c00b004194660e261mr8010136edc.324.1650025862541; 
 Fri, 15 Apr 2022 05:31:02 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1649533ejb.194.2022.04.15.05.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 05:31:02 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v4 12/18] net: qede: Replace usage of found with
 dedicated list iterator variable
Date: Fri, 15 Apr 2022 14:29:41 +0200
Message-Id: <20220415122947.2754662-13-jakobkoschel@gmail.com>
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
 drivers/net/ethernet/qlogic/qede/qede_rdma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qede/qede_rdma.c b/drivers/net/ethernet/qlogic/qede/qede_rdma.c
index 6304514a6f2c..2eb03ffe2484 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_rdma.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_rdma.c
@@ -246,18 +246,17 @@ static void qede_rdma_change_mtu(struct qede_dev *edev)
 static struct qede_rdma_event_work *
 qede_rdma_get_free_event_node(struct qede_dev *edev)
 {
-	struct qede_rdma_event_work *event_node = NULL;
-	bool found = false;
+	struct qede_rdma_event_work *event_node = NULL, *iter;
 
-	list_for_each_entry(event_node, &edev->rdma_info.rdma_event_list,
+	list_for_each_entry(iter, &edev->rdma_info.rdma_event_list,
 			    list) {
-		if (!work_pending(&event_node->work)) {
-			found = true;
+		if (!work_pending(&iter->work)) {
+			event_node = iter;
 			break;
 		}
 	}
 
-	if (!found) {
+	if (!event_node) {
 		event_node = kzalloc(sizeof(*event_node), GFP_ATOMIC);
 		if (!event_node) {
 			DP_NOTICE(edev,
-- 
2.25.1

