Return-Path: <linuxppc-dev+bounces-14926-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C396FCD3D90
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Dec 2025 10:22:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dYwmG4CWGz2yFW;
	Sun, 21 Dec 2025 20:22:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766308974;
	cv=none; b=TSqRD/YqWBxhbYXo0lI2pXuPoMf+lpJNQW4plDEpBUeDqTDa/YgTpcumwiv0QIdpovsn4r4qLwesxsGyiOm/Lk1POwPn0kupbYOk06WKDqQPFWiO6d6kCn/b2jqp3lbNYGDSNTyyj5AN0Wvxux3TeoMLrCLVYWNbrnq2zWmFMsrhS0+3X4Cjik2zD++Gdwuq7GvcNo/0VE3Rn8HfX6pZ8T/ILoRdCm5HMv3XCHQx1OqkB1ZqiA/rHe8lCydJfjRlJCEcIAKLmXlEI6ip8RSDO8gzgKM2L8ue5l8S8vhp5d63PZKh64uFbPDgZDP2JQQyteKtW9PrrXzfARkNCasUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766308974; c=relaxed/relaxed;
	bh=gpZeZM48gN392hwtrdm+XPYbRwOvOacSCICRceQeC8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A42sfDPo70/vpJB40nU6fX8oIPndcwAQ4qSANMyg84PsHAV9uFk8W04HHYIQlWtwu8Ge/WUmUFcJqke2LKNkPvknn+/bKVvNzFeCCKxm+k+rWI8cggh52GZzQmpJeWb9MF4t59TCOwaoUR0WGj0Ek70STzkPw0iUP+MejE74jAr5+6zsWJYSsi8jKkxhDsQ2n3LjkVuK/rdEQtJGCq9URg3ot7WFD0bWOWPelSoqJLp6h7alRIu4wRjlI5smCvr8VMQSCHvwfYV07AHa0wDOZm9qmH19fp5bDs6hQUo74TKhW8+WuxwwnKgsrSIbHc5Q9D70+EcH6/Vg4oHf+bx2mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gmwuyHj+; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gmwuyHj+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dYwmF2cpbz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Dec 2025 20:22:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD09143BE5;
	Sun, 21 Dec 2025 09:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE3EC4CEFB;
	Sun, 21 Dec 2025 09:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766308970;
	bh=1hH+QYmuXmY+esC5aiJxRFWapofDzNwd4JqJjBXFA6g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gmwuyHj+PQbFQQ/ir2/clzoLLRp/DiruHvZT3ZWwJSRoMFFkgT4qAdgrddf19g2lh
	 XgDW+n2LQQaB2Ri/aFW0Jhsu0kPomMtoPV4kvSWM+L4oQtFaB4YmwwChK0zdQ+T303
	 Ua0wvmIdpdryQc3lc8k2wuv6ygYDJ04rJ5gsJ2v2Gc8QkhibbD2L9xiUgS88VCiOkO
	 diJY9OQbc/+hV4SVUPuxLTe1XeZ6SV+femSqq4ROEumdksZQCIH8tEmolsNyJxbwcL
	 j5qVjtf4ulvdUtKISwElr/mK7wKo0lKT43UVJDfRo6+5qjgssZT83/ralZNBpBTo+I
	 8ZMXhWEpkJpnQ==
Message-ID: <655cc605-2ce1-4ccb-8cc0-a0a31a9c89fd@kernel.org>
Date: Sun, 21 Dec 2025 10:22:44 +0100
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
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov <bp@alien8.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251221053611.441251-1-sourabhjain@linux.ibm.com>
 <87a4zcml36.ritesh.list@gmail.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <87a4zcml36.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/21/25 06:59, Ritesh Harjani (IBM) wrote:
