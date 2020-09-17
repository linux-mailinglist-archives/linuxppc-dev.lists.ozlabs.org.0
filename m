Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECEA26DB98
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:32:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsbvX3lx5zDqKX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 22:32:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZVB40lxzDqWr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:28:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BsZV71R3lz9sTq; Thu, 17 Sep 2020 21:28:47 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZV70C6Jz9sTp; Thu, 17 Sep 2020 21:28:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200908125850.407939-1-mpe@ellerman.id.au>
References: <20200908125850.407939-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Make VDSO32 track COMPAT on 64-bit
Message-Id: <160034211494.3342081.16977957933269532766.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:28:46 +1000 (AEST)
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
Cc: christophe.leroy@c-s.fr, msuchanek@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 8 Sep 2020 22:58:50 +1000, Michael Ellerman wrote:
> When we added the VDSO32 kconfig symbol, which controls building of
> the 32-bit VDSO, we made it depend on CPU_BIG_ENDIAN (for 64-bit).
> 
> That was because back then COMPAT was always enabled for 64-bit, so
> depending on it would have left the 32-bit VDSO always enabled, which
> we didn't want.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64: Make VDSO32 track COMPAT on 64-bit
      https://git.kernel.org/powerpc/c/231b232df8f67e7d37af01259c21f2a131c3911e

cheers
