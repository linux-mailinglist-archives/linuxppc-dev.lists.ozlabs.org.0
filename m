Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 503142C1980
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 00:41:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cg3ZM4FrJzDqM6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 10:41:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cg3X35nXHzDqKg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 10:39:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cg3X33gPhz9sSs; Tue, 24 Nov 2020 10:39:15 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
In-Reply-To: <20201123184016.693fe464@canb.auug.org.au>
References: <20201123184016.693fe464@canb.auug.org.au>
Subject: Re: linux-next: build failure in Linus' tree
Message-Id: <160617472873.1817800.16473753588453276266.b4-ty@ellerman.id.au>
Date: Tue, 24 Nov 2020 10:39:15 +1100 (AEDT)
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 23 Nov 2020 18:40:16 +1100, Stephen Rothwell wrote:
> After merging most of the trees, today's linux-next build (powerpc64
> allnoconfig) failed like this:
> 
> In file included from arch/powerpc/include/asm/kup.h:18,
>                  from arch/powerpc/include/asm/uaccess.h:9,
>                  from include/linux/uaccess.h:11,
>                  from include/linux/sched/task.h:11,
>                  from include/linux/sched/signal.h:9,
>                  from include/linux/rcuwait.h:6,
>                  from include/linux/percpu-rwsem.h:7,
>                  from include/linux/fs.h:33,
>                  from include/linux/compat.h:17,
>                  from arch/powerpc/kernel/asm-offsets.c:14:
> arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: warning: data definition has no type or storage class
>    66 | DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: error: type defaults to 'int' in declaration of 'DECLARE_STATIC_KEY_FALSE' [-Werror=implicit-int]
> arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: warning: parameter names (without types) in function declaration
> arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'prevent_user_access':
> arch/powerpc/include/asm/book3s/64/kup-radix.h:180:6: error: implicit declaration of function 'static_branch_unlikely' [-Werror=implicit-function-declaration]
>   180 |  if (static_branch_unlikely(&uaccess_flush_key))
>       |      ^~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/include/asm/book3s/64/kup-radix.h:180:30: error: 'uaccess_flush_key' undeclared (first use in this function)
>   180 |  if (static_branch_unlikely(&uaccess_flush_key))
>       |                              ^~~~~~~~~~~~~~~~~
> arch/powerpc/include/asm/book3s/64/kup-radix.h:180:30: note: each undeclared identifier is reported only once for each function it appears in
> arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'prevent_user_access_return':
> arch/powerpc/include/asm/book3s/64/kup-radix.h:189:30: error: 'uaccess_flush_key' undeclared (first use in this function)
>   189 |  if (static_branch_unlikely(&uaccess_flush_key))
>       |                              ^~~~~~~~~~~~~~~~~
> arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'restore_user_access':
> arch/powerpc/include/asm/book3s/64/kup-radix.h:198:30: error: 'uaccess_flush_key' undeclared (first use in this function)
>   198 |  if (static_branch_unlikely(&uaccess_flush_key) && flags == AMR_KUAP_BLOCKED)
>       |                              ^~~~~~~~~~~~~~~~~
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Fix allnoconfig build since uaccess flush
      https://git.kernel.org/powerpc/c/b6b79dd53082db11070b4368d85dd6699ff0b063

cheers
