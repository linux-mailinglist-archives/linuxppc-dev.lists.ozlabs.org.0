Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07F24661A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 14:14:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVXyd5dZmzDqWj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 22:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=allen.cryptic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mJ5F5yld; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSjp11C1zDqTG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 19:02:37 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 74so7890283pfx.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gm2DPvF4/I64ZAeUJOgSkbWKhyOzAElLnGagSu5aOZE=;
 b=mJ5F5yld6XickAHkvpBb6JckeIwY+bA+85siQwV3lN0jaztwnK365EyFRr/uQvz1yk
 XO0zlZv6rWVSyY8Dhd0gGIenv3YPdwJN3G69408jkglbW+u68hu8IBKc40WjDTLyTggH
 3RhPklarqCEx0e+sEHZ5XJET0lGsJEgbuSlU6OFZbJsF6sORYH51Iqccd1QD4gdYl3wo
 XcmGgxA0zhWX3i7FAwXWRRt7OAzBVmSsDo4xFkuLn1PyFan6fPqLb14InRHksPqD1Rm1
 I0ggraWJpV8DM9XeC34rrApCjEQGSgmlQ4ww4ZDkE19y+PJLZdca3xC1Waq5EHb4j4ZC
 ekaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gm2DPvF4/I64ZAeUJOgSkbWKhyOzAElLnGagSu5aOZE=;
 b=fCYxqKgCRNbCzunKaKsfAtwADsPNFau5qcZYUBauZzTt5a5DuKGUF4rioUdi7/7MOL
 vedrpDc7BXNnmnqpYAr8PVetduWTISNVyfw+0ERzvCEV3R3TCqSeUFRzIri6TGofZGmB
 MABU2HPrHiuvj68inRF2nDLWKbFVP5N8mgS7xtWD072d8GVWtwkUtLDPYZep0WJ/QXZM
 Nr9mimvALxJXzPSh4vK2NvUkVPMKrJOwl590hNao/4TcZRfPljTXgKDoJweyFHIZAm7S
 nLj+7nVB4nZYt4bvZ9DiNMhBfGf+lX0G8EyngUvoEbIkI7Vm8UHBULTeiSWPzgGOAjTj
 U9hQ==
X-Gm-Message-State: AOAM530c9J1Xbmcgs/z0r462RSmGS3djLiTrfc7MP67pJCjphHVxLNZB
 EDeE7BNubgk7lRkkbHmPH68=
X-Google-Smtp-Source: ABdhPJzaHBXW6zQTImjBsJ8W8K4gYkr4wCtwsNf4qlxo3NDdA8id6na2HB0/9zVB74dwUb98LkWYLg==
X-Received: by 2002:a65:408c:: with SMTP id t12mr9819753pgp.204.1597654954303; 
 Mon, 17 Aug 2020 02:02:34 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id f3sm19488238pfj.206.2020.08.17.02.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:02:33 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: duncan.sands@free.fr, gregkh@linuxfoundation.org, jacmet@sunsite.dk,
 balbi@kernel.org, leoyang.li@nxp.com, johan@kernel.org
Subject: [PATCH 2/7] usb: c67x00: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 14:32:04 +0530
Message-Id: <20200817090209.26351-3-allen.cryptic@gmail.com>
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
 drivers/usb/c67x00/c67x00-sched.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/c67x00/c67x00-sched.c b/drivers/usb/c67x00/c67x00-sched.c
index f7f6229082ca..6275cb77a15b 100644
--- a/drivers/usb/c67x00/c67x00-sched.c
+++ b/drivers/usb/c67x00/c67x00-sched.c
@@ -1122,9 +1122,9 @@ static void c67x00_do_work(struct c67x00_hcd *c67x00)
 
 /* -------------------------------------------------------------------------- */
 
-static void c67x00_sched_tasklet(unsigned long __c67x00)
+static void c67x00_sched_tasklet(struct tasklet_struct *t)
 {
-	struct c67x00_hcd *c67x00 = (struct c67x00_hcd *)__c67x00;
+	struct c67x00_hcd *c67x00 = from_tasklet(c67x00, t, tasklet);
 	c67x00_do_work(c67x00);
 }
 
@@ -1135,8 +1135,7 @@ void c67x00_sched_kick(struct c67x00_hcd *c67x00)
 
 int c67x00_sched_start_scheduler(struct c67x00_hcd *c67x00)
 {
-	tasklet_init(&c67x00->tasklet, c67x00_sched_tasklet,
-		     (unsigned long)c67x00);
+	tasklet_setup(&c67x00->tasklet, c67x00_sched_tasklet);
 	return 0;
 }
 
-- 
2.17.1

