Return-Path: <linuxppc-dev+bounces-14160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5729CC5A29F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 22:41:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6txk0mfPz2xqr;
	Fri, 14 Nov 2025 08:41:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763059483;
	cv=none; b=b8MfJZaS5O/hj85A/Ecv6gpFpuFAWCEe4gzEGoUczbpizScPCFIFSIXQ+bC8++tIV247vfdUnsMe1Ml3U4xt32KLM3rOhVgc4UEm7PQoG9rZnjW/8+2wqcfkFzLInBhzsP3xfzduMk2HHyN7Nrmth2rIPUSzHBso2m2WTlgthHcqHHyGM1KtSyZNCj4YeweTZ4VDZsVKWJdLcpc3VSMC6KTmBtr/DIDTNUz70T2KklZf/mL0sYZUZ6SNP8yfocZKQjO/FLDurdpHFZLNgW7xofOIJ9RD5uAd55Y2lZJGpHOej9ERqH6rFXvCLOqfSBseP6BuUf/YL8m0mooySX2SBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763059483; c=relaxed/relaxed;
	bh=ZIbcxtUs2WANG22zdr2IA7CVjhetoWXTZzjAD8xbfKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UpvkMYJEZ8afzGEfN06D33rEd6kd3PXgp9WbvxPA/8atDGoYOtOmZtxxdHJAbSjNMFMq0HFt2pNhWHkbe8a0tcTQgwsIOF84p1bHkJAOg1fOWE+NYXGZWhMG8NBO+4cMfU3Nq9R9kCCeUwWmoKqiu8ISj0ZQCpZrse6I/6Gg2ZOcjZ2M1vrHsM9GCWZaDKWfBgCeR3PFOmP9MZInNeoDZuoV/9KPts9buCL0raOANmAuWzu3/YQ78ufPMeecIMT6TiuugfeW4ZKTq1nXXWQHT17l04JamhNMYG+Eow4TjhWz/u7JLojqc92CU86B5tueKtVGCPL+bt+keIXsDNyhxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pC0cZpHv; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pC0cZpHv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6q22182Mz2ynC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 05:44:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94237439BA;
	Thu, 13 Nov 2025 18:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9161C19421;
	Thu, 13 Nov 2025 18:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763059479;
	bh=RE5P0X9RyxwuZjuBP8m4q0k+WYSIyGbR3hJ44uf4r7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pC0cZpHvF6d0hLbVgoHS87+c6/lwBz35mdlUvl+etMUkoQnyYhzYKdq2Y6LU9nGsL
	 TyIbKCToQbXil/j7Hqc2snvjgEbSuvrBmloVgxHooOPwgNH+R0THEcYG4brJgOo6M8
	 bqZp04im0C6eLsy+xT+Mro2rnnIa+sLi32Njq6GAliFD2kKvOJkNmUSsSp6CSqWxjD
	 gXUyK8iE4eLp8CE7dWr+FSbvrhhoxms/LwucBVOTfQjAdZGyUEuJe5ycL/jzDB7B5G
	 c+urL7KgfK111uclHjIboI/TfOcSAS6d252bJxTcdqfHzq3R+2MwtEVtqZJeohqgxr
	 eCxQROZG94TZg==
Message-ID: <027b6ac9-836d-4f89-a819-e24d487f9c8e@kernel.org>
Date: Thu, 13 Nov 2025 19:44:31 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm: fix MAX_FOLIO_ORDER on powerpc configs with
 hugetlb
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Donet Tom
 <donettom@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
References: <20251112145632.508687-1-david@kernel.org>
 <eaf2e733-f967-43bb-88e6-7876a28a370c@lucifer.local>
 <3fa6d496-b9de-4b66-a7db-247eebec92ca@kernel.org>
From: Christophe Leroy <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <3fa6d496-b9de-4b66-a7db-247eebec92ca@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 13/11/2025 à 16:21, David Hildenbrand (Red Hat) a écrit :
> On 13.11.25 14:01, Lorenzo Stoakes wrote:
> 
> [...]
> 
>>> @@ -137,6 +137,7 @@ config PPC
>>>       select ARCH_HAS_DMA_OPS            if PPC64
>>>       select ARCH_HAS_FORTIFY_SOURCE
>>>       select ARCH_HAS_GCOV_PROFILE_ALL
>>> +    select ARCH_HAS_GIGANTIC_PAGE        if ARCH_SUPPORTS_HUGETLBFS
>>
>> Given we know the architecture can support it (presumably all powerpc
>> arches or all that can support hugetlbfs anyway?), this seems reasonable.
> 
> powerpc allows for quite some different configs, so I assume there are 
> some configs that don't allow ARCH_SUPPORTS_HUGETLBFS.

Yes indeed. For instance the powerpc 603 and 604 have no huge pages.

> 
> [...]
> 
>>>   /*
>>>    * There is no real limit on the folio size. We limit them to the 
>>> maximum we
>>> - * currently expect (e.g., hugetlb, dax).
>>> + * currently expect: with hugetlb, we expect no folios larger than 
>>> 16 GiB.
>>
>> Maybe worth saying 'see CONFIG_HAVE_GIGANTIC_FOLIOS definition' or 
>> something?
> 
> To me that's implied from the initial ifdef. But not strong opinion 
> about spelling that out.
> 
>>
>>> + */
>>> +#define MAX_FOLIO_ORDER        get_order(SZ_16G)
>>
>> Hmm, is the base page size somehow runtime adjustable on powerpc? Why 
>> isn't
>> PUD_ORDER good enough here?
> 
> We tried P4D_ORDER but even that doesn't work. I think we effectively 
> end up with cont-pmd/cont-PUD mappings (or even cont-p4d, I am not 100% 
> sure because the folding code complicates that).
> 
> See powerpcs variant of huge_pte_alloc() where we have stuff like
> 
> p4d = p4d_offset(pgd_offset(mm, addr), addr);
> if (!mm_pud_folded(mm) && sz >= P4D_SIZE)
>      return (pte_t *)p4d;
> 
> As soon as we go to things like P4D_ORDER we're suddenly in the range of 
> 512 GiB on x86 etc, so that's also not what we want as an easy fix. (and 
> it didn't work)
> 

On 32 bits there are only PGDIR et Page Table,

PGDIR_SHIFT = P4D_SHIFT = PUD_SHIFT = PMD_SHIFT

For instance on powerpc 8xx,
PGDIR_SIZE is 4M
Largest hugepage is 8M.

So even PGDIR_ORDER isn't enough.

Christophe

