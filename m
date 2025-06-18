Return-Path: <linuxppc-dev+bounces-9445-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54741ADE6F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 11:31:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMdlq1fqcz2xKN;
	Wed, 18 Jun 2025 19:31:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750239079;
	cv=none; b=aQ1Za++3RkPTU9Hj6SkGK1XHnJB4bqCN3IoK54/WuLDN5jKNibA9+f/f1QlhTic7eYIp290FcqiSaMI+Mym0w56HNduBLKmi2isUnB2b9qdV9/Fs+JbLL+dLwxY6k92L70BMOJYuKquOcsG6hLBBuXBwnsO9EQ9xoIKZ7qeWhejfOPKOfFvB1E1mN8dzL4xGFWOBaPkf+8rm2K6oP71TWYZdKoz29cTOQy5+jiAOhNbKxyLXlwdyYQKimBRtJ2nWsWNhkUYYBIXdOb09FOPBmJAa7i46McX1n8XfXFssKEa/O3ttLgviC2Opg5GJPRe3gzutBsrhAEA2BaXpRfAbGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750239079; c=relaxed/relaxed;
	bh=DAAxpkDR64hsnaI9Udos0W7mCWFzGT/DUlyAtDcPHQM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mfy3m1MJUz+KEOJhFJjry/SDnl58AGzKR1s+31hdSPzezeLgk+ZjiHBUoHZKB5gwOdJh34yYb3GSLS3jW6wP2qDwdpvMOZsdv3IU31lzOyz1BuMKgR/sMw8iMupr8ZoO6gaYfsoVvvzKn31P0Jg9xOEQSFuOJV66lsSII94tfbGBoOz1gyJN/EBmGg2Pel4B4OtO98bx3d1YrSo0Ujobf0Lw6ET+KXQf93xkOdh366DqRhHIwaw1QB8qQcOwER5ER9BrL8aMA0IzHfTV+7xKBII+yV4xiRyAA96/ebF2dg9hx7KRJIjXLWKMSBNJSMVpmKf4hMdYXG2I974h4w952A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XfRK2f6X; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XfRK2f6X; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XfRK2f6X;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XfRK2f6X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMdlk5ydgz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 19:31:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750239067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DAAxpkDR64hsnaI9Udos0W7mCWFzGT/DUlyAtDcPHQM=;
	b=XfRK2f6Xk0iT8cmMZXk815s0t3tgxz+oyOZWSVz+uW4+p+qa8jmYy4l02WoJfkmXsOZmMc
	VfXqBLUNi2O+68Kz2Kw9vK+lybCs/GkbBmwoKXuCyXpzBstruW6ad8lfns1w/mgLG1Hd2K
	Dy6GbhyvB+smAKK56F/oOL1WdRs77+I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750239067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DAAxpkDR64hsnaI9Udos0W7mCWFzGT/DUlyAtDcPHQM=;
	b=XfRK2f6Xk0iT8cmMZXk815s0t3tgxz+oyOZWSVz+uW4+p+qa8jmYy4l02WoJfkmXsOZmMc
	VfXqBLUNi2O+68Kz2Kw9vK+lybCs/GkbBmwoKXuCyXpzBstruW6ad8lfns1w/mgLG1Hd2K
	Dy6GbhyvB+smAKK56F/oOL1WdRs77+I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-VWliDLxPN-WPajmtowHhow-1; Wed, 18 Jun 2025 05:31:06 -0400
