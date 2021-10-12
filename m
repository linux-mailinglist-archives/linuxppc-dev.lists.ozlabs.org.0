Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B68FE429DAA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 08:25:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT5JD2HW4z3029
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 17:25:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f2eZZN4K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT5HZ3jHjz2xTC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 17:24:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=f2eZZN4K; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HT5HY6fjyz4xb9;
 Tue, 12 Oct 2021 17:24:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1634019898;
 bh=347ctPqhsS5IaLblCKv5phu1n7PGnyVqN5oJsZcxlUk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=f2eZZN4KOw1R8VYJk3QQTbeucJ85RyFTJUp0z6fgRGJ79Lh9XtSaWtvnaepFCN58N
 vCUggjmFvl+wjyv5vrn2LpJwXNyvDbDbSKryldqVZBZhlh5z9afWW5flVS8ZP9RUML
 Ev7MOS73ZC2hEada1xEXpEFU7cmt1W85gY2fKQ7ZSYT86xe0yX/vPtb6xBPB0YyKgt
 c6uR+Qb5EIwUoFecb/fZMw0+07ZqL9pPXht+PyHu3k7pP411bvcDRFXH99FtuVcF9c
 RsXKaAh/Q1tPGu0i4N72GL/R5QHyq21Dv2BtZ3jVzdOYs+aARERXnqILMmfK7xh6do
 Ra6CiM/fzOoYQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Liu Shixin <liushixin2@huawei.com>, Marco Elver <elver@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>
Subject: Re: [PATCH] powerpc: don't select KFENCE on platform PPC_FSL_BOOK3E
In-Reply-To: <77ce95e4-1af1-6536-5f0c-a573c648801a@huawei.com>
References: <20210924063927.1341241-1-liushixin2@huawei.com>
 <77ce95e4-1af1-6536-5f0c-a573c648801a@huawei.com>
Date: Tue, 12 Oct 2021 17:24:53 +1100
Message-ID: <87bl3u7oay.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Liu Shixin <liushixin2@huawei.com> writes:
> kindly ping.

I was under the impression you were trying to debug why it wasn't
working with Christophe.

cheers

> On 2021/9/24 14:39, Liu Shixin wrote:
>> On platform PPC_FSL_BOOK3E, all lowmem is managed by tlbcam. That means
>> we didn't really map the kfence pool with page granularity. Therefore,
>> if KFENCE is enabled, the system will hit the following panic:
>>
>>     BUG: Kernel NULL pointer dereference on read at 0x00000000
>>     Faulting instruction address: 0xc01de598
>>     Oops: Kernel access of bad area, sig: 11 [#1]
>>     BE PAGE_SIZE=4K SMP NR_CPUS=4 MPC8544 DS
>>     Dumping ftrace buffer:
>>        (ftrace buffer empty)
>>     Modules linked in:
>>     CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.12.0-rc3+ #298
>>     NIP:  c01de598 LR: c08ae9c4 CTR: 00000000
>>     REGS: c0b4bea0 TRAP: 0300   Not tainted  (5.12.0-rc3+)
>>     MSR:  00021000 <CE,ME>  CR: 24000228  XER: 20000000
>>     DEAR: 00000000 ESR: 00000000
>>     GPR00: c08ae9c4 c0b4bf60 c0ad64e0 ef720000 00021000 00000000 00000000 00000200
>>     GPR08: c0ad5000 00000000 00000000 00000004 00000000 008fbb30 00000000 00000000
>>     GPR16: 00000000 00000000 00000000 00000000 c0000000 00000000 00000000 00000000
>>     GPR24: c08ca004 c08ca004 c0b6a0e0 c0b60000 c0b58f00 c0850000 c08ca000 ef720000
>>     NIP [c01de598] kfence_protect+0x44/0x6c
>>     LR [c08ae9c4] kfence_init+0xfc/0x2a4
>>     Call Trace:
>>     [c0b4bf60] [efffe160] 0xefffe160 (unreliable)
>>     [c0b4bf70] [c08ae9c4] kfence_init+0xfc/0x2a4
>>     [c0b4bfb0] [c0894d3c] start_kernel+0x3bc/0x574
>>     [c0b4bff0] [c0000470] set_ivor+0x14c/0x188
>>     Instruction dump:
>>     7c0802a6 8109d594 546a653a 90010014 54630026 39200000 7d48502e 2c0a0000
>>     41820010 554a0026 5469b53a 7d295214 <81490000> 38831000 554a003c 91490000
>>     random: get_random_bytes called from print_oops_end_marker+0x40/0x78 with crng_init=0
>>     ---[ end trace 0000000000000000 ]---
>>
>> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
>> ---
>>  arch/powerpc/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index d46db0bfb998..cffd57bcb5e4 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -185,7 +185,7 @@ config PPC
>>  	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
>>  	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
>>  	select HAVE_ARCH_KGDB
>> -	select HAVE_ARCH_KFENCE			if PPC32
>> +	select HAVE_ARCH_KFENCE			if PPC32 && !PPC_FSL_BOOK3E
>>  	select HAVE_ARCH_MMAP_RND_BITS
>>  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
>>  	select HAVE_ARCH_NVRAM_OPS
