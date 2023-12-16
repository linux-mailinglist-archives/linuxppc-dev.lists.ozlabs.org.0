Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F55B8159B9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 15:06:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RGFK7bGw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ssntk0T2nz3vyq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 01:06:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RGFK7bGw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnQZ1xptz3cXq
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:45:10 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-35d72bc5cf2so7670975ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734308; x=1703339108; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icClGOC13RpCndO6jcPh9sEaLH/R88jTwAqzXHDwgMY=;
        b=RGFK7bGwZ6eevFLtujlpsmxbVCCRIivumHsHaa6d4mjXQ9M/S9BMHd/2Npf66UKBJo
         Ekbl6PqqAkwkiQtcwI3Hz9SvLvNSwUj7AbBdN5aJUVMByxV1JkfANmxEGi/BAaUK7faO
         qQe/3x6NW6mpNwjb4OpWX50Nrw14dvcvzidurGFsMTBbV8czBwqyiSzH6B8A/4JJ6kGz
         FB01z8Fkoak28K8aYNulYvF5HJpGf1DhUZNU8ENVKUzO8qkD+1jk9iK2mraOpMorkfCf
         t5TLw2qchCoaM28Klqx+fkorOQmU1+zUurj1XPsULh+ES88Ygn2I0TahAoUsUZpwIpy8
         deMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734308; x=1703339108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icClGOC13RpCndO6jcPh9sEaLH/R88jTwAqzXHDwgMY=;
        b=wzKCs02+bEdsEL8U7egg9GLE7m9VZZmYegAzuZbn5hqAqjxxVYrX0Gva8fZbrfHteB
         RFqC7nm5XBP8gOu9s4tiUlMQ1iq+xVzs/xHYSOx2YekYZNv6e+Qt2Y6Tl+rdScOpPWWW
         cdrmerPJAyfK+Yb6C744mAblv3X1wVEXxURbLX/ONr+CGFK7AonJDJ/VnU2ZeOsUVSjv
         Sd6AhhKJvNWyQM1MKBSzJaJBwR3W02XlH7rIOumM07nBF4GEseahwZoAltkpn/MtCxTb
         V82rWxFQzULq/mOjhhklS+gWCw7vbtdD8zuJxUbUttr+QSJAzD2sXV7HKfrOfenKwtLR
         YsXw==
X-Gm-Message-State: AOJu0YyAtIRrCMjIiTL9do57DnhvJ8vO6B+SytMMqTyCpnari3pzpa/L
	zSAs0eL0Eq5K7bG5a6mYffQ=
X-Google-Smtp-Source: AGHT+IGwXFyNUnZi+4S3PALNqxJ2TQNYMTTxNL950MVsIpVv59psCBNIdlrTYt/cp3QyHiZHmdxWFQ==
X-Received: by 2002:a05:6e02:1bad:b0:35d:62f2:1f45 with SMTP id n13-20020a056e021bad00b0035d62f21f45mr20860836ili.20.1702734308334;
        Sat, 16 Dec 2023 05:45:08 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:45:08 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 27/29] powerpc: Avoid using larx/stcx. in spinlocks when only one CPU is running
Date: Sat, 16 Dec 2023 23:42:54 +1000
Message-ID: <20231216134257.1743345-28-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216134257.1743345-1-npiggin@gmail.com>
References: <20231216134257.1743345-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The test harness uses spinlocks if they are implemented with larx/stcx.
it can prevent some test scenarios such as testing migration of a
reservation.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/smp.h    |  1 +
 lib/powerpc/smp.c        |  6 ++++++
 lib/powerpc/spinlock.c   | 28 ++++++++++++++++++++++++++++
 lib/ppc64/asm/spinlock.h |  7 ++++++-
 powerpc/Makefile.common  |  1 +
 5 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 lib/powerpc/spinlock.c

diff --git a/lib/powerpc/asm/smp.h b/lib/powerpc/asm/smp.h
index 163bbeec..e2c03295 100644
--- a/lib/powerpc/asm/smp.h
+++ b/lib/powerpc/asm/smp.h
@@ -19,5 +19,6 @@ void local_ipi_disable(void);
 void send_ipi(int cpu_id);
 
 extern int nr_cpus_online;
+extern bool multithreaded;
 
 #endif /* _ASMPOWERPC_SMP_H_ */
diff --git a/lib/powerpc/smp.c b/lib/powerpc/smp.c
index 96e3219a..b473ba41 100644
--- a/lib/powerpc/smp.c
+++ b/lib/powerpc/smp.c
@@ -280,6 +280,8 @@ static void start_each_secondary(int fdtnode, u64 regval __unused, void *info)
 	datap->nr_started += start_core(fdtnode, datap->entry);
 }
 
+bool multithreaded = false;
+
 /*
  * Start all stopped cpus on the guest at entry with register 3 set to r3
  * We expect that we come in with only one thread currently started
@@ -293,8 +295,10 @@ bool start_all_cpus(secondary_entry_fn entry)
 
 	memset(start_secondary_cpus, 0xff, sizeof(start_secondary_cpus));
 
+	assert(!multithreaded);
 	assert(nr_cpus_online == 1);
 
+	multithreaded = true;
 	nr_started = 0;
 	nr_cpus_present = 0;
 	ret = dt_for_each_cpu_node(start_each_secondary, &data);
@@ -305,6 +309,8 @@ bool start_all_cpus(secondary_entry_fn entry)
 
 void stop_all_cpus(void)
 {
+	assert(multithreaded);
 	while (nr_cpus_online > 1)
 		cpu_relax();
+	multithreaded = false;
 }
diff --git a/lib/powerpc/spinlock.c b/lib/powerpc/spinlock.c
new file mode 100644
index 00000000..238549f1
--- /dev/null
+++ b/lib/powerpc/spinlock.c
@@ -0,0 +1,28 @@
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
index f59eed19..b952386d 100644
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
index f9dd937a..caa807f2 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -47,6 +47,7 @@ cflatobjs += lib/powerpc/rtas.o
 cflatobjs += lib/powerpc/processor.o
 cflatobjs += lib/powerpc/handlers.o
 cflatobjs += lib/powerpc/smp.o
+cflatobjs += lib/powerpc/spinlock.o
 
 OBJDIRS += lib/powerpc
 
-- 
2.42.0

