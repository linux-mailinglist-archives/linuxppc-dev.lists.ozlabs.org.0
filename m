Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4548710CCA9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 17:18:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P2rT3JbHzDqGv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 03:18:49 +1100 (AEDT)
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
 header.b="B5Dv63RR"; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P12w3lvtzDqsL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:57:44 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id m30so18409689lfp.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qF5A7O/IvrSbLrPy3H+9dqWM8UA+mIW6ZOrUrJXGJ2Q=;
 b=B5Dv63RR/4pl4ZTNUITqsFRQQZ5TAI+PA/AhP8AenPQ4xG7rpFpGcDBxA0xbml85u5
 oiAdj7WL2T+g4bt3ulClOJHjd19qEsp17OzR97zqwpMNOOndADtLGUvta4gcSO+d5iga
 juT6tqHk6l4CJNz6EPeJxH8b9Gv9Dl9QSZehg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qF5A7O/IvrSbLrPy3H+9dqWM8UA+mIW6ZOrUrJXGJ2Q=;
 b=beK64Gi7kWDxdK/vNIz12dHVPUcC8wt2656CuQ03asjaC8/N5MNvzxc31ZGmJoemmk
 rbdzVk9YFDKtBT7oiAFfExjhbDBnoqWb2iC/Izl0g/XDxVXXX3bDlMWny0xPmiKQoUw0
 zm/2tNtpd1qjRQLU6e9K8Upl6N1BsDTMdA8OnmUjD1Qw5wki85ggjgtZznovBP0uwxV4
 14IeSYPDvjG9Z8+/Lei5nEQsSkzOgOhITKmWgaI9fIvNogIBPp2uaJAQsP5v8ZjRTPtQ
 PYPwqSgImSmMSAiGOcfxrkfTR3IKVwgEFwYISATZHvcoXT6hizjyw6pBJ+zjGrM7J6Cl
 oUYg==
X-Gm-Message-State: APjAAAUzro7/YSL6GMBHp1D/83hIKwV3o8AQPazFZejLI7bSgIR9OP0+
 4G0epjjZX4JgWaWwCRHuPmXNEChqC7i0X5h7
X-Google-Smtp-Source: APXvYqwJE77ccwhGv7KUUNqfmf/Szn+K7DK68gwlig7WSVAkchsABzo/HLFah4BDnOh9yuV4ngQ3xw==
X-Received: by 2002:ac2:42c2:: with SMTP id n2mr4840125lfl.152.1574953060221; 
 Thu, 28 Nov 2019 06:57:40 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:39 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 27/49] soc/fsl/qe/qe.h: update include path for cpm.h
Date: Thu, 28 Nov 2019 15:55:32 +0100
Message-Id: <20191128145554.1297-28-linux@rasmusvillemoes.dk>
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

asm/cpm.h under arch/powerpc is now just a wrapper for including
soc/fsl/cpm.h. In order to make the qe.h header usable on other
architectures, use the latter path directly.

Reviewed-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 include/soc/fsl/qe/qe.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index 9cac04c692fd..521fa3a177e0 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -17,7 +17,7 @@
 #include <linux/spinlock.h>
 #include <linux/errno.h>
 #include <linux/err.h>
-#include <asm/cpm.h>
+#include <soc/fsl/cpm.h>
 #include <soc/fsl/qe/immap_qe.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-- 
2.23.0

