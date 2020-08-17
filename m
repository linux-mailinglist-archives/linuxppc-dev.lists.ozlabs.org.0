Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 609932465D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:58:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVXd23kRPzDqB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:58:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=allen.cryptic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OyNFTefB; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVScV3R2szDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:58:02 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id k13so7156548plk.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=upmEUnhhDdxgVkgtOGQcHXFVgTj9nyWc06FqARMGISM=;
 b=OyNFTefB9dsBDrJk4+b3/O9xDgCkBGYAZEtl8e1sFe8eqB+0z37g1bXuaGh5Rz/mOV
 Vu9xGEY1MYjz55jhlzbwsAahCtRbdTz3TmGBn7sQxztPqM7rTG+RzjI3Oiny8RejrZuR
 CcmoL/IjRiGZ+ssZ2n0xgb+pW4Z6Lea77AxG5cveoSTlnxxqUI7fbOJagqytds6FoNFo
 1itqsHARb9BlloVmjtqZv2KTHfwoy66YYWvv6YpBzgnvUwBIky4PzzfF4Ms719j3PL/i
 QUcVdpfYvYncsl7g9tvyZcNhfOVL8zhRmQ4Bm1y4PBi86/ARuEB3MdIQHbhmEwr5gUVt
 g9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=upmEUnhhDdxgVkgtOGQcHXFVgTj9nyWc06FqARMGISM=;
 b=iV/wRGxCqJt8oUYNZZWi4w6VxX6uDhty3hq7j1+qBPJpVzfnW4qG7MjIzo2YQY8MQc
 KXmJjofMyNzS1DLfqqNKAd/2eQTZddnRLQ3K3y0b3+/6jnuK6cs39y4RFttywCWig9EY
 dN8W9f7rz/k3VSptEKL1rtpGiZx4LfmEmKLL1PPQpOBVOhsBGrGLHhYznOobGuKAUYBM
 B5s7QhR3f0W2YbOJ3545GZaL/LUi2TpD3+RVKYNoUddzMMbpumMuYx+iDb1is4X0BKxl
 Lr2lgWRhM2p+MooQzb6plpm18LRB3LZ9qPse8IEZUlp2X/pxYtTMVVeY2m6lXuHGL8j5
 K4Vg==
X-Gm-Message-State: AOAM5302o/gLemNyY5gab57l/4/G60WI/w1O5Dt1IGbBCS4squq6z3yI
 x465d0YDL2nqT1p2ZMNfnWw=
X-Google-Smtp-Source: ABdhPJy7woL4CHSE/M6HLZYby07kKJL7B6uvdb2M5oCEkFLXCvckJ3TLTnOJ9pzsBst4THF5+GoOoQ==
X-Received: by 2002:a17:902:ee02:: with SMTP id
 z2mr10362445plb.291.1597654679016; 
 Mon, 17 Aug 2020 01:57:59 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:57:58 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 07/10] sound/soc: sh: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:27:00 +0530
Message-Id: <20200817085703.25732-8-allen.cryptic@gmail.com>
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
 sound/soc/sh/siu_pcm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sh/siu_pcm.c b/sound/soc/sh/siu_pcm.c
index bd9de77c35f3..50fc7810723e 100644
--- a/sound/soc/sh/siu_pcm.c
+++ b/sound/soc/sh/siu_pcm.c
@@ -198,9 +198,9 @@ static int siu_pcm_rd_set(struct siu_port *port_info,
 	return 0;
 }
 
-static void siu_io_tasklet(unsigned long data)
+static void siu_io_tasklet(struct tasklet_struct *t)
 {
-	struct siu_stream *siu_stream = (struct siu_stream *)data;
+	struct siu_stream *siu_stream = from_tasklet(siu_stream, t, tasklet);
 	struct snd_pcm_substream *substream = siu_stream->substream;
 	struct device *dev = substream->pcm->card->dev;
 	struct snd_pcm_runtime *rt = substream->runtime;
@@ -520,10 +520,8 @@ static int siu_pcm_new(struct snd_soc_component *component,
 		(*port_info)->pcm = pcm;
 
 		/* IO tasklets */
-		tasklet_init(&(*port_info)->playback.tasklet, siu_io_tasklet,
-			     (unsigned long)&(*port_info)->playback);
-		tasklet_init(&(*port_info)->capture.tasklet, siu_io_tasklet,
-			     (unsigned long)&(*port_info)->capture);
+		tasklet_setup(&(*port_info)->playback.tasklet, siu_io_tasklet);
+		tasklet_setup(&(*port_info)->capture.tasklet, siu_io_tasklet);
 	}
 
 	dev_info(card->dev, "SuperH SIU driver initialized.\n");
-- 
2.17.1

