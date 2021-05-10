Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EBD3779BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 03:21:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdjvM16Rdz3bxV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 11:21:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TF2C0TvP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TF2C0TvP; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdjrJ5Gb3z2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 11:19:12 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id b21so8350994plz.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 18:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XvM8EvUit+jSAcez9YdgxahzNnmthWTUPml5Y7w5D/c=;
 b=TF2C0TvPEpWv4HgFEPewK+1EqPimMOkO9SSKS7KsxYuapJtSKiTeaKurQv2zfrA3t9
 lsph0MMtc8I6/i3DVrnWByi+kva5jNTkZhjL2Tv5Tk+GFcE+iQgLlSl5nGtYmZKUrnVm
 LGsnlp1yPUu4IOQQ5UMRUzo6mHNKkVZGg4k6Mx/upEVNds12Jh8VC5i6QjdvvluB8v6c
 JeIjOBzPSu33nukCfNiLJHNAPjHO4mmQ1uDU08zf4hVFquu5+ibvEHWK+ZM2tihG6LYD
 5U32u9EsZHX2XszwE7nrdzB78zF341iFf/HV+yUVOeimg4Ax3TpkhFHVNaLcxTUzoOCt
 T8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XvM8EvUit+jSAcez9YdgxahzNnmthWTUPml5Y7w5D/c=;
 b=rlSkDqWVaHSTHXUBH2f0SmKrarosy2NWvjhFgNYXl7R/Fxzc8geraKnGQep8f5L5/G
 tEuGq5yxKytaIiT/7Vo0qB/q14t/hNMAiFH1d9J21lurFQV2bjeMi2dJtSt5ssLUBeg/
 bcSIZz9VRkzEpZTKUS1IUdtrO1vuYCj0bj+inGu+kCzB/iFqfsVzmC2r1SPlUBCoCLmH
 F6+U4D0MauaGiK5zJIWY0tIyPrB69n0UXjNKK/+2DtJkfSNMtdlLeSJTq1QkZmxRZyf8
 31Mb9uYRMWq2KWs+pZbqCuLOqRtv0F0Sw9H2bV5qj9eugEMaONOFHSWPe2jpxhfi9PtA
 n8Kg==
X-Gm-Message-State: AOAM530ywS87IcpDjh5hXJwFvFPmcO+/KL3qomuuoQ0nThMZJF1b2F3U
 WLgkW5HhiIXEH6UnHUWE3pw5YnwSYF4=
X-Google-Smtp-Source: ABdhPJzQ9/KtPjJX8XCpJjtYn/e99+OfZF7+4lv/twESrR81izXuvFsnI/Uvp50USWDKCRYva6aksA==
X-Received: by 2002:a17:902:a9cb:b029:ed:61be:2cfb with SMTP id
 b11-20020a170902a9cbb02900ed61be2cfbmr22145415plr.9.1620609550049; 
 Sun, 09 May 2021 18:19:10 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id n129sm9887649pfn.54.2021.05.09.18.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 18:19:09 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v13 6/8] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
Date: Mon, 10 May 2021 11:18:26 +1000
Message-Id: <20210510011828.4006623-7-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510011828.4006623-1-jniethe5@gmail.com>
References: <20210510011828.4006623-1-jniethe5@gmail.com>
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
Cc: ajd@linux.ibm.com, cmr@codefail.de, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

To enable strict module RWX on powerpc, set:

    CONFIG_STRICT_MODULE_RWX=y

You should also have CONFIG_STRICT_KERNEL_RWX=y set to have any real
security benefit.

ARCH_HAS_STRICT_MODULE_RWX is set to require ARCH_HAS_STRICT_KERNEL_RWX.
This is due to a quirk in arch/Kconfig and arch/powerpc/Kconfig that
makes STRICT_MODULE_RWX *on by default* in configurations where
STRICT_KERNEL_RWX is *unavailable*.

Since this doesn't make much sense, and module RWX without kernel RWX
doesn't make much sense, having the same dependencies as kernel RWX
works around this problem.

With STRICT_MODULE_RWX, now make module_alloc() allocate pages with
KERNEL_PAGE protection rather than KERNEL_PAGE_EXEC.

Book32s/32 processors with a hash mmu (i.e. 604 core) can not set memory
protection on a page by page basis so do not enable.

Signed-off-by: Russell Currey <ruscur@russell.cc>
[jpn: - predicate on !PPC_BOOK3S_604
      - make module_alloc() use PAGE_KERNEL protection]
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v10: - Predicate on !PPC_BOOK3S_604
     - Make module_alloc() use PAGE_KERNEL protection
v11: - Neaten up
v13: Use strict_kernel_rwx_enabled()
---
 arch/powerpc/Kconfig         | 1 +
 arch/powerpc/kernel/module.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index cce0a137b046..cb5d9d862c35 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -140,6 +140,7 @@ config PPC
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
+	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX && !PPC_BOOK3S_604
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_COPY_MC			if PPC64
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index 3f35c8d20be7..f24004635ed5 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -92,12 +92,14 @@ int module_finalize(const Elf_Ehdr *hdr,
 static __always_inline void *
 __module_alloc(unsigned long size, unsigned long start, unsigned long end)
 {
+	pgprot_t prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
+
 	/*
 	 * Don't do huge page allocations for modules yet until more testing
 	 * is done. STRICT_MODULE_RWX may require extra work to support this
 	 * too.
 	 */
-	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL, PAGE_KERNEL_EXEC,
+	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL, prot,
 				    VM_FLUSH_RESET_PERMS | VM_NO_HUGE_VMAP,
 				    NUMA_NO_NODE, __builtin_return_address(0));
 }
-- 
2.25.1

