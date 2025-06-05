Return-Path: <linuxppc-dev+bounces-9165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCDFACEB5A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jun 2025 09:57:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCcH935wMz2yLB;
	Thu,  5 Jun 2025 17:57:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749110229;
	cv=none; b=SbZAiAe6G+bo/sT7NL67sFbg461pfpgYkTc02ovtGR2gRlVl/Fv1RmLs6J3O6zswZ0sIFPPjLxqx0dxFftoKrniqSIE/usx4y8B0gdba252TlEglon++XhFa0Ukqv2RMJA3NX5mgvM3PMYmQ3Si1eHVvQrRp3DrkWn952rz4CuZefQTXl27kbXDP5IBLnZoMIorr5tb4ubklHFpxAE7/Xj/vq5HT5SW0LI4XTVv+BMgRaVmIGuq29gJXdSYeRDICFYQJ8uRPxIj6ygLhFxKKwJuDbuiiVop9JbS54Vo9YlDK/sl+UUFSUryf4kCLgD0+KkVjagOcJSfPIPNmsEY3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749110229; c=relaxed/relaxed;
	bh=wRyOEDXETxIkKIFfjZs2P8W26KRROUKYMIqAGAlgFBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Re6NouAsxEKgh9RdznjijaHy7rH+GQMga69YkoUDPUvGkYJrKuPOWithczKXv3scnZZN8P14j/hv6hFcrVe+Sx+g9Qf5Ysgdhnic+ZeHJAN0CVzi0ZJJJ9YbuMXSm0tfYfv7+j+Zz3t95YdGCsyOY+sBOoKLZew4IXb9rq8Cqpx+NottwTi+xXZqLnAP17yC8e6vLC9Xpj5xIZ9oMAnUBWps3dbj0lu7Hqbme8CLIoB50a9MjW6PNhClgJMb5Rz+QvDnRiYft6/YgXox9g/F2mP/Cx/G0yyWP98HG5eO4i65QiE09HtdZA9CzDYmDYvEB+0uryLLHsCTTnokrgSNsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Eil9HgAc; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OhgIxX/X; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Eil9HgAc;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OhgIxX/X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCcH76k9Wz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jun 2025 17:57:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749110221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wRyOEDXETxIkKIFfjZs2P8W26KRROUKYMIqAGAlgFBI=;
	b=Eil9HgAc2tjCvLS+rs9R+AUFDEAlD1u9VsNXLFW2hWiUW4pOhrI8Cpo8ImDNpWqWN6CXd0
	L5VVWtb5vO64V0i06owsmT3jb7nSnIC/9KiFZPWfSyboSHDsTCXWtKi/8nQGtIkPhH0lzg
	EBmuAKYCDEAn78Ye3HtbFpu5cX3vSGw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749110222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wRyOEDXETxIkKIFfjZs2P8W26KRROUKYMIqAGAlgFBI=;
	b=OhgIxX/XBkXX6E8H+nWMCQ1daV8lv523Ep6Y14H9FMO6VHtPj1P7A9TIUmbmKBr5qYJto8
	EvO06nuyn4ttmrsH1h8JpAQT9yque9XC9XSXcDeIz1K71LYrcl7vN38LEva4ajurgzYItl
	HH1WYhbXWcKDmjcr8Rh8NzPDl/nc8rk=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-pyvthqRxO5umu-ljfrt2UA-1; Thu, 05 Jun 2025 03:56:59 -0400
X-MC-Unique: pyvthqRxO5umu-ljfrt2UA-1
X-Mimecast-MFC-AGG-ID: pyvthqRxO5umu-ljfrt2UA_1749110218
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5520a231361so373366e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Jun 2025 00:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749110218; x=1749715018;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wRyOEDXETxIkKIFfjZs2P8W26KRROUKYMIqAGAlgFBI=;
        b=DL4/VSASOUr1hDISj37OzTEAQu0aO6GeI8lUgoDmcCkj7Adsvv4DBPp4l8XpmMn5KM
         xGPuHRAo5gsDwcLw6HRcYdeLhpEN9EfJTbnMIKA6NRkTwTJ4QFAP1xlnB/bDezb6ohkW
         aBBcxWFe+toRrZawuDMpq6tC59glkt/fNRn38IrFF802pYnDmzv6ntWnp8JZUbvm0wu0
         XWSPUGMTvpBG8ww0OhwsIe2i/SSALXDtm4QLfo3oO0A+W/oB8zh49tHcMp3r9ra9bcnr
         Vk67WG0xNQuAOHtzn8h9rbp08bBWGsv3E5ts3LOFHgUsj/Vq5kCv6XxZmBxtHrTjEGV+
         fFqw==
