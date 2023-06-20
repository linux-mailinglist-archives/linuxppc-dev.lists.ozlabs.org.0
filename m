Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6063736C6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 14:55:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gd8I4n0k;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gd8I4n0k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlmpC3zvBz3bYc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 22:55:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gd8I4n0k;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gd8I4n0k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 67 seconds by postgrey-1.37 at boromir; Tue, 20 Jun 2023 22:54:55 AEST
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlmnC543zz2xpw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 22:54:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687265693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LONR6m/1jfRFOtiATxy8qXhrZ9BTeIfLSA3KC4pCEEo=;
	b=gd8I4n0kDNdHrSEs9TvmZqMRyiakZGVnyRvO/6TvczGx9SVMqvTWZeF36iMVob2y9nnkwu
	JnBYGWwKGF/g2muYtpJCc6Ld3BDmrkUx/XeFW390ZepaW2RkUqNatp2petWnW38RqbLHVy
	VMrcnHfo4Hgtq8rjHoUNTetJeePtsb0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687265693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LONR6m/1jfRFOtiATxy8qXhrZ9BTeIfLSA3KC4pCEEo=;
	b=gd8I4n0kDNdHrSEs9TvmZqMRyiakZGVnyRvO/6TvczGx9SVMqvTWZeF36iMVob2y9nnkwu
	JnBYGWwKGF/g2muYtpJCc6Ld3BDmrkUx/XeFW390ZepaW2RkUqNatp2petWnW38RqbLHVy
	VMrcnHfo4Hgtq8rjHoUNTetJeePtsb0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-oV0AgZWdPnedSjL5tBNazg-1; Tue, 20 Jun 2023 08:53:38 -0400
X-MC-Unique: oV0AgZWdPnedSjL5tBNazg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f8fa2ef407so17552845e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 05:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687265617; x=1689857617;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LONR6m/1jfRFOtiATxy8qXhrZ9BTeIfLSA3KC4pCEEo=;
        b=c/9lgpQXWRJV4qOQC/McuawJ9+f13p2JHvsYzCBtdTFi3CWeT368Ip/Mi8WHWnwmQd
         6yEs5MbXL2krUqHCvAOvNyRoWk+KBoS7CuexiW2EUVmRVogssfJi90B3B0dYBMwn5pjG
         9a329oB+okebnGsUM5ZPCw6vWbNZhzZWP3hJT56rhM/jDCgaJYwECFHMNPf06bt27PZZ
         1/MQaixQUVDhjp9ar8jFi+msU3o178tr91N0tZov3S2UjAR0lKfatMcbDazElsWkbNND
         cJitl5c30yG2xccjOj6J4MTefsH4t4TLfccZlu/vYxvibwegqoKdm0G2AIoJkHLn/4su
         H+WA==
X-Gm-Message-State: AC+VfDy4Uy+rtgmnGSbbx/4hmgi0Y4HvIQYwR2ur6rAM4vv2yNmpPpBO
	oBU3921i2XGSnu1bIdCz/zSfKmWnhSoZlDNxiuOajansiH5g/9a8+g1ZyS2aUFm4jVgs0zN05t0
	rMSm0zR52hskcE6NngVhskjv1Fg==
X-Received: by 2002:a05:600c:acd:b0:3f9:92d:9ffe with SMTP id c13-20020a05600c0acd00b003f9092d9ffemr5190224wmr.14.1687265617244;
        Tue, 20 Jun 2023 05:53:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ68rz6lTi+Hh68O9/RYt7NiKgrPncAiLx5RQOzoXAJlToy43M1W0K9XLEhBAgIq3IhmQBrKFg==
X-Received: by 2002:a05:600c:acd:b0:3f9:92d:9ffe with SMTP id c13-20020a05600c0acd00b003f9092d9ffemr5190210wmr.14.1687265616923;
        Tue, 20 Jun 2023 05:53:36 -0700 (PDT)
Received: from ?IPV6:2003:cb:c739:d200:8745:c520:8bf6:b587? (p200300cbc739d2008745c5208bf6b587.dip0.t-ipconnect.de. [2003:cb:c739:d200:8745:c520:8bf6:b587])
        by smtp.gmail.com with ESMTPSA id p25-20020a05600c205900b003f9b1131a90sm2276116wmg.23.2023.06.20.05.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 05:53:36 -0700 (PDT)
Message-ID: <2b902e78-be4f-cff4-0e8e-771d2981455d@redhat.com>
Date: Tue, 20 Jun 2023 14:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230609060851.329406-1-aneesh.kumar@linux.ibm.com>
 <20230609060851.329406-2-aneesh.kumar@linux.ibm.com>
 <853eae60-b92b-9284-e24d-564429aba8c1@redhat.com>
 <87mt0upazj.fsf@mail.lhotse>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 2/2] powerpc/mm: Add memory_block_size as a kernel
 parameter
In-Reply-To: <87mt0upazj.fsf@mail.lhotse>
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

On 20.06.23 14:35, Michael Ellerman wrote:
> David Hildenbrand <david@redhat.com> writes:
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
>>
>> 2) Is the 256 MiB -> 1 GiB memory block size switch really worth it? On
>> x86-64, experiments (with direct map fragmentation) showed that the
>> effective performance boost is pretty insignificant, so I wonder how big
>> the 1 GiB direct map performance improvement is.
> 
> The other issue is simply the number of sysfs entries.
> 
> With 64TB of memory and a 256MB block size you end up with ~250,000
> directories in /sys/devices/system/memory.

Yes, and so far on other archs we only optimize for that for on UV x86 
systems (with a default of 2 GiB). And that was added before we started 
to speed up memory device lookups significantly using a radix tree IIRC.

It's worth noting that there was a discussion on:

(a) not creating these device sysfs entries (when configured on the 
cmdline); often, nobody really ends up using them to online/offline 
memory blocks. Then, the only primary users is lsmem.

(b) exposing logical devices (e.g., a DIMM) taht can only be 
offlined/removed as a whole, instead of their individual memblocks (when 
configured on the cmdline). But for PPC64 that won't help.


But (a) gets more tricky if device drivers (and things like dax/kmem) 
rely on user-space memory onlining/offlining.

-- 
Cheers,

David / dhildenb

