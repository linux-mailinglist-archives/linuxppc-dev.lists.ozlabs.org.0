Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2B37A9450
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 14:39:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R8UsfmiZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrw2l5gPLz3cRX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 22:39:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R8UsfmiZ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrw1q5mvkz3c12
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 22:38:55 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Rrw1q5NHFz4x5K; Thu, 21 Sep 2023 22:38:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1695299935;
	bh=CLkOspf+4HZWLuETs6pfGw9Yv+ayf/DSw9/WnUp2Bus=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R8UsfmiZrwWPAjvUKTvRDSsMCcMOQ7lybntnt5aM7AKtRcs3rQ65JHuvZGGjO9MOz
	 CEWvEsL0LYrI/11nWO0+YOMm+9LgXUyfVKZ7mU0g2fnROpxerwFEWwEOVqKfIHd1Rn
	 OPvjQ+Km1xYyD1OpPp+O83cX9aa4W0+pCbv8n7v4f+82X9H4iHEBqr+yWgZBCZ5B07
	 Pi/ivmP/pAd3TVLQJLcgHTo7TrXs1sTOpuXn3AjYqKLwJV0g632HisC8UivynkP6j5
	 1rVR0GieJV7rNjeANDOjxcJ5qma1v7VRhEJe+T7PWT6bY3CpAitDM96ZSsIwuyd2+J
	 LIKUBbhctkXEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rrw1q4cQxz4x5J;
	Thu, 21 Sep 2023 22:38:55 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Aditya Gupta
 <adityag@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v2 1/2] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
In-Reply-To: <87y1h1vy53.fsf@linux.ibm.com>
References: <20230920105706.853626-1-adityag@linux.ibm.com>
 <87y1h1vy53.fsf@linux.ibm.com>
Date: Thu, 21 Sep 2023 22:38:55 +1000
Message-ID: <87y1gzn1k0.fsf@mail.lhotse>
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Sachin Sant <sachinp@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Aditya Gupta <adityag@linux.ibm.com> writes:
>
>> Since below commit, address mapping for vmemmap has changed for Radix
>> MMU, where address mapping is stored in kernel page table itself,
>> instead of earlier used 'vmemmap_list'.
>>
>>     commit 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use
>>     a different vmemmap handling function")
>>
>> Hence with upstream kernel, in case of Radix MMU, makedumpfile fails to do
>> address translation for vmemmap addresses, as it depended on vmemmap_list,
>> which can now be empty.
>>
>> While fixing the address translation in makedumpfile, it was identified
>> that currently makedumpfile cannot distinguish between Hash MMU and
>> Radix MMU, unless VMLINUX is passed with -x flag to makedumpfile.
>> And hence fails to assign offsets and shifts correctly (such as in L4 to
>> PGDIR offset calculation in makedumpfile).
>>
>> For getting the MMU, makedumpfile uses `cur_cpu_spec.mmu_features`.
>>
>> Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
>> `cpu_spec` struct, to VMCOREINFO, so that makedumpfile can assign the
>> offsets correctly, without needing a VMLINUX.
>>
>> Fixes: 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use a different vmemmap handling function")
>> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
>> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
>> Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
>>
>> ---
>> Corresponding makedumpfile patches to fix address translation, in Radix
>> MMU case:
>>
>> Link: https://lore.kernel.org/kexec/B5F0F00E-F2B1-47D7-A143-5683D10DC29A@linux.ibm.com/T/#t
>> ---
>> ---
>>  arch/powerpc/kexec/core.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
>> index de64c7962991..369b8334a4f0 100644
>> --- a/arch/powerpc/kexec/core.c
>> +++ b/arch/powerpc/kexec/core.c
>> @@ -63,6 +63,8 @@ void arch_crash_save_vmcoreinfo(void)
>>  #ifndef CONFIG_NUMA
>>  	VMCOREINFO_SYMBOL(contig_page_data);
>>  #endif
>> +	VMCOREINFO_SYMBOL(cur_cpu_spec);
>> +	VMCOREINFO_OFFSET(cpu_spec, mmu_features);
>>  #if defined(CONFIG_PPC64) && defined(CONFIG_SPARSEMEM_VMEMMAP)
>>  	VMCOREINFO_SYMBOL(vmemmap_list);
>>  	VMCOREINFO_SYMBOL(mmu_vmemmap_psize);
>>
>
> That implies we now have to be careful when updating MMU_FTR_* #defines.
 
Yeah, that's a good point.

> It is not bad considering other hacks we do in crash to identify kernel
> changes tied to version number. But i am wondering if there another way
> to identify radix vs hash?

Ultimately crash just has to accept that the kernel will change over
time, and some times crash will have to adapt.

We can try not to change values unnecessarily, but given the knowledge
of kernel internals crash has there will be breakage from time to time.

The only other alternative I think is to create a well defined data
structure that is explicitly provided by the kernel for crash with
various information in a set format. With a committment that the data
structure will be maintained in a forward-compatible manner. Which
sounds like a bunch of work :)

cheers
