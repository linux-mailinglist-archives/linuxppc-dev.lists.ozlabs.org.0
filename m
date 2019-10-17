Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED059DA337
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 03:34:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tsCB3H78zDr8m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 12:34:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="YSJ6KAHi"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ts180wfRzDr7G
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 12:25:31 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id f14so291934pgi.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 18:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Qk9PXHlMYGMSaAT4No+OXlpNbokcwpw05BcYMTN8o0=;
 b=YSJ6KAHiGnESyfIOPhPKg1SYOVmjMBpomipuFXEhixlmLzKVW8KvRvn5hHyn6j2Y1i
 p0eSmpQseV9wxx3eeTbQ1axx5VnzPdFc8iQC+dfYkX4tE20eVuU8xw8dU0mQPGkNS4RJ
 MaD1w2zcSOG1GUeN4MR3fRhoXpOaM2LU5n7Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Qk9PXHlMYGMSaAT4No+OXlpNbokcwpw05BcYMTN8o0=;
 b=EMw6+DCvVGxcPNho/0jBZpm9OI5vjU46JM3/XiLqAhlh9WShzTQ+nucBzIaWIwJyh1
 Ii71vXEmph5hSRJtxdWa02r7kx3DOToWQBokoK5zXfHcemibAUAqf0IRjaKbTlcfEpFy
 PubAMK1Vstd6EuE5imKv/JqDcnzMPgakNvGynIEMbQgJsfJJyH0ZizQzYN6OzjNdNe6N
 roZ5TX5wWhwjWQjOcNzYwq9YdAp9OeOH/+3405hM0F9g/iwCdJbfSZpIbwOwqwqRa90m
 39yOGCPYjhE3w+pp2rcKQkUjjTBVjZfz/hi/m2Aj9/6ttpXJuayyLQHneL6XWGP9xQXd
 vCEQ==
X-Gm-Message-State: APjAAAWUGXmm4jvRnFCtmvilDI/5sO6ZLZDiEH1gaed2YJt8KDJE6VkZ
 hjOp0yK2yEfj5lu4LqUyt8CwlA==
X-Google-Smtp-Source: APXvYqxXibUE0U8yVD2FdPr0YPQf1k44k2wbp/Do/vRXY+EPhK1zFPUYH2gqnpMbv50YR9NpPNR7KQ==
X-Received: by 2002:a17:90a:868b:: with SMTP id
 p11mr1154784pjn.58.1571275527734; 
 Wed, 16 Oct 2019 18:25:27 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id 127sm351343pfy.56.2019.10.16.18.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 18:25:27 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v9 3/5] fork: support VMAP_STACK with KASAN_VMALLOC
Date: Thu, 17 Oct 2019 12:25:04 +1100
Message-Id: <20191017012506.28503-4-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017012506.28503-1-dja@axtens.net>
References: <20191017012506.28503-1-dja@axtens.net>
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
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/Kconfig  | 9 +++++----
 kernel/fork.c | 4 ++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git arch/Kconfig arch/Kconfig
index 5f8a5d84dbbe..2d914990402f 100644
--- arch/Kconfig
+++ arch/Kconfig
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
diff --git kernel/fork.c kernel/fork.c
index bcdf53125210..484ca6b0ae6c 100644
--- kernel/fork.c
+++ kernel/fork.c
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

