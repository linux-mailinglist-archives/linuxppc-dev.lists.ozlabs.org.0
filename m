Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6AB24619D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 10:59:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVSf14sCYzDqNL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 18:59:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kSZoZKRG; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRvZ6LD0zDqJt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:26:02 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id g33so7766903pgb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2lWTwfGunDOTtwrs6ILJYDdQIZghCfDlVzunIeUIAUk=;
 b=kSZoZKRGgALpz+rZ1rW4PeRUO4mvrUjXHJCHKyxtMUtQUhXwaE9HJJ7el6oyO7OOQx
 lXYshzblUOVqLabYIbGjttJclIN9gL3539pLtVDVK9JXTdhavTDEE3dsHqQ5wAYvlJPy
 zvkZWlPoZQb9yg30asCxwKCpGAcuPV9/8kTJ+1TY4ad6Zzb4Ra7b/q56IrzacHNUHvj9
 J388zqCTJYUc5/LAGQo1JI7xxtfYsX26N4YZZTlao2oCGpP2BHYHLWlMz7LFAzJYYk/h
 lVdADjdY4TLYRC2sTeADdTJhfjj6RSC9e3ufqO6H6bYUDH14JYwZeP1ykSFvmTO9/oGI
 C3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2lWTwfGunDOTtwrs6ILJYDdQIZghCfDlVzunIeUIAUk=;
 b=EwzDrt1KI+CoFeSu1mmcvM/jim1axs7ky9pBEBH32Kso2Lrb9kkD1q0taizxpbn5Te
 SaQ0iBh4jdpLr8vME3LM4JejmdwgTng4eGhKkjdJlqmVM7oxyNktnDe8/4juKzVXxGFp
 c2DxGMudLy4ck1NuxqmPEIdtmHz728bFwX153Wrl0imZTeXXAgtDGNmvrhwEyRP4RkVl
 O/3GYrmxkMA4sbwRQrUBFuDB2sdvrn1CA2STzJlLDT04XeDQwWo6cRv8oPdYq88Ks1KY
 VLcaZIKmud3MGgAJGxwIr7Mwd/cp31j5HwqYpyUEOSRTwZrM5hQYjfo2r9I51O0BHlRf
 uG8A==
X-Gm-Message-State: AOAM531Fy3jn1bqj+RRnJeWtE68zDgqv2ICwijJfHUDv749at/NDln5T
 TVxue22UtPNUF6iLkDZ82N0=
X-Google-Smtp-Source: ABdhPJyiyk1L76pQbEM7KTHPtWb5CWW9jSXriZUpVIGgsJyJ/Z/vcZJfa1sOQ3p1ZAwHDvISchf1Ig==
X-Received: by 2002:a63:1822:: with SMTP id y34mr9759847pgl.364.1597652759213; 
 Mon, 17 Aug 2020 01:25:59 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r186sm19928482pfr.162.2020.08.17.01.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:25:58 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: jes@trained-monkey.org, davem@davemloft.net, kuba@kernel.org,
 kda@linux-powerpc.org, dougmill@linux.ibm.com, cooldavid@cooldavid.org,
 mlindner@marvell.com, borisp@mellanox.com
Subject: [PATCH 11/20] ethernet: jme: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:54:25 +0530
Message-Id: <20200817082434.21176-13-allen.lkml@gmail.com>
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
 drivers/net/ethernet/jme.c | 40 +++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/jme.c b/drivers/net/ethernet/jme.c
index ddc757680089..e9efe074edc1 100644
--- a/drivers/net/ethernet/jme.c
+++ b/drivers/net/ethernet/jme.c
@@ -1187,9 +1187,9 @@ jme_shutdown_nic(struct jme_adapter *jme)
 }
 
 static void
