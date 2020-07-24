Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DF222C244
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 11:29:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCkRp4FG2zDrbv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 19:29:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCkMJ6tqfzDrRS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 19:25:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RNAjP3RM; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCkMJ5LDLz9sSn; Fri, 24 Jul 2020 19:25:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCkMJ4Jsnz9sSy; Fri, 24 Jul 2020 19:25:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595582732;
 bh=UXlzCcfJgqS+BUSFEVm61kDbX8CRIajG6Q/ZhHy1Heg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RNAjP3RMQWk1wNupuTqQgyNDDHJW8M0fvc1lmqotxhhhAn4eHhLuHErJorRO1uOP0
 RWDd5SJHO66aZ7e0zPSxzbnt8Kwpx0XMpZlufcdMGUnRl49HfcExIWSH72UZP93ort
 up7BjrjSzW95tIIuh8vVGdzW0kyBbhFsuqn5OvBpqegf8Ot3I/ktB4PvptfBsmRNLP
 hwjqhbQHuc9pBbuwvRcnqCICBFbSfQIf0c4+1B6HOxyaE2MFT0IABsT7EtR8hYYpvL
 sknSxxmw0TEnK8PXLjABjflUPTcMYY/9OJUOMlT9DXiEnGItr95lYGIqW3KR0uO+IG
 kwVygUOOzOszQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 2/5] powerpc: Allow 4224 bytes of stack expansion for the
 signal frame
Date: Fri, 24 Jul 2020 19:25:25 +1000
Message-Id: <20200724092528.1578671-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724092528.1578671-1-mpe@ellerman.id.au>
References: <20200724092528.1578671-1-mpe@ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have powerpc specific logic in our page fault handling to decide if
an access to an unmapped address below the stack pointer should expand
the stack VMA.

The code was originally added in 2004 "ported from 2.4". The rough
logic is that the stack is allowed to grow to 1MB with no extra
checking. Over 1MB the access must be within 2048 bytes of the stack
pointer, or be from a user instruction that updates the stack pointer.

The 2048 byte allowance below the stack pointer is there to cover the
288 byte "red zone" as well as the "about 1.5kB" needed by the signal
delivery code.

Unfortunately since then the signal frame has expanded, and is now
4224 bytes on 64-bit kernels with transactional memory enabled. This
means if a process has consumed more than 1MB of stack, and its stack
pointer lies less than 4224 bytes from the next page boundary, signal
delivery will fault when trying to expand the stack and the process
will see a SEGV.

The total size of the signal frame is the size of struct rt_sigframe
(which includes the red zone) plus __SIGNAL_FRAMESIZE (128 bytes on
64-bit).

The 2048 byte allowance was correct until 2008 as the signal frame
was:

struct rt_sigframe {
        struct ucontext    uc;                           /*     0  1440 */
        /* --- cacheline 11 boundary (1408 bytes) was 32 bytes ago --- */
        long unsigned int          _unused[2];           /*  1440    16 */
        unsigned int               tramp[6];             /*  1456    24 */
        struct siginfo *           pinfo;                /*  1480     8 */
        void *                     puc;                  /*  1488     8 */
        struct siginfo     info;                         /*  1496   128 */
        /* --- cacheline 12 boundary (1536 bytes) was 88 bytes ago --- */
        char                       abigap[288];          /*  1624   288 */

        /* size: 1920, cachelines: 15, members: 7 */
        /* padding: 8 */
};

1920 + 128 = 2048

