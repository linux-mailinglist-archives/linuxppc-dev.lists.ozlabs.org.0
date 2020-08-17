Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD9F246596
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:40:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVXDP1LzrzDqWt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:40:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=allen.cryptic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ofjCFlkN; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSY45RL6zDqLh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:55:04 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id u128so7902224pfb.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WjN5WWXKRu0qRTJkEfYiBM+eZY8od27NJFEvfztfXRw=;
 b=ofjCFlkN/L/yMi6bvgjpuN80ewdc1vauKYTHb0JDCi+gGyAogsMKHoCjWUHna0G0MH
 ehGBUvt/QDfoWk2Tr8j5kVVTFIgnubDUvC/bIXrkNLZlk0iu7RGcoqeonLQCaMs8Q3oT
 xVf0I6P/nipMxqUMsl5CU7l+CX0ok6bWA++6o/1CpYI8NR6vnpHQNB59Av0lIn3X1lCr
 sX61J1nSBD/6eRyCfvzEJVB7wE8w8sbuOsWAu7qQ/pilkE5IkarzBQcCSkG2tvl/CPT9
 1nMInHgJS6MZkidBJVPE+NpVwtCL5wKq0i5RUuXsaiCPj5qPB9gsukMSkvm696sy7AwN
 h9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WjN5WWXKRu0qRTJkEfYiBM+eZY8od27NJFEvfztfXRw=;
 b=ks05clmK0okqVOlAZnoxJUZLnFGBPifqHtLXbPAWXktySvjblqtMjEPLpyILYD9WSk
 vSDeiYkYJGorn/lRy4dyWAdZ9pXHxk0AdZSqrQaBDspvAgWFqjWiHRc1WG+rcb5wfFGz
 WWF0aMd3Y8I8f+wszfbg0/MoRAsmkDpZ2rHE3/JOYMsRu+HSRUL3AGiFR+8OP4Rwp32h
 Ro3AormUFzBU3VBldD0BnOGVr+yKOnchiXluJXtiiV9cQNy/YU7t8ko6mBsAeXVrFjMM
 wS91Gj2RS0zmbXlhJNGbVfu16qyO/Tl8PVy47/2IV9Wl98/07fbKIk57fe29J8E3aYIf
 lhqQ==
X-Gm-Message-State: AOAM533BOBofwJH3msVwdjMDvQ6c1sLakzp6H0oq9ruiqwxBHNa698Bg
 mtKT8/UklvkRaOhmzys7FDo=
X-Google-Smtp-Source: ABdhPJySr0zfutgkvfKUUoarg3CG+N1D+i82umIzTCLTVEsE1cA/pi9o2wbaw0OwYm1JnLOMpGUzAw==
X-Received: by 2002:aa7:959c:: with SMTP id z28mr10771954pfj.223.1597654501440; 
 Mon, 17 Aug 2020 01:55:01 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id x12sm18236990pff.48.2020.08.17.01.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:55:00 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: jejb@linux.ibm.com, martin.petersen@oracle.com, kashyap.desai@broadcom.com,
 sumit.saxena@broadcom.com, shivasharan.srikanteshwara@broadcom.com
Subject: [PATCH 7/8] scsi: pm8001: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 14:24:08 +0530
Message-Id: <20200817085409.25268-8-allen.cryptic@gmail.com>
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
 drivers/scsi/pm8001/pm8001_init.c | 55 ++++++++++++++++++-------------
 drivers/scsi/pm8001/pm8001_sas.h  |  6 +++-
 2 files changed, 37 insertions(+), 24 deletions(-)

diff --git a/drivers/scsi/pm8001/pm8001_init.c b/drivers/scsi/pm8001/pm8001_init.c
index 20fa96cbc9d3..818816c8b295 100644
--- a/drivers/scsi/pm8001/pm8001_init.c
+++ b/drivers/scsi/pm8001/pm8001_init.c
@@ -187,12 +187,15 @@ static void pm8001_free(struct pm8001_hba_info *pm8001_ha)
  * @opaque: the passed general host adapter struct
  * Note: pm8001_tasklet is common for pm8001 & pm80xx
  */
