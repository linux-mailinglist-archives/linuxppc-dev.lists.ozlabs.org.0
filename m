Return-Path: <linuxppc-dev+bounces-5907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B88A2B09E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 19:22:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YplnV0W9sz3089;
	Fri,  7 Feb 2025 05:22:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738866142;
	cv=none; b=KZHn8R9cjRJjb/hzDwfd+Gtha4dPFpo4eoNdv/IFc08mCWtRI48nQC6NVXN9KMXVJ0Nm1/z/WzXRhyzNk/wZPY4T4f+hlnCnrTd9APb8o3O+zH0RwxeZD79N9rzlvkl0+PlPD8vhm/urr5q9/yoaD9nS8Ofen9pXPb8HC+6BdAtag/Bfl07EgZACfHLRq2fY0Ew20iFLHRH42A9mo7xlPlf7dwOITcKSl5zncn4FV2fB28UtNbIi9iC3dCvNqqWxYv47DLYSb90mJJFgm/2Msk/lLjTrRETGCDfAv8KnkT49kXRo1WpBYMDhQ2zmE4Gy6Rp6I6B07maD14I+gwLYPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738866142; c=relaxed/relaxed;
	bh=LRwETV/iLFtR/2LHzH+aFMI38YMZRd4xypTzTICAxBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPvxWuVrtVd4Gtpl2BsNmfGkiZlCHapKa3zr2QK19DelPJwpflWyaQ4vyUE8yr5nfCtDmsKONLO3kCYiKzbgAIX5w35NVmX0RaPWSz/sa6UHnpA7gCA7BWHIS+cmT3r/jcLwRSsDBIk+U8rZuK4Cd65YtggkMDYYpLh0i+aihnYRkpfwqkihOiSFcgsr2FZPAywjTedbHz/LGYhUKkViSb9PSFDJfgxDdxM0GzEQ4ey/VgSuHzpJqS78fLrJ3MBze5ey1dZaJfwYQZqcapT38ZwiHV7/4Wd1OWu7VL49afNVrgv55VMx+M8HWjdraKNQTb/QE/XLnbWrMrdDjuZDfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NjEZqwpZ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d4DwtdVQ; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NjEZqwpZ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d4DwtdVQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YplnS671Sz3028
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 05:22:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738866136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LRwETV/iLFtR/2LHzH+aFMI38YMZRd4xypTzTICAxBU=;
	b=NjEZqwpZir1Or8mfsnGIZNqaSn6qYCDnKGB/V6DaBbc5bcIDcA+jvfMD7s/aT7lFqw2jH8
	aTRLiahsBkOcEeoRLQpnUHDPorImY4yKeW5R1vZWvOrQYGzjgs+4VNtB4QRrE9wNUfqm3T
	8iRWwq/vdNBjQrtI3qaZu14piUyVdis=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738866137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LRwETV/iLFtR/2LHzH+aFMI38YMZRd4xypTzTICAxBU=;
	b=d4DwtdVQl5gXldAiR5l57Lr0fZN2fKrZBreVPd07luC5aENxyMMYg+RRhYT0AKStucdFuE
	WkgWGvqqMzB+sL9KTQoL0sp1CKWBMI9M/wfZBMPo1N9VEnoArnWHhL2ZhjTpgjFUH8tlFM
	AWeII7QCXhm5X+JuuavbzSvJM+ft7dM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-oVLYnzI-MyWyoPznI6OqrQ-1; Thu, 06 Feb 2025 13:22:15 -0500
X-MC-Unique: oVLYnzI-MyWyoPznI6OqrQ-1
X-Mimecast-MFC-AGG-ID: oVLYnzI-MyWyoPznI6OqrQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43626224274so7397375e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2025 10:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866134; x=1739470934;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LRwETV/iLFtR/2LHzH+aFMI38YMZRd4xypTzTICAxBU=;
        b=dKLTsfcGK2RNBASsljcJjMpow5cR2fO3c5XSmWx+l1ml7nAMG05uQ6tPBPqTRloRQr
         nypo1MSeLuXNUKetTPDEx6vVGD2vyfohjGEtJcN5LPBaqPcuDnj0clsy3QsYxQOVHnNx
         SfGwqhj9yiE7meZdaIXr1QGCjKR5Ypox3caHQ6lUUM3B2BbXkzvECP7gIKDAeOenpgw7
         nR66LuMtnSykL2BLwCwfW8ravW/BIUgm798tyyxLSDO/Oc0SK5ibVPEcqgjJlO/SX07V
         WdThyN/TXw1I5X8urWCOkwmXIUf5T2LEwHGI7R5hWO2Dbx97fXIi8nrF1OndVvdTFClt
         unTA==
