Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55297742DC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 21:51:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=N3TWLy9U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsTbP1tDwz3btl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 05:51:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=N3TWLy9U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsTZT4GkBz30fp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 05:50:22 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b80b343178so7694555ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 12:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688068215; x=1690660215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NSkn+f3VtgW8iSnk4GBxcuOfWg9o8pMcPa7iLptRigM=;
        b=N3TWLy9UHAFofIUARTltvFgjNeQgaQvAIEBNMAqc1xSyjJdiQgcwLXuWdFGd7wN4tp
         kGY7IMbjQYgNboxa6wD7E8gDVu7KhqN9Nt33ogvwIx4kMSZTNpJLfz94RIiT3ocZQ1Rh
         QrEsLxEXUZnMh5D+4+VabuihtkZhD+oJV+LZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688068215; x=1690660215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSkn+f3VtgW8iSnk4GBxcuOfWg9o8pMcPa7iLptRigM=;
        b=J89ktvXNsGl+SXuV/1SbVT7DjW1oy2ZzFkq5EMASx5pYaTfSV4MEWZnJtKhizV199M
         R1IR57uLgBVwpk1ZH7iEu1dNu1z+ELqbBJ5iRt297VR24xsE/PpwSFAzMQVLTj71XbXk
         UbBQqoN9brA98PRnU3tzTcp6ISgb6AoHwa2NeyAHkwUR/lw8bEnod61nZ2d8rf7p7BUM
         aO+R9kSL/vmZ2ADzwt52MCCeoIAFmf9AnkSqNwkEAPmGEShgwxAi6H3oIJJeviZPEmEj
         4t8CHgQ+Ofn87IER1MbV5d4p6WcH+gxqX0qdK7Cz5CU0gO8rv4IxZCPZYh66T9uqgLUk
         lYsw==
X-Gm-Message-State: ABy/qLaZC9pMEx95n131943OuiQin3s2LuIf2PFIE+hafgtJ36p8hB0C
	J2IRDO4w0VRJXmIB6GBdxztFow==
X-Google-Smtp-Source: APBJJlFSWmGAW+1tvAAziG9cxk1yhnOVZ9XXdrNb1iN8TJ+5MAEK2Utl/WqMd0L/kGZSeOMv40GaBg==
X-Received: by 2002:a17:903:2444:b0:1b8:64e1:7b05 with SMTP id l4-20020a170903244400b001b864e17b05mr145905pls.47.1688068215666;
        Thu, 29 Jun 2023 12:50:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:1f8f:4afe:ff0:9243])
        by smtp.gmail.com with ESMTPSA id u13-20020a170903124d00b001b3fb2f0296sm9457505plh.120.2023.06.29.12.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 12:50:15 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] powerpc: Include asm/nmi.c in mobility.c for watchdog_hardlockup_set_timeout_pct()
Date: Thu, 29 Jun 2023 12:45:06 -0700
Message-ID: <20230629124500.1.I55e2f4e7903d686c4484cb23c033c6a9e1a9d4c4@changeid>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Petr Mladek <pmladek@suse.com>, Jilin Yuan <yuanjilin@cdjrlc.com>, Tom Rix <trix@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, Haren Myneni <haren@linux.ibm.com>, Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The powerpc/platforms/pseries/mobility.c calls
watchdog_hardlockup_set_timeout_pct(), which is declared in
<asm/nmi.h>. We used to automatically get <asm/nmi.h> included, but
that changed as of commit 7ca8fe94aa92 ("watchdog/hardlockup: define
HARDLOCKUP_DETECTOR_ARCH"). Let's add the explicit include.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/r/af19b76d-aa4b-6c88-9cac-eae4b2072497@infradead.org
Fixes: 7ca8fe94aa92 ("watchdog/hardlockup: define HARDLOCKUP_DETECTOR_ARCH")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/powerpc/platforms/pseries/mobility.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index cd632ba9ebff..0161226d8fec 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -24,6 +24,7 @@
 #include <linux/stringify.h>
 
 #include <asm/machdep.h>
+#include <asm/nmi.h>
 #include <asm/rtas.h>
 #include "pseries.h"
 #include "vas.h"	/* vas_migration_handler() */
-- 
2.41.0.255.g8b1d071c50-goog

