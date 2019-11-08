Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DABF4D54
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 14:37:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478hCv3FG1zF74X
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 00:37:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="AWL4Blnx"; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gQF565PzF6qJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:01:41 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id k15so6144321lja.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kyeKnOkwmKeZFZzRl62UDL9FeDrPQAcAwjRLFXYmB4s=;
 b=AWL4BlnxggywgAuCQF9TZmvfyD1xgx+d4KcuFAXs5z0SjvgeOT8ufhw+0kLd6irh+k
 LWFYtzapxaTuBh/+hzavZstnGb4XF7eUmqtgUl25ZK4pjgZG3d9UIH1hjWv04ZBgdYit
 n1G4bDAqkSP9msbsWTTT49q+Qpi/lQ/IdwTJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kyeKnOkwmKeZFZzRl62UDL9FeDrPQAcAwjRLFXYmB4s=;
 b=T0FOJYFnrSgEJr77h3v234QTVCdSiNHRr6um08pyivYRyP4De4dCvGCLnsoztRd88M
 wjpohPt2zUIw0HRkJTbaEXMnnZLobwTuHYtao4+hKyImZckmIs/gEB1hCUjepggdsyKv
 4hmgGZ9qlb5xP1ySrUuKS3KBo9nL/OD+gP/KTpuNNbo6N7PqnWNk1vdywOZBJv+i4Ukk
 kPUCQ6LRysgcUjGc94qKDeW3s6yL1vBIVRUZyoi56EpkHJoaAa8Nj0rXGJFcvrUmmWsF
 FnskOlZI5HmAEAOBdGhMjdwtMKQS4PLE4gXasWv5dMaecOuXBYt3MCwY8YVKYCs3H9Bf
 zWBw==
X-Gm-Message-State: APjAAAUkhc0Cm0kXisiMQoti015fZNxj0zmGrd/1LstTI/Y0W6x+WYFR
 kSqWYrz3BHGPZ40pgZbkwIMkuQ==
X-Google-Smtp-Source: APXvYqxxzgl3V5o2TwDPF+SxfEJQQMlY/U/MArtCXbnEjF83JFE0HGJ+v+jIFpYrTXQzamx1BSnEhw==
X-Received: by 2002:a2e:558:: with SMTP id 85mr6764276ljf.67.1573218098161;
 Fri, 08 Nov 2019 05:01:38 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:01:37 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 08/47] soc: fsl: qe: drop unneeded #includes
Date: Fri,  8 Nov 2019 14:00:44 +0100
Message-Id: <20191108130123.6839-9-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
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

These includes are not actually needed, and asm/rheap.h and
sysdev/fsl_soc.h are PPC-specific, hence prevent compiling QE for
other architectures.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe.c    | 5 -----
 drivers/soc/fsl/qe/qe_io.c | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index 1d8aa62c7ddf..a4763282ea68 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -26,13 +26,8 @@
 #include <linux/crc32.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of_platform.h>
-#include <asm/irq.h>
-#include <asm/page.h>
-#include <asm/pgtable.h>
 #include <soc/fsl/qe/immap_qe.h>
 #include <soc/fsl/qe/qe.h>
-#include <asm/prom.h>
-#include <asm/rheap.h>
 
 static void qe_snums_init(void);
 static int qe_sdma_init(void);
diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
index 5e3471ac09dd..f6b10f38b2f4 100644
--- a/drivers/soc/fsl/qe/qe_io.c
+++ b/drivers/soc/fsl/qe/qe_io.c
@@ -18,8 +18,6 @@
 
 #include <asm/io.h>
 #include <soc/fsl/qe/qe.h>
-#include <asm/prom.h>
-#include <sysdev/fsl_soc.h>
 
 #undef DEBUG
 
-- 
2.23.0

