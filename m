Return-Path: <linuxppc-dev+bounces-4276-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4809F5984
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 23:28:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCWfn6pYxz2ypD;
	Wed, 18 Dec 2024 09:28:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734474497;
	cv=none; b=T9dzlS96S3aIvtVBsIOuBlV1+K7I0oQB7RPotJ6GydevxnUxK1FhyZ7weK+ai6OjyI7iPzT6cPbcln5fwQMlXjgLqR8FdnblOPKDDm/zHFx7gfqDCLCHY/m3gN4/Ung9vGLKlDL6ngm8aU0tFrmyRSJFXDvOyo2KfErJP2S/dLoHuqDMiGBZvqc4jAplDC3M6qhby9qWrHEP005bEVk8sQrEFqC2LK+WOtbTbDRLYTeiBBHRZJKuiupK6sXWjSrz3lv7+mOyoJtt/aNgPRzY54V8RarNYdImLO3J1tZIvP1peeeAnKcy1YSseFyrLeYBnubKiwNBjR70kLevuASrAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734474497; c=relaxed/relaxed;
	bh=SuUiDwN6JN9Q+rjTOZSr/qEq0VeE7EPwHe1HzzH1/V8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQmefiVZAt4swUAPAGC7Oeq1eNt/gi5kHiHXOfFKr2HDjbLGMA9i3X3xKVa047fU8aKac02ki6S2TE2a/lN2e+iwDiVIXrCfZ4HrkuBDcBAC3da84Dz5qo7ywr795DoA1aWBPrDPaoNmPlDTVRieE7OV2xUagM5nNl9QQNQTpSATcO7kurE3+H/pOSj6i1nQoQmKdZlXrhnRdftMqc6im5f2+dUcME+XY+etfCHCEGklVcSGVwOewn8pGMhYDsMWDjB/VY+HfT3IwIzVPz5LjJM7EsJU2bnqZ0X4ukhn3tTFtNuP3rHiq5Hu8tZ4gp79TyazQqdjFLYukdHiILBHBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OD2mQyA1; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OD2mQyA1; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OD2mQyA1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OD2mQyA1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCWfm6GXQz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 09:28:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734474493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SuUiDwN6JN9Q+rjTOZSr/qEq0VeE7EPwHe1HzzH1/V8=;
	b=OD2mQyA1DaVM3ExrHxU1/KSAV/gcN7DYqnUXDpfD8DXu/iqCVFKR/hhdGKtUUiDsPdNz8E
	g+KNOtCF+NGC97uOnBaPQ7wzw6HgHreryZgibI97diiTDRd88JI45pzrEQPFhD6N8kOD6j
	+XhnPH7M9QjenDLLElF5oXT66q7TVwk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734474493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SuUiDwN6JN9Q+rjTOZSr/qEq0VeE7EPwHe1HzzH1/V8=;
	b=OD2mQyA1DaVM3ExrHxU1/KSAV/gcN7DYqnUXDpfD8DXu/iqCVFKR/hhdGKtUUiDsPdNz8E
	g+KNOtCF+NGC97uOnBaPQ7wzw6HgHreryZgibI97diiTDRd88JI45pzrEQPFhD6N8kOD6j
	+XhnPH7M9QjenDLLElF5oXT66q7TVwk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-0K0SquLzMLu2GfKUA651uA-1; Tue, 17 Dec 2024 17:28:12 -0500
X-MC-Unique: 0K0SquLzMLu2GfKUA651uA-1
X-Mimecast-MFC-AGG-ID: 0K0SquLzMLu2GfKUA651uA
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385e9c69929so2427998f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 14:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734474491; x=1735079291;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SuUiDwN6JN9Q+rjTOZSr/qEq0VeE7EPwHe1HzzH1/V8=;
        b=tNwR4H7p+kFRr+E+0VmxF0r61KAf7dD4tWnh0E4cbK9kcdIguzazOUoWKP7c6O440B
         MN468F+8YOeW1PtV0BcOuohkpr5NS1H8A0NGZRY2YL3IPEEqOvAg97Cr2AWbwpZy6DsS
         KGeBEZZ13VjuGmZfmLsS8jsaP6Rl6jqm5KH2wsQMr0u7xbA96apSljIkZlVRclGCkfvA
         JFQAkfXJC6A0m+pfQ6Z49ueYewEEhKSzvqhCHzmIYqIXVX9ZMXsfjkQ2VNtoP1OhVK4F
         +N2FEcSwCuXHKQagv2FKTk79vttDmQsNdQjA6wfUfz7d2quoFHCnhpMVBlSDl3ztFQPW
         DLUg==
