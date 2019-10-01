Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C28C2DAF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 09:07:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46j9MJ15tCzDqQF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 17:07:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="PkKrMZvk"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46j99J4R97zDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 16:59:00 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id y72so7215956pfb.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 23:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ix0tFBRmdQmDh77QwfWZLAnX69tqINWfajYEldnceVk=;
 b=PkKrMZvkp74INNZKZ2dDIpCNCHVjGw8vj5JQwUl5yuKjn+mrkDNW8nd0IZRL/da0Oz
 7fYU6QSXP186MQjobjFiMYF4HdN6zwscGQCBq3hJxKnmjoj5ZSDDM0bRTFsJsfIVE6Q+
 OTWhweQ8a8sjTdtOPJIyMwGFIBF/D+52CCXT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ix0tFBRmdQmDh77QwfWZLAnX69tqINWfajYEldnceVk=;
 b=intzsKLoYRa0RXax88S6mMPvQeaCgiP6JTt03Oy/Cg9/S9t6+sUV+iMIjcL6R4p4Ph
 y4NPn49gaZCh4hHCZYaBM2Fe4pbhaw7eGLN8/N5W9MnKqRBVgyDriJQHV8tt8WbAD4vG
 yP9h2+fBf+0A7gs1U8YBI+9K3umHEY9ik9JBAdNkYprg8DC5QV1CfgIZxiKJN2WhrZbJ
 Z6K+v3oMPnqdfhHN6BzKADrqV8nX5RDgTGhgw9zSvShSJ3ukFCQ1XrXUOU1FppwY+iFf
 P6puMkhSQPrxB9RETh604iGU+MdTf2WMGS/0EthcusGYyosTIlTFsA6yF1F3JN2DWRjC
 MMWg==
X-Gm-Message-State: APjAAAVEjW3+mAs5qQfu8wZxFq96z8b1YIJj23WovUmstBIBrrE8vSX6
 v08TKnO1Ee5kg3VZEsDCXTPIwg==
X-Google-Smtp-Source: APXvYqzGnBRD0kjONgaXtURBaqezFW/Qadqkue2P9h+PeB1Qy/HXS+o7oYYr+Hx3pOOW3xuZwH5UTA==
X-Received: by 2002:a63:7d10:: with SMTP id y16mr28593557pgc.368.1569913137887; 
 Mon, 30 Sep 2019 23:58:57 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id x12sm14654380pfm.130.2019.09.30.23.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 23:58:57 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v8 3/5] fork: support VMAP_STACK with KASAN_VMALLOC
Date: Tue,  1 Oct 2019 16:58:32 +1000
Message-Id: <20191001065834.8880-4-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001065834.8880-1-dja@axtens.net>
References: <20191001065834.8880-1-dja@axtens.net>
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
index 6adbbcf448c3..0c9e6478ba85 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -94,6 +94,7 @@
 #include <linux/livepatch.h>
 #include <linux/thread_info.h>
 #include <linux/stackleak.h>
+#include <linux/kasan.h>
 
 #include <asm/pgtable.h>
 #include <asm/pgalloc.h>
@@ -229,6 +230,9 @@ static unsigned long *alloc_thread_stack_node(struct task_struct *tsk, int node)
 		if (!s)
 			continue;
 
+		/* Clear the KASAN shadow of the stack. */
+		kasan_unpoison_shadow(s->addr, THREAD_SIZE);
+
 		/* Clear stale pointers from reused stack. */
 		memset(s->addr, 0, THREAD_SIZE);
 
-- 
2.20.1

