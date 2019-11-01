Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 757F2EC50D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 15:50:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474Q9F4gPYzF78y
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 01:50:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="H/DAgeFp"; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474ML06sy2zF5CZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 23:43:04 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id v4so7127407lfd.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Nov 2019 05:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OvUZNskoObmKKJYsbx/wH8iXu8sDYM+jDByiAdju3Rg=;
 b=H/DAgeFpcXJo0tjQoKHDP9cxo5/LdWTfUYmStbr2surKVlSluXRlwhQhQqZBDV3k8Q
 V8XC7DhjRHkNy4MfzEF3RCs5zjs3EyE2i5o/5CqiOOUhAXU+FENj52DK5J/CDQ4y4ykB
 JZklD1t78EAgDyVROxcq9bHmO3TgMHqlhpfuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OvUZNskoObmKKJYsbx/wH8iXu8sDYM+jDByiAdju3Rg=;
 b=o7d5lD+7sRoBqATY1bWZkl8iJAZVmlqz2gemPg5u8zzFEpfBOV5PhXMZiNAJIYNliM
 6AoJ7rKv9kNO0T+Ef+TWu40ywofCyRNqq0MKkfs1HQF8/lm9f6VTHNsgFq4uqFIB3cHJ
 Dk1BDteoAiSDQPbcP+cNTm3ist9WJSrqgTpnRHLCkDIoiknp7DEydPdJ60XJv5+rGTXJ
 EckfHUrl9GrrEaOTLeknBFNda7DBDxYTU316HvEZgdPTU6UaguHbMKBPz8sYXAQ6sK0K
 5HEDLvZJW5bEjog65al6saH8j50P+37feTtjaKzycwIqWFurlFnlI80tQVuKbQoEBNuh
 QkYA==
X-Gm-Message-State: APjAAAU2fODl8IB4v6S/W3lNKG3D4ceNm4zArlFov08KrneSBcNE/ZKn
 Aq9zMFgGhQM8FWPWB3U7phzGHA==
X-Google-Smtp-Source: APXvYqwI3iIuteE6/4JNe1O8E/8fB4CE3gTkq92/iVMjvlls7ufSCpNe/zR7/3vjwyl2n4K9sKAH+A==
X-Received: by 2002:a05:6512:146:: with SMTP id
 m6mr6989528lfo.98.1572612178764; 
 Fri, 01 Nov 2019 05:42:58 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id o26sm2458540lfi.57.2019.11.01.05.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 05:42:58 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 36/36] soc: fsl: qe: remove PPC32 dependency from
 CONFIG_QUICC_ENGINE
Date: Fri,  1 Nov 2019 13:42:10 +0100
Message-Id: <20191101124210.14510-37-linux@rasmusvillemoes.dk>
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

The core QE code now also builds for ARM, so replace the FSL_SOC &&
PPC32 dependencies by the more lax requirements OF && HAS_IOMEM.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index cfa4b2939992..0c5b8b8e46b6 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -5,7 +5,7 @@
 
 config QUICC_ENGINE
 	bool "QUICC Engine (QE) framework support"
-	depends on FSL_SOC && PPC32
+	depends on OF && HAS_IOMEM
 	select GENERIC_ALLOCATOR
 	select CRC32
 	help
-- 
2.23.0

