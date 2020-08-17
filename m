Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFD0246542
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:25:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVWtm5hcgzDqQZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:25:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=allen.cryptic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WmbN/sEc; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSXX0fndzDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:54:35 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id y10so5606714plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nOJuhLui4k7rvz/wos+0nsCIYbwj7zan4woC4Ksv4tU=;
 b=WmbN/sEcHhuhCQ5aYnsNMtgOfzo7imWBnx5Crm1NhU5y5BmwSjvzdXxZ0ifIsV6mAX
 QJRV2IIBMTTzUUwaWwLo5sD9jQdAcitrBnSJo4h101GQpXbNMyYwA+rnuXyFPVMc2jeL
 xMnCTpldluKCOE5Wplbkyky5t1Rm0K12cZUvsQgL0pUhiOvYdw2SvvzBMgm7xXSbyHGu
 XwGTxij5YikrfxMI6lMJNzz+0rcD3uzIiI8UqxO1+n8TgCMG7RyupeLeeZCnYT5zm6wj
 KjUOtzdKJd18oBZVvIeFaFe54yfZAi1zwvKAFB9C+7oL3N7c+hvUqBr0YZ3NkrIreJ6M
 +cMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nOJuhLui4k7rvz/wos+0nsCIYbwj7zan4woC4Ksv4tU=;
 b=Yabgg5w9sQPWY4jkzUFzWwD9EjdzYY+NnDwi3gTz1D0ZBFtuyQ3mix/lh9tDM7/YrX
 1NqXmJZEoUCPT9305GIBKENkfMTOinfNRg4dOKLwdQc7IktwZErwaw3v4AXMj3ZbUKzN
 95JyrwCJLqg7ZhtNvDFyPDmu+btXtodqm7pJzWCfz2VbDJIJYIjZsi0y4gP79RXBteIa
 Ti/HOyj1Qs0padxd7DYofKXaGIgoaCO4ryHPpFA4SN30H3t7EOUHcUYCyHQlmx11ZqI2
 tA3Oo6jJ5HR1HWcZWas45848UEIU43mNiMXUwdxIJ3pCRBpDltRS/kaO9ECSexVC7p1u
 yjfQ==
X-Gm-Message-State: AOAM530w2I7Z/Z7kpf/+0lRzRUzHXHDJyb8LT/jW9dej2g/PSIMZVpj3
 QP1+VcocuwM20GM+Thyx1ks=
X-Google-Smtp-Source: ABdhPJw0P1ye0j2Opb2/IQN8p1LCLJGojSk4DSVYAKSXBrIS17h5vBynZuXvCPJffCyh7ajJeAgK/g==
X-Received: by 2002:a17:90b:f09:: with SMTP id
 br9mr11691708pjb.11.1597654472576; 
 Mon, 17 Aug 2020 01:54:32 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id x12sm18236990pff.48.2020.08.17.01.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:54:32 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: jejb@linux.ibm.com, martin.petersen@oracle.com, kashyap.desai@broadcom.com,
 sumit.saxena@broadcom.com, shivasharan.srikanteshwara@broadcom.com
Subject: [PATCH 1/8] scsi: aic94xx: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:24:02 +0530
Message-Id: <20200817085409.25268-2-allen.cryptic@gmail.com>
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
 drivers/scsi/aic94xx/aic94xx_hwi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/aic94xx/aic94xx_hwi.c b/drivers/scsi/aic94xx/aic94xx_hwi.c
index 9256ab7b2522..1e4d32246cb9 100644
--- a/drivers/scsi/aic94xx/aic94xx_hwi.c
+++ b/drivers/scsi/aic94xx/aic94xx_hwi.c
@@ -248,7 +248,7 @@ static void asd_get_max_scb_ddb(struct asd_ha_struct *asd_ha)
 
 /* ---------- Done List initialization ---------- */
 
-static void asd_dl_tasklet_handler(unsigned long);
+static void asd_dl_tasklet_handler(struct tasklet_struct *t);
 
 static int asd_init_dl(struct asd_ha_struct *asd_ha)
 {
@@ -261,8 +261,7 @@ static int asd_init_dl(struct asd_ha_struct *asd_ha)
 	asd_ha->seq.dl = asd_ha->seq.actual_dl->vaddr;
 	asd_ha->seq.dl_toggle = ASD_DEF_DL_TOGGLE;
 	asd_ha->seq.dl_next = 0;
-	tasklet_init(&asd_ha->seq.dl_tasklet, asd_dl_tasklet_handler,
-		     (unsigned long) asd_ha);
+	tasklet_setup(&asd_ha->seq.dl_tasklet, asd_dl_tasklet_handler);
 
 	return 0;
 }
@@ -711,9 +710,9 @@ static void asd_chip_reset(struct asd_ha_struct *asd_ha)
 
 /* ---------- Done List Routines ---------- */
 
-static void asd_dl_tasklet_handler(unsigned long data)
+static void asd_dl_tasklet_handler(struct tasklet_struct *t)
 {
-	struct asd_ha_struct *asd_ha = (struct asd_ha_struct *) data;
+	struct asd_ha_struct *asd_ha = from_tasklet(asd_ha, t, seq.dl_tasklet);
 	struct asd_seq_data *seq = &asd_ha->seq;
 	unsigned long flags;
 
-- 
2.17.1

