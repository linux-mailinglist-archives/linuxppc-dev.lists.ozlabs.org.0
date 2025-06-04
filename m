Return-Path: <linuxppc-dev+bounces-9138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A71ACDB57
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 11:45:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bC2kJ1JNXz2xXP;
	Wed,  4 Jun 2025 19:45:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749030312;
	cv=none; b=ZktHJv+/nPDvW6ZBPUj3dENaLnDOTPpwk1AWSjZkhfgPeV9Lg67bp/AZfQVzawYn+9LQFPa7rD9K4qdypgtoi4dph3kRJqkR7jB+MsB2G+YEgulXYlZm7OhsuUcTl7nI6wq+1b9wxrT2+8YDmjFEeZJiSzwXuLN/yEQ+D/spY+Wn9Kc5ypPyoYBa9VGH9Q1m9uFQ+yWzHWZxNtTYTH8j05U9ik14Oj9i6Ub2HJNWW4BGtqeCn4W6fozc9pWCIcGtaHJkx5LqOhRmHhEmwgyHwGi6cjjfyyVDiXP4WHsAStUpsXu+5CDLOdoOmmyTozOcuXsGysCyzOcEcnyA1sZYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749030312; c=relaxed/relaxed;
	bh=N25tBxOpW4+CmaozSXoxCREQxpCpS3nehI/HEnEd2/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMHtfVvYyJEc1j2BHGKrvSk+3+vqmO1AlK/UWxpLtmrFvnh3Vkmo1hGxopsezaWiIxrEOa2r1XUk/1oUspK+SiA4O8/hBA3m057qULw86+Co5zKBKIBRQS7hst6bcvcg8Hmjc+e1BvH2PwhC+eGycObYgunKKl7tLfjQYbtrNN10Ef2uOGio/KyFLdRr1tQX9xrf4AIS3h94drEQz6rtkS+loEKXEjG/B0BW9fu20CHMu3XiPDUXTV5YLWtqISUzP45ZcyboFdMvTb+BFf39/+1nnFFOXookQaYtgjUx+ePrRH7yN938iPCad15z/htfJ0GdPam76R6XuxXiOhwWBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wr2ti4Ef; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wr2ti4Ef; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wr2ti4Ef;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wr2ti4Ef;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bC2kH2HC6z2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 19:45:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749030307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N25tBxOpW4+CmaozSXoxCREQxpCpS3nehI/HEnEd2/c=;
	b=Wr2ti4EfxQSj69IfZMSeGlqCAvsL8BTW3dM8eTJ4iNAKEP3SSFoQScKlGZYmxIsgWVQ1yZ
	QcLFVXqqghDwxnn4YL7DJss/WTEBm4dUuT6XV0I5d7/0vKxQ2EApkCxvapxUZ+AZcREx4Z
	XXPy6lbwyh3VU5FItN4/AXSfRpRKRDM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749030307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N25tBxOpW4+CmaozSXoxCREQxpCpS3nehI/HEnEd2/c=;
	b=Wr2ti4EfxQSj69IfZMSeGlqCAvsL8BTW3dM8eTJ4iNAKEP3SSFoQScKlGZYmxIsgWVQ1yZ
	QcLFVXqqghDwxnn4YL7DJss/WTEBm4dUuT6XV0I5d7/0vKxQ2EApkCxvapxUZ+AZcREx4Z
	XXPy6lbwyh3VU5FItN4/AXSfRpRKRDM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-Q_XXFPo6MMq1MPYLbc-8-A-1; Wed, 04 Jun 2025 05:45:05 -0400
X-MC-Unique: Q_XXFPo6MMq1MPYLbc-8-A-1
X-Mimecast-MFC-AGG-ID: Q_XXFPo6MMq1MPYLbc-8-A_1749030304
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450cb902173so3744135e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Jun 2025 02:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030304; x=1749635104;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N25tBxOpW4+CmaozSXoxCREQxpCpS3nehI/HEnEd2/c=;
        b=mjuYG/yoiGENLtDcMOAI3CWIS0GpqHFKlxP4Lfi0I2RCoYVvPBOtP9xWfsijWllRmV
         LfMzxuBTZ4HKfFGI79/IOhs+8tPGKip16f9AOg2E+CHud8Ht6y36fKgGEnArFPoWRYqB
         6dsxJ44oqDeRPWT/klyafOa6VPwZ/eFoIWt2LzMniQWc5iCRizR9wH8K9pGte9wVUbeE
         6WYXOA/ASiSXVxUcGfGk9g2800DcEsk9rF6Y1siHg8YbOCxi1KIeHUwAmmbCVUkTkIeg
         0DqELjHGWi9orINejTKJ5ZBK2SykzrU7Mif0lUY9wMgcWz222WhbGJ76GWlfEu2XwsDa
         zJNA==
