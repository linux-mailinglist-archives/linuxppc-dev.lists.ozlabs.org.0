Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EAB24658D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:35:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVX5n6dznzDqMx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:35:09 +1000 (AEST)
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
 header.s=20161025 header.b=ARN7DkZq; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSXl30MszDqSV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:54:47 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id i10so2259525pgk.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lDmZSaB9SDsuHRMCoS4mSkpLKS8AQi0WM0y0umCFAfM=;
 b=ARN7DkZqBaOJ2CSCPA2npO8s8jVmPE2GVZq8gro0ceYQ+wn+he80p3n41djo7NzhnV
 6l6ji36C0sm/yXaeqpiF2Y2MDBJSCBsXmRg0UdNHMGZTJHQIefxQpZi4lATRCpNvgThF
 KdjNkwZCbZLWYTCnrOJm7+O27kCFnASn7iELJo3fUKcgQMjeF0V0SETxxE8p/Fq5zAOj
 V0Oj5K5yzDgnI2EcVA8xvEBTiO+aF/4GF13g7Sa9j1wiwtU7e0bwUtsZEN1QlGs6hOIu
 pIx6oaHry1qw0DGPvp9GRBbMnc1+igxjEHLSPVicFCGea7pkEPH1b7/FFiZZXaL6Q6Nz
 cRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lDmZSaB9SDsuHRMCoS4mSkpLKS8AQi0WM0y0umCFAfM=;
 b=SRT5LdDbiJPFqoqtrHMOA0Y7PxSfpN30598IozSiP5VvozPRR9WZMkxHNpKnOTIpqy
 wnmp2zAMxOVcx+Lw/FtVsX6k09YpPn4tdODhv2H6QkJCJ7kKQDZrw9OgU7/rmAwiVejK
 gbAiS9Kbfpfmqlo1Q0pxFurR8AeOxzNCM8RlVQAPu0A+b3VjiGuZ0QKjTUV8ME0U1RPi
 etNKZvBslmxbfoYfgLuR/5MeJ3+feCLlPwpBRDaBZQLMqeL3LH1hCkKn9hNZLkppQvf8
 sPqARjZJ0s1XREJxiXMSCDXtddadl26oOwfMqbQty4Ry8kfp7TAy/Fj/WdmKKlVg0VLB
 LUHQ==
X-Gm-Message-State: AOAM530VR95tjQRc+2ufxJp1KPQOmUVkr/wjRwYrTdZ3m35wmMFbmEz3
 M5SPUJRfAALnyF3Ff/+6nc4=
X-Google-Smtp-Source: ABdhPJyVPcS+QO1XpTezGIF49izLpHDxWvhsJOVJBH8xcafcgG3FsCBY46X4INpr0WC4C/0DkTVuJA==
X-Received: by 2002:a63:67c5:: with SMTP id b188mr8533979pgc.412.1597654485371; 
 Mon, 17 Aug 2020 01:54:45 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id x12sm18236990pff.48.2020.08.17.01.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:54:44 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: jejb@linux.ibm.com, martin.petersen@oracle.com, kashyap.desai@broadcom.com,
 sumit.saxena@broadcom.com, shivasharan.srikanteshwara@broadcom.com
Subject: [PATCH 4/8] scsi: isci: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 14:24:05 +0530
Message-Id: <20200817085409.25268-5-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817085409.25268-1-allen.cryptic@gmail.com>
References: <20200817085409.25268-1-allen.cryptic@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 21:23:56 +1000
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
 drivers/scsi/isci/host.c | 4 ++--
 drivers/scsi/isci/host.h | 2 +-
 drivers/scsi/isci/init.c | 3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/isci/host.c b/drivers/scsi/isci/host.c
index 7b5deae68d33..599adebd039e 100644
--- a/drivers/scsi/isci/host.c
+++ b/drivers/scsi/isci/host.c
@@ -1113,9 +1113,9 @@ void ireq_done(struct isci_host *ihost, struct isci_request *ireq, struct sas_ta
  * @data: This parameter specifies the ISCI host object
  *
  */
-void isci_host_completion_routine(unsigned long data)
+void isci_host_completion_routine(struct tasklet_struct *t)
 {
-	struct isci_host *ihost = (struct isci_host *)data;
+	struct isci_host *ihost = from_tasklet(ihost, t, completion_tasklet);
 	u16 active;
 
 	spin_lock_irq(&ihost->scic_lock);
diff --git a/drivers/scsi/isci/host.h b/drivers/scsi/isci/host.h
index 6bc3f022630a..6abe23682d9b 100644
--- a/drivers/scsi/isci/host.h
+++ b/drivers/scsi/isci/host.h
@@ -478,7 +478,7 @@ void isci_tci_free(struct isci_host *ihost, u16 tci);
 void ireq_done(struct isci_host *ihost, struct isci_request *ireq, struct sas_task *task);
 
 int isci_host_init(struct isci_host *);
-void isci_host_completion_routine(unsigned long data);
+void isci_host_completion_routine(struct tasklet_struct *t);
 void isci_host_deinit(struct isci_host *);
 void sci_controller_disable_interrupts(struct isci_host *ihost);
 bool sci_controller_has_remote_devices_stopping(struct isci_host *ihost);
diff --git a/drivers/scsi/isci/init.c b/drivers/scsi/isci/init.c
index 085e285f427d..32a0117b5ff4 100644
--- a/drivers/scsi/isci/init.c
+++ b/drivers/scsi/isci/init.c
@@ -511,8 +511,7 @@ static struct isci_host *isci_host_alloc(struct pci_dev *pdev, int id)
 	init_waitqueue_head(&ihost->eventq);
 	ihost->sas_ha.dev = &ihost->pdev->dev;
 	ihost->sas_ha.lldd_ha = ihost;
-	tasklet_init(&ihost->completion_tasklet,
-		     isci_host_completion_routine, (unsigned long)ihost);
+	tasklet_setup(&ihost->completion_tasklet, isci_host_completion_routine);
 
 	/* validate module parameters */
 	/* TODO: kill struct sci_user_parameters and reference directly */
-- 
2.17.1

