Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BC8246636
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 14:20:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVY5q69TxzDqQR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 22:20:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=allen.cryptic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qHKlQ5E6; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSjy2fLzzDqVJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 19:02:46 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id u20so7918024pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 02:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nd35gBts6NgtKlgN2lcrX3AbyIcMYWPkE6/ISk0jZVU=;
 b=qHKlQ5E6ehfBA/hV/XlchuGk9r9+52SaKrqq5Ok0Yd97+uobN4Zyvw7O82ta5goNeL
 xBfom1nx+gYLXtn94ddvCCxxNFbRp5+n7BpIbqScWc5Sw0JoTpemM2JOk0zZIl1vphfd
 vYSLMUNFAFB3b/MT+bML4I3ZeMpmF1WsGeUJTD1Qd+02T1Nw/mtUIm+qp3t4ePJJ4B6u
 BJAPaA5NLPV9itEiWAesNfBSHQtLtJW1M2iXdCwhwUujS7+WjX1iUWUQhsph56doS1MV
 lLrQ4xwvaLW6IgaxGpHG6qJpY+tYETB2W+EgCO3Y0Xub6NR4XrYDos5cc6O5jw3X9fuN
 WqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nd35gBts6NgtKlgN2lcrX3AbyIcMYWPkE6/ISk0jZVU=;
 b=oPyAkatS5I4BS+iP13DztWv/FS71a71staek+yUz7KH6nDD0DKAqxodNrmKbdNxGfY
 m25VDJ5ds7bxjYFbCkHiIrOk7F5McGcsZ+UWpqdA2Zu44nvROTerpvcuA9aVpjGpJfUV
 S99Pmdpruf4vp7FKEH2m+oUFlErf8ujsuX7XOHwobLjgVYQCnr3UUvKg3QO7MgkgtdsD
 dfSDK/s7DRbzw6jx1Pu3Inj/v6S1Ix/KKf22xRPNGKkersVPMvs81axVSX+QkjWHBwVM
 1cszFedUIj0EwQaAXK1SNGp3Mhg6GW+Pz8emUkBlvy6s4koTmzgGi8K112BkFbDTk6dY
 iyvA==
X-Gm-Message-State: AOAM533FuyEag7QnUHKGWT3xSubrMa1I+bX7UJdMlLW19uZ/qeLNjNBM
 6GZwBLzIdNXXFxjD4TVP2L0=
X-Google-Smtp-Source: ABdhPJzf4Yw256WODaILrOgLYx1TniHaJ4JHn/KjTEA/sb3iaSQaoGjAR+GXmFwEKiXhf2N63ukVKQ==
X-Received: by 2002:a63:6b01:: with SMTP id g1mr8932278pgc.192.1597654964140; 
 Mon, 17 Aug 2020 02:02:44 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id f3sm19488238pfj.206.2020.08.17.02.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:02:43 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: duncan.sands@free.fr, gregkh@linuxfoundation.org, jacmet@sunsite.dk,
 balbi@kernel.org, leoyang.li@nxp.com, johan@kernel.org
Subject: [PATCH 4/7] usb/gadget: f_midi: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:32:06 +0530
Message-Id: <20200817090209.26351-5-allen.cryptic@gmail.com>
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
 drivers/usb/gadget/function/f_midi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 46af0aa07e2e..85cb15734aa8 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -698,9 +698,9 @@ static void f_midi_transmit(struct f_midi *midi)
 	f_midi_drop_out_substreams(midi);
 }
 
-static void f_midi_in_tasklet(unsigned long data)
+static void f_midi_in_tasklet(struct tasklet_struct *t)
 {
-	struct f_midi *midi = (struct f_midi *) data;
+	struct f_midi *midi = from_tasklet(midi, t, tasklet);
 	f_midi_transmit(midi);
 }
 
@@ -875,7 +875,7 @@ static int f_midi_bind(struct usb_configuration *c, struct usb_function *f)
 	int status, n, jack = 1, i = 0, endpoint_descriptor_index = 0;
 
 	midi->gadget = cdev->gadget;
-	tasklet_init(&midi->tasklet, f_midi_in_tasklet, (unsigned long) midi);
+	tasklet_setup(&midi->tasklet, f_midi_in_tasklet);
 	status = f_midi_register_card(midi);
 	if (status < 0)
 		goto fail_register;
-- 
2.17.1

