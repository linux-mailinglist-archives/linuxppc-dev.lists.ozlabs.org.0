Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 572092465BC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:54:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVXWp0RM8zDqVT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:54:14 +1000 (AEST)
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
 header.s=20161025 header.b=tnVY62Mm; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVScG5fW1zDqTG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:57:50 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id x25so7913340pff.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UTSOhqNL5HstpQGSytQ69KLhEIvbIwMRL+50xoY/d1A=;
 b=tnVY62Mm3nYGST0oeSTRXyKqQJ1c+CoCCnUIazPPvCz2Zyx5i9VDNgtHhs66n21pZw
 P4WQK0kqDNCBQLWx79G6o67dpbwJPhWt+17dc0HsrLgkWerecLg4kU1AIkrwQFslBYBa
 lo6RK50/eqXjea5NQ6H/qmPJ5d/LhTJqcY5Wvpy4eRiJzPb6/1l1l/XqqBulYx6AA8Rn
 b4E5GwDvHlrlvoROyLH70MCyMvgwQ9Ma/CkCSLmwzyT1Lc4KAPigBb5KhVbbv3w22pje
 /GE4J6Iy8M24q00gdPEdDZwI0qp52uLP2AUdBjM2NmPmIQ7TYyAvbBumeE8H6Z/ojew0
 JD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UTSOhqNL5HstpQGSytQ69KLhEIvbIwMRL+50xoY/d1A=;
 b=INL7J/1D6xSE5gmyhk1aG8akqzF5WwA8qALXAxNvk9HExQWrMXw6/JGayDGpGpQf5k
 Q/83BKhSouB+dRz+A2/Vhy1YTN878bX2QFM7PbpATye7s9L8eAcOpRhYoIh34jn/5QRm
 IdWv/S5S++Wc3LYaqQ3nV25L53fV2mLcD6TTJtvGXLlLz9d0YJCADLW4zXId6TjxrQ0a
 iOOHnSN0e/jrusc88jwGkq0lbk1pI35VdpqaXd3asR4GF+zTKcdg1bJr8pNyfI1C31No
 hny/0jifXrtGzGnkN4nBtbgQyZ1MAUReBM4fW6V1/4iW/YKgnDUKKYgg9otTI6VJtR4p
 9wqw==
X-Gm-Message-State: AOAM5309eWzJkHgdU2gLvCaDL2OiKxjv+tlXFORu7cMUjvEWC4i+yXlw
 YnBC5WYJVqUrxHq043thlic=
X-Google-Smtp-Source: ABdhPJyfL9kjLJ5laRAS5+b9JXqWdLH4UWSLPWaVE24ZUuM9BF3zE8Ke4dRt9cpQCFIksdK7gJHV4w==
X-Received: by 2002:a62:c582:: with SMTP id j124mr10929426pfg.21.1597654668407; 
 Mon, 17 Aug 2020 01:57:48 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:57:47 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 05/10] sound: rm9652: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:26:58 +0530
Message-Id: <20200817085703.25732-6-allen.cryptic@gmail.com>
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
 sound/pci/rme9652/hdsp.c  | 6 +++---
 sound/pci/rme9652/hdspm.c | 7 +++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 227aece17e39..dda56ecfd33b 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -3791,9 +3791,9 @@ static int snd_hdsp_set_defaults(struct hdsp *hdsp)
 	return 0;
 }
 
-static void hdsp_midi_tasklet(unsigned long arg)
+static void hdsp_midi_tasklet(struct tasklet_struct *t)
 {
-	struct hdsp *hdsp = (struct hdsp *)arg;
+	struct hdsp *hdsp = from_tasklet(hdsp, t, midi_tasklet);
 
 	if (hdsp->midi[0].pending)
 		snd_hdsp_midi_input_read (&hdsp->midi[0]);
@@ -5182,7 +5182,7 @@ static int snd_hdsp_create(struct snd_card *card,
 
 	spin_lock_init(&hdsp->lock);
 
-	tasklet_init(&hdsp->midi_tasklet, hdsp_midi_tasklet, (unsigned long)hdsp);
+	tasklet_setup(&hdsp->midi_tasklet, hdsp_midi_tasklet);
 
 	pci_read_config_word(hdsp->pci, PCI_CLASS_REVISION, &hdsp->firmware_rev);
 	hdsp->firmware_rev &= 0xff;
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 0fa49f4d15cf..572350aaf18d 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -2169,9 +2169,9 @@ static int snd_hdspm_create_midi(struct snd_card *card,
 }
 
 
-static void hdspm_midi_tasklet(unsigned long arg)
+static void hdspm_midi_tasklet(struct tasklet_struct *t)
 {
-	struct hdspm *hdspm = (struct hdspm *)arg;
+	struct hdspm *hdspm = from_tasklet(hdspm, t, midi_tasklet);
 	int i = 0;
 
 	while (i < hdspm->midiPorts) {
@@ -6836,8 +6836,7 @@ static int snd_hdspm_create(struct snd_card *card,
 
 	}
 
-	tasklet_init(&hdspm->midi_tasklet,
-			hdspm_midi_tasklet, (unsigned long) hdspm);
+	tasklet_setup(&hdspm->midi_tasklet, hdspm_midi_tasklet);
 
 
 	if (hdspm->io_type != MADIface) {
-- 
2.17.1

