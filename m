Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C034E062
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 06:55:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8cZV5d1Rz3d2G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:55:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sLZz5e0W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sLZz5e0W; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8cW73tfrz30HH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 15:52:19 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id k8so1681072pgf.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 21:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H90dIE9weKVbdPX1yfpRIEMEYoI/yh/rF9b0qNSyEjo=;
 b=sLZz5e0W+tOus6QPtBVsNYU2q2odZnbQlsEOiFCqAivNYQx/l5jKu7AB/P6i0apcPB
 rn0qIdLmehrda5DrkyIw/oOx7VCt4Hff/UAQBz3vDs0pUqyL70N2ZnKKn73aDeXOoM+g
 LvyWxhcZJhfeQZ/0j8Wlp+s6Z5PehYzUUKhAMGceIeMbU6WxxWAYRlgK9GHPF4723Xiq
 dspTriBAaeI9c1DL/DOgl0aHwk8GbaMHUzORQVxiAMANlGds5KGl3cuNEdg7h7r2u4OT
 zFbJyvKrn27St7lnvCW+M2E+CfQfeTJ7jyTwjg4PQeOFhHhC2BVHZITHB/dALaxfTMzA
 cblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H90dIE9weKVbdPX1yfpRIEMEYoI/yh/rF9b0qNSyEjo=;
 b=SskIBlCw8ly7R7oXDryHxkoGeahte2WkecU2Bke7DtkixpJkIr130ozOrDjJNu1uk5
 o/DEyaCPkHVwFXykAJJ8kEsqCd0d8D9rZYA8awDmWSpG5/r4rcAtpAKi4jVhq9swrLI4
 Oth4lpBpZtPuXW/LOc3gesmtlUvfzrXk1hDA1+nBwv1gRlZu6i7AdBolqLMBO5VL+shP
 iykg3yj42i6FJrAXTOcRgyD2NbYTMKLVawuvxYfhrzpI8+vuDtE29k2he4R0lTQwg4v6
 z8xVkSIeHzOdbMKKWFmcyDdEwrMjFLg051GbrSQcHaxx44qnkZSbQ7vUV7u//u8bfW4G
 KTfg==
X-Gm-Message-State: AOAM533rJe2f5Xy+ruPVg5QKbfBTjragWdIquhfymvBqEMBAJRbxDgJK
 m8vy3LDWcMBFIHFx1aqsiuHeJcWjfWLjgw==
X-Google-Smtp-Source: ABdhPJxkrKQ1mAM86KQb/bx2tDJkh0ONmp5oemgABEKYKKTw+GTEi3gWQ+X5mC4NBE1rJM6dIaJKMg==
X-Received: by 2002:a62:64d1:0:b029:228:964e:8b55 with SMTP id
 y200-20020a6264d10000b0290228964e8b55mr8992052pfb.61.1617079937490; 
 Mon, 29 Mar 2021 21:52:17 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id a18sm14136574pfa.18.2021.03.29.21.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 21:52:17 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 07/10] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
Date: Tue, 30 Mar 2021 15:51:29 +1100
Message-Id: <20210330045132.722243-8-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330045132.722243-1-jniethe5@gmail.com>
References: <20210330045132.722243-1-jniethe5@gmail.com>
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
 naveen.n.rao@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
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
---
 arch/powerpc/Kconfig         |  1 +
 arch/powerpc/kernel/module.c | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4498a27ac9db..97c0c3540bfd 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -137,6 +137,7 @@ config PPC
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
+	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX && !PPC_BOOK3S_604
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_COPY_MC			if PPC64
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index f1fb58389d58..d086f5534fac 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -90,7 +90,12 @@ int module_finalize(const Elf_Ehdr *hdr,
 
 void *module_alloc(unsigned long size)
 {
-	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, GFP_KERNEL,
-				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+	pgprot_t prot = PAGE_KERNEL_EXEC;
+
+	if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
+		prot = PAGE_KERNEL;
+
+	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
+			GFP_KERNEL, prot, VM_FLUSH_RESET_PERMS,
+			NUMA_NO_NODE, __builtin_return_address(0));
 }
-- 
2.25.1

