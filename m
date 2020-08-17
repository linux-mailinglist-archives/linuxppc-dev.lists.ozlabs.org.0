Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2362A24604B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 10:34:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVS532StKzDqMp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 18:34:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r7fmQpvu; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRtR6tSqzDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:25:03 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id f10so7129705plj.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ieaDS0kZabvaM2FQJESKDtwss85i612EBlDqx55UScQ=;
 b=r7fmQpvu0cXvpoW4a9CZ/cT3MW3lztUUfiJGRP8uWIdQW718lbHcerRIY+XPN5w2dW
 8g+GmL3UQQs5IIbiFNkDPeYmyJmo6J0G97FL2TFOQlxobIrYeQh4Dn+ntQyJsWRS19dy
 PTPV1tWwnnTudwXH3EQrSU8PuCBQePLEB3tvkFDsQf/gTFUy/QcukQKVyFRIHqYYhVbK
 XfL1vYS4KiGvTfyMx4FOO3+nJXthNtT0T5BY0uYgM16rcWekI1UZ4yLoM5VO2cIiYTSx
 p2FU4vZh0YJx9+hEx0TcRwmJdfBx6wOKgbsNWYUm9v0uh4ntUQD2A8SoKTqkRnAhIxsS
 Nk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ieaDS0kZabvaM2FQJESKDtwss85i612EBlDqx55UScQ=;
 b=HQ9HYaeApZ3AFVktHBnbaV5L0hIUQKvKFQCO/k+gtn3issOLUI+VUCN/G9sTWkAM3+
 RWQWKq76WQW3JFa+uNme6H/mQFP2kOnNwO64RSDmM70LaQFXGdI3o3yqqAnIvUrhvD0k
 d0hm5JdJVOcsUVsCWqkBvarE+4bjFno5CcD8QEcQ79Evypd7Lvv2yvU5P5SM7ijwRa8H
 BWa+quClheTEUm02uv90z3LZp3Hp0PrQgrBXcUu9Qk3MbzKG6ZN2JP1dtq3aKcCLSFeh
 JUJrQzwav8QyT3aVKHSLDFv6yTCbkWFv+KYo3BnueJYRa/MnpFCoDnCP2VR9B/xq/9NU
 60Kw==
X-Gm-Message-State: AOAM530AiyloCk1wlNkhmmZZi7PxqjBfpQNXaLAE1v502LjT80i6ZBe5
 JXOK5zvNnBIZfTxs7fnbDv4=
X-Google-Smtp-Source: ABdhPJwwdc3RrJJP+jyr+uic25vkwFOxlfTC4mqKC9ol3fps9vrV6VbuCUueQvJl/j2WyRrNR+MX0A==
X-Received: by 2002:a17:90b:100e:: with SMTP id
 gm14mr11406569pjb.39.1597652700729; 
 Mon, 17 Aug 2020 01:25:00 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r186sm19928482pfr.162.2020.08.17.01.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:25:00 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: jes@trained-monkey.org, davem@davemloft.net, kuba@kernel.org,
 kda@linux-powerpc.org, dougmill@linux.ibm.com, cooldavid@cooldavid.org,
 mlindner@marvell.com, borisp@mellanox.com
Subject: [PATCH] ethernet: cxgb4: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 13:54:15 +0530
Message-Id: <20200817082434.21176-3-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817082434.21176-1-allen.lkml@gmail.com>
References: <20200817082434.21176-1-allen.lkml@gmail.com>
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
Cc: keescook@chromium.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
 oss-drivers@netronome.com, Romain Perier <romain.perier@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-acenic@sunsite.dk,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4.h           | 2 +-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c | 3 +--
 drivers/net/ethernet/chelsio/cxgb4/sge.c             | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4.h b/drivers/net/ethernet/chelsio/cxgb4/cxgb4.h
index 9cb8b229c1b3..84fa9b8a9087 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4.h
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4.h
@@ -2100,7 +2100,7 @@ void free_tx_desc(struct adapter *adap, struct sge_txq *q,
 void cxgb4_eosw_txq_free_desc(struct adapter *adap, struct sge_eosw_txq *txq,
 			      u32 ndesc);
 int cxgb4_ethofld_send_flowc(struct net_device *dev, u32 eotid, u32 tc);
-void cxgb4_ethofld_restart(unsigned long data);
+void cxgb4_ethofld_restart(struct tasklet_struct *t);
 int cxgb4_ethofld_rx_handler(struct sge_rspq *q, const __be64 *rsp,
 			     const struct pkt_gl *si);
 void free_txq(struct adapter *adap, struct sge_txq *q);
diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c
index ae7123a9de8e..6c259de96f96 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c
@@ -114,8 +114,7 @@ static int cxgb4_init_eosw_txq(struct net_device *dev,
 	eosw_txq->cred = adap->params.ofldq_wr_cred;
 	eosw_txq->hwqid = hwqid;
 	eosw_txq->netdev = dev;
-	tasklet_init(&eosw_txq->qresume_tsk, cxgb4_ethofld_restart,
-		     (unsigned long)eosw_txq);
+	tasklet_setup(&eosw_txq->qresume_tsk, cxgb4_ethofld_restart);
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c b/drivers/net/ethernet/chelsio/cxgb4/sge.c
index e668e17711c8..482b2bd602e6 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -3883,9 +3883,9 @@ static int napi_rx_handler(struct napi_struct *napi, int budget)
 	return work_done;
 }
 
-void cxgb4_ethofld_restart(unsigned long data)
+void cxgb4_ethofld_restart(struct tasklet_struct *t)
 {
-	struct sge_eosw_txq *eosw_txq = (struct sge_eosw_txq *)data;
+	struct sge_eosw_txq *eosw_txq = from_tasklet(eosw_txq, t, qresume_tsk);
 	int pktcount;
 
 	spin_lock(&eosw_txq->lock);
-- 
2.17.1

