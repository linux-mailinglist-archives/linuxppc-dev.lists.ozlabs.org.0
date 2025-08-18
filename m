Return-Path: <linuxppc-dev+bounces-11076-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2231B29A59
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 08:59:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c53V93Yfsz2ywR;
	Mon, 18 Aug 2025 16:59:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755500353;
	cv=none; b=QK2e10WAQ7FQ17gBYdhRNUS6kikIfbVWlKp7nHQpL2z+wBFkMahfcByC6xbPGwCcf/XCRvP0u4diWUtJuxDiAXLDyeJ5EeBHsX1mjX8AfgwBlh8OGA1e9ZfzxOFiydIgg9TvgRRHQSM4PhhpSdAlcnx4SxDTAiT6/URHCw9HQ8wcFUjl4KuhXx83JYeUVIz3NnTFKF120wy91M8YUHChhtgVp5P23iXQM+/FM2IusE/h+ZRVGf9/2bz8uAQs+3ssJqW9ZQpS8mW+/qAVOC6Wt4odNW6B3e0lWkt18Gm8EsriMYJUua5z/w/AZX6HabfqWq0DszIgMfw3Y/G2ALaKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755500353; c=relaxed/relaxed;
	bh=tPhHppo9Id9H3Mf+xNXwTczb/fY9tmDFofhTHWpEmEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvLuygfMzGr/RjTkUNmgk6Gq7B6L4y2mbDdOcxKuaD+QECjp9mcYIjoZmZTuD5i7fvTBETyQrEG+O2JF0hF/euFr/l49PsLH8nwXoSHax5bbRfqOH8rYeeT+RmGrb+UhyYOLmmmoXk2qXFZ1IBICWkEeQkeFz53Tv4IhowMLX0Znc4wXKpEe71r1k94AtJeGC4etGT5jad4CvwZGxQdqZ1PyaDKM/pLIk/F783li2O/8SrxaDeKoG9WaBEqeyugX6O6KwUbuq81/I5x4vfVNRWB9ZK9Lp/65+YrD6eLCwNJvo5Q8u68kj1qZW04CLOaP/tRMAqxBGr8LLfGtZ2OsKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rq1FfMRq; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rq1FfMRq; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rq1FfMRq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rq1FfMRq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c53V81V86z2xPw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 16:59:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755500346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tPhHppo9Id9H3Mf+xNXwTczb/fY9tmDFofhTHWpEmEI=;
	b=Rq1FfMRq5qSvdE52tuMFTnvHM4X76J5Sob2h+duiJv0DF40XfL8OoniE0aBTbCzxb3bgPP
	UlIJ+gAW48Pu9VgpnUAMm2/LT1c17cv5xR741jrX0coaAN/ighjlCXa72o2zN9rfxW42xS
	7cj3COi04xz7z/Iu/egY3uF6TUNbPXQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755500346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tPhHppo9Id9H3Mf+xNXwTczb/fY9tmDFofhTHWpEmEI=;
	b=Rq1FfMRq5qSvdE52tuMFTnvHM4X76J5Sob2h+duiJv0DF40XfL8OoniE0aBTbCzxb3bgPP
	UlIJ+gAW48Pu9VgpnUAMm2/LT1c17cv5xR741jrX0coaAN/ighjlCXa72o2zN9rfxW42xS
	7cj3COi04xz7z/Iu/egY3uF6TUNbPXQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-JYP21NHJNKObbz-4otIayA-1; Mon, 18 Aug 2025 02:59:03 -0400
X-MC-Unique: JYP21NHJNKObbz-4otIayA-1
X-Mimecast-MFC-AGG-ID: JYP21NHJNKObbz-4otIayA_1755500342
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45a1b0cc989so19676635e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Aug 2025 23:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755500342; x=1756105142;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPhHppo9Id9H3Mf+xNXwTczb/fY9tmDFofhTHWpEmEI=;
        b=BO0lAJuA1o8EuEafu4JTiS2YQDmMrc67H2ligAyqwM046NByJU389qraOMzb5Y5ESg
         0fc3LHDIctfKGdCiQMljF6lIZJPS9Utz/igHEZ6FgSDPowf/So7LGdxU0c4Vwq2DA1k9
         wZZ8HxAJh8QR7kZkDvZFBnFQhOCjULP6RkJqgf5l7DCmrbqVypgE5I+XoXfSv6MgLgo9
         amBU5FLXjRYrdMK9Cy10TbFVZFXGk0oBaRmY+FzXoimJvNEqz6SCXd2U1As/+rznA3ce
         Zb1O/U9hz+1z/LC5i9heVBIyfxn2x/w+/05VfS9lQMOuepaXq48PvbevF5YgU8x/e1qM
         bFyQ==
