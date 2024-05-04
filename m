Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE9D8BBB7A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:43:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dJUdjfs3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnQf723Nz3gMt
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:43:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dJUdjfs3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn7K5ynFz30VN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:30:05 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6f44390e328so524623b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825804; x=1715430604; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1J1rerHtz2/IUl9CIlFdWIoy05A/oeTKAK2mDsoOQ0I=;
        b=dJUdjfs3aKFAMLpCcvgMWSKe77IcjUiLHpwU6QhB+A1D4wW4KT3zYFiLdCeYIFKOMa
         c3ol2fTk7/XgMy81OloM2gtNEdOBmR7DXGJTUgYFy192QGFPy+sPiSZTmOwLKxhIkODC
         asjqO0+Js7uK8KiSaiWf4Xiin1JKOmchaZCP+tag8HzTFXITQTpqa85oazECxnEfkwGI
         3S9aTjFKEil4l1sQ7ni98YFYM9cXoSgV67B3eRInSuIieSKUr37Wgp80YCH5Gc1/OHoK
         9wBFq5rPyxk7adcQqgkMJVaYDvv/Y1pHWi3gvkMl69jKvfOSCjMAEBqTOAQNg/cyHXW7
         QgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825804; x=1715430604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1J1rerHtz2/IUl9CIlFdWIoy05A/oeTKAK2mDsoOQ0I=;
        b=PP6of3ygYcNigWWOXZFZ+OwXo6ogMikCEQxHaKIfQ7F6SmRtANIJfjCBJnPpysjcXk
         RpihLvv/OuUjnETz7jfL2CgplsDtBVDnrGtPLL33UC8Zb1gq8OrmXAn8w0gOjJecP4to
         NU62irpqlWCPKk0LswmY2fSXEkmfoNBLW+x0UOybBxo5CDfaIhdyJiUlsBW/o38CM3Af
         aTziN3VzzIMDt6nQCzv8TI1MfKIR+LXVw04r98spuoLDIcV26akfka1V6DxXq5E9FUGf
         SxAWAgXZN8yDP4DikKmvGagQ/RZ4ZXrmVfATNFnDNUCa+cWN0cUdaCJaUlkp6kmTVSh8
         YAcA==
X-Forwarded-Encrypted: i=1; AJvYcCXJMmGwOWxHfOGMx1tVjD+UZuUir0FQjUQ1ONx22iks+VsvXIH1rEZZ+kH2UMcNa4JvH9lQ41pFluhix/QgUGR7lPS4Ksawv/OIGv0sgA==
X-Gm-Message-State: AOJu0YyJz/+Ta94bD9Wja1oAgSaayV7tq3X0I4FU/zt2XkJZidZiBu9f
	q2FAjgkOxOYyWQrL7Wp+HiWD4q8pRQDVAAUqxk9mh6bKfLwB+MAhgm8bIw==
X-Google-Smtp-Source: AGHT+IE705BbaLHg0dkpi38AsyXDqDVglxsJuuZBWB5uM1M5vnAAvSQE55y3EV0uFEDzYsyhbYKW+A==
X-Received: by 2002:a05:6a00:1799:b0:6ed:4aaa:3cbf with SMTP id s25-20020a056a00179900b006ed4aaa3cbfmr6768331pfg.3.1714825804126;
        Sat, 04 May 2024 05:30:04 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:30:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 19/31] powerpc: Avoid using larx/stcx. in spinlocks when only one CPU is running
Date: Sat,  4 May 2024 22:28:25 +1000
Message-ID: <20240504122841.1177683-20-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
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
index c45988bfa..66188b9dd 100644
--- a/lib/powerpc/asm/smp.h
+++ b/lib/powerpc/asm/smp.h
@@ -15,6 +15,7 @@ struct cpu {
 
 extern int nr_cpus_present;
 extern int nr_cpus_online;
+extern bool multithreaded;
 extern struct cpu cpus[];
 
 register struct cpu *__current_cpu asm("r13");
diff --git a/lib/powerpc/smp.c b/lib/powerpc/smp.c
index 27b169841..73c0ef214 100644
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
@@ -361,10 +364,12 @@ static void wait_each_secondary(int fdtnode, u64 regval __unused, void *info)
 
 void stop_all_cpus(void)
 {
+	assert(multithreaded);
 	while (nr_cpus_online > 1)
 		cpu_relax();
 
 	dt_for_each_cpu_node(wait_each_secondary, NULL);
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
index b98f71c2f..1ee9c25d6 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -49,6 +49,7 @@ cflatobjs += lib/powerpc/rtas.o
 cflatobjs += lib/powerpc/processor.o
 cflatobjs += lib/powerpc/handlers.o
 cflatobjs += lib/powerpc/smp.o
+cflatobjs += lib/powerpc/spinlock.o
 
 OBJDIRS += lib/powerpc
 
-- 
2.43.0

