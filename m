Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C128EC394
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 14:17:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474N5c6RQ0zF55W
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 00:17:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="U/f2h7Ju"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474MKH4HJyzF4r2
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 23:42:27 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id s4so10090082ljj.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Nov 2019 05:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KU/n1Q/VNXJbWwIQys/qt9rGcT4PXz5RLqrj6x2UwvM=;
 b=U/f2h7JuYhwgX+OxayXYbuI3nx0fL2I+VDpk0pE1JfCFpTOAsakC6TS3OYY61jFEGH
 Es7TiE/xRGdQOT/qPHZ/2VmMSA9H1E30CayCMWjQG4u5WbohQrKEwC61GH+dWiK6VIVk
 eLCUnrHW+TjhzZPa8JfiyQxWMYcrT3/fzJKb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KU/n1Q/VNXJbWwIQys/qt9rGcT4PXz5RLqrj6x2UwvM=;
 b=aoDymvvyGX2GN3fhr+JwLGWL9CihJyyxFinlwg2f7XYxneROcU/nBzX8eCjq9QAiVB
 YBAhQI6P0O331wjBDvFn2Jy24f4onsgG+Fl61EJSGQOMsTlGEG8ZKHsqrtMahJyTDa38
 J8QwW5hJdtEdaaL4GI1Qtqz3l6yBFAw9AYguLSkDW3VoJsqR6ygoZglYPtVNFrtrIjp1
 xgKMVCadZrfVMWKVQOzo/pIiVvfYyCJKlMiSk2maSaZFBgbskfSaiYvhDXqmKjG6i32p
 t4wb3pOoxsT9f3QQYCU7Q+7oenEqJUfNTRnxRgRDaY8+1OiMk5TuiyA8pIS5jhMf0lVf
 qO8g==
X-Gm-Message-State: APjAAAUEV8GKf90PV0/Xmiy5zLpM9/tJ+X8uP1J76MYXag1MwZEJ/dch
 Oe/ascy8f/L5t4UxWUhzLKkPBQ==
X-Google-Smtp-Source: APXvYqwpYar3cadRMDA9V3X/W/gSCAb+1mtgi5R0km/i5QsofsD6KmUR//aDEr/XEPgCrUcqdgAl9w==
X-Received: by 2002:a2e:89d3:: with SMTP id c19mr8219074ljk.201.1572612143860; 
 Fri, 01 Nov 2019 05:42:23 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id o26sm2458540lfi.57.2019.11.01.05.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 05:42:23 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 07/36] soc: fsl: qe: qe.c: guard use of pvr_version_is()
 with CONFIG_PPC32
Date: Fri,  1 Nov 2019 13:41:41 +0100
Message-Id: <20191101124210.14510-8-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191101124210.14510-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
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
Cc: Scott Wood <oss@buserror.net>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
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
index 85737e6f5b62..1d8aa62c7ddf 100644
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

