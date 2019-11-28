Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6039410CD83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 18:12:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P42D4Lp8zDr7Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 04:12:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="Cu0pEa3D"; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P13S5rclzDqsr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:58:12 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id m30so18410655lfp.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ApKAjcbgk3TFllS4KVlYulsx0IXhA9sg3keVA4kG7Kg=;
 b=Cu0pEa3DGH8Jq4DqyrRVVK+6bn2ungANZKmPnurdLgGvoCh7zh9ab2EKVG+2ifp9f9
 rF8n9op4NSmEteqozoQv7Ma5TFukZVpXhMk//1OFvFLfiiCXPFq6mIrgqPDMuC4k0F+i
 tPXfxNLVhzbivJVrd/o409oUcl06X8HPclCC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ApKAjcbgk3TFllS4KVlYulsx0IXhA9sg3keVA4kG7Kg=;
 b=Eav/ipU1KbfNUHbLF1bH+frfME7B6ZVLLuWKTuidrsaNEgLWEkCttCqxkYQ3N+cgr4
 33zahTrHfNIdVgEH0vLkc4kE2po2tiF2uoRg/k0HQRaWA2yrkM0pccuF/9gcSYPGqB62
 ea8qwRJjj5hRZawr4zIyUUUXwamzXbPXI1M9R9mODFIewGPmsNNCGjBT5KJoVjSmfo++
 I9qo0A3fzZq4Zyp27jST5wnKU6NVwAzE4vLDmqQav9vYucfAAwJ15Ke+bqhbwalQf29w
 GfwAbJvjOgszb84v/aL9h1VGX6gma3jvHe6n97a0I90LdwxUDTTjLIS50FKBB4K7upyC
 QBCw==
X-Gm-Message-State: APjAAAUDcnPhlpmXtoW/Pim6BN97DCzuvyPJoiOwboquOMqo0/IrFSXZ
 1HJhf2N6EI1NuqxWbhlG99dtUw==
X-Google-Smtp-Source: APXvYqwJ2pFRjS+aCBBi6M5p/vBXoIE7qINVl1Cxd1FpO3O+0xRHnhugtUuDHZc9+RuUfUWk5qB68w==
X-Received: by 2002:ac2:4adc:: with SMTP id m28mr8797486lfp.26.1574953087899; 
 Thu, 28 Nov 2019 06:58:07 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:58:07 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 49/49] soc: fsl: qe: remove PPC32 dependency from
 CONFIG_QUICC_ENGINE
Date: Thu, 28 Nov 2019 15:55:54 +0100
Message-Id: <20191128145554.1297-50-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are also PPC64, ARM and ARM64 based SOCs with a QUICC Engine,
and the core QE code as well as net/wan/fsl_ucc_hdlc and
tty/serial/ucc_uart has now been modified to not rely on ppcisms.

So extend the architectures that can select QUICC_ENGINE, and add the
rather modest requirements of OF && HAS_IOMEM.

The core code as well as the ucc_uart driver has been tested on an
LS1021A (arm), and it has also been tested that the QE code still
works on an mpc8309 (ppc). Qiang Zhao has tested that the QE-HDLC code
that gets enabled with this works on ARM64.

Reviewed-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index cfa4b2939992..357c5800b112 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -5,7 +5,8 @@
 
 config QUICC_ENGINE
 	bool "QUICC Engine (QE) framework support"
-	depends on FSL_SOC && PPC32
+	depends on OF && HAS_IOMEM
+	depends on PPC || ARM || ARM64 || COMPILE_TEST
 	select GENERIC_ALLOCATOR
 	select CRC32
 	help
-- 
2.23.0

