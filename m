Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21074E4BE2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 15:17:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4704QM1ZRwzDqd3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 00:16:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="Cq8aDaHN"; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4703d85wJ1zDqSk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 23:41:16 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id v24so1618221lfe.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 05:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/UPJXileKtzgNTX19jaGjS3nvxXYAz4iWZyHIwwRbB8=;
 b=Cq8aDaHNDK2pJ1hz7Tm4r3n2o5xKlVmsy5GVlKTo3nhYXsZFH8YrV9Pe0Z4gso0sNE
 DoDf8PAe7XRAbnp8l7UsufUz5Ne84tTPq53S5Z/aGPYt2iQxgTFPztZHZWQk+5WoKfc6
 7Mv87tKK6TT/Y3EJlKu0GasI85IN6R0054Er8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/UPJXileKtzgNTX19jaGjS3nvxXYAz4iWZyHIwwRbB8=;
 b=W8tLQPk83wAvp+jPxXJgOQLlrtcVgEMB2s4XbfJFN08mJHsomwGPE3JiNSaExLoRDh
 dyuKhH/QXGa+ZRIg0At2TEK8slXdwKQ03JAB2pqrJ53yRDvT3rRe1JyZ6UYLL6aZuPYv
 a/2uJmMDNR+hG6KJztCPbh9POHHMn8ts/MyGJAhljpwgi2J9irQdGJoD52q9CfP6YHZx
 zcROtaWtKrNqLNELyfJAda8ZVgUDyMdv3PAR7jcJy/eDdoDAaLVMk1eX7ELwTqXTdQ0Z
 uS10eCBKsTTft4WtQoonFDrFM6tSFDBQB91DDfH3GHwRJ2eyptW33rKvbXst3a4dUcXG
 dT0g==
X-Gm-Message-State: APjAAAU9QVa7Pg/x7dQQhGd+WipeZk7AABw1YKQ8QNJJtSrQyiBEIE1n
 n4Y7pw+bae71s3aOtWrp2pOBCw==
X-Google-Smtp-Source: APXvYqwHXocQXaraXBs+SE4Qhjblpr6C5oHh7mfzGWp34LGpet8GNLf0m9E8p9RMgjBLdwcqkBBDTw==
X-Received: by 2002:a19:655b:: with SMTP id c27mr2621651lfj.122.1572007273137; 
 Fri, 25 Oct 2019 05:41:13 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id 10sm821028lfy.57.2019.10.25.05.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 05:41:12 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 08/23] soc: fsl: qe: drop unneeded #includes
Date: Fri, 25 Oct 2019 14:40:43 +0200
Message-Id: <20191025124058.22580-9-linux@rasmusvillemoes.dk>
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

These includes are not actually needed, and asm/rheap.h and
sysdev/fsl_soc.h are PPC-specific, hence prevent compiling QE for
other architectures.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe.c    | 5 -----
 drivers/soc/fsl/qe/qe_io.c | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index 0ddf83d8e3ce..48051a684458 100644
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
index 776a2c9361e1..93ba17d250a3 100644
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

