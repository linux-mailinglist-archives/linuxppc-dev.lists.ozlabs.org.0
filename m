Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4594A1D13ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 15:03:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MZcF3ZcTzDqWk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 23:03:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MZ9G3TGSzDqgZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 22:43:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49MZ9G0qt9z9sSs; Wed, 13 May 2020 22:43:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20200429062607.1675792-1-npiggin@gmail.com>
References: <20200429062607.1675792-1-npiggin@gmail.com>
Subject: Re: [PATCH 0/6] assorted kuap fixes
Message-Id: <158937375708.3526905.9247302215282441299.b4-ty@ellerman.id.au>
Date: Wed, 13 May 2020 22:43:45 +1000 (AEST)
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

On Wed, 29 Apr 2020 16:26:00 +1000, Nicholas Piggin wrote:
> Here's a bunch of fixes I collected, and some that Aneesh needs for
> his kuap on hash series.
> 
> Nicholas Piggin (6):
>   powerpc/64/kuap: move kuap checks out of MSR[RI]=0 regions of exit
>     code
>   missing isync
>   powerpc/64/kuap: interrupt exit kuap restore add missing isync,
>     conditionally restore AMR
>   rpc/64/kuap: restore AMR in system reset exception
>   powerpc/64/kuap: restore AMR in fast_interrupt_return
>   powerpc/64/kuap: conditionally restore AMR in kuap_restore_amr asm
> 
> [...]

Patches 1, 4 and 5 applied to powerpc/fixes.

[1/6] powerpc/64/kuap: Move kuap checks out of MSR[RI]=0 regions of exit code
      https://git.kernel.org/powerpc/c/c0d7dcf89e5151b2259d1c2c1b922da3b881d02e
[4/6] powerpc/64s/kuap: Restore AMR in system reset exception
      https://git.kernel.org/powerpc/c/53459dc9709db2141d784702abbd43e8fcac8e6d
[5/6] powerpc/64s/kuap: Restore AMR in fast_interrupt_return
      https://git.kernel.org/powerpc/c/c44dc6323cd49d8d742c37e234b952e822c35de4

cheers
