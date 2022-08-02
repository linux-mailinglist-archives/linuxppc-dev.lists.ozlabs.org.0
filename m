Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A8C58798B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 11:04:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lxpvs1swcz3f0y
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 19:04:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lxptn73cjz3byL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 19:03:29 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LxptV28k5z9sj3;
	Tue,  2 Aug 2022 11:03:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFijjTEZ17Rg; Tue,  2 Aug 2022 11:03:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LxptS5BJ4z9sj8;
	Tue,  2 Aug 2022 11:03:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A07B88B778;
	Tue,  2 Aug 2022 11:03:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ewIY7rW_tppI; Tue,  2 Aug 2022 11:03:12 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.234.100])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 581DE8B774;
	Tue,  2 Aug 2022 11:03:12 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 27292rda2260933
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 2 Aug 2022 11:02:53 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 27292qSv2260929;
	Tue, 2 Aug 2022 11:02:52 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 1/3] powerpc: Fix eh field when calling lwarx on PPC32
Date: Tue,  2 Aug 2022 11:02:36 +0200
Message-Id: <a1176e19e627dd6a1b8d24c6c457a8ab874b7d12.1659430931.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1659430956; l=2806; s=20211009; h=from:subject:message-id; bh=Ql4wH2IxjgIVSI9zEHRKkat7t+pnMzHPhHFvDfUw3aY=; b=yLvG/Xp8YRShPyqSNwp1ZA8JWW7AE6GXD+9lDgvJ52hzYqbFXAheDqpDEHDbA9IZLghG9vme77+P lbjSCEVvDtVntoszYgkRBpgLT8HG5GJboyaUz6g0xuzKne+rB396
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 9401f4e46cf6 ("powerpc: Use lwarx/ldarx directly instead of
PPC_LWARX/LDARX macros") properly handled the eh field of lwarx
in asm/bitops.h but failed to clear it for PPC32 in
asm/simple_spinlock.h

So, do as in arch_atomic_try_cmpxchg_lock(), set it to 1 if PPC64
but set it to 0 if PPC32. For that use IS_ENABLED(CONFIG_PPC64) which
returns 1 when CONFIG_PPC64 is set and 0 otherwise.

Reported-by: Pali Rohár <pali@kernel.org>
Fixes: 9401f4e46cf6 ("powerpc: Use lwarx/ldarx directly instead of PPC_LWARX/LDARX macros")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/simple_spinlock.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/simple_spinlock.h b/arch/powerpc/include/asm/simple_spinlock.h
index 7ae6aeef8464..5095c636a680 100644
--- a/arch/powerpc/include/asm/simple_spinlock.h
+++ b/arch/powerpc/include/asm/simple_spinlock.h
@@ -48,10 +48,11 @@ static inline int arch_spin_is_locked(arch_spinlock_t *lock)
 static inline unsigned long __arch_spin_trylock(arch_spinlock_t *lock)
 {
 	unsigned long tmp, token;
+	unsigned int eh = IS_ENABLED(CONFIG_PPC64);
 
 	token = LOCK_TOKEN;
 	__asm__ __volatile__(
-"1:	lwarx		%0,0,%2,1\n\
+"1:	lwarx		%0,0,%2,%3\n\
 	cmpwi		0,%0,0\n\
 	bne-		2f\n\
 	stwcx.		%1,0,%2\n\
@@ -59,7 +60,7 @@ static inline unsigned long __arch_spin_trylock(arch_spinlock_t *lock)
 	PPC_ACQUIRE_BARRIER
 "2:"
 	: "=&r" (tmp)
-	: "r" (token), "r" (&lock->slock)
+	: "r" (token), "r" (&lock->slock), "i" (eh)
 	: "cr0", "memory");
 
 	return tmp;
@@ -156,9 +157,10 @@ static inline void arch_spin_unlock(arch_spinlock_t *lock)
 static inline long __arch_read_trylock(arch_rwlock_t *rw)
 {
 	long tmp;
+	unsigned int eh = IS_ENABLED(CONFIG_PPC64);
 
 	__asm__ __volatile__(
-"1:	lwarx		%0,0,%1,1\n"
+"1:	lwarx		%0,0,%1,%2\n"
 	__DO_SIGN_EXTEND
 "	addic.		%0,%0,1\n\
 	ble-		2f\n"
@@ -166,7 +168,7 @@ static inline long __arch_read_trylock(arch_rwlock_t *rw)
 	bne-		1b\n"
 	PPC_ACQUIRE_BARRIER
 "2:"	: "=&r" (tmp)
-	: "r" (&rw->lock)
+	: "r" (&rw->lock), "i" (eh)
 	: "cr0", "xer", "memory");
 
 	return tmp;
@@ -179,17 +181,18 @@ static inline long __arch_read_trylock(arch_rwlock_t *rw)
 static inline long __arch_write_trylock(arch_rwlock_t *rw)
 {
 	long tmp, token;
+	unsigned int eh = IS_ENABLED(CONFIG_PPC64);
 
 	token = WRLOCK_TOKEN;
 	__asm__ __volatile__(
-"1:	lwarx		%0,0,%2,1\n\
+"1:	lwarx		%0,0,%2,%3\n\
 	cmpwi		0,%0,0\n\
 	bne-		2f\n"
 "	stwcx.		%1,0,%2\n\
 	bne-		1b\n"
 	PPC_ACQUIRE_BARRIER
 "2:"	: "=&r" (tmp)
-	: "r" (token), "r" (&rw->lock)
+	: "r" (token), "r" (&rw->lock), "i" (eh)
 	: "cr0", "memory");
 
 	return tmp;
-- 
2.36.1

