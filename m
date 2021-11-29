Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A685461D43
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 19:01:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2tSc0vBGz3ddD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 05:01:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=arWwcpj6;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5xRw1Cp/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=arWwcpj6; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=5xRw1Cp/; 
 dkim-atps=neutral
X-Greylist: delayed 711 seconds by postgrey-1.36 at boromir;
 Tue, 30 Nov 2021 05:00:27 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2tRv2rCwz2yPD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 05:00:27 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638208111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tbl3+zAOEmpP6ZGCt/BD/PG2cZ3xnDr+Tb2+yq81oZo=;
 b=arWwcpj6Q/D6pvkRJiP142R5s1arQMXkHQxn/zOjEbHQImbzvbopydkHkJVlZU1LyU8wcj
 lfTHFIczOSU8/AxvkV7RlMv59UNEsq07wTaCjGR0hhzFxAJqBfsG+RQLUCnFd9mRROoZHy
 oM36Hu/i3jaiMslNkMd8KSiGnZnfD6E9OtVayofH2faDlnYttgS8ROCBpOUjRvircInDcE
 D7QYx/vTcwEIm1WQMEwbO3ryNqgSOcogR0awZvPqk+/4Ssex92D191dUHP56nk8LNkAmH/
 ofoyFF9VV4Dvtt12/JcPQ5Oupu94FrnmDjslyjx9Wa1m2kjHBmo475RB/hQL+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638208111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tbl3+zAOEmpP6ZGCt/BD/PG2cZ3xnDr+Tb2+yq81oZo=;
 b=5xRw1Cp/h/haoQhJAxftFnjCbEc9UKH/scHgQVSdL5qC+aJRF+i0MC2mtjiyiG1rOEKaPZ
 igMovB8jTE5WtwCQ==
To: linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] locking: Allow to include asm/spinlock_types.h from
 linux/spinlock_types_raw.h
Date: Mon, 29 Nov 2021 18:46:54 +0100
Message-Id: <20211129174654.668506-12-bigeasy@linutronix.de>
In-Reply-To: <20211129174654.668506-1-bigeasy@linutronix.de>
References: <20211129174654.668506-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, linux-hexagon@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Brian Cain <bcain@codeaurora.org>, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Mel Gorman <mgorman@suse.de>, Waiman Long <longman@redhat.com>,
 Matt Turner <mattst88@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Boqun Feng <boqun.feng@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Chris Zankel <chris@zankel.net>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-alpha@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The printk header file includes ratelimit_types.h for its __ratelimit()
based usage. It is required for the static initializer used in
printk_ratelimited(). It uses a raw_spinlock_t and includes the
spinlock_types.h.

PREEMPT_RT substitutes spinlock_t with a rtmutex based implementation and so
its spinlock_t implmentation (provided by spinlock_rt.h) includes rtmutex.h=
 and
atomic.h which leads to recursive includes where defines are missing.

By including only the raw_spinlock_t defines it avoids the atomic.h
related includes at this stage.

An example on powerpc:

