Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A837387F955
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:17:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gAVUnxBU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPjR2prKz3wWW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:17:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gAVUnxBU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPLN08kPz3vYq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:01:15 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e6b54a28ebso5147491b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835273; x=1711440073; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2v3m6/HzaZ1rQ7x7lB6tdszFjgJSQvXgFZcRwhVCtA=;
        b=gAVUnxBUocep/lidSuHLSivYJPXNeoKf2aUCcjvAhEQcQkmk3rw51wM3PJHHYFq6qc
         SOeEJTmWz/aG6aeEw8LzLdrjmwPNESUzW/NIR34fMAeRjd6iL7lQq+OYiUjLx0emEp8x
         NLcMrntTMIc0W9GVXn2dQad8lbvjhklw/bqzSFxp5rDFFX9I6iG6dQjOrfQNV8vn7+mw
         9E3Eq3A2PgLdWgoz4CHJvkOHl2a5OsKDrPm5IGZQ+Q/mZ7CET++1PmcguUz+EEDcYhnw
         7hkaZ6YTL2TfX7tcE+HwcENKKyfyrIsWvnpJpAQMLyesFNpJ/20LEQfOsQJTZ8e9+L/9
         8JgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835273; x=1711440073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2v3m6/HzaZ1rQ7x7lB6tdszFjgJSQvXgFZcRwhVCtA=;
        b=QnEoOeItdSbcOggSbsPPc/YeSnamUrJm49hYSB6MKHsoVsnQqEQV94v/YaB1U/qbe1
         2fquH9RuSNXbppdmZPxbxO+carTsmQ/KUNi6r9fnNdVYVN3S9SVyzKfxHgPUI5Uk0qm8
         4ddQCi7F5Td4u+zrv+dcgouQQVfl2Y9g/uoqLX5415zjuWeb1G2ulNg0wX1OpkP6r6B/
         d43FDqA8Xq0ALw8igLeT7Uvqljfmx0xQ/Vqj4AJk7QgKheGlmZTALyiE/C0MK7ajMrrY
         J9lTPYuQT8fqjCJ8htadjO/Y+nq1AgxfVpuXh5/ptYjsTRKKblOaN6RY1Q3UDSFJMS/Y
         Ubtg==
X-Forwarded-Encrypted: i=1; AJvYcCXvYFkWdfpFC2wI6W7NXuscjMIo39S36PEXFwb/493J7V/2j2ASgisjtaMc3GZhQxSQPZwWk+kXpjVdXeduvQxyThzapkPmp4RpMfL6Uw==
X-Gm-Message-State: AOJu0YznMKIXwRIAyXBkQXPtDWdcpaB8fHUWVrQ1QBVG+nxTACd9NnRk
	kQuqVlkw8fv9drS0i1x+3mML/SowCgL/Wc7B6Gjh3g+DY5GR83Gt
X-Google-Smtp-Source: AGHT+IHdwH83NuMcW/BwylTDBox7NJE3DY6u/Tq9cnPn3D+qzkwPfiyEb4jrVhG+XmeamI42Xsmw8Q==
X-Received: by 2002:a05:6a00:398a:b0:6e6:b155:b9a3 with SMTP id fi10-20020a056a00398a00b006e6b155b9a3mr14286931pfb.11.1710835273174;
        Tue, 19 Mar 2024 01:01:13 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:01:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 24/35] powerpc: Avoid using larx/stcx. in spinlocks when only one CPU is running
Date: Tue, 19 Mar 2024 17:59:15 +1000
Message-ID: <20240319075926.2422707-25-npiggin@gmail.com>
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

The test harness uses spinlocks if they are implemented with larx/stcx.
it can prevent some test scenarios such as testing migration of a
reservation.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/smp.h    |  1 +
 lib/powerpc/smp.c        |  5 +++++
 lib/powerpc/spinlock.c   | 29 +++++++++++++++++++++++++++++
 lib/ppc64/asm/spinlock.h |  7 ++++++-
 powerpc/Makefile.common  |  1 +
 5 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 lib/powerpc/spinlock.c

