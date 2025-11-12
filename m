Return-Path: <linuxppc-dev+bounces-14125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C288C52935
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 14:57:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d64jZ6jc7z2yvJ;
	Thu, 13 Nov 2025 00:57:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762955874;
	cv=none; b=F8jcXVbADHQuOt+7BCyS+YgkC2xcoE1T4LB5z0AMr1U9iMGNFvrkUl7bbxGNV6med6PmWiAllHORbhMV1CrFEIP6nPaRRs7JRb+5PDf242CtXizJp2laJrZQbZKwByLHUAjE8KYeIT4Gpk5sFsPJseXkMlqlf/RkgWDdNRgzYZX2wxKVXFz1TyDTCWDvev+Ae1ppDA+Yjxz54/qxZFbnTCG9blYYz/Xpd1xD4OW7gSUsAELwKK4QFNcml0daiQ19u834hXey+q+arOFRsuRGV650KiIkH9hLn1TBweb0PW0vkwxKEt5jCIxYzRJQyd53jshzJi5fi3zHKVnJTMTA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762955874; c=relaxed/relaxed;
	bh=/iYFkq8EoSIFdFM4yiltEoa/A9Iy/iMJWrMfuUMJqAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLH8iZnOhmhv8aDMQfkyh57bnZhTiGyHNkEDmStMylDujMtt3HPjsHvjsXrKwUh/PQgrShbFe9AZXVnO36jWLcU5CllSz/6dABw8tTxpVHgy6j9Ybwmq6COD3xEHRGdg7R5kPt22qzOt0J1anqDLd1Fz6oKIQNgw7A/f5Xzb3SH82dV3k5fwAIS9FFQ5LKawwDC+LPoaBEdQN0oNs/5o/vCOeFAyvbaE3E9JTIOc85XHx+EI9gPT6jdeeEn1izBxuBaucK6OsWy5vX5WZhhzpcBLm+XHLlD3mpxGe9JN33Ch/IxNFtoQDgzHacLUNhLjczrPt/4WCkPXB7vLpgsGaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uDdn5b0T; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uDdn5b0T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d64jY6zYPz2yFT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 00:57:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6148D60213;
	Wed, 12 Nov 2025 13:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29847C2BCB4;
	Wed, 12 Nov 2025 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762955871;
	bh=wyYh5JA+N7mRZY7BRonX9hRu7lWf6kG2xADXz4mWKHk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uDdn5b0TMd79Lh5gGh2J4WjGYOU7mL3bVuBbQ/VXgzY4nMQRUASwOOOn1wPdm3Cym
	 W4XE28wEzp5MfEzdP2hqphehcMkmvAS/b8w6wcpUiLZxYE0rCMGLEp+rVCdW9qI4ba
	 ocobM87q4/c0/j7wdbVyzm/yrXe8KetWir7vwxyUiRXtVNS/+8DnZ7OaB4HqMTf7u6
	 36VSYtBbbyHuGEXAGGvXe/GFkuJFAWR+xBF55ycy4xXYzkSJweCr6O/7vY6qeuk4iJ
	 2JAYXvNk5KDLXblAvdwOWYLaBc3JfMXId6w7fnEaMQeOyF/yR5GPTl+Yi8z7SCHe3i
	 /nZPR2FUDupLg==
Message-ID: <ba3cf0c1-174e-4e86-b464-7c5c15a803d8@kernel.org>
Date: Wed, 12 Nov 2025 14:57:32 +0100
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
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
To: Kevin Brodsky <kevin.brodsky@arm.com>, Ryan Roberts
 <ryan.roberts@arm.com>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <999feffa-5d1d-42e3-bd3a-d949f2a9de9d@arm.com>
 <cc9dc398-b9c5-4bb8-94ad-7e7f3ddd5b4f@arm.com>
 <824bf705-e9d6-4eeb-9532-9059fa56427f@arm.com>
 <58fd1a6e-f2c4-421c-9b95-dea4b244a515@arm.com>
 <8f70692c-25a9-4bd0-94ab-43ab435e4b1b@arm.com>
 <cdb4b97a-415b-4dba-877b-0cd570381a6d@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <cdb4b97a-415b-4dba-877b-0cd570381a6d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


>>>
>>> I don't really mind either way, but I don't see an immediate use for [C]
>>> and [D] - the idea is that the paused section is short and controlled,
>>> not made up of arbitrary calls.
>> If my thinking above is correct, then I've already demonstrated that this is not
>> the case. So I'd be inclined to go with [D] on the basis that it is the most robust.
>>
>> Keeping 2 nesting counts (enable and pause) feels pretty elegant to me and gives
>> the fewest opportunities for surprises.
> 
> Agreed, if we're going to allow enable() within a paused section, then
> we might as well allow paused sections to nest too. The use-case is
> clear, so I'm happy to go ahead and make those changes.
> 
> David, any thoughts?

I don't mind allowing nesting of pause(), so works for me.

-- 
Cheers

David