> Hi Sourabh,
> 
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> 
>> Skip processing hugepage kernel arguments (hugepagesz, hugepages, and
>> default_hugepagesz) when hugepages are not supported by the
>> architecture.
>>
>> Some architectures may need to disable hugepages based on conditions
>> discovered during kernel boot. The hugepages_supported() helper allows
>> architecture code to advertise whether hugepages are supported.
>>
>> Currently, normal hugepage allocation is guarded by
>> hugepages_supported(), but gigantic hugepages are allocated regardless
>> of this check. This causes problems on powerpc for fadump (firmware-
>> assisted dump).
>>
>> In the fadump (firmware-assisted dump) scenario, a production kernel
>> crash causes the system to boot into a special kernel whose sole
>> purpose is to collect the memory dump and reboot. Features such as
>> hugepages are not required in this environment and should be
>> disabled.
>>
>> For example, when the fadump kernel boots with the following kernel
>> arguments:
>> default_hugepagesz=1GB hugepagesz=1GB hugepages=200
>>
>> Before this patch, the kernel prints the following logs:
>>
>> HugeTLB: allocating 200 of page size 1.00 GiB failed.  Only allocated 58 hugepages.
>> HugeTLB support is disabled!
>> HugeTLB: huge pages not supported, ignoring associated command-line parameters
>> hugetlbfs: disabling because there are no supported hugepage sizes
>>
>> Even though the logs state that HugeTLB support is disabled, gigantic
>> hugepages are still allocated. This causes the fadump kernel to run out
>> of memory during boot.
>>
>> After this patch is applied, the kernel prints the following logs for
>> the same command line:
>>
>> HugeTLB: hugepages unsupported, ignoring default_hugepagesz=1GB cmdline
>> HugeTLB: hugepages unsupported, ignoring hugepagesz=1GB cmdline
>> HugeTLB: hugepages unsupported, ignoring hugepages=200 cmdline
>> HugeTLB support is disabled!
>> hugetlbfs: disabling because there are no supported hugepage sizes
>>
>> To fix the issue, gigantic hugepage allocation should be guarded by
>> hugepages_supported().
>>
>> Previously, two approaches were proposed to bring gigantic hugepage
>> allocation under hugepages_supported():
>>
>> [1] Check hugepages_supported() in the generic code before allocating
>> gigantic hugepages
>> [2] Make arch_hugetlb_valid_size() return false for all hugetlb sizes
>>
>> Approach [2] has two minor issues:
>> 1. It prints misleading logs about invalid hugepage sizes
>> 2. The kernel still processes hugepage kernel arguments unnecessarily
>>
>> To control gigantic hugepage allocation, skip processing hugepage kernel
>> arguments (default_hugepagesz, hugepagesz and hugepages) when
>> hugepages_supported() returns false.
>>
>> Link: https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/ [1]
>> Link: https://lore.kernel.org/all/20250128043358.163372-1-sourabhjain@linux.ibm.com/ [2]
>> Fixes: c2833a5bf75b ("hugetlbfs: fix changes to command line processing")
> 
> 
> I appreciate our proactiveness to respond quickly on mailing list, but I
> suggest we give enough time to folks before sending the next version
> please ;).
> 
> Your email from last night [1] says that we will use this fixes tag but
> you haven't even given us 24hrs to respond to that email thread :). Now
> we've sent this v6, with Acked-by of David and Reviewed-by of mine,
> which seems like everything was agreed upon, but that isn't the case
> actually.

Agreed.

> 
> My main concern was -
> A fixes tag means it might get auto backported to stable kernels too,

Not in the MM world -- IIRC. I think there is the agreement, that we 
decide what should go into stable and what not.

Andrew can correct me if my memory is wrong.

But we can always jump in and say that something should not go to stable 
trees.

> which means if the fixes tag is incorrect it could even break stable
> kernels then.
> 
> [1]: https://lore.kernel.org/linuxppc-dev/041352df-41ce-4898-8535-d6b7fd74a52b@linux.ibm.com/T/#m6e16738c03b2b2a8d09717f6291e46207033507a
> 
> 
> Anyways,
> Coming back to the fixes tag. I did mention a bit of a history [2] of
> whatever I could find while reviewing this patch. I am not sure whether
> you have looked into the links shared in that email or not. Here [2]:
> 
> [2]: https://lore.kernel.org/linuxppc-dev/875xa3ksz9.ritesh.list@gmail.com/
> 
> Where I am coming from is.. The current patch is acutally a partial
> revert of the patch mentioned in the fixes tag. That means if this patch
> gets applied to the older stable kernels, it would end up bringing the
> same problem back, which the "Fixes" tagged patch is fixing in the 1st
> place, isnt' it? See this discussion [3]...
> 
> [3]: https://lore.kernel.org/all/b1f04f9f-fa46-c2a0-7693-4a0679d2a1ee@oracle.com/T/#m0eee87b458d93559426b8b0e78dc6ebcd26ad3ae
> 
> ... So, IMO - the right fixes tag, if we have to add, it should be the
> patch which moved the hpage_shift initialization to happen early i.e. in
> mmu_early_init_devtree. That would be this patch [4]:
> 
> [4]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2354ad252b66695be02f4acd18e37bf6264f0464
> 
> Now, it's not really that the patch [4] had any issue as such. But it
> seems like, that the current fix can only be applied after patch [4] is
> taken.
> 
> Do we agree?
I think we should document all that in the cover letter, an describe 
that this partial revert is only possible after [4], and that that must 
be considered when attempting any kind of stable backports.

Thanks for pointing all that out.

-- 
Cheers

David

