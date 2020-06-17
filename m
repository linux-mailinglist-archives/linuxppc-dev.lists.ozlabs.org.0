Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 769EC1FC580
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 07:01:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mtFS4zC4zDr2J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 15:01:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mtCd6CJrzDqvL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 14:59:40 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CF7B42005FD;
 Wed, 17 Jun 2020 06:59:37 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 950FE2008A3;
 Wed, 17 Jun 2020 06:59:32 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A5824402B1;
 Wed, 17 Jun 2020 12:59:25 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: bindings: fsl-asoc-card: Add compatible string
 for MQS
Date: Wed, 17 Jun 2020 12:48:24 +0800
Message-Id: <2185a3ec866bc59f82d93b73d1a732a896fd8f48.1592369271.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
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

Add compatible string "fsl,imx-audio-mqs" for MQS, and move
"audio-routing" property to be optional for MQS doesn't need
such property.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- Move "audio-routing" to optional.

 .../devicetree/bindings/sound/fsl-asoc-card.txt      | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
index c60a5732d29c..ca9a3a43adfd 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
@@ -34,6 +34,8 @@ The compatible list for this generic sound card currently:
 
  "fsl,imx-audio-wm8960"
 
+ "fsl,imx-audio-mqs"
+
 Required properties:
 
   - compatible		: Contains one of entries in the compatible list.
@@ -44,6 +46,11 @@ Required properties:
 
   - audio-codec		: The phandle of an audio codec
 
+Optional properties:
+
+  - audio-asrc		: The phandle of ASRC. It can be absent if there's no
+			  need to add ASRC support via DPCM.
+
   - audio-routing	: A list of the connections between audio components.
 			  Each entry is a pair of strings, the first being the
 			  connection's sink, the second being the connection's
@@ -60,11 +67,6 @@ Required properties:
 			        coexisting in order to support the old bindings
 				of wm8962 and sgtl5000.
 
-Optional properties:
-
-  - audio-asrc		: The phandle of ASRC. It can be absent if there's no
-			  need to add ASRC support via DPCM.
-
 Optional unless SSI is selected as a CPU DAI:
 
   - mux-int-port	: The internal port of the i.MX audio muxer (AUDMUX)
-- 
2.21.0

