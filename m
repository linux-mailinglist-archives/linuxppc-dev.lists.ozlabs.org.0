Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636318670E6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:28:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y2pQAPoa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjxdt0xk1z3vqY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:28:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y2pQAPoa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxKf43wNz3dH8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:13:58 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e53f76898fso3311b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942437; x=1709547237; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkVk2G/rqE98/Gll6ggbBTcIfup8NN9Tv/n5dXqJucI=;
        b=Y2pQAPoaotNEFW2Vgx7tBzwR1MuSUmA9HVaF7SXqGAN2f0m9Zojt/AVUFyBFOuobDc
         ETmyEZCE0l5/maGQkcVgZHXtg6XGom3Rc40YYNqfD4kqyvw3BUvbT+/YcPy8o1ffgD2Y
         gW8RReSgJDvpnh3HqLNYyXkjUbxGLtJtatkXlwrH1wA+jtBOx7RZ+i4tJveldhgcs9ht
         zLlMsEZ0VvQd94HHUmfDFPUO2zpX/XvfgiH6B7h0vfBHOM2Zlt4c0oO6mInvuD2aTe3a
         du0smsovUSeJJYaDHT5b7qq6PJ6YS7FhFOWoNdD7LFroqEWHT4eMFU40nOe8/Eca+en/
         azsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942437; x=1709547237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkVk2G/rqE98/Gll6ggbBTcIfup8NN9Tv/n5dXqJucI=;
        b=qa0gmicrWwllZmLz5H1q6cJnzFJQ0ki1HISyCM+lzCxGxhOD81n1sv5QKyGf1AlNfn
         f8zcNcU58YH+4ReS+Zr9Iwuz2IlJvJz0hKppL+8HcPlUHBvoDEsK3jeoZaB7Azo7zCPg
         npY05UnNoMPXDKY2AOf6XMBW+HYTn6ZG9B59yqxGZ7KI1JYrDEhXKbVjSWaAqgIO4rlr
         pGhMnGhMLYpDY4ABItNCSCFTcGLOfFh83yzcqRoHDEeT876Q0+r09rqwIG0MWHEqAWyf
         INuGLtm5+kWlaSuY17bw2nwrJUKm4kk4MHJwyZ+e9V1/tM5g/WsoWxe14AidNRv9X+L6
         ueYA==
X-Forwarded-Encrypted: i=1; AJvYcCX3zdMF6kbgEQRUda+bNzLixRHmfT/7P/MKwiR23Qs7Lvh9JIECX9B8s0QqTqWf1Gf8ONXo5GCHsODOc4o0mg4PawS/ohHVVyvKTRhAvg==
X-Gm-Message-State: AOJu0YxFU28FfVrnDjqVwTMP2pyRigvV6RjEdl8jtWxSBRK+kmc+3U1J
	Khidg5Vsz+YNv5StOY9aJZHuEZe4H81rlIO3Yfc6k9WVDk/NeJrGjM/P7zob
X-Google-Smtp-Source: AGHT+IFH9gVhSndX7xO/ej/POQdOAvFUZA3vacssw6GqCBJBdXMnMxrgK7MTernWExIL9aE2n9kaNQ==
X-Received: by 2002:a05:6a00:2da2:b0:6e4:c5a1:e41d with SMTP id fb34-20020a056a002da200b006e4c5a1e41dmr6797568pfb.29.1708942436655;
        Mon, 26 Feb 2024 02:13:56 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:13:56 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 20/32] powerpc: Avoid using larx/stcx. in spinlocks when only one CPU is running
Date: Mon, 26 Feb 2024 20:12:06 +1000
Message-ID: <20240226101218.1472843-21-npiggin@gmail.com>
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

The test harness uses spinlocks if they are implemented with larx/stcx.
it can prevent some test scenarios such as testing migration of a
reservation.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/smp.h    |  1 +
 lib/powerpc/smp.c        |  5 +++++
 lib/powerpc/spinlock.c   | 28 ++++++++++++++++++++++++++++
 lib/ppc64/asm/spinlock.h |  7 ++++++-
 powerpc/Makefile.common  |  1 +
 5 files changed, 41 insertions(+), 1 deletion(-)
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
index 000000000..238549f12
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

