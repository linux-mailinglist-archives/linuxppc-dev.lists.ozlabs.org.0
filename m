Return-Path: <linuxppc-dev+bounces-9615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B26E3AE3011
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 15:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQBfZ1PSgz30Tf;
	Sun, 22 Jun 2025 23:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750598438;
	cv=none; b=ZLfLBJjYgqRUh+EFEKWVbbrwGcwKk/8WSWasQ3d2dT3dEKT3/IJ2+fR5D5T04zi5fcnUHNzkuNfVr9l2JOadK35xZnL/veER25xMLChf/8NJRGLjGUS2mGr1tI9BqUZuPzRPsvja6bidTqOQVhLuHCU0OgULZZgjXYUWBTCyqVpGSPOT93QhCdA0202iyRKPzByU0mx8RB11vRwQvBnIJ4KgrvwIhOhrQuLF7wxG5SW6wpY6r18J557JjHux7ZpnkxxToLJchwBB/u6NU+5acYR7AzedWjs9JrjwLMhmuL+xvPO8r43Bmpmk2rUgjSa00UkqS/j3935nhWl+LhHEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750598438; c=relaxed/relaxed;
	bh=Zdoedn24Jwg7lQBaAjBuSixbNxSUyXO3D6vwDFgIg3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SAPRLoolUzP+gdDRT3BMm17YHsHIzhu0Dkvnl+I13Ioc8WyULC5OvWL6c6QpDggwzktydr/TWNYfoH1bxclJsr7Qk6ZYsZUenQ5kMX2W+M3xweTnoi0Yg6BOlkdd3jwlG7BOw6YSL+XaGFlp81lEgD/cJnreT7e73csfpImu1GewskVOCy86eqL4rNYrM02kTNwgtjNae3uCG5apTTKEjOiIS33DPmtCjVVbNF2y58XZZchRRf+HD88+9fhV4Na0d58uSH8wcUn3125ot5LUXZoOSaQfNgdxG7fHpndWR9VhEj87UrZHsnSJnhlaigRpH0xN2AsP4xc1qjC6uFWHRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQBfY20GSz30KY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 23:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bQ62s3TsWz9sfW;
	Sun, 22 Jun 2025 11:52:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Qu3VT7lXSBd; Sun, 22 Jun 2025 11:52:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bQ62s2Hmfz9sfF;
	Sun, 22 Jun 2025 11:52:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 475B48B765;
	Sun, 22 Jun 2025 11:52:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id l6aql5vCM1zT; Sun, 22 Jun 2025 11:52:53 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 45B4A8B764;
	Sun, 22 Jun 2025 11:52:52 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Andre Almeida" <andrealmeid@igalia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 4/5] powerpc: Move barrier_nospec() out of allow_read_{from/write}_user()
Date: Sun, 22 Jun 2025 11:52:42 +0200
Message-ID: <cf6b49fbfee158221ce22baf8aed43e9dd8d34a2.1750585239.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750585239.git.christophe.leroy@csgroup.eu>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750585958; l=2362; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=wzgi8TIxhTfIFVNyBJ8YVgkDaYmDFZG7Y/RKQLlutyc=; b=SHR7GQWRwSWYB89RLRaWxjLnaNArovgMY5ntnQhDOcYsi0NJTaUtpbHESijjCGnb2sXQYAJuB 0/NeP7QB3kqCs4+wyhoCLxM/bIdw6SQ2cEBJrKh7F1NhtihxJN7KIx6
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Move barrier_nospec() out of allow_read_from_user() and
allow_read_write_user() in order to allow reuse of those
functions when implementing masked user access.

Don't add it back in raw_copy_from_user() as it is already done
by callers of raw_copy_from_user().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/kup.h     | 2 --
 arch/powerpc/include/asm/uaccess.h | 4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 4c70be11b99a..4e2c79df4cdb 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -134,7 +134,6 @@ static __always_inline void kuap_assert_locked(void)
 
 static __always_inline void allow_read_from_user(const void __user *from)
 {
-	barrier_nospec();
 	allow_user_access(NULL, from, KUAP_READ);
 }
 
@@ -145,7 +144,6 @@ static __always_inline void allow_write_to_user(void __user *to)
 
 static __always_inline void allow_read_write_user(void __user *to, const void __user *from)
 {
-	barrier_nospec();
 	allow_user_access(to, from, KUAP_READ_WRITE);
 }
 
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index dd5cf325ecde..89d53d4c2236 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -301,6 +301,7 @@ do {								\
 	__typeof__(sizeof(*(ptr))) __gu_size = sizeof(*(ptr));	\
 								\
 	might_fault();					\
+	barrier_nospec();					\
 	allow_read_from_user(__gu_addr);			\
 	__get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);	\
 	prevent_read_from_user(__gu_addr);			\
@@ -329,6 +330,7 @@ raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
 {
 	unsigned long ret;
 
+	barrier_nospec();
 	allow_read_write_user(to, from);
 	ret = __copy_tofrom_user(to, from, n);
 	prevent_read_write_user(to, from);
@@ -415,6 +417,7 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
 
 	might_fault();
 
+	barrier_nospec();
 	allow_read_write_user((void __user *)ptr, ptr);
 	return true;
 }
@@ -431,6 +434,7 @@ user_read_access_begin(const void __user *ptr, size_t len)
 
 	might_fault();
 
+	barrier_nospec();
 	allow_read_from_user(ptr);
 	return true;
 }
-- 
2.49.0


