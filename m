Return-Path: <linuxppc-dev+bounces-14938-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8962BCD5ACA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Dec 2025 11:55:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZZmY6gM5z2xpm;
	Mon, 22 Dec 2025 21:55:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766400925;
	cv=none; b=aQMEad4Njbh31MARt+8QxkFphds1tGgRwTQomWU5SZIn7sDb+VT7sAhGY/1HSaiQXWi6ppWaIdS3O0m8Bf1zUKOs1T1cyimbhPzzfahB7JZ4sB8b6O+pdDQg64T0Sy+83ODH2V5wcc+qDXag8+baQi1eJ0QIHvkt3qZqurd04M4TD8OdH5t4kv1XFvqbOyN6JUH5yu4wpbzoJQSx+6DbNEWuHCSbax2p872JvCh2dPTWafFiGY/Y7U3ZbDEsIkzfGY2GsCZhwBst1TUh9DZ2hrFRWT6QS/E8Y4R9YtYaewNXHddzGoHP24fBQdmYIR4ho+KkIUFCeLatJ9otkujTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766400925; c=relaxed/relaxed;
	bh=via50+UU3zwF3j2NucBXqocVM1I/vn9/qh/wjIgtrmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UYnfW+j6BvFxesNiVni5Bb06H73vqksLQMqssR44vfkpcZMJ+6qZM00lsgupVGVWbgh6zcIygDbPpbIUqoTFkwJYDNaH3X3r3+CNVfzt3f6pWEg0W2y2+LLGhJ7t6Rs/z4lmjvX4NYUKZTsM4do/bYM6uFh3KhFmZCS9h4vrlFBYjKnxRnXXJxneNWunWY0ssOa9BEldMTLNQ7d8etxIekc21/kadyO3HoeFU5+GUGhQ9ZyHhsF+EPmp6jWIrlAs9Q4qt5NKubhrXZlk2m00TjqTdnsg9v7GSqw0KfPCSuxjPwKiALCLdcL1ccJgb8/Fie2NCkAyoq5Fn+pVDlXR1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TBbcOWnS; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TBbcOWnS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZZmX6cHLz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Dec 2025 21:55:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0811B42E47;
	Mon, 22 Dec 2025 10:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6255C4CEF1;
	Mon, 22 Dec 2025 10:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766400892;
	bh=cv/VTMXLxul+HjudSJW7wkMxfJdfBr+el6AQMlItv9w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TBbcOWnSr19MwF0MKrCb2IoabYD0Nb+Hare+gEpTLzqusRx2+g7sBBoVWN7mXfVuZ
	 9g48PR844JLrnIVBXNJDcPRzZ9OqZquI7XiHNGeRwHRykZYpEycTOUpmGN0z4nW/2x
	 exNm6rPf3N4LEfbJUmfd492tMzcaecLPdXqfDuC4XviG8bw0zrKfc340q+uV2v7A31
	 tSGddRTWmUAG4XhmWs/NugkfoosrV9ks7Kz30Zoom9Se8/nzViTi1v4hjixSRy25gU
	 EU0bg8YbcDJPHiMekaav/bto5jUZ768ihhxepiBF9REEAyupmmRO5IMAzEtlO7J7ps
	 8hPuYpgjOVq+g==
Message-ID: <e97c41cd-44f7-4560-bc75-79283a438e91@kernel.org>
Date: Mon, 22 Dec 2025 11:54:46 +0100
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
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov <bp@alien8.de>, Heiko Carstens <hca@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251221053611.441251-1-sourabhjain@linux.ibm.com>
 <87a4zcml36.ritesh.list@gmail.com>
 <655cc605-2ce1-4ccb-8cc0-a0a31a9c89fd@kernel.org>
 <87fr93ky5i.ritesh.list@gmail.com>
 <16fef7a5-6853-4a6f-8d27-e005fa351eb7@linux.ibm.com>
 <051628be-ed70-4a56-8704-f2b8cdea1984@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <051628be-ed70-4a56-8704-f2b8cdea1984@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/12/2025 à 11:28, David Hildenbrand (Red Hat) a écrit :
