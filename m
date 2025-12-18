Return-Path: <linuxppc-dev+bounces-14860-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CDECCB4A6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 11:02:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dX5n26zL5z2xrM;
	Thu, 18 Dec 2025 21:02:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766052134;
	cv=none; b=GL1RK/NNiZA/dch/73W3q7huxHUJ01wRBRGa1Ni1bNngTyq5wKlYV4qMr3Rqiu+o6CT7SY1qjEB2KevsqbGFU6eF9VSscs0g6NGOzO59STBsXC/QM42BGVEhR8/S4uP/5dUDsKRyOw74kHATfZNPMIQuDf5nlh/+x7ngmWYI2nsHMO19Am8SqUqtFnOhLt4qX/WvejSKPaobdRW/PXcjDdwFexl4ohZkPfklk0XGaUwRhjZuzg02wmJ8JuhbY7ufqc5PPZv7ziAiNiSiS6j8+i5x/gS1q59EAbsT+EPu0jogiMlIPW1GPg96/KKoBYtf1hWTw/RaLlWGN0WPyB8lfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766052134; c=relaxed/relaxed;
	bh=jXayoTaQ77V2XANAImmfYENdHOut0SX0pqYydj8KJmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BHm0C2MU2oV/ImGluguDyN5kpxUHsE/Saatsuqh6mXQy8aVRQ4jwoTlJsnrVns/wdTxqLDnJYfLq0TjY465mMHAU+zTKKi+AFtmF1phDVnJYc9iAZzmRPkM/dX+N7IzVDtOGwR9IgkbPIIE1AC56iTkwQsAgVZ3f2DELzSKMb7JLVF7xnMhvk0h8okEn7ZT+rEQaxLWiTU4nmcT0MFqexXHz8BxUTPXtaYfdXIsluRaEBNkzAglYGgxK4odw6IZO0GRJXfjYn/JRbtX6ThN5M7xUKM2ttffRkD5gqA+oBtrVXE7Rpi0GNiWC3l1Elwf3KLGxK617dt2h6r0ixfiTRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qUxR5p9n; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qUxR5p9n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dX5n14Phyz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 21:02:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6565060008;
	Thu, 18 Dec 2025 10:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05ADCC4CEFB;
	Thu, 18 Dec 2025 10:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766052130;
	bh=Nw8/xPqRtJ3jr9PSKxoQ1BcdKB0FWuTnbRQXps9AJuA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=qUxR5p9nLaGIa2IPol7GwO939YNt4cI6BRodAmVjF0+8L62Ffd2H5W0CeL07eFj3X
	 5farBmoQooRnqvZDzrtSUiOU43l64FLfBe4wILCSDYkNOXbYuEgUsUT8X6CXQYq2cQ
	 Maxo/huPBXAcATB8n7EoL9p7yl22QHDPL1PZ4p/EnQPnyzHfHNGXaFyCdixFqMSukR
	 dBoQm42UODTkVcUfdc8SdQw/3dmKFNwPiEa9rLlZ/tgVTTPCYWK3JR+UMJpxPMp2mz
	 y0Ox1jt27Qr7NiXyK6nzHn5U7juAH31r1UuHLge7X4DKioWpwQCiZx0bJFhjs7FUNw
	 XxqgeEWeLeGTg==
Message-ID: <ee42b057-b2d1-4a61-a6b0-39f81f78a918@kernel.org>
Date: Thu, 18 Dec 2025 11:01:59 +0100
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
Subject: Re: [RFC PATCH 1/2] mm/pgtable: use ptdesc for pmd_huge_pte
To: Alex Shi <seakeel@gmail.com>, alexs@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S . Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Thomas Huth <thuth@redhat.com>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Magnus Lindholm <linmag7@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org
References: <20251214065546.156209-1-alexs@kernel.org>
 <52e2c1eb-67cf-41ee-9088-760fb6258153@gmail.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <52e2c1eb-67cf-41ee-9088-760fb6258153@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/15/25 01:53, Alex Shi wrote:
> 
> 
> On 2025/12/14 14:55, alexs@kernel.org wrote:
>> From: Alex Shi<alexs@kernel.org>
>>
>> 'pmd_huge_pte' are pgtable variables, but used 'pgtable->lru'
>> instead of pgtable->pt_list in pgtable_trans_huge_deposit/withdraw
>> functions, That's a bit weird.
>>
>> So let's convert the pgtable_t to precise 'struct ptdesc *' for
>> ptdesc->pmd_huge_pte, and mm->pmd_huge_pte, then convert function
>> pgtable_trans_huge_deposit() to use correct ptdesc.
>>
>> This convertion works for most of arch, but failed on s390/sparc/powerpc
>> since they use 'pte_t *' as pgtable_t. Is there any suggestion for these
>> archs? If we could have a solution, we may remove the pgtable_t for other
>> archs.
> 
> If s390/sparc/powerpc can't align pgtable_t with others, we have to keep
> the pgtable_t to bridge different types. But we could take step to
> change pgtable_t as 'struct ptdesc *' in other archs. That could
> simplify and clarify related code too, isn't it?

Not sure. s390 and friends squeeze multiple actual page tables into a 
single page and that single page has a single ptdesc.

I was rather hoping that we can make the code more consistent by making 
everybody just point at the start of the page table? (that is, make it 
consistent for all, not use ptdesc for some and pte_t * for others)

-- 
Cheers

David

