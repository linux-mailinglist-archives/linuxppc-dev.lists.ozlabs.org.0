Return-Path: <linuxppc-dev+bounces-14637-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E420CA67F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 08:41:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dN3GP6yzHz2xrk;
	Fri, 05 Dec 2025 18:41:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764920477;
	cv=none; b=hU4UCuoUdrjr/aT5CXFF5BXe7O+iQ0ELpH7JGocdav4D5Exk0L142usvL34LmCdZhTG6+4nGN+WpkaN5UMpGGL6kL7BKly7rjjdvfvg5XMjeicyTmwpRS6aY8mbhtvxXdboT31y9W8HGEGJewMbL2tBlJCv7E67Y6UaB++akyORmGDgQvnZvZ963NotPBTOuAWmmeIpTlZ4agrzXH7U/jNRzo3qnYGJ3vtlRuPBKywG/R0iCg9kRUEB7tChO6cVE91Uz3+n7HtkhKakwNcYZAR8NpGzku3x/td6b0WYxzSa+wPTsx8TX8XWl6t3Imq89ZPRoen7QYrB8XU9hFDDdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764920477; c=relaxed/relaxed;
	bh=1RnddoaNuyVKAO0UJEB8nPFQJfYmgRWcKSaHJbTft4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Puhd13o2SqfCRl7iDDU7MYJF5uVzCiRFkZFY3gZdNHeyF/ISzekBEGxkZN2cvlxAhryv2q+8HCb33ASLcgEPaoHznIFwq6ooprvfe8higGgJhcAlMJGw+ctoHdIY7PkYdJMBFs46bT4/Ycx/6Nzhqu8cWB2qnPgKmR/m3xf2fR9qfFfZx+qsS46WV/d6A04rKg/kT9TkFxRQOka1V0Um0TOpSAmNnCBEEd14t1A1nZmBv46+A8scfwg4+XViItCL5amNkMXoZ67VCWhyFPHIL0myF0k2qqaq5MGesvLH643FVULJsYpdo5oG94cX0xa1X0WK1tyOytPLKIevvLBz4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NV3YL29e; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NV3YL29e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dN3GN6LbMz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 18:41:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BFDCE43661;
	Fri,  5 Dec 2025 07:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3D0C113D0;
	Fri,  5 Dec 2025 07:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764920474;
	bh=JNIyYc/7yP1M4TvP6ofkJrx/viH5F1sL/Inc63ohX0Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NV3YL29eliNneTWlA8ePGTMtSS/n+uTN5J5jvZlhhbhGID3WpRpsny7Z93D360p8z
	 CcD2Jpu0zNvCPb9wT5veXmNC3bd1s1KSysRMJEunjTUGnYrmaFBFaE2UG4qBOFZHYt
	 IentCY9LrG+gTxkx+aGEz8vL6BwXVoyc6pTklOkA98XKMXmy2ONe2ESzjdrXoEwSW7
	 9p7mC8TL2SZ6Ob8vUY5B6UT0OIdXu0pG1+/F/uYupAeHJaiyZGsxI7HtgMMT7YGq6E
	 cP1MUhOOe5SLYbudGokd7AeJKtjSzSj50EYV7+Vd3YPBiPkwLBJ0uqcWjvirqmQi0z
	 6Xs4n124j53Tg==
Message-ID: <057ff845-6ab3-46a2-82df-067c25bef56e@kernel.org>
Date: Fri, 5 Dec 2025 08:41:07 +0100
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
Subject: Re: [PATCH] Revert "mm: fix MAX_FOLIO_ORDER on powerpc configs with
 hugetlb"
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
 masahiroy@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20251204023358.54107-1-skhan@linuxfoundation.org>
 <20251204135746.6d291cc861b4507b1fe95aaa@linux-foundation.org>
 <aTKDRF2sMdM_5aRB@kernel.org>
 <dc22e2e2-a62b-4b9f-9fb0-f3a42a57b00f@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <dc22e2e2-a62b-4b9f-9fb0-f3a42a57b00f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Le 05/12/2025 à 08:05, David Hildenbrand (Red Hat) a écrit :
>>> 39231e8d6ba7 simply shuffles ifdefs and Kconfig items, so I assume it
>>> exposed a pre-existing bug.
>>>
>>> Reverting 39231e8d6ba7 will re-hide that bug.
>>
>> Shuah confirmed that the bugs were on v6.18-rc6 and they were fixed in
>> 6.18 [1].
>>
>> I verified that reverting 39231e8d6ba7 from v6.18-rc6 does not solve
>> anything, but applying 5bebe8de19264 does [2].
>>
> 
> Thanks!
> 
>> So reverting 39231e8d6ba7 does not change anything and there is no bug it
>> hides. The bug was introduced by adfb6609c680 ("mm/huge_memory: 
>> initialise
>> the tags of the huge zero folio"), was fixed by 5bebe8de1926
>> ("mm/huge_memory: Fix initialization of huge zero folio") ...
>>
>>> And that isn't a bad thing.  If we re-hide the bug in 6.18.x and in
>>> mainline then that relieves the people who are hitting this and it
>>> takes the pressure off David, Mike and yourself to get the underlying
>>> bug fixed in a hurry.
>>>
>>> So I think I'll queue this as a hotfix, plan to send it Linuswards in a
>>> couple of days.
>>>
>>> Or Linus may choose to apply it directly or to do a local revert of
>>> 39231e8d6ba7.  But I don't see how a local revert will get communicated
>>> to the 6.18.x maintainers.
>>>
>>> David, Linus, opinions please?
>>>
>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>
>>> Let's have a cc:stable here, just to be sure.
>>
>> ... and we can skip all this hassle.
> 
> Yes.
> 
> Thinking about reverting arbitrary commits after Shuah clearly tested 
> something wrong is completely unreasonable.
> 

That irrelevant revert has already been applied on mm-hotfixes-unstable, 
see https://lore.kernel.org/all/20251204215938.750D3C4CEFB@smtp.kernel.org/

Andrew, could you please drop it ?

Thanks
Christophe


