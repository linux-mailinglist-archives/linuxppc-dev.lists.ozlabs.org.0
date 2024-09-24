Return-Path: <linuxppc-dev+bounces-1569-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CCA9847CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 16:39:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCjDb1qFgz2yDY;
	Wed, 25 Sep 2024 00:39:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727188767;
	cv=none; b=JktN8lZn/dR25C6sPIMxmOQNJGqVS3VlX6xRwzrQuponZiuDi+CTY92botzyEw2QOLrnNtxtYFmYdWppVspfpz8am4nMP72CsJIoCmUEFeMaU0ugPKz5n4amzmmHMXox64M1/AHOBBrjuGqYThd2UI40w70F7QqwNADFgSmPcNC12PxgfiP6oqaTvAqnxpV3DhtWZKaoiznqClC3jrIW8LEgFzTcvDDGVtkZP1kVVwNSouVJx1vfeGkabvnlHgHDKcpsOcF4PGHn1XxNGRwKnoh3Z1861dOkTvAoYrltqSy4FaKQk+3jvVUEVZdb5INaraYEY3OLgf98yhhT1rzkxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727188767; c=relaxed/relaxed;
	bh=PsmcvLVkjE6/ckGRL2QCn7BJoIjKbiBXB5thQo86V4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IiY4v17QgsnFdBgKH7kRDLlKG3CrPcX99hOikDGPoC0TCjuuSOvC0PRNUvXzRTDJHV1nhOOFW2XEVgF/UZkoUnPoLywy1nz9UJFPpt0cdQT7RqxFLfhSjVUIhnI+mhkb6XU5wk3XdN6bO7hvPaRI64gbD6VFXe37txIuHuMF88K4JSUEDgWMb28mKcRi6V3TssnqG7UE02e6Gzks/9f5sPkJDtFOuIitrmqKEkYsbymCiqUyMgzDn5E1/oov5pSWlfW6eWykU9+F2XNZFt+YWTcY+bf+auf25NJBMszPPypN1N1VKXSA9ggmEPRQ3dmWRKKzFG1X1LrCQoL7Qv2aJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W13/QTLe; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W13/QTLe; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W13/QTLe;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W13/QTLe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCjDZ5J3Bz2xxw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 00:39:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727188762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PsmcvLVkjE6/ckGRL2QCn7BJoIjKbiBXB5thQo86V4k=;
	b=W13/QTLef8OHw6ESsXlrpUuarOLk6XUteiS/U7aAgefbZu6lsPAWPoCDT0n0Y4jneRI2Cf
	Tf8I9JK0L5FZCnW8JBQLBTaeyGoY6xbACdKLn/q2jBH72ZHo0Esi5jJhLhk+Q1qhfExLNY
	SPTJ8BjaGHtskZIPCd66flEnerAg9aE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727188762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PsmcvLVkjE6/ckGRL2QCn7BJoIjKbiBXB5thQo86V4k=;
	b=W13/QTLef8OHw6ESsXlrpUuarOLk6XUteiS/U7aAgefbZu6lsPAWPoCDT0n0Y4jneRI2Cf
	Tf8I9JK0L5FZCnW8JBQLBTaeyGoY6xbACdKLn/q2jBH72ZHo0Esi5jJhLhk+Q1qhfExLNY
	SPTJ8BjaGHtskZIPCd66flEnerAg9aE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-8GzUCq99NnyqJ2lKDi5CrA-1; Tue, 24 Sep 2024 10:39:20 -0400
