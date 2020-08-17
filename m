Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 638822465EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 14:05:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVXmW5JwPzDqbc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 22:05:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=allen.cryptic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ihyd3IRT; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSck1SdczDqTQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:58:13 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id mt12so7491025pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=82iyXT6DzTJGk80q+wM5oW6Nfvht/wMpYLWFiVAtXjo=;
 b=ihyd3IRTDQ2sNWvyGa48ej4ZTH5YFMTLLhjYx2kl5gFT+X/RNcDRvczG7Fv0Yt5XHd
 UhXaxJXJB3ZwAtjFDicTsBpasCmOZ4lxSVTDx42l2+qz4bLXhj8i3joztKz0oOR7nMox
 ZKMKH5IooVM1s0wcKgvBIiLNW+5PCSTlFwDhhO1fU2kc/1q9iYoK5H7FXvoRYquf1U+Q
 4csT4c+hEqMna877Fuo9FwQk6fO63aqWNuqPBXv4TFMQKMcz9MGV193UZpnv6g74OuMd
 5Nl1Pp/E0yAr9yIJzUVzt01sDnj3BXgxXNZ+wrNOqUqNixAAvQdzJBCNNwvDcg9e4s24
 qB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=82iyXT6DzTJGk80q+wM5oW6Nfvht/wMpYLWFiVAtXjo=;
 b=AkQSUiIJRuIRQl9SPEVtH21iHLYbdeBfPhkq/QuPr/yUMUjvE7bWyc0AB0bioUVQrJ
 Nw+jcaPvGh8atYxnDv/ckIpRpFGZd4xwb953ZAJU5tVoxlY4GT3rrejLF7wq2mJWJIu5
 F8UXpsRjm33ihiABsf83ZDK1WRQELEr8+pXs0rgHXliBJnhX/F7woAG6SCHyssk8vkfY
 hmwMJSqNClT08jFf583A4go6++22jqCT2I7c93HrXLUkwfjv4IOdQFSCpyqhmprsQy/f
 JiUKKGtf6EFGuDNaQ2cw1qzhhvrN0qoU7rif/UtJMpks04fqhS9MVzHz04jYqNEMlWpa
 TrFQ==
X-Gm-Message-State: AOAM530fBt9Hq6Mm56/LqgoEUIybYf91K8kLy3J1SHAfIJ0y+Rpftk4S
 haZ/rJmy4vM/HBVHYxGPeco=
X-Google-Smtp-Source: ABdhPJwmOQdDa+LVIgCsVYsGqUOJh7huV7BDongW+Nmhyb70or57kdsFY11/0oKkwXHZEeyX/z3a4g==
X-Received: by 2002:a17:90a:c28d:: with SMTP id
 f13mr8357466pjt.124.1597654692036; 
 Mon, 17 Aug 2020 01:58:12 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:58:11 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 10/10] sound: ua101: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:27:03 +0530
Message-Id: <20200817085703.25732-11-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817085703.25732-1-allen.cryptic@gmail.com>
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
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
Cc: alsa-devel@alsa-project.org, keescook@chromium.org,
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
 sound/usb/misc/ua101.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index 884e740a785c..3b2dce1043f5 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -247,9 +247,9 @@ static inline void add_with_wraparound(struct ua101 *ua,
 		*value -= ua->playback.queue_length;
 }
 
-static void playback_tasklet(unsigned long data)
+static void playback_tasklet(struct tasklet_struct *t)
 {
-	struct ua101 *ua = (void *)data;
+	struct ua101 *ua = from_tasklet(ua, t, playback_tasklet);
 	unsigned long flags;
 	unsigned int frames;
 	struct ua101_urb *urb;
@@ -1218,8 +1218,7 @@ static int ua101_probe(struct usb_interface *interface,
 	spin_lock_init(&ua->lock);
 	mutex_init(&ua->mutex);
 	INIT_LIST_HEAD(&ua->ready_playback_urbs);
-	tasklet_init(&ua->playback_tasklet,
-		     playback_tasklet, (unsigned long)ua);
+	tasklet_setup(&ua->playback_tasklet, playback_tasklet);
 	init_waitqueue_head(&ua->alsa_capture_wait);
 	init_waitqueue_head(&ua->rate_feedback_wait);
 	init_waitqueue_head(&ua->alsa_playback_wait);
-- 
2.17.1

