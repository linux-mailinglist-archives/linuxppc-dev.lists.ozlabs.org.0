Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4029B246185
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 10:56:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVSZd5tDtzDqM4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 18:56:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hG2G6TIw; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRvR5ZvfzDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:25:55 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id u20so7877261pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iIAfZhwD4u3KlLMECiacU1MTufzkqZbS33SY7LcQr7A=;
 b=hG2G6TIwKMJXy2HRahBQraJOgltWGzLG9JNMpZ4RSRhs60XANefCGvnE5soeTXpm4f
 8W7Y1YPZgS9l2UmuOoypi4PZ1qdPVFJ7QEteda3ogrOSn5313M/EE7BZgy5sZrFHhrui
 KdAhYg0gLgoy5pBrKOtjZKJGxtOE+4FM1rRssMpDabVK+1mj2agBXV7RnGvo3Sx7vvv/
 0qRK+BXn24CXmouDGXQ2sXFDJUTEkNWdlyk/l+2QSR8ANbeQbj1pMPLjbCHHoaPzPyjG
 PaFqIMtn8VpzTLw8Vd06NvM257eWA0mBFfDHBaMuUka7/3j5nCdVQi91g8S89hQuYSye
 dqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iIAfZhwD4u3KlLMECiacU1MTufzkqZbS33SY7LcQr7A=;
 b=l7ZNokr2FBEgLuSWAV1aqalR9eVkpLcfdBb8V3bprP/xAm3GIJqmmbZmRmD9hbKdjF
 VeC+dnorCXYLUKwHIJ5mKEgnQtJwrppdYfAS0lyb3sniM+/3APRBNRxIVj4wixwnGWEf
 6Rj2JOSTfRmb9nhK93SgaaYbnvBK1c7eWeSPk+h833X3o4E6bWFFrSBQkQVpjzbjZHCC
 v5v8NByVJdk1J6MG1aj2jb20w6rYtwvn33iOalwNOYgcF8Dz7VOPc7R2f+1cAxGdbpwj
 +RdNpzliHzWmmV7EyZMPld15iEQowZE/7xNeVxF15C5GJOW+2C2PNLnk+TWSKnlc4Mp+
 KfqA==
X-Gm-Message-State: AOAM530O9LsSwO6vtOmcNJwn1NAz2WkothHaA5ASBb8Hk2Au60dQawRO
 WaGBGAfphxW1OZ6jrp6mS1c=
X-Google-Smtp-Source: ABdhPJyHdid6AeC6n0Zvp88ugK0l2FhFHXTm5Bvo/3+IlJzMqY2dzIOg8iBwBCBZqkwkbk4eX5A4Ng==
X-Received: by 2002:aa7:80d6:: with SMTP id a22mr10784840pfn.275.1597652753273; 
 Mon, 17 Aug 2020 01:25:53 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r186sm19928482pfr.162.2020.08.17.01.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:25:52 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: jes@trained-monkey.org, davem@davemloft.net, kuba@kernel.org,
 kda@linux-powerpc.org, dougmill@linux.ibm.com, cooldavid@cooldavid.org,
 mlindner@marvell.com, borisp@mellanox.com
Subject: [PATCH 10/20] ethernet: ibmvnic: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:54:24 +0530
Message-Id: <20200817082434.21176-12-allen.lkml@gmail.com>
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
 drivers/net/ethernet/ibm/ibmvnic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 5afb3c9c52d2..7c565e167521 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -4797,9 +4797,9 @@ static irqreturn_t ibmvnic_interrupt(int irq, void *instance)
 	return IRQ_HANDLED;
 }
 
-static void ibmvnic_tasklet(void *data)
+static void ibmvnic_tasklet(struct tasklet_struct *t)
 {
-	struct ibmvnic_adapter *adapter = data;
+	struct ibmvnic_adapter *adapter = from_tasklet(adapter, t, tasklet);
 	struct ibmvnic_crq_queue *queue = &adapter->crq;
 	union ibmvnic_crq *crq;
 	unsigned long flags;
@@ -4934,8 +4934,7 @@ static int init_crq_queue(struct ibmvnic_adapter *adapter)
 
 	retrc = 0;
 
-	tasklet_init(&adapter->tasklet, (void *)ibmvnic_tasklet,
-		     (unsigned long)adapter);
+	tasklet_setup(&adapter->tasklet, (void *)ibmvnic_tasklet);
 
 	netdev_dbg(adapter->netdev, "registering irq 0x%x\n", vdev->irq);
 	snprintf(crq->name, sizeof(crq->name), "ibmvnic-%x",
-- 
2.17.1

