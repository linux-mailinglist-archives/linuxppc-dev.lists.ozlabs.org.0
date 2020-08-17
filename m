Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC29246092
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 10:45:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVSKs5QVTzDqJP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 18:45:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JKs6NWf0; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRv16Vz0zDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:25:33 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id d19so7754978pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=D1aAuZf9AutjEPnD50DCVOQS+d/LorwrTFVRcP8QmrM=;
 b=JKs6NWf0vnjktIoAD+8hDbWr3FtmUc9bzqVlfLCwWBZjwHv+2lkp9Dt5867df+0KPJ
 qN52iAZFSKF+EgP/Gopv2oJH282/a9k3AvH1cnmLwxpmykSQf4fvLr0yK2WvpaPcmMy/
 kxqiGDTf/ypIINy/9AsP+FHMdmLfIFBch/HVd95MzP8G+CQiqVfQKVQVKiDhM0SLuFwx
 3nQi8/X/5Aq9X8hhpX+lla4EEOd0bc53ZlDlHwg0ORo0MOPb5wTNtyKPFGFr8wQZyikm
 996XaRO/oaL27tvInl/efvr+UsIX4+NTP72lLp5aEqbcp8B4q1+vqK0wet9HbRFeQBnP
 tvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=D1aAuZf9AutjEPnD50DCVOQS+d/LorwrTFVRcP8QmrM=;
 b=fkAUvTD6aQ56tDmP0qrFDc/n4QrKYgPmePsIU16AyJpmvp+G/3yVeuBReG5t6JyLR6
 qiT8qZ0d9sJ6NgwWHSJBbv1BqJ5yOmpm4JvoMsvMi9skDyO6qN5z1G7PEY8to29pPa9x
 UhcstLF6nZBjRjBPJEbdJwbe448Hqj9BFGBA8EKzGBuld2zXIntI9lcYgGw0MY7EbK+I
 DGqncV+3OsNbj+11ceKvQ5vPAoANUgOg19wlzzeJmF4U2PZt29+qDLGUaUwrRxUlK69O
 oYCVgCV2jfUfB3iGkD2Ya/+sRDwVDU4HVT6oYXpRhdlQsla5NbHxD2fWveBrDTtyEZiC
 am0Q==
X-Gm-Message-State: AOAM532gNalXy2paOfDHKLpWspRlnmDEFv/nqg+Cg46h8x34lLQb2Drp
 4Q3nc44enVAcjF05NUDM3dk=
X-Google-Smtp-Source: ABdhPJwRNhGVFfrT+4KXAK4vpPuqUG4S51cq+a0x5Buc2BD841a4hjMMe5sXIW8wgdf6LPNclkcTlg==
X-Received: by 2002:a63:544e:: with SMTP id e14mr9101091pgm.90.1597652730383; 
 Mon, 17 Aug 2020 01:25:30 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r186sm19928482pfr.162.2020.08.17.01.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:25:29 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: jes@trained-monkey.org, davem@davemloft.net, kuba@kernel.org,
 kda@linux-powerpc.org, dougmill@linux.ibm.com, cooldavid@cooldavid.org,
 mlindner@marvell.com, borisp@mellanox.com
Subject: [PATCH 06/20] ethernet: chelsio: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:54:20 +0530
Message-Id: <20200817082434.21176-8-allen.lkml@gmail.com>
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
 drivers/net/ethernet/chelsio/cxgb/sge.c  | 12 ++++++++----
 drivers/net/ethernet/chelsio/cxgb3/sge.c | 14 ++++++--------
 drivers/net/ethernet/chelsio/cxgb4/sge.c | 12 ++++++------
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb/sge.c b/drivers/net/ethernet/chelsio/cxgb/sge.c
index 47b5c8e2104b..5f999187038c 100644
--- a/drivers/net/ethernet/chelsio/cxgb/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb/sge.c
@@ -239,8 +239,10 @@ struct sched {
 	unsigned int	num;		/* num skbs in per port queues */
 	struct sched_port p[MAX_NPORTS];
 	struct tasklet_struct sched_tsk;/* tasklet used to run scheduler */
+	struct sge *sge;
 };
-static void restart_sched(unsigned long);
+
+static void restart_sched(struct tasklet_struct *t);
 
 
 /*
@@ -378,7 +380,8 @@ static int tx_sched_init(struct sge *sge)
 		return -ENOMEM;
 
 	pr_debug("tx_sched_init\n");
-	tasklet_init(&s->sched_tsk, restart_sched, (unsigned long) sge);
+	tasklet_setup(&s->sched_tsk, restart_sched);
+	s->sge = sge;
 	sge->tx_sched = s;
 
 	for (i = 0; i < MAX_NPORTS; i++) {
@@ -1301,9 +1304,10 @@ static inline void reclaim_completed_tx(struct sge *sge, struct cmdQ *q)
  * Called from tasklet. Checks the scheduler for any
  * pending skbs that can be sent.
  */
