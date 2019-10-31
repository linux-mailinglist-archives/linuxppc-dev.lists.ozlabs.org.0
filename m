Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14337EACD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 10:49:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473gWx3GywzF5jH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 20:49:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="eV1YePql"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473gJf6Jk0zF5f6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 20:39:30 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id x195so501164pfd.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v18HXwwUv8fdcmaD7WznN2j7mmagzU8FAwS/lrMAbV8=;
 b=eV1YePqlbyO7tj1kbB9uk7OP/edmTARvYsB9Zgi7PH5bknrFXg/tJPOc7emhOO4x5j
 KtyJj8T2PfQws87ybdR8idy8g57nveDsfrqx/ExGASQ3uibiJe4goUkyOdBsJ/O6tM75
 VsNL8fB1S0lA/l67fDIo2fDZfwDm47jbBhpzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v18HXwwUv8fdcmaD7WznN2j7mmagzU8FAwS/lrMAbV8=;
 b=hJQEwn02Q2xAnTQd3CM4880/DWZkVkhaRxgWbh8AmRaXaIrYXsmmsBKUSazf/vKn02
 7KDlRiAJMqaXNZ97n2jGig5cNDMZUr/EZpcL5Gaoro/vnwFRJ247CT7mi9R+tOi0StOd
 kk/i4ZVtprqOG5lqmso0sTCnAQ3OJBRBck6RdSYbcWIgZ7sCi73+03HbvnlMY+Y4hFUA
 v9VMB9SOf7tiYQ5wmI5Go75yCNaajAVNL9Ld89FneuexHC1OAY/4oeHZnF+wmXmFvR5t
 wocH3Hu1idfIb1imjmDtRs7R8jVJRESbrOaw7dAvC6w5uNB/j1jks4y/3500sZktSUjI
 SOhQ==
X-Gm-Message-State: APjAAAVYhiJ9Sed33/RWIaIGN6PUOIwbQxfO0tn2VB0ZUQQJtUvU5pUf
 9Fq9vU/Kr4CUVfKaB2UNJmd3EEvcXp0=
X-Google-Smtp-Source: APXvYqzcQf2seyFm3b/JjsEvVOy0D7utuomMGdhHrdtSNRCDKkdOsqd1sFCDqTrjR6KoKB+g/V5A2A==
X-Received: by 2002:a62:2f43:: with SMTP id v64mr91811pfv.13.1572514768894;
 Thu, 31 Oct 2019 02:39:28 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-783a-2bb9-f7cb-7c3c.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:783a:2bb9:f7cb:7c3c])
 by smtp.gmail.com with ESMTPSA id p1sm2503669pfb.112.2019.10.31.02.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 02:39:28 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v11 3/4] fork: support VMAP_STACK with KASAN_VMALLOC
Date: Thu, 31 Oct 2019 20:39:08 +1100
Message-Id: <20191031093909.9228-4-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031093909.9228-1-dja@axtens.net>
References: <20191031093909.9228-1-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Supporting VMAP_STACK with KASAN_VMALLOC is straightforward:

 - clear the shadow region of vmapped stacks when swapping them in
 - tweak Kconfig to allow VMAP_STACK to be turned on with KASAN

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/Kconfig  | 9 +++++----
 kernel/fork.c | 4 ++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 5f8a5d84dbbe..2d914990402f 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -843,16 +843,17 @@ config HAVE_ARCH_VMAP_STACK
 config VMAP_STACK
 	default y
 	bool "Use a virtually-mapped stack"
-	depends on HAVE_ARCH_VMAP_STACK && !KASAN
+	depends on HAVE_ARCH_VMAP_STACK
+	depends on !KASAN || KASAN_VMALLOC
 	---help---
 	  Enable this if you want the use virtually-mapped kernel stacks
 	  with guard pages.  This causes kernel stack overflows to be
 	  caught immediately rather than causing difficult-to-diagnose
 	  corruption.
 
-	  This is presently incompatible with KASAN because KASAN expects
-	  the stack to map directly to the KASAN shadow map using a formula
-	  that is incorrect if the stack is in vmalloc space.
+	  To use this with KASAN, the architecture must support backing
+	  virtual mappings with real shadow memory, and KASAN_VMALLOC must
+	  be enabled.
 
 config ARCH_OPTIONAL_KERNEL_RWX
 	def_bool n
diff --git a/kernel/fork.c b/kernel/fork.c
index 4b2a82eda8e5..0eef4243019c 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -94,6 +94,7 @@
 #include <linux/livepatch.h>
 #include <linux/thread_info.h>
 #include <linux/stackleak.h>
+#include <linux/kasan.h>
 
 #include <asm/pgtable.h>
 #include <asm/pgalloc.h>
@@ -224,6 +225,9 @@ static unsigned long *alloc_thread_stack_node(struct task_struct *tsk, int node)
 		if (!s)
 			continue;
 
+		/* Clear the KASAN shadow of the stack. */
+		kasan_unpoison_shadow(s->addr, THREAD_SIZE);
+
 		/* Clear stale pointers from reused stack. */
 		memset(s->addr, 0, THREAD_SIZE);
 
-- 
2.20.1

