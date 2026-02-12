Return-Path: <linuxppc-dev+bounces-16847-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFIJIYsHjmkT+wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16847-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 18:02:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0649112FC41
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 18:01:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBhRS046qz2yQj;
	Fri, 13 Feb 2026 04:01:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.178
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770910036;
	cv=none; b=LUrv/mo6N61kXHO+0Hh1za/dWFEGT37VlTX2G0M1a0D9TLhqVtg+u+WOJUCCmIN1M/84Vqsd1uOFGUBoOALTOzYIiKVuSbLg/8Wjf9KWWO6me5Vxyqh35z6q2XlgZ/s4vFku1sCi+R83vDaa0aMdBt8/K1ovjGl02+UuiXmX85ra/8BkbzPUcvBbHehH420VnnbFYn5k1WBC0R5HiMJ+dclGPVDmsLok9y2npXuF+f85S95kInsQ/NHhEGU+dT57ClJGeEy+lr8dzDegJiXd6pe8j1EjPoLru7HBSrR+2Ii+/yeOiReMIFFwLt8mTMo+OVS3C28c81Qfd60k9EEzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770910036; c=relaxed/relaxed;
	bh=3md81SdFS4TjjB0AXkEg5ItTPXkzpc4iibpel7Bvl6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvwtOoKO4G/6h0nEbJTfLfvXe4rr7YmeRyJDJaYzriDwdK2iZZXQyv1w6mJ1bPziHcFw8TOsgwbkWiGAuoLE6/nHj4Srg3e3LWkLAL6xNpzH+yeFcNYE/vkcOCa69rT6XxNVGV7Z8/kcploybafgGU56+zf2yFbwyXIigm4rfLmJDcILHT5Pw6s0uDbIJmZMNKOv4BXxD+KNoxfFNJRqarIm6oQfxx0u6bPiqV9S3/9aZ88jtoJJl7j9J47f3ncQ+1DCyHTAO/pA6xn8GyJ7r3cQ7J0WrQUM7vqtINKooJi0mfqnORpAR5aeUZQsylwLgbxp9OM7iVko4cWRzWGHPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hjkncimN; dkim-atps=neutral; spf=pass (client-ip=91.218.175.178; helo=out-178.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hjkncimN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.178; helo=out-178.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 72 seconds by postgrey-1.37 at boromir; Fri, 13 Feb 2026 02:27:12 AEDT
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBfL83HP5z2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Feb 2026 02:27:12 +1100 (AEDT)
Message-ID: <93908945-e0a8-429c-b119-eff63ebb2479@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770909937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3md81SdFS4TjjB0AXkEg5ItTPXkzpc4iibpel7Bvl6Q=;
	b=hjkncimNaPPExvn/emeaq/h/AlfCnw+mVVCMpaG7jfK1AU3G5MNnceGQoxpZLRm+7s8TrG
	SMgyuBDmGiF9cfQ+M2rMahOUxsaiyqzUKf7jsPpmGt1bnR/CpoXyBRoS/SAaXyBEptiUA9
	w68x0WYS4Za0LU2R9RKu9ekkYbD3FhI=
Date: Thu, 12 Feb 2026 15:25:33 +0000
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
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
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
 <875x82ma6q.ritesh.list@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <875x82ma6q.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16847-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:david@kernel.org,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@suse.cz,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux-foundation.org,oracle.com,infradead.org,kvack.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[david.kernel.org:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 0649112FC41
X-Rspamd-Action: no action



On 12/02/2026 12:13, Ritesh Harjani (IBM) wrote:
> "David Hildenbrand (Arm)" <david@kernel.org> writes:
> 
>> CCing ppc folks
>>
> 
> Thanks David!
> 
>> On 2/11/26 13:49, Usama Arif wrote:
>>> When the kernel creates a PMD-level THP mapping for anonymous pages,
>>> it pre-allocates a PTE page table and deposits it via
>>> pgtable_trans_huge_deposit(). This deposited table is withdrawn during
>>> PMD split or zap. The rationale was that split must not fail—if the
>>> kernel decides to split a THP, it needs a PTE table to populate.
>>>
>>> However, every anon THP wastes 4KB (one page table page) that sits
>>> unused in the deposit list for the lifetime of the mapping. On systems
>>> with many THPs, this adds up to significant memory waste. The original
>>> rationale is also not an issue. It is ok for split to fail, and if the
>>> kernel can't find an order 0 allocation for split, there are much bigger
>>> problems. On large servers where you can easily have 100s of GBs of THPs,
>>> the memory usage for these tables is 200M per 100G. This memory could be
>>> used for any other usecase, which include allocating the pagetables
>>> required during split.
>>>
>>> This patch removes the pre-deposit for anonymous pages on architectures
>>> where arch_needs_pgtable_deposit() returns false (every arch apart from
>>> powerpc, and only when radix hash tables are not enabled) and allocates
>>> the PTE table lazily—only when a split actually occurs. The split path
>>> is modified to accept a caller-provided page table.
>>>
>>> PowerPC exception:
>>>
>>> It would have been great if we can completely remove the pagetable
>>> deposit code and this commit would mostly have been a code cleanup patch,
>>> unfortunately PowerPC has hash MMU, it stores hash slot information in
>>> the deposited page table and pre-deposit is necessary. All deposit/
>>> withdraw paths are guarded by arch_needs_pgtable_deposit(), so PowerPC
>>> behavior is unchanged with this patch. On a better note,
>>> arch_needs_pgtable_deposit will always evaluate to false at compile time
>>> on non PowerPC architectures and the pre-deposit code will not be
>>> compiled in.
>>
>> Is there a way to remove this? It's always been a confusing hack, now 
>> it's unpleasant to have around :)
>>
> 
> Hash MMU on PowerPC works fundamentally different than other MMUs
> (unlike Radix MMU on PowerPC). So yes, it requires few tricks to fit
> into the Linux's multi-level SW page table model. ;) 
> 
> 
>> In particular, seeing that radix__pgtable_trans_huge_deposit() just 1:1 
>> copied generic pgtable_trans_huge_deposit() hurts my belly.
>>
> 
> On PowerPC, pgtable_t can be a pte fragment. 
> 
> typedef pte_t *pgtable_t;
> 
> That means a single page can be shared among other PTE page tables. So, we
> cannot use page->lru which the generic implementation uses. I guess due
> to this, there is a slight change in implementation of
> radix__pgtable_trans_huge_deposit(). 
> 
> Doing a grep search, I think that's the same for sparc and s390 as well.
> 
>>
>> IIUC, hash is mostly used on legacy power systems, radix on newer ones.
>>
>> So one obvious solution: remove PMD THP support for hash MMUs along with 
>> all this hacky deposit code.
>>
> 
> Unfortunately, please no. There are real customers using Hash MMU on
> Power9 and even on older generations and this would mean breaking Hash
> PMD THP support for them. 
> 
> 

Thanks for confirming! I will keep the pagetable deposit for powerpc
in the next revision.
I will rename pgtable_trans_huge_deposit to arch_pgtable_trans_huge_deposit
and move it to arch/powerpc. It will an empty function for the rest of the
architectures.

>>
>> the "vma_is_anonymous(vma) && !arch_needs_pgtable_deposit()" and similar 
>> checks need to be wrapped in a reasonable helper and likely this all 
>> needs to get cleaned up further.
>>
>> The implementation if the generic pgtable_trans_huge_deposit and the 
>> radix handlers etc must be removed. If any code would trigger them it 
>> would be a bug.
>>
> 
> Sure, I think after this patch series, the radix__pgtable_trans_huge_deposit() 
> will mostly be a dead code anyways. I will spend some time going
> through this series and will also give it a test on powerpc HW (with
> both Hash and Radix MMU).
> 
> I guess, we should also look at removing pgtable_trans_huge_deposit() and
> pgtable_trans_huge_withdraw() implementations from s390 and sparc, since
> those too will be dead code after this.
> 
> 
>> If we have to keep this around, pgtable_trans_huge_deposit() should 
>> likely get renamed to arch_pgtable_trans_huge_deposit() etc, as there 
>> will not be generic support for it.
>>
> 
> Sure. That make sense since PowerPC Hash MMU will still need this.
> 
> -ritesh


