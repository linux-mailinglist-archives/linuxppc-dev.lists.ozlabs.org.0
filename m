Return-Path: <linuxppc-dev+bounces-1151-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CD1970717
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2024 13:50:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X1pFF3QXxz2xb3;
	Sun,  8 Sep 2024 21:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725796241;
	cv=none; b=a1nBTVIZonZr0mSUDscrwDkIIPpSh420g+hi7B1OQaKusoHTd7yfKAdG4IZcnQeLiTVWVQpizuCWJolwxYpIhM+slZsXXyDXSiTIpqw83xCkdRc/EvgKKSuzH+MLGtTCWL5d4nk+I+m0DIGTAtlU97ArDO+3YMZ288fP3lZBnjHuZn3xSt4bNUeskO5gQWSKgPAZ2Wvt1pbeZDl1zd6X7isbMnx8np1syy+Ds24eMKlFEoIZF8TGxSlB7k/Q9Xj2lq8CsPok93X35z2srC37qhhyeohgl7eHbdj+5+CJFybVRE9r8voIibvzTzTZYsCSfQn+xzddC1OPD+0DXKOnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725796241; c=relaxed/relaxed;
	bh=vYmP36m1vySgTazX2EUG834IyZqUO2Aw3bjJxM7wyes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oVgp2FmzvYK//eZpC+TItoUZyJPOQm3JdMKqwv3SjGcyKBI3KyNBl0MieA+LL7lQcYCF1h+YyLbbs/93XDecg5cS5yZY5W/H8ei7O9Qe6YFSiFcaDKnFXVxbjykEyKdxt54b450cegC8YBnIgMltdm0B+BUHcQX/30JxZwNskV8ukmgRNyQnCLW5Odmb9mcAGtQYfWc3v2Xz9zMJ5h2TpV28uxalJKcMbNUJdfykf/JyXKEEYYpXo7nsVE4J4qBr3p0voEpDMQgz8y8Ix4upxBZxJnL1EshxiNKAkGFYvrkyuTKA2JX8tP5e1tB/t3DF60iZ4eImwZfEttbOAXTE+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X1pFF1DT7z2xZj
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Sep 2024 21:50:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X1pF965xzz9rvV;
	Sun,  8 Sep 2024 13:50:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CAwNtBLKD90C; Sun,  8 Sep 2024 13:50:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X1pF32Rqbz9sSK;
	Sun,  8 Sep 2024 13:50:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D802D8CC3A;
	Sat,  7 Sep 2024 17:40:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WICCX_2l4Sbn; Sat,  7 Sep 2024 17:40:49 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.96])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 73A788CC38;
	Sat,  7 Sep 2024 17:40:49 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	arnd@arndb.de
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-hardening@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH] set_memory: Add __must_check to generic stubs
Date: Sat,  7 Sep 2024 17:40:42 +0200
Message-ID: <6a89ffc69666de84721216947c6b6c7dcca39d7d.1725723347.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <775dae48064a661554802ed24ed5bdffe1784724.1725723351.git.christophe.leroy@csgroup.eu>
References: <775dae48064a661554802ed24ed5bdffe1784724.1725723351.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725723642; l=1883; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=f4b3EWGgDvYEBxJXLd9EJXkZFmAy/z1D3M4a+/Gf9BE=; b=GO8Jmv0feXJjWdAIlGrWtN3vOIY+RcbII4YzFBMOV4qn10O93VQTky4E/rglcXaFOX/2T25C5 TUaw+OtAjkkBvWcjTprrjV966nDWaRdnZM26nPa74kRTTib6k4Guy2w
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Following query shows that architectures that don't provide
asm/set_memory.h don't use set_memory_...() functions.

  $ git grep set_memory_ alpha arc csky hexagon loongarch m68k microblaze mips nios2 openrisc parisc sh sparc um xtensa

Following query shows that all core users of set_memory_...()
functions always take returned value into account:

  $ git grep -w -e set_memory_ro -e set_memory_rw -e set_memory_x -e set_memory_nx -e set_memory_rox `find . -maxdepth 1 -type d | grep -v arch | grep /`

set_memory_...() functions can fail, leaving the memory attributes
unchanged. Make sure all callers check the returned code.

Link: https://github.com/KSPP/linux/issues/7
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/linux/set_memory.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 95ac8398ee72..e7aec20fb44f 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -8,10 +8,10 @@
 #ifdef CONFIG_ARCH_HAS_SET_MEMORY
 #include <asm/set_memory.h>
 #else
-static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
-static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
-static inline int set_memory_x(unsigned long addr,  int numpages) { return 0; }
-static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
+static inline int __must_check set_memory_ro(unsigned long addr, int numpages) { return 0; }
+static inline int __must_check set_memory_rw(unsigned long addr, int numpages) { return 0; }
+static inline int __must_check set_memory_x(unsigned long addr,  int numpages) { return 0; }
+static inline int __must_check set_memory_nx(unsigned long addr, int numpages) { return 0; }
 #endif
 
 #ifndef set_memory_rox
-- 
2.44.0


