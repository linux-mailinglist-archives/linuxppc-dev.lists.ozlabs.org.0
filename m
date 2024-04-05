Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AE4899894
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:53:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YyU4eZK3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sjK3kDyz3wBh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:53:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YyU4eZK3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sLK64Pnz3vcy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:37:29 +1100 (AEDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-36a1140bd21so284915ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306247; x=1712911047; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kzbtoE/UL8zs6u75F6pI7GziWulTjnRNpnOgNK7TAQ=;
        b=YyU4eZK3ZSCsDpqs1Ycz+uYE2dK0W3QeBAu6SDRWKxr3Eo6syyE4oSsjjmv8NsS+Ge
         1CNJlynbiwK+2YKLvKFmkKvyLLNtVPyPMyEP05fPB4I4QNwk5SdOUAEmtk/qXpviuVO7
         yi93ScAB80KXUFpivjfexJzPL9hAOp4HQNEcyZ76Sk1/fX3LJs/g52V54lVWjobil/9W
         cpuRHHUEycMx6Eg+rD0Lin2eHuPcIqFCgEJGW/4BCcz4ln/2DXAOwlndhZUxXqtA20Ba
         TBTJ3aJxaTjfT0ibzanEMFavql6UaIot5ldEdLIUj0QXVZE9G6G9sBZ1juGhOnv9Z+jb
         8QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306247; x=1712911047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kzbtoE/UL8zs6u75F6pI7GziWulTjnRNpnOgNK7TAQ=;
        b=IWButqV2PydGQmrN1g/UcONVoccg1x6tlqTpbTDPPqJrfZYHpuH5xFs+NrYznXhA4E
         kLyrV4PpBpSeHT5hTtGlUU/pqnNGygxbwNckImf4vynSd2Sc9FoA9SdfqKEhsE0JdYUa
         mLPzVQN4LyQ28bCFmY8nOt+p5E+wodtAVAYx/QLjSuFY8DOoT5yziyFjkXXCbt889TUC
         bJ0i1JPJlxoe3vym7x3a0ycoWeRNDvyzckRmi+7Bbj5MLwNFcnvH6717c/wBuXqK7Jwn
         rX629xyj+/LtDXUOUaoGTM3KFfh5HDV3IAIWXx+jWcjgLPkHNyfY32utbcqRE/RKKRtW
         A63g==
X-Forwarded-Encrypted: i=1; AJvYcCUqxhb3jFxOYBzDXwQ76ekYz4n8VtmrtQUo/4uIbzL0PnUkUvwMnhZkWby+kzuF+5Qg/0h4RIXuQwynaDgxaRbPXiHx7KFFuwDPuTXjhA==
X-Gm-Message-State: AOJu0YwpOlDozy5x9BL5OFWgTWGdDBjAz6IIRxXs3sM4YaVwCSGa9VQc
	J/mmyfTZz4R+skguu2tVweEBi2if+gwDbXSRQ4zzeclAJZ/+29XV
X-Google-Smtp-Source: AGHT+IECFV+iDS9TmZXS9MXN+sZFqxHCUkctVKUIwJDWuE2r5FFJ2939TTxhNHmcVwHCQURkor6zGA==
X-Received: by 2002:a05:6e02:156f:b0:366:a7e1:7677 with SMTP id k15-20020a056e02156f00b00366a7e17677mr888211ilu.3.1712306247486;
        Fri, 05 Apr 2024 01:37:27 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:37:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 24/35] powerpc: Avoid using larx/stcx. in spinlocks when only one CPU is running
Date: Fri,  5 Apr 2024 18:35:25 +1000
Message-ID: <20240405083539.374995-25-npiggin@gmail.com>
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
2.43.0