-static void pm8001_tasklet(unsigned long opaque)
+static void pm8001_tasklet(struct tasklet_struct *t)
 {
-	struct pm8001_hba_info *pm8001_ha;
+	struct tsk_param *tsk_param = from_tasklet(tsk_param, t, tasklet);
+	struct pm8001_hba_info *pm8001_ha = container_of(tsk_param,
+						typeof(*pm8001_ha),
+						tasklet[tsk_param->irq_id]);
 	struct isr_param *irq_vector;
 
-	irq_vector = (struct isr_param *)opaque;
+	irq_vector = &pm8001_ha->irq_vector[tsk_param->irq_id];
 	pm8001_ha = irq_vector->drv_inst;
 	if (unlikely(!pm8001_ha))
 		BUG_ON(1);
@@ -221,7 +224,7 @@ static irqreturn_t pm8001_interrupt_handler_msix(int irq, void *opaque)
 	if (!PM8001_CHIP_DISP->is_our_interrupt(pm8001_ha))
 		return IRQ_NONE;
 #ifdef PM8001_USE_TASKLET
-	tasklet_schedule(&pm8001_ha->tasklet[irq_vector->irq_id]);
+	tasklet_schedule(&pm8001_ha->tasklet[irq_vector->irq_id].tasklet);
 #else
 	ret = PM8001_CHIP_DISP->isr(pm8001_ha, irq_vector->irq_id);
 #endif
@@ -246,7 +249,7 @@ static irqreturn_t pm8001_interrupt_handler_intx(int irq, void *dev_id)
 		return IRQ_NONE;
 
 #ifdef PM8001_USE_TASKLET
-	tasklet_schedule(&pm8001_ha->tasklet[0]);
+	tasklet_schedule(&pm8001_ha->tasklet[0].tasklet);
 #else
 	ret = PM8001_CHIP_DISP->isr(pm8001_ha, 0);
 #endif
@@ -507,13 +510,16 @@ static struct pm8001_hba_info *pm8001_pci_alloc(struct pci_dev *pdev,
 #ifdef PM8001_USE_TASKLET
 	/* Tasklet for non msi-x interrupt handler */
 	if ((!pdev->msix_cap || !pci_msi_enabled())
-	    || (pm8001_ha->chip_id == chip_8001))
-		tasklet_init(&pm8001_ha->tasklet[0], pm8001_tasklet,
-			(unsigned long)&(pm8001_ha->irq_vector[0]));
-	else
-		for (j = 0; j < PM8001_MAX_MSIX_VEC; j++)
-			tasklet_init(&pm8001_ha->tasklet[j], pm8001_tasklet,
-				(unsigned long)&(pm8001_ha->irq_vector[j]));
+	    || (pm8001_ha->chip_id == chip_8001)) {
+		pm8001_ha->tasklet[0].irq_id = 0;
+		tasklet_setup(&pm8001_ha->tasklet[0].tasklet, pm8001_tasklet);
+	} else {
+		for (j = 0; j < PM8001_MAX_MSIX_VEC; j++) {
+			pm8001_ha->tasklet[j].irq_id = j;
+			tasklet_setup(&pm8001_ha->tasklet[j].tasklet,
+				      pm8001_tasklet);
+		}
+	}
 #endif
 	pm8001_ioremap(pm8001_ha);
 	if (!pm8001_alloc(pm8001_ha, ent))
@@ -1162,10 +1168,10 @@ static void pm8001_pci_remove(struct pci_dev *pdev)
 	/* For non-msix and msix interrupts */
 	if ((!pdev->msix_cap || !pci_msi_enabled()) ||
 	    (pm8001_ha->chip_id == chip_8001))
-		tasklet_kill(&pm8001_ha->tasklet[0]);
+		tasklet_kill(&pm8001_ha->tasklet[0].tasklet);
 	else
 		for (j = 0; j < PM8001_MAX_MSIX_VEC; j++)
-			tasklet_kill(&pm8001_ha->tasklet[j]);
+			tasklet_kill(&pm8001_ha->tasklet[j].tasklet);
 #endif
 	scsi_host_put(pm8001_ha->shost);
 	pm8001_free(pm8001_ha);
@@ -1212,10 +1218,10 @@ static int pm8001_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	/* For non-msix and msix interrupts */
 	if ((!pdev->msix_cap || !pci_msi_enabled()) ||
 	    (pm8001_ha->chip_id == chip_8001))
-		tasklet_kill(&pm8001_ha->tasklet[0]);
+		tasklet_kill(&pm8001_ha->tasklet[0].tasklet);
 	else
 		for (j = 0; j < PM8001_MAX_MSIX_VEC; j++)
-			tasklet_kill(&pm8001_ha->tasklet[j]);
+			tasklet_kill(&pm8001_ha->tasklet[j].tasklet);
 #endif
 	device_state = pci_choose_state(pdev, state);
 	pm8001_printk("pdev=0x%p, slot=%s, entering "
@@ -1281,13 +1287,16 @@ static int pm8001_pci_resume(struct pci_dev *pdev)
 #ifdef PM8001_USE_TASKLET
 	/*  Tasklet for non msi-x interrupt handler */
 	if ((!pdev->msix_cap || !pci_msi_enabled()) ||
-	    (pm8001_ha->chip_id == chip_8001))
-		tasklet_init(&pm8001_ha->tasklet[0], pm8001_tasklet,
-			(unsigned long)&(pm8001_ha->irq_vector[0]));
-	else
-		for (j = 0; j < PM8001_MAX_MSIX_VEC; j++)
-			tasklet_init(&pm8001_ha->tasklet[j], pm8001_tasklet,
-				(unsigned long)&(pm8001_ha->irq_vector[j]));
+	    (pm8001_ha->chip_id == chip_8001)) {
+		pm8001_ha->tasklet[0].irq_id = 0;
+		tasklet_setup(&pm8001_ha->tasklet[0].tasklet, pm8001_tasklet);
+	} else {
+		for (j = 0; j < PM8001_MAX_MSIX_VEC; j++) {
+			pm8001_ha->tasklet[j].irq_id = j;
+			tasklet_setup(&pm8001_ha->tasklet[j].tasklet,
+				      pm8001_tasklet);
+		}
+	}
 #endif
 	PM8001_CHIP_DISP->interrupt_enable(pm8001_ha, 0);
 	if (pm8001_ha->chip_id != chip_8001) {
diff --git a/drivers/scsi/pm8001/pm8001_sas.h b/drivers/scsi/pm8001/pm8001_sas.h
index ae7ba9b3c4bc..6dbaa394a08b 100644
--- a/drivers/scsi/pm8001/pm8001_sas.h
+++ b/drivers/scsi/pm8001/pm8001_sas.h
@@ -494,6 +494,10 @@ struct isr_param {
 	struct pm8001_hba_info *drv_inst;
 	u32 irq_id;
 };
+struct tsk_param {
+	struct tasklet_struct tasklet;
+	u32 irq_id;
+};
 struct pm8001_hba_info {
 	char			name[PM8001_NAME_LENGTH];
 	struct list_head	list;
@@ -549,7 +553,7 @@ struct pm8001_hba_info {
 				[PM8001_NAME_LENGTH+1+3+1];
 #endif
 #ifdef PM8001_USE_TASKLET
-	struct tasklet_struct	tasklet[PM8001_MAX_MSIX_VEC];
+	struct tsk_param	tasklet[PM8001_MAX_MSIX_VEC];
 #endif
 	u32			logging_level;
 	u32			link_rate;
-- 
2.17.1

