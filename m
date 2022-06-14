Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE70D54A823
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 06:28:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMb5l3z0mz3dpp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 14:28:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMb2p5WRFz3bsp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 14:25:38 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 36DCC1A2682;
	Tue, 14 Jun 2022 06:25:36 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E0B631A2685;
	Tue, 14 Jun 2022 06:25:35 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 05267180222C;
	Tue, 14 Jun 2022 12:25:33 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	shengjiu.wang@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 6/7] ASoC: dt-bindings: fsl-sai: Add new property to configure dataline
Date: Tue, 14 Jun 2022 12:11:23 +0800
Message-Id: <1655179884-12278-7-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655179884-12278-1-git-send-email-shengjiu.wang@nxp.com>
References: <1655179884-12278-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"fsl,dataline" is added to configure the dataline of SAI.
It has 3 value for each configuration, first one means the type:
I2S(1) or PDM(2), second one is dataline mask for 'rx', third one is
dataline mask for 'tx'. for example:

fsl,dataline = <1 0xff 0xff 2 0xff 0x11>,

it means I2S type rx mask is 0xff, tx mask is 0xff, PDM type
rx mask is 0xff, tx mask is 0x11 (dataline 1 and 4 enabled).

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl-sai.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
index c71c5861d787..4c66e6a1a533 100644
--- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
@@ -49,6 +49,14 @@ Required properties:
 			  receive data by following their own bit clocks and
 			  frame sync clocks separately.
 
+  - fsl,dataline        : configure the dataline. it has 3 value for each configuration
+                          first one means the type: I2S(1) or PDM(2)
+                          second one is dataline mask for 'rx'
+                          third one is dataline mask for 'tx'.
+                          for example: fsl,dataline = <1 0xff 0xff 2 0xff 0x11>;
+                          it means I2S type rx mask is 0xff, tx mask is 0xff, PDM type
+                          rx mask is 0xff, tx mask is 0x11 (dataline 1 and 4 enabled).
+
 Optional properties:
 
   - big-endian		: Boolean property, required if all the SAI
-- 
2.17.1