-jme_pcc_tasklet(unsigned long arg)
+jme_pcc_tasklet(struct tasklet_struct *t)
 {
-	struct jme_adapter *jme = (struct jme_adapter *)arg;
+	struct jme_adapter *jme = from_tasklet(jme, t, pcc_task);
 	struct net_device *netdev = jme->dev;
 
 	if (unlikely(test_bit(JME_FLAG_SHUTDOWN, &jme->flags))) {
@@ -1265,10 +1265,9 @@ jme_stop_shutdown_timer(struct jme_adapter *jme)
 	jwrite32f(jme, JME_APMC, apmc);
 }
 
-static void
-jme_link_change_tasklet(unsigned long arg)
+static void jme_link_change_tasklet(struct tasklet_struct *t)
 {
-	struct jme_adapter *jme = (struct jme_adapter *)arg;
+	struct jme_adapter *jme = from_tasklet(jme, t, linkch_task);
 	struct net_device *netdev = jme->dev;
 	int rc;
 
@@ -1345,9 +1344,9 @@ jme_link_change_tasklet(unsigned long arg)
 }
 
 static void
-jme_rx_clean_tasklet(unsigned long arg)
+jme_rx_clean_tasklet(struct tasklet_struct *t)
 {
-	struct jme_adapter *jme = (struct jme_adapter *)arg;
+	struct jme_adapter *jme = from_tasklet(jme, t, rxclean_task);
 	struct dynpcc_info *dpi = &(jme->dpi);
 
 	jme_process_receive(jme, jme->rx_ring_size);
@@ -1380,9 +1379,9 @@ jme_poll(JME_NAPI_HOLDER(holder), JME_NAPI_WEIGHT(budget))
 }
 
 static void
-jme_rx_empty_tasklet(unsigned long arg)
+jme_rx_empty_tasklet(struct tasklet_struct *t)
 {
-	struct jme_adapter *jme = (struct jme_adapter *)arg;
+	struct jme_adapter *jme = from_tasklet(jme, t, rxempty_task);
 
 	if (unlikely(atomic_read(&jme->link_changing) != 1))
 		return;
@@ -1392,7 +1391,7 @@ jme_rx_empty_tasklet(unsigned long arg)
 
 	netif_info(jme, rx_status, jme->dev, "RX Queue Full!\n");
 
-	jme_rx_clean_tasklet(arg);
+	jme_rx_clean_tasklet(&jme->rxclean_task);
 
 	while (atomic_read(&jme->rx_empty) > 0) {
 		atomic_dec(&jme->rx_empty);
@@ -1416,10 +1415,9 @@ jme_wake_queue_if_stopped(struct jme_adapter *jme)
 
 }
 
-static void
-jme_tx_clean_tasklet(unsigned long arg)
+static void jme_tx_clean_tasklet(struct tasklet_struct *t)
 {
-	struct jme_adapter *jme = (struct jme_adapter *)arg;
+	struct jme_adapter *jme = from_tasklet(jme, t, txclean_task);
 	struct jme_ring *txring = &(jme->txring[0]);
 	struct txdesc *txdesc = txring->desc;
 	struct jme_buffer_info *txbi = txring->bufinf, *ctxbi, *ttxbi;
@@ -1834,14 +1832,10 @@ jme_open(struct net_device *netdev)
 	jme_clear_pm_disable_wol(jme);
 	JME_NAPI_ENABLE(jme);
 
-	tasklet_init(&jme->linkch_task, jme_link_change_tasklet,
-		     (unsigned long) jme);
-	tasklet_init(&jme->txclean_task, jme_tx_clean_tasklet,
-		     (unsigned long) jme);
-	tasklet_init(&jme->rxclean_task, jme_rx_clean_tasklet,
-		     (unsigned long) jme);
-	tasklet_init(&jme->rxempty_task, jme_rx_empty_tasklet,
-		     (unsigned long) jme);
+	tasklet_setup(&jme->linkch_task, jme_link_change_tasklet);
+	tasklet_setup(&jme->txclean_task, jme_tx_clean_tasklet);
+	tasklet_setup(&jme->rxclean_task, jme_rx_clean_tasklet);
+	tasklet_setup(&jme->rxempty_task, jme_rx_empty_tasklet);
 
 	rc = jme_request_irq(jme);
 	if (rc)
@@ -3040,9 +3034,7 @@ jme_init_one(struct pci_dev *pdev,
 	atomic_set(&jme->tx_cleaning, 1);
 	atomic_set(&jme->rx_empty, 1);
 
-	tasklet_init(&jme->pcc_task,
-		     jme_pcc_tasklet,
-		     (unsigned long) jme);
+	tasklet_setup(&jme->pcc_task, jme_pcc_tasklet);
 	jme->dpi.cur = PCC_P1;
 
 	jme->reg_ghc = 0;
-- 
2.17.1