X-Forwarded-Encrypted: i=1; AJvYcCVUT7oleStXavnFdQlROGPgctqpwKzR1YBUsPFVP5i/DK6QemLTryTk/PzToWbkd6HXbh6tHpzWRelkaA0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSDbcmprPd6AxYI+Yqaow9A2qp9D9FGYc7mmECy15KCsFIxxMw
	24QmtRwmXihBuxFzdh9TM7gqSg8QfamIbyOmR+Se4LqZpokgYpxqgv3oa6AFFP1yJilYjE2c44c
	kygbPZafLqg1TGMl42jjMA2Trce+BknPlfOZt0RZgMIDCXfADXyetm/rMH6syMZk=
X-Gm-Gg: ASbGncsPaZKu1ucERQmDPHWr57nH4dEtCvzTLDV4Km1bq1aIWLDoELE2/kMPFPQ6C1F
	xRY6zLc6HBgDctvTTxiQ4J8kcYc+B8y3hQon4IdJ9WurzJhVHrZgg0ZQ6MPXcbISS5ubwzNglAC
	oPYMlklx/6cOasWOoSFBLQV8G8etrkoZyLQqwVZcRF7LBCve1Auny020ZsnWThKMffozWYyNvqm
	FUJtK47EIAFnS4I+S3mbFCreJalVFxjR6n7gRwxv6TooUVnp4zI1zrRH/b+0Pg1+H6LJs3VP0h9
	ALPnpeb/uYNDfC+uaxvzBviOrNoYiIcNzHchXObg/puMX8GHrwOprF/ttDxmwBz23DYwOXTINYE
	yLKHvRiSu
X-Received: by 2002:a05:6000:4a06:b0:388:c7c2:5bdb with SMTP id ffacd0b85a97d-388e4d6bc86mr490211f8f.2.1734474490926;
        Tue, 17 Dec 2024 14:28:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvTFVi7q0TnTvpbrbppzv+CwZ1GXbtoatrg/I2tIqfy/l4JTDnozGATbxCSGEYBCYXlyagPA==
X-Received: by 2002:a05:6000:4a06:b0:388:c7c2:5bdb with SMTP id ffacd0b85a97d-388e4d6bc86mr490194f8f.2.1734474490540;
        Tue, 17 Dec 2024 14:28:10 -0800 (PST)
Received: from ?IPV6:2003:cb:c73b:5600:c716:d8e0:609d:ae92? (p200300cbc73b5600c716d8e0609dae92.dip0.t-ipconnect.de. [2003:cb:c73b:5600:c716:d8e0:609d:ae92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801af46sm12218432f8f.61.2024.12.17.14.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 14:28:09 -0800 (PST)
Message-ID: <b5111052-4bc2-481c-8510-c1b86c70bf30@redhat.com>
Date: Tue, 17 Dec 2024 23:28:06 +0100
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
Subject: Re: [PATCH v4 20/25] mm/mlock: Skip ZONE_DEVICE PMDs during mlock
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
 david@fromorbit.com
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
 <e1fe10474fc06aaf24b17fcd916efffcc8c13f78.1734407924.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e1fe10474fc06aaf24b17fcd916efffcc8c13f78.1734407924.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4qwFhpaggps-h3TFzkRB4fAl85OlMfirdMuvN-O6AC4_1734474491
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 17.12.24 06:13, Alistair Popple wrote:
> At present mlock skips ptes mapping ZONE_DEVICE pages. A future change
> to remove pmd_devmap will allow pmd_trans_huge_lock() to return
> ZONE_DEVICE folios so make sure we continue to skip those.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>   mm/mlock.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/mm/mlock.c b/mm/mlock.c
> index cde076f..3cb72b5 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -368,6 +368,8 @@ static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
>   		if (is_huge_zero_pmd(*pmd))
>   			goto out;
>   		folio = pmd_folio(*pmd);
> +		if (folio_is_zone_device(folio))
> +			goto out;
>   		if (vma->vm_flags & VM_LOCKED)
>   			mlock_folio(folio);
>   		else

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


