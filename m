Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DED312CA81F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 17:22:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClnSr4y8yzDqY2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 03:22:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=nMVol2Mb; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClnKs2dxZzDqml
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 03:16:49 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id e23so1437347pgk.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 08:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ktiBTqbjFAD6ffRKByOoWmP2o55vmJOJ49Xz+HTLOBA=;
 b=nMVol2MbqeRm1ME8ZCx4q5FQy/6FnTLRoo0uT3QwUXVdnICzf95JYxDl0Ku/Qfm8KB
 m7ud9zijGlPMWe4ffBlX6sLOdDZv6+jzTqcJlKX7lDk2SfpA8M+f8bXeZn6PAWFk3oe4
 f5g1svqNrW2w5c/+vabfoLINQtbdLDQ0Z4msI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ktiBTqbjFAD6ffRKByOoWmP2o55vmJOJ49Xz+HTLOBA=;
 b=Yqf3PX89UjygAElpk2zya42PZoOSr2ashpWtivWGObN6dizps8gvR+dznvSVXvchWs
 T7Y0teLI1QeCgrG96oLIi51RmvxUOpDC7AQoE3w+zN25rfRGBTJilD53QLuDdVd4jqa9
 Qa03Yx+MaWgxuBhfD+SlRzqd+3mj1QPvHxbyw0LHKhQ8X3Oxfqn3VK2eUXE7Lup1paiS
 0TnQrN1uevQ75KnGt3mQmwkpvfW6Fy4UHqcV1dSf0D2zzOF3zS4vEnUWEZ4BolEI1JbI
 2lc7GDuZaHmHFsejkl1qm7ozhaEM7pd8jkdaPTdHwUZxbcaqvr5ELiCELiK771YilfY+
 d+YA==
X-Gm-Message-State: AOAM532To7K8AlNZ2oppFeDp26nm+DibVUyfT/GXfNkOaKSrjGAVbBrE
 7lqW2EptyPE4DE6yE0SNbfpBqQ==
X-Google-Smtp-Source: ABdhPJxe/iHg9AKjvKSBXr2X/NJHI4J9BcoDNkvJXtHFX2PKH0KNKCgpa3c2HYXTBvQEAO5qretNPg==
X-Received: by 2002:a62:7f56:0:b029:18b:a70:4f76 with SMTP id
 a83-20020a627f560000b029018b0a704f76mr3167081pfd.8.1606839406112; 
 Tue, 01 Dec 2020 08:16:46 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-f932-2db6-916f-25e2.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:f932:2db6:916f:25e2])
 by smtp.gmail.com with ESMTPSA id jz7sm160129pjb.14.2020.12.01.08.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 08:16:45 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v9 2/6] kasan: allow architectures to provide an outline
 readiness check
Date: Wed,  2 Dec 2020 03:16:28 +1100
Message-Id: <20201201161632.1234753-3-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201161632.1234753-1-dja@axtens.net>
References: <20201201161632.1234753-1-dja@axtens.net>
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
HAVE_ARCH_NO_KASAN_INLINE if it requires this.

Cc: Balbir Singh <bsingharora@gmail.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Daniel Axtens <dja@axtens.net>

--

I discuss the justfication for this later in the series. Also,
both previous RFCs for ppc64 - by 2 different people - have
needed this trick! See:
 - https://lore.kernel.org/patchwork/patch/592820/ # ppc64 hash series
 - https://patchwork.ozlabs.org/patch/795211/      # ppc radix series
---
 include/linux/kasan.h |  4 ++++
 mm/kasan/common.c     | 10 ++++++++++
 mm/kasan/generic.c    |  3 +++
 3 files changed, 17 insertions(+)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 30d343b4a40a..3df66fdf6662 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -20,6 +20,10 @@ struct kunit_kasan_expectation {
 	bool report_found;
 };
 
+#ifndef kasan_arch_is_ready
+static inline bool kasan_arch_is_ready(void)	{ return true; }
+#endif
+
 extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
 extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
 extern pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD];
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 950fd372a07e..ba7744d3e319 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -117,6 +117,9 @@ void kasan_poison_shadow(const void *address, size_t size, u8 value)
 {
 	void *shadow_start, *shadow_end;
 
+	if (!kasan_arch_is_ready())
+		return;
+
 	/*
 	 * Perform shadow offset calculation based on untagged address, as
 	 * some of the callers (e.g. kasan_poison_object_data) pass tagged
@@ -134,6 +137,9 @@ void kasan_unpoison_shadow(const void *address, size_t size)
 {
 	u8 tag = get_tag(address);
 
+	if (!kasan_arch_is_ready())
+		return;
+
 	/*
 	 * Perform shadow offset calculation based on untagged address, as
 	 * some of the callers (e.g. kasan_unpoison_object_data) pass tagged
@@ -406,6 +412,10 @@ static bool __kasan_slab_free(struct kmem_cache *cache, void *object,
 	if (unlikely(cache->flags & SLAB_TYPESAFE_BY_RCU))
 		return false;
 
+	/* We can't read the shadow byte if the arch isn't ready */
+	if (!kasan_arch_is_ready())
+		return false;
+
 	shadow_byte = READ_ONCE(*(s8 *)kasan_mem_to_shadow(object));
 	if (shadow_invalid(tag, shadow_byte)) {
 		kasan_report_invalid_free(tagged_object, ip);
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 248264b9cb76..e87404026b2b 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -169,6 +169,9 @@ static __always_inline bool check_memory_region_inline(unsigned long addr,
 						size_t size, bool write,
 						unsigned long ret_ip)
 {
+	if (!kasan_arch_is_ready())
+		return true;
+
 	if (unlikely(size == 0))
 		return true;
 
-- 
2.25.1