X-MC-Unique: VWliDLxPN-WPajmtowHhow-1
X-Mimecast-MFC-AGG-ID: VWliDLxPN-WPajmtowHhow_1750239065
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so42512115e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 02:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239065; x=1750843865;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DAAxpkDR64hsnaI9Udos0W7mCWFzGT/DUlyAtDcPHQM=;
        b=r/cr2d2VaxYru08EKPJM2sTzOBWzRSHmDwfHx8qJjIFyIC1sVmZAVuTEl6P1ML87ql
         HMwHGVkC2Ft+mXhcLbXKET8PmOEuT2p1rLSffTxvAaf/FwGaSWeHuRdU4lx0XCu+4QkB
         73d2Dmey83kN0OgSS2kwZdMrYGYIBA1eLHlt90e0n4UMOPRjpMvxV4cLcyPHF17efg6u
         sN94NhpNmR3v/tuS1LCLpGxgFcaIwizNSfbmsVcDzalmrmkBFMP+WLxB/XKBx6O/02qJ
         F2cP/ftmEX1+aiU9rYWokkqJu2bMAvNPnmKY+Zduy4c53tnshMdov09vd5PBc5M2T3f+
         HcBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnzBkAf9d1Ih6CgMv4XUU1jw5zgp9OqwkyMGm8XsnwUD4xIlQ2Bwhs+Msh0zv/7ndW7ShKACZaHyncZVA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwPcE9x+uHpsOP8C2dCHAqBbpvslAPqBP6FhnEGm9OPNVprJLfp
	4vJ+140pxlt9ff7i/923ICgfOtEy0nKB/HlESSLIEBFRJEbR7cW5rmFFGqvMmTyHXJ4Paw3pNRi
	iZkYyyx1l9uVI1Y5+6hqJwEQsh0LIZ/b18HszEHitXzfb/JJY95u7YZ92xdI2XcOpPMc=
X-Gm-Gg: ASbGncuv1ITmUp/CU+V1UqE/pJW/OZzmtcK3pZ2uKx+wJC/fPbYdlDOzh88yNnVV9/V
	3FMI5Z0/2Xcp7iWl4BdvJRLOU8TEJkKLLY/4HfOkAxJaXdHIeqeFefO0576C3ylihnXRI58uCQ0
	0646P+IrxV4DEh17DZlNx66Zc3x2Od5KCAYvblYksNx9Vy4bjm5dyVnA73cGKRp0pDTpBLJLGah
	X5GcInmMFdEGqd7+JFcKYFTKqLtENdamNaTwhTov/3IY8be3uTpJFm8UjaEq04NLy7WLUCxhX0r
	jnw4CgqLYqR6Ag3a3x92IEcZhbVwscX42HTl+egjald3MvR2h5VzcoOCtwJ27Xz44B9MKuvV9d/
	xUG3QP+yPTq+uFuUcHF6H4JIYgWX2Bj/+JmQHLcUmH7PxjUY=
X-Received: by 2002:a05:600c:5396:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-4533cac8fdbmr151178565e9.29.1750239064929;
        Wed, 18 Jun 2025 02:31:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFE2lmgl3UBomQIO41tOZKwEtVJWCPsqqDyTr4SmltEOYbKotteA+xAeGqRpDK/3zaPP374g==
X-Received: by 2002:a05:600c:5396:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-4533cac8fdbmr151178015e9.29.1750239064488;
        Wed, 18 Jun 2025 02:31:04 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a73845sm16606417f8f.35.2025.06.18.02.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 02:31:04 -0700 (PDT)
Message-ID: <051f769d-3a0e-409e-bd40-22000f10b986@redhat.com>
Date: Wed, 18 Jun 2025 11:31:02 +0200
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
Subject: Re: [PATCH v2 03/14] mm: Convert vmf_insert_mixed() from using
 pte_devmap to pte_special
From: David Hildenbrand <david@redhat.com>
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net,
 m.szyprowski@samsung.com, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <5c03174d2ea76f579e4675f5fab6277f5dd91be2.1750075065.git-series.apopple@nvidia.com>
 <1709a271-273b-4668-b813-648e5785e4e8@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1709a271-273b-4668-b813-648e5785e4e8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dLR8ZIZt9opRnEeG1flNj0324DzqML5-3U15FI7ylT0_1750239065
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17.06.25 11:49, David Hildenbrand wrote:
> On 16.06.25 13:58, Alistair Popple wrote:
>> DAX no longer requires device PTEs as it always has a ZONE_DEVICE page
>> associated with the PTE that can be reference counted normally. Other users
>> of pte_devmap are drivers that set PFN_DEV when calling vmf_insert_mixed()
>> which ensures vm_normal_page() returns NULL for these entries.
>>
>> There is no reason to distinguish these pte_devmap users so in order to
>> free up a PTE bit use pte_special instead for entries created with
>> vmf_insert_mixed(). This will ensure vm_normal_page() will continue to
>> return NULL for these pages.
>>
>> Architectures that don't support pte_special also don't support pte_devmap
>> so those will continue to rely on pfn_valid() to determine if the page can
>> be mapped.
>>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
>> ---

As Andrew notes offlined, there is no content here. I sent this by mistake
after replying to patch#6 instead.

-- 
Cheers,

David / dhildenb


