Return-Path: <linuxppc-dev+bounces-14889-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1D2CCE9E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 07:14:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXcgv5rXpz2yFY;
	Fri, 19 Dec 2025 17:14:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766124875;
	cv=none; b=X6RKp4kn30rnIsYXSzDqpV9waaHLG04r7du7qPkzcVp6dnZ4zVNbLqvyhhQ2bY6iBhUEcSjo6NmIoV6Dsy40Gkw5eM5qQHurJ8Etzm3mQPS2iBuQpGtbWCdR/5+b48TmkehbOM4vTa4fR5un+qqLw4ZH+GSAR5kthuwWUbfHWBtELpIz9a0BtZfpM/SbWCFeouYHSFub5L/6NDAwLVVgNgiRxRh+tgrqXvU48gjCtlnA+fskI143bS7LjGKja9vgiM2oxf+GSuYiWFylTXK2JzrhQOLVhp9c7gt3TSlpPIVGS1i43iAQ5UixuUCPWf1cIM4S28mX1twCf4jRg1Yn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766124875; c=relaxed/relaxed;
	bh=3lDYRq4aDpjv7MYq51BzCPF2waWfuIU7cpDb6tEwiAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mY5EL1APGBs582CFRmsa18c8WvyxxOyqYOVH065U1RtKuqmCfH1ROZDZuC/Hihjzvq+5o3AdfhyI4P2VBxN3l4Hbu0V80s03eT3R0PRUR8VcrLE6Rr3W8qaA//9CYdO3e6byDT6n7i6U3CLCMAkDq4/Zj6yioK/2Us9F8wPGrBJZwUsGsAnjuYUgOBj9j+fhpD9uqDB5/NPQadUPsrFRLaKwL39Gh07gls1RWHkuB3zNgtbScyDT60BIi0kVa8DJOztVlm92nCXGFOfPBnwbeQZlSjpsHDb4UPrSCTVA+hNJFe+iTnfxxiJb0Flvh9Kjwff516q8b909Zao9qWal/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EVzl6xJH; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EVzl6xJH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXcgt46Lhz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 17:14:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABCD860008;
	Fri, 19 Dec 2025 06:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00031C4CEF1;
	Fri, 19 Dec 2025 06:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766124841;
	bh=fpp+RqGdOfeNhoOl4yFFqEiGPr5KLb+tEsiopJhtJ8Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EVzl6xJHootXl5U66WYKjPigWhllML8t2eFx7gR1rzs163UBU9syfQBGmZSjw7c8i
	 z4QRSnTO7UTMa0f4OOvFAWHboC7GzOxSVkJrjH5VF0vnghM5Snl+QXNNXAS5b2mBPg
	 FzAMkkTUJq4WuNkhOMU3L6Pu4qN27vWTzJNaJcZs6y2mXcY0C52bYFUip9sYx7NE0h
	 vGBshnjTyYWtRCF5aGo3z1NwEbxrj0qN98ay/pnuCBOicyHCq3H2qQXyTTBBm5DSn6
	 G3ceP4nqOOqGUpVi1gKbgaTiLqI2gcYpaHWZq6ZyhJOTjPCDbka3UUMquhnkcVCjIB
	 ro5B91Op54COg==
Message-ID: <64a9ca24-2968-4532-ac04-594c340ec2a2@kernel.org>
Date: Fri, 19 Dec 2025 07:13:52 +0100
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
Subject: Re: [PATCH v5] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov
 <bp@alien8.de>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, x86@kernel.org, linux-arm64@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
 <83920c44-47f5-4a46-bfa7-76713197d7e4@kernel.org>
 <1fddcf72-26f7-4fb4-84b8-1328e486d58e@linux.ibm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <1fddcf72-26f7-4fb4-84b8-1328e486d58e@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/18/25 14:06, Sourabh Jain wrote:
