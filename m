Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9613823C622
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 08:41:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BM28Z4fn6zDqhY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 16:41:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.45; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=nA15s4Yc; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70045.outbound.protection.outlook.com [40.107.7.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BM24S6r6qzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 16:38:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYY/ma9QHOSApX9zNYvjz2xg8D8WoLa410DPrXGlz8WKEsPpQo7j6sfHTav79xE0th9nyQxlLK91LAyU3NzAlJnZVabaC5rhVI0sv0KO2rcMYExacPfB8R53p/9RFpyyjRxx5PJ63jIlUZhUbrWZfJ5u4sKK+8U0Dux60ifSMFSFFH80vRXiNn4/MFCcoAFYP+q5X+WD9Iff1ddgX4fyd4iEND1grnZCAY9tZgPXczBqBiAlcXX0fO9KLO8z3A3dW/7Cc/GJuhWv/fnanUumQbf/ovhWGocLCTnxLEYXdHq6jOwhXYMVQL14ifMd3bSemroTbvKIkRrhb8Z4pmTl/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlFCwxfTSq1G3SlfcH1iz1jcs4+V3rR/VGqfXwXlM9U=;
 b=XyjsoOXlxaCUyix43rvrx+VuYOEZk0bPvB/CNk/xp+NAG4f2GeIzRpbd9KhjOOz7mLM5hrkmzN7rirCYdDKR3Y2gC4AxJIN4F0FJQsL/K0g4CapdTr4QYNVSxVjAs+o52SGQKCVwApiIkKoewtYiYf0r5m9fY6fFsULnJw7mzB8OdwcUmFmjdwKyMbPSIxCBB6nD8J9LyTzK7jPaQot9h7HqaKwykpJEZVtvDGUB5TohTrVcxy3Q4j1Cy+zRmnpAatpdBKnJSO7jAEONdcs32bCj+sZfVsuUKfE0aRKUV9TtUfaAzUgD+ZRHODHEalGWN5t5t9JssVlT3GewLll4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlFCwxfTSq1G3SlfcH1iz1jcs4+V3rR/VGqfXwXlM9U=;
 b=nA15s4Yci2gHzp3oG5Ng13KyYeUAbfzWcMqQ8Zn1ALaDsjnhaWwTokLOSIWGuaVLT0Fnm+jops/Wl8gzhfTpn0yKTMSzaBPDGxTDb9jSc7CKAD5U4U5hFTGlUBK5b+8cDn/olB4l3OUUMIzogYtsBAZ8rf9eWYKzz3d/kVkyGN8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 (2603:10a6:803:11::14) by VI1PR04MB3055.eurprd04.prod.outlook.com
 (2603:10a6:802:9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Wed, 5 Aug
 2020 06:37:55 +0000
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::c1a:39dd:a2d5:3d2f]) by VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::c1a:39dd:a2d5:3d2f%7]) with mapi id 15.20.3261.016; Wed, 5 Aug 2020
 06:37:55 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] ASoC: fsl_sai: Refine enable/disable TE/RE sequence in
 trigger()
