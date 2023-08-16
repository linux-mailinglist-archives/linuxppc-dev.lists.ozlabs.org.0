Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCB877D8DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 05:12:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=SRUA0K5U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQY8H20DWz3cTF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 13:11:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=SRUA0K5U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQY7N247Xz2ytX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 13:11:10 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bdca7cc28dso31874425ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 20:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692155467; x=1692760267;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFcNtuBxixf5wJuU8gYA0YbfyYSQsy3zy43VL6AoIEY=;
        b=SRUA0K5UfvnzSINPXjOGsfInJgg9jLJF8AFzEUCIEEszX7g/RIcWRPwaQLREyXJX9a
         AhgL1fflrqmmLxB6lHSJEmG2HoIpjYvR64CUmme8fbdv22c2H89taCMOtxO8AliL9JMb
         aI1Ariuz+hDlNOhbZqQqbQOAEn/900EFSxsQlMxwCai/8Xh5tqp4dRI1zbbsLvI9lYlZ
         2D86rkm/j9FeEZ+B592IY90PpCv44KAnVnSLOByafiS1c1JZTO8PUpoOzFe6RfApse6I
         W2GbwGUZ1MnGpObtJR0VRpLbUNKMq43wXqfhdgxt+o4To/FZlvVj5snta8zDTy6NyAyi
         riFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692155467; x=1692760267;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFcNtuBxixf5wJuU8gYA0YbfyYSQsy3zy43VL6AoIEY=;
        b=d5pwwhvFXUszpQf0HD5wbSCAn71gIGBQnGX22qbC38stIi7HN78hJaryaQX9KLshHm
         E5WDzIjlFfNY4EtMitQ/ig/5qxc0xOvUccXkPkFeCVJHyD1ogBUMiwpWM2U/mGBYqwWl
         BgyZB09DG+ZdbaXlrIY3+YNuQLsaVl5WFj+95ksnaftjw8Ivxf3iLbPyYnpuTT/LPZyf
         /M+7TDPD0uAXJPKliilW06FCuoLolTdW6xmfK9mtRC5r70NP1AmYXf+igJq24KOXWyu8
         J7yajQMm5nRTpiaAI9MsT3ShDKh+2aVt32TzBwXccopwwOdJavs8p0HX/7ETNWQ+Rpzu
         U7GQ==
X-Gm-Message-State: AOJu0Yy6TDMiuklyxCVPaf94GO8KDiwdV+kao0BwA65PgIKlPxd60s00
	KwRz2iuq0BTO6Ibl50A/mfc=
X-Google-Smtp-Source: AGHT+IGkc2hUDta+IGakHFjBInQVHNIBETmu5s9HDyvblnc18wwsR4JMRHOdec1VsGltqDsuiTUy+w==
X-Received: by 2002:a17:902:bd42:b0:1bd:d663:45ad with SMTP id b2-20020a170902bd4200b001bdd66345admr723438plx.68.1692155466914;
        Tue, 15 Aug 2023 20:11:06 -0700 (PDT)
Received: from localhost.localdomain ([146.112.118.69])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902db0100b001b8622c1ad2sm11792839plx.130.2023.08.15.20.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 20:11:06 -0700 (PDT)
Subject: Re: [PATCH v3 1/6] KVM: PPC: Use getters and setters for vcpu
 register state
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20230807014553.1168699-1-jniethe5@gmail.com>
 <20230807014553.1168699-2-jniethe5@gmail.com>
 <CUS44PQRFL72.28PFLWO36FYAO@wheely>
From: Jordan Niethe <jniethe5@gmail.com>
Message-ID: <71e14e67-3ba4-4ddd-921d-38181f3c0159@gmail.com>
Date: Wed, 16 Aug 2023 13:11:00 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CUS44PQRFL72.28PFLWO36FYAO@wheely>
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