-static void restart_sched(unsigned long arg)
+static void restart_sched(struct tasklet_struct *t)
 {
-	struct sge *sge = (struct sge *) arg;
+	struct sched *s = from_tasklet(s, t, sched_tsk);
+	struct sge *sge = s->sge;
 	struct adapter *adapter = sge->adapter;
 	struct cmdQ *q = &sge->cmdQ[0];
 	struct sk_buff *skb;
diff --git a/drivers/net/ethernet/chelsio/cxgb3/sge.c b/drivers/net/ethernet/chelsio/cxgb3/sge.c
index 6dabbf1502c7..f2c5da465db5 100644
--- a/drivers/net/ethernet/chelsio/cxgb3/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb3/sge.c
@@ -1520,10 +1520,10 @@ static int ctrl_xmit(struct adapter *adap, struct sge_txq *q,
  *
  *	Resumes transmission on a suspended Tx control queue.
  */
-static void restart_ctrlq(unsigned long data)
+static void restart_ctrlq(struct tasklet_struct *t)
 {
 	struct sk_buff *skb;
-	struct sge_qset *qs = (struct sge_qset *)data;
+	struct sge_qset *qs = from_tasklet(qs, t, txq[TXQ_CTRL].qresume_tsk);
 	struct sge_txq *q = &qs->txq[TXQ_CTRL];
 
 	spin_lock(&q->lock);
@@ -1737,10 +1737,10 @@ again:	reclaim_completed_tx(adap, q, TX_RECLAIM_CHUNK);
  *
  *	Resumes transmission on a suspended Tx offload queue.
  */
-static void restart_offloadq(unsigned long data)
+static void restart_offloadq(struct tasklet_struct *t)
 {
 	struct sk_buff *skb;
-	struct sge_qset *qs = (struct sge_qset *)data;
+	struct sge_qset *qs = from_tasklet(qs, t, txq[TXQ_OFLD].qresume_tsk);
 	struct sge_txq *q = &qs->txq[TXQ_OFLD];
 	const struct port_info *pi = netdev_priv(qs->netdev);
 	struct adapter *adap = pi->adapter;
@@ -3084,10 +3084,8 @@ int t3_sge_alloc_qset(struct adapter *adapter, unsigned int id, int nports,
 		skb_queue_head_init(&q->txq[i].sendq);
 	}
 
-	tasklet_init(&q->txq[TXQ_OFLD].qresume_tsk, restart_offloadq,
-		     (unsigned long)q);
-	tasklet_init(&q->txq[TXQ_CTRL].qresume_tsk, restart_ctrlq,
-		     (unsigned long)q);
+	tasklet_setup(&q->txq[TXQ_OFLD].qresume_tsk, restart_offloadq);
+	tasklet_setup(&q->txq[TXQ_CTRL].qresume_tsk, restart_ctrlq);
 
 	q->fl[0].gen = q->fl[1].gen = 1;
 	q->fl[0].size = p->fl_size;
diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c b/drivers/net/ethernet/chelsio/cxgb4/sge.c
index d2b587d1670a..e668e17711c8 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -2660,11 +2660,11 @@ static int ctrl_xmit(struct sge_ctrl_txq *q, struct sk_buff *skb)
  *
  *	Resumes transmission on a suspended Tx control queue.
  */
-static void restart_ctrlq(unsigned long data)
+static void restart_ctrlq(struct tasklet_struct *t)
 {
 	struct sk_buff *skb;
 	unsigned int written = 0;
-	struct sge_ctrl_txq *q = (struct sge_ctrl_txq *)data;
+	struct sge_ctrl_txq *q = from_tasklet(q, t, qresume_tsk);
 
 	spin_lock(&q->sendq.lock);
 	reclaim_completed_tx_imm(&q->q);
@@ -2961,9 +2961,9 @@ static int ofld_xmit(struct sge_uld_txq *q, struct sk_buff *skb)
  *
  *	Resumes transmission on a suspended Tx offload queue.
  */
-static void restart_ofldq(unsigned long data)
+static void restart_ofldq(struct tasklet_struct *t)
 {
-	struct sge_uld_txq *q = (struct sge_uld_txq *)data;
+	struct sge_uld_txq *q = from_tasklet(q, t, qresume_tsk);
 
 	spin_lock(&q->sendq.lock);
 	q->full = 0;            /* the queue actually is completely empty now */
@@ -4576,7 +4576,7 @@ int t4_sge_alloc_ctrl_txq(struct adapter *adap, struct sge_ctrl_txq *txq,
 	init_txq(adap, &txq->q, FW_EQ_CTRL_CMD_EQID_G(ntohl(c.cmpliqid_eqid)));
 	txq->adap = adap;
 	skb_queue_head_init(&txq->sendq);
-	tasklet_init(&txq->qresume_tsk, restart_ctrlq, (unsigned long)txq);
+	tasklet_setup(&txq->qresume_tsk, restart_ctrlq);
 	txq->full = 0;
 	return 0;
 }
@@ -4666,7 +4666,7 @@ int t4_sge_alloc_uld_txq(struct adapter *adap, struct sge_uld_txq *txq,
 	txq->q.q_type = CXGB4_TXQ_ULD;
 	txq->adap = adap;
 	skb_queue_head_init(&txq->sendq);
-	tasklet_init(&txq->qresume_tsk, restart_ofldq, (unsigned long)txq);
+	tasklet_setup(&txq->qresume_tsk, restart_ofldq);
 	txq->full = 0;
 	txq->mapping_err = 0;
 	return 0;
-- 
2.17.1

