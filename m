Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA50A91E768
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 20:27:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ImT+Hj/5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCZK649QDz3dK4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 04:27:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ImT+Hj/5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCZJR44Fyz3cB2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 04:27:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EBB8FCE1A96;
	Mon,  1 Jul 2024 18:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8271C116B1;
	Mon,  1 Jul 2024 18:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719858420;
	bh=wDmAHasbwyDrav/gjz/1HfTelzHzs8MHoUaZv+UsTFU=;
	h=From:Date:Subject:To:Cc:From;
	b=ImT+Hj/5dJ6/oeZzaMtoDUKPqVouhuQg5ZghBti5V/Zb9CIbeYILdEXNobBZR7OZM
	 6/F3s18gDPLwS+5+BU46R/28U5CRFYH300eR7xtiMYAZ6jFeY7nFfgWsfVAwRLdB6X
	 L/LaGyvl6O+1EiVdU4/vyUMtUjWrHEldxrMEU0AN5YmlcUoUP9slhUx4qFk8hMaG6m
	 aTI03n62QvpZUZzHSI6aaIrdrn6ji1Owb0G2Db7Q8mpLPwCXlE6AX/u4fqVLerKtMY
	 sAB8NKe6T8mPqmCt3Uljd1pNc6i9Y9ufOs9XP1MJgXuc8Uf8FvuA8V0JexnQMJid5H
	 Vd0gB9q7jZAOw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 01 Jul 2024 11:26:38 -0700
Subject: [PATCH] ASoC: fsl: lpc3xxx-i2s: Include bitfield.h for FIELD_PREP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-lpc32xx-asoc-fix-include-for-field_prep-v1-1-0c5d7f71921b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAN30gmYC/x3NXQrDIBAE4KuEfe7Cai39uUopxeimXRAVJUUIu
 XuWPn7DMLNB5ybc4TFt0PgnXUpWmNME4evzh1GiGixZR1cymGo42zHQ9xJwkYGSQ1oj41KamlN
 818YVjaM439zFW7qDrmmo7f/T87XvB2yNv3N5AAAA
To: Mark Brown <broonie@kernel.org>, 
 "J.M.B. Downing" <jonathan.downing@nautel.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810; i=nathan@kernel.org;
 h=from:subject:message-id; bh=wDmAHasbwyDrav/gjz/1HfTelzHzs8MHoUaZv+UsTFU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGlNXz7XTWQI3vX8Z+WFtsqwSZJCPwvOnNXlsv5SxPirZ
 kJz3ErpjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRDdUM//PUFujO11fQ/po4
 a/MK4bnLf+Qp95d/YJv2suyfgmVs0VGG//XZ6ayv2O4oq+azrayL5L9ReDj6jHw/e+utz4FWN97
 q8AEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: alsa-devel@alsa-project.org, patches@lists.linux.dev, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

bitfield.h is not explicitly included but it is required for FIELD_PREP
to be expanded by the preprocessor. If it is not implicitly included,
there will be a compiler error (as seen with ARCH=hexagon allmodconfig):

  sound/soc/fsl/lpc3xxx-i2s.c:169:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    169 |                 tmp |= LPC3XXX_I2S_WW8 | LPC3XXX_I2S_WS_HP(LPC3XXX_I2S_WW8_HP);
        |                        ^
  sound/soc/fsl/lpc3xxx-i2s.h:42:30: note: expanded from macro 'LPC3XXX_I2S_WW8'
     42 | #define LPC3XXX_I2S_WW8      FIELD_PREP(0x3, 0) /* Word width is 8bit */
        |                              ^
  sound/soc/fsl/lpc3xxx-i2s.c:205:34: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    205 |                              LPC3XXX_I2S_DMA1_TX_EN | LPC3XXX_I2S_DMA0_TX_DEPTH(4));
        |                                                       ^
  sound/soc/fsl/lpc3xxx-i2s.h:65:38: note: expanded from macro 'LPC3XXX_I2S_DMA0_TX_DEPTH'
     65 | #define LPC3XXX_I2S_DMA0_TX_DEPTH(s) FIELD_PREP(0xF0000, s) /* Set the DMA1 TX Request level */
        |                                      ^
  sound/soc/fsl/lpc3xxx-i2s.c:210:34: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    210 |                              LPC3XXX_I2S_DMA0_RX_EN | LPC3XXX_I2S_DMA1_RX_DEPTH(4));
        |                                                       ^
  sound/soc/fsl/lpc3xxx-i2s.h:70:38: note: expanded from macro 'LPC3XXX_I2S_DMA1_RX_DEPTH'
     70 | #define LPC3XXX_I2S_DMA1_RX_DEPTH(s) FIELD_PREP(0x700, s) /* Set the DMA1 RX Request level */
        |                                      ^

Include bitfield.h explicitly, so that FIELD_PREP is always expanded,
clearing up the compiler error.

Fixes: 0959de657a10 ("ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/fsl/lpc3xxx-i2s.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/lpc3xxx-i2s.h b/sound/soc/fsl/lpc3xxx-i2s.h
index eec755448478..b6657853017a 100644
--- a/sound/soc/fsl/lpc3xxx-i2s.h
+++ b/sound/soc/fsl/lpc3xxx-i2s.h
@@ -9,6 +9,7 @@
 #ifndef __SOUND_SOC_LPC3XXX_I2S_H
 #define __SOUND_SOC_LPC3XXX_I2S_H
 
+#include <linux/bitfield.h>
 #include <linux/types.h>
 #include <linux/regmap.h>
 

---
base-commit: 55f0a1fa6ea4e339c797e9a3292ca0caa4ab3885
change-id: 20240701-lpc32xx-asoc-fix-include-for-field_prep-140db845a209

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

