Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6440A911A03
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 07:06:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Pbdyw/2C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W551f4pVcz3cZJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 15:06:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Pbdyw/2C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W550x0fk7z3cQf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 15:06:07 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6f96445cfaeso927532a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 22:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718946362; x=1719551162; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7Qm0uXfQVJ0pL26mcNJNw6zIMxofNWokQ38AnTAGFg=;
        b=Pbdyw/2CAwo/uWI4q+WvI6aPHGI18ooN3+v3Xs6a6POQlMCvmssIkzn2fyBFmdQmmK
         2fpurEaBOV5kwgwTCsxh4rhyb345K6OKnmYz2imHAjUYOLx/Y1HH1kOiEtg8XaQQcUKS
         HQ4tLia8uFlEdIAUH07D5NmMvbssUh+gk+0EYA9GO7IA3fi0fSWYd3k8M97CHZYQHfwj
         Lc1HabGNkkqnccnOYhxpZ7t2QqoiKMnsSGcHdw09ywYMA6sxwN6CVY+QO7zriIHWaRUw
         BgNNspEkvTc3eMsEc2lOzulQo+bhu6v0d6DgWh4j3WUnLflS24HEKMVQXfhJ+MHVmam6
         Kopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718946362; x=1719551162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7Qm0uXfQVJ0pL26mcNJNw6zIMxofNWokQ38AnTAGFg=;
        b=whjZaPjaRiGAIlsjw8mKWxkzY/Ou1BeKaefhcLN/Jj36+phvM2C6Vv4ny50l9MYkoz
         sgu0rP5vbFDDXMl+8q/CJ6pSs+cvfFY9DwrMT5VdiLNavPCGt/PhBYb6OkHLtMT5FzNk
         90T9R7znx3T2zWEPRj5LGj87bHHRawD47jLmQxlU+UYTlMVQjiIceg/cwOZbUIgi1Lnb
         HpFja8NaSmugdSKCK+udpj78UKK0YzsyTuBnqWSC8APZ9LVbaOqdUp8wj1FJ9rzcDO34
         8xZij7Q8yaIbf4EQgIDjc8C59Xbw1S8mYNSLWJHNPgRAkGyw9fPGIrn7sDGGFSqZBF8i
         /Uig==
X-Forwarded-Encrypted: i=1; AJvYcCXxOlScxeJm+kOTlcexmbeuyGakLMz6/SDrz/MjiZisZeeNGC0kvMRQKTH3qsGYUFp0njc7ajEGbsEIOSgWrc15rBMScnsp4rw5Y0MX3g==
X-Gm-Message-State: AOJu0YwrnF3liYF931jtm2Sk4UQg6Y43Wp8JaA2Ag9GUr9M5HN5NjZeK
	2lw4wOL88CoL/238sRI1OkKPOzVgIY1h9AAQ4sQOIIqTC0FHL0go
X-Google-Smtp-Source: AGHT+IEl8AUL32RskP9KGXc80Es0L2iMivKVGf7869FhG8wMEglB481MAH7e/tfcS1tKjlee8zzZuw==
X-Received: by 2002:a05:6830:18ea:b0:6f9:9540:76a8 with SMTP id 46e09a7af769-70073b35f82mr7986503a34.13.1718946361927;
        Thu, 20 Jun 2024 22:06:01 -0700 (PDT)
Received: from apais-devbox.. ([2001:569:766d:6500:fb4e:6cf3:3ec6:9292])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716c950d71asm371308a12.62.2024.06.20.22.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 22:06:01 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: kuba@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH 12/15] net: ibmvnic: Convert tasklet API to new bottom half workqueue mechanism
Date: Thu, 20 Jun 2024 22:05:22 -0700
Message-Id: <20240621050525.3720069-13-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621050525.3720069-1-allen.lkml@gmail.com>
References: <20240621050525.3720069-1-allen.lkml@gmail.com>
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
Cc: marcin.s.wojtas@gmail.com, kda@linux-powerpc.org, Allen Pais <allen.lkml@gmail.com>, linux-acenic@sunsite.dk, louis.peens@corigine.com, borisp@nvidia.com, cooldavid@cooldavid.org, aneesh.kumar@kernel.org, mlindner@marvell.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, jes@trained-monkey.org, richardcochran@gmail.com, sean.wang@mediatek.com, linux-net-drivers@amd.com, cai.huoqing@linux.dev, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, bryan.whitehead@microchip.com, dougmill@linux.ibm.com, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, stephen@networkplumber.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, nbd@nbd.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Migrate tasklet APIs to the new bottom half workqueue mechanism. It
replaces all occurrences of tasklet usage with the appropriate workqueue
APIs throughout the ibmvnic driver. This transition ensures compatibility
with the latest design and enhances performance.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 24 ++++++++++++------------
 drivers/net/ethernet/ibm/ibmvnic.h |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 5e9a93bdb518..2e817a560c3a 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2725,7 +2725,7 @@ static const char *reset_reason_to_string(enum ibmvnic_reset_reason reason)
 /*
  * Initialize the init_done completion and return code values. We
  * can get a transport event just after registering the CRQ and the
- * tasklet will use this to communicate the transport event. To ensure
+ * bh work will use this to communicate the transport event. To ensure
  * we don't miss the notification/error, initialize these _before_
  * regisering the CRQ.
  */
