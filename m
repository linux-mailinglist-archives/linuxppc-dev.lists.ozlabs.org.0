Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C75FB8B5215
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 09:18:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=McW12+Ia;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e4n8I8RN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSZSB3QCxz3cTx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 17:18:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=McW12+Ia;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e4n8I8RN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSZRP6YH1z3cGY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 17:17:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714375068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8R0bYgvdXHGuOgg8Irxp1p7AoaJXBAfKNxLRI9tEUYM=;
	b=McW12+IaZYIpZv2ggda0IWosxvIuzh80LPmM/JiMGzexhyMDh40fyvM7PFwh8k07QbgqaP
	TVgQY7Arof9h54z6KnqOQyEhpcyajilRCiZArNjFL10qDSICheK8B+hCjSW5C6lX5cyiDQ
	Fm0NCAsKVgRGGjXZjuNEYMwcwTVS9u4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714375069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8R0bYgvdXHGuOgg8Irxp1p7AoaJXBAfKNxLRI9tEUYM=;
	b=e4n8I8RNkxP4YN5SQaSQAol0RNTpp8AKpqF7vLP6kdaEom43EpqwJUJnu/CtBANBKVcmp2
	En5hu5lJfc+iISZcGQGG0+CZMWIcL3CONdL8HAAhBNH/O9u8/ThOi5K6o4Q30Xv911P3rj
	u8SKpYArozXzEmfX2sqLTeo5ijqJ6Ds=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-9urHzh_kPMK2rMK7QNJmtg-1; Mon, 29 Apr 2024 03:17:47 -0400
X-MC-Unique: 9urHzh_kPMK2rMK7QNJmtg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4169d69ce6bso17942965e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 00:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714375066; x=1714979866;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8R0bYgvdXHGuOgg8Irxp1p7AoaJXBAfKNxLRI9tEUYM=;
        b=Tu3WCPn/h4KhuU++mn2CuVAcS11rOIIBsvFDn0zHqxqP7m4/SXaY8dmpSVxGuyUmfj
         Ul4blueGfjq/K475d+tPcp71DG24HUy15giapq/RX4wb7SSFIFWXRld3CbARq3M7Rxqj
         ncxhVnWj8Htz5GOIsWvIS1kWUA76WQ92yaqXmmoHWhmKp3dd/irZKWv+bxJEms0TiOuZ
         mEGpxfyg+qB/ATw/G0fmGDSSUfDvLc+d2guEsasv4kU1Bes3mJoh+pj8J06z1pLwqIKV
         48iUA6/dqhckUalkW8c+zQAjh1EvbTTjeSTPMjhjy011Tuueof8WQsT3z10si04EO4Cb
         OVRw==
X-Forwarded-Encrypted: i=1; AJvYcCUlHjc9SUCR06aIZuA+8rQ90RDbESc0S+yUaN1N3aOGynM/Ui9+RGitjNmTwGuRx8+ujBxAWbG2COfoA0MeoFcHW1/fyjKHgcgXrxEpmA==
X-Gm-Message-State: AOJu0YyGKBvf3bC09Itbg3uLoqS1Bi8xV8TjEmWKSx0lntdBUDBNMtXI
	d3pdoLWCou4xhsvMNV8QdrSbiSgTY37GyzFB/2WOv4B2L4PLn0GFvINqMnZeBrDBcQiroYQqAHa
	Bn4MbqtTCcE1sTrZZfToOXD1q9pnshJEfp/VLYWOl9LxImFlEJYuXtp4BuxKnRoM=
X-Received: by 2002:a05:600c:4e0c:b0:41b:a8e8:3ff6 with SMTP id b12-20020a05600c4e0c00b0041ba8e83ff6mr5832798wmq.11.1714375066102;
        Mon, 29 Apr 2024 00:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnSE2Sb8WwFtIiVRSMOLJxWMw1XCLDHHU16hLTfBU2gmhApAvB6d6mnHHq5nBCkt5asCzqIg==
X-Received: by 2002:a05:600c:4e0c:b0:41b:a8e8:3ff6 with SMTP id b12-20020a05600c4e0c00b0041ba8e83ff6mr5832774wmq.11.1714375065651;
        Mon, 29 Apr 2024 00:17:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f26:e700:f1c5:285b:72a5:d8c8? (p200300d82f26e700f1c5285b72a5d8c8.dip0.t-ipconnect.de. [2003:d8:2f26:e700:f1c5:285b:72a5:d8c8])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b00418a6d62ad0sm44285199wmq.34.2024.04.29.00.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 00:17:45 -0700 (PDT)
Message-ID: <19c5b260-fddf-478e-abc5-1c645957b562@redhat.com>
Date: Mon, 29 Apr 2024 09:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/gup: Fix hugepd handling in hugetlb rework
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20240428190151.201002-1-peterx@redhat.com>
 <20240428190151.201002-2-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240428190151.201002-2-peterx@redhat.com>
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, John Hubbard <jhubbard@nvidia.com>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28.04.24 21:01, Peter Xu wrote:
> Commit a12083d721d7 added hugepd handling for gup-slow, reusing gup-fast
> functions.  follow_hugepd() correctly took the vma pointer in, however
> didn't pass it over into the lower functions, which was overlooked.
> 
> The issue is gup_fast_hugepte() uses the vma pointer to make the correct
> decision on whether an unshare is needed for a FOLL_PIN|FOLL_LONGTERM.  Now
> without vma ponter it will constantly return "true" (needs an unshare) for
> a page cache, even though in the SHARED case it will be wrong to unshare.
> 
> The other problem is, even if an unshare is needed, it now returns 0 rather
> than -EMLINK, which will not trigger a follow up FAULT_FLAG_UNSHARE fault.
> That will need to be fixed too when the unshare is wanted.
> 
> gup_longterm test didn't expose this issue in the past because it didn't
> yet test R/O unshare in this case, another separate patch will enable that
> in future tests.
> 
> Fix it by passing vma correctly to the bottom, rename gup_fast_hugepte()
> back to gup_hugepte() as it is shared between the fast/slow paths, and also
> allow -EMLINK to be returned properly by gup_hugepte() even though gup-fast
> will take it the same as zero.
> 
> Reported-by: David Hildenbrand <david@redhat.com>
> Fixes: a12083d721d7 ("mm/gup: handle hugepd for follow_page()")
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---

LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

