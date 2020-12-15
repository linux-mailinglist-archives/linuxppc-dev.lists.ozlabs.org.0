Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2142DACCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 13:15:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwHJZ22GhzDqV9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 23:15:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFh16sSRzDqT2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 22:01:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFh153ckz9sRR; Tue, 15 Dec 2020 22:01:53 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201111110723.3148665-1-npiggin@gmail.com>
References: <20201111110723.3148665-1-npiggin@gmail.com>
Subject: Re: [PATCH 0/3] powerpc: convert to use ARCH_ATOMIC
Message-Id: <160803006828.517022.11653746040201770780.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 22:01:53 +1100 (AEDT)
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-arch@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 Nov 2020 21:07:20 +1000, Nicholas Piggin wrote:
> This conversion seems to require generic atomic64 changes, looks
> like nothing else uses ARCH_ATOMIC and GENERIC_ATOMIC64 yet.
> 
> Thanks,
> Nick
> 
> Nicholas Piggin (3):
>   asm-generic/atomic64: Add support for ARCH_ATOMIC
>   powerpc/64s/iommu: don't use atomic_ function on atomic64_t type
>   powerpc: rewrite atomics to use ARCH_ATOMIC
> 
> [...]

Patch 2 applied to powerpc/next.

[2/3] powerpc/64s/iommu: Don't use atomic_ function on atomic64_t type
      https://git.kernel.org/powerpc/c/c33cd1ed60013ec2ae50f91fed260def5f1d9851

cheers
