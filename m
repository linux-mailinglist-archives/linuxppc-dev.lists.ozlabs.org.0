Return-Path: <linuxppc-dev+bounces-5233-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8EFA109E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 15:51:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXXBf3ZpKz30Tq;
	Wed, 15 Jan 2025 01:51:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736866282;
	cv=none; b=LBbP8Livp5++REWcC0fzE64+GdyCAyXvmz4etk75ltL1rXx2+K0j4hGEA8Bz3mDrVN9ayo9bmgnxoLwCfzA9BsaP80CKuZ3Oj3fNsZ0im/qP2C8UMGULJ07JkC0a46WSG8S+8YcHg8hSQ0/NRwti5dVLQjcHQyzLWFyYSxFFBeLb7DwJziNZN/TmkH4KhQZGCkYqySkrQtLcbtHcjirxrfDUlZ1fFrsXni2L7zmhgkMb5AHL73vVkhmnB2DCxbHmMl22DWjubjo915/jcocR/uoNLjxkVy+I6lw+7ppmX2/psQTy6rE30WxQznNpnxuEpFHh1gMo6S2BgcNU3D/51A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736866282; c=relaxed/relaxed;
	bh=frCMXuewTKaMxoSv5HkrB79R79VgidnpZu3s0YCdJnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jT8Nb9RNYb0qewr5PAkWPn3fXGXcgbAWynCygsQLjuH99YUmmr4NEb8w3EIURuEdRe2X0jcmywUTfHepj7rDpfJHks990WnpX8/0dY/N72FB4r59v+jtjA0GHF0C837QycVWwUH8W9ctszenlcYEvSTs4mB+0yf6z0Ls0fgd1DgaY9V9YywZFjYjYWvbtTio7F04wFHuWrZPzyfOy6Zup9eVaSKPlCa32YClpm8BDBEdy80VOhaoF9BJhENrHogN1ybwtC00GoSJCOJ9JO8iJzr0HJYL4C3Txa1LJdckDuzs0EcFpKdIeRYqrqxpHHJQobFsSHU6z0355wxGRUkrJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VSG7EfyL; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZINgt9zR; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VSG7EfyL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZINgt9zR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXXBd2NGGz30T2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 01:51:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736866277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=frCMXuewTKaMxoSv5HkrB79R79VgidnpZu3s0YCdJnw=;
	b=VSG7EfyLBmLjA2fZauKSkbx0OkBAT86dgFPOXr7ihu772rHOlHj/yh1cTQmSssdZ/eCoTi
	s3pyvVJCaCAVNJSBdKAEFhFWU/zdU5CLQa/F2ex98Uj71o6wCdlv3vhDgRDEb8Y4W6ClMR
	nLs5ixjA+YCfcolmdXIHs6V3GtJwlkQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736866278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=frCMXuewTKaMxoSv5HkrB79R79VgidnpZu3s0YCdJnw=;
	b=ZINgt9zRY/6mieIAWI5C7LotgUmfqg8ZbuvjnzN2d9pk5A+Tjk9o7FUnUj4kL/mWW3EFat
	7IhVX7m1g4S/z2TMBIFaUvAHAJHT/6dJq5LBCNhhitJzXJzsc0y76X2vks9uYTcYEpCaEe
	OD8nT0P/YTet1Rlcnsf3KELxRA909m4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-WEMElzvbNPKmW3zIx1Kglg-1; Tue, 14 Jan 2025 09:51:13 -0500
X-MC-Unique: WEMElzvbNPKmW3zIx1Kglg-1
X-Mimecast-MFC-AGG-ID: WEMElzvbNPKmW3zIx1Kglg
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385e00ebb16so2117512f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 06:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736866272; x=1737471072;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=frCMXuewTKaMxoSv5HkrB79R79VgidnpZu3s0YCdJnw=;
        b=qJep8e7Ud35JLdGr21K99/1wQk9gQ1PmoOe2VCG2G0Fn9LrM0lv9QQPQ41+Cvrgvfs
         FEfg22lGrmTb5lSXErjx0rhxldEqc/cwXYtzW6Isc0X68DNYepK9U36W3OeGt7ULtfmR
         5W5RuOKpNrsPI0mdzu1zNj6cYguBWFMrh/udIAsnprqWtdNtuno43JvGk3EYFmYl9xrn
         p178z9Hc1eF2bzKPQzVIB2+iCj8aDuDoA1pls2xSIJqGWmTbOvw96LDraDcEylh+BLnd
         RCfYPkVbC6exTgXNK0xymI+livbkqKvc+WlVdUCCHaaqR1WwmKF7ywOVCYF6d15rPt9a
         SzPg==
