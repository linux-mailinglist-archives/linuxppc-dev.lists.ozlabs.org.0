Return-Path: <linuxppc-dev+bounces-9076-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5DEACAD7E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 13:45:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9sTr1RSNz2yMF;
	Mon,  2 Jun 2025 21:45:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748864720;
	cv=none; b=Ez9j5Cq18id6TZk/qJEo2kD+6lcTURprgmsbGk2E9UM1aReg2ugC4zXemkLm+3k0thvVT4Y7o1sGkh7rqFv0CwRpku1WUmpivPnmxYxERldVySCfbNLI8ipvDEtEQyMyFYrcJsKh3fwJOSqMDTwV0zDZtS7ZQlwvaArwLKqgOojFH9VPH8TkyqFohJMMOYcQsgRzT5QV4vVaswzMbca4F+hvMQDs8FE48obopHcBZ82oi35LNw+3A2gsRoPFKfIwT4dZJPAo2ISMh6SoxyDXkim52zzoMr/RqWKKsrIjBTvq1EtmRxLsdUKQtqCBRgptrBsQYIcfEq9Gq3dR5fkfJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748864720; c=relaxed/relaxed;
	bh=pluW0u/+xJd0eUGvzfkykomG6yjqcYSK31IZ33YVJmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muIm6DxW5Tahb154noEI03tRcal1/bCvGscPew2NzRJl9N2GhsX08dgLkrfqGeaqno7hGT65s8CNtqBfYg91n4vM/rgWeV2MCewrJtgqkznBFnX8jwPJvoxg0bHnFMKBsInTfTkoVhND01xkWUki8SDZAX4SkPNxbW9Ca8SpO+fXM2wVUmGKHALdhxq4aAndx3s4PxTpFGfxriGeITaYDXdJPEb2VxKd5VH1ufbYGnCRWi0nt5cklZe7I0JvIw+QnRkMYo6dIkfIpdY6+aNoZ1AiEsHFLIhwZe7EnlF936uUeX1EvJSEFyuwlb0HOlz75FVHEz2T8CcXIS87ZVTCTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bfoC5UCw; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bfoC5UCw; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bfoC5UCw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bfoC5UCw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9sTq14ySz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 21:45:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748864715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pluW0u/+xJd0eUGvzfkykomG6yjqcYSK31IZ33YVJmI=;
	b=bfoC5UCw8EBDqqiyeTjOllXYRBAFKxlOPkh3LkBRSvh4ZvdFOI8MhpK4j71vyk6Qn1q455
	/Q/wG7hmna5ul6xeTQOhGenQEIFljEAx1ZUlhOKHq1stWDaAcLRn4k/VgLRYcNQj1PtVjW
	7HZpXM1CkswDoNY/yHd7aixqrC1Q/Ac=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748864715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pluW0u/+xJd0eUGvzfkykomG6yjqcYSK31IZ33YVJmI=;
	b=bfoC5UCw8EBDqqiyeTjOllXYRBAFKxlOPkh3LkBRSvh4ZvdFOI8MhpK4j71vyk6Qn1q455
	/Q/wG7hmna5ul6xeTQOhGenQEIFljEAx1ZUlhOKHq1stWDaAcLRn4k/VgLRYcNQj1PtVjW
	7HZpXM1CkswDoNY/yHd7aixqrC1Q/Ac=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-g0IfGgKQOequchpU6nrSwg-1; Mon, 02 Jun 2025 07:45:13 -0400
X-MC-Unique: g0IfGgKQOequchpU6nrSwg-1
X-Mimecast-MFC-AGG-ID: g0IfGgKQOequchpU6nrSwg_1748864712
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451deff247cso2668235e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Jun 2025 04:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748864712; x=1749469512;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pluW0u/+xJd0eUGvzfkykomG6yjqcYSK31IZ33YVJmI=;
        b=j+9u5vJppzgNPMBw63zyjG5cXWosTKDFNECf/59PX0fWXIUukXaAehGnkSR0j9kaRk
         94wTdNGkBBcBhI3xa17pSg4svPTF5UvgEP3xzyoyGrd05leplXKM2S4y9NtIoYyEtAlM
         7CABILFDAD0KGjJB0q2rx43On4/X4QF4n8XPB47kRwa+mEJCvbtDnL4qMASG5bay4Wzu
         SwXA0knOKqZqHDo/OTtXvPg0uhIUh1EXby9ScQUSvF3y6jxcT2fHGACNIX8t+tIFRjrc
         aN7pUapkGbjoayBNccMO2eHBOE7v2JAP1hYCsbBAKEvCe/josmC80jxNq0GSRuDGTDnr
         35zg==
