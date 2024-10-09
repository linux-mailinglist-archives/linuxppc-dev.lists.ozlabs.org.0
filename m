Return-Path: <linuxppc-dev+bounces-1874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4589D9961EA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 10:10:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNltW2rDJz2yFD;
	Wed,  9 Oct 2024 19:10:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728461411;
	cv=none; b=CofoBJnSiv5pEmejjPdTBfH00+T4nBKNc4j1aThIdcSuaQPf7wvbqd/Arlxp9xx6A1mX34y7FTlvQn6eK+bu8+a8PzHAzJKxvn8aT/NCQxUQ9wH1lSVY3C0N6vsWFVWTDR6nvD4vnC0ahU+CSFms3yv5BCzVilzBs6QDAy/kSCnKZS8xDIltqIP7ifwEWi/+sbFyU/o+wLL6lv2J+aiyJ1vmBLot/cttrvLYzkv6CRuPbg2uYW0W44pYTgC4JT+xoism6/wHG5z/EKL2LM6fWs1gIXkGGvbIc1kL5dHolxybHA7DHkRZCOxqb08rIhUpDIPjC0e24J2GFSY9/YVWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728461411; c=relaxed/relaxed;
	bh=bZAy0ddJdO6/uRUBL9FtOObc7kOePI4TlJKbumHMShc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=nnEroaALr8gkf3EJlApA+oEgpVkIhKQ7+2UPFaYf1KDQvUA6IqBHoYAgzwmwKhL/Cq0TGGOx7UWcf85Ud+jQnlfOd3tMtCAZiRll8+mU0f87sgdpNZ/nzl51+EWgfd9NEkcxSPvaMbSIxN4AQK3dm7YDBX+fe9JYEadkEknlG5CbYLJY6wkKtT0CQ1Jjt0kmm7Bvm/S9n+6n2ACWztLcnrrYYofkkcadiIuMVCuRdx6UqmkCtkMAtQfSS1i/NNC+LuZ6IVdfbp1kU7PdE7AzG4AD0j/gdjfp19Vffiq3edPMOPxjzVUKkPpgjZR0G147NIZNwU9FbUh0Zlg/HT26JQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNltV3Dy7z2yY1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 19:10:10 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 124A41A27F8;
	Wed,  9 Oct 2024 10:10:08 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CEA541A223E;
	Wed,  9 Oct 2024 10:10:07 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 71A87183F0C0;
	Wed,  9 Oct 2024 16:10:06 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chancel.liu@nxp.com
Subject: [PATCH 2/2] ASoC: imx-card: Add CS42888 support
Date: Wed,  9 Oct 2024 15:46:44 +0800
Message-Id: <1728460004-364-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
References: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

From: Chancel Liu <chancel.liu@nxp.com>