X-Forwarded-Encrypted: i=1; AJvYcCUbZyhF3bgj7W6TFFmW6ObsumbeGI/Ss//4/XhFR9kMPaVu+6KO09Hm8Wcxh2Q0YJhanlHuYTQPVvfzsaI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+Tec1nQkpichaBPVRk6/kOVGmg1I60clJsahpoYKly4jeq4kC
	zlNg3iN1eEdyOyVKmpjzE8KbrF4xOo5q23i51DahLbAabd5zm7VcVI27k3m1ydUUVmFTRaPvs53
	H8DN7a4WRlT/V3FcB43SznSON9529y0Ha1VvY5/o0Yh6gyXhG6ne4xtQCb5SzZJTLxV4=
X-Gm-Gg: ASbGncvC0W8jnBp4HkI1bq6E6Fdhkd9E5pPpp1nPhZHf0ajrqQK4RYTu6GBmYHtIi/D
	dfZqQSevJ1FO5H1KSXGEqnlaCDTanThhVZJiPYnXSJvwG9VnkAyTYkYulzXgWPwxYMtFfkJWdEf
	TpQceMoOilF0k5JT9E3bPTBiO+73BaHnVVEz1kbChZBHp/4+JSeVVaavBj/Pa/XGr+G/NfEbHKi
	575SPMbKMgTYL+Lk5wgbplV5kJaR/S1wSHXu9eukFfAkYVabPy33ToQvzwVa95w0ADaU10N7yJh
	496K0F1S1uIuUQ33jBziWVFoxlYdQaEx6TqCLjsbOBQVwzGEDWbqoaehpmgCUvUuZAZgySCPfBV
	8xxr+wn6BYTCWGNm402wFTHiRDIOOI4NZAqxrMr4=
X-Received: by 2002:a05:600c:a197:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-451e61221d7mr46452865e9.14.1749030304332;
        Wed, 04 Jun 2025 02:45:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8k9sHoubF3xa4TwhFMghUcSSm4V4hCJo5i/46wpXB1vGZJemDM4SbI1oLdasTdXNoJZZ2jw==
X-Received: by 2002:a05:600c:a197:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-451e61221d7mr46452445e9.14.1749030303869;
        Wed, 04 Jun 2025 02:45:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c79dsm20728119f8f.25.2025.06.04.02.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 02:45:03 -0700 (PDT)
Message-ID: <b355e72d-0284-4a31-84e3-ae4a79ad922f@redhat.com>
Date: Wed, 4 Jun 2025 11:45:02 +0200
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
To: Andrew Morton <akpm@linux-foundation.org>,
 Donet Tom <donettom@linux.ibm.com>
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250603200729.b7581e017e4ca63f502c795e@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QEHDc3xUjJIl-R1-PvVaLH-CqO0Sjbf7NnrxoRnzFRo_1749030304
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 04.06.25 05:07, Andrew Morton wrote:
> On Wed, 28 May 2025 12:18:00 -0500 Donet Tom <donettom@linux.ibm.com> wrote:
> 
>> During node device initialization, `memory blocks` are registered under
>> each NUMA node. The `memory blocks` to be registered are identified using
>> the node’s start and end PFNs, which are obtained from the node's pg_data
> 
> It's quite unconventional to omit the [0/N] changelog.  This omission
> somewhat messed up my processes so I added a one-liner to this.
> 

Yeah, I was assuming that I simply did not get cc'ed on the cover 
letter, but there is actually none.

Donet please add that in the future. git can do this using --cover-letter.

>>
>> ...
>>
>> Test Results on My system with 32TB RAM
>> =======================================
>> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
>>
>> Without this patch
>> ------------------
>> Startup finished in 1min 16.528s (kernel)
>>
>> With this patch
>> ---------------
>> Startup finished in 17.236s (kernel) - 78% Improvement
> 
> Well someone is in for a nice surprise.
> 
>> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
>>
>> Without this patch
>> ------------------
>> Startup finished in 28.320s (kernel)
> 
> what.  CONFIG_DEFERRED_STRUCT_PAGE_INIT is supposed to make bootup
> faster.

Right, that's weird. Especially that it is still slower after these changes.

CONFIG_DEFERRED_STRUCT_PAGE_INIT should be initializing in parallel 
which ... should be faster.

@Donet, how many CPUs and nodes does your system have? Can you identify 
what is taking longer than without CONFIG_DEFERRED_STRUCT_PAGE_INIT?

-- 
Cheers,

David / dhildenb


