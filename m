Return-Path: <linuxppc-dev+bounces-309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A9295AE8E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:14:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDw625xvz2yZ5;
	Thu, 22 Aug 2024 17:14:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDw600n7z2yK9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:14:13 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqDvD04KVz9sST;
	Thu, 22 Aug 2024 09:13:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1MT9tMdHKEz; Thu, 22 Aug 2024 09:13:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqDvC6NsKz9sSH;
	Thu, 22 Aug 2024 09:13:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C8F7C8B763;
	Thu, 22 Aug 2024 09:13:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Bo_6-yJM0v5v; Thu, 22 Aug 2024 09:13:27 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (PO16920.IDSI0.si.c-s.fr [192.168.232.181])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C10D08B77E;
	Thu, 22 Aug 2024 09:13:26 +0200 (CEST)
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
Subject: [PATCH v2 05/17] vdso: Avoid call to memset() by getrandom
Date: Thu, 22 Aug 2024 09:13:13 +0200
Message-ID: <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724310794; l=1449; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Tu05MKphwEOYciYKJrZW1zS/5ujWTK6L6L6gDjvRdHs=; b=u0fyVWP390/v2lcPCFKdHXUzbaZAGOJ9fxQFiyRBtDUCKlOBBFypazkoFT3x/4k36OQuZN9O+ 8qHLZBslISeCEi/TEk76Xkmo8/onzIZnJ6KuWgXgE5X334zHCd965Tw
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

With the current implementation, __cvdso_getrandom_data() calls
memset(), which is unexpected in the VDSO.

Rewrite opaque data initialisation to avoid memset().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 lib/vdso/getrandom.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index cab153c5f9be..4a56f45141b4 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/minmax.h>
+#include <linux/array_size.h>
 #include <vdso/datapage.h>
 #include <vdso/getrandom.h>
 #include <vdso/unaligned.h>
@@ -74,11 +75,15 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
 	u32 counter[2] = { 0 };
 
 	if (unlikely(opaque_len == ~0UL && !buffer && !len && !flags)) {
-		*(struct vgetrandom_opaque_params *)opaque_state = (struct vgetrandom_opaque_params) {
-			.size_of_opaque_state = sizeof(*state),
-			.mmap_prot = PROT_READ | PROT_WRITE,
-			.mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS
-		};
+		struct vgetrandom_opaque_params *params = opaque_state;
+		int i;
+
+		params->size_of_opaque_state = sizeof(*state);
+		params->mmap_prot = PROT_READ | PROT_WRITE;
+		params->mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS;
+		for (i = 0; i < ARRAY_SIZE(params->reserved); i++)
+			params->reserved[i] = 0;
+
 		return 0;
 	}
 
-- 
2.44.0