X-Forwarded-Encrypted: i=1; AJvYcCWFgqpIfLimGUowhKXF8BByAKTz1jgJdqPp/ECCos+pLv8r4sQAuyrcW3olhSg+twJIDSulqbSosSp3ODA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywp+LyGTAdQwzYSs1eyTA+XgctrkeLM2rBiYucKDegAVi8HJ2wp
	LM0dX/6OtmzAMoCz/FQdvI5GMEzE594Q+YVNwc9Eq4hfdY4YxzOCLVZLgm73JJtR4OCubIYLgus
	VsWoEsVY70VtyH2RFX29n5PjTFFkaVEdwAie/79U4UzTgvVRbQoXetOh044znPCI=
X-Gm-Gg: ASbGncs2ryG5c8T554rPIQ2NtUNHBpBJ4swdtGn9pTLhsIz09sPpINf4NjoKh/1IaXA
	ueHglwqnBU/jxL/QDzo87/fxUU42NJUtvcLJqREAmQ1uo6AKMG765hmz6MOvn8pIAJwb42OyKTh
	huKXfZ9ckjPAm+c3wFOwDdV1fABxFjvba6wPfDK34SVP9Vh3ooW2yeSCwDsSOSc217GASFqvDVC
	oIG/EKuVmJN8lQnR2N0jPH40St/WQ42+xMmnGIzH9J3g3/TfDmr6W/LQ7aj5HjFpUAVniRRHKzW
	5QnY2Qloh1dyvtk5GCqFvFeO8h9ZMitAZGcidGpM8He3Ad37YyiILTl9+V17kxy6Pho3rjpj07l
	RPVxkG6Yk2Z0fSzhD03YB4LkOlr47EKQO
X-Received: by 2002:a05:600c:5492:b0:438:a214:52f4 with SMTP id 5b1f17b1804b1-439249c3836mr3041855e9.25.1738866134140;
        Thu, 06 Feb 2025 10:22:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJsOu7BlThZM7jjX1u3bd1XUgT/ofkklDz8h7wnTYaw9b+KwJ+b24h6IY929fci0j6pQ/Akw==
X-Received: by 2002:a05:600c:5492:b0:438:a214:52f4 with SMTP id 5b1f17b1804b1-439249c3836mr3041485e9.25.1738866133723;
        Thu, 06 Feb 2025 10:22:13 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:3000:a06b:56f1:d152:db83? (p200300cbc7073000a06b56f1d152db83.dip0.t-ipconnect.de. [2003:cb:c707:3000:a06b:56f1:d152:db83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d93369fsm63771175e9.3.2025.02.06.10.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 10:22:12 -0800 (PST)
Message-ID: <e1630046-8889-4452-9f8f-07695ba07772@redhat.com>
Date: Thu, 6 Feb 2025 19:22:09 +0100
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
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
To: Albert Esteve <aesteve@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, alison.schofield@intel.com, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev, Hanna Czenczek <hreitz@redhat.com>,
 German Maglione <gmaglione@redhat.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
 <Z6NhkR8ZEso4F-Wx@redhat.com>
 <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
 <Z6S7A-51SdPco_3Z@redhat.com> <20250206143032.GA400591@fedora>
 <CADSE00+2o5Ma0W6FBLHwpUaKut9Tf74GKLCU-377qgxr08EeoQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CADSE00+2o5Ma0W6FBLHwpUaKut9Tf74GKLCU-377qgxr08EeoQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TydxZalgEH4vvyNnJV4nTZA94iF-eGghH-cBc6KqC-A_1738866134
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 06.02.25 15:59, Albert Esteve wrote:
> Hi!
> 
> On Thu, Feb 6, 2025 at 3:30 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>
>> On Thu, Feb 06, 2025 at 08:37:07AM -0500, Vivek Goyal wrote:
>>> And then there are challenges at QEMU level. virtiofsd needs additional
>>> vhost-user commands to implement DAX and these never went upstream in
>>> QEMU. I hope these challenges are sorted at some point of time.
>>
>> Albert Esteve has been working on QEMU support:
>> https://lore.kernel.org/qemu-devel/20240912145335.129447-1-aesteve@redhat.com/
>>
>> He has a viable solution. I think the remaining issue is how to best
>> structure the memory regions. The reason for slow progress is not
>> because it can't be done, it's probably just because this is a
>> background task.
> 
> It is partially that, indeed. But what has me blocked for now on posting the
> next version is that I was reworking a bit the MMAP strategy.
> Following David comments, I am relying more on RAMBlocks and
> subregions for mmaps. But this turned out more difficult than anticipated.

Yeah, if that turns out to be too painful, we could start with the 
previous approach and work on that later. I also did not expect that to 
become that complicated.

-- 
Cheers,

David / dhildenb


