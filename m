Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1933B57FEE6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 14:22:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrzhW0bJ4z3c6F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 22:22:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YXczojTg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrzgx5KClz306K
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 22:22:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YXczojTg;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lrzgp72QQz4x1N;
	Mon, 25 Jul 2022 22:22:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658751735;
	bh=cmz1y9U6BERShVkGWPBKfC1B5sFPBW9aAhvI41ZOn54=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YXczojTgkFwxQbPWFPF2zx7e5Mj9AdorE4+jm72bj1fgx/ryA4Y6bpJMaMVCN63zM
	 S09SEe3izkieyLY45msWqdI5sPDB4vjn7TEWKdh4lOmjdhBrKhVglBaJPvQzpfzXXY
	 h1oS95mapZD4oTBSy5Ny9EyD3LeR7yOwe6S7KHSeeZ15AH8eOCiiQ/D7cPkl/vE3nM
	 04C99ZtaqbgCUFmfDFDCsmppmfupiXjufeU8oE1RxQ/jYuTKTxRXoq9ysgHUioDPaN
	 ZXZL/6U9bsyWm/PxToK16Xg9f+i/68i2qRj9YV3xFvFweOaon0a0CIksqnkhjdLMyF
	 rXdugKMgVsldA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linuxppc-dev@lists.ozlabs.org, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 1/2] powerpc: drop dependency on <asm/machdep.h> in
 archrandom.h
In-Reply-To: <8735epd204.fsf@mpe.ellerman.id.au>
References: <20220723214537.2054208-1-yury.norov@gmail.com>
 <20220723214537.2054208-2-yury.norov@gmail.com>
 <8735epd204.fsf@mpe.ellerman.id.au>
Date: Mon, 25 Jul 2022 22:22:13 +1000
Message-ID: <87wnc1bcwa.fsf@mpe.ellerman.id.au>
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
Cc: Yury Norov <yury.norov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Yury Norov <yury.norov@gmail.com> writes:
>> archrandom.h includes <asm/machdep.h> to refer ppc_md. This causes
>> circular header dependency, if generic nodemask.h  includes random.h:
>>
>> In file included from include/linux/cred.h:16,
>>                  from include/linux/seq_file.h:13,
>>                  from arch/powerpc/include/asm/machdep.h:6,
>>                  from arch/powerpc/include/asm/archrandom.h:5,
>>                  from include/linux/random.h:109,
>>                  from include/linux/nodemask.h:97,
>>                  from include/linux/list_lru.h:12,
>>                  from include/linux/fs.h:13,
>>                  from include/linux/compat.h:17,
>>                  from arch/powerpc/kernel/asm-offsets.c:12:
>> include/linux/sched.h:1203:9: error: unknown type name 'nodemask_t'
>>  1203 |         nodemask_t                      mems_allowed;
>>       |         ^~~~~~~~~~
>>
>> Fix it by removing <asm/machdep.h> dependency from archrandom.h
>>
>> Signed-off-by: Yury Norov <yury.norov@gmail.com>
>> ---
>>  arch/powerpc/include/asm/archrandom.h |  9 +--------
>>  arch/powerpc/kernel/setup-common.c    | 11 +++++++++++
>>  2 files changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
>> index 9a53e29680f4..21def59ef1a6 100644
>> --- a/arch/powerpc/include/asm/archrandom.h
>> +++ b/arch/powerpc/include/asm/archrandom.h
>> @@ -4,7 +4,7 @@
>>  
>>  #ifdef CONFIG_ARCH_RANDOM
>>  
>> -#include <asm/machdep.h>
>> +bool __must_check arch_get_random_seed_long(unsigned long *v);
>>  
>>  static inline bool __must_check arch_get_random_long(unsigned long *v)
>>  {
>> @@ -16,13 +16,6 @@ static inline bool __must_check arch_get_random_int(unsigned int *v)
>>  	return false;
>>  }
>>  
>> -static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
>> -{
>> -	if (ppc_md.get_random_seed)
>> -		return ppc_md.get_random_seed(v);
>> -
>> -	return false;
>> -}
>
> I'd rather we didn't have to force this out of line.
>
> I think I see a different way to fix it, I'll just do some more build
> tests.

Of course my idea didn't work :}

So I'll just ack your patch for now, and maybe I can get the headers
cleaned up in future to allow it to be out-of-line again.

cheers
