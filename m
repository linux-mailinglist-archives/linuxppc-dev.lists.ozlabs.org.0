Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9762638231B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 05:35:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk4Xm3swlz3cBc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 13:35:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nIQ7ArO/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nIQ7ArO/; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk4VN4t25z306g
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 13:33:48 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id h20so2366183plr.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 20:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8nUO3o1Rk5zU3GJKq2lCYNMZ7SSdbZ8JgFqljMGtov4=;
 b=nIQ7ArO/KZzeA3NQy+LPncGE/9L9E43YxHaIMTJlqRpXVTGqPSsRCkyfJ3xbUB/AXV
 0reCIA1HzUsK4WNQErt4H6wlxPsQ6x/XNPuw5mV1u85AqCcRKDToYNPEE3co6Xk+cYyy
 bcD1mqOPk6/zlUVy0C8+4qUe4rYyfoXwOKjIM1tcrjTMfoHyT0Zq+3SGMMQWS99u3sRd
 EjorJ+wwEVFOzRuqhB9ejc95vHGA/eNPcl8vUr6pYCZOjCJflujTWEKGdL7NBWf/X9Xp
 2i4S8cQQDV/Lm+24nQ70oTLSJK9J8+sXk/niPYjVEPVzAoXNu7RwJ443VOWAM5YrReuc
 e9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8nUO3o1Rk5zU3GJKq2lCYNMZ7SSdbZ8JgFqljMGtov4=;
 b=R7xpf+q7vBekkfyp7pQDJFWKKKN1HX2AJxGee46rVgHjohLcapN6si8kl15kaL/3cI
 +E5eT8ZBebLfkGf2d7zUzAgmvVzqdbZTVpMfs6oDTPhwq6++F+2GC2frvb4xKGyABPuP
 sw2JL6xgQ74mm8rB3aqgogCa/+tFi+8qGLqZEzuOFNDvQWrEr2JeSO+P+U+BuCUGdU7a
 JrXUW3bRTtuevoM1rA/hclrs4IDnV83mKK1T0uoqq31AKzS6TUKOfU+My58+x1MJC1OU
 6vCO40pk3iM7EDk9x3CywrdXkdw7NeRGxRY+m0R3yy5EmZypfqfBtp3kWqt42JkFmye2
 u3WA==
X-Gm-Message-State: AOAM53137Z0mW6d/OvDnGqVyKXo3XQbjKqNbeyhNhIiE1VAZ611YAj27
 ruyIRVWxjPFlL37PMpgTqEbSDGixrjU=
X-Google-Smtp-Source: ABdhPJxxJGVjHGKhrcL0W+U2o5aUZPcvnXQqp5eqVtFJEu5mTo7GUp9dRqdAZ2y/sW0wc+Oh1KTJGQ==
X-Received: by 2002:a17:90a:4545:: with SMTP id
 r5mr14803941pjm.51.1621222426109; 
 Sun, 16 May 2021 20:33:46 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id s3sm9785418pgs.62.2021.05.16.20.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 20:33:45 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v14 4/9] powerpc/kprobes: Mark newly allocated probes as ROX
Date: Mon, 17 May 2021 13:28:05 +1000
Message-Id: <20210517032810.129949-5-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517032810.129949-1-jniethe5@gmail.com>
References: <20210517032810.129949-1-jniethe5@gmail.com>
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

Add the arch specific insn page allocator for powerpc. This allocates
ROX pages if STRICT_KERNEL_RWX is enabled. These pages are only written
to with patch_instruction() which is able to write RO pages.

Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
[jpn: Reword commit message, switch to __vmalloc_node_range()]
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v9: - vmalloc_exec() no longer exists
    - Set the page to RW before freeing it
v10: - use __vmalloc_node_range()
v11: - Neaten up
v12: - Switch from __vmalloc_node_range() to module_alloc()
v13: Use strict_kernel_rwx_enabled()
v14: Use strict_module_rwx_enabled()
---
 arch/powerpc/kernel/kprobes.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 01ab2163659e..937e338053ff 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -19,11 +19,13 @@
 #include <linux/extable.h>
 #include <linux/kdebug.h>
 #include <linux/slab.h>
+#include <linux/moduleloader.h>
 #include <asm/code-patching.h>
 #include <asm/cacheflush.h>
 #include <asm/sstep.h>
 #include <asm/sections.h>
 #include <asm/inst.h>
+#include <asm/set_memory.h>
 #include <linux/uaccess.h>
 
 DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
@@ -103,6 +105,21 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 	return addr;
 }
 
+void *alloc_insn_page(void)
+{
+	void *page;
+
+	page = module_alloc(PAGE_SIZE);
+	if (!page)
+		return NULL;
+
+	if (strict_module_rwx_enabled()) {
+		set_memory_ro((unsigned long)page, 1);
+		set_memory_x((unsigned long)page, 1);
+	}
+	return page;
+}
+
 int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
-- 
2.25.1

