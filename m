Return-Path: <linuxppc-dev+bounces-1566-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D61998464A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 14:58:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCg096hGMz2yDH;
	Tue, 24 Sep 2024 22:58:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727182713;
	cv=none; b=SMvFKZsW5XoevscPZng9GMKYiyUxjAIcR9Nwq0W1MJ+xEYZ5wJxC5sKkYghCff6w3ZTWibyeXRLZdYAZToBf/AJt/z3z6O+yVR/FRDyfIS0K2JU1+N25hQjnEMHWalCpStXN3iiR7HoS19MQxYZToXiHGeOzbjID/4GGTD91luoEeyREvVzJnXmb6MCyhKzO/BDZgZWOG/++IA6OguyC/QdBi9bpjgJFx+mBWyjlTE0ragKuM0J/yKz0kMw4eHSmbJ4qX/nWrzhFTocqcNFiS+2U/3QOnysGPW0YM6RNksmM1KzrNgsUTO52NZnTirievdfIjNfQ1muuH5TiKzzkFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727182713; c=relaxed/relaxed;
	bh=xC9UCBhzwUAOQFao/KUDqH/apeuIr1frJEI+ucMu8PU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1/AihSDlkRtBTVShscdHWBlqRUF/K8b1Q4N2SP6HcRBvhFXrCenBiHYl6kr+GFe41tg/CFa0E7RjO2cc2yEXKw4sqxaEnZzsWyA9pEQnrRlMMSp3IC1KtBMqX7EG4SehrXgNOkutS4V3tO76m2bi1Ity9HzFnSBdBEuHQYZYJU9P5h9g1NnKx9KIis1zct5FvvoWJeT6rwtzaEyz9LN23LgDgfIEchWTqgOLfz+B1x8HSuFzeRttmdtfEG1OObF7ETdMlL15vHscON1gZJpRtBFndoVsL+oTqP92iZugoRNFOL02aTvEIpwmmUU/0I9/VsqdX/ka132bdaq1NlhQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A2+pyMWp; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TwIPPq0X; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A2+pyMWp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TwIPPq0X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCg091hCGz2y8d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 22:58:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727182707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xC9UCBhzwUAOQFao/KUDqH/apeuIr1frJEI+ucMu8PU=;
	b=A2+pyMWp53rwRrHaUXcDuRhhEwA0RW0RZu3SFQ+VJ1fIngHNZeNW0R8CTbt3EtAkPNP2BX
	ilQrwQpoMRZPfEgTpgOucV+f/Pjvf12hWQPZNfFXZJVcitfw2f188u52kXds+4QwEgWfw2
	Awy4LunyxfLIRetVoc8XqIodKRP66ms=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727182708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xC9UCBhzwUAOQFao/KUDqH/apeuIr1frJEI+ucMu8PU=;
	b=TwIPPq0XwFb9A3DbR+1K41G7vUadHyUJNfOPK4wGvS0jKp8eKRW+7q3q1SS5WJBv2pLkXl
	E97pdVxFosrGHMz2FdaLUMheLz9PCfAPyqS3hqxqSl/bh9PMINwUiylV49/6rdrKBLzwum
	+k+Sp2bp0kGM1gLZKP1ciMIcyirzQZE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-o8qCNgX-N4S71AuCx3Z0xw-1; Tue, 24 Sep 2024 08:58:26 -0400
X-MC-Unique: o8qCNgX-N4S71AuCx3Z0xw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42caca7215dso36790685e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 05:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727182705; x=1727787505;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xC9UCBhzwUAOQFao/KUDqH/apeuIr1frJEI+ucMu8PU=;
        b=h/e3nQCJyY1Ksw0QTZIetTq1P+/nZJcMFaQUQzZIujNmv+U/tw94Tnsx2lFcggna2d
         d27rnRjgl4U3vcqf5cbZteMIQo3qfW7pUsCW5AAgaWY3o6+Ii830i9OAe3j3zdzZ3BA6
         5HEmUkBI6IBp8RRtCRMfx9IMMYIaM8VUtYDIiMcppebQWRGcgqDju9Kj+s6avwICQHpC
         01ebyA2riuADmjFB/dkt+8I4EiPtI6QO/F2U3NmOA/gtPII14JGfUDj+eOfCySdJVjco
         q3dAn7xqWTWyUNNGFGiAfYXSfG0ENnszdHS/TAKElk4mGy4k5vcdoUsF5AM7laWY1W4G
         C3hg==
