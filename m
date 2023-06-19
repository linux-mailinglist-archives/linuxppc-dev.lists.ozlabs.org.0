Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 222D8735C2F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 18:29:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SyWeFqnN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SyWeFqnN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlFbm0R95z30hB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 02:29:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SyWeFqnN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SyWeFqnN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlFZn5p2mz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 02:29:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687192141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/mlufGciH87ZRVOdPMbNjdM4IrF5cBYE9BGED5TrRc=;
	b=SyWeFqnNkhKewKqg+7O059vnx3sUgzQ68xljmEsvFtfWv9SAXqMu98lH9KgU84woCdzxqm
	aVkjLEURitQ88tZISMs+uE2U8VJRe/iOGQXkMNLK7K1GSgiVOkaX7jbgNKjBxf2j/Q94qt
	CBVOxOVzpHUAO3zhnfREwYRNhat6594=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687192141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/mlufGciH87ZRVOdPMbNjdM4IrF5cBYE9BGED5TrRc=;
	b=SyWeFqnNkhKewKqg+7O059vnx3sUgzQ68xljmEsvFtfWv9SAXqMu98lH9KgU84woCdzxqm
	aVkjLEURitQ88tZISMs+uE2U8VJRe/iOGQXkMNLK7K1GSgiVOkaX7jbgNKjBxf2j/Q94qt
	CBVOxOVzpHUAO3zhnfREwYRNhat6594=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-LcwQCL5aMx-5lYhpOfStzg-1; Mon, 19 Jun 2023 12:28:59 -0400
X-MC-Unique: LcwQCL5aMx-5lYhpOfStzg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f814f78af2so16832385e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 09:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687192138; x=1689784138;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/mlufGciH87ZRVOdPMbNjdM4IrF5cBYE9BGED5TrRc=;
        b=Tm9zszsRWrXi8n8ILDNCDTMvm0z8f8ASNwJUxAfhsck0hLiR8Scvq6fVD7u5r2EMur
         2223M5FbGfGjm5Tp13wwfXkiEi3+4VLfYP1gNdVCM2YVsNvhKbwa1284LIcdIeaQa9WV
         zvGeQd61oTq/UTfbWxmCY2uO97dm6UHsUcJxPOXtXFC4EI5aecT2WlSDl9fidCsuW59e
         K2KXvY1QbgzHrXmpTgbFWU7AGXhnl8q9k4qgMjxM1seS/kCuJgrYoM+zGuhYatlmmHH8
         btZTfQQRkePcDgtN74EyleyLygLMCvmKVBnzvTKBOq9edNbvRQyXAVNTA2RPdT7GexYL
         mCJA==
X-Gm-Message-State: AC+VfDwQwLU/UTtDvQapyqI4vobormxNnqzCqmCNw5rtIij3jmp3i0M3
	qe5w3ylRA4Iz4dEbfbyX8nOSFe7EfAsdoAVTKQzkWu2qUh5coYfueD9tCXXDacufp0b4hGmyksB
	UZWULqEwbrxQFoeIEcdHnAGtAuQ==
X-Received: by 2002:a7b:c386:0:b0:3f9:be1:6cc2 with SMTP id s6-20020a7bc386000000b003f90be16cc2mr2687621wmj.32.1687192138682;
        Mon, 19 Jun 2023 09:28:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Iy29BnneSEM2SVtjfe56wDeb+u0SvxapFD4iQie1bKcwPepj/Do7MVEAPU3TxLxAFNki+AQ==
X-Received: by 2002:a7b:c386:0:b0:3f9:be1:6cc2 with SMTP id s6-20020a7bc386000000b003f90be16cc2mr2687609wmj.32.1687192138346;
        Mon, 19 Jun 2023 09:28:58 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:7100:cede:6433:a77b:41e9? (p200300cbc72f7100cede6433a77b41e9.dip0.t-ipconnect.de. [2003:cb:c72f:7100:cede:6433:a77b:41e9])
        by smtp.gmail.com with ESMTPSA id s14-20020a7bc38e000000b003f801c12c58sm107625wmj.43.2023.06.19.09.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 09:28:57 -0700 (PDT)
