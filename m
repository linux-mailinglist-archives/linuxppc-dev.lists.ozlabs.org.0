Return-Path: <linuxppc-dev+bounces-14583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D2ECA22DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 03:34:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMJVR1phNz308l;
	Thu, 04 Dec 2025 13:34:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764815647;
	cv=none; b=VjY3xzRynv/v2ZG1uXaWB7RPZrRk5ijbZvipaVZok3ZdnJBmZRGkcP+K8a+ZYOfAzFTfFIcpE0YYTLdR/bnkxezZnrk5hlLUmeh3G9QOURNqComR0WuPtuDGOxLqtr1xC1At7vrZF4JbQHJaQjVyTMijtfhrVwk0btuk9YEES9SsoiCEaNrMoC9obz7oFJQlDCxAxaPBSKjnIUk1BVjT0tZMTvx+dpdgQF2HMRKiXnzuZJDTaRTMUg9hvtdBaQgNGT0gKCBKBgUu/goNhWMApiA2fmu43S81G8wGIx8srrl4JRbb+AzFcCfg3XztClft8de6LBMqFL1Ao81AuLLQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764815647; c=relaxed/relaxed;
	bh=8cBwp0aWYwyhGai8JhHTyTaXAP5UhX6tjhsjDn6rkoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EKJP5dz9zVtLPfhsbCauyb300Bsj2k4ntOtKuFpRMmpuQBIRwvdItc2HzKb6zdirz1Z/P+Hyf1pRJx6f37TsdQu/3jy0/FS2MUV3hsm3ejn5gErhaYDs0aReFa30O9vwz08EN3Me8HAsle9JxRtSslw97bceAIuAD1xNWdShA9BsshcEGgYF3wb0bcAyMzOLQ8AAoG5JZGfd26J2grBYWmSsyyVzpTu2u24JZawz9KKPNsR8+kGWW1K2uGhmRLBWx1YjwTpAzzTbwAyKH/2qoEaYMwVQg5/SF+nZJUmqP1AsPN1ctIFaAPxzwdI+rbvfUgIGFCZhvFJewdiwqLshiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=XQ9r+zgj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=XQ9r+zgj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMJVP0NZVz2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 13:34:04 +1100 (AEDT)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7c6ce4f65f7so417054a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 18:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1764815641; x=1765420441; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8cBwp0aWYwyhGai8JhHTyTaXAP5UhX6tjhsjDn6rkoQ=;
        b=XQ9r+zgjF01mq44Z2opd2EF9xFja4F4k+z7Ar6pNVsTw0y1p8XVrTkfhH9nbEGjTqR
         SFVQFZn3RKy9CxmIJCZV5fyLjEprxjgVYUX1+qi2xvS+oGMhGL9QQ3Oy3wN3JVrDCMxo
         FMBNI0xlSRWBR7LzePxWtUh2v+MPWxElbh5bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764815641; x=1765420441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cBwp0aWYwyhGai8JhHTyTaXAP5UhX6tjhsjDn6rkoQ=;
        b=M5KbJKWH/IY7hfb1kd5hguPVUuQUfPmqhtjwtxUSlpBRYUQR0t/C5GJhsfRLekhpWa
         Tr3ZgGpHkdKTwZ7Ops4S/9fSmfDvpzNqQNCuVq8uH9X0FAwzrI666sIjxVWyfnHRckZ3
         7qlj053sXoVZtnWN5U+Ihfq1KcGwsINnoDy8iWs4GgiRHrw40CGwbsW/EW40zZmlyGJ1
         gugcC+ROtHkuKZJTpzi6/pS/PrFalsK5tk3BglsFtzBenmIfIF8IhzVVisecNTZv3qv8
         U7OF52lT3gpbWcSvOoL4RNB8K4x5TufatQ827skNnLKi8jYsAONUCdHTDfwFOL3Lj74V
         e02Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLMLolxbeZLyj8u5nLXPuGi4UCB6ONVN8CSTcMNcCW8cxVM47ltr8Lb5vM2pD1+PuARrcep6mylycHcRU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+YD67cwz2Nt3lgEfmb/QrmiIE9cxJTtv50HK0hpV+CyS2Qb0R
	zPTxnYZ8xwPhsi1GS+Gthk+PqY7iBL6Qg6qoOU0jRqGjhiMiC4WO2Bc82c7PTbWHjtE=
X-Gm-Gg: ASbGncsghJIHUhRaNhFBJf0l2kM9Q/YBkNUl9mZw3b989PnEnEiUDsMYdhIH+vlvPt0
	31J7KrdunreWN/HAU28P2MvhifvvcmtMkI4NyNG+yycI4uehHcaiLjIZoLHinMZjDMm2MRnEFjA
	reScbMWkmm7Xt4oZnnZhK4gRSKxhYvd6mammFd66scUFIcso93pf1OCHfzJYzHiZLkeM0CMfqmR
	sZxAK6e60IAo9BoonRJe6XRR/p8U/efZN65+783LYyZWTh7yp4EwVh8VlHbl7UnNKbJKsDmZFuS
	GKghocnCdFwOQTiz7QX3mxTv5DJihSuGNu8OPGsVxQMd9ETfmrNh9kBQ28KxQw7GlOqcHBDIC9F
	1QJANy/2hYlsST1LqwHrgfowICjW4VDrWtDCy07hHbTJCOIptzLO0dEvAQwnff0eev9y2ptmUO6
	diSsKvrpB+GNzBeGI/Ti1njAOGyO27BZUpl66x
