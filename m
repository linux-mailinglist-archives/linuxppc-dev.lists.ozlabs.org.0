Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFFB212F92
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 00:37:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yXyr055HzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 08:37:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=arnaud.ferraris@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
X-Greylist: delayed 643 seconds by postgrey-1.36 at bilbo;
 Fri, 03 Jul 2020 00:23:09 AEST
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yL0s1bVrzDqND
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 00:23:07 +1000 (AEST)
Received: from xps.home (unknown [IPv6:2a01:e35:2fb5:1510:315a:ecf0:6250:a3ed])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B97AB2A1D11;
 Thu,  2 Jul 2020 15:23:04 +0100 (BST)
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: 
Subject: [PATCH 1/4] dt-bindings: sound: fsl,
 asrc: add properties to select in/out clocks
Date: Thu,  2 Jul 2020 16:22:32 +0200
Message-Id: <20200702142235.235869-2-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:28:34 +1000
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
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>, linuxppc-dev@lists.ozlabs.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ASRC peripheral accepts a wide range of input and output clocks, but
no mechanism exists at the moment to define those as they are currently
hardcoded in the driver.

This commit adds new properties allowing selection of arbitrary input
and output clocks.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 Documentation/devicetree/bindings/sound/fsl,asrc.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
index 998b4c8a7f78..e26ce9bad617 100644
--- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
@@ -55,6 +55,12 @@ Optional properties:
 			  Ends, which can replace the fsl,asrc-width.
 			  The value is 2 (S16_LE), or 6 (S24_LE).
 
+   - fsl,asrc-input-clock	: Input clock ID, defaults to INCLK_NONE
+				  (see enum asrc_inclk in fsl_asrc.h)
+
+   - fsl,asrc-output-clock	: Output clock ID, defaults to OUTCLK_ASRCK1_CLK
+				  (see enum asrc_outclk in fsl_asrc.h)
+
 Example:
 
 asrc: asrc@2034000 {
@@ -77,4 +83,6 @@ asrc: asrc@2034000 {
 		"txa", "txb", "txc";
 	fsl,asrc-rate  = <48000>;
 	fsl,asrc-width = <16>;
+	fsl,asrc-input-clock = <0x3>;
+	fsl,asrc-output-clock = <0xf>;
 };
-- 
2.27.0

