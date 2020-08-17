Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBD9246599
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:42:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVXGZ4yC2zDqQn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:42:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=allen.cryptic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q2RqlflI; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSY868PNzDqSd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:55:08 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id o5so7807073pgb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=i3YmxLHQm4C9rpRDNyqYBl1hzYIOBuXCpBG9eSqKocA=;
 b=q2RqlflIosSWjEW5ihBRffG2ydwOfneUbuVPVIL0V607PveCwS51neeFaDxHEru92A
 GPu+J3VM9xNFWMCAM/fm74Q9+6JPkYqpWfXkiP8BqUnjWXA1poZxUbd4787LZ0v+Xu3M
 lvc8qTZTaUaVZ+5Sqsy1CjGA7YLKVsPKqtIzofNCD4pfpT00xOfxiU2tDd4Ye9b1ISOy
 D+A0zgBsBSwJsoSRKsftsx/X+ATutKj9lwKDgFlDWHsrbwpo9Ajy8eaYBPhWaBMe+oLT
 ugAKpcR28ytIp/TofY9ZLsjij9EkYWxlgG3Avk39Bd+m1Fr74uMRrmrfU150hk0aS9ij
 KVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=i3YmxLHQm4C9rpRDNyqYBl1hzYIOBuXCpBG9eSqKocA=;
 b=JiqQSHCWsPTTH+ytOS/cI8DypUuClR91YbPx/jPYAuxv42Y/AksowJ8iOear83qljP
 bj30IkCdpH0ElnVKXg3EsX0CembPvE5yzUJlet8aUbHJnyQdk4U8HnBC7bD3uuDjl3ap
 TTZ3GfqPCoiVAJXaZjql1Tuj4f87viUIhVV9EFz7UC0XTbGr7eVaE7BJ0HCkrbLfRfVI
 3uXKexR4xiSZ1epeigIp6JDrS7KsgeJ9agbu5ZGowvaJRIGoWb0DLk129hNshhkS/v13
 qVhaK32pq43K9qmdYVBHJz08SYytGO3X7WnFjDfoQs/MfcMi671EBpnSfWxNx+nJsnLG
 blsA==
X-Gm-Message-State: AOAM531LIvQIfRyvquNPXqljk+KJDW2vUxzT19GP0LaDzTmuLSyCM90/
 JBw9FaRsqDTnBcfLeozKXwk=
X-Google-Smtp-Source: ABdhPJwFE528F8McvzPMZNZ9fzvA/dqHQ1qHYLBTKwXGtLq3IheQPon7tMzbcyScOIfbM/xxS7FitA==
X-Received: by 2002:a63:3d06:: with SMTP id k6mr9544204pga.316.1597654505767; 
 Mon, 17 Aug 2020 01:55:05 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id x12sm18236990pff.48.2020.08.17.01.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:55:05 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: jejb@linux.ibm.com, martin.petersen@oracle.com, kashyap.desai@broadcom.com,
 sumit.saxena@broadcom.com, shivasharan.srikanteshwara@broadcom.com
Subject: [PATCH 8/8] scsi: pmcraid: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:24:09 +0530
Message-Id: <20200817085409.25268-9-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817085409.25268-1-allen.cryptic@gmail.com>
References: <20200817085409.25268-1-allen.cryptic@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 21:23:57 +1000
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
Cc: keescook@chromium.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
 target-devel@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, megaraidlinux.pdl@broadcom.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Allen Pais <allen.lkml@gmail.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/scsi/pmcraid.c | 29 +++++++++++++++--------------
 drivers/scsi/pmcraid.h |  9 +++++++--
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index aa9ae2ae8579..b7bbefcbb11d 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -4198,7 +4198,7 @@ static irqreturn_t pmcraid_isr_msix(int irq, void *dev_id)
 		}
 	}
 
-	tasklet_schedule(&(pinstance->isr_tasklet[hrrq_id]));
+	tasklet_schedule(&(pinstance->isr_tasklet[hrrq_id]).tasklet);
 
 	return IRQ_HANDLED;
 }
