Return-Path: <linuxppc-dev+bounces-9150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94089ACDF15
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 15:30:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bC7k33lvZz2yPS;
	Wed,  4 Jun 2025 23:30:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749043819;
	cv=none; b=XFfWD0PDXgp2tY9HR0rCfFvI6ZVv7WNkAabHozQdXOSQBKTcUjkpcjUSGjFaYGdBtcmLtoJr5c4b3he4dt3Yc9iTHYuW4qz7PZcXlVNXM+oW4p//S1kMc0jLx59eJqsd29rKXAfjeaoris7MkqSclsE49co/amNNQmVrfblf5qSz8o5PBcvznMDRsOR9p8UMXzuiq7UFFyCz5H7TEYwc7VbKQnfpXTBS4+oHOzdobobf+nzGhRaWWZ5Xupj+3TZiQ5B+WsG4HlKWWtdN31Q8XGL04TzdtbecJ7/Spkmf70dgON7pmu8Lhta03pKH7LLquKy2Fy35okXAP/UGrg5nTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749043819; c=relaxed/relaxed;
	bh=wM730wYdKzGLtqTwQp0WD4PZQ3ILvslvUEZgXXpTyII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbZfdLxLp3uSSMQIyMq/TT7hXX9y1h7Zy8UIf031onWhUZ/7fLMVxbHzf73RIebY11ynDC1JveWnJEEKnJYyHuSV218Q3IixRHs9M2+Ui4TzkfmVfShnajRE9Pt4J78hQcS/t5YFFn+ziMCRe8xWVnPWMccBq+G29vzbiKvuI/GwLbOb8cZQDZ/+zsBdYYQzi3rDRpcuMb+Q/e5iwWIOIQrk312yGAub4d6WHg1L+FpovlkHcZ83zaD/g2fnpHjSqyM2Geje5S2/IXhAHNyS/Huhp7eN3rtVFvyFrzS/kHxXMyynPJgJX6uVtls84mCs/ndFxfVg4t4zVoY5hY97cA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7OjiSZA; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7OjiSZA; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7OjiSZA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7OjiSZA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bC7k04tJfz2yNB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 23:30:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749043811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wM730wYdKzGLtqTwQp0WD4PZQ3ILvslvUEZgXXpTyII=;
	b=P7OjiSZArcKxSBVMjw0eKvG5inYAcNzvIJQ0Ct+VSHTEud1loUEv3BYwBT+VU/0fpeJxsW
	5gN2y/zfh48QVlmKLSyTXPwjZnan4wIBjHquER/BDg3YCq4htYzZDzGpcfNiJX59AWMHBU
	Si381pV6UFqGsgbek+hASAhUIiWWfEI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749043811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wM730wYdKzGLtqTwQp0WD4PZQ3ILvslvUEZgXXpTyII=;
	b=P7OjiSZArcKxSBVMjw0eKvG5inYAcNzvIJQ0Ct+VSHTEud1loUEv3BYwBT+VU/0fpeJxsW
	5gN2y/zfh48QVlmKLSyTXPwjZnan4wIBjHquER/BDg3YCq4htYzZDzGpcfNiJX59AWMHBU
	Si381pV6UFqGsgbek+hASAhUIiWWfEI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-elyDPG8zNNinPMBzKjdOVw-1; Wed, 04 Jun 2025 09:30:08 -0400
X-MC-Unique: elyDPG8zNNinPMBzKjdOVw-1
X-Mimecast-MFC-AGG-ID: elyDPG8zNNinPMBzKjdOVw_1749043807
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d57a0641so46685895e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Jun 2025 06:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749043807; x=1749648607;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wM730wYdKzGLtqTwQp0WD4PZQ3ILvslvUEZgXXpTyII=;
        b=phjjD6qINvO6EAqjLw0tx7KiLpHvGQSzhXv2+6ta/Y/74VO09eOryx5mljcu1keV+z
         p/DMDX5wBCy2Kez3K5yNIflwDGANbRtKRIG87xjCe+4vusQqCYb7/2sd07m3W1DzEoFh
         Z6UY0qzvIuCvi+c95xqqi5lz9lwzMfL/r5Qjkw10UwAMbiwJu9jKZ2c/+p7TLAuDiq13
         BSpq+yDfG3cTvKFS7P3JkSpyRCXuC6UivM2os09IFZqxKklesbLqpsN8N9z+p6VGs0M2
         EIQ9YHIdFp/sbcl5o9y9XLSB0TTPzt5Gx9EhFVyHL5fLYPql11FAKu2h89m7HdA3rQl1
         DThQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCsrX50LZMcksJgAotcRb1fAn5LoxYdrrXp2no6mFEO8gZs8blyWOJv1jy4tpkocR5ChYOFbQkJJkl9HQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz5MuCGwWDG6e69LoAq+/k2mYUjcMEgJKmZpXirQCMDTDFGGMzI
	fqyE3rJgNDOKw2cZHE3AZbyrKvomoGwNTAXccIEz+VGeX3Lfy1JLg14+b1zcA42+k1SbrkKyQhO
	HLNYQEv4vu89GSnkrYnt3snj7p1A+zsD72t4U4Zj5QwPj1GwQvvGeSODT94cQXvGZbIM=