diff --git a/lib/powerpc/asm/smp.h b/lib/powerpc/asm/smp.h
index 4519e5436..6ef3ae521 100644
--- a/lib/powerpc/asm/smp.h
+++ b/lib/powerpc/asm/smp.h
@@ -15,6 +15,7 @@ struct cpu {
 
 extern int nr_cpus_present;
 extern int nr_cpus_online;
+extern bool multithreaded;
 extern struct cpu cpus[];
 
 register struct cpu *__current_cpu asm("r13");
diff --git a/lib/powerpc/smp.c b/lib/powerpc/smp.c
index a3bf85d44..f3b2a3faf 100644
--- a/lib/powerpc/smp.c
+++ b/lib/powerpc/smp.c
@@ -276,6 +276,8 @@ static void start_each_secondary(int fdtnode, u64 regval __unused, void *info)
 	start_core(fdtnode, datap->entry);
 }
 
+bool multithreaded = false;
+
 /*
  * Start all stopped cpus on the guest at entry with register 3 set to r3
  * We expect that we come in with only one thread currently started
@@ -290,6 +292,7 @@ bool start_all_cpus(secondary_entry_fn entry)
 
 	assert(nr_cpus_online == 1);
 	assert(nr_started == 1);
+	multithreaded = true;
 	ret = dt_for_each_cpu_node(start_each_secondary, &data);
 	assert(ret == 0);
 	assert(nr_started == nr_cpus_present);
@@ -308,8 +311,10 @@ bool start_all_cpus(secondary_entry_fn entry)
 
 void stop_all_cpus(void)
 {
+	assert(multithreaded);
 	while (nr_cpus_online > 1)
 		cpu_relax();
 	mb();
 	nr_started = 1;
+	multithreaded = false;
 }
diff --git a/lib/powerpc/spinlock.c b/lib/powerpc/spinlock.c
new file mode 100644
index 000000000..623a1f2c1
--- /dev/null
+++ b/lib/powerpc/spinlock.c
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: LGPL-2.0 */
+#include <asm/spinlock.h>
+#include <asm/smp.h>
+
+/*
+ * Skip the atomic when single-threaded, which helps avoid larx/stcx. in
+ * the harness when testing tricky larx/stcx. sequences (e.g., migration
+ * vs reservation).
+ */
+void spin_lock(struct spinlock *lock)
+{
+	if (!multithreaded) {
+		assert(lock->v == 0);
+		lock->v = 1;
+	} else {
+		while (__sync_lock_test_and_set(&lock->v, 1))
+			;
+	}
+}
+
+void spin_unlock(struct spinlock *lock)
+{
+	assert(lock->v == 1);
+	if (!multithreaded) {
+		lock->v = 0;
+	} else {
+		__sync_lock_release(&lock->v);
+	}
+}
diff --git a/lib/ppc64/asm/spinlock.h b/lib/ppc64/asm/spinlock.h
index f59eed191..b952386da 100644
--- a/lib/ppc64/asm/spinlock.h
+++ b/lib/ppc64/asm/spinlock.h
@@ -1,6 +1,11 @@
 #ifndef _ASMPPC64_SPINLOCK_H_
 #define _ASMPPC64_SPINLOCK_H_
 
-#include <asm-generic/spinlock.h>
+struct spinlock {
+	unsigned int v;
+};
+
+void spin_lock(struct spinlock *lock);
+void spin_unlock(struct spinlock *lock);
 
 #endif /* _ASMPPC64_SPINLOCK_H_ */
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index 744dfc1f7..02af54b83 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -48,6 +48,7 @@ cflatobjs += lib/powerpc/rtas.o
 cflatobjs += lib/powerpc/processor.o
 cflatobjs += lib/powerpc/handlers.o
 cflatobjs += lib/powerpc/smp.o
+cflatobjs += lib/powerpc/spinlock.o
 
 OBJDIRS += lib/powerpc
 
-- 
2.42.0

