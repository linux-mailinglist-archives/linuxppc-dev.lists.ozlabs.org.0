Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F8D23BB48
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 15:41:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLbX26tpSzDqVQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 23:41:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLbRH5kPnzDqZV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 23:37:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BLbRF6vD8z9sRR; Tue,  4 Aug 2020 23:37:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BLbRF4ydNz9sTC; Tue,  4 Aug 2020 23:37:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200804130558.292328-1-mpe@ellerman.id.au>
References: <20200804130558.292328-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Fix circular dependency between percpu.h and
 mmu.h
Message-Id: <159654825386.315897.14596141589699037963.b4-ty@ellerman.id.au>
Date: Tue,  4 Aug 2020 23:37:45 +1000 (AEST)
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
Cc: sfr@canb.auug.org.au, w@1wt.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Aug 2020 23:05:58 +1000, Michael Ellerman wrote:
> Recently random.h started including percpu.h (see commit
> f227e3ec3b5c ("random32: update the net random state on interrupt and
> activity")), which broke corenet64_smp_defconfig:
> 
>   In file included from /linux/arch/powerpc/include/asm/paca.h:18,
>                    from /linux/arch/powerpc/include/asm/percpu.h:13,
>                    from /linux/include/linux/random.h:14,
>                    from /linux/lib/uuid.c:14:
>   /linux/arch/powerpc/include/asm/mmu.h:139:22: error: unknown type name 'next_tlbcam_idx'
>     139 | DECLARE_PER_CPU(int, next_tlbcam_idx);
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Fix circular dependency between percpu.h and mmu.h
      https://git.kernel.org/powerpc/c/0c83b277ada72b585e6a3e52b067669df15bcedb

cheers
