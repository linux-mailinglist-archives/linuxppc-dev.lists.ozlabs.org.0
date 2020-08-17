Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB47024662C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 14:16:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVY1y0swrzDqPS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 22:16:54 +1000 (AEST)
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
 header.s=20161025 header.b=FyHA8htL; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSjv3r14zDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 19:02:42 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id d188so7911580pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 02:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UYpUeS1hP1RQ+3Csy0p0MaiO+KURPCHIrOFJB/W4BNg=;
 b=FyHA8htLUZywOn857O2b3757Cv66ivSRPc9IwjTSfcapfKLmK/RelgXCNMaP5JGqBO
 i38uxESUktlsz8xJ19dO5x7CAsjIPLSKuwA7DDKokU7BwobiC/Hy55dTY2JN+Tv1DXlS
 5QSARaroOX/vXTWtoibB02nZwqnjFgBnywEZmGbdZase0SJmPcAssSaXt2USCpsaUddM
 U27muHcVhsL/ZkkJxXOUtSzG1E/o91SCNKqbtP6Z1ReiQlRrZxr7yMxHXmrCrNPf/oWy
 am/DkNreNiPdfDEjWL/BAVSqViWlaub13YdRcoFpNIuFAFp8ryxD9uEx7wFoEJChMQOm
 UGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UYpUeS1hP1RQ+3Csy0p0MaiO+KURPCHIrOFJB/W4BNg=;
 b=LU7FtNRK7/5h8SKJhPxMMqVrtRocoyxaA75duVb2NMWQ+W2U6FNcgYdMlDrk/6aks2
 CfHZhCoA8rQVFdNyDS7S2EZAzvQeupDEHFjjLXRaDx/4+y38jiN5czcze6tvCvD7xscE
 43V3wSCIcMTYdixTC4JUyUpAh954JpieRg/MMjNAZFyegWzxTRuDle6/K1xYdB+FSKcz
 cP0iRBa5SzxzGLekNKT5dZIBr90jyujk5vEyBqILDItUVHtvtOLM17YkUYDgaRjDvay0
 RXsbGGrMF4dFRIsiTrCwX/byYnCA2P6LWwUe6J6WDGQQYk3kHSGVLCSoMx7UrnYpxGRY
 8NAg==
X-Gm-Message-State: AOAM530/KZxnfzpeYgUYlQ+cskuJ7gThIsAxWldySiC8ck8JaEEFqmDs
 0l2yAumLyT79ZKrLgo5YPi4=
X-Google-Smtp-Source: ABdhPJwBt3uRtZb0Uwa2zvB/TmNBTn5F7lU3QEhTXBnLLn/CWY0XT3yl+T3g4A+fKIl3zsP4X/N1hQ==
X-Received: by 2002:a62:1c86:: with SMTP id c128mr10680948pfc.78.1597654959309; 
 Mon, 17 Aug 2020 02:02:39 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id f3sm19488238pfj.206.2020.08.17.02.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:02:38 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: duncan.sands@free.fr, gregkh@linuxfoundation.org, jacmet@sunsite.dk,
 balbi@kernel.org, leoyang.li@nxp.com, johan@kernel.org
Subject: [PATCH 3/7] usb: hcd: convert tasklets to use new tasklet_setup() API
Date: Mon, 17 Aug 2020 14:32:05 +0530
Message-Id: <20200817090209.26351-4-allen.cryptic@gmail.com>
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
 drivers/usb/core/hcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index a33b849e8beb..2c6b9578a7d3 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1657,9 +1657,9 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
 	usb_put_urb(urb);
 }
 
-static void usb_giveback_urb_bh(unsigned long param)
+static void usb_giveback_urb_bh(struct tasklet_struct *t)
 {
-	struct giveback_urb_bh *bh = (struct giveback_urb_bh *)param;
+	struct giveback_urb_bh *bh = from_tasklet(bh, t, bh);
 	struct list_head local_list;
 
 	spin_lock_irq(&bh->lock);
@@ -2403,7 +2403,7 @@ static void init_giveback_urb_bh(struct giveback_urb_bh *bh)
 
 	spin_lock_init(&bh->lock);
 	INIT_LIST_HEAD(&bh->head);
-	tasklet_init(&bh->bh, usb_giveback_urb_bh, (unsigned long)bh);
+	tasklet_setup(&bh->bh, usb_giveback_urb_bh);
 }
 
 struct usb_hcd *__usb_create_hcd(const struct hc_driver *driver,
-- 
2.17.1