@@ -4429,7 +4429,7 @@ static void send_request_cap(struct ibmvnic_adapter *adapter, int retry)
 	int cap_reqs;
 
 	/* We send out 6 or 7 REQUEST_CAPABILITY CRQs below (depending on
-	 * the PROMISC flag). Initialize this count upfront. When the tasklet
+	 * the PROMISC flag). Initialize this count upfront. When the bh work
 	 * receives a response to all of these, it will send the next protocol
 	 * message (QUERY_IP_OFFLOAD).
 	 */
@@ -4965,7 +4965,7 @@ static void send_query_cap(struct ibmvnic_adapter *adapter)
 	int cap_reqs;
 
 	/* We send out 25 QUERY_CAPABILITY CRQs below.  Initialize this count
-	 * upfront. When the tasklet receives a response to all of these, it
+	 * upfront. When the bh work receives a response to all of these, it
 	 * can send out the next protocol messaage (REQUEST_CAPABILITY).
 	 */
 	cap_reqs = 25;
@@ -5477,7 +5477,7 @@ static int handle_login_rsp(union ibmvnic_crq *login_rsp_crq,
 	int i;
 
 	/* CHECK: Test/set of login_pending does not need to be atomic
-	 * because only ibmvnic_tasklet tests/clears this.
+	 * because only ibmvnic_bh_work tests/clears this.
 	 */
 	if (!adapter->login_pending) {
 		netdev_warn(netdev, "Ignoring unexpected login response\n");
@@ -6063,13 +6063,13 @@ static irqreturn_t ibmvnic_interrupt(int irq, void *instance)
 {
 	struct ibmvnic_adapter *adapter = instance;
 
-	tasklet_schedule(&adapter->tasklet);
+	queue_work(system_bh_wq, &adapter->bh_work);
 	return IRQ_HANDLED;
 }
 
-static void ibmvnic_tasklet(struct tasklet_struct *t)
+static void ibmvnic_bh_work(struct work_struct *work)
 {
-	struct ibmvnic_adapter *adapter = from_tasklet(adapter, t, tasklet);
+	struct ibmvnic_adapter *adapter = from_work(adapter, work, bh_work);
 	struct ibmvnic_crq_queue *queue = &adapter->crq;
 	union ibmvnic_crq *crq;
 	unsigned long flags;
@@ -6150,7 +6150,7 @@ static void release_crq_queue(struct ibmvnic_adapter *adapter)
 
 	netdev_dbg(adapter->netdev, "Releasing CRQ\n");
 	free_irq(vdev->irq, adapter);
-	tasklet_kill(&adapter->tasklet);
+	cancel_work_sync(&adapter->bh_work);
 	do {
 		rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
 	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
@@ -6201,7 +6201,7 @@ static int init_crq_queue(struct ibmvnic_adapter *adapter)
 
 	retrc = 0;
 
-	tasklet_setup(&adapter->tasklet, (void *)ibmvnic_tasklet);
+	INIT_WORK(&adapter->bh_work, (void *)ibmvnic_bh_work);
 
 	netdev_dbg(adapter->netdev, "registering irq 0x%x\n", vdev->irq);
 	snprintf(crq->name, sizeof(crq->name), "ibmvnic-%x",
@@ -6223,12 +6223,12 @@ static int init_crq_queue(struct ibmvnic_adapter *adapter)
 	spin_lock_init(&crq->lock);
 
 	/* process any CRQs that were queued before we enabled interrupts */
-	tasklet_schedule(&adapter->tasklet);
+	queue_work(system_bh_wq, &adapter->bh_work);
 
 	return retrc;
 
 req_irq_failed:
-	tasklet_kill(&adapter->tasklet);
+	cancel_work_sync(&adapter->bh_work);
 	do {
 		rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
 	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
@@ -6621,7 +6621,7 @@ static int ibmvnic_resume(struct device *dev)
 	if (adapter->state != VNIC_OPEN)
 		return 0;
 
-	tasklet_schedule(&adapter->tasklet);
+	queue_work(system_bh_wq, &adapter->bh_work);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/ibm/ibmvnic.h b/drivers/net/ethernet/ibm/ibmvnic.h
index 94ac36b1408b..b65b210a8059 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.h
+++ b/drivers/net/ethernet/ibm/ibmvnic.h
@@ -1036,7 +1036,7 @@ struct ibmvnic_adapter {
 	u32 cur_rx_buf_sz;
 	u32 prev_rx_buf_sz;
 
-	struct tasklet_struct tasklet;
+	struct work_struct bh_work;
 	enum vnic_state state;
 	/* Used for serialization of state field. When taking both state
 	 * and rwi locks, take state lock first.
-- 
2.34.1

