Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B454B84FFD6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 23:25:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SIGVLNWK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SIGVLNWK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWpLy4dydz3vwV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 09:24:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SIGVLNWK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SIGVLNWK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWp9d3Z0dz3dK1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 09:16:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707517010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dflloNC7LaAlJ2atdSFROMmPzF6iFHVdcqRgzt5YjTk=;
	b=SIGVLNWKXvlI+tXQoqIMNEowdvX5WAsukOOMyfdwXpPzrj3qNUqtb91F3Z23h3A6aYvlM2
	Flp3CxSXN/6+Po6L+exNweOQDohklXcoiDx124MP/cmIc5wj7WKaqA6xTWf2p296Q9qNOp
	SxrA1oq0QYOEtXsC1O8LnjCc9FhFkm0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707517010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dflloNC7LaAlJ2atdSFROMmPzF6iFHVdcqRgzt5YjTk=;
	b=SIGVLNWKXvlI+tXQoqIMNEowdvX5WAsukOOMyfdwXpPzrj3qNUqtb91F3Z23h3A6aYvlM2
	Flp3CxSXN/6+Po6L+exNweOQDohklXcoiDx124MP/cmIc5wj7WKaqA6xTWf2p296Q9qNOp
	SxrA1oq0QYOEtXsC1O8LnjCc9FhFkm0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-FCLaaQLxO4umEJit134Abg-1; Fri, 09 Feb 2024 17:16:48 -0500
X-MC-Unique: FCLaaQLxO4umEJit134Abg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-33b0c264adbso666065f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 14:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707517007; x=1708121807;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dflloNC7LaAlJ2atdSFROMmPzF6iFHVdcqRgzt5YjTk=;
        b=LiL16BcMSj11LiskVWPcdfoH1StxenBTR1JNK+XJr7YVk2YqSOz8osaZK8vkpCS3F9
         gojJtcYuzLbK0zZMsGarkJk50Lp8IdkGw64s+Pzec9ToqPFtqRw4Oit6JG9p55h3vbe+
         NCEgPNejLBHBP/msMF5AFCR0eP6O3VFWOTvyyfslXaXnJ9e1x6NYapqMMGlaWCUi7JWv
         VfH1mtIcaqC80tX1piKmsuBPVkCJEGWhKrsCSklRZEISddvxVWJScMXgjztRVJKF7VS/
         WIqZqR6K0qUf2BXfU49OWYRPYb1rnwAp5CJQL7+tcWKaQffl1CD4e+C3em0MHBaU/LSk
         Wbjw==
X-Forwarded-Encrypted: i=1; AJvYcCXNqHubZP+pqCnzZS2BB5nTbylr0d78znaMuadaJCU2Pc1ODl7HR393OimMjdnokB2Z8WyMb3xcjz6fvZhCiE3Y4XPxPUWwYePVwQ+skg==
X-Gm-Message-State: AOJu0YwJecNDN2M6lhQwsP/eB4Ren+EfXJTdoJYAX5PmmNOmCAMyf+mW
	hoz/w+bMTJc0taxKEAvvpJbbw1qzpI/35xZA/XB5V6k32X2GHXbfhnswq/d6l7WfGUKcAj8fNVP
	jwUxE9xy12C0YzgG6RE9Qp7lBH7zyophvZJHmqIue5xTR66S+QQJmE99IagLLHMU=
X-Received: by 2002:a5d:5f56:0:b0:33b:3d7b:9df5 with SMTP id cm22-20020a5d5f56000000b0033b3d7b9df5mr301388wrb.3.1707517007581;
        Fri, 09 Feb 2024 14:16:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRraT+iqLCq+q+SFxi+pdwsHtFzhjNgLOYIJx29W2GMY7wrOLtNR7Da1ALVYwUglJgM07o2w==
X-Received: by 2002:a5d:5f56:0:b0:33b:3d7b:9df5 with SMTP id cm22-20020a5d5f56000000b0033b3d7b9df5mr301362wrb.3.1707517007207;
        Fri, 09 Feb 2024 14:16:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtL7oNODxcHq+w10fGEtfBuwnhqS4NoQPo0xzUYUoLqTZ7DiSAYQAjnVTAiD2uYJeiW8Wp3CKVbOe7eal/If1UxAu/7ihgfg/oCqUU2FwIEryU1IXNGRxDYlgcmqdhn5CiMEh+l+PO6mDSxkZ8bN2QZwfRT40uGeraENi/Vjx3hSBJyR/bT6GllMBFOVvqsQ/G37un/U+/yUBTlhyTxKeLupmxdu9zsAeM52OmbXkHsTyomZ6G73qIBreN4KkVKhYQQE0emHO2Q0yh4s7FHl/x13Gknjbc1GxqrQERRs4d11SbCNftnUrLcF1loZW/blGOMiv23DQMSGeUymejUW+Mj3ntUE55urQqJAG4wtsXmaVi9Q1delgcbLX/ZcjgB4Cn7AtebU3vg45Buey37VQBBAlvfB2xtQedIWxPiNDNuPL5gcCYMeIwd5x2HGGVtj7xWvgra4dUB4kE4cIphLo64tXNMvFujlp4ykAT1jIgbRgeWP4kkIEnxhTww3CoW3iqVox3hJMO4cnVHj5SCeC0LEaBF1kzQKMd5XVTTW37M30DWDABxo2ye2qU3cKK6c4GZgmDQjJ7OL1423x4QLqxxJbAhcqsLc662Y7yrf+JwxWydc2FE8j4paPo9LqLEgvqKK94MtJXm6jhLBMPO/agkZsyr5ONZloeMavXg6FH4AyxILtyWcGpfp8kKkam0ThEDuL9+g0Uvh91wnlJg+ceGbSiXgJN/o3lCDoufX47fjAT7i0uW1hKnHOPjQ8HbLtAlAFlDB9tKsK12TmJpacefEHUtNPTSSjTh3IxE6bl8bmFoB4Y8k0SUMsshNzmuXWFjgSt6kxxBukMZb4NmZObWiBmxrPHFRd6j3370akMOPtlWAlc6VoV32J/kQ==
Received: from ?IPV6:2003:cb:c718:6800:9d15:2b60:4f57:7998? (p200300cbc71868009d152b604f577998.dip0.t-ipconnect.de. [2003:cb:c718:6800:9d15:2b60:4f57:7998])
        by smtp.gmail.com with ESMTPSA id y12-20020a056000108c00b0033b40a3f92asm285796wrw.25.2024.02.09.14.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 14:16:46 -0800 (PST)
Message-ID: <216aa113-dc3f-45d4-964f-98f80969a927@redhat.com>
Date: Fri, 9 Feb 2024 23:16:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/25] Transparent Contiguous PTEs for User Mappings
To: Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <ZcUQqfg39zCS2BAv@FVFF77S0Q05N.cambridge.arm.com>
 <3ba54c94-8e44-4dd6-9a25-2cf81b07336f@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <3ba54c94-8e44-4dd6-9a25-2cf81b07336f@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> 1) Convert READ_ONCE() -> ptep_get()
>> 2) Convert set_pte_at() -> set_ptes()
>> 3) All the "New layer" renames and addition of the trivial wrappers
> 
> Yep that makes sense. I'll start prepping that today. I'll hold off reposting
> until I have your comments on 19-25. I'm also hoping that David will repost the
> zap series today so that it can get into mm-unstable by mid-next week. Then I'll
> repost on top of that, hopefully by end of next week, folding in all your
> comments. This should give planty of time to soak in linux-next.

Just sent out v2. Will review this series (early) next week.

Have a great weekend!

-- 
Cheers,

David / dhildenb

