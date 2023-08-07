Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EC6772466
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 14:42:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XcljZAWo;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XcljZAWo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKGDx4q3xz2yq2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 22:42:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XcljZAWo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XcljZAWo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKGCq4vjmz2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 22:41:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691412098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cffoe/mIarGWdUJhKqIOqLkz4ISA+A/ue3hIKcjnEoo=;
	b=XcljZAWok5wM9hblgoUyFIq7z7uVW4uUZ+Z5RlF38mtQ0pDb6fo5z9bvqZd9qUf1XPB1NF
	5TxMMlvUg97a7+usEyq2YvGK4Szq29CE2llL9kQ6OyIbpzM9lOgRvD9xnwL9E970cqhZgo
	pGXmJlN2fV6Ye+9ZZ0gKNDfXREkvT1g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691412098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cffoe/mIarGWdUJhKqIOqLkz4ISA+A/ue3hIKcjnEoo=;
	b=XcljZAWok5wM9hblgoUyFIq7z7uVW4uUZ+Z5RlF38mtQ0pDb6fo5z9bvqZd9qUf1XPB1NF
	5TxMMlvUg97a7+usEyq2YvGK4Szq29CE2llL9kQ6OyIbpzM9lOgRvD9xnwL9E970cqhZgo
	pGXmJlN2fV6Ye+9ZZ0gKNDfXREkvT1g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-qLzlzFrON4u2KK3r_a8WNg-1; Mon, 07 Aug 2023 08:41:34 -0400
X-MC-Unique: qLzlzFrON4u2KK3r_a8WNg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-317c8fbbd4fso2141259f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 05:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691412093; x=1692016893;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cffoe/mIarGWdUJhKqIOqLkz4ISA+A/ue3hIKcjnEoo=;
        b=aytrBs9pdEyYvAZlALObfWIyB3fQZMx8sBEr/m13WnbfypmRI5fAsDRTsXoo/n0D1Z
         7daXi/35iCs033CjoNkyN2hkfSPV8B3k5fkB6BXeasssw7tYb8SvRKGcLvgARF+NkwAs
         E5N96nECmansVJwO/IqbwqkGSEoFeA7Xi5Qq1zXA6FOLpJsRSMsWtUaSk4d0M0sfwAnb
         2aVdaxdpcN8ScCZBTKVdRcROB0qPEJ5UCqxHodATvPkTQuDj14pb/c2swMFlLmLYZl1C
         x/SH/BJ8/nUeDGT9nBMZ5H3j8KRIS0EhpSl+sDHma/q7XSYpKtVJahpl4qk0fOuVoTz5
         dPYg==
X-Gm-Message-State: AOJu0YzacDGH212q2q0vrKmPNYtrphPH/cCEsb7IwEZwqpTcS0PBKW3x
	WcTrTZBA2WfrcX38tXN+7OXCFKpgET1v7bFaPxi9MqbKpi3nef+ZXvGWf6495hkAw6iwaGAW+l7
	yy/HXGgWlaLD9iP3aiXsHFhuiLg==
X-Received: by 2002:a05:6000:1205:b0:315:ad00:e628 with SMTP id e5-20020a056000120500b00315ad00e628mr7239871wrx.47.1691412093685;
        Mon, 07 Aug 2023 05:41:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDdRlXQUfwJmmCSmWVUdhLU/0/E0iUB5FelqLUa9sMAlRtLKUYqcW7NQqfcuZwQOMZknYAOg==
X-Received: by 2002:a05:6000:1205:b0:315:ad00:e628 with SMTP id e5-20020a056000120500b00315ad00e628mr7239854wrx.47.1691412093271;
        Mon, 07 Aug 2023 05:41:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c740:5d00:5143:1cd2:a300:ceff? (p200300cbc7405d0051431cd2a300ceff.dip0.t-ipconnect.de. [2003:cb:c740:5d00:5143:1cd2:a300:ceff])
        by smtp.gmail.com with ESMTPSA id m15-20020a056000008f00b0031417b0d338sm10543620wrx.87.2023.08.07.05.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 05:41:32 -0700 (PDT)
Message-ID: <a32a9e7f-1e24-bab1-cb73-8058fed3b59c@redhat.com>
Date: Mon, 7 Aug 2023 14:41:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Michal Hocko <mhocko@suse.com>,
 Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
References: <a32fe748-fa18-bd92-3a10-5da8dbad96e6@linux.ibm.com>
 <ZMjjbKnxZXSNcJL5@dhcp22.suse.cz>
 <c1e6e3f6-2e3a-c098-ae78-0d86de8a3a95@linux.ibm.com>
 <ZMp7Vr8PbfoADQw0@dhcp22.suse.cz>
 <31305ab7-1e65-80aa-ee91-9190c8f67430@redhat.com>
 <ZMqLV2S6vY0cZxbp@dhcp22.suse.cz> <ZMtqu76Tgh9jj+AI@dhcp22.suse.cz>
 <1c6a74f0-85e9-5299-1520-9068e842b1a5@redhat.com>
 <ZMuP7gsxQzAmRpNX@dhcp22.suse.cz>
 <d71a85b1-c0ea-6451-d65c-d7c5040caf77@linux.ibm.com>
 <ZNDjHbtm3jaWS8h8@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
In-Reply-To: <ZNDjHbtm3jaWS8h8@dhcp22.suse.cz>
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

On 07.08.23 14:27, Michal Hocko wrote:
> On Sat 05-08-23 19:54:23, Aneesh Kumar K V wrote:
> [...]
>> Do you see a need for firmware-managed memory to be hotplugged in with
>> different memory block sizes?
> 
> In short. Yes. Slightly longer, a fixed size memory block semantic is
> just standing in the way and I would even argue it is actively harmful.
> Just have a look at ridicously small memory blocks on ppc. I do
> understand that it makes some sense to be aligned to the memory model
> (so sparsmem section aligned). In an ideal world, memory hotplug v2
> interface (if we ever go that path) should be physical memory range based.

Yes, we discussed that a couple of times already (and so far nobody 
cared to implement any of that).

Small memory block sizes are very beneficial for use cases like PPC 
dlar, virtio-mem, hyperv-balloon, ... essentially in most virtual 
environments where you might want to add/remove memory in very small 
granularity. I don't see that changing any time soon. Rather the opposite.

Small memory block sizes are suboptimal for large machines where you 
might never end up removing such memory (boot memory), or when dealing 
with devices that can only be removed in one piece (DIMM/kmem). We 
already have memory groups in place to model that.

For the latter it might be beneficial to have memory blocks of larger 
size that correspond to the physical memory ranges. That might also make 
a memmap (re-)configuration easier.

Not sure if that is standing in any way or is harmful, though.

-- 
Cheers,

David / dhildenb

