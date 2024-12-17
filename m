Return-Path: <linuxppc-dev+bounces-4273-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 746C69F5947
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 23:06:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCW9r053qz2ynR;
	Wed, 18 Dec 2024 09:06:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734473199;
	cv=none; b=d3pq87pqwNApgH/JOBHUSxuJMORuR1Ahdvy/zQdAyeIHVuf9Uz+Ntwlw1W0RDP21S8AEH03jLfxKb1DRy+tDRX2ZOqjhRFyGpouy6nGOR0qhBXa6Bt3qPXeF740fGkyN3C4/KwUya+Rh2zSnZKkm+f1XIVMTnOLLL14/AwYNxUynQHEfrUOO/UlYDWChzDwvnU8TTWcZKVcLBf9wGStVkkz70YzmT30g+ZfAjqiSeYvMzWU25c6Wo2wkrXIiNZwYbbZbJ0fVif2jJJYveXeFTRC0nURO4XrwcRfBJNWIUXQwIr1czLnMHVL53KtaRPX8opMeKUuZ6dY8wNTYuSqyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734473199; c=relaxed/relaxed;
	bh=OSLYMoWvHcnkmKFurx8SkgSXyiJyqs7HoLAYTVGYrAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVHSiauWWu38ohoq7TT+NP8wwzPkfMV8axaYFJkTa4TFUzcfCPCanu8gDZFyuDq1FkNAhoGa8nsYr3mc2oqHFGtdvAqlW4WkX2RgnRac2YJ8JLlqaXv658IFU2UrKyUQVG9XY74LQ5oq/Fh9J7zWWrmxtLAwMjD5yOnoiBQscU4AGlWJAsCbP8MtW9FLd2JaApIXeq0x8nyGkyH9hUV7N97GZabtKfztmmqhSbybOnd/VKRXqhpEmknqkkNm5Srntujya5L3azdAMYKm+fp9aJolH/QvhNwpdZdbrJmiGuuFXre7dTxqBOG5eHftD+FvVy4LGebc0QcWEF52W357/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RUKkYYGn; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RUKkYYGn; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RUKkYYGn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RUKkYYGn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCW9p4tPPz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 09:06:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734473192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OSLYMoWvHcnkmKFurx8SkgSXyiJyqs7HoLAYTVGYrAc=;
	b=RUKkYYGn/7UaXt5bF7t1+2H11VTDxzrQhUHYkJgYogQJ1f/WHNY/YSWA+oSaKZmFsidbOS
	WyFzJ9j1n+XG/swLcxvJRgEaU09jz8+MpwOoP8AK+jDfC2LEmzh2T5xqJU91GlZBSGiml+
	5BSJB+5ZZoc3bgRqr4sTEGCIIcVybtg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734473192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OSLYMoWvHcnkmKFurx8SkgSXyiJyqs7HoLAYTVGYrAc=;
	b=RUKkYYGn/7UaXt5bF7t1+2H11VTDxzrQhUHYkJgYogQJ1f/WHNY/YSWA+oSaKZmFsidbOS
	WyFzJ9j1n+XG/swLcxvJRgEaU09jz8+MpwOoP8AK+jDfC2LEmzh2T5xqJU91GlZBSGiml+
	5BSJB+5ZZoc3bgRqr4sTEGCIIcVybtg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-YBSIL1S0MLCQPy1P_p_y-Q-1; Tue, 17 Dec 2024 17:06:29 -0500
X-MC-Unique: YBSIL1S0MLCQPy1P_p_y-Q-1
X-Mimecast-MFC-AGG-ID: YBSIL1S0MLCQPy1P_p_y-Q
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-386333ea577so2215434f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 14:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734473188; x=1735077988;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OSLYMoWvHcnkmKFurx8SkgSXyiJyqs7HoLAYTVGYrAc=;
        b=EYN7MAT4eK7Xevkvn9lD+/d4Q/Gji3lNjlgHyVqJLTkBg5O7FvGjU4mqZmbfQ//hzR
         mfuWla9QX9Hxn+HSuyKV3go+Slx95aY/aVlh97X6iGIsAw468eTyfp6SrjSzuy45M7A+
         Wy67OsLa77Gz6eZa2uqEV6DrdvqSKZrThcTtucV8fX+XNAk1Rs0qFGOyAr5cjLdriX+Z
         pgZsORHph4rZlnbSm3ttL1eKf1qMF3/iWyhyfveUbsJ0l60emw1lICYWK+fjeTrSQNW5
         q7j/M0YUrZ8KVqabp7Z1pbY4IyXL/i41Id6M9CLUBNZI8RGbEusH+fToTzz1UGb9gJ8I
         vrZA==
