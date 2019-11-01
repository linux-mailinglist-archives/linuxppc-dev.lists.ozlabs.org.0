Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ECBEC49D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 15:24:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474PZt08YbzF71P
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 01:24:22 +1100 (AEDT)
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
 header.b="goNZ5OE4"; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474MKn5WW3zF5Cn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 23:42:53 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id f5so7150637lfp.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Nov 2019 05:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=skc4BB3FfJVhrMQufim0pPb5lTLStBal+/ZiI3PgHrk=;
 b=goNZ5OE4tByzOYzAc1bKhKcL9oM+UBCCFrvDNLRRvcNalh8UnNn6w3j3/Q21+wi139
 yiMCFOFtB95G2/yRPf1PDZQuswYXEi69SttUocHkc6sMbHZBdFvyxel4r9/0e7RIvZPM
 c/eVWDJF9fTGzUPSul9kKDwPdfk36qWT5Kll4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=skc4BB3FfJVhrMQufim0pPb5lTLStBal+/ZiI3PgHrk=;
 b=oCZU2VKIhcVHFA0zaOxXkLKZNrbL3xwXYsgTcioG0ZdnaOgViW3T9uZz8j1r3eZiA/
 WF8b/sZbD991ORG9TqbU5HUVfNCHa0WKqRuQ3TpkW7UI18F48Du/AeUIIzNA7yAui7uY
 GE6cgPW9HV3/bU3vFGsEtGQ/YPp9UcqAl6gp6SSaDci3Xevyz1+AOFNBzx2V65sRIeIZ
 HwugrcSxxdlD/BUXHhwutBX8XO1bZvgMuHIXpKyXrE3t1/ZoxYRW2J7e/cLy0Di4oJ5m
 8quTZCS1TRr+BITjIQkgvGyfQ2hHqkQ23/GO4wXO/uxPWTkpsuvOD+ZMxvxQPdrgbBac
 Op+g==
X-Gm-Message-State: APjAAAWTSpHPP/3V/GYAjJoXCSaXm6C4pbqK39ikiISC1n/esvXu++0/
 ERYHsID71SB/61ZQXxrQILMfaI1FckJBiiaC
X-Google-Smtp-Source: APXvYqx+LkhhsdE4uicd68kleysrFNvL7csaxcY4M/SzGwCUFxmQjOfm//4bJ58IrETbPNpw6KnCjQ==
X-Received: by 2002:a19:8c1c:: with SMTP id o28mr7221433lfd.105.1572612169565; 
 Fri, 01 Nov 2019 05:42:49 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id o26sm2458540lfi.57.2019.11.01.05.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 05:42:49 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 28/36] serial: ucc_uart: explicitly include soc/fsl/cpm.h
Date: Fri,  1 Nov 2019 13:42:02 +0100
Message-Id: <20191101124210.14510-29-linux@rasmusvillemoes.dk>
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
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This driver uses #defines from soc/fsl/cpm.h, so instead of relying on
some other header pulling that in, do that explicitly. This is
preparation for allowing this driver to build on ARM.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/tty/serial/ucc_uart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index a0555ae2b1ef..7e802616cba8 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -32,6 +32,7 @@
 #include <soc/fsl/qe/ucc_slow.h>
 
 #include <linux/firmware.h>
+#include <soc/fsl/cpm.h>
 #include <asm/reg.h>
 
 /*
-- 
2.23.0

