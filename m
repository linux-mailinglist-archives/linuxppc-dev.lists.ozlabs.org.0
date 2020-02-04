Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A07151A62
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 13:13:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BkBD5xn4zDq69
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 23:13:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BjwH18VQzDqLH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 23:01:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48BjwG5Y3xzB3wq; Tue,  4 Feb 2020 23:01:34 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 9933819099c4600b41a042f27a074470a43cf6b9
In-Reply-To: <6d02c3ae6ad77af34392e98117e44c2bf6d13ba1.1580121710.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/32s: Fix CPU wake-up from sleep mode
Message-Id: <48BjwG5Y3xzB3wq@ozlabs.org>
Date: Tue,  4 Feb 2020 23:01:34 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-01-27 at 10:42:04 UTC, Christophe Leroy wrote:
> Commit f7354ccac844 ("powerpc/32: Remove CURRENT_THREAD_INFO and
> rename TI_CPU") broke the CPU wake-up from sleep mode (i.e. when
> _TLF_SLEEPING is set) by delaying the tovirt(r2, r2).
> 
> This is because r2 is not restored by fast_exception_return. It used
> to work (by chance ?) because CPU wake-up interrupt never comes from
> user, so r2 is expected to point to 'current' on return.
> 
> Commit e2fb9f544431 ("powerpc/32: Prepare for Kernel Userspace Access
> Protection") broke it even more by clobbering r0 which is not
> restored by fast_exception_return either.
> 
> Use r6 instead of r0. This is possible because r3-r6 are restored by
> fast_exception_return and only r3-r5 are used for exception arguments.
> 
> For r2 it could be converted back to virtual address, but stay on the
> safe side and restore it from the stack instead. It should be live
> in the cache at that moment, so loading from the stack should make
> no difference compared to converting it from phys to virt.
> 
> Fixes: f7354ccac844 ("powerpc/32: Remove CURRENT_THREAD_INFO and rename TI_CPU")
> Fixes: e2fb9f544431 ("powerpc/32: Prepare for Kernel Userspace Access Protection")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/9933819099c4600b41a042f27a074470a43cf6b9

cheers
