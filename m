Return-Path: <linuxppc-dev+bounces-307-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E1B95AE8A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:14:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDvw4WKXz2yYf;
	Thu, 22 Aug 2024 17:14:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDvw2MCFz2xDM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:14:04 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqDvF1Dg6z9sSW;
	Thu, 22 Aug 2024 09:13:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RkC5cLxZ4aFG; Thu, 22 Aug 2024 09:13:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqDvD6yC3z9sSH;
	Thu, 22 Aug 2024 09:13:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D585A8B763;
	Thu, 22 Aug 2024 09:13:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 6SSl1lnhD-ee; Thu, 22 Aug 2024 09:13:28 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (PO16920.IDSI0.si.c-s.fr [192.168.232.181])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CBB698B77D;
	Thu, 22 Aug 2024 09:13:27 +0200 (CEST)
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
Subject: [PATCH v2 06/17] vdso: Change getrandom's generation to unsigned long
Date: Thu, 22 Aug 2024 09:13:14 +0200
Message-ID: <525b48eb79978ddba2d1b8ee23b27bd6c5b0b4ee.1724309198.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724310794; l=1276; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=DHKz0nvjKBEZw1qFdyeiMuLRmQ0ExqxUlDOlPsu+3EA=; b=6rTkR9UfUapFGijZerpzLYHhj4PimSMK+GNZzXry6VAozVYosYDA1h8oocTbDByNjWJQ8Sh+H SV2G/Pz6kbDAVsKqsh13uCcc2q8jEtNaLgRwvLicmTZ4KYZyiB5QJXR
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Performing SMP atomic operations on u64 fails on powerpc32.

Random driver generation is handled as unsigned long not u64,
see for instance base_cnrg or struct crng.

Use the same type for vDSO's getrandom as it gets copied
from the above. This is also in line with the local
current_generation which is already an unsigned long.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/vdso/datapage.h  | 2 +-
 include/vdso/getrandom.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index b85f24cac3f5..00b66a9b5778 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -123,7 +123,7 @@ struct vdso_data {
  * @is_ready:	boolean signaling whether the RNG is initialized
  */
 struct vdso_rng_data {
-	u64	generation;
+	unsigned long	generation;
 	u8	is_ready;
 };
 
diff --git a/include/vdso/getrandom.h b/include/vdso/getrandom.h
index a8b7c14b0ae0..36fd166bf330 100644
--- a/include/vdso/getrandom.h
+++ b/include/vdso/getrandom.h
@@ -38,7 +38,7 @@ struct vgetrandom_state {
 		};
 		u8		batch_key[CHACHA_BLOCK_SIZE * 2];
 	};
-	u64			generation;
+	unsigned long		generation;
 	u8			pos;
 	bool 			in_use;
 };
-- 
2.44.0