X-Gm-Message-State: AOJu0YwycdiWwjupxM2W7OgqkHeMmSJYUBHg1MmBeGI6PG5LP4Mqvfpm
	B44lyFzU11avtAVJ645ncXdscxBDArzI2Nq4Uf94mNo7AzsnoxMujUNK1FwmQa6Ick0ghKis1tG
	vT4NiPaYTOTCRcc9q/2ccnVR4CSx01khnqab4slmGk+r1GBmBB8oOo+OffaW/OALtiS4=
X-Gm-Gg: ASbGncvc6PjA1lze8poNqzgA2mcl41Xp7iZhjZtG8IOVXk+/uDsYRAPrrHh088GnjpI
	vJwdW9T7q7eotoYyGQtYhdiqR9wP3snx6ETLO2Cozjk0mmIH5yidmzvxAmUxzsXCgZfBwZ4uCaS
	NKuqeBvtRfouUKtSIfAJvQf3rS/2hNYP6P5EmdQUggoUdxyprQV8I/KWDskhmyzUH9fhP9Hqsud
	gbiG1c6mZaVWekskPnmyagSA9t/t1Qm3466FA8y3htLP8mCbptGxzMKTBvjh3q6xkrbbnNHwWLL
	OE2IEve/oPU9k1VAyJ9sLI6TGCr1WX/t3naxB5SIM0gKWS6JMtT/tNiNbOH/jgjQqXnychHQvqv
	0MHN07i8MycvvHarcW/LKSIfFoifCvqzrHKK6LxQaE3g5Os8KTuZdrGPw3D1QLkMM
X-Received: by 2002:a05:600c:3b0e:b0:458:aed1:f82c with SMTP id 5b1f17b1804b1-45a21844ae1mr69168555e9.22.1755500342369;
        Sun, 17 Aug 2025 23:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRjJq0XIQ1oLnzV4tapEXxp+CDryL3RteLWPsUBJ810j9eh5EZSzNq0LPGyZErkVrGEekgEg==
X-Received: by 2002:a05:600c:3b0e:b0:458:aed1:f82c with SMTP id 5b1f17b1804b1-45a21844ae1mr69168235e9.22.1755500341938;
        Sun, 17 Aug 2025 23:59:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f22:600:53c7:df43:7dc3:ae39? (p200300d82f22060053c7df437dc3ae39.dip0.t-ipconnect.de. [2003:d8:2f22:600:53c7:df43:7dc3:ae39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a72sm11554512f8f.34.2025.08.17.23.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 23:59:01 -0700 (PDT)
Message-ID: <d7cdb65d-c241-478c-aa01-bc1a5f188e4f@redhat.com>
Date: Mon, 18 Aug 2025 08:58:59 +0200
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
Subject: Re: [PATCH] mm/numa: Rename memory_add_physaddr_to_nid to
 memory_get_phys_to_nid
To: pratyush.brahma@oss.qualcomm.com,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Pankaj Gupta
 <pankaj.gupta.linux@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-acpi@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-mm@kvack.org, linux-cxl@vger.kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org
References: <20250818-numa_memblks-v1-1-9eb29ade560a@oss.qualcomm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250818-numa_memblks-v1-1-9eb29ade560a@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9mnNh-d_uzszK5gIRqzZ6_xSHV8q2Ta_ZL2Y6o0UGdg_1755500342
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18.08.25 08:41, pratyush.brahma@oss.qualcomm.com wrote:
> From: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> 
> The function `memory_add_physaddr_to_nid` seems a misnomer.
> It does not to "add" a physical address to a NID mapping,
> but rather it gets the NID associated with a given physical address.

You probably misunderstood what the function is used for: memory hotplug 
aka "memory_add".

This patch is making matters worse by stripping that detail, unfortunately.


-- 
Cheers

David / dhildenb


