Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 433CC493936
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 12:07:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jf2sQ1YdBz30jP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 22:07:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jf2rf62L5z30Nd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 22:06:26 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jf2rd34Tcz4y3t;
 Wed, 19 Jan 2022 22:06:25 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <247e01e0e10f4dbc59b5ff89e81702eb1ee7641e.1641828571.git.christophe.leroy@csgroup.eu>
References: <247e01e0e10f4dbc59b5ff89e81702eb1ee7641e.1641828571.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/time: Fix build failure due to
 do_hard_irq_enable() on PPC32
Message-Id: <164259036177.3588160.5245172703887799778.b4-ty@ellerman.id.au>
Date: Wed, 19 Jan 2022 22:06:01 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 10 Jan 2022 15:29:53 +0000, Christophe Leroy wrote:
> 	  CC      arch/powerpc/kernel/time.o
> 	In file included from <command-line>:
> 	./arch/powerpc/include/asm/hw_irq.h: In function 'do_hard_irq_enable':
> 	././include/linux/compiler_types.h:335:45: error: call to '__compiletime_assert_35' declared with attribute error: BUILD_BUG failed
> 	  335 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> 	      |                                             ^
> 	././include/linux/compiler_types.h:316:25: note: in definition of macro '__compiletime_assert'
> 	  316 |                         prefix ## suffix();                             \
> 	      |                         ^~~~~~
> 	././include/linux/compiler_types.h:335:9: note: in expansion of macro '_compiletime_assert'
> 	  335 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> 	      |         ^~~~~~~~~~~~~~~~~~~
> 	./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
> 	   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
> 	      |                                     ^~~~~~~~~~~~~~~~~~
> 	./include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
> 	   59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
> 	      |                     ^~~~~~~~~~~~~~~~
> 	./arch/powerpc/include/asm/hw_irq.h:483:9: note: in expansion of macro 'BUILD_BUG'
> 	  483 |         BUILD_BUG();
> 	      |         ^~~~~~~~~
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/time: Fix build failure due to do_hard_irq_enable() on PPC32
      https://git.kernel.org/powerpc/c/87b9d74fb0be80054c729e8d6a119ca0955cedf3

cheers
