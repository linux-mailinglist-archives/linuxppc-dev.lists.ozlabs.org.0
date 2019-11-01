Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8B8EC4F9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 15:48:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474Q6S5dV0zF5Wn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 01:48:16 +1100 (AEDT)
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
 header.b="aJggUxwL"; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474ML01JQdzF5Cp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 23:43:04 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id q28so7153552lfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Nov 2019 05:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gyqRKyTXLr3cbd727hzyVbLDXzQNlutZJPmZlRbflNM=;
 b=aJggUxwL9FLbxqyLFcy7mPAsdu7B5NE3B0CcDXY5Xq3/1jU1wpEbTBIRlA5TdkovvK
 YrBP1OnWco5wWah9kA7xb6Uul3pCywE5VSldtrcZOf0D9aO5FvHxB4ekLfnZtOcOgaQa
 KXg1qmuWEC/xejE1gjB3RPnrIhT61rNL3oNHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gyqRKyTXLr3cbd727hzyVbLDXzQNlutZJPmZlRbflNM=;
 b=ONArzsd49W47wnKO7N2cYp4Fxdb8xmqYAYYQtDf8vas548jzb6baiElVSjdCNv1wL7
 oe/Zv00E5TmcHnhpOLXU3rkMCCOaCNwq/TqrFkkW8fq7x+2B7N/Qf+Z4yvJD3RQbPWwg
 CH/+onkajwtrAsk2vDYcb85xUogCRuqMSRe8+wfMnMSCMVwoNUbw5gaLHP6VQwFJGqYh
 7FhzpxAb0hBkN4kkzDBUK/stzP+3IHd9bW+RMMObtcFkftLEoIk5UzB6CPG98ktMTM6a
 e9YY5XmmFWwXn7L4AClpPB3kCgVo+RYdUuWI86wjTDxGyR7hc9rDHzL/AeKZt9xldGvh
 OuJg==
X-Gm-Message-State: APjAAAX+6FdxXGPTRnrEfj7WcXeVQVGHgcmH1KVh9PkS8MVMuOYQHQkW
 PJRI70er1Cyw0Js3yGw50m36QQ==
X-Google-Smtp-Source: APXvYqy4fEEOS681BI9of8caQte+TOAv9T+4kQxBaUmvtiH4cO+gztE83kQOLok3stailVX2gSWAwA==
X-Received: by 2002:ac2:420a:: with SMTP id y10mr7037550lfh.65.1572612177646; 
 Fri, 01 Nov 2019 05:42:57 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id o26sm2458540lfi.57.2019.11.01.05.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 05:42:57 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 35/36] net/wan: make FSL_UCC_HDLC explicitly depend on PPC32
Date: Fri,  1 Nov 2019 13:42:09 +0100
Message-Id: <20191101124210.14510-36-linux@rasmusvillemoes.dk>
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
Cc: netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, FSL_UCC_HDLC depends on QUICC_ENGINE, which in turn depends
on PPC32. As preparation for removing the latter and thus allowing the
core QE code to be built for other architectures, make FSL_UCC_HDLC
explicitly depend on PPC32.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/net/wan/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wan/Kconfig b/drivers/net/wan/Kconfig
index dd1a147f2971..78785d790bcc 100644
--- a/drivers/net/wan/Kconfig
+++ b/drivers/net/wan/Kconfig
@@ -270,7 +270,7 @@ config FARSYNC
 config FSL_UCC_HDLC
 	tristate "Freescale QUICC Engine HDLC support"
 	depends on HDLC
-	depends on QUICC_ENGINE
+	depends on QUICC_ENGINE && PPC32
 	help
 	  Driver for Freescale QUICC Engine HDLC controller. The driver
 	  supports HDLC in NMSI and TDM mode.
-- 
2.23.0

