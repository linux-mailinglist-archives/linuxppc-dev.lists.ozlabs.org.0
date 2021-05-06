Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3B9375735
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 17:31:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbcxw16fzz3bTH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 01:31:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVJI2s+q;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVJI2s+q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=IVJI2s+q; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVJI2s+q; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbcxP3Ld4z2yxY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 01:31:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3gJNK8hV6eVduRJTKvIL/+ipOjUBkl33BLAv9gMTmY=;
 b=IVJI2s+qLaAz7Pzrf5kpxP1eRPPFshhadXtUzMbDBBoChfHayXql3pvmXhndiQVediDjfl
 T+sZMcQY73YdJiM6Ayn6uvsyWWZPsaBCmZIuymCFFiA16pS3kkVW7zkr8+FGGc11PweYcI
 qc+30Z+yvrzLXZWu/cVJw2u5wUrKGoc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3gJNK8hV6eVduRJTKvIL/+ipOjUBkl33BLAv9gMTmY=;
 b=IVJI2s+qLaAz7Pzrf5kpxP1eRPPFshhadXtUzMbDBBoChfHayXql3pvmXhndiQVediDjfl
 T+sZMcQY73YdJiM6Ayn6uvsyWWZPsaBCmZIuymCFFiA16pS3kkVW7zkr8+FGGc11PweYcI
 qc+30Z+yvrzLXZWu/cVJw2u5wUrKGoc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-0bodT-5XMbK6ZDoeqsJ8TQ-1; Thu, 06 May 2021 11:31:12 -0400
X-MC-Unique: 0bodT-5XMbK6ZDoeqsJ8TQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 s66-20020a1ca9450000b0290149fce15f03so2790965wme.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 May 2021 08:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=M3gJNK8hV6eVduRJTKvIL/+ipOjUBkl33BLAv9gMTmY=;
 b=DC0vcu6aTx99y4cnJuVg0Nb2/tV6YVfmIlyZBSEZMdr1Q+Py3Qn3YiuId6SO65udew
 DYd2kweMLrhso3ahrfqSG+r0KbNMoo58CIiqbEmTD0oMIvbzUPbefFXZgn8wPjhdTyh/
 /7x6K0Te2mM4+w1CxM+aUQbESE2tYCiuEnXuUh3NMNsN6dPzos8q2BPSsx5+NK3Y3S8u
 1/v7J/uWiXKdI1ogYKA7xIcV/WoXX9pDAkziJ3wPdwIMl+Cn2EL7Kejcz72oigWMtUZ7
 m4Ta4jsT4gCj9mAQ6QzhrJdtDng/ltOSPEpM1YiA4b1D/rPVRhz63i8Os8uUVLX24sh8
 AkoQ==
X-Gm-Message-State: AOAM5326MLtdOBPfEjJn6OU6hL8th6vb82e8a2BqmJ3As2g3dMDidLTS
 aXqKjgrfcjLK+JbkF+tAtkxnVdGeD8tAi+y8F2bqDNmz/KEtYFq0anvDb4AWBerEux44gUE+g+v
 b0sbQxLHjso21ronR9UbNB5SfZw==
X-Received: by 2002:a05:600c:4982:: with SMTP id
 h2mr4597255wmp.108.1620315071330; 
 Thu, 06 May 2021 08:31:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3M0/nH4wBS9mN36/5FP5OpLaVlIbwQucgba+bN4wivCLyv9VNcf9OZFL+ORcvt4/JggAUXw==
X-Received: by 2002:a05:600c:4982:: with SMTP id
 h2mr4597190wmp.108.1620315070857; 
 Thu, 06 May 2021 08:31:10 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
 by smtp.gmail.com with ESMTPSA id q12sm9157467wmj.7.2021.05.06.08.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 08:31:10 -0700 (PDT)
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
To: Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>
References: <20210506152623.178731-1-zi.yan@sent.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
Date: Thu, 6 May 2021 17:31:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506152623.178731-1-zi.yan@sent.com>
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

On 06.05.21 17:26, Zi Yan wrote:
> From: Zi Yan <ziy@nvidia.com>
> 
> Hi all,
> 
> This patchset tries to remove the restriction on memory hotplug/hotremove
> granularity, which is always greater or equal to memory section size[1].
> With the patchset, kernel is able to online/offline memory at a size independent
> of memory section size, as small as 2MB (the subsection size).

... which doesn't make any sense as we can only online/offline whole 
memory block devices.

> 
> The motivation is to increase MAX_ORDER of the buddy allocator and pageblock
> size without increasing memory hotplug/hotremove granularity at the same time,

Gah, no. Please no. No.

> so that the kernel can allocator 1GB pages using buddy allocator and utilizes
> existing pageblock based anti-fragmentation, paving the road for 1GB THP
> support[2].

Not like this, please no.

> 
> The patchset utilizes the existing subsection support[3] and changes the
> section size alignment checks to subsection size alignment checks. There are
> also changes to pageblock code to support partial pageblocks, when pageblock
> size is increased along with MAX_ORDER. Increasing pageblock size can enable
> kernel to utilize existing anti-fragmentation mechanism for gigantic page
> allocations.

Please not like this.

> 
> The last patch increases SECTION_SIZE_BITS to demonstrate the use of memory
> hotplug/hotremove subsection, but is not intended to be merged as is. It is
> there in case one wants to try this out and will be removed during the final
> submission.
> 
> Feel free to give suggestions and comments. I am looking forward to your
> feedback.

Please not like this.

-- 
Thanks,

David / dhildenb

