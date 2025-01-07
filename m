Return-Path: <linuxppc-dev+bounces-4766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34036A03DED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 12:37:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS8Ch51jrz30fn;
	Tue,  7 Jan 2025 22:37:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736249824;
	cv=none; b=lJEXXyQ0fPfcoO4ydZOd+qujYncysUpoKXRLYIDe3rj/E6Ek+LZhnfxLOi/1yEy9uPPFqMNb+C1ILs2TpVdQeqxAQzYexPLxokIRYvvsM8JpMMHpMYbhDNaRbLpsW7+7IviaxjtoVcQgpJwLvzK+YfrACH/34nsIEUhMhTOySA2TK9WXnLanaEHHRMjUZHvCEkDrvJZvV4MyD5g9V82K+glqeb46D5boKJ7ZBvEJwZhL2M3+9SNzcT9an0G9AeJQqj2kDojHgQrOmU5zFC4Nd/bNm34MrLKuHqrSyT/uoBJTxCFUCBHozvFawmdDrgBuhDcJsfXycWjQTuqwNnV0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736249824; c=relaxed/relaxed;
	bh=EPWLOfPPpQOf9nQB18V4X5aXAnWnhoDaHH+uIltQ4Xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXMHgcxK5f5WPx1HUDbZtUgpRzpoNOCc75GGPJbyfOkQJjtqCXdaS6P8UnRmq3sU56koafGksmD4u2+E2NB8V5hKqUGE7UwkeuxhBtKJL7lHls/LrsZZACHeHvePuGwod28aTfSJmTyAnUPuGEi4mvI1OAVebTi3Tnuc3u9JtVTkVKo1BWmfIWjW3+Yn5whciwpW/KMVoZ9j4yKZISdLUpzgDocUr/rNIXfT3uf4spJeYsW+/2Ba4Mi0861jgt9YE516Xkzd3y6b4bvzZG1TRLkJD63m/i+3jCpDvUkUyuedhjSAlyrUfKCrQXsMHzS/bhp0hSGFC+drnfoGvaInAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jtgof/lK; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQwpYemH; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jtgof/lK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQwpYemH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS8Cg3dFQz30dx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 22:37:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736249819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EPWLOfPPpQOf9nQB18V4X5aXAnWnhoDaHH+uIltQ4Xk=;
	b=Jtgof/lKu0Tm5zJLEbTAlesqcaGtffjwM+qeV0AhwIJ2JkSQUICatjuc10aA6Pw7iGb3WL
	7mSEKdF3YZZ3c40PhS5LyjgYo3a5gbRjMFkI0/OykqoxxAaO2ZWk5dOeeKDWqfFF8ZlfWj
	0zlYO7tW3u1JwvKtoeYt7U/7GOohbKw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736249820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EPWLOfPPpQOf9nQB18V4X5aXAnWnhoDaHH+uIltQ4Xk=;
	b=hQwpYemHpH+G+ymYnNCJNyKLFLBfDbCuJ9gTa44+KAiDOoyF+u0++NtO/bLq7d8I6jD+fd
	mpdKECDJi9aQl8Vq6uIosO+JN3S3bIwf3hPGTYkIl1X76LzklLxV6SIlhFpl/rXw4V3qEO
	xSkxxWBYfcovQki4qogvDp0GQ7DN2D8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-zEfqBZIFMRC21_6720xBPQ-1; Tue, 07 Jan 2025 06:36:57 -0500
X-MC-Unique: zEfqBZIFMRC21_6720xBPQ-1
X-Mimecast-MFC-AGG-ID: zEfqBZIFMRC21_6720xBPQ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38a35a65575so7284570f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 03:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249816; x=1736854616;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EPWLOfPPpQOf9nQB18V4X5aXAnWnhoDaHH+uIltQ4Xk=;
        b=rxabUrYG4T82s8Yayag64G0743ZrNxXzayWD4j0qLGgvLhIipVTU4RoFB3V8vj6RKn
         E713KZGnflepkEQ0ihheRg6Xeed/0vACpncAodFUIETc1fYtAD3ZhDfp/bmsOt9fGZ8x
         wqblDSgpfTc6JB9H+mjquKoMvoOj5DRO6/PFLDkTAYat1DQPmE/9Ez/OHSILgkbyD6WN
         pRXAu59RvZ8pbxfNfkYYyPo3TU3vVNCnEANnE+sp/McCWLFmp3qqTp2oI+ICOSBI8VKU
         ZFcT2zYRe/mhSGHK8b+GaOVhiFQeUyXHT3IKES4myw+1rGhqyUMlxQBF9cE00Au8CvxS
         OQVw==
