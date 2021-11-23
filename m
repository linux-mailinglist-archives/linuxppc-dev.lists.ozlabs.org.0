Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 126D445AA22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 18:33:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzB7M05Vsz3bqS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 04:33:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=r66JtRer;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=am4OCcex;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=vbabka@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=r66JtRer; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=am4OCcex; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzB6g2bXjz2yQL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 04:32:42 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D89BE212BC;
 Tue, 23 Nov 2021 17:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637688757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6JdPmib3v3gvcHABOETzZ3g4yrxlrjaBoIvxgUisgUk=;
 b=r66JtRer23NJRk+k29auveGw9fDYYnj0ZMA02hzpnaNq9sbA2d2i9wNaNeUo+j2IJ+Q+S3
 uZerhJbz8BNYQq0PXN0sjeLAHJ/BQxGW+GlZPuTTa6dU/wQemLh4eMQlVi3PXr5f4INu5y
 KMzb0hwlvKwk2q6GiaAjfIfmzPpQnng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637688757;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6JdPmib3v3gvcHABOETzZ3g4yrxlrjaBoIvxgUisgUk=;
 b=am4OCcexfMnSxTwGto3ZBFdx8gLwbJTA6JYc4MlBNIz2Levx3vwYlKj26iSJoKTHit3rsa
 GhHA2+pzc6oSP7Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A564313E41;
 Tue, 23 Nov 2021 17:32:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZCVIJ7UlnWGZfgAAMHmgww
 (envelope-from <vbabka@suse.cz>); Tue, 23 Nov 2021 17:32:37 +0000
Message-ID: <52dbf824-76be-cc34-3983-d45510b1b618@suse.cz>
Date: Tue, 23 Nov 2021 18:32:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>
References: <20211115193725.737539-1-zi.yan@sent.com>
 <3083463d-978b-fbe6-dadf-670d400ed437@suse.cz>
 <AEFF28CF-0ED8-450F-96A4-A6CD59CB1F3D@nvidia.com>
 <BF8FB68A-6E1D-4465-8A2B-884FC034660B@nvidia.com>
From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [RFC PATCH 0/3] Use pageblock_order for cma and
 alloc_contig_range alignment.
In-Reply-To: <BF8FB68A-6E1D-4465-8A2B-884FC034660B@nvidia.com>
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
Cc: David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/23/21 17:35, Zi Yan wrote:
> On 19 Nov 2021, at 10:15, Zi Yan wrote:
>>>> From what my understanding, cma required alignment of
>>>> max(MAX_ORDER - 1, pageblock_order), because when MIGRATE_CMA was introduced,
>>>> __free_one_page() does not prevent merging two different pageblocks, when
>>>> MAX_ORDER - 1 > pageblock_order. But current __free_one_page() implementation
>>>> does prevent that.
>>>
>>> But it does prevent that only for isolated pageblock, not CMA, and yout
>>> patchset doesn't seem to expand that to CMA? Or am I missing something.
>>
>> Yeah, you are right. Originally, I thought preventing merging isolated pageblock
>> with other types of pageblocks is sufficient, since MIGRATE_CMA is always
>> converted from MIGRATE_ISOLATE. But that is not true. I will rework the code.
>> Thanks for pointing this out.
>>
> 
> I find that two pageblocks with different migratetypes, like MIGRATE_RECLAIMABLE
> and MIGRATE_MOVABLE can be merged into a single free page after I checked
> __free_one_page() in detail and printed pageblock information during buddy page
> merging.

Yes, that can happen.

I am not sure what consequence it will cause. Do you have any idea?

For MIGRATE_RECLAIMABLE or MIGRATE_MOVABLE or even MIGRATE_UNMOVABLE it's
absolutely fine. As long as these pageblocks are fully free (and they are if
it's a single free page spanning 2 pageblocks), they can be of any of these
type, as they can be reused as needed without causing fragmentation.

But in case of MIGRATE_CMA and MIGRATE_ISOLATE, uncontrolled merging would
break the specifics of those types. That's why the code is careful for
MIGRATE_ISOLATE, and MIGRATE_CMA was until now done in MAX_ORDER granularity.