X-Gm-Gg: ASbGncvyEolh7xFhvOrE5Nlzj28HIuG1KgTePjFHyEdNuN/upFo1kiuBJZaUhrcLw5G
	A6MTImor0dEOI+zBCGfhs/gs9Sg0j8DQmPGgME4kuNnlfzmJU1Wa6k+sC6BEWrp8e5CUyyBB662
	I/xzfzj96J4ZnkWhe8aHUL2amyYsfrfh8UD9jnJ57uU0Jd4RZVOIRBz3Rx771v+GHbudku7t5Tw
	kspzemtsn5/OObaxkkt6uGXeF4HnZgPIiPxolIih2nqcHsTUGmy+jKIICUZOSXd5dS45CZyP6lg
	BmL/w/n2Ea18DN352Sm4mQakONkG67Duwt4+FdZhOWb/yxQmPTbQ1vYzD656195tYSAa6nR8d6k
	CshZ0fqxK/E4ao+XP77t9nA7DmYGswiRQlDWy9UM=
X-Received: by 2002:a05:600c:3484:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-451f50a2126mr15328935e9.18.1749043807389;
        Wed, 04 Jun 2025 06:30:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpnyxfH8Pv/rAsTwh7fWe/qdlsqtP0waH+CRL3dgCTNExEMwgjRrMrmo08vFsHutGjTeZV9A==
X-Received: by 2002:a05:600c:3484:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-451f50a2126mr15328525e9.18.1749043806909;
        Wed, 04 Jun 2025 06:30:06 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8eceasm200932785e9.7.2025.06.04.06.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 06:30:06 -0700 (PDT)
Message-ID: <8abecd5b-2768-49d0-afc3-561b95d77a24@redhat.com>
Date: Wed, 4 Jun 2025 15:30:05 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drivers/base/node: Optimize memory block
 registration to reduce boot time
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Zi Yan <ziy@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nilay Shroff
 <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
 <20250603200729.b7581e017e4ca63f502c795e@linux-foundation.org>
 <b355e72d-0284-4a31-84e3-ae4a79ad922f@redhat.com>
 <9f7ae0e6-4640-418d-a4db-dba594377ac2@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9f7ae0e6-4640-418d-a4db-dba594377ac2@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8ENyt78GM8GtMAQPZ6ak9x4OkUn4GD5wApcfv9H8AvY_1749043807
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 04.06.25 15:17, Donet Tom wrote:
> 
> On 6/4/25 3:15 PM, David Hildenbrand wrote:
>> On 04.06.25 05:07, Andrew Morton wrote:
>>> On Wed, 28 May 2025 12:18:00 -0500 Donet Tom <donettom@linux.ibm.com>
>>> wrote:
>>>
>>>> During node device initialization, `memory blocks` are registered under
>>>> each NUMA node. The `memory blocks` to be registered are identified
>>>> using
>>>> the node’s start and end PFNs, which are obtained from the node's
>>>> pg_data
>>>
>>> It's quite unconventional to omit the [0/N] changelog.  This omission
>>> somewhat messed up my processes so I added a one-liner to this.
>>>
>>
>> Yeah, I was assuming that I simply did not get cc'ed on the cover
>> letter, but there is actually none.
>>
>> Donet please add that in the future. git can do this using
>> --cover-letter.
> 
> Sure,
> 
> I will add cover letter in next revision.
> 
> 
>>
>>>>
>>>> ...
>>>>
>>>> Test Results on My system with 32TB RAM
>>>> =======================================
>>>> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
>>>>
>>>> Without this patch
>>>> ------------------
>>>> Startup finished in 1min 16.528s (kernel)
>>>>
>>>> With this patch
>>>> ---------------
>>>> Startup finished in 17.236s (kernel) - 78% Improvement
>>>
>>> Well someone is in for a nice surprise.
>>>
>>>> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
>>>>
>>>> Without this patch
>>>> ------------------
>>>> Startup finished in 28.320s (kernel)
>>>
>>> what.  CONFIG_DEFERRED_STRUCT_PAGE_INIT is supposed to make bootup
>>> faster.
>>
>> Right, that's weird. Especially that it is still slower after these
>> changes.
>>
>> CONFIG_DEFERRED_STRUCT_PAGE_INIT should be initializing in parallel
>> which ... should be faster.
>>
>> @Donet, how many CPUs and nodes does your system have? Can you
>> identify what is taking longer than without
>> CONFIG_DEFERRED_STRUCT_PAGE_INIT?
> 
> 
> 
> My system has,
> 
> CPU      - 1528

Holy cow.

Pure speculation: are we parallelizing *too much* ? :)

That's ~95 CPUs per node on average.

Staring at deferred_init_memmap(), we do have

	max_threads = deferred_page_init_max_threads(cpumask);

And that calls cpumask_weight(), essentially using all CPUs on the node.

... not sure what exactly happens if there are no CPUs for a node.

> Node     - 16

Are any of these memory-less?

> Memory - 31TB



-- 
Cheers,

David / dhildenb