X-Google-Smtp-Source: AGHT+IHvRpXJtnyiwKLjzZx/ozcRmKCi93mtb3M0cqUPz6Vsa5iPSfTaNpHqBjpIkA+snazfQwc2Tg==
X-Received: by 2002:a05:6830:44aa:b0:78a:8b0d:cd54 with SMTP id 46e09a7af769-7c958c06fc3mr950721a34.34.1764815641091;
        Wed, 03 Dec 2025 18:34:01 -0800 (PST)
Received: from shuah-framework.internal ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95a8f8d0bsm510833a34.5.2025.12.03.18.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 18:34:00 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	masahiroy@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] Revert "mm: fix MAX_FOLIO_ORDER on powerpc configs with hugetlb"
Date: Wed,  3 Dec 2025 19:33:56 -0700
Message-ID: <20251204023358.54107-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This reverts commit 39231e8d6ba7f794b566fd91ebd88c0834a23b98.

Enabling HAVE_GIGANTIC_FOLIOS broke kernel build and git clone on two
systems. git fetch-pack fails when cloning large repos and make hangs
or errors out of Makefile.build with Error: 139. These failures are
random with git clone failing after fetching 1% of the objects, and
make hangs while compiling random files.

The blow is is one of the git clone failures:

git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux_6.19
Cloning into 'linux_6.19'...
remote: Enumerating objects: 11173575, done.
remote: Counting objects: 100% (785/785), done.
remote: Compressing objects: 100% (373/373), done.
remote: Total 11173575 (delta 534), reused 505 (delta 411), pack-reused 11172790 (from 1)
Receiving objects: 100% (11173575/11173575), 3.00 GiB | 7.08 MiB/s, done.
Resolving deltas: 100% (9195212/9195212), done.
fatal: did not receive expected object 0002003e951b5057c16de5a39140abcbf6e44e50
fatal: fetch-pack: invalid index-pack output

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 arch/powerpc/Kconfig                   |  1 -
 arch/powerpc/platforms/Kconfig.cputype |  1 +
 include/linux/mm.h                     | 13 +++----------
 mm/Kconfig                             |  7 -------
 4 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9537a61ebae0..e24f4d88885a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -137,7 +137,6 @@ config PPC
 	select ARCH_HAS_DMA_OPS			if PPC64
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
-	select ARCH_HAS_GIGANTIC_PAGE		if ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_KERNEL_FPU_SUPPORT	if PPC64 && PPC_FPU
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 4c321a8ea896..7b527d18aa5e 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -423,6 +423,7 @@ config PPC_64S_HASH_MMU
 config PPC_RADIX_MMU
 	bool "Radix MMU Support"
 	depends on PPC_BOOK3S_64
+	select ARCH_HAS_GIGANTIC_PAGE
 	default y
 	help
 	  Enable support for the Power ISA 3.0 Radix style MMU. Currently this
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7c79b3369b82..d16b33bacc32 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2074,7 +2074,7 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
 	return folio_large_nr_pages(folio);
 }
 
-#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
+#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
 /*
  * We don't expect any folios that exceed buddy sizes (and consequently
  * memory sections).
@@ -2087,17 +2087,10 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
  * pages are guaranteed to be contiguous.
  */
 #define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
-#elif defined(CONFIG_HUGETLB_PAGE)
-/*
- * There is no real limit on the folio size. We limit them to the maximum we
- * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
- * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
- */
-#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
 #else
 /*
- * Without hugetlb, gigantic folios that are bigger than a single PUD are
- * currently impossible.
+ * There is no real limit on the folio size. We limit them to the maximum we
+ * currently expect (e.g., hugetlb, dax).
  */
 #define MAX_FOLIO_ORDER		PUD_ORDER
 #endif
diff --git a/mm/Kconfig b/mm/Kconfig
index ca3f146bc705..0e26f4fc8717 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -908,13 +908,6 @@ config PAGE_MAPCOUNT
 config PGTABLE_HAS_HUGE_LEAVES
 	def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
 
-#
-# We can end up creating gigantic folio.
-#
-config HAVE_GIGANTIC_FOLIOS
-	def_bool (HUGETLB_PAGE && ARCH_HAS_GIGANTIC_PAGE) || \
-		 (ZONE_DEVICE && HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
-
 # TODO: Allow to be enabled without THP
 config ARCH_SUPPORTS_HUGE_PFNMAP
 	def_bool n
-- 
2.51.0


