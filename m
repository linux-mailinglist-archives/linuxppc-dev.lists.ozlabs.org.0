Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 599AE3757BE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 17:41:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbd912S3dz3d7t
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 01:41:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WT4piKhK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WT4piKhK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=WT4piKhK; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=WT4piKhK; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbd6C2yN5z3btd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 01:38:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UoFaFG5meAOT76aQgHG0SVdbeZvG8CD4G86zVOp7u+4=;
 b=WT4piKhKlIrvtvMbqhk9K7wKsWvymZOvu7J/pKq52viPja6RaEmDfmyzZY+ZlIgqWla/xk
 rd+6FvxRUC6EQ12HZsHv4h07vbBgTIGP4hu7X/XnyIAtVt/YfQkFPV9/iIFrYC3fSvT/1S
 cfFCqjwirohQHB8WU1odrhu3QLAHxwY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UoFaFG5meAOT76aQgHG0SVdbeZvG8CD4G86zVOp7u+4=;
 b=WT4piKhKlIrvtvMbqhk9K7wKsWvymZOvu7J/pKq52viPja6RaEmDfmyzZY+ZlIgqWla/xk
 rd+6FvxRUC6EQ12HZsHv4h07vbBgTIGP4hu7X/XnyIAtVt/YfQkFPV9/iIFrYC3fSvT/1S
 cfFCqjwirohQHB8WU1odrhu3QLAHxwY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-aPDtICZgOAOsbDRqaPEnwA-1; Thu, 06 May 2021 11:38:51 -0400
X-MC-Unique: aPDtICZgOAOsbDRqaPEnwA-1
Received: by mail-ed1-f72.google.com with SMTP id
 d6-20020a0564020786b0290387927a37e2so2848825edy.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 May 2021 08:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UoFaFG5meAOT76aQgHG0SVdbeZvG8CD4G86zVOp7u+4=;
 b=T7hMRsX+Ouro07Bzim0oXos0eLodA8faEvd2fTjsYsl7o5XGHYv3M5emng/giT+Fm2
 H/YGCBQLM7fVHhcOeF2S2+yO2B39Ecr+u+tRWDpY9P0IgNgihXM+e9Ji3Zo/in8d5MZd
 Iq7q6fyyPaTDsOQWf7MSvgTJOSdailIo1i6opTHdZP+ljeXhUcZScf+DvvUnKoWXgmJQ
 MOffvithQnWn/5LPlZITtGixA6HJianYbFu2IQA8gYxiXBz90On0sjUKOB0EKmfSIkcT
 DwG5I4VbrkBuSJe6+2rnl0QkC+TsU9Cp/vLy9WgpAss79HXxJxJaHaASslp44Lmm5T8a
 CxGw==
X-Gm-Message-State: AOAM533a0poMHV9Byw7B2maoOWzzzo9e8fGjdg0mQrLqKWalTAKfWS8k
 PEoyee2lmWxCYUvbABvb29IWHgALn/pMSkG6ID/lG4QA8iESq47q5sYeOm+JtqD+AdK8H6P3P+I
 YE5AVKlykOKo1po30Rp6p9shYug==
X-Received: by 2002:aa7:cf07:: with SMTP id a7mr5980741edy.261.1620315530252; 
 Thu, 06 May 2021 08:38:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwL2Szhl+Ueqawj9kuZ34daMTIBv79xuFgvY8BkgWo+1XkwBijQ+2hXlcRNb5PMiMs9QZDJBg==
X-Received: by 2002:aa7:cf07:: with SMTP id a7mr5980704edy.261.1620315529996; 
 Thu, 06 May 2021 08:38:49 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
 by smtp.gmail.com with ESMTPSA id v23sm1986761eda.8.2021.05.06.08.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 08:38:49 -0700 (PDT)
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
From: David Hildenbrand <david@redhat.com>
To: Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>
References: <20210506152623.178731-1-zi.yan@sent.com>
 <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
Organization: Red Hat
Message-ID: <596173b0-310f-7719-d432-11a13e325eab@redhat.com>
Date: Thu, 6 May 2021 17:38:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, x86@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.05.21 17:31, David Hildenbrand wrote:
> On 06.05.21 17:26, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> Hi all,
>>
>> This patchset tries to remove the restriction on memory hotplug/hotremove
>> granularity, which is always greater or equal to memory section size[1].
>> With the patchset, kernel is able to online/offline memory at a size independent
>> of memory section size, as small as 2MB (the subsection size).
> 
> ... which doesn't make any sense as we can only online/offline whole
> memory block devices.
> 
>>
>> The motivation is to increase MAX_ORDER of the buddy allocator and pageblock
>> size without increasing memory hotplug/hotremove granularity at the same time,
> 
> Gah, no. Please no. No.
> 
>> so that the kernel can allocator 1GB pages using buddy allocator and utilizes
>> existing pageblock based anti-fragmentation, paving the road for 1GB THP
>> support[2].
> 
> Not like this, please no.
> 
>>
>> The patchset utilizes the existing subsection support[3] and changes the
>> section size alignment checks to subsection size alignment checks. There are
>> also changes to pageblock code to support partial pageblocks, when pageblock
>> size is increased along with MAX_ORDER. Increasing pageblock size can enable
>> kernel to utilize existing anti-fragmentation mechanism for gigantic page
>> allocations.
> 
> Please not like this.
> 
>>
>> The last patch increases SECTION_SIZE_BITS to demonstrate the use of memory
>> hotplug/hotremove subsection, but is not intended to be merged as is. It is
>> there in case one wants to try this out and will be removed during the final
>> submission.
>>
>> Feel free to give suggestions and comments. I am looking forward to your
>> feedback.
> 
> Please not like this.
> 

And just to be clear (I think I mentioned this already to you?): Nack to 
increasing the section size. Nack to increasing the pageblock order. 
Please find different ways to group on gigantic-pages level. There are 
alternative ideas floating around.

Semi-nack to increasing MAX_ORDER. I first want to see 
alloc_contig_range() be able to fully and cleanly handle allocations < 
MAX_ORDER in all cases (especially !CMA and !ZONE_MOVABLE) before we go 
down that path.

-- 
Thanks,

David / dhildenb

