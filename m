Return-Path: <linuxppc-dev+bounces-11230-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF0B3279A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Aug 2025 10:20:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c893t2JbVz3dBx;
	Sat, 23 Aug 2025 18:20:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755937242;
	cv=none; b=LCE78SqbEnbP3eUmP32yWTc0h1vS4xUrgR4sDxLL05cTVbRXspQiHud6oMX+EPQDi7CG95ovqrUjBUzOrjIKd8qHICS0C8LDTgC4hhZz0VbaXyjjtvmowNd12SvoeO523oX2hkx12NmckRxG28L2LF+6mmb1h0z9pO//1dQ/21Hb8OeNCF9KDkSWI1f52JL+LaG0rkiKz1cShGpqTSRzKGnwyVFr3FL2pEY+GxkDNhfOLCKPDfYQsX1rKqw+qnxOPvfe8xrGxrOjP+TBR5bqFgZwcy0179es8iE2UchfaxGWRz4fMvWGQyvVB/VawAnyUM+ORLLNkh/ILYtcvC0dFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755937242; c=relaxed/relaxed;
	bh=GtQ2Q/aaQ74mOKTCLMcZMIova6ijtMTs5ukzxF/EuMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FRNDl9k54yt4uJGq2zorhnpSfdK+Eiy9qB9A4fuIGmsVbOJp8YeTBLuXZ7c3FObIYZsT8BPOTBQDcFO9pMiyE/Icsl9b7vOCY9jvlu8MI8ZtB1gzBS8tPcCDH3qz4CZdseZy6c3bQZP+fQ4348QnMc9RM9lWvrX2mnJLtc+v92G4Fv8hGqC4E3y03kpGeKgjyfVF52KruV0Tap+zLEGgW/F76LusBElob4lAuLUF2/wB/bzHNRWLAPB8EDNCfPMnjGL3/oMnMuwb3ajGhQJB0/zMqgzzYGn1bp1AA+lqp1JDoqlf+cTLaq0Jy+7tU8eGRVbH8BikLOVc8VAMvCSgMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c893s5QDgz3d9H
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 18:20:41 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c7bGr0ZKTz9sSY;
	Fri, 22 Aug 2025 11:58:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O2kEh4GEi-xJ; Fri, 22 Aug 2025 11:58:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c7bGq6d9sz9sSX;
	Fri, 22 Aug 2025 11:58:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C7E138B775;
	Fri, 22 Aug 2025 11:58:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kyxvRiMS9UjN; Fri, 22 Aug 2025 11:58:11 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 771E88B780;
	Fri, 22 Aug 2025 11:58:10 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
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
	Linus Torvalds <torvalds@linux-foundation.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-block@vger.kernel.org
Subject: [PATCH v2 05/10] powerpc/uaccess: Remove unused size and from parameters from allow_access_user()
Date: Fri, 22 Aug 2025 11:58:01 +0200
Message-ID: <987c04688a537710c212fb35f2676311da94c1b2.1755854833.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1755854833.git.christophe.leroy@csgroup.eu>
References: <cover.1755854833.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755856679; l=5354; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=pN4mv5SfPTESXIT1PtFDsmVlUJhI6vGXL0aiUyNtU/g=; b=Bu4ikyLq1pN/L5W86rytn1JbsXSSu+bIHrWJqiGv9PK5Fq01x2XJ3sPr+KkWnmzmy52dACItS CmDpj3q3eZeCPHC21wM4V6/xEYsKrnmPpK5zktbf8Gm3JFSTp1DQzhm
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since commit 16132529cee5 ("powerpc/32s: Rework Kernel Userspace
Access Protection") the size parameter is unused on all platforms.

And the 'from' parameter has never been used.

Remove them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Also remove 'from' param.
---
 arch/powerpc/include/asm/book3s/32/kup.h     | 3 +--
 arch/powerpc/include/asm/book3s/64/kup.h     | 6 ++----
 arch/powerpc/include/asm/kup.h               | 9 ++++-----
 arch/powerpc/include/asm/nohash/32/kup-8xx.h | 3 +--
 arch/powerpc/include/asm/nohash/kup-booke.h  | 3 +--
 5 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 4e14a5427a63..6718b7e40eef 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -97,8 +97,7 @@ static __always_inline unsigned long __kuap_get_and_assert_locked(void)
 }
 #define __kuap_get_and_assert_locked __kuap_get_and_assert_locked
 
