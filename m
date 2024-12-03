Return-Path: <linuxppc-dev+bounces-3693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A87579E15CA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 09:30:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Yk20Vzmz2yS0;
	Tue,  3 Dec 2024 19:30:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733214602;
	cv=none; b=k21Rz2PvZkNUMUzN/++LYkcPPgUSDk5oCRi1AD0loVSq2znLp0y14GmqsT9hcGwH/N22EcCB6Nh2tFvVEyl7hGDy1gpaq0bR0M3ieZ+8vjr4cOVdhvvgTLgIl8yBsd4eNGuXko5pgdqyRb1HSWyRywcHgi2t2sTlM7qad1IqgZYOvLGVxXKuaorRSTGkDqdsGcx80xynp5AC0nPs0uBpaVGtzJfP46JVdbATIA3jBV2vOZ6x3cF7UMkAkgB2qbMsfE5LT5jrVZbjHVTN+ZmqbulUUuQrYY/ZUWhXZhmZeLhbkNXxO6aNqQb42rI4Eo4oFHolOsBPFzYOYRx8ttEtqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733214602; c=relaxed/relaxed;
	bh=cL7v3oc5fMJ4viLddVGUsjohS5uWgp/SM7upP9Q9RVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eeRaH6QsGaRLeFDMdorBkUVpcOh5mSJKtcgByYZuSfVEBk+hQDbJCb1Oid9lqszeUUabPZMlhk4o6EGrqiMrsp4bAZ7sxIUfypFsvOqwsisZj7QkPIYgbx5ay9yMTH5OmdI6W8FLePwDvhQ3nxfHeTNkjymlFMLKhPcHwL43QUIkgmHDUvwCBRKU+UacW9tT6/CIlmkoHbgKGt+rMwj2klYzK6vs7lCVysjyJ1qsHR5nsvuwfxRvl+jxfqI+EDIeRHx+CNrfX2x8Q7pDH7MgPHnq/EAUFYAtJE+53uFnPa5kGx5xm+fkkbkKmSt9Ak+cgmZ9doXitavmUJK+950+yQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZEPwTcb6; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dl6+jLq+; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZEPwTcb6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dl6+jLq+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2Yk04T1gz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 19:29:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733214595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cL7v3oc5fMJ4viLddVGUsjohS5uWgp/SM7upP9Q9RVU=;
	b=ZEPwTcb6v50ILUBGIR94J8V8OY+Chh21FrL48wCFt8qAdkwcb/5eTkAcS19TjnrtuOSbof
	d7no2ywG1k2dhaJhm15gw4MCsoU7GKX5D2rdItIkjhY/2Ri3IFFLQmh1cL82z+Qb+9eHP3
	282FrJfCp65Fm5aOA81yWJZPRMN7cYc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733214596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cL7v3oc5fMJ4viLddVGUsjohS5uWgp/SM7upP9Q9RVU=;
	b=Dl6+jLq+obhHtbQ9Vb75jazAOt7YdMDUpn/VWNjAILBfcKfVkAQzwADLPYmv//jUtSNwod
	eum4CgQde3Cz+Zdoy1kH7J0ktUjar5ggWwzC9C4crPxc/IVfIVVItYjCcdPBkua//HkXpT
	tPTiLs0uIddXuR0AHbH5jfwJymOWAoI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-kJcD_EAbPeyVRUpdnC8LBw-1; Tue, 03 Dec 2024 03:29:52 -0500
X-MC-Unique: kJcD_EAbPeyVRUpdnC8LBw-1
X-Mimecast-MFC-AGG-ID: kJcD_EAbPeyVRUpdnC8LBw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43498af79a6so28967105e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 00:29:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733214591; x=1733819391;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cL7v3oc5fMJ4viLddVGUsjohS5uWgp/SM7upP9Q9RVU=;
        b=ZJVAsb2f7EuLvO8dm7/9NEhFZqwdls5Tw0FfV1wYaiQcPMlhWpuT8NwAfDg9bhDKfs
         Um3Z1KKB9oSHF8+HP+GWHyLx4p6bwnzYejRriqZxTPvAj0WIE2bkDMjzRegcWZLDnCHr
         6tprETvuoPoZ5FKvNNIjX6SPcLFcRFXkCfN3w85cPlgK/NdsME2FWvPA7nc5xn2Rai3R
         TnvlmwXB1Umvca25+Yn1HcegFOfHRH9rF+taOb7r47lSxQeQV2n/bcAwqNX+VIOpj7Dn
         8u8i61A8t7vWeHLL3Dh8MmiSL4+lZQ9u2F/Z1czobv6/g6Rp7gkXMGXWwcD2M+RUu3X2
         lucA==
