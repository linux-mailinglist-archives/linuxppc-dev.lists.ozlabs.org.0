Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8CD18D0D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 17:37:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450HXR5XbHzDqSS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 01:37:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450HTb0tT8zDqDy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 01:34:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 450HTZ6g5Mz9s9T; Fri, 10 May 2019 01:34:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 450HTZ5qp6z9sBV; Fri, 10 May 2019 01:34:58 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 8150a153c013aa2dd1ffae43370b89ac1347a7fb
X-Patchwork-Hint: ignore
In-Reply-To: <20190508123047.10217-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Use early_mmu_has_feature() in set_kuap()
Message-Id: <450HTZ5qp6z9sBV@ozlabs.org>
Date: Fri, 10 May 2019 01:34:58 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-05-08 at 12:30:47 UTC, Michael Ellerman wrote:
> When implementing the KUAP support on Radix we fixed one case where
> mmu_has_feature() was being called too early in boot via
> __put_user_size().
> 
> However since then some new code in linux-next has created a new path
> via which we can end up calling mmu_has_feature() too early.
> 
> On P9 this leads to crashes early in boot if we have both PPC_KUAP and
> CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG enabled. Our early boot code
> calls printk() which calls probe_kernel_read(), that does a
> __copy_from_user_inatomic() which calls into set_kuap() and that uses
> mmu_has_feature().
> 
> At that point in boot we haven't patched MMU features yet so the debug
> code in mmu_has_feature() complains, and calls printk(). At that point
> we recurse, eg:
> 
>   ...
>   dump_stack+0xdc
>   probe_kernel_read+0x1a4
>   check_pointer+0x58
>   ...
>   printk+0x40
>   dump_stack_print_info+0xbc
>   dump_stack+0x8
>   probe_kernel_read+0x1a4
>   probe_kernel_read+0x19c
>   check_pointer+0x58
>   ...
>   printk+0x40
>   cpufeatures_process_feature+0xc8
>   scan_cpufeatures_subnodes+0x380
>   of_scan_flat_dt_subnodes+0xb4
>   dt_cpu_ftrs_scan_callback+0x158
>   of_scan_flat_dt+0xf0
>   dt_cpu_ftrs_scan+0x3c
>   early_init_devtree+0x360
>   early_setup+0x9c
> 
> And so on for infinity, symptom is a dead system.
> 
> Even more fun is what happens when using the hash MMU (ie. p8 or p9
> with Radix disabled), and when we don't have
> CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG enabled. With the debug disabled
> we don't check if static keys have been initialised, we just rely on
> the jump label. But the jump label defaults to true so we just whack
> the AMR even though Radix is not enabled.
> 
> Clearing the AMR is fine, but after we've done the user copy we write
> (0b11 << 62) into AMR. When using hash that makes all pages with key
> zero no longer readable or writable. All kernel pages implicitly have
> key zero, and so all of a sudden the kernel can't read or write any of
> its memory. Again dead system.
> 
> In the medium term we have several options for fixing this.
> probe_kernel_read() doesn't need to touch AMR at all, it's not doing a
> user access after all, but it uses __copy_from_user_inatomic() just
> because it's easy, we could fix that.
> 
> It would also be safe to default to not writing to the AMR during
> early boot, until we've detected features. But it's not clear that
> flipping all the MMU features to static_key_false won't introduce
> other bugs.
> 
> But for now just switch to early_mmu_has_feature() in set_kuap(), that
> avoids all the problems with jump labels. It adds the overhead of a
> global lookup and test, but that's probably trivial compared to the
> writes to the AMR anyway.
> 
> Fixes: 890274c2dc4c ("powerpc/64s: Implement KUAP for Radix MMU")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Reviewed-by: Russell Currey <ruscur@russell.cc>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/8150a153c013aa2dd1ffae43370b89ac

cheers