|  CALL    scripts/atomic/check-atomics.sh
|In file included from include/linux/bug.h:5,
|                 from include/linux/page-flags.h:10,
|                 from kernel/bounds.c:10:
|arch/powerpc/include/asm/page_32.h: In function =E2=80=98clear_page=E2=80=
=99:
|arch/powerpc/include/asm/bug.h:87:4: error: implicit declaration of functi=
on =E2=80=98__WARN=E2=80=99 [-Werror=3Dimplicit-function-declaration]
|   87 |    __WARN();    \
|      |    ^~~~~~
|arch/powerpc/include/asm/page_32.h:48:2: note: in expansion of macro =E2=
=80=98WARN_ON=E2=80=99
|   48 |  WARN_ON((unsigned long)addr & (L1_CACHE_BYTES - 1));
|      |  ^~~~~~~
|arch/powerpc/include/asm/bug.h:58:17: error: invalid application of =E2=80=
=98sizeof=E2=80=99 to incomplete type =E2=80=98struct bug_entry=E2=80=99
|   58 |     "i" (sizeof(struct bug_entry)), \
|      |                 ^~~~~~
|arch/powerpc/include/asm/bug.h:89:3: note: in expansion of macro =E2=80=98=
BUG_ENTRY=E2=80=99
|   89 |   BUG_ENTRY(PPC_TLNEI " %4, 0",   \
|      |   ^~~~~~~~~
|arch/powerpc/include/asm/page_32.h:48:2: note: in expansion of macro =E2=
=80=98WARN_ON=E2=80=99
|   48 |  WARN_ON((unsigned long)addr & (L1_CACHE_BYTES - 1));
|      |  ^~~~~~~
|In file included from arch/powerpc/include/asm/ptrace.h:298,
|                 from arch/powerpc/include/asm/hw_irq.h:12,
|                 from arch/powerpc/include/asm/irqflags.h:12,
|                 from include/linux/irqflags.h:16,
|                 from include/asm-generic/cmpxchg-local.h:6,
|                 from arch/powerpc/include/asm/cmpxchg.h:526,
|                 from arch/powerpc/include/asm/atomic.h:11,
|                 from include/linux/atomic.h:7,
|                 from include/linux/rwbase_rt.h:6,
|                 from include/linux/rwlock_types.h:55,
|                 from include/linux/spinlock_types.h:74,
|                 from include/linux/ratelimit_types.h:7,
|                 from include/linux/printk.h:10,
|                 from include/asm-generic/bug.h:22,
|                 from arch/powerpc/include/asm/bug.h:109,
|                 from include/linux/bug.h:5,
|                 from include/linux/page-flags.h:10,
|                 from kernel/bounds.c:10:
|include/linux/thread_info.h: In function =E2=80=98copy_overflow=E2=80=99:
|include/linux/thread_info.h:210:2: error: implicit declaration of function=
 =E2=80=98WARN=E2=80=99 [-Werror=3Dimplicit-function-declaration]
|  210 |  WARN(1, "Buffer overflow detected (%d < %lu)!\n", size, count);
|      |  ^~~~

The WARN / BUG include pulls in printk.h and then ptrace.h expects WARN
(from bug.h) which is not yet complete. Even hw_irq.h has WARN_ON()
statements.

On POWERPC64 there are missing atomic64 defines while building 32bit
VDSO:
|  VDSO32C arch/powerpc/kernel/vdso32/vgettimeofday.o
|In file included from include/linux/atomic.h:80,
|                 from include/linux/rwbase_rt.h:6,
|                 from include/linux/rwlock_types.h:55,
|                 from include/linux/spinlock_types.h:74,
|                 from include/linux/ratelimit_types.h:7,
|                 from include/linux/printk.h:10,
|                 from include/linux/kernel.h:19,
|                 from arch/powerpc/include/asm/page.h:11,
|                 from arch/powerpc/include/asm/vdso/gettimeofday.h:5,
|                 from include/vdso/datapage.h:137,
|                 from lib/vdso/gettimeofday.c:5,
|                 from <command-line>:
|include/linux/atomic-arch-fallback.h: In function =E2=80=98arch_atomic64_i=
nc=E2=80=99:
|include/linux/atomic-arch-fallback.h:1447:2: error: implicit declaration o=
f function =E2=80=98arch_atomic64_add=E2=80=99; did you mean =E2=80=98arch_=
atomic_add=E2=80=99? [-Werror=3Dimpl
|icit-function-declaration]
| 1447 |  arch_atomic64_add(1, v);
|      |  ^~~~~~~~~~~~~~~~~
|      |  arch_atomic_add

The generic fallback is not included, atomics itself are not used. If
kernel.h does not include printk.h then it comes later from the bug.h
include.

Allow asm/spinlock_types.h to be included from
linux/spinlock_types_raw.h.

Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Brian Cain <bcain@codeaurora.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Chris Zankel <chris@zankel.net>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Guo Ren <guoren@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rich Felker <dalias@libc.org>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-alpha@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: linux-hexagon@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: linux-xtensa@linux-xtensa.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/alpha/include/asm/spinlock_types.h          | 2 +-
 arch/arm/include/asm/spinlock_types.h            | 2 +-
 arch/arm64/include/asm/spinlock_types.h          | 2 +-
 arch/csky/include/asm/spinlock_types.h           | 2 +-
 arch/hexagon/include/asm/spinlock_types.h        | 2 +-
 arch/ia64/include/asm/spinlock_types.h           | 2 +-
 arch/powerpc/include/asm/simple_spinlock_types.h | 2 +-
 arch/powerpc/include/asm/spinlock_types.h        | 2 +-
 arch/riscv/include/asm/spinlock_types.h          | 2 +-
 arch/s390/include/asm/spinlock_types.h           | 2 +-
 arch/sh/include/asm/spinlock_types.h             | 2 +-
 arch/xtensa/include/asm/spinlock_types.h         | 2 +-
 include/linux/ratelimit_types.h                  | 2 +-
 include/linux/spinlock_types_up.h                | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/alpha/include/asm/spinlock_types.h b/arch/alpha/include/a=
sm/spinlock_types.h
index 1d5716bc060be..2526fd3be5fd7 100644
--- a/arch/alpha/include/asm/spinlock_types.h
+++ b/arch/alpha/include/asm/spinlock_types.h
@@ -2,7 +2,7 @@
 #ifndef _ALPHA_SPINLOCK_TYPES_H
 #define _ALPHA_SPINLOCK_TYPES_H
=20
-#ifndef __LINUX_SPINLOCK_TYPES_H
+#ifndef __LINUX_SPINLOCK_TYPES_RAW_H
 # error "please don't include this file directly"
 #endif
=20
diff --git a/arch/arm/include/asm/spinlock_types.h b/arch/arm/include/asm/s=
pinlock_types.h
index 5976958647fe1..0c14b36ef1013 100644
--- a/arch/arm/include/asm/spinlock_types.h
+++ b/arch/arm/include/asm/spinlock_types.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_SPINLOCK_TYPES_H
 #define __ASM_SPINLOCK_TYPES_H
=20
-#ifndef __LINUX_SPINLOCK_TYPES_H
+#ifndef __LINUX_SPINLOCK_TYPES_RAW_H
 # error "please don't include this file directly"
 #endif
=20
diff --git a/arch/arm64/include/asm/spinlock_types.h b/arch/arm64/include/a=
sm/spinlock_types.h
index 18782f0c47212..11ab1c0776977 100644
--- a/arch/arm64/include/asm/spinlock_types.h
+++ b/arch/arm64/include/asm/spinlock_types.h
@@ -5,7 +5,7 @@
 #ifndef __ASM_SPINLOCK_TYPES_H
 #define __ASM_SPINLOCK_TYPES_H
=20
-#if !defined(__LINUX_SPINLOCK_TYPES_H) && !defined(__ASM_SPINLOCK_H)
+#if !defined(__LINUX_SPINLOCK_TYPES_RAW_H) && !defined(__ASM_SPINLOCK_H)
 # error "please don't include this file directly"
 #endif
=20
diff --git a/arch/csky/include/asm/spinlock_types.h b/arch/csky/include/asm=
/spinlock_types.h
index 8ff0f6ff3a006..db87a12c3827d 100644
--- a/arch/csky/include/asm/spinlock_types.h
+++ b/arch/csky/include/asm/spinlock_types.h
@@ -3,7 +3,7 @@
 #ifndef __ASM_CSKY_SPINLOCK_TYPES_H
 #define __ASM_CSKY_SPINLOCK_TYPES_H
=20
-#ifndef __LINUX_SPINLOCK_TYPES_H
+#ifndef __LINUX_SPINLOCK_TYPES_RAW_H
 # error "please don't include this file directly"
 #endif
=20
diff --git a/arch/hexagon/include/asm/spinlock_types.h b/arch/hexagon/inclu=
de/asm/spinlock_types.h
index 19d233497ba52..d5f66495b670f 100644
--- a/arch/hexagon/include/asm/spinlock_types.h
+++ b/arch/hexagon/include/asm/spinlock_types.h
@@ -8,7 +8,7 @@
 #ifndef _ASM_SPINLOCK_TYPES_H
 #define _ASM_SPINLOCK_TYPES_H
=20
-#ifndef __LINUX_SPINLOCK_TYPES_H
+#ifndef __LINUX_SPINLOCK_TYPES_RAW_H
 # error "please don't include this file directly"
 #endif
=20
diff --git a/arch/ia64/include/asm/spinlock_types.h b/arch/ia64/include/asm=
/spinlock_types.h
index 6e345fefcdcab..14b8a161c1652 100644
--- a/arch/ia64/include/asm/spinlock_types.h
+++ b/arch/ia64/include/asm/spinlock_types.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_IA64_SPINLOCK_TYPES_H
 #define _ASM_IA64_SPINLOCK_TYPES_H
=20
-#ifndef __LINUX_SPINLOCK_TYPES_H
+#ifndef __LINUX_SPINLOCK_TYPES_RAW_H
 # error "please don't include this file directly"
 #endif
=20
diff --git a/arch/powerpc/include/asm/simple_spinlock_types.h b/arch/powerp=
c/include/asm/simple_spinlock_types.h
index 0f3cdd8faa959..08243338069d2 100644
--- a/arch/powerpc/include/asm/simple_spinlock_types.h
+++ b/arch/powerpc/include/asm/simple_spinlock_types.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_POWERPC_SIMPLE_SPINLOCK_TYPES_H
 #define _ASM_POWERPC_SIMPLE_SPINLOCK_TYPES_H
=20
-#ifndef __LINUX_SPINLOCK_TYPES_H
+#ifndef __LINUX_SPINLOCK_TYPES_RAW_H
 # error "please don't include this file directly"
 #endif
=20
diff --git a/arch/powerpc/include/asm/spinlock_types.h b/arch/powerpc/inclu=
de/asm/spinlock_types.h
index c5d742f18021d..d5f8a74ed2e8c 100644
--- a/arch/powerpc/include/asm/spinlock_types.h
+++ b/arch/powerpc/include/asm/spinlock_types.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_POWERPC_SPINLOCK_TYPES_H
 #define _ASM_POWERPC_SPINLOCK_TYPES_H
=20
-#ifndef __LINUX_SPINLOCK_TYPES_H
+#ifndef __LINUX_SPINLOCK_TYPES_RAW_H
 # error "please don't include this file directly"
 #endif
=20
diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/a=
sm/spinlock_types.h
index f398e7638dd63..5a35a49505da2 100644
--- a/arch/riscv/include/asm/spinlock_types.h
+++ b/arch/riscv/include/asm/spinlock_types.h
@@ -6,7 +6,7 @@
 #ifndef _ASM_RISCV_SPINLOCK_TYPES_H
 #define _ASM_RISCV_SPINLOCK_TYPES_H
=20
-#ifndef __LINUX_SPINLOCK_TYPES_H
+#ifndef __LINUX_SPINLOCK_TYPES_RAW_H
 # error "please don't include this file directly"
 #endif
=20
diff --git a/arch/s390/include/asm/spinlock_types.h b/arch/s390/include/asm=
/spinlock_types.h
index a2bbfd7df85fa..b69695e399574 100644
--- a/arch/s390/include/asm/spinlock_types.h
+++ b/arch/s390/include/asm/spinlock_types.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_SPINLOCK_TYPES_H
 #define __ASM_SPINLOCK_TYPES_H
=20
-#ifndef __LINUX_SPINLOCK_TYPES_H
+#ifndef __LINUX_SPINLOCK_TYPES_RAW_H
 # error "please don't include this file directly"
 #endif
=20
diff --git a/arch/sh/include/asm/spinlock_types.h b/arch/sh/include/asm/spi=
nlock_types.h
index e82369f286a20..907bda4b1619a 100644
--- a/arch/sh/include/asm/spinlock_types.h
+++ b/arch/sh/include/asm/spinlock_types.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_SH_SPINLOCK_TYPES_H
 #define __ASM_SH_SPINLOCK_TYPES_H
=20
-#ifndef __LINUX_SPINLOCK_TYPES_H
+#ifndef __LINUX_SPINLOCK_TYPES_RAW_H
 # error "please don't include this file directly"
 #endif
=20
diff --git a/arch/xtensa/include/asm/spinlock_types.h b/arch/xtensa/include=
/asm/spinlock_types.h
index 64c9389254f13..797aed7df3dd8 100644
--- a/arch/xtensa/include/asm/spinlock_types.h
+++ b/arch/xtensa/include/asm/spinlock_types.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_SPINLOCK_TYPES_H
 #define __ASM_SPINLOCK_TYPES_H
=20
-#if !defined(__LINUX_SPINLOCK_TYPES_H) && !defined(__ASM_SPINLOCK_H)
+#if !defined(__LINUX_SPINLOCK_TYPES_RAW_H) && !defined(__ASM_SPINLOCK_H)
 # error "please don't include this file directly"
 #endif
=20
diff --git a/include/linux/ratelimit_types.h b/include/linux/ratelimit_type=
s.h
index b676aa419eef8..c21c7f8103e2b 100644
--- a/include/linux/ratelimit_types.h
+++ b/include/linux/ratelimit_types.h
@@ -4,7 +4,7 @@
=20
 #include <linux/bits.h>
 #include <linux/param.h>
-#include <linux/spinlock_types.h>
+#include <linux/spinlock_types_raw.h>
=20
 #define DEFAULT_RATELIMIT_INTERVAL	(5 * HZ)
 #define DEFAULT_RATELIMIT_BURST		10
diff --git a/include/linux/spinlock_types_up.h b/include/linux/spinlock_typ=
es_up.h
index c09b6407ae1b3..7f86a2016ac5c 100644
--- a/include/linux/spinlock_types_up.h
+++ b/include/linux/spinlock_types_up.h
@@ -1,7 +1,7 @@
 #ifndef __LINUX_SPINLOCK_TYPES_UP_H
 #define __LINUX_SPINLOCK_TYPES_UP_H
=20
-#ifndef __LINUX_SPINLOCK_TYPES_H
+#ifndef __LINUX_SPINLOCK_TYPES_RAW_H
 # error "please don't include this file directly"
 #endif
=20
--=20
2.34.0

