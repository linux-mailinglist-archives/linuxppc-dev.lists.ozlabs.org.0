Return-Path: <linuxppc-dev+bounces-9418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4CFADC6B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jun 2025 11:37:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bM1xM5zdjz30T3;
	Tue, 17 Jun 2025 19:37:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750153047;
	cv=none; b=LwuwT89AMMuaPUlx42QWJeafr3OUSSiW6xkksh+E0zZRHnQPWK2VLdoYZtU1vIiDIgliXPSbKlggfKEcXQgteAtwj+F+Rjj/RypSR4e5RTtu7RkndKybqXSKw8fJDxUFkBDk60Zicwff/ddEgaVZQiqxLKpDIDNCSW1K6uSthAE6ve4WrWmZrbd3OgD+mZzrl2K1L1j0yykaV+geNbje76VDCJqHiS2c9yPsex5KKOIXIGpMVpneheZFuuWkHNJ3Mzm5wJzN2qxSwQF4f2K9m6mjaZo5H+tIJYI0YNKyguTnlnB2YcO026/phDc5unYSfKMdm3oo09a4OSQKZk3EXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750153047; c=relaxed/relaxed;
	bh=0iZWBl/87jpgBtc7g8vCiBj8fMDtEnqMgq5VqeHe2b4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAjYNGAIl4AmsGGU/I93U6OU/4EVQPtHUS4O38LVD7cj2SrMG4IKdRUTi3a9zsTNOcW86LrwEhGmmGiheP5NtYgEgCqDbkIPh8B8JEVlaWe39B46FGT3pPuZW4zAiIJZf4NXNluCoukpJQzbcOjOhsC4m65TKDB/YJlejwasg1iB2kHUdox1qIBYxEZ4XLBWEFLTvYRU6mrcuX0YQNUdgFJHQmmouibUxaBIkFjnHx2fvSQBOHfvciAnukRSwtBlr51OGVQHDLY1Qs4xl2hQ8W1z6wn/fjzJWw3rlFkgAdvGrpF5lTg1jAVu/GP1MZQPdV6bava62ok2cFZgAig2dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C6L44K+v; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MtApeEyC; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C6L44K+v;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MtApeEyC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bM1xL73NHz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 19:37:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0iZWBl/87jpgBtc7g8vCiBj8fMDtEnqMgq5VqeHe2b4=;
	b=C6L44K+vYdCV4/wI/vb60z0usDouPyr6H6RyMXE22+hLj0+Z20o4ArXVc01cUuo3oSiysn
	yEE+kq0JuCeJ+rg3D3KXhvrBHc0Vm9K6xDYzvtHl+TsJ5kdrJBXJzfDxVhizpXt24jhwb/
	j5T8lwD46P9pQnB++RIDADmyzAH/NS8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0iZWBl/87jpgBtc7g8vCiBj8fMDtEnqMgq5VqeHe2b4=;
	b=MtApeEyCojhO+oxytgoKPQK9xoQBmfd+3UgBWGt7ZBaGGoQyY71uOYkCX8JPpeMoIJTfs8
	WfJClzx/MlDJp89yqiC3eerEf5i8aWHnuJ7y4lh85bcUxYICEMGKItbnnGSh4O8Rm21i4u
	4Jsa2LcVb6YLJpe9pHz0/cfM+Y5QcRU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-ZDbjdEoINFKWS-lLhCbaUA-1; Tue, 17 Jun 2025 05:37:21 -0400
X-MC-Unique: ZDbjdEoINFKWS-lLhCbaUA-1
X-Mimecast-MFC-AGG-ID: ZDbjdEoINFKWS-lLhCbaUA_1750153040
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a578958000so999468f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 02:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153040; x=1750757840;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0iZWBl/87jpgBtc7g8vCiBj8fMDtEnqMgq5VqeHe2b4=;
        b=wFI8pA6uyl3I5Yl7Pykt3gUPzx9qp2wTaRJfJVeoFAzKscXMJvBgenH17wHLbWFTkI
         9HtTkHyRXUWdik79vZG0m9hI8jVDMxKjsuE80BW9hFQpdiF4Q2cI+uveTAy2dHLSzixx
         NkyL8HE3JYozpD1Z+zrCjDdKevQeRibPPpTZGX7PTa1p4CpkmmM05wDmWClntQLb7sj4
         fKfU2X6Ozxie5Ur7Lat95nXyWiGV3svy8zSPdMO/oarxVSTqNvqk6m9odQ1vXcYtiDD2
         WGca3Kc7UZ2Uj4Gq05ZYII62OPPpxTRq7T1k0nFNggMlI8oQIdTzub2AP5iTGFizfmMi
         KP0g==
