Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0E9374DA5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 04:40:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbHqv3HcDz3c1N
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 12:40:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cBU/6gwz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cBU/6gwz; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbHp12mdRz30BX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 12:38:48 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id d29so3698885pgd.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 May 2021 19:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hG50FrS7gX00Flt7bvZy6rZI5at8kJZgIUqs0mwHnNg=;
 b=cBU/6gwznBWYF2Grp26LHa2iDHDYz7+HRaANqE6YPn+hxsgvAcrZ+ZtbpB/WOIksJL
 u8Zx9mRWBRYZJIvWT4I6BvXaDUvbw5DgTRf+9xCRWldmG038K0+xOX/Xab4Grh4HwFby
 76kkmBTxuqNxMZMIbtXxYaaBtccDbtT5LMOhMgse2H5jm04W6+MPrG6Vl2FYy1wmGEgC
 l9HdX+cWcVP7iiCiAa/LxVDnh5bBCQpaYMvl5axXfHM3jseB+gBvwnpjuWZy7rf2uXNT
 EFJ1xUVqJXui9j7KAmjDpiwaSHBTApV0FOfVtZWPoasnkyoH2TheKk9+Gf5UFmz/Nhsv
 0SLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hG50FrS7gX00Flt7bvZy6rZI5at8kJZgIUqs0mwHnNg=;
 b=nJeJ+H84vJLxtM2WuBe4wIjS8vcNUElgEKLYZ/neySSczPohusnj1bLOPNpfCjo2Qn
 h9AkBLEQHAg3OHjvp2aSOJcibNyL/5gAAiuhRYAEBFAtv6BihodAVGCliwylDSlPu88X
 o4Mv/yRpT4kTmS20kM9rspWWILA8avpLAQFp4CAKT0EP/hN6kp6Msh/ysalFMK03ONLm
 HnBISG3GvlVkI1r2Y7ukSGQgrce33cEp9g8u/6qA0Oj/zb6VkyLl8wCjDfgoegSoQQsk
 n88ChYeHP3B7RMn29qjq29uT5zqXTNCGxyfXLohD7b338huGX+DlGFh9XZPTjHXfIETT
 UW7w==
X-Gm-Message-State: AOAM532NTtWI5gIonWU5pn9yY1KRcrlfnyF1Ii7qttCT+aI2ozYjD0Zb
 g8sSZTByCrWy2bGWSQVjZUxriY+9sbo=
X-Google-Smtp-Source: ABdhPJzQ1hWX6aJ+ZyiNlrR5fhcWlO3mx3Ku2YAguxLIJEtKC0qJFMUMAWCUt0a2V/sWSGVmTRGKWw==
X-Received: by 2002:a62:2d6:0:b029:204:9b3b:dced with SMTP id
 205-20020a6202d60000b02902049b3bdcedmr2166009pfc.36.1620268726783; 
 Wed, 05 May 2021 19:38:46 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id k12sm454490pgh.16.2021.05.05.19.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 19:38:46 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v12 3/8] powerpc/kprobes: Mark newly allocated probes as ROX
Date: Thu,  6 May 2021 12:34:44 +1000
Message-Id: <20210506023449.3568630-4-jniethe5@gmail.com>
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
---
 arch/powerpc/kernel/kprobes.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 01ab2163659e..73a294802f72 100644
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
+	if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
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