> 
> 
> On 18/12/25 17:32, David Hildenbrand (Red Hat) wrote:
>> On 12/18/25 12:41, Sourabh Jain wrote:
>>> Skip processing hugepage kernel arguments (hugepagesz, hugepages, and
>>> default_hugepagesz) when hugepages are not supported by the
>>> architecture.
>>>
>>> Some architectures may need to disable hugepages based on conditions
>>> discovered during kernel boot. The hugepages_supported() helper allows
>>> architecture code to advertise whether hugepages are supported.
>>>
>>> Currently, normal hugepage allocation is guarded by
>>> hugepages_supported(), but gigantic hugepages are allocated regardless
>>> of this check. This causes problems on powerpc for fadump (firmware-
>>> assisted dump).
>>>
>>> In the fadump (firmware-assisted dump) scenario, a production kernel
>>> crash causes the system to boot into a special kernel whose sole
>>> purpose is to collect the memory dump and reboot. Features such as
>>> hugepages are not required in this environment and should be
>>> disabled.
>>>
>>> For example, fadump kernel booting with the kernel arguments
>>> default_hugepagesz=1GB hugepagesz=1GB hugepages=200 prints the
>>> following logs:
>>>
>>> HugeTLB: allocating 200 of page size 1.00 GiB failed.  Only allocated
>>> 58 hugepages.
>>> HugeTLB support is disabled!
>>> HugeTLB: huge pages not supported, ignoring associated command-line
>>> parameters
>>> hugetlbfs: disabling because there are no supported hugepage sizes
>>>
>>> Even though the logs say that hugetlb support is disabled, gigantic
>>> hugepages are still getting allocated, which causes the fadump kernel
>>> to run out of memory during boot.
>>
>> Yeah, that's suboptimal.
>>
>>>
>>> To fix this, the gigantic hugepage allocation should come under
>>> hugepages_supported().
>>>
>>> To bring gigantic hugepage allocation under hugepages_supported(), two
>>> approaches were previously proposed:
>>> [1] Check hugepages_supported() in the generic code before allocating
>>> gigantic hugepages.
>>> [2] Make arch_hugetlb_valid_size() return false for all hugetlb sizes.
>>>
>>> Approach [2] has two minor issues:
>>> 1. It prints misleading logs about invalid hugepage sizes
>>> 2. The kernel still processes hugepage kernel arguments unnecessarily
>>>
>>> To control gigantic hugepage allocation, it is proposed to skip
>>> processing the hugepage kernel arguments (hugepagesz, hugepages, and
>>> default_hugepagesz) when hugepages_support() returns false.
>>
>> You could briefly mention the new output here, so one has a
>> before-after comparison.
> 
> Here is the fadump kernel boot logs after this patch applied:
> kernel command had: default_hugepagesz=1GB hugepagesz=1GB hugepages=200
> 
> HugeTLB: hugepages unsupported, ignoring default_hugepagesz=1GB cmdline
> HugeTLB: hugepages unsupported, ignoring hugepagesz=1GB cmdline
> HugeTLB: hugepages unsupported, ignoring hugepages=200 cmdline
> HugeTLB support is disabled!
> hugetlbfs: disabling because there are no supported hugepage sizes
> 
> I will wait for a day or two before sending v2 with the above logs
> included in
> the commit message.
> 
>>
>> Curious, should we at least add a Fixes: tag? Allocating memory when
>> it's completely unusable sounds wrong.
> 
> Not sure which commit I should use for Fixes. This issue has
> been present for a long time, possibly since the beginning.

I don't know the full history, but I would assume that support for 
gigantic pages was added later?

It would be great if you could dig a bit so we could add a Fixes:.

> 
> I also noticed an interesting issue related to excessive memory
> allocation, where the production/first kernel failed to boot.
> While testing this patch, I configured a very high hugepages (hugepagesz=2M)
> count, and the first kernel failed to boot as a result. I will report
> this issue separately.

I'd say that's rather expected: if you steal too much memory from the 
kernel it will not be able to function. It's the same when using the 
mem= parameter I would assume.

-- 
Cheers

David

