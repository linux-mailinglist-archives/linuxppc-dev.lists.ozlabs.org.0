Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F2D227EF6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 13:31:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9xJ83WS9zDqgd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 21:31:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9xFd3Jh1zDqKf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:29:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=l8QwmzmJ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9xFZ6Yzrz9sPB;
 Tue, 21 Jul 2020 21:29:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595330964;
 bh=rlN1Cce8b0CQsDc9u2pbHYeec/MUaj2J80Je4YYp3N0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=l8QwmzmJ9NMwAkWwccucywdED9lK7jbu31q599RUXtk+Sx07djikGJvct4yzy7F3a
 JBsb3BrMuucwCNOs/qWsMHcnmADr7PenqXQ687uNAIq+qbYHkIw9+Yx7kvYvBqdSRm
 oRQgRehjZEdLw47uK1918mMHD2fmA+yp7Gqj0c2+1U9Ftg0iynmZC0AGgWQdoUJUE/
 P6TXQZJvV3hp9NvqRv2UHr65U/FruUuVNzKBdCzFJvbwLhdih0mv62zZ7kWmwdA3vW
 yLkBNXYnvqG2UiTzVZFj1SJtrVXtRHloTw+sunU30bb5TfmOb+Kcb/yEXsmzKYXJQg
 wwrhXNkr+yV+w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v4 05/10] powerpc/dt_cpu_ftrs: Add feature for 2nd DAWR
In-Reply-To: <c34b1a66-2db6-c97a-1782-0d473c758502@linux.ibm.com>
References: <20200717040958.70561-1-ravi.bangoria@linux.ibm.com>
 <20200717040958.70561-6-ravi.bangoria@linux.ibm.com>
 <CACzsE9oE+OMnWEXvbZZbq35YzpSzCbBHWEJcjtCgkcq-YrABng@mail.gmail.com>
 <c34b1a66-2db6-c97a-1782-0d473c758502@linux.ibm.com>
Date: Tue, 21 Jul 2020 21:29:21 +1000
Message-ID: <87mu3trtri.fsf@mpe.ellerman.id.au>
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
> On 7/17/20 11:14 AM, Jordan Niethe wrote:
>> On Fri, Jul 17, 2020 at 2:10 PM Ravi Bangoria
>> <ravi.bangoria@linux.ibm.com> wrote:
>>>
>>> Add new device-tree feature for 2nd DAWR. If this feature is present,
>>> 2nd DAWR is supported, otherwise not.
>>>
>>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>>> ---
>>>   arch/powerpc/include/asm/cputable.h | 7 +++++--
>>>   arch/powerpc/kernel/dt_cpu_ftrs.c   | 7 +++++++
>>>   2 files changed, 12 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
>>> index e506d429b1af..3445c86e1f6f 100644
>>> --- a/arch/powerpc/include/asm/cputable.h
>>> +++ b/arch/powerpc/include/asm/cputable.h
>>> @@ -214,6 +214,7 @@ static inline void cpu_feature_keys_init(void) { }
>>>   #define CPU_FTR_P9_TLBIE_ERAT_BUG      LONG_ASM_CONST(0x0001000000000000)
>>>   #define CPU_FTR_P9_RADIX_PREFETCH_BUG  LONG_ASM_CONST(0x0002000000000000)
>>>   #define CPU_FTR_ARCH_31                        LONG_ASM_CONST(0x0004000000000000)
>>> +#define CPU_FTR_DAWR1                  LONG_ASM_CONST(0x0008000000000000)
>>>
>>>   #ifndef __ASSEMBLY__
>>>
>>> @@ -497,14 +498,16 @@ static inline void cpu_feature_keys_init(void) { }
>>>   #define CPU_FTRS_POSSIBLE      \
>>>              (CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | CPU_FTRS_POWER8 | \
>>>               CPU_FTR_ALTIVEC_COMP | CPU_FTR_VSX_COMP | CPU_FTRS_POWER9 | \
>>> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
>>> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
>>> +            CPU_FTR_DAWR1)
>>>   #else
>>>   #define CPU_FTRS_POSSIBLE      \
>>>              (CPU_FTRS_PPC970 | CPU_FTRS_POWER5 | \
>>>               CPU_FTRS_POWER6 | CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | \
>>>               CPU_FTRS_POWER8 | CPU_FTRS_CELL | CPU_FTRS_PA6T | \
>>>               CPU_FTR_VSX_COMP | CPU_FTR_ALTIVEC_COMP | CPU_FTRS_POWER9 | \
>>> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
>>> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
>>> +            CPU_FTR_DAWR1)

>> Instead of putting CPU_FTR_DAWR1 into CPU_FTRS_POSSIBLE should it go
>> into CPU_FTRS_POWER10?
>> Then it will be picked up by CPU_FTRS_POSSIBLE.
>
> I remember a discussion about this with Mikey and we decided to do it
> this way. Obviously, the purpose is to make CPU_FTR_DAWR1 independent of
> CPU_FTRS_POWER10 because DAWR1 is an optional feature in p10. I fear
> including CPU_FTR_DAWR1 in CPU_FTRS_POWER10 can make it forcefully enabled
> even when device-tree property is not present or pa-feature bit it not set,
> because we do:
>
>        {       /* 3.1-compliant processor, i.e. Power10 "architected" mode */
>                .pvr_mask               = 0xffffffff,
>                .pvr_value              = 0x0f000006,
>                .cpu_name               = "POWER10 (architected)",
>                .cpu_features           = CPU_FTRS_POWER10,

The pa-features logic will turn it off if the feature bit is not set.

So you should be able to put it in CPU_FTRS_POWER10.

See for example CPU_FTR_NOEXECUTE.

cheers
