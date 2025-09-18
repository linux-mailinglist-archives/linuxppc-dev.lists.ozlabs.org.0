Return-Path: <linuxppc-dev+bounces-12413-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 841ADB8841E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 09:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSl6l2wW8z30D3;
	Fri, 19 Sep 2025 17:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758268239;
	cv=none; b=lg7BxLuoW9upyxyH+451KFonUZ6eLLAq4hF5fXMDs17EA1DO9dw4S/j8uy/KsVGinmY1PGs+idjk/nz/hAiwctsy4AveMWo+alDjgGGuiElV3rMzvbLdEQcqKrS7UEPnK0YPS012rG+U0w/rXdOiAfoYqjAaPzPL07zRPJefIYATlLmhohwJBoRUPprVEOyctYppiFwz2Pt7pHG11aKDcCgTTU5tCxwTtZMqI8xXNFff9Vu/ZsHXjr/cQgY/yRRAB5RLmF5f9+2ItoEK5lBKWewFmdwHcysd/fbFJnNIvECOimd8YbcWQAGIOr7EKxR9MMS9EJ6ccbtw3n7xrKx0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758268239; c=relaxed/relaxed;
	bh=b8KIaKaIf8ymEygY/rIs+aRe2fxMAW4DXWCks+G/B7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oC/sVXbhmIywq3gFOq61R+nc20Z/Q0o9Wasy8+0cShvnJlkwSCQ/JfzZxEKYZNQrE3KyAyLqKN0Jx+kIhmMy87f/EpZNH/oLIxi73mSTdVWAo5+FTSXFk9q/ruPRl4E1hc7ucOHw/czj+5vVoPsTlAnSc0A05NjonynFgmfezSLfgiqIWPI3FoMzEA6RYuLRQvC3kdoslwPk0wl+9CMu1/VoZKgWZvXDzHfKhF0a8uQtyiWZZi9OoooMdeM5zoK1EZ7uU6TQGvS4NKCzEWpXI3P+mypJyp/LgLBCTecZiHB6pjrQ6/hB1wYWRsta9wfi732WPsVfTqKYvq/MllmyjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSl6k58k5z2xck
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 17:50:37 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSKSR28vLz9sg1;
	Thu, 18 Sep 2025 17:34:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7_lta6qXCna; Thu, 18 Sep 2025 17:34:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSKSR15xZz9sfv;
	Thu, 18 Sep 2025 17:34:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 15DCD8B767;
	Thu, 18 Sep 2025 17:34:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id dYGLOMvVr6vT; Thu, 18 Sep 2025 17:34:31 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 40FA78B775;
	Thu, 18 Sep 2025 17:34:30 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH RESEND v3 2/4] ASoc: fsl: fsl_qmc_audio: Ensure audio channels are ordered in TDM bus
Date: Thu, 18 Sep 2025 17:34:09 +0200
Message-ID: <4ff40afdf3d032b05dd4af6c0f777d4d4b445a76.1758209158.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1758209158.git.christophe.leroy@csgroup.eu>
References: <cover.1758209158.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758209657; l=2268; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=PhCdmcBJPdWMbFjoZdGBw3gyDb5r2JgdoYXKwih9mSw=; b=ruBvohcdwTV13JzsoBOhlDufd3DsKpD4cOPOEYuGWSfm6Ozs7idM1/CNZLZUOMe9VBZP4mWZ2 thJrF3KAZaWDljbSlUr+XfoKg14q6ra/HyrJIPSjZZGr0vqZjORgflI
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

To reduce complexity of interrupt handling in following patch, ensure
audio channels are configured in the same order as timeslots on the
TDM bus. If we need a given ordering of audio sources in the audio
frame, it is possible to re-order codecs on the TDM bus, no need to
mix up timeslots in channels.

Acked-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 sound/soc/fsl/fsl_qmc_audio.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 5614a8b909ed..c0c7ef0a1511 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -791,12 +791,17 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
 			       struct qmc_dai *qmc_dai,
 			       struct snd_soc_dai_driver *qmc_soc_dai_driver)
 {
+	struct qmc_chan_ts_info ts_info;
 	struct qmc_chan_info info;
 	unsigned long rx_fs_rate;
 	unsigned long tx_fs_rate;
+	int prev_last_rx_ts = 0;
+	int prev_last_tx_ts = 0;
 	unsigned int nb_tx_ts;
 	unsigned int nb_rx_ts;
 	unsigned int i;
+	int last_rx_ts;
+	int last_tx_ts;
 	int count;
 	u32 val;
 	int ret;
@@ -879,6 +884,30 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
 				return -EINVAL;
 			}
 		}
+
+		ret = qmc_chan_get_ts_info(qmc_dai->chans[i].qmc_chan, &ts_info);
+		if (ret) {
+			dev_err(qmc_audio->dev, "dai %d get QMC %d channel TS info failed %d\n",
+				qmc_dai->id, i, ret);
+			return ret;
+		}
+
+		last_rx_ts = fls64(ts_info.rx_ts_mask);
+		last_tx_ts = fls64(ts_info.tx_ts_mask);
+
+		if (prev_last_rx_ts > last_rx_ts) {
+			dev_err(qmc_audio->dev, "dai %d QMC chan %d unordered channels (RX timeslot %d before %d)\n",
+				qmc_dai->id, i, prev_last_rx_ts, last_rx_ts);
+			return -EINVAL;
+		}
+		if (prev_last_tx_ts > last_tx_ts) {
+			dev_err(qmc_audio->dev, "dai %d QMC chan %d unordered channels (TX timeslot %d before %d)\n",
+				qmc_dai->id, i, prev_last_tx_ts, last_tx_ts);
+			return -EINVAL;
+		}
+
+		prev_last_rx_ts = last_rx_ts;
+		prev_last_tx_ts = last_tx_ts;
 	}
 
 	qmc_dai->nb_chans_avail = count;
-- 
2.49.0


