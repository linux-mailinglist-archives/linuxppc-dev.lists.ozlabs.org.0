Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E72815A0E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 06:55:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HTQ75LWqzDq9m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 16:55:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Y5zCrsiJ; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HTFF1rzKzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 16:47:45 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id s1so651610pfh.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 21:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jwvqhmbLPpvanCf4CYPj6H756JJZayFM0Q320MsSZZo=;
 b=Y5zCrsiJGwwkqvTmrIJW1tBz/wqOw4mjVFElWat4dzzdZ6Tw66aYt5a07SvkTy/Lck
 rXUewXSEE2EBaczbtBWm7T8x41V/SlEQ+pnZvX/FCrOzxcP0YgR+CQQR/Ia/Xv4N7GAe
 6g6jWirRVTMbP5ERKo2gAd3GMioB6TzWqCNiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jwvqhmbLPpvanCf4CYPj6H756JJZayFM0Q320MsSZZo=;
 b=Ff+CRp6o5OT0Exs0kfx+DBnXyfgf0e1SMQy109j3hCzm6A3NpV9ztppHUDRlOwWk8P
 G+eStRU0ouzR22OnThCG9bdbV7c2SqK+l/kv456M5XCBxsY8ayrCpc5IBmJc3Z311nfq
 0KrpPzIKIqugr2A14MGr4VTIvWG8wZDabM0RCQc2rs4Abt7quda/jsvJo/rlGUq63X7n
 olhjhzKie7JHePSRPIV1hXHF3ZA6vYq0BjLXE0xp8zx6zI9o+n41lJDdmg96+rauYJiJ
 F9pVSqVmRPkD16KlVQ9g1kPceTN+LqGv7jbt0aGpfILJU0tmanFPltdvJIm/ns+8Ng8X
 l3HA==
X-Gm-Message-State: APjAAAXEpbkNhT0InE0eXFCPEBEFgxqEn+L/zOJZp0TO9kxG7FoyfJ4z
 Q7wX5D+7At88mWn564COgDE/Ug==
X-Google-Smtp-Source: APXvYqzKp61yzT24DArB0Z77F3iwms69CI28EmKMr/1q10yZcKMwchYaLBInd+f3G6rmK2f3pR244A==
X-Received: by 2002:aa7:8605:: with SMTP id p5mr6770773pfn.87.1581486463072;
 Tue, 11 Feb 2020 21:47:43 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-65dc-9b98-63a7-c7a4.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:65dc:9b98:63a7:c7a4])
 by smtp.gmail.com with ESMTPSA id q12sm6250115pfh.158.2020.02.11.21.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 21:47:42 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v6 3/4] powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
Date: Wed, 12 Feb 2020 16:47:23 +1100
Message-Id: <20200212054724.7708-4-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212054724.7708-1-dja@axtens.net>
References: <20200212054724.7708-1-dja@axtens.net>
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