X-Forwarded-Encrypted: i=1; AJvYcCUgv5Qdx5tSm6BEbm+/MFZE2nQJfwZAAhnDO/+MfwLLmnVWDC1h7n401PY+Vi99usAgs2OfpQlZ0CZG9r4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlLrC4g7P+B6mw44NUgS7ofoZWxrTlGKiAW7jV4lj/J38N0PSY
	eW+bz2/9mAze8pVva/H6dxuENAIhYNHCmKW5z3PQuHUXDDIq/Ibr9BAmby2jLU5ud8uKsh7GplL
	Yr6dgIT9WqF1egB13k5Qvn7OhHYGlbVSisWOUrreotvIYWDASIEp3exoIaloxwAU5Jx4=
X-Gm-Gg: ASbGncuzCJ8bd9LM7nzHwm3GCQEqtTjdWzdyY/SG5NeTKkW2+UwZ7wr74A/xYcWYRvw
	vU5970TIQh1cRqrwTct2rvSSTM3d1sLMhCMo8I+WEmClksPeZ3rnZoWp2RDwjL0OTvpSR/RJfL0
	U6rxsVDzeK/raHXg2vgR3zYLx0chO6Rk2zdYDhpaXBx8PWewrd144zLYj0fMooAgPZXOJDK4T0N
	PZX6dQMX6Ceen5sUxDuoBXV7v9MIAc6sBE3gvS5PobV4y0YuZYpwkkI9srD22RlW70zR56Xb9I1
	w26mH5NboCPpcc7UsqKCVWGqQuCQaWARJLi2jrgdoZZRIQUvM9bto7UBW49ifP0kc/26O44P4Uu
	7mybWbcezl5i4Yy8FkTbGgqWpfTKWuTWmF3hlkncDUr4Ngy4=
X-Received: by 2002:a05:6000:2089:b0:3a5:2ec5:35b8 with SMTP id ffacd0b85a97d-3a572398cecmr9501307f8f.11.1750153039537;
        Tue, 17 Jun 2025 02:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn0r2S94rVo2KuanbuIlCONOQLmf7OLS7ZUZs7agOAWDn3Sa7W8ftax638hwNbov3D5qaGyQ==
X-Received: by 2002:a05:6000:2089:b0:3a5:2ec5:35b8 with SMTP id ffacd0b85a97d-3a572398cecmr9501261f8f.11.1750153038988;
        Tue, 17 Jun 2025 02:37:18 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c64esm175838425e9.7.2025.06.17.02.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:37:18 -0700 (PDT)
Message-ID: <d9fc2e4f-3a4d-4bf2-9a45-b4d890f2b0d8@redhat.com>
Date: Tue, 17 Jun 2025 11:37:16 +0200
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
Subject: Re: [PATCH v2 10/14] fs/dax: Remove FS_DAX_LIMITED config option
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
 m.szyprowski@samsung.com
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <bbade6a3154d14d958f5f9cf65fd6424897ec9c2.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bbade6a3154d14d958f5f9cf65fd6424897ec9c2.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Weet71ZBevgptKNHPFayasN2YOsnHKBElA8OcKYLxLs_1750153040
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 16.06.25 13:58, Alistair Popple wrote:
> The dcssblk driver was the last user of FS_DAX_LIMITED. That was marked
> broken by 653d7825c149 ("dcssblk: mark DAX broken, remove FS_DAX_LIMITED
> support") to allow removal of PFN_SPECIAL. However the FS_DAX_LIMITED
> config option itself was not removed, so do that now.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


