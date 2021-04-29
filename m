Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE9A36E397
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 05:18:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW11K42Ccz3c44
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 13:18:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KXQMzyie;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KXQMzyie; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW0z76DCPz309W
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 13:16:51 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 k3-20020a17090ad083b0290155b934a295so3762419pju.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 20:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YWWQXcHiG14mhi0rYe3JYUm7skuJM6wBvy4eoauFEH8=;
 b=KXQMzyied6hDPxPb6+A3URcsjvw37a1+8PiaZ7PaSx2MTVsIjUjR5DpBCpo3OuU8t3
 NJAAWfQFh40I/+ah+6AxQSwOI9PakuY9Srg2kLotb1wLQlY2CzzlvrfhQk9+sW/v80GN
 p0rXhOCjhU3rWCtF4ovSV5caGxIbzQy8XHWt+iOICL2J2WOGmMhPW49ZGGcnn32il0HT
 WlfSWHqnEDa7czDyf3kSpdWr5w+sfh9PrQ+WoWerDZsMJ3y+xYd+4D+mMULntZ2aYiVK
 bjVeBzPMblbpOXjLKZtfYZmkzz/v/TIqvzncJgq1F0bT29lSrmhB088ZBGnkdxHk1vyi
 ly/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YWWQXcHiG14mhi0rYe3JYUm7skuJM6wBvy4eoauFEH8=;
 b=Vt/eGyl2q8jCHObMrD7lFmnGKq+ThNIXAt+U3OmH+u8afIwTn7AGLTbykJ17x+L1ha
 qxGIOAuueMOpDXcnWKRn/itnUmIevV+XUe+uBgWL3JKSyU+S6VW4NXb1oABfMUSH0j+P
 Pv7461+/vM0Rn2ozfn9Z6G4Suu03dc+Qxmg812krOqW61N2A4o4Woub5kK7+g+rqLihK
 bhok+MZ4YiSbgUK9fbS3nwTTK/C52JxGP5J93wBjZ88huLcrUzNS6i0QOBJQtsncfRat
 pPkNxrtGPZTXetxFSsSfTiSDN6f1s2czDY0ss0EFvCQBLMc08AQru5pOuTqqAWCl5R1E
 5+lg==
X-Gm-Message-State: AOAM533szKzcMnc+Ovz3DWb5G4rtJJoE84SI23alTBS1c+exoHfqR1EJ
 T+q1MPIcSMNlqHKcWfwdCdgKx1OUrEE=
X-Google-Smtp-Source: ABdhPJxSXw3Fol03jgTl5bKlcvgl6oLKHpgu8hueojWTfuAuLuXn4D3Tc2B+hJuhtewvXKPlRjHOVA==
X-Received: by 2002:a17:902:b28b:b029:ed:19aa:5dec with SMTP id
 u11-20020a170902b28bb02900ed19aa5decmr22642019plr.78.1619666209362; 
 Wed, 28 Apr 2021 20:16:49 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id l16sm3650742pjl.32.2021.04.28.20.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 20:16:49 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v11 4/9] powerpc/kprobes: Mark newly allocated probes as ROX
Date: Thu, 29 Apr 2021 13:15:57 +1000
Message-Id: <20210429031602.2606654-5-jniethe5@gmail.com>
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
---
 arch/powerpc/kernel/kprobes.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 01ab2163659e..5670b43e254f 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -25,6 +25,7 @@
 #include <asm/sections.h>
 #include <asm/inst.h>
 #include <linux/uaccess.h>
+#include <linux/vmalloc.h>
 
 DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
 DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
@@ -103,6 +104,16 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 	return addr;
 }
 
+void *alloc_insn_page(void)
+{
+	pgprot_t prot = IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) ? PAGE_KERNEL_ROX :
+							       PAGE_KERNEL_EXEC;
+
+	return __vmalloc_node_range(PAGE_SIZE, 1, MODULES_VADDR, MODULES_END,
+			GFP_KERNEL, prot, VM_FLUSH_RESET_PERMS,
+			NUMA_NO_NODE, __builtin_return_address(0));
+}
+
 int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
-- 
2.25.1

