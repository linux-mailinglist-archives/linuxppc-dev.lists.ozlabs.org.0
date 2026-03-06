Return-Path: <linuxppc-dev+bounces-17833-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMWLEgD7qmmcZAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17833-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 17:04:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57073224843
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 17:04:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSB6g2bzJz3bfV;
	Sat, 07 Mar 2026 03:04:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772813051;
	cv=none; b=XzrjwWY+o/9+3DLF/orvdeA0IG1lCPPUrHd++fiCdhOpG7XErSAfzij6LakUBDjj3FtxZl5Yz4h3MPFH1zcxuIP2DPgkbIqj8HPOgOhS2glHyWg+vXoDXg40zVeLSKvFwRHGtbMsb+KccePR6H0UtDe3KbMuRaNvpK8q7nyhDUFYam8CgmFfLI0wJRL55tzcApqL6iUkbmbapi5DyiZlNGInx+i05yZJJvYgSbbV0C2fgkoR3q74oT05L9GkI0C6hvUzP+i6yZpZhpuoExeP7jXh+dBSQjcUGhO2UNyVl8syCOr386SMtoTu1W6cFNV0ydcfdkPC/XfYxu8K6vLpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772813051; c=relaxed/relaxed;
	bh=9Sf674e62OrP6q7VHgZGXjlWjApvXfTWUBTCBNqcAPE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UifVE5kVuXag7iVq2BAcRk6iRSfZf2KSnMvf/PLZJUaoOy66QX+yVTV6tMutpsCm1q1zyhIZbW3iKw2UUst5BluDs/9SeJW2nt3qW/VojxhAfZYTvx8w17stYdIuoePg+S535yK/vXMdwEkZs0NWiQ11HnGqjK7DIohQ7xPH9URQ3Ls7yzJOORm0HowwHlBWIRwzvTr28nMdUc8YNx61/dorGfJK3ca0/evdDUXd0oDNIC0O/NR0CoQDZn62TamJclIQeoe86ucSLUlh3vk4vZArfDXs1cq44RlsK48t7JFaVU72gRgNVFMH0V7MGWJnFDalbXsfPUyEf3vc0APnbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NyRMpeAc; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NyRMpeAc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSB6f3tXfz2ySS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 03:04:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B30B341A7A;
	Fri,  6 Mar 2026 16:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7B4C4CEF7;
	Fri,  6 Mar 2026 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772813048;
	bh=rDwyViAwJBrWqHHIJBFX6WS4Aph53FS/v3jxwcha0Dg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=NyRMpeAc4u6y1bOweC+oL1pis1n9yLFuTtLwnaUrYwqVmS04JztDPODWebMOjtgHG
	 8Fbr6g27cgQp5m17yZbh7JI8fGZ10S9y0Cr+pcX4HVLSzfam0/RHeiP22aiFXmTcSO
	 m0JAkjjIdvcoeV0GjSXsbjx1PSem9FDJLdlR9l9XuQ7+JD77UCoo/+4blAoFrFHjtL
	 4lmP/E5Rc6HT7h8C6PmXHl7OCQQzJE8sLKpJ3BhxpLtIzac0pBDjbI8v8Sn+lsg4pM
	 tBbGfrIkl+EK0Z5f0OcPdpEvn/ccg8GzXxJT1Z9Fkm2SnytuuVu3o7hx2RjZi50Rbj
	 AaMG4PpMzZF8w==
Message-ID: <b4830560-4459-42eb-918f-23b35bb5cc2a@kernel.org>
Date: Fri, 6 Mar 2026 17:03:57 +0100
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
Subject: Re: [PATCH v6 11/13] mm/util: Add flag to track device private pages
 in page snapshots
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ziy@nvidia.com, apopple@nvidia.com, lorenzo.stoakes@oracle.com,
 lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 rcampbell@nvidia.com, mpenttil@redhat.com, jgg@nvidia.com,
 willy@infradead.org, linuxppc-dev@lists.ozlabs.org,
 intel-xe@lists.freedesktop.org, jgg@ziepe.ca, Felix.Kuehling@amd.com,
 jhubbard@nvidia.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 ying.huang@linux.alibaba.com
