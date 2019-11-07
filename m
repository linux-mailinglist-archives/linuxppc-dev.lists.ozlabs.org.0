Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E463F2620
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 04:49:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477qCP2C16zDqx2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 14:49:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477q732BnlzF5wV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 14:45:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 477q724L5sz9sR0; Thu,  7 Nov 2019 14:45:34 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 477q722xpkz9sR1; Thu,  7 Nov 2019 14:45:34 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a02cbc7ffe529ed58b6bbe54652104fc2c88bd77
In-Reply-To: <20191029095324.14669-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3] selftests/powerpc: Fixup clobbers for TM tests
Message-Id: <477q722xpkz9sR1@ozlabs.org>
Date: Thu,  7 Nov 2019 14:45:34 +1100 (AEDT)
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

On Tue, 2019-10-29 at 09:53:24 UTC, Michael Ellerman wrote:
> Some of our TM (Transactional Memory) tests, list "r1" (the stack
> pointer) as a clobbered register.
>
> GCC >= 9 doesn't accept this, and the build breaks:
>
>   ptrace-tm-spd-tar.c: In function 'tm_spd_tar':
>   ptrace-tm-spd-tar.c:31:2: error: listing the stack pointer register 'r1' in a clobber list is deprecated [-Werror=deprecated]
>      31 |  asm __volatile__(
>         |  ^~~
>   ptrace-tm-spd-tar.c:31:2: note: the value of the stack pointer after an 'asm' statement must be the same as it was before the statement
>
> We do have some fairly large inline asm blocks in these tests, and
> some of them do change the value of r1. However they should all return
> to C with the value in r1 restored, so I think it's legitimate to say
> r1 is not clobbered.
>
> As Segher points out, the r1 clobbers may have been added because of
> the use of `or 1,1,1`, however that doesn't actually clobber r1.
>
> Segher also points out that some of these tests do clobber LR, because
> they call functions, and that is not listed in the clobbers, so add
> that where appropriate.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Link: https://lore.kernel.org/r/20191014023043.2969-1-mpe@ellerman.id.au

Applied to powerpc next.

https://git.kernel.org/powerpc/c/a02cbc7ffe529ed58b6bbe54652104fc2c88bd77

cheers
