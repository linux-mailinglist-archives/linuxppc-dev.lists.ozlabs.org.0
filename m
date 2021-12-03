Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B73D4678D1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 14:51:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5DkH1MfRz3cYN
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 00:51:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=l7tDyt+Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 helo=bhuna.collabora.co.uk; envelope-from=ariel.dalessandro@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=l7tDyt+Q; 
 dkim-atps=neutral
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5Dj61t0jz30RS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 00:50:01 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 37B2C1F46E6C
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638539395; bh=5SXMGCa+TfmP8fr/3psu4C9pvK27zE6v9AXpJcy4HAw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l7tDyt+QZN8S7COxB5kxfE1gUulzvmNZFa2WwVLlyw02KzjTvZ7+EXgiuiunFVk6o
 heR6wOtkzrNXbrsjts0S5swFRKFzVF5R5EIg2Uz+7cLkMvLSDtNQlx2nMjC2dGF+Il
 usxTnCFi4YkEGYrdjs7JBKLw+7R1vfp8bbN0n6/7eitzmEnl68adC1iynenLkk+21R
 KJ5qTELBneiYl0/e93rCLabcQa/eRvYpyA7L/eMoBgpUUEZzMleMxxOC+UIg9Je5ld
 XmkFqQ/hesQeecPA2FFgYRMeLJ7E25kfddEi5NmkjK+VQvudXgy6pAsSVOC+v4Gpj9
 LDywwtjoFr1kQ==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] dt-bindings: sound: Rename tlv320aic31xx-micbias as
 tlv320aic31xx
Date: Fri,  3 Dec 2021 10:49:27 -0300
Message-Id: <20211203134930.128703-2-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
References: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: ariel.dalessandro@collabora.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz,
 nicoleotsuka@gmail.com, broonie@kernel.org, bcousson@baylibre.com,
 michael@amarulasolutions.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's use a more generic name, so other definitions for tlv320aic31xx
can be included.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../devicetree/bindings/sound/tlv320aic31xx.txt          | 2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts                     | 2 +-
 include/dt-bindings/sound/tlv320aic31xx-micbias.h        | 9 ---------
 include/dt-bindings/sound/tlv320aic31xx.h                | 9 +++++++++
 sound/soc/codecs/tlv320aic31xx.c                         | 2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 include/dt-bindings/sound/tlv320aic31xx-micbias.h
 create mode 100644 include/dt-bindings/sound/tlv320aic31xx.h

diff --git a/Documentation/devicetree/bindings/sound/tlv320aic31xx.txt b/Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
index e372303697dc..bbad98d5b986 100644
--- a/Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
+++ b/Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
@@ -58,7 +58,7 @@ The pins can be used in referring sound node's audio-routing property.
 
 Example:
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/sound/tlv320aic31xx-micbias.h>
+#include <dt-bindings/sound/tlv320aic31xx.h>
 
 tlv320aic31xx: tlv320aic31xx@18 {
 	compatible = "ti,tlv320aic311x";
diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
index 2f4d2e4e9b3e..4f9a7251a107 100644
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -11,7 +11,7 @@
 #include <dt-bindings/pinctrl/am43xx.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pwm/pwm.h>
-#include <dt-bindings/sound/tlv320aic31xx-micbias.h>
+#include <dt-bindings/sound/tlv320aic31xx.h>
 
 / {
 	model = "TI AM43x EPOS EVM";
diff --git a/include/dt-bindings/sound/tlv320aic31xx-micbias.h b/include/dt-bindings/sound/tlv320aic31xx-micbias.h
deleted file mode 100644
index c6895a18a455..000000000000
--- a/include/dt-bindings/sound/tlv320aic31xx-micbias.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_TLV320AIC31XX_MICBIAS_H
-#define __DT_TLV320AIC31XX_MICBIAS_H
-
-#define MICBIAS_2_0V		1
-#define MICBIAS_2_5V		2
-#define MICBIAS_AVDDV		3
-
-#endif /* __DT_TLV320AIC31XX_MICBIAS_H */
diff --git a/include/dt-bindings/sound/tlv320aic31xx.h b/include/dt-bindings/sound/tlv320aic31xx.h
new file mode 100644
index 000000000000..3a845fbba992
--- /dev/null
+++ b/include/dt-bindings/sound/tlv320aic31xx.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_TLV320AIC31XX_H
+#define __DT_TLV320AIC31XX_H
+
+#define MICBIAS_2_0V		1
+#define MICBIAS_2_5V		2
+#define MICBIAS_AVDDV		3
+
+#endif /* __DT_TLV320AIC31XX_H */
diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 4224b4b3cae6..f2222c37913e 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -32,7 +32,7 @@
 #include <sound/soc.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
-#include <dt-bindings/sound/tlv320aic31xx-micbias.h>
+#include <dt-bindings/sound/tlv320aic31xx.h>
 
 #include "tlv320aic31xx.h"
 
-- 
2.30.2

