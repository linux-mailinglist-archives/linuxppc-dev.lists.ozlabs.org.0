Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38389941FA6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 20:35:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KtQLx3vt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYP6g6Zy6z3d2m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 04:35:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KtQLx3vt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYP5x6FlSz3cH2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 04:34:44 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7a1843b4cdbso2827076a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 11:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722364481; x=1722969281; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJF28MhC2MiqvCUOHdECUHJyNP06dmnDOSRczPxFDXg=;
        b=KtQLx3vtZZrbVG3GZdTa6VWY4spqrviiSe9wBhJ5MGWKoccoV8+1Hl2C5jSLO3gFBS
         JNU0BK5bbdUd+4dUecAVhwdAqdK3PMQRpstiGCWA5/RXlRyk+E0vPb3i7wLALbAwAzHf
         Yn360n2lsdBgl5Dc7IYWRAJviRFyB7oFfy1gKhDgM/J1P2NiSt42mvqjVWgWXLQq4o1Y
         tOKAUCp0ZI4kqdWYM7jjLKPEfOEz342U1Wj1Fgmf97/owaA2jK2OjqtbkTyJ7s8TN/On
         YCejHGxfTYBqis9LviyeqenvJDlrMZQKb4n7SwKUP7fUWPmaFLV3kKC7uS0CpS945EYL
         pi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722364481; x=1722969281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJF28MhC2MiqvCUOHdECUHJyNP06dmnDOSRczPxFDXg=;
        b=dOL8uPAlg73WjH5nhRr9Ebs5Dy8zdFcUCIjImL8sF7ikqezDF0xCSUyadHNpqvZMJl
         65MS/DC7MT6Q6FqzFXslYZzPktCUhtW0DPL/oPMr7fHAUCPK+yUS+0+k0OOALCKWhzF9
         p/yZCPqTQ9dfiAEVcK78/0FFcktVmUqDjs8MVKTDHAcNf0LCQGrSZ7CZczmnVzyGwjXA
         UtAftN5iwFsjuPTiNSGfRo2s4XQIerl5q8foi1RWrdLpKKnq+b3xPMRFqsEvw84r+2+U
         saD6kFlZinj83oktfDvjw4uVNGmUKuP1IvizbOg00UdzEkUnStq+4RwQPjUEIcUevsL1
         LyIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs0jq2PMpGBBfD6lzWu8Tvxos8L6C1IMRuT/UwiCGwaE5hH0igsht9l95g92cYaB8RA/Qk1Rr9fsh/EvliQObidnA7LkxgqmM77vZXwA==
X-Gm-Message-State: AOJu0Yxx7cAcdXD3XKkWwVKA4taPqvuUMUYBT1ZBYEG720sWwe8z9eKs
	LeLiuggvZDnuzwNgARhxBKtg6DwMh6H+o6QFpiKdPU9J27AEbYfQ
X-Google-Smtp-Source: AGHT+IGo7lrGjbCeYJR8CgOHZdoGXq6ysooeIc5UeAEWFCJBQ9LFDG+NCFqdDOvXEN4PPr122ZUWMw==
X-Received: by 2002:a05:6a20:7347:b0:1c2:97cd:94d8 with SMTP id adf61e73a8af0-1c4a12cbcccmr11576550637.20.1722364481320;
        Tue, 30 Jul 2024 11:34:41 -0700 (PDT)