X-Forwarded-Encrypted: i=1; AJvYcCUh5QxKpwKrJGbu8zOBGbw1vqygeaOt3EazGaZOTQmFkZ2jmCAu/n5d/Mn5d7NbwOIGYmzUQWafhzIIhwE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw5Qgq0V+lts4DtVt/stWi66eumxO4My02aFUh+DMKILhzqb8+Q
	JqsEs9muCMsLinS4Uyf/QzCk/8XRi49Mj2tCCd+HwAxiL4sGDs8lJh+ipKMiT7BgJFfgDgaZvf8
	mBN43WLcZYte843ialYVHDB5EB6kTpFL7Y6iNYJ6dqMGYc6WPXefu97rBUGn6++E=
X-Gm-Gg: ASbGnctbtsBUgBRhBF6UEPGAWPkMnfOyFHfKV9QknUTUMX9SF60QyMnqXgm9xhMmwjd
	E2bQex0qa75XWpPxXgDjXBasTu/1jVe7UFUDIcyocKcjNNLSfI0KOCnYoSV77XbOJ5ZT8BQmG5W
	qPWzAlrbUa5UHPHLwLS78n7qD6isct66+kZl8KCF5KZjGfx+4t2EkUSGMhEJFI7ijfVZ/50m6/M
	4jSfstBwudIGzygScf7Rfq1U8+WG4e6AWnMBCK8epB9KHoBPbqwVWYvn62sEWWIyQ1g4Khhquw5
	NPnx4t9AGnw4500D4cKTBFzX0ZLDxSE17kuabruSoc0Ix8nv6EKGDWN/ksNTK00AtDK6o3HvExz
	MTg==
X-Received: by 2002:a05:600c:5593:b0:434:a33d:ba44 with SMTP id 5b1f17b1804b1-434afc44167mr187239955e9.15.1733214590833;
        Tue, 03 Dec 2024 00:29:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWDIsqECcfy6rPlhtUK9y0qN4FnZDKURgqLcZP2VHBBvbbgteOyKLxNnJsZYkBuDbBUXDFYw==
X-Received: by 2002:a05:600c:5593:b0:434:a33d:ba44 with SMTP id 5b1f17b1804b1-434afc44167mr187239765e9.15.1733214590500;
        Tue, 03 Dec 2024 00:29:50 -0800 (PST)
Received: from ?IPV6:2003:cb:c746:1b00:fd9e:c26c:c552:1de7? (p200300cbc7461b00fd9ec26cc5521de7.dip0.t-ipconnect.de. [2003:cb:c746:1b00:fd9e:c26c:c552:1de7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dc99b3sm179813635e9.24.2024.12.03.00.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 00:29:50 -0800 (PST)
Message-ID: <dd45ff45-8894-4502-a4ee-ca4cd927662b@redhat.com>
Date: Tue, 3 Dec 2024 09:29:48 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/6] mm/page_alloc: gfp flags cleanups for
 alloc_contig_*()
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20241202125812.561028-1-david@redhat.com>
 <6CE8BCE0-BDBE-41BB-9998-D9165CF05A1F@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6CE8BCE0-BDBE-41BB-9998-D9165CF05A1F@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r-wJoxSM1DS8JSa4W8cX3clmYFUFGkHCRjRLRRjrJjc_1733214591
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 02.12.24 23:07, Zi Yan wrote:
> On 2 Dec 2024, at 7:58, David Hildenbrand wrote:
> 
>> Let's clean up the gfp flags handling, and support __GFP_ZERO, such that we
>> can finally remove the TODO in memtrace code.
>>
>> I did some alloc_contig_*() testing with virtio-mem and hugetlb; I did not
>> test powernv/memtrace -- I cross-compiled it, though.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Naveen N Rao <naveen@kernel.org>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> 
> FYI, linux-mm does not get any of your emails: https://lore.kernel.org/linux-mm/ECFA727B-F542-42E5-BE32-F9FB27F5DCDB@nvidia.com/, but linux-kernel has them.

Indeed, linuxppc seems to have them as well.

Guess I'll have to blame it on linux-mm, then ;)

Let me resend with #5 patch description adjusted. Thanks for the review!

-- 
Cheers,

David / dhildenb


