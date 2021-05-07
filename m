Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E27D737668A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 16:01:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcBv928d8z307L
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 00:01:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f99phfS3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f99phfS3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=f99phfS3; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=f99phfS3; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcBtS3K4Yz2yYD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 00:00:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620396042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MiSXjJ0WR3uZ2T2RJ9lHILm/xn7n1a3SDG4Exknmyh4=;
 b=f99phfS3IqBxkJn6mmzk35mXDrlSPLvOOqDnD4JRTrxiJkY931ViVcw3alOJX0uh2VVbum
 mOrDOpg9Fgn9GQmTZDDZpGAjalqipkcxo6eBD4KEpu100MLwyAj+SISL8vlOq19elTi0Jp
 eS8cYOVItemCEiFcku+V8mxQqF3qozk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620396042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MiSXjJ0WR3uZ2T2RJ9lHILm/xn7n1a3SDG4Exknmyh4=;
 b=f99phfS3IqBxkJn6mmzk35mXDrlSPLvOOqDnD4JRTrxiJkY931ViVcw3alOJX0uh2VVbum
 mOrDOpg9Fgn9GQmTZDDZpGAjalqipkcxo6eBD4KEpu100MLwyAj+SISL8vlOq19elTi0Jp
 eS8cYOVItemCEiFcku+V8mxQqF3qozk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-yk0yWviaMe-jAtwV-xePxw-1; Fri, 07 May 2021 10:00:39 -0400
X-MC-Unique: yk0yWviaMe-jAtwV-xePxw-1
Received: by mail-wm1-f71.google.com with SMTP id
 w21-20020a7bc1150000b029014a850581efso2277175wmi.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 May 2021 07:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=MiSXjJ0WR3uZ2T2RJ9lHILm/xn7n1a3SDG4Exknmyh4=;
 b=bwenfFlkM4rvZ6DDi278V6RblHmxxkN1auoP9dkbSmi9x7a/K3VolnEujIov4Y91k6
 JuuOkA4eJdjJZdCMHUvtqTKl1lh+JTcSgSBrcdB0rX/DccXldCv1n0ENpS73Axmarl2d
 y1Lk/ZgARXWD+CucDoMUbBc8z/1jDoKxIauANCZNOYUC3yEMEdVUzSDUKW1dl9/7d86x
 nFUYSPaQlVnkikbZeVzT0bgFn99va8mSiSPxJhIDhpIbBF2Z1HNP5trbm42gU/duv9O8
 8ee7vP5fqgqA+z25E4pbOAxtlAAltHqxiFbH7fRoK/cOoIESpdw28s3p38eY6zy4L+5E
 tczw==
X-Gm-Message-State: AOAM530iwgtaUh/2pXEII4Z3KprSS9cy+Me/r9yH619Rtj+5cv+1yyaK
 FIll6wRnFMj7eTILJu3jicFKI+JRqProVL8pR5uJZ1WuE086ju6ULrORPds8OmAFBqMAjB2GM2P
 ZeahYWQN0jIotGDRH9MQvU85c5A==
X-Received: by 2002:adf:e291:: with SMTP id v17mr12060497wri.149.1620396038170; 
 Fri, 07 May 2021 07:00:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+s+cU3Vtr7QIEk2tXxhKFgB7G7iAl1u8Q7+ZtZsRjRk+l+P2f2eAswGLfrfLFtpRTfd9csw==
X-Received: by 2002:adf:e291:: with SMTP id v17mr12060455wri.149.1620396037823; 
 Fri, 07 May 2021 07:00:37 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c63c0.dip0.t-ipconnect.de. [91.12.99.192])
 by smtp.gmail.com with ESMTPSA id
 c8sm8651643wrx.4.2021.05.07.07.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 07:00:37 -0700 (PDT)
To: Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>
References: <20210506152623.178731-1-zi.yan@sent.com>
 <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
 <YJUqrOacyqI+kiKW@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
Message-ID: <792d73e2-5d63-74a5-5554-20351d5532ff@redhat.com>
Date: Fri, 7 May 2021 16:00:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJUqrOacyqI+kiKW@dhcp22.suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-ia64@vger.kernel.org, Wei Yang <richard.weiyang@linux.alibaba.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, x86@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07.05.21 13:55, Michal Hocko wrote:
> [I haven't read through respective patches due to lack of time but let
>   me comment on the general idea and the underlying justification]
> 
> On Thu 06-05-21 17:31:09, David Hildenbrand wrote:
>> On 06.05.21 17:26, Zi Yan wrote:
>>> From: Zi Yan <ziy@nvidia.com>
>>>
>>> Hi all,
>>>
>>> This patchset tries to remove the restriction on memory hotplug/hotremove
>>> granularity, which is always greater or equal to memory section size[1].
>>> With the patchset, kernel is able to online/offline memory at a size independent
>>> of memory section size, as small as 2MB (the subsection size).
>>
>> ... which doesn't make any sense as we can only online/offline whole memory
>> block devices.
> 
> Agreed. The subsection thingy is just a hack to workaround pmem
> alignement problems. For the real memory hotplug it is quite hard to
> argue for reasonable hotplug scenarios for very small physical memory
> ranges wrt. to the existing sparsemem memory model.
>   
>>> The motivation is to increase MAX_ORDER of the buddy allocator and pageblock
>>> size without increasing memory hotplug/hotremove granularity at the same time,
>>
>> Gah, no. Please no. No.
> 
> Agreed. Those are completely independent concepts. MAX_ORDER is can be
> really arbitrary irrespective of the section size with vmemmap sparse
> model. The existing restriction is due to old sparse model not being
> able to do page pointer arithmetic across memory sections. Is there any
> reason to stick with that memory model for an advance feature you are
> working on?
> 

I gave it some more thought yesterday. I guess the first thing we should 
look into is increasing MAX_ORDER and leaving pageblock_order and 
section size as is -- finding out what we have to tweak to get that up 
and running. Once we have that in place, we can actually look into 
better fragmentation avoidance etc. One step at a time.

Because that change itself might require some thought. Requiring that 
bigger MAX_ORDER depends on SPARSE_VMEMMAP is something reasonable to do.

As stated somewhere here already, we'll have to look into making 
alloc_contig_range() (and main users CMA and virtio-mem) independent of 
MAX_ORDER and mainly rely on pageblock_order. The current handling in 
alloc_contig_range() is far from optimal as we have to isolate a whole 
MAX_ORDER - 1 page -- and on ZONE_NORMAL we'll fail easily if any part 
contains something unmovable although we don't even want to allocate 
that part. I actually have that on my list (to be able to fully support 
pageblock_order instead of MAX_ORDER -1 chunks in virtio-mem), however 
didn't have time to look into it.

Further, page onlining / offlining code and early init code most 
probably also needs care if MAX_ORDER - 1 crosses sections. Memory holes 
we might suddenly have in MAX_ORDER - 1 pages might become a problem and 
will have to be handled. Not sure which other code has to be tweaked 
(compaction? page isolation?).

Figuring out what needs care itself might take quite some effort.


One thing I was thinking about as well: The bigger our MAX_ORDER, the 
slower it could be to allocate smaller pages. If we have 1G pages, 
splitting them down to 4k then takes 8 additional steps if I'm, not 
wrong. Of course, that's the worst case. Would be interesting to evaluate.

-- 
Thanks,

David / dhildenb

