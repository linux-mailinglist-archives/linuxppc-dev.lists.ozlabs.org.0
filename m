Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B782465AD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:48:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVXPR6jtVzDqWq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:48:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=allen.cryptic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MTaQvUr+; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSbr4kv0zDqJW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:57:28 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id g15so3273220plj.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Th97jQWizU+MR3H8KsmSgYMMcn/Wb6U+3t12llCRyTA=;
 b=MTaQvUr+9I4xHzCOKxRhJIanXnw2ADB+kr39T+fF3C6zzpdo9HLs+qL1IBLzK3SWKB
 kFHMeMi42mIMhCMgjlyKh1EueKFLpcVlc8KJaH9AsB2CgfbL8z1QOikA4G/51O3uLe77
 DBNBkRaC4c9aHaiHeJRkntRZzD6pcFUC4LRM0rBw9zBPm9uYhdb+O+8U/f3j32qtI0ni
 jvm1avJSfp92oDURGAVXZ7Ca2+81BpCwthDzlFy+8XwoIPTqoj0wjs9XosDd8C3xwMjg
 Hl1KkmqbTOv/c8leI+BpaR/Yf26jJfnLHHYd9+Vvmj7bzbmoK6NGqZopyx27BtqEJESx
 Z2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Th97jQWizU+MR3H8KsmSgYMMcn/Wb6U+3t12llCRyTA=;
 b=K2Zrw4MEAyju1DcBbMLTN07GYxW4LXep3WJ/rbeUQdqRk50Y1jmU01jQHdrNQCaW1e
 E8CPCc0fha+kbpPVOa8sOmAqwmAILYF5KlBDG58LNs22J92XEObHzxYSpoqjdi6Pmgpz
 EETnYvg+hLjtpjO1GLO1irO87JmaGc8kz0myz7B5t215hLXC96JFztXEJMe05A9B7OGU
 AoEa8WGd9DwcSCpxsbkTxEItQ7Kiw/yYofAGqqwheg5j1xyt5zQtfr+i1YMHXnSdu/13
 mz9yoIhqh4oC8d8QwST/ll1H/QAiLDJqFC1YtrhZTOZZTojntaNC/YDbijrL+t7o23Y8
 j+/g==
X-Gm-Message-State: AOAM531dc61pkvO7+Fkg0sZC/ArY1+HA4zCVtsQ57hUKJZsXSdK6jTYd
 RSNAj8+S325okvhr/V0elGs=
X-Google-Smtp-Source: ABdhPJw65ZcmjWOmkFF4uogzLH35eLQ8onzgQaFSgowQsSRLWB/e35uC7LQ7y1Dc63+SWTav/W5nlA==
X-Received: by 2002:a17:902:323:: with SMTP id 32mr2946718pld.59.1597654646463; 
 Mon, 17 Aug 2020 01:57:26 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:57:25 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 02/10] sound: firewire: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:26:55 +0530
Message-Id: <20200817085703.25732-3-allen.cryptic@gmail.com>
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
 sound/firewire/amdtp-stream.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index f8586f75441d..ee1c428b1fd3 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -64,7 +64,7 @@
 #define IT_PKT_HEADER_SIZE_CIP		8 // For 2 CIP header.
 #define IT_PKT_HEADER_SIZE_NO_CIP	0 // Nothing.
 
-static void pcm_period_tasklet(unsigned long data);
+static void pcm_period_tasklet(struct tasklet_struct *t);
 
 /**
  * amdtp_stream_init - initialize an AMDTP stream structure
@@ -94,7 +94,7 @@ int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
 	s->flags = flags;
 	s->context = ERR_PTR(-1);
 	mutex_init(&s->mutex);
-	tasklet_init(&s->period_tasklet, pcm_period_tasklet, (unsigned long)s);
+	tasklet_setup(&s->period_tasklet, pcm_period_tasklet);
 	s->packet_index = 0;
 
 	init_waitqueue_head(&s->callback_wait);
@@ -441,9 +441,9 @@ static void update_pcm_pointers(struct amdtp_stream *s,
 	}
 }
 
-static void pcm_period_tasklet(unsigned long data)
+static void pcm_period_tasklet(struct tasklet_struct *t)
 {
-	struct amdtp_stream *s = (void *)data;
+	struct amdtp_stream *s = from_tasklet(s, t, period_tasklet);
 	struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
 
 	if (pcm)
-- 
2.17.1

