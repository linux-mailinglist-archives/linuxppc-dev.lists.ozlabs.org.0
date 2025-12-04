Return-Path: <linuxppc-dev+bounces-14601-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9ECCA37E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 12:53:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMXvy0pWcz2xJ5;
	Thu, 04 Dec 2025 22:53:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764849214;
	cv=none; b=BTDUWIrNkPT75MpAzr+bZZKyrcVMsEVULHeaYFq0XZX45AwyMGsGPhCCTPMltwX4RzKuDhHiIB+Grtdr9VXr9Ul3bQIVQH8i+6oh980SeT4cP58uSrq/77PA0kznqd+cWlXwdCG/7yYsnsFwIIG0ww5InOWowVFt+qDgIngg1Ovfo1AKxGi22xkN0BWxirzcvh/gXmflU6V9ltvZzx1e25d9la+hYBZT7e9EKKM/tNpN9MphpjD+ywtP6Z+tPxEhU21DadwZ7kuemYIWrAMujnPfiCoALjBd2fXpE5dz/IVdtfAUAG47pNdXRw64VHEDuc/ELXoC7aMgpS517zPpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764849214; c=relaxed/relaxed;
	bh=QVCBV6gKtnQy2rEAfBDSKKvn4qBqj1x+UGLpOf8yJyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxiMMMMgSI4Q7eAp93vG6PIwy6ZZmaUMeminvNKBomOyc234e4rNra9Yd1BePDKxX+mCGied+KpoEs0d+v5ZVDzbrtpGdRxngI4sOWGDdUFuauEjkPqTiJY6wU5nMaEN0fM0qEccD4JP4SspLqtPwmUonT/7geWxR2jyZjBriVsk9a3JScAWpDuXScwTEE/R+KDWWwYAEWpAIsS/eZPmQXW841MEZIqieMo9nX/uvczF8NJYHTPlarzDgAGRUUEgC6k7H1tw3wO/XBbdAsfypiOJHREjEvmjcfrCYp+OMGNrUelUVhJFoN7jqrXjvCULLv52+0/iLNug1FTjdPi9lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l8F43iGu; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l8F43iGu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMXvx32PPz2xHG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 22:53:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35ECD601E6;
	Thu,  4 Dec 2025 11:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8423DC4CEFB;
	Thu,  4 Dec 2025 11:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764849210;
	bh=Zpl414Y6vefFz+0mGA9CipSOvbTehPYA0WM0ZAZ5yEc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l8F43iGu2V8NDUl3DIh/2+X2bfiJU3z4ZM3VULx8KpRVQtoH+xW7CH2tkww5ZTCxo
	 Z732odFWqfzHNQy5SzNM5XixZWclVhNfUhvGgJiGbPutM3AwRHmsLfNCAboCSPDTP/
	 mQ1qAy91zph5RvCXiIten7mneAop/GvZWqVrT+sRJH1n488UuXQMywvv0E8xZPYpO8
	 hem4mPeZ8WDhirZ3INCR8Hs8TJNiMUf1+2/EkXzuyFkWiHk2/yA/ki9bTau+qinvtl
	 uLvGed0JMtDUZ3H/ydu3YrDfOdvy/uR+aG5ySHHt6+QmCrIk7eopnc2uqCD/LCtR4b
	 NGvDZU/gQZlqA==
Message-ID: <0f08e893-6097-4ab1-8231-ac3304c51ee9@kernel.org>
Date: Thu, 4 Dec 2025 12:53:18 +0100
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
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 <20251124132228.622678-9-kevin.brodsky@arm.com>
 <23dcf752-0b75-45a7-84f8-25bddf97af08-agordeev@linux.ibm.com>
 <703cbee6-a813-4970-9232-34ee91ed8961@arm.com>
 <2c2b3382-7bdb-41a9-b48e-4fa9a44312ba@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <2c2b3382-7bdb-41a9-b48e-4fa9a44312ba@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/4/25 06:25, Anshuman Khandual wrote:
> 
> 
> On 03/12/25 1:50 PM, Kevin Brodsky wrote:
>> On 28/11/2025 14:55, Alexander Gordeev wrote:
>>>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>>>> + * currently enabled.
>>> The in_lazy_mmu_mode() name looks ambiguous to me. When the lazy MMU mode
>>> is paused are we still in lazy MMU mode? The __task_lazy_mmu_mode_active()
>>> implementation suggests we are not, while one could still assume we are,
>>> just paused.
>>>
>>> Should in_lazy_mmu_mode() be named e.g. as in_active_lazy_mmu_mode() such
>>> a confusion would not occur in the first place.
>>
>> I see your point, how about is_lazy_mmu_mode_active()?
> 
> Agreed - is_lazy_mmu_mode_active() seems better.

+1, I was scratching my head over this in previous revisions as well.

-- 
Cheers

David

