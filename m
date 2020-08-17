Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC072465B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:50:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVXRX3p5BzDqV7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:50:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=allen.cryptic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e1cZQ4ub; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSbx4blHzDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:57:33 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id c6so7495720pje.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GYPUX223cEk7sfseKTxO6Wl2a86PZnTF5NOlEuFwhHI=;
 b=e1cZQ4ubmOyb/7m500QwlXNssWIHPs/Q6N0IXUiEuPicA0waQPM4rXDUgS7oGR1Qi5
 SxkjfKNWKAdDGf6wQs8A5OntcwIGD6wJ5R4FQSDrNtT46ITVL+EnIO0dBjRhPZ31NI+9
 xcBpGocniVNBTR3H6kqL1Om6YbYXsebwlyln067CWz+8PoKojJEszmQQbUKxcEP459M2
 iBXIB5ZyzBj56xcaODPTZYpADcPDMshAIby+J/sslm3j9yQN7gB6mhZ2XsW+ifVENTAz
 BLGumgFxMoG1PEiJKxXhZH7jwu32FIbUgdIGMW2GH6TsGWDQB5JTr1WO/Xy+NbOkTUR5
 mxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GYPUX223cEk7sfseKTxO6Wl2a86PZnTF5NOlEuFwhHI=;
 b=MfyJvvj99b7VjLxN7KBdy/aq+N0epNi7ig4ItCLZXVXWDUwxIMSXPFi9YnCktxCLr/
 cUK7U1nCGER/w08hzRefuo4jZ8IgHbxgfLRK/y8ohQanGcMhYvcag9+lgv4RDekAvPjZ
 bmV+cwO45EXBDlRyJ36MDPmeSxvYbjB3fNyS1/XaclTHJcWtqJkMtpdnyKghO7s5SD1M
 vFK604DQ7XWqAhRtUZhbG96fQAgOvHRIjyWiSK2ytC1+qpBTyta8CllN5/oiWx4OkJ/b
 F8AhWIvANXIkA6XB4F54mLhRlWmtonG0IHqJa95ma8omwPbNhhnKJoOVHdlWHmWZQzCn
 d9TA==
X-Gm-Message-State: AOAM5310iN+tbQNv0PjLccRz2mf37VjdrW+4V02MSK41mwe9mqtdyS5U
 0hxSucOnsnWPJQkL00CwyQA=
X-Google-Smtp-Source: ABdhPJwIJG3YXsNl5fJt9BlQ6Vtf6Rc8gfiB60iBmkaUop2zKiVr9jOHcWia3jkqjMEsJzNj8Bm4+w==
X-Received: by 2002:a17:902:9e04:: with SMTP id
 d4mr10015126plq.296.1597654650775; 
 Mon, 17 Aug 2020 01:57:30 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:57:30 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 03/10] sound: asihpi: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:26:56 +0530
Message-Id: <20200817085703.25732-4-allen.cryptic@gmail.com>
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
 sound/pci/asihpi/asihpi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 023c35a2a951..35e76480306e 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -921,10 +921,10 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 		add_timer(&dpcm->timer);
 }
 
-static void snd_card_asihpi_int_task(unsigned long data)
+static void snd_card_asihpi_int_task(struct tasklet_struct *t)
 {
-	struct hpi_adapter *a = (struct hpi_adapter *)data;
-	struct snd_card_asihpi *asihpi;
+	struct snd_card_asihpi *asihpi = from_tasklet(asihpi, t, t);
+	struct hpi_adapter *a = asihpi->hpi;
 
 	WARN_ON(!a || !a->snd_card || !a->snd_card->private_data);
 	asihpi = (struct snd_card_asihpi *)a->snd_card->private_data;
@@ -2871,8 +2871,7 @@ static int snd_asihpi_probe(struct pci_dev *pci_dev,
 	if (hpi->interrupt_mode) {
 		asihpi->pcm_start = snd_card_asihpi_pcm_int_start;
 		asihpi->pcm_stop = snd_card_asihpi_pcm_int_stop;
-		tasklet_init(&asihpi->t, snd_card_asihpi_int_task,
-			(unsigned long)hpi);
+		tasklet_setup(&asihpi->t, snd_card_asihpi_int_task);
 		hpi->interrupt_callback = snd_card_asihpi_isr;
 	} else {
 		asihpi->pcm_start = snd_card_asihpi_pcm_timer_start;
-- 
2.17.1