X-Forwarded-Encrypted: i=1; AJvYcCWRUNAFciCo/2GtjZ6F+T7e9w4X3F21owpFXNpVcHbPSGdh8X0BlG8ux+dbPxo7Mh2s/kpiKyJ4UF5GL8U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzsv33CZto9lhscjFokefYqVqdF+wvnhizLlnJyRcIW+JFDH4Fp
	95w+3p+Q3rKGADqYs6MQ8WAQaMRC6+Lq+7QZmAS/Q2NxjPvnC22PF8QV1Ze1MuQUfLd9Y9CSw5u
	0+ASksxPAp0lk6WsdSyQMF2HfnK3SKGfNpanm04mJMKwM7hflOGw++VjyMjCojmAE5gU=
X-Gm-Gg: ASbGncutbaF7XvJjNn668Myu9tctASzzmispSTL+ujyk6I+EmN/gS22lAy8kDMkbI8a
	Mq/QXNdDNVUNDozZbbCuwXblkOjWWe+TAID3xgw6cwjpQDDPsocNKrnnmJDZ1zm+F/CG4P88vzX
	S890VInKuxi7vFu2oSnF2wAwkeyrA9m3MpW1H18YuuJa+9LsChIAFj/EHsuD374Ro9kpjEmYojB
	AEnvfLFPcHhFx6LCnDgn0dDDzSjlSm+udhBKtRpRte6oGJ7ut+ev6t+S5AEcbfjEf7Xd3/HH+T4
	zwC11Jyme5h+KoUAXOidsIm8fjm0PcXJfVObcqrybD4KCDhLUfXpcFmnrMPp2LpqcqHUnSrxHne
	Sbo9H2JSGRg9xqV88ANzXkd2g+VsHyKRgwfe8
X-Received: by 2002:a05:600c:3106:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-451f0a6a94bmr54009385e9.2.1749109770011;
        Thu, 05 Jun 2025 00:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZsjcg/PLPpLyQGdb23N26umjiH63blsW4LCsG+AuyVl004iXQAfjzXr57lLLdanZJ4s608g==
X-Received: by 2002:a05:600c:3106:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-451f0a6a94bmr54009085e9.2.1749109769586;
        Thu, 05 Jun 2025 00:49:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2? (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de. [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb22a7f2sm9315935e9.37.2025.06.05.00.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 00:49:29 -0700 (PDT)
Message-ID: <b064c820-1735-47db-96e3-6f2b00300c67@redhat.com>
Date: Thu, 5 Jun 2025 09:49:27 +0200
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
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 gerald.schaefer@linux.ibm.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, zhang.lyra@gmail.com,
 debug@rivosinc.com, bjorn@kernel.org, balbirs@nvidia.com,
 lorenzo.stoakes@oracle.com, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org,
 dri-devel@lists.freedesktop.org, John@groves.net
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
 <6840f9ed3785a_249110084@dwillia2-xfh.jf.intel.com.notmuch>
 <20250605074637.GA7727@lst.de>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250605074637.GA7727@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: THZOBaLMBHfq9hl_RvZ1gIn9SP74YM-I9V2BVH7Hv7g_1749110218
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 05.06.25 09:46, Christoph Hellwig wrote:
> On Wed, Jun 04, 2025 at 06:59:09PM -0700, Dan Williams wrote:
>> +/* return normal pages backed by the page allocator */
>> +static inline struct page *vm_normal_gfp_pmd(struct vm_area_struct *vma,
>> +					     unsigned long addr, pmd_t pmd)
>> +{
>> +	struct page *page = vm_normal_page_pmd(vma, addr, pmd);
>> +
>> +	if (!is_devdax_page(page) && !is_fsdax_page(page))
>> +		return page;
>> +	return NULL;
> 
> If you go for this make it more straight forward by having the
> normal path in the main flow:
> 
> 	if (is_devdax_page(page) || is_fsdax_page(page))
> 		return NULL;
> 	return page;

+1

But I'd defer introducing that for now if avoidable. I find the naming 
rather ... suboptimal :)

-- 
Cheers,

David / dhildenb


