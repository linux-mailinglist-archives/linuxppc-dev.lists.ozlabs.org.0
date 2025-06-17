Return-Path: <linuxppc-dev+bounces-9419-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 444D6ADC6BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jun 2025 11:37:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bM1xh6kWPz30GV;
	Tue, 17 Jun 2025 19:37:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750153064;
	cv=none; b=GdFMw56IOg+Dsku/CxL4728GdWWCU3g/Cey81pDB17+OmSF4QK+iBtDlqkeJTOqpnU+1reZHjsSDDYaLmfwZB6nIwcqYyQ4zXz7pyshP7KVgOZCv37sHpippkl06kyUsMRdK5MaMqwxt7LmjNL99FTVsSM8tCwAZHtHIsAvLnwniUUOHhStPUvNQJQJq9+X2cNUbGT0Pi4AJwAAvtY62obkXzaI8pSRGFALCYTzH2mkZIPmdUkwPdubyDhfR+T6le94m68tz28B9G5A3aGmCKC+psE1Y3Rmqt+xELr8AwSBx5MYZp3W5YwQcLuBi3K7HkrEn5OAoSQiqJh6qmfNt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750153064; c=relaxed/relaxed;
	bh=2tVggpdHRMe70SNIVLjgFowvBJ62eIYbXphR2T3zCDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8JOiia9AaJ8r2Cj2IrTOkQ+5tFni4gBQl/9N/dBBtJ4gY4AzWrPM6gtoxWPrPkiZwm9G+291cRrxzmk/5/R2Rzpm5f6KVj2Lyj1w6V2k1UgTy7kK8XhnPvprL5ZXs1YcQvRhIB1CkORDjMloBeO1AvBmWR2RJlduHxbFI0Uf8tZ9WwVzzxnzH6nLOJ0QpBjsNzINH/GhHJmUi+19cqisjIpF4zqsL2HU7WhHY+Dsm0Gswc0xZV49L0wVFyBdxXV9T3LssFV4E3xscLewT1hMcreZ0L3EhGXHtVAJ4pEGzO6n89FyHLvJce39xhOzH0vbvZ8Znf/NSNagHddO2v6Vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PcsDhlyV; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PcsDhlyV; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PcsDhlyV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PcsDhlyV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bM1xh0pNqz2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 19:37:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2tVggpdHRMe70SNIVLjgFowvBJ62eIYbXphR2T3zCDQ=;
	b=PcsDhlyVvDorkmhP8uemET1+nb5ry+oepbX4PejvDmQD5bxIQk55Ka6kfk/Mv0rUhTDkQY
	q8FlvuPFuEg2kAGzM7CjS6GWG4fpE1KRBayUfCg5uRjpFueEJtuPkIqNVfqW8AACRSJRCY
	2ZwvWIGaoKqvcVOp7Yfl+uc7Dv0oZBY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2tVggpdHRMe70SNIVLjgFowvBJ62eIYbXphR2T3zCDQ=;
	b=PcsDhlyVvDorkmhP8uemET1+nb5ry+oepbX4PejvDmQD5bxIQk55Ka6kfk/Mv0rUhTDkQY
	q8FlvuPFuEg2kAGzM7CjS6GWG4fpE1KRBayUfCg5uRjpFueEJtuPkIqNVfqW8AACRSJRCY
	2ZwvWIGaoKqvcVOp7Yfl+uc7Dv0oZBY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-P6uybJjpOhCMPt6gaP5qLw-1; Tue, 17 Jun 2025 05:37:36 -0400
