Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4FB3F27F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 09:54:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrYn809Xyz3ckr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 17:54:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrYmf74LYz2yMs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 17:53:51 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GrYmV3rRlz9sTr;
 Fri, 20 Aug 2021 09:53:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8Ffz9K-cCxD; Fri, 20 Aug 2021 09:53:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GrYmV2jCFz9sTj;
 Fri, 20 Aug 2021 09:53:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A2918B868;
 Fri, 20 Aug 2021 09:53:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GYJg-josgfgQ; Fri, 20 Aug 2021 09:53:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0AEB28B862;
 Fri, 20 Aug 2021 09:53:45 +0200 (CEST)
Subject: Re: [PATCH v2 57/63] powerpc/signal32: Use struct_group() to zero spe
 regs
To: Michael Ellerman <mpe@ellerman.id.au>, Kees Cook <keescook@chromium.org>, 
 linux-kernel@vger.kernel.org
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-58-keescook@chromium.org>
 <877dggeesw.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0f6e508e-62b6-3840-5ff4-eb5a77635bd1@csgroup.eu>
Date: Fri, 20 Aug 2021 09:53:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <877dggeesw.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: kernel test robot <lkp@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-block@vger.kernel.org,
 clang-built-linux@googlegroups.com, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-hardening@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/08/2021 à 09:49, Michael Ellerman a écrit :
> Kees Cook <keescook@chromium.org> writes:
>> In preparation for FORTIFY_SOURCE performing compile-time and run-time
>> field bounds checking for memset(), avoid intentionally writing across
>> neighboring fields.
>>
>> Add a struct_group() for the spe registers so that memset() can correctly reason
>> about the size:
>>
>>     In function 'fortify_memset_chk',
>>         inlined from 'restore_user_regs.part.0' at arch/powerpc/kernel/signal_32.c:539:3:
>>>> include/linux/fortify-string.h:195:4: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
>>       195 |    __write_overflow_field();
>>           |    ^~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>>   arch/powerpc/include/asm/processor.h | 6 ++++--
>>   arch/powerpc/kernel/signal_32.c      | 6 +++---
>>   2 files changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
>> index f348e564f7dd..05dc567cb9a8 100644
>> --- a/arch/powerpc/include/asm/processor.h
>> +++ b/arch/powerpc/include/asm/processor.h
>> @@ -191,8 +191,10 @@ struct thread_struct {
>>   	int		used_vsr;	/* set if process has used VSX */
>>   #endif /* CONFIG_VSX */
>>   #ifdef CONFIG_SPE
>> -	unsigned long	evr[32];	/* upper 32-bits of SPE regs */
>> -	u64		acc;		/* Accumulator */
>> +	struct_group(spe,
>> +		unsigned long	evr[32];	/* upper 32-bits of SPE regs */
>> +		u64		acc;		/* Accumulator */
>> +	);
>>   	unsigned long	spefscr;	/* SPE & eFP status */
>>   	unsigned long	spefscr_last;	/* SPEFSCR value on last prctl
>>   					   call or trap return */
>> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
>> index 0608581967f0..77b86caf5c51 100644
>> --- a/arch/powerpc/kernel/signal_32.c
>> +++ b/arch/powerpc/kernel/signal_32.c
>> @@ -532,11 +532,11 @@ static long restore_user_regs(struct pt_regs *regs,
>>   	regs_set_return_msr(regs, regs->msr & ~MSR_SPE);
>>   	if (msr & MSR_SPE) {
>>   		/* restore spe registers from the stack */
>> -		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
>> -				      ELF_NEVRREG * sizeof(u32), failed);
>> +		unsafe_copy_from_user(&current->thread.spe, &sr->mc_vregs,
>> +				      sizeof(current->thread.spe), failed);
> 
> This makes me nervous, because the ABI is that we copy ELF_NEVRREG *
> sizeof(u32) bytes, not whatever sizeof(current->thread.spe) happens to
> be.
> 
> ie. if we use sizeof an inadvertent change to the fields in
> thread_struct could change how many bytes we copy out to userspace,
> which would be an ABI break.
> 
> And that's not that hard to do, because it's not at all obvious that the
> size and layout of fields in thread_struct affects the user ABI.
> 
> At the same time we don't want to copy the right number of bytes but
> the wrong content, so from that point of view using sizeof is good :)
> 
> The way we handle it in ptrace is to have BUILD_BUG_ON()s to verify that
> things match up, so maybe we should do that here too.
> 
> ie. add:
> 
> 	BUILD_BUG_ON(sizeof(current->thread.spe) == ELF_NEVRREG * sizeof(u32));

You mean != I guess ?


> 
> 
> Not sure if you are happy doing that as part of this patch. I can always
> do it later if not.
> 
> cheers
> 
