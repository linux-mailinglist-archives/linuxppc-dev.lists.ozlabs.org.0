Return-Path: <linuxppc-dev+bounces-16816-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Riv0KCL3jGk1wQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16816-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 22:39:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AB8127CBE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 22:39:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBBfK43xCz2xHt;
	Thu, 12 Feb 2026 08:39:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770817554;
	cv=none; b=HLNb7N5aW8fMiyKFieVEkPiLD01hDcKN0Ha8ciC74C/sEsf1A+ADivppMosPp15DFwM6Jk71C+4/I3IN2jEHRsHoe4PO6i9eg8uDWyzHdWXEaSCa4kHog8/xtlEz5/kSBXBjzoSEjex7qn6cp7cGSxyBugsr4SMxVdsBlQAR+OrFC9L6gtuh/r+1yvfuhualCFfcHOer+l5v85hepMjof6UCwvgCxKbymNFk1UJheOWhBowlMyUnn9R/WbhI8wYMP6uBqafTY8MhpYF+vq2c5ZzPfwNn5X+apt6C59FUkUR6PjFFQZRX8O+NQYimcQN/GggJHl5BfsESo6aH7Pvyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770817554; c=relaxed/relaxed;
	bh=AvbV/7yBLNX8l/Q3y3FXi6sUQ6jYM1ujaQvV+NINbwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ortbRWqs+VcFXJAR2ddmAM77QURumQQlbYRAJiIADIGhIZeO0Tj1T1Ah5afjMn2Vi7S2Z823RtGxYvnxJQX9B4kqEsXCtvqP2mrasz3Sr4/MezBCCKkuNVb2n6NKOGLaNtEU+5tEGS8Gra1v0IcWiK94ceAiH2GwAL6IcjD79rZ3r9OYcTHBjc14FVO9jXy8mqAqlyc2Yw4mSIAurYoo76ShllDkMAHLT86R02VWYqKUQbt3B1zKZpe9COS6BYwiAr2h42S3hpRa2Pb74Yc7HFEo/1e/l+ZlgAx5++1zLsitYDGhihXyswxtMQ4AnOwJaeQaYDwUj+eRWuBBXF7+ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KTkCq28T; dkim-atps=neutral; spf=pass (client-ip=95.215.58.177; helo=out-177.mta1.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KTkCq28T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.177; helo=out-177.mta1.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 428 seconds by postgrey-1.37 at boromir; Thu, 12 Feb 2026 00:45:50 AEDT
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fB07f6j7dz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 00:45:50 +1100 (AEDT)
Message-ID: <735c0277-2155-47f5-a650-b4c8a0a2e6fc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770817101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AvbV/7yBLNX8l/Q3y3FXi6sUQ6jYM1ujaQvV+NINbwk=;
	b=KTkCq28TEAtcHJtPGFZ/oKU8vD4gE8s1v/eM0FDHslaVRDzQDOvgbM71iCr6Pzgy+Spxsz
	evXRXBoMAsjI/Ec6zEqMkgSSphZQpvv9wrKwI5q/izSGw5wgkZUgK6soksEZU9HWq9rx3W
	FPXHMoVaAFe+ylRDS4SuNauNPCVGj+I=
Date: Wed, 11 Feb 2026 13:38:17 +0000
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
Subject: Re: [RFC 1/2] mm: thp: allocate PTE page tables lazily at split time
Content-Language: en-GB
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, lorenzo.stoakes@oracle.com,
 willy@infradead.org, linux-mm@kvack.org
Cc: fvdl@google.com, hannes@cmpxchg.org, riel@surriel.com,
 shakeel.butt@linux.dev, kas@kernel.org, baohua@kernel.org, dev.jain@arm.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, Liam.Howlett@oracle.com,
 ryan.roberts@arm.com, vbabka@suse.cz, lance.yang@linux.dev,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20260211125507.4175026-1-usama.arif@linux.dev>
 <20260211125507.4175026-2-usama.arif@linux.dev>
 <13ab56cb-7fdb-4ee4-9170-f9f4fa4b6e37@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <13ab56cb-7fdb-4ee4-9170-f9f4fa4b6e37@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16816-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@suse.cz,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 22AB8127CBE
X-Rspamd-Action: no action



On 11/02/2026 13:25, David Hildenbrand (Arm) wrote:
> CCing ppc folks
> 
> On 2/11/26 13:49, Usama Arif wrote:
>> When the kernel creates a PMD-level THP mapping for anonymous pages,
>> it pre-allocates a PTE page table and deposits it via
>> pgtable_trans_huge_deposit(). This deposited table is withdrawn during
>> PMD split or zap. The rationale was that split must not fail—if the
>> kernel decides to split a THP, it needs a PTE table to populate.
>>
>> However, every anon THP wastes 4KB (one page table page) that sits
>> unused in the deposit list for the lifetime of the mapping. On systems
>> with many THPs, this adds up to significant memory waste. The original
>> rationale is also not an issue. It is ok for split to fail, and if the
>> kernel can't find an order 0 allocation for split, there are much bigger
>> problems. On large servers where you can easily have 100s of GBs of THPs,
>> the memory usage for these tables is 200M per 100G. This memory could be
>> used for any other usecase, which include allocating the pagetables
>> required during split.
>>
>> This patch removes the pre-deposit for anonymous pages on architectures
>> where arch_needs_pgtable_deposit() returns false (every arch apart from
>> powerpc, and only when radix hash tables are not enabled) and allocates
>> the PTE table lazily—only when a split actually occurs. The split path
>> is modified to accept a caller-provided page table.
>>
>> PowerPC exception:
>>
>> It would have been great if we can completely remove the pagetable
>> deposit code and this commit would mostly have been a code cleanup patch,
>> unfortunately PowerPC has hash MMU, it stores hash slot information in
>> the deposited page table and pre-deposit is necessary. All deposit/
>> withdraw paths are guarded by arch_needs_pgtable_deposit(), so PowerPC
>> behavior is unchanged with this patch. On a better note,
>> arch_needs_pgtable_deposit will always evaluate to false at compile time
>> on non PowerPC architectures and the pre-deposit code will not be
>> compiled in.
> 
> Is there a way to remove this? It's always been a confusing hack, now it's unpleasant to have around :)


I spent some time researching this (I havent worked with PowerPC before)
as I really wanted to get rid of all the pre-deposit code. I cant really see a
way without removing PMD THP support. I was going to CC the PowerPC maintainers
but I see that you already did!

> 
> In particular, seeing that radix__pgtable_trans_huge_deposit() just 1:1 copied generic pgtable_trans_huge_deposit() hurts my belly.
> 
> 
> IIUC, hash is mostly used on legacy power systems, radix on newer ones.
> 

Yes that is what I found as well.

> So one obvious solution: remove PMD THP support for hash MMUs along with all this hacky deposit code.
> 

I would be happy with that!

> 
> the "vma_is_anonymous(vma) && !arch_needs_pgtable_deposit()" and similar checks need to be wrapped in a reasonable helper and likely this all needs to get cleaned up further.

Ack. The code will definitely look a lot lot cleaner and wont have much of this if we decide to remove
PMD THP support for hash MMU.

> 
> The implementation if the generic pgtable_trans_huge_deposit and the radix handlers etc must be removed. If any code would trigger them it would be a bug.
> 
> If we have to keep this around, pgtable_trans_huge_deposit() should likely get renamed to arch_pgtable_trans_huge_deposit() etc, as there will not be generic support for it.
> 

Ack.

