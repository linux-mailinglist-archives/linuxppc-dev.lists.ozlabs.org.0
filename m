Return-Path: <linuxppc-dev+bounces-1567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9EE984652
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 15:02:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCg4f1RxZz2y8d;
	Tue, 24 Sep 2024 23:02:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727182946;
	cv=none; b=PcqLVz97GQmYKPzxWpCaBktBwy2qBf4tTrsqGd/xsaG6tFhuWvhpoAdcvOti77itaSoU7LMR60LKM/hKRuZpHS/E6Gx7y0l67P9VM/hjBckrdwTYpge8lBl9/xDzuaOYPf+5JgqBAAiMdMkHPkdYJHf48gQ40w5eDkH3JQ9nHHBEz11x5BtzPsO/J1qpFKLeS4iLHWbPF2bSXKMWqmcJvPqJVrczIUP9cRG5CCui2CadrUbLQrKH1UnQrnLsZfRsI+LvRfhslO+TbMDwzMQZrrEi7M/iSWcMkzHa3JEU94zVWXJFp0G2CfEq6UQhsjBM481CEly3ZOimfRb44wM0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727182946; c=relaxed/relaxed;
	bh=B8171xBnxXFgUA3dn4SJGjvuiXkwJh1OWHV6K1spTTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2YvMqasKNw+PWM78FtpYRPt61b4Kwu4ELX4a0FnTGO8xnEZ7OF2sBF3DA5H81TaU6zIeZsLHs99NFITiNJmN2i25IsR8ycn5YoRfWz1cc1wVQkDIC1cUGIN5kteoBBol2D0BFUSVH07CEpRUe4Qu5ghlLPoNmYca6Kh9q1BQFTluIWwT6tJ37JKABBsvAl2M/Ecv5rJ7q+Z5uRxiuYY1oS+zvqmMqQPOXWGXUVJ7Tnjzi/i61YznUzXLoz22b2ZNjJkIFpDrpMtIZ/Q2wMtpg2gliOU6lQLweu0aWGrzD4a5kI79TudgSYYmWLY+KRDFtM5D9MTsjUrpLoaLhbcHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HTFq2TY7; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HTFq2TY7; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HTFq2TY7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HTFq2TY7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCg4d50Ydz2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 23:02:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727182942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=B8171xBnxXFgUA3dn4SJGjvuiXkwJh1OWHV6K1spTTs=;
	b=HTFq2TY7R0CkfxcLCLmqh9djyXROjxUG06DhGd0MvJfdeNv4i7Ajev8DmaTCbXmZrrwN4W
	Y3pmU509qm7+tZQX9X4IzGT826w6hW4CM2tVrDyMBy2h4n7npj9N//7W3vpmN7up5n/eBc
	ZOt3d9TjRHLvlloT7yS/SGsl9xALoLM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727182942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=B8171xBnxXFgUA3dn4SJGjvuiXkwJh1OWHV6K1spTTs=;
	b=HTFq2TY7R0CkfxcLCLmqh9djyXROjxUG06DhGd0MvJfdeNv4i7Ajev8DmaTCbXmZrrwN4W
	Y3pmU509qm7+tZQX9X4IzGT826w6hW4CM2tVrDyMBy2h4n7npj9N//7W3vpmN7up5n/eBc
	ZOt3d9TjRHLvlloT7yS/SGsl9xALoLM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-O4Xqrsi_M7qZa66YtLKVYw-1; Tue, 24 Sep 2024 09:02:21 -0400
X-MC-Unique: O4Xqrsi_M7qZa66YtLKVYw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42cb9e14ab6so36338355e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 06:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727182940; x=1727787740;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8171xBnxXFgUA3dn4SJGjvuiXkwJh1OWHV6K1spTTs=;
        b=Yw6mlu4hehnvh2ktuDzj1GbiwIcU/mpr8m+ujKRFb8Anz7HPq/dcLcReN0SeeXq6/T
         YI2mJMp0M5BZXe5MUxSXjzBQjxgP8U5zm/XL/AmpNZK9cCf5m36cfyJMPHRByVkne7/q
         QIu0+NKGdaHAPOwSo6zjwwRCnLUjQRC19sXSpDlEKX/3x1qTYq4D9tRvW9N6QqAPAleo
         gunpwUtLX7e85FnG1V7uGFMxnbuDFi+Pd+Aj6BvzYKuiQ/fcQuR6kfL7Ex8LUSrk81hs
         +Av+E0K0kAyIRSBADpVVJQm1Q4bpQKka5ToGqze3rLFVXjIg+XJ0o7EXqibj3tdGKeB+
         QVfw==
X-Forwarded-Encrypted: i=1; AJvYcCWInTE5AKhMqzUpEtLf0UI58CYRlIYKHjuyoxgUPGLO5/Kcq58UHldTGGKZNGuTKoQRmzXIBvWpOK+3OwE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YybxBCcL72UE3CcoUjOC3er5dNlQiYF6YDhcJRRsKwk6RRtiSdv
	mHuoYGqFMMHg4uCEsTsxQf9BXmbKKE5nTjq7ZxVeYDJwCZ6i4OnMD37J7ZnxYwQyXMRtvYEJmNM
	zJlAer3wdaE/42v9kTLeaj5ZxCnkFxQiCQqwqjMUor15a1XCvTUxTYlEaw5J2WBE=
X-Received: by 2002:a05:600c:4695:b0:42c:ae30:fc4d with SMTP id 5b1f17b1804b1-42e7abe12b1mr124959545e9.7.1727182939986;
        Tue, 24 Sep 2024 06:02:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3CIa9EWtG/qdw/omrcXn3MG+Eg2+wuyw2pj/6X69axFAIYupjIGMR7g73XzhN58JyBieXkw==
X-Received: by 2002:a05:600c:4695:b0:42c:ae30:fc4d with SMTP id 5b1f17b1804b1-42e7abe12b1mr124959285e9.7.1727182939592;
        Tue, 24 Sep 2024 06:02:19 -0700 (PDT)
Received: from [10.202.151.204] (nat-pool-brq-u.redhat.com. [213.175.37.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2cec13sm1525835f8f.51.2024.09.24.06.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 06:02:16 -0700 (PDT)
Message-ID: <b2ba0bb1-20b0-4368-9585-38ad4764c634@redhat.com>
Date: Tue, 24 Sep 2024 15:02:13 +0200
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
Subject: Re: [PATCH v4 13/13] mm: pgtable: remove pte_offset_map_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>, hughd@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1727148662.git.zhengqi.arch@bytedance.com>
 <8eb7fcecf9ed8268980d0bd040c0a4f349cbca8f.1727148662.git.zhengqi.arch@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8eb7fcecf9ed8268980d0bd040c0a4f349cbca8f.1727148662.git.zhengqi.arch@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.09.24 08:10, Qi Zheng wrote:
> Now no users are using the pte_offset_map_nolock(), remove it.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