References: <20260202113642.59295-1-jniethe@nvidia.com>
 <20260202113642.59295-12-jniethe@nvidia.com>
 <e5374250-6fa6-4d39-8a0f-4b1804c35dbe@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <e5374250-6fa6-4d39-8a0f-4b1804c35dbe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 57073224843
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17833-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,oracle.com,redhat.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au,linux.alibaba.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:ying.huang@linux.alibaba.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email]
X-Rspamd-Action: no action

On 3/6/26 17:02, David Hildenbrand (Arm) wrote:
> On 2/2/26 12:36, Jordan Niethe wrote:
>> A future change will remove device private pages from the physical
>> address space. This will mean that device private pages no longer have
>> normal pfns and must be handled separately.
>>
>> Add a new flag PAGE_SNAPSHOT_DEVICE_PRIVATE to track when the pfn of a
>> page snapshot is a device private page.
>>
>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> ---
>> v1:
>>   - No change
>> v2:
>>   - No change
>> v3:
>>   - No change
>> v4:
>>   - Move logical continuation to previous line
>> ---
>>  fs/proc/page.c     | 6 ++++--
>>  include/linux/mm.h | 7 ++++---
>>  mm/util.c          | 3 +++
>>  3 files changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/proc/page.c b/fs/proc/page.c
>> index f9b2c2c906cd..bc14f7ebc369 100644
>> --- a/fs/proc/page.c
>> +++ b/fs/proc/page.c
>> @@ -191,10 +191,12 @@ u64 stable_page_flags(const struct page *page)
>>  	         folio_test_large_rmappable(folio)) {
>>  		/* Note: we indicate any THPs here, not just PMD-sized ones */
>>  		u |= 1 << KPF_THP;
>> -	} else if (is_huge_zero_pfn(ps.pfn)) {
>> +	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE) &&
>> +		   is_huge_zero_pfn(ps.pfn)) {
>>  		u |= 1 << KPF_ZERO_PAGE;
>>  		u |= 1 << KPF_THP;
>> -	} else if (is_zero_pfn(ps.pfn)) {
>> +	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE) &&
>> +		   is_zero_pfn(ps.pfn)) {
>>  		u |= 1 << KPF_ZERO_PAGE;
>>  	}
>>  
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index f0d5be9dc736..a52979536a5e 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -4627,9 +4627,10 @@ static inline bool page_pool_page_is_pp(const struct page *page)
>>  }
>>  #endif
>>  
>> -#define PAGE_SNAPSHOT_FAITHFUL (1 << 0)
>> -#define PAGE_SNAPSHOT_PG_BUDDY (1 << 1)
>> -#define PAGE_SNAPSHOT_PG_IDLE  (1 << 2)
>> +#define PAGE_SNAPSHOT_FAITHFUL		(1 << 0)
>> +#define PAGE_SNAPSHOT_PG_BUDDY		(1 << 1)
>> +#define PAGE_SNAPSHOT_PG_IDLE		(1 << 2)
>> +#define PAGE_SNAPSHOT_DEVICE_PRIVATE	(1 << 3)
>>  
>>  struct page_snapshot {
>>  	struct folio folio_snapshot;
>> diff --git a/mm/util.c b/mm/util.c
>> index 97cae40c0209..65e3f1a97d76 100644
>> --- a/mm/util.c
>> +++ b/mm/util.c
>> @@ -1218,6 +1218,9 @@ static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
>>  
>>  	if (folio_test_idle(folio))
>>  		ps->flags |= PAGE_SNAPSHOT_PG_IDLE;
>> +
>> +	if (is_device_private_page(page))
>> +		ps->flags |= PAGE_SNAPSHOT_DEVICE_PRIVATE;
> 
> stable_page_flags() has access to the page and can simply test that instead?
> 

Or maybe even better, if the pfn has no meaning, set it to 0 or -1, or
anything that will make the other code just ignore it.

-- 
Cheers,

David

