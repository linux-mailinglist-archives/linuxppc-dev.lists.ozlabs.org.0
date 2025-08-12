Return-Path: <linuxppc-dev+bounces-10859-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6985DB226A7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 14:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1Vvm1Qvjz3dSn;
	Tue, 12 Aug 2025 22:20:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755001236;
	cv=none; b=VMWMRcN7EEsdz2Fn++SS3iBwwUmQMsBCKz0FaaCO4ycDLuOjSeaOBLfMemV43mCR/Bm9vsrI6pr0hjtTEDVGicz9iBCWCpVrDb8K2DVjZFCQEGMaeUHm/3xPcPCodomWs4u64Yr8qNdiJyOLTX7pmv/nbvoM+UkNwUYOTx4oQz+FN6zxt039qXcDsTO2Jsv3IzIJTVzX898N/H6cEE4gw3+FYhQrBJF86rG9mDI627WJwcCvhEQUuiETR6A2cunv+uZFk0wMNgz3djJCT2l2dzYsOAk6Dw454p4/69IX0u8q9Up5O3ayZOICfWXbsHSez7xockhnggc+cacTYMbdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755001236; c=relaxed/relaxed;
	bh=/Vogq0glwCCfOjxaKkI+GHTdnKva9YonxR37S/lD4xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBVgVw7tdZ5w39Et5XcTWSHsKdHVM43/lWDBVSq7mGdqDInzdq3CjfFcUR0DRSARYHbbaIwvVrr2LvqQzZKpWUMax2SymRfFCBmdv5T/HeIIPDAboAy3FAu/PuSNcFKI3u62pjHYOo8ZVLmKuFMPf5nfyMZTu7ZjQrCYWUp9N5mH2abbNhuW29o+MItfc7xcfpczK5ZCmywQZyua+r10jCmHGa/ZgEJr8GFcSQJA7YTs/fNB46H9o8z1fPtNkqGM5jk4ano9v6VpiCJEC0gdeWd+L3m01VLmv1dIQYgP9mn852vKsSJcZNpNHeZC73HWwFfR8Pw/CQWGyjl+zbBZWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1Vvl2MQyz3dSR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 22:20:34 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1Swb2MHyz9sSN;
	Tue, 12 Aug 2025 12:51:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kerTTt7NRZVH; Tue, 12 Aug 2025 12:51:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1SwZ5d91z9sSK;
	Tue, 12 Aug 2025 12:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AA7BA8B764;
	Tue, 12 Aug 2025 12:51:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ClAnCfTxCmbT; Tue, 12 Aug 2025 12:51:10 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 03CA08B763;
	Tue, 12 Aug 2025 12:51:09 +0200 (CEST)
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
Subject: [PATCH v2 2/4] ASoc: fsl: fsl_qmc_audio: Ensure audio channels are ordered in TDM bus
Date: Tue, 12 Aug 2025 12:50:56 +0200
Message-ID: <8d01cf4599664188c92a515922d68c9834263384.1754993232.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1754993232.git.christophe.leroy@csgroup.eu>
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754995860; l=2232; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=XfURbicrtINn/6zsJVAuuKOWunGZaLPhKuyOsIyIZX0=; b=YBxguf9SJ+Iqmj02qL4fBifNH7KDTCcS7hy6Imu81/zBTIa3kKCjuwcO9Knmd63YnJxJKvq/X Q/IvZFe9FcrCZqrymZp7kNatPLd0/qa1D0OzNY8vUMKpguQFswGlVuH
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

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: New
---
 sound/soc/fsl/fsl_qmc_audio.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 5614a8b909edf..0be29ccc1ff7b 100644
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
+		ret = qmc_chan_get_ts_info(qmc_dai->qmc_chans[i], &ts_info);
+		if (ret) {
+			dev_err(qmc_audio->dev, "dai %d get QMC %d channel TS info failed %d\n",
+				qmc_dai->id, i, ret);
+			return ret;
+		}
+
+		last_rx_ts = fls64(ts_info.rx_ts_mask);
+		last_tx_ts = fls64(ts_info.rx_ts_mask);
+
+		if (prev_last_rx_ts > last_rx_ts) {
+			dev_err(qmc_audio->dev, "dai %d QMC chan %d unordered channels (RX timeslot %lu before %lu)\n",
+				qmc_dai->id, i, prev_last_rx_ts, last_rx_ts);
+			return -EINVAL;
+		}
+		if (prev_last_tx_ts > last_tx_ts) {
+			dev_err(qmc_audio->dev, "dai %d QMC chan %d unordered channels (TX timeslot %lu before %lu)\n",
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