X-MC-Unique: P6uybJjpOhCMPt6gaP5qLw-1
X-Mimecast-MFC-AGG-ID: P6uybJjpOhCMPt6gaP5qLw_1750153056
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d244bfabso44594135e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 02:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153055; x=1750757855;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2tVggpdHRMe70SNIVLjgFowvBJ62eIYbXphR2T3zCDQ=;
        b=vnDtmHVQaL0guRHmrMe3L9AvhdUhwLgU/id/UmkLqgOXHivmbuwsL++0SINFgGvJGH
         nYnjr4nePZyxH4t315OsvpOzD3Q24ZzPBRNxdgb4GvVUImzIqMCYv+wCmLvij4FSIgF5
         GtBhHp6No8rWKf0MbarWIXVwZcNSsTaK0djeYQjh5PUYoZ7KrmzIBkCNFSEIqtowRh+j
         7pqmWa2sriWM3Te0FKH3pIHAHcluhfTnA1hW3Ru3xf/fMXcXT10p5p3WF+pEx/YERbXR
         UXlSA/Mwz717l5nHDaOydwjcQOeHADrmKv0dH2F0u7uEjrIbWwg6umoQagegj5zWM8Qd
         atkw==
X-Forwarded-Encrypted: i=1; AJvYcCWk/Ea6aJmiE/IQca+YCZsoedVZ21cyQlsLkbCKhHqmsVJ7WiOEs/nVZDVoMOfaPWho0Mh0fB1Rct3geOk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxrlHuxk3g1BVzyjTOh9ECrPUr3cLhw8CjIh5baL8E4k27bBH3y
	/ixTku+06QIwC+hTRyW6PFM68YLrDVIon7H38x/W7qyNUCCqU+4KgQlcuhQKxcRjjOhs21hIy8g
	ncTGEV+Efxt57wRp5K92EdvvOkz12/QvdhbnMHbmzRsGdLrjkkPlTRfy3CuQSJERU7IE=
X-Gm-Gg: ASbGncuv6d4ZIbyDK9az2yNBT1XubB8FykIabjz9JSMjMJkokary6VEmkNpVlG9xaAa
	oXO0p6Umua39xsP/6JIkJIqHqkpceE3oJTzoaTbZTDc5UAgX36zYcN+iy9RuWiqnmL+Ua2U6nGv
	TdxVMgJBUThLZLCwf8n5XjW88i45vuoAwm8vpdIDSDQri8saTv2U4ct/He9MkaFGsZh7MXy5K5m
	QBI/ZHbg/tO/ObevXjjESyAUZoh1hgipdaptjUVFhdgItT7yFuyMs+ZazAHbpJ8ygIj1Qr9aGJp
	SKGcJXprIGrn/Rdx+tk6zGhhFDX4xUf0Ps86YLvwJYhdNerugCMtqtvLokiRmx3m0EFZGYCU6+u
	YCTdnDD8z88f5Ctt/yxAeJTO7KBzAvrJbWEhnFqYyF+MO2RQ=
X-Received: by 2002:a05:600c:3587:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-4533cad1aa0mr127695205e9.31.1750153055591;
        Tue, 17 Jun 2025 02:37:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE33mK7aAFnuzBQX82pmdkrCA/cX+3l1nAlm3F6BLNfxNOkhwo9+uvgQ5HQNw5b5NLLg7ZP1w==
X-Received: by 2002:a05:600c:3587:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-4533cad1aa0mr127694505e9.31.1750153055045;
        Tue, 17 Jun 2025 02:37:35 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224888sm172776835e9.1.2025.06.17.02.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:37:34 -0700 (PDT)
Message-ID: <338a45b0-40dd-4c11-bbe8-a047559fb77c@redhat.com>
Date: Tue, 17 Jun 2025 11:37:32 +0200
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
Subject: Re: [PATCH v2 09/14] powerpc: Remove checks for devmap pages and
 PMDs/PUDs
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
 <818b2fb2f2cf7450ecdd698f2fa019aed3be7b85.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <818b2fb2f2cf7450ecdd698f2fa019aed3be7b85.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QZSQ39qrt2cGA82ou-CegYZHlyXFxP6Yg7QS6EudTBQ_1750153056
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
> PFN_DEV no longer exists. This means no devmap PMDs or PUDs will be
> created, so checking for them is redundant. Instead mappings of pages that
> would have previously returned true for pXd_devmap() will return true for
> pXd_trans_huge()
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