X-Forwarded-Encrypted: i=1; AJvYcCUfOxwJQNpuIvIRLwg0jlIUwua3m7Qb33JmS7H8cRZdnhkOe+Mkl3sK8p3KZ9HCDyxb+S7943Cn6Hicq2M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyuJxmH9JObkp70CwIYYMMVJTtYu1TDMXU6/W5HHDmhQDTuatFP
	Ivfq6S0R1tl7Uvw4OV3H18GdG4LSrJCRVVNh00PAgSJpZpIc7VnGC2gEHw7pD+M/2YBcOKy8AAA
	i31vxoyyQNNbo6cEhy2/AJfF1hnfKfFvsoaWN4LZS0imerQcXssZE+k8Vk6nWk8s=
X-Received: by 2002:a05:600c:4f55:b0:426:593c:9361 with SMTP id 5b1f17b1804b1-42e7c193efbmr109030375e9.26.1727182704965;
        Tue, 24 Sep 2024 05:58:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI4EF96B1PEOenADb7Illije/hnjtwV8J24MIjfh4CgMke7FEiL5+zsiMwccSuAGfVWsgegw==
X-Received: by 2002:a05:600c:4f55:b0:426:593c:9361 with SMTP id 5b1f17b1804b1-42e7c193efbmr109030165e9.26.1727182704575;
        Tue, 24 Sep 2024 05:58:24 -0700 (PDT)
Received: from [10.202.151.204] (nat-pool-brq-u.redhat.com. [213.175.37.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754a6f82sm158012075e9.37.2024.09.24.05.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 05:58:24 -0700 (PDT)
Message-ID: <4f9dffe7-a652-4476-ae18-15997085e5b4@redhat.com>
Date: Tue, 24 Sep 2024 14:58:23 +0200
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
Subject: Re: [PATCH v4 01/13] mm: pgtable: introduce
 pte_offset_map_{ro|rw}_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>, hughd@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1727148662.git.zhengqi.arch@bytedance.com>
 <1a4fea06f8cada72553a8d8992a92e9c09f2c9d4.1727148662.git.zhengqi.arch@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1a4fea06f8cada72553a8d8992a92e9c09f2c9d4.1727148662.git.zhengqi.arch@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.09.24 08:09, Qi Zheng wrote:
> Currently, the usage of pte_offset_map_nolock() can be divided into the
> following two cases:
> 
> 1) After acquiring PTL, only read-only operations are performed on the PTE
>     page. In this case, the RCU lock in pte_offset_map_nolock() will ensure
>     that the PTE page will not be freed, and there is no need to worry
>     about whether the pmd entry is modified.
> 
> 2) After acquiring PTL, the pte or pmd entries may be modified. At this
>     time, we need to ensure that the pmd entry has not been modified
>     concurrently.
> 
> To more clearing distinguish between these two cases, this commit
> introduces two new helper functions to replace pte_offset_map_nolock().
> For 1), just rename it to pte_offset_map_ro_nolock(). For 2), in addition
> to changing the name to pte_offset_map_rw_nolock(), it also outputs the
> pmdval when successful. It is applicable for may-write cases where any
> modification operations to the page table may happen after the
> corresponding spinlock is held afterwards. But the users should make sure
> the page table is stable like checking pte_same() or checking pmd_same()
> by using the output pmdval before performing the write operations.
> 
> Note: "RO" / "RW" expresses the intended semantics, not that the *kmap*
> will be read-only/read-write protected.
> 
> Subsequent commits will convert pte_offset_map_nolock() into the above
> two functions one by one, and finally completely delete it.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


