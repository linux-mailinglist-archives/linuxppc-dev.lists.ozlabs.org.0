Return-Path: <linuxppc-dev+bounces-16845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE+PAE70jWlw8wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 16:39:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C53C12F0D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 16:39:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBfcp2rmZz2yQj;
	Fri, 13 Feb 2026 02:39:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770910794;
	cv=none; b=GZaaymenOjFkHGUF3dsZKBcT7XuNGygAQ4YcLyoOf2N9RbeZ2DWT2cFnqrKDMopwDckJG7tx5fW+pHDk9GV9Dyrer0jpMQOtMFdRSucUdBI9oR0Nqcu4cra4Q71vkzYhMI362s5g6HQpX5foyY+7bzM30jZ5QrC++im8/Jl+y+aj2iUnaWOqOIWQGXC5V9VuUbm4NbyI8PC5qZiH6xGLxXTY9k151Lii3NIyejeksGwcmfpWukMBucQDTyFyM1KjpP18vfoZ8A0S4Eb2oo1EFw8n4aTN5YTO50S6FK/8GwS/+Y4byVuy774uCEqOREWFX01Bgz8uRu2QpUA8gHHEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770910794; c=relaxed/relaxed;
	bh=hrQnrLZGRkouZkW9Dz1FgaKn18/yK60/HNzprFfNtmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OjsLoBLSAAFvLPfDfSQwHTvkRR0CsmgJyJZsXBm4O9A148RvEB50v9oteRyUSfeffwDUVNXAXl7RsYPVk9EoRXP/XdrJPtlaQhrAP4AN+HSpReZ2zUigbNbvZmE5QHVxP3lO9rhZGuRaAo+0ZcWlIFKQDGMiJgEKKPI3q6FzoHU0jRAucPAOyUEHlpLzoWr16x3gE9TF33hAWHe1qB+C1/QJJrC8qSc51Gfy56r1P30mVzZ/X2rEAGr7MXMErD/kWB0FFyCK+By4FvhnfQE2Bp+SJ9+xT9YXDMgpMPjapN98F33NefO+rOBnXl46V/cu0U0wxxssABUR4d2KltHOCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dBGzJzgz; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dBGzJzgz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBfcn2HfGz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Feb 2026 02:39:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B0E8460051;
	Thu, 12 Feb 2026 15:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2372FC4CEF7;
	Thu, 12 Feb 2026 15:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770910790;
	bh=uDJdvdtdIL8nTfRDZsIpuEy7of+XLqGVIjb1L7/IFKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dBGzJzgzSO+9iMjTj2UNcR0sC5r8JHSYQ3uy2B6LUzNIgTfbrP8Agr6brEbN4jaw/
	 HhJ8JDU2JxGY8BLCuqt/vK04qyCcfpdhULqy6yG5QGdt46x8yPnvn3zRNQQazplva5
	 7PB6l6YMhVa1KkIWwnfuDhz9rIPfHH2xdmifCv8i6E4xXJiMAfyDkmZM/gQxXekbT4
	 wgFsMwWHmOCv0C/6By+Ou1mZyYTSgUp7hF617TVZTysJv8Wkq82MBKcVW4uURngvpA
	 3VLAwJ1kpslP/ML4/IlrdIvHlCu98UbNzd8AT2+wblgqmgQnj7GreZfIDAmHi5X1vY
	 CblqO/OqoNwHw==
Message-ID: <22d65938-4569-4e5e-8f30-bfe9b38b6493@kernel.org>
Date: Thu, 12 Feb 2026 16:39:41 +0100
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
Subject: Re: [RFC 1/2] mm: thp: allocate PTE page tables lazily at split time
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Usama Arif <usama.arif@linux.dev>, Andrew Morton
 <akpm@linux-foundation.org>, lorenzo.stoakes@oracle.com,
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
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <875x82ma6q.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:usama.arif@linux.dev,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@suse.cz,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[112.213.38.117:from];
	FORGED_SENDER(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[gmail.com,linux.dev,linux-foundation.org,oracle.com,infradead.org,kvack.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16845-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.75.92.58:received];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 1C53C12F0D2
X-Rspamd-Action: no action

>>
>> Is there a way to remove this? It's always been a confusing hack, now
>> it's unpleasant to have around :)
>>
> 
> Hash MMU on PowerPC works fundamentally different than other MMUs
> (unlike Radix MMU on PowerPC). So yes, it requires few tricks to fit
> into the Linux's multi-level SW page table model. ;)

:)

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

Ah, did not spot this difference, but makes sense. Still ugly, but make 
sense. Fortunately it would go away with this RFC.

> 
> Doing a grep search, I think that's the same for sparc and s390 as well.

... and I also did not realize that s390x+sparc have separate 
implementations we can now get rid of as well.

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

I was expecting this answer :)

> 
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

Thanks! The series will grow quite a bit I think, so retesting new 
revisions will be very appreciated!

> 
> I guess, we should also look at removing pgtable_trans_huge_deposit() and
> pgtable_trans_huge_withdraw() implementations from s390 and sparc, since
> those too will be dead code after this.

Exactly.


-- 
Cheers,

David

