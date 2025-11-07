Return-Path: <linuxppc-dev+bounces-13924-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3007AC3F0F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 10:03:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2tPd5VKkz3054;
	Fri,  7 Nov 2025 20:03:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762506181;
	cv=none; b=hq6UeHVcgKFWTLhEV1sfvCdTdvbbaAxrxZdwQHgGYvg7+GveNiG2cUmEyUoSCzQaPNIC7kXQ04GsS2GHLoPNJ0ufQaKUgbUsZPhq+/msGZZeK8NIq8TbMU8FOXRgUMEgSIyXIUnv53dIzFkDWgephiMXQLaHm6sy1TJmYU8Ed1YbTzfGSPvSjcj2pj567FCV/IXZxiZn/FiflbBhzM8iCrQkw0rf4LBlz7EYpiAOLyg8d0mN6puHLUkT0VVzxhTSUbsUJvZ2LzqU8qblP9rMCnTb9MTq9uhxDTN6EPJCLcehXztMvSRXG0ncUeyg/JrRGNyaQ3DqzN5poNZwRRcRBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762506181; c=relaxed/relaxed;
	bh=k3mM0v00SRPnYPwwyEBFuZ9lvntjK88oQ7vPAMELXnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oW4pBWeCqjcYDrM/yV6vriTbSdJtBpEXpYQHknOpy5O71VXRQReYhJ3UcZKOxm8jaI9kUwc40rK3VfpTYHtO49xyunUKHme1iEBoB+PeoD1tdySZx68QquHOv+D6cGxQnhJqPQvxTkUNNP7sgsx8e/OkkykEsi7BN8ddpLXs9uVnlPnFmNMmB3W+a5SfUhSLCbpmlEr3tVPjTfIKer4bpJyqtol7eCRbExStpT0P8bHxpDKy459TYh0LOUagzLwiwIXy2fZu53LOMDoiLe9uyX1Xoj87uOP+UchwqRcSV/VJbV/ZRfqC72MvxZPPcVb9lw6ttUsaIjQA88ue7GE9Bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RoPPQ6GA; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RoPPQ6GA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2tPc6XL0z2yjm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 20:03:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F7D943C5B;
	Fri,  7 Nov 2025 09:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AB7C116B1;
	Fri,  7 Nov 2025 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762506178;
	bh=wM34FC/EiEvJ5KnNWvWcoNezTYk0Bs0Hbc/YeTldTWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RoPPQ6GAH+2zWlnVzObdKDVwGBs7uUqRCOLyl3gxNI/kocSX6+xo0DUG1Br1VNshe
	 n//2VOQPykAKg9gRPaDUUYTtiKZrwdtUf5W6wUgWQNSn3WdA22NG9Z+P/9CgJrpzRL
	 LxM/hfmhvDYeSYftVUffT37dsy5+gLppS6rLBoxRuw6wifvUYrRrxB/f5dvQy4GxpO
	 W1YGj75qzbeYxjb1g8TcZiwasgbNJwRogkCKy01YyKduawftq6bwLfHNoaLw1dwfDg
	 BWlomYTdU/jTWNuq4C7N8WTbDttTa6L1Pp+i20teuSOCN+tkKYF+jSL/JTqw1xLc02
	 rwOGwXNwVsE9Q==
Message-ID: <b875435f-6a69-4989-bc21-4093c2ce6331@kernel.org>
Date: Fri, 7 Nov 2025 10:02:55 +0100
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
Subject: Re: powerpc/e500: WARNING: at mm/hugetlb.c:4755 hugetlb_add_hstate
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com>
 <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com>
 <82ef1da8-44c4-4a58-bd00-9839548cb72d@csgroup.eu>
 <ba3a2131-c8d4-481d-aebb-d25be7ae0d19@kernel.org>
 <e93e3a1b-5cf1-4d2a-9b2c-5049e211f593@linux.ibm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <e93e3a1b-5cf1-4d2a-9b2c-5049e211f593@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 07.11.25 09:00, Sourabh Jain wrote:
> 
> 
> On 06/11/25 20:32, David Hildenbrand (Red Hat) wrote:
>>>> Yes, we discussed that in [1].
>>>>
>>>> We'll have to set ARCH_HAS_GIGANTIC_PAGE on ppc and increase
>>>> MAX_FOLIO_ORDER, because apparently, there might be ppc configs that
>>>> have even larger hugetlb sizes than PUDs.
>>>>
>>>> @Cristophe, I was under the impression that you would send a fix. Do
>>>> you
>>>> want me to prepare something and send it out?
>>>
>>> Indeed I would have liked to better understand the implications of all
>>> this, but I didn't have the time.
>>
>> Indeed, too me longer than it should to understand and make up my mind
>> as well.
>>
>>>
>>> By the way, you would describe the fix better than me so yes if you can
>>> prepare and send a fix please do.
>>
>> I just crafted the following. I yet have to test it more, some early
>> feedback+testing would be appreciated!
>>
>>  From 274928854644c49c92515f8675c090dba15a0db6 Mon Sep 17 00:00:00 2001
>> From: "David Hildenbrand (Red Hat)" <david@kernel.org>
>> Date: Thu, 6 Nov 2025 11:31:45 +0100
>> Subject: [PATCH] mm: fix MAX_FOLIO_ORDER on some ppc64 configs with
>> hugetlb
> 
> b4 did not detect this patch, and manually copying the patch text from this
> reply also did not apply cleanly on upstream master and linuxppc
> master/next.

I have it on a branch here:

https://github.com/davidhildenbrand/linux/commit/274928854644c49c92515f8675c090dba15a0db6

https://github.com/davidhildenbrand/linux.git max_folio_order

-- 
Cheers

David

