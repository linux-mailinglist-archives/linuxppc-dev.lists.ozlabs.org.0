Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 995207003A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 14:54:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45shPv11zWzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 22:54:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=daniel.baluta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45shHv0bkyzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 22:48:55 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 00EC82000B2;
 Mon, 22 Jul 2019 14:48:53 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E822D200094;
 Mon, 22 Jul 2019 14:48:52 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 326CC205DB;
 Mon, 22 Jul 2019 14:48:52 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Subject: [PATCH 06/10] ASoC: dt-bindings: Document dl_mask property
Date: Mon, 22 Jul 2019 15:48:29 +0300
Message-Id: <20190722124833.28757-7-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722124833.28757-1-daniel.baluta@nxp.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 viorel.suman@nxp.com, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com, angus@akkea.ca,
 tiwai@suse.com, perex@perex.cz, nicoleotsuka@gmail.com, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 l.stach@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SAI supports up to 8 data lines. This property let the user
configure how many data lines should be used per transfer
direction (Tx/Rx).

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl-sai.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
index 2e726b983845..59f4d965a5fb 100644
--- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
@@ -49,6 +49,11 @@ Optional properties:
 
   - big-endian		: Boolean property, required if all the SAI
 			  registers are big-endian rather than little-endian.
+  - fsl,dl_mask		: list of two integers (bitmask, first for RX, second
+			  for TX) representing enabled datalines. Bit 0
+			  represents first data line, bit 1 represents second
+			  data line and so on. Data line is enabled if
+			  corresponding bit is set to 1.
 
 Optional properties (for mx6ul):
 
-- 
2.17.1

