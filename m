Return-Path: <linuxppc-dev+bounces-302-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4745E95AE7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:13:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDvZ5Ph1z2yPq;
	Thu, 22 Aug 2024 17:13:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDvZ3GLcz2xDM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:13:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqDv96knHz9sSR;
	Thu, 22 Aug 2024 09:13:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZY8vgATUItE0; Thu, 22 Aug 2024 09:13:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqDv95q7Yz9sSH;
	Thu, 22 Aug 2024 09:13:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B59318B77E;
	Thu, 22 Aug 2024 09:13:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XTrqY5A4cZMU; Thu, 22 Aug 2024 09:13:25 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (PO16920.IDSI0.si.c-s.fr [192.168.232.181])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FE3E8B77D;
	Thu, 22 Aug 2024 09:13:24 +0200 (CEST)
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
Subject: [PATCH v2 03/17] vdso: Add __arch_get_k_vdso_rng_data()
Date: Thu, 22 Aug 2024 09:13:11 +0200
Message-ID: <30560b394eaa00fded11fa5bbe5f679c7ffe1714.1724309198.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724310793; l=3615; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=0FkV6ZQv7UmPicI0ISFP55470ytlmKI8lU8exIbKjSc=; b=rfgTJTLJ/AVYzFQ0JlvoCOtXx4fadthoJUp407DtCeMplj9i+sD7+IM9C0ey883rkE5yU2iFJ tg03vMqD5JmCRbRJZ3og1OVFm2FAdigfeIv6Ehg0Ok2plru3FzYH+sf
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

_vdso_data is specific to x86 and __arch_get_k_vdso_data() is provided
so that all architectures can provide the requested pointer.

Do the same with _vdso_rng_data, provide __arch_get_k_vdso_rng_data()
and don't use x86 _vdso_rng_data directly.

Until now vdso/vsyscall.h was only included by time/vsyscall.c but now
it will also be included in char/random.c, leading to a duplicate
declaration of _vdso_data and _vdso_rng_data.

To fix this issue, move declaration in a C file. vma.c looks like the
most appropriate candidate. Don't need to replace the definitions in
vsyscall.h by declarations as declarations are already in asm/vvar.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Move x86 DEFINE_VVAR(_vdso_data) and DEFINE_VVAR(_vdso_rng_data) in vma.c
---
 arch/x86/entry/vdso/vma.c            |  3 +++
 arch/x86/include/asm/vdso/vsyscall.h | 10 +++++++---
 drivers/char/random.c                |  5 +++--
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index 6d83ceb7f1ba..b8fed8b8b9cc 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -38,6 +38,9 @@ struct vdso_data *arch_get_vdso_data(void *vvar_page)
 }
 #undef EMIT_VVAR
 
+DEFINE_VVAR(struct vdso_data, _vdso_data);
+DEFINE_VVAR_SINGLE(struct vdso_rng_data, _vdso_rng_data);
+
 unsigned int vclocks_used __read_mostly;
 
 #if defined(CONFIG_X86_64)
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso/vsyscall.h
index 972415a8be31..67fedf1698b5 100644
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ b/arch/x86/include/asm/vdso/vsyscall.h
@@ -9,9 +9,6 @@
 #include <asm/vgtod.h>
 #include <asm/vvar.h>
 
-DEFINE_VVAR(struct vdso_data, _vdso_data);
-DEFINE_VVAR_SINGLE(struct vdso_rng_data, _vdso_rng_data);
-
 /*
  * Update the vDSO data page to keep in sync with kernel timekeeping.
  */
@@ -22,6 +19,13 @@ struct vdso_data *__x86_get_k_vdso_data(void)
 }
 #define __arch_get_k_vdso_data __x86_get_k_vdso_data
 
+static __always_inline
+struct vdso_rng_data *__x86_get_k_vdso_rng_data(void)
+{
+	return &_vdso_rng_data;
+}
+#define __arch_get_k_vdso_rng_data __x86_get_k_vdso_rng_data
+
 /* The asm-generic header needs to be included after the definitions above */
 #include <asm-generic/vdso/vsyscall.h>
 
diff --git a/drivers/char/random.c b/drivers/char/random.c
index 87fe61295ea1..77968309e2c2 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -59,6 +59,7 @@
 #ifdef CONFIG_VDSO_GETRANDOM
 #include <vdso/getrandom.h>
 #include <vdso/datapage.h>
+#include <vdso/vsyscall.h>
 #endif
 #include <asm/archrandom.h>
 #include <asm/processor.h>
@@ -282,7 +283,7 @@ static void crng_reseed(struct work_struct *work)
 	 * is ordered with the write above to base_crng.generation. Pairs with
 	 * the smp_rmb() before the syscall in the vDSO code.
 	 */
-	smp_store_release(&_vdso_rng_data.generation, next_gen + 1);
+	smp_store_release(&__arch_get_k_vdso_rng_data()->generation, next_gen + 1);
 #endif
 	if (!static_branch_likely(&crng_is_ready))
 		crng_init = CRNG_READY;
@@ -735,7 +736,7 @@ static void __cold _credit_init_bits(size_t bits)
 			queue_work(system_unbound_wq, &set_ready);
 		atomic_notifier_call_chain(&random_ready_notifier, 0, NULL);
 #ifdef CONFIG_VDSO_GETRANDOM
-		WRITE_ONCE(_vdso_rng_data.is_ready, true);
+		WRITE_ONCE(__arch_get_k_vdso_rng_data()->is_ready, true);
 #endif
 		wake_up_interruptible(&crng_init_wait);
 		kill_fasync(&fasync, SIGIO, POLL_IN);
-- 
2.44.0