X-Forwarded-Encrypted: i=1; AJvYcCUeFnKzpm3gL8k1M7YN8WFwJ4Asxynetn59aBL+rUCFWGbv9LQLv6asvI4dIP5wlpzLFAtPBk+KFoKC8QU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxU5Mb0Wm+/Qy8rc0g5emArgUTBPTjUVY6CdT/+rO/qMf/iCvBL
	kxh/YoV4ZM5B4+o8Ntxbc1GuLZkLrIy7IIqvEII6tzkJE75USFs/RKN6qZ+5ZkRN+/VoSAuWf2r
	GpTEaoIITISdtjn/sr8kIKerC1Oss+JUN31RfKI7IgVogjcsfNJvgMQQBYezXNlM=
X-Gm-Gg: ASbGncvoy7UNZFTrWgKnbEL9wGf7ampz8Ccy2bpzs8GVLBV50II6KGLijnyXqONIFs9
	/ESJNz5tr930aW67GqqNP2k/180MU209Z6K5gd93gVC2K+mKPF28sFFiH1huujkgfIb/45B9wpJ
	ulqN0+JzLkAxcYhcCyyFuaF4IyWBMx8bCx3FNWjXZTnNhBJ6wbmQHvCDRh1CFx11xkZg5XqTt33
	apiQxcpdvUDRuxRPG9wqHZgrsOxoCyTJBJoeVwLBWXL7/mJIs4JYCqbVeFCx3EI1G1R1HWt18/B
	zihjAlMY9/dBwnNbMpflfN3xJT79Iwkzib2+WcXwzskJWTR/7v6gNSGJh8F399gdYFxsfws7C2q
	dEz1zx2x8
X-Received: by 2002:a05:6000:704:b0:385:df2c:91b5 with SMTP id ffacd0b85a97d-38a2213d33emr54453851f8f.0.1736249816126;
        Tue, 07 Jan 2025 03:36:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaT18MaorKDc8f0dPQnq8Hx4Fd5WTGife38GGjyhvgZNdMgf0zcRP1rbdU6qLK3Zfzio44ww==
X-Received: by 2002:a05:6000:704:b0:385:df2c:91b5 with SMTP id ffacd0b85a97d-38a2213d33emr54453824f8f.0.1736249815752;
        Tue, 07 Jan 2025 03:36:55 -0800 (PST)
Received: from ?IPV6:2003:cb:c719:1700:56dc:6a88:b509:d3f3? (p200300cbc719170056dc6a88b509d3f3.dip0.t-ipconnect.de. [2003:cb:c719:1700:56dc:6a88:b509:d3f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8292f4sm51029779f8f.3.2025.01.07.03.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 03:36:55 -0800 (PST)
Message-ID: <758c0441-2cb9-41c4-bf70-c5810726779c@redhat.com>
Date: Tue, 7 Jan 2025 12:36:52 +0100
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
Subject: Re: [PATCH v5 14/25] rmap: Add support for PUD sized mappings to rmap
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
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
 <8830827577fec4c6c2a0135e338723a5b532a2ee.1736221254.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8830827577fec4c6c2a0135e338723a5b532a2ee.1736221254.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PEM7-C6Ha2DPkoI-WpKHgG449wPKloqJxDUbN-ni4BY_1736249816
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 07.01.25 04:42, Alistair Popple wrote:
> The rmap doesn't currently support adding a PUD mapping of a
> folio. This patch adds support for entire PUD mappings of folios,
> primarily to allow for more standard refcounting of device DAX
> folios. Currently DAX is the only user of this and it doesn't require
> support for partially mapped PUD-sized folios so we don't support for
> that for now.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> Changes for v5:
>   - Fixed accounting as suggested by David.
> 
> Changes for v4:
> 
>   - New for v4, split out rmap changes as suggested by David.
> ---
>   include/linux/rmap.h | 15 ++++++++++-
>   mm/rmap.c            | 65 ++++++++++++++++++++++++++++++++++++++++++---
>   2 files changed, 76 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index 683a040..7043914 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -192,6 +192,7 @@ typedef int __bitwise rmap_t;
>   enum rmap_level {
>   	RMAP_LEVEL_PTE = 0,
>   	RMAP_LEVEL_PMD,
> +	RMAP_LEVEL_PUD,
>   };
>   
>   static inline void __folio_rmap_sanity_checks(const struct folio *folio,
> @@ -228,6 +229,14 @@ static inline void __folio_rmap_sanity_checks(const struct folio *folio,
>   		VM_WARN_ON_FOLIO(folio_nr_pages(folio) != HPAGE_PMD_NR, folio);
>   		VM_WARN_ON_FOLIO(nr_pages != HPAGE_PMD_NR, folio);
>   		break;
> +	case RMAP_LEVEL_PUD:
> +		/*
> +		 * Assume that we are creating * a single "entire" mapping of the
> +		 * folio.

Misplaced " *", can likely be fixed up when applying.

Apart from that LGTM

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


