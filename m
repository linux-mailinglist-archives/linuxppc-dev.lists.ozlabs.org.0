Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F54E24627D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 11:17:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVT3M0jrzzDqGX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 19:17:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q2oQHhau; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRwP463MzDqP1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:26:45 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id j21so7759167pgi.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6qyozdS/HY6iP3pJn34oXGwxmex8vXqKSC7ndq5S0+E=;
 b=q2oQHhau5wkJr9NInhJu5fE2VdKCd1EkLjYux32PbZTXlQngJzWocDupZm/kBW2Kiz
 dFj+fxNqeU9gSpwMAnm5ifUK/UvC7G6Gz7w+dO+f67FuU68h3NHlc/QIBv4tkgmBOEd7
 gC5PgRXq4foSSBUP8Ab+lUlYTcA38ELa9LmZo3Pl1jS7EK0eSdBng6Z+p87nMU2Ge9kG
 fSao/+V4n2LBre36fqGn0jExgpz6kiLkzkE4jBQAahoM4dG5hAZRh3jcvIFSO+xF2o5J
 JrrQaglNJraJ/mK529ZCW8IYLwkEjfJ2NlNWIC5/DZoaoNel88Kv0sDoOCkUFsyN4dH1
 cwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6qyozdS/HY6iP3pJn34oXGwxmex8vXqKSC7ndq5S0+E=;
 b=CArr3zj0pG4Hd8Rj89Gl5z0JdxBPRufzU+h2wi+VdcM7kAP2XXck7G1xt/gDsVKu67
 sDtA7/YItNNVxN6/N9uKnsZLvojyQPh+hZ9FnO3spoOeb1JWc3DAGJzvQV5WSZbnom7p
 bkw58IydQm8DgazB/hqEap6DsZLL5F5FvVbifmLsU478Z3FqglrAhGeydGCpg0qeC7Hb
 ZaxxKf8Xg5WOjiX3R4HSVTSbkNP4/4AqzDgX4DRBhsPlJ1lHxLG6TKiY23rsu9abKXy9
 o/AjAyaZW4ufLfurtT9fFXxdvTrJSZY/5T3EHvd3DGv6CxcHrCfzWef+Koe3cdSgXuA2
 J+ow==
X-Gm-Message-State: AOAM533sawsNrXa3YNsyBLyyPhvUW4FOOAYDyMJYGqTA3dwTFH5OBkqY
 B9NqvNSxRBvtxaGyTBfTGkc=
X-Google-Smtp-Source: ABdhPJwI0phYYxx8YzI2dUOWNrvQuNzl0QthOzgIy2DqMXnDA6ActFZPLcCUpF3zts7NRwPiPvawcQ==
X-Received: by 2002:aa7:9e4e:: with SMTP id z14mr10775659pfq.60.1597652803372; 
 Mon, 17 Aug 2020 01:26:43 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r186sm19928482pfr.162.2020.08.17.01.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:26:42 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: jes@trained-monkey.org, davem@davemloft.net, kuba@kernel.org,
 kda@linux-powerpc.org, dougmill@linux.ibm.com, cooldavid@cooldavid.org,
 mlindner@marvell.com, borisp@mellanox.com
Subject: [PATCH 18/20] ethernet: qlogic: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:54:32 +0530
Message-Id: <20200817082434.21176-20-allen.lkml@gmail.com>
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
 drivers/net/ethernet/qlogic/qed/qed.h      |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_int.c  | 27 +++-------------------
 drivers/net/ethernet/qlogic/qed/qed_int.h  |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_main.c | 14 +++++------
 4 files changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed.h b/drivers/net/ethernet/qlogic/qed/qed.h
