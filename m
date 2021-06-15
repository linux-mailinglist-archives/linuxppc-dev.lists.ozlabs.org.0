Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7493A737B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 03:48:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3rp10586z3cZC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 11:48:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=Zp8KnLUS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Zp8KnLUS; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3rmB4cqMz306k
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 11:47:22 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id v11so7607774ply.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 18:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9yfG43b2K5TzVk5ZU+QSFD/NukUJWMplQuDr+tXNhQQ=;
 b=Zp8KnLUSatybticlxZJApD0i9G8GXZx7RpoNRl1/7XodZnv+q2U9g29MDo5vvrQxLQ
 7Y/gzsANS6ZqQigBUlcKaa7bQlBiMlZ6WyHTlqx9NI+D6nSRIgUkUIPH5IEvWv+o+xOX
 R+avk3QSGA1U5XWfPL50c0h907VeEKM8o1Qvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9yfG43b2K5TzVk5ZU+QSFD/NukUJWMplQuDr+tXNhQQ=;
 b=q5NYrrfxUBjngWRkOFRKyV76vQ5mhLNabZL8vSMAhxP3ejGr8+QDszo911aVAkNWJ+
 FK8EDarVFEFzxE7MWaUrsVs5IRha7zvPtsr1BKzFYLDyGQijTmyXoc8BAblMKRn1Iocg
 8R6leujcpfl5WoVxHzQjPZa6ViyYumCZar+UWfxkEc/BgGTO0veRdBclOWj0PiZCifLH
 ZmYXlZeZkM0vVib5U3dWmAFeWn/Vtns9DX3JWnQAfPxUAbGnztzOVHEcTXB4DX1k1Rtp
 milLW9oWVvSU7mVnT4yAAUYie1/KAhBRS/uBVn4DLhXxjuSB9UTzx7Wv1T0eiilpU7B9
 u47w==
X-Gm-Message-State: AOAM530E2Xhxwx//h2YwtoAnRDYTkkCyd6opTOWPoCmT0II/hbQBrO04
 fhREuyrceXHgYEzrfzHBrD5EWw==
X-Google-Smtp-Source: ABdhPJwayJvIluspopg5KlfYC5uZhjdSK6RLrVbRnbo5dYy82BcNvz2/dLQevVxTLK0wqyDRuuEEFA==
X-Received: by 2002:a17:902:d888:b029:11c:1010:f0ea with SMTP id
 b8-20020a170902d888b029011c1010f0eamr1621088plz.68.1623721639363; 
 Mon, 14 Jun 2021 18:47:19 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id n14sm13096115pfa.138.2021.06.14.18.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 18:47:18 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: [PATCH v12 2/6] kasan: allow architectures to provide an outline
 readiness check
Date: Tue, 15 Jun 2021 11:47:01 +1000
Message-Id: <20210615014705.2234866-3-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210615014705.2234866-1-dja@axtens.net>
References: <20210615014705.2234866-1-dja@axtens.net>
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
Cc: elver@google.com, "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allow architectures to define a kasan_arch_is_ready() hook that bails
out of any function that's about to touch the shadow unless the arch
says that it is ready for the memory to be accessed. This is fairly
uninvasive and should have a negligible performance penalty.

This will only work in outline mode, so an arch must specify
ARCH_DISABLE_KASAN_INLINE if it requires this.

Cc: Balbir Singh <bsingharora@gmail.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Daniel Axtens <dja@axtens.net>

--

I discuss the justfication for this later in the series. Also,
both previous RFCs for ppc64 - by 2 different people - have
needed this trick! See:
 - https://lore.kernel.org/patchwork/patch/592820/ # ppc64 hash series
 - https://patchwork.ozlabs.org/patch/795211/      # ppc radix series
---
 mm/kasan/common.c  | 4 ++++
 mm/kasan/generic.c | 3 +++
 mm/kasan/kasan.h   | 4 ++++
 mm/kasan/shadow.c  | 4 ++++
 4 files changed, 15 insertions(+)

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 10177cc26d06..0ad615f3801d 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -331,6 +331,10 @@ static inline bool ____kasan_slab_free(struct kmem_cache *cache, void *object,
 	u8 tag;
 	void *tagged_object;
 
+	/* Bail if the arch isn't ready */
+	if (!kasan_arch_is_ready())
+		return false;
+
 	tag = get_tag(object);
 	tagged_object = object;
 	object = kasan_reset_tag(object);
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 53cbf28859b5..c3f5ba7a294a 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -163,6 +163,9 @@ static __always_inline bool check_region_inline(unsigned long addr,
 						size_t size, bool write,
 						unsigned long ret_ip)
 {
+	if (!kasan_arch_is_ready())
+		return true;
+
 	if (unlikely(size == 0))
 		return true;
 
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 8f450bc28045..19323a3d5975 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -449,6 +449,10 @@ static inline void kasan_poison_last_granule(const void *address, size_t size) {
 
 #endif /* CONFIG_KASAN_GENERIC */
 
+#ifndef kasan_arch_is_ready
+static inline bool kasan_arch_is_ready(void)	{ return true; }
+#endif
+
 /*
  * Exported functions for interfaces called from assembly or from generated
  * code. Declarations here to avoid warning about missing declarations.
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index 082ee5b6d9a1..74134b657d7d 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -73,6 +73,10 @@ void kasan_poison(const void *addr, size_t size, u8 value, bool init)
 {
 	void *shadow_start, *shadow_end;
 
+	/* Don't touch the shadow memory if arch isn't ready */
+	if (!kasan_arch_is_ready())
+		return;
+
 	/*
 	 * Perform shadow offset calculation based on untagged address, as
 	 * some of the callers (e.g. kasan_poison_object_data) pass tagged
-- 
2.27.0

