Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D8B538924
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 01:17:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBrs74J4qz3c8j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 09:16:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=SWOO5qaZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stgolabs.net (client-ip=23.83.209.135; helo=olivedrab.birch.relay.mailchannels.net; envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=SWOO5qaZ;
	dkim-atps=neutral
Received: from olivedrab.birch.relay.mailchannels.net (olivedrab.birch.relay.mailchannels.net [23.83.209.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBrqj5Cqnz2yyQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 09:15:44 +1000 (AEST)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5D6E76C16BA;
	Mon, 30 May 2022 23:15:40 +0000 (UTC)
Received: from pdx1-sub0-mail-a312.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id B84A16C1608;
	Mon, 30 May 2022 23:15:39 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1653952539; a=rsa-sha256;
	cv=none;
	b=7u5PxFAULAzGfwlnquoQvAg/UEr8Lakcz5XG65ihCNJV8rjZoFM4xuNRGjfDHJPOSTB3MJ
	+rLAAnMri16ye6ZUQ7LpvmVSe4JTw/Wsxebrrdr3YyQw8JyvwwndC9rTihCHlEAL4qnWYz
	4tZQwddO40+eJBzVUy4ByNmdy30qvJKAaYJpntdO7HUpFj5524KWYfPsZyiSzC6l6z/foj
	HjbBG5obvhfGGvbyUbLodUUSy8oJ2hr8FObUb+tfnaFhVgs8LPk1lQXg/YyE4Xx6SzZaQp
	G+vBvzkgJMS+5o5pjHwHW1X2+bbLLWdzGe6pdkn/rpgukXkIStQbrzPIw0XP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1653952539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=CTIylgDlf3e+RiEnLIJjWrizgO0Y+1XwvuDvHKKokNo=;
	b=RE2aoUCcjqvZ064MRtcadDLi5OrLtbMLXRP6tvQsutuGw8rWI0qKVCQi+DfQDuhvBi20Oa
	Ow7vgmM9MUjcF1RBgQNl9Ar4N07NWxKJ0ddxaA5lCBE/5bRqWGPg5C0z44yoNJlvYUG1Q8
	K3xTeT0btyGFh7l0hJ7c+JM55In/DoTzEe5Cim4FGT5ksw+mEW4wK2/kvjPPNBFn63isPo
	juqgke13Cj+eMAon86Vv6X9SUjs6J9lBvH/0Q2KXbb0gaAdov57OtY4GEqEKWZ9zlTdW7Q
	bGBZh3MTkHPx9udFjiTZUwjh87xXlT9YLt5oh748uzrY/HUrKzE/qa4wJg37Ew==
ARC-Authentication-Results: i=1;
	rspamd-54ff499d4f-jfs9l;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Average-Tangy: 39a916fa00139767_1653952540243_1245808343
X-MC-Loop-Signature: 1653952540243:63556705
X-MC-Ingress-Time: 1653952540243
Received: from pdx1-sub0-mail-a312.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.242.203 (trex/6.7.1);
	Mon, 30 May 2022 23:15:40 +0000
Received: from localhost.localdomain (unknown [104.36.31.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a312.dreamhost.com (Postfix) with ESMTPSA id 4LBrqb0DDJz4C;
	Mon, 30 May 2022 16:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1653952539;
	bh=CTIylgDlf3e+RiEnLIJjWrizgO0Y+1XwvuDvHKKokNo=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=SWOO5qaZQ0TteFE/jV/muVadvdOggd+kJ3R38M+wWDSAMTwkiIu5bnSuGixZDSS6U
	 LLD9ZCCfGOzLrASvidgx/FrQ+zpSeBVDNGqbbGODpp9kngfSjpsfvQkcjrsb87cupH
	 Pij4XH1FOi9DLexobSQNjS/dkzJoc3+WyPHoSsC4tV/ZQZAL8nxEO090/hCvFuhsDY
	 qpEQGvFsEHcjuQWhv+6nlVVpNy+r29Bb4wsJDQdHmlUu7oV/uz7ff4wTkpqyzX4/as
	 qPRDusxZukp//J2higDuoF3x4mzYMYagHJo8ceF6/o6hHOvoV14Mepvy+1T1uT3CGE
	 uUR6YqX5zi+/A==
From: Davidlohr Bueso <dave@stgolabs.net>
To: linux-scsi@vger.kernel.org
Subject: [PATCH 06/10] scsi/ibmvscsi_tgt: Replace work tasklet with threaded irq
Date: Mon, 30 May 2022 16:15:08 -0700
Message-Id: <20220530231512.9729-7-dave@stgolabs.net>
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
Cc: ejb@linux.ibm.com, martin.petersen@oracle.com, bigeasy@linutronix.de, Michael Cyr <mikecyr@linux.ibm.com>, dave@stgolabs.net, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tasklets have long been deprecated as being too heavy on the system
by running in irq context - and this is not a performance critical
path. If a higher priority process wants to run, it must wait for
the tasklet to finish before doing so. A more suitable equivalent
is to converted to threaded irq instead and deal with the async
work in task context.

Cc: Michael Cyr <mikecyr@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c | 17 +++++++----------
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.h |  1 -
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
index eee1a24f7e15..fafadb7158a3 100644
--- a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
+++ b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
@@ -2948,9 +2948,8 @@ static irqreturn_t ibmvscsis_interrupt(int dummy, void *data)
 	struct scsi_info *vscsi = data;
 
 	vio_disable_interrupts(vscsi->dma_dev);
-	tasklet_schedule(&vscsi->work_task);
 
-	return IRQ_HANDLED;
+	return IRQ_WAKE_THREAD;
 }
 
 /**
@@ -3317,7 +3316,7 @@ static int ibmvscsis_rdma(struct ibmvscsis_cmd *cmd, struct scatterlist *sg,
  *
  * Note: this is an edge triggered interrupt. It can not be shared.
  */
-static void ibmvscsis_handle_crq(unsigned long data)
+static irqreturn_t ibmvscsis_handle_crq(int irq, void *data)
 {
 	struct scsi_info *vscsi = (struct scsi_info *)data;
 	struct viosrp_crq *crq;
@@ -3340,7 +3339,7 @@ static void ibmvscsis_handle_crq(unsigned long data)
 		dev_dbg(&vscsi->dev, "handle_crq, don't process: flags 0x%x, state 0x%hx\n",
 			vscsi->flags, vscsi->state);
 		spin_unlock_bh(&vscsi->intr_lock);
-		return;
+	        goto done;
 	}
 
 	rc = vscsi->flags & SCHEDULE_DISCONNECT;
@@ -3417,6 +3416,8 @@ static void ibmvscsis_handle_crq(unsigned long data)
 		vscsi->state);
 
 	spin_unlock_bh(&vscsi->intr_lock);
+done:
+	return IRQ_HANDLED;
 }
 
 static int ibmvscsis_probe(struct vio_dev *vdev,
@@ -3530,9 +3531,6 @@ static int ibmvscsis_probe(struct vio_dev *vdev,
 	dev_dbg(&vscsi->dev, "probe hrc %ld, client partition num %d\n",
 		hrc, vscsi->client_data.partition_number);
 
-	tasklet_init(&vscsi->work_task, ibmvscsis_handle_crq,
-		     (unsigned long)vscsi);
-
 	init_completion(&vscsi->wait_idle);
 	init_completion(&vscsi->unconfig);
 
@@ -3544,7 +3542,8 @@ static int ibmvscsis_probe(struct vio_dev *vdev,
 		goto unmap_buf;
 	}
 
-	rc = request_irq(vdev->irq, ibmvscsis_interrupt, 0, "ibmvscsis", vscsi);
+	rc = request_threaded_irq(vdev->irq, ibmvscsis_interrupt,
+				  ibmvscsis_handle_crq, 0, "ibmvscsis", vscsi);
 	if (rc) {
 		rc = -EPERM;
 		dev_err(&vscsi->dev, "probe: request_irq failed, rc %d\n", rc);
@@ -3565,7 +3564,6 @@ static int ibmvscsis_probe(struct vio_dev *vdev,
 free_buf:
 	kfree(vscsi->map_buf);
 destroy_queue:
-	tasklet_kill(&vscsi->work_task);
 	ibmvscsis_unregister_command_q(vscsi);
 	ibmvscsis_destroy_command_q(vscsi);
 free_timer:
@@ -3602,7 +3600,6 @@ static void ibmvscsis_remove(struct vio_dev *vdev)
 	dma_unmap_single(&vdev->dev, vscsi->map_ioba, PAGE_SIZE,
 			 DMA_BIDIRECTIONAL);
 	kfree(vscsi->map_buf);
-	tasklet_kill(&vscsi->work_task);
 	ibmvscsis_destroy_command_q(vscsi);
 	ibmvscsis_freetimer(vscsi);
 	ibmvscsis_free_cmds(vscsi);
diff --git a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.h b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.h
index 7ae074e5d7a1..b66c982b8b00 100644
--- a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.h
+++ b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.h
@@ -295,7 +295,6 @@ struct scsi_info {
 	struct vio_dev *dma_dev;
 	struct srp_target target;
 	struct ibmvscsis_tport tport;
-	struct tasklet_struct work_task;
 	struct work_struct proc_work;
 };
 
-- 
2.36.1

