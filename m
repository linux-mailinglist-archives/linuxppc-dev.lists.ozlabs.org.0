Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 499F5538925
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 01:17:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBrst141gz3cd6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 09:17:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=IUN/2cDW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stgolabs.net (client-ip=23.83.209.80; helo=hamster.birch.relay.mailchannels.net; envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=IUN/2cDW;
	dkim-atps=neutral
Received: from hamster.birch.relay.mailchannels.net (hamster.birch.relay.mailchannels.net [23.83.209.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBrqj57LNz2ywq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 09:15:44 +1000 (AEST)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5F9F75A0D30;
	Mon, 30 May 2022 23:15:42 +0000 (UTC)
Received: from pdx1-sub0-mail-a312.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3F6415A177D;
	Mon, 30 May 2022 23:15:41 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1653952541; a=rsa-sha256;
	cv=none;
	b=2fRJw4uCiUXvAr9guNkoLKXsXYHQLyuXeQ0h3YRAKKBnyMNh0jeIu++o4oVQB/Wj4FK31S
	Ygf3eeoVtm47apbUIsZ8xkmYFPMUsByNK3bZVA+SW88A5NGt2ehHKMpw1a6ubPimk/efY2
	G1AlOzrkxuzBMvw8Uco6ocKLL2G4xEMplqIXU02PxwH8QrTNn12thBN85UuZ7RsgvlxPfH
	Thg4bIXMYgm1WSILJPJE5oQXBnIJQtp8eTDsGGiPj5CVq2o2Iuh0QLuCxl+SZZTgJ3f8BU
	ouwX+//TII3dwPjszt9EsfLG6ahE6JzTJ5d2vr7nJFoHFc8IxvDJLgZIC5tO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1653952541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=JgAdW87Fv5v39ixkCy0W/N22qyz98Z0Qv2cJzG+soWg=;
	b=YTNklxn8ZfxWnr+i1ULqGHkrUDoJx5TJf9LbOPWmPDlyd/Ib3a3WG0mITtTOS+zBOh99rm
	9YBDyh58B1lOb86TbwxY/XYz4o0PfmcqPLTkPJKtBz/VC5IpNmFgE0URvz8h8CpA0RXN/q
	Ntds5aURkGh0wMUlQko8ZALWweWlTbO2L3poHCkNdlWgVwVffG07/Y4o4KHMXI7tQeuLpm
	BJLzoevh8PKs1RF7timYdXmbDU3Cr4+y5eCkyinFFh80NunHmbZ3QCRIcuc7JSPLTCNtDQ
	8E39kMMuHGta3CDmhVgZuNPB6ESOykmexXlrxsd/IFopFi8mZ9/wbUEFIwQM6g==
ARC-Authentication-Results: i=1;
	rspamd-54ff499d4f-jfs9l;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Chemical-Grain: 3fae3fd83ba3d4b7_1653952541715_1488611591
X-MC-Loop-Signature: 1653952541715:1766411694
X-MC-Ingress-Time: 1653952541715
Received: from pdx1-sub0-mail-a312.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.242.203 (trex/6.7.1);
	Mon, 30 May 2022 23:15:41 +0000
Received: from localhost.localdomain (unknown [104.36.31.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a312.dreamhost.com (Postfix) with ESMTPSA id 4LBrqc2csnz15;
	Mon, 30 May 2022 16:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1653952540;
	bh=JgAdW87Fv5v39ixkCy0W/N22qyz98Z0Qv2cJzG+soWg=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=IUN/2cDWsQFrrKBUggexCWfUwhVrj1AxxjhrEsxUZIL9305oWm14L0DQ39X7fdel3
	 /mb1Rb+htn9uGV8hHXOGajhPaddxDQ53XkTlOi/cX4WE5jpfvXVJ1Q5EjZTnwW7xBp
	 OQf8fMj0pcziQAHr8kLTwIJVnnV4pzK7vt1fuKiHx5+CU96RKEJdoZ91XNYT95S0WF
	 UxgU/DLX0AGqJNRnvZrMmEC01thefraS2lcO9eaRg9x4OppEtmK5/Yk+r857QyECm4
	 d7EID9JwY3EtX3vOd/c3qwvcFYGAHH+vCeSAfuuZteZjMrEabreHIL2T2zZnBPg3+l
	 82dz7sH7wZ98w==
From: Davidlohr Bueso <dave@stgolabs.net>
To: linux-scsi@vger.kernel.org
Subject: [PATCH 08/10] scsi/ibmvfc: Replace tasklet with work
Date: Mon, 30 May 2022 16:15:10 -0700
Message-Id: <20220530231512.9729-9-dave@stgolabs.net>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530231512.9729-1-dave@stgolabs.net>
References: <20220530231512.9729-1-dave@stgolabs.net>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, ejb@linux.ibm.com, martin.petersen@oracle.com, bigeasy@linutronix.de, dave@stgolabs.net, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tasklets have long been deprecated as being too heavy on the system
by running in irq context - and this is not a performance critical
path. If a higher priority process wants to run, it must wait for
the tasklet to finish before doing so. Use a workqueue instead and
run in task context - albeit the increased concurrency (tasklets
safe against themselves), but the handler is done under both the
vhost's host_lock + crq.q_lock so should be safe.

Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 21 ++++++++++++---------
 drivers/scsi/ibmvscsi/ibmvfc.h |  3 ++-
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index d0eab5700dc5..31b1900489e7 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -891,7 +891,7 @@ static void ibmvfc_release_crq_queue(struct ibmvfc_host *vhost)
 
 	ibmvfc_dbg(vhost, "Releasing CRQ\n");
 	free_irq(vdev->irq, vhost);
-	tasklet_kill(&vhost->tasklet);
+        cancel_work_sync(&vhost->work);
 	do {
 		if (rc)
 			msleep(100);
@@ -3689,22 +3689,22 @@ static irqreturn_t ibmvfc_interrupt(int irq, void *dev_instance)
 
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	vio_disable_interrupts(to_vio_dev(vhost->dev));
-	tasklet_schedule(&vhost->tasklet);
+	schedule_work(&vhost->work);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 	return IRQ_HANDLED;
 }
 
 /**
- * ibmvfc_tasklet - Interrupt handler tasklet
+ * ibmvfc_work - work handler
  * @data:		ibmvfc host struct
  *
  * Returns:
  *	Nothing
  **/
-static void ibmvfc_tasklet(void *data)
+static void ibmvfc_workfn(struct work_struct *work)
 {
-	struct ibmvfc_host *vhost = data;
-	struct vio_dev *vdev = to_vio_dev(vhost->dev);
+	struct ibmvfc_host *vhost;
+	struct vio_dev *vdev;
 	struct ibmvfc_crq *crq;
 	struct ibmvfc_async_crq *async;
 	struct ibmvfc_event *evt, *temp;
@@ -3712,6 +3712,9 @@ static void ibmvfc_tasklet(void *data)
 	int done = 0;
 	LIST_HEAD(evt_doneq);
 
+	vhost = container_of(work, struct ibmvfc_host, work);
+	vdev = to_vio_dev(vhost->dev);
+
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	spin_lock(vhost->crq.q_lock);
 	while (!done) {
@@ -5722,7 +5725,7 @@ static int ibmvfc_init_crq(struct ibmvfc_host *vhost)
 
 	retrc = 0;
 
-	tasklet_init(&vhost->tasklet, (void *)ibmvfc_tasklet, (unsigned long)vhost);
+	INIT_WORK(&vhost->work, ibmvfc_workfn);
 
 	if ((rc = request_irq(vdev->irq, ibmvfc_interrupt, 0, IBMVFC_NAME, vhost))) {
 		dev_err(dev, "Couldn't register irq 0x%x. rc=%d\n", vdev->irq, rc);
@@ -5738,7 +5741,7 @@ static int ibmvfc_init_crq(struct ibmvfc_host *vhost)
 	return retrc;
 
 req_irq_failed:
-	tasklet_kill(&vhost->tasklet);
+	cancel_work_sync(&vhost->work);
 	do {
 		rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
 	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
@@ -6213,7 +6216,7 @@ static int ibmvfc_resume(struct device *dev)
 
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	vio_disable_interrupts(vdev);
-	tasklet_schedule(&vhost->tasklet);
+	schedule_work(&vhost->work);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 	return 0;
 }
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 3718406e0988..7eca3622a2fa 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -12,6 +12,7 @@
 
 #include <linux/list.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 #include <scsi/viosrp.h>
 
 #define IBMVFC_NAME	"ibmvfc"
@@ -892,7 +893,7 @@ struct ibmvfc_host {
 	char partition_name[97];
 	void (*job_step) (struct ibmvfc_host *);
 	struct task_struct *work_thread;
-	struct tasklet_struct tasklet;
+	struct work_struct work;
 	struct work_struct rport_add_work_q;
 	wait_queue_head_t init_wait_q;
 	wait_queue_head_t work_wait_q;
-- 
2.36.1

