Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59579DC5D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 15:14:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vmhN2nLNzDrj2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 00:14:12 +1100 (AEDT)
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
 header.b="I8XtwIaY"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vmCp5SkwzDrVT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 23:52:54 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id a22so6132947ljd.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 05:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zynimEHSa2z793BfmzBbQkfkisgqCtAkV6BR9OsqlmE=;
 b=I8XtwIaYLYlfxg9NNy6ELtflmn8AM1cj4JKiG746px15j1nQkF152ypbwtndZWIK6U
 fpsGGyBDxtjg7QmbR17VQAv77y3IUubgjwsdpncHc0qga1+kFg35E3D1g6NMY/X4MLte
 gBtvKk3S2nRNRmpwOlubL7lPWAZnrDp9bGpmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zynimEHSa2z793BfmzBbQkfkisgqCtAkV6BR9OsqlmE=;
 b=lVdfYYJupCdSeMy3HVoM30oT1/6iLXFGQxtHO1rrxO2O+G88kum24llmgphLWK5Zya
 y69ovzqzEeExqxLY2gWcyuuX46nOls6RX8TOoOJw0aq8VYOg8K2tfPrq6C3hAoA/afgK
 fXZsupVoa2XRhMj+lyCHmVQS+Faf8W8ztmhNeEKJ2IcWk0TX1rniTF3y3p0tlrQ1CEvO
 ydc/g7047i+kVbh2mgt/1xeYMoKuKywXhMe46cCvRDediB+xM1dvnKVJHNA/dXoP0ZOg
 YDWrG9RC385BlyGN4otREINiJeyuT9g0xG1C+A4fyfKMJ9MAyDpl4n/X6XGfDMneVw1E
 35zA==
X-Gm-Message-State: APjAAAVCRMinLo19LnZHTCaiLGAZph4KKtc9xcgsjlvlY7Cd5qMGx7Pj
 ktDXqZeSaedEzBlZGmpeRu/EIpvVGc2hlF4a
X-Google-Smtp-Source: APXvYqzL15xzNiCg30fEr7XFvHwNNnUijyABeFrBXYL+96A0QzVaeXNN1l+/dWTNB2mw6SlvUo0HFQ==
X-Received: by 2002:a2e:584b:: with SMTP id x11mr6266881ljd.36.1571403171701; 
 Fri, 18 Oct 2019 05:52:51 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id m17sm7454792lje.0.2019.10.18.05.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 05:52:50 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Timur Tabi <timur@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>
Subject: [PATCH 6/7] serial: ucc_uart.c: explicitly include asm/cpm.h
Date: Fri, 18 Oct 2019 14:52:33 +0200
Message-Id: <20191018125234.21825-7-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
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
Cc: linuxppc-dev@lists.ozlabs.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This driver uses #defines from asm/cpm.h, so instead of relying on
some other header pulling that in, do that explicitly.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/tty/serial/ucc_uart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index a0555ae2b1ef..e2c998badf81 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -33,6 +33,7 @@
 
 #include <linux/firmware.h>
 #include <asm/reg.h>
+#include <asm/cpm.h>
 
 /*
  * The GUMR flag for Soft UART.  This would normally be defined in qe.h,
-- 
2.20.1

