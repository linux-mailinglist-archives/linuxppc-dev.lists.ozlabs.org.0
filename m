Return-Path: <linuxppc-dev+bounces-14797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83359CC1D67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 10:41:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVsPq0zvZz2yDY;
	Tue, 16 Dec 2025 20:41:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=94.100.134.238 arc.chain=hornetsecurity.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765878079;
	cv=pass; b=WODV55/c8pLi/DM92pK8E4AJ7mSfxxFE8gl21KluzoCZS2J6MO+or51A9/HsXocRXdXpxEW2trxz+93E+n2Lvc0YAl3Oq7YlBOKIvHEq1r5XEZ1bAaP0F7kV7qds917ze2unp8dC6MPMxM0FXYOUqnC1gSrUKuW50sm+ty9IW7aWVr/UwEYZv40OGCJSEHe0vhuBW22ofLRuX89Zrp50HXkIxA52AChqfJAP4q3F0gkGVYNb8CuYIWCsXEXoi1+3VqrlGO/x2FKNewaurXOnIsEowVof7xeZZvGexxao2Kcyj7kF69p7gZ7unpnoTZ4VvwX2BLjBOAQys0FkAZOkWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765878079; c=relaxed/relaxed;
	bh=H0wusYeRkkyb8iOZIgXhqUDB7JtUhc0EfBn0PFTaFSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IS/pv/nFguOlESuR0nZvqlFrgwhaAxbw+R7qOOu+uVj/3ClIB0dAlVOp7g3A9U8Dz3zDRcKPoeZGELq4KrTLJIL2PYamE5I6A34LKn/AlAjmsiNNzXRBNAEfOp62YgGFX770E3W8MbPKZZh6OQTNIkLLGJFAu4ZZrp+LNXt+WWz+TdJRezwFFYSS4WOq2zNwWs9WImfUiyeoi4owx/AuQC9KaXT9qCNr1GhG9KBScI0mkCF2/STMMmlWGp6wz+EQpNz1gPj7jF+jXyLO5yH5RPTwq8DPy4jhTHP6lPF21qa5dsehFswLfVsYMZaqTdPmcrwq+9JUHpoU3A26/P66xQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=hse1 header.b=T0brtq4y; dkim-atps=neutral; spf=pass (client-ip=94.100.134.238; helo=mx-relay49-hz3.antispameurope.com; envelope-from=prvs=04384a72e4=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org) smtp.mailfrom=ew.tq-group.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=hse1 header.b=T0brtq4y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=94.100.134.238; helo=mx-relay49-hz3.antispameurope.com; envelope-from=prvs=04384a72e4=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org)
Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVsPm17Fpz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 20:41:15 +1100 (AEDT)
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=H0wusYeRkkyb8iOZIgXhqUDB7JtUhc0EfBn0PFTaFSI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765878063;
 b=nXKNteHX4MVCNawdVTbNj1Lmn92bgeNX8IylsuFGlQsEKOeSJ5c76vfqlxaiY1jmoLgVpUUo
 h5xy6/ozX5mDrrv9MwX20p91//fkt38u0mLJQGntAuA3zCzMJgXgCD/MM6eiCq1yd9joDBCEmYn
 TIMRznYBE2kotJf0hbZm1Yr4jpWaaGycgPnMnb7sbYw8z33sQbulb0FXROX4KXgbDzl/de61A4v
 YxupcI4DGMQ42kWrh6FZyFxFA4gvDa/ZPURdnrj/wOwYdqqFxEcvgNvT9kzju7yVwPklOSgybVE
 s+VFlME1hgvLQC/yjGxgQvayrIapPSYW0nwxfvFZELPYg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765878063;
 b=muwC7YbQikwiauYA5G/SyBjz20PUrFXY+CjNdyDfAO5NmT0BYgUGHHj9TDMUCF3WBnXZpY2a
 LUjd1xoAhRnH8GgTpDebvmfpYrt54bq+7h+28jjsmG2C5ji2dkztxFGVq8Ma/+GN8jzoQQ7yqAs
 ScoQtGlyo3Ui7iWmbEChQRbyhGMTH9HhJfrfrrHQu26C5cdy8lR33BhtFCUHZpbey4LwQw0qtGF
 go7Nzu7a7MKDcgJhz1zl+ozXoWb/BVd0JVOHdf+mab/NcqdumrkzVYULQNCpZF6uT8Om+9rn6Ny
 QTJo0/HLi3tiknbw0dWCIFIUIwUW/qVl10LJ2gKK/q6bA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 16 Dec 2025 10:41:02 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 15C625A0FA5;
	Tue, 16 Dec 2025 10:40:50 +0100 (CET)
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
Subject: [PATCH 2/2] ASoC: fsl_asrc_dma: fix duplicate debugfs directory error
Date: Tue, 16 Dec 2025 10:40:43 +0100
Message-ID: <20251216094045.623184-3-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dVsPG5yK7z3yc65
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:56692679a5c017f375512da0d9446da1
X-cloud-security:scantime:1.918
DKIM-Signature: a=rsa-sha256;
 bh=H0wusYeRkkyb8iOZIgXhqUDB7JtUhc0EfBn0PFTaFSI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765878062; v=1;
 b=T0brtq4yrg1PTHrPDFVvu8AeHgqp1I/pFH3ioSgSVYbGMQ7yd/XdB/aHXnwWmGk54pWarw+h
 zB9LIHE1jQa+ZphGK5rb78v5d4GVF4v6bEYdlSiec9pVs8wYKdnJscVz0dFZSh3opoS1VSPARkb
 D8LSQo6gtu+sGpu7ADcYumU7D2TrzFpYCcTxHVNcxOgt8gxORfZRRnXkqcpQ1HavSRX31cgxkAm
 85fU6HAYnWnjLPaVoenC1VewXF3jozdbbxt7xGwph8ZOy2bm6BlXLnPVXyWCp3tS4uTYSniY3U7
 zTZ2TM6hmO0VWfnsRNnFr9R1lUeG52tg7s+Ex8CmVJuCA==
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This driver registers a component for asrc. This is also used together
with easrc, both attached using the device name as component name.
Eventually debugfs directories with identical name are created in
soc_init_component_debugfs(), leading to error message:
  debugfs: '30c90000.easrc' already exists in 'tqm-tlv320aic32'
Fix this by adding the debugfs_prefix.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 1bba48318e2dd..7dacc06b2f02e 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -473,5 +473,8 @@ struct snd_soc_component_driver fsl_asrc_component = {
 	.pointer	= fsl_asrc_dma_pcm_pointer,
 	.pcm_construct	= fsl_asrc_dma_pcm_new,
 	.legacy_dai_naming = 1,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_prefix	= "asrc",
+#endif
 };
 EXPORT_SYMBOL_GPL(fsl_asrc_component);
-- 
2.43.0


