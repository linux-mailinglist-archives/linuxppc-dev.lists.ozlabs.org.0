Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD0276D303
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 17:55:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cjibRnIT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cjibRnIT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGGlB1L4Zz3c4m
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 01:55:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cjibRnIT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cjibRnIT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGGkG1J9Vz2xVP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 01:54:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690991649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UtY8YgdOIvB+Y8Vu12vBZ+3g5eOHOZrJmfxbOSMI4po=;
	b=cjibRnIT8xqZQDxityxzM0Gb2L/fcSnmCTUfuq+EI7f3Xvm0ErC099xNxiDRLa/leLDMpf
	zPUkaePy4dBs9ZJ8vFDIFihw6bNy4BCS3gEVXk7fehwGPQFW9mTaKPyd3MZ0rB8ZK4X4AQ
	E8tcpYYrp8sVnzBPT2xNRWIfwgxS8+w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690991649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UtY8YgdOIvB+Y8Vu12vBZ+3g5eOHOZrJmfxbOSMI4po=;
	b=cjibRnIT8xqZQDxityxzM0Gb2L/fcSnmCTUfuq+EI7f3Xvm0ErC099xNxiDRLa/leLDMpf
	zPUkaePy4dBs9ZJ8vFDIFihw6bNy4BCS3gEVXk7fehwGPQFW9mTaKPyd3MZ0rB8ZK4X4AQ
	E8tcpYYrp8sVnzBPT2xNRWIfwgxS8+w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-JWnh9ooQOIuofXA5XWGOHw-1; Wed, 02 Aug 2023 11:54:07 -0400
X-MC-Unique: JWnh9ooQOIuofXA5XWGOHw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3175bf07953so3593020f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Aug 2023 08:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690991646; x=1691596446;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtY8YgdOIvB+Y8Vu12vBZ+3g5eOHOZrJmfxbOSMI4po=;
        b=BnujUfmQvCN6qsE054bPKCgvE+65F1a5hjRas9BDWTuR3JUYnEDnsQMBCIXgPD1SpL
         7u5sqJjHLvSYENWczD8PWLSGHLfCs1/M5N6RAyUHq5rYsOE3jVxyPhukM89EnIM7qJ4h
         kyUkosMxMCOYkOoFLASkJZfMFvlVx64T1B/xKUpA7bk/wXJsnV1enHMXj/1QbS4RMbdy
         E99HmPX4Ocxrk87W95L+XAAk0joUmTifdn/Sc0+aLmexjLq0ytnO7lP8Y/SqfPoVyvtt
         p47rVIxyT4u+MeNEafCssuj0BlKxYZ+NwmSUAyp2JWQ41pWQatNjcBE5ZHVKEe5xywR5
         byKQ==
X-Gm-Message-State: ABy/qLaG18BgdjI4sy4LtgWrjiFdQsXDJ66azNpXG3E2e5cZtUg3sYhc
	FQ0ZtEhwUEvImf//IjtvLntVGJC9tmHaj+Alpo6Mymy479ParbHX4EdHLBa8HbVXjktO1LQqfoR
	6OcgXcAYRJfWTOA3qGQiZawP+AQ==
X-Received: by 2002:a5d:464c:0:b0:317:5f13:5c2f with SMTP id j12-20020a5d464c000000b003175f135c2fmr4898157wrs.0.1690991646443;
        Wed, 02 Aug 2023 08:54:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFzzVD2A2bhO++OKlt8DJCnzUArBWQQBSyp8nncjpC/RF8cerJqPgcgFA4FsYjuPBv9bK9oFw==
X-Received: by 2002:a5d:464c:0:b0:317:5f13:5c2f with SMTP id j12-20020a5d464c000000b003175f135c2fmr4898144wrs.0.1690991646077;
        Wed, 02 Aug 2023 08:54:06 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:e00:b8a4:8613:1529:1caf? (p200300cbc70b0e00b8a4861315291caf.dip0.t-ipconnect.de. [2003:cb:c70b:e00:b8a4:8613:1529:1caf])
        by smtp.gmail.com with ESMTPSA id f17-20020adffcd1000000b00313f61889ecsm19407610wrs.66.2023.08.02.08.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 08:54:05 -0700 (PDT)
