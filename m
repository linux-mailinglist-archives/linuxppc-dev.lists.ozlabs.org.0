Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB513779B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 03:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdjsx31tHz3c6v
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 11:20:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UWDWF6Hy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UWDWF6Hy; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdjr23zmBz2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 11:18:58 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id md17so8806618pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 18:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GA52Jv9q7qKK+uuh6zGFDaKth+K49Bn+vh0CMt36g6k=;
 b=UWDWF6HyzOYuDlumJHLFaUHVPqoBDK7TjnA4SCqwE4/jrOiZxx6uDdDE3a+stezzb/
 QAMK0jG3QT2rd3BW1guyRD1PBvG1QKvPxgHxJh41UhKa8CTOQ9sZOpflOv+9cEIb64+8
 3hTBNOxkILToCWRF0VJGjGY3hxE0mN+nfWVXT5qxqcrg3A0kF86+fpUjVjPz7OecTyu9
 3s1SzdR1ojWDypUREC5eW8z6ZDhCuUmsJHcf0Aix/uGsfo6FbQtxc4RF87cZfxRmjWFm
 mtpRpkxg8AOjHQ0VhjzCtsMvMBT+G11dO7WQ95lt9MtRR53dRSt8A5BXVxJwggQmOEii
 nXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GA52Jv9q7qKK+uuh6zGFDaKth+K49Bn+vh0CMt36g6k=;
 b=Jzq6hmusZmhu4wYZCZrO+adzy7PDZtCLa5AQrSKKxjRp02KGGOdPo01lNivWQbf9To
 7E3cX6oRBQMIHiDiF98ySGGiabe5gOXZT9HJXcTnmZOvtN8DPr+3WCyND9uvO+uW9/on
 8L7S72+iHDYNr1/HiLtPl0qW0hsn8iAVLsSoO4IMVo+RUVVxJ4k3n0uOwAqBO0eeQ1wH
 NRbWzp3g7SdHLJX2OSWqYMCvYoyyXcSZSfaYdEvfA7dCt3iXhcWrfp7p5V4UD8CantB+
 Lp9rxeDpWycyKzlN87UPnJ5npQRiMyx92WjwzqqgNBaH1CytUofcgLJSeFCtMp+M6CZ7
 bZlg==
X-Gm-Message-State: AOAM532yFtNIqfMSycLztkRIEyXAO3VFL5IZxKpRjyhjDOrfC8fnxZFK
 M3o8LFhLLcxnnMbsWqZSx1BjUKdSMWY=
X-Google-Smtp-Source: ABdhPJxa4akQGisS57oPTWrZSewj1xTu9j9RsuPbjTfOh5BAW52chXJQFfhnc3sSQ96fNq8aeOcylA==
X-Received: by 2002:a17:90a:d78c:: with SMTP id
 z12mr37290139pju.106.1620609535418; 
 Sun, 09 May 2021 18:18:55 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id n129sm9887649pfn.54.2021.05.09.18.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 18:18:55 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v13 3/8] powerpc/kprobes: Mark newly allocated probes as ROX
Date: Mon, 10 May 2021 11:18:23 +1000
Message-Id: <20210510011828.4006623-4-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510011828.4006623-1-jniethe5@gmail.com>
References: <20210510011828.4006623-1-jniethe5@gmail.com>
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
---
 arch/powerpc/kernel/kprobes.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 01ab2163659e..b517f3e6e7c5 100644
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
+	if (strict_kernel_rwx_enabled()) {
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

