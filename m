Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F489E4EBE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 16:17:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4705mP3QRxzDqgD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 01:17:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="fN9FLv1T"; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4703dW6CzTzDqdG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 23:41:35 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id v8so1610907lfa.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 05:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qFJ5knvRmhJ/ykv6ig7dLhGdF7aP5T5p7rUQ0Zs3NtI=;
 b=fN9FLv1TWt9RmdqJPXYJ1BSICN8810u9B90Dtb66/JKKA8kMmjNMG4Z/Vi2NepiVHv
 U71PRBKlbkRbFHhqbC5PMO652qEYoi77kvUe0e46Ve9Kh+Xpu4hungqtf/54qh0BBEAR
 F9UUwkQt99O82HP3vUEdNXGLHMuCUCABaicHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qFJ5knvRmhJ/ykv6ig7dLhGdF7aP5T5p7rUQ0Zs3NtI=;
 b=WpgeyPvD7uioSUqv2Pqut2BWFiVcpSiRoW9PB0giGn43Im0VMrkgN96VM/sl38adBG
 HNY8RGfq5s1uTk6NG5EhGSocIS1HpdJp1eXACzqYtZ6tEiRyVhnrP33Qkg/26ZB1cfQp
 u6Z5lhJIsMtU9SXwZfC+t3HvYG6XDp5IQZDPxbcAKEyNEPH5fKE92vHvBduetbgFnEUh
 V0UA0dmLx2rTfgCW6qiP6OWSc38XThR7ERfhLdl/8NFBW3z87SlYKlkWdB5iU+go6uxH
 wctxVISmgL8Jijr9PAIs9AVcTMNHBbFQjRqre11YaHlhhk4radyKbqEvchndUXHaMQP8
 dObw==
X-Gm-Message-State: APjAAAXfhAi+cGmb0gnwKw6vk99rogrgCM6lV3inwD9hIPAjX7YCB45F
 hKAsJr68+Lor8lwVmtIo0Jb7yQ==
X-Google-Smtp-Source: APXvYqwTKAlx+8gqS83r5t1J60mX4EbEf9p/r/d9BH0dUVal/pLCp3KxgEe9mUFMqZVTpXniZZQs0w==
X-Received: by 2002:ac2:55b4:: with SMTP id y20mr2600154lfg.173.1572007291311; 
 Fri, 25 Oct 2019 05:41:31 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id 10sm821028lfy.57.2019.10.25.05.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 05:41:30 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 22/23] soc/fsl/qe/qe.h: remove include of asm/cpm.h
Date: Fri, 25 Oct 2019 14:40:57 +0200
Message-Id: <20191025124058.22580-23-linux@rasmusvillemoes.dk>
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

asm/cpm.h only exists on PPC, so this prevents use of this header on
other platforms. Drivers that need asm/cpm.h (and are thus inherently
PPC-specific) must include that explicitly.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 include/soc/fsl/qe/qe.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index c1036d16ed03..3768c226490e 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -17,7 +17,6 @@
 #include <linux/spinlock.h>
 #include <linux/errno.h>
 #include <linux/err.h>
-#include <asm/cpm.h>
 #include <soc/fsl/qe/immap_qe.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-- 
2.23.0

