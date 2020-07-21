Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEE22281AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 16:10:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB0pr5zH5zDqgC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 00:09:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB0lr30LZzDqJ7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 00:07:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SaAY7VXP; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BB0ll6WTvz9sPB;
 Wed, 22 Jul 2020 00:07:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595340439;
 bh=pEIZzV48lY9oMztWrQ5y0yoN1x11b53snuVDYzGP9yQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SaAY7VXP+8gsFiGhyvEZfA+oRA9StiLhZfuy+2pKRVNobM60s5ZrvgssW4zf9X62a
 MZVWmqNQd3ogXkhQzVYT2D6VyVqWKDqOTPUqeXt46kCvuhO/J2IMGdZCQAUUqN0SIL
 4dfQwOKoWzFqHPbN+FBeidh2+nu4W84rUbGweXJpIruRz3B4B0YQrtTDgf479Rar/y
 Viw/52UZYPrBmgsgdov8KvZxHChLO16wRqgypswzCaGIaVwaE290Pt0mbM8PutKM3/
 Xb8erB7zonG4Bzma/IFDuaXKb0iPg7coE2wqu+/YiWJI8VuHLFsB4OK2ql0qU6+xD9
 nx9GykCYcRn6A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v4 05/10] powerpc/dt_cpu_ftrs: Add feature for 2nd DAWR
In-Reply-To: <62daa2d1-4e11-dcc1-cb1d-805ee4a156e0@linux.ibm.com>
References: <20200717040958.70561-1-ravi.bangoria@linux.ibm.com>
 <20200717040958.70561-6-ravi.bangoria@linux.ibm.com>
 <CACzsE9oE+OMnWEXvbZZbq35YzpSzCbBHWEJcjtCgkcq-YrABng@mail.gmail.com>
 <c34b1a66-2db6-c97a-1782-0d473c758502@linux.ibm.com>
 <87mu3trtri.fsf@mpe.ellerman.id.au>
 <62daa2d1-4e11-dcc1-cb1d-805ee4a156e0@linux.ibm.com>
Date: Wed, 22 Jul 2020 00:07:15 +1000
Message-ID: <87d04prmgc.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, apopple@linux.ibm.com,
 mikey@neuling.org, miltonm@us.ibm.com, peterz@infradead.org,
 fweisbec@gmail.com, oleg@redhat.com, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 jolsa@kernel.org, pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ravi Bangoria <ravi.bangoria@linux.ibm.com> writes:
> On 7/21/20 4:59 PM, Michael Ellerman wrote:
>> Ravi Bangoria <ravi.bangoria@linux.ibm.com> writes:
>>> On 7/17/20 11:14 AM, Jordan Niethe wrote:
>>>> On Fri, Jul 17, 2020 at 2:10 PM Ravi Bangoria
>>>> <ravi.bangoria@linux.ibm.com> wrote:
>>>>>
>>>>> Add new device-tree feature for 2nd DAWR. If this feature is present,
>>>>> 2nd DAWR is supported, otherwise not.
>>>>>
>>>>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>>>>> ---
>>>>>    arch/powerpc/include/asm/cputable.h | 7 +++++--
>>>>>    arch/powerpc/kernel/dt_cpu_ftrs.c   | 7 +++++++
>>>>>    2 files changed, 12 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
>>>>> index e506d429b1af..3445c86e1f6f 100644
>>>>> --- a/arch/powerpc/include/asm/cputable.h
>>>>> +++ b/arch/powerpc/include/asm/cputable.h
>>>>> @@ -214,6 +214,7 @@ static inline void cpu_feature_keys_init(void) { }
>>>>>    #define CPU_FTR_P9_TLBIE_ERAT_BUG      LONG_ASM_CONST(0x0001000000000000)
>>>>>    #define CPU_FTR_P9_RADIX_PREFETCH_BUG  LONG_ASM_CONST(0x0002000000000000)
>>>>>    #define CPU_FTR_ARCH_31                        LONG_ASM_CONST(0x0004000000000000)
>>>>> +#define CPU_FTR_DAWR1                  LONG_ASM_CONST(0x0008000000000000)
>>>>>
>>>>>    #ifndef __ASSEMBLY__
>>>>>
>>>>> @@ -497,14 +498,16 @@ static inline void cpu_feature_keys_init(void) { }
>>>>>    #define CPU_FTRS_POSSIBLE      \
>>>>>               (CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | CPU_FTRS_POWER8 | \
>>>>>                CPU_FTR_ALTIVEC_COMP | CPU_FTR_VSX_COMP | CPU_FTRS_POWER9 | \
>>>>> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
>>>>> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
>>>>> +            CPU_FTR_DAWR1)
>>>>>    #else
>>>>>    #define CPU_FTRS_POSSIBLE      \
>>>>>               (CPU_FTRS_PPC970 | CPU_FTRS_POWER5 | \
>>>>>                CPU_FTRS_POWER6 | CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | \
>>>>>                CPU_FTRS_POWER8 | CPU_FTRS_CELL | CPU_FTRS_PA6T | \
>>>>>                CPU_FTR_VSX_COMP | CPU_FTR_ALTIVEC_COMP | CPU_FTRS_POWER9 | \
>>>>> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
>>>>> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
>>>>> +            CPU_FTR_DAWR1)
>> 
>>>> Instead of putting CPU_FTR_DAWR1 into CPU_FTRS_POSSIBLE should it go
>>>> into CPU_FTRS_POWER10?
>>>> Then it will be picked up by CPU_FTRS_POSSIBLE.
>>>
>>> I remember a discussion about this with Mikey and we decided to do it
>>> this way. Obviously, the purpose is to make CPU_FTR_DAWR1 independent of
>>> CPU_FTRS_POWER10 because DAWR1 is an optional feature in p10. I fear
>>> including CPU_FTR_DAWR1 in CPU_FTRS_POWER10 can make it forcefully enabled
>>> even when device-tree property is not present or pa-feature bit it not set,
>>> because we do:
>>>
>>>         {       /* 3.1-compliant processor, i.e. Power10 "architected" mode */
>>>                 .pvr_mask               = 0xffffffff,
>>>                 .pvr_value              = 0x0f000006,
>>>                 .cpu_name               = "POWER10 (architected)",
>>>                 .cpu_features           = CPU_FTRS_POWER10,
>> 
>> The pa-features logic will turn it off if the feature bit is not set.
>> 
>> So you should be able to put it in CPU_FTRS_POWER10.
>> 
>> See for example CPU_FTR_NOEXECUTE.
>
> Ah ok. scan_features() clears the feature if the bit is not set in
> pa-features. So it should work find for powervm. I'll verify the same
> thing happens in case of baremetal where we use cpu-features not
> pa-features. If it works in baremetal as well, will put it in
> CPU_FTRS_POWER10.

When we use DT CPU features we don't use CPU_FTRS_POWER10 at all.

We construct a cpu_spec from scratch with just the base set of features:

static struct cpu_spec __initdata base_cpu_spec = {
	.cpu_name		= NULL,
	.cpu_features		= CPU_FTRS_DT_CPU_BASE,


And then individual features are enabled via the device tree flags.

cheers
