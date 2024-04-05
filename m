Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBE68998A4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:57:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XoV8LFT6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9snX3SYRz3vgg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:57:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XoV8LFT6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sLm1Rd1z3vhJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:37:51 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6e0f43074edso1169603a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306269; x=1712911069; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVFESOjcVNNLos51ELml5v9t1FTREA6sVge5yqZTLzY=;
        b=XoV8LFT6cu+YV3B4Jqg77epSOncENwdQ1oLFy1BcXplodHbKMITG/1YsTxirRdwHM1
         2D2Sl1cNyIBn0ExCGToE8iUmZuxkWVspBw6FdYasSaK8GAth6frismhx+0CDvikCKJzO
         TCzooEEXG/OcEMjJrli/51u0F/4kvT2WIswxoItwuwIQXw2wifDVleByyMzj/rR+rp6+
         pnSXjPaq/2bxHnKSfluCpShZHKtFh2FsDwEidkZQ1Q5bwHW+siEK6JQPJSkACeWvwp68
         huw3wSl/tVo8GvZOLC19z+MSWoYGcHVDVHBlIA8Hk6u1DYpXjArZ8GtB2WGSQC3bgJrH
         Adxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306269; x=1712911069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVFESOjcVNNLos51ELml5v9t1FTREA6sVge5yqZTLzY=;
        b=Q5ZaWexzeQJ/WUuigu0iyCLIrWP+v7mD1HQR4tSM06eKZqhFBICYLct3dI6xB5bQk2
         4LMO2SZB8TMczqMB1m0LUpIp7zPZKDKgu6lQp5u+s+wImUWcR7jfiOnp+XyxUEIlR7ry
         sO0bC4D5CtY/v9kt/V9F55vzMHja1NLd19rE8hiApbgWdSVc3Za7tcDEGSMkQdLyXtL/
         7YSQDWQkb1YxKnTo/Lplq09qy+EnHrcLD1gb+aUv8NUVT62K/SbaOUfrml/0huz+rjcb
         3vzfkw8kqUr7+PndgZX2glFaCz8FwP+dSulk5PyHJoYnDv+5v2gGGWyfUaXK8s1ATbDz
         KT5w==
X-Forwarded-Encrypted: i=1; AJvYcCXT4nlQR4B2jIahQvQMAcYz2FZs+bQNr+CJ63FDVLWYYiuiXCURSPzpeKkWWdF6IArT3Yoqps9IFJ7pIZntM7eXtGTsM7kxNHXzqZ4hLg==
X-Gm-Message-State: AOJu0YydMqd+fr04irrsLK7lcp3742oXRSXDI71Oul2kvJ0ly1NJEzOZ
	UanZWbff08QXVm9m07pTbXSUpQSS/9VElnWTJgA+gC2/Ax0NhQpW
X-Google-Smtp-Source: AGHT+IHVOuA69ER65+xddK5ckvCsnmvJfddxakbq65AQZDNkYvQ4G74j7SWW8EQqLdsFts08sTuatQ==
X-Received: by 2002:a05:6830:13ca:b0:6e6:8564:6672 with SMTP id e10-20020a05683013ca00b006e685646672mr794574otq.25.1712306269104;
        Fri, 05 Apr 2024 01:37:49 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:37:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 29/35] common/sieve: Support machines without MMU
Date: Fri,  5 Apr 2024 18:35:30 +1000
Message-ID: <20240405083539.374995-30-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Not all powerpc CPUs provide MMU support. Define vm_available() that is
true by default but archs can override it. Use this to run VM tests.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: kvm@vger.kernel.org
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
index fadeee4bc..eaff0f1f7 100644
--- a/lib/ppc64/asm/mmu.h
+++ b/lib/ppc64/asm/mmu.h
@@ -3,7 +3,6 @@
 
 #include <asm/pgtable.h>
 
-bool vm_available(void);
 bool mmu_enabled(void);
 void mmu_enable(pgd_t *pgtable);
 void mmu_disable(void);
diff --git a/lib/ppc64/mmu.c b/lib/ppc64/mmu.c
index 5307cd862..84be31752 100644
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
2.43.0