X-MC-Unique: 8GzUCq99NnyqJ2lKDi5CrA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7a9a653c6cdso1066761285a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 07:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727188760; x=1727793560;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PsmcvLVkjE6/ckGRL2QCn7BJoIjKbiBXB5thQo86V4k=;
        b=GtvqBgY4MzM5i/9NQ8gfZ2yfdq74BJ7VDJVKYIGyZkx8RVv2esQLV5b7FlpIj9Y04Z
         F36GTN+dgzGmTPZRn5U+ArmxZtNN5DbLfqGnL8H0pWeYRqxwi26bSYmlJw8erHXYkuOh
         80ntAromoEcPqquswbnf4y9JBMQoIuTlUqTOZNWW5MFz1q9xqthqgUXPBbALBXjAcFBV
         R7LJnjWWWE/IzPAoLJMplg5UbC4TfWPiORfv/q2hwjGFG88ypO21RBP8XC1vFOIjdPFo
         60fwiH79EfzM+kUc8Wsg8z7loM9mokRs9LRWD2KoKur7ER6YA6NQ9qIC0tyLaUpAPIMP
         CJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJcFv2IrBpashV7FFYueVf7V3kucBkAtV4Y8MfeFABuiGvDc7jMtYK6FonRQT8ouDCiYvMz5Thfv65t2M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YypSuIRLwXHfxkSc4tMxMuisktGTX/vJm6F48NWPnt8YoPipaDE
	/XizIsartZYc/Ph4e/xYQtN+fvwJIDJhfsqkLwmlZgfx+yq9ECuqHCk11BZrGGvsgVU3EXGXrDN
	iFHNMB41N8nkvK8crXxVFI1qqA82CVFlG2DcDIAfMvuSDJo+/mrZsJzAyWHSvHoY=
X-Received: by 2002:a05:620a:690d:b0:7a9:a356:a5dd with SMTP id af79cd13be357-7acdcd9f591mr604770485a.20.1727188760249;
        Tue, 24 Sep 2024 07:39:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaayEMlbll4GHZtNgISNw9URza1YiygQ6mUO1RvDz0LPs/VlktjcliZ89Xp/h+M2T3awsWcQ==
X-Received: by 2002:a05:620a:690d:b0:7a9:a356:a5dd with SMTP id af79cd13be357-7acdcd9f591mr604765785a.20.1727188759894;
        Tue, 24 Sep 2024 07:39:19 -0700 (PDT)
Received: from [10.202.151.204] (nat-pool-brq-u.redhat.com. [213.175.37.12])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acde6259e8sm73066485a.132.2024.09.24.07.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 07:39:19 -0700 (PDT)
Message-ID: <090c6ebc-c5cd-4d72-989d-40ee03ec1297@redhat.com>
Date: Tue, 24 Sep 2024 16:39:15 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] mm: multi-gen LRU: walk_pte_range() use
 pte_offset_map_rw_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>, hughd@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1727148662.git.zhengqi.arch@bytedance.com>
 <6efef5316d7468d13ed5f344452a0b872481972b.1727148662.git.zhengqi.arch@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6efef5316d7468d13ed5f344452a0b872481972b.1727148662.git.zhengqi.arch@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.09.24 08:10, Qi Zheng wrote:
> In walk_pte_range(), we may modify the pte entry after holding the ptl, so
> convert it to using pte_offset_map_rw_nolock(). At this time, the
> pte_same() check is not performed after the ptl held, so we should get
> pmdval and do pmd_same() check to ensure the stability of pmd entry.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> ---
>   mm/vmscan.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 749cdc110c745..bdca94e663bc5 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3375,8 +3375,10 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>   	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
>   	DEFINE_MAX_SEQ(walk->lruvec);
>   	int old_gen, new_gen = lru_gen_from_seq(max_seq);
> +	pmd_t pmdval;
>   
> -	pte = pte_offset_map_nolock(args->mm, pmd, start & PMD_MASK, &ptl);
> +	pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval,
> +				       &ptl);
>   	if (!pte)
>   		return false;
>   	if (!spin_trylock(ptl)) {
> @@ -3384,6 +3386,11 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>   		return false;
>   	}
>   
> +	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
> +		pte_unmap_unlock(pte, ptl);
> +		return false;
> +	}

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


