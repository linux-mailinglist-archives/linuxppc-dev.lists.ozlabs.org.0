Return-Path: <linuxppc-dev+bounces-1212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B79972A84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2024 09:22:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2wBj559nz2yVV;
	Tue, 10 Sep 2024 17:22:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725952941;
	cv=none; b=cVURtsBgCGGBJax/KmG5weJ/YlWBg6RlM9f7AYZ8CRnplG3WIgUYWPWGXoOfVf85Km4xZRnvaZ+/XGPYkFZ4QxUaCavw1G59awVsnMs1MxlhM4BL1+HgYiaDORjxFxcnCJl5qCCT0EvS2j9iaXON97rSdsnRJC3sBI9xV+HKxTklRB+cCZXXKTvOnVpDp2HsUfDDPFYu71f4ApI9+d+PxK2ClZQDuXknANxG+VKj7WwodkwJ1xpzJ95kFr6lJn3fBXt/uTFAinb/WL2AFWq/L/eWzUWsL34RL/kRLo8adKHSOpDbrs0cNs2EwTa0+I6EOf1TRQ0LwggyUCWdj89BRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725952941; c=relaxed/relaxed;
	bh=mNSuJkPjaGszk/6QjVxxo1sA0bso5AxEgAYw67M1VHw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P7Snu9y0DqR1nULIoq4Ejzh0+6+TudKg3s8lOgTLlTXSWZLkvDv5L2oCX9ltIg3511K9kHiL4vs8E+Uahkv/7UvYJW6pOxXWH+gEZFRN+65OhEQiKdHwmzxgQJTUApZ4XaEcSRpHLTKiwoIMj/+/85B4g2SpVYmo0K3w0Rrvetlr6mWJZWuoR8Ps6SdcBMhvjA54sxt7Vy0AAxBhFtpgThCqyx9QKGaQo4jvCqBzfRL1IxenI3mwaKfGEWABsfPzSxW1EHYz6LOO9UDLtWib7T0MF1WWCigcBSsQdqEBkcuXgbpGY++fFEnSoU5AyaBOh7JxxY9UjCYb5D1QefLaTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RKYF0GC4; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RKYF0GC4;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2wBj4xtCz2yS0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 17:22:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725952941;
	bh=mNSuJkPjaGszk/6QjVxxo1sA0bso5AxEgAYw67M1VHw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RKYF0GC40MtcKhbsq3tYIyHqWmB7ck2yxp2cpwDIkBNflR/gjzE7TYy4JbFxD6toO
	 4D6pWfc6vbTKpP2WO0a+Mi6PvOJ+KYQg6cQgZ+aHz0rnUi32Zja9SNutQ3JqIjN2v2
	 VVCjaJ5MBRsScVkGgEGbGzi1NUbWxvnRwe+jI2CzIXsKQwaseSYvI+txN1xsUsMh+c
	 wvDuhQWJ7/yQ4cfhYfKnKLMNKWXpYOHm0MHH2IU1gQ8glsckvHcGKprry3DOzKcMHi
	 5Mpar3Iz5dODy6ceALimYjqpsZi+X4mhMi4WZjFvnTC+EtYe+oIzOx9XuvN5ojQrIa
	 CejW5FQW6JY4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2wBj3xcfz4x3p;
	Tue, 10 Sep 2024 17:22:21 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Narayana Murty N <nnmlinux@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, vaibhav@linux.ibm.com,
 ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
Subject: Re: [PATCH v2] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
In-Reply-To: <66e3558d-a9a6-4caa-9102-7c22a695acda@linux.ibm.com>
References: <20240823151158.92602-1-nnmlinux@linux.ibm.com>
 <877cbq5k1y.fsf@mail.lhotse>
 <66e3558d-a9a6-4caa-9102-7c22a695acda@linux.ibm.com>