On 14/8/23 6:08 pm, Nicholas Piggin wrote:
> On Mon Aug 7, 2023 at 11:45 AM AEST, Jordan Niethe wrote:
>> There are already some getter and setter functions used for accessing
>> vcpu register state, e.g. kvmppc_get_pc(). There are also more
>> complicated examples that are generated by macros like
>> kvmppc_get_sprg0() which are generated by the SHARED_SPRNG_WRAPPER()
>> macro.
>>
>> In the new PAPR "Nestedv2" API for nested guest partitions the L1 is
>> required to communicate with the L0 to modify and read nested guest
>> state.
>>
>> Prepare to support this by replacing direct accesses to vcpu register
>> state with wrapper functions. Follow the existing pattern of using
>> macros to generate individual wrappers. These wrappers will
>> be augmented for supporting Nestedv2 guests later.
>>
>> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>> ---
>> v3:
>>    - Do not add a helper for pvr
>>    - Use an expression when declaring variable in case
>>    - Squash in all getters and setters
>>    - Guatam: Pass vector registers by reference
>> ---
>>   arch/powerpc/include/asm/kvm_book3s.h  | 123 +++++++++++++-
>>   arch/powerpc/include/asm/kvm_booke.h   |  10 ++
>>   arch/powerpc/kvm/book3s.c              |  38 ++---
>>   arch/powerpc/kvm/book3s_64_mmu_hv.c    |   4 +-
>>   arch/powerpc/kvm/book3s_64_mmu_radix.c |   9 +-
>>   arch/powerpc/kvm/book3s_64_vio.c       |   4 +-
>>   arch/powerpc/kvm/book3s_hv.c           | 220 +++++++++++++------------
>>   arch/powerpc/kvm/book3s_hv.h           |  58 +++++++
>>   arch/powerpc/kvm/book3s_hv_builtin.c   |  10 +-
>>   arch/powerpc/kvm/book3s_hv_p9_entry.c  |   4 +-
>>   arch/powerpc/kvm/book3s_hv_ras.c       |   5 +-
>>   arch/powerpc/kvm/book3s_hv_rm_mmu.c    |   8 +-
>>   arch/powerpc/kvm/book3s_hv_rm_xics.c   |   4 +-
>>   arch/powerpc/kvm/book3s_xive.c         |   9 +-
>>   arch/powerpc/kvm/emulate_loadstore.c   |   2 +-
>>   arch/powerpc/kvm/powerpc.c             |  76 ++++-----
>>   16 files changed, 395 insertions(+), 189 deletions(-)
>>
> 
> [snip]
> 
>> +
>>   /* Expiry time of vcpu DEC relative to host TB */
>>   static inline u64 kvmppc_dec_expires_host_tb(struct kvm_vcpu *vcpu)
>>   {
>> -	return vcpu->arch.dec_expires - vcpu->arch.vcore->tb_offset;
>> +	return kvmppc_get_dec_expires(vcpu) - kvmppc_get_tb_offset_hv(vcpu);
>>   }
> 
> I don't see kvmppc_get_tb_offset_hv in this patch.

It should be generated by:

KVMPPC_BOOK3S_VCORE_ACCESSOR(tb_offset, 64)

> 
>> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
>> index 7f765d5ad436..738f2ecbe9b9 100644
>> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
>> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
>> @@ -347,7 +347,7 @@ static int kvmppc_mmu_book3s_64_hv_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
>>   	unsigned long v, orig_v, gr;
>>   	__be64 *hptep;
>>   	long int index;
>> -	int virtmode = vcpu->arch.shregs.msr & (data ? MSR_DR : MSR_IR);
>> +	int virtmode = kvmppc_get_msr(vcpu) & (data ? MSR_DR : MSR_IR);
>>   
>>   	if (kvm_is_radix(vcpu->kvm))
>>   		return kvmppc_mmu_radix_xlate(vcpu, eaddr, gpte, data, iswrite);
> 
> So this isn't _only_ adding new accessors. This should be functionally a
> noop, but I think it introduces a branch if PR is defined.

That being checking kvmppc_shared_big_endian()?

> 
> Shared page is a slight annoyance for HV, I'd like to get rid of it...
> but that's another story. I think the pattern here would be to add a
> kvmppc_get_msr_hv() accessor.

Yes, that will work.

> 
> And as a nitpick, for anywhere employing existing access functions, gprs
> and such, could that be split into its own patch?

Sure will do. One other thing I could do is make the existing functions 
use the macros if they don't already. Do you think that is worth doing?

> 
> Looks pretty good aside from those little things.

Thanks.

> 
> Thanks,
> Nick
> 
