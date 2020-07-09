Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA618219D26
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 12:12:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2X6J1gGhzDqvT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 20:12:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2X2g3QxFzDqys
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 20:09:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kxRBUjVz; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2X2f6tyhz9sSd;
 Thu,  9 Jul 2020 20:09:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594289355;
 bh=B+pvOdRR00uR6MW/d9Tg/MIy1GpvfDv7HP5aB55eLMw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kxRBUjVzQLmCVjdHJKK+OcMHo6neU1RQex6N/x2BrSSEzz8iH/g7k4DoVMlUhjVk7
 qjlMzJqNzIPeCAL4m8bkMuCl1Dr7W0UwucYzh02G9a/78uSyNSp/rFzURUfJIof5xH
 rvrxbDJUq5MJV/BQwK0VcLmyEvCImjHGLb+/cWWbDQYBeOaA4oQ2CL3X3APXF6/y2J
 D2L/vyTlEu1jwKOp2V1ztZHSpC9pxYI9LfxuGcgX3zR3P6RAS/67QId4q+XfV3yQtt
 K7ocKhOlTOWEa7eB+mqmgAgCqXAnWX3PTuHX9vuE8pgXODpslKd4pTMDt2KQ2hnq7g
 Rlwx0t1IcWGFQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 2/6] powerpc/pseries: move some PAPR paravirt functions
 to their own file
In-Reply-To: <20200706043540.1563616-3-npiggin@gmail.com>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-3-npiggin@gmail.com>
Date: Thu, 09 Jul 2020 20:11:29 +1000
Message-ID: <87d055vvzi.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
>

Little bit of changelog would be nice :D

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/paravirt.h | 61 +++++++++++++++++++++++++++++
>  arch/powerpc/include/asm/spinlock.h | 24 +-----------
>  arch/powerpc/lib/locks.c            | 12 +++---
>  3 files changed, 68 insertions(+), 29 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/paravirt.h
>
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> new file mode 100644
> index 000000000000..7a8546660a63
> --- /dev/null
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __ASM_PARAVIRT_H
> +#define __ASM_PARAVIRT_H

Should be _ASM_POWERPC_PARAVIRT_H

> +#ifdef __KERNEL__

We shouldn't need __KERNEL__ in here, it's not a uapi header.

cheers
