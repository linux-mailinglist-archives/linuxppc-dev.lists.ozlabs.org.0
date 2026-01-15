Return-Path: <linuxppc-dev+bounces-15844-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9318D24A14
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 13:58:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsNLw1Frgz309H;
	Thu, 15 Jan 2026 23:58:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768481880;
	cv=none; b=YzEEvOGsgPnsGw51OFiqSxd8Sguvygtwc8GdUKfGG1Kmk40ZYPqjiyS6C6AjHkZqexsBcEi3lmTqKQar/wDpVySccaQ5MO9YCZWmVz+vs2emHvT1cjP1T2fkoKFAs/+nXdbpQ3rbZSmDbYQTCXS5We65c4e8Nsbw/S0tslkQBZ1mGbICXszkSYqRgVxJ5sNCmdvqFov7UzYhA8wcpY64aToM+qklbBqDd7N9qxz+vP6d3LuOYjfRoyzvFBvkFaAl0RipIkV9jZzS6MbZnxigGhOVze35SWtl4YY48cwHy0HmY3IT2xdbMu/xk/zWChsIQbRiH72PI2fP0xvys7KFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768481880; c=relaxed/relaxed;
	bh=Hi4SYjromf/cJqpS+mj48/FeRYAqtl7uam2EhyFi3WE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JX9B4anK6oPt7D/fJHIwHcOIqDjXFErZo/Ui7OxXFqjHOw3YjCJIb232K2oD+9BcGxQplt5DCTGWXQX/1mJNCqdJI3LOFdoIvITcr9MUkUDgiGIK3XY3lBWujL/6K93JtnVJRiVy6zTqZYGwIZpIvC5U+XRPswY9beR8ym/HEvzzS5iRrtMif3QU7k/5Wf8zlnimD7X0U/G/5M8QuQWcBeBAWorUeipFhR9eBB8NSAns8PZ+n134j2xalbuxBFVi3mEU5QP2mxgoDx3kzGyaixspm9ieIeDF3OhhgoxOIl2tlpeCcFDXWDdMgZOX2ijXftHSQkclMYMPxSmOoSIlBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PV5Oe7zK; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PV5Oe7zK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsNLv2gq8z2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 23:57:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AB6D43BDC;
	Thu, 15 Jan 2026 12:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB70C116D0;
	Thu, 15 Jan 2026 12:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768481877;
	bh=QQQ5NrqGNbrA87NK6i9QuCICGXnVn9gpkg9MNoJKL0g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PV5Oe7zKD0UA+A8qh6TXg0N4EGR2AHpg/fqR1w+EZc4T+gwSUdpyz88M847BMl4QD
	 dbRepGePEAnxC5SNW1WXY259VnC4pPnrZD6SVgL9Zxg5m4nxA9kVwQHmd/JAjnYBKr
	 OHsfEazF4ddYZC1r1ieJvs2SKC/ndkiulwXnY1eCR0+6udzecSyveAdUECJGFIDAQe
	 LsIYv/lOGevL6mrmp+nBhkAXCZ7okiMahs3NeV8W9gh2eBHBvkK3H1650Ow79RMx2E
	 PoM57SzFndTkv2U7JaWHMd9WKbudswbbHONyG5PKGvAVIeXuIh6kg5HUcQledWYIjA
	 JJuHNvV+TXZ6Q==
Message-ID: <1539a8cb-4cd7-40dd-9949-a2c8f7e272b9@kernel.org>
Date: Thu, 15 Jan 2026 13:57:49 +0100
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
Subject: Re: [PATCH v2 04/23] mm/balloon_compaction: centralize basic page
 migration handling
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-doc@vger.kernel.org,
 virtualization@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Zi Yan <ziy@nvidia.com>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-5-david@kernel.org>
 <821926db-2cbd-41a6-bc40-bdc80a0e2499@lucifer.local>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
In-Reply-To: <821926db-2cbd-41a6-bc40-bdc80a0e2499@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>>   #endif /* CONFIG_BALLOON_COMPACTION */
>> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
>> index 03c5dbabb1565..5444c61bb9e76 100644
>> --- a/mm/balloon_compaction.c
>> +++ b/mm/balloon_compaction.c
>> @@ -232,20 +232,49 @@ static void balloon_page_putback(struct page *page)
>>   	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
>>   }
>>
>> -/* move_to_new_page() counterpart for a ballooned page */
>>   static int balloon_page_migrate(struct page *newpage, struct page *page,
>>   		enum migrate_mode mode)
> 
> I honestly wonder if page should be 'oldpage', or rather we should just match
> args to the struct movable_operations e.g. dst, src?