Date: Tue, 10 Sep 2024 17:22:21 +1000
Message-ID: <878qw0rn0y.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Narayana Murty N <nnmlinux@linux.ibm.com> writes:
> On 05/09/24 6:33 PM, Michael Ellerman wrote:
>> Narayana Murty N <nnmlinux@linux.ibm.com> writes:
>>> VFIO_EEH_PE_INJECT_ERR ioctl is currently failing on pseries
>>> due to missing implementation of err_inject eeh_ops for pseries.
>>> This patch implements pseries_eeh_err_inject in eeh_ops/pseries
>>> eeh_ops. Implements support for injecting MMIO load/store error
>>> for testing from user space.
>>>
>>> The check on PCI error type code is moved to platform code, since
>>> the eeh_pe_inject_err can be allowed to more error types depending
>>> on platform requirement.
>>>
>>> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
>>> ---
>>>
>>> Testing:
>>> ========
>>> vfio-test [1] by Alex Willamson, was forked and updated to add
>>> support inject error on pSeries guest and used to test this
>>> patch[2].
>>>
>>> References:
>>> ===========
>>> [1] https://github.com/awilliam/tests
>>> [2] https://github.com/nnmwebmin/vfio-ppc-tests/tree/vfio-ppc-ex
>>>
>>> ================
>>> Changelog:
>>> V1:https://lore.kernel.org/all/20240822082713.529982-1-nnmlinux@linux.ibm.com/
>>> - Resolved build issues for ppc64|le_defconfig by moving the
>>> pseries_eeh_err_inject() definition outside of the CONFIG_PCI_IOV
>>> code block.
>>> - New eeh_pe_inject_mmio_error wrapper function added to avoid
>>> CONFIG_EEH is not set.
>>   
>> I don't see why that's necessary?
>>
>> It's only called from eeh_pseries.c, which is only built for
>> PPC_PSERIES, and when PPC_PSERIES=y, EEH is always enabled.
>>
>>> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
>>> index 91a9fd53254f..8da6b047a4fe 100644
>>> --- a/arch/powerpc/include/asm/eeh.h
>>> +++ b/arch/powerpc/include/asm/eeh.h
>>> @@ -308,7 +308,7 @@ int eeh_pe_reset(struct eeh_pe *pe, int option, bool include_passed);
>>>   int eeh_pe_configure(struct eeh_pe *pe);
>>>   int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
>>>   		      unsigned long addr, unsigned long mask);
>>> -
>>> +int eeh_pe_inject_mmio_error(struct pci_dev *pdev);
>>>   /**
>>>    * EEH_POSSIBLE_ERROR() -- test for possible MMIO failure.
>>>    *
>>> @@ -338,6 +338,10 @@ static inline int eeh_check_failure(const volatile void __iomem *token)
>>>   	return 0;
>>>   }
>>>   
>>> +static inline int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
>>> +{
>>> +	return -ENXIO;
>>> +}
>>>   #define eeh_dev_check_failure(x) (0)
>>>   
>>>   static inline void eeh_addr_cache_init(void) { }
>>> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
>>> index d03f17987fca..49ab11a287a3 100644
>>> --- a/arch/powerpc/kernel/eeh.c
>>> +++ b/arch/powerpc/kernel/eeh.c
>>> @@ -1537,10 +1537,6 @@ int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
>>>   	if (!eeh_ops || !eeh_ops->err_inject)
>>>   		return -ENOENT;
>>>   
>>> -	/* Check on PCI error type */
>>> -	if (type != EEH_ERR_TYPE_32 && type != EEH_ERR_TYPE_64)
>>> -		return -EINVAL;
>>> -
>>   
>> The change log should mention why it's OK to remove these checks. You
>> add the same checks in pseries_eeh_err_inject(), but what about
>> pnv_eeh_err_inject() ?
>>
>> It is OK AFAICS, because pnv_eeh_err_inject() already contains
>> equivalent checks, but you should spell that out.
>>
>> cheers
>
> yes mpe. I do agree, your comments are addressed in V3 posted
>
> here 
> https://lore.kernel.org/all/20240909140220.529333-1-nnmlinux@linux.ibm.com/

Thanks.

cheers

