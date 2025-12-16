Return-Path: <linuxppc-dev+bounces-14803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4999DCC1F49
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 11:23:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVtLW3c7Hz2yDY;
	Tue, 16 Dec 2025 21:23:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=94.100.134.236 arc.chain=hornetsecurity.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765880611;
	cv=pass; b=PCK/5sr1JhYZk92lErXH9NPJIwe2iNG2rhSioG723co1DQuj6E+hOMU80b6skiuby/Tb1zdn3+pKv6fsXpHDmtQTMX57Obq8Pbx43JJMtv71lAkDpFAkYgMCAYHyb5Uq82Us5pf/WN8TKe6VF1G9RyQziyob2g9hhCpo+gYrSMIdrBOVFLnSSqXDBANqWhGeDA1stfS6WJYfQKCS+jIHsbCOjgqVe6XiYWDvo9DFt71tvmHy+tOkR2glESJhkxlR5dnMgQ3kSZ0RnNfKtSQcWtknGt66jef8yBs4DedOz0s6k/gdPR4f1/SdArfMUgmMajMrboR/SQfueOdAt3mQkg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765880611; c=relaxed/relaxed;
	bh=WctSvoBhSvz0oJWI2JmOife8oyk7RTrj1YKf1sMtysg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bb5529CBMzCBScb965rimFZTYG8i1xLuQWzuZt1fN82cMlhj6iJbnDKtdM67/RdmyQDlOt8EGzjHRFxTby51aGdXWz1ZADKV3u+ufpcIlefAvSAfqcfmgOVE9wbacH6QWPB3Pb0cNKk/LFc2RXBwkpxNSfWmBOIOXTgMunytAoWmFH3tX3BMsoj03F/ESsnqPd1C9o3z1KfSTRpuYioaG8FU93zPkWtWQ0uMvi7OnOlkLMGVk76CQDGHgYxA9F4OM7+lx82Vt7xpG/uGsjK7Q+ZP2CmDx83/DWxjmUFEOEY+217xMbol/xbhAoRUEI5XYGXaRABW6f6nsrohJ9B3pQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=hse1 header.b=PuxICLvj; dkim-atps=neutral; spf=pass (client-ip=94.100.134.236; helo=mx-relay47-hz3.antispameurope.com; envelope-from=prvs=04384a72e4=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org) smtp.mailfrom=ew.tq-group.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=hse1 header.b=PuxICLvj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=94.100.134.236; helo=mx-relay47-hz3.antispameurope.com; envelope-from=prvs=04384a72e4=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org)
Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVtLS0PCZz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 21:23:23 +1100 (AEDT)
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=WctSvoBhSvz0oJWI2JmOife8oyk7RTrj1YKf1sMtysg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765880588;
 b=JbQkIJqlDjDUPyDTCE1bX9btxWXzUgr7p91bElfcL2glVJ/Kshq52l144X4Ri0W0l3I240gi
 hzZS3iuZxaYI1Yl+njULuXEClBKCBvDi9q6v3p5+HVwki9cclFJLtUba8EkqLhmwq5KdgEglWmJ
 Pdcre04jwOIw+AvdiA7+GDsXyYqB5wdwDZMLhbtVRvPm0GCHzaX7/cRvtNXUgOMwYLf8EVQV16Z
 Fv/vNd4Hxhy3Go81WJWvKPYfJEfuiyGHXuNVaBundqo9cPwlVC8juykxmR3Pkq4C+mYdFvLjbEj
 8Po5hNDaE2EayjcTH73xEDSWYb/eEwCx6MmrkObfeQwCQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765880588;
 b=ktMpA3xOuUKZ1oGwppJ4N3Na3Dri6FPwbJCZC3i6egJ+1H4x9jC+uimNCxBP9WOWDMpTucbB
 r78rk1NKaJbwGM1t5jgsMJpargNnioU/Y3bReKIQgxNzXgUWHU1cuxXLVPYll/tjVDiwc+pabEm
 9jSGllYMQc+hfVwGf+dFy+RnJl0g5OMQWrNj8J53WWLv+7P8gzznllLO0hgs/+3Wk8ltCgHCJ4X
 Z2i5XW1tyyePwyMKxj6OQj6XC4YhCHSWdHIFOKBclTF1XWJm7hDCLVb/Mtg0zwyfSWolyBbSpW+
 /IEIDl8oPDbRXFpJ+Bavw2X+sqyrR82wj3in7+lNf75BA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Tue, 16 Dec 2025 11:23:08 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 29A18CC0E8C;
	Tue, 16 Dec 2025 11:22:54 +0100 (CET)
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
Subject: [PATCH 1/1] ASoC: fsl_sai: Add missing registers to cache default
Date: Tue, 16 Dec 2025 11:22:45 +0100
Message-ID: <20251216102246.676181-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4dVtKp6DRYz4MYBs
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:0b8e2a2d7f219b50b02a2824fc9faeb1
X-cloud-security:scantime:2.437
DKIM-Signature: a=rsa-sha256;
 bh=WctSvoBhSvz0oJWI2JmOife8oyk7RTrj1YKf1sMtysg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765880588; v=1;
 b=PuxICLvjzGwT8V6wlR6PLvIqz46SyGBvah26M7XvospuZwMGVy56v4wr8h1ZpW0UrZX03Rx5
 7QqgMnBkPeEO9Em7BHH8NCRYukiIq6jiGA43k8JmwQG+KOzQ1JkqhiMgfh6Hl5ubywNhzK178Ex
 ETmgz0qL9Aqim2MsSW37YinyXzVF1UkuX0nUibtVTTvFFU5XtwGz+XQj0ekgRrndaVRXn8f1uKj
 +2GmQyjKPP1q8Bt/ZDRlEbmiyMxBTgVuKHRpvOeHmuMdi9N7RjyJ+S9BO21tJGZU2DRUFQxglIi
 xLAW9ZfHGjmJiZYK3w4FxGzDR8syq1LxrscjsCWnYwHDQ==
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Drivers does cache sync during runtime resume, setting all writable
registers. Not all writable registers are set in cache default, resulting
in the erorr message:
  fsl-sai 30c30000.sai: using zero-initialized flat cache, this may cause
  unexpected behavior

Fix this by adding missing writable register defaults.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/fsl_sai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 86730c2149146..2fa14fbdfe1a8 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1081,6 +1081,7 @@ static const struct reg_default fsl_sai_reg_defaults_ofs0[] = {
 	{FSL_SAI_TDR6, 0},
 	{FSL_SAI_TDR7, 0},
 	{FSL_SAI_TMR, 0},
+	{FSL_SAI_TTCTL, 0},
 	{FSL_SAI_RCR1(0), 0},
 	{FSL_SAI_RCR2(0), 0},
 	{FSL_SAI_RCR3(0), 0},
@@ -1104,12 +1105,14 @@ static const struct reg_default fsl_sai_reg_defaults_ofs8[] = {
 	{FSL_SAI_TDR6, 0},
 	{FSL_SAI_TDR7, 0},
 	{FSL_SAI_TMR, 0},
+	{FSL_SAI_TTCTL, 0},
 	{FSL_SAI_RCR1(8), 0},
 	{FSL_SAI_RCR2(8), 0},
 	{FSL_SAI_RCR3(8), 0},
 	{FSL_SAI_RCR4(8), 0},
 	{FSL_SAI_RCR5(8), 0},
 	{FSL_SAI_RMR, 0},
+	{FSL_SAI_RTCTL, 0},
 	{FSL_SAI_MCTL, 0},
 	{FSL_SAI_MDIV, 0},
 };
-- 
2.43.0