Then in commit ce48b2100785 ("powerpc: Add VSX context save/restore,
ptrace and signal support") (Jul 2008) the signal frame expanded to
2304 bytes:

struct rt_sigframe {
        struct ucontext    uc;                           /*     0  1696 */	<--
        /* --- cacheline 13 boundary (1664 bytes) was 32 bytes ago --- */
        long unsigned int          _unused[2];           /*  1696    16 */
        unsigned int               tramp[6];             /*  1712    24 */
        struct siginfo *           pinfo;                /*  1736     8 */
        void *                     puc;                  /*  1744     8 */
        struct siginfo     info;                         /*  1752   128 */
        /* --- cacheline 14 boundary (1792 bytes) was 88 bytes ago --- */
        char                       abigap[288];          /*  1880   288 */

        /* size: 2176, cachelines: 17, members: 7 */
        /* padding: 8 */
};

2176 + 128 = 2304

At this point we should have been exposed to the bug, though as far as
I know it was never reported. I no longer have a system old enough to
easily test on.

Then in 2010 commit 320b2b8de126 ("mm: keep a guard page below a
grow-down stack segment") caused our stack expansion code to never
trigger, as there was always a VMA found for a write up to PAGE_SIZE
below r1.

That meant the bug was hidden as we continued to expand the signal
frame in commit 2b0a576d15e0 ("powerpc: Add new transactional memory
state to the signal context") (Feb 2013):

struct rt_sigframe {
        struct ucontext    uc;                           /*     0  1696 */
        /* --- cacheline 13 boundary (1664 bytes) was 32 bytes ago --- */
        struct ucontext    uc_transact;                  /*  1696  1696 */	<--
        /* --- cacheline 26 boundary (3328 bytes) was 64 bytes ago --- */
        long unsigned int          _unused[2];           /*  3392    16 */
        unsigned int               tramp[6];             /*  3408    24 */
        struct siginfo *           pinfo;                /*  3432     8 */
        void *                     puc;                  /*  3440     8 */
        struct siginfo     info;                         /*  3448   128 */
        /* --- cacheline 27 boundary (3456 bytes) was 120 bytes ago --- */
        char                       abigap[288];          /*  3576   288 */

        /* size: 3872, cachelines: 31, members: 8 */
        /* padding: 8 */
        /* last cacheline: 32 bytes */
};

3872 + 128 = 4000

And commit 573ebfa6601f ("powerpc: Increase stack redzone for 64-bit
userspace to 512 bytes") (Feb 2014):

struct rt_sigframe {
        struct ucontext    uc;                           /*     0  1696 */
        /* --- cacheline 13 boundary (1664 bytes) was 32 bytes ago --- */
        struct ucontext    uc_transact;                  /*  1696  1696 */
        /* --- cacheline 26 boundary (3328 bytes) was 64 bytes ago --- */
        long unsigned int          _unused[2];           /*  3392    16 */
        unsigned int               tramp[6];             /*  3408    24 */
        struct siginfo *           pinfo;                /*  3432     8 */
        void *                     puc;                  /*  3440     8 */
        struct siginfo     info;                         /*  3448   128 */
        /* --- cacheline 27 boundary (3456 bytes) was 120 bytes ago --- */
        char                       abigap[512];          /*  3576   512 */	<--

        /* size: 4096, cachelines: 32, members: 8 */
        /* padding: 8 */
};

4096 + 128 = 4224

Then finally in 2017, commit 1be7107fbe18 ("mm: larger stack guard
gap, between vmas") exposed us to the existing bug, because it changed
the stack VMA to be the correct/real size, meaning our stack expansion
code is now triggered.

Fix it by increasing the allowance to 4224 bytes.

Hard-coding 4224 is obviously unsafe against future expansions of the
signal frame in the same way as the existing code. We can't easily use
sizeof() because the signal frame structure is not in a header. We
will either fix that, or rip out all the custom stack expansion
checking logic entirely.

Fixes: ce48b2100785 ("powerpc: Add VSX context save/restore, ptrace and signal support")
Cc: stable@vger.kernel.org # v2.6.27+
Reported-by: Tom Lane <tgl@sss.pgh.pa.us>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---

v2: Account for the extra 128 bytes of __SIGNAL_FRAMESIZE, making the
    total size 4224, as noticed by dja.

See also https://bugzilla.kernel.org/show_bug.cgi?id=205183
---
 arch/powerpc/mm/fault.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 641fc5f3d7dd..3ebb1792e636 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -267,6 +267,9 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 	return false;
 }
 
+// This comes from 64-bit struct rt_sigframe + __SIGNAL_FRAMESIZE
+#define SIGFRAME_MAX_SIZE	(4096 + 128)
+
 static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
 				struct vm_area_struct *vma, unsigned int flags,
 				bool *must_retry)
@@ -274,7 +277,7 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
 	/*
 	 * N.B. The POWER/Open ABI allows programs to access up to
 	 * 288 bytes below the stack pointer.
-	 * The kernel signal delivery code writes up to about 1.5kB
+	 * The kernel signal delivery code writes a bit over 4KB
 	 * below the stack pointer (r1) before decrementing it.
 	 * The exec code can write slightly over 640kB to the stack
 	 * before setting the user r1.  Thus we allow the stack to
@@ -299,7 +302,7 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
 		 * between the last mapped region and the stack will
 		 * expand the stack rather than segfaulting.
 		 */
-		if (address + 2048 >= uregs->gpr[1])
+		if (address + SIGFRAME_MAX_SIZE >= uregs->gpr[1])
 			return false;
 
 		if ((flags & FAULT_FLAG_WRITE) && (flags & FAULT_FLAG_USER) &&
-- 
2.25.1

