Return-Path: <linuxppc-dev+bounces-14636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBA6CA64EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 08:05:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dN2T10mv6z2xrk;
	Fri, 05 Dec 2025 18:05:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764918324;
	cv=none; b=jcbUcVOnhysJA9F4mH8mp0BkuySF9CD9D3RZ1laV4OZdwNbZmstq2TxM9gOkO0b78LIVWVDku6z2b1YB530e3xXes9HMiB88ZFVadIEN6yVWeTaJ5+B2g3RkpFwJX5tXkTyyExJOI7jcxN4eCo4OwSPawzKIJkuGcIFea3WTV/ucW50C91CcADylfIGFYEGcGibjuVsPZgsLmc2vBhzTBFZMhEwVmFJzam3N4yxOBFhUUqkyCfFjztv7U1797Yk/k4Yjvg6Mde0VuDs3wnRarA94hV3R46QM/myG5+mkCD35U4fOMGXcyq20GHOR442nd8AK9NPaWtF5xdftV/47Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764918324; c=relaxed/relaxed;
	bh=Aifju/C9UIq1fsTT/dqP4jzKTcvZR3ZexRADB3JKvQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dePjnKOAxNiKR0WedC0PS3Psj7tsYMPkFGKNUQSxunyuKIZkckLLZLTu7WJPmDpI6vCzh3f/R1C6WaFw9yv2GNPOqZRRPHy+nxArmgbZxZeOBybU6Tq9ZgeatosG37zhevbBCB50q7WAkKf4KBA+1F332Rnggvz5YU/7NX2qwT1mJaqOkihdza9gk2B5+2Xczhlo1eVnJcchmR4eQlASlPQ62xYuuME4H4nSFoGbuiu70hfX9B0fRZ3Fo/Mgj6MIr/u2cl5FmautdGqYefljWnUDo3HdVHb3Hj5nDDnQFVKhy7YAcnMoCVHNGZO+zc9O2wO179R7M+GF9sBIVLJkfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K3EFtiCP; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K3EFtiCP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dN2T02PDRz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 18:05:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38EBA6000A;
	Fri,  5 Dec 2025 07:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6D7C4CEF1;
	Fri,  5 Dec 2025 07:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764918321;
	bh=pLFYJRb6YhaKELyTkQIdNWJE3/HJjwoQZjQuRwUY00w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K3EFtiCPH/gJxujbU4Cm+y7/bAey3QI9Olbp9MYwWGqC7Nmv8R/IjCikrcpGvkR+W
	 ahUS+ovOEboDaV6dvr6n+DYzDjqyq+goOcuPYIQPNztPcQ0qdsAPnc/EszXF/NRH1k
	 BScJhY6UnO97T36Uv92hUXAXhZzyfiFIPORS9dEO7uqHQyKbKV/ZR4g9SGV30lCKqP
	 qn/kmdHGZg3eIpG4Fa/IGcKA7LtGyxxdtF0K7sUXEOMvhfZ3fbnRcACcAWBBtxJMz7
	 0Znmvz69YxleWE8ugaLzl+EOQM+eebbFiMDO1OS3/2ni9BuY3eoU+QapHyPYLBKDk1
	 Ti0fvrzdzB2qg==
Message-ID: <dc22e2e2-a62b-4b9f-9fb0-f3a42a57b00f@kernel.org>
Date: Fri, 5 Dec 2025 08:05:14 +0100
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
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 surenb@google.com, mhocko@suse.com, masahiroy@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Linus Torvalds <torvalds@linux-foundation.org>
References: <20251204023358.54107-1-skhan@linuxfoundation.org>
 <20251204135746.6d291cc861b4507b1fe95aaa@linux-foundation.org>
 <aTKDRF2sMdM_5aRB@kernel.org>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <aTKDRF2sMdM_5aRB@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>> 39231e8d6ba7 simply shuffles ifdefs and Kconfig items, so I assume it
>> exposed a pre-existing bug.
>>
>> Reverting 39231e8d6ba7 will re-hide that bug.
> 
> Shuah confirmed that the bugs were on v6.18-rc6 and they were fixed in
> 6.18 [1].
> 
> I verified that reverting 39231e8d6ba7 from v6.18-rc6 does not solve
> anything, but applying 5bebe8de19264 does [2].
> 

Thanks!

> So reverting 39231e8d6ba7 does not change anything and there is no bug it
> hides. The bug was introduced by adfb6609c680 ("mm/huge_memory: initialise
> the tags of the huge zero folio"), was fixed by 5bebe8de1926
> ("mm/huge_memory: Fix initialization of huge zero folio") ...
> 
>> And that isn't a bad thing.  If we re-hide the bug in 6.18.x and in
>> mainline then that relieves the people who are hitting this and it
>> takes the pressure off David, Mike and yourself to get the underlying
>> bug fixed in a hurry.
>>
>> So I think I'll queue this as a hotfix, plan to send it Linuswards in a
>> couple of days.
>>
>> Or Linus may choose to apply it directly or to do a local revert of
>> 39231e8d6ba7.  But I don't see how a local revert will get communicated
>> to the 6.18.x maintainers.
>>
>> David, Linus, opinions please?
>>
>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>
>> Let's have a cc:stable here, just to be sure.
> 
> ... and we can skip all this hassle.

Yes.

Thinking about reverting arbitrary commits after Shuah clearly tested 
something wrong is completely unreasonable.

-- 
Cheers

David

