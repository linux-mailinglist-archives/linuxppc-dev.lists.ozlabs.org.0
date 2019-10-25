Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D78EDE4BCC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 15:08:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4704DK0q1JzDqj4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 00:08:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="i58fVaUP"; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4703d50k3JzDqSk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 23:41:12 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id q28so1628715lfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 05:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fgKnxJ1wOt4EIZwRcA9XPxDbDGGhVcBvHA7yIdz2HCY=;
 b=i58fVaUPnJK7wm55cSIpzM94MYvaZzY+Sn1vefsKSTwyL6EPMdUr7hZeg8dREi+Hkr
 Ab6iCLKcMZsjQXTlNye4xQSNgvGRtroKi8gtUrwuSep0SzBezpStEJCBtnaSuh6YKwJU
 G2R+j1/b4sM4dOTtAUkxpe5bHoyj2eRQlcXHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fgKnxJ1wOt4EIZwRcA9XPxDbDGGhVcBvHA7yIdz2HCY=;
 b=RBhMa7j6c8fOJT1jX1AVJx4JGHdYsbcU6P26Zq83mKNW1sT+fhPtcDp4qUCKrqpBtr
 u9jFRZg2MxzlTEnMsdzCVALfaI5FlSoYjw1fHT3Jk8gRHPzz6nMVQ9LLpBmlOfVmSRzP
 YdAnalnsmvub3osEIAO1TfUPjrqc9Xuv+AhGJrgf5s29dmurrDKObsk5L53FTLjL+wiC
 kwidDZtqMMgG4rta87A3nCoWvxPSknbuIv50We6rUnveI1xG8oX8ym0HR/uKG2TigxgV
 YmRg5UadmbgQ+HmBz3wWOtDbsvFW4lOgKbI1zOV9A+cikuqxI9GpStHlFgJnhGHBrTBt
 cAPw==
X-Gm-Message-State: APjAAAXKuZVvleFcFK+cItMgB2hd/uPc6jrE2UZZjI+/DRcI8bghmp7c
 DYd+6vWaXbuvDvSdLg59l/2a0g==
X-Google-Smtp-Source: APXvYqyIT2xLWVoaJP+X3MZLfQiywdsydM/+DaqNZhO2Hd1pHXm0z/JSsmbXZuo+4b142OCkiN3qWA==
X-Received: by 2002:ac2:4436:: with SMTP id w22mr2568863lfl.161.1572007268911; 
 Fri, 25 Oct 2019 05:41:08 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id 10sm821028lfy.57.2019.10.25.05.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 05:41:08 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 05/23] soc: fsl: qe: qe.c: guard use of pvr_version_is()
 with CONFIG_PPC32
Date: Fri, 25 Oct 2019 14:40:40 +0200
Message-Id: <20191025124058.22580-6-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025124058.22580-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-1-linux@rasmusvillemoes.dk>
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
Cc: Valentin Longchamp <valentin.longchamp@keymile.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit e5c5c8d23fef (soc/fsl/qe: only apply QE_General4 workaround on
affected SoCs) introduced use of pvr_version_is(), saying

    The QE_General4 workaround is only valid for the MPC832x and MPC836x
    SoCs. The other SoCs that embed a QUICC engine are not affected by this
    hardware bug and thus can use the computed divisors (this was
    successfully tested on the T1040).

I'm reading the above as saying that the errata does not apply to the
ARM-based SOCs with QUICC engine. In any case, use of pvr_version_is()
must be guarded by CONFIG_PPC32 before we can remove the PPC32
dependency from CONFIG_QUICC_ENGINE, so introduce qe_general4_errata()
to keep the necessary #ifdeffery localized to a trivial helper.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index bcdec37b25ca..0ddf83d8e3ce 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -197,6 +197,14 @@ EXPORT_SYMBOL(qe_get_brg_clk);
 #define PVR_VER_836x	0x8083
 #define PVR_VER_832x	0x8084
 
+static bool qe_general4_errata(void)
+{
+#ifdef CONFIG_PPC32
+	return pvr_version_is(PVR_VER_836x) || pvr_version_is(PVR_VER_832x);
+#endif
+	return false;
+}
+
 /* Program the BRG to the given sampling rate and multiplier
  *
  * @brg: the BRG, QE_BRG1 - QE_BRG16
@@ -223,7 +231,7 @@ int qe_setbrg(enum qe_clock brg, unsigned int rate, unsigned int multiplier)
 	/* Errata QE_General4, which affects some MPC832x and MPC836x SOCs, says
 	   that the BRG divisor must be even if you're not using divide-by-16
 	   mode. */
-	if (pvr_version_is(PVR_VER_836x) || pvr_version_is(PVR_VER_832x))
+	if (qe_general4_errata())
 		if (!div16 && (divisor & 1) && (divisor > 3))
 			divisor++;
 
-- 
2.23.0