> On 12/22/25 06:57, Sourabh Jain wrote:
>>
>>
>> On 22/12/25 08:42, Ritesh Harjani (IBM) wrote:
>>> "David Hildenbrand (Red Hat)" <david@kernel.org> writes:
>>>
>>>>> Coming back to the fixes tag. I did mention a bit of a history [2] of
>>>>> whatever I could find while reviewing this patch. I am not sure 
>>>>> whether
>>>>> you have looked into the links shared in that email or not. Here [2]:
>>>>>
>>>>> [2]: https://eur01.safelinks.protection.outlook.com/? 
>>>>> url=https%3A%2F%2Flore.kernel.org%2Flinuxppc- 
>>>>> dev%2F875xa3ksz9.ritesh.list%40gmail.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cfe40f4881e8441ab3ebf08de4144e747%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639019961377096292%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Dnvzy5kJ%2ByF9GJjIw%2B12FTjaVgeAM2gA9g7hsYl7Qok%3D&reserved=0
>>>>>
>>>>> Where I am coming from is.. The current patch is acutally a partial
>>>>> revert of the patch mentioned in the fixes tag. That means if this 
>>>>> patch
>>>>> gets applied to the older stable kernels, it would end up bringing the
>>>>> same problem back, which the "Fixes" tagged patch is fixing in the 1st
>>>>> place, isnt' it? See this discussion [3]...
>>>>>
>>>>> [3]: https://eur01.safelinks.protection.outlook.com/? 
>>>>> url=https%3A%2F%2Flore.kernel.org%2Fall%2Fb1f04f9f-fa46- 
>>>>> c2a0-7693-4a0679d2a1ee%40oracle.com%2FT%2F%23m0eee87b458d93559426b8b0e78dc6ebcd26ad3ae&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cfe40f4881e8441ab3ebf08de4144e747%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639019961377117150%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=bOO7FGN4jAtX3jjBnJVpSurmM9rGmz8vIs1iGtbm1gU%3D&reserved=0
>>>>>
>>>>> ... So, IMO - the right fixes tag, if we have to add, it should be the
>>>>> patch which moved the hpage_shift initialization to happen early 
>>>>> i.e. in
>>>>> mmu_early_init_devtree. That would be this patch [4]:
>>>>>
>>>>> [4]: https://eur01.safelinks.protection.outlook.com/? 
>>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fid%3D2354ad252b66695be02f4acd18e37bf6264f0464&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cfe40f4881e8441ab3ebf08de4144e747%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639019961377133860%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=0yTuECy%2BBGDLiSNYuqYH9xGBOSxiRLxAtW%2FWTQU%2FB%2BA%3D&reserved=0
>>>>>
>>>>> Now, it's not really that the patch [4] had any issue as such. But it
>>>>> seems like, that the current fix can only be applied after patch 
>>>>> [4] is
>>>>> taken.
>>>>>
>>>>> Do we agree?
>>>> I think we should document all that in the cover letter, an describe
>>>> that this partial revert is only possible after [4],
>>> Yes, I agree. Let's add the above details in the commit msg.
>>>
>>>> and that that must
>>>> be considered when attempting any kind of stable backports.
>>> Sure. I would prefer if we change the Fixes tag to the one which I
>>> pointed in above [4] (with explaination in the commit msg). However I am
>>> still ok if we would like to retain the existing fixes tag and show [4]
>>> as a dependency.
>>
>> I think we should keep the current Fixes tag with an explanation for
>> dependency
>> on [1] in the commit message.
>>
>> Would anyone have a different view?
> 
> Whatever introduced the issue should be called out in the Fixes tag; if 
> there are dependencies for the fix through other patches that were 
> already merged, that can be documented in the patch description 
> (relevant for stable or distro backports only).
> 

We can also use the Depends-on: tag, see for exemple commit 9517b82d8d42 
("nbd: defer config put in recv_work"):

     Reported-by: syzbot+56fbf4c7ddf65e95c7cc@syzkaller.appspotmail.com
     Closes: 
https://lore.kernel.org/all/6907edce.a70a0220.37351b.0014.GAE@google.com/T/
     Fixes: 87aac3a80af5 ("nbd: make the config put is called before the 
notifying the waiter")
     Depends-on: e2daec488c57 ("nbd: Fix hungtask when nbd_config_put")
     Signed-off-by: Zheng Qixing <zhengqixing@huawei.com>
     Signed-off-by: Jens Axboe <axboe@kernel.dk>


Christophe



