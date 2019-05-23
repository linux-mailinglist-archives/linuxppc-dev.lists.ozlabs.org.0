Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8D127573
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 07:26:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458dKD5G9hzDqWk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 15:26:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="KPTskSP0"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458dCV640tzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 15:21:42 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id p15so2186646pll.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 22:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iF1wg4kH+vQXTxBoxOOgIwNClHkp+K2oqjDeg/wjey4=;
 b=KPTskSP04rxClxAGtkwwp36ZubY/Ibio1rJ2f3BJUF9qbQWHlR3/0Fp48FrysYntii
 XGm++WIZqg4lX34YaX9T7kTWmkwtNes0egeiyBcgTvtSNo3yM/EPkr4nVIza3MrOYvMp
 oN2xqPan3KFAFlyDazRGl9tuoffZWPiUvQKwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iF1wg4kH+vQXTxBoxOOgIwNClHkp+K2oqjDeg/wjey4=;
 b=a3r0P8M58jXwm5pQv6rmIda/1dogADU3oRcZIlzWGLtapefWf7LEANvbvy/MXfqwKy
 hUMC1oyrn0dZB5UqdKMWopAolPd4LJ+br/Sw35NZIongDBlzTZ4VjDx6eaYS+imlCj8l
 WOlswbqL2lQskl+yxrZT5PPqQvZUwOs25QgL9JoytbUrNaHUQe08EQNh2z6I75EwubiM
 06cdKS/oFOZhhT0XWGmQqxLA9G43z6Rc/tTtZhvJj+cFDhDlVAW9s44MaGw7twoI1R8e
 4XEV40IFDqXcqo2cThbXGNkS7i5vclIt3arjeagTsRnT2TnDeIBLssd2Ol2DNCXd/RmJ
 OZag==
X-Gm-Message-State: APjAAAW4vtTRCEXekbMyzkVz2GrxY+4zRfQ5iKTDAnGLKItU3ugPlrwr
 j5lwzELbUwT6vK4OFlXjKgZBDw==
X-Google-Smtp-Source: APXvYqwdwbCujLIL9zO3dOAh3PjmQFf2gGQpfCHj6uuvkyjmuCVGcbcuPaJUWmZNFnnvqde3VxMtWw==
X-Received: by 2002:a17:902:aa91:: with SMTP id
 d17mr91896703plr.251.1558588900471; 
 Wed, 22 May 2019 22:21:40 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id v1sm27799306pgb.85.2019.05.22.22.21.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 22:21:39 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: aneesh.kumar@linux.ibm.com, christophe.leroy@c-s.fr, bsingharora@gmail.com
Subject: [RFC PATCH 3/7] kasan: allow architectures to provide an outline
 readiness check
Date: Thu, 23 May 2019 15:21:16 +1000
Message-Id: <20190523052120.18459-4-dja@axtens.net>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190523052120.18459-1-dja@axtens.net>
References: <20190523052120.18459-1-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
 kasan-dev@googlegroups.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In powerpc (as I understand it), we spend a lot of time in boot
running in real mode before MMU paging is initialised. During
this time we call a lot of generic code, including printk(). If
we try to access the shadow region during this time, things fail.

My attempts to move early init before the first printk have not
been successful. (Both previous RFCs for ppc64 - by 2 different
people - have needed this trick too!)

So, allow architectures to define a kasan_arch_is_ready()
hook that bails out of check_memory_region_inline() unless the
arch has done all of the init.

Link: https://lore.kernel.org/patchwork/patch/592820/ # ppc64 hash series
Link: https://patchwork.ozlabs.org/patch/795211/      # ppc radix series
Originally-by: Balbir Singh <bsingharora@gmail.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>
[check_return_arch_not_ready() ==> static inline kasan_arch_is_ready()]
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 include/linux/kasan.h | 4 ++++
 mm/kasan/generic.c    | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index f6261840f94c..a630d53f1a36 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -14,6 +14,10 @@ struct task_struct;
 #include <asm/kasan.h>
 #include <asm/pgtable.h>
 
+#ifndef kasan_arch_is_ready
+static inline bool kasan_arch_is_ready(void)	{ return true; }
+#endif
+
 extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
 extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
 extern pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD];
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index a5b28e3ceacb..0336f31bbae3 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -170,6 +170,9 @@ static __always_inline void check_memory_region_inline(unsigned long addr,
 						size_t size, bool write,
 						unsigned long ret_ip)
 {
+	if (!kasan_arch_is_ready())
+		return;
+
 	if (unlikely(size == 0))
 		return;
 
-- 
2.19.1

