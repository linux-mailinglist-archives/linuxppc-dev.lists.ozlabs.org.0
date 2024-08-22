Return-Path: <linuxppc-dev+bounces-303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2444995AE7E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:14:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDvl0zxZz2yRP;
	Thu, 22 Aug 2024 17:13:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDvk5yc4z2xDM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:13:54 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqDvB6wCcz9sSS;
	Thu, 22 Aug 2024 09:13:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j_PpJleCxFhw; Thu, 22 Aug 2024 09:13:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqDvB63W6z9sSH;
	Thu, 22 Aug 2024 09:13:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BD35D8B77D;
	Thu, 22 Aug 2024 09:13:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id YjBIjwOuIeHr; Thu, 22 Aug 2024 09:13:26 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (PO16920.IDSI0.si.c-s.fr [192.168.232.181])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B20CE8B763;
	Thu, 22 Aug 2024 09:13:25 +0200 (CEST)
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
Subject: [PATCH v2 04/17] vdso: Add missing c-getrandom-y in Makefile
Date: Thu, 22 Aug 2024 09:13:12 +0200
Message-ID: <4ba87b8daeb2f3c0f98e62e16bf60c7e97fb53d5.1724309198.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724310793; l=917; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=+zsbiRN1Rsvt2mjgra0iuNna45++1Wbks1WsFgQokwI=; b=2AfI70PEj4f7IlK/0JPNIuIysPxZX41Nyq8vstRlw5T4vE5uGLfODApjwg2SJ4Pz/gF8h97/4 zakI/eTMUjpBA1Xm+QvdyQWVNPrgotgD0KB4hiOOMH8kcDGdiZXSdcS
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Same as for gettimeofday CVDSO implementation, add c-getrandom-y
to ease the inclusion of lib/vdso/getrandom.c in architectures
VDSO builds.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 lib/vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/vdso/Makefile b/lib/vdso/Makefile
index 9f031eafc465..cedbf15f8087 100644
--- a/lib/vdso/Makefile
+++ b/lib/vdso/Makefile
@@ -4,6 +4,7 @@ GENERIC_VDSO_MK_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
 GENERIC_VDSO_DIR := $(dir $(GENERIC_VDSO_MK_PATH))
 
 c-gettimeofday-$(CONFIG_GENERIC_GETTIMEOFDAY) := $(addprefix $(GENERIC_VDSO_DIR), gettimeofday.c)
+c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrandom.c)
 
 # This cmd checks that the vdso library does not contain dynamic relocations.
 # It has to be called after the linking of the vdso library and requires it
-- 
2.44.0


