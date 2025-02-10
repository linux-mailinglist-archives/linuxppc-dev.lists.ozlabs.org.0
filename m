Return-Path: <linuxppc-dev+bounces-6050-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B785DA2F786
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 19:43:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsD443QV1z30TQ;
	Tue, 11 Feb 2025 05:43:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739213012;
	cv=none; b=cNAet37+KBUCROs0RaJ1cTWrl8sFP+OOzfODa+naW83eYR88NgV+JFygyCsyZjrzUZjr+YGZxYcu76PjoAzHbyMVY7sHDjBfHUJb7k2WzFAuFQuowe4IhYQeZW5cY7dam2vlDMx/iXN0DcLTASB2KSqQn7M6le5nBnrICLrTiypN4KcFv8EI4V5P4IV2ig4n4XoCRpUruWjt9tmVKLzVy8WuwGcLqOlK3HR9XCGB913bU6fetQYrZgD5V63ly+hyUBL2RNI4CKWlTXWPFoJfIR6FxR9878xlFHBx4nLbp6n8ILztnW8OTTWntXmClJPycWUSWHFGRccGbd7Mali9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739213012; c=relaxed/relaxed;
	bh=HyPCciy90tVW6T2lcHcuWFhDLKyw85xuvM/qhIPk9VI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJw5j3NgPSeW+v7R+11alR9tg0Wn3ga3MxJeExXgwNrFa126DOaDK4RB7CW0c29ew2neLJOIwwBcPIr1uYw8xJETOhrVyP4f6PShVxI2VKYBHvlZpC5i/GTOkArGTYLwPZqppDOh32VjDjvx6j/U+y6xjV5prrTPV6HyVMfLgpqy9VTYnJkjGmjjqdPk9IwkX6aRyyLB6gLMk0qVyq0plL+JlvsicaErCwriBuWNWULjjVE0vVRFj8qxiFyiKKk3kloxuZzFUoFn9lSxL4DD9D12K//osQp0kDwmN3F/9NNnGUxfCCFAEUmFXF2zcDSedcHU2b+KW77Ybm9r0m+x5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=igTIMuiw; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UzKUjGcS; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=igTIMuiw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UzKUjGcS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsD4349KSz3054
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 05:43:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739213007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HyPCciy90tVW6T2lcHcuWFhDLKyw85xuvM/qhIPk9VI=;
	b=igTIMuiwl3wIhJ5uWJe2j1RMDWe9DzrhjQoKHAoRBL9S7BBJpFNFeIAIdaNdA/3Ppz/lZG
	o5xqR9KwQrckVNZIoXYA9IVWY4jPWd+T2WB9r2CadcQ9FouzMTXEYf6pn/Y6wxceMeJcjN
	R6V1darc5zFpzVgMNdCJey1UgnxVFNI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739213008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HyPCciy90tVW6T2lcHcuWFhDLKyw85xuvM/qhIPk9VI=;
	b=UzKUjGcSiBZiuGT9qc/scOZ4tpd8JhQwKhxi6o7Hml0oJ6bUnzojR9a8biuumhe0qH/x1X
	AAQFlgrfBHSxuZRs8UOKZxVLW8WgRtf9+a8/+g7iDlzsi06YbNR3+Y7/oAc/B3FBIkHsSx
	mo+/DChSEm/i7EM6kbHchgC5CEYFufU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-cZPyom4iM86Brc2pktLitA-1; Mon, 10 Feb 2025 13:43:26 -0500
X-MC-Unique: cZPyom4iM86Brc2pktLitA-1
X-Mimecast-MFC-AGG-ID: cZPyom4iM86Brc2pktLitA
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so7244405e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 10:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213005; x=1739817805;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HyPCciy90tVW6T2lcHcuWFhDLKyw85xuvM/qhIPk9VI=;
        b=X5Np7mzmNXUnTnKZufYsPc0yJjWAWyaOE1nUtvQnkEZwKOCkVJ75ihbcrRfz2YNtHh
         bLzLQWdVdaCGnJb5GwdW+CJ4uIrpe+WlLw/xQuElxlw/b+j/Fzmq5IEA0iO+cJW7OnrK
         jWL4/OozrIwom7LRUXmBpMmrKe7Z0jS+joTSx9CVnsFiNgkB5Gt9A28CrB8sp48AtTeq
         QfRzzhQAqry419R5KunYvCJVSluLy0FIbmo0kYvx0Xe/7kWaLGYG9e2kNoFWXg0ByVWt
         2br4WIWA18aSgA7Sat9leymRqfbzokg0swD6tGN/2oT2MWx5az1w3hfsuSGKgdIQj1f7
         FKNA==
