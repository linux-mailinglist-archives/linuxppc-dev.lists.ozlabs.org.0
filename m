Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E52B1F3491
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:00:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1Gq3L2qzDqgx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:00:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzpk1dprzDqQ9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:54:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzpj2hTvz9sSy; Tue,  9 Jun 2020 15:54:37 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200429065654.1677541-1-npiggin@gmail.com>
References: <20200429065654.1677541-1-npiggin@gmail.com>
Subject: Re: [PATCH 0/6] assorted kuap fixes (try again)
Message-Id: <159168204459.1390886.2921769537793968560.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:54:37 +1000 (AEST)
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

On Wed, 29 Apr 2020 16:56:48 +1000, Nicholas Piggin wrote:
> Well the last series was a disaster, I'll try again sending the
> patches with proper subject and changelogs written.
> 
> Nicholas Piggin (6):
>   powerpc/64/kuap: move kuap checks out of MSR[RI]=0 regions of exit
>     code
>   powerpc/64s/kuap: kuap_restore missing isync
>   powerpc/64/kuap: interrupt exit conditionally restore AMR
>   powerpc/64s/kuap: restore AMR in system reset exception
>   powerpc/64s/kuap: restore AMR in fast_interrupt_return
>   powerpc/64s/kuap: conditionally restore AMR in kuap_restore_amr asm
> 
> [...]

Patches 2, 3 and 6 applied to powerpc/next.

[2/6] powerpc/64s/kuap: Add missing isync to KUAP restore paths
      https://git.kernel.org/powerpc/c/cb2b53cbffe3c388cd676b63f34e54ceb2643ae2
[3/6] powerpc/64/kuap: Conditionally restore AMR in interrupt exit
      https://git.kernel.org/powerpc/c/579940bb451c2dd33396d2d56ce6ef5d92154b3b
[6/6] powerpc/64s/kuap: Conditionally restore AMR in kuap_restore_amr asm
      https://git.kernel.org/powerpc/c/d4539074b0e9c5fa6508e8c33aaf51abc8ff6e91

cheers
