Return-Path: <linuxppc-dev+bounces-330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D74595AEC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:17:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDxM6L81z2yxL;
	Thu, 22 Aug 2024 17:15:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDxM0y0Pz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:15:19 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqDvR5CX1z9sT8;
	Thu, 22 Aug 2024 09:13:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21DgOl8Lk8Ri; Thu, 22 Aug 2024 09:13:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqDvR4LvYz9sSy;
	Thu, 22 Aug 2024 09:13:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 83ED38B77E;
	Thu, 22 Aug 2024 09:13:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WGcMRiOmQSwe; Thu, 22 Aug 2024 09:13:39 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (PO16920.IDSI0.si.c-s.fr [192.168.232.181])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F6158B763;
	Thu, 22 Aug 2024 09:13:38 +0200 (CEST)
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
Subject: [PATCH v2 16/17] selftests: vdso: Make VDSO function call more generic
Date: Thu, 22 Aug 2024 09:13:24 +0200
Message-ID: <bd05c8faee64972a9e01f9497d1870dc267a55f4.1724309198.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724310795; l=2025; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Rn9d/ML2os7fiyWcUOGlavHd5OPzN/t1RfDUsN+0Qrg=; b=4ocv1Gynupmkdok/Yucd3J51RkIKkwAAgn+EGWRtuZhZI5J46ZOVIQ7c0ay2qC0zGA01fJtbr LHl2STYwXzSBtCp1j1FM7keZHQwVVi86v7ufMShJDfdkWwIamam+Wbi
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

On powerpc, a call to a VDSO function is not a standard C function
call. Unlike x86 that returns a negated error code in case of an
error, powerpc sets CR[SO] and returns the error code as a
positive value.

So use a macro called VDSO_CALL() which takes a pointer to the
function to call, the number of arguments and the arguments.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/testing/selftests/vDSO/vdso_call.h           | 12 ++++++++++++
 tools/testing/selftests/vDSO/vdso_test_getrandom.c |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/vDSO/vdso_call.h

diff --git a/tools/testing/selftests/vDSO/vdso_call.h b/tools/testing/selftests/vDSO/vdso_call.h
new file mode 100644
index 000000000000..ca5db2220925
--- /dev/null
+++ b/tools/testing/selftests/vDSO/vdso_call.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Macro to call vDSO functions
+ *
+ * Copyright (C) 2024 Christophe Leroy <christophe.leroy@csgroup.eu>, CS GROUP France
+ */
+#ifndef __VDSO_CALL_H__
+#define __VDSO_CALL_H__
+
+#define VDSO_CALL(fn, nr, args...)	fn(args)
+
+#endif
diff --git a/tools/testing/selftests/vDSO/vdso_test_getrandom.c b/tools/testing/selftests/vDSO/vdso_test_getrandom.c
index 02bcffc23e0c..16ad400721c3 100644
--- a/tools/testing/selftests/vDSO/vdso_test_getrandom.c
+++ b/tools/testing/selftests/vDSO/vdso_test_getrandom.c
@@ -22,6 +22,7 @@
 #include "../kselftest.h"
 #include "parse_vdso.h"
 #include "vdso_config.h"
+#include "vdso_call.h"
 
 #ifndef timespecsub
 #define	timespecsub(tsp, usp, vsp)					\
@@ -147,7 +148,7 @@ static ssize_t vgetrandom(void *buf, size_t len, unsigned long flags)
 			exit(KSFT_FAIL);
 		}
 	}
-	return grnd_ctx.fn(buf, len, flags, state, grnd_ctx.params.size_of_opaque_state);
+	return VDSO_CALL(grnd_ctx.fn, 5, buf, len, flags, state, grnd_ctx.params.size_of_opaque_state);
 }
 
 enum { TRIALS = 25000000, THREADS = 256 };
-- 
2.44.0


