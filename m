Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB938246668
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 14:32:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVYMP4gFPzDqbt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 22:32:01 +1000 (AEST)
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
 header.s=20161025 header.b=UGys9s0c; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSkD5K6bzDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 19:03:00 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id g33so7807019pgb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xXbF1OGSfwps8eIxFqyJWCOGFrRBRoS9IAapxWYH5tU=;
 b=UGys9s0cH3XJ7ytiyAvyHhECfx/sgE7VT+4dU+PFtuVRKYibSk4ZdfmReJ5RHeo4oB
 cE77BSIVRi+aL2qPqpPHpFAR1LSBTrzvNNl5+1z2oukApZE2Lh0c8Y3/yCTaGn1btkI3
 DvfBXKhyn1mhWjbBF8kHKW4euTK7Ux3RSg5XFcHWLBm6Ex4WbXmFJRsy6oz8LHIem23T
 s/vVZgJ8dTQWc7edHye0v87zndklTmo3yTfDJa2KJhz3KKYSGaQVeY4NJka4LW2TDcnd
 io8PK2w/yoaTYclhmldJ4rX2kkhp+HrYmndLi4PUVEPGGhD9ac4NWIc9Y4RAyWFd0HTP
 8flQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xXbF1OGSfwps8eIxFqyJWCOGFrRBRoS9IAapxWYH5tU=;
 b=Ayk9p8Ij0Mh2QApSpJ9NSu4B1YcYi2wJN+wMtSO50gQcWwbTM9HOXB1Lqcj7C9NWLo
 UAxbAIaeYvg7J4vryTE5KPDvbuQMhv8sJJfInI2FEzuKJAMjBHj66Wq4DJRomvywlIa9
 Z6aO+u+EU3/PnEpplTyu9cZNcaZHRKS6cHvINve42yWtljQwy85RVSLGGcgjzi8fHDH8
 fpMiuVhCB1kEPCeYVDsmG7Gj15VZhoFBmRoPt7YoKBZpg9XjRGCnZvD4UCtH67K8wL0l
 FmWxeM+ADLjkOR/ODvLcsX0Bh45ynCrs08QWDTZyv3PcsYbjaSWU05544agql793W0ui
 PqLA==
X-Gm-Message-State: AOAM5300PgThf0o/Quks5OHhR32Vb0jGBa+/3LynGP8SlXIMyIo3dylf
 ivTZMrZ5S9XMqex+dlltbmE=
X-Google-Smtp-Source: ABdhPJxAkXUAop1wEFaah3YAPnjGLxZjtihx6qYBEHA3JVTfQ+jUGc2wTge02f2yvKEBQPSGJto8nw==
X-Received: by 2002:a62:3856:: with SMTP id f83mr10808398pfa.35.1597654978435; 
 Mon, 17 Aug 2020 02:02:58 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id f3sm19488238pfj.206.2020.08.17.02.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:02:57 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: duncan.sands@free.fr, gregkh@linuxfoundation.org, jacmet@sunsite.dk,
 balbi@kernel.org, leoyang.li@nxp.com, johan@kernel.org
Subject: [PATCH 7/7] usb: mos7720: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 14:32:09 +0530
Message-Id: <20200817090209.26351-8-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817090209.26351-1-allen.cryptic@gmail.com>
References: <20200817090209.26351-1-allen.cryptic@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 21:23:58 +1000
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
Cc: keescook@chromium.org, linux-usb@vger.kernel.org,
 Allen Pais <allen.lkml@gmail.com>, linux-kernel@vger.kernel.org,
 Romain Perier <romain.perier@gmail.com>, linuxppc-dev@lists.ozlabs.org
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
 drivers/usb/serial/mos7720.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index 2ec4eeacebc7..5eed1078fac8 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -282,11 +282,12 @@ static void destroy_urbtracker(struct kref *kref)
  * port callback had to be deferred because the disconnect mutex could not be
  * obtained at the time.
  */
-static void send_deferred_urbs(unsigned long _mos_parport)
+static void send_deferred_urbs(struct tasklet_struct *t)
 {
 	int ret_val;
 	unsigned long flags;
-	struct mos7715_parport *mos_parport = (void *)_mos_parport;
+	struct mos7715_parport *mos_parport = from_tasklet(mos_parport, t,
+							   urb_tasklet);
 	struct urbtracker *urbtrack, *tmp;
 	struct list_head *cursor, *next;
 	struct device *dev;
@@ -716,8 +717,7 @@ static int mos7715_parport_init(struct usb_serial *serial)
 	INIT_LIST_HEAD(&mos_parport->deferred_urbs);
 	usb_set_serial_data(serial, mos_parport); /* hijack private pointer */
 	mos_parport->serial = serial;
-	tasklet_init(&mos_parport->urb_tasklet, send_deferred_urbs,
-		     (unsigned long) mos_parport);
+	tasklet_setup(&mos_parport->urb_tasklet, send_deferred_urbs);
 	init_completion(&mos_parport->syncmsg_compl);
 
 	/* cycle parallel port reset bit */
-- 
2.17.1

