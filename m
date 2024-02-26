Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC11867118
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:31:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d5epv6xC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxkC0tV9z3vdJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:31:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d5epv6xC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxL50QF4z3dW8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:14:20 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e4d48a5823so2200147b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942459; x=1709547259; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfwcDBIoywwZNy1awe5blDTng5UqVAab7H/ucqIcyI8=;
        b=d5epv6xC4BeQ0LJGfHZYTd5od5a4MSdTqf2pXv+sDydoNsAtOxxB4t8ovAD7l/Q4Nk
         vs8pkIZ401PuqWgR7bh4jMpRo+KoELJHDELrdUaO9uYz0j6y1w8D9HgYsbAhPNmj5hv5
         8IbrIeDm9Ym/D1vsrGwejw1LZG2MgE9dETFTgN+LzHS2unE2r0T0FrKafu3Hr8RdUky8
         E0mm1LDhQ7KuXEo5TcaxxKXZtTYtFs/OSphMA3QKV8gqTH1EliaLN9sSKLSJftK7kGOp
         ndFXq+boHzWu7Zx5xQCi8nPPMyPWsnpU/mwR2yN+ScKcXz/4qCzrCOwkiLxGREVDhAcn
         uKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942459; x=1709547259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfwcDBIoywwZNy1awe5blDTng5UqVAab7H/ucqIcyI8=;
        b=lw5mt70zUeOLBpqGcCgLYHLg+QTBlvb69uHn+KXhUcKLawvrMANYhsbzXPpc4Pv1ey
         IM7k5GqBT08I7242abDw2PifcpREvejE6NQ22aio9XBD8RryWEOffcczW5SBaDpk2pq2
         hIQILHf/C71raZrNFtUplgVRIC8aByMHc0dgeV0sJ7vhZId1GBlhQ3Q6c3fJZy9MrOJ7
         iFrO8GNk6nyT+Bs80lJcFgxc2t2MmHiVQPe89X2zFAi99NbJ8sqkE3EZIIHtdVMXhgSW
         NrwR7eK52ymgKMivGiqECp27zfg6PtN//b3vMellP7MKU5s1vjhjHA71S6pVIy7X5WOV
         p+4A==
X-Forwarded-Encrypted: i=1; AJvYcCWSuzPdDDB7D6do/lVUqw2wrEjpAu/QQIe6nQLVmdZUwGxLz44sFDO3rm5lTofuvLGuGWouH8YD2N07LljHlmUDogRhi0F9LU2V788FgQ==
X-Gm-Message-State: AOJu0Yxt0JyIAQJJQW+ZnzeJZRL1XI7zsX83QlMo28DI8CizelTb4gjk
	PBeBxctjkfeF4MgQ2pTzf0UfWUsWhKJGebQrWXUi+Xa0E2nr4po5
X-Google-Smtp-Source: AGHT+IFFwkunH0uAN31qvc46kWCxjAGYqWfk/p1PpoOp8Y4nUVYJ+dKIxLsEVlzJYo7rVd0OC9gKyw==
X-Received: by 2002:a05:6a00:2d05:b0:6e5:3e11:d7f7 with SMTP id fa5-20020a056a002d0500b006e53e11d7f7mr195499pfb.6.1708942459205;
        Mon, 26 Feb 2024 02:14:19 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:14:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 25/32] common/sieve: Support machines without MMU
Date: Mon, 26 Feb 2024 20:12:11 +1000
Message-ID: <20240226101218.1472843-26-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226101218.1472843-1-npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Not all powerpc CPUs provide MMU support. Define vm_available() that is
true by default but archs can override it. Use this to run VM tests.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org
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
index 6adf94151..f1219033a 100644
--- a/lib/ppc64/mmu.c
+++ b/lib/ppc64/mmu.c
@@ -24,7 +24,7 @@
 
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