X-Forwarded-Encrypted: i=1; AJvYcCUSrqg8uoVvyQrZuhBvfHhVXQcYxnuaHMQ+d3W+7OWTnTLR5SkifgIZfz6zD99ReGeajETlaE1iSNQEobc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyt6Wta2ze/P4blvWUCb7kKlScLHcAhrN2r1scPCQ2I32Ng7Hq0
	3hLsA6wR+rBfUrU/xN0D6iiqnK4pyLM9CS/KUcyt3V45a6updw4L0OF2HeajMocBsYre8rUNren
	lFANJwvPDfqTqb03aGoJa579CmM1ga+x4THzQmd4m8ozKdDQeXEfJySPdAEKq6a0=
X-Gm-Gg: ASbGncufE0L5XZ5MJ/sigfIzI7FlWXTK5vG94Gkz0PZGYg96pOR/ya7OsSFgxQuUuUM
	klDlMD+EIkTVg71PtksrROFpuDcseV2DVIr0zoIXpufsWUPjwaHHdbiNJqcEHUWm6AFDgcpajGi
	eakq3RqDM8lydE3RLtf+88NgE/A6Xj5r+k+NSS/KBtqsDxz1DFSzbwXGcn7HPKd5nL1X+/9S4mF
	eHp+uKXMqBF7yy9+W85UIHcbpeS0z4tZaQzEbH5JW1IlkYXLz6NXUJwQwLVEDVgzQPz7WvkPG1d
	RAbsu2y8YbkIYpUDQNgoK2VR0EFXO3dzffHFgSa4vSDDwpogCRalLIKqD5isioZJFvbuB8dAZPV
	PO8hxYBKF
X-Received: by 2002:a05:6000:461a:b0:385:eecb:6f02 with SMTP id ffacd0b85a97d-388e4d8b688mr358672f8f.28.1734473188377;
        Tue, 17 Dec 2024 14:06:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEefTx+5wwgHu5Lo3QBynYxK4sBxxlYTWobNsuzYzh7kr1/3xagCl49eAlHDCo53GInNei+Aw==
X-Received: by 2002:a05:6000:461a:b0:385:eecb:6f02 with SMTP id ffacd0b85a97d-388e4d8b688mr358632f8f.28.1734473188043;
        Tue, 17 Dec 2024 14:06:28 -0800 (PST)
Received: from ?IPV6:2003:cb:c73b:5600:c716:d8e0:609d:ae92? (p200300cbc73b5600c716d8e0609dae92.dip0.t-ipconnect.de. [2003:cb:c73b:5600:c716:d8e0:609d:ae92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8012112sm12401862f8f.11.2024.12.17.14.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 14:06:27 -0800 (PST)
Message-ID: <ea6eda57-f150-47ea-97b8-fc8eeaf81bd3@redhat.com>
Date: Tue, 17 Dec 2024 23:06:25 +0100
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
Subject: Re: [PATCH v4 09/25] mm/gup.c: Remove redundant check for PCI P2PDMA
 page
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: lina@asahilina.net, zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
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
 david@fromorbit.com, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
 <3f20b8d258d4eb72e1eadd5926d892bc61f0e0d4.1734407924.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <3f20b8d258d4eb72e1eadd5926d892bc61f0e0d4.1734407924.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IdXG89pjqQSrFBX_HD8tKf-OdOklKdj3Si1h1gu_9hg_1734473188
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 17.12.24 06:12, Alistair Popple wrote:
> PCI P2PDMA pages are not mapped with pXX_devmap PTEs therefore the
> check in __gup_device_huge() is redundant. Remove it
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Dan Wiliams <dan.j.williams@intel.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---

Nit: patch subject should start with "mm/gup: ...".

-- 
Cheers,

David / dhildenb


