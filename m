Return-Path: <linuxppc-dev+bounces-6-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B0894E872
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 10:23:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GLLPI1hd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj6wP46GLz2xTm;
	Mon, 12 Aug 2024 18:23:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GLLPI1hd;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj6wP3P4zz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 18:23:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723450997;
	bh=SjGutqBaqZgjd7wqw4U0lQPoWxYx0nIAM9EvIIKTQn0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GLLPI1hdFzEgX6nkjZVe0VO4bsQo5bRJxASR4AK5UZ78M88a8/LssElM6PKMmC3FK
	 3FHQdyReAjWheTxnqGT7t23bQ0IBRdlmv3TBpQ5DDHq933iufgF1u6FN/ZQi/IJb0k
	 ZriXOcGwHS/ejpyF93YpxnyuPukCO5sKBRmscjuW1gUsHB3jNWQ8Ci7RQcAJlxli5b
	 FhqIqopot8q2+bt3mhtybarzrcFDpJHuovtkTSIESV0VBicL5JyqQ/SNWk6LBn6nEy
	 DRQi1jZIQQfXwfvWWRqP6SHKC/92pw7L6xPhGF3AmFbQTsrtjzZqJytysn/t714aRR
	 k4UxPTtzp1goQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wj6wP2FB2z4x8M;
	Mon, 12 Aug 2024 18:23:17 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linuxppc-dev@lists.ozlabs.org, torvalds@linux-foundation.org,
 akpm@linux-foundation.org, christophe.leroy@csgroup.eu,
 jeffxu@chromium.org, jeffxu@google.com, Liam.Howlett@oracle.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com,
 pedro.falcato@gmail.com
Subject: Re: [PATCH 1/4] mm: Add optional close() to struct vm_special_mapping
In-Reply-To: <1b0e07fb-33fb-4397-b03e-65698601bc70@redhat.com>
References: <20240807124103.85644-1-mpe@ellerman.id.au>
 <1b0e07fb-33fb-4397-b03e-65698601bc70@redhat.com>
Date: Mon, 12 Aug 2024 18:23:16 +1000
Message-ID: <87h6bq880b.fsf@mail.lhotse>
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

David Hildenbrand <david@redhat.com> writes:
> On 07.08.24 14:41, Michael Ellerman wrote:
>> Add an optional close() callback to struct vm_special_mapping. It will
>> be used, by powerpc at least, to handle unmapping of the VDSO.
>> 
>> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>   include/linux/mm_types.h | 2 ++
>>   mm/mmap.c                | 3 +++
>>   2 files changed, 5 insertions(+)
>> 
>> diff --git a/mm/mmap.c b/mm/mmap.c
>> index d0dfc85b209b..24bd6aa9155c 100644
>> --- a/mm/mmap.c
>> +++ b/mm/mmap.c
>> @@ -3624,6 +3624,9 @@ static vm_fault_t special_mapping_fault(struct vm_fault *vmf);
>>    */
>>   static void special_mapping_close(struct vm_area_struct *vma)
>>   {
>> +	const struct vm_special_mapping *sm = vma->vm_private_data;
>
> I'm old-fashioned, I enjoy an empty line here ;)

Ack.

>> +	if (sm->close)
>> +		sm->close(sm, vma);
>
> Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks.

cheers