index b2a7b53ee760..22bc4ec7859a 100644
--- a/drivers/net/ethernet/qlogic/qed/qed.h
+++ b/drivers/net/ethernet/qlogic/qed/qed.h
@@ -572,7 +572,7 @@ struct qed_hwfn {
 	struct qed_consq		*p_consq;
 
 	/* Slow-Path definitions */
-	struct tasklet_struct		*sp_dpc;
+	struct tasklet_struct		sp_dpc;
 	bool				b_sp_dpc_enabled;
 
 	struct qed_ptt			*p_main_ptt;
diff --git a/drivers/net/ethernet/qlogic/qed/qed_int.c b/drivers/net/ethernet/qlogic/qed/qed_int.c
index f8c5a864812d..578935f643b8 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_int.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_int.c
@@ -1216,9 +1216,9 @@ static void qed_sb_ack_attn(struct qed_hwfn *p_hwfn,
 	barrier();
 }
 
-void qed_int_sp_dpc(unsigned long hwfn_cookie)
+void qed_int_sp_dpc(struct tasklet_struct *t)
 {
-	struct qed_hwfn *p_hwfn = (struct qed_hwfn *)hwfn_cookie;
+	struct qed_hwfn *p_hwfn = from_tasklet(p_hwfn, t, sp_dpc);
 	struct qed_pi_info *pi_info = NULL;
 	struct qed_sb_attn_info *sb_attn;
 	struct qed_sb_info *sb_info;
@@ -2285,34 +2285,14 @@ u64 qed_int_igu_read_sisr_reg(struct qed_hwfn *p_hwfn)
 
 static void qed_int_sp_dpc_setup(struct qed_hwfn *p_hwfn)
 {
-	tasklet_init(p_hwfn->sp_dpc,
-		     qed_int_sp_dpc, (unsigned long)p_hwfn);
+	tasklet_setup(&p_hwfn->sp_dpc, qed_int_sp_dpc);
 	p_hwfn->b_sp_dpc_enabled = true;
 }
 
-static int qed_int_sp_dpc_alloc(struct qed_hwfn *p_hwfn)
-{
-	p_hwfn->sp_dpc = kmalloc(sizeof(*p_hwfn->sp_dpc), GFP_KERNEL);
-	if (!p_hwfn->sp_dpc)
-		return -ENOMEM;
-
-	return 0;
-}
-
-static void qed_int_sp_dpc_free(struct qed_hwfn *p_hwfn)
-{
-	kfree(p_hwfn->sp_dpc);
-	p_hwfn->sp_dpc = NULL;
-}
-
 int qed_int_alloc(struct qed_hwfn *p_hwfn, struct qed_ptt *p_ptt)
 {
 	int rc = 0;
 
-	rc = qed_int_sp_dpc_alloc(p_hwfn);
-	if (rc)
-		return rc;
-
 	rc = qed_int_sp_sb_alloc(p_hwfn, p_ptt);
 	if (rc)
 		return rc;
@@ -2326,7 +2306,6 @@ void qed_int_free(struct qed_hwfn *p_hwfn)
 {
 	qed_int_sp_sb_free(p_hwfn);
 	qed_int_sb_attn_free(p_hwfn);
-	qed_int_sp_dpc_free(p_hwfn);
 }
 
 void qed_int_setup(struct qed_hwfn *p_hwfn, struct qed_ptt *p_ptt)
diff --git a/drivers/net/ethernet/qlogic/qed/qed_int.h b/drivers/net/ethernet/qlogic/qed/qed_int.h
index 86809d7bc2de..c5550e96bbe1 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_int.h
+++ b/drivers/net/ethernet/qlogic/qed/qed_int.h
@@ -140,7 +140,7 @@ int qed_int_sb_release(struct qed_hwfn *p_hwfn,
  * @param p_hwfn - pointer to hwfn
  *
  */
-void qed_int_sp_dpc(unsigned long hwfn_cookie);
+void qed_int_sp_dpc(struct tasklet_struct *t);
 
 /**
  * @brief qed_int_get_num_sbs - get the number of status
diff --git a/drivers/net/ethernet/qlogic/qed/qed_main.c b/drivers/net/ethernet/qlogic/qed/qed_main.c
index 2558cb680db3..4c4dd4e88fb1 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_main.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_main.c
@@ -841,7 +841,7 @@ static irqreturn_t qed_single_int(int irq, void *dev_instance)
 
 		/* Slowpath interrupt */
 		if (unlikely(status & 0x1)) {
-			tasklet_schedule(hwfn->sp_dpc);
+			tasklet_schedule(&hwfn->sp_dpc);
 			status &= ~0x1;
 			rc = IRQ_HANDLED;
 		}
@@ -887,7 +887,7 @@ int qed_slowpath_irq_req(struct qed_hwfn *hwfn)
 			 id, cdev->pdev->bus->number,
 			 PCI_SLOT(cdev->pdev->devfn), hwfn->abs_pf_id);
 		rc = request_irq(cdev->int_params.msix_table[id].vector,
-				 qed_msix_sp_int, 0, hwfn->name, hwfn->sp_dpc);
+				 qed_msix_sp_int, 0, hwfn->name, &hwfn->sp_dpc);
 	} else {
 		unsigned long flags = 0;
 
@@ -919,8 +919,8 @@ static void qed_slowpath_tasklet_flush(struct qed_hwfn *p_hwfn)
 	 * enable function makes this sequence a flush-like operation.
 	 */
 	if (p_hwfn->b_sp_dpc_enabled) {
-		tasklet_disable(p_hwfn->sp_dpc);
-		tasklet_enable(p_hwfn->sp_dpc);
+		tasklet_disable(&p_hwfn->sp_dpc);
+		tasklet_enable(&p_hwfn->sp_dpc);
 	}
 }
 
@@ -949,7 +949,7 @@ static void qed_slowpath_irq_free(struct qed_dev *cdev)
 				break;
 			synchronize_irq(cdev->int_params.msix_table[i].vector);
 			free_irq(cdev->int_params.msix_table[i].vector,
-				 cdev->hwfns[i].sp_dpc);
+				 &cdev->hwfns[i].sp_dpc);
 		}
 	} else {
 		if (QED_LEADING_HWFN(cdev)->b_int_requested)
@@ -968,11 +968,11 @@ static int qed_nic_stop(struct qed_dev *cdev)
 		struct qed_hwfn *p_hwfn = &cdev->hwfns[i];
 
 		if (p_hwfn->b_sp_dpc_enabled) {
-			tasklet_disable(p_hwfn->sp_dpc);
+			tasklet_disable(&p_hwfn->sp_dpc);
 			p_hwfn->b_sp_dpc_enabled = false;
 			DP_VERBOSE(cdev, NETIF_MSG_IFDOWN,
 				   "Disabled sp tasklet [hwfn %d] at %p\n",
-				   i, p_hwfn->sp_dpc);
+				   i, &p_hwfn->sp_dpc);
 		}
 	}
 
-- 
2.17.1

