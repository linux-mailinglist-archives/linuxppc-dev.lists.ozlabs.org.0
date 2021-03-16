Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3A133CBF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 04:19:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzz6l3YcTz3brr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 14:19:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DfJNM0SB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DfJNM0SB; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzz5T2z08z302p
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 14:18:37 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id 30so11726679ple.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 20:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hoUZb06JTxTijcPbi8a4pUTkZ5jr9A6529n/cLWmg6Y=;
 b=DfJNM0SB3O3oMP+NfgSLaxGSFSvaOcmHN5P4MSP/9e/mw8GlIeOCIZuUED84mEEmjo
 rfdbNjIEZ9BnJsOCiAv8drxqe1afWRSoggTMvOtilDUMspauzuYBuJoYHBVPo3nILw33
 KuIjWRic9lQulOKkQlWmbfU2k+v4VYam+OrQhqHLrvZaVCqQg+680cXkLVbqXl2Do9c7
 KpVbJoeTKk8j+JWJrR7gnLDapGiO/Sw4bmERSirKqU9oXxVgN/biFfE0mKtL3g81w95u
 oKxld/nqEVb6ziBHNn2RSTuu792FLU/T9O2xfjQDGKqtzk2CyK6UH/eoXHHK475+7e2B
 jcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hoUZb06JTxTijcPbi8a4pUTkZ5jr9A6529n/cLWmg6Y=;
 b=Y9sUmsataQ1VHM6U6COgPCYO8AgaWZOz62ZwvSNnLZCipAU6GnQbx3HQc0xsy6CDRG
 AohPVpavET3FQ4AtjmAd45jUid8CyDmHjly0E3ZDEGvq+bkAzKF5SOdmt8rXSirqs3g6
 FWRKZVH7GV8kLmmQoaQhBtKpX5iU7Q0dAFuQevXz8lDZWqw/IbJweoSnI+gaXabEWcp7
 Ien/c6xxmhLUp0ZeOV68aFgookrx08x/aGWZ6mA3mVrkHSUmWFAcv4b6E+quki3ZAw3K
 9TD4CVoEjd2Ax1qa4/EcZtCGnKdGHTmLxSy5FO/L6vzdt/iEbBirm7zGGf4Gu2qJfYuz
 cQPQ==
X-Gm-Message-State: AOAM531spAwHjUaK09+IClvxMH32JlnT2Zmt56sZFsCMOKBKXxHY3D+C
 v+I7Y5tOi7qDKq40ivIuAAewkxSaSvq4Gg==
X-Google-Smtp-Source: ABdhPJxMfI4Y8jl3Q4qDvbfmLQoTGmJdAP+KmY/ueOBcH5uj30qrJJ8RDQRNpaaTBLOAh/A62H1Klg==
X-Received: by 2002:a17:90a:400f:: with SMTP id
 u15mr2445964pjc.80.1615864715651; 
 Mon, 15 Mar 2021 20:18:35 -0700 (PDT)
Received: from localhost.localdomain
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id o13sm15098809pgv.40.2021.03.15.20.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 20:18:35 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 3/8] powerpc/kprobes: Mark newly allocated probes as RO
Date: Tue, 16 Mar 2021 14:17:36 +1100
Message-Id: <20210316031741.1004850-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316031741.1004850-1-jniethe5@gmail.com>
References: <20210316031741.1004850-1-jniethe5@gmail.com>
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
Cc: christophe.leroy@c-s.fr, ajd@linux.ibm.com, npiggin@gmail.com,
 naveen.n.rao@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

With CONFIG_STRICT_KERNEL_RWX=y and CONFIG_KPROBES=y, there will be one
W+X page at boot by default.  This can be tested with
CONFIG_PPC_PTDUMP=y and CONFIG_PPC_DEBUG_WX=y set, and checking the
kernel log during boot.

Add an arch specific insn page allocator which returns RO pages if
STRICT_KERNEL_RWX is enabled. This page is only written to with
patch_instruction() which is able to write RO pages.

Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
[jpn: Reword commit message, switch from vmalloc_exec(), add
      free_insn_page()]
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v9: - vmalloc_exec() no longer exists
    - Set the page to RW before freeing it
---
 arch/powerpc/kernel/kprobes.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 01ab2163659e..bb7e4d321988 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -25,6 +25,8 @@
 #include <asm/sections.h>
 #include <asm/inst.h>
 #include <linux/uaccess.h>
+#include <linux/set_memory.h>
+#include <linux/vmalloc.h>
 
 DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
 DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
@@ -103,6 +105,26 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 	return addr;
 }
 
+void *alloc_insn_page(void)
+{
+	void *page = vmalloc(PAGE_SIZE);
+
+	if (!page)
+		return NULL;
+
+	set_memory_ro((unsigned long)page, 1);
+	set_memory_x((unsigned long)page, 1);
+
+	return page;
+}
+
+void free_insn_page(void *page)
+{
+	set_memory_nx((unsigned long)page, 1);
+	set_memory_rw((unsigned long)page, 1);
+	vfree(page);
+}
+
 int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
-- 
2.25.1