X-Forwarded-Encrypted: i=1; AJvYcCW7myPNPE7JAkZY7G2oZc2tLZq4HpimwculGN/4DmEq007WJ1VZHXpmENKXEWfX6PT4w8jSbQS78T8ddwo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxoBGohaYu065QWO4QzTysXydsIgdFYWQvGXeo6b30xkzxdaTet
	UrB2uvRMRJEzt6CcX2iyzYRsU0jiwc9gwWRtkbuQ6A+E1NleUKMHdkGXyIEbRnSEYjINdpQvUy5
	VVEAFgEK+Y2pyKD4lKoaTyCmrbNMGyGDQmDa0ntCmz9WM+QRun6q8Yk7nMmka+82W2T4=
X-Gm-Gg: ASbGncvXJl8GURPPckCUNC3IVd8UJ/zK+hGW9m7RHoUCWK3wIkWSYOaXqK/eKRYcf49
	jm+z8mIpS9WXtdou4Fp/7ho+n7xfeijpzFOe6z3l3WwKxCiLrAKmIaoG8fXJ6swPO2QPTkFA+3B
	8VESXXOzzJJzIk83NT19IwORaDnahB62H1gGqr2f5vyV6d1grU6APwtVYHTFAjA4UHfjoBheEEK
	1aOlAzWXOlZP/3qxtAQ7uR4to7R+7d0/s4bLppJFSzoF1xjimBAJMSRor5yNDC74qgR4oMTs+pm
	g56MCzcr/DKOnR4b34HRUBdr195f9qB4OzP8fCFsbgAYfFV1tOmsw8gWvdLUPkeFGSeRDaIKOIU
	PpkGWnTuQ+5qBoJr4LMwG0dgCYMNP/VLig8lr0YU=
X-Received: by 2002:a05:600c:3555:b0:450:cabc:a6c6 with SMTP id 5b1f17b1804b1-450d6bbb899mr123242635e9.15.1748864712259;
        Mon, 02 Jun 2025 04:45:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNiWxj7ru1ZpdEa7TTYC+Mx0/zZsZQT6PVApBO3c8hzuU2D+iOpq+QjyaIBIup3raLJSW1Xg==
X-Received: by 2002:a05:600c:3555:b0:450:cabc:a6c6 with SMTP id 5b1f17b1804b1-450d6bbb899mr123242185e9.15.1748864711876;
        Mon, 02 Jun 2025 04:45:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f34:a300:1c2c:f35e:e8e5:488e? (p200300d82f34a3001c2cf35ee8e5488e.dip0.t-ipconnect.de. [2003:d8:2f34:a300:1c2c:f35e:e8e5:488e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f92585sm126373555e9.5.2025.06.02.04.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 04:45:11 -0700 (PDT)
Message-ID: <3327f886-e708-4229-a83f-2404f115d44b@redhat.com>
Date: Mon, 2 Jun 2025 13:45:09 +0200
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
Subject: Re: [PATCH 08/12] mm/khugepaged: Remove redundant pmd_devmap() check
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Cc: gerald.schaefer@linux.ibm.com, dan.j.williams@intel.com, jgg@ziepe.ca,
 willy@infradead.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2093b864560884a2a525d951a7cc20007da6b9b6.1748500293.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <2093b864560884a2a525d951a7cc20007da6b9b6.1748500293.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3IvScOF93pQantuibX9s5PhKvtyf5-mH2TR8PYAvgFw_1748864712
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29.05.25 08:32, Alistair Popple wrote:
> The only users of pmd_devmap were device dax and fs dax. The check for
> pmd_devmap() in check_pmd_state() is therefore redundant as callers
> explicitly check for is_zone_device_page(), so this check can be dropped.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


