Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1673155791
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 13:23:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DZGg6f0tzDqgL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 23:23:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DZDG0QvrzDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 23:21:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OF+Zx8hv; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48DZDF1b7Mz9sRK; Fri,  7 Feb 2020 23:21:49 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48DZDF00BSz9sRR; Fri,  7 Feb 2020 23:21:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1581078109;
 bh=g/KeOf5Jv0EvaNmKpPEBitWGF4E028qE3B5GuMBcYRg=;
 h=From:To:Cc:Subject:Date:From;
 b=OF+Zx8hvfz/uuykarwzDoB+tJj0ThwIKxleZTxUOLsshzmGJ8b9mgvpULm4NxE0ZP
 ZouocT1V3zddCiLImCX52dIbc1n6vTyRMtBWPrZX0B0uvpg8JNvuuLO7B+joBGjJid
 UVabMoG7J2JAnsi4Z04DUf6fUim4I+12mSkrGQS3k0ZNn+zBGLAHg7mFQ2SgmtfwDi
 2ITtHecOoboCifswS7iZgJn5scVfDehSFuIBdxY12KsTXUkCnte7UKgsxVW94UIzbd
 0r4Xm9HhKBO3u4h5ctEB+fGw4zWJuu+7ZeiPi676+WHscu8dI1H8wnIsJUHiXzjvzS
 DUTF4aU16Lr1w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/futex: Fix incorrect user access blocking
Date: Fri,  7 Feb 2020 23:21:45 +1100
Message-Id: <20200207122145.11928-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
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
Cc: dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The early versions of our kernel user access prevention (KUAP) were
written by Russell and Christophe, and didn't have separate
read/write access.

At some point I picked up the series and added the read/write access,
but I failed to update the usages in futex.h to correctly allow read
and write.

However we didn't notice because of another bug which was causing the
low-level code to always enable read and write. That bug was fixed
recently in commit 1d8f739b07bd ("powerpc/kuap: Fix set direction in
allow/prevent_user_access()").

futex_atomic_cmpxchg_inatomic() is passed the user address as %3 and
does:

  1:     lwarx   %1,  0, %3
         cmpw    0,  %1, %4
         bne-    3f
  2:     stwcx.  %5,  0, %3

Which clearly loads and stores from/to %3. The logic in
arch_futex_atomic_op_inuser() is similar, so fix both of them to use
allow_read_write_user().

Without this fix, and with PPC_KUAP_DEBUG=y, we see eg:

  Bug: Read fault blocked by AMR!
  WARNING: CPU: 94 PID: 149215 at arch/powerpc/include/asm/book3s/64/kup-radix.h:126 __do_page_fault+0x600/0xf30
  CPU: 94 PID: 149215 Comm: futex_requeue_p Tainted: G        W         5.5.0-rc7-gcc9x-g4c25df5640ae #1
  ...
  NIP [c000000000070680] __do_page_fault+0x600/0xf30
  LR [c00000000007067c] __do_page_fault+0x5fc/0xf30
  Call Trace:
  [c00020138e5637e0] [c00000000007067c] __do_page_fault+0x5fc/0xf30 (unreliable)
  [c00020138e5638c0] [c00000000000ada8] handle_page_fault+0x10/0x30
  --- interrupt: 301 at cmpxchg_futex_value_locked+0x68/0xd0
      LR = futex_lock_pi_atomic+0xe0/0x1f0
  [c00020138e563bc0] [c000000000217b50] futex_lock_pi_atomic+0x80/0x1f0 (unreliable)
  [c00020138e563c30] [c00000000021b668] futex_requeue+0x438/0xb60
  [c00020138e563d60] [c00000000021c6cc] do_futex+0x1ec/0x2b0
  [c00020138e563d90] [c00000000021c8b8] sys_futex+0x128/0x200
  [c00020138e563e20] [c00000000000b7ac] system_call+0x5c/0x68

Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace Access Protection")
Cc: stable@vger.kernel.org # v5.2+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/futex.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/futex.h b/arch/powerpc/include/asm/futex.h
index eea28ca679db..bc7d9d06a6d9 100644
--- a/arch/powerpc/include/asm/futex.h
+++ b/arch/powerpc/include/asm/futex.h
@@ -35,7 +35,7 @@ static inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
 {
 	int oldval = 0, ret;
 
-	allow_write_to_user(uaddr, sizeof(*uaddr));
+	allow_read_write_user(uaddr, uaddr, sizeof(*uaddr));
 	pagefault_disable();
 
 	switch (op) {
@@ -62,7 +62,7 @@ static inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
 
 	*oval = oldval;
 
-	prevent_write_to_user(uaddr, sizeof(*uaddr));
+	prevent_read_write_user(uaddr, uaddr, sizeof(*uaddr));
 	return ret;
 }
 
@@ -76,7 +76,8 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
 
-	allow_write_to_user(uaddr, sizeof(*uaddr));
+	allow_read_write_user(uaddr, uaddr, sizeof(*uaddr));
+
         __asm__ __volatile__ (
         PPC_ATOMIC_ENTRY_BARRIER
 "1:     lwarx   %1,0,%3         # futex_atomic_cmpxchg_inatomic\n\
@@ -97,7 +98,8 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
         : "cc", "memory");
 
 	*uval = prev;
-	prevent_write_to_user(uaddr, sizeof(*uaddr));
+	prevent_read_write_user(uaddr, uaddr, sizeof(*uaddr));
+
         return ret;
 }
 
-- 
2.21.1