Received: from apais-devbox.. ([2001:569:766d:6500:f2df:af9:e1f6:390e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f817f5a2sm7837763a12.24.2024.07.30.11.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 11:34:40 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: kuba@kernel.org,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [net-next v3 12/15] net: ibmvnic: Convert tasklet API to new bottom half workqueue mechanism
Date: Tue, 30 Jul 2024 11:34:00 -0700
Message-Id: <20240730183403.4176544-13-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730183403.4176544-1-allen.lkml@gmail.com>
References: <20240730183403.4176544-1-allen.lkml@gmail.com>
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
Cc: marcin.s.wojtas@gmail.com, kda@linux-powerpc.org, Allen Pais <allen.lkml@gmail.com>, linux-acenic@sunsite.dk, louis.peens@corigine.com, linux-rdma@vger.kernel.org, cooldavid@cooldavid.org, aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, mlindner@marvell.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, jes@trained-monkey.org, richardcochran@gmail.com, sean.wang@mediatek.com, linux-net-drivers@amd.com, cai.huoqing@linux.dev, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, bryan.whitehead@microchip.com, dougmill@linux.ibm.com, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, stephen@networkplumber.org, borisp@nvidia.com, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, nbd@nbd.name
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
index 23ebeb143987..0156efeff96a 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2737,7 +2737,7 @@ static const char *reset_reason_to_string(enum ibmvnic_reset_reason reason)
 /*
  * Initialize the init_done completion and return code values. We
  * can get a transport event just after registering the CRQ and the
- * tasklet will use this to communicate the transport event. To ensure
+ * bh work will use this to communicate the transport event. To ensure
  * we don't miss the notification/error, initialize these _before_
  * regisering the CRQ.
  */
@@ -4447,7 +4447,7 @@ static void send_request_cap(struct ibmvnic_adapter *adapter, int retry)
 	int cap_reqs;
 
 	/* We send out 6 or 7 REQUEST_CAPABILITY CRQs below (depending on
-	 * the PROMISC flag). Initialize this count upfront. When the tasklet
+	 * the PROMISC flag). Initialize this count upfront. When the bh work
 	 * receives a response to all of these, it will send the next protocol
 	 * message (QUERY_IP_OFFLOAD).
 	 */
@@ -4983,7 +4983,7 @@ static void send_query_cap(struct ibmvnic_adapter *adapter)
 	int cap_reqs;
 
 	/* We send out 25 QUERY_CAPABILITY CRQs below.  Initialize this count
-	 * upfront. When the tasklet receives a response to all of these, it
+	 * upfront. When the bh work receives a response to all of these, it
 	 * can send out the next protocol messaage (REQUEST_CAPABILITY).
 	 */
 	cap_reqs = 25;
@@ -5495,7 +5495,7 @@ static int handle_login_rsp(union ibmvnic_crq *login_rsp_crq,
 	int i;
 
 	/* CHECK: Test/set of login_pending does not need to be atomic
-	 * because only ibmvnic_tasklet tests/clears this.
+	 * because only ibmvnic_bh_work tests/clears this.
 	 */
 	if (!adapter->login_pending) {
 		netdev_warn(netdev, "Ignoring unexpected login response\n");
@@ -6081,13 +6081,13 @@ static irqreturn_t ibmvnic_interrupt(int irq, void *instance)
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
@@ -6168,7 +6168,7 @@ static void release_crq_queue(struct ibmvnic_adapter *adapter)
 
 	netdev_dbg(adapter->netdev, "Releasing CRQ\n");
 	free_irq(vdev->irq, adapter);
-	tasklet_kill(&adapter->tasklet);
+	cancel_work_sync(&adapter->bh_work);
 	do {
 		rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
 	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
@@ -6219,7 +6219,7 @@ static int init_crq_queue(struct ibmvnic_adapter *adapter)
 
 	retrc = 0;
 
-	tasklet_setup(&adapter->tasklet, (void *)ibmvnic_tasklet);
+	INIT_WORK(&adapter->bh_work, (void *)ibmvnic_bh_work);
 
 	netdev_dbg(adapter->netdev, "registering irq 0x%x\n", vdev->irq);
 	snprintf(crq->name, sizeof(crq->name), "ibmvnic-%x",
@@ -6241,12 +6241,12 @@ static int init_crq_queue(struct ibmvnic_adapter *adapter)
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
@@ -6639,7 +6639,7 @@ static int ibmvnic_resume(struct device *dev)
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