-static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      u32 size, unsigned long dir)
+static __always_inline void allow_user_access(void __user *to, unsigned long dir)
 {
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
 
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 497a7bd31ecc..3b8706007fa1 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -353,8 +353,7 @@ __bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 	return (regs->amr & AMR_KUAP_BLOCK_READ) == AMR_KUAP_BLOCK_READ;
 }
 
-static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir)
+static __always_inline void allow_user_access(void __user *to, unsigned long dir)
 {
 	unsigned long thread_amr = 0;
 
@@ -383,8 +382,7 @@ static __always_inline unsigned long get_kuap(void)
 
 static __always_inline void set_kuap(unsigned long value) { }
 
-static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir)
+static __always_inline void allow_user_access(void __user *to, unsigned long dir)
 { }
 
 #endif /* !CONFIG_PPC_KUAP */
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 6737416dde9f..da5f5b47cca0 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -72,8 +72,7 @@ static __always_inline void __kuap_kernel_restore(struct pt_regs *regs, unsigned
  * platforms.
  */
 #ifndef CONFIG_PPC_BOOK3S_64
-static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir) { }
+static __always_inline void allow_user_access(void __user *to, unsigned long dir) { }
 static __always_inline void prevent_user_access(unsigned long dir) { }
 static __always_inline unsigned long prevent_user_access_return(void) { return 0UL; }
 static __always_inline void restore_user_access(unsigned long flags) { }
@@ -134,18 +133,18 @@ static __always_inline void kuap_assert_locked(void)
 
 static __always_inline void allow_read_from_user(const void __user *from, unsigned long size)
 {
-	allow_user_access(NULL, from, size, KUAP_READ);
+	allow_user_access(NULL, KUAP_READ);
 }
 
 static __always_inline void allow_write_to_user(void __user *to, unsigned long size)
 {
-	allow_user_access(to, NULL, size, KUAP_WRITE);
+	allow_user_access(to, KUAP_WRITE);
 }
 
 static __always_inline void allow_read_write_user(void __user *to, const void __user *from,
 						  unsigned long size)
 {
-	allow_user_access(to, from, size, KUAP_READ_WRITE);
+	allow_user_access(to, KUAP_READ_WRITE);
 }
 
 static __always_inline void prevent_read_from_user(const void __user *from, unsigned long size)
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 46bc5925e5fd..86621fee746d 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -49,8 +49,7 @@ static __always_inline void uaccess_end_8xx(void)
 	    "i"(SPRN_MD_AP), "r"(MD_APG_KUAP), "i"(MMU_FTR_KUAP) : "memory");
 }
 
-static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir)
+static __always_inline void allow_user_access(void __user *to, unsigned long dir)
 {
 	uaccess_begin_8xx(MD_APG_INIT);
 }
diff --git a/arch/powerpc/include/asm/nohash/kup-booke.h b/arch/powerpc/include/asm/nohash/kup-booke.h
index 0c7c3258134c..a8fab0349704 100644
--- a/arch/powerpc/include/asm/nohash/kup-booke.h
+++ b/arch/powerpc/include/asm/nohash/kup-booke.h
@@ -73,8 +73,7 @@ static __always_inline void uaccess_end_booke(void)
 	    "i"(SPRN_PID), "r"(0), "i"(MMU_FTR_KUAP) : "memory");
 }
 
-static __always_inline void allow_user_access(void __user *to, const void __user *from,
-					      unsigned long size, unsigned long dir)
+static __always_inline void allow_user_access(void __user *to, unsigned long dir)
 {
 	uaccess_begin_booke(current->thread.pid);
 }
-- 
2.49.0