Message-ID: <bdb94911-ec9a-02ca-06fc-f850b6c815b2@redhat.com>
Date: Mon, 19 Jun 2023 18:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, Tarun Sahu <tsahu@linux.ibm.com>
References: <20230609060851.329406-1-aneesh.kumar@linux.ibm.com>
 <20230609060851.329406-2-aneesh.kumar@linux.ibm.com>
 <853eae60-b92b-9284-e24d-564429aba8c1@redhat.com>
 <875y7jifzc.fsf@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 2/2] powerpc/mm: Add memory_block_size as a kernel
 parameter
In-Reply-To: <875y7jifzc.fsf@linux.ibm.com>
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
Cc: foraker1@llnl.gov
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19.06.23 18:17, Aneesh Kumar K.V wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 09.06.23 08:08, Aneesh Kumar K.V wrote:
>>> Certain devices can possess non-standard memory capacities, not constrained
>>> to multiples of 1GB. Provide a kernel parameter so that we can map the
>>> device memory completely on memory hotplug.
>>
>> So, the unfortunate thing is that these devices would have worked out of
>> the box before the memory block size was increased from 256 MiB to 1 GiB
>> in these setups. Now, one has to fine-tune the memory block size. The
>> only other arch that I know, which supports setting the memory block
>> size, is x86 for special (large) UV systems -- and at least in the past
>> 128 MiB vs. 2 GiB memory blocks made a performance difference during
>> boot (maybe no longer today, who knows).
>>
>>
>> Obviously, less tunable and getting stuff simply working out of the box
>> is preferable.
>>
>> Two questions:
>>
>> 1) Isn't there a way to improve auto-detection to fallback to 256 MiB in
>> these setups, to avoid specifying these parameters?
> 
> The patch does try to detect as much as possible by looking at device tree
> nodes and aperture window size. But there are still cases where we find
> a memory aperture of size X GB and device driver hotplug X.YGB memory.
> 

Okay, and I assume we can't detect that case easily.

Which interface is that device driver using to hotplug memory? It's 
quite surprising I have to say ...

>>
>> 2) Is the 256 MiB -> 1 GiB memory block size switch really worth it? On
>> x86-64, experiments (with direct map fragmentation) showed that the
>> effective performance boost is pretty insignificant, so I wonder how big
>> the 1 GiB direct map performance improvement is.
> 
> 
> Tarun is running some tests to evaluate the impact. We used to use 1GiB
> mapping always. This was later switched to use memory block size to fix
> issues with memory unplug
> commit af9d00e93a4f ("powerpc/mm/radix: Create separate mappings for hot-plugged memory")
> explains some details related to that change.
> 

IIUC, that commit (conditionally) increased the memory block size to 
avoid the splitting, correct? By that, it broke the device driver use case.

> 
>>
>>
>> I guess the only real issue with 256 MiB memory blocks and 1 GiB direct
>> mapping is memory unplug of boot memory: when unplugging a 256 MiB
>> block, one would have to remap the 1 GiB range using 2 MiB ranges.
> 
>>
>> ... I was wondering what would happen if you simply leave the direct
>> mapping in this corner case in place instead of doing this remapping.
>> IOW, remove the memory but keep the direct map pointing at the removed
>> memory. Nobody should be touching it, or are there any cases where that
>> could hurt?
>>
>>
>> Or is there any other reason why we really want 1 GiB memory blocks
>> instead of to defaulting to 256 MiB the way it used to be?
>>
> 
> The idea we are working towards is to keep the memory block size small

That would be preferable, yes ...

> but map the boot memory using 1G. An unplug request can split that 1G
> mapping later. We could look at the possibility of leaving that mapping
> without splitting. But not sure why we would want to do that if we can
> correctly split things. Right now there is no splitting support in powerpc.

If splitting over-complicates the matter (and well, it will even consume 
more memory), it might at least be worth looking into that. Yes, it's 
cleaner.

I think there is also the option to fail memory offlining (and therefore 
unplug) if we have a 1 GiB mapping and don't want to split. For 
hotplugged memory it would always work to unplug again. aarch64 blocks 
any boot memory from getting unplugged.

But I guess that might break existing use cases (unplug boot memory) on 
ppc64 that rely on ZONE_MOVABLE to have it working with guarantees, 
right? Could be optimized but not sure if that's the best approach.


-- 
Cheers,

David / dhildenb

