Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D96A74FDF65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 14:24:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd4fK6d2zz3f2j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 22:24:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jHIIcESq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530;
 helo=mail-ed1-x530.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jHIIcESq; dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd4TR1vcDz3bc5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 22:16:43 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id b15so22119417edn.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0WZ3VKnVxGM80qdLHkweZkrBfRptzeVUXSKm7/OGDn8=;
 b=jHIIcESqNWLqokGpKfh4YWlmbXIj1lpsqtH5XYszmhDU3tq/FIVh2csMvH+YrFhuN7
 hjt3Q05Ttr48pdRZWa3LRlCPOhhwxDwNMtf+FwK+XMyaEDW7g3wM99hIJlZho+2z9HVA
 Uops0rojEuKytF3Z63OHDKkt1EXtNbR+gJ82Dw9d+S6S+ahGMcDnsZpyKPa7GnHdmXtH
 ZoWa4Aa/X96KMx2OdKPlquIG7gI8jh4c6HuEz1Pq95xmK2zo3buo8NMv9Vy14n3wSzqU
 UwOExVEbSWb0F2f/G44vlo4HKFr44eOh7X64Jegdl0KKefl8o9Jg21kY4/WHSVQi/1rl
 rrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0WZ3VKnVxGM80qdLHkweZkrBfRptzeVUXSKm7/OGDn8=;
 b=infR6b6OnrZ3frB9BhbJ0qmn1Yhl8OMzM0AbIkU36VAVJYfck+fAhk5gqqwQH6WZbJ
 F0cSuzzpGeSNKZlOXRxtwGkU+OSs+qbxDzFq0H9OK+iiPEAw66kCNS3uIDO41E7V8LC1
 QUCtKEyMzdiPVFeYHtuPk5PzGuDazmM2npYzhApVENcVMiePg24CBhg/n21BRNo4itr7
 HmxjcB38tkyYKoCZTiaW/P32XEVx7kuE5l3GdQa8OTxnm9cyS56c4HRASSxQMo2g+fLi
 LI5P2RMsBBF2QQKrU28rqWBLwu1tlQw/bUxRG4PP+3uVRwj5ZkQNcNqtG7ZMvXxze1VF
 gegQ==
X-Gm-Message-State: AOAM533YZoVwJW89fWy4dLtD4XX6KzCjoraw7PYUTVlZStyi0qcgzxEq
 NDvmVWRAmeyGADzpx+R6GuM=
X-Google-Smtp-Source: ABdhPJyErqiLg6C0liUUmkq0/55+jKlY2qozidbEehxTilHbpBR21vFsB/5rB5E60MJjeR/OKEUKyg==
X-Received: by 2002:a05:6402:5254:b0:41d:7abe:3e08 with SMTP id
 t20-20020a056402525400b0041d7abe3e08mr10795420edd.153.1649765799882; 
 Tue, 12 Apr 2022 05:16:39 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 b5-20020a17090630c500b006e8044fa76bsm8827900ejb.143.2022.04.12.05.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:16:39 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v3 12/18] net: qede: Replace usage of found with
 dedicated list iterator variable
Date: Tue, 12 Apr 2022 14:15:51 +0200
Message-Id: <20220412121557.3553555-13-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412121557.3553555-1-jakobkoschel@gmail.com>
References: <20220412121557.3553555-1-jakobkoschel@gmail.com>
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
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Di Zhu <zhudi21@huawei.com>, Lars Povlsen <lars.povlsen@microchip.com>,
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

