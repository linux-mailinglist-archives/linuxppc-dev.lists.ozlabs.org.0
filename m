Return-Path: <linuxppc-dev+bounces-6615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD3A4BA19
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 09:58:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5t5K6kdwz2ynR;
	Mon,  3 Mar 2025 19:58:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740992309;
	cv=none; b=QfWxN8Mp67bbWNKJqvk/KHh4h2sfHbw584p7+rgOH/XjpEx2ryCnr99s3tMAyr3gdZ105XZyWB40h/1TG9wxqqrBvRJv4VrT2JkuSz02pdiGp4JE9E1gHtb/TbGFF5MF7XgyMySIVsiADgGb0M5H8O2mA0VdsbV+cKc4Bi0MTEv27uUtZVin+jHOTTqk4hm2gRItGSRQCHSy5PyPEoqWCPN1GEoPjI/sh6vWHGBSMh9YBH67F+hyml3pM4qmP6dvSKMEKd0WbbVLt10ysQkaHFmjLktMl1MBEs6KWOyGZ5oCqvSft/wu5xXDTm6wh94TiqNMLYGuyshwO1VzSVyNxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740992309; c=relaxed/relaxed;
	bh=yhKA0PWZzkHsCkSvRw6WIRSjH0fQoXRBt2BANeFnGaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgJvQdcMboAA2ux4igUIGW9UtNtt8yaz6N7QETm6l1CpHGLDDY7myGq+EMV3H0jgi0XaL3O9cWEMMsbBlJJ6o+K/CNUDn3ZvjzEy7UTj0dExHJEFSgpjUkQcM7894wi/49JP2NNaoRm2DIJmYMHToPM11uTgGllXu+eD+xkYOC24AZYYtZ+J+p09MZntg7Y0ySrMLjBgXBwHvDnadPo2zf+kRAAIC1Of3yXQZLgfS/ntZq28VT8+81h+Q1bySrPK36qyvvM3z3YeXfC7u2ZMbrQex7Xha58tka1kmhlkhL43D6oB35ujl5L8IkS5C2t5BJmb1JWL0CiHMAnFQCO7VA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FlLTRNph; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FlLTRNph; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FlLTRNph;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FlLTRNph;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5t5J5368z2yQl
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 19:58:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740992301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yhKA0PWZzkHsCkSvRw6WIRSjH0fQoXRBt2BANeFnGaI=;
	b=FlLTRNphcbOuuY9Lk+b+bJ3bQi0912o4Xn3MpyCyRB2nHnJSy8lH/5o+MnVUXN4l8gEXN8
	zG+HB87chsKAO4Rzy2BRyu//4Fo1oEVSfXmopwGYxnmWSUYpafB8U9Th3dlj1BgpcjgGED
	Dt8lli1sskf9ONOHdFPu/eu+JD0DBu8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740992301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yhKA0PWZzkHsCkSvRw6WIRSjH0fQoXRBt2BANeFnGaI=;
	b=FlLTRNphcbOuuY9Lk+b+bJ3bQi0912o4Xn3MpyCyRB2nHnJSy8lH/5o+MnVUXN4l8gEXN8
	zG+HB87chsKAO4Rzy2BRyu//4Fo1oEVSfXmopwGYxnmWSUYpafB8U9Th3dlj1BgpcjgGED
	Dt8lli1sskf9ONOHdFPu/eu+JD0DBu8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-XN4cY2LcNqyAsd-Jg8LTOA-1; Mon, 03 Mar 2025 03:58:19 -0500
X-MC-Unique: XN4cY2LcNqyAsd-Jg8LTOA-1
X-Mimecast-MFC-AGG-ID: XN4cY2LcNqyAsd-Jg8LTOA_1740992299
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3910876fce0so600187f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Mar 2025 00:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740992299; x=1741597099;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yhKA0PWZzkHsCkSvRw6WIRSjH0fQoXRBt2BANeFnGaI=;
        b=iLeoRg2gvDuiJASpFPP7XB6P5AKZRrKmVbSEfVvTuueM1GWPCOId6MmRWc+TEnf/GY
         lrm4IpfKQDGyVbg2Oo24DIRONZqsmskJiZhzeA+5Nxf8XAzRvvCCNcZbSwgbzXuRkWuz
         3MjkKf51bk9b0asT+vi+Mlx8PxaR5QrR6qiScy59PNasXf6LzdlApipLreb01MpbAi+u
         vDmeRr551of9gEN7rB5WfFg8omEKLlAz6VIQzkIYvGWOIriQZzE/8ZFYgx7ih4HjKzGj
         kbIbECGrqPCVR5IKpVeGQWi2GKjLhKG2yHrSzH9w2l0hsKdUDRrtoXXy6bStU3MNp+eM
         Eftg==
