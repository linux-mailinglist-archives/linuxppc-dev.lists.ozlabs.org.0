Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB8C88E44B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 14:57:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MwaGEXxH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rg6y7jWV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4SsX2kHKz3vgM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 00:57:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MwaGEXxH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rg6y7jWV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4Srm5qXcz3vbV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 00:56:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711547797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wwFOu67rAm/jgeVVs/VXwT1nwHyOmGUKbXFLwpopGYg=;
	b=MwaGEXxHl6gKs6OCt9bbnGbQCxFk/VSsAZw1UbEK5gwjTABNmbEH/rih9CLJZTdB80lX0d
	yUVgbyTBei7ihESAWcWPPSam5ebjN24iTYG/XD6+cdteD2I8Vq2o+SxM03NKh4b5v0NpG6
	L6agR5BKxHe4sNAXFrBsyDVz9K2jitA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711547798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wwFOu67rAm/jgeVVs/VXwT1nwHyOmGUKbXFLwpopGYg=;
	b=Rg6y7jWVvKWdrWKliM6sxF2+iGNh8aG8we9ScbisSEw34uTr9zR6ygH3ZbDILX58XtKpit
	xwI03cVHiMTVnXzsGaIJF+VAvAY9sDzHEzUMMhcHRhtFaNcqNq20bdLkcukEA7K1U+bmfw
	sJdrjXV3EGNfsTw9W9HaFWbAbBF00Sc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-OZbhsvZWO1qZ6cVCPWsshw-1; Wed, 27 Mar 2024 09:56:34 -0400
X-MC-Unique: OZbhsvZWO1qZ6cVCPWsshw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-41485831b2dso28046545e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 06:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711547793; x=1712152593;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwFOu67rAm/jgeVVs/VXwT1nwHyOmGUKbXFLwpopGYg=;
        b=AQAqji0+4XgaeynwBOF0VXVKJBEBtipbWnAvSwwR6SffRzQLQ06VdVlwuBdvG9jmob
         N49u7XVyPwDMnlrabOPl9kCRQ+KL6q/KDWqrI302UllZhe//38U3/5HL5MvpQS+0E4xL
         f9BqScEgFqr+kuwxF3V1BipyhWfKNtNM9r3Tyk4TxYO/J+2AXK2uuDEJYiNoMYwT2Cff
         aV4spAVKfoFsjxMyuNgDGHdhlt3qyJx5Ps/1ZPeZgJQ3KM/nZKv7SuCLvkRujfP+ZZPu
         XYpXQzWgiIk9/qeavxI0Tx3/hN8D8K7rebVp6D+QI04DgqRivNfvGRxih1XWWCr5G14X
         0TiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd0MIsg5j5dYTcdxORklYr5YwGqwaKdeLqXW+37fFkK6E9+GpeScoSAWD0bQS2ThuScHF5Aqc/Lf3ePSmfCfsMpJLlTH1KWEs3Ngn3JQ==
X-Gm-Message-State: AOJu0YzmyD99z4XZv+KBAk+Tvu2TcDhN7iW4tn87RADcfNDfvNF/G8hj
	/i1uENFmFEvFgDAixtfCD+BsSlFMHWjqojvaV9C2g5opgPMZlCYXljSM4z5zAsPXmaiiImgQWt0
	EMVJp0aZl+WT2+ZcfCAm689926itH3W3wa8X6k9f0OcWde1GzCV55PJacndFJrgc=
X-Received: by 2002:a05:600c:a08:b0:414:392:38d2 with SMTP id z8-20020a05600c0a0800b00414039238d2mr74562wmp.24.1711547793062;
        Wed, 27 Mar 2024 06:56:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExpTOhHThCpVA+4b+ZiNKOUdia4Bzq6YqF2zp26xsxLD8eZI4hj+mGwvlthboaboFnQKnRxA==
X-Received: by 2002:a05:600c:a08:b0:414:392:38d2 with SMTP id z8-20020a05600c0a0800b00414039238d2mr74531wmp.24.1711547792613;
        Wed, 27 Mar 2024 06:56:32 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:8a00:362b:7e34:a3bc:9ddf? (p200300cbc7088a00362b7e34a3bc9ddf.dip0.t-ipconnect.de. [2003:cb:c708:8a00:362b:7e34:a3bc:9ddf])
        by smtp.gmail.com with ESMTPSA id k33-20020a05600c1ca100b0041409cabb39sm2218013wms.18.2024.03.27.06.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 06:56:32 -0700 (PDT)
Message-ID: <7631ff56-fa16-4b2b-87b2-1e93691bd110@redhat.com>
Date: Wed, 27 Mar 2024 14:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] mm/gup: consistently name GUP-fast functions
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20240327130538.680256-1-david@redhat.com>
 <20240327130538.680256-2-david@redhat.com>
 <20240327135256.GG946323@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240327135256.GG946323@nvidia.com>
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
Cc: linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27.03.24 14:52, Jason Gunthorpe wrote:
> On Wed, Mar 27, 2024 at 02:05:36PM +0100, David Hildenbrand wrote:
>> Let's consistently call the "fast-only" part of GUP "GUP-fast" and rename
>> all relevant internal functions to start with "gup_fast", to make it
>> clearer that this is not ordinary GUP. The current mixture of
>> "lockless", "gup" and "gup_fast" is confusing.
>>
>> Further, avoid the term "huge" when talking about a "leaf" -- for
>> example, we nowadays check pmd_leaf() because pmd_huge() is gone. For the
>> "hugepd"/"hugepte" stuff, it's part of the name ("is_hugepd"), so that
>> says.
>>
>> What remains is the "external" interface:
>> * get_user_pages_fast_only()
>> * get_user_pages_fast()
>> * pin_user_pages_fast()
>>
>> And the "internal" interface that handles GUP-fast + fallback:
>> * internal_get_user_pages_fast()
> 
> This would like a better name too. How about gup_fast_fallback() ?

Yes, I was not able to come up with something I liked. But I do like
your proposal, so I'll do that!

[...]

> 
> I think it is a great idea, it always takes a moment to figure out if
> a function is part of the fast callchain or not..
> 
> (even better would be to shift the fast stuff into its own file, but I
> expect that is too much)

Yes, one step at a time :)

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks Jason!

-- 
Cheers,

David / dhildenb

