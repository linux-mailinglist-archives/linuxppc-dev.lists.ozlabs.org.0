Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB21904AE0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 07:27:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TdY1n1k6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzYwC08XVz3fwV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 15:27:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TdY1n1k6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzYqW1MZsz3dTn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 15:23:51 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1f70509b811so24219025ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718169829; x=1718774629; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whEhZTtPT00OFJB/07kvSJ13rQAZJafg7Gn5tcNqzNY=;
        b=TdY1n1k66XMGJb4ht8b1i8mX3hlM3qwlgL9Q1JJCGxOfzPNJhGmh6k4rsDMYs1NTmp
         YrNx1D3aM9LiRUVjb8uXnJS64tg5ubZpB7jRhFSroZyt8lTyaF//9azufuGyN8Z5Li0P
         wdc5K6xs8rEp0to1ggolHoAqDD039PzrtquPmO+3BMdTqatR5aHji5srh0s34PXR6iCK
         hanE9V9g1ud8Ch2QhJhbSrB4BBv4+dN7sgqqb82JlbNUF3LIZEH6f/oknm0zfn1W6HPN
         40EGZeRbzsFXr4S6f+F3tCiEP3JRmrHzXHfiaM/hTNPYj+Si/R61nYzl3IHm+BqtDEqx
         M2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718169829; x=1718774629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whEhZTtPT00OFJB/07kvSJ13rQAZJafg7Gn5tcNqzNY=;
        b=nabYcIZy1rX2BH7wXWNFhrH2dGxLU4vvcSM9uk711RZ43b2zgdLWc2EwKgyp1d69Uh
         VuXIYfDdYSMFO8FXbUuzVBTA2kR/KHODfyrdRjQQ6/COGOW9UrCHyqEYF3z/K59G3bJv
         c/qCOf1yfrAfOmGwZ6d1WY/yuPbdwC5fyDakBDESEiazvDWI23WCZQ5Ss0ly8td5EmW/
         3YvA8D2NIUuHYUS7CdxRGZ3OaG/meUvu9IvQdqkC2oNb2rK1LFBxTfEvVKamNnv6PTaP
         bo0r3Ns+vwwNfevgb8UgS4L+eSCs+6e4OMyA6njxTEYulDIlp/ZJTlqahRzMilOzSF8r
         IxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQLsKbZm62z33ItU0j3yWxa/xDpuzMzKTA8V+51wb0fRkKiK8YbyW2KhGL9E/gpRxzOA84okvRtizHVzGGGWRBX+Yq9TR+W3b9QfnJMg==
X-Gm-Message-State: AOJu0Yyj4KBwm8HMcFeQRQSBWzGN4Mu766rvOq+lEWsKOHL4jFWA8J/T
	8xDuoRFM0eBc5HGlvzvvIJSi019cQ1pA8r/7i9gfcbFQ2qRnI6X280mwKA==
X-Google-Smtp-Source: AGHT+IHf8iskGQ6DNM8Nf1fvjQgzr4swkoP/BW0g4dMf4f28rpBqyuTlnjIcqMfwWwIRw7lvEIHdzw==
X-Received: by 2002:a17:902:e80f:b0:1f6:fcd9:5b86 with SMTP id d9443c01a7336-1f83b56617cmr10187605ad.12.1718169829461;
        Tue, 11 Jun 2024 22:23:49 -0700 (PDT)
Received: from wheely.local0.net (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75f711sm112170705ad.11.2024.06.11.22.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:23:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v10 05/15] common/sieve: Support machines without MMU
Date: Wed, 12 Jun 2024 15:23:10 +1000
Message-ID: <20240612052322.218726-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612052322.218726-1-npiggin@gmail.com>
References: <20240612052322.218726-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Not all powerpc CPUs provide MMU support. Define vm_available() that is
true by default but archs can override it. Use this to run VM tests.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 common/sieve.c      | 14 ++++++++------
 lib/ppc64/asm/mmu.h |  1 -
 lib/ppc64/mmu.c     |  2 +-
 lib/vmalloc.c       |  7 +++++++
 lib/vmalloc.h       |  2 ++
 5 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/common/sieve.c b/common/sieve.c
index 8fe05ef13..db084691a 100644
--- a/common/sieve.c
+++ b/common/sieve.c
@@ -40,12 +40,14 @@ int main(void)
 
     printf("starting sieve\n");
     test_sieve("static", static_data, STATIC_SIZE);
-    setup_vm();
-    test_sieve("mapped", static_data, STATIC_SIZE);
-    for (i = 0; i < 3; ++i) {
-	v = malloc(VSIZE);
-	test_sieve("virtual", v, VSIZE);
-	free(v);
+    if (vm_available()) {
+	    setup_vm();
+	    test_sieve("mapped", static_data, STATIC_SIZE);
+	    for (i = 0; i < 3; ++i) {
+		v = malloc(VSIZE);
+		test_sieve("virtual", v, VSIZE);
+		free(v);
+	    }
     }
 
     return 0;
diff --git a/lib/ppc64/asm/mmu.h b/lib/ppc64/asm/mmu.h
index 32f1abab6..2bf94e498 100644
--- a/lib/ppc64/asm/mmu.h
+++ b/lib/ppc64/asm/mmu.h
@@ -4,7 +4,6 @@
 
 #include <asm/pgtable.h>
 
-bool vm_available(void);
 bool mmu_enabled(void);
 void mmu_enable(pgd_t *pgtable);
 void mmu_disable(void);
diff --git a/lib/ppc64/mmu.c b/lib/ppc64/mmu.c
index 9e62cc800..6f9f4130f 100644
--- a/lib/ppc64/mmu.c
+++ b/lib/ppc64/mmu.c
@@ -23,7 +23,7 @@
 
 static pgd_t *identity_pgd;
 
-bool vm_available(void)
+bool vm_available(void) /* weak override */
 {
 	return cpu_has_radix;
 }
diff --git a/lib/vmalloc.c b/lib/vmalloc.c
index 572682576..cf2ef7a70 100644
--- a/lib/vmalloc.c
+++ b/lib/vmalloc.c
@@ -206,10 +206,17 @@ void init_alloc_vpage(void *top)
 	spin_unlock(&lock);
 }
 
+bool __attribute__((__weak__)) vm_available(void)
+{
+	return true;
+}
+
 void __setup_vm(void *opaque)
 {
 	phys_addr_t base, top;
 
+	assert_msg(vm_available(), "Virtual memory not available. Must check vm_available() before calling setup_vm()");
+
 	if (alloc_ops == &vmalloc_ops)
 		return;
 
diff --git a/lib/vmalloc.h b/lib/vmalloc.h
index 0269fdde9..e81be39f4 100644
--- a/lib/vmalloc.h
+++ b/lib/vmalloc.h
@@ -17,6 +17,8 @@ extern void setup_vm(void);
 /* As above, plus passes an opaque value to setup_mmu(). */
 extern void __setup_vm(void *opaque);
 
+/* common/ tests must check availability before calling setup_vm() */
+extern bool vm_available(void);
 /* Set up paging */
 extern void *setup_mmu(phys_addr_t top, void *opaque);
 /* Walk the page table and resolve the virtual address to a physical address */
-- 
2.45.1

