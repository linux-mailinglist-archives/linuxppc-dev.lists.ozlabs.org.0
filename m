Return-Path: <linuxppc-dev+bounces-14599-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C61EECA3765
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 12:39:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMXbg0N7yz2xGg;
	Thu, 04 Dec 2025 22:39:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764848366;
	cv=none; b=Ae+uHve2n2vH4sPtN2Ct0dxTEYk5cfzVkGFACWXt9E3KdPUCQSXAs/hnYwwfaRHR15REBS79HGPyYM4fwaVyQ48eT/jcAM1qOnkxZi0EuGzytKx+iuykDhFs5mYb/VkFAbgxXfMxXHRPxHHk3Q0W0v/RvNQQCgJjfQXGlUa2oG1mYgBp5dzl17Dkg37Y4gl23yKtiu2gS1tdvfNW10cM3YmIATFPuhu74NyOhVRxeTYpOpx6/xAlklGw9x4y2Wf9MgWKMZWvVFX3PmahD4wL2UhIFkPHikEG9o+v/HmrZe1zA+/WcaiusE18rZEvZTnHoa/LqoBo4JdSZI7kSRqY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764848366; c=relaxed/relaxed;
	bh=69yqmIoyiPubXzFm9eTn6rbyp435f7R4HZkguSHyvhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQijIsE6oXm5CWWQNCivGVubYru8qfXV6iWHO/kHmhSogZ1nyc0E/rk2hW8o+H+QTa7G0yXW4tYWtlBgMBrDovAQUEpS49WVQIZlrWT1GOknk1NGXULN1WyrVi9o6JgG2VGKXAakD4cDbteUcQuaeM1ntSbboEI1McEO7QZiDdqu4AX4nO7OVgS71zC6igQ9gaPyfbMaudQFqRsvrbNc/P7u9EtBGBUa0YXUtop0WOaY21SPqhF7LGmLbaEgBqDxsPX5GwFmeFEopILg33g4QQF0JfhdI5aCNw6yCNj9w/0ZdpPKrODUi54SzdkEYXbGmOeGPgk+OJqeioq7dQ0X+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PE+WiSnZ; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PE+WiSnZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMXbf0Rfyz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 22:39:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DC21601E2;
	Thu,  4 Dec 2025 11:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03C3C4CEFB;
	Thu,  4 Dec 2025 11:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764848362;
	bh=oGOR/Gy9sovZXJOpLcgTuOfyjEMxsxmxhHmHgTDnlvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PE+WiSnZpBNNRcaVS0QWTpayXH+dWoN5nt+357dXYUJWSjuOlaAsOBoe3SqzwB59R
	 0BhfuC55fmyIKS+5sWgvrif65X9dIQNyx1j8zScdnb4JsSuXTbZHZKOdhJztBH13oI
	 Z2xVQUclq5bzMcDG9oXYqty7pxfA/Wou/aR2Tjfhg2wQpAVF58f5Wxsu7+lh42EsgU
	 tzePMKUtQaqGs3/m7uKwUZJa+NFZNeb3W7vSvEYI4cegv0lxJrfu/RurxuRx1OGmTe
	 IzJrQ0kiAZGVJ74Dcu7D6yrF3jlh37vFw4mnVpHVXtFq7j5uuCInmCGOIVhoeMwI7Z
	 muM8WetLK5bJw==
Message-ID: <b341e7fa-4382-48b5-896a-1a0d347b66ca@kernel.org>
Date: Thu, 4 Dec 2025 12:39:10 +0100
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
Subject: Re: [PATCH v5 09/12] arm64: mm: replace TIF_LAZY_MMU with
 in_lazy_mmu_mode()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-10-kevin.brodsky@arm.com>
 <89ecddb7-83ee-427b-823b-984204939ecf@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <89ecddb7-83ee-427b-823b-984204939ecf@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/4/25 07:52, Anshuman Khandual wrote:
> On 24/11/25 6:52 PM, Kevin Brodsky wrote:
>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>> mode. As a result we no longer need a TIF flag for that purpose -
>> let's use the new in_lazy_mmu_mode() helper instead.
>>
>> The explicit check for in_interrupt() is no longer necessary either
>> as in_lazy_mmu_mode() always returns false in interrupt context.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h     | 19 +++----------------
>>   arch/arm64/include/asm/thread_info.h |  3 +--
>>   2 files changed, 4 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index a7d99dee3dc4..dd7ed653a20d 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -62,28 +62,16 @@ static inline void emit_pte_barriers(void)
>>   
>>   static inline void queue_pte_barriers(void)
>>   {
>> -	unsigned long flags;
>> -
>> -	if (in_interrupt()) {
>> -		emit_pte_barriers();
>> -		return;
>> -	}
>> -
>> -	flags = read_thread_flags();
>> -
>> -	if (flags & BIT(TIF_LAZY_MMU)) {
>> +	if (in_lazy_mmu_mode()) {
>>   		/* Avoid the atomic op if already set. */
>> -		if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
>> +		if (!test_thread_flag(TIF_LAZY_MMU_PENDING))
> 
> A small nit - will it be better not to use test_thread_flag() here and just
> keep checking flags like earlier to avoid non-related changes. Although not
> a problem TBH.

I'd assume the existing code wanted to avoid fetching the flags two 
times? So switching to test_thread_flag() should be fine now.

-- 
Cheers

David

