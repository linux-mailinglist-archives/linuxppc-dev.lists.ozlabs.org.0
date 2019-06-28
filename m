Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D81F59D78
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 16:07:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zz9B56cLzDqLP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 00:07:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="F96K1IIC"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zz5h6Hs8zDqtV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 00:04:08 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id d23so6403326qto.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 07:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=TtCBV3dv3lEbG+/Fl3MOz0T0TVohkkYJU98cwcixuvQ=;
 b=F96K1IICnsJfZn53/kwRm1vvbIo7q8vJIYhCCu2yi2d30Eq+0mjKuqbd4a8FDTuvtV
 Negyxz/Lb1dJrZQ7AAw0xmX7Szb810eOW9PgnsFaT00jtGVSWVOam+Vpbj7Edt5/DiID
 9R0oQr9sCrD9pG+tjppcckcdPjmzzRJ3lto2wfwQ60IZgRubQVkPdfG6DOOm17g1lQ31
 OXBSXrpHLdn1O9afeOR5WUWH0EuLf1p3tHqhFqYev/WEDtHJm0lEUXzATje+mVMuk/AB
 8d81bjziN1zLAPVYsOQP5KS/2Vwk3aiau8NcU84Evk+E1FljELYSd7N09bKp796Na0c0
 /5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TtCBV3dv3lEbG+/Fl3MOz0T0TVohkkYJU98cwcixuvQ=;
 b=rLwXTG4HSQ4gtYiBah9QdAnKUE3iDeFsAOZ7Sk60zDpbHdaXLApGLSoA0+HvH6rIJz
 Avx4zQ/FL5LcVWSUZEVeEUcmRNWCjpeViSB0/U/ZH1CxuzAQTaXviY1bzCICzO+gJgWg
 AK7GmaqnJbjIm6xHzHwWEWzsxksKssOIaFzy+OgwxqzCgHDvbyK+tvrgqlR1vqvLCCby
 tgggnezT+xXxL07YFbDk1G3nGBhdb5GIqfKI1MI/bbDRu621z7zlCnTXKK3muH92ooV5
 zU8qbO79ZpKPQJ5RIvcRCgx3VLEpFnHGay1z/uD1Xzn3i2xbuU5txCAr9E2t0E6hkOz6
 hNUA==
X-Gm-Message-State: APjAAAU2+gVgE0bngb/84+fWbc0bg8Ic16IYLSOiaztWG7u0dzHAfoxS
 OHUdt9YyoNH3LsBEqvYRFDdO5w==
X-Google-Smtp-Source: APXvYqyjeSciFcaL48I+xGOjSfb9/Tjy2YGnp7YoXOFLumU17Q7I47Wu9sCEP5Uc0iMXMHLJZ6pNyA==
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr8442028qth.136.1561730644147; 
 Fri, 28 Jun 2019 07:04:04 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id 139sm1076137qkg.127.2019.06.28.07.04.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 07:04:03 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Subject: [PATCH v3] powerpc/setup_64: fix -Wempty-body warnings
Date: Fri, 28 Jun 2019 10:03:49 -0400
Message-Id: <1561730629-5025-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
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
Cc: linux-kernel@vger.kernel.org, paulus@samba.org, tyreld@linux.vnet.ibm.com,
 joe@perches.com, Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the beginning of setup_64.c, it has,

  #ifdef DEBUG
  #define DBG(fmt...) udbg_printf(fmt)
  #else
  #define DBG(fmt...)
  #endif

where DBG() could be compiled away, and generate warnings,

arch/powerpc/kernel/setup_64.c: In function 'initialize_cache_info':
arch/powerpc/kernel/setup_64.c:579:49: warning: suggest braces around
empty body in an 'if' statement [-Wempty-body]
    DBG("Argh, can't find dcache properties !\n");
                                                 ^
arch/powerpc/kernel/setup_64.c:582:49: warning: suggest braces around
empty body in an 'if' statement [-Wempty-body]
    DBG("Argh, can't find icache properties !\n");

Fix it by using the no_printk() macro, and make sure that format and
argument are always verified by the compiler.

Suggested-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Qian Cai <cai@lca.pw>
---

v3: Use no_printk() macro, and make sure that format and argument are always
    verified by the compiler using a more generic form ##__VA_ARGS__ per Joe.

v2: Fix it by using a NOP while loop per Tyrel.

 arch/powerpc/kernel/setup_64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 44b4c432a273..cea933a43f0a 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -69,9 +69,9 @@
 #include "setup.h"
 
 #ifdef DEBUG
-#define DBG(fmt...) udbg_printf(fmt)
+#define DBG(fmt, ...) udbg_printf(fmt, ##__VA_ARGS__)
 #else
-#define DBG(fmt...)
+#define DBG(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
 #endif
 
 int spinning_secondaries;
-- 
1.8.3.1

