Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACD727577
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 07:30:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458dPS1ZHQzDqS3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 15:30:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="FC/1eLi/"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458dCl0mGpzDqQ4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 15:21:55 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id a23so2573917pff.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 22:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lt/f0ObyN7xCbtUHCzfr3dU/UK0qK8L02lIHfhPrE+c=;
 b=FC/1eLi/2CA24oSRWx1tdXNM7wHsA2HGKRhnROf3viM7X5ahuqFzdzSI7QZ2k1+4Tu
 74s7Xyt8hOZPxi8btoL0UqiCTITYDxIPiej0fjrobxRGibQsEKrCb9slkTWiYacidWHP
 UCHKLls0jg25XXY0YYdIVpe/Ov4Mi25xQBcsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lt/f0ObyN7xCbtUHCzfr3dU/UK0qK8L02lIHfhPrE+c=;
 b=OYHsgeEHsKqmYsvNwszm7bTtGrELB9t0xUTapwS6UwilAzSTK4NISTRGpvqc8UYXN8
 NN+ZxsK8c8PcWmJtpSEKxa1iS3X8U5RXyQYHMdbM1zmiBfsqJqAhFsvOF2ZZoIzKOhu7
 7ftMNfQ+BMNFXfXdDPTfUlGVSG6Om7+KFZCGHpu4znvXhY8euo46MqMvAaJ4z15bxfr7
 Efjrx2MdDxWW2YPevdnH1YYjNv5abT0508lj1ST2Ck7n+ZjC0Jb+xgwyMFy3IDsSx0iB
 UUH9VNv/jo/LD8nhcPlSvPFEQF/8Jble7BynCMghV5YwmGZBPDyWqmoiOvqtnB05qFG/
 jxtQ==
X-Gm-Message-State: APjAAAVT3dUTGYdd0rEL7J2S5Z/B30A6y65LsFRd+y/ulP1thxJr7VRX
 JmsnARfvD51PHOFnoDFHr5KsxQ==
X-Google-Smtp-Source: APXvYqwoERg3YiNfiaS/e7p7wdnqDFb+PpX53MSWImF8crReoVFPaW9x/XI8oXxy7m2LYegcFeUPpg==
X-Received: by 2002:aa7:87ca:: with SMTP id i10mr74893088pfo.157.1558588912980; 
 Wed, 22 May 2019 22:21:52 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id h5sm15236829pfk.163.2019.05.22.22.21.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 22:21:52 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: aneesh.kumar@linux.ibm.com, christophe.leroy@c-s.fr, bsingharora@gmail.com
Subject: [RFC PATCH 6/7] kasan: allow arches to hook into global registration
Date: Thu, 23 May 2019 15:21:19 +1000
Message-Id: <20190523052120.18459-7-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Not all arches have a specific space carved out for modules -
some, such as powerpc, just use regular vmalloc space. Therefore,
globals in these modules cannot be backed by real shadow memory.

In order to allow arches to perform this check, add a hook.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 include/linux/kasan.h | 5 +++++
 mm/kasan/generic.c    | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index dfee2b42d799..4752749e4797 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -18,6 +18,11 @@ struct task_struct;
 static inline bool kasan_arch_is_ready(void)	{ return true; }
 #endif
 
+#ifndef kasan_arch_can_register_global
+static inline bool kasan_arch_can_register_global(const void * addr)	{ return true; }
+#endif
+
+
 #ifndef ARCH_HAS_KASAN_EARLY_SHADOW
 extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
 extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 0336f31bbae3..935b06f659a0 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -208,6 +208,9 @@ static void register_global(struct kasan_global *global)
 {
 	size_t aligned_size = round_up(global->size, KASAN_SHADOW_SCALE_SIZE);
 
+	if (!kasan_arch_can_register_global(global->beg))
+		return;
+
 	kasan_unpoison_shadow(global->beg, global->size);
 
 	kasan_poison_shadow(global->beg + aligned_size,
-- 
2.19.1