X-Forwarded-Encrypted: i=1; AJvYcCVMfvmMo6gZA1o9H9kZUwRta+ufZH0NGzTtQUddQTDj+YSyisohKLWptZ3Ki/ENgRtGjwXA1JNvw9GH2PU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw0c0vWMAz9RKP4Au6RWy/Ag7FvPGkTgzfK3aYEW24IGCkC1hRl
	sAF+ssdNU4KhWtYsYTp9uSNDHgFYlj815CTI4SWcANK+PiH/Foglc7RK5NBmy0a5Il3sDAeq3dl
	diw2mnbxvpzdECKEpZJDD5Ho8SAzPbTLDAmdgMRgy54o0iFt8GdC9fOWaAu3jvwQ=
X-Gm-Gg: ASbGnct3iVB8Ajq/bLKi7NuIMsv2m3TMGkeGUvoMPuoTMKD1ZMZk+V43srWyPPagkor
	QJHOWRfKjhaUMeKe37ORThTob16NsyXSfS/mMZqvHD+M80VAYRQBQazrgSSuXUukbLceXY3ensh
	5zp2eLuZ1YyyZUW6roTr4bVonHkItvUWqyreKOA4J5UmwhkK+bxFZSxDe7F4/lyWDZkJwAx3oU4
	/jL4I/ROCiEcitz8rdxiHq4U/IUmAalSavN9OVX0oy2WtVll8yK/mixBh1V57UOklIgTDSZ7SJw
	CgBUqa/+du8hg0CRm6QPLw5LY6ckBHq6STSnt+V6qLsY0k1mCnGUG1b9IgOAnT9yHPnm6n1NxIL
	eQq915Ety
X-Received: by 2002:a05:6000:18a2:b0:382:49f9:74bb with SMTP id ffacd0b85a97d-38a872f3202mr24489598f8f.35.1736866272054;
        Tue, 14 Jan 2025 06:51:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7GJ1+W/uNTlLNM/+qMUx1r19EPlEDmBQ7z7UMM/B1+0DtBI15xOV7jFVV7enwVcHppl6EyQ==
X-Received: by 2002:a05:6000:18a2:b0:382:49f9:74bb with SMTP id ffacd0b85a97d-38a872f3202mr24489568f8f.35.1736866271639;
        Tue, 14 Jan 2025 06:51:11 -0800 (PST)
Received: from ?IPV6:2003:cb:c738:3100:8133:26cf:7877:94aa? (p200300cbc7383100813326cf787794aa.dip0.t-ipconnect.de. [2003:cb:c738:3100:8133:26cf:7877:94aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c6dbsm15361588f8f.55.2025.01.14.06.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 06:51:11 -0800 (PST)
Message-ID: <9be14739-82cc-42fb-bb38-a868231cdda6@redhat.com>
Date: Tue, 14 Jan 2025 15:51:09 +0100
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
Subject: Re: [PATCH v6 10/26] mm/mm_init: Move p2pdma page refcount
 initialisation to p2pdma
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: alison.schofield@intel.com, lina@asahilina.net, zhang.lyra@gmail.com,
 gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
 jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ira.weiny@intel.com, willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
 linmiaohe@huawei.com, peterx@redhat.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, jhubbard@nvidia.com,
 hch@lst.de, david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <4f3fa1bb9cf4402d6131d0902472d8e9bae52f88.1736488799.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <4f3fa1bb9cf4402d6131d0902472d8e9bae52f88.1736488799.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6q__bFSdGO67JoVzQXlMjgO7fu2SXT6vhOeEcRKZnhE_1736866272
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 10.01.25 07:00, Alistair Popple wrote:
> Currently ZONE_DEVICE page reference counts are initialised by core
> memory management code in __init_zone_device_page() as part of the
> memremap() call which driver modules make to obtain ZONE_DEVICE
> pages. This initialises page refcounts to 1 before returning them to
> the driver.
> 
> This was presumably done because it drivers had a reference of sorts
> on the page. It also ensured the page could always be mapped with
> vm_insert_page() for example and would never get freed (ie. have a
> zero refcount), freeing drivers of manipulating page reference counts.
> 
> However it complicates figuring out whether or not a page is free from
> the mm perspective because it is no longer possible to just look at
> the refcount. Instead the page type must be known and if GUP is used a
> secondary pgmap reference is also sometimes needed.
> 
> To simplify this it is desirable to remove the page reference count
> for the driver, so core mm can just use the refcount without having to
> account for page type or do other types of tracking. This is possible
> because drivers can always assume the page is valid as core kernel
> will never offline or remove the struct page.
> 
> This means it is now up to drivers to initialise the page refcount as
> required. P2PDMA uses vm_insert_page() to map the page, and that
> requires a non-zero reference count when initialising the page so set
> that when the page is first mapped.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> 

LGTM

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


