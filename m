Return-Path: <linuxppc-dev+bounces-14927-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F868CD3DAE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Dec 2025 10:30:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dYwx01g8gz2yFW;
	Sun, 21 Dec 2025 20:30:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766309428;
	cv=none; b=OfxH4YePZPb3aXYe755hSwqqJ5f8p3DpCC4A+sUZeIBsVsMXA1GIoghAOMPi6baDUVU0ht12HQ+J6dqhmiONCrhW/PgzIRAXgWCxq6SyIf5ZPu+WBxl2OgCvt6BBd/Z2JmGoNiOvY6jkTB+Hfjex6BwtII/52d7pg55dCcsc99qe3zXSlosjCptBkMRqEQSn6iCpFO6qHnkN2eeIStCvQoOVPU6aZ36W+V002wkCcUoHCtV8jgC0HPq1FZvNzHHWbKVvuDRZlEXZQ37lggVTergqy0jNhTP5OvQEkK4rsNdr1tnchGobI1RkhGmi5Z8p++UB942jZ32hQdviVtb3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766309428; c=relaxed/relaxed;
	bh=wdDZF3/HSZmlH2rDLNptQ5LWR2buABlOXa4bjb4WrgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ez+q9bjwQGZokUp/8SPYhY3nfKBsdxvZVlIcYgK30AWtTt47IzP+JU9hnwpKoDw+GXHvg9LIFcMxlENxUEeINEOQ8ZtMS1GGiyLeHULCeN9DZjqR/cDo92c+3Qu31yMI7omml7xxytX3MULdSR8ArAo3kC30R1lORVGs4GRXCiEy1LyhwHxwXeZEBUiQ+6bOUPpb9T4ItUp49Y8S5EkO3rStz13yWErjZGzAdi3LrnYw33kgoYwoTRaa+12nP6zqMBORmqmKscopdJSfiSgqsSoTuH/8AOFMwVhbQ6fW5Evy/99gwDo1DOFOObn69zPG4p2Yxv02rpX6QgmRMRJchw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aZt8jayi; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aZt8jayi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dYwwz32qwz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Dec 2025 20:30:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44D78436EB;
	Sun, 21 Dec 2025 09:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84754C4CEFB;
	Sun, 21 Dec 2025 09:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766309425;
	bh=dynri6cO7Epp0o2N9qQ3cdoFscVQqJSuLqeok3MBBiM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aZt8jayi0KTKlYfeM8PXcjFeXS/nexnOlW7wp5qpXy8jeA90IS+dY96x2qy1rT5xO
	 FHl5hVlhatmZm8PdARiR984pcX5Xnvb/DN3H8anneFIS8urkPCN+tf5dstcWVRW0gb
	 MtpipYZ4/nTh4uvDJud/EwfAeYoY6eMvezzyrEHIwa4jQVN+kGDWFX9QlrkXMmlhHg
	 +/MzLZJiX1cgSGhR6cIHSoivnfh4RJpQU3BWUmReDCQIKKfO8emvBUqYksawYAEan6
	 IemtDz7JnMnQaHpRMNWXo27R+S6bUs2yHEAc+/muXldZEic5H52t16UN2Lx8FHINn3
	 pxRdGiibDmVHQ==
Message-ID: <4aecb94f-e283-4720-96e5-1837352c3329@kernel.org>
Date: Sun, 21 Dec 2025 10:30:15 +0100
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
Subject: Re: [PATCH 1/4] arch/*: increase lowmem size to avoid highmem use
To: Dave Hansen <dave.hansen@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andreas Larsson <andreas@gaisler.com>, Christophe Leroy
 <chleroy@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>,
 Matthew Wilcox <willy@infradead.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Michal Simek <monstr@monstr.eu>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nishanth Menon <nm@ti.com>, Lucas Stach <l.stach@pengutronix.de>
References: <20251219161559.556737-1-arnd@kernel.org>
 <20251219161559.556737-2-arnd@kernel.org>
 <a3f22579-13ee-4479-a5fd-81c29145c3f3@intel.com>
 <bad18ad8-93e8-4150-a85e-a2852e243363@app.fastmail.com>
 <a2ce2849-e572-404c-9713-9283a43c09fe@intel.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <a2ce2849-e572-404c-9713-9283a43c09fe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/19/25 21:52, Dave Hansen wrote:
> On 12/19/25 12:20, Arnd Bergmann wrote:
>>> For simplicity, I think this can just be:
>>>
>>> -	default VMSPLIT_3G
>>> +	default VMSPLIT_2G
>>>
>>> I doubt the 2G vs. 2G_OPT matters in very many cases. If it does, folks
>>> can just set it in their config manually.
>>>
>>> But, in the end, I don't this this matters all that much. If you think
>>> having x86 be consistent with ARM, for example, is more important and
>>> ARM really wants this complexity, I can live with it.
>> Yes, I think we do want the default of VMSPLIT_3G_OPT for
>> configs that have neither highmem nor lpae, otherwise the most
>> common embedded configs go from 3072 MiB to 1792 MiB of virtual
>> addressing, and that is much more likely to cause regressions
>> than the 2816 MiB default.
>>
>> It would be nice to not need the VMSPLIT_2G default for PAE/LPAE,
>> but that seems like a larger change.
> 
> The only thing we'd "regress" would be someone who is repeatedly
> starting from scratch with a defconfig and expecting defconfig to be the
> same all the time. I honestly think that's highly unlikely.
> 
> If folks are upgrading and _actually_ exposed to regressions, they've
> got an existing config and won't be hit by these defaults at *all*. They
> won't actually regress.
> 
> In other words, I think we can be a lot more aggressive about defaults
> than with the feature set we support. I'd much rather add complexity in
> here for solving a real problem, like if we have armies of 32-bit x86
> users constantly starting new projects from scratch and using defconfigs.
> 
> I'd _really_ like to keep the defaults as simple as possible.

I agree with that. In particular in areas where there is the chance that 
we could count the number of people that actually care about that with 
one hand (in binary ;) ).

-- 
Cheers

David

