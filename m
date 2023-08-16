Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E15C77D8F2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 05:21:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=MW1+Gm5l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQYLz39kJz3cV1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 13:21:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=MW1+Gm5l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQYL33HPXz2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 13:20:27 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3a7f74134e7so2472490b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 20:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692156024; x=1692760824;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmX+B7J+wmAurtUlUbZbOqhkBn25gXv9vA1g9p4CbPA=;
        b=MW1+Gm5lqAPzUQyo7ltqasF+300upvYWD88MF2EabmJRL5vy2k/dhIOy4Cwiqwt9Uv
         hClwdqNoYkVvXEni/7FdAamE90NWPj5r5HosFgI7bzfDQUHkArH8yBhBOSb9bRQBm1E+
         XTxF3HLG79XM+qVqycSPst3WtFcxCX6CohDfxIc4fXco0U6EXazeKz6t7MVHyK5PiY4Z
         IC06wDNxccFaBWQ9wUxZTPikB1f0TOderj8CZVcjSZJUE8D5N4doDV47UVbwRyvxlLng
         KDFH7HADIATLCDKwqLJO0JsYtuFFnApvN8F80W6TVgxaM9Fx8l01dDiP2heFfEp0pbJP
         qn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692156024; x=1692760824;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmX+B7J+wmAurtUlUbZbOqhkBn25gXv9vA1g9p4CbPA=;
        b=RuGnzunmUbueWA1iPlYC8kOonfv4UzI3WyW0weAqgrya/obsU+D/3/95n/VMJZlAo4
         xvrgeUvQ35hLp0z6i6ncu5uIBbrso7VUB4OX7dWGWeSQnTxa4CaaTHpiYO7ccMOKflSo
         Ax3Lc2GVcbxUshgYzdQ7vhX5MmqZrONYeAOAorV6jr3Tlp6XV6JmSn/UPpkWRNf9UvdO
         dv012I3feBUrYWZSXIJ/bRQ5Gk0VPocZ2Anqs+dl7tV/iCFN6c9uQ+sBNUSK1CYR7OnU
         ep8VBj0jmyGexR3VbBLMULQ19NrZaMLOlt644K920plnrH6zKBetaDSxvw+vDVtoMTGZ
         sfYg==
X-Gm-Message-State: AOJu0Yz9F4KIR1Egn3Ht8bbjz0mhuZOQe7RsFCmptoYC7CRaq5iIykPI
	4nLOG4hRWyoBBsG5hAKknKc=
X-Google-Smtp-Source: AGHT+IHP8Nvbnx53Vi5Az6VTu9OuSy4vtl+Dd/TGFW9dktKQelTl2wk80eGIK6eAd/XQysOa6ji9jA==
X-Received: by 2002:a05:6358:52d2:b0:139:be3d:d2fa with SMTP id z18-20020a05635852d200b00139be3dd2famr1102039rwz.30.1692156023940;
        Tue, 15 Aug 2023 20:20:23 -0700 (PDT)
Received: from localhost.localdomain ([146.112.118.69])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001bdbe6c86a9sm9128572plc.225.2023.08.15.20.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 20:20:23 -0700 (PDT)
Subject: Re: [PATCH v3 2/6] KVM: PPC: Rename accessor generator macros
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20230807014553.1168699-1-jniethe5@gmail.com>
 <20230807014553.1168699-3-jniethe5@gmail.com>
 <CUS4J2YPYFAO.3P4R24H4KFJ83@wheely>
