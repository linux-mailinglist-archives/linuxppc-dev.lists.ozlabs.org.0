Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0BB4840AD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 12:19:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSqrV1FfYz3cbn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 22:19:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSqr429W5z2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jan 2022 22:18:59 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EEF85200CC7;
 Tue,  4 Jan 2022 12:10:22 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B7C1D200C96;
 Tue,  4 Jan 2022 12:10:22 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 51B77183AD05;
 Tue,  4 Jan 2022 19:10:21 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: imx-card: improve the sound quality for low rate
Date: Tue,  4 Jan 2022 18:40:35 +0800
Message-Id: <1641292835-19085-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1641292835-19085-1-git-send-email-shengjiu.wang@nxp.com>
References: <1641292835-19085-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

According to RM, on auto mode:
For codec AK4458 and AK4497, the lowest ratio of MLCK/FS is 256
if sample rate is 8kHz-48kHz,
For codec AK5558, the lowest ratio of MLCK/FS is 512 if sample
rate is 8kHz-48kHz.

With these setting the sound quality for 8kHz-48kHz can be improved.

Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-card.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index f9196fb7e833..6f8efd838fcc 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -120,7 +120,7 @@ struct imx_card_data {
 
 static struct imx_akcodec_fs_mul ak4458_fs_mul[] = {
 	/* Normal, < 32kHz */
-	{ .rmin = 8000,   .rmax = 24000,  .wmin = 1024, .wmax = 1024, },
+	{ .rmin = 8000,   .rmax = 24000,  .wmin = 256,  .wmax = 1024, },
 	/* Normal, 32kHz */
 	{ .rmin = 32000,  .rmax = 32000,  .wmin = 256,  .wmax = 1024, },
 	/* Normal */
@@ -151,8 +151,8 @@ static struct imx_akcodec_fs_mul ak4497_fs_mul[] = {
 	 * Table 7      - mapping multiplier and speed mode
 	 * Tables 8 & 9 - mapping speed mode and LRCK fs
 	 */
-	{ .rmin = 8000,   .rmax = 32000,  .wmin = 1024, .wmax = 1024, }, /* Normal, <= 32kHz */
-	{ .rmin = 44100,  .rmax = 48000,  .wmin = 512,  .wmax = 512, }, /* Normal */
+	{ .rmin = 8000,   .rmax = 32000,  .wmin = 256,  .wmax = 1024, }, /* Normal, <= 32kHz */
+	{ .rmin = 44100,  .rmax = 48000,  .wmin = 256,  .wmax = 512, }, /* Normal */
 	{ .rmin = 88200,  .rmax = 96000,  .wmin = 256,  .wmax = 256, }, /* Double */
 	{ .rmin = 176400, .rmax = 192000, .wmin = 128,  .wmax = 128, }, /* Quad */
 	{ .rmin = 352800, .rmax = 384000, .wmin = 128,  .wmax = 128, }, /* Oct */
@@ -164,7 +164,7 @@ static struct imx_akcodec_fs_mul ak4497_fs_mul[] = {
  * (Table 4 from datasheet)
  */
 static struct imx_akcodec_fs_mul ak5558_fs_mul[] = {
-	{ .rmin = 8000,   .rmax = 32000,  .wmin = 1024, .wmax = 1024, },
+	{ .rmin = 8000,   .rmax = 32000,  .wmin = 512,  .wmax = 1024, },
 	{ .rmin = 44100,  .rmax = 48000,  .wmin = 512,  .wmax = 512, },
 	{ .rmin = 88200,  .rmax = 96000,  .wmin = 256,  .wmax = 256, },
 	{ .rmin = 176400, .rmax = 192000, .wmin = 128,  .wmax = 128, },
-- 
2.17.1

