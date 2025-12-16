Return-Path: <linuxppc-dev+bounces-14799-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 866D7CC1D7F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 10:43:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVsRt0SxNz2yFl;
	Tue, 16 Dec 2025 20:43:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=94.100.132.223 arc.chain=hornetsecurity.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765878185;
	cv=pass; b=MUxXj7SB7qSjaPpFH7X3cXVCn/A/VJ5WwH2+p7Hovv7sH/XGa+GFeU9N6s1X92Y9kJ6xzXnMY0g36WC7tD+bq75mWGddCgF6xHMSuJKk/fTBHs0icN6uOhgdpNyHpTkt1ZDwWDcsKg+yqkt2HdrtvLW25iwMbf5CXgL1mvIkj1bUcGWCxaMU77WL5FA0FyFUUa5t2YWwAijDCEJUMk5z6HyhcbxzjJGNiWWJFI9XhBLxFshqTGV/wetS4LiFzVWbIXdXAmTVED6+QluzzShMIPaU3djcl3w1wxtXK0UJMeaUku3hr1OE+rgD29rMqZONcvnUBiBoE+J6TxzZ+HFc+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765878185; c=relaxed/relaxed;
	bh=ovoJqqhJNNok/jE+Du/MsX3X1g749zrPIb6xZ7a89aU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+ml05gbcmLMnWdSsjwaJtkmP79tCoHflAvWEzZ88Q5j/hCGWXoUtRMsqjmN6x/6qmP5OANuKhOJnbtzsByoXqScuTf5qBPDfIptGOSde27Xd8ieOAoyArLZwjdpRYiG3rzCUM41WVp1GRsesh916kxj9PF8vt95bYaLCgsUtxxheWatlD6ozOcwyxW/1FVlMm5UH0NpSY9oJbA5a59vsSmEKJzvXu6VuZnBl0RzMpf/Wn7CAT9IxpPm5DBap/Lc9zhtdnHk71fTCBRt19L/PwZbP5RxyfgqAxrnd8bMJQKEgtGrNtXY9MQgRuXvrDR00hchwd9zJYE/43LDRL8nSw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=hse1 header.b=mjCu/nTk; dkim-atps=neutral; spf=pass (client-ip=94.100.132.223; helo=mx-relay23-hz1.antispameurope.com; envelope-from=prvs=04384a72e4=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org) smtp.mailfrom=ew.tq-group.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=hse1 header.b=mjCu/nTk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=94.100.132.223; helo=mx-relay23-hz1.antispameurope.com; envelope-from=prvs=04384a72e4=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org)
Received: from mx-relay23-hz1.antispameurope.com (mx-relay23-hz1.antispameurope.com [94.100.132.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVsRr6gm5z2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 20:43:04 +1100 (AEDT)
ARC-Authentication-Results: i=1; mx-gate23-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ovoJqqhJNNok/jE+Du/MsX3X1g749zrPIb6xZ7a89aU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765878062;
 b=XLTizbvJNIYdbfpAfhIYNbvDz28FOPLx1THLbR3j6/MB61RjDvNUKCvwmQYjew1fCXMxX7zh
 WH8fvCjATmX6OjeLb+gbMjI32L6WlXMX78wMxWCxWFUOY1b7Z4qXwJwpWbdR9CMAfkGNJRQ1WZZ
 WH8IyoW0rytLT6nROU6Gyu8oflTvZpryeRomuU55Gb3fIMEUD76HHeiP6Q8o7yxpvjwmyqStNdS
 56j44PqDbabnBDWmVe6ZtnAO/rgxHUUhKhPf49Vau+51QBzJbeTp9TShiOoyoe43iS2y0rBihSi
 otAL9k/EuoRQIFxABYXQpEa9vmdmNx+exw/j43xQIjgGw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765878062;
 b=hOnmXGVeZkzLDcpx7KCG6BOvw0epVl60O0xEAlYFaJRRiZW5t8gIg7uXM49Qig/FvHmsGPlB
 NbKXuA4+DJXLgMBHFpEMqbXNyDa/I60+5A+wYTQY/a/E7U7OyfLi9fBgee/3gfe8zpTa0v8cBqG
 Y2y+5gY6XCActq9nzk0mhsj5SY0BHERJ8QKEzy1nN+EyIEJhj9wiZspUisAYpT14H/fpPoJBdDa
 9T5ji7rLeIwICKTRSUTfraMYShckY5CnDu2v08FV/2jGhLPQEhoNS9+URg0kocgRNVlQ96yvsGi
 S8mgWeV3yUqh1Lg2VMrLt06a0t41LKcxJZ5yBe84EhEuQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay23-hz1.antispameurope.com;
 Tue, 16 Dec 2025 10:41:02 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8BFA15A0BD9;
	Tue, 16 Dec 2025 10:40:48 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: fsl_easrc: fix duplicate debugfs directory error
Date: Tue, 16 Dec 2025 10:40:42 +0100
Message-ID: <20251216094045.623184-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216094045.623184-1-alexander.stein@ew.tq-group.com>
References: <20251216094045.623184-1-alexander.stein@ew.tq-group.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linuxppc-dev@lists.ozlabs.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay23-hz1.antispameurope.com with 4dVsPF1mXsz4NHfD
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security:scantime:2.062
DKIM-Signature: a=rsa-sha256;
 bh=ovoJqqhJNNok/jE+Du/MsX3X1g749zrPIb6xZ7a89aU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765878061; v=1;
 b=mjCu/nTkp9hRdiOxZZop7mKh0PwV+SlGbb+3U/sotk3MHxcMqFfQvW4A46pw2yN6jT9WcElp
 kja5hmyslMfzyhxaN4zj488bOQhcF+CyArY1ysImUdQu3cGx1R/PHFo3Ut2tjPwMerprlMKhRpO
 sr2lPraBCMreKEt10p269cvcon6KuLI5Hie6PIkfE+uterynk9LfDTmEJ5CmEZEgoKLDF6Yb9Jj
 1Y1JFrJCSzW37e/9GD3w/BTVpBVOEQxO4yRGyzwnd8jpo0W/CkyR/vGUK+3fcps9B1dhOHSfrFN
 0GwrLr6Av6Si949ZgRAqES9lJ/fr8m42p45EFPTzeAKDg==
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This driver registers two components: asrc and easrc, both attached using
the device name as component name. Eventually debugfs directories with
identical name are created in soc_init_component_debugfs(), leading to
error message:
  debugfs: '30c90000.easrc' already exists in 'tqm-tlv320aic32'
Fix this by adding the debugfs_prefix.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/fsl_easrc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index f404a39009e1a..e64a0d97afd0c 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1577,6 +1577,9 @@ static const struct snd_soc_component_driver fsl_easrc_component = {
 	.controls		= fsl_easrc_snd_controls,
 	.num_controls		= ARRAY_SIZE(fsl_easrc_snd_controls),
 	.legacy_dai_naming	= 1,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_prefix		= "easrc",
+#endif
 };
 
 static const struct reg_default fsl_easrc_reg_defaults[] = {
-- 
2.43.0