From: Jordan Niethe <jniethe5@gmail.com>
Message-ID: <efa0e456-1b7e-f12e-c720-076e962c7ca2@gmail.com>
Date: Wed, 16 Aug 2023 13:20:18 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CUS4J2YPYFAO.3P4R24H4KFJ83@wheely>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: mikey@neuling.org, kvm@vger.kernel.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, kvm-ppc@vger.kernel.org, kconsul@linux.vnet.ibm.com, vaibhav@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 14/8/23 6:27 pm, Nicholas Piggin wrote:
> On Mon Aug 7, 2023 at 11:45 AM AEST, Jordan Niethe wrote:
>> More "wrapper" style accessor generating macros will be introduced for
>> the nestedv2 guest support. Rename the existing macros with more
>> descriptive names now so there is a consistent naming convention.
>>
>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> 
>> ---
>> v3:
>>    - New to series
>> ---
>>   arch/powerpc/include/asm/kvm_ppc.h | 60 +++++++++++++++---------------
>>   1 file changed, 30 insertions(+), 30 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
>> index d16d80ad2ae4..b66084a81dd0 100644
>> --- a/arch/powerpc/include/asm/kvm_ppc.h
>> +++ b/arch/powerpc/include/asm/kvm_ppc.h
>> @@ -927,19 +927,19 @@ static inline bool kvmppc_shared_big_endian(struct kvm_vcpu *vcpu)
>>   #endif
>>   }
>>   
>> -#define SPRNG_WRAPPER_GET(reg, bookehv_spr)				\
>> +#define KVMPPC_BOOKE_HV_SPRNG_ACESSOR_GET(reg, bookehv_spr)		\
>>   static inline ulong kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
>>   {									\
>>   	return mfspr(bookehv_spr);					\
>>   }									\
>>   
>> -#define SPRNG_WRAPPER_SET(reg, bookehv_spr)				\
>> +#define KVMPPC_BOOKE_HV_SPRNG_ACESSOR_SET(reg, bookehv_spr)		\
>>   static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, ulong val)	\
>>   {									\
>>   	mtspr(bookehv_spr, val);						\
>>   }									\
>>   
>> -#define SHARED_WRAPPER_GET(reg, size)					\
>> +#define KVMPPC_VCPU_SHARED_REGS_ACESSOR_GET(reg, size)			\
>>   static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
>>   {									\
>>   	if (kvmppc_shared_big_endian(vcpu))				\
>> @@ -948,7 +948,7 @@ static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
>>   	       return le##size##_to_cpu(vcpu->arch.shared->reg);	\
>>   }									\
>>   
>> -#define SHARED_WRAPPER_SET(reg, size)					\
>> +#define KVMPPC_VCPU_SHARED_REGS_ACESSOR_SET(reg, size)			\
>>   static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
>>   {									\
>>   	if (kvmppc_shared_big_endian(vcpu))				\
>> @@ -957,36 +957,36 @@ static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
>>   	       vcpu->arch.shared->reg = cpu_to_le##size(val);		\
>>   }									\
>>   
>> -#define SHARED_WRAPPER(reg, size)					\
>> -	SHARED_WRAPPER_GET(reg, size)					\
>> -	SHARED_WRAPPER_SET(reg, size)					\
>> +#define KVMPPC_VCPU_SHARED_REGS_ACESSOR(reg, size)					\
>> +	KVMPPC_VCPU_SHARED_REGS_ACESSOR_GET(reg, size)					\
>> +	KVMPPC_VCPU_SHARED_REGS_ACESSOR_SET(reg, size)					\
>>   
>> -#define SPRNG_WRAPPER(reg, bookehv_spr)					\
>> -	SPRNG_WRAPPER_GET(reg, bookehv_spr)				\
>> -	SPRNG_WRAPPER_SET(reg, bookehv_spr)				\
>> +#define KVMPPC_BOOKE_HV_SPRNG_ACESSOR(reg, bookehv_spr)					\
>> +	KVMPPC_BOOKE_HV_SPRNG_ACESSOR_GET(reg, bookehv_spr)				\
>> +	KVMPPC_BOOKE_HV_SPRNG_ACESSOR_SET(reg, bookehv_spr)				\
>>   
>>   #ifdef CONFIG_KVM_BOOKE_HV
>>   
>> -#define SHARED_SPRNG_WRAPPER(reg, size, bookehv_spr)			\
>> -	SPRNG_WRAPPER(reg, bookehv_spr)					\
>> +#define KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(reg, size, bookehv_spr)	\
>> +	KVMPPC_BOOKE_HV_SPRNG_ACESSOR(reg, bookehv_spr)			\
>>   
>>   #else
>>   
>> -#define SHARED_SPRNG_WRAPPER(reg, size, bookehv_spr)			\
>> -	SHARED_WRAPPER(reg, size)					\
>> +#define KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(reg, size, bookehv_spr)	\
>> +	KVMPPC_VCPU_SHARED_REGS_ACESSOR(reg, size)			\
> 
> Not the greatest name I've ever seen :D Hard to be concice and
> consistent though, this is an odd one.

Yes, it is a bit wordy.

> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks.

> 
>>   
>>   #endif
>>   
>> -SHARED_WRAPPER(critical, 64)
>> -SHARED_SPRNG_WRAPPER(sprg0, 64, SPRN_GSPRG0)
>> -SHARED_SPRNG_WRAPPER(sprg1, 64, SPRN_GSPRG1)
>> -SHARED_SPRNG_WRAPPER(sprg2, 64, SPRN_GSPRG2)
>> -SHARED_SPRNG_WRAPPER(sprg3, 64, SPRN_GSPRG3)
>> -SHARED_SPRNG_WRAPPER(srr0, 64, SPRN_GSRR0)
>> -SHARED_SPRNG_WRAPPER(srr1, 64, SPRN_GSRR1)
>> -SHARED_SPRNG_WRAPPER(dar, 64, SPRN_GDEAR)
>> -SHARED_SPRNG_WRAPPER(esr, 64, SPRN_GESR)
>> -SHARED_WRAPPER_GET(msr, 64)
>> +KVMPPC_VCPU_SHARED_REGS_ACESSOR(critical, 64)
>> +KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg0, 64, SPRN_GSPRG0)
>> +KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg1, 64, SPRN_GSPRG1)
>> +KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg2, 64, SPRN_GSPRG2)
>> +KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg3, 64, SPRN_GSPRG3)
>> +KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(srr0, 64, SPRN_GSRR0)
>> +KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(srr1, 64, SPRN_GSRR1)
>> +KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(dar, 64, SPRN_GDEAR)
>> +KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(esr, 64, SPRN_GESR)
>> +KVMPPC_VCPU_SHARED_REGS_ACESSOR_GET(msr, 64)
>>   static inline void kvmppc_set_msr_fast(struct kvm_vcpu *vcpu, u64 val)
>>   {
>>   	if (kvmppc_shared_big_endian(vcpu))
>> @@ -994,12 +994,12 @@ static inline void kvmppc_set_msr_fast(struct kvm_vcpu *vcpu, u64 val)
>>   	else
>>   	       vcpu->arch.shared->msr = cpu_to_le64(val);
>>   }
>> -SHARED_WRAPPER(dsisr, 32)
>> -SHARED_WRAPPER(int_pending, 32)
>> -SHARED_WRAPPER(sprg4, 64)
>> -SHARED_WRAPPER(sprg5, 64)
>> -SHARED_WRAPPER(sprg6, 64)
>> -SHARED_WRAPPER(sprg7, 64)
>> +KVMPPC_VCPU_SHARED_REGS_ACESSOR(dsisr, 32)
>> +KVMPPC_VCPU_SHARED_REGS_ACESSOR(int_pending, 32)
>> +KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg4, 64)
>> +KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg5, 64)
>> +KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg6, 64)
>> +KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg7, 64)
>>   
>>   static inline u32 kvmppc_get_sr(struct kvm_vcpu *vcpu, int nr)
>>   {
> 
