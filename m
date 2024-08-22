Return-Path: <linuxppc-dev+bounces-301-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B197395AE7A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:13:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDvP0VPLz2yN3;
	Thu, 22 Aug 2024 17:13:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDvN5Qctz2xDM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:13:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqDv86QrKz9sSN;
	Thu, 22 Aug 2024 09:13:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdCDskQ2p5WL; Thu, 22 Aug 2024 09:13:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqDv85QXJz9sSH;
	Thu, 22 Aug 2024 09:13:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A7ED78B77E;
	Thu, 22 Aug 2024 09:13:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ouP_vD4wp4xB; Thu, 22 Aug 2024 09:13:24 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (PO16920.IDSI0.si.c-s.fr [192.168.232.181])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 944968B763;
	Thu, 22 Aug 2024 09:13:23 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 02/17] vdso: Clean header inclusion in getrandom
Date: Thu, 22 Aug 2024 09:13:10 +0200
Message-ID: <2a081f1fff5e40f496153f8e0162fc7ec5adab2e.1724309198.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1724309198.git.christophe.leroy@csgroup.eu>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724310793; l=3539; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=t1ii3oP+DWJaA3RAVE9qv0Jl6VLeHCEWNNWvjxnIH5Q=; b=ANTjekVtAyR0hDVIxrc3nu2T9PxOuN9Ua7Gf4v/suoPDxg/04vzQWBh3+1ksJJaTwPqkpldnx KcQYfaLEwU7BvUlhMxVrCjpvlWYlePU5fPx0kouXgxCqKaovwoxnEp7
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Building a VDSO32 on a 64 bits kernel is problematic when some
system headers are included. See commit 8c59ab839f52 ("lib/vdso:
Enable common headers") for more details.

Minimise the amount of headers by moving needed items into
dedicated common headers.

For PAGE_SIZE and PAGE_MASK, redefine them from CONFIG_PAGE_SHIFT
in the same way as commit cffaefd15a8f ("vdso: Use CONFIG_PAGE_SHIFT
in vdso/datapage.h")

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/x86/include/asm/pvclock.h |  1 +
 include/vdso/helpers.h         |  1 +
 lib/vdso/getrandom.c           | 15 ++++++++-------
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/pvclock.h b/arch/x86/include/asm/pvclock.h
index 0c92db84469d..6e4f8fae3ce9 100644
--- a/arch/x86/include/asm/pvclock.h
+++ b/arch/x86/include/asm/pvclock.h
@@ -5,6 +5,7 @@
 #include <asm/clocksource.h>
 #include <asm/pvclock-abi.h>
 
+struct timespec64;
 /* some helper functions for xen and kvm pv clock sources */
 u64 pvclock_clocksource_read(struct pvclock_vcpu_time_info *src);
 u64 pvclock_clocksource_read_nowd(struct pvclock_vcpu_time_info *src);
diff --git a/include/vdso/helpers.h b/include/vdso/helpers.h
index 73501149439d..3ddb03bb05cb 100644
--- a/include/vdso/helpers.h
+++ b/include/vdso/helpers.h
@@ -4,6 +4,7 @@
 
 #ifndef __ASSEMBLY__
 
+#include <asm/barrier.h>
 #include <vdso/datapage.h>
 
 static __always_inline u32 vdso_read_begin(const struct vdso_data *vd)
diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index b230f0b10832..cab153c5f9be 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -3,15 +3,13 @@
  * Copyright (C) 2022-2024 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
 
-#include <linux/cache.h>
-#include <linux/kernel.h>
-#include <linux/time64.h>
+#include <linux/minmax.h>
 #include <vdso/datapage.h>
 #include <vdso/getrandom.h>
+#include <vdso/unaligned.h>
 #include <asm/vdso/getrandom.h>
-#include <asm/vdso/vsyscall.h>
-#include <asm/unaligned.h>
 #include <uapi/linux/mman.h>
+#include <uapi/linux/random.h>
 
 #define MEMCPY_AND_ZERO_SRC(type, dst, src, len) do {				\
 	while (len >= sizeof(type)) {						\
@@ -23,6 +21,9 @@
 	}									\
 } while (0)
 
+#define _PAGE_SIZE (1UL << CONFIG_PAGE_SHIFT)
+#define _PAGE_MASK (~(_PAGE_SIZE - 1))
+
 static void memcpy_and_zero_src(void *dst, void *src, size_t len)
 {
 	if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
@@ -64,7 +65,7 @@ static __always_inline ssize_t
 __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_t len,
 		       unsigned int flags, void *opaque_state, size_t opaque_len)
 {
-	ssize_t ret = min_t(size_t, INT_MAX & PAGE_MASK /* = MAX_RW_COUNT */, len);
+	ssize_t ret = min_t(size_t, INT_MAX & _PAGE_MASK /* = MAX_RW_COUNT */, len);
 	struct vgetrandom_state *state = opaque_state;
 	size_t batch_len, nblocks, orig_len = len;
 	bool in_use, have_retried = false;
@@ -82,7 +83,7 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
 	}
 
 	/* The state must not straddle a page, since pages can be zeroed at any time. */
-	if (unlikely(((unsigned long)opaque_state & ~PAGE_MASK) + sizeof(*state) > PAGE_SIZE))
+	if (unlikely(((unsigned long)opaque_state & ~_PAGE_MASK) + sizeof(*state) > _PAGE_SIZE))
 		return -EFAULT;
 
 	/* If the caller passes the wrong size, which might happen due to CRIU, fallback. */
-- 
2.44.0


