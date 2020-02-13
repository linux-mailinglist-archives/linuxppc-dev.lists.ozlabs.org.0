Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C25DF15B637
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 01:55:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Hyjf54P6zDqSk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 11:55:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=W9aXQyY/; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HyYC2Gc2zDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 11:48:15 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id 2so2082274pfg.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 16:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jwvqhmbLPpvanCf4CYPj6H756JJZayFM0Q320MsSZZo=;
 b=W9aXQyY//t6eHEP3C8xuynwnJgm3YQCe8jjIZ3jCl0XfEK1dL1LvAILAOPmzj61Wyv
 cLQmZJFRaGPd6uoU68W52/jyWaaFaARR6xS2exIJFuTEJXhxX3hO4kgPoJGtQAIU5pPz
 ZyimzxrCfOURO0SYjraq+Mo0+houUqGxBke04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jwvqhmbLPpvanCf4CYPj6H756JJZayFM0Q320MsSZZo=;
 b=cYTIsuIGXI1COXWahSw0yi3RAfsn7LTTqHAeh9h52gZoy+T+4UdUoCpMOtTVs/4u9d
 kscyazt2zFp8XfnMz9/pzzygr9xDZ+Be2eWLUtdmOG3RrRMyePFkNvXMyHWl6EJKrUeK
 BJJljX4L1m/TSLXEVqSoNnEpzEmBtMb6P6x76QjM8NZbfx3nkNxAhPTHy8dbqOfulqa5
 q8/rnOylvBOy2BsMFErr1YQt+FXvUQUWf6lmufXN5N00bZ0ZTgdikz2vBFsb5qdLD2Od
 WzrHk6KiDfeNrdw4Z2GT9dYtjcVMDdXnICl2kb5tzH3LVMFAj8Lj5PKp4rXN40HOVAdl
 2COQ==
X-Gm-Message-State: APjAAAUo/aUry7Rf8ABS8IotXhJ2rvwtRBV2j48Tn+OmYA+egRWXmFya
 tTqnh5yxwqygY8ftCOeN6U83rA==
X-Google-Smtp-Source: APXvYqwyap/Y1z+aWXaQcMFjb/rmFgVx+/DpIXipaiV7eULH7aVUnIjevBdz+ooJFdwM28lcergD5w==
X-Received: by 2002:a62:ee0f:: with SMTP id e15mr10920842pfi.256.1581554891854; 
 Wed, 12 Feb 2020 16:48:11 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-f1ea-0ab5-027b-8841.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:f1ea:ab5:27b:8841])
 by smtp.gmail.com with ESMTPSA id l21sm311099pgo.33.2020.02.12.16.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 16:48:11 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v7 3/4] powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
Date: Thu, 13 Feb 2020 11:47:51 +1100
Message-Id: <20200213004752.11019-4-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213004752.11019-1-dja@axtens.net>
References: <20200213004752.11019-1-dja@axtens.net>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kasan is already implied by the directory name, we don't need to
repeat it.

Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/mm/kasan/Makefile                       | 2 +-
 arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} (100%)

diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
index 6577897673dd..36a4e1b10b2d 100644
--- a/arch/powerpc/mm/kasan/Makefile
+++ b/arch/powerpc/mm/kasan/Makefile
@@ -2,4 +2,4 @@
 
 KASAN_SANITIZE := n
 
-obj-$(CONFIG_PPC32)           += kasan_init_32.o
+obj-$(CONFIG_PPC32)           += init_32.o
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/init_32.c
similarity index 100%
rename from arch/powerpc/mm/kasan/kasan_init_32.c
rename to arch/powerpc/mm/kasan/init_32.c
-- 
2.20.1