CS42888 codec provides 4 multi-bit ADC and 8 multi-bit DAC.
Add support for this codec in imx-card ASoC machine driver.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-card.c | 54 ++++++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 2f3dbbd15791..306168b164d3 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -25,6 +25,7 @@ enum codec_type {
 	CODEC_AK4458,
 	CODEC_AK4497,
 	CODEC_AK5552,
+	CODEC_CS42888,
 };
 
 /*
@@ -185,6 +186,16 @@ static struct imx_akcodec_tdm_fs_mul ak5558_tdm_fs_mul[] = {
 	{ .min = 512,	.max = 512,	.mul = 1024 },
 };
 
+static struct imx_akcodec_fs_mul cs42888_fs_mul[] = {
+	{ .rmin = 8000,   .rmax = 48000,  .wmin = 256,  .wmax = 1024, },
+	{ .rmin = 64000,  .rmax = 96000,  .wmin = 128,  .wmax = 512, },
+	{ .rmin = 176400, .rmax = 192000, .wmin = 64,  .wmax = 256, },
+};
+
+static struct imx_akcodec_tdm_fs_mul cs42888_tdm_fs_mul[] = {
+	{ .min = 256,	.max = 256,	.mul = 256 },
+};
+
 static const u32 akcodec_rates[] = {
 	8000, 11025, 16000, 22050, 32000, 44100, 48000, 88200,
 	96000, 176400, 192000, 352800, 384000, 705600, 768000,
@@ -210,6 +221,14 @@ static const u32 ak5558_tdm_channels[] = {
 	1, 2, 3, 4, 5, 6, 7, 8,
 };
 
+static const u32 cs42888_channels[] = {
+	1, 2, 4, 6, 8,
+};
+
+static const u32 cs42888_tdm_channels[] = {
+	1, 2, 3, 4, 5, 6, 7, 8,
+};
+
 static bool format_is_dsd(struct snd_pcm_hw_params *params)
 {
 	snd_pcm_format_t format = params_format(params);
@@ -241,6 +260,7 @@ static bool codec_is_akcodec(unsigned int type)
 	case CODEC_AK4497:
 	case CODEC_AK5558:
 	case CODEC_AK5552:
+	case CODEC_CS42888:
 		return true;
 	default:
 		break;
@@ -340,13 +360,15 @@ static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		}
 
-		ret = snd_soc_dai_set_tdm_slot(codec_dai,
-					       BIT(slots) - 1,
-					       BIT(slots) - 1,
-					       slots, slot_width);
-		if (ret && ret != -ENOTSUPP) {
-			dev_err(dev, "failed to set codec dai[%d] tdm slot: %d\n", i, ret);
-			return ret;
+		if (format_is_tdm(link_data)) {
+			ret = snd_soc_dai_set_tdm_slot(codec_dai,
+						       BIT(slots) - 1,
+						       BIT(slots) - 1,
+						       slots, slot_width);
+			if (ret && ret != -ENOTSUPP) {
+				dev_err(dev, "failed to set codec dai[%d] tdm slot: %d\n", i, ret);
+				return ret;
+			}
 		}
 	}
 
@@ -609,6 +631,8 @@ static int imx_card_parse_of(struct imx_card_data *data)
 				plat_data->type = CODEC_AK5558;
 			else if (!strcmp(link->codecs->dai_name, "ak5552-aif"))
 				plat_data->type = CODEC_AK5552;
+			else if (!strcmp(link->codecs->dai_name, "cs42888"))
+				plat_data->type = CODEC_CS42888;
 
 		} else {
 			link->codecs	 = &snd_soc_dummy_dlc;
@@ -766,6 +790,12 @@ static int imx_card_probe(struct platform_device *pdev)
 		data->dapm_routes[i].sink = "ASRC-Capture";
 		data->dapm_routes[i].source = "CPU-Capture";
 		break;
+	case CODEC_CS42888:
+		data->dapm_routes[0].sink = "Playback";
+		data->dapm_routes[0].source = "CPU-Playback";
+		data->dapm_routes[1].sink = "CPU-Capture";
+		data->dapm_routes[1].source = "Capture";
+		break;
 	default:
 		break;
 	}
@@ -805,6 +835,16 @@ static int imx_card_probe(struct platform_device *pdev)
 			plat_data->support_tdm_channels = ak5558_tdm_channels;
 			plat_data->num_tdm_channels = ARRAY_SIZE(ak5558_tdm_channels);
 			break;
+		case CODEC_CS42888:
+			plat_data->fs_mul = cs42888_fs_mul;
+			plat_data->num_fs_mul = ARRAY_SIZE(cs42888_fs_mul);
+			plat_data->tdm_fs_mul = cs42888_tdm_fs_mul;
+			plat_data->num_tdm_fs_mul = ARRAY_SIZE(cs42888_tdm_fs_mul);
+			plat_data->support_channels = cs42888_channels;
+			plat_data->num_channels = ARRAY_SIZE(cs42888_channels);
+			plat_data->support_tdm_channels = cs42888_tdm_channels;
+			plat_data->num_tdm_channels = ARRAY_SIZE(cs42888_tdm_channels);
+			break;
 		default:
 			break;
 		}
-- 
2.34.1


