Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA599156447
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 13:53:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48FBtq4N3mzDqXR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 23:53:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48FBpP6JkkzDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2020 23:50:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 48FBpN4rRLz9sPK; Sat,  8 Feb 2020 23:50:04 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48FBpN38XHz9sRR; Sat,  8 Feb 2020 23:50:04 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 9dc086f1e9ef39dd823bd27954b884b2062f9e70
In-Reply-To: <20200207122145.11928-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/futex: Fix incorrect user access blocking
Message-Id: <48FBpN38XHz9sRR@ozlabs.org>
Date: Sat,  8 Feb 2020 23:50:04 +1100 (AEDT)
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

On Fri, 2020-02-07 at 12:21:45 UTC, Michael Ellerman wrote:
> The early versions of our kernel user access prevention (KUAP) were
> written by Russell and Christophe, and didn't have separate
> read/write access.
> 
> At some point I picked up the series and added the read/write access,
> but I failed to update the usages in futex.h to correctly allow read
> and write.
> 
> However we didn't notice because of another bug which was causing the
> low-level code to always enable read and write. That bug was fixed
> recently in commit 1d8f739b07bd ("powerpc/kuap: Fix set direction in
> allow/prevent_user_access()").
> 
> futex_atomic_cmpxchg_inatomic() is passed the user address as %3 and
> does:
> 
>   1:     lwarx   %1,  0, %3
>          cmpw    0,  %1, %4
>          bne-    3f
>   2:     stwcx.  %5,  0, %3
> 
> Which clearly loads and stores from/to %3. The logic in
> arch_futex_atomic_op_inuser() is similar, so fix both of them to use
> allow_read_write_user().
> 
> Without this fix, and with PPC_KUAP_DEBUG=y, we see eg:
> 
>   Bug: Read fault blocked by AMR!
>   WARNING: CPU: 94 PID: 149215 at arch/powerpc/include/asm/book3s/64/kup-radix.h:126 __do_page_fault+0x600/0xf30
>   CPU: 94 PID: 149215 Comm: futex_requeue_p Tainted: G        W         5.5.0-rc7-gcc9x-g4c25df5640ae #1
>   ...
>   NIP [c000000000070680] __do_page_fault+0x600/0xf30
>   LR [c00000000007067c] __do_page_fault+0x5fc/0xf30
>   Call Trace:
>   [c00020138e5637e0] [c00000000007067c] __do_page_fault+0x5fc/0xf30 (unreliable)
>   [c00020138e5638c0] [c00000000000ada8] handle_page_fault+0x10/0x30
>   --- interrupt: 301 at cmpxchg_futex_value_locked+0x68/0xd0
>       LR = futex_lock_pi_atomic+0xe0/0x1f0
>   [c00020138e563bc0] [c000000000217b50] futex_lock_pi_atomic+0x80/0x1f0 (unreliable)
>   [c00020138e563c30] [c00000000021b668] futex_requeue+0x438/0xb60
>   [c00020138e563d60] [c00000000021c6cc] do_futex+0x1ec/0x2b0
>   [c00020138e563d90] [c00000000021c8b8] sys_futex+0x128/0x200
>   [c00020138e563e20] [c00000000000b7ac] system_call+0x5c/0x68
> 
> Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace Access Protection")
> Cc: stable@vger.kernel.org # v5.2+
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc fixes.

https://git.kernel.org/powerpc/c/9dc086f1e9ef39dd823bd27954b884b2062f9e70

cheers
