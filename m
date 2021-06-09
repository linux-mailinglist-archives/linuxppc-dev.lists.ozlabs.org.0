Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4823A097E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 03:36:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G08py1qBjz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 11:36:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=f1OppKZv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f1OppKZv; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G08mj2MRcz308C
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 11:35:01 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id c13so11716709plz.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 18:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8nUO3o1Rk5zU3GJKq2lCYNMZ7SSdbZ8JgFqljMGtov4=;
 b=f1OppKZvbranVvb1VQCkRWVBreGfBQIEPSD5XnRX6K6rI1D+ttotYk0b7BrEyobqMg
 U4phdo6Dnp4exjnVvXW8VBZ+I+bUv0kQHHlfC+02fyTmAQzlv4PRz4rMVBe9SiqKJNVi
 +AQdZvqk0ITMn4WG1+n6P9/ZJwHHvX+R2+tpeHf849yU1dfAQ6GsXLzdGcP70e7zfvLw
 wh8sw56+sPFt8EZhsQsNJ+ErWy9MNkJdf3AvaS+YrgJQ4aAZ+Mw2JBkb7QLTjot0kwbz
 dy7ZzyNCVj6+fibLKxUlBeEDMVJQ2BLvj2kzLmBrpT1eVF+Z3gyqCZ8UrYE5LNGYxikc
 pKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8nUO3o1Rk5zU3GJKq2lCYNMZ7SSdbZ8JgFqljMGtov4=;
 b=oGesfsBdUX5Gv8hqK7d6645mOaUv+NKTmUvEX29sgtC+DXaW0VnLxJBgvvFRQuMpp9
 Wogjwvrguvc6IL3f7jbrgTY22wwoqwcGfgAQH4/N9NDySf2Nx2bbdE/2izFxIrJDUCL5
 0506h65IOkxbwad0hpMT+1G72q750cSt8kXlar/QX6PsoXfYeMulbkEcfwUhvFyTKHQV
 aEConirS17Xe2Pmdcd64n3aA57zuMZY49EBPSU97tlGd/2sQ9MZcZHEVKr7yZ3Q2SxbK
 oXCBU452sL4jviSDjVyAC+2JduRI3HSdNS92eYJoHAtp3t2U7qg67G3o5RxpqY4ychqq
 5Zrw==
X-Gm-Message-State: AOAM532DueYybB8Z2AJLMxyXLtpd8gU+1Scc9aQ8p76hv26BACEa29zy
 3gP/rNN93Up019/4UjOsC2vmtW/ZR5M=
X-Google-Smtp-Source: ABdhPJybqZp1FiNnD4tjncDxujpGf3cwoLdPN767NQX9ufEa2Rtr8Bf8G0WUYhcARs2WFBbzryZi4w==
X-Received: by 2002:a17:902:e751:b029:106:65ba:5c80 with SMTP id
 p17-20020a170902e751b029010665ba5c80mr2676666plf.36.1623202497821; 
 Tue, 08 Jun 2021 18:34:57 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id s10sm11369406pfk.186.2021.06.08.18.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:34:57 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v15 4/9] powerpc/kprobes: Mark newly allocated probes as ROX
Date: Wed,  9 Jun 2021 11:34:26 +1000
Message-Id: <20210609013431.9805-5-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210609013431.9805-1-jniethe5@gmail.com>
References: <20210609013431.9805-1-jniethe5@gmail.com>
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