Message-ID: <31305ab7-1e65-80aa-ee91-9190c8f67430@redhat.com>
Date: Wed, 2 Aug 2023 17:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
To: Michal Hocko <mhocko@suse.com>,
 Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
References: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
 <20230801044116.10674-8-aneesh.kumar@linux.ibm.com>
 <ZMjJPFcXlt+aeCUB@dhcp22.suse.cz>
 <a32fe748-fa18-bd92-3a10-5da8dbad96e6@linux.ibm.com>
 <ZMjjbKnxZXSNcJL5@dhcp22.suse.cz>
 <c1e6e3f6-2e3a-c098-ae78-0d86de8a3a95@linux.ibm.com>
 <ZMp7Vr8PbfoADQw0@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZMp7Vr8PbfoADQw0@dhcp22.suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-mm@kvack.org, npiggin@gmail.com, Vishal Verma <vishal.l.verma@intel.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02.08.23 17:50, Michal Hocko wrote:
> On Wed 02-08-23 10:15:04, Aneesh Kumar K V wrote:
>> On 8/1/23 4:20 PM, Michal Hocko wrote:
>>> On Tue 01-08-23 14:58:29, Aneesh Kumar K V wrote:
>>>> On 8/1/23 2:28 PM, Michal Hocko wrote:
>>>>> On Tue 01-08-23 10:11:16, Aneesh Kumar K.V wrote:
>>>>>> Allow updating memmap_on_memory mode after the kernel boot. Memory
>>>>>> hotplug done after the mode update will use the new mmemap_on_memory
>>>>>> value.
>>>>>
>>>>> Well, this is a user space kABI extension and as such you should spend
>>>>> more words about the usecase. Why we could live with this static and now
>>>>> need dynamic?
>>>>>
>>>>
>>>> This enables easy testing of memmap_on_memory feature without a kernel reboot.
>>>
>>> Testing alone is rather weak argument to be honest.
>>>
>>>> I also expect people wanting to use that when they find dax kmem memory online
>>>> failing because of struct page allocation failures[1]. User could reboot back with
>>>> memmap_on_memory=y kernel parameter. But being able to enable it via sysfs makes
>>>> the feature much more useful.
>>>
>>> Sure it can be useful but that holds for any feature, right. The main
>>> question is whether this is worth maintaing. The current implementation
>>> seems rather trivial which is an argument to have it but are there any
>>> risks long term? Have you evaluated a potential long term maintenance
>>> cost? There is no easy way to go back and disable it later on without
>>> breaking some userspace.
>>>
>>> All that should be in the changelog!
>>
>> I updated it as below.
>>
>> mm/memory_hotplug: Enable runtime update of memmap_on_memory parameter
>>
>> Allow updating memmap_on_memory mode after the kernel boot. Memory
>> hotplug done after the mode update will use the new mmemap_on_memory
>> value.
>>
>> It is now possible to test the memmap_on_memory feature easily without
>> the need for a kernel reboot. Additionally, for those encountering
>> struct page allocation failures while using dax kmem memory online, this
>> feature may prove useful. Instead of rebooting with the
>> memmap_on_memory=y kernel parameter, users can now enable it via sysfs,
>> which greatly enhances its usefulness.
> 
> 
> I do not really see a solid argument why rebooting is really a problem
> TBH. Also is the global policy knob really the right fit for existing
> hotplug usecases? In other words, if we really want to make
> memmap_on_memory more flexible would it make more sense to have it per
> memory block property instead (the global knob being the default if
> admin doesn't specify it differently).

Per memory block isn't possible, due to the creation order. Also, I 
think it's not the right approach.

I thought about driver toggles. At least for dax/kmem people are looking 
into that:

https://lkml.kernel.org/r/20230801-vv-kmem_memmap-v3-2-406e9aaf5689@intel.com

Where that can also be toggled per device.

-- 
Cheers,

David / dhildenb

