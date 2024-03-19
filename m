Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C8D87F965
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:21:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i+rjl5T1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPnh38Wmz772g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:21:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i+rjl5T1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPLp2jmpz3vZd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:01:38 +1100 (AEDT)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5a47cecb98bso2294399eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835295; x=1711440095; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpZgTnYuZKPgrO02ZjnJJrbhmA4KtBA17GzWdnvK/1M=;
        b=i+rjl5T1Ol5AJH4IFxwR6XMvXm9xPL0cr9zGZWXqgv1HAkoBEWy/IpT5nyJ03tHt3/
         G2EPuA/KoK4SQiFVraznxp8VQ/37alvtV7t8Mi8jerPW6FiyybwX2k2xI/fG0pT/DWG9
         8Alg7jShORqZlDuPvcwfOmt/Hm0VYOvMPvOiENYxdNjVptpamb9yJ3lOUCVZRx/YGORf
         lhXoc7XN6PT/IagWcVRlAUP7Zmzj/oLnxAg+bnHkm6jmfuiJDLDH744sKmksd+IE2WqB
         ruVWKMreSs863m05evWgUMT4vBxL1v8xwZ35UkWKt3+kJ2/LI8hrUTy7tUWOimnanv/l
         xADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835295; x=1711440095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpZgTnYuZKPgrO02ZjnJJrbhmA4KtBA17GzWdnvK/1M=;
        b=rRuojp9iU4qpFv1t0r2di/KnaXot60yUtQHzcEiF6IpKyn5PSdJHMUKIP6ZB3Lhot1
         2UK2j95EGbkjqvj0KUv/MQvxjRk8LWecNnR0H9Nube+ogaFNxmmMUchIbn8kdywcX0oy
         n2vN/6VO/AvolcCMlm26Dp0vFti+7woVWemCx9S6hZ9BrkOxOPZ40xMFDSzGyLazWtMp
         uGhFkHlECZZUgnFMCwIYs4LKz45Xb4JksKy2a7m7CkPHa25UZHFw99jzaHYlrC0IRCyp
         z7oxdG4it11slTqJunxMGcobM3hFKEMzj2grQq9B0p5foNqxK5wS5jSOdlUL7O0PpBv2
         J4ug==
X-Forwarded-Encrypted: i=1; AJvYcCVGPFxIJxN0g6AO9YTluhLM1maFMqsnInWHPTbOhPALhRRKsOFLZZg4MsEBeBcZvIU1IZanLXHvEgqqJjCi03XBQuSzqMellZdwsygfbg==
X-Gm-Message-State: AOJu0YwCWYmtHocyG8LEDGVLHlPeCWW6T9dy2/Z4vABu1nRiwcM9hxui
	UCc6gcB+BEdGUZr54/pAAko/0mprWvxSkPAbYeUDJkrlIBsqOw171zjVXGZN3Tk=
X-Google-Smtp-Source: AGHT+IERNdDPUTYaefvVXw56YB3Bqcd2KOnOd0Tcbbwlalm3iIbsADM2+wRouKxCGs7kkgkSLuGLrA==
X-Received: by 2002:a05:6358:199d:b0:17e:6a4d:777 with SMTP id v29-20020a056358199d00b0017e6a4d0777mr1597844rwn.19.1710835294996;
        Tue, 19 Mar 2024 01:01:34 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:01:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 29/35] common/sieve: Support machines without MMU
Date: Tue, 19 Mar 2024 17:59:20 +1000
Message-ID: <20240319075926.2422707-30-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
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
index 7e445fdaf..ac9c0a285 100644
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
2.42.0