Date: Wed,  5 Aug 2020 14:34:11 +0800
Message-Id: <20200805063413.4610-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805063413.4610-1-shengjiu.wang@nxp.com>
References: <20200805063413.4610-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:4:91::13) To VI1PR0402MB3342.eurprd04.prod.outlook.com
 (2603:10a6:803:11::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from audiosh1.ap.freescale.net (119.31.174.67) by
 SG2PR03CA0109.apcprd03.prod.outlook.com (2603:1096:4:91::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3261.12 via Frontend Transport; Wed, 5 Aug 2020 06:37:52 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2e83dc9a-9ba1-4685-35be-08d8390a15d6
X-MS-TrafficTypeDiagnostic: VI1PR04MB3055:
X-Microsoft-Antispam-PRVS: <VI1PR04MB30550EBAADF833B5447CB155E34B0@VI1PR04MB3055.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YGune1oUiu5pZ/4T8ZwdFv6bcOmueDxqi0ibqo8EVYr2uC9+BYBQ5myETywKGaAplOgT1g0Ji5hU3/Gnu4Ed61jUvcGIMAG7kHMzS66W9aWpPKHuVRk97F8G6xvIVp995Vs8EifjOQTxab79fa7OzEKOVHVXHz6DB6PNno+ea327QdkpYtCCsgewOPoRMstz9kRQoHlpo49GQVY4NKnJYJVX81nRlM3QrW5xaoJ5qJ9Y+VyaA2jxCexy7uqQmfisJEJUd/D5IYy4RwFbx4/RhHDSbU01BvFBiIkd8P5LnU6ScnjRO19hIwE4kNDtHlzqJHFfffU7MstKWw4VLD9W7muRiw7esjOC/NUhctgnzuxCQq2vIfn671McVQnCjzKO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3342.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(36756003)(2906002)(44832011)(26005)(86362001)(6506007)(16526019)(186003)(956004)(2616005)(1076003)(5660300002)(6666004)(7416002)(6486002)(6512007)(316002)(8936002)(8676002)(52116002)(478600001)(66946007)(83380400001)(66556008)(66476007)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: HU/lIi1uYsN+tuZlv8aU491XENTNQTZkzAfClO3ibs1AjktcDuCD/wncf0Sz/dlJbh2J+eHKNaVaRVjeDue0TsY7+F1XQUkEOIBmcYXAjYliSBM9WWq4Lb31DqIgKunYfeVxu6hs5UDvaR3EoOCJNntSCnPONyTwwwLZEJ58DIeBQeyEv0zXa34UJGC2iv2RGP24SbM6bdUgd3a95OIOKCP+sCAYZa1O41mF2QDYxGpWS5CTPw+rAxErcvhbp5spdncP50R28UAZjONlbZB5JZx+ESnTwcroR2yzv0hNE8Cag58fRDEYE5Mr9+D+W5lqVUSlCxxp72sEEWZtzAmJsioYLuApzaGOLugoMKq+L+kIsiq76zQwQGgCWuZ+40y9HwzNezLKK+JLnhlv0qWf5FD+wNduP1J08rpd3VgQyLbBgBPZJNPxM/stn6uRJfTB5LhLeOcU37UXg25YByBcujaYwc3WJIEIs1v7l3/0C0iTDDemIrsVp1dr/arcgNdLdSK+bSd8rece8C12t4ejFBiBJYOUJsZsydBKQ4UX0kPNZ+KPX4RLYx1iacdvgrvPLS0/3l0tCUrguCerlyQSt/eCBI/B870wsOY84HYjj5KvvZKiN4AhN5HlvKExwxhZ2JwB7/SF+SzVYFFbIrKyMA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e83dc9a-9ba1-4685-35be-08d8390a15d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3342.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 06:37:55.5559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVdinIs0dmpQSjI1X3lIFrfnZXgQnZhhd2oBL9wNLG9VMG7wewLuUmjZTZI8Mp8Elp+/PQWcsIXOoH+BtDImkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3055
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

Current code enables TCSR.TE and RCSR.RE together, and disable
TCSR.TE and RCSR.RE together in trigger(), which only supports
one operation mode：
1. Rx synchronous with Tx: TE is last enabled and first disabled

Other operation mode need to be considered also:
2. Tx synchronous with Rx: RE is last enabled and first disabled.
3. Asynchronous mode: Tx and Rx are independent.

So the enable TCSR.TE and RCSR.RE sequence and the disable
sequence need to be refined accordingly for #2 and #3.

There is slightly against what RM recommennds with this change.
For example in Rx synchronous with Tx mode, case "aplay 1.wav;
arecord 2.wav" enable TE before RE. But it should be safe to
do so, judging by years of testing results.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 126 +++++++++++++++++++++++++++-------------
 1 file changed, 85 insertions(+), 41 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index cdff739924e2..566c4747362a 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -37,6 +37,24 @@ static const struct snd_pcm_hw_constraint_list fsl_sai_rate_constraints = {
 	.list = fsl_sai_rates,
 };
 
+/**
+ * fsl_sai_dir_is_synced - Check if stream is synced by the opposite stream
+ *
+ * SAI supports synchronous mode using bit/frame clocks of either Transmitter's
+ * or Receiver's for both streams. This function is used to check if clocks of
+ * the stream's are synced by the opposite stream.
+ *
+ * @sai: SAI context
+ * @dir: stream direction
+ */
+static inline bool fsl_sai_dir_is_synced(struct fsl_sai *sai, int dir)
+{
+	int adir = (dir == TX) ? RX : TX;
+
+	/* current dir in async mode while opposite dir in sync mode */
+	return !sai->synchronous[dir] && sai->synchronous[adir];
+}
+
 static irqreturn_t fsl_sai_isr(int irq, void *devid)
 {
 	struct fsl_sai *sai = (struct fsl_sai *)devid;
@@ -522,6 +540,38 @@ static int fsl_sai_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
+{
+	unsigned int ofs = sai->soc_data->reg_offset;
+	bool tx = dir == TX;
+	u32 xcsr, count = 100;
+
+	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
+			   FSL_SAI_CSR_TERE, 0);
+
+	/* TERE will remain set till the end of current frame */
+	do {
+		udelay(10);
+		regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
+	} while (--count && xcsr & FSL_SAI_CSR_TERE);
+
+	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
+			   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
+
+	/*
+	 * For sai master mode, after several open/close sai,
+	 * there will be no frame clock, and can't recover
+	 * anymore. Add software reset to fix this issue.
+	 * This is a hardware bug, and will be fix in the
+	 * next sai version.
+	 */
+	if (!sai->is_slave_mode) {
+		/* Software Reset */
+		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
+		/* Clear SR bit to finish the reset */
+		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
+	}
+}
 
 static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 		struct snd_soc_dai *cpu_dai)
@@ -530,7 +580,9 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 	unsigned int ofs = sai->soc_data->reg_offset;
 
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	u32 xcsr, count = 100;
+	int adir = tx ? RX : TX;
+	int dir = tx ? TX : RX;
+	u32 xcsr;
 
 	/*
 	 * Asynchronous mode: Clear SYNC for both Tx and Rx.
@@ -553,10 +605,22 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_FRDE, FSL_SAI_CSR_FRDE);
 
-		regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
-				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
-		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
+		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
+		/*
+		 * Enable the opposite direction for synchronous mode
+		 * 1. Tx sync with Rx: only set RE for Rx; set TE & RE for Tx
+		 * 2. Rx sync with Tx: only set TE for Tx; set RE & TE for Rx
+		 *
+		 * RM recommends to enable RE after TE for case 1 and to enable
+		 * TE after RE for case 2, but we here may not always guarantee
+		 * that happens: "arecord 1.wav; aplay 2.wav" in case 1 enables
+		 * TE after RE, which is against what RM recommends but should
+		 * be safe to do, judging by years of testing results.
+		 */
+		if (fsl_sai_dir_is_synced(sai, adir))
+			regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
+					   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
 
 		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_xIE_MASK, FSL_SAI_FLAGS);
