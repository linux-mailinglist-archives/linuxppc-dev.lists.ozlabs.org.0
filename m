Return-Path: <linuxppc-dev+bounces-814-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C239661AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 14:29:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwHWv0J7qz30Hf;
	Fri, 30 Aug 2024 22:29:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725020955;
	cv=none; b=kZY5dOWhY1nvXvdjlIRu/CoFyVmxub8U8DAuhZiGtGWDjwL4leqBjfGhfQdXPAsmYBLIoZO9UiJ9Km1Pp2AeslOKNw+znVpc9+3g3SGPGMekA9igx9eOT224zTBcDEQr0kbkJIEEMz2rIQSkmLt3R2C96Yvgfw2qpfD50etead1STEljkhDyavLfjkk77EBaKv0R8XD5cLnQv0nAdnJQn/QWwaHZHRty+ZXy4rQvQaeTmH6UGwuxOd66yxb901lIihSTnD5yCLJTU/KT8ETxN/5aqtZ1Edx/kjAv2RLVvvPCFymVPJU+M5jdmuVsax92lo4B4gsUFKk1ji9Jer/w1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725020955; c=relaxed/relaxed;
	bh=VKTpWwenGYaGlzNLn0K2VUVNJV7ObkGP31+4LdHOvXY=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	b=eE7juesHuwxRIivgU5wPcwFRm7HpZzlEJdkYVv2jdWTC3kUrA/Bhxlw4NkIyqxKf9G95fXsgoqXzbz5HHQLMxvwPzWl5vMRVvGLau/yNr35nrNH0vGCR1zFFKfayY7A8+Hent0wOL4gcT1bMuCg/Bpm6TnYXF7pa54fSH6m3RZyzE/0thezL+kCdOwnjdKDxnf3YvG5k/PblW6E8pUzSNiebHwwGhvCu+PjEnMDtFs83nzpIlETKq759zDwl1RBs/e4yFQSLHO21iLC5c8FTkFLmW3V+QXJkRX7wNrehxKMwecfJ3ZXwsSIO80ZUUNi7M8BluJZax3UWVOJj6Cn+8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwHWt54mBz300B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 22:29:14 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WwHWW1TfXz9sS8;
	Fri, 30 Aug 2024 14:28:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ghA23GVqmrt; Fri, 30 Aug 2024 14:28:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WwHWT2hGYz9sSH;
	Fri, 30 Aug 2024 14:28:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C8118B764;
	Fri, 30 Aug 2024 14:28:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id sYTh0SpiC3mf; Fri, 30 Aug 2024 14:28:53 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.133])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C17FE8B794;
	Fri, 30 Aug 2024 14:28:52 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Lutomirski <luto@mit.edu>,
	"H. Peter Anvin" <hpa@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] selftests: vdso: Use parse_vdso.h in vdso_test_abi
Date: Fri, 30 Aug 2024 14:28:39 +0200
Message-ID: <0d8896fa24167ea85f5b9398b72d2e016af06843.1725020674.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <6c5da802e72befecfa09046c489aa45d934d611f.1725020674.git.christophe.leroy@csgroup.eu>
References: <6c5da802e72befecfa09046c489aa45d934d611f.1725020674.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725020918; l=937; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=DCrPSezoxbVIYz0kG+pXVgQVaxus2MZrfI5WodRpYSE=; b=aIDp1kXqB16bTbdqdx16YUnXPFryN5jjhA+zIAW7cZLM8ouFvh8JTlXR/A8DFqG15GxJb8usU U8M6DQks2feBunzg8dBqJLIFbBkCV1IlqUmzR5Yx0RUxrRLt0wNKxUm
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Don't duplicate parse_vdso function prototypes, include
the header instead.

Fixes: 693f5ca08ca0 ("kselftest: Extend vDSO selftest")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/testing/selftests/vDSO/vdso_test_abi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_abi.c b/tools/testing/selftests/vDSO/vdso_test_abi.c
index 00034208c4c6..a54424e2336f 100644
--- a/tools/testing/selftests/vDSO/vdso_test_abi.c
+++ b/tools/testing/selftests/vDSO/vdso_test_abi.c
@@ -21,10 +21,7 @@
 #include "../kselftest.h"
 #include "vdso_config.h"
 #include "vdso_call.h"
-
-extern void *vdso_sym(const char *version, const char *name);
-extern void vdso_init_from_sysinfo_ehdr(uintptr_t base);
-extern void vdso_init_from_auxv(void *auxv);
+#include "parse_vdso.h"
 
 static const char *version;
 static const char **name;
-- 
2.44.0


