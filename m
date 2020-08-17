Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A8B24655F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:29:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVWzY6tFszDqTg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:29:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=allen.cryptic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cl8bVgyV; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSXc3Px3zDqBl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:54:40 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id h12so7790951pgm.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6trBPHS9S/UpnG7t9zPTQG9eTrRzdIZ0hGY6nWo8pT0=;
 b=cl8bVgyVtDdOuybu7ntzDzVYdGgYTFj4kXvX/Q/SW7SNmWNG4ijca7Pi51LL43Gy/c
 fGmqeOrUZHiD3EXKBc/QB0aYtBdni4rBXpzCBtH6DHxHnP0p4hcHbp54foY8Sf9y5bq1
 3Jr8lSpeanDwpaxSHPeZ2vU/UrVw8OrgNvdEWSjKhiCQibLJLVl+qpOUY/i3UM8ISxRa
 VrzoCdHHjq1gC10tv6f4hGmwJF3QrZga15f8nH30xEgER7SLCE804KzeVHXGJMwIM4vn
 YEHygXBdktDk+IzpzxcEfWqY0x8wg0pO/uAHTO90jm8c860oZFr6aXzGTj603h7Tb52o
 BUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6trBPHS9S/UpnG7t9zPTQG9eTrRzdIZ0hGY6nWo8pT0=;
 b=UYMQaouFtzcIWxEyUMFdO1tMvHDEVLOFwwyRQSXqCqWanwL8wVnzd+AeUPdOix3IZW
 W7MSMYfJKXSr50OW48ik11QjZT6Irdu90NvkBForOMOu5bj72FBRvxzTgYWQrQOWuadB
 hIWqomDap3cGtQ1PbkNaqGQjKPbcEgAcQUYOXTJ4r4q9v7I0d/3SJkRyWByLS3HphqT/
 h6joY6RZ9pUjBHEnIngjnMd8x9YJHuh5aEe1JktAmvdbDLBxIW4LH0N6dtG0AjHT6VK8
 eufV9gicCgcz5ZHTbDu9gqKZDh3ZmtnM0yEoYRPxGbEC4mOLgN13cR0hHkfZGTCCk0kN
 jQLg==
X-Gm-Message-State: AOAM532/d3+C0IUMHk5B4z01wefWhwG+H0F28K09f/LMdF+oZhbog4bz
 BWHLjfkSY3D1XIMMUER4HPw7X5jl7vmJrg==
X-Google-Smtp-Source: ABdhPJwjAV9PFZKFZKeGA8kArDIlyD0PRcA0bJOuTXRTyct2hX3bCII6uKRIp7rPH/jH1Bjpszui/A==
X-Received: by 2002:a62:52d6:: with SMTP id
 g205mr10856808pfb.144.1597654477011; 
 Mon, 17 Aug 2020 01:54:37 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id x12sm18236990pff.48.2020.08.17.01.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:54:36 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: jejb@linux.ibm.com, martin.petersen@oracle.com, kashyap.desai@broadcom.com,
 sumit.saxena@broadcom.com, shivasharan.srikanteshwara@broadcom.com
Subject: [PATCH 2/8] scsi: esas2r: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 14:24:03 +0530
Message-Id: <20200817085409.25268-3-allen.cryptic@gmail.com>
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
 drivers/scsi/esas2r/esas2r.h      | 2 +-
 drivers/scsi/esas2r/esas2r_init.c | 4 +---
 drivers/scsi/esas2r/esas2r_main.c | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/esas2r/esas2r.h b/drivers/scsi/esas2r/esas2r.h
index e30d2f1f5368..b99434e24868 100644
--- a/drivers/scsi/esas2r/esas2r.h
+++ b/drivers/scsi/esas2r/esas2r.h
@@ -992,7 +992,7 @@ int esas2r_write_vda(struct esas2r_adapter *a, const char *buf, long off,
 int esas2r_read_fs(struct esas2r_adapter *a, char *buf, long off, int count);
 int esas2r_write_fs(struct esas2r_adapter *a, const char *buf, long off,
 		    int count);
-void esas2r_adapter_tasklet(unsigned long context);
+void esas2r_adapter_tasklet(struct tasklet_struct *t);
 irqreturn_t esas2r_interrupt(int irq, void *dev_id);
 irqreturn_t esas2r_msi_interrupt(int irq, void *dev_id);
 void esas2r_kickoff_timer(struct esas2r_adapter *a);
diff --git a/drivers/scsi/esas2r/esas2r_init.c b/drivers/scsi/esas2r/esas2r_init.c
index eb7d139ffc00..55387c14fb8d 100644
--- a/drivers/scsi/esas2r/esas2r_init.c
+++ b/drivers/scsi/esas2r/esas2r_init.c
@@ -401,9 +401,7 @@ int esas2r_init_adapter(struct Scsi_Host *host, struct pci_dev *pcid,
 		return 0;
 	}
 
-	tasklet_init(&a->tasklet,
-		     esas2r_adapter_tasklet,
-		     (unsigned long)a);
+	tasklet_setup(&a->tasklet, esas2r_adapter_tasklet);
 
 	/*
 	 * Disable chip interrupts to prevent spurious interrupts
diff --git a/drivers/scsi/esas2r/esas2r_main.c b/drivers/scsi/esas2r/esas2r_main.c
index 7b49e2e9fcde..7ffa9406ab4d 100644
--- a/drivers/scsi/esas2r/esas2r_main.c
+++ b/drivers/scsi/esas2r/esas2r_main.c
@@ -1546,9 +1546,9 @@ void esas2r_complete_request_cb(struct esas2r_adapter *a,
 }
 
 /* Run tasklet to handle stuff outside of interrupt context. */
-void esas2r_adapter_tasklet(unsigned long context)
+void esas2r_adapter_tasklet(struct tasklet_struct *t)
 {
-	struct esas2r_adapter *a = (struct esas2r_adapter *)context;
+	struct esas2r_adapter *a = from_tasklet(a, t, tasklet);
 
 	if (unlikely(test_bit(AF2_TIMER_TICK, &a->flags2))) {
 		clear_bit(AF2_TIMER_TICK, &a->flags2);
-- 
2.17.1

