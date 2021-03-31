Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF2A34FE37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:40:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9NB52rM8z3bwP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 21:40:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9N9j02Yrz3bpJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 21:39:49 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F9N9Y24GNz9ty3J;
 Wed, 31 Mar 2021 12:39:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vFTVnU7cHPI7; Wed, 31 Mar 2021 12:39:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F9N9Y1DWsz9ty2t;
 Wed, 31 Mar 2021 12:39:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 338BD8B7FB;
 Wed, 31 Mar 2021 12:39:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DmOfJZKq4OBf; Wed, 31 Mar 2021 12:39:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7CEB68B75B;
 Wed, 31 Mar 2021 12:39:45 +0200 (CEST)
Subject: Re: [PATCH v10 05/10] powerpc/bpf: Write protect JIT code
To: Michael Ellerman <mpe@ellerman.id.au>, Jordan Niethe
 <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-6-jniethe5@gmail.com>
 <87wntnwqw9.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9034d909-170f-7e9c-02a2-e329d613ed7c@csgroup.eu>
Date: Wed, 31 Mar 2021 12:39:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <87wntnwqw9.fsf@mpe.ellerman.id.au>
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
Cc: naveen.n.rao@linux.ibm.com, cmr@codefail.de, ajd@linux.ibm.com,
 npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 31/03/2021 à 12:37, Michael Ellerman a écrit :
> Jordan Niethe <jniethe5@gmail.com> writes:
> 
>> Once CONFIG_STRICT_MODULE_RWX is enabled there will be no need to
>> override bpf_jit_free() because it is now possible to set images
>> read-only. So use the default implementation.
>>
>> Also add the necessary call to bpf_jit_binary_lock_ro() which will
>> remove write protection and add exec protection to the JIT image after
>> it has finished being written.
>>
>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>> ---
>> v10: New to series
>> ---
>>   arch/powerpc/net/bpf_jit_comp.c   | 5 ++++-
>>   arch/powerpc/net/bpf_jit_comp64.c | 4 ++++
>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
>> index e809cb5a1631..8015e4a7d2d4 100644
>> --- a/arch/powerpc/net/bpf_jit_comp.c
>> +++ b/arch/powerpc/net/bpf_jit_comp.c
>> @@ -659,12 +659,15 @@ void bpf_jit_compile(struct bpf_prog *fp)
>>   		bpf_jit_dump(flen, proglen, pass, code_base);
>>   
>>   	bpf_flush_icache(code_base, code_base + (proglen/4));
>> -
>>   #ifdef CONFIG_PPC64
>>   	/* Function descriptor nastiness: Address + TOC */
>>   	((u64 *)image)[0] = (u64)code_base;
>>   	((u64 *)image)[1] = local_paca->kernel_toc;
>>   #endif
>> +	if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
>> +		set_memory_ro((unsigned long)image, alloclen >> PAGE_SHIFT);
>> +		set_memory_x((unsigned long)image, alloclen >> PAGE_SHIFT);
>> +	}
> 
> You don't need to check the ifdef in a caller, there are stubs that
> compile to nothing when CONFIG_ARCH_HAS_SET_MEMORY=n.

I was about to do the same comment, but ....

CONFIG_STRICT_MODULE_RWX is not CONFIG_ARCH_HAS_SET_MEMORY

> 
>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
>> index aaf1a887f653..1484ad588685 100644
>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>> @@ -1240,6 +1240,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>   	fp->jited_len = alloclen;
>>   
>>   	bpf_flush_icache(bpf_hdr, (u8 *)bpf_hdr + (bpf_hdr->pages * PAGE_SIZE));
>> +	if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
>> +		bpf_jit_binary_lock_ro(bpf_hdr);
> 
> Do we need the ifdef here either? Looks like it should be safe to call
> due to the stubs.

Same

> 
>> @@ -1262,6 +1264,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>   }
>>   
>>   /* Overriding bpf_jit_free() as we don't set images read-only. */
>> +#ifndef CONFIG_STRICT_MODULE_RWX
> 
> Did you test without this and notice something broken?
> 
> Looking at the generic version I can't tell why we need to override
> this. Maybe we don't (anymore?) ?
> 
> cheers
> 
>>   void bpf_jit_free(struct bpf_prog *fp)
>>   {
>>   	unsigned long addr = (unsigned long)fp->bpf_func & PAGE_MASK;
>> @@ -1272,3 +1275,4 @@ void bpf_jit_free(struct bpf_prog *fp)
>>   
>>   	bpf_prog_unlock_free(fp);
>>   }
>> +#endif
>> -- 
>> 2.25.1
