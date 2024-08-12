Return-Path: <linuxppc-dev+bounces-5-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 728D294E869
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 10:22:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=l2z15q/6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj6vq0W6Jz2xLR;
	Mon, 12 Aug 2024 18:22:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=l2z15q/6;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj6vn5MHFz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 18:22:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723450965;
	bh=lcfw1inZiY26WkBE9vW1bZ+oBgq6g2b1SX0NRq4RAIE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l2z15q/6MFaiN0srlNMCE+8oGe2oMoZxzhwu17NbZzqlb9LzO32+7q8FVs3jtv6V7
	 wMwKAMOM+md3aLWgR+0Rmnv55SnfOGDLDIMihj38Wbw84k65JXgNA+osN3HLkRU8xd
	 L67JYhVuK/ns6TwdyVghnDEocBLaqlBrT4MJapqAe0Uz17CbhjMl3rejRVje/GPmE/
	 rizyHwP1C0jeaxfQeglc7DWeVSTnl7HrLoK2dNz5L0/DGgZUIxrgi+TJnw5o+qw6tl
	 xTgafWQHN2xedeLcPf5KTMOnt+kKDBMGTXoGWEqBMdWa9ewfomKv7GJuB+bWS3+ier
	 gNKnC24MbmKiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wj6vm6nX4z4x8M;
	Mon, 12 Aug 2024 18:22:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 christophe.leroy@csgroup.eu, jeffxu@chromium.org, jeffxu@google.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com,
 pedro.falcato@gmail.com
Subject: Re: [PATCH 1/4] mm: Add optional close() to struct vm_special_mapping
In-Reply-To: <shiq5v3jrmyi6ncwke7wgl76ojysgbhrchsk32q4lbx2hadqqc@kzyy2igem256>
References: <20240807124103.85644-1-mpe@ellerman.id.au>
 <shiq5v3jrmyi6ncwke7wgl76ojysgbhrchsk32q4lbx2hadqqc@kzyy2igem256>
Date: Mon, 12 Aug 2024 18:22:44 +1000
Message-ID: <87jzgm8817.fsf@mail.lhotse>
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

"Liam R. Howlett" <Liam.Howlett@oracle.com> writes:
> * Michael Ellerman <mpe@ellerman.id.au> [240807 08:41]:
>> Add an optional close() callback to struct vm_special_mapping. It will
>> be used, by powerpc at least, to handle unmapping of the VDSO.
>> 
>> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  include/linux/mm_types.h | 2 ++
>>  mm/mmap.c                | 3 +++
>>  2 files changed, 5 insertions(+)
>> 
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index 485424979254..ef32d87a3adc 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -1313,6 +1313,8 @@ struct vm_special_mapping {
>>  
>>  	int (*mremap)(const struct vm_special_mapping *sm,
>>  		     struct vm_area_struct *new_vma);
>
> nit: missing new line?

Ack.

>> +	void (*close)(const struct vm_special_mapping *sm,
>> +		      struct vm_area_struct *vma);
>>  };
>>  
>>  enum tlb_flush_reason {
>> diff --git a/mm/mmap.c b/mm/mmap.c
>> index d0dfc85b209b..24bd6aa9155c 100644
>> --- a/mm/mmap.c
>> +++ b/mm/mmap.c
>> @@ -3624,6 +3624,9 @@ static vm_fault_t special_mapping_fault(struct vm_fault *vmf);
>>   */
>
> The above comment should probably be expanded to explain what this is
> about, or removed.

I expanded it slightly, happy for others to wordsmith it further.

>>  static void special_mapping_close(struct vm_area_struct *vma)
>>  {
>> +	const struct vm_special_mapping *sm = vma->vm_private_data;
>> +	if (sm->close)
>> +		sm->close(sm, vma);
>
> Right now we have the same sort of situation for mremap calls on
> special: we have a call to the specific vma mremap() function.
> ...
> So, are we missing an opportunity to avoid every arch having the same
> implementation here (that will evolve into random bugs existing in some
> archs for years before someone realises the cloned code wasn't fixed)?
> Do we already have a fix in ppc for the size checking that doesn't exist
> in the other archs in the case of mremap?

I took this as more of a meta comment/rant :)

Yes I agree the implementation should eventually be generic, but this series
is just about moving the existing powerpc behaviour from arch_unmap()
into this hook. 

cheers