@@ -4267,7 +4267,7 @@ static irqreturn_t pmcraid_isr(int irq, void *dev_id)
 				pinstance->int_regs.ioa_host_interrupt_clr_reg);
 
 			tasklet_schedule(
-					&(pinstance->isr_tasklet[hrrq_id]));
+				&(pinstance->isr_tasklet[hrrq_id].tasklet));
 		}
 	}
 
@@ -4380,20 +4380,20 @@ static void pmcraid_worker_function(struct work_struct *workp)
  * Return Value
  *	None
  */
-static void pmcraid_tasklet_function(unsigned long instance)
+static void pmcraid_tasklet_function(struct tasklet_struct *t)
 {
-	struct pmcraid_isr_param *hrrq_vector;
-	struct pmcraid_instance *pinstance;
+	struct pmcraid_tsk_param *tsk_param = from_tasklet(tsk_param, t,
+							   tasklet);
+	int id = tsk_param->isr_tasklet_id;
+	struct pmcraid_instance *pinstance = container_of(tsk_param,
+							  typeof(*pinstance),
+							  isr_tasklet[id]);
 	unsigned long hrrq_lock_flags;
 	unsigned long pending_lock_flags;
 	unsigned long host_lock_flags;
 	spinlock_t *lockp; /* hrrq buffer lock */
-	int id;
 	u32 resp;
 
-	hrrq_vector = (struct pmcraid_isr_param *)instance;
-	pinstance = hrrq_vector->drv_inst;
-	id = hrrq_vector->hrrq_id;
 	lockp = &(pinstance->hrrq_lock[id]);
 
 	/* loop through each of the commands responded by IOA. Each HRRQ buf is
@@ -4882,10 +4882,11 @@ static int pmcraid_allocate_config_buffers(struct pmcraid_instance *pinstance)
 static void pmcraid_init_tasklets(struct pmcraid_instance *pinstance)
 {
 	int i;
-	for (i = 0; i < pinstance->num_hrrq; i++)
-		tasklet_init(&pinstance->isr_tasklet[i],
-			     pmcraid_tasklet_function,
-			     (unsigned long)&pinstance->hrrq_vector[i]);
+	for (i = 0; i < pinstance->num_hrrq; i++) {
+		pinstance->isr_tasklet[i].isr_tasklet_id = i;
+		tasklet_setup(&pinstance->isr_tasklet[i].tasklet,
+			     pmcraid_tasklet_function);
+	}
 }
 
 /**
@@ -4900,7 +4901,7 @@ static void pmcraid_kill_tasklets(struct pmcraid_instance *pinstance)
 {
 	int i;
 	for (i = 0; i < pinstance->num_hrrq; i++)
-		tasklet_kill(&pinstance->isr_tasklet[i]);
+		tasklet_kill(&pinstance->isr_tasklet[i].tasklet);
 }
 
 /**
diff --git a/drivers/scsi/pmcraid.h b/drivers/scsi/pmcraid.h
index 15c962108075..68dab849d4c1 100644
--- a/drivers/scsi/pmcraid.h
+++ b/drivers/scsi/pmcraid.h
@@ -617,6 +617,11 @@ struct pmcraid_isr_param {
 	u8 hrrq_id;			/* hrrq entry index */
 };
 
+/* Tasklet parameters (one for each enabled tasklet) */
+struct pmcraid_tsk_param {
+	struct tasklet_struct tasklet;
+	u8 isr_tasklet_id;              /* isr_tasklet entry index */
+};
 
 /* AEN message header sent as part of event data to applications */
 struct pmcraid_aen_msg {
@@ -752,8 +757,8 @@ struct pmcraid_instance {
 	spinlock_t free_pool_lock;		/* free pool lock */
 	spinlock_t pending_pool_lock;		/* pending pool lock */
 
-	/* Tasklet to handle deferred processing */
-	struct tasklet_struct isr_tasklet[PMCRAID_NUM_MSIX_VECTORS];
+	/* Tasklet parameters and tasklets to handle deferred processing */
+	struct pmcraid_tsk_param isr_tasklet[PMCRAID_NUM_MSIX_VECTORS];
 
 	/* Work-queue (Shared) for deferred reset processing */
 	struct work_struct worker_q;
-- 
2.17.1

