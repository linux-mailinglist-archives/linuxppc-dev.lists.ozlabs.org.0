Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FA836E3A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 05:19:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW12j4LjSz3cJX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 13:19:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lvbKisIe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lvbKisIe; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW0zQ4JKGz30GD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 13:17:06 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id q2so13197366pfk.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 20:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MfDNENU/9Ph3RYmV5zZkFcM73fkIObZV7cecUECGfLE=;
 b=lvbKisIeD1MWF5rrDVdEq2lnP/4uCZ8fKtipOMqk+KsvwcECXFTua/jpZ54/l/dlUM
 JigPX6Zh5rT1/HsK+cdPu8ylbxTq3gVYeK/2MH4iYKLS5tdguzvAkt0kWdLndb6l6v34
 agpqYWY7m/Ia7X6fLohYD7thFjvK9uM6ACjFwiDQLno78EFXyyYbOxiEU2qEfSVXD10C
 jDEIdBkN4iE/K/AlykLTthEKQ+zpNb+bFbYczkfWhOrr3gt2yw8QqomDWmlzG+hjGEmp
 MWdpg1SFzPAcm6IokYzfmuV7beZ6DJa5NcjIrPZ5eZhVU0eurfY8g5ZfOlz7rnd0TK2R
 pZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MfDNENU/9Ph3RYmV5zZkFcM73fkIObZV7cecUECGfLE=;
 b=kNZVwU1FGS/V1tOpnbDoD/IshAQahNU5m1PY0CSStz9ISeQSuzbeZDQkpHtn9++haa
 NKIN79pRLSL1XpWj/sAz2gY/afrAt+1hkggq/OyJuG26qLEgm7rTK5PqyJvo2gAX1D/Z
 wBX7qJlax6Ednjm9JP/A9sbaTrvjr+fnp/046gusgcf/1YGTFonv1g8rB79hFGkSSkkA
 rZLSYPRyTubMba4jDlKOznRrTdpnFG0lInkPyw4LRW8emshi/lQoA6fEmGNQEcMYtF0u
 3F3VjL/lMAWsgyMJ2d0xP5WIbrXEk93OEuq6BQZwsjg46jGfi2+xAGDmpj3GNDI5Whiv
 9sJA==
X-Gm-Message-State: AOAM530DZBz+CtGSG3vlLnp59t3WMC2GFDUlDh4thsS+mEN5kzd6/pBa
 exKnCZa0lrpE4/8b+TNlAaeDtzPGqMc=
X-Google-Smtp-Source: ABdhPJwd2xJyTXWYdQosuC2QvjBOGG3JK2XKTiJu/DcXuyuXbL42Q1+iaP3xJnt3qrt70drcMxExCQ==
X-Received: by 2002:a05:6a00:c94:b029:272:b143:ba9e with SMTP id
 a20-20020a056a000c94b0290272b143ba9emr24635789pfv.10.1619666223862; 
 Wed, 28 Apr 2021 20:17:03 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id l16sm3650742pjl.32.2021.04.28.20.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 20:17:03 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v11 7/9] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
Date: Thu, 29 Apr 2021 13:16:00 +1000
Message-Id: <20210429031602.2606654-8-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429031602.2606654-1-jniethe5@gmail.com>
References: <20210429031602.2606654-1-jniethe5@gmail.com>
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
 arch/powerpc/kernel/module.c | 9 ++++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 94c34932a74b..9e264309fd99 100644
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
index c60c7457ff47..9eabaf1fadbe 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -92,9 +92,12 @@ int module_finalize(const Elf_Ehdr *hdr,
 static __always_inline void *
 __module_alloc(unsigned long size, unsigned long start, unsigned long end)
 {
-	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
-				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+	pgprot_t prot = IS_ENABLED(CONFIG_STRICT_MODULE_RWX) ? PAGE_KERNEL :
+							       PAGE_KERNEL_EXEC;
+
+	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
+			GFP_KERNEL, prot, VM_FLUSH_RESET_PERMS,
+			NUMA_NO_NODE, __builtin_return_address(0));
 }
 
 void *module_alloc(unsigned long size)
-- 
2.25.1