X-Forwarded-Encrypted: i=1; AJvYcCW33xbaZeqYFYEV4V8BBLkj0O9nGJXYjnDcPTVuEx0cNZl8KRIM2SIiUHhGsvuGcCgXH1Fd0uXtS33EBwU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw3gzR7c4ZTLLPqV9UBme4MyM+/1DnuYua4/8gQyDRgeP90juuY
	lt+secD3Za8SbQsWRgqxyIM5wxCdJhS79guJzs/w8Bj/b7ortm8Tcg7oY5NNcBy/ugOyHiymdXw
	Geki+5A0LKkDK9g17G0iprmFx+OLC+pZOMtRNzGay2Z10sVJWHWsRU6ENS13IUpc=
X-Gm-Gg: ASbGncvLGZOBz0QHMEcJKg9j/S1gOqtHh4TSrt3U//GWhsYexNiIIc5aow35fjJ0j7n
	VN5u2Yj/QyW3EcVw/oP3IZpgf33QUZBpy8PUaU1X4G9BwJTSA32ds7A+txKBY9hvhCNAjR0j0ad
	sC7ooarlkHuypuPmvVeAoPpUpUVzstKHVNg/4bYxhnO9TTCymxcgjDnihjbK2CEH6BL4pMtB/vt
	U+XOb7teiOgKCxHeGub5ACVAWiuo/esEz1rRrcQLIJxWD2Wl+s69aUM4crsHf5HIDon893yLCZV
	j++vfecz0PW4+pqw2l9TVRL0/4Wx3w/v7mh9Pevsau+z2zyjsP+C1+WEgg+/imbWJa9R7oYF4KE
	m+zXRXaxfvkl3c7NBOCbBbP9oKZAqH4wRSfSVuvNxX7k=
X-Received: by 2002:a5d:59ae:0:b0:391:10f9:f3a1 with SMTP id ffacd0b85a97d-39110f9f4ffmr1082147f8f.35.1740992298655;
        Mon, 03 Mar 2025 00:58:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrOB8TUQnl8FpqKRAFyy2zHk+Etq0hy84HKx7V6iLK+hyXpCu8bZkk/epZdl6ibKYIEl0N0g==
X-Received: by 2002:a5d:59ae:0:b0:391:10f9:f3a1 with SMTP id ffacd0b85a97d-39110f9f4ffmr1082091f8f.35.1740992298255;
        Mon, 03 Mar 2025 00:58:18 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:9600:af27:4326:a216:2bfb? (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de. [2003:cb:c734:9600:af27:4326:a216:2bfb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485e61csm13948947f8f.98.2025.03.03.00.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:58:17 -0800 (PST)
Message-ID: <964e8991-44c0-4ff7-91cc-033ed7c09835@redhat.com>
Date: Mon, 3 Mar 2025 09:58:15 +0100
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
Subject: Re: [PATCH v9 19/20] fs/dax: Properly refcount fs dax pages
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
References: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
 <c7d886ad7468a20452ef6e0ddab6cfe220874e7c.1740713401.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <c7d886ad7468a20452ef6e0ddab6cfe220874e7c.1740713401.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J3_Z6j8Xft2KvtsOZv4aPqPyBgqhBgvhtEPizPS-g9E_1740992299
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


> -static inline unsigned long dax_folio_share_put(struct folio *folio)
> +static inline unsigned long dax_folio_put(struct folio *folio)
>   {
> -	return --folio->page.share;
> +	unsigned long ref;
> +	int order, i;
> +
> +	if (!dax_folio_is_shared(folio))
> +		ref = 0;
> +	else
> +		ref = --folio->share;
> +

It would still be good to learn how this non-atomic update here is safe 
(@Dan?), but that's independent of this series.

Staring at it, I would have thought we have to us an atomic_t here.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