Yeah, likely it should be made consistent. But not as part of this patch 
series :)

In particular, as we should be making all other things, like 
balloon_dev_info's migratepage and the ones implementing it use the same 
terminology in the same go.

On the TODO list.

> 
>>   {
>> -	struct balloon_dev_info *balloon = balloon_page_device(page);
>> +	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
>> +	unsigned long flags;
>> +	int rc;
>>
>>   	VM_BUG_ON_PAGE(!PageLocked(page), page);
>>   	VM_BUG_ON_PAGE(!PageLocked(newpage), newpage);
>>
>>   	/* Isolated balloon pages cannot get deflated. */
> 
> Hmm, I'm a bit confused by this comment, isn't 'page' isolated?
> 
> This comment reads like !b_dev_info implies page isolated and thus a
> WARN_ON_ONCE() issue, but later you say 'Free the now-deflated page we isolated
> in balloon_page_isolate().' in reference to page?

The page is isolated, as documented for "struct movable_operations". And 
as the comment states, isolated pages cannot deflate.

So consequently, if we reach this point, we still have a balloon device, 
because the balloon device could not have deflated the page.

I don't really want to change the comment as part of this change here, 
it logically does not belong into this patch.

Maybe something for a cleanup patch:

"When we isolated the page, the page was inflated in a balloon device. 
As isolated balloon pages cannot get deflated, we still have a balloon 
device here."

> 
> So both can't be true.
> 
>> -	if (WARN_ON_ONCE(!balloon))
>> +	if (WARN_ON_ONCE(!b_dev_info))
>>   		return -EAGAIN;
>>
>> -	return balloon->migratepage(balloon, newpage, page, mode);
>> +	rc = b_dev_info->migratepage(b_dev_info, newpage, page, mode);
>> +	switch (rc) {
>> +	case 0:
>> +		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
>> +
>> +		/* Insert the new page into the balloon list. */
> 
> Slightly weird to put this comment next to the pageref update then a newline
> hten the actual insertion bit.

When a page is in the list we have to grab a reference. No strong 
opinion about dropping the newline.

> 
>> +		get_page(newpage);
>> +
>> +		balloon_page_insert(b_dev_info, newpage);
>> +		__count_vm_event(BALLOON_MIGRATE);
>> +		break;
>> +	case -ENOENT:
>> +		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
>> +
>> +		/* Old page was deflated but new page not inflated. */
> 
> Weird reference to old page and new page when old page is 'page', with dst, src
> we could just say destination/source?

I can strip the "Old" for now, but dst vs. src will be handled separately.

> 
>> +		__count_vm_event(BALLOON_DEFLATE);
>> +		break;
>> +	default:
>> +		return rc;
> 
> Don't we need to change the isolate stats etc. if we simply fail here? Or does
> the movable ops logic correctly handle this for us?

A non-0 return value from balloon_page_migrate() means that migration 
failed and that the (src) page stays isolated.

For example, migration core can later retry migration without re-isolation.

So the migration-core takes care of this.

> 
> Ah I guess baloon_page_putback() would be invoked :) Fun!

Right, the isolated page has to be putback later.

> 
>> +	}
> 
> It's subjective and pedantic but I don't love this use of the switch here, it
> really makes it seem like 'just another case' to do the _key_ action here of
> migrating a balloon page. Also could compress things a bit, that's even more
> subjective :)

You summarized my thoughts well ;)

I had exactly the thing you write below before I converted to switch. I 
didn't particularly like the filtering for return codes. Let me think 
about whether I want to go back.

As you note, it's highly subjective.
[...]

> 
>> +
>> +	b_dev_info->isolated_pages--;
>> +	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
>> +
>> +	/* Free the now-deflated page we isolated in balloon_page_isolate(). */
>> +	balloon_page_finalize(page);
>> +	put_page(page);
> 
> OK so we get on migrate, but put the source page which would have got gotten
> previously I guess?

Right, the (old)/page source was deflated, so we prepare for handing it 
back to the buddy.

In the future, once these pages are frozen, migration-core will likely 
take care of doing the freeing, instead of us doing the put_page() here.

One goal of this patch set was to move the getting/putting of pages out 
as far as possible, such that the return values from 
isolate/migrate/putback later on indicate who now "owns" the reference 
to the frozen page.

Thanks for the review!

-- 
Cheers

David