@@ -571,43 +635,23 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		/* Check if the opposite FRDE is also disabled */
 		regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
-		if (!(xcsr & FSL_SAI_CSR_FRDE)) {
-			/* Disable both directions and reset their FIFOs */
-			regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
-					   FSL_SAI_CSR_TERE, 0);
-			regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
-					   FSL_SAI_CSR_TERE, 0);
-
-			/* TERE will remain set till the end of current frame */
-			do {
-				udelay(10);
-				regmap_read(sai->regmap,
-					    FSL_SAI_xCSR(tx, ofs), &xcsr);
-			} while (--count && xcsr & FSL_SAI_CSR_TERE);
-
-			regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
-					   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
-			regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
-					   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
-
-			/*
-			 * For sai master mode, after several open/close sai,
-			 * there will be no frame clock, and can't recover
-			 * anymore. Add software reset to fix this issue.
-			 * This is a hardware bug, and will be fix in the
-			 * next sai version.
-			 */
-			if (!sai->is_slave_mode) {
-				/* Software Reset for both Tx and Rx */
-				regmap_write(sai->regmap, FSL_SAI_TCSR(ofs),
-					     FSL_SAI_CSR_SR);
-				regmap_write(sai->regmap, FSL_SAI_RCSR(ofs),
-					     FSL_SAI_CSR_SR);
-				/* Clear SR bit to finish the reset */
-				regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
-				regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
-			}
-		}
+
+		/*
+		 * If opposite stream provides clocks for synchronous mode and
+		 * it is inactive, disable it before disabling the current one
+		 */
+		if (fsl_sai_dir_is_synced(sai, adir) && !(xcsr & FSL_SAI_CSR_FRDE))
+			fsl_sai_config_disable(sai, adir);
+
+		/*
+		 * Disable current stream if either of:
+		 * 1. current stream doesn't provide clocks for synchronous mode
+		 * 2. current stream provides clocks for synchronous mode but no
+		 *    more stream is active.
+		 */
+		if (!fsl_sai_dir_is_synced(sai, dir) || !(xcsr & FSL_SAI_CSR_FRDE))
+			fsl_sai_config_disable(sai, dir);
+
 		break;
 	default:
 		return -EINVAL;
-- 
2.27.0

