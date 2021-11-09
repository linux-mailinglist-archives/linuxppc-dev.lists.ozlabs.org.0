Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 676AA44A1D0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 02:09:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hp8z928hwz3c6S
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 12:09:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fX34aeA5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hp8yY3MzWz2xBk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 12:09:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fX34aeA5; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hp8yY29P6z4xfd;
 Tue,  9 Nov 2021 12:09:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1636420165;
 bh=ZuGKCBySZKxkZrtRo+DH0Bhlb5cjlbDZLng4fqfchUE=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=fX34aeA5oGq4yB1DJJE2xwtfLPHheVWpUDxbSgXy3JS6TFxSgwJsgV3xE/1aG6/5N
 UmfEDxiWKoTvII4QRaOsAF3a/dq2KK/NxUj81f4YrrTVsjiuuaXk/iUHdPvAE7YOfy
 nXJ728y8ZPdC7/8y28jBc//SaUU81qEk1pIfoK1gkn58Kb0zmQSL+oQ5e10q4qB05x
 MlmWHOI363BgjE/6beMXzeK8CFkgUAjNR+2EJapfCLLZA8TyLfrvwASF+hMT313771
 JdLkR8CsG3IQ/vA9nXvL0XYRUnmy56QAADIq51pauZVGF7yh8m+URBEFWfwE7MBs75
 kOazJOUWsgSSw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/64s: introduce CONFIG_MAXSMP to test very large
 SMP
In-Reply-To: <1636379634.t1oqdo5jl5.astroid@bobo.none>
References: <20211105041132.1443767-1-npiggin@gmail.com>
 <87pmrb6ws6.fsf@mpe.ellerman.id.au>
 <1636379634.t1oqdo5jl5.astroid@bobo.none>
Date: Tue, 09 Nov 2021 12:09:24 +1100
Message-ID: <87v912m8xn.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Michael Ellerman's message of November 8, 2021 3:28 pm:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>> Similarly to x86, add MAXSMP that should help flush out problems with
>>> vary large SMP and other values associated with very big systems.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>  arch/powerpc/Kconfig                   | 8 ++++++++
>>>  arch/powerpc/platforms/Kconfig.cputype | 5 +++--
>>>  2 files changed, 11 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index b8f6185d3998..d585fcfa456f 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -64,6 +64,13 @@ config NEED_PER_CPU_EMBED_FIRST_CHUNK
>>>  config NEED_PER_CPU_PAGE_FIRST_CHUNK
>>>  	def_bool y if PPC64
>>>  
>>> +config MAXSMP
>>> +	bool "Enable Maximum number of SMP Processors and NUMA Nodes"
>>> +	depends on SMP && DEBUG_KERNEL && PPC_BOOK3S_64
>>> +	help
>>> +	  Enable maximum number of CPUS and NUMA Nodes for this architecture.
>>> +	  If unsure, say N.
>> 
>> As evidenced by the kernel robot report, I think we need to exclude this
>> from allyesconfig.
>> 
>> Because our max is 16K, larger than the 8K on x86, we are going to be
>> constantly hitting stack usage errors in driver code. Getting those
>> fixed tends to take time, because the driver authors don't see the
>> warnings when they build for other arches, and because the fixes go via
>> driver trees.
>
> Yeah I realised after I hit send. Surprisingly there weren't too many
> but agree going ahead of x86 would always come with annoyances and at
> least would have to fix existing tree.
>
>> Making MAXSMP depend on !COMPILE_TEST should do the trick.
>
> I'll do that. Or maybe make it 8192 if COMPILE_TEST otherwise 16384.

Yeah that could be OK.

> The reason for 16K is if we bump the deault at some point we might go to 
> 8K, in which case it would be good to have a test above it to catch
> marginal cases.

Yeah makes sense to have some head room.

cheers
