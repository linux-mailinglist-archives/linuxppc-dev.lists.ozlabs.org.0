Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BC077D8FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 05:22:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NQFRZ5iV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQYNQ6gqwz3cVM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 13:22:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NQFRZ5iV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQYMX3RDMz30KG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 13:21:44 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-565334377d0so4516604a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 20:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692156102; x=1692760902;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLgZ/fh5M5NltE3AWQwyfXy2dGWq1QEmZxlklznfsAg=;
        b=NQFRZ5iVj7FHi2JAjM2ygQ/W2FNrRIAPpcJgrHNOIdu23BM2e1PWYrzXPLCMlkXoeB
         Sf8XkZl/yFuuDhv/8MPHV8BGzMMo1LgyIk5B3/B5IbljKG6EgFumXyz/UAdjFWq1hN9x
         nE9wE/zWw1/HrQ9ApB7NMcZSu+5VEXU3T3BqIopMBwwJxCORVe8qgPUvH11nADoaTuJh
         BsLwhXwLsx0DAAqvSP4rAy0TOGPIRU/pcw8vmxPe2bgLnEIhsgT29b+JwmA5qW6yHWyM
         LX3qM3OlVYWbYx+sUGsI3YeR4R6F82MBTE73GZZslXBeDuYGP7w0zrd6C9wBild41vcw
         0wMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692156102; x=1692760902;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLgZ/fh5M5NltE3AWQwyfXy2dGWq1QEmZxlklznfsAg=;
        b=L8Kn3pFNX8K52uxXghM/0EdPm8dbhQqW+tZHH87TR8NiHJF3B/VHOEb8Ac/FAzT0Pe
         vg09UMAyB65lPvESVETtdZYACHlr3jbDWspyQ38T9YZxE05Pe+TEvSeiL6/KmZFGEZti
         60HKFJCeQDLu8li2rYBr2DC1gyYDZ7o4AvzwuIWB6d1apx/Qk4adBU+FwjJzUAhs8qlA
         /J916DHCBTIEgvART1Z2VTGHy4ARlh4uUP1ULa0VnnuVBvNaoPC8iFP2fDTieL9apzPK
         VjnKKmPv+CYEJBFTnwnuBvcpVVsiDhgt0t6z4DyEzfgRA/pP3KZaQtONlSut1p2RTwRo
         Zz3w==
X-Gm-Message-State: AOJu0YyZSQjp0hQ9UkW2LPr9FKaJi9ql28iIL5TTbF9ZM5eWzie0aO0L
	gyfqI2XQpQiSmoJhQ+IiLg0=
X-Google-Smtp-Source: AGHT+IE7yVdS0kMwy4HCS9A43/hjpM+6g1vzheq8U3+lI6mnkuv35ezpapXAmiqsRXd/mnIEFHG+sQ==
X-Received: by 2002:a17:90b:3809:b0:268:5c3b:6f37 with SMTP id mq9-20020a17090b380900b002685c3b6f37mr407598pjb.0.1692156101753;
        Tue, 15 Aug 2023 20:21:41 -0700 (PDT)
Received: from localhost.localdomain ([146.112.118.69])
        by smtp.gmail.com with ESMTPSA id u18-20020a170902e5d200b001b892aac5c9sm11786337plf.298.2023.08.15.20.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 20:21:41 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] KVM: PPC: Book3s HV: Hold LPIDs in an unsigned
 long
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20230807014553.1168699-1-jniethe5@gmail.com>
 <20230807014553.1168699-5-jniethe5@gmail.com>
 <CUS477NDPEQI.27SBUCRNYD0XG@wheely> <87ttt0d1ol.fsf@mail.lhotse>
From: Jordan Niethe <jniethe5@gmail.com>
Message-ID: <473611e9-5831-cc6f-ba75-86964fe71b6e@gmail.com>
Date: Wed, 16 Aug 2023 13:21:36 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87ttt0d1ol.fsf@mail.lhotse>
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



On 15/8/23 8:45 pm, Michael Ellerman wrote:
> "Nicholas Piggin" <npiggin@gmail.com> writes:
>> On Mon Aug 7, 2023 at 11:45 AM AEST, Jordan Niethe wrote:
>>> The LPID register is 32 bits long. The host keeps the lpids for each
>>> guest in an unsigned word struct kvm_arch. Currently, LPIDs are already
>>> limited by mmu_lpid_bits and KVM_MAX_NESTED_GUESTS_SHIFT.
>>>
>>> The nestedv2 API returns a 64 bit "Guest ID" to be used be the L1 host
>>> for each L2 guest. This value is used as an lpid, e.g. it is the
>>> parameter used by H_RPT_INVALIDATE. To minimize needless special casing
>>> it makes sense to keep this "Guest ID" in struct kvm_arch::lpid.
>>>
>>> This means that struct kvm_arch::lpid is too small so prepare for this
>>> and make it an unsigned long. This is not a problem for the KVM-HV and
>>> nestedv1 cases as their lpid values are already limited to valid ranges
>>> so in those contexts the lpid can be used as an unsigned word safely as
>>> needed.
>>>
>>> In the PAPR, the H_RPT_INVALIDATE pid/lpid parameter is already
>>> specified as an unsigned long so change pseries_rpt_invalidate() to
>>> match that.  Update the callers of pseries_rpt_invalidate() to also take
>>> an unsigned long if they take an lpid value.
>>
>> I don't suppose it would be worth having an lpid_t.
>>
>>> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
>>> index 4adff4f1896d..229f0a1ffdd4 100644
>>> --- a/arch/powerpc/kvm/book3s_xive.c
>>> +++ b/arch/powerpc/kvm/book3s_xive.c
>>> @@ -886,10 +886,10 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *vcpu, u8 prio,
>>>   
>>>   	if (single_escalation)
>>>   		name = kasprintf(GFP_KERNEL, "kvm-%d-%d",
>>> -				 vcpu->kvm->arch.lpid, xc->server_num);
>>> +				 (unsigned int)vcpu->kvm->arch.lpid, xc->server_num);
>>>   	else
>>>   		name = kasprintf(GFP_KERNEL, "kvm-%d-%d-%d",
>>> -				 vcpu->kvm->arch.lpid, xc->server_num, prio);
>>> +				 (unsigned int)vcpu->kvm->arch.lpid, xc->server_num, prio);
>>>   	if (!name) {
>>>   		pr_err("Failed to allocate escalation irq name for queue %d of VCPU %d\n",
>>>   		       prio, xc->server_num);
>>
>> I would have thought you'd keep the type and change the format.
> 
> Yeah. Don't we risk having ambigious names by discarding the high bits?
> Not sure that would be a bug per se, but it could be confusing.

In this context is would always be constrained be the number of LPID 
bits so wouldn't be ambiguous, but I'm going to change the format.

> 
> cheers
> 
