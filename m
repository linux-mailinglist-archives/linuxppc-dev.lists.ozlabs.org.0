Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2881FC573
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 12:36:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DKFG0T4YzF3R6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 22:36:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="kiaWUZsh"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DKBN5WYGzF7ms
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 22:34:04 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id z26so5290407wmi.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 03:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=hXXV/2kIvB08deAA2EN09TWub+GXZhxQylBGV0wly2o=;
 b=kiaWUZshTXZr77I5eM6Iord4uC+esCXUajeEDu2SLSeAXVtTQJxNXvn/FQxeDmINbP
 hT17ITCVf33E7Nuo5Pa2+FdnKKivHy4MyMPQj4CZH8O0ULOonqs1/Mepgy1lCxDcDDPo
 upBGlMw+9BhH8O2H4d2RY0V+vFjd6vM0zb3QqRYrGGOiaEwfmpMMoyhldK6cQ8vgcDHo
 9zQTdLi2HBjEGiZY49KODbfy6ti/XQ9hA8mH2PPqLNLouCSyZXIFF4NW8Y5QNvIW/7Yd
 /8KJ42P5CDv61U5sOVP7bcOPKI3zBjG5FL6it8hU7ucv8Nz4lbnbLUSrjLtHXxwnRcX7
 oNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hXXV/2kIvB08deAA2EN09TWub+GXZhxQylBGV0wly2o=;
 b=b2OVjESuJe/9Foo1tLjJ7HtCZDzyhcZK4EuUnYBpOKJAHxXCBa3Uq5My1kd99Vsrvi
 aFQc6E+EQD51+GDQk3jZV0Nze1KeUDk3YSdiAjrm1cMN+54Q9pscCM07M+8U1VT0IrDA
 IxncgIs+LDJmX2qEcUe1Rrnqqxp4kzPUe1cyoFMTLSDZecMwLBs0wbGxEL96Sxj+E+CM
 QUlEPy0iHjDfVWgttWRxEQXs45ziJdCEs3v0WkoqV8wq1vvVwhOLhcCnNM1iBQjzDzRB
 mQNWzq4HB7FRjMw89FL76d4Ms9v8oLBjiY+bMydenWSENBPvOD4hvsyQjhC27kcmonwX
 O2ww==
X-Gm-Message-State: APjAAAVAedrCB3kEfNY0Z1D9fXU5ghEGe+zTN6BWY6AhFvpoT3R7HEVc
 kTAW8BVFbRcNqfIqTQ2ruQPX9g==
X-Google-Smtp-Source: APXvYqwa7C+SZPaRzDCDqgtRRX+BdBhI757ORIAlSyB2X3yAtBSVEylfezUJgRJyC7Xi8Z+nZfWaVw==
X-Received: by 2002:a05:600c:230d:: with SMTP id
 13mr6806183wmo.159.1573731239464; 
 Thu, 14 Nov 2019 03:33:59 -0800 (PST)
Received: from localhost.localdomain
 (184.red-37-158-56.dynamicip.rima-tde.net. [37.158.56.184])
 by smtp.gmail.com with ESMTPSA id m187sm3324275wmf.35.2019.11.14.03.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 03:33:58 -0800 (PST)
From: richard.henderson@linaro.org
To: linux-crypto@vger.kernel.org
Subject: [PATCH] random: Make  RANDOM_TRUST_CPU depend on ARCH_RANDOM
Date: Thu, 14 Nov 2019 12:33:46 +0100
Message-Id: <20191114113346.25138-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Richard Henderson <richard.henderson@linaro.org>

Listing the set of host architectures does not scale.
Depend instead on the existance of the architecture rng.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 drivers/char/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index df0fc997dc3e..3c2123a23600 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -539,7 +539,7 @@ endmenu
 
 config RANDOM_TRUST_CPU
 	bool "Trust the CPU manufacturer to initialize Linux's CRNG"
-	depends on X86 || S390 || PPC
+	depends on ARCH_RANDOM
 	default n
 	help
 	Assume that CPU manufacturer (e.g., Intel or AMD for RDSEED or
@@ -559,4 +559,4 @@ config RANDOM_TRUST_BOOTLOADER
 	device randomness. Say Y here to assume the entropy provided by the
 	booloader is trustworthy so it will be added to the kernel's entropy
 	pool. Otherwise, say N here so it will be regarded as device input that
-	only mixes the entropy pool.
\ No newline at end of file
+	only mixes the entropy pool.
-- 
2.17.1

