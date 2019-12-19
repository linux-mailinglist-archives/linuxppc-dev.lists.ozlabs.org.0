Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAD61258C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 01:45:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dY7c0FKNzDqP6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 11:45:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="k4Nwt35P"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dXxw3L28zDqh2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 11:36:52 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id b137so2162703pga.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 16:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jwvqhmbLPpvanCf4CYPj6H756JJZayFM0Q320MsSZZo=;
 b=k4Nwt35P5Y6vpp5eWeg7ICwByB0EwQyyowsDLV+6ZjXccOSXxzH4VyQAMACbY+sydr
 zIs9Aeq3/V4oDQtaEhQ+NaOQbmBcBOxeuhQ7riNcsbvewq0M4nzTlDfm2cbySiYpdo/T
 fNwlUadrRPTWo5WIf8GgUTYzkrtucd1Al4vdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jwvqhmbLPpvanCf4CYPj6H756JJZayFM0Q320MsSZZo=;
 b=tAkGo59SDUNZdpAlDHXslkDQ5GKWiAKxcrl3ncrKacN02hhje/RN4ZDeGoBXFZEaTi
 9oG20Qj7qKHTz40e9WNf+78Zc0fYmYCyzoLfvKUx34S3gdBC7Vp1rYPdHsJy5wQdk+T7
 YVWPiag+N78H5x3KrmuuerxOqhq+weTIfzY1tcUEzaeG5VDU5EDbby429lqzKtROP6AI
 2M40NbOmmClmmp/CAhQ6wHFmcK63z5dwtBMFsGE4Opi1/K2hUzZY4a1vIM90cAr0uAt4
 /mfFgVUPtezP0LM9EEWJGe7RzsYsMI1XzMtwDhXsj9BHBvkmo7fnoHD2sCyF+VvR4UM7
 rHyg==
X-Gm-Message-State: APjAAAV90o5AbIcxn5IzCIl2+rjLZ8e1CUXuJxzRJ8M7rybopGOjzFEW
 Z7/F42cEfhSY5j908XociunUivekQFI=
X-Google-Smtp-Source: APXvYqzzS8EOpr5E7586Za1Qh1X/ZSa891rAEoUjLTYK149N03+CJ1w2Dzgoafjj0iCq1zJhp2OB0A==
X-Received: by 2002:a63:211f:: with SMTP id h31mr5808165pgh.299.1576715809809; 
 Wed, 18 Dec 2019 16:36:49 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-b05d-cbfe-b2ee-de17.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:b05d:cbfe:b2ee:de17])
 by smtp.gmail.com with ESMTPSA id k12sm4636303pgm.65.2019.12.18.16.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 16:36:49 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v4 3/4] powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
Date: Thu, 19 Dec 2019 11:36:29 +1100
Message-Id: <20191219003630.31288-4-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191219003630.31288-1-dja@axtens.net>
References: <20191219003630.31288-1-dja@axtens.net>
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

