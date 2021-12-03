Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBDF4678DB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 14:51:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5Dkz18wYz3ck5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 00:51:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=X7YFdJ4S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=ariel.dalessandro@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=X7YFdJ4S; 
 dkim-atps=neutral
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5Dj74093z3bhh
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 00:50:03 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id C20161F46E6D
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638539400; bh=EUOOj1w5o/+kj169E0ovMXoLxYesUiGRUYC6RdweQy8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X7YFdJ4S5uPncfB66kSY/ujNMHRrPRuCMZ7xNTVBSyp+xHujyxIwl8TVi5RJM/OIF
 qFACkQCk0Kmu+kwz9RNIRthQUfHR//fehHk7z2bPTCs7+aEN6zUKKuL9nXwZiYIC9u
 j/yR9r0FCnDfIbILm/d6xoqhEYFUULV0LvIgU1m2i8ewP/H2Euqyv8yroEOX5NPXb9
 SzLC/NCiWhHFLg9ndrpL+5nIWfksHSxdhPWilngCvqEXvCKlD089aKNkrum4QfXRRt
 MnCOLIs8qYo5MJGuFz+rUS0X/bO6dJTFqSUP7g6rxLYfi8ZK8e+ClIIgHEUM2wa2ys
 nge9Z6jKKi3Jw==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] dt-bindings: tlv320aic31xx: Define PLL clock inputs
Date: Fri,  3 Dec 2021 10:49:28 -0300
Message-Id: <20211203134930.128703-3-ariel.dalessandro@collabora.com>
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

Add constants for the different PLL clock inputs in tlv320aic31xx.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 include/dt-bindings/sound/tlv320aic31xx.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/sound/tlv320aic31xx.h b/include/dt-bindings/sound/tlv320aic31xx.h
index 3a845fbba992..4a80238ab250 100644
--- a/include/dt-bindings/sound/tlv320aic31xx.h
+++ b/include/dt-bindings/sound/tlv320aic31xx.h
@@ -6,4 +6,9 @@
 #define MICBIAS_2_5V		2
 #define MICBIAS_AVDDV		3
 
+#define PLL_CLKIN_MCLK		0x00
+#define PLL_CLKIN_BCLK		0x01
+#define PLL_CLKIN_GPIO1		0x02
+#define PLL_CLKIN_DIN		0x03
+
 #endif /* __DT_TLV320AIC31XX_H */
-- 
2.30.2

