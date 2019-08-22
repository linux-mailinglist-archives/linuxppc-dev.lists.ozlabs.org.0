Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 158F29954C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 15:41:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Dm073yp3zDqTJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 23:41:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DlGk64BszDrQ2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 23:09:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46DlGj1KgTz9sPQ; Thu, 22 Aug 2019 23:09:00 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 38a0d0cdb46d3f91534e5b9839ec2d67be14c59d
In-Reply-To: <86b72f0c134367b214910b27b9a6dd3321af93bb.1565774657.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/futex: fix warning: 'oldval' may be used
 uninitialized in this function
Message-Id: <46DlGj1KgTz9sPQ@ozlabs.org>
Date: Thu, 22 Aug 2019 23:09:00 +1000 (AEST)
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

On Wed, 2019-08-14 at 09:25:52 UTC, Christophe Leroy wrote:
> CC      kernel/futex.o
> kernel/futex.c: In function 'do_futex':
> kernel/futex.c:1676:17: warning: 'oldval' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    return oldval == cmparg;
>                  ^
> kernel/futex.c:1651:6: note: 'oldval' was declared here
>   int oldval, ret;
>       ^
> 
> This is because arch_futex_atomic_op_inuser() only sets *oval
> if ret is NUL and GCC doesn't see that it will use it only when
> ret is NUL.
> 
> Anyway, the non-NUL ret path is an error path that won't suffer from
> setting *oval, and as *oval is a local var in futex_atomic_op_inuser()
> it will have no impact.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/38a0d0cdb46d3f91534e5b9839ec2d67be14c59d

cheers
