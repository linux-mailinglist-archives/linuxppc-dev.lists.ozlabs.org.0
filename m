Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E138A84C227
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 02:55:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jqrBW1kT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TV39963nNz3bwX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 12:55:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jqrBW1kT;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TV38Q3L9Hz2yk6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 12:54:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1707270886;
	bh=Ed3hv0ypeorYKmXnBoU6PQb0zpT3dnPWJvA2VbVGzmQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jqrBW1kTKYqoVFL02UBqmDCUti603ksCKpwD9GKkG6TD0JwygOsERseiujWb/gNxo
	 YhrfNA882UhyyuiYWw1MbdElOMpyCiywl/ENnmbznpXNTH++pfrilba0Cd0mA6rNAW
	 J6J/aA7mc3JFmHsWMIjXZWX9PYvEgnqk0yJyQpM+B4wQCHkIsxwGVG3gpvL51CA75f
	 XYwSsr1XGthqEavZ1NlBMiQuwT5Agsx/UCpwXakK5ApRcCiYtWSoHsdZB9ZAmzrsIR
	 Oe0CNJTzzclfLs/IMN/UWUqUORNYYezWPIAmJLwlEUNwjkkyljEbDfXmyEDZjLmKCT
	 9V7DLTNbbe1zw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TV38Q1j1Qz4wcR;
	Wed,  7 Feb 2024 12:54:46 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v2 1/2] powerpc: Add Power11 architected and raw mode
In-Reply-To: <5306f4b2-5f94-4253-95b2-9da6d01be59d@linux.ibm.com>
References: <20240205075808.174477-1-maddy@linux.ibm.com>
 <8734u7b8td.fsf@kernel.org>
 <5306f4b2-5f94-4253-95b2-9da6d01be59d@linux.ibm.com>
Date: Wed, 07 Feb 2024 12:54:45 +1100
Message-ID: <87jznh82e2.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Madhavan Srinivasan <maddy@linux.ibm.com> writes:
> On 2/5/24 2:13 PM, Aneesh Kumar K.V wrote:
>> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
>>
>>> reg.h is updated with Power11 pvr. pvr_mask value of 0x0F000007
>>> means we are arch v3.1 compliant.
...
>>> diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
>>> index 98bd4e6c1770..8c24fc67d90f 100644
>>> --- a/arch/powerpc/kernel/cpu_setup_power.c
>>> +++ b/arch/powerpc/kernel/cpu_setup_power.c
>>> @@ -286,3 +286,13 @@ void __restore_cpu_power10(void)
>>>   	init_HFSCR();
>>>   	init_PMU_HV();
>>>   }
>>> +
>>> +void __setup_cpu_power11(unsigned long offset, struct cpu_spec *t)
>>> +{
>>> +	return __setup_cpu_power10(offset, t);
>>> +}
>>> +
>>> +void __restore_cpu_power11(void)
>>> +{
>>> +	return __restore_cpu_power10();
>>> +}
>>>
>> Do we need to duplicate these functions if they don't add anything
>> extra?
>
> What will be the preference in case of macros? Should we re-use
> power10 macros in the table instead of defining new macros.

I guess I would say yes to defining new macros, eg.

+#define CPU_FTRS_POWER11	CPU_FTRS_POWER10

That is good to have because someone will eventually grep for
CPU_FTRS_POWER11 and expect to find it.

On the other hand global functions that do nothing but call the power10
version are not the best, because they will (slightly) bloat the binary
for no real gain.

cheers