X-Forwarded-Encrypted: i=1; AJvYcCVpqzeyyu6OFzA6Rfu9VI5N6CEUPw0WXJgikyYqFcqjfQwTqPDpdVtds+gqDcKwcsyGWOGHyVCpn9qz6YU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEaGSVOY9SjqAntqRR9HR/WRrbEnGW7DhpA1yCbdUWQlNVLz0w
	t8WqZtokWuWTc5+s66JD5Vq6JBsnE2StzvnNZfhm5UmZxopOSxjncqNl1F08QLrHzdJyd2SXzeM
	IOvOjXUbK09jQ3e9hKSVt9e53ZNAkNEByEbFNZqNsHFmDm8bI2q3p31tQaWaOEi8=
X-Gm-Gg: ASbGncvyE8QSou5EkAGDNg1fH5cIsxAmcYzE/pOl7m+tseODpGoiCbkJ78QxywEK4Iz
	XNz0Dl+HRAFblX3PzHqkjRwZlmnMZYda94D3b2zTsxdVOa0+Rj1E10BzvRsddEalppzu4NWlSNI
	Z9e/faveWxMstVXRmrYRrRvXnd2hdG/eFu2NKlLsvD36h5YdXyBURMxFv3fkz51gogkyanrC0Ae
	4W49G+sALuSsKhQThmpjgiNN03OYzSQinF+8DpKuWWryrNSdhyCgmkfNGlfrBSXUY+9WQID8vl4
	VvB5OK+gxSmvtz2o2rgkBolOnEDuZ77RQBvbQiXN3h7ta5LPorDMQAyAKVJvQH2ZX90xsow5ztC
	I2aMpJOYrd5vsaLw+mUMUK5EY2agedzoS
X-Received: by 2002:a05:600c:1c25:b0:439:41dd:c066 with SMTP id 5b1f17b1804b1-43941ddc1f0mr58352405e9.31.1739213005125;
        Mon, 10 Feb 2025 10:43:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzpaPXHrmO8a6oz7FN6p5yKvrmK4zLskiJi4ioSu4niVqT7krVP8gCmrI1SDPa3yDqdwKozQ==
X-Received: by 2002:a05:600c:1c25:b0:439:41dd:c066 with SMTP id 5b1f17b1804b1-43941ddc1f0mr58351885e9.31.1739213004744;
        Mon, 10 Feb 2025 10:43:24 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:b800:12c4:65cd:348a:aee6? (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13124217f8f.90.2025.02.10.10.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:43:23 -0800 (PST)
Message-ID: <ff5af15f-8f9b-4ddf-88d2-5bab52449399@redhat.com>
Date: Mon, 10 Feb 2025 19:43:20 +0100
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
Subject: Re: [PATCH v7 15/20] huge_memory: Add vmf_insert_folio_pud()
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: Alison Schofield <alison.schofield@intel.com>, lina@asahilina.net,
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
 loongarch@lists.linux.dev
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
 <ef0f8d6a6fd340531613c351c99c98fd6f94ad93.1738709036.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ef0f8d6a6fd340531613c351c99c98fd6f94ad93.1738709036.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: acEVCtOdjZh2eTmfUpS89L03fw8C1ej4QKxNM5MVjAE_1739213005
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 04.02.25 23:48, Alistair Popple wrote:
> Currently DAX folio/page reference counts are managed differently to
> normal pages. To allow these to be managed the same as normal pages
> introduce vmf_insert_folio_pud. This will map the entire PUD-sized folio
> and take references as it would for a normally mapped page.
> 
> This is distinct from the current mechanism, vmf_insert_pfn_pud, which
> simply inserts a special devmap PUD entry into the page table without
> holding a reference to the page for the mapping.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> 

Nit: patch subject should start with "mm/huge_memory:"

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


