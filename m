Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C880B74F48B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:11:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ag+YotPT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I0y0L4PE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0m8L4zSFz3dgy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:11:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ag+YotPT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I0y0L4PE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0m5j327Qz3d7y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:09:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689091750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=umkcJ7EHwt2K7xQH+7rgCPxJb1wTiMjAEmnl2Bw6jVc=;
	b=ag+YotPTF9YRcFYcm80Gb68vtiCwTa5sI4vPeGZKvedNSO8ieZYhTl2t3FrRRbgA1p8jp4
	iJtZzvqD+kjKeCP9ElNjBYdvbGhdRIxSSg9dbfpft0sJD/YDH1KlBCL3/sSFuaCprJV96y
	+yGm7P6B+7vXUpd3L+0KjYLdl+YPGLE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689091751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=umkcJ7EHwt2K7xQH+7rgCPxJb1wTiMjAEmnl2Bw6jVc=;
	b=I0y0L4PEfhwagDJ6UMsoUOpwbMjvl+NPx2hXcyPmaI6dKiGSQGZ6XE9zscb3FWVYiW0IpN
	xfTSz6tYIH0beB0DrB/VhXnuJbDh7LNV8gAKbQ9BWtgjz0mO/VedfyBxj59Wo5mAB8/VWY
	j4vAvvyXcDgL89AQiSxMc4kFBgi/yaQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-KTYXHD4RMe2P59BuiJKoHQ-1; Tue, 11 Jul 2023 12:09:09 -0400
X-MC-Unique: KTYXHD4RMe2P59BuiJKoHQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-31444df0fafso3489359f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 09:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689091748; x=1691683748;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umkcJ7EHwt2K7xQH+7rgCPxJb1wTiMjAEmnl2Bw6jVc=;
        b=RAk78tNs0WWaNMvFbEPcQEReYCt5vrEegpTAnUgSPU6v2V0w5og6DQBmXh+1+thZIJ
         P8utagyMaxjNrhUrWJFmeS4In4U9YfV7dIi/mO3p79Q7c605EF5PzDt+513bRZNty1FB
         l7qxWjrt1g9xr/R8yHM8kuaqmZ+9Fq2b1OOfZ1JccyMA00vTj1ZRreY3+bMcDUU5/tzL
         Mx7VZSWJz0W+a9Ngh53vERd42TihE5LZa7GdAE8vTo7E2SP0kxbvQY9qy/dJWGJv+v3g
         4ZjijPGPWHdho2KNbp3EgW6e9O2VviPloWCPWeznUz8C9k3DvJ/BuTqPiZqVwASubf4H
         i+ag==
X-Gm-Message-State: ABy/qLYFA+6/+V2bmGTciPVZa5yomp9hEGCyZkNiGFK6xwtWQ+tIVB4g
	0pKKNBKv9M1HBss/STMoqUq6L6ThclXyfvgZ3noG21U4j9JJtYTtOb67Bkv7NXMHgR2CaXg05pw
	lCLLZgWwVxyNpSXQdG8lIjdOIihgUKc2Zow==
X-Received: by 2002:adf:d846:0:b0:314:336e:d4d8 with SMTP id k6-20020adfd846000000b00314336ed4d8mr17240925wrl.8.1689091748181;
        Tue, 11 Jul 2023 09:09:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEdPeVjm53/XCqVXuqmk3mM3+L4O8aFXfW45Ayxu4HjfzUDwyCTqA+mWjFo6tMPf1xCqLyyuw==
X-Received: by 2002:adf:d846:0:b0:314:336e:d4d8 with SMTP id k6-20020adfd846000000b00314336ed4d8mr17240904wrl.8.1689091747776;
        Tue, 11 Jul 2023 09:09:07 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:4000:13ad:ed64:37e6:115d? (p200300cbc745400013aded6437e6115d.dip0.t-ipconnect.de. [2003:cb:c745:4000:13ad:ed64:37e6:115d])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d4084000000b003142c85fbcdsm2676065wrp.11.2023.07.11.09.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 09:09:07 -0700 (PDT)
Message-ID: <641a4276-cfb9-bd1b-36a8-cb4bcae408f6@redhat.com>
Date: Tue, 11 Jul 2023 18:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 3/7] mm/hotplug: Allow architecture to override memmap
 on memory support check
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-4-aneesh.kumar@linux.ibm.com>
 <6f6764f6-4b5a-dfa8-c409-ba4f2828891f@redhat.com>
 <176cee16-f926-ab3b-92fe-98bebf79d43d@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <176cee16-f926-ab3b-92fe-98bebf79d43d@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11.07.23 18:07, Aneesh Kumar K V wrote:
> On 7/11/23 4:06 PM, David Hildenbrand wrote:
>> On 11.07.23 06:48, Aneesh Kumar K.V wrote:
>>> Some architectures would want different restrictions. Hence add an
>>> architecture-specific override.
>>>
>>> Both the PMD_SIZE check and pageblock alignment check are moved there.
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>    mm/memory_hotplug.c | 17 ++++++++++++-----
>>>    1 file changed, 12 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>>> index 1b19462f4e72..07c99b0cc371 100644
>>> --- a/mm/memory_hotplug.c
>>> +++ b/mm/memory_hotplug.c
>>> @@ -1247,12 +1247,20 @@ static int online_memory_block(struct memory_block *mem, void *arg)
>>>        return device_online(&mem->dev);
>>>    }
>>>    -static bool mhp_supports_memmap_on_memory(unsigned long size)
>>> +#ifndef arch_supports_memmap_on_memory
>>
>> Can we make that a __weak function instead?
> 
> 
> We can. It is confusing because we do have these two patterns within the kernel where we use
> 
> #ifndef x
> #endif
> 
> vs
> 
> __weak x
> 
> What is the recommended way to override ? I have mostly been using #ifndef for most of the arch overrides till now.
> 

I think when placing the implementation in a C file, it's __weak. But 
don't ask me :)

We do this already for arch_get_mappable_range() in mm/memory_hotplug.c 
and IMHO it looks quite nice.


-- 
Cheers,

David / dhildenb

