Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7564011
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 06:27:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45k5kZ6fK5zDqXN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 14:27:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=hariprasad.kelam@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hUE1adA9"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45k3Lq10YkzDqY5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 12:39:57 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id i8so409552pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2019 19:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=eYXNQQatx5CsTvcWnAhx8hozPNi1nTqqLqSrJNAWy6w=;
 b=hUE1adA9ehAy7iETpmQ8DNp3I53GbtbDOpYXs19uYfbIeOI7Jh7sZe4hHXjymkDZQs
 hZ7qW12GR1twmIEm7NT3T5lAYCepIFPOe6U95PJ+OlUGT2SUkGj3GnbMI7Cbgo5ITSd9
 J0D//1L6lMdg0qoHBdNNCnVl7GJ4obVkGLHFIVI2XXykumF67E0odyhvCX+38mqcfvwT
 mtJkBJQcqD3C+B+RGOfaCary++05pvc1tRN4x21wktTQT+JvgntqaPM+0E/XZC9ib5MR
 HKo0gX0SrwvcuRgRss3BufISgUN28PS40ArtDEVC4WqOk5GlvdO7pwf/Gv1A5Dsam3yh
 c7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=eYXNQQatx5CsTvcWnAhx8hozPNi1nTqqLqSrJNAWy6w=;
 b=e2aurpvjk9C7AfPG/oKUOU6oJP0ZLYslNJ4QrEj8Mj94o1lOyjn2D6oWQWbEBeeeIS
 nbtDNJGBnnnZxgf6Tsqz0f8ARQjjKjUeFwsG6Xpn4SfxIvft+j2xeDMhgqIzWa28UbfV
 CfNdUmbCBg7bqLLou7NcU24gn23mokB8HRciY/bdJK3PxctU8LnTGlLpfqNltN+6WCOl
 7zxBhduCrjB3QNm+pJUhNo7CImzL8Iny82M/T/Sgk/yjgSKgpdU5dWwl/ubACwEFCZ4E
 Xj6sCJxFf11rFt/12oa4d2E8RSl3yfAiq5DtqXfBsaODJ1AnPYoOQLsRkZj4l2v6PIyl
 2I9A==
X-Gm-Message-State: APjAAAWo2GjKyS0Kk6BPXZoeDtp8AVD2KRAssgHCxKitrHMlZxQGJOTu
 zO0AO4ZgwYoARixoVc3wI9w=
X-Google-Smtp-Source: APXvYqzV4cvph+x4iw9QnWrbLU+PYZ7pHPVu5gaXf5zLuHL5eAGc0SdNKwVpnfRK/oSfv6jyQqrQ8A==
X-Received: by 2002:a17:90a:fa07:: with SMTP id
 cm7mr3831866pjb.115.1562726392001; 
 Tue, 09 Jul 2019 19:39:52 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id x12sm360063pgj.79.2019.07.09.19.39.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 19:39:51 -0700 (PDT)
Date: Wed, 10 Jul 2019 08:09:46 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Geoff Levand <geoff@infradead.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] sound: ppc: snd_ps3: Remove Unneeded variable: "ret"
Message-ID: <20190710023946.GA15604@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Wed, 10 Jul 2019 14:25:57 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch fixes below issue reported by coccicheck
sound/ppc/snd_ps3.c:631:5-8: Unneeded variable: "ret". Return "0" on
line 668

We cannot change return type of snd_ps3_pcm_trigger as it is registered
with snd_pcm_ops->trigger

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 sound/ppc/snd_ps3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
index 71b7fd3..c213eb7 100644
--- a/sound/ppc/snd_ps3.c
+++ b/sound/ppc/snd_ps3.c
@@ -628,7 +628,6 @@ static int snd_ps3_pcm_trigger(struct snd_pcm_substream *substream,
 			       int cmd)
 {
 	struct snd_ps3_card_info *card = snd_pcm_substream_chip(substream);
-	int ret = 0;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -665,7 +664,7 @@ static int snd_ps3_pcm_trigger(struct snd_pcm_substream *substream,
 
 	}
 
-	return ret;
+	return 0;
 };
 
 /*
-- 
2.7.4

