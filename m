Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D431E470A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 17:09:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XDlJ166wzDqS6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 01:09:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XDWC5NgPzDqHW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 00:59:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MbHk9+Vf; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49XDW01ztbz9sT3; Thu, 28 May 2020 00:59:08 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49XDVz03BKz9sTR; Thu, 28 May 2020 00:59:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590591547;
 bh=BvWiH6DJ6bg3iEE5caKgNywjq4d7ySljM3mSfKfv6R0=;
 h=From:To:Cc:Subject:Date:From;
 b=MbHk9+VfvAQiEkaEVHPFIlGU3YCCtvd9Wa1nZIDqzH6+FMSoIwDJG8TczUOj1s4T1
 LmojhInu+t4y8b/1J8w5W/CY6PhiiuNriHirwfuI64toyDUPCrC9xpfbUrc8kf+Dqr
 T5ISxe2AqU8NyTiyFUOO2y/J1e73hIMJX0QWzyq7bjkIW+0n/S9BUCqlyYgwzLsuCw
 oY7jR6eV0PAsmuKtzTzHorOItn+f1iUBkgTLwcaELocK7f/noNBychrmTpSS5mphQR
 T6boOHb+D31836ptInnIw6dVHfLqj1ynvSLh9j/QD7DYKQOS8qGYf0i8NJ+I/MCokC
 aM77Ae/Iyfs/w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [RFC PATCH 1/4] powerpc/64s: Don't init FSCR_DSCR in __init_FSCR()
Date: Thu, 28 May 2020 00:58:40 +1000
Message-Id: <20200527145843.2761782-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: alistair@popple.id.au, mikey@neuling.org, npiggin@gmail.com,
 jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__init_FSCR() was added originally in commit 2468dcf641e4 ("powerpc:
Add support for context switching the TAR register") (Feb 2013), and
only set FSCR_TAR.

At that point FSCR (Facility Status and Control Register) was not
context switched, so the setting was permanent after boot.

Later we added initialisation of FSCR_DSCR to __init_FSCR(), in commit
54c9b2253d34 ("powerpc: Set DSCR bit in FSCR setup") (Mar 2013), again
that was permanent after boot.

Then commit 2517617e0de6 ("powerpc: Fix context switch DSCR on
POWER8") (Aug 2013) added a limited context switch of FSCR, just the
FSCR_DSCR bit was context switched based on thread.dscr_inherit. That
commit said "This clears the H/FSCR DSCR bit initially", but it
didn't, it left the initialisation of FSCR_DSCR in __init_FSCR().
However the initial context switch from init_task to pid 1 would clear
FSCR_DSCR because thread.dscr_inherit was 0.

That commit also introduced the requirement that FSCR_DSCR be clear
for user processes, so that we can take the facility unavailable
interrupt in order to manage dscr_inherit.

Then in commit 152d523e6307 ("powerpc: Create context switch helpers
save_sprs() and restore_sprs()") (Dec 2015) FSCR was added to
thread_struct. However it still wasn't fully context switched, we just
took the existing value and set FSCR_DSCR if the new thread had
dscr_inherit set. FSCR was still initialised at boot to FSCR_DSCR |
FSCR_TAR, but that value was not propagated into the thread_struct, so
the initial context switch set FSCR_DSCR back to 0.

Finally commit b57bd2de8c6c ("powerpc: Improve FSCR init and context
switching") (Jun 2016) added a full context switch of the FSCR, and
added an initialisation of init_task.thread.fscr to FSCR_TAR |
FSCR_EBB, but omitted FSCR_DSCR.

The end result is that swapper runs with FSCR_DSCR set because of the
initialisation in __init_FSCR(), but no other processes do, they use
the value from init_task.thread.fscr.

Having FSCR_DSCR set for swapper allows it to access SPR 3 from
userspace, but swapper never runs userspace, so it has no useful
effect. It's also confusing to have the value initialised in two
places to two different values.

So remove FSCR_DSCR from __init_FSCR(), this at least gets us to the
point where there's a single value of FSCR, even if it's still set in
two places.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/cpu_setup_power.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
index a460298c7ddb..f91ecb10d0ae 100644
--- a/arch/powerpc/kernel/cpu_setup_power.S
+++ b/arch/powerpc/kernel/cpu_setup_power.S
@@ -184,7 +184,7 @@ _GLOBAL(__restore_cpu_power9)
 
 __init_FSCR:
 	mfspr	r3,SPRN_FSCR
-	ori	r3,r3,FSCR_TAR|FSCR_DSCR|FSCR_EBB
+	ori	r3,r3,FSCR_TAR|FSCR_EBB
 	mtspr	SPRN_FSCR,r3
 	blr
 
-- 
2.25.1

