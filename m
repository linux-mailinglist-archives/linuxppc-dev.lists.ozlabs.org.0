Return-Path: <linuxppc-dev+bounces-5343-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9BDA13C24
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 15:26:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYlYD03hCz30Vy;
	Fri, 17 Jan 2025 01:26:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.54.195.159
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737037599;
	cv=none; b=HgAtFSKG29APFg0v5i1b98GpHVwYwzWR++gqIEc22TZ0zL2xgwpu8ZsZgVIsJcsGbUmjBCQQ8bzZYJjUgNPA9m+QXxSXATEYD5TXX+D1iHphDBEvPs1St+Hkv2vVzNuEspzqbRrAQY9npibzd2y92CWKJTdpY4TkILgISdBtQ6LAEaYSt6cKbAV0JiqG367l0Nu3XpPmnsrBCK/QscxceH79kuR7n5L6A6zHFzIDDkuWJZsioLR9yis+5UiF9tQiBFfw4bd+le7mbTF4fRtDJqP51oCj7QBz3RRa7HYEDrv9nQ5yrow3ia5YbgVZzlUWTYVuGENRJtYcQEDra7Rn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737037599; c=relaxed/relaxed;
	bh=09C4foEGnTcQ01zXb2y1lbhH9mr6U7dmLyDUeHbleyY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Md4yc8ZBQrcGc7UOHs2Wv2wc5LSrAEzTKPGYW3+6oR2DbaaRzCJQEEjFFyJei++BSdJ60xXJsujYwNi0HIGPSzK7NjHEmt5oiln1tizqEebPDTFHk85PYduCzZikjyG/orjywKwq0upyI/++NxKEvmz9E/A+r52Ow+udCIGI4pHvH9tNUVotsiPDwwD2kU7d/fkuBSBGZ2XHeFvunV3RXTWqvK+Aid3JuHxT/g8+P9D8x4BVF7Hc4QzaeBZKo9AGXf2jO9udxKsbKnuCtDuY+Yl4sHGDVn9XI9XITS61wkKXKYUhhGPmLl8ryB92pCQvFeIBhFHLyZKJ6VKQy7KELQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass (client-ip=195.54.195.159; helo=exchange.fintech.ru; envelope-from=n.zhandarovich@fintech.ru; receiver=lists.ozlabs.org) smtp.mailfrom=fintech.ru
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fintech.ru (client-ip=195.54.195.159; helo=exchange.fintech.ru; envelope-from=n.zhandarovich@fintech.ru; receiver=lists.ozlabs.org)
X-Greylist: delayed 88 seconds by postgrey-1.37 at boromir; Fri, 17 Jan 2025 01:26:38 AEDT
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYlYB3CTfz2xb3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 01:26:38 +1100 (AEDT)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 16 Jan
 2025 17:24:42 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 16 Jan
 2025 17:24:41 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] ASoC: fsl_micfil: Enable default case in micfil_set_quality()
Date: Thu, 16 Jan 2025 06:24:36 -0800
Message-ID: <20250116142436.22389-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

If 'micfil->quality' received from micfil_quality_set() somehow ends
up with an unpredictable value, switch() operator will fail to
initialize local variable qsel before regmap_update_bits() tries
to utilize it.

While it is unlikely, play it safe and enable a default case that
returns -EINVAL error.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: bea1d61d5892 ("ASoC: fsl_micfil: rework quality setting")
Cc: stable@vger.kernel.org
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 sound/soc/fsl/fsl_micfil.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 8c15389c9a04..5585f4c8f455 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -157,6 +157,8 @@ static int micfil_set_quality(struct fsl_micfil *micfil)
 	case QUALITY_VLOW2:
 		qsel = MICFIL_QSEL_VLOW2_QUALITY;
 		break;
+	default:
+		return -EINVAL;
 	}
 
 	return regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,

