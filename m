Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD050374DA8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 04:41:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbHsS5clsz3cFv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 12:41:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fcoUqWxd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fcoUqWxd; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbHpH5LBbz2yZ2
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 12:39:03 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 fa21-20020a17090af0d5b0290157eb6b590fso2648563pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 May 2021 19:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQyu7o32br+VqJvZ0QsEtVhls/N41k2tn7SM+dw0a/A=;
 b=fcoUqWxdWf6AixnyH00zyoaRG9L39ePfWpbNP4JA28X+mMZpRolVGv7HbjpV3GhPrD
 nFIJ9S1GEJVl2XhYTJw/dEdFd6v5rQWln+LAwHgx1SqucpwqDYCske6dRpE/W+rRdz3Z
 IoDg5RZqjSaKyW+vumTws0XlOAC6mVqpe2v7u2Pi4DkuQ3M78x3W6SllBfqit8dC94b/
 dRvqlvg8kN9ptHc+VYEEibcCNsPmhFNbtyIXcaDxup3LJ6mnGbe4DS9VimiMjlBlJzmf
 OpSqzNFZ+Q9W/O4ZviE1EhZl2iVfSz0rWknXVQ4WQaqe9MEoDxPKIduXMfU8IzUNJZt7
 1TRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQyu7o32br+VqJvZ0QsEtVhls/N41k2tn7SM+dw0a/A=;
 b=XndLNcV/LLNjukhqkORU2X82oSR8P2s9xWcHQxIA402UFSxTpl/peXKnNbR984SZRC
 Bvvhi/gO5fDCdmmdz7TD1/OXAgNIYPYTo2ovUhO2WtvHuCmM64nr5CJJvMUCQfqToore
 Nbgc9fUHTBtjDlFCSUthLalzJy7qL/dtqAU4W9iP8R+0gRsr5wI/dFvtfbasBGv3HCV5
 LUN7++ngh9+KIPdRKAn6LR71nWIg9wSNwQmbKuGTy/217BTesrWnSewZYUcBvR61CrK1
 CeOhT7Btw1R3RgheEjf+MM6Jd6sA3d6LGSbtvR1IiXIVvE/AKl8jPxsnfv7x1iyzH+8B
 Qh6Q==
X-Gm-Message-State: AOAM5303q2Tk4MdBWc/lzhpqUyIDbVneLGTvKgAUlVZcufbH+jnES2F2
 YdLIKFfKOhjHfedP0tQJnpYY6c/2G/M=
X-Google-Smtp-Source: ABdhPJzge21oTA33Itzk/ZMfu/TdSZGMKCZFR7PxuD7WoQ1G+IvyuSaURxF3RuOM0ZySPw/qA6HMRA==
X-Received: by 2002:a17:90a:303:: with SMTP id 3mr15199762pje.36.1620268741043; 
 Wed, 05 May 2021 19:39:01 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id k12sm454490pgh.16.2021.05.05.19.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 19:39:00 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v12 6/8] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
Date: Thu,  6 May 2021 12:34:47 +1000
Message-Id: <20210506023449.3568630-7-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506023449.3568630-1-jniethe5@gmail.com>
References: <20210506023449.3568630-1-jniethe5@gmail.com>
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
index 3f35c8d20be7..33e4011228b0 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -92,12 +92,14 @@ int module_finalize(const Elf_Ehdr *hdr,
 static __always_inline void *
 __module_alloc(unsigned long size, unsigned long start, unsigned long end)
 {
+	pgprot_t prot = IS_ENABLED(CONFIG_STRICT_MODULE_RWX) ? PAGE_KERNEL :
+							       PAGE_KERNEL_EXEC;
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

