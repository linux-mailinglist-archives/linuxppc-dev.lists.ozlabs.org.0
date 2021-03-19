Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88699341FD9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 15:42:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F26733z3Lz3cPS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 01:42:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=FyZSmlP4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=FyZSmlP4; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F265k72WTz3bvQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 01:41:14 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id v186so3817562pgv.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NqhHo+YeTtQNKJqI1Nmg9Lhc7h/uxmrUcSCxPqX7mCM=;
 b=FyZSmlP4DGRtdJxzH1AItezVYjTeONejnnz+aTt5sRjMbNhtjZ6PX7iClDrbPlg8Tg
 e4YYc/4dlnkyvEKJTIM6zBaidNWPYG3WuWDJXK3dNsh6oY/pKl7IXzTCoPeoW3YDVW/Q
 h02HpsHMGPKu0lDL87/RE+idZVOHCCR0Z5i+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NqhHo+YeTtQNKJqI1Nmg9Lhc7h/uxmrUcSCxPqX7mCM=;
 b=QS6HLPGww3O9W0HCLsCBY4TX1v0areprtiuCNMIuD627CUZlhU6DbxpyvaRUbWr0EQ
 3AJLEzw0nOMf8lRmzAb6VhxF2VGxrv0T8oIIqc7YeY1RxaTS8jLbHqVMhZY9mpWsWbM7
 USDrl1fzsdjQZYknusaXS2rviLyWRn+XxkSj6Idwi9cBHzmv8Qci/S1M0DKhq2RMPohT
 GvUcCx1YxfqyWGEIqs5zbo03KE04vU1DxSN67v1Lbb+bXm2kbTu2IaWPHZd16tT6U70s
 59tpqjFJHDWwjbx95NaQIhFkDqE9nE/QuXZDc4GDCHAKRSyXCIQOADB7Bzd/KN0rpbJH
 EsKg==
X-Gm-Message-State: AOAM530ikYDWdS4R6IpVOQc67OFbSXOaV1KBqefIT+7ywOOZY7NK/ZHG
 2vm4aj1L/ZO2g8SVoQ9grObVmcZOzOLn2A==
X-Google-Smtp-Source: ABdhPJwhZsubqhuhBqxD8pjftO2o+fW3bkpwXwbu7NU660do1sNc0/EcHx+g+rkua6W/EyKwG07E8g==
X-Received: by 2002:a65:4901:: with SMTP id p1mr780094pgs.310.1616164872494;
 Fri, 19 Mar 2021 07:41:12 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-674e-5c6f-efc9-136d.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:674e:5c6f:efc9:136d])
 by smtp.gmail.com with ESMTPSA id s28sm5943535pfd.155.2021.03.19.07.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 07:41:12 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: [PATCH v11 2/6] kasan: allow architectures to provide an outline
 readiness check
Date: Sat, 20 Mar 2021 01:40:54 +1100
Message-Id: <20210319144058.772525-3-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319144058.772525-1-dja@axtens.net>
References: <20210319144058.772525-1-dja@axtens.net>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
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
 include/linux/kasan.h | 4 ++++
 mm/kasan/common.c     | 4 ++++
 mm/kasan/generic.c    | 3 +++
 mm/kasan/shadow.c     | 4 ++++
 4 files changed, 15 insertions(+)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 8b3b99d659b7..6bd8343f0033 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -23,6 +23,10 @@ struct kunit_kasan_expectation {
 
 #endif
 
+#ifndef kasan_arch_is_ready
+static inline bool kasan_arch_is_ready(void)	{ return true; }
+#endif
+
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 
 #include <linux/pgtable.h>
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 6bb87f2acd4e..f23a9e2dce9f 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -345,6 +345,10 @@ static inline bool ____kasan_slab_free(struct kmem_cache *cache, void *object,
 	if (unlikely(cache->flags & SLAB_TYPESAFE_BY_RCU))
 		return false;
 
+	/* We can't read the shadow byte if the arch isn't ready */
+	if (!kasan_arch_is_ready())
+		return false;
+
 	if (!kasan_byte_accessible(tagged_object)) {
 		kasan_report_invalid_free(tagged_object, ip);
 		return true;
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
 
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index 727ad4629173..1f650c521037 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -80,6 +80,10 @@ void kasan_poison(const void *addr, size_t size, u8 value, bool init)
 	 */
 	addr = kasan_reset_tag(addr);
 
+	/* Don't touch the shadow memory if arch isn't ready */
+	if (!kasan_arch_is_ready())
+		return;
+
 	/* Skip KFENCE memory if called explicitly outside of sl*b. */
 	if (is_kfence_address(addr))
 		return;
-- 
2.27.0

