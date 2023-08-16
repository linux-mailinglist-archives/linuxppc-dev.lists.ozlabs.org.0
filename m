Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3F277D8E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 05:15:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IVIOClPl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQYDY3SxTz3cR9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 13:15:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IVIOClPl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQYCf2GJTz2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 13:14:54 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-688731c6331so727214b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 20:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692155691; x=1692760491;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JSYxFxoCtFaYHq5tDU35/I/PKWW/aYx+DXVUemb6C8=;
        b=IVIOClPljq34fr21uTeNphPBEvAoJLU/liAPxCBuJmyUK9k41dnPmVJfq/AhruOP6+
         mj2oa6spfJfGtV4628IAPxNYK+g/FM3BLrOH/K+NJi9pDO8LH1R29jUwR7XDOY9HMTsg
         ZgFwWwsmQ7lqUS++CpU59fmiqj5tZtJi8/nKLKYPA6Dv2MZ047/xGP0+45nFEr3CDUFs
         kaoaURMfFyxiwjVnJBxRJfz7YMKpVWrHGXTwoobBd9v4VDflFE0sRgUmD5EtFlBd6K7w
         GK8qRVg2RVqb5+WkcAIYyjW6OaYPzNPmDYDiRZ432rFV4Ux/gpVVJhZcWgG3OAyiUbLt
         RaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692155691; x=1692760491;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JSYxFxoCtFaYHq5tDU35/I/PKWW/aYx+DXVUemb6C8=;
        b=ebkmV2sgHQCNhZhG7iDQ5O6HG7MmiTWPB8MytQ6Y9pkE9WjEKIB7JXK6wjXkjuYNZM
         +MDN2UD5onhiL5I9zDsKW80ZWNIPMZgXmVlys+gmbMiFU3QADVhIAAPyxFEem9sEeKFE
         4QOy2YdK0TU4Cg9imSwW4k0DExw9zFmbJLVRIgTJJRgNUpdklKYw+UeUjpBUPPo46rsD
         kRbqyp4yM1XcaS7OSOIH7XHHRKddsLDsHOFNFDkgHUNvBJWQDKm+rPu1b0pPBQdSUoyh
         BZpWBSU9BzLB6APifLVxFfBL0bKS0kuqtI9oi9sgqqLq6XszibrWRoGor53yGwZTm684
         KqBQ==
X-Gm-Message-State: AOJu0YzlvaWL7jM1lGrVzm0J4BQPi1Ytsv1UgNmcaoHgVl3+qwjEmBfc
	1Co7nS7WCmC/bNF0VVm/HRg=
X-Google-Smtp-Source: AGHT+IEAlXG+94dueZdgF8qUiyf6p18xZm8TZWLHkpOLwdvpWUDRBxCs7nQ4NLKP2AEo3HiDAEA0Jg==
X-Received: by 2002:a05:6a00:189c:b0:686:5e0d:bd4f with SMTP id x28-20020a056a00189c00b006865e0dbd4fmr749285pfh.0.1692155691323;
        Tue, 15 Aug 2023 20:14:51 -0700 (PDT)
Received: from localhost.localdomain ([146.112.118.69])
        by smtp.gmail.com with ESMTPSA id q18-20020a62e112000000b006874a6e74b4sm10048422pfh.151.2023.08.15.20.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 20:14:50 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] KVM: PPC: Book3s HV: Hold LPIDs in an unsigned
 long
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20230807014553.1168699-1-jniethe5@gmail.com>
 <20230807014553.1168699-5-jniethe5@gmail.com>
 <CUS477NDPEQI.27SBUCRNYD0XG@wheely>
From: Jordan Niethe <jniethe5@gmail.com>
Message-ID: <7e1df0da-77e4-eca7-e487-f51fc0968c14@gmail.com>
Date: Wed, 16 Aug 2023 13:14:45 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CUS477NDPEQI.27SBUCRNYD0XG@wheely>
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



On 14/8/23 6:12 pm, Nicholas Piggin wrote:
> On Mon Aug 7, 2023 at 11:45 AM AEST, Jordan Niethe wrote:
>> The LPID register is 32 bits long. The host keeps the lpids for each
>> guest in an unsigned word struct kvm_arch. Currently, LPIDs are already
>> limited by mmu_lpid_bits and KVM_MAX_NESTED_GUESTS_SHIFT.
>>
>> The nestedv2 API returns a 64 bit "Guest ID" to be used be the L1 host
>> for each L2 guest. This value is used as an lpid, e.g. it is the
>> parameter used by H_RPT_INVALIDATE. To minimize needless special casing
>> it makes sense to keep this "Guest ID" in struct kvm_arch::lpid.
>>
>> This means that struct kvm_arch::lpid is too small so prepare for this
>> and make it an unsigned long. This is not a problem for the KVM-HV and
>> nestedv1 cases as their lpid values are already limited to valid ranges
>> so in those contexts the lpid can be used as an unsigned word safely as
>> needed.
>>
>> In the PAPR, the H_RPT_INVALIDATE pid/lpid parameter is already
>> specified as an unsigned long so change pseries_rpt_invalidate() to
>> match that.  Update the callers of pseries_rpt_invalidate() to also take
>> an unsigned long if they take an lpid value.
> 
> I don't suppose it would be worth having an lpid_t.

I actually introduced that when I was developing for the purpose of 
doing the conversion, but I felt like it was unnecessary in the end, it 
is just a wider integer and it is simpler to treat it that way imho.

> 
>> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
>> index 4adff4f1896d..229f0a1ffdd4 100644
>> --- a/arch/powerpc/kvm/book3s_xive.c
>> +++ b/arch/powerpc/kvm/book3s_xive.c
>> @@ -886,10 +886,10 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *vcpu, u8 prio,
>>   
>>   	if (single_escalation)
>>   		name = kasprintf(GFP_KERNEL, "kvm-%d-%d",
>> -				 vcpu->kvm->arch.lpid, xc->server_num);
>> +				 (unsigned int)vcpu->kvm->arch.lpid, xc->server_num);
>>   	else
>>   		name = kasprintf(GFP_KERNEL, "kvm-%d-%d-%d",
>> -				 vcpu->kvm->arch.lpid, xc->server_num, prio);
>> +				 (unsigned int)vcpu->kvm->arch.lpid, xc->server_num, prio);
>>   	if (!name) {
>>   		pr_err("Failed to allocate escalation irq name for queue %d of VCPU %d\n",
>>   		       prio, xc->server_num);
> 
> I would have thought you'd keep the type and change the format.

yeah, I will do that.

> 
> Otherwise seems okay too.

Thanks.

> 
> Thanks,
> Nick
> 
