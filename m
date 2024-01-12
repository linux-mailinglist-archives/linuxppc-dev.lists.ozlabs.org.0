Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0886C82C6F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 23:03:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DiEuvkyv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TBbBl6qnDz3cLk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jan 2024 09:03:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DiEuvkyv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yosryahmed.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3ezohzqokdfoqgkjq29e658gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--yosryahmed.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TBWqL4wfPz2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jan 2024 06:31:09 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dbeba57a668so10261754276.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 11:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705087865; x=1705692665; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zcB+CUweXKRRwTEVx+dPw3m+uDfT/oMzwKpBe0EWZg4=;
        b=DiEuvkyvziWEZ+BA203770MzVhcF2zBrYK7nteu5pQ3uo3qsweJkJePVU92lEPdaJG
         50iHjqbFhrxFQOpXR6fKmaFTIH95tRUOLAA/BX0UC5sRUIGfbQqxlMObgCafrSxF228Z
         uWRzf8uTfmnsRuqCLxywYyLDO/JQSUlJxyv5QqFAdTUFqrhsfYS9b/8UmsC+ZoFzxtwm
         zDm8MymTV+LZD3eulqEBmXRH3MPksxcO+GaEmECQTlbnwP5yeeR938iB4d88lMT067C1
         xPfrEfq0YR3OXoJs/X8DC5ekpsOG53N/PBfq6gTBdvepU+QH54HcwNr1DbViAW5YFH7+
         R8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705087865; x=1705692665;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcB+CUweXKRRwTEVx+dPw3m+uDfT/oMzwKpBe0EWZg4=;
        b=W5uRNbm7f8vhhsBmTsmGcsyMhYnCkJVnbVgaAYfU4ml3IXysNKGquSeYxVD2lJlj3s
         Ov7YaHGPv48Yh8+ujkhbjmy3T5jdeYhcsd0O/0lxqZXWcPbgiTbYsY6gz+fPGq2pFass
         yeg4ps3Uq4/UTPgMqDzUmJIfh4il9Y2ab5VhoZRAk6gQchh11h1HgnE4UUxdvQc9jtal
         XX9ANneSqttivIDYuPr8dG4pi5NZQkMzrGLWdP1zxaeHiN9BIU5oZDT4l4PFcFQqq9Qv
         xdkP8qFqFe7Nd5ycNCKghPbBgCTYQmuW7havWrW4mA7tv6qu5Tqk+D3D8vyBL70mh/nx
         5MZA==
X-Gm-Message-State: AOJu0YzrgltQyRY7gXh0zhlx/EY/USA5BSmxhuNDHrYgZaVlaDNL2Eqm
	MUxMT7mXUpcPhYOSObdTTuqRVy+/UWmXZ60TfmFoPpY=
X-Google-Smtp-Source: AGHT+IHXfXlLCPAaZRRjOmLUIRThqdt/F+b/7UzcDXbsb8hupk3oS/NFXVxFBaFHFuKSENWk6NaW7A8MSkPs/nbY
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:29b4])
 (user=yosryahmed job=sendgmr) by 2002:a25:8246:0:b0:dbd:748c:fbb7 with SMTP
 id d6-20020a258246000000b00dbd748cfbb7mr586650ybn.0.1705087865498; Fri, 12
 Jan 2024 11:31:05 -0800 (PST)
Date: Fri, 12 Jan 2024 19:31:03 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.275.g3460e3d667-goog
Message-ID: <20240112193103.3798287-1-yosryahmed@google.com>
Subject: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
From: Yosry Ahmed <yosryahmed@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Vitaly Wool <vitaly.wool@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 13 Jan 2024 09:02:28 +1100
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Yosry Ahmed <yosryahmed@google.com>, Nhat Pham <nphamcs@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The z3fold compressed pages allocator is not widely used, most users use
zsmalloc. The only disadvantage of zsmalloc in comparison is the
dependency on MMU, and zbud is a more common option for !MMU as it was
the default zswap allocator for a long time.

In hopes of having a single compressed pages allocator at some point,
and following in the footsteps of SLAB, deprecate z3fold. Rename the
user-visible option so that users with CONFIG_Z3FOLD=y get a new prompt
with explanation during make oldconfig. Remove CONFIG_Z3FOLD=y from
defconfigs.

Existing users, if any, should voice their objections. Otherwise, we can
remove z3fold in a few releases.

Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
---
I have limited understanding of Kconfigs. I modelled this after commit
eb07c4f39c3e ("mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED"),
but one difference is that CONFIG_Z3FOLD is a tristate. I made
CONFIG_Z3FOLD_DEPRECATED a boolean config, and CONFIG_Z3FOLD default y
so that it is on by default if CONFIG_Z3FOLD_DEPRECATED is selected. I
am not sure if that's the correct way to do this.

---
 arch/loongarch/configs/loongson3_defconfig |  1 -
 arch/powerpc/configs/ppc64_defconfig       |  1 -
 mm/Kconfig                                 | 13 +++++++++++--
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 33795e4a5bd63..89b66b6c6a1d5 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -85,7 +85,6 @@ CONFIG_ZPOOL=y
 CONFIG_ZSWAP=y
 CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD=y
 CONFIG_ZBUD=y
-CONFIG_Z3FOLD=y
 CONFIG_ZSMALLOC=m
 # CONFIG_COMPAT_BRK is not set
 CONFIG_MEMORY_HOTPLUG=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 544a65fda77bc..d39284489aa26 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -81,7 +81,6 @@ CONFIG_MODULE_SIG_SHA512=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BINFMT_MISC=m
 CONFIG_ZSWAP=y
-CONFIG_Z3FOLD=y
 CONFIG_ZSMALLOC=y
 # CONFIG_SLAB_MERGE_DEFAULT is not set
 CONFIG_SLAB_FREELIST_RANDOM=y
diff --git a/mm/Kconfig b/mm/Kconfig
index 1902cfe4cc4f5..bc6cc97c08349 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -193,15 +193,24 @@ config ZBUD
 	  deterministic reclaim properties that make it preferable to a higher
 	  density approach when reclaim will be used.
 
-config Z3FOLD
-	tristate "3:1 compression allocator (z3fold)"
+config Z3FOLD_DEPRECATED
+	bool "3:1 compression allocator (z3fold) (DEPRECATED)"
 	depends on ZSWAP
 	help
+	  Deprecated and scheduled for removal in a few cycles. If you have
+	  a good reason for using Z3FOLD rather than ZSMALLOC or ZBUD, please
+	  contact linux-mm@kvack.org and the zswap maintainers.
+
 	  A special purpose allocator for storing compressed pages.
 	  It is designed to store up to three compressed pages per physical
 	  page. It is a ZBUD derivative so the simplicity and determinism are
 	  still there.
 
+config Z3FOLD
+	tristate
+	default y
+	depends on Z3FOLD_DEPRECATED
+
 config ZSMALLOC
 	tristate
 	prompt "N:1 compression allocator (zsmalloc)" if ZSWAP
-- 
2.43.0.275.g3460e3d667-goog

