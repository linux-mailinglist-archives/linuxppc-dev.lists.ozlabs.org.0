Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F253462F53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 10:12:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3Gh23Vpjz3cSv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 20:12:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=GbGxdWqS;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=O8UDBVoK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=vbabka@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=GbGxdWqS; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=O8UDBVoK; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3GgK5X1Gz2xsb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 20:11:41 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4CB341FD38;
 Tue, 30 Nov 2021 09:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1638263497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8fxSkdBQ2ajgsZMhQYuiid+yRFZut1IgGX00dpY3vw=;
 b=GbGxdWqS1PKYITNOyIsjZ8f0rMM+b17I8L3kRhVKESRkn6E0ETjrVP9iYQH5OjyGCAotPj
 VX8JPdAgH1+Bt08MkB7ShuBbHuFliZzI/XYxKsIufjKsXZzmTH4yG2SoHagH5lkYBx7YFJ
 xQRlnWbWisJoN2wKOIuS6Lhf6qmik38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1638263497;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8fxSkdBQ2ajgsZMhQYuiid+yRFZut1IgGX00dpY3vw=;
 b=O8UDBVoKu0061EyDRxTTT6iRINdMQ5VnRmzqlz2yOrUzueRjRUeOLpi9YLsImfspmpMTn8
 mbCD40CcLeVDpoAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 182D913C3D;
 Tue, 30 Nov 2021 09:11:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PNstBcnqpWGtEAAAMHmgww
 (envelope-from <vbabka@suse.cz>); Tue, 30 Nov 2021 09:11:37 +0000
Message-ID: <1c67bb96-24db-f5a6-7520-3d97e54e5192@suse.cz>
Date: Tue, 30 Nov 2021 10:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC PATCH 0/3] Use pageblock_order for cma and
 alloc_contig_range alignment.
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>
References: <20211115193725.737539-1-zi.yan@sent.com>
 <3083463d-978b-fbe6-dadf-670d400ed437@suse.cz>
 <AEFF28CF-0ED8-450F-96A4-A6CD59CB1F3D@nvidia.com>
 <BF8FB68A-6E1D-4465-8A2B-884FC034660B@nvidia.com>
 <52dbf824-76be-cc34-3983-d45510b1b618@suse.cz>
 <35A20739-152A-450E-8535-2236D2B28748@nvidia.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <35A20739-152A-450E-8535-2236D2B28748@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Mel Gorman <mgorman@techsingularity.net>,
 David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/29/21 23:08, Zi Yan wrote:
> On 23 Nov 2021, at 12:32, Vlastimil Babka wrote:
> 
>> On 11/23/21 17:35, Zi Yan wrote:
>>> On 19 Nov 2021, at 10:15, Zi Yan wrote:
>>>>>> From what my understanding, cma required alignment of
>>>>>> max(MAX_ORDER - 1, pageblock_order), because when MIGRATE_CMA was introduced,
>>>>>> __free_one_page() does not prevent merging two different pageblocks, when
>>>>>> MAX_ORDER - 1 > pageblock_order. But current __free_one_page() implementation
>>>>>> does prevent that.
>>>>>
>>>>> But it does prevent that only for isolated pageblock, not CMA, and yout
>>>>> patchset doesn't seem to expand that to CMA? Or am I missing something.
>>>>
>>>> Yeah, you are right. Originally, I thought preventing merging isolated pageblock
>>>> with other types of pageblocks is sufficient, since MIGRATE_CMA is always
>>>> converted from MIGRATE_ISOLATE. But that is not true. I will rework the code.
>>>> Thanks for pointing this out.
>>>>
>>>
>>> I find that two pageblocks with different migratetypes, like MIGRATE_RECLAIMABLE
>>> and MIGRATE_MOVABLE can be merged into a single free page after I checked
>>> __free_one_page() in detail and printed pageblock information during buddy page
>>> merging.
>>
>> Yes, that can happen.
>>
>> I am not sure what consequence it will cause. Do you have any idea?
>>
>> For MIGRATE_RECLAIMABLE or MIGRATE_MOVABLE or even MIGRATE_UNMOVABLE it's
>> absolutely fine. As long as these pageblocks are fully free (and they are if
>> it's a single free page spanning 2 pageblocks), they can be of any of these
>> type, as they can be reused as needed without causing fragmentation.
>>
>> But in case of MIGRATE_CMA and MIGRATE_ISOLATE, uncontrolled merging would
>> break the specifics of those types. That's why the code is careful for
>> MIGRATE_ISOLATE, and MIGRATE_CMA was until now done in MAX_ORDER granularity.
> 
> Thanks for the explanation. Basically migratetypes that can fall back to each
> other can be merged into a single free page, right?

Yes.

> How about MIGRATE_HIGHATOMIC? It should not be merged with other migratetypes
> from my understanding.

Hmm it shouldn't minimally because it has an accounting that would become
broken. So it should prevent merging or make sure the reservations are with
MAX_ORDER granularity, but seems that neither is true? CCing Mel.

> --
> Best Regards,
> Yan, Zi
> 

